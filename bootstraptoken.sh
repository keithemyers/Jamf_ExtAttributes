#!/bin/sh

##################################################################################
# Jamf Extension Attribute to show whether the bootstrap token is escrowed.
#
# Keith Myers 1/5/2024 | https://www.i-techsupport.com/educational-tech/
# https://github.com/keithemyers/Jamf_ExtAttributes
##################################################################################

result=$(profiles status -type bootstraptoken | grep 'escrowed')

if [[ "$result" = "profiles: Bootstrap Token escrowed to server: YES" ]]; then
  echo "<result>TRUE</result>"
else
  echo "<result>FALSE</result>"
fi

exit 0
