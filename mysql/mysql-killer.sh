#!/bin/bash

while true; 
do 
    if [[ -f "/tmp/pod/main-terminated" ]];then
        pkill mysqld ;
        kill -9 1;
        wait 1;
    fi;
    sleep 1;
done