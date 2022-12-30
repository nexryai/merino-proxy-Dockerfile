FROM rust:alpine as builder

WORKDIR build

RUN apk add --no-cache musl-dev git \
 && git clone https://github.com/ajmwagar/merino \
 && cd merino \
 && cargo build --release \
 && cd / \
 && mkdir /app \
 && mv ./build/merino/target/release/merino ./app/


FROM alpine:latest

COPY --from=builder /app /app

RUN addgroup app \
 && adduser -D -h /app -s /bin/sh -G app app \
 && chown -R app:app /app
 
CMD ["su", "app", "-c", "/app/merino -i 0.0.0.0 --allow-insecure --users /app/users.csv"]
