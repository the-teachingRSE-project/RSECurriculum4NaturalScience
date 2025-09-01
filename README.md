# RSECurriculum4NaturalScience
Holds the paper project for the SWT Bericht on the RSE-Competency project with a focus on the MNT profile, which means RSE
applied to natural sciences. Main focus is on the competences to be taught, not the structure.

You can follow the RSE-Curriculum-News [here](https://www.listserv.dfn.de/sympa/info/rse-master) and participate in the [workshops](https://terminplaner6.dfn.de/de/b/b87d7614820fb9540532386d855885ce-1253209)

This contribution was published as a technical article (Fachartikel) in volume 45 of *Softwaretechnik-Trends*
([link to PDF](https://fb-swt.gi.de/fileadmin/FB/SWT/Softwaretechnik-Trends/Verzeichnis/Band_45_Heft_3/RSE4NatSci.pdf)).

```bibtex
@Article{Dehne2025,
  author    = {Dehne, Julian and Christ, Simon and Goth, Florian and Grad, Jean-No{\"e}l and
               Hagdorn, Magnus and Thiele, Jan Philipp and von Waldow, Harald and Linxweiler, Jan},
  title     = {Research Software Engineering for Natural Sciences},
  journal   = {Softwaretechnik-Trends},
  year      = {2025},
  volume    = {45},
  number    = {3},
  month     = aug,
  day       = {28},
  pages     = {2--8},
  issn      = {0720-8928},
  address   = {Bonn, Germany},
  publisher = {Gesellschaft f{\"u}r Informatik e.V.},
  url       = {https://fb-swt.gi.de/fileadmin/FB/SWT/Softwaretechnik-Trends/Verzeichnis/Band_45_Heft_3/RSE4NatSci.pdf},
}
```

## HOW TO CONTRIBUTE

- edit `index.qmd` following [quarto markdown rules](https://quarto.org/docs/authoring/markdown-basics.html)
- in `my-paper.bib` add further bib records
- NOTE: if you have problems with the quarto pipeline, just add the content to index.qmd file and I will check this out
- we use British English spelling

## HOW to run

- install quarto with tinytex extension, for example using a Python virtual environment:
  ```sh
  python -m venv venv-quarto
  source venv-quarto/bin/activate
  pip install quarto-cli
  ```
- run `make index-quarto.pdf` (should produce a pdf in LNI format)
- if there is an error message about invalid shortcode, run command
  `sed -i '/filesafename/d' venv-quarto/lib/python3.12/site-packages/quarto_cli/share/create/extensions/shortcode/example.ejs.qmd`
  (with the path of your virtual environment)
- debug problems in generated index.tex file

For pandoc users, run `make index-pandoc.pdf`. Please note this is a fallback method.
