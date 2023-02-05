#!/bin/bash

#
# This scirpt copy files between two directories or sync files in it.
#
# EXAMPLE TO USE: "./copy_sync.sh /home/dir_1/ /home/dir_2/"
#

DIR_COPY_FROM=$1
DIR_COPY_TO=$2

# Check rsync on host
if ! command -v rsync &> /dev/null
then
    echo -e "\n[WARN] RSYNC not installed"; sleep 1
    echo -e "\n[INFO] Updating repository and installing RSYNC."; sleep 1
    apt update && apt install -y rsync
    echo -e "\n[INFO] RSYNC successfully installed."; sleep 1
else
    echo -e "\n[INFO] RSYNC already installed."; sleep 1
fi

# Show info about 'copy from' and 'copy to' directories
echo -e "\nDirectory copy from: $DIR_COPY_FROM \nDirectory copy to: $DIR_COPY_TO."; sleep 1

# Start copy process
echo -e "\n[INFO] Start rsync copy process.\n"; sleep 1
rsync -azhv $DIR_COPY_FROM $DIR_COPY_TO
echo -e "\n[INFO] Copy process done!"

