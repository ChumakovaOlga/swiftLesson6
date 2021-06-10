//
//  main.swift
//  swiftLesson6
//
//  Created by Olga Chumakova on 10.06.2021.
//

import Foundation

//1.    Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2.    Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3.    *Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

enum TypeCar: String {
    case sport = "sport"
    case trunk = "trunk"
}
class Profile {
    let typeCar: TypeCar
    let brand: String
    let year: Int
    
    init(typeCar: TypeCar, brand: String, year: Int) {
        self.typeCar = typeCar
        self.brand = brand
        self.year = year
    }
}
extension Profile {
    
    var info: String {
        "TypeCar: \(typeCar), Brand: \(brand), Year: \(year)"
    }
}
struct Queue<T> {
     var elements: [T] = []
   
    func filter(predicate: (T) -> Bool)-> [T] {
    var tempArray: [T] = []
        for element in elements {
            if predicate(element) {
                tempArray.append(element)
            }
        }
        return tempArray
    }
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        guard elements.count > 0 else { return nil}
        return elements.removeFirst()
    }
}

extension Queue {
    subscript(index: Int) -> T? {
        guard index >= 0 && index < elements.count else {
            return nil
        }
        return elements[index]
    }
}
var profiles = Queue<Profile>()

profiles.push(Profile(typeCar: .sport, brand: "Mescedes", year: 2021))
profiles.push(Profile(typeCar: .trunk, brand: "Volvo", year: 2019))
profiles.push(Profile(typeCar: .sport, brand: "Ford", year: 2018))
profiles.push(Profile(typeCar: .sport, brand: "Ferrary", year: 2017))
profiles.push(Profile(typeCar: .trunk, brand: "Zil", year: 2016))

var filterProfiles = profiles.filter{$0.year > 2017}
filterProfiles.forEach {print($0.info)}


