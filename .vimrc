set number
set relativenumber
syntax on

"Fast typing
"more character will be sent to the screen
set ttyfast
set ttimeout
set ttimeoutlen=50

set backspace=indent,eol,start
set autoindent
set expandtab ts=4 sw=4 ai
"force this by :%retab

"Search
set incsearch
"highlight search
set hlsearch
set ignorecase
set smartcase

"display filename
set laststatus=2
set wildmenu
set wildmode=longest:full,full
"display incomplete command
set showcmd
