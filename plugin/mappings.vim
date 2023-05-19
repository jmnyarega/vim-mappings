let mapleader = " "

no <up> :m .-2 <CR> ==
no <down> :m .+1 <CR> ==
ino <down> <Nop>
ino <up> <Nop>
ino <left> <Nop>
ino <right> <Nop>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap <C-_> :Commentary<CR>
vnoremap <leader>y "+y

xnoremap f :m-2<CR>gv=gv
xnoremap z :m'>+<CR>gv=gv
xnoremap <leader>p "_dP

inoremap <C-c> <esc>

nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap <C-e> :bdelete <CR>
nnoremap s :w<CR>
nnoremap <C-w> :q!<CR>
nnoremap <right> :vertical resize -10 <CR>
nnoremap <left> :vertical resize +10 <CR>
nnoremap <silent> + :resize +1 <CR>
nnoremap <silent> - :resize -1 <CR>
nnoremap <silent> \| :vsplit % <CR>
nnoremap <silent> - :split % <CR>
noremap  <c-_>  :Commentary<CR>
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <leader>d "_d
nnoremap <leader>i :set mouse=a<CR>
nnoremap <leader>I :set mouse=<CR>
nnoremap gt : <space>
nnoremap <Leader>1 CR>

nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <F5> :make! <CR>
nnoremap <leader>h :cfirst <CR>
nnoremap <leader>j :cprev <CR>
nnoremap <leader>k :cnext <CR>
nnoremap <leader>l :clast <CR>
nnoremap <ESC> :cclose <CR>
nnoremap <TAB> :copen <CR>
nnoremap <C-t> :terminal <CR>

nnoremap <leader>* :Grepper -cword -noprompt <CR>
nnoremap <leader>f :Grepper <CR>
nmap gs <plug>(GrepperOperator) 
xmap gs <plug>(GrepperOperator)
