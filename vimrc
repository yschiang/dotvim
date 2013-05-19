let mapleader = ","

colorscheme ps_color
syntax on
set nocompatible
set paste



"set termencoding=cp950
"set background=dark
"set autochdir
set title
set showmatch
set ruler
set nu   "show line number
set ignorecase

set incsearch
set hlsearch    "highlight search result
set incsearch   "incremental search

"To change all the existing tab characters to match the current tab settings, use :retab.
set autoindent
set smartindent
set cindent

set expandtab
set tabstop=4
set shiftwidth=4
"set backspace=eol,start,indent
set backspace=indent,eol,start whichwrap+=<,>,[,]

"Show the tab and trailing space characters
set list
"set listchars=tab:»·,trail:·
set listchars=tab:>-,trail:-

set history=500
set backspace=indent,eol,start

"XML folding
"au FileType xml setlocal foldmethod=syntax
"let g:xml_syntax_folding=0

"===============================================================================
"=== key mappings for file editing
"===============================================================================
"easy edit of files in the same directory
"to enter the ^M (enter): ctrl+v + Enter
"to enter the ^[ (esc):   ctrl+v + ESC
"to enter the ^R:         ctrl+v + ctrl+r
"noremap ,e :e <C-R>=expand("%:p:h") . "/"<C-M>
"noremap ,f :silent 1,$!xmllint --format --recover - 2>/dev/null<C-M>
"noremap ,t :tabnew <C-R>=expand("%:p:h") . "/"<C-M>

"Press Ctrl+\ to comment out a line
vnoremap  _i//
"key map for indent in the visual mode
xnoremap <Tab> >gv
"key map for indent in the visual mode
xnoremap <S-Tab> <gv
"press vv to select a word
vnoremap v iw

let mapleader = ","
"===============================================================================
"=== Tab Settings
"===============================================================================
"
nmap <leader>t1 :tabnext 1<CR>
nmap <leader>tc :tabnew <C-R>=expand("%:p:h") . "/"<C-M>
nmap <leader>td :tabclose<CR>
nmap <leader>te :tabedit<SPACE>
nmap <leader>tm :tabmove<SPACE>
nmap <C-H> :tabprev<CR>
nmap <C-L> :tabnext<CR>

autocmd TabLeave * let g:LastUsedTabPage = tabpagenr()
    function! SwitchLastUsedTab()
    if exists("g:LastUsedTabPage")
        execute "tabnext " g:LastUsedTabPage
    endif
endfunction
nmap tt :call SwitchLastUsedTab()<CR>
"set autodir

try
    set switchbuf=usetab
    set stal=2
catch
endtry

set winaltkeys=no
set showtabline=2 "always show tab line
"===============================================================================
"=== key mappings for buffers and windows
"===============================================================================
"To switch to the next buffer, :bnext!, bprevious!
"To delete a buffer, :bdelete!
"To find the current buffers, use ':ls'
"noremap <F4> :bprevious!

"Switch between windows, maximizing the current window
set winminheight=1
noremap <C-J> <C-W>j<C-W>_
noremap <C-K> <C-W>k<C-W>_

"To resize the window to height 12, ':res 12'


"===============================================================================
"=== plugin: visualmark
"===============================================================================
" line 55 is edited:
"       exec ":lan mes en_US.UTF-8"
"
" mm to add bookmark
" F2 & Shift+F2 to navigate bookmarks


"===============================================================================
"=== plugin: bufferexplorer
"===============================================================================
" to invoke bufferexplorer, \be or :bufexplorer
" t: to open buffer in new tab
" D: to delete buffer
noremap \be :BufExplorer<CR>
let g:bufExplorerDetailedHelp=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
let g:bufExplorerDefaultHelp=0       "Do not show default help.
let g:bufExplorerShowRelativePath=1  "Show relative paths.
"let g:bufExplorerSortBy='mru'        "Sort by most recently used.
let g:bufExplorerSplitRight=0        "Split left.
let g:bufExplorerSplitVertical=1     "Split vertically.
let g:bufExplorerSplitVertSize = 30  "Split width
let g:bufExplorerUseCurrentWindow=1  "Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber

"===============================================================================
"=== plugin: gdb settings
"===============================================================================
set previewheight=12
run macros/gdb_mappings.vim
set asm=0                         "don't show any assembly stuff"
set gdbprg=/usr/bin/gdb


"====================================
" pathogen
"====================================
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

"===================================
" ctrlp
"===================================
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|toolchain)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/toolchain/*

" MiniBufExpl Colors
hi MBEVisibleActive guifg=#A6DB29 guibg=fg
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
hi MBEVisibleChanged guifg=#F1266F guibg=fg
hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
hi MBEChanged guifg=#CD5907 guibg=fg
hi MBENormal guifg=#808080 guibg=fg
let g:miniBufExplMapCTabSwitchBufs=1
