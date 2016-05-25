//i.e. g++ zmqclient.cpp -lzmq -o zmqclient -O3 -std=c++11
#include <zmq.hpp>
#include <chrono>
#include <iostream>
#include <string>

typedef std::chrono::high_resolution_clock Clock;

int main (int argc, char* argv[]) {
    zmq::context_t context(1);
    zmq::socket_t push(context, ZMQ_PUSH);
    auto count = 100000;
    unsigned long long total = 0;

    std::string server = (argc == 1) ?
        "localhost"
        :
        argv[1]
    ;
    std::cout<<"connecting to "<<server<<std::endl;
    auto connection_string = std::string("tcp://")+server+":18090";
    push.connect(connection_string.c_str());

    while (true) {
        auto t1 = Clock::now();

        for (auto i=0; i<count; i++) {
        	std::string msg(std::to_string(i));
			zmq::message_t hi(msg.length());
            memcpy(hi.data(), msg.data(), msg.length());
            push.send(hi);
        }

        total+=count;
        auto t2 = Clock::now();
        auto diff=t2-t1;
        auto count_per_second = static_cast<double>(count)/(std::chrono::duration_cast<std::chrono::milliseconds>(t2-t1).count()/1000.);
        std::cout<<count_per_second<<"/s, total: "<<total<<std::endl;
    }

    return 0;
}