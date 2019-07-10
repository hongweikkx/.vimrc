set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' 
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'Yggdroot/LeaderF'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-unimpaired'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-repeat'
Plugin 'dyng/ctrlsf.vim'
Plugin 'rking/ag.vim'
Plugin 'mhinz/vim-signify'
Plugin 'scrooloose/nerdcommenter'


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

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:go_fmt_command = "goimports"


"这里定义了 CTRL+P 在当前项目目录打开文件搜索，CTRL+N 打开 MRU搜索，搜索你最近打开的文件，这两项是我用的最频繁的功能。接着 ALT+P 打开函数搜索，ALT+N 打开 Buffer 搜索
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-m> :LeaderfMru<cr>
" noremap <c-j> :LeaderfFunction!<cr>
" noremap <O-b> :LeaderfBuffer<cr>
" noremap <O-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
" you complete me
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone
noremap <c-z> <NOP>
let g:ycm_semantic_triggers =  { 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'], 'cs,lua,javascript': ['re!\w{2}'], }

"ALE 动态检查
let g:ale_linters = 1
let g:ale_linters_explicit = 0
let g:ale_completion_delay = 500 
let g:ale_echo_delay = 20 
let g:ale_lint_delay = 500 
let g:ale_echo_msg_format = '[%linter%] %code: %%s' 
let g:ale_lint_on_text_changed = 'normal' 
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1 
let g:ale_linters = {'go': ['gofmt', 'golint', 'go vet']}
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

set tags=./.tags;,.tags

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif


" Plugin 'majutsushi/tagbar'
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
nmap <c-k> :TagbarToggle<CR>

" ag.vim
let g:ag_working_path_mode="r"
" ctrlsf find
let g:ctrlsf_default_root = 'project' 
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ctrlsf_ackprg = 'ag'
vmap  <c-f> <Plug>CtrlSFVwordPath
let g:ctrlsf_search_mode = 'async'
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_regex_pattern = 1
let g:ctrlsf_winsize = '30%'

" nerdcomment
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

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
set nowrapscan " 禁止在搜索到文件两端时重新搜索

inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O

