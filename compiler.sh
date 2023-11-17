#!/bin/bash
#
# Script For Compiling Kotlin Code Using Termux!
# Before Continue Make Sure You Are On Root Directory
# How to Check That?
# Type pwd for checking the directory
# Type cd ~ 
# For Going To Root Directory
#
# by imam :)

#Defining bash colour

CYAN='\033[0;36m'
YELLOW='\033[1;33m'

#Getting file path for condition

FILE="/data/data/com.termux/files/home/KotMux/condition.txt"

#Reading the files value for applying the condition

READ=$(cat $FILE)

if(( READ==0 ))
    then
        apt update && apt upgrade
        pkg install openjdk-17
        pkg install kotlin
        echo "1" > condition.txt
    else
        echo "All Packages Are Exsited"
    fi

#Spacing

echo "                                      "

#Hint for user input!

echo -e "${YELLOW}Enter Your Kotlin File Path Here : "

echo "                                      "

#Getting User Input of File Path

read USER_INPUT
USER_CON="$USER_INPUT"
MAIN_PATH="${USER_CON%.*}"

#Spcing

echo "                                      "
echo "Compiling..............."
sleep 1s

#Conpiling Process

kotlinc $MAIN_PATH.kt -include-runtime -d $MAIN_PATH.jar

#Spacing

echo "                                      "
echo -e "${CYAN} >>>>>> Compiled Sucessfully!!<<<<<<${YELLOW}"
echo "                                      "

#Runing Jar File

java -jar $MAIN_PATH.jar

echo "                                      "
sleep 1s

#Remove Created Jar File

rm $MAIN_PATH.jar

#End
