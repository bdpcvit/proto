# Default target.
all: clean gen

gen: ./proto/sso/*.proto
	@echo "Start generating code from the model"
	protoc -I proto .\proto\sso\sso.proto --go_out=.\gen\go --go_opt=paths=source_relative --go-grpc_out=.\gen\go  --go-grpc_opt=paths=source_relative
	@echo "End generating code from the model"

clean: 
	del /S /F .\gen\go\*.go

Default: all