#!/bin/sh

$KAFKA_HOME/bin/zookeeper-server-start.sh -daemon $KAFKA_HOME/config/zookeeper.properties &
sleep 5
# Run Kafka
$KAFKA_HOME/bin/kafka-server-start.sh  $KAFKA_HOME/config/server.properties 
