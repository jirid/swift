// RUN: %target-swift-frontend -interpret %s
// REQUIRES: executable_test

import Foundation

class C1 {
    var v1: URL?
    var v2: URL?
    var v3: URL?
    var v4: String?
    var v5: Int?
    var v6: String?
}

let _ = C1()
