set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"  VimRC of ShepJeng (t9054@cs.nccu.edu.tw)

set mouse=a
set nocompatible
set secure
set runtimepath+=~/.vim/bundle/node
set runtimepath+=~/.vim/bundle/jshint.vim/
set backspace=2         " allow backspacing over everything in insert mode
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
" than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
"set dictionary=~/.dict  " my dictionary :p

"set expandtab           " expand tabs to spaces.
set wildchar=<TAB>      " such as <TAB> in shell
set smarttab
set tabstop=4
set shiftwidth=4

set t_Co=8              " number of colors
set t_Sf=[1;3%p1%dm   " set foreground color
set t_Sb=[1;4%p1%dm   " set background color
set showcmd             " show command
set showmode            " show current mode
set incsearch           " While typing a search pattern, show immediately 
" where the so far typed pattern matches.
set hlsearch            " When there is a previous search pattern, 
" highlight all its matches.
syntax on               " show parts of the text in another font or color

set nu

set fileencodings=utf-8,cp936,big5,latin1
set background=dark

autocmd FileType c,cpp,cc,java call PROG()

colorscheme default

function PROG()
	set showmatch
	set nosmartindent
	set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30
	set cinoptions=t0
	imap <C-a>f <END><CR>for(;;) {<CR>}<LEFT>
				\<CR><UP><UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT>
	imap <C-a>w <END><CR>while( ) {<CR>}<LEFT>
				\<CR><UP><UP><UP><END><LEFT><LEFT>
	set formatoptions=tcqr
endfunction


highlight Comment    ctermfg=DarkCyan
highlight SpecialKey ctermfg=Yellow

map <F2> :update<CR>                    " using :update to replace :w
map <F3> :update<CR>:q<CR>
map <F4> :q!<CR>
map <F5> :bp<CR>
map <F6> :bn<CR>
" map <F8> :set hls!<BAR>set hls?<CR>     " toggle on/off highlightsearch
map <F8> :set paste!<BAR>set paste?<CR> " toggle on/off paste mode
set pastetoggle=<F8>
map <F9> :!make %:r <CR>

map <F7> :if exists("syntax_on") <BAR>  " press <F7> syntax on/off
			\   syntax off <bar><cr>
			\ else <BAR>
			\   syntax on <BAR>
			\ endif <CR>

map <F10> <ESC>:read !date<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


"smart mapping for tab completion
function InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction 

inoremap <TAB> <C-R>=InsertTabWrapper()<CR>

