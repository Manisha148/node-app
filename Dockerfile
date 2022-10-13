FROM ubuntu:20.04

WORKDIR /app
ADD target/shopfront-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
COPY requirements.txt requirements.txt
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip install flask==2.1.*
COPY . .
ENV FLASK_APP=app
EXPOSE 9090
CMD [ "python3", "-m" , "mvn", "run", "--host=0.0.0.0 --port 9090"]


