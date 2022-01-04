if exists('g:loaded_vimo')
  finish
endif
let g:loaded_vimo = 1

call vimo#initialize()

command! -nargs=0 Vimo call vimo#Exec(0)
command! -nargs=0 VimoYesterday call vimo#Exec(24)
