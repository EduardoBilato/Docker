FROM golang:1.15 as builder
WORKDIR /go/src/duzera
COPY . .
RUN GOOS=linux go build -ldflags="-s -w"


FROM scratch
WORKDIR /go/src/duzera
COPY --from=builder /go/src/duzera .


CMD ["./duzera"]