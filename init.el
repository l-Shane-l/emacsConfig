(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'hs-lint)
(defun my-haskell-mode-hook ()
    (local-set-key "\C-cl" 'hs-lint))
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)

(add-to-list 'load-path "~/shane/Desktop/hindent-master//elisp")
(require 'hindent)
(add-hook 'haskell-mode-hook #'hindent-mode)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b89a4f5916c29a235d0600ad5a0849b1c50fab16c2c518e1d98f0412367e7f97" default))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(hindent haskell-mode edit-indirect markdown-mode neotree flycheck-irony flycheck irony nyan-mode zygospore helm ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent clean-aindent-mode anzu)))
(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)

(setq c-default-style "linux")
(global-set-key (kbd "RET") 'newline-and-indent)
(add-hook 'prog-mode (lambda () (interactive) (setq show-trailing-whitespace 1)))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup)

(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

(require 'dtrt-indent)
(dtrt-indent-mode 1)

(setq dtrt-indent-verbosity 0)

(require 'undo-tree)
(global-undo-tree-mode)

(require 'semantic)

(global-semanticdb-minor-mode 1)

(add-to-list 'load-path "~/emacs_plugins/markdown-mode")
(autoload 'markdown-mode "markdown-mode"
	  "Major mode for editing Markdown file" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" .markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
	  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(add-to-list 'load-path "~/emacs_plugins/all-the-icons")
(require 'all-the-icons)

(add-to-list 'load-path "~/emacs_plugins/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(require 'helm)
(global-set-key (kbd "M-x") 'helm-M-x)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(semantic-mode 1)

(global-set-key (kbd "C-x <up>") 'windmove-up)

(global-set-key (kbd "C-x <down>") 'windmove-down)

(global-set-key (kbd "C-x <left>") 'windmove-left)

(global-set-key (kbd "C-x <right>") 'windmove-right)


(semantic-add-system-include "/usr/bin/clang")
(require 'projectile)
(require 'stickyfunc-enhance)
(projectile-global-mode)


(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))


(nyan-mode t)
(nyan-toggle-wavy-trail)
(nyan-start-animation)

(load-theme 'cyberpunk t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
