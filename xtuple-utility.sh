#!/bin/bash

# Some variables.
REBOOT=0
DATE=`date +%Y.%m.%d-%H.%M`
export _REV="0.1Alpha"

if [ `whoami` != "root" ]; then
    echo "You must run the app as root."
    echo "sudo $0"
    exit 0
fi

# check what distro we are running.
_R=`lsb_release -i -s`

case "$_R" in
    "Ubuntu")
        export DISTRO="ubuntu"
        ;;
    "Debian")
        export DISTRO="debian"
        ;;
    *)
        echo "I couldn't identify your distribution."
        echo "Please report this error on GitHub"
        echo "distro info: "
        lsb_release -a
        exit 0
        ;;
esac

# Load the scripts
source postgresql.sh
source common.sh
source database.sh

# mainmenu should be the last one :)
source mainmenu.sh