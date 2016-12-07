;;; zero-inbox.el --- an implementation of a zero inbox workflow -*- lexical-binding: t; -*-

;; This is free and unencumbered software released into the public domain.

;; Author: Jonathan Sanoval <jsandoval@utp.edu.co>

;;; Code:

(require 'derived)

(define-derived-mode zero-inbox-mode special-mode "Zero inbox
Major mode for displaying the mails in inbox."
  (provide 'zero-inbox))

(defvar zero-inbox-mode-hook nil
  "*List of functions to call when entering zero-inbox-mode*.")

(defvar zero-inbox-mode-map nil
  "Keymap for zero-inbox-mode.")

(if zero-inbox-mode-map
    nil
  (setq zero-inbox-map (make-keymap)))

(defvar zero-inbox-mode-map
  (let ((map (make-sparse-keymap)))
    (prog1 map
      (suppress-keymap map)
      (define-key map "\e\t" 'ispell-complete-word) map
      )
    )
  "Keymap for `zero-inbox-moden'.")

(defun zero-inbox-load ()
  "Executes python process and displays mails."
  (unless (eq major-mode 'zero-inbox-mode)
    (zero-inbox-mode)))

(defun zero-inbox ()
  "Run zero inbox and display."
  (interactive)
  (zero-inbox-load))

;;; zero-inbox.el ends here
