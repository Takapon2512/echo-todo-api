FROM golang:1.21-alpine

# アプリケーションディレクトリを設定
WORKDIR /app

# ホストのファイルをコンテナにコピー
COPY go.mod go.sum ./
RUN go mod download

COPY . .

# 開発者モードではビルドは行わず、直接 go run する
CMD ["go", "run", "main.go"]
