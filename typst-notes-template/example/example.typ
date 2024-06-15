// ! external
#import "../notes.typ": conf
#import "../shortcuts.typ": *

// ! packages
#import "@preview/ctheorems:1.1.2": *
#import "@preview/commute:0.2.0": node, arr, commutative-diagram

// ! font sizes
#let fontsizes = (
  normal: 12pt,
  section: 14pt,
  subsection: 12pt,
  large: 20pt,
  small: 8pt
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
  footer-descent: 60%
)
#set text(
    font: "Linux Libertine",
    size: fontsizes.normal
  )
// #show raw: set text(font: "Palatino")

#set align(left)
#show link: set text(fill: solarized.cyan)
#show link: underline


// ! theorems
#show: thmrules.with(qed-symbol: $square.small.filled$)

#let thmsettings = (
  inset: (top: 0.6em, left: .5em, right: .5em, bottom: 0.8em),
  base_level: 1
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
  inset: (top: 0.4em, left: .5em, right: .5em, bottom: 0.6em),
)
#let proof = thmproof("proof", 
  text(
    smallcaps("Proof"),
    // highlight("Proof", fill: white, stroke: black, top-edge: "cap-height", extent: 3pt), 
    style: "oblique", 
    weight: "regular"
  ),
  inset: (top: 0em, left: 2.8em, right: 1.4em),
  separator: [#h(0.1em). #h(0.2em)],
)

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

// TODO: edit below
// ! configuration
#show: doc => conf(
  course_code: "MATH255",
  course_title: "Algebra 2",
  subtitle: "A sample writing.",
  semester: "Winter 2023",
  professor: "Prof. Anush Tesrunyan",
  doc
)

#set page(footer: context [
  #let elems = query(
    selector(heading).before(here())
  )
  #let subsection = elems.last().body
  #let num = elems.last().numbering

  #text(num, size: fontsizes.small)
  #text(subsection, size: fontsizes.small)
  #h(1fr)
  #text(counter(page).display(
    "1",
    // both: true,
  ),
  size: fontsizes.small
  )
])

#set align(left)

#pagebreak()
= Inner Product Spaces

== Projections and Cauchy-Schwartz

#definition("Orthogonal")[
  Let $V$ be an inner product space. We say $u, v in V$ are _orthogonal_ and write $u perp v$ if $ip(u, v) = 0$.
]

#example[
  In $RR^3$ equipped with the dot product, $(1,0,-1) perp (1,0,1)$.
]
#theorem("Pythagorean Theorem")[
  For an inner product space $V$ and $u, v in V$, if $u perp v$ then $ norm(u)^2 + norm(v)^2 = norm(u + v)^2. $
  In particular, $norm(u), norm(v) lt.eq norm(u+v)$.
]

#proof[
  $ norm(u + v)^2 = ip(u + v, u + v) = ip(u, u) + ip(u, v) +ip(v, u) + ip(v, v) = norm(u)^2 + norm(v)^2$
]

#definition("Projection")[
  For $v in V$ and $u in V$ a unit vector, put $ "proj"_u(v) := ip(v, u) dot.c u .$
]
#proposition[
  Let $u in V$ a unit vector. For each $v in V$, $v - "proj"_u(v) perp u$.
]
#proof[
  Clear.
]

#corollary[
  For each $v in V$, $norm("proj"_u(v)) lt.eq norm(v)$.
]<cor:somelabel>

#set enum(numbering: "a)")
#theorem[
  Let $V$ be an inner product space and $x, y in V$.

  + (Cauchy-Banyakovski-Schwartz Inequality) $abs(ip(x, y)) lt.eq norm(x) dot.c norm(y)$.
  + (Triangle Inequality) $norm(x + y) lt.eq norm(x) + norm(y)$.
]

#proof[
+ If $norm(y) = 0$, then $y = 0_V$ and $0 lt.eq 0$ and we are done. Hence, supposing $norm(y) eq.not 0$, divide both sides by $norm(y)$: $ ip(x, norm(y)^(-1) dot.c y) lt.eq norm(x), $
i.e., we need only to prove that $abs(ip(x, y)) lt.eq norm(x)$, where $u$ a unit. But notice $ abs(ip(x, u)) = norm(ip(x, u) dot.c u)  = norm("proj"_u(x)) lt.eq norm(x), $
by @cor:somelabel.

+ Squaring the LHS, we have $
 norm(x + y)^2 = ip(x + y, x + y) &= ip(x, x) + ip(x, y) + ip(y, x) + ip(y, y)\
 & lt.eq norm(x)^2 + norm(y)^2 + 2 abs(ip(x, y))\
 &underbracket(lt.eq, "by a)") norm(x)^2 + norm(y)^2 + 2 norm(x) norm(y) = (norm(x) + norm(y))^2.
$
]
