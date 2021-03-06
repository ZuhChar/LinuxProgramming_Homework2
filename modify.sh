#! /bin/bash
#Collaborated with Ian Moon to complete this
#Check to see if there is no arguments passed to the script
if [ $# -eq 0 ]; 
then
    echo "usage: modify filename [filename...]"
    exit 1
fi

#Variable to implement for date
DAY=$(date +"%A")
MONTH=$(date +"%b %d")
YEAR=$(date +"%Y")
TIME=$(date +"%H%M")


#For loop to run through all of the arguments given
for argument in $@; do
    if file "$argument" | grep ASCII;
    then 
        ed -s $argument <<END_ED
        1m2
        w
        q
END_ED
        sed -i 's/Gradez/Grades/g' "$argument"
        ed -s $argument <<END
            r !date +'Modified on: $DAY, $MONTH, $YEAR: $TIME \%nModified by: zachary_crimmel'
            w $argument
            q
END
    elif [ -d "$argument" ];
    then
        echo "modify: $argument, is a directory."
    elif [ -x "$argument" ];
    then
        echo "modify: $argument, cannot edit executables."
    else
        echo "modify: $argument, filetype not supported."
    fi
done;