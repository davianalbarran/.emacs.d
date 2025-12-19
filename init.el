(add-to-list 'load-path "~/.emacs.d/lisp")
(let ((default-directory  "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)

(setq custom-theme-directory "~/.emacs.d/lisp/themes")

(load-theme 'cappuccino-noir t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(add-to-list 'exec-path' "~/.nvm/versions/node/v24.12.0/bin/")

(setq package-selected-packages '(lsp-mode lsp-ui yasnippet lsp-treemacs helm-lsp
    projectile hydra flycheck company company-box avy which-key helm-xref dap-mode web-mode multiple-cursors))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

(use-package lsp-ui)

(use-package company-box
  :hook (company-mode . company-box-mode))

(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
(add-hook 'csharp-mode-hook 'lsp)
(add-hook 'before-save-hook #'lsp-format-buffer t t)

(setq company-minimum-prefix-length 1
      company-idle-delay 0.0
      )

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode)
  (setq lsp-modeline-diagnostics-scope :workspace))

(setq org-log-done 'note)

(keymap-global-set "C-z" 'shell)
(keymap-global-set "C-c C-t" 'org-agenda)

 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7f0f6f6f8ca1b451a1fbb5a27c3fb904b939ea26fbecbf17caa4b64d67ffeea1"
     default))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7f0f6f6f8ca1b451a1fbb5a27c3fb904b939ea26fbecbf17caa4b64d67ffeea1"
     "d20b3f5c1adf9cf2e2ad40a0f6172b32d53faa0489478cf359d2bdf432b9d8a4"
     default))
 '(package-selected-packages
   '(avy company company-box dap-mode flycheck helm-lsp helm-xref hydra
	 lsp-mode lsp-treemacs lsp-ui multiple-cursors projectile
	 web-mode which-key yasnippet)))
