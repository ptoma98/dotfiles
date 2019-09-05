call plug#begin('~/.vim/plugged')
" https://github.com/junegunn/vim-plug#example

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/solarized'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()

let g:solarized_termcolors=256
set background=light
colorscheme solarized   

syntax enable " enables syntax processing
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=4    " controls depth of auto-indentation

set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

let mapleader=","       " leader is comma

" edit vimrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Plugins
" NERDTree Options

" open NerdTree when starting vim with no command line arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open and close NT
nnoremap <C-n> :NERDTreeToggle<Enter>
" locate current file in tree
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
" automatically close NT when file is opened
let NERDTreeQuitOnOpen = 1
" automatically delete the buffer of deleted file
let NERDTreeAutoDeleteBuffer = 1
" improve look
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" ALE Options
let g:airline#extensions#ale#enabled = 1
let b:ale_linters = ['pyflakes']

