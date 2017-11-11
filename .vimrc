" General Config
set nocompatible " 去掉vi的一致性 "
set number " 显示行号 "
set guioptions-=r " 隐藏右侧滚动条 "
set guioptions-=L " 隐藏左侧滚动条"
set guioptions-=b " 隐藏底部滚动条"
set showtabline=0 " 隐藏顶部标签栏 "
set guifont=Monaco:h13 " 设置字体 " 
syntax on " 开启语法高亮 "
set nowrap " 设置不折行 "
set fileformat=unix " 设置以unix的格式保存文件 "
set cindent " 设置C样式的缩进格式 "
set tabstop=4 " 设置table长度 "
set shiftwidth=4 " 同上 "
set expandtab " 用空格代替Tab "
set showmatch " 显示匹配的括号 "
set scrolloff=5 " 距离顶部和底部5行 "
set laststatus=2 " 命令行为两行 "
set fenc=utf-8 " 文件编码 "
set backspace=2 " Make the delete function same as other application " 
set mouse=a " 启用鼠标 "
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase " 忽略大小写 "
set incsearch " https://stackoverflow.com/questions/25635413/vim-incremental-search "
set hlsearch " 高亮搜索项 "
set whichwrap+=<,>,h,l,[,] " http://vim.wikia.com/wiki/Automatically_wrap_left_and_right "
set autoread
set cursorline " 突出显示当前行 "
"set cursorcolumn " 突出显示当前列 "

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" The bundles you install will be listed here
" Powerline 
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
" Directory Tree at left
Bundle 'scrooloose/nerdtree'
" Python Utilities - Automatic check code style, support virtualenv, etc. 
Bundle 'klen/python-mode'
" Display vertical lines at each indentation
Bundle 'Yggdroot/indentLine'
" Comment functions so powerful - no comment necessary
Bundle 'scrooloose/nerdcommenter'
" Auto code completion - ctrl + space
Bundle 'davidhalter/jedi-vim' 
" Search plugin
Bundle 'ctrlpvim/ctrlp.vim'
" Colorful parentheses
Bundle 'kien/rainbow_parentheses.vim'
" Tab auto completion
Bundle 'ervandew/supertab'
" Theme
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
" Code format checker
Bundle 'tell-k/vim-autopep8'
" Insert or delete brackets, parens, quotes in pair
Bundle 'jiangmiao/auto-pairs'

filetype plugin indent on

" The rest of your config follows here

" solarized theme
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
set background=dark
set t_Co=256
colorscheme solarized
let g:solarized_termcolors=256
" molokai theme
"let g:molokai_original=1
"set background=dark
"set t_Co=256
"colorscheme molokai

" Highlight excess line length
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END

" F2 C-e 开启和关闭树"
map <F2> :NERDTreeToggle<CR>
map <C-e> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
" 显示书签"
let NERDTreeShowBookmarks=1
" 设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" 窗口大小"
let NERDTreeWinSize=25

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

" Do not use python-mode auto completion, will use jedi vim
let g:pymode_rope = 0
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1
" Support virtualenv
let g:pymode_virtualenv = 1
" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Don't autofold code
let g:pymode_folding = 0

" 缩进指示线 "
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>

" automatically change window's cwd to file's dir
set autochdir

" more subtle popup colors
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold
endif

" powerline status
let g:airline_powerline_fonts = 1

" rainbow_parenthese
let g:rbpt_colorpairs = [ ['brown', 'RoyalBlue3'], ['Darkblue', 'SeaGreen3'], ['darkgray', 'DarkOrchid3'], ['darkgreen', 'firebrick3'],['darkcyan', 'RoyalBlue3'],['darkred', 'SeaGreen3'],['darkmagenta', 'DarkOrchid3'],['brown', 'firebrick3'],['gray', 'RoyalBlue3'],['black',       'SeaGreen3'],['darkmagenta', 'DarkOrchid3'],['Darkblue',  'firebrick3'],['darkgreen', 'RoyalBlue3'],['darkcyan', 'SeaGreen3'],['darkred', 'DarkOrchid3'],['red', 'firebrick3'] ]
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" encoding
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

" 一键保存并执行python代码
" 按F5运行python
map <F5> :w<CR> :call RunPython()<CR>
function RunPython()
  let mp = &makeprg
  let ef = &errorformat
  let exeFile = expand("%:t")
  setlocal makeprg=python\ -u
  set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
  silent make %
  copen
  let &makeprg = mp
  let &errorformat = ef
endfunction

" NerdCommenter
" F4一键注释 "
map <F4> <leader>ci <CR>
" <leader>cc   加注释
" <leader>cu   解开注释
" <leader>c<space>  加上/解开注释, 智能判断
" <leader>cy   先复制, 再注解(p可以进行黏贴)

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
