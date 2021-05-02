#!/bin/sh

find . -name "*.html" -print | gawk -F "/" '
{
    new = sprintf( "%s%s", tolower( substr( $NF, 1, 1 ) ), substr( $NF, 2 ) )

    cmd = sprintf( "mv %s %s", $NF, new )

    # comment out the next two lines and uncomment the printf() to see the commands
    cmd | getline ret_val
    close( cmd )

    #printf( "%s => ret_val = %s\n", cmd, ret_val"" )
} '

