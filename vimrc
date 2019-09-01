set nocompatible

set diffexpr=MyDiff()

"==============================================================================
" use boundles config
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

" set leader key
let mapleader = ","

" set path
set path+=~/src/uniqfeed-all/camoverlay/include/**
set path+=~/src/uniqfeed-all/camoverlay/src/**
set path+=~/src/uniqfeed-all/camoverlay/tests/**
set path+=~/src/uniqfeed-all/common/include/**
set path+=~/src/uniqfeed-all/common/src/**
set path+=~/src/uniqfeed-all/common/tests/**
set path+=~/src/uniqfeed-all/framedistillery/
set path+=~/src/uniqfeed-all/framedistillery/tests/**
set path+=~/src/uniqfeed-all/libkeypoint/
set path+=~/src/uniqfeed-all/libkeypoint/tests/**
set path+=~/src/uniqfeed-all/segmentation/
set path+=~/src/uniqfeed-all/segmentation/tests/**
set path+=~/src/uniqfeed-all/slam/libraries/**
set path+=~/src/uniqfeed-all/slam/tests/**
set path+=~/src/uniqfeed-all/prefiner/include/**
set path+=~/src/uniqfeed-all/prefiner/src/**
set path+=~/src/uniqfeed-all/visapp/include/**
set path+=~/src/uniqfeed-all/visapp/src/**
set path+=~/src/uniqfeed-all/vulkan/**
set path+=~/src/uniqfeed-all/uniqui/applications/**
set path+=~/src/uniqfeed-all/scripts/ansible/distributed-launcher/**
" set path+=~/src/uniqfeed-all/sequences/**

" Fix color problem of mate-terminal
if $COLORTERM == 'mate-terminal'
      set t_Co=256
endif

" Color scheme, font, initial window size, toolbar
if has("gui_running")
    if has("gui_win32")
        set guifont=Consolas:h12:cANSI
    endif
    set lines=999 columns=999
    set guioptions-=T  "remove toolbar
endif
colorscheme desert


" Tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Syntax Highlighting on
syntax on

" Set to auto read when a file is changed from the outside
set autoread

" General settings
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
"set relativenumber
set number
set undofile
set mouse=a
highlight cursorline ctermbg=240 cterm=none

" wild settings
set wildmenu
" set wildmode=list:longest,full
set wildmode=longest:full,full
set wildignore+=.*
set wildignore+=*.o,*.obj,*.so,*.a
set wildignore+=*.sw*,*~
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.cmake

" Search/Moving settings
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

" Handle long lines
set nowrap
set textwidth=95
set formatoptions=qrn1
set colorcolumn=95

" Toggle vizualization of special symbols
nnoremap <leader>r :call ShowSpecialSymbols()<cr>
function! ShowSpecialSymbols()
    if &list
        set list!
    else
        set list
    endif
    set listchars=tab:▸\ ,eol:¬,trail:·
endfunction

" ***  Mappings ***

" Map loading of vimrc file
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Center screen around cursor with SPACE
nmap <space> zz

" Exit insert mode with jj
imap jj <esc>

" Easy buffer switching
nnoremap <F5> :buffers<CR>:buffer<Space> 

" Toggle Tagbar
nmap <F8> :TagbarToggle<CR>

" Add ctags support 
" build tags of own projects with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q . <CR>

" Additional tag files 
set tags+=~/.vim/tags/tags_uf
"set tags+=~/.vim/tags/tags_bm_sdk
"set tags+=~/.vim/tags/tags_gl

" Abbreviations
function! Eatchar(pat)
      let c = nr2char(getchar(0))
      return (c =~ a:pat) ? '' : c
endfunc
iab ,f <C-R>=expand('%:t:r')<CR>
iab #" #include ""<Left><C-R>=Eatchar('\s')<CR>
iab #< #include <><Left><C-R>=Eatchar('\s')<CR>
iab #> #include <><Left><C-R>=Eatchar('\s')<CR>
iab once #pragma once
" iab if if ()<Left><C-R>=Eatchar('\s')<CR>
" iab for for ()<Left><C-R>=Eatchar('\s')<CR>
" iab while while ()<Left><C-R>=Eatchar('\s')<CR>

" C++ snippets
nmap <leader>0 ma:0read ~/.vim/snippets/cr_notice.txt<CR>`a
nmap <leader>9 ma:read ~/.vim/snippets/class_skeleton.h<CR>:'[,']s/_MY_CLASSNAME_/\=expand("%:t:r")<CR>g'[
nmap <leader>8 k:read ~/.vim/snippets/doxy_comment.txt<CR>A
autocmd BufNewFile *.c,*.cpp,*.h,*.hpp 0read /home/stefanos/.vim/snippets/cr_notice.txt


" C++ loading .cpp/.h files
nmap <leader>1 :find <C-R>=expand('%:t:r')<CR>.h<CR>
nmap <leader>2 :find <C-R>=expand('%:t:r')<CR>.cpp<CR>


" C++ formagin with clang
noremap <leader>= :ClangFormat<CR><SPACE>
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortBlocksOnASingleLine": "false",
            \ "AllowShortFunctionsOnASingleLine": "Inline",
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AllowShortLoopsOnASingleLine": "false",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "BasedOnStyle" : "LLVM",
            \ "BinPackParameters" : "false",
            \ "BreakBeforeBraces" : "Allman",
            \ "BreakConstructorInitializersBeforeComma" : "true",
            \ "ColumnLimit" : 95,
            \ "DerivePointerAlignment" : "true",
            \ "MaxEmptyLinesToKeep": 2,
            \ "IndentWidth" : 4,
            \ "Language" : "Cpp",
            \ "PointerAlignment" : "Left",
            \ "SpaceBeforeParens" : "ControlStatements",
            \ "Standard" : "C++11",
            \ "TabWidth" : 4}
let g:clang_format#command="clang-format-3.8"

" Syntax highlighting for (some file types)
autocmd BufNewFile,BufRead *.jdef   set syntax=json
autocmd BufNewFile,BufRead *.j2     set syntax=json
autocmd BufNewFile,BufRead *.qml    set syntax=qml
