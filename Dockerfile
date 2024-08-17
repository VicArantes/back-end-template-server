FROM maven:3.9.8 AS build
COPY . /app
WORKDIR /app
RUN mvn clean package

FROM openjdk:24-slim
WORKDIR /app
COPY --from=build /app/target/template-server-0.0.1-SNAPSHOT.jar /app/template-server.jar
ENTRYPOINT ["java", "-jar", "template-server.jar"]