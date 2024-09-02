#!/bin/bash

# sysinfo_page - A script to produce an HTML file

###### Constants

TITLE="System Information for"
TIME_NOW="$(date +"%x %r %Z")"
TIME_STAMP="Updated on $TIME_NOW by $USER"

###### Functions
system_info(){
    echo "<h2>System Uptime</h2>"
    echo "<pre>"
    uptime
    echo "</pre>"
}
show_uptime(){
    echo "<h2>Filesystem space</h2>"
    echo "<pre>"
    df
    echo "</pre>"
}
drive_space(){
    echo "<h2>Home directory space by user</h2>"
    echo "<pre>"
    echo "Bytes Directory"
    du -s /home/* | sort -nr
    echo "</pre>"
}
home_space(){
    echo "<h2>System release info</h2>"
    echo "<p>Function not yet implemented</p>"
}

###### Main

cat <<- _EOF_
    <html>
    <head>
        <title>
        $title $HOSTNAME
        </title>
    </head>

    <body>
        <h1>$TITLE $HOSTNAME</h1>
        <p>$TIME_STAMP</p>
        $(system_info)
        $(show_uptime)
        $(drive_space)
        $(home_space)
    </body>
    </html>
_EOF_