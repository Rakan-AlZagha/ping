#!/bin/bash
# Author: Rakan AlZagha
# Assignment 1
# Description: workspace status
# Date: 2/19/2021

stationStatus () { # ping function that prints state of stations
    ping -c 1 -W 1 $1 &> /dev/null # ping one packet and see if anything is returned
    if [ $? -eq 0 ] # if ping returns a 1 (success)
    then
        state=`echo $1 | cut -d"." -f1` # take argument of station name and format it
        echo "$state is up." # output state of station
    else
        state=`echo $1 | cut -d"." -f1` # take argument of station name and format it
        echo "$state is down." # output state of station
    fi
}

for((i=1; i<=19; i++)) # loop all of netlab stations names
do
    if [ ${#i} -eq 1 ] # if i is a single digit
    then
        netStation=`echo netlab0$i.cs.trincoll.edu`
        stationStatus $netStation # call ping function to determine state
    else # if i is two or more digits
        netStation=`echo netlab$i.cs.trincoll.edu`
        stationStatus $netStation # call ping function to determine state
    fi
done
