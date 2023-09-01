cmake_minimum_required(VERSION 3.26)
project(demo_project)

add_executable(demo)
target_sources(demo
  PRIVATE
    main.cxx
  PRIVATE
    FILE_SET cxx_modules TYPE CXX_MODULES FILES
    lib.cxx
  )
target_compile_features(demo PUBLIC cxx_std_20)

install(TARGETS demo RUNTIME DESTINATION bin)
