execute pathogen#infect()
syntax on
filetype plugin indent on
call pathogen#helptags()

" tab options
set nocompatible
set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" make things look better
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
"set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
let mapleader = "\<Space>"

" Searching and moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
nnoremap <tab> %
vnoremap <tab> %

"Handle long lines correctly
set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85

" force yourself to use navigation keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" remove help from F1 key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>



"Gundo and other stuffs
nnoremap <leader>0 :GundoToggle<CR>
nnoremap <leader>9 :NERDTreeToggle<CR>
nnoremap <leader>8 :GitGutterLineHighlightsToggle<CR>
nnoremap <leader>7 :Thumbnail<CR>
nnoremap <leader>6 :Scratch<CR>
map <F4> <Esc>:LLPStartPreview<CR>
map <F5> <Esc>:LanguageToolCheck<CR><CR>
map <F6> <Esc>:setlocal spell spelllang=en<CR>
"map <F7> <Esc>:setlocal spell spelllang=fr<CR>
"map <F8> <Esc>z=
map <F9> <Esc>:setlocal nospell<CR>
:set pastetoggle=<F10>
let g:languagetool_jar='~/.vim/LanguageTool-2.9/languagetool-commandline.jar'


" PLugin, bundle configuration
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
set laststatus=2

" ---- MUTT ---- "
au BufRead /tmp/mutt-* set tw=72
au BufRead /tmp/mutt-* setlocal fo+=aw


" GUI options
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" fold
set foldmethod=indent
set foldnestmax=10
set nofoldenable

" Undo
set undofile                " Save undo's after file closes
set undodir=~./.tmp/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set foldlevel=5

"swap files
set dir=~/.tmp/swap//,/var/tmp//,/tmp//,.

" color scheme
"syntax enable
"set background=dark
"colorscheme base16-default
colorscheme monokai
set t_Co=256  " vim-monokai now only support 256 colours in terminal."

" Search highlight
:highlight Search ctermfg=black
:highlight Search guifg=black
:highlight Normal ctermfg=white guibg=black
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>
    " EITHER blink the line containing the match...
    function! HLNext (blinktime)
        set invcursorline
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        set invcursorline
        redraw
    endfunction

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" escape key
inoremap ,, <Esc>
inoremap jk <Esc>
"inoremap <CR> <Esc>
"nnoremap <CR> i

" leader mapping
nmap <leader>w :w<CR>

" smooth scrool
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" vim-easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap <leader>s <Plug>(easymotion-s)
nmap <leader>t <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1

"insearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#consistent_n_direction = 1
let g:incsearch#magic = '\v' " very magic

" map tab to autocompletion in insert mode
" imap <Tab> <C-P>
imap <leader><Tab> <C-P>


" format a paragraph
nnoremap <silent> Q gqip

" vim-latex-live-preview
let g:livepreview_previewer = 'zathura'

let g:commit_after = 2

" intelligent paste
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rt :call TrimWhiteSpace()<CR>
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

" calendar.vim
let g:calendar_google_calendar = 1
let g:calendar_date_full_month_name=1
let g:calendar_week_number=1
let g:calendar_view = "week"


if has("gui_running")
  if has("gui_gtk2")
    set guifont=inconsolata\ 8
  elseif has("gui_photon")
    set guifont=inconsolata\ 8
  elseif has("gui_kde")
    set guifont=inconsolata\ 8
  elseif has("x11")
    set guifont=inconsolata\ 8
  else
    set guifont=inconsolata\ 8
  endif
endif

"Unite vim
"https://github.com/shougo/unite.vim
"http://www.codeography.com/2013/06/17/replacing-all-the-things-with-unite-vim.htmlo
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>f :Unite -no-split -buffer-name=files   -start-insert file_rec<cr>
nnoremap <leader>b :Unite -no-split -buffer-name=buffer  buffer<cr>

" Add folding toggle method.
" You can manually set fold by using
" zf#j creates a fold from the cursor down # lines.
" zf/string creates a fold from the cursor to string
" https://www.linux.com/learn/tutorials/442438-vim-tips-folding-fun
nmap <Leader>fm :call <SID>ToggleFold()<CR>
function! s:ToggleFold()
    if &foldmethod == 'indent'
        let &l:foldmethod = 'manual'
    else
        let &l:foldmethod = 'indent'
    endif
    echo 'foldmethod is now ' . &l:foldmethod
endfunction

" Retab file
nnoremap <leader>= mrgg=G`r


" Highlight current position
map  <F8> :set invcursorline<CR>
imap <F8> <Esc>:set invcursorline<CR>a
map  <F7> :set invcursorcolumn<CR>
imap <F7> <Esc>:set invcursorcolumn<CR>a

" Python testing
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix


augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 100
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%100v.*/
    autocmd FileType python set nowrap
    autocmd FileType text highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType text match Excess /\%100v.*/
    autocmd FileType text set nowrap
    autocmd FileType plaintex highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType plaintex match Excess /\%100v.*/
    autocmd FileType plaintex set nowrap
    autocmd FileType tex highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType tex match Excess /\%100v.*/
    autocmd FileType tex set nowrap
    augroup END
