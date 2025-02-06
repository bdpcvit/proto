# Default target.
all: begin clean gen end

gen_code:
	@echo "Start generating code from the model"
	protoc -I proto .\proto\sso\sso.proto --go_out=.\gen\go --go_opt=paths=source_relative --go-grpc_out=.\gen\go  --go-grpc_opt=paths=source_relative
	@echo "End generating code from the model"

gen: begin clean gen_code end

begin:
	@echo "Start"

end:
	@echo "End!!!"

clean_list:
	del /S /F .\gen\go\*.go

clean: begin clean_list end
