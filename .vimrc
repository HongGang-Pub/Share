"-----------------------------------------------------------------------------
" Base
"-----------------------------------------------------------------------------
" set highlight
syntax on
set hlsearch

set cuc
set cul
" set line number
set nu

let mapleader = ","

" let chinese can display
set fileencodings=utf-8,gbk,big5,gb2312
set fileencoding=utf-8
set termencoding=utf-8
set encoding=cp936
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936,big－5
set enc=utf-8
let &termencoding=&encoding

" set front
set guifont=Monospace\ 13

" set tab4
set tabstop=4
set expandtab

" set auto shiftwidth
set shiftwidth=4

"set backspace delete 4 spaces
set softtabstop=4
autocmd FileType make set noexpandtab

" display statusline
set ruler

" ignore case
set ignorecase

" vim auto alignment
set autoindent
set smartindent

" display cmd & dir in statusline
set showcmd
set autochdir "NERDTree dir set


"------------------------------
" set pop menu
"------------------------------
"highlight Pmenu guibg=#666666 guifg=#FFFFFF
"highlight PmenuSel guibg=#CD853F guifg=#FFFFFF
"highlight Pmenusbar guibg=#666666
"highlight PmenuThumb guibg=#46484A
highlight Pmenu guibg=#252526 guifg=#bebebf
highlight PmenuSel guibg=#04395e guifg=#ffffff
highlight Pmenusbar guibg=#464647
highlight PmenuThumb guibg=#299eeb


"------------------------------
" set windows size
"------------------------------
winpos 100 100
set lines=36 columns=150

"------------------------------
" map setting
"------------------------------
inoremap jj <ESC>
inoremap ww <ESC>:w<Enter>
inoremap qq <ESC>:q!
noremap <C-s> <ESC>:w<Enter>
noremap <C-q> <ESC>:q<Enter>
nnoremap <C-l> :nohl<Enter>
imap ii <ESC>

"------------------------------
" set fold
"------------------------------
set foldmethod=indent
set foldlevel=100
set foldcolumn=4
nnoremap <C-z> @=(foldclosed(line('.'))<0 ? 'zc' : 'zo')<cr>
"highlight Folded guibg=#515151 guifg=#868686
highlight FoldColumn guibg=#4D4D4D guifg=#DF5F00

set nocompatible
set backspace=indent,eol,start

" remove VI consist
set nocompatible
filetype off


au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


"-----------------------------------------------------------------------------
"  vundle
"-----------------------------------------------------------------------------
" Setup includes vundle and initialization associated runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Alternatively, specify a vundle install plug-in path
"call vundle#begin('~/some/path/here')

" let vundle manage plugin version
Plugin 'https://github.com/VundleVim/Vundle.vim'		" 插件管理工具
Plugin 'https://github.com/scrooloose/nerdtree.git'		" 目录树
Plugin 'https://github.com/jiangmiao/auto-pairs.git'	" 括号自动补全
Plugin 'https://github.com/dense-analysis/ale.git'		" 代码检测
Plugin 'https://github.com/bling/vim-airline'			" 状态栏管理
Plugin 'https://github.com/SirVer/ultisnips'			" 代码片段插件
Plugin 'https://github.com/honza/vim-snippets'			" 代码片段插件，需搭配ultisnips
Plugin 'https://github.com/junegunn/vim-easy-align'		" 代码对齐
Plugin 'https://github.com/scrooloose/nerdcommenter'	" 代码注释快捷插件
Plugin 'https://github.com/Shougo/neocomplcache.vim'	" 代码补全插件
Plugin 'https://github.com/Yggdroot/indentLine.git'		" 代码层级展示
Plugin 'https://github.com/luochen1990/rainbow.git'		" 括号匹配显示
Plugin 'https://github.com/itchyny/vim-cursorword.git'	" 同名变量高亮
Plugin 'vlog_inst_gen.vim'
" Plugin 'https://github.com/HongGang-Pub/vlog_inst_gen.git'      " verilog实例化
" Plugin 'https://github.com/skywind3000/vim-auto-popmenu.git'	" 代码补全工具
" Plugin 'https://github.com/skywind3000/vim-dict.git'			" 代码补全

" Theme fof VIM
Plugin 'https://github.com/tomasr/molokai.git'
Plugin 'https://github.com/altercation/vim-colors-solarized.git'
Plugin 'https://github.com/morhetz/gruvbox.git'


" All your plugins need to be in the following line before
call vundle#end()            " required
filetype plugin indent on    " required


"------------------------------
" set color theme after Plugin restart
"------------------------------
"colorscheme desert
colorscheme solarized
set background=dark


"-----------------------------------------------------------------------------
" NERDTree
"-----------------------------------------------------------------------------
map <leader>ne :NERDTreeToggle<CR>
" 目录树窗口尺寸
let g:NERDTreeWinSize = 25
" 关闭nerd帮助
" let g:NERDTreeMinimalUI = 1
" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
" 显示隐藏文件
let NERDTreeShowHidden=1
" 修改默认箭头符号
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
augroup NERDTree
    au!
    autocmd vimenter * NERDTree     " vim启动时自动打开NERDTree
    " vim启动打开目录时自动打开NERDTree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    autocmd vimenter * NERDTreeFind
    " 文件全部关闭时退出NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

map <F2> :NERDTreeMirror<CR>
map <F2> :NERDTreeToggle<CR>

wincmd w
autocmd VimEnter * wincmd w



"-----------------------------------------------------------------------------
" ale.vim
"-----------------------------------------------------------------------------
"keep the sign gutter open
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" show errors or warnings in my statusline
let g:airline#extensions#ale#enabled = 1
" self-define statusline
" use quickfix list instead of the loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" only enable these linters
let g:ale_linters = {
\    'verilog': ['verilator']
\}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-J> <Plug>(ale_next_wrap)
" run lint only on saving a file
" let g:ale_lint_on_text_changed = 'never'
" dont run lint on opening a file
" let g:ale_lint_on_enter = 0


"-----------------------------------------------------------------------------
"snippet.vim
"-----------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


"-----------------------------------------------------------------------------
"nerdcommenter
"-----------------------------------------------------------------------------
let mapleader = ","
let g:NERDSpaceDelims=1


"-----------------------------------------------------------------------------
" neocomplcache
"-----------------------------------------------------------------------------
let g:neocomplcache_enable_at_startup = 1 "作用：在系统启动的时候启动neo
let g:neocomplcache_enable_auto_select = 1 "作用：提示的时候默认选择地一个，如果你设置为0，每次输入都需要用上下键选择


"-----------------------------------------------------------------------------
" easyalign
"-----------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"-----------------------------------------------------------------------------
" verilog_inst_gen
"-----------------------------------------------------------------------------
so ~/.vim/bundle/vlog_inst_gen.vim
let g:vlog_inst_gen_mode=2 "copy to clipboard and echo inst in split window


"-----------------------------------------------------------------------------
"vtag
"-----------------------------------------------------------------------------
source /home/honggang/vtags-3.01/vtags_vim_api.vim


"-----------------------------------------------------------------------------
"auto-pairs
"-----------------------------------------------------------------------------
let g:AutoPairsFlyMode = 1


"-----------------------------------------------------------------------------
"rainbow
"-----------------------------------------------------------------------------
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle


"-----------------------------------------------------------------------------
" Add File Header
"-----------------------------------------------------------------------------
autocmd BufNewFile *.v,*.sv,*.cpp,*.c,*.h exec ":call AddHeader()"
autocmd BufWrite *.v call UpdateLastModifyTime()

function s:GetUserName()
    let user_name = "honggang.li"
    return user_name
endfunction

function AddHeader()
	let line = getline(1)
  	let filename = expand("%")
	call append(0,  "// +FHDR----------------------------------------------------------------------------")
	call append(1,  "//                 Copyright (c) ".strftime("%Y ") )
	call append(2,  "//                       ALL RIGHTS RESERVED")
	call append(3,  "// ---------------------------------------------------------------------------------")
	call append(4,  "// Filename      : ".filename)
	call append(5,  "// Author        : ".s:GetUserName())
	call append(6,  "// Created On    : ".strftime("%Y-%m-%d %H:%M"))
	call append(7,  "// Last Modified : ")
	call append(8,  "// ---------------------------------------------------------------------------------")
	call append(9,  "// Description   : ")
	call append(10, "//")
	call append(11, "//")
	call append(12, "// -FHDR----------------------------------------------------------------------------")
endfunction

"-----------------------------------------------------------------------------
" ModifyTime
"-----------------------------------------------------------------------------
function UpdateLastModifyTime()
	let line = getline(8)
	if line =~ '// Last Modified'
		call setline(8,"// Last Modified : " . strftime("%Y-%m-%d %H:%M"))
	endif
endfunction

function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()
