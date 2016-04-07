 "----------------------------
 "All Required
 if has('vim_starting')
   set nocompatible               " Be iMproved
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif


call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\    'windows' : 'tools\\update-dll-mingw',
\    'cygwin' : 'make -f make_cygwin.mak',
\    'mac' : 'make -f make_mac.mak',
\    'linux' : 'make',
\    'unix' : 'gmake',
\   }
\ }

"Language Syntax
NeoBundle 'scrooloose/syntastic'
NeoBundle 'StanAngeloff/php.vim'
NeoBundle 'arnaud-lb/vim-php-namespace'
NeoBundle 'elzr/vim-json'

"Complection & Snippet
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

"Tool Package
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'ntpeters/vim-better-whitespace'
NeoBundle 'vasconcelloslf/vim-foldfocus'
NeoBundle 'Lokaltog/vim-powerline'

"Scheme
NeoBundle 'tomasr/molokai'


call neobundle#end()


"--------------plug setting----------------------"
"---------php.vim-------------------------
"let g:php_syntax_extensions_enabled

"---------vim-json------------------------
let g:indentLine_noConcealCursor=""

"---------neocomplcache.vim---------------
let g:neocomplcache_enable_at_startup = 1

"---------NERDTreeTabs setting-----------------
let g:nerdtree_tabs_open_on_console_startup=1
nnoremap <F1> :NERDTreeTabsToggle<CR>

"---------neosnippet.vim------------------
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet'

"----------vim-indent-guides--------------
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
"hi IndentGuidesOdd  guibg=red   ctermbg=236
"hi IndentGuidesEven guibg=green ctermbg=236
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

"-------------indent line-------------------
let g:indentLine_color_term = 239
let g:indentLine_char = '｜'
nnoremap <F4> :IndentLinesToggle<CR>
"--------------better white-----------------
nnoremap <F2> :CurrentLineWhitespaceOn<CR>
nnoremap <F3> :StripWhitespace<CR>
nnoremap <F5> :ToggleWhitespace<CR>

"----------------syntastic-------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"--------------vim foldfocus-----------------
nmap <C-a> :call FoldFocus('e')<CR>
nmap <C-z> :call FoldFocus('vnew')<CR>

"---------------scrollcolors-------------------
 "keybinding: ,cn - Scroll next colorscheme
 nmap <C-n> :NEXTCOLOR<CR>
 "keybinding: ,cp - Scroll previous colorscheme
 nmap <C-p> :PREVCOLOR<CR>

"---------------vim-powerline-------------------
 let g:Powerline_symbols = 'fancy'

"----------------scheme------------------------
let g:molokai_original = 1



"Base Setting
set nobackup
set nocompatible
set encoding=utf-8

"View Setting
syntax on
set ffs=unix,dos,mac
set cursorline
set nu
set ru
set ic
set ai
set si
set wrap
set ruler
set paste
set mouse=a
set hlsearch
set smartindent
set history=50
set showcmd
set showmatch
set cmdheight=2
set backspace=2
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab

set guifont=Monaco:h14  " 設定字體樣式及大小。

colorscheme molokai

set statusline=%{GitBranchInfoString()}%<%f\ %m%=\ %h%r\ %-19([%p%%]\ %3l,%02c%03V%)%y   "設定狀態列
highlight StatusLine term=bold,reverse cterm=bold,reverse    "設定狀態列

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" 存檔時移除多的空白區塊
autocmd BufWritePre * :%s/\s\+$//e

"------------------------------------

"判定目前系統類型, 決定載入的檔案方式 ....目前無效果Orz
if(has("win32") || has("win95") || has("win64") || has("win16"))
  source $vim/vimrcs/tool-vimrc
  source $vim/vimrcs/map-vimrc
elseif (has("unix") || has("mac"))
  "source ~/.vim/vimrcs/tool-vimrc
  "source ~/.vim/vimrcs/map-vimrc
endif



 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck


"php.vim highlight setting
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
