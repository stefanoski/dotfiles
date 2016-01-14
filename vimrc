set nocompatible

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"==============================================================================
" use boundles config
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

" set leader key
let mapleader = ","

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
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
"set relativenumber
set number
set undofile

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
nnoremap <tab> %
vnoremap <tab> %

" Handle long lines
set nowrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

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

" Map loading of vimrc file
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Center screen around cursor with SPACE
nmap <space> zz
