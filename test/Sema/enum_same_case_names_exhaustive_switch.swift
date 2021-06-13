// RUN: %target-typecheck-verify-swift -parse-stdlib
// tests the exhaustiveness checking of enums with same named cases that differ in associated value labels and/or types

struct A {}
struct C {}

enum B {
    case a(A)
    case a(a: A)
    case a(b: A)
    case a(c: C)
}

let a: B = .a(b: A())

switch a { // expected-error {{switch must be exhaustive}} expected-note {{add missing case: '.a(_)'}}
case .a(a: _): break
case .a(b: _): break
case .a(c: _): break
}

switch a { // expected-error {{switch must be exhaustive}} expected-note {{add missing case: '.a(a: let a)'}}
case .a(_): break
case .a(b: _): break
case .a(c: _): break
}

switch a { // expected-error {{switch must be exhaustive}} expected-note {{add missing case: '.a(b: let b)'}}
case .a(_): break
case .a(a: _): break
case .a(c: _): break
}

switch a { // expected-error {{switch must be exhaustive}} expected-note {{add missing case: '.a(c: let c)'}}
case .a(_): break
case .a(a: _): break
case .a(b: _): break
}
