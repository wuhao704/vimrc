colorscheme molokai

set go=
set nu
set showcmd
set ruler
set clipboard+=unnamed
set syntax=on
set cindent
set tabstop=4
set smarttab
set softtabstop=4
set shiftwidth=4
set enc=utf-8
set langmenu=zh_CN.UTF-8
set helplang=cn
set viminfo+=!
set showmatch
set smartindent
set autoindent
set confirm
set noexpandtab
set ignorecase
set smartcase
set autochdir
set guifont=Monaco:h20
set nocp
set fileencoding=utf-8
set fileencodings=utf-8
set magic
set autowrite
set autoread
set showmode
set noswapfile
set nobackup
set wrap
set hlsearch
set incsearch
set cursorline
set cursorcolumn
set paste


autocmd FileType python set expandtab
autocmd InsertEnter * se cul




filetype off
filetype plugin on

autocmd FileType python set omnifunc=pythoncomplete
autocmd VimEnter * nested TagbarOpen


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
let mapleader=','


set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Bundle 'Valloric/YouCompleteMe'

call vundle#end()


Plugin 'nvie/vim-flake8'
let python_highlight_all=1
syntax on



Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'mattn/emmet-vim'


Bundle 'majutsushi/tagbar'

Plugin 'vim-scripts/indentpython.vim'


au Bufread, BufNewFile *.py, *.pyc, *.c, *.h, match B    adWhitespace /\s\+$/


Bundle 'minibufexpl.vim'

let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
Bundle 'winmanager'
Bundle 'Lokaltog/vim-powerline'
Bundle 'godlygeek/tabular'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-haml'
Bundle 'Raimondi/delimitMate'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'othree/html5.vim'
Bundle 'docunext/closetag.vim'
Bundle 'gregsexton/MatchTag'
Bundle 'terryma/vim-expand-region'
Bundle 'tpope/vim-surround'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'rstacruz/vim-ultisnips-css'
Bundle 'tacahiroy/ctrlp-funky'
Bundle "pangloss/vim-javascript"
Bundle 'othree/yajs.vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'marijnh/tern_for_vim'
Bundle 'mbriggs/mark.vim'
Bundle 'gorodinskiy/vim-coloresque'
Bundle 'scrooloose/nerdcommenter'

let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1

let g:UltiSnipsExpandTrigger='<D-j>'
let g:UltiSnipsEditSplit='vertical'


let g:tagbar_autofocus=1
let g:tagbar_autoshowtag=1
let g:tagbar_width=20


let g:NERDTreeWinSize=25
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1


function! Fcitx2en()
	let input_status = system('fcitx-remote')
	if input_status == 2
		let b:inputtoggle=1
		call system('fcitx-remote -c')
	endif
endfunction
function! Fcitx2zh()
	try
		if b:inputtoggle == 1
			call system('fcitx-remote -o')
			let b:inputtoggle = 0
		endif
	catch /inputtoggle/
		let b:inputtoggle = 0
	endtry
endfunction
au InsertLeave * call Fcitx2en()
au InsertEnter * call Fcitx2zh()

py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activete_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF



