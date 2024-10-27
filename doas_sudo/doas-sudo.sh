#!/usr/bin/env sh 
doas_path="/usr/local/etc"
Path_pkg="/usr/sbin/pkg"
install_doas() {
    if [ -f "$Path_pkg" ]; then
        yes | pkg install doas
        cp doas.conf "$doas_path"
        exit 0

    else 
            exit 1 


    fi
}

install_sudo() {
    if [ -f "$Path_pkg" ]; then
        yes | pkg install sudo
        exit 0

    else 
            exit 1 

    fi
}

while true; do
    printf "Do you want to install doas or sudo [d/s] \n"
    read -r option

    case "$option" in 
        d)
            install_doas
            ;;

        s)
            install_sudo
            ;;

        *)
            printf "Error: Choose either d or s \n"
            exit 1
            ;;

            



    esac




done 