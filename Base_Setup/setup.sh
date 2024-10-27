#!/usr/bin/env sh 
Path_pkg="/usr/sbin/pkg"
System_Updates() {
    if [ -f "$Path_pkg" ]; then
        if [ "$(id -u)" -ne 0 ]; then
            printf "Error: You must be root to run this script"
            exit 1


        else
                yes | pkg update && freebsd-update fetch && freebsd-update install 
                printf "System will Reboot in 3 seconds"
                sleep 3
                reboot 
            


        fi 



    else
        exit 1 

    fi 
}

System_Updates
