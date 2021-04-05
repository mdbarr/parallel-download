FROM golang as builder

WORKDIR /pd

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o parallel-download


FROM alpine

RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*

COPY --from=builder /pd/parallel-download /parallel-download

CMD [ "/parallel-download" ]
