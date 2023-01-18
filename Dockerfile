# Use an official openjdk image as the base image
FROM openjdk:11-jdk-slim-buster

LABEL maintainer = "Apurva Bansode"

# Set the working directory in the container to /app
WORKDIR /app

# Copy the JAR file and other resources into the container
COPY target/eurekaserver-0.0.1-SNAPSHOT.jar .
COPY src/main/resources/application.properties .

# Expose the port that the application runs on
EXPOSE 8761

# Start the application
CMD ["java", "-jar", "eurekaserver-0.0.1-SNAPSHOT.jar"]
