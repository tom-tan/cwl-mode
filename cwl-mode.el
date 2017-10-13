;;; cwl-mode.el --- CWL mode for Emacs

;; Copyright (C) 2017 by Tomoya Tanjo

;; Author: Tomoya Tanjo <ttanjo@gmail.com>
;; URL: https://github.com/tom-tan/cwl-mode
;; Package-Requires: ((yaml-mode "0.0.13"))
;; Keywords: cwl, common workflow language, bioinformatics

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This library helps you to write common workflow language in Emacs.
;;
;; Requirements:
;;   * Emacs 24 or later
;;   * yaml-mode.el
;;
;; To use this package, add the following line to your .emacs file:
;;     (require 'cwl-mode)
;; cwl-mode highlights some keywords for usability.

;;; Code:

(require 'yaml-mode)

(defconst cwl-mode-keywords
  '("inputs" "outputs" "class" "steps" "id"
    "requirements" "hints" "label" "doc"
    "cwlVersion" "secondaryFiles" "streamable"
    "outputBinding" "format" "outputSource"
    "linkMerge" "type" "glob" "loadContents"
    "outputEval" "merge_nested" "merge_flattened"
    "location" "path" "basename" "dirname"
    "nameroot" "nameext" "checksum" "size" "format"
    "contents" "listing" "fields" "symbols" "items"
    "in" "out" "run" "scatter" "scatterMethod"
    "source" "default" "valueFrom" "expressionLib"
    "types" "linkMerge" "inputBinding" "position"
    "prefix" "separate" "itemSeparator" "valueFrom"
    "shellQuote" "packages" "package" "version"
    "specs" "entry" "entryname" "writable"
    "baseCommand" "arguments" "stdin" "stderr"
    "stdout" "successCodes" "temporaryFailCodes"
    "permanentFailCodes" "dockerPull" "dockerLoad"
    "dockerFile" "dockerImport" "dockerImageId"
    "dockerOutputDirectory" "envDef" "envName"
    "envValue" "coresMin" "coresMax" "ramMin"
    "ramMax" "tmpdirMin" "tmpdirMax" "outdirMin"
    "outdirMax"))

;;;###autoload
(define-derived-mode cwl-mode
    yaml-mode "CWL"
    "Major mode for Common Workflow Language"
    :syntax-table nil
    (font-lock-add-keywords
     nil
     (list
      (cons
       (concat "\\b\\(" (regexp-opt cwl-mode-keywords) "\\):")
       '(1 font-lock-keyword-face))))
    (define-cwl-mode-keymap))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.cwl\\'" . cwl-mode))

(defvar cwl-mode-local-map nil "Keymap for cwl-mode.")

(defun define-cwl-mode-keymap ()
  "Define local keymap for cwl-mode."
  (setq cwl-mode-local-map (copy-keymap yaml-mode-map))
  (use-local-map cwl-mode-local-map))

(provide 'cwl-mode)
;;; cwl-mode.el ends here
