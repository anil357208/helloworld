# Pull base image 
#From tomcat:8-jre8 

# Maintainer 
# MAINTAINER "valaxytech@gmail.com" 
# COPY ./webapp.war /usr/local/tomcat/webapps



FROM maven:3.5.2-jdk 
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
WORKDIR /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

FROM openjdk:8
COPY --from=0 /usr/src/app/target/webapp.war /usr/app/webapp.war 
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/app/webapp.war"]
