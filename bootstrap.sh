#!/bin/bash
echo "installing the chef-client command using bootstrap on multiple nodes"
mapfile -t ips < IP.txt 
mapfile -t names < name.txt 



for i in "${!ips[@]}"; do
#sshpass -p "sai" ssh -o StrictHostKeyChecking=no sai@"${ips[$i]}" 
#sshh-keygen -f "/home/sai/.ssh/known_hosts" -R "${ips[$i]}" 
knife bootstrap "${ips[$i]}" --ssh-user sai --ssh-password 'sai' --sudo --use-sudo-password --node-name "${names[$i]}"  -y
done
