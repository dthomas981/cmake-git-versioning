# INPUT_FILE must be defined
# OUTPUT_FILE must be defined

# run git describe --tags --long --abbrev=8 --match=v[0-9]*.[0-9]*
# output format: v0.1-0-g360ff86a
# Note: the match expression using glob matching, not regex. i'd rather use + instead of *.
execute_process(
    COMMAND ${GIT_EXECUTABLE} describe --tags --long --abbrev=8
    WORKING_DIRECTORY ${REPO_DIR}
    RESULT_VARIABLE GIT_DESCRIBE_RETCODE
    OUTPUT_VARIABLE GIT_DESCRIBE_OUTPUT
    OUTPUT_STRIP_TRAILING_WHITESPACE
 )

 string(REGEX MATCH "^v([0-9]+)\\.([0-9]+)-([0-9]+)-g([a-z0-9]+)" GITVERSIONDETECT_VERSION_MATCH ${GIT_DESCRIBE_OUTPUT})
 set(MAJOR_VERSION ${CMAKE_MATCH_1})
 set(MINOR_VERSION ${CMAKE_MATCH_2})
 set(TAG_DISTANCE ${CMAKE_MATCH_3})
 set(COMMIT_HASH ${CMAKE_MATCH_4})
 string(TIMESTAMP BUILD_DATE "%s" UTC)

 configure_file(
    "${INPUT_FILE}"
    "${OUTPUT_FILE}" ESCAPE_QUOTES
)