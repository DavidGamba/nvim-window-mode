if exists('g:loaded_windowmode')
	finish
endif
let g:loaded_windowmode = 1

nnoremap <unique> <silent> <script> <Plug>WindowmodeEnter <SID>WindowmodeEnter
nnoremap <SID>WindowmodeEnter :<C-u>lua require('windowmode'):enter()<CR>

if !exists(':WindowmodeEnter')
	command! WindowmodeEnter :lua require('windowmode'):enter()<CR>
endif
