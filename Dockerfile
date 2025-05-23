# Stage 1: Build the application
FROM maven:3.8.5-openjdk-11 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the app with Tomcat
FROM tomcat:9.0
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/calculator.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
