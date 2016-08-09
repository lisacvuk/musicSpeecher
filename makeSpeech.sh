#!/bin/bash
NUMFILES=$(ls -lR | grep .*.mp3 | wc -l)
INFILE=""
((NUMFILES++))
I=1
while [ $I -lt $NUMFILES ] 
do
	INFILE=$(ls -1 | sed -n ${I}p)
	INFILE2=$(echo $INFILE | awk -F\. {'print $1'} | awk -F$I {'print $2'})
	OUTFILE="${I}.wav"
	espeak "$INFILE2" -w $OUTFILE -s 120
	((I++))
done
