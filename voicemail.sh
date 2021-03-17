#!/bin/bash

if [ ! $1 ]; then
  echo "No Extension was provided"
  exit 1
fi

s=""

vmcount=$(ls -l /var/spool/asterisk/voicemail/main/$1/INBOX/*.txt 2> /dev/null|wc -l|awk '{print $1}')
if [ ${vmcount} -gt 1 ]; then
  s="s"
fi

vmfile=/var/spool/asterisk/voicemail/main/$1/INBOX/msg0000.txt
vm=$(ls ${vmfile} 2>&1 /dev/null)
if [ $? -eq 0 ]; then
  callerid=$(cat ${vmfile}|grep '^callerid'|cut -d'=' -f2-)
  origdate=$(cat ${vmfile}|grep '^origdate'|cut -d'=' -f2-)
  echo "Extension $1 has ${vmcount} NEW voicemail${s}, the oldest from ${callerid} on ${origdate}!"
else
  echo "There is currently no NEW voicemail for extension $1"
fi
