<div align="center">

![Typst-template](https://socialify.git.ci/shealligh/typst-template/image?description=1&descriptionEditable=A%20template%20written%20in%20Typst%21&font=Jost&forks=1&issues=1&logo=https%3A%2F%2Fstatic.live.moe%2Flagrange.jpg&name=1&pattern=Diagonal%20Stripes&pulls=1&stargazers=1&theme=Auto)

</div>

## Basic usage

Create another file, e.g. hw1.typ, import this template and config basic information.

```typ
#import "conf.typ": *

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

Then write problems in homework like this:

```typ
#problem(name: [name])[     // or #problem(name: "name")
    #lorem(20)
    something
]
```

or number the problems automatically:

```typ
#problem[
    #lorem(50)
    something
]
```

## Other useful functions

```typ
#proof[                     // #proof(color: blue)[...]
    #lorem(50)
    something
]
```

```typ
#ans[                       // #ans(color: red)[...]
    #lorem(50)
    something
]
```