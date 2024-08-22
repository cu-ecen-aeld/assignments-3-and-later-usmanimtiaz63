#include <stdio.h>
#include <syslog.h>
#include <string.h>

int main(int argc, char *argv[])
{
    FILE    *toWrite;

    if (argc == 1)
    {
        printf("Please specify file and string to write\n");
        return 1;
    }
    else if (argc == 2)
    {
        printf("Please specify string to write\n");
        return 1;
    }
    else if (argc > 3)
    {
        printf("Too many arguments\n");
        return 1;
    }

    syslog(LOG_USER | LOG_DEBUG,"Writing %s to %s", argv[2], argv[1]);

    toWrite = fopen(argv[1], "wb");

    if (toWrite != NULL)
    {
        size_t  len;

        len = fwrite(argv[2], sizeof(char), strlen(argv[2]), toWrite);

        fclose(toWrite);

        if (len == 0)
        {
            syslog(LOG_USER | LOG_ERR, "String \"%s\" could not be written to \"%s\"", argv[2], argv[1]);
            return 1;
        }
    }
    else
    {
        syslog(LOG_USER | LOG_ERR, "Unable to open file: %s", argv[1]);
        return 1;
    }

    return 0;
}