#!/bin/bash

# 設定ファイルのソースディレクトリ
# 以下のディレクトリをコピー元とすれば良い。
# https://github.com/shimota-dev/code-quality-commit-standards/

SOURCE_DIR="origin/dir"

# .prettierrcのコピー
cp "$SOURCE_DIR/.prettierrc" .

# .prettierignoreのコピー
cp "$SOURCE_DIR/.prettierignore" .

# .lintstagedrc.jsonのコピー
cp "$SOURCE_DIR/.lintstagedrc.json" .

# commitlint.config.jsのコピー
cp "$SOURCE_DIR/commitlint.config.js" .

# .huskyディレクトリの作成
mkdir -p .husky

# .husky/commit-msgのコピー
cp "$SOURCE_DIR/husky/commit-msg" .husky/

# .husky/pre-commitのコピー
cp "$SOURCE_DIR/husky/pre-commit" .husky/

echo "設定ファイルのコピーが完了しました。"
