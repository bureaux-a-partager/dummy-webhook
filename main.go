package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, r *http.Request) {
	body, _ := ioutil.ReadAll(r.Body)
	fmt.Printf("Request %s %s\n", r.Method, body)
	w.Write([]byte("ok"))
}

func main() {
	http.HandleFunc("/", handler)
	port := os.Getenv("PORT")

	fmt.Printf("Listening on port %s\n", port)
	if err := http.ListenAndServe(fmt.Sprintf(":%s", port), nil); err != nil {
		panic(err)
	}
}
