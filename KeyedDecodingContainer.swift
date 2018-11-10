//
//  KeyedDecodingContainer.swift
//  NetworkManager
//
//  Created by Fadi Abuzant on 10/23/18.
//  Copyright © 2018 Fadi Abuzant. All rights reserved.
//

import Foundation

extension KeyedDecodingContainer {
    //MARK: - String
    func decodeIfPresent(_ type: String.Type, forKey key: K) throws -> String? {
        var value:String?
        do {
            value = try self.decode(String.self, forKey: key)
        }catch{
            do {
                let boolValue = try self.decode(Bool.self, forKey: key)
                value = String(boolValue)
            }catch{
                do {
                    let intValue = try self.decode(Int.self, forKey: key)
                    let floatValue = try self.decode(Float.self, forKey: key)
                    if (Float(intValue) == floatValue) {
                        value = String(intValue)
                    }else {
                        value = String(floatValue)
                    }
                }catch{
                }
            }
        }
        return value
    }
    
    //MARK: - Int
    func decodeIfPresent(_ type: Int.Type, forKey key: K) throws -> Int? {
        var value:Int?
        do {
            value = try self.decode(Int.self, forKey: key)
        }catch{
            do {
                let boolValue = try self.decode(Bool.self, forKey: key)
                value = boolValue ? 1 : 0
            }catch{
                do {
                    let stringValue = try self.decode(String.self, forKey: key)
                    value = Int(stringValue)
                }catch{
                }
            }
        }
        return value
    }
    
    //MARK: - Bool
    func decodeIfPresent(_ type: Bool.Type, forKey key: K) throws -> Bool? {
        var value:Bool?
        do {
            value = try self.decode(Bool.self, forKey: key)
        }catch{
            do {
                let intValue = try self.decode(Int.self, forKey: key)
                value = Bool(truncating: intValue as NSNumber)
            }catch{
                do {
                    let stringValue = try self.decode(String.self, forKey: key)
                    value = Bool(stringValue)
                }catch{
                }
            }
        }
        return value
    }
    
    //MARK: - Float
    func decodeIfPresent(_ type: Float.Type, forKey key: K) throws -> Float? {
        var value:Float?
        do {
            value = try self.decode(Float.self, forKey: key)
        }catch{
            do {
                let boolValue = try self.decode(Bool.self, forKey: key)
                value = boolValue ? 1.0 : 0.0
            }catch{
                do {
                    let stringValue = try self.decode(String.self, forKey: key)
                    value = Float(stringValue)
                }catch{
                }
            }
        }
        return value
    }
    
    //MARK: - Double
    func decodeIfPresent(_ type: Double.Type, forKey key: K) throws -> Double? {
        var value:Double?
        do {
            value = try self.decode(Double.self, forKey: key)
        }catch{
            do {
                let boolValue = try self.decode(Bool.self, forKey: key)
                value = boolValue ? 1.0 : 0.0
            }catch{
                do {
                    let stringValue = try self.decode(String.self, forKey: key)
                    value = Double(stringValue)
                }catch{
                }
            }
        }
        return value
    }
    
    //MARK: - URL
    func decodeIfPresent(_ type: URL.Type, forKey key: K) throws -> URL? {
        var value:URL?
        do {
            value = try self.decode(URL.self, forKey: key)
        }catch{
        }
        return value
    }
    
    //MARK: - Date
    func decodeIfPresent(_ type: Date.Type, forKey key: K) throws -> Date? {
        var value:Date?
        do {
            let timeStamp = try self.decode(Double.self, forKey: key)
            if let div = Double(key.description) {
                value = Date(timeIntervalSince1970: TimeInterval(timeStamp / div))
            }else {
                value = Date(timeIntervalSince1970: TimeInterval(timeStamp))
            }
        }catch{
            do {
                value = try self.decode(Date.self, forKey: key)
            }catch{
                do {
                    let stringValue = try self.decode(String.self, forKey: key)
                    guard !key.description.isEmpty else {
                        return value
                    }
                    value = self.fromStringToDate(dateString: stringValue, format: key.description)
                } catch {
                }
            }
        }
        return value
    }
    
    fileprivate func fromStringToDate(dateString: String, format: String) -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none;
        dateFormatter.timeStyle = .none;
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent;
        dateFormatter.dateFormat = format;
        
        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }
        return date
    }
    
    //MARK: - Decodable Property
    func decodeIfPresent<T>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T? where T : Decodable {
        var value:T?
        do {
            value = try self.decode(T.self, forKey: key)
        }catch{
        }
        return value
    }
}

// MARK:- Another Int Decoding
extension KeyedDecodingContainer {
    func decodeIfPresent(_ type: Int8.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> Int8? {
        var value:Int8?
        do {
            value = try self.decode(Int8.self, forKey: key)
        }catch{
            do {
                let stringValue = try self.decode(String.self, forKey: key)
                value = Int8(stringValue)
            }catch{
            }
        }
        return value
    }
    func decodeIfPresent(_ type: Int16.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> Int16? {
        var value:Int16?
        do {
            value = try self.decode(Int16.self, forKey: key)
        }catch{
            do {
                let stringValue = try self.decode(String.self, forKey: key)
                value = Int16(stringValue)
            }catch{
            }
        }
        return value
    }
    func decodeIfPresent(_ type: Int32.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> Int32? {
        var value:Int32?
        do {
            value = try self.decode(Int32.self, forKey: key)
        }catch{
            do {
                let stringValue = try self.decode(String.self, forKey: key)
                value = Int32(stringValue)
            }catch{
            }
        }
        return value
    }
    func decodeIfPresent(_ type: Int64.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> Int64? {
        var value:Int64?
        do {
            value = try self.decode(Int64.self, forKey: key)
        }catch{
            do {
                let stringValue = try self.decode(String.self, forKey: key)
                value = Int64(stringValue)
            }catch{
            }
        }
        return value
    }
    func decodeIfPresent(_ type: UInt.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> UInt? {
        var value:UInt?
        do {
            value = try self.decode(UInt.self, forKey: key)
        }catch{
            do {
                let stringValue = try self.decode(String.self, forKey: key)
                value = UInt(stringValue)
            }catch{
            }
        }
        return value
    }
    func decodeIfPresent(_ type: UInt8.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> UInt8? {
        var value:UInt8?
        do {
            value = try self.decode(UInt8.self, forKey: key)
        }catch{
            do {
                let stringValue = try self.decode(String.self, forKey: key)
                value = UInt8(stringValue)
            }catch{
            }
        }
        return value
    }
    func decodeIfPresent(_ type: UInt16.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> UInt16? {
        var value:UInt16?
        do {
            value = try self.decode(UInt16.self, forKey: key)
        }catch{
            do {
                let stringValue = try self.decode(String.self, forKey: key)
                value = UInt16(stringValue)
            }catch{
            }
        }
        return value
    }
    func decodeIfPresent(_ type: UInt32.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> UInt32? {
        var value:UInt32?
        do {
            value = try self.decode(UInt32.self, forKey: key)
        }catch{
            do {
                let stringValue = try self.decode(String.self, forKey: key)
                value = UInt32(stringValue)
            }catch{
            }
        }
        return value
    }
    func decodeIfPresent(_ type: UInt64.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> UInt64? {
        var value:UInt64?
        do {
            value = try self.decode(UInt64.self, forKey: key)
        }catch{
            do {
                let stringValue = try self.decode(String.self, forKey: key)
                value = UInt64(stringValue)
            }catch{
            }
        }
        return value
    }

}
