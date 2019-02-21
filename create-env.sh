#!/bin/bash
echo "creating container(N)"
read N
sleep 2;
for i in `seq $N` 
do
	echo "=============================="
    echo "Creating chefserver$i container.."
    sleep 1
    docker run --name chefserver$i -d -it --rm siva1995/chef-image:latest /bin/bash
    echo "chefserver$i container has been created!"
	echo "=============================="
    
done

docker inspect --format '{{.NetworkSettings.Networks.bridge.IPAddress}}' `docker ps -q` > IP.txt
echo "IP.txt file is created!"
#docker inspect --format '{{.Name}}' `docker ps -a -q` | sed  -e 's#^.*/##'> name.txt
docker inspect --format '{{.Name}}' `docker ps -q` | cut -c2- > name.txt
echo "name.txt file is created!"




