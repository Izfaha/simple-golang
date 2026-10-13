FROM golang:1.27-alpine AS builder

# Tentukan direktori kerja di dalam container
WORKDIR /app

# Salin file modul dan kode utama ke dalam direktori kerja
COPY go.mod ./
COPY main.go ./

# Lakukan build aplikasi menjadi file biner bernama 'app-server'
RUN go build -o app-server .

FROM alpine:latest

# Tentukan direktori kerja
WORKDIR /root/

# Salin HANYA file biner hasil build dari tahap 1 (builder)
COPY --from=builder /app/app-server .

# Beritahu Docker bahwa aplikasi ini menggunakan port 8080
EXPOSE 8080

# Perintah yang dijalankan saat container menyala
CMD ["./app-server"]