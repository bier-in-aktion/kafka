#!/bin/sh

# Wait for kafka to start
sleep 20

/opt/kafka/bin/kafka-topics.sh \
    --create \
    --bootstrap-server kafka-1:19092 \
    --replication-factor 3 \
    --partitions 6 \
    --topic products \
    --config min.insync.replicas=2 \
    --config retention.ms=86400000
