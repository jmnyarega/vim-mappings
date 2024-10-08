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

xnoremap <up> :m-2<CR>gv=gv
xnoremap <down> :m'>+<CR>gv=gv
xnoremap <leader>p "_dP

inoremap <C-c> <Esc>
inoremap <CapsLock> <Esc>
vnoremap <CapsLock> <Esc>
nnoremap <CapsLock> <Esc>

nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

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
nnoremap <leader>m :set mouse=<CR>

nnoremap <C-p> :GFiles <CR>
nnoremap <C-f> :GFiles <CR>
nnoremap <leader>zz :set nofoldenable <CR>
nnoremap <leader>z :set foldenable <CR>
nnoremap <C-B> :Buffers <CR>
nnoremap <C-G> :Git <CR>

noremap <F5> :CocList tasks run<CR>
let g:asynctasks_term_pos = 'right'
let g:asynctasks_term_rows = 10
let g:asynctasks_term_cols = 80

nnoremap <ESC> :cclose <CR>
nnoremap <leader><TAB> :copen <CR>
nnoremap <C-t> :terminal <CR>

nnoremap <silent><nowait> <leader>b  :Jumps <CR>
nnoremap <silent><nowait> <leader>/  :<C-u>AnyJumpArg <space>
nnoremap <silent><nowait> <leader>g  :<C-u>FloatermNew lazygit<cr>
let g:asyncrun_open = 6

" nnoremap <leader>s :CocSearch<Space>
" nnoremap <leader>f :Grepper <CR>
" nmap gs <plug>(GrepperOperator) 
" xmap gs <plug>(GrepperOperator)
" nmap <leader>g :Git <CR>


" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format)

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
" Remap keys for applying code actions at the cursor position
nmap <leader>a  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
" command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
" command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Open issues
nnoremap <silent><nowait> <space>w  :<C-u>CocList issues<cr>
" Show all diagnostics
nnoremap <silent><nowait> <space>d  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>

" Explorer
nnoremap <silent><nowait> <leader>n  :<C-u>CocCommand explorer<cr>

" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
