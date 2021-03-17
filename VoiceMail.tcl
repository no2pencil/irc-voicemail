##########################################################################################
# VoiceMail 0.1    (03/16/2021)
# - fetches and displays voicemail information from Asterisk

bind PUB - !voicemail voicemail

proc voicemail {nick uhost hand chan exten} {
  putlog "\[TRIGGERED\] $nick - $chan - $exten"
  if {[isop $nick $chan]} {
    set result [exec ssh calls "bash voicemail.sh $exten"]
    putlog "\[FETCHED\] $result"
    putserv "PRIVMSG $chan :$result"
  } else {
    putlog "\[FAILED\] Triggered by non-op!"
  }
}

putlog "\[LOADED\] VoiceMail v0.1 by \002no2pencil (no2pencil@compuserv.org)\002"
