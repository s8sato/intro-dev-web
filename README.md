# Web開発の雰囲気
- [Web開発の雰囲気](#web開発の雰囲気)
  - [コミュニケーションの確保](#コミュニケーションの確保)
    - [Google Meet](#google-meet)
    - [Slack](#slack)
  - [開発環境の準備](#開発環境の準備)
    - [WSL2](#wsl2)
    - [Ubuntu 20.04 LTS](#ubuntu-2004-lts)
    - [VS Code](#vs-code)
    - [Rust](#rust)
    - [Elm](#elm)
    - [sass](#sass)
    - [PostgreSQL](#postgresql)
  - [アプリを動かす](#アプリを動かす)
    - [Sprig ソースコードの入手](#sprig-ソースコードの入手)
    - [環境変数の注入](#環境変数の注入)
    - [/web コンパイル](#web-コンパイル)
    - [/api コンパイル](#api-コンパイル)
    - [/api データベースの準備](#api-データベースの準備)
      - [起動と作成](#起動と作成)
      - [マイグレーション](#マイグレーション)
    - [アプリ起動](#アプリ起動)
  - [改造してみる](#改造してみる)
    - [/web フロントエンド](#web-フロントエンド)
    - [/api バックエンド](#api-バックエンド)

[Google_Meet]: https://meet.google.com/
[Slack]: https://slack.com/
[WSL2]: https://docs.microsoft.com/ja-jp/windows/wsl/install-win10
[Ubuntu_20.04_LTS]: https://www.microsoft.com/ja-jp/p/ubuntu-2004-lts/9n6svws3rx71
[VS_Code]: https://code.visualstudio.com/
[Rust]: https://www.rust-lang.org/ja/
[Elm]: https://guide.elm-lang.jp/install/elm.html
[PostgreSQL]: https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart-ja
[Sprig]: https://github.com/s8sato/sprig


## コミュニケーションの確保
### [Google Meet][Google_Meet]
* 通話と画面共有のため
### [Slack][Slack]
* テキストチャットのため
## 開発環境の準備
### [WSL2][WSL2]
### [Ubuntu 20.04 LTS][Ubuntu_20.04_LTS]
### [VS Code][VS_Code]
### [Rust][Rust]
```
cargo --version
```
> cargo 1.55.0 (32da73ab1 2021-08-23)
### [Elm][Elm]
```
elm --version
```
> 0.19.1
### sass
```
curl -L -o sass.tar.gz https://github.com/sass/dart-sass/releases/download/1.42.1/dart-sass-1.42.1-linux-x64.tar.gz
```
```
tar -zxvf sass.tar.gz dart-sass/sass
```
```
sudo mv dart-sass/sass /usr/local/bin/
```

```
sass --version
```
> 1.42.1

```
rm -r dart-sass sass.tar.gz
```
### [PostgreSQL][PostgreSQL]
* __ステップ1__ のみ
## アプリを動かす
### [Sprig][Sprig] ソースコードの入手
```
cd ~
```
```
mkdir works
```
```
cd works
```
```
git clone -b intro --recurse-submodules https://github.com/s8sato/sprig.git
```
```
code sprig
```
### 環境変数の注入
```
cd ~/works
```
```
git clone https://github.com/s8sato/intro-dev-web.git
```
```
mv intro-dev-web/init.local.sh sprig/
```
```
cd sprig
```
```
bash init.local.sh
```
### /web コンパイル
```
cd ~/works/sprig/web
```
```
sass src/scss/style.scss style.css
```
```
elm make src/Main.elm --output=elm.js
```
### /api コンパイル
```
cd ~/works/sprig/api
```
```
sudo apt install build-essential pkg-config ca-certificates libssl-dev libpq-dev
```
```
cargo build
```
### /api データベースの準備
```
cd ~/works/sprig/api
```
#### 起動と作成
```
sudo pg_ctlcluster 12 main start
```
```
sudo -u postgres createdb sprig_my
```
```
sudo -u postgres psql sprig_my
```
```
ALTER USER postgres WITH PASSWORD 'postgres';
```
```
\q
```
#### マイグレーション
```
cargo install diesel_cli --no-default-features --features postgres
```
```
diesel migration run
```
### アプリ起動
```
cd ~
```
```
mv works/intro-dev-web/sprig.sh .
```
```
bash sprig.sh
```
http://localhost:8000/index.html

## 改造してみる
### /web フロントエンド
* ロゴを入れる
### /api バックエンド
* `/coffee` コマンドの応答メッセージを変更
