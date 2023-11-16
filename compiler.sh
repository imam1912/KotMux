#!/bin/bash
file="/data/data/com.termux/files/home/KotMux/condition.txt"
try=$(cat $file)
if(( try==0 ))
then
apt update && apt upgrade
pkg install openjdk-17
pkg install kotlin
echo "1" > condition.txt
else
echo ">~<"
fi
GREEN='\033[0;36m'
RED='\033[1;33m'
echo "                                      "
echo -e "${RED}Which Project You Want to Compile?"
echo "                                      "
read file
filetwo="$file"
mainFile="${filetwo%.*}"
echo "                                      "
echo "Compiling..............."
sleep 1s
kotlinc $mainFile.kt -include-runtime -d $mainFile.jar
echo "                                      "
echo -e "${GREEN} >>>>>> Compiled Sucessfully!!<<<<<<${RED}"
echo "                                      "
java -jar $mainFile.jar
echo "                                      "
sleep 1s
rm $mainFile.jar




