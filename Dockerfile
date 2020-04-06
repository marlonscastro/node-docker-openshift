FROM node:10.19.0-jessie

RUN apt-get update && \
    apt install telnet curl -y 

COPY * /run/
EXPOSE 8080
CMD ["node", "/run/app.js"]
