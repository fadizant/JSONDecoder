//
//  KeyedDecodingContainer.swift
//  NetworkManager
//
//  Created by Fadi Abuzant on 10/23/18.
//  Copyright © 2018 Fadi Abuzant. All rights reserved.
//

import Foundation

extension String {
    
    // MARK: - Date Formtter
    
    func date(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .none
        dateFormatter.timeZone = .autoupdatingCurrent
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}

extension KeyedDecodingContainer {
    
    // MARK: - String
    
    func decodeIfPresent(_ type: String.Type, forKey key: K) throws -> String? {
        if let stringValue = try? decode(String.self, forKey: key) {
            return stringValue
        } else if let boolValue = try? decode(Bool.self, forKey: key) {
            return String(boolValue)
        } else if let intValue = try? decode(Int.self, forKey: key) {
            return String(intValue)
        } else if let doubleValue = try? decode(Double.self, forKey: key) {
            return String(doubleValue)
        } else {
            return "-"
        }
    }
    
    // MARK: - Int
    
    func decodeIfPresent(_ type: Int.Type, forKey key: K) throws -> Int? {
        if let intValue = try? decode(Int.self, forKey: key) {
            return intValue
        } else if let boolValue = try? decode(Bool.self, forKey: key) {
            return boolValue ? 1 : 0
        } else if let stringValue = try? decode(String.self, forKey: key) {
            return Int(stringValue) ?? 0
        } else if let doubleValue = try? decode(Double.self, forKey: key) {
            return Int(doubleValue)
        } else {
            return 0
        }
    }
    
    // MARK: - Bool
    
    func decodeIfPresent(_ type: Bool.Type, forKey key: K) throws -> Bool? {
        if let boolValue = try? decode(Bool.self, forKey: key) {
            return boolValue
        } else if let intValue = try? decode(Int.self, forKey: key) {
            return Bool(truncating: intValue as NSNumber)
        } else if let stringValue = try? decode(String.self, forKey: key) {
            return Bool(stringValue)
        } else {
            return nil
        }
    }
    
    // MARK: - Float
    
    func decodeIfPresent(_ type: Float.Type, forKey key: K) throws -> Float? {
        if let floatValue = try? decode(Float.self, forKey: key) {
            return floatValue
        } else if let boolValue = try? decode(Bool.self, forKey: key) {
            return boolValue ? 1 : 0
        } else if let stringValue = try? decode(String.self, forKey: key) {
            return Float(stringValue)
        } else {
            return 0.0
        }
    }
    
    // MARK: - Double
    
    func decodeIfPresent(_ type: Double.Type, forKey key: K) throws -> Double? {
        if let doubleValue = try? decode(Double.self, forKey: key) {
            return doubleValue
        } else if let boolValue = try? decode(Bool.self, forKey: key) {
            return boolValue ? 1 : 0
        } else if let stringValue = try? decode(String.self, forKey: key) {
            return Double(stringValue)
        } else {
            return 0.0
        }
    }
    
    // MARK: - URL
    
    func decodeIfPresent(_ type: URL.Type, forKey key: K) throws -> URL? {
        return try? decode(URL.self, forKey: key)
    }
    
    // MARK: - Date
    
    func decodeIfPresent(_ type: Date.Type, forKey key: K) throws -> Date? {
        if let timeStampValue = try? decode(Double.self, forKey: key) {
            if let div = Double(key.description) {
                return Date(timeIntervalSince1970: TimeInterval(timeStampValue / div))
            }else {
                return Date(timeIntervalSince1970: TimeInterval(timeStampValue))
            }
        } else if let dateValue = try? decode(Date.self, forKey: key) {
            return dateValue
        } else if let stringValue = try? decode(String.self, forKey: key), !key.description.isEmpty {
            return stringValue.date(format: key.description)
        } else {
            return Date()
        }
    }
    
}

extension KeyedDecodingContainer {
    
    // MARK: - Another Int Decoding
    
    func decodeIfPresent(_ type: Int8.Type, forKey key: K) throws -> Int8? {
        if let int8Value = try? decode(Int8.self, forKey: key) {
            return int8Value
        } else if let stringValue = try? decode(String.self, forKey: key) {
            return Int8(stringValue)
        } else {
            return 0
        }
    }
    
    func decodeIfPresent(_ type: Int16.Type, forKey key: K) throws -> Int16? {
        if let int16Value = try? decode(Int16.self, forKey: key) {
            return int16Value
        } else if let stringValue = try? decode(String.self, forKey: key) {
            return Int16(stringValue)
        } else {
            return 0
        }
    }
    
    func decodeIfPresent(_ type: Int32.Type, forKey key: K) throws -> Int32? {
        if let int32Value = try? decode(Int32.self, forKey: key) {
            return int32Value
        } else if let stringValue = try? decode(String.self, forKey: key) {
            return Int32(stringValue)
        } else {
            return 0
        }
    }
    
    func decodeIfPresent(_ type: Int64.Type, forKey key: K) throws -> Int64? {
        if let int64Value = try? decode(Int64.self, forKey: key) {
            return int64Value
        } else if let stringValue = try? decode(String.self, forKey: key) {
            return Int64(stringValue)
        } else {
            return 0
        }
    }
    
    func decodeIfPresent(_ type: UInt.Type, forKey key: K) throws -> UInt? {
        if let uIntValue = try? decode(UInt.self, forKey: key) {
            return uIntValue
        } else if let stringValue = try? decode(String.self, forKey: key) {
            return UInt(stringValue)
        } else {
            return 0
        }
    }
    
    func decodeIfPresent(_ type: UInt8.Type, forKey key: K) throws -> UInt8? {
        if let uInt8Value = try? decode(UInt8.self, forKey: key) {
            return uInt8Value
        } else if let stringValue = try? decode(String.self, forKey: key) {
            return UInt8(stringValue)
        } else {
            return 0
        }
    }
    
    func decodeIfPresent(_ type: UInt16.Type, forKey key: K) throws -> UInt16? {
        if let uInt16Value = try? decode(UInt16.self, forKey: key) {
            return uInt16Value
        } else if let stringValue = try? decode(String.self, forKey: key) {
            return UInt16(stringValue)
        } else {
            return 0
        }
    }
    
    func decodeIfPresent(_ type: UInt32.Type, forKey key: K) throws -> UInt32? {
        if let iInt32Value = try? decode(UInt32.self, forKey: key) {
            return iInt32Value
        } else if let stringValue = try? decode(String.self, forKey: key) {
            return UInt32(stringValue)
        } else {
            return 0
        }
    }
    
    func decodeIfPresent(_ type: UInt64.Type, forKey key: K) throws -> UInt64? {
        if let uInt64Value = try? decode(UInt64.self, forKey: key) {
            return uInt64Value
        } else if let stringValue = try? decode(String.self, forKey: key) {
            return UInt64(stringValue)
        } else {
            return 0
        }
    }
    
}
