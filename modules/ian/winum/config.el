;;; ian/winum/config.el -*- lexical-binding: t; -*-

(use-package! winum
  :config
  (setq window-numbering-scope            'global
	winum-reverse-frame-list          nil
        winum-auto-assign-0-to-minibuffer t
        winum-auto-setup-mode-line        t
        winum-mode-line-position          1
        winum-ignored-buffers             '(" *which-key*"))
  (map! :leader
	:desc "select window 1" "1" #'winum-select-window-1
	:desc "select window 2" "2" #'winum-select-window-2
	:desc "select window 3" "3" #'winum-select-window-3
	:desc "select window 4" "4" #'winum-select-window-4
	:desc "select window 5" "5" #'winum-select-window-5
	:desc "select window 6" "6" #'winum-select-window-6
	:desc "select window 7" "7" #'winum-select-window-7
	:desc "select window 8" "8" #'winum-select-window-8
	:desc "select window 9" "9" #'winum-select-window-9
  )
  (set-face-attribute 'winum-face nil :weight 'bold)
  (winum-mode)
)
