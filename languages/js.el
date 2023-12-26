;;; languages/js.el -*- lexical-binding: t; -*-
(defun run-node-on-current-file ()
  "Run current JavaScript file with Node.js in an Emacs terminal emulator."
  (interactive)
  (let ((file-name (buffer-file-name)))
    (when file-name
      (split-window-right)    ;; Split the window to the right
      (other-window 1)        ;; Move to the new window
      (term "bash")           ;; Open a terminal emulator in the new window
      (term-send-raw-string (format "node %s\n" file-name))))) ;; Run node with the current file

(map! :map js-mode-map "M-p" #'run-node-on-current-file)

(after! svelte-mode
  (add-hook 'svelte-mode-hook #'lsp!))
(after! web-mode
  (add-to-list 'auto-mode-alist '("\\.svelte\\'" . svelte-mode)))
