set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' 
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" map key
imap jj <Esc>
set nu
syntax enable
set background=dark
colorscheme desert
set ts=4
set expandtab
" set noswapfile
set showmatch
set hlsearch
set incsearch
filetype plugin on
filetype indent on
%retab!
" 使用系统剪切板
set clipboard=unnamed


" NERDTree
" modified show map
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
" window position
let g:NERDTreeWinPos='left'
" window size
let g:NERDTreeWinSize=28
" window show line number
let g:NERDTreeShowLineNumbers=0
" don't show hidden files
let g:NERDTreeShowHidden=1
" beautiful
let g:NERDChristmasTree=0
noremap <c-n> :NERDTreeToggle<cr>

let mapleader=","

" 打开文件时 恢复光标位置
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" 行尾编辑
set virtualedit=all

" ,l 
nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
" 当前行显示
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
nnoremap <leader>q :q<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>w :w<cr>

" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set hidden
