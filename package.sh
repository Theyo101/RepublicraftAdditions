#!/usr/bin/env bash
# the bash flags help me not blow up everything with bad code
set -Eeuo pipefail

  #sets up terminal colors of use with echo -e
  boldBlue='\033[1;34m'
  boldRED='\033[1;31m'
  resetColor='\033[0m'

  #sets variable of Major and Minor version from currentversion.txt
  majorMinor=$(cat currentversion.txt)
  echo -e "${boldBlue}Major Minor is $majorMinor"
  
  #sets variable of current Year and Week using the Date command
  formattedDate=$(date +%y.%V)
  echo -e "Date Code is $formattedDate"
  
  #combines the current major and minor version with the year and week to complete the full CalVer scheme
  fullVersion="$majorMinor.$formattedDate"
  echo -e "Full Version is $fullVersion \n${resetColor}"

  #tests to see if another datapack of the current major and minor version exists,
if test -f RepublicraftAdditions\ V.\ $majorMinor[.]*Testing.zip; then
  #if it does exist prompt the user for deletion.
  read -p "$(echo -e "${boldRED}There is already a current version pack; proceed and delete it? (Y/N)${resetColor} ")" yn
  case $yn in
    [yY] )
      echo -e "${boldRED}DELETING CURRENT TESTING VERSIONS${resetColor}";
      rm -vI RepublicraftAdditions\ V.\ $majorMinor[.]*Testing.zip;
      zip -x *.sh, *.txt, *.zip -r "RepublicraftAdditions V. $fullVersion Testing.zip" ./*;
      exit 0 ;;
    
    * ) exit 1 ;;
  esac
else
  #if it does not exist then package for a new version
  zip -x .sh, *.txt, *.zip -r "RepublicraftAdditions V. $fullVersion Testing.zip" ./*;
  exit 0;
fi
