#!/bin/bash
ARG1=${1}
echo "Cleaning from DB Cinder vol: " $ARG1

echo "Opening Connection..."
mysql cinder -e "delete from volume_attachment where volume_id =
'$ARG1'"
sleep 2
mysql cinder -e "delete from volume_admin_metadata where volume_id =
'$ARG1'"
sleep 2
mysql cinder -e "delete from volumes where id =
'$ARG1'"
sleep 2
echo "Done Cleaning..."
