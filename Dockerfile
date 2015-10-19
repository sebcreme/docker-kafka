FROM java:8
MAINTAINER CRAFT AI Team <contact@craft.ai>

RUN apt-get update && apt-get install -y zookeeper supervisor dnsutils rsyslog


ADD kafka_2.10-0.8.2.0.tgz /opt/
ENV KAFKA_HOME /opt/kafka_2.10-0.8.2.0
ENV ADVERTISED_HOST 192.168.99.100

# Supervisor Conf

ADD supervisor_kafka.conf /etc/supervisor/conf.d/kafka.conf
ADD supervisor_zookeeper.conf /etc/supervisor/conf.d/zookeeper.conf

#ADD server.properties /opt/kafka_2.10-0.8.2.0/config/server.properties
ADD start-kafka.sh /usr/bin/start-kafka.sh


# 2181 is zookeeper, 9092 is kafka
EXPOSE 2181 9092

CMD ["supervisord", "-n"]