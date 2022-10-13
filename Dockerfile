FROM ubuntu:20.04

WORKDIR /app

RUN apt-get update && apt-get install -y maven
COPY . .
ENV mvn=app
EXPOSE 9090
CMD [ "mvn", "-m" , "run", "--host=0.0.0.0 --port 9090"]
