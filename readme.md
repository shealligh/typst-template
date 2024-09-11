Usage: create another file, e.g. hw1.typ, and write the following content:
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
