.DEFAULT_GOAL := everything

wasm: client/programs/1/bigprimes.go
	 cd client/programs/1/ && GOOS=js GOARCH=wasm go build -o main.wasm

# not really a command but ez way to store commands so
staticserve:
	@# do go get -u github.com/shurcooL/goexec first
	@echo "go to localhost:8080"
	@goexec 'http.ListenAndServe("0.0.0.0:8080", http.FileServer(http.Dir("./client")))'
	
