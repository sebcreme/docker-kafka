# docker-kafka

This a Docker for setting up a kafka cluster in dev env.


## How to start

- `npm install`
- build docker

```
docker build --tag craftai/kafka .
docker run -p 2181:2181 -p 9092:9092 -d --env ADVERTISED_HOST=`docker-machine ip default` --name="craftai_kafka" craftai/kafka
```
- test with node consumer and producer
```
node producer.js
node consumer.js
```
