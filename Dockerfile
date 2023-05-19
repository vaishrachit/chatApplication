
#
# Build stage
#
FROM maven:3.8.2-jdk-8 AS build
COPY . .
RUN mvn clean package -DskipTests

#
# Package stage
#

FROM openjdk:8
EXPOSE 9090
COPY --from=build /target/chat-service-docker.jar chat-service-docker.jar
ENTRYPOINT [ "java","-jar","chat-service-docker.jar" ]