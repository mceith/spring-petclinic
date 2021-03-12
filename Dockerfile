#FROM amazoncorretto
FROM 489478819445.dkr.ecr.eu-west-1.amazonaws.com/amazoncorretto:latest
VOLUME /tmp
ARG JAR_FILE
ADD ./target/${JAR_FILE} app.jar
RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar --spring.datasource.initialization-mode=always" ]