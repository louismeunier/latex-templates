# $\LaTeX$ Templates

The templates I use for notes and assignments in LaTeX. They contain quite a lot of comments and should thus hopefully be easy to use. 

The homework template was originally based off [this](https://www.overleaf.com/latex/templates/homework-template/wyqwgcrfxktj) template, but has since been heavily modified.

To use them locally, you can use:

```bash
# assignment template
curl "https://raw.githubusercontent.com/louismeunier/latex-templates/main/assignment-template/ASSIGNMENT%20TEMPLATE.tex" > assignment.tex && curl "https://raw.githubusercontent.com/louismeunier/latex-templates/main/assignment-template/betterqs.sty" > betterqs.sty && curl https://raw.githubusercontent.com/louismeunier/latex-templates/main/assignment-template/shortcuts.sty > shortcuts.sty
```
```bash
# module notes template (allows you to create separate files for different sections of notes; helpful for separating notes by lecture, for instance)
curl https://raw.githubusercontent.com/louismeunier/latex-templates/main/modular-notes/main.tex >> main.tex && curl https://raw.githubusercontent.com/louismeunier/latex-templates/main/modular-notes/setup.sty >> setup.sty && mkdir parts && curl https://raw.githubusercontent.com/louismeunier/latex-templates/main/modular-notes/parts/01.tex >> parts/01.tex
```

```bash
# note template
curl "https://raw.githubusercontent.com/louismeunier/latex-templates/main/note-template/NOTE%20TEMPLATE.tex" > note.tex && curl "https://raw.githubusercontent.com/louismeunier/latex-templates/main/note-template/shortcuts.sty" > shortcuts.sty
```
```bash
# crib-sheet template
curl "https://raw.githubusercontent.com/louismeunier/latex-templates/main/note-template/shortcuts.sty" > crib.tex
```

Or simply download them directly.