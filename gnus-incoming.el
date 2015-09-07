;;; gnus-incoming.el --- incoming group for Gnus

;; Copyright (C) 2006 Mario Domenech Goulart

;; Author: Mario Domenech Goulart
;; Maintainer: Mario Domenech Goulart
;; Created: jan 2006
;; Keywords: gnus incoming group
;; Version: 0.1

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Code:

(require 'gnus-uu)

(defvar gi-incoming-group "bogus")

(defun gi-get-new-news ()
  "Basically, this function gets new news
gnus-group-get-new-news, but escaping from automatic respooling
through `nnmail-split-methods', and goes to `gi-incoming-group'."
  (interactive)
  (let ((methods nnmail-split-methods)) ;; save nnmail-split-methods
    (setq nnmail-split-methods (list (list gi-incoming-group "")))
    (gnus-group-get-new-news)
    (gnus-fetch-group gi-incoming-group)
    (setq nnmail-split-methods methods) ;; restore nnmail-split-methods
    ))

(defun gi-respool ()
  "Respool based on `nnmail-split-methods'."
  (interactive)
  (gnus-uu-mark-buffer)
  (gnus-summary-respool-article nil 
				(or gnus-summary-respool-default-method
				    (gnus-find-method-for-group
				     gnus-newsgroup-name))))

(provide 'gnus-incoming)