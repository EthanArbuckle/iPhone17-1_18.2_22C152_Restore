@interface WeatherLocation
+ (BOOL)supportsSecureCoding;
- (WeatherLocation)initWithCoder:(id)a3;
- (WeatherLocation)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation WeatherLocation

- (WeatherLocation)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  return (WeatherLocation *)WeatherLocation.init(identifier:display:pronunciationHint:)();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WeatherLocation)initWithCoder:(id)a3
{
  return (WeatherLocation *)WeatherLocation.init(coder:)(a3);
}

@end