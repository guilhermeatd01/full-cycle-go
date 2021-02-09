FROM golang:1.15-alpine3.13 as builder

WORKDIR /go/src/app
COPY app.go .
RUN go build -ldflags "-s -w" app.go

FROM scratch
COPY --from=builder /go/src/app .
CMD ["./app"]  