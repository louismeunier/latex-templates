// ! external
// #import "../notes.typ": conf
// #import "../shortcuts.typ": *
// ? Change me:
#let conf = (
  author: "Someone Forsure",
  student_id: "123",
  assignment: "Assignment #0",
  class: "MATH123",
)

// ! packages
#import "@preview/ctheorems:1.1.2": *
#import "@preview/commute:0.2.0": node, arr, commutative-diagram

// ! font sizes
#let fontsizes = (
  normal: 13pt,
  section: 14pt,
  subsection: 12pt,
  large: 20pt,
  small: 10pt
)
// #let fontsizes.normal = 12pt
// #let fontsizes.section = 14pt
// #let subfontsizes.section = 12pt
// #let large-size = 20pt
// #let small-size = 8pt

// ! colours
#let solarized = (
  yellow: rgb("#b58900"),
  orange: rgb("#cb4b17"),
  red: rgb("#dc322f"),
  magenta: rgb("#d33682"),
  violet: rgb("#6c71c4"),
  blue: rgb("#268bd2"),
  cyan: rgb("#2aa198"),
  cyanlight: rgb("#d4ecea"),
  green: rgb("#859900"),
  base2: rgb("#eee8d5"),
  gray: rgb("#f2f2f2")
)

// ! defaults 

#set page(
  margin: 1.5cm,
  footer-descent: 60%,
  header-ascent: -5%
)
#set text(
    font: "Linux Libertine",
    size: fontsizes.normal
  )
// #show raw: set text(font: "Palatino")

#set align(left)
#show link: set text(fill: solarized.cyan)
#show link: underline
#set list(indent: 2em)
#set enum(indent: 2em)

// ! theorems
#show: thmrules.with(qed-symbol: $square.small.filled$)

#let thmsettings = (
  inset: (top: 0.6em, left: .5em, right: .5em, bottom: 0.8em),
  base_level: 0
)

#let theorem = thmbox(
  "theorem", // identifier
  $arrow.curve$+" Theorem",
  // text("Theorem", fill:solarized.red), // head
  fill: solarized.gray,
  inset: thmsettings.inset,
  // stroke: 1pt
  base_level: thmsettings.base_level
)
#let lemma = thmbox(
  "lemma", // identifier
  $arrow.curve$+" Lemma",
  // text("Lemma", fill:solarized.orange), // head
  fill: solarized.gray,
  inset: thmsettings.inset,
  base_level: thmsettings.base_level
)
#let proposition = thmbox(
  "proposition", // identifier
  $arrow.curve$+" Proposition",
  // text("Lemma", fill:solarized.red), // head
  fill: solarized.gray,
  inset: thmsettings.inset,
  base_level: thmsettings.base_level
  // stroke: 1pt
)
#let corollary = thmbox(
  "corollary",
  $arrow.curve$+" Corollary",
  // text("Corollary", fill:solarized.orange), // head
  fill: solarized.gray,
  inset: thmsettings.inset,
  base_level: thmsettings.base_level
)
#let definition = thmbox(
  "definition",
  $arrow.curve$+" Definition",
  fill: solarized.gray,
 inset: thmsettings.inset,
  base_level: thmsettings.base_level
)
#let example = thmbox(
  "example",
  $ast.circle$+" Example",
  fill: solarized.cyanlight,
  inset: thmsettings.inset,
  base_level: thmsettings.base_level
)
#let remark = thmbox(
  "remark",
  "Remark",
  stroke: none,
  base_level: 0,
  inset: (top: 0.4em, left: .5em, right: .5em, bottom: 0.6em),
)
#let proof = thmproof("proof", 
  text(
    smallcaps("proof"),
    // highlight("Proof", fill: white, stroke: black, top-edge: "cap-height", extent: 3pt), 
    style: "oblique", 
    weight: "regular"
  ),
  inset: (top: 0em, left: 2.8em, right: 1.4em),
  separator: [#h(0.1em). #h(0.2em)],
)

#let question = thmbox(
  "question",
  "Q",
  // text("Q", size: 10pt),
  base_level: 0,
  stroke: 1pt + black,
  inset: (top: 0.4em, left: .5em, right: .5em, bottom: 0.7em),
  radius: 0.2em,
  separator: [*.*],
  bodyfmt: body => text(body, size: 12pt),
  titlefmt: t => text(
    t.children.first() + t.children.last(), 
    size: 12pt, weight: "bold"
  )
).with(numbering: "1") 

// ! headings
#show heading.where(
  level: 1
): it => block(width: 100%)[
  // #set align(center)
  #set text(fontsizes.section, weight: "semibold")
  #if it.numbering != none {
    text(it.numbering.split(".").at(0))  
  }
  #h(.5em)
  #smallcaps(it.body)
  // #text(".")
]

#show heading.where(
  level: 2
): it => text(
  size: fontsizes.section,
  weight: "regular",
  style: "italic",
  it.numbering + h(.5em) + it.body + [.],
)

#set heading(numbering: "1.1")


#set page(footer: context [
  #let elems = query(
    selector(heading).before(here())
  )
  // #let subsection = elems.last().body
  // #let num = elems.last().numbering

  // #text(num, size: fontsizes.small)
  // #text(subsection, size: fontsizes.small)
  #h(1fr)
  #text(counter(page).display(
    "1",
    // both: true,
  ),
  size: fontsizes.small
  )
])

#set page(header: context [
  #let elems = query(
    selector(heading).before(here())
  )
  #text(conf.class + " - " + conf.assignment, size: fontsizes.small) 
  #h(1fr)
  #text(conf.author + " (" + conf.student_id + ")", size: fontsizes.small)  
  #line(
    start: (0pt, -10pt),
  length: 100%,
  stroke: 0.1pt
)
])

#set align(left)
#set enum(numbering: "a)")

#question[
  This is quite a standard question, involving an inline equation $ sum_(k) (-D)^k (partial )/(partial u^k), $
  and several remarkable subparts:
  + A first;
  + A second.
]<q:1>

#proof[
  An elementary proof. a) is obvious, as we have $
    mat(
      1, 0, 0;
      0, 1, 0;
      0, 0, 1
    ) dot.c a/b eq.not pi
  $
   and b) follows suit ($suit.club => suit.diamond$).
]

#question[
  A trivial consequence.
]

#proof[
  What a joke; refer to @q:1. 
]

#pagebreak()
#remark[
  The headers are persistent
]