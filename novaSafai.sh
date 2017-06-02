#!/bin/bash
ARG1=${1}
echo "Cleaning from DB Nova Instance: " $ARG1

echo "Opening Connection..."

mysql nova -e "DELETE FROM nova.block_device_mapping where instance_uuid =
'$ARG1'"


mysql nova -e "delete from nova.instance_actions_events where action_id in (
select id from nova.instance_actions where instance_uuid =
    '$ARG1')"
sleep 1

mysql nova -e "delete from instance_actions where instance_uuid =
    '$ARG1'"
sleep 1

mysql nova -e "delete from nova.instance_faults where instance_uuid =
    '$ARG1'"
sleep 1

mysql nova -e "delete from nova.instance_extra where instance_uuid =
    '$ARG1'"

sleep 1

mysql nova -e " delete from nova.instance_info_caches where instance_uuid =
    '$ARG1'"

sleep 1

mysql nova -e "delete from nova.instance_system_metadata where
    instance_uuid = '$ARG1'"

sleep 1

mysql nova -e "DELETE FROM instances WHERE uuid =
    '$ARG1'"

sleep 1
echo "Done Cleaning..."
