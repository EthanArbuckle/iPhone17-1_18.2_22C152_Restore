@interface SAWeatherHourlyForecast
+ (id)hourlyForecast;
- (NSNumber)temperature;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTemperature:(id)a3;
@end

@implementation SAWeatherHourlyForecast

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"HourlyForecast";
}

+ (id)hourlyForecast
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)temperature
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"temperature"];
}

- (void)setTemperature:(id)a3
{
}

@end