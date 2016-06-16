(ns clj-as-art.hello-clj)

;; hello world
(println "Hello Clojure!")

;; 関数
(defn hello-fn [msg]
  (println msg))
(hello-fn "Hello Clojure function!")

;; 変数
(def message "Hello Clojure variable!")
(hello-fn message)

;; Javaを呼出す
;;  java.lang.Math.PI
(. Math PI)
(println (. Math PI))
