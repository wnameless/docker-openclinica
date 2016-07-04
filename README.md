docker-openclinica
============================
Dockerfile of OpenClinica

This **Dockerfile** is an [auto build](https://hub.docker.com/r/wnameless/openclinica/) of [Docker Hub](https://hub.docker.com/).

### Installation
```
docker pull wnameless/openclinica
```

### [Important] Rebuild with following Dockerfile before you run this image:
```
FROM wnameless/openclinica

# The datainfo.properties contains all the configurations of OpenClinica
# Please fill up your proper configurations first
# You can find the template in this git repo
COPY datainfo.properties /usr/local/tomcat/webapps/OpenClinica/WEB-INF/classes/datainfo.properties
```

[Optional] If you have your own i18n files, you can replace the default one by adding:
```
# The i18n folder should contains all the OpenClinica i18n files
COPY i18n /usr/local/tomcat/webapps/OpenClinica/WEB-INF/classes/org/akaza/openclinica/i18n
```

Start openclinica with openclinica-db:
```
docker pull wnameless/openclinica-db
docker network create openclinica-nw
docker run -d --name openclinica-db --net openclinica-nw openclinica-db
docker run -d --name openclinica --net openclinica-nw -p 8080:8080 your_openclinica_image_name
```

See also [OpenClinica DB image](https://hub.docker.com/r/wnameless/openclinica-db/)
