;;; zero-inbox.el --- an implementation of a zero inbox workflow -*- lexical-binding: t; -*-

;; This is free and unencumbered software released into the public domain.

;; Author: Jonathan Sanoval <jsandoval@utp.edu.co>

;;; Code:

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

(defun zero-inbox-mode ()
  "Mode for displaying new entries in zero-inbox."
  (interactive)
  (kill-all-local-variables)
  (use-local-map zero-inbox-mode-map)
  (setq major-mode 'zero-inbox-mode
        mode-name "zero-inbox"
        buffer-read-only t)
  (buffer-disable-undo)
  (run-hooks 'zero-inbox-mode-hook)
  (provide 'zero-inbox)
  )
;;; zero-inbox.el ends here
