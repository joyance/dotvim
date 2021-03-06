" Enable Pathogen
execute pathogen#infect('modules/{}')

" FileType On
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
syntax on

" Load powerline plugin
set laststatus=2
if has("unix")
  set t_Co=256
  set runtimepath+=~/.vim/modules/powerline/powerline/bindings/vim
elseif has("win32")
  source $VIM/_vimrc
  set langmenu=en_US
  set encoding=utf-8
  let $LANG='en_US'
  if has("gui_win32") || has("gui_win32s")
    set runtimepath+=~\vimfiles\modules\powerline\powerline\bindings\vim
    set guifont=Inconsolata\ for\ Powerline:h12,Fixedsys:h12,Consolas:h12
    set guioptions-=m
    set guioptions-=T
  endif
endif

" Set desert as default color scheme
" set background=light
" colorscheme desert
" call togglebg#map("<F5>")

" Autocmd to markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Autocmd to php
if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END
endif

" Some text settings
set sw=2
set ts=2
set expandtab
set hlsearch
set incsearch
set wildmenu
set smartindent
set cindent
set nu

" Match parentheses, 1matchtime = 1/10s
set showmatch
set matchtime=5

" No backup and swap file
set nobackup
set noswapfile

" Some editing settings
set backspace=2

" Disable annoying bell
set noeb vb t_vb=
autocmd GUIEnter * set vb t_vb=

" Set html shift width
au FileType html,vim,javascript setl shiftwidth=2
au FileType html,vim,javascript setl tabstop=2

" Mappings
let mapleader="\<Space>"
map <Leader>t   <Esc>:w!<CR>:!perl -d %<CR>
map <Leader>q   <Esc>:w!<CR>:!perl %<CR>
map <Leader>/   <Esc>*:vimgrep /<C-R>// **/*<CR>
map <Leader>fj  :%!python -m json.tool<CR>
nmap <Leader>a  :w!<CR>:!python %<CR>
nmap <Leader>c  :w!<CR>:!perl -c %<CR>
nmap <Leader>d  :w!<CR>:bd<CR>
nmap <Leader>e  :TlistOpen<CR>
nmap <Leader>n  :w!<CR>:bn<CR>
nmap <Leader>v  :tabedit $MYVIMRC<CR>
nmap <Leader>w  :w !sudo tee %<CR>
vmap <Leader>r  :w !sh<CR>

" Mappings inspired by @sheerun
nnoremap <CR> G
nnoremap <BS> gg

" Mappings for Tabular
vmap <Leader>= :Tab /=<CR>
vmap <Leader>T :Tab /=><CR>

" Mappings for vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" " Dbext settings
" let g:dbext_default_SQLITE_bin = 'sqlite3'
" let g:dbext_default_profile_sqlite = 'type=SQLITE:dbname=~/sqlite.db'
" " #--dbext:profile=sqlite
" let g:dbext_default_MYSQL_bin = 'mysql'
" let g:dbext_default_profile_mysql= 'type=MYSQL:user=lirian:dbname=db'
" " #--dbext:profile=mysql

" csv.vim
let b:csv_headerline=0
let g:csv_delim='|'
hi CSVColumnEven ctermbg=0
hi CSVColumnOdd  ctermbg=0

" emmet settings
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" add trailing space to line up to 150 length
" :%s/$/\=repeat(" ", 150-virtcol("$"))

" hightlight trailing whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
