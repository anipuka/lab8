cmake_minimum_required(VERSION 3.10)
project(formatter_ex_lib)

add_library(formatter_ex_lib STATIC formatter_ex.cpp)
target_include_directories(formatter_ex_lib PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/../formatter_lib
)
target_link_libraries(formatter_ex_lib PRIVATE formatter_lib)
