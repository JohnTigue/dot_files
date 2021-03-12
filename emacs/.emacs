;; JFT's .emacs init file

;; 2021-01-28 cleaned up PATH issues https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


;; 2021-01-28 disabled(message "In JFT .emacs. at head. exec-path=%s" exec-path)
;; 2021-01-28 disabled(message "In JFT .emacs. at head. $PATH=%s" (getenv "PATH"))
;; 2021-01-28 disabled(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
;; 2021-01-28 disabled(message "In JFT .emacs. at head. $PATH=%s" (getenv "PATH"))

;; https://emacs.stackexchange.com/a/44287
;; "in Emacs≥27, package-initialize is done for you before the beginning of the .emacs file."
;; 2021-01-28 disabled: (package-initialize)


(require 'package)
(add-to-list
  'package-archives
  '("org" . "https://orgmode.org/elpa/") t)
;; (add-to-list 'package-archives
;;   '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list
  'package-archives
  '("melpa" . "https://melpa.org/packages/"))
(add-to-list
  'package-archives
  '("gnu" . "https://elpa.gnu.org/packages/"))


;; 2021-01-26: slime disabled
;;(unless (package-installed-p 'scala-mode2)
;;  (package-refresh-contents) (package-install 'scala-mode2))
;;(add-to-list 'load-path "/usr/local/share/ensime/elisp/")
;;(require 'ensime)
;;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;; end of 2014-09-27 ensime setup


;; JFT 2013-02-13 getting spellcheck working on mac os x as per http://www.emacswiki.org/emacs/CocoAspell
(setq ispell-program-name "aspell")
(setq ispell-dictionary "english"
      ispell-dictionary-alist
      (let ((default '("[A-Za-z]" "[^A-Za-z]" "[']" nil
                       ("-B" "-d" "english" "--dict-dir"
                        "/Library/Application Support/cocoAspell/aspell6-en-6.0-0")
                       nil iso-8859-1)))
        `((nil ,@default)
          ("english" ,@default))))
;; end of spell checker config


;; JFT 2011-01-20: following chunk is from some web page saying how to get nxml-mode working on a mac.
;; This is not necessary if you put everything
;; in /usr/local/share/emacs/site-lisp, which is 
;; on the load-path already.
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
 
;; The elisp in rng-auto.el does all the work of 
;; setting up nXML mode for you.
;; 2021-01-28 disabled: (load "nxml-mode/rng-auto.el")
;; ;; Enter nXML mode whenever opening a file with any of these suffixes.
;; (setq auto-mode-alist
;;       (append (list
;;                '("\\.xml" . nxml-mode)
;;                '("\\.xsl" . nxml-mode)
;;                '("\\.xsd" . nxml-mode)
;;                '("\\.rng" . nxml-mode)
;;                '("\\.xhtml" . nxml-mode))
;;               auto-mode-alist))
;;  
;; (add-hook 'nxml-mode-hook 'turn-on-auto-fill)
;; ;; JFT 2011-01-20: end of bit about nxml-mode working on a mac. Everything below is old .emacs


(setq org-capture-templates 
  (quote 
    (                                                                               
      ("t" "Triage later" entry
        (file+olp+datetree "~/at/main/org/capture_main.org" "Triage") "* TODO %^{Headline}" :immediate-finish t )
      ("p" "URL Link & Quote" entry
        (file+olp+datetree "~/at/main/org/capture_web.org") "* %:description\nSource: %:link\n#+begin_quote\n%i\n#+end_quote\n\n\n%?")
      ("L" "URL Link Only" entry
        (file+olp+datetree "~/at/main/org/capture_web.org") "* %?[[%:link][%:description]] \nCaptured On: %U")
      ;;("l" "Log Time" entry (file+datetree "~/jft/projects/jft/roles/exec/time-log.org") "** %U - %^{Activity}  :TIME:") 
      ;;("m" "Music" table-line (file+headline "~/org/capture.org" "Music heard") "| %^{Artist} | %^{Song} | %? |")
  )))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "nil" :family "Menlo"))))
 '(cursor ((t nil)))
 '(fringe ((t (:inherit nil))))
 '(highlight ((t (:background "#e0e0e0"))))
 '(isearch ((((class color) (background light)) (:background "gold" :foreground "black"))))
 '(mode-line ((t (:background "#e0e0e0" :foreground "#704d70" :box (:line-width -1 :style released-button)))))
 '(org-agenda-date-today ((t (:foreground "#000010" :slant italic :weight bold))))
 '(org-checkbox ((t (:background "#a8a8a8" :foreground "#000010" :box (:line-width 1 :style released-button)))))
 '(org-clock-overlay ((t nil)))
 '(org-date ((t (:foreground "#000050" :underline t))))
 '(org-drawer ((t (:foreground "#000050"))))
 '(org-hide ((((background light)) (:foreground "grey80"))))
 '(org-level-1 ((t (:foreground "#010673"))))
 '(org-level-2 ((t (:foreground "#001c82"))))
 '(org-level-3 ((t (:foreground "#002d90"))))
 '(org-level-4 ((t (:foreground "#003d9d"))))
 '(org-level-5 ((t (:foreground "#004daa"))))
 '(org-level-6 ((t (:foreground "#005db5"))))
 '(org-level-7 ((t (:foreground "#006cc0"))))
 '(org-level-8 ((t (:foreground "#037cca"))))
 '(org-meta-line ((t (:inherit font-lock-comment-face :foreground "#000050"))))
 '(org-mode-line-clock ((t (:background "#e0e0e0" :foreground "#232333"))))
 '(org-scheduled ((t (:foreground "#000050"))))
 '(org-scheduled-previously ((t (:foreground "#700000"))))
 '(org-scheduled-today ((t (:foreground "#705006"))))
 '(org-special-keyword ((t (:inherit font-lock-comment-face :foreground "#000050"))))
 '(org-table ((t (:foreground "#282828"))))
 '(org-time-grid ((t (:foreground "#606060"))))
 '(org-upcoming-deadline ((t (:inherit font-lock-keyword-face :foreground "#003000"))))
 '(org-warning ((t (:foreground "#8f6a06" :underline nil :weight bold))))
 '(text-cursor ((t (:foreground "white" :background "Black")))))


;; cursor
;; JFT 2017-05-05: disabled. Perhaps this is messing with zenburn theme
;;(setq default-frame-alist
;;       '((cursor-color . "black")
;;         (cursor-type . bar)))


;; jft 2006-04-20 confirm create non-existant buffer during switch-to-buffer
(defadvice switch-to-buffer (around confirm-non-existing-buffers activate) 
  "Switch to non-existing buffers only upon confirmation." 
  (interactive "BSwitch to buffer: ") 
  (if (or (get-buffer (ad-get-arg 0)) 
          (y-or-n-p (format "´%s' does not exist, create? "(ad-get-arg 0)))) 
      ad-do-it)) 


;; highlight region between point and mark
;; JFT-TODO: there more to this than I'm using. C-h d transient for more info.
(transient-mark-mode t)

;; indentation
;;(setq c-basic-offset 2)
;;
;; Customizations for all modes in CC Mode.
;;(defun my-c-mode-common-hook ()
;;  (c-set-offset 'defun-block-intro '+++)
;;  )
;;
;;(add-hook 'java-mode-hook 'my-c-mode-common-hook)
;; indentation for Java
;;(defun my-java-mode-hook ()
;;  ;; my customizations for all of java-mode 
;;  (setq tab-width 8
;;     ;; this will make sure spaces are used instead of tabs
;;     indent-tabs-mode nil)
;;  (c-set-offset 'block-open '0)
;;  (c-set-offset 'class-open '+)
;;  (c-set-offset 'defun-block-intro '0)
;;  (c-set-offset 'inline-open '+++)
;;  (c-set-offset 'statement-block-intro '+)
;;  (c-set-offset 'statement-continue '0)
;;  (c-set-offset 'substatement-open '+)
;;  ;; other customizations can go here
;;  )
;;
;;;; desparate and failed: something about java-mode having special hook order
;;(add-hook 'c-mode-common-hook 'my-java-mode-hook)
;;(add-hook 'java-mode-hook 'my-java-mode-hook)


;;;;;;;;;;;;;;;;;;;;;;;;
;; as per http://www.jwz.org/doc/tabs-vs-spaces.html
;; added 2003-03-23:
(setq indent-tabs-mode nil)
(setq c-basic-indent 4)
(setq tab-width 4)
(defun java-mode-untabify ()
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward "[ \t]+$" nil t)
        (delete-region (match-beginning 0) (match-end 0)))
      (goto-char (point-min))
      (if (search-forward "\t" nil t)
          (untabify (1- (point)) (point-max))))
    nil)

  (add-hook 'java-mode-hook 
            '(lambda ()
               (make-local-variable 'write-contents-hooks)
               (add-hook 'write-contents-hooks 'java-mode-untabify)))
;; end as per http://www.jwz.org/doc/tabs-vs-spaces.html


;; Desktop: files and points saver
;;jft-killed the next load on 2002-10-04 as left xemacs: 
;;but then on 2003-04-16, reenabling it seemed to make desktop work again... 
;; 2005-01-16 killed b/c not here anymore.
;; 2005-12-04 reenabled b/c back in Dell
;; 2020-11-23: disabled b/c v24 => v27.1 problems
;;(load "desktop")
;;(desktop-load-default)
;;(desktop-read)


;; JFT 2004-02-25 hacking desparately to get accidental clicks on
;; touch pad to not move point. Double click still works.
;; JFT 2011-11-28 testing disabling these 3 lines: (global-unset-key [down-mouse-1])
;; JFT 2011-11-28 testing disabling these 3 lines: (global-unset-key [up-mouse-1])
;; JFT 2011-11-28 testing disabling these 3 lines: (global-set-key [mouse-1] nil)

;; JFT 2004-03-01 Ant Console. No, that's ant-mode. which does what?
;;(load "ant")

;; JFT 2009-08-24: get rid of silly toolbar
(tool-bar-mode 0)

(put 'downcase-region 'disabled nil)

;; JFT 2011-11-28
(ido-mode t)

;; JFT 2011-11-16 activating org-mode as per http://orgmode.org/orgguide.pdf section 1.3
;; The following lines are always needed. Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ;; JFT-this doesn't seem to be necessary but can't hurt
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; JFT 2011-11-23 setting up org-mode's capture:
;;  updated org-mode to 7.7 as per http://stackoverflow.com/questions/3622603/org-mode-setup-problem-when-trying-to-use-capture
;; JFT disabled on 2013-02-28 (add-to-list 'load-path "/Users/john/.emacs.d/site-lisp/org-7.7/lisp")
(require 'org-install)
(require 'org) ;; without this org-directory is undefined: Symbol's value as variable is void: org-directory

;;  and now can setup capture: JFT-TODO is org-directory set? I.e. where is this concat'd filename going
(setq org-default-notes-file (concat org-directory "/notes.org"))

(define-key global-map "\C-cc" 'org-capture)
(setq org-return-follows-link t)

;; JFT 2013-04-26 setting up org-protocol to receive org-mode info from external programs
;;   As per http://orgmode.org/worg/org-contrib/org-protocol.html#sec-2
(server-start)
;; JFT hacking out 2016-09-08 (add-to-list 'load-path "~/.emacs.d/elpa/org-20130408/")
(require 'org-protocol)

;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/w3m/")
;;(require 'w3m-load)
(put 'dired-find-alternate-file 'disabled nil)

;; 2015-04-04 Living in the command line, backup~ files all over the place are a drag. One even got into git repo.
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5f6eea84fb7ecacd74cd8d61e59e3839a2815f455313917c3c7a6521329cfdd4" "cab317d0125d7aab145bc7ee03a1e16804d5abdfa2aa8738198ac30dc5f7b569" "bea5fd3610ed135e6ecc35bf8a9c27277d50336455dbdd2969809f7d7c1f7d79" "599f1561d84229e02807c952919cd9b0fbaa97ace123851df84806b067666332" "5cd0afd0ca01648e1fff95a7a7f8abec925bd654915153fb39ee8e72a8b56a1f" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" "3e335d794ed3030fefd0dbd7ff2d3555e29481fe4bbb0106ea11c660d6001767" "cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" "bfdcbf0d33f3376a956707e746d10f3ef2d8d9caa1c214361c9c08f00a1c8409" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "39fe48be738ea23b0295cdf17c99054bb439a7d830248d7e6493c2110bfed6f8" "bb4733b81d2c2b5cdec9d89c111ef28a0a8462a167d411ced00a77cfd858def1" "12b7ed9b0e990f6d41827c343467d2a6c464094cbcc6d0844df32837b50655f9" default))
 '(inhibit-startup-screen t)
 '(js2-basic-offset 2 t)
 '(js2-indent-switch-body t)
 '(js2-mode-indent-ignore-first-tab t)
 '(org-agenda-files
   '("~/at/main/org/capture_main.org" "~/at/devel/org/emacs.org" "~/at/main/org/transport.org" "~/at/main/org/bodymind.org" "~/at/main/org/habits.org" "~/at/main/org/manbair.org" "~/at/main/org/socialize.org" "~/at/main/org/money.org" "~/at/main/org/main.org" "~/at/main/org/disfrutar.org" "~/at/main/org/computers.org"))
 '(org-babel-load-languages '((js . t) (shell . t) (emacs-lisp . t)))
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(org-level-color-stars-only t)
 '(org-link-frame-setup
   '((vm . vm-visit-folder-other-frame)
     (vm-imap . vm-visit-imap-folder-other-frame)
     (gnus . org-gnus-no-new-news)
     (file . find-file)
     (wl . wl-other-frame)))
 '(org-priority-faces '((65 . "#a02020") (66 . "#900007") (67 . "#5d0000")))
 '(package-selected-packages
   '(lsp-mode vdiff beacon exec-path-from-shell anti-zenburn-theme))
 '(split-width-threshold 135))

;; 2015-04-10: Umm, what happend to the visible bell setting? 2015-05-10 it's working
(setq visible-bell t)
;;(setq visible-bell nil) ;; The default
(setq ring-bell-function 'ignore)

;; http://orgmode.org/manual/Clocking-work-time.html
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; As per:
;; http://stackoverflow.com/questions/4177929/how-to-change-the-indentation-width-in-emacs-javascript-mode
;; http://stackoverflow.com/a/4178127/4669056
;; Follow disabled 2016-09-07 when adopted js2-mode
;;(defun my-js-mode-hook ()
;;  (message "my-jscpt-mode-hook")
;;  (setq indent-tabs-mode nil tab-width 2 js-indent-level 2)
;;  )
;;(add-hook 'js-mode-hook 'my-javascript-mode-hook)

;; JFT 2016-09-07 Javascript indentation turned into js2-mode install and adopt
;; js2-mode 
;; 2020-11-23: disabled b/c v27 has built in JSX
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq-default js2-basic-offset 2)

;; JFT 2016-05-20 return at end of link was being interpreted as follow link, not new line, which is desired http://emacs.stackexchange.com/a/20004
(defun bss/my-org-return ()
  "Insert newline if we at beginng or end of line"
  (interactive)
  (if (or (eolp) (bolp))
      (newline-and-indent)
    (org-return)))
(define-key org-mode-map (kbd "<return>") 'bss/my-org-return)

;; JFT 2016-09-19 https://magit.vc/manual/magit.html#Getting-started
(global-set-key (kbd "C-x g") 'magit-status)

;; emacs-gulpjs: reads gulpfile.js to lists task ido style... and runs tasks, like in *shell* buffer
;; https://github.com/stevenremot/emacs-gulpjs
;;(add-to-list 'exec-path "PATH1")
;; 2021-01-28 disabled: (add-to-list 'load-path "/Users/john/jft/gits/jft_emacs/gulpjs")
;; 2021-01-28 disabled: (require 'gulpjs)
;; 2021-01-28 disabled: ;; JFT 2016-09-21 getting gulp callable
;; 2021-01-28 disabled: (setq exec-path (append exec-path '("/usr/local/bin/")))

;; JFT 2017-04-07 addressing the C-z crash
;; as per: http://stackoverflow.com/questions/28202546/hitting-ctrl-z-in-emacs-freezes-everything
(global-unset-key (kbd "C-z"))

;; JFT 2017-04-07 indentation in JavaScript
;; as per: http://stackoverflow.com/questions/4177929/how-to-change-the-indentation-width-in-emacs-javascript-mode
(setq js-indent-level 0)
(setq js-indent-level 2)

;; JFT 2017-04-07 no tabs
(setq-default indent-tabs-mode nil)

;; JFT 2017-04-23
;; dired, on first invoke was complaining
;;   ls does not support --dired; see `dired-use-ls-dired' for more details."
;; So according to: http://emacsredux.com/blog/2015/05/09/emacs-on-os-x/
;;   (this depends on brew install coreutils, to provide gls
(setq insert-directory-program (executable-find "gls"))

;; JFT 2017-05-05
(scroll-bar-mode -1)
;; http://ergoemacs.org/emacs/emacs_playing_with_color_theme.html
(load-theme 'anti-zenburn)
;; https://emacs.stackexchange.com/a/20004
;; TODO: See line 307, repeat?
(defun bss/my-org-return ()
  "Insert newline if we at beginng or end of line"
  (interactive)
  (if (or (eolp) (bolp))
  (newline-and-indent)
  (org-return)))
(define-key org-mode-map (kbd "<return>") 'bss/my-org-return)

;; JFT 2018-01-13
;; formating org's clock table summaries
;; See https://stackoverflow.com/a/46194559/4669056
(setq org-duration-format (quote h:mm))

;; https://emacs.stackexchange.com/a/393/15536
(setq-default cursor-type 'bar) 

;; For template expansion (i.e. <q, <s, etc.) in org: https://orgmode.org/manual/Structure-Templates.html
(require 'org-tempo)

;; 2021-02-20: re-added https://github.com/Malabarba/beacon
(beacon-mode 1)
(setq beacon-push-mark 35)
(setq beacon-color "#666600")

;;; 2021-02-25 auto-save files should all go to one directory, to be out of the way
;;; rather than litering the filesystem
;;; https://www.emacswiki.org/emacs/AutoSave#h5o-1
;;; WARNING: trailing slash and restart required
(setq auto-save-file-name-transforms
   `((".*" "~/.emacs.d/auto-saves/" t)))


;;; Config orgmode priorities i.e. [#A], [#B], [#C] to be reds
;;; as per https://superuser.com/a/479768
;;; This somehow got taken over by custom-set-variables above, 
;;; '(org-priority-faces '((65 . "#a02020") (66 . "#900007") (67 . "#5d0000")))

;;; [2021-03-07, experimenting with todo-keywords for Kanban
(setq org-todo-keywords '((sequence "TODO" "DOIN" "DONE")))


(message "In JFT .emacs, at tail. exec-path=%s" exec-path)
