;;; helpers.el -*- lexical-binding: t; -*-

; TERMUX - running on a phone so less stuff is good!
; "aarch64-unknown-linux-android"
(defun phone-p   () (and (equal window-system nil) (eq 'gnu/linux system-type) (string-match-p "android" system-configuration)))
(defun windows-p () (and (equal system-type 'windows-nt)))
(defun linux-p   () (and (equal system-type 'gnu/linux) (not (string-match-p "android" system-configuration))))
(defun mac-p     () (and (equal system-type 'darwin)))

; Termux is going to be slower so configuration options
; will be special on my phone
(defmacro with-phone (&rest body)
  "Evaluate BODY if termux-p."
  (declare (indent defun))
  `(when (phone-p)
     ,@body))

; This uses system-type to make it easy to run
; code on one particular system
(defmacro with-system (type &rest body)
  "Evaluate BODY if `system-type' equals TYPE."
  (declare (indent defun))
  `(when (eq system-type ',type)
     ,@body))

; This uses system-type to make it easy to run
; code on one particular system
(defmacro with-windows (&rest body)
  "Evaluate BODY if `system-type' equals TYPE."
  (declare (indent defun))
  `(when (windows-p)
     ,@body))

(defmacro with-linux (&rest body)
  (declare (indent defun))
  `(when (linux-p)
     ,@body))

; This uses window-system to make it easy to run
; code specific to the terminal
(defmacro with-terminal (&rest body)
  "Evaluate BODY if `window-system equals TYPE."
  (declare (indent defun))
  `(when (or (eq window-system nil) (eq window-system 'pc))
     ,@body))

; This uses window-system to make it easy to run
; code specific to the terminal
(defmacro with-gui (&rest body)
  "Evaluate BODY if `window-system equals TYPE."
  (declare (indent defun))
  `(when (not (and (eq window-system nil) (eq window-system 'pc)))
     ,@body))


(defmacro with-file (file &rest body)
  "Evaluate BODY if a file exists and is readable"
  (declare (indent defun))
  `(when (file-readable-p ,file)
     ,@body))
