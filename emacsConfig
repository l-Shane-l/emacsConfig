(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
(require 'setup-cedet)
(require 'setup-editing)
(setq c-default-style "linux")
(global-set-key (kbd "RET") 'newline-and-indent)
(add-hook 'prog-mode (lambda () (interactive) (setq show-trailing-whitespace 1)))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

(require 'dtrt-indent)
(dtrt-indent-mode 1)

(setq dtrt-indent-verbosity 0)

(require 'ws-butler)
(add-hook 'c-mode-common-hook 'ws-butler-mode)

(require 'yasnippet)
(yas-global-mode 1)

;(require 'smartparens-config)
;(show-smartparens-global-mode +1)
;(smartparens-gloabl-mode 1)

(global-set-key (kbd "<f5>") (lambda ()
                              (interactive)
                              (setq-local compilation-read-command nil)
                              (call-interactively 'compile)))

;(sp-with-modes '(c-mode c++-mode)
;               (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
;               (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
;                                                         ("* ||\n[i]" "RET"))))

(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map [(tab)] 'company-gtags)
(define-key c++-mode-map [(tab)] 'company-gtags)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'c-mode-common-hook 'hs-minor-mode)

(setq
 gdb-many-windows t
 gdb-show-main t
 )

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
;(global-semantic-idle-scheduler 1)
(semantic-mode 1)

(semantic-add-system-include "~/Beatspeak/openCV_Install_Script/opencv/include" 'c++-mode)
(semantic-add-system-include "~/linux/kernel")
(semantic-add-system-include "~/linux/include")

(require 'helm-gtags)
(require 'projectile)
(require 'stickyfunc-enhance)
(setq-local eldoc-documentation-function #'ggtags-eldoc-functions)
(projectile-global-mode)
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)


(load-theme 'cyberpunk t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b89a4f5916c29a235d0600ad5a0849b1c50fab16c2c518e1d98f0412367e7f97" default))
 '(package-selected-packages
   '(projectile-codesearch projectile-git-autofetch helm-company counsel ivy company-c-headers cyberpunk-theme zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
