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

"

function MoveToPrevTab()
    "there is only one window
    if tabpagenr('$') == 1 && winnr('$') == 1
    return
    endif
    "preparing new window
    let l:tab_nr = tabpagenr('$')
    let l:cur_buf = bufnr('%')
    if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
    tabprev
    endif
    vsp
    else
    close!
    exe "0tabnew"
    endif
    "opening current buffer in new window
    exe "b".l:cur_buf
endfunc

function MoveToNextTab()
    "there is only one window
    if tabpagenr('$') == 1 && winnr('$') == 1
    return
    endif
    "preparing new window
    let l:tab_nr = tabpagenr('$')
    let l:cur_buf = bufnr('%')
    if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
    tabnext
    endif
    vsp
    else
    close!
    tabnew
    endif
    "opening current buffer in new window
    exe "b".l:cur_buf
endfunc

noremap <C-W>< :call MoveToPrevTab() <cr>
noremap <C-W>> :call MoveToNextTab() <cr>
