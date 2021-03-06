//: Playground - noun: a place where people can play

import UIKit

//Optional Chaining

//Optional Chaining as an Alternative to Forced Unwrapping
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()
//let roomCount = john.resident!.nubmerOfRooms

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

//Defining Model Classes for Optional Chaining
class Person1 {
    var residence: Residence1?
}

class Residence1 {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var adddress: Address?
}

class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street  {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

//Accessing Properties Through Optional Chaining
let john1 = Person1()
if let roomCount = john1.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john1.residence?.adddress = someAddress

func createAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}
john1.residence?.adddress = createAddress()

//Calling Methods Through Optioanal Chaining
if john1.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

if (john1.residence?.adddress = someAddress) != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

//Accessing Subscripts Through Optional Chaining
if let firstRoomName = john1.residence?[0].name {
    print("The first room is \(firstRoomName)")
} else {
    print("Unable to retrieve the first room name.")
}

john1.residence?[0] = Room(name: "Bathroom")

let johnsHouse = Residence1()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john1.residence = johnsHouse

if let firstRoomName = john1.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

//Accessing Subscripts of Optional Type
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72

//Linking Multiple Levels of Chaining
if let johnStreet = john1.residence?.adddress?.street {
    print("John's street name is \(johnStreet)")
} else {
    print("Unable to retrieve the address.")
}

let johnAddress = Address()
johnAddress.buildingName = "The Larches"
johnAddress.street = "Laurel Street"
john1.residence?.adddress = johnAddress

if let johnStreet = john1.residence?.adddress?.street {
    print("John's street name is \(johnStreet).")
} else {
    print("Unable to retrieve the address.")
}

//Chaining on Methods with Optional Return Values
if let buildingIdentifier = john1.residence?.adddress?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier)")
}

if let beginWithThe = john1.residence?.adddress?.buildingIdentifier()?.hasPrefix("The") {
    if beginWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"The\".")
    }
}




