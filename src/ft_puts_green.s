; @adjivas - github.com/adjivas. See the LICENSE
; file at the top-level directory of this distribution and at
; https://github.com/adjivas/libftasm/blob/master/LICENSE.
;
; This file may not be copied, modified, or distributed
; except according to those terms.

global _ft_puts_green
extern _ft_puts

segment .text

color: db `\033`,"[1;32m"
_green:
  lea rsi, [rel color]
  mov rdi, 1               ; rdi <- 1                      (fildes)
  mov rdx, 7               ; rdx <- 7                      (nbytes)
  mov rax, 0x2000004       ; rax <- 0x2000004               write
  syscall
  jmp end                  ; jump to end

_ft_puts_green:
  push rdi                 ; stack <<- rdi
  call _green              ; rax <- _green
  pop rdi                  ; stack ->> rdi
  call _ft_puts            ; rax <- _ft_puts

end:
  ret                      ; leave
