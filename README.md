# Bier in Aktion: Kafka Setup

## Running the setup

Run production with `docker compose up -d`.

For development purposes, run `docker compose -f docker-compose-dev.yml up -d`.

This additionally exposes [Kafka UI](https://github.com/provectus/kafka-ui) on port 8080.

## Topic Configuration

The `products` topic is configured as follows:

| key                   | value    | description                                                     |
| --------------------- | -------- | --------------------------------------------------------------- |
| `replication-factor`  | 3        | Replicate across all three nodes                                |
| `partitions`          | 6        | Allows higher parallelism if more shops are added in the future |
| `min.insync.replicas` | 2        | Require two replicas to allow one node to be down               |
| `retention.ms`        | 86400000 | Keep products for a day, to dismiss old promotions              |

As `key` for the topic `<prefix>-<productId>` is used, where `prefix` is the name of the shop and `productId` the UUID of the product.
