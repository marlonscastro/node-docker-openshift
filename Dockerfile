FROM node:10.19.0-jessie

RUN apt-get update && \
    apt install telnet curl -y 

RUN apt-get update && \ 
	apt-get install -y python3 libc6 && \
	apt-get --fix-broken install && \
	rm -rf /var/lib/apt/lists/*

COPY mysql-shell_8.0.19-1debian10_amd64.deb /tmp 	
COPY libc6_2.30-0ubuntu2.1_amd64.deb /tmp
COPY libcurl4_7.68.0-1_amd64.deb /tmp
COPY libpython3.7_3.7.7-1+b1_amd64.deb /tmp

RUN dpkg -i /tmp/libc6_2.30-0ubuntu2.1_amd64.deb && \
    apt-get install -f	
    dpkg -i /tmp/libcurl4_7.68.0-1_amd64.deb && \
    dpkg -i /tmp/libc6_2.30-0ubuntu2.1_amd64.deb && \
	dpkg -i /tmp/mysql-shell_8.0.19-1debian10_amd64.deb && \
  	rm -Rf /tmp/* && \
	chmod 777 /usr/bin/mysqlsh



COPY * /run/
EXPOSE 8080
CMD ["node", "/run/app.js"]




