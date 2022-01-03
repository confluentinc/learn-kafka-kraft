docker-compose exec server-1 \
    kafka-reassign-partitions \
        --bootstrap-server server-1:39094 \
        --reassignment-json-file /tmp/reassign-topic-2-a.json \
        --execute

sleep 2

docker-compose exec server-1 \
    kafka-reassign-partitions \
        --bootstrap-server server-1:39094 \
        --reassignment-json-file /tmp/reassign-topic-1-b.json \
        --execute

sleep 2

docker-compose exec server-1 \
    kafka-reassign-partitions \
        --bootstrap-server server-1:39094 \
        --reassignment-json-file /tmp/reassign-topic-2-b.json \
        --execute

sleep 2

docker-compose exec server-1 \
    kafka-reassign-partitions \
        --bootstrap-server server-1:39094 \
        --reassignment-json-file /tmp/reassign-topic-1-a.json \
        --execute

sleep 2

docker-compose exec server-1 \
    kafka-reassign-partitions \
        --bootstrap-server server-1:39094 \
        --reassignment-json-file /tmp/reassign-topic-2-a.json \
        --execute
