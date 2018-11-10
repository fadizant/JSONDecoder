
# JSONDecoder

Say goodbye to mismatch type problem in JSONDecoder 🎉, all you have to do to download [KeyedDecodingContainer.swift](https://github.com/fadizant/JSONDecoder/raw/master/KeyedDecodingContainer.swift) and add it to your project, easy right 😉 .

That's not everything, I had handle some stuff for you to make live easy for you 😄 .

## String VS Int
Don't be afraid 😱 when you recive Int type but you declear it as String and vice versa, becuase [KeyedDecodingContainer.swift](https://github.com/fadizant/JSONDecoder/raw/master/KeyedDecodingContainer.swift) will convert it for you 😎 .

## Date
For Date you can use CodingKeys to set Date format or timeStamp division, I use description to get it 🤓 .

### Sample
```ruby
struct MyModule : Decodable {
    var date:Date?
    private enum CodingKeys : String, CodingKey {
        case date
        var description :String {
            switch self {
            case .date:
                return "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" //or "1000" for timeStamp in millisecond 
            }
        }
    }
}
```

# Enjoy 😁
**Make sure all properties in your module as optional property 🤔, for missing data 😑 .**
