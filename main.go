package main

import (
	"fmt"
	"net/http"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello World dari Golang! Setup DevOps Sesi 20 Berhasil.")
}

func main() {
	http.HandleFunc("/", helloHandler)
	fmt.Println("Server Golang berjalan di port 8080...")
	// Jalankan server di port 8080
	if err := http.ListenAndServe(":8080", nil); err != nil {
		fmt.Printf("Gagal menjalankan server: %v\n", err)
	}
}