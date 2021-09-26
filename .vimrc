" Basic Settings

filetype plugin indent on
syntax on
" Use new regular expression engine
" set re=0
set number
set relativenumber
set nocompatible
set encoding=utf-8
set autowrite
set autoindent
set confirm
set title
set noerrorbells
set laststatus=2
set wildmenu
set nowrap
set hidden


set expandtab                   " Expand tabs to spaces
set autoindent smartindent      " auto/smart indent
set copyindent                  " copy previous indentation on auto indent
set softtabstop=4               " Tab key results in # spaces
set tabstop=4                   " Tab is # spaces
set shiftwidth=4                " The # of spaces for indenting.
set smarttab                    " At start of line, <Tab> inserts shift width
                                "   spaces, <Bs> deletes shift width spaces.

" Local dirs (centralize everything)
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

" --- history / file handling ---
set history=999             " Increase history (default = 20)
set undolevels=999          " Moar undo (default=100)
set autoread                " reload files if changed externally


" --- backup and swap files ---
" I save all the time, those are annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile

set hlsearch                " highlight searches
set incsearch               " show the `best match so far' astyped
set ignorecase smartcase    " make searches case-insensitive, unless they contain upper-case letters

set backspace=indent,eol,start  " allow backspacing over everything.
set timeoutlen=1500              " how long it wait for mapped commands
set ttimeoutlen=1500             " faster timeout for escape key and others

set scrolloff=5             " Start scrolling n lines before horizontal border of window.
set sidescrolloff=7         " Start scrolling n chars before end of screen.
set sidescroll=1            " The minimal number of columns to scroll horizontally.

" While pressing Shift , use mouse to drag through the line you want to copy
" then press Ctrl+Shift+c to copy
"set mouse=a

call plug#begin('~/.vim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'preservim/nerdtree'
    Plug 'ycm-core/YouCompleteMe'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    " ---> closing XML tags <---
    Plug 'alvan/vim-closetag'
    " ---> closing braces and brackets <---
    Plug 'jiangmiao/auto-pairs'
    Plug 'christoomey/vim-tmux-navigator'

    Plug 'preservim/nerdcommenter'
call plug#end()

let mapleader=" "

set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark='default'

""""""""""""""""""""""""""""""""""""NERDTREE""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ---> to hide unwanted files <---
  let NERDTreeIgnore = [ '__pycache__', '\.pyc$', '\.o$', '\.swp',  '*\.swp',  'node_modules/' ]
" ---> show hidden files <---
" let NERDTreeShowHidden=1
" ---> autostart nerd-tree when you start vim <---
  autocmd vimenter * NERDTree
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:stdn_in") | NERDTree | endif
" ---> toggling nerd-tree using Ctrl-N <---
  map <C-n> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""YouCompleteMe""""""""""""""""""""""""""""""""""""""""""""""""""

" ---> youcompleteme configuration <---
  let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

  " ---> compatibility with another plugin (ultisnips) <---
  let g:ycm_key_list_select_completion = [ '<C-n>', '<Down>' ]
  let g:ycm_key_list_previous_completion = [ '<C-p>', '<Up>' ]
  let g:SuperTabDefaultCompletionType = '<C-n>'
" ---> disable preview window <---
  set completeopt-=preview
" ---> navigating to the definition of a a symbol <---
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""Snippets"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""vim-close-tag""""""""""""""""""""""""""""""""""""""""""""""
" ---> files on which to activate tags auto-closing <---
  let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.vue,*.phtml,*.js,*.jsx,*.coffee,*.erb'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Clear All Highlights
nnoremap \ :noh<return>

augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript
augroup END

" :update saves the file only if it was changed
nnoremap ZS :up<cr>
