set nocompatible

"" begin plugin loading
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" text generation
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}   
 " sparkup - use ctrl+e to convert to regular html
Bundle 'scrooloose/nerdcommenter'
 " use \cc to comment
Bundle 'tpope/vim-surround'
Bundle 'ervandew/supertab'

" navigation
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-easymotion'
 " \\w<char> to find word
Bundle 'kien/ctrlp.vim'

" other
Bundle 'xolox/vim-session'
Bundle 'tpope/vim-fugitive'

filetype plugin indent on     " required!

syntax on "color syntax
filetype plugin indent on "use a specific config based on filetype

"" end plugin loading


"view 
set number "line number
set ruler "column number

"editing
set clipboard=unnamed "yank goes to clipboard
set backspace=2 "make backspace work like most other apps
set pastetoggle=<F10> " toggle between paste and normal

"search
set hlsearch "highlight search
set smartcase "ignore case until there is a capital letter
set ignorecase "ignore case 
set incsearch "move cursor before finish


"NERD tree 
autocmd vimenter * if argc() | NERDTree | endif "load nerdtree when open with a file
"can close with just NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
:let NERDTreeShowBookmarks = 1

"session.vim
:let g:session_autosave = 'yes'
:let g:session_autoload = 'yes'
:let g:session_default_to_last = 1

"tabs
set ts=2
set expandtab
set shiftwidth=2
set autoindent

set fo-=r " Do not insert a comment leader after an enter

"modes
autocmd InsertEnter * highlight LineNr ctermbg=white  guibg=darkgrey
autocmd InsertLeave * highlight LineNr ctermbg=NONE guibg=#E5E5E5

"syntax
filetype plugin indent on
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

comm! W exec 'w !sudo tee % > /dev/null' | e!
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal g'\"" | endif " restore position in file
