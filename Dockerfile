#### Stage 1 - Build the JAR
FROM maven:3.8.3-openjdk-17 AS Builder

WORKDIR /app

COPY . .

RUN mvn clean install -DskipTests=true


#### Stage 2 - Execute the JAR obtained from Stage 1
#FROM openjdk:17-alpine
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

COPY --from=Builder /app/target/*.jar /app/expenseapp.jar

CMD ["java","-jar","expenseapp.jar"]
