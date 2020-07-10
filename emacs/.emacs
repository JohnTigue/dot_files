
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/"))

(load "desktop")
;;disabled for 27.x on 2020-06-27 (desktop-load-default)
;;disabled for 27.x on 2020-06-27 (desktop-read)
(desktop-save-mode 1) ;; added 2020-06-27

;;  via https://www.emacswiki.org/emacs/Desktop#toc5
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
(setq desktop-base-file-name "emacs-desktop")


(put 'downcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("84890723510d225c45aaff941a7e201606a48b973f0121cb9bcb0b9399be8cba" "61ae193bf16ef5c18198fbb4516f0c61a88f7b55b693a3b32d261d8501c4a54b" default)))
 '(inhibit-default-init t)
 '(org-agenda-files
   (quote
    ("~/jft/projects/jft/roles/whore/whore.org" "~/jft/projects/jft/org/money.org" "~/jft/projects/main/transport.org" "~/jft/projects/main/main.org" "~/jft/projects/tigue_com/tigue_com.org" "~/jft/projects/main/disfrutar.org")))
 '(package-selected-packages
   (quote
    (ein beacon htmlize rjsx-mode zenburn-theme anti-zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 160 :width normal :foundry "nil" :family "Menlo"))))
 '(org-level-1 ((t (:foreground "#000000"))))
 '(org-level-2 ((t (:foreground "#111111"))))
 '(org-level-3 ((t (:foreground "#222222"))))
 '(org-level-4 ((t (:foreground "#333333"))))
 '(org-level-5 ((t (:foreground "#505050"))))
 '(org-level-6 ((t (:foreground "#606060"))))
 '(org-level-7 ((t (:foreground "#808080"))))
 '(org-level-8 ((t (:foreground "#909090")))))
(put 'dired-find-alternate-file 'disabled nil)


;; JFT 2018-12-27
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)


;; JFT 2019-01-01 setting up org-protocol
(server-start)
;; guess this is already installed by default, these days:
;;   (add-to-list 'load-path "~/path/to/org/protocol/")
(require 'org-protocol)

;; TODO: why the backquote: "N.B. backtick and comma allow evaluation of expression when forming list"
(setq org-capture-templates `(
	("p" "Protocol" entry (file+headline "~/jft/projects/jft/org/captured.org" "Captured via the web, org-protocol")
         "* %^{Title}\nSource: %:link\nCaptured: %U\n#+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?" :empty-lines 1)

	("L" "Protocol Link" entry (file+headline "~/jft/projects/jft/org/captured.org" "Captured via the web, org-protocol")
        "* %? [[%:link][%:description]] \nCaptured: %U" :empty-lines 1)
))

(setq org-return-follows-link t)
(setq visible-bell t)
(setq indent-tabs-mode nil)
(setq tab-width 2)
(setq-default cursor-type 'bar)

(scroll-bar-mode -1)
(tool-bar-mode 0)

;; [2019-01-28] https://www.masteringemacs.org/article/introduction-to-ido-mode
;; Note: (ido-mode t) was already here, everything else was added 
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)
(setq ido-file-extensions-order '(".org" ".txt" ".js" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf"))

(load-theme 'anti-zenburn)

;; JFT [2019-01-24] setting up rjsx-mode
;; 1. https://joppot.info/en/2017/09/03/4018
;;    original: (add-to-list 'auto-mode-alist '(".*\.js\'" . rjsx-mode))
;; 2. https://www.emacswiki.org/emacs/AutoLoad
;;    This seemed to work: (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
;; JFT [2020-06-27] disabling next 6 to test new JSX parser
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
;;(add-hook 'rjsx-mode-hook
;;          (lambda ()
;;            (setq indent-tabs-mode nil) ;;Use space instead of tab
;;            (setq js-indent-level 2) ;;space width is 2 (default is 4)
;;            (setq js2-strict-missing-semi-warning nil))) ;;disable the semicolon warning TODO: do I really want that?

;; JFT [2019-09-06] committing to various recent finds
(setq org-duration-format (quote h:mm))

(beacon-mode 1)
(setq beacon-push-mark 35)
(setq beacon-color "#666600")

(setq ispell-program-name "/usr/local/bin/aspell")

;; JFT [2020-01-20]
;; All backup files into one dir: ~/.emacs_back_up_dir
(setq backup-directory-alist '(("." . "~/.emacs_back_up_dir")))
(setq backup-by-copying t)

;; [2020-02-21]
;; https://blog.aaronbieber.com/2017/03/19/organizing-notes-with-refile.html
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))


;; [2020-06-27] for <s and <q to work again
(require 'org-tempo)

;; via https://orgmode.org/manual/Editing-Source-Code.html
(setq org-src-block-faces '(("emacs-lisp" (:background "#EEE2FF"))
                            ("python" (:background "#E5FFB8"))))



;; https://github.com/gregsexton/ob-ipython/issues/52
;;(setq exec-path (append exec-path '("/usr/local/bin/")))

;; via https://emacs.stackexchange.com/a/22732/15536
;;(require 'ob-ipython)

;; via http://cachestocaches.com/2018/6/org-literate-programming/
  ;; Run/highlight code using babel in org-mode
;;  (org-babel-do-load-languages
;;   'org-babel-load-languages
;;   '(
;;     (python . t)
;;     (ipython . t)
;;     (sh . t)
 ;;    (shell . t)
     ;; Include other languages here...
;;     ))
  ;; Syntax highlight in #+BEGIN_SRC blocks
  (setq org-src-fontify-natively t)
  ;; Don't prompt before running code in org
  (setq org-confirm-babel-evaluate nil)
  ;; Fix an incompatibility between the ob-async and ob-ipython packages
;;  (setq ob-async-no-async-languages-alist '("ipython"))



(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

(message "end of .emacs reached successfully")
