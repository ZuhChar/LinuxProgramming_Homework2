#! /bin/bash

#Check to see if there is no arguments passed to the script
if [ $# -eq 0 ]; 
then
    echo "usage: modify filename [filename...]"
    exit 1
fi

for arguments in $#;
    if [[ "$#" == "*.txt" ]];
    then 
        echo "This is a text file"
    elif [[ -d $# ]];
    then
        echo "modify: $#, is a directory."
    elif [[ "$#" == "*.exe" ]];
    then
        echo "modify: $#, cannot edit executables."
    else
        echo "modify: $#, filetype not supported."
fi