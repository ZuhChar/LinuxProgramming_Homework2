#! /bin/bash

#Check to see if there is no arguments passed to the script
if [ $# -eq 0 ]; 
then
    echo "usage: modify filename [filename...]"
    exit 1
fi

#For loop to run through all of the arguments given
for argument in $@; do
    if [[ $argument == *.txt ]];
    then 
        ed -s $argument <<END
            r !date +'Modified on \%F' + '\n' + 'Modified by: zachary_crimmel'
            w $argument
            q
END
    elif [ -d "$argument" ];
    then
        echo "modify: $argument, is a directory."
    elif [ $argument == *.exe ];
    then
        echo "modify: $argument, cannot edit executables."
    else
        echo "modify: $argument, filetype not supported."
    fi
done;