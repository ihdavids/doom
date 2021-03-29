;;; roblox.el -*- lexical-binding: t; -*-

; NoOpt build of the rcc
(defun bno ()
  (interactive)
  (progn
    (cd (concat (projectile-project-root) "build/ninja"))
    (message "[Building the RCC NoOpt]")
    (compile "ninja -C rcc\\vs2017\\x64\\noopt")
))

; Release build of the rcc
(defun bnr ()
  (interactive)
  (progn
    (cd (concat (projectile-project-root) "build/ninja"))
    (message "[Building the RCC Release]")
    (compile "ninja -C rcc\\vs2017\\x64\\release")
))

; Rebuild our setup
(defun cmsetup ()
  (interactive)
  (progn
    (cd (projectile-project-root))
    (compile "python.exe .\\Client\\cmake\\configure.py --msbuild --ninja")
    ;python.exe .\Client\cmake\configure.py --msbuild --ninja --clang-cl --lld-link
    ;copy .\build\ninja\rcc\llvm-vs2017\x64\noopt\compile_commands.json .\compile_commands.json -Confirm
))
; Rebuild our setup
(defun confset ()
  (interactive)
  (progn
    (cd (projectile-project-root))
    (compile "python.exe .\\Client\\cmake\\configure.py --msbuild --ninja --clang-cl --lld-link")
    ;python.exe .\Client\cmake\configure.py --msbuild --ninja --clang-cl --lld-link
    (copy-file (concat (projectile-project-root) "\\build\\ninja\\rcc\\llvm-vs2017\\x64\\noopt\\compile_commands.json") (concat (projectile-project-root) "\\compile_commands.json"))
    ;copy .\build\ninja\rcc\llvm-vs2017\x64\noopt\compile_commands.json .\compile_commands.json -Confirm
    (cmsetup)
))


(defun bclient ()
  (interactive)
  (progn
    (cd (concat (projectile-project-root) "build/ninja"))
    (message "[Building the Client NoOpt]")
    (compile "ninja -C client\\vs2017\\x64\\noopt")
))

(defun bstudio ()
  (interactive)
  (progn
    (cd (concat (projectile-project-root) "build/ninja"))
    (message "[Building the Studio NoOpt]")
    (compile "ninja -C studio\\vs2017\\x64\\noopt")
))
