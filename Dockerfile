FROM golang:1.21-alpine

# アプリケーションディレクトリを設定
WORKDIR /app

# パッケージリストの更新 (update) とシステムパッケージのアップグレード (upgrade) を実行
RUN apk update && apk upgrade

# GitをDockerイメージにインストール
RUN apk add git

# ホストのファイルをコンテナにコピー
COPY go.mod go.sum ./

# 依存関係のダウンロード
RUN go mod download

# ソースコードをコンテナにコピー
COPY . .

# 開発者モードではビルドは行わず、直接 go run する
CMD ["go", "run", "main.go"]
