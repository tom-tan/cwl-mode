# cwl-mode.el

This library helps you to write [Common Workflow Language](http://www.commonwl.org) in Emacs.

Requirements:
  * Emacs 24 or later
  * yaml-mode.el
  * flycheck.el (optional)

To use this package, add the following line to your `.emacs` file:
```emacs
    (require 'cwl-mode)
    (cwl-mode-setup)
```
cwl-mode highlights some keywords for usability.
Also, the above command automatically enables on-the-fly YAML checker if flycheck is installed.
