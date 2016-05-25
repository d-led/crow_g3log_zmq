#include <crow_all.h>

//based on original example_with_all.cpp

#include <sstream>
#include <atomic>
#include <chrono>
#include <thread>
#include <string>

#include <boost/filesystem.hpp>
#include <boost/algorithm/string/trim.hpp>

//g3log
#include <g3log/g3log.hpp>
#include <g3log/logworker.hpp>

//zeromq
#include <zmq.hpp>

struct config {
    bool logging = true;
    int port = 18080;
    int zeromq_log_port = 18090;
};

class DefaultLogger : public crow::ILogHandler {
    config& cfg;
public:

    DefaultLogger(config& c):cfg(c) {}

    void log(std::string message, crow::LogLevel level) override {
        if (cfg.logging)
            std::cout << "cg3lz " << message;
    }
};


class g3logLogger : public crow::ILogHandler {
   std::unique_ptr<g3::LogWorker> worker;

public:
    g3logLogger(std::string name, std::string path)
        : worker(g3::LogWorker::createLogWorker()) {
            boost::filesystem::path dir(path);
            boost::filesystem::create_directory(dir);
            auto logger = worker->addDefaultLogger(name,path);
            g3::initializeLogging(worker.get());
    }

public:
    void log(std::string message, crow::LogLevel level) override {
        LOG(INFO) << boost::trim_copy(message);
    }
};

class zeromq_log_sink {
    config& cfg;
    crow::ILogHandler& log;
    crow::ILogHandler& log_sink;
    zmq::context_t context;
    zmq::socket_t pull;
    std::atomic<bool> started;

public:
    zeromq_log_sink(config& c, crow::ILogHandler& default_log, crow::ILogHandler& sink)
        :   cfg(c),
            log(default_log),
            log_sink(sink),
            context(1),
            pull(context,ZMQ_PULL),
            started(false) {
                std::string port=std::to_string(cfg.zeromq_log_port);
                std::string socket_config="tcp://*:";
                socket_config+=port;
                pull.bind(socket_config.c_str());

                log.log(std::string("Listening to 0mq incoming logs on: ")+socket_config+"\n",crow::LogLevel::INFO);
    }

    ~zeromq_log_sink() {
        this->stop();
    }

    void start_once() {
        if (started)
            return;

        std::thread([this]{
            while(started) {
                zmq::message_t request;
                pull.recv(&request);
                std::string log_line(static_cast<char*>(request.data()), request.size());
                log_sink.log(log_line,crow::LogLevel::INFO);
            }
        }).detach();

        started = true;
    }

    void stop() {
        started = false;
    }
};

int main(int argc, char* argv[])
{
    crow::SimpleApp app;

    config cfg;

    DefaultLogger default_log(cfg);
    g3logLogger log(argv[0],"logs");

    zeromq_log_sink sink(cfg,default_log,log);

    sink.start_once();
    
    CROW_ROUTE(app, "/")
    .name("hello")
    ([]{
        return "Hello World!";
    });

    // echo bla | http put http://localhost:18080/log
    CROW_ROUTE(app, "/log")
    .methods("PUT"_method)
    ([&log](const crow::request& req){
        log.log(req.body,crow::LogLevel::INFO);
        return crow::response(200);
    });

    // http get http://localhost:18080/toggle_logging
    CROW_ROUTE(app, "/toggle_logging")
    ([&cfg]{
        cfg.logging = !cfg.logging;
        return std::string("Logging now: ") + (cfg.logging ? "on" : "off");
    });

    // http get http://localhost:18080/kill
    CROW_ROUTE(app, "/kill")
    ([&sink]{
        sink.stop();
        std::thread([]{
            std::this_thread::sleep_for(std::chrono::seconds(1));
            std::exit(0);
        }).detach();
        return "OK! Shutting down!";
    });

    // ignore all log
    crow::logger::setLogLevel(crow::LogLevel::DEBUG);
    auto handler(std::make_shared<DefaultLogger>(cfg));
    crow::logger::setHandler(handler.get());

    app.port(cfg.port)
        .multithreaded()
        .run();
}
