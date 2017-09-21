//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
//str = 1
//let message =  "hello,world" //定数¥
//var s = "hello" //変数
var a:Int = 123
type(of:a) //Int.type
var b:Double = 2.0
let max = Int8.max
let d:Double = 1.0/0.0
d.isInfinite
let dd:Double = 0.0/0.0
dd.isNaN

let result = 7+9
let output = "結果: \(result)"
let string = "abc"
let characters = string.characters
let character = characters[characters.startIndex]
let cIndex = characters.index(characters.endIndex,offsetBy:-1)
let c = string[cIndex]
characters.count

let array:[[Int]]
array = [[1,2,3],[4]]

var dic = ["k1":1,"k2":2]
let value = dic["k2"]
dic["k3"] = 3 //追加
dic["k2"] = nil //削除
print(dic)

//半開区間
let range = 1..<4
let drange = 1.0..<3.5
//閉区間
let crange = 1...4
let cdrange = 1.0...3.5
let floatRange :Range<Float> = 1..<3
drange.lowerBound
cdrange.upperBound
range.contains(2)

//optional wrapp
var op: Int?

op = 1

if let opt = op {
    print(type(of: opt)) //値がないとifに入らない
}

let opInt : Int? = nil
let int = opInt ?? 3 //nilの時に値を設定
op! //強制アンラップ

//型のキャスト
let cast: Any = 1
let isInt = cast is Int
let num = 199 as Int

//guard (guardで定義した定数がそのまま使用可能)
func some(){
    let v = 1
    guard v < 0 else {
        print("正の値")
        return
    }
    //print("hu")
}

some()

//クロージャ
var closure: (String) -> Int

closure = { (string: String) -> Int in
    return string.characters.count
}

closure("abcd")

//型推論
closure = { string in
    string.characters.count * 2 //一行だとreturn省略可能
}

closure("abcd")

let isEqual: (Int,Int) -> Bool = {
    return $0 == $1
}

isEqual(2,2)

//構造体
struct Greeting {
    var to = "Yuto Ikeda" {
        willSet{
            print("willset: (to: \(self.to), newValue: \(newValue))")
        }
        
        didSet{
            print("didset: (to: \(self.to))")
        }
    }
    var body = "hi!"
}

//willset と didset 未来と過去
let greeting1 = Greeting()
var greeting2 = Greeting()
greeting2.to = "Hayata"

let to1 = greeting1.to
let to2 = greeting2.to

struct Temp {
    var celsius: Double = 0.0
    
    var fahrenheit: Double{
        //setがなければ省略可能
        get {
            return (9.0/5.0) * celsius + 32.0
        }
        
        //指定された時に値を変更する
        set {
        celsius = (5.0/9.0) * (newValue - 32.0)
        }
    }
}

var temp = Temp()
temp.celsius
temp.fahrenheit
temp.celsius = 30
temp.fahrenheit

//mutating 値型の値変更処理
extension Int {
    mutating func increment(){
        self += 1
    }
}

var inc = 1
inc.increment()
let bnc = 1
//bnc.increment() //letのためエラー

//class
//finalでoverrideを禁止
class User {
    let id: Int
    
    var message:String {
        return "hello"
    }
    
    init(id: Int){
        self.id = id
    }
    
    func printProfile() {
        print("class func")
        print("id: \(id)")
        print("mess: \(message)")
    }
}

//継承
class RegisterUser : User {
    let name : String
    
    init(id:Int, name : String){
        self.name = name
        super.init(id: id)
    }
    
    //再設定
    override func printProfile() {
        super.printProfile()
        print("name: \(name)")
    }
}
let use = User(id:2)
use.printProfile()

print("**********************")

let rUser = RegisterUser(id:1, name: "Kazu Ikeda")
let id = rUser.id
let message = rUser.message
rUser.printProfile()

print("**********************")

//列挙型
enum Weekday {
    case sun
    case mon
    case tues
    case wednes
    case thurs
    case fri
    case satur
    
    var name: String {
        switch self {
        case .sun: return "日"
        case .mon: return "月"
        case .tues: return "火"
        case .wednes: return "水"
        case .thurs: return "木"
        case .fri: return "金"
        case .satur: return "土"
        }
    }
}

let weekday = Weekday.mon
let wname = weekday.name

enum Symbol : Character {
    case sharp = "#"
    case dollsr = "$"
    case per = "%"
}

let symbol = Symbol(rawValue: "#")

