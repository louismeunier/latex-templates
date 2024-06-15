// ! setup


#let conf(
  course_code: none,
  course_title: none,
  subtitle: none,
  semester: none,
  professor: none,
  author: "Louis Meunier",
  // abstract: [],
  doc,
) = {
  v(4em)
  set align(left)
  text(25pt, course_code, weight:"bold") + text(25pt, " - " + course_title)
  text(12pt, "\n"+subtitle)
  // if cute != none {
  //   // set align(center)
  //  figure(
  //     image(cute, width: 40%)
  //   ) 
  // }
  // set align(left)
  text(12pt, "\n\nBased on lectures from "+ semester + " by " + professor + ".")
  text(12pt, "\nNotes by " + author)

  set par(
    first-line-indent: 1.5em,
    leading: 0.8em,
    linebreaks: "simple"
  )
  // let count = authors.len()
  // let ncols = calc.min(count, 3)
  // grid(
  //   columns: (1fr,) * ncols,
  //   row-gutter: 24pt,
  //   ..authors.map(author => [
  //     #author.name \
  //     #author.affiliation \
  //     #link("mailto:" + author.email)
  //   ]),
  // )

  // par(justify: false)[
  //   *Abstract* \
  //   #abstract
  // ]

  v(2em)
  outline(indent: 2em)
  
  set align(left)
  doc
}
