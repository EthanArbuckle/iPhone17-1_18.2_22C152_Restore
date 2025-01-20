@interface SAWeatherDailyForecast
+ (id)dailyForecast;
- (NSNumber)highTemperature;
- (NSNumber)lowTemperature;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHighTemperature:(id)a3;
- (void)setLowTemperature:(id)a3;
@end

@implementation SAWeatherDailyForecast

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"DailyForecast";
}

+ (id)dailyForecast
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)highTemperature
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"highTemperature"];
}

- (void)setHighTemperature:(id)a3
{
}

- (NSNumber)lowTemperature
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"lowTemperature"];
}

- (void)setLowTemperature:(id)a3
{
}

@end