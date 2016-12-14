"Plugins
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim " Manage plugins with Vundle
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'wincent/command-t'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-endwise'
Plugin 'skalnik/vim-vroom'
Plugin 'tyru/current-func-info.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'ervandew/supertab'
Plugin 'rking/ag.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'ctrlpvim/ctrlp.vim' " tag searching
Plugin 'majutsushi/tagbar' " tag searching
Plugin 'vim-syntastic/syntastic'
Plugin 'elmcast/elm-vim'
Plugin 'lambdatoast/elm.vim'
"Plugin 'Raimondi/delimitMate'
"Plugin 'heartsentwined/vim-emblem'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'digitaltoad/vim-jade'
"Plugin 'slim-template/vim-slim'
"Plugin 'iandoe/vim-osx-colorpicker'
"Plugin 'mustache/vim-mustache-handlebars'
call vundle#end()
filetype plugin indent on
syntax enable

"General
scriptencoding utf-8
set enc=utf-8
set noswapfile
set splitbelow
set splitright
set incsearch
set nocursorline
set number
set rnu " Relative numbering
set vb t_vb=
set clipboard=unnamed
setlocal spell spelllang=en_us
set directory=/tmp/
let mapleader=' '
let g:syntastic_enable_signs=1

"Colors
colorscheme peachpuff
set background=light

" Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Formatting and Editing
set formatoptions-=o " Do not automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set formatoptions-=r " Do not automatically insert a comment leader after an enter
nmap <S-K> O<Esc>j
nmap <S-J> o<Esc>k
" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$
" Replace word under cursor globally in file
:nnoremap <leader>s :%s/\<<C-r><C-w>\>/

"Ctags
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <leader>b :TagbarToggle<cr>

"Statusline
set laststatus=2 " always show the status bar
set statusline=%f " filename
set statusline+=%{fugitive#statusline()} " git branch
set statusline+=\ Func:%{cfi#get_func_name()} " current function name
set statusline+=%= " switch to the right
set statusline+=\ [%b][0x%B] " [character value],[same, in hexadecimal]
set statusline+=\ Col:%v " column number
set statusline+=\ Buf:#%n " buffer number

:runtime macros/matchit.vim " Extends '%' match function to if/else, </>, etc.

"Tabs
set tabstop=2
set shiftwidth=2
set expandtab

"let g:vroom_clear_screen = 0

"Command-T
let g:CommandTWildIgnore=&wildignore .
  \ ",**/.git/*" .
  \ ",**/bower_components/*" .
  \ ",**/node_modules/*" .
  \ ",**/tmp/*"

map <leader>vv  :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>cc  :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>mm  :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>js  :CommandTFlush<cr>\|:CommandT app/assets/javascripts<cr>
map <leader>css :CommandTFlush<cr>\|:CommandT app/assets/stylesheets<cr>
map <leader>rs  :CommandTFlush<cr>\|:CommandT spec<cr>
map <leader>ss  :CommandTFlush<cr>\|:CommandT app/services<cr>
map <leader>gg  :topleft 75 :vs Gemfile<cr>
map <leader>rr  :topleft 75 :vs config/routes.rb<cr>
map <leader>app :topleft 75 :vs config/application.rb<cr>
map <leader>sd  :topleft 75 :vs db/seeds.rb<cr>
map <leader>mig :CommandTFlush<cr>\|:CommandT db/migrate<cr>
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e   :edit %%<cr>
map ,t :w\|:!rspec spec
map ,r :w\|:!ruby %:t<cr>
map ,t :w\|:!rspec %:p<cr>
map ,, :w<cr>
map qq :q!<cr>
map vrc :vs ~/.vim/vimrc<cr>
map sc :source ~/.vim/vimrc<cr>

"Autocommands
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru} setfiletype ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}               setfiletype markdown
au BufRead,BufNewFile {COMMIT_EDITMSG}                      setfiletype gitcommit
au BufRead,BufNewFile {*.json}                              setfiletype javascript
au BufWritePre        {*.coffee,*.js,*.rb}                  :%s/\s\+$//e

"Omnicompletion, Keyword Completion
let g:SuperTabDefaultCompletionType = "<c-x><c-o>" " Omnicomplete

"Elm
let g:elm_setup_keybindings = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1
let g:elm_format_autosave = 1
