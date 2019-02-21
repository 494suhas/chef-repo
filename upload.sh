#!/bin/bash
knife ssl check
echo "connection sucessfully"
knife cookbook upload tomcat
echo "tomcat cookbook is uploaded"
sleep 5;
knife role from file roles/app.json
echo "app.json role is uploaded"
sleep 3;
echo "attaching the node to role"
mapfile -t names < name.txt
for i in "${!names[@]}"; do
knife node run_list set "${names[$i]}" "role[app]"
done
echo "attached the node to role"






