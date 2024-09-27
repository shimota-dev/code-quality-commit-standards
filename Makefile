.PHONY: all prettier eslint git husky lint-staged commitlint
# eslintとprettierによるlinterとformatterの初期設定方法
all: prettier eslint husky lint-staged commitlint

prettier:
	npm install --save-dev --save-exact prettier
	node --eval "fs.writeFileSync('.prettierrc','{}\n')"
	node --eval "fs.writeFileSync('.prettierignore','# Ignore artifacts:\nbuild\ncoverage\n')"

eslint:

git:
	git init

husky:
	npm install --save-dev husky
	npx husky init
# .husky/pre-commitに実行したいformatter,linterのコマンドを書く。

lint-staged:
	npm install --save-dev lint-staged
	echo "npx lint-staged" > .husky/pre-commit
# eslintとprettierをlint-stagedで実行する設定を加える。
	echo -e '{\n  "*.{ts,tsx}": "eslint",\n  "*.{js,jsx,ts,tsx,md,html,css}": "prettier --write"\n}' > .lintstagedrc.json

commitlint:
	npm install --save-dev @commitlint/{cli,config-conventional}
	echo "export default { extends: ['@commitlint/config-conventional'] };" > commitlint.config.js
	echo "npx --no -- commitlint --edit \$$1" > .husky/commit-msg
