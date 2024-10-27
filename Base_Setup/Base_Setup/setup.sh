#!/usr/bin/env sh 
con="continue"
local_dir="/usr/local/etc/pkgs/repos"

Path_pkg="/usr/sbin/pkg"
System_Updates() {
    if [ -f "$Path_pkg" ]; then
        if [ "$(id -u)" -ne 0 ]; then
            printf "Error: You must be root to run this script"
            exit 1


        else

                if [ -d "$local_dir" ]; then
                    for c in $con; 
                    do 
                        "$c"


                    done


                else 
                    mkdir "$local_dir"

                    if [ -f "FreeBSD.conf" ]; then
                        cp FreeBSD.conf "$local_dir"
                        freebsd-update fetch 
                        freebsd-update install 
                        pkg update
                        printf "System will Reboot in 3 seconds"
                        sleep 3
                        reboot 
                        exit 0


                    else
                            printf "Error: FreeBSD.conf file not found \n"
                            exit 1




                    fi

                    

                fi

            


        fi 



    else
        exit 1 

    fi 
}

System_Updates
