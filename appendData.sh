#!/bin/sh
#Script to count remaining photos in my photo directory and, if changed, append the result to a text file for graphing

cd "$(dirname "$0")"

# Count remaining photos
REMAINING=`find /path/to/photoStagingArea . -type f | wc -l`

# Get today's date
DATE=`date +"%d-%m-%Y"`

#Prepare a line to write to the file.
PREPPEDLINE=`echo $DATE,$REMAINING`

#Check the previously written line in the file.
PREVLINE=`tail -1 data.txt`

#Exctract the previous count
PREVCOUNT=`echo $PREVLINE | cut -f 2 -d ","`


if [ $REMAINING != $PREVCOUNT ]
then
        # If we have new Change detected, so write the result
        echo $PREPPEDLINE >> data.txt

        #Compile the status
        STATUS=`showGraph.sh`

        #Email me an updated status
        curl -G --data-urlencode "code=hRo^4K0FK0e" --data-urlencode "line=Photo status" --data-urlencode "block=$STATUS" http://www.asktoby.com/notify/notify.php

fi
