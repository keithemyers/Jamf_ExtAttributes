#!/bin/zsh

##################################################################################
# Jamf Extension Attribute to show what type of iCloud account the user is logged
# on with: Managed (MAID), personal, or not logged on.
#
# Keith Myers 1/5/2024 | https://www.i-techsupport.com/educational-tech/
# https://github.com/keithemyers/Jamf_ExtAttributes
##################################################################################

loggedInUser=$( defaults read /Library/Preferences/com.apple.loginwindow lastUserName)

icloudaccount=$( defaults read /Users/"$loggedInUser"/Library/Preferences/MobileMeAccounts.plist Accounts | grep AccountID | cut -d '"' -f 2)​


if [[ "$icloudaccount" =~ .*@appleid\.yourdomain\.org ]]; then
    echo "<result>MAID</result>"
    exit 0
elif [[ -z "$icloudaccount" ]]; then
    echo "<result>Personal</result>"
else
    echo "<result>Not logged on</result>"
fi


exit 0
