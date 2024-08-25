# TypeScriptとReactでの初期設定
.PHONY: all npm shell
all: npm shell

npm:
	git init
	npm install --save-dev --save-exact prettier
	npm install --save-dev husky lint-staged @commitlint/{cli,config-conventional}
	npx husky init

shell:
	chmod +x setup-config.sh
	./setup-config.sh
