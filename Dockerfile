# Stage 0 <F4> build artifact from source
FROM maven:3.8.3-openjdk-17 AS BUILD
WORKDIR /app
COPY .  .
RUN mvn package -DskipTests

# stage 1 package app to run

FROM openjdk:18-alpine AS RUN
WORKDIR /run
COPY --from=BUILD /app/target/demo-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 8080
CMD java  -jar /run/demo.jar
