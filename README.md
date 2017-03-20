
## SwiftKeyPath

An implementation of valueForKeyPath for Swift classes. If your class inherits from NSObject you
can use code such as the following:

```Swift
    var dvar = 99.0
    var ivar = 99
    var svar = "abcd"

    struct s {
        struct t {
            let j=88
        }
        let k = t()
    }
    var tvar = s()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        print(valueFor(keyPath:"dvar", type: Double.self)!)
        print(valueFor(keyPath:"ivar", type: Int.self)!)
        print(valueFor(keyPath:"svar", type: String.self)!)

        print(valueFor(keyPath:"tvar.k.j", type: Int.self)!)

output:
99.0
99
abcd
88

```

It uses Swift's Mirror class for reflection and should work for any type if you know it ahead of time.
The implementation is split between the Swift Source SwiftKeyPath.swift and and a small stub of (Objective-)C.

MIT Licensed.
