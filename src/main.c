#include <stdio.h>
#include "build_info.h"

int main()
{
    printf("Major Version: %d\n", MAJOR_VERSION);
    printf("Major Version: %d\n", MINOR_VERSION);
    printf("Major Version: %d\n", TAG_DISTANCE);
    printf("Major Version: %08x\n", COMMIT_HASH);
    printf("Major Version: %lld\n", BUILD_DATE);

    printf("Hello world\n\n\n");
    return 0;
}