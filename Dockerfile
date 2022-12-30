FROM rust:alpine

RUN addgroup app \
 && adduser -D -h /app -s /bin/sh -G app app \
 && apk add --no-cache musl-dev \
 && cargo install merino \
 && apk del musl-dev

CMD ["su", "app", "-c", "merino -i 0.0.0.0 --users /app/users.csv"]
