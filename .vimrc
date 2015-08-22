set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim', {'pinned': 1} "provided by git-submodule

" functionality enchansment
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'drmikehenry/vim-fontsize'
Plugin 'henrik/vim-indexed-search'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'szw/vim-ctrlspace'

" languages syntax and stuff 
Bundle 'chase/vim-ansible-yaml'
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus'
Plugin 'ap/vim-css-color'
Plugin 'gkz/vim-ls'
Plugin 'pangloss/vim-javascript'

" color themes
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" plugins configs
let NERDTreeIgnore = ['\.swp', '\.swo', '\.pyc', '__pycache__']
let NERDTreeShowHidden = 1 "always show hidden files in NERDTree
let NERDTreeMapHelp = '<Leader>?' "heals backward search
let NERDTreeShowLineNumbers = 1
let g:nerdtree_tabs_open_on_gui_startup     = 0
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_open_on_new_tab         = 0
let g:airline#extensions#tabline#enabled    = 0
let g:airline#extensions#whitespace#enabled = 0
set laststatus=2 "airline always
set hidden "ctrlspace
set showtabline=2
let g:CtrlSpaceIgnoredFiles = '\v(\.git|\.hg|\.svn|node_modules|bower_components|__pycache__)[\/]'
let g:indent_guides_start_level = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1

syntax on

try
	set t_Co=256
	
	if has('gui_running')
		
		set background=light
		exec 'colorscheme solarized'
		
		hi! IndentGuidesOdd  guibg=#eee8d5
		hi! IndentGuidesEven guibg=#e9e3d1
	else
		set background=dark
		exec 'colorscheme solarized'
	endif
catch
endtry

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set noexpandtab

set hlsearch
set smartcase

set nowrap
set number
set cursorline
set nocursorcolumn
if v:version >= 703
	set colorcolumn=80
endif

if has('mouse')
	set mouse=a
endif

set fileencodings=utf8,cp1251
set modeline
set foldmethod=indent
set foldlevelstart=999

set showbreak=˪
set linebreak
"try-catch for old vim versions
try
	set breakindentopt=shift:4,sbr
	set breakindent
catch
endtry

let &guifont = 'Monospace 14'

let mapleader = ','

nnoremap <C-t> :tabnew<CR>
vnoremap <C-t> <Esc><C-t>
imap <F1> <Esc><C-t>
nmap <F1> <Esc><C-t>
vmap <F1> <Esc><C-t>

nnoremap <C-w> :tabclose<CR>
vnoremap <C-w> <Esc><C-w>
imap <F4> <Esc><C-w>
nmap <F4> <Esc><C-w>
vmap <F4> <Esc><C-w>

nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc><C-s>
vnoremap <C-s> <Esc><C-s>
imap <F2> <Esc><C-s>
nmap <F2> <Esc><C-s>
vmap <F2> <Esc><C-s>

nmap <F5> :NERDTreeMirrorToggle<CR>
imap <F5> <Esc><F5>
vmap <F5> <Esc><F5>

nnoremap <silent> = <Plug>FontsizeInc
nnoremap <silent> + <Plug>FontsizeInc
nnoremap <silent> - <Plug>FontsizeDec

"reset search
nmap <F3> :let @/ = ""<CR>
imap <F3> <Esc><F3>
vmap <F3> <Esc><F3>

nmap <F12> :
imap <F12> <Esc><F12>
vmap <F12> :

nnoremap <C-z> u
inoremap <C-z> <Esc>ua
vnoremap <C-z> <Esc>u

nnoremap <A-z> <C-r>
inoremap <A-z> <Esc><C-r>a
vnoremap <A-z> <Esc><C-r>

function! Tab_Or_Complete()
	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
		return "\<C-N>"
	else
		return "\<Tab>"
	endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
