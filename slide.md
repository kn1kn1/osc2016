<style type="text/css">
  .reveal h1,
  .reveal h2,
  .reveal h3,
  .reveal h4,
  .reveal h5,
  .reveal h6 {
    text-transform: none;
  }
  .reveal section img {
     background:none; border:none; box-shadow:none;
  }
</style>
# clj as art

@kn1kn1

Sapporo.clj

---
<!-- .slide: data-background="#f70000" data-transition="page" -->

### Sapporo.clj

Sapporo.cljは偶数月に開催しています。

今月は6/25(土) 13:30-の開催です。

[Sapporo.clj #11](https://atnd.org/events/78114)

みなさまのご参加をお待ちしております！<!-- .element: class="fragment" -->


---

### tl;dr

- Overtone

  ClojureからSuperColliderを操ることができます<!-- .element: class="fragment" -->

- Quil

  ClojureからProcessingを操ることができます<!-- .element: class="fragment" -->

___

SuperColliderって何だろう？

Processingって何だろう？

---

### Agenda

- Me
- Clojure
- SuperCollider
- Overtone
- Processing
- Quil
- Demo

---

### 資料など

- 本日の資料は[こちら]()にupしてあります

- 質問は時間が余ったらセミナー時間中にお答えするかもですが、
  基本的にはセミナー終了後、個別にお伺い致します m(_ _)m

---

### About Me

- Kenichi Kanai
- a programmer in Sapporo
- Sapporo(3)<-Tokyo(15)<-Sapporo(6)<-Gumma(18)

  ※ OSCは参加するのも発表するのも初めてです<!-- .element: class="fragment" -->

___

- twitter: [@kn1kn1](https://twitter.com/kn1kn1)
- github: [kn1kn1](https://github.com/kn1kn1)
  - contributor of Sonic Pi<!-- .element: class="fragment" -->
  - main committer of Haskap Jam Pack<!-- .element: class="fragment" -->

___

#### Sonic Pi

<img src="http://sonic-pi.net/images/logo.png" width="150" height="150" />

- http://sonic-pi.net/
- "The Live Coding Synth for Everyone"
- Sam Aaronが開発
- Rubyベース
- 当初はバグフィックスでcontribute
- [SIAFラボ](http://www.sapporo-internationalartfestival.jp/siaflab/sonic-jam-pi/)に合流し、翻訳でcontribute
  - SIAF: 札幌国際芸術祭(Sapporo International Art Festival)
___

#### Haskap Jam Pack

<img src="https://raw.githubusercontent.com/siaflab/haskap-jam-pack/master/haskap.png" width="80" height="80" />
<img src="http://haskap-jp.cms-marimo.com/images/siaflab%281%29.jpg" width="80" height="80" />

- https://github.com/siaflab/haskap-jam-pack
- "an extension package for Sonic Pi"
- Sonic Piでジャムセッション！
- [SIAFラボ](http://www.sapporo-internationalartfestival.jp/siaflab/sonic-jam-pi/)で開発
  - 元々はアプリケーションとして札幌大谷大学講師の小町谷さんが開発されたものを、拡張パックとして@kn1kn1が再開発
- 技術的にはGoでパケットキャプチャしたりとかの話もあります → 別な機会にお話します

---

### Clojure

<img src="https://clojure.org/images/clojure-logo-120b.png" width="120" height="120" />

- JVM上で動作するLISP系言語

- 2007〜

- Rich Hickey

---

- code as data: 「データとしてのプログラムコード」
  - LISP系言語なので当（ｒｙ

- Javaの資産がほぼそのまま使える

- ソースコード(hello-clj.clj)で説明します

---

- 参考
  - [プログラミングClojure 第2版](https://estore.ohmsha.co.jp/titles/978427406913P)
    - Clojureに関するほとんどのトピックスは網羅されている
      - それでも言及されていないものもある(->演算子(マクロ)とか)
  - ~~[Functional programming in Clojure](https://iloveponies.github.io/120-hour-epic-sax-marathon/index.html)~~
    - ~~関数っぽい話題で、"[Little Schemer](https://mitpress.mit.edu/books/little-schemer)"的なノリ~~

---

### SuperCollider

<img src="https://raw.githubusercontent.com/supercollider/supercollider.github.io/master/images/sc_cube_128x128.png" width="128" height="128" />

- https://supercollider.github.io/

- リアルタイム音響合成とアルゴリズミック・コンポジションに特化したプログラミング言語

- 1996年にJames McCartneyによって開発・発表

---

- SynthDefでシンセ(音源)を定義

- Synthで定義したシンセをトリガー

- Pbindでシンセ、音程、持続時間などを結びつけて音を鳴らす

- ソースコード(hello-sc.scd)で説明します

---

- 参考
  - [The SuperCollider Book](https://mitpress.mit.edu/books/supercollider-book)
    - Wilson, Scott, David Cottle, and Nick Collins. The SuperCollider Book. The MIT Press, 2011.
  - [A Gentle Introduction To SuperCollider](https://github.com/brunoruviaro/A_Gentle_Introduction_To_SuperCollider)

---

#### SuperColliderベースの音響合成環境

 - [hsc3](http://rd.slavepianos.org/?t=hsc3)
  - Haskell
 - [Tidal](http://tidalcycles.org/)
  - Haskell
 - [Overtone](https://overtone.github.io/)
  - Clojure
 - [Sonic Pi](http://sonic-pi.net/)
  - Ruby
 - [LNX_Studio](http://lnxstudio.sourceforge.net/)
  - これは言語ベースでなくDAW


---

### Overtone

<img src="https://raw.githubusercontent.com/overtone/overtone/master/resources/overtone-logo.png" width="130" height="143" />
<!-- 391x429 -->

- https://overtone.github.io/

- ClojureからSuperColliderの音響合成を行うライブコーディング環境

- Jeff Rose, Sam Aaron等が開発


---

- 開発・実行環境
  - [Emacs Live](https://overtone.github.io/emacs-live/)
    - Overtoneプロジェクトで開発してる
    - EmacsからOvertoneを使うのに必要なClojure環境が揃う
    - ~/.emacs.dを書き換える(~/emacs-live-old-configに退避する模様)ので注意が必要
  - [LightTable](http://lighttable.com/)
    - [Quilでウィンドウが2つ出てしまったりする](https://github.com/LightTable/LightTable/issues/150)が、それ以外は大丈夫そう？

---

- 主な機能
  - SuperColliderのシンセサイザーエンジンに対するAPI
  - タイミングやメトロノームに関する関数群(at, apply-at等)
  - freesound.orgのサンプルを利用可能

---

- 最新版は2016年4月にリリースされた0.10.1
  - freesound.org API v2に対応するなど
  - sample関数に変更が入ったもののバグが入っているようなので、ローカルでは0.9.1のコードにrevertしている
    → 暇をみてIssueかPR出しておきます
  - Sam AaronがSonic Piに専念しているため、残念ながら開発はアクティブでない

---

- ソースコード(hello_overtone.clj)

---

- 参考
  - [公式のgetting_started](https://github.com/overtone/overtone/tree/master/src/overtone/examples/getting_started)
  - [Piotr Jagielski氏によるovertone-workshop](https://github.com/pjagielski/overtone-workshop)
  - [公式のdocs/sc-book](https://github.com/overtone/overtone/tree/master/docs/sc-book)
    - [The SuperCollider Book](https://mitpress.mit.edu/books/supercollider-book) のコードをOvertoneに移植している


---

### Processing

<img src="https://upload.wikimedia.org/wikipedia/commons/5/59/Processing_Logo_Clipped.svg" width="150" height="150" />

- https://processing.org/

- Casey Reas, Benjamin Fryが開発
<!-- ケイシー・リース, ベン・フライ-->

- ビジュアルデザインのためのプログラミング言語と統合開発環境

---

- Javaベース
  - 当初はJavaアプリケーションを生成する環境として
  - Androidアプリケーション(apk)も開発できように(2012年くらい)
  - processing.js, p5.js もよく使われている

---

- スケッチ
- setupで前処理
- drawで描画処理

- ソースコード(hello_processing.pde)で説明します

---

- 参考
  - ジェネラティブ・アート -- Processingによる実践ガイド
    - http://www.bnn.co.jp/books/3894/
  - Processing -- ビジュアルデザイナーとアーティストのためのプログラミング入門
    - http://www.bnn.co.jp/books/7770/
  - Generative Design -- Processingで切り拓く、デザインの新たな地平
    - http://www.bnn.co.jp/books/8012/

---

### Quil

<img src="https://cloud.github.com/downloads/quil/quil/quil.png" width="125" height="110" />
<!-- 500x440 -->

- http://quil.info/

- ClojureからProcessingを扱うことができる

- Roland Sadowski, Sam Aaron, Nikita Beloglazov等が開発
  - "I've started clj-processing project which later, with Sam Aaron's help, became Quil." -- http://rosado.cc/

---

- Clojure/ClojureScriptで実行可能

- Clojure版は、REPLで実行することにより動的にスケッチを変更することが可能

  → 本家Processingには無い機能

---

- defsketchマクロ
- setup関数
- update-state関数
- draw-state関数

---

#### Hello Quil

```
$ lein new quil hello-quil
$ cd hello-quil
$ emacs -e cider-jack-in src/hello_quil/core.clj
```

---

- 参考
  - [公式のAPI](http://quil.info/api)
  - [Generative Art - Quil Translations](https://github.com/quil/quil-examples/tree/master/src/quil_sketches/gen_art)
    - [ジェネラティブ・アート](http://www.bnn.co.jp/books/3894/) のコードをQuilに移植している

---

### デモ
