FROM ubuntu:22.04
MAINTAINER VIJAY
RUN apt-get update
RUN apt-get install -y openjdk-11-jdk
RUN apt-get install -y wget
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.102/bin/apache-tomcat-9.0.102.tar.gz
RUN tar -xvf apache-tomcat-9.0.102.tar.gz && mv apache-tomcat-9.0.102 /usr/local/tomcat && rm apache-tomcat-9.0.102.tar.gz
WORKDIR /usr/local/tomcat
COPY SKY.war webapps/
EXPOSE 8080
ENTRYPOINT ["sh", "bin/catalina.sh", "run"]
