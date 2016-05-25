include 'premake'

make_solution 'cg3lz'

-------------------------------
configuration 'windows'
	defines {
		'NOGDI',
		'CROW_MSVC_WORKAROUND'
	}
configuration '*'
-------------------------------

boost = assert(dofile 'premake/recipes/boost.lua')
boost:set_defines()
boost:set_includedirs()
boost:set_libdirs()

includedirs {
	'deps/crow/include',
	'deps/crow/amalgamate',
}

--------------------------------------------------------------------
make_console_app('cg3lz', { 'src/main.cpp' })
use_standard('c++11')

configuration 'not windows'
	links {
		'boost_system',
		'boost_date_time',
		'boost_regex',
		'pthread'
	}
configuration '*'
