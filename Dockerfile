# Stage 1: Build the Java WAR with Maven
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the WAR inside Tomcat
FROM tomcat:9.0
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/calculator.war


