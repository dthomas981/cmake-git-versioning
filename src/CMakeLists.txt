cmake_minimum_required(VERSION 3.16)
find_package(Git REQUIRED)
set(EXECUTABLE_NAME testapp)
project(testapp LANGUAGES C)

#add_executable(${EXECUTABLE_NAME} "main.c" ${CMAKE_CURRENT_BINARY_DIR}/include/build_info.h)
add_executable(${EXECUTABLE_NAME} "main.c")

# # create a custom target that will generate the build info header file.
# # the ALL option adds it to the default target so it's run every time.
# add_custom_target(gitversion ALL
#     DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/include/build_info.h)

# # adds a custom command that calls a cmake script that actually generates the
# # header file. this gives cmake a way to update the file when needed.
# add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/include/build_info.h
#     COMMAND ${CMAKE_COMMAND} 
#         -D REPO_DIR=${CMAKE_CURRENT_SOURCE_DIR}
#         -D INPUT_FILE=${CMAKE_CURRENT_SOURCE_DIR}/build_info.h.in
#         -D OUTPUT_FILE=${CMAKE_CURRENT_BINARY_DIR}/include/build_info.h
#         -D GIT_EXECUTABLE=${GIT_EXECUTABLE}
#         -P ${CMAKE_CURRENT_SOURCE_DIR}/generate_build_info.cmake
#     DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/build_info.h.in)

# # assign some properties to the generated header file.
# set_source_files_properties(${CMAKE_CURRENT_BINARY_DIR}/include/build_info.h
#     PROPERTIES GENERATED TRUE
#     HEADER_FILE_ONLY TRUE)

# # include the output directory so our source files can include it without
# # needing to know the full path
# include_directories(${CMAKE_CURRENT_BINARY_DIR}/include)

# # explicitly say that the executable depends on the generated header file
# add_dependencies(${EXECUTABLE_NAME} gitversion)





# create a custom target that will generate the build info header file.
# the ALL option adds it to the default target so it's run every time.
add_custom_target(gitversion ALL
    COMMAND ${CMAKE_COMMAND} 
    -D REPO_DIR=${CMAKE_CURRENT_SOURCE_DIR}
    -D INPUT_FILE=${CMAKE_CURRENT_SOURCE_DIR}/build_info.h.in
    -D OUTPUT_FILE=${CMAKE_CURRENT_BINARY_DIR}/include/build_info.h
    -D GIT_EXECUTABLE=${GIT_EXECUTABLE}
    -P ${CMAKE_CURRENT_SOURCE_DIR}/generate_build_info.cmake
    BYPRODUCTS ${CMAKE_CURRENT_BINARY_DIR}/include/build_info.h
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/build_info.h.in)

# # adds a custom command that calls a cmake script that actually generates the
# # header file. this gives cmake a way to update the file when needed.
# add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/include/build_info.h
#     COMMAND ${CMAKE_COMMAND} 
#         -D REPO_DIR=${CMAKE_CURRENT_SOURCE_DIR}
#         -D INPUT_FILE=${CMAKE_CURRENT_SOURCE_DIR}/build_info.h.in
#         -D OUTPUT_FILE=${CMAKE_CURRENT_BINARY_DIR}/include/build_info.h
#         -D GIT_EXECUTABLE=${GIT_EXECUTABLE}
#         -P ${CMAKE_CURRENT_SOURCE_DIR}/generate_build_info.cmake
#     DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/build_info.h.in)

# assign some properties to the generated header file.
set_source_files_properties(${CMAKE_CURRENT_BINARY_DIR}/include/build_info.h
    PROPERTIES GENERATED TRUE
    HEADER_FILE_ONLY TRUE)

# include the output directory so our source files can include it without
# needing to know the full path
include_directories(${CMAKE_CURRENT_BINARY_DIR}/include)

# explicitly say that the executable depends on the generated header file
add_dependencies(${EXECUTABLE_NAME} gitversion)









# # adds a custom command that calls a cmake script that actually generates the
# # header file. this gives cmake a way to update the file when needed.

# add_custom_command(TARGET ${EXECUTABLE_NAME}
#     PRE_BUILD
#     COMMAND ${CMAKE_COMMAND} 
#         -D REPO_DIR=${CMAKE_CURRENT_SOURCE_DIR}
#         -D INPUT_FILE=${CMAKE_CURRENT_SOURCE_DIR}/build_info.h.in
#         -D OUTPUT_FILE=${CMAKE_CURRENT_BINARY_DIR}/include/build_info.h
#         -D GIT_EXECUTABLE=${GIT_EXECUTABLE}
#         -P ${CMAKE_CURRENT_SOURCE_DIR}/generate_build_info.cmake
#     BYPRODUCTS ${CMAKE_CURRENT_BINARY_DIR}/include/build_info.h)

# # assign some properties to the generated header file.
# set_source_files_properties(${CMAKE_CURRENT_BINARY_DIR}/include/build_info.h
#     PROPERTIES GENERATED TRUE
#     HEADER_FILE_ONLY TRUE)

# # include the output directory so our source files can include it without
# # needing to know the full path
# include_directories(${CMAKE_CURRENT_BINARY_DIR}/include)

