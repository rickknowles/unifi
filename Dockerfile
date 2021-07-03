FROM ubuntu:18.04
RUN apt-get update && apt-get install -y gnupg
RUN echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN apt-get update && apt-get install -y curl mongodb-org=3.4.17 mongodb-org-server=3.4.17 mongodb-org-shell=3.4.17 mongodb-org-mongos=3.4.17 mongodb-org-tools=3.4.17
RUN curl -sL https://dl.ui.com/unifi/6.2.26/unifi_sysvinit_all.deb -o /unifi.deb
RUN apt-get install -y /unifi.deb
EXPOSE 6789/tcp 8080/tcp 8443/tcp 8880/tcp 8843/tcp 3478/udp
CMD /usr/bin/java -jar /usr/lib/unifi/lib/ace.jar start
