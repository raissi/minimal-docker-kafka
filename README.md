This is a simple Kafka image for Docker inspired from _https://github.com/spotify/docker-kafka_\\
The difference is that this image is compliant with Apache Kafka version *0.10.0.1* especially with the deprecation of properties:\\ 
- advertised.host.name and
- advertised.port 
See http://kafka.apache.org/documentation.html#brokerconfigs

This image is very minimalistic, it only installs Kafka as in http://kafka.apache.org/documentation.html#quickstart .\\
To use it:
## 1. Download or clone the source code of this repository: 
```git
git clone https://github.com/raissi/minimal-docker-kafka.git
```
## 2. Go under the created folder _minimal-docker-kafka_ and build the Docker image:
```
docker build --tag="$USER/kafka" .
```
Check the image is created successfully by running:
```
docker images
```
you should see the newly created image with the name (_REPOSITORY_ column): *yourUserName/kafka*

## 3. Run the image:
```
docker run --name docker-kafka -p 2181:2181 -p 9092:9092  -it -h kafkaHost $USER/kafka
```
you should see in the console the Kafka server running\\
Please notice that we passed a custom name (_kafkaHost_) as host name for the Docker container. Kafka will use the host name when trying to get topics metadata.\\
Check Kafka is running fine inside the container:
```
docker exec -ti docker-kafka bash -c "/opt/kafka_*/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 4 --topic test"
```
You should see _Created topic "test"._\\
## 4. Connect to the Kafka server from host:
The container host name must be added to the list of hosts so it can be accessed from outside docker:
```
127.0.0.1       kafkaHost
```
Now you can play with the Kafka server, using the producer/consumer sample scripts contained in downloaded binaries:
```
bin/kafka-console-producer.sh --broker-list kafkaHost:9092 --topic test
bin/kafka-console-consumer.sh --zookeeper kafkaHost:2181 --topic test --from-beginning
```

Enjoy!!
