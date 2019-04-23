(register-module [[name: maths]
                  [author: "Willi O Riha"]
                  [load-fn: maths-load]
                  [translate: "macro-def.shen" "maths-lib.shen"]])

\* load native definitions of math functions for efficiency *\
(define maths-load-native
  {string --> string --> boolean}
  _ _ -> true)

(define maths-load
  {A --> boolean}
  _ -> (do
         (load/tc - "macro-def.shen")
         (load "maths-lib.shen")
         (maths-load-native (language) (implementation))))
