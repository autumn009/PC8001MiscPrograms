# PC8001MiscPrograms
Old misc programs for PC-8001

古い雑多なPC-8001用プログラムです。著作権的に問題なさそうなものを公開しています。

なお、プログラム中の英語はかなり間違ってます。

# 3DM diredctory
3DM.cmt/3DM.bas

　3次元表示の迷路

　操作方法はプログラム中で表示できます。

3DM2.0.cmt/3DM2.0.bas

　3次元表示の迷路の改良版。DMACに割り込んで描画中は前の画面を保持して一瞬で画面が切り替わったように見せかける。バグ入りでよく止まる。

　画面切り換え中にエラーで止まった場合は"width,"リターンで表示を復帰させる。

# MachineWiter diredctory
m3.cmt/m3.bas

　16進ダンプリストの入力支援ツール。雑誌I/Oの縦横チェックサムに対応します。

　起動したらhキーでコマンド一覧が出ます。

# mayoimichi diredctory
　2次元表示の迷路脱出ゲーム。

mayoi.cmt/mayoi.bas

mon-A000.cmt (マシン語パート)

　cload "mayoi"のあとmonリターンLリターンCtrl+BとしてRUN

　10個の文字が迷路中にあるのでそれを捜して10分以内に出口に出ます。

　迷路が大きく移動しないと全体像が見えません。ある道が抜けられるかどうかは行ってみないと分かりません。

　キー操作はプログラム中で表示されます。

　移動させると、選択のある場所まで自動的に移動します。

　マシン語パートは迷路作成に使われます。(大きな迷路作成は重い処理なので)

　運が悪いと迷路作成がハングする可能性があります。

# ここで公開していない主要なもの
他のgithubプロジェクトで公開しているものはここで公開していません。

ENIXなどで仕事で作成したものも公開していません。

他の主要なものは以下の通りです。

MINI-DOS/AZAS/AZA/SOCE関係 別途公開予定

FLEET COMMANDER ASCII掲載の他人のプログラムの改良品なので許可なく公開はできない

PROT+SSE PROTは自作ではない。汎用PC-8001で動作するバイナリーが見つかっていない

ロードオーバーインジアイランド　見つかっていない

UFOインターセプト　見つかっていない

大東京エイリアン　見つかっていない

カラスアタック　見つかっていない

グラビティインベーダー　見つかっていない
