# airport-watcher

Macにて、接続されたWiFiに応じてネットワーク環境を切り替えます。

雑な[Locamatic](https://macintoshgarden.org/apps/locamatic)です。

## 準備

リポジトリをcloneして中に移動します。

```shell
$ git clone https://github.com/pen/airport-watcher
$ cd airport-watcher
```

conf/airport-watcher.conf を作成して編集します。

```shell
$ cp conf/airport-watcher.conf{.sample,}
$ vi conf/airport-watcher.conf
```

`ネットワーク名 ␣ ネットワーク環境名` を並べてください。

ネットワーク名はWiFiのSSIDです。
`foo-5G` と `foo-2G` がある場合 `foo-*` のようにも書けます。

対応するネットワーク環境はMacのネットワーク環境設定で作成しておいてください。

## 起動・停止

```shell
$ ./script/install.sh
```

```shell
$ ./script/uninstall.sh
```

起動中はcloneしたディレクトリを消したり移動してはいけません。
