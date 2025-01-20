@interface WeatherLocation
+ (BOOL)supportsSecureCoding;
- (WeatherLocation)initWithCoder:(id)a3;
- (WeatherLocation)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation WeatherLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WeatherLocation)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_100010470();
  }
  sub_100010470();
  if (a5) {
    sub_100010470();
  }
  return (WeatherLocation *)WeatherLocation.init(identifier:display:pronunciationHint:)();
}

- (WeatherLocation)initWithCoder:(id)a3
{
  return (WeatherLocation *)WeatherLocation.init(coder:)(a3);
}

@end