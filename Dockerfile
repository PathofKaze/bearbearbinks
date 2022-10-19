FROM maven:3-openjdk-17

#Create a working directory
WORKDIR /app

#Copy the files into the contrainer
COPY pom.xml .
COPY mvnw .
COPY mvnw.cmd .
COPY src src

#Build
RUN mvn package -Dmaven.test.skip=true

#Define environment variables
ENV ENV_INSTANCE_NAME="Dov-bear"
ENV ENV_INSTANCE_HASH="1"

#Expose server port
EXPOSE 8080

#running the program
ENTRYPOINT java -jar target/dovbear-0.0.1-SNAPSHOT.jar



