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

"display 256 color
set t_Co=256
colorscheme industry

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

" Some hack to make Alt key working thanks to Stackoverflow
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw

""" SECTION: KEY BINDING
" Emacs binding in insert mode
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-B> <Left>
inoremap <C-F> <Right>
inoremap <C-P> <Up>
inoremap <C-N> <Down>
inoremap <C-K> <Esc>lDa
inoremap <C-U> <Esc>d0xi
inoremap <C-Y> <Esc>Pa
inoremap <C-X><C-S> <Esc>:w<CR>a
" â is <Alt-B>, æ is <Alt-F>
inoremap â <C-Left>
inoremap æ <C-Right>
" Scrolling <M-C> and <M-V>
inoremap ö <Esc><C-D>i
inoremap ã <Esc><C-U>i

noremap <C-W>< :call MoveToPrevTab() <cr>
noremap <C-W>> :call MoveToNextTab() <cr>
