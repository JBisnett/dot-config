" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Git
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter' 

" Latex
Plug 'lervag/vimtex'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'

Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'

Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

Plug 'jistr/vim-nerdtree-tabs'

Plug 'vim-syntastic/syntastic'

Plug 'lambdatoast/elm.vim'
Plug 'pbogut/deoplete-elm'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }

" Initialize plugin system
call plug#end()
" Jacob settings
"

nnoremap <SPACE> <NOP>
let maplocalleader = ","
let mapleader = " "
set tabstop=2 
set softtabstop=2 
set shiftwidth=2 
set expandtab

inoremap fd <Esc>

nnoremap <leader>fs :update<CR>
nnoremap <leader>fa :wa<CR>
nnoremap <leader>ff :NERDTreeToggle<CR>
nnoremap <leader>fq :wq<CR>
nnoremap <leader>qq :q<CR>

nnoremap <leader>ss :split<CR>

nnoremap <leader>" :split <Bar> terminal<CR>
nnoremap <leader>' :tabnew <Bar> terminal<CR>

tnoremap <Esc> <C-\><C-n>
tnoremap fd <C-\><C-n>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

nnoremap <leader>w2 :vsplit %<CR>

nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 0gt


" Git
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gl :Gpull<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gg :Git

" Rust
set hidden
let g:racer_cmd = "/home/jbisnett/.cargo/bin/racer"
let g:rustfmt_autosave = 1
autocmd FileType rust compiler cargo
autocmd FileType rust nnoremap <localleader>cc :make build<CR>
autocmd FileType rust nnoremap <localleader>cx :make run<CR>
autocmd FileType rust nnoremap <localleader>ct :make test<CR>
autocmd FileType rust nnoremap <localleader>cC :make clean<CR>
autocmd FileType rust nnoremap <localleader>cb :make bench<CR>

"autocmd FileType rust nnoremap gd <Plug>(rust-def)
"autocmd FileType rust nnoremap gs <Plug>(rust-def-split)
"autocmd FileType rust nnoremap gx <Plug>(rust-def-vertical)
"autocmd FileType rust nnoremap <leader>gd <Plug>(rust-doc)

" YouCompleteMe
let g:ycm_rust_src_path = '/home/jbisnett/rust-mir-plugin/src'
nnoremap gd :YcmCompleter GoTo<CR>
nnoremap <leader>d :YcmCompleter GetDoc<CR>


" Deoplete
" Use deoplete.
"let g:deoplete#enable_at_startup = 1
" Use smartcase.
"let g:deoplete#enable_smart_case = 1

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
" 	return deoplete#close_popup() . "\<CR>"
" endfunction


if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = '\\(?:'
			\ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
			\ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
			\ . '|hyperref\s*\[[^]]*'
			\ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
			\ . '|(?:include(?:only)?|input)\s*\{[^}]*'
			\ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
			\ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
			\ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
			\ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
			\ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
			\ .')'
" Elm
au BufWritePost *.elm ElmMakeFile("Main.elm")
nnoremap <localleader>el :ElmEvalLine<CR>
vnoremap <localleader>es :<C-u>ElmEvalSelection<CR>
nnoremap <localleader>em :ElmMakeCurrentFile<CR><Paste>

" Ultisnips
let g:UltiSnipsExpandTrigger="<localleader><CR>"

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

