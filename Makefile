IMAGENAME = cowrie
CONTAINERNAME= cowrie

all: build

build: Dockerfile
	docker build -t ${IMAGENAME} .

run: start

start: create-volumes
	docker run -p 22:2222/tcp \
		   -p 23:2223/tcp \
		   -v cowrie-etc:/cowrie/cowrie-git/etc \
		   -v cowrie-var:/cowrie/cowrie-git/var \
		   -d \
	           --name ${CONTAINERNAME} ${IMAGENAME}

stop:
	docker stop ${CONTAINERNAME}

rm: stop
	docker rm ${CONTAINERNAME}

clean:
	docker rmi ${IMAGENAME}

shell:
	docker exec -it -u root ${CONTAINERNAME} bash

logs:
	docker logs ${CONTAINERNAME}

ps:
	docker ps -f name=${CONTAINERNAME}

status: ps

ip:
	docker inspect ${CONTAINERNAME} | jq '..|.IPAddress?' | grep -v null | sort -u

create-volumes:
	docker volume create cowrie-var
	docker volume create cowrie-etc
