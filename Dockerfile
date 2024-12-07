# Stage 1: Build the jar
FROM maven:3.8.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . /app
RUN mvn clean package -DskipTests

# Stage 2: Create the final image
FROM eclipse-temurin:17-alpine
COPY --from=build /app/target/*.jar hkotisk.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "hkotisk.jar"]
