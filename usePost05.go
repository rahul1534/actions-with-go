package main

import (
	"fmt"

	"github.com/rahul1534/post05"
)

func main() {
	post05.Hostname = "localhost"
	fmt.Println(post05.Port)
	fmt.Println(post05.Hostname)
}