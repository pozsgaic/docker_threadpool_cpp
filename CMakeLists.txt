cmake_minimum_required(VERSION 3.10)
project(threadpool_test)

set(BOOST_ROOT /usr/local)
set(Boost_LIBRARY_DIRS /usr/local/lib)
message(STATUS "Finding boost")
#find_package(Boost 1.80.0 COMPONENTS random thread filesystem)
find_package(Boost REQUIRED COMPONENTS system filesystem)
message(STATUS "Boost found ${Boost_FOUND}")
INCLUDE_DIRECTORIES(${Boost_INCLUDE_DIRS})
ADD_DEFINITIONS("-DHAS_BOOST")

message(STATUS "boost include: ${Boost_INCLUDE_DIRS}")
message(STATUS "boost libs: ${Boost_LIBRARY_DIRS}")
set(LIBS ${Boost_LIBRARIES} pthread "${CMAKE_THREAD_LIBS_INIT}")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")

add_executable(threadpool_test threads.cpp)
target_link_libraries(threadpool_test Boost::filesystem)
