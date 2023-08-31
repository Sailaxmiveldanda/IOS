import UIKit

var greeting = "Hello, playground"

var fact = "Swift is a type safe language"
var dev = "Developmenr of Swift began in 2010"
var autor = "Swift was created by Chris Lattner"

print(fact.count)

fact += " it has great memory"
print(fact)

dev.append(" by Apple")
print(dev)

var b = autor.lowercased()
print(b)

var p = autor.uppercased()
print(p)

var x = autor[autor.startIndex]
print(x)

autor[autor.index(before: autor.endIndex)]

dev[dev.startIndex]

dev[dev.index(before: dev.endIndex)]

autor[autor.index(after: autor.startIndex)]

autor[autor.index(autor.startIndex,offsetBy: 5)]
autor[autor.index(autor.endIndex,offsetBy: -5)]
fact[fact.index(fact.endIndex,offsetBy: -4)]

