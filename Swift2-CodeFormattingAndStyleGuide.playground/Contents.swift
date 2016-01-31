/*:
# Swift 2 Code Formatting and Style Guide
### Copyright © Kyle Roucis 2015-2016
#### v 1.0.0

## Preable
Everyone speaks differently. Everyone writes differently. Everyone constructs sentences differently. Everyone writes code differently. Simple facts of life. However, establishing conventions and styleguides helps collaborators create more efficiently. I (Kyle Roucis) present my own personal styleguide for generation of Swift 2 code in this document. It flies in the face of established conventions at times, and otherwise outlines the obvious. Even with these flaws, I hope that this guide will spurn discussion and hopefully make collaborating with me on future projects easier. Please feel free to contact me with regards to this guide by email at kyle (amphora) kyleroucis (dot) com.
*/

/*:
# Terminology
## CapsCase
`ThisIsCapsCase`
## camelCase
`thisIsCamelCase`
## under_case
`this_is_under_case`
## SCREAM_CASE
`THIS_IS_SCREAM_CASE`
## stdcase
`thisisstdcase`
# Brace Style
## New-line Braces
New-line braces are used for language-level constructs. This includes
* Type declarations
* Control-flow blocks (`if`/`while`/`do`/`catch`/etc.)
* Method/function bodies
### Rationale
This promotes an easily readable 'block' of code, neatly organizing each scope created by constructs in the language. This helps to differentiate from closures and to easily allow readers to see how execution flows at a glance without having to skim for keywords.
*/
if true
{

}
else if 1 == 2
{

}
else
{

}

while false
{

}

do
{

}
catch
{

}

func aFunction() -> Void
{
    
}

class Foo
{

}

struct Bar
{

}
//: __INCORRECT__
if true {

}
else {

}

if true { aFunction() }

if true {

} else if 1 == 2 {

} else {

}

do {

} catch {

}

func wrongFunc() {

}

class WrongClass {

}
/*:
## Same-line Braces
Same-line braces are used for closures. This includes
* Trailing closures for functions/methods.
* Stand-alone closure declarations.
Closure arguments and return type is declared on the same line as the brace.
### Rationale
This differentiates closures from function bodies, type declarations, and other 'static' declarations that are not generally a part of the run-time of the program. This also helps to associate trailing closures with their function calls in a concise manner.
*/
func aFuncWithTrailingClosure(closure: () -> Void) -> Void
{

}

func aFuncWithTrailingClosureWithArgsAndReturn(anArg: Int, closure: (Int) -> Float) -> Void
{

}

aFuncWithTrailingClosure {

}

aFuncWithTrailingClosureWithArgsAndReturn(1_023) { (i) -> Float in
    return 1.0
}

let aClosure: (Int) -> Void = { (x) in

}
//: __INCORRECT__
let wrongClosure: (Int) -> Void =
{ (x) in

}

aFuncWithTrailingClosure()
{
    print("WRONG!")
}
/*:
# Naming Conventions
## Types
Custom types are named using CapsCase. These types include
* Classes
* Structs
* Protocols
* Enum Names
* Enum Cases
* `typealias`-es
### Rationale
This follows much of Apple's style and differentiates constant, high-level types from local vars.
*/
class MyClass
{

}

struct MyStruct
{

}

protocol MyProtocol
{

}

enum MyEnum
{
    case MyCase
}

typealias MyInt = Int
//: __INCORRECT__
class anotherWrongClass
{

}

struct nope_struct
{

}

protocol BAD_Bad_protocol
{

}
/*:
## Methods/Functions
Method and function names use camelCase.
### Rationale
This follows much of Apple's style, continues to reflect the English-like idioms of ObjC & Swift; differentiates functions/methods from nested types.
*/
func anotherFunc() -> Void
{

}

func anotherWithArg(anArg: Int, andAnotherArg other: Float) -> Void
{

}

class AnotherClass
{
    class func awesome(woot: Float) -> Void
    {

    }

    func foo(bar: Int) -> Void
    {

    }

}
//: __INCORRECT__
func BadFunc()
{

}

func dont_name_anything_like_this()
{

}

extension AnotherClass
{
    func ReallyBadMethod()
    {

    }

}
/*:
## Class/struct Members
Class, protocol, and struct members (`let`, `var`, and properties) use `camelCase`.
### Rationale
This follows much of Apple's style, promoting an interchangeability between 'let'/'var' and hiding the complexities of computed properties.
*/
class YetAnother
{
    private var privateVar = 0
    var internalVar = "ASD"
    private let privateLet = 6
    let internalLet = "OPIO"
}
//: __INCORRECT__
class BadBadBad
{
    let LOOKS_LIKE_A_CONST = 5
    var ButIsActuallyBad = 1
    let getityet = false
}
/*:
## Locals
Local 'var' and 'let' use camelCase.
### Rationale
Maintain consistency for variables and constants.
*/
let localConstant = 0
var localVariable: AnotherClass?
let localClosure: () -> Void = {
}
var anotherLocalClosure = { (closureArg: Bool) -> Void in
}
//: __INCORRECT__
var UseCamelCasePlease: MyClass? = nil
let dont_name_stuff_like_this = true
/*:
# Spacing
## Indentation
Each subsequent scope is indented 4 _SPACES_ from its enclosing scope.
### Rationale
This maintains the readability of code blocks, efficiently conveying scope.
*/
class AClassInFirstScope
{
    var inSecondScope = 0
    func secondScope() -> Void
    {
        let somethingInThirdScope = 0
        if somethingInThirdScope == 1
        {
            var aVarInFourthScope = "vkakd"
        }
        else
        {
            let closureInFourthScope = { () -> Void in
                var aVarInFifthScope = 0
                if aVarInFifthScope == 1
                {
                    let aLetInSixthScope = "asfdasdf"
                }
            }
        }
    }

}
//: __INCORRECT__
class AnotherWrongClass
{
func notIndented()
{
    let closureIndentedCorrectly = { () -> Void in
            var indentedTooFar = true
    }
}
}
/*:
## Classes, Structs, and Enums
First-class types such as classes, structs, and enums are declared with a space between the type name and the required `:`, and a space between the `:` and any super types. Each comma in the list of supertypes/protocols is followed by a space. For generic types, their is _NO SPACE_ between the generic brace `<` and the type declaration. There is a space after each comma in a generic declaration list. For generic type arguments with restrictions, there is a space between the restricting type and the `:`, but _NO SPACE_ between the type name and the `:`.
(_Optional but preferred_): There is an extra newline between the last brace for method declarations in a class and the closing brace for the class itself.
### Rationale
This spacing helps readability and differentiates class declarations from other type annotations while still utilizing that type annotation idiom where appropriate for generics.
*/
class ASubclass<T, U: Equatable> : MyClass, MyProtocol
{
    func aMethod()
    {

    }

}

enum MyErrorType : ErrorType
{
    case AnError
}

protocol MyEquatable : class, Equatable, MyProtocol
{

}
//: __INCORRECT__
class BadSubclass< T,U:Equatable >:MyClass,MyProtocol
{

}

enum BadError:ErrorType
{

}

protocol BadProtocol:class,MyProtocol
{

}
/*:
## Functions and Methods
Functions and methods have a space after each comma separating arguments. There is space between the parens and the `throws` annotation. There is a space between the parens or throw and the return arrow `->`. There is a space between the return arrow `->` and the return type. For generic functions/methods, their is _NO SPACE_ between the generic brace `<` and the type declaration. There is a space after each comma in a generic declaration list. For generic type arguments with restrictions, there is a space between the restricting type and the `:`, but _NO SPACE_ between the type name and the `:`.
### Rationale
This spacing helps to call out the return type and throwing annotation of the function and follow type annotations for variables.
*/
func yetAnotherFunc(withAnArg arg: Int, andAnotherToShowSpace another: Int) -> Float
{
    return Float(arg + another)
}

func throwingFunc() throws -> Int
{
    if false
    {
        throw MyErrorType.AnError
    }

    return 0
}

func aGenericFunction<T: Equatable>(x: T) -> T
{
    return x
}
//: __INCORRECT__
func dontDoThis (arg:Int,and nother:Int)->Float
{
    return 0.0
}

func badThrower ()throws->Int
{
    return 0
}
/*:
## Closures
Like functions, closures have spaces between `throws` annotation, return arrow `->`, and return type. There is also a space between the opening brace and the arguments tuple, and a space after each variable declaration. When a closure is used as a trailing closure for a function/method call, there is a space between the function/method call and the opening brace of the closure.
### Rationale
This keeps function-like (functions, methods, and closures) consistent in their structure and readability.
*/
aFuncWithTrailingClosureWithArgsAndReturn(42) { (i) -> Float in
    return 0.0
}

var closure = { (_: Int) throws -> Void in

}
//: __INCORRECT__
aFuncWithTrailingClosure(){()->Void in
}

let superBadUnspacedClosure:(Int)throws->Void = {(_:Int)throws->Void in
}
/*:
# Variables and Data
## `var` And `let`
Constants and variables that need type annotations have a space after the `:`, but _NO SPACE_ before the `:`. This include variable declarations in functions/method/closure argument lists. For assignment, there is a space between the `var`/`let` name or class annotation and the `=`, and there is a space after the `=` to the next expression.
### Rationale
This differentiates type annotations from Dictionary key-value pairs and helps readability for the types involved in computation.
*/
var variableWithType: Int = 0
let constantWithType: MyClass?
let newClosure: (Int) -> Double = { (x: Int) -> Double in
    return Double(x)
}
let one = 1
//: __INCORRECT__
var badType:Int=0
let no: Bool=false
/*:
## Literals
Array and Dictionary literals have a space between the opening brace, the first element, the last element, and the closing brace. When they are empty, there is a space between each literal element (`[`, `:`, `]`). There is a space after each comma in the list of items. For a Dictionary literal, there is a space between each key and the `:`, and a space after the `:` to the value.
### Rationale
This gives elements, which may be very complex, breathing room as well as facilitating readability even when code highlighting is not available.
*/
let emptyArray: [ Int ] = [ ]
let anArray = [ 1 ]
let anotherArray = [ 3, 6, localConstant, aGenericFunction(44) ]

let emptyDictionary: [ Int : Int ] = [ : ]
let aDictionary = [ 4 : 6 ]
let anotherDictionary = [ 1 : 2, 3 : 4, 5 : 6 ]
//: __INCORRECT__
let badArray: [Int] = []
let alsoBadArray = [1]

let badDict: [Int:Int] = [1:2,3:4,5:6]

