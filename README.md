# irc-voicemail

Requires ssh keys to be setup between the irc EggDrop server and the Asterisk server and the Asterisk server

* Copy VoiceMail.tcl to your EggDrop scripts directory
* Add VoiceMail.tcl to your EggDrop config and the restart the EggDrop service
* Place voicemail.sh in your Asterisk home directory and the Asterisk server
* User Requesting Voicemail must be a chan-op in the channel making the request 

Example usage :
15:50 <@no2pencil> !voicemail 1007
15:50 <@Alfred> Extension 1007 has 3 NEW voicemails from "INBOUND (313)209-7522" <+13132097522> on Wed Jul 19 02:10:03 PM UTC 2017!

15:50 <~no2pencil> !voicemail 6000
15:50 <@Alfred> There is currently no NEW voicemail for extension 6000

and the Asterisk server
