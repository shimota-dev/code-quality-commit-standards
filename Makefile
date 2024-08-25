.PHONY: all eslint prettier
# eslintとprettierによるlinterとformatterの初期設定方法
all: eslint prettier husky lint-staged commitlint

# eslintを設定する。(デフォルトで入ってるときはいらない。)
eslint:

# prettierを設定する。
prettier:
	npm install --save-dev --save-exact prettier
	node --eval "fs.writeFileSync('.prettierrc','{}\n')"
	node --eval "fs.writeFileSync('.prettierignore','# Ignore artifacts:\nbuild\ncoverage\n')"

husky:
	npm install --save-dev husky
	npx husky init

lint-staged:
	npm install --save-dev lint-staged
	echo "npx lint-staged" > .husky/pre-commit
# eslintとprettierをlint-stagedで実行する設定を加える。
	echo -e '{\n  "*.{js,jsx}": "eslint",\n  "*.{js,jsx,ts,tsx,md,html,css}": "prettier --write"\n}' > .lintstagedrc.json

commitlint:
	npm install --save-dev @commitlint/{cli,config-conventional}
	echo "export default { extends: ['@commitlint/config-conventional'] };" > commitlint.config.js
	echo "npx --no -- commitlint --edit \$1" > .husky/commit-msg
