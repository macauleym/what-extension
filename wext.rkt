;;;;;;;;;;;;;;;;;;;;
;; Language Definition
;;;;;;;;;;;;;;;;;;;;
#lang racket/base

;;;;;;;;;;;;;;;;;;;;
;; Requires
;;;;;;;;;;;;;;;;;;;;
[require racket/cmdline]
[require racket/list]

;;;;;;;;;;;;;;;;;;;;
;; Data Properties
;;;;;;;;;;;;;;;;;;;;
{define file-to-check (make-parameter "")}

;;;;;;;;;;;;;;;;;;;;
;; Functions
;;;;;;;;;;;;;;;;;;;;
(define what-extension?
  (command-line
   #:program "what-extension"
   #:usage-help
   "This program takes a single file as a parameter and"
   "returns that files extension."
   "Example:"
   "> ./wext -f myfile.exe"
   "> exe"
   #:once-each
   [("-f" "--file") FILE
                    "The file to return the extension of."
                    (file-to-check FILE)]
   #:args () (void)))

;; Pulls out the file's extension, using regex.
(define (get-extension f)
  {define match-result
    (regexp-match
     ;; (?<=\\.)      = Checks that we are indeed directly after the '.' character.
     ;; (?<extn>\\w+) = Captures the content after the '.', and is assumed to be
     ;;                 the extension itself.
     ;; $             = Ensures that we're capturing from the end of the string, where
     ;;                 the extension of the file would be.
     (pregexp "(?<=[\\.])[\\w]+$")
     f)}
  (cond
    ;; (match-result) returns a string list of the success matches or a #f if none are found.
    ;; By checking if the result is a boolean, we check if the result is a failure.
    ;; If it's not a boolean, then it's a successful result. In our case, there will only be
    ;; a single value, so pull out that raw value and send it back as the result.
    [(boolean? match-result) 'none]
    [else (first match-result)]))

;; Write out the file's found extension, then a new line.
(writeln (get-extension (file-to-check)))