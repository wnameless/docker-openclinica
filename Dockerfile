FROM tomcat:7.0-jre8

MAINTAINER Wei-Ming Wu <wnameless@gmail.com>

COPY OpenClinica*.war /usr/local/oc/install/OpenClinica.war

RUN cd /usr/local/oc/install && \
unzip OpenClinica.war -d OpenClinica && \
mv OpenClinica* /usr/local/tomcat/webapps

# COPY datainfo.properties /usr/local/tomcat/webapps/OpenClinica/WEB-INF/classes/datainfo.properties
# COPY i18n /usr/local/tomcat/webapps/OpenClinica/WEB-INF/classes/org/akaza/openclinica/i18n
