#!/bin/bash

FILE=$1

if [[ $FILE == "" ]]
then
        echo "Usage: $0 <filename>"
        exit
fi

stty -echo
read -p "Password: " PASSWORD; echo
stty echo

for ii in `cat gui-servers`
do
        echo "$ii"
        sshpass -p $PASSWORD scp $FILE santoshs@${ii}:/var/tmp
done
