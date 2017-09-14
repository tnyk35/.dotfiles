"-------------------------------------------------
" バンドル管理 dein
"-------------------------------------------------
filetype off
" deinパス設定
let s:dein_dir = fnamemodify('~/.vim/dein/', ':p')
let s:dein_repo_dir = s:dein_dir . 'repos/github.com/Shougo/dein.vim'

" dein.vim本体の存在チェックとインストール
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' shellescape(s:dein_repo_dir)
endif

" dein.vim本体をランタイムパスに追加
if &runtimepath !~# '/dein.vim'
  execute 'set runtimepath^=' . s:dein_repo_dir
endif


call dein#begin(s:dein_dir)

" dein.vim 自体も管理
call dein#add('Shougo/dein.vim')

"###### neocomplcache設定 ######
call dein#add('Shougo/neocomplcache.vim')
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dictionaries/php.dict filetype=php
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'

"###### unite.vim設定 ######
" ファイルオープンを便利に
call dein#add('Shougo/unite.vim')
" Unite.vimで最近使ったファイルを表示できるようにする
call dein#add('Shougo/neomru.vim')
call dein#add('ujihisa/unite-colorscheme')
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"###### NERDTree設定 ######
call dein#add('scrooloose/nerdtree')
" Ctrl+eで表示
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

"###### syntastic設定 ######
call dein#add('scrooloose/syntastic')
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1
" なんでか分からないけど php コマンドのオプションを上書かないと動かなかった
let g:syntastic_php_php_args = '-l'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"###### vim-indent-guides設定 ######
" インデントに色を付けて見やすくする
call dein#add('nathanaelkane/vim-indent-guides')
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=240
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=235
let g:indent_guides_guide_size=1

"###### neosnippet設定 ######
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"
" For snippet_complete marker.
if has('conceal')
	set conceallevel=2 concealcursor=i
endif

"###### auto-ctags設定 ######
call dein#add('soramugi/auto-ctags.vim')
let g:auto_ctags=0 "ctags自動実行のON/OFF


"###### emmet設定 ######
call dein#add('mattn/emmet-vim')
let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_settings = {
    \    'variables': {
    \      'lang': "ja"
    \    }
    \ }

"###### dbext設定 ######
call dein#add('vim-scripts/dbext.vim')


"###### sublimetextみたいなファイル検索 ######
call dein#add("ctrlpvim/ctrlp.vim")

"###### vimのステータスバーの拡張 ######
call dein#add('itchyny/lightline.vim')

"###### colorscheme ######
" jellybeans
call dein#add('nanotech/jellybeans.vim')

"###### コメントアウトプラグイン ######
call dein#add('tomtom/tcomment_vim')

"###### vim内でgitを使う ######
call dein#add('tpope/vim-fugitive')

"###### pugのシンタックス ######
call dein#add('digitaltoad/vim-pug')

call dein#end()
call dein#save_state()

"ファイル形式別プラグインのロードを有効化
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
if dein#check_install()
  call dein#install()
endif

"-------------------------------------------------
" 基本設定
"-------------------------------------------------
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set tabstop=2 "インデントをスペース2つ分に設定
set shiftwidth=2
set expandtab "ソフトタブ（半角スペース）を有効
set autoindent "オートインデント
set smartindent "オートインデント
set clipboard+=unnamed "コピペがOS依存でできる
set backspace=indent,eol,start "バックスペースが効かなくなるのを防ぐ
set timeoutlen=200 "キー連続入力受付時間(ms)
set ignorecase "検索時の大文字小文字区別無し
set laststatus=2 "下部のステータスを常に表示
set t_Co=256 "スクリーンカラー256色
set incsearch " インクリメンタルサーチ
set noswapfile "スワップファイル作成しない
"set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8 "文字コード自動認識
set fileencodings=sjis,utf-8 "文字コード自動認識

" ###### タグジャンプ（ctags併用） ######
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" ###### vimタブショートカット  ######
nnoremap <Tab> <Nop>
nnoremap <Tab> <C-w>w
nnoremap <s-Tab> <C-w>W
nnoremap <Tab>j <C-w>j
nnoremap <Tab>k <C-w>k
nnoremap <Tab>l <C-w>l
nnoremap <Tab>h <C-w>h
nnoremap <C-c> <C-w>c
nnoremap <C-x> <C-w>x

"画面分割時にcontrol + l, h, j, kで移動
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

"###### ステータスラインに表示 ######
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%F%m%r%h%w\ [LEN=%L]

"###### 検索ハイライト ######
"ESC連打でハイライト解除
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"###### 括弧補完 ######
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

"###### 閉じタグ補完 ######
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
"  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END

" ###### 全角スペース可視化 ######
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=160 guibg=#990000
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
"###### colorscheme設定 ######
set background=dark
colorscheme jellybeans
"見やすい色に変更
hi CursorColumn term=reverse ctermbg=240 guibg=#1c1c1c
hi CursorLine term=underline ctermbg=240 guibg=#1c1c1c
hi Title term=bold cterm=bold ctermfg=188 gui=bold guifg=#70b950
hi Search term=reverse cterm=underline ctermfg=16 ctermbg=217 gui=underline guifg=#f0a0c0 guibg=#302028

"###### ファイルタイプ ######
autocmd BufNewFile,BufRead *.pug setlocal ft=pug
