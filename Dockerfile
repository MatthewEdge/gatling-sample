FROM maven:3.6-jdk-8-alpine
WORKDIR /usr/src/app

# Cache dependencies
COPY pom.xml /usr/src/app/pom.xml
RUN mvn dependency:go-offline clean compile

# Execute
COPY src /usr/src/app/src

ARG BASE_URL="http://localhost:8080"
CMD ["mvn", "test", "-DbaseUrl=${BASE_URL}"]
