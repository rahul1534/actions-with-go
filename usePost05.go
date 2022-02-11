package main

import (
	"fmt"
	"os"

	"github.com/rahul1534/post05"
)

var VERSION string

func main() {
	post05.Hostname = "localhost"
	fmt.Println(post05.Port)
	fmt.Println(post05.Hostname)

	if len(os.Args) == 2 {
		if os.Args[1] == "version" {
			fmt.Println("Version:", VERSION)
		}
	}
}
