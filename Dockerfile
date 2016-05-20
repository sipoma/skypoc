FROM fedora
#FROM registry.access.redhat.com/rhel7.1

MAINTAINER Luigi Fugaro <lfugaro@redhat.com>

RUN dnf -y update && dnf clean all

RUN dnf install -y wget telnet findutils zip tar unzip mlocate
RUN dnf -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel

RUN mkdir /opt/rh

WORKDIR /opt/rh

RUN wget http://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.69/bin/apache-tomcat-7.0.69.zip

RUN unzip apache-tomcat-7.0.69.zip

RUN rm -rf apache-tomcat-7.0.69.zip

RUN ls -la

WORKDIR /opt/rh/apache-tomcat-7.0.69

RUN chmod +x bin/*.sh

#
# DEPLLY dentro webapps
#
#
# ADD deploy.war /opt/rh/apache-tomcat-7.0.69/webapps/
#


ENV JAVA_OPTS="-Djava.net.preferIPv4Stack=true"

ENTRYPOINT ["./bin/catalina.sh"]

CMD ["run"]
