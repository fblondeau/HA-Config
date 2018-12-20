#!/bin/sh
#################
# stop the screen saver on a remote
#################
# @todo add args to send host as a panel_iframe
# @todo add args to send port as a param
echo $USER
printenv
nbOfTry=0
while [ $nbOfTry -lt 5 ]
  do
  if (ssh -i keys/id_rsa $USERLIVING@$HOSTLIVING -X  "export DISPLAY=:0; cinnamon-screensaver; cinnamon-screensaver-command -d;" )
    then
    # connected successfully
    return 0;
    fi
  nbOfTry=$((nbOfTry + 1))
  # Wait for 4 sec for the host to wakeup
  sleep 4
done
# ERROR
printf "Could not connect to the host\n";
return 1
