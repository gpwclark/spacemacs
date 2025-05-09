;; hacks
;;; FILES
;;     SPC f t toggles file tree
;;;    SPC p f (projectile find) to quickly find and open files in a project.
;;;    SPC s p to search in the project
;;; TERM shell layer docs: https://develop.spacemacs.org/layers/+tools/shell/README.html
;;;    SPC ' open terminal
;;; LAYOUT / windowing: https://develop.spacemacs.org/layers/+spacemacs/spacemacs-layouts/README.html
;;;    `SPC l #' to swtich to different numbered workspaces
;;;    `'SPC l ?`' to show help (uses eyebrowse/spacemacs-layouts)
(setq-default evil-want-keybinding nil)

;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
	 ;; Example of useful layers you may want to use right away.
	 ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
	 ;; <M-m f e R> (Emacs style) to install them.
	 ;; ----------------------------------------------------------------
	 auto-completion
	 better-defaults
	 ;; list of debuggers: https://github.com/realgud/realgud/wiki/Debuggers-Available
	 (debug :variables debug-additional-debuggers '("gdb"))
	 (spacemacs-layouts :variables
						spacemacs-layouts-restrict-spc-tab t)
	 helm
	 git
	 markdown
	 neotree
	 ;; ----------------------------------------------------------------
	 ;; lang specific
	 ;; ----------------------------------------------------------------
	 erlang
	 elixir
	 (shell :variables
			shell-default-shell 'eshell
			;;shell-default-term-shell "/bin/zsh"
			;;shell-default-term-shell "~/development/sl-sh-dev/slosh/target/release/slosh"
			shell-default-height 25
			shell-default-position 'bottom)
	 spell-checking
	 syntax-checking
	 lsp
	 (clojure :variables
			  clojure-enable-linters 'clj-kondo)
	 emacs-lisp
	 (rust :variables
		   lsp-rust-analyzer-cargo-auto-reload t
		   rustic-format-on-save t)
	 (org :variables
		  org-todo-dependencies-strategy 'naive-auto
		  org-enable-hugo-support t
		  org-projectile-file "TODOs.org")
	 )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.

   dotspacemacs-additional-packages '(editorconfig)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists  '((recents . 5) (projects . 7))
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
						 spacemacs-light
						 solarized-light
						 solarized-dark
						 leuven
						 monokai
						 zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("IBM Plex Mono"
							   :size 18
							   :weight normal
							   :width normal
							   :powerline-scale 1.1)
   ;; The leader key
   ;; (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")


   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).

   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq clojure-enable-fancify-symbols t)
  (setq-default evil-escape-key-sequence "jk")
  (setq-default tab-width 4)
  (setq-default indent-tabs-mode t)
  (setq-default electric-indent-inhibit t)
  (setq-default evil-shift-width 4))

(setq-default dotspacemacs-install-packages 'used-only)
;;(setq-default dotspacemacs-install-packages '())

;; something something terminal configurations {{{
(setq terminal-here-linux-terminal-command 'st)
(setq terminal-here-mac-terminal-command 'iterm2)

;; (defun config//term-normal-state ()
;;   "Enable `term-line-mode' when in normal state in `term-mode' buffer
;;  and make the buffer read only."
;;   (term-line-mode)
;;   (read-only-mode 1))
;;
;; (defun config//term-insert-state ()
;;   "Enable `term-char-mode' when in insert state in a `term-mode' buffer."
;;   (when (get-buffer-process (current-buffer))
;;	(read-only-mode -1)
;;	(term-char-mode)
;;	))
;;
;; (defun config//term-evil-bindings ()
;;   "Enable term support for vim and hybrid editing styles."
;;   (add-hook 'evil-hybrid-state-entry-hook 'config//term-insert-state nil t)
;;   (add-hook 'evil-insert-state-entry-hook 'config//term-insert-state nil t)
;;   (add-hook 'evil-hybrid-state-exit-hook 'config//term-normal-state nil t)
;;   (add-hook 'evil-insert-state-exit-hook 'config//term-normal-state nil t))
;;
;; (setq term-char-mode-point-at-process-mark t)
;; (add-hook 'term-mode-hook 'config//term-evil-bindings)

(defun vterm-evil-insert ()
  (interactive)
  (vterm-goto-char (point))
  (call-interactively #'evil-insert))

(defun vterm-evil-append ()
  (interactive)
  (vterm-goto-char (1+ (point)))
  (call-interactively #'evil-append))

(defun vterm-evil-delete ()
  "Provide similar behavior as `evil-delete'."
  (interactive)
  (let ((inhibit-read-only t)
		)
	(cl-letf (((symbol-function #'delete-region) #'vterm-delete-region))
	  (call-interactively 'evil-delete))))

(defun vterm-evil-change ()
  "Provide similar behavior as `evil-change'."
  (interactive)
  (let ((inhibit-read-only t))
	(cl-letf (((symbol-function #'delete-region) #'vterm-delete-region))
	  (call-interactively 'evil-change))))

(defun my-vterm-hook()
  (evil-local-mode 1)
  (evil-define-key 'normal 'local "a" 'vterm-evil-append)
  (evil-define-key 'normal 'local "d" 'vterm-evil-delete)
  (evil-define-key 'normal 'local "i" 'vterm-evil-insert)
  (evil-define-key 'normal 'local "c" 'vterm-evil-change))

(add-hook 'vterm-mode-hook 'my-vterm-hook)
;; }}}





;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(editorconfig erlang ob-elixir flycheck-mix flycheck-credo alchemist company elixir-mode winum uuidgen toc-org powerline org-plus-contrib org-bullets markdown-mode link-hint parent-mode projectile request gitignore-mode git-link pos-tip flycheck flx evil-visual-mark-mode evil-unimpaired magit magit-popup git-commit ghub with-editor smartparens iedit evil-ediff anzu evil goto-chg undo-tree eshell-z dumb-jump f dash diminish column-enforce-mode hydra inflections edn multiple-cursors paredit yasnippet s peg eval-sexp-fu highlight cider spinner queue pkg-info clojure-mode epl bind-map bind-key packed helm avy helm-core popup async xterm-color shell-pop multi-term eshell-prompt-extras esh-help ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe use-package spacemacs-theme spaceline smooth-scrolling smeargle restart-emacs rainbow-delimiters quelpa popwin persp-mode pcre2el paradox page-break-lines orgit open-junk-file neotree move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum linum-relative leuven-theme info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-ag google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger gh-md flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu elisp-slime-nav define-word clj-refactor clean-aindent-mode cider-eval-sexp-fu buffer-move bracketed-paste auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(gdb-many-windows 1)
   '(package-selected-packages
	 '(realgud test-simple loc-changes load-relative editorconfig erlang ob-elixir flycheck-mix flycheck-credo alchemist company elixir-mode winum uuidgen toc-org powerline org-plus-contrib org-bullets markdown-mode link-hint parent-mode projectile request gitignore-mode git-link pos-tip flycheck flx evil-visual-mark-mode evil-unimpaired magit magit-popup git-commit ghub with-editor smartparens iedit evil-ediff anzu evil goto-chg undo-tree eshell-z dumb-jump f dash diminish column-enforce-mode hydra inflections edn multiple-cursors paredit yasnippet s peg eval-sexp-fu highlight cider spinner queue pkg-info clojure-mode epl bind-map bind-key packed helm avy helm-core popup async xterm-color shell-pop multi-term eshell-prompt-extras esh-help ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe use-package spacemacs-theme spaceline smooth-scrolling smeargle restart-emacs rainbow-delimiters quelpa popwin persp-mode pcre2el paradox page-break-lines orgit open-junk-file neotree move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum linum-relative leuven-theme info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-ag google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger gh-md flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu elisp-slime-nav define-word clj-refactor clean-aindent-mode cider-eval-sexp-fu buffer-move bracketed-paste auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   )
  )
