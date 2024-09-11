#let conf(
    course: none,
    homework: [],
    due_time: [],
    instructor: [],
    student: [],
    id: [],
    doc
) = {

    set text(
        font: ("New Computer Modern", "Yuppy SC"),
        size: 10pt
    )

    set align(center)

    text(22pt, weight: "bold", [
        #course: #homework
    ])

    align(center, text(12pt, [
        Instructed by #text(style: "italic", instructor)
    ]))

    align(center, text(10pt, [
        Due on #text(style: "italic", due_time)
    ]))

    align(center, text(14pt, [
        \ #student #h(1cm) #id
    ]))

    set page(
        paper: "a4",
        header: [
            #set text(10pt)
            #smallcaps[#student]
            #h(1fr) #homework
        ],
        numbering: "1 / 1",
        background: rotate(24deg,
            text(18pt, fill: rgb("FFCBC4"))[
                #student
            ]
        )
    )

    set par(justify: true)

    set align(left)

    // show: rest => columns(2, rest)

    show math.equation.where(block: false): it => {
        if it.has("label") and it.label == label("displayed-inline-math-equation") {
            it
        } else {
            [$display(it)$<displayed-inline-math-equation>]
        }
    }

    show raw.where(block: true): block.with(
        fill: rgb("#fbe6e3"),
        inset: 10pt,
        // radius: 5pt,
    )

    doc

    // show heading.where(level: 1): it => block(width: 100%)[
    //     #set align(center)
    //     #set text(size: 12pt, weight: "regular")
    //     #block(smallcaps(it.body))
    // ]
    // show heading.where(level: 2): it => text(
    //     size: 11pt,
    //     weight: "regular",
    //     style: "italic",
    //     it.body + [.],
    // )

    // #grid(
    //     columns: (1fr, 1fr),
    //     align(center)[
    //     Therese Tungsten \
    //     Artos Institute \
    //     #link("mailto:tung@artos.edu")
    //     ],
    //     align(center)[
    //     Dr. John Doe \
    //     Artos Institute \
    //     #link("mailto:doe@artos.edu")
    //     ]
    // )

}

#let prob = counter("problem")

#let problem(name: none, content) = {
    prob.step()
    if name != none {
        align(left, text(16pt, weight: "bold")[#name])
    }
    else {
        align(left, text(16pt, weight: "bold")[Problem #prob.display()])
    }
    align(left, content)
}

#let blockquote(content) = {
    rect(fill: luma(94.12%), stroke: (left: 0.25em))[
        #content
    ]
}

#let proof(content) = {
    rect(fill: rgb("#eef8ff"))[
        #text(style: "italic", [
        Proof.
        ])
        #content \
        #h(1fr) $square.stroked$
    ]
}

#let theo = counter("theorem")

#let theorem(name: none, content) = {
    theo.step()
    if name != none {
        name = text[(#name)]
    }
    rect(fill: rgb("#eeffee"))[
        #text(weight: "bold")[Theorem #theo.display()]
        #text[#name. #content]
    ]
}

#let ans(content) = {
    rect(fill: rgb("#ffffff"))[
        #text(style: "italic", [
        Answer.
        ])
        #content #h(1fr)
    ]
}

// Code from https://typst-doc-cn.github.io/docs/chinese/

#let skew(angle, vscale: 1, body) = {
    let (a, b, c, d) = (1, vscale * calc.tan(angle), 0, vscale)
    let E = (a + d) / 2
    let F = (a - d) / 2
    let G = (b + c) / 2
    let H = (c - b) / 2
    let Q = calc.sqrt(E * E + H * H)
    let R = calc.sqrt(F * F + G * G)
    let sx = Q + R
    let sy = Q - R
    let a1 = calc.atan2(F, G)
    let a2 = calc.atan2(E, H)
    let theta = (a2 - a1) / 2
    let phi = (a2 + a1) / 2

    set rotate(origin: bottom + center)
    set scale(origin: bottom + center)

    rotate(phi, scale(x: sx * 100%, y: sy * 100%, rotate(theta, body)))
}

#let fake-italic(body) = skew(-12deg, body)

#let shadowed(body) = box(place(skew(-50deg, vscale: 0.8, text(fill: luma(200), body))) + place(body)) // TODO: fix shadowed 错位问题

/* Usage: create another file, e.g. hw1.typ, and write the following content:
```
#import "conf.typ": conf, problem, blockquote, proof

#show: doc => conf(
    course: [course name],
    homework: [Homework 1/2/3/4/],
    due_time: [Sep 16/17/18, 2024],
    instructor: [someone],
    student: [you],
    id: [id],
    doc,
)
```
Then you can write the problems in the homework like this:
```
#problem(name: [name])[
    #lorem(20)
    something
]
```
or
```
#problem(name: "dsad")[
    #lorem(30)
    something
]
```
or you dont need to specify the name:
```
#problem[
    #lorem(50)
    something
]
```
*/