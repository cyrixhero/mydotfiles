" Tab pages with keyboard
map <C-t> <Esc>:tabnew<CR>
map <C-x> <Esc>:tabclose<CR>
map <C-n> <Esc>gt<CR>
map <C-p> <Esc>gT<CR>

" Select all text
map <C-a> <esc>ggVG<CR>

" Which will automatically use the + buffer (the system clipboard) by default. Then to yank (copy), you just use the regular y command, etc. 
set clipboard=unnamedplus

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>
" automatically change window's cwd to file's dir
 set autochdir

" I'm prefer spaces to tabs
filetype indent on
set smartindent
set filetype=lisp
set tabstop=4
set shiftwidth=4
set expandtab

" more subtle popup colors 
if has ('gui_running')
	highlight Pmenu guibg=#cccccc gui=bold    
endif

augroup vimrc_autocmds
	autocmd!
	" highlight characters past column 120
	autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
	autocmd FileType python match Excess /\%120v.*/
	autocmd FileType python set nowrap
augroup END

call plug#begin()

" A tree explorer plugin for Vim.
Plug 'scrooloose/nerdtree'
" Press F2 in vim and it will take you to the current working directory.
" Press ? to see NerdTree’s list of commands.
map <F2> :NERDTreeToggle<CR>

" With this plugin, your vim comes to automatically opens popup menu for
" completions when you enter characters or move the cursor in Insert mode.
Plug 'vim-scripts/AutoComplPop'

" lean & mean status/tabline for vim that's light as air
Plug 'bling/vim-airline'
let &t_Co=256
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
nnoremap <Leader>[ :bprevious<CR>
nnoremap <Leader>] :bnext<CR>
nnoremap <Leader>1 :bfirst<CR>
nnoremap <Leader>2 :bfirst<CR>:bn<CR>
nnoremap <Leader>3 :bfirst<CR>:2bn<CR>
nnoremap <Leader>4 :bfirst<CR>:3bn<CR>
nnoremap <Leader>5 :bfirst<CR>:4bn<CR>
nnoremap <Leader>6 :bfirst<CR>:5bn<CR>
nnoremap <Leader>7 :bfirst<CR>:6bn<CR>
nnoremap <Leader>8 :bfirst<CR>:7bn<CR>
nnoremap <Leader>9 :blast<CR>
nnoremap <Leader>w :bd<CR>

" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.
Plug 'klen/python-mode'
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" jedi-vim - awesome Python autocompletion with VIM
Plug 'davidhalter/jedi-vim'

" Perl IDE -- Write and run Perl-scripts using menus and hotkeys.
Plug 'vim-scripts/perl-support.vim'

" Perldoc plugin for vim(Need to install perl-doc package)
Plug 'hotchpotch/perldoc-vim'

" Vim/Ruby Configuration Files
Plug 'vim-ruby/vim-ruby'
" Completion of Ruby code requires that Vim be built with +ruby.
" The completions provided by CTRL-X CTRL-O are sensitive to the context
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_load_gemfile = 1
let g:rubycomplete_gemfile_path = 'Gemfile.aux'
let g:rubycomplete_use_bundler = 1

" Vim configuration for Rust.
Plug 'rust-lang/rust.vim'

" syntastic —— 語法檢查器
Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

call plug#end()
