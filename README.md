# dotfiles
黒い画面とうまく戯れる

## 構成
- iterm2
- zsh
- tmux
- vim

を使用すること前提の設定をまとめている

## 適用方法
- 詳しくはこちら　https://github.com/tnyk35/dotfiles/wiki/%E4%BD%9C%E6%A5%AD%E3%83%A1%E3%83%A2

## iterm2
- \/iterm2-color にiterm2用のカラースキームを用意（material-design-colors）

## zsh
- Oh-my-zshを利用
- peco設定、Auto_cd無効化、PATH有効化など

## tmux
- ステータスバーを上側に表示

### 操作方法
- prefixキー：Ctrl+q
- ペイン移動：shift+上下左右キー
- コピーモード：prefix+v
- コピーモード時の範囲選択はvimと使い勝手が同じ vキーで選択→y OR Enterでコピー
- ペースト：p or cmd+v

## vim
- インデント：半角スペース2つになっている（TODO:拡張子ごとに設定できるようにする）
- コピペがOS依存でできる
- 文字コード自動認識：sjisとutf-8のみ （TODO：もうちょいうまく適用できるようにする）
- 閉じタグ、括弧補完、全角スペース可視化
- バンドル管理はNeoBundle→dein　に変更
  - neocomplcache
  - unite（いろいろ出来る）
  - NERDTree（ディレクトリメニュー）
  - syntastic（構文エラー実装）
  - vim-indent-guides（インデント見やすくする）
  - neosnippet（スニペット強化）
  - auto-ctags（タグ一覧。無効化してある。使いたい場合は有効化する）
  - emmet（HTMLコーディング強化）
  - dbext（DB周りの設定）
  - ctrlp（検索を使いやすくする）
  - lightline（ステータスバー）
  - tcomment_vim（コメントアウトショートカット）
  - vim-fugitive（vim内でgitが使える）
  - vim-pug（pugファイル認識）
  - nerdtree-git-plugin（NERDTreeでgitのstatusがみれるようになる）
  - ag.vim（NERDTreeでの検索）←導入方法はwiki参照
  - jellybeans（カラースキームなので好きなものに変更する）

### 操作方法
※基本ノーマルモード時の操作
- タグジャンプ（ctag有効時のみ）：ctrl+h、ctrl+k
- タブ移動：tab、shift+tab
- 検索ハイライト取り消し：Esc2回押し
- ファイル一覧表示（unite）：ctrl+n
- 最近使ったファイル表示（unite）：ctrl+z
- 検索ハイライト取り消し：Esc2回押し
- コメントアウト：ctrl+/2回押し
- NERDTree表示/非表示：ctrl+e
- NERDTreeでの検索:m→g
