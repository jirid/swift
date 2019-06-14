// RUN: %target-swift-frontend -interpret %s
// REQUIRES: executable_test

import Foundation

@_optimize(none) func blackHole<T>(_: T) {}

class C0<T> {
    
}

// fixed
class C1 {
    var v4: String?
    var v5: Int?
    var v6: String?
}

// singleton
class C2: C0<Int> {
    var v1 : URL?
    var v2 : URL?
    var v3 : URL?
    var v4: String?
    var v5: Int?
    var v6: String?
}

// want singleton, had fixedorupdate
class C3 {
    var v1 : URL?
    var v2 : URL?
    var v3 : URL?
    var v4: String?
    var v5: Int?
    var v6: String?
}

blackHole(C1())
blackHole(C2())
blackHole(C3())
