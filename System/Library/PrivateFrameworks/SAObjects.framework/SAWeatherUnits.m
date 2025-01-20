@interface SAWeatherUnits
+ (id)units;
- (NSString)distanceUnits;
- (NSString)precipitationUnits;
- (NSString)pressureUnits;
- (NSString)speedUnits;
- (NSString)temperatureUnits;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDistanceUnits:(id)a3;
- (void)setPrecipitationUnits:(id)a3;
- (void)setPressureUnits:(id)a3;
- (void)setSpeedUnits:(id)a3;
- (void)setTemperatureUnits:(id)a3;
@end

@implementation SAWeatherUnits

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"Units";
}

+ (id)units
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)distanceUnits
{
  return (NSString *)[(AceObject *)self propertyForKey:@"distanceUnits"];
}

- (void)setDistanceUnits:(id)a3
{
}

- (NSString)precipitationUnits
{
  return (NSString *)[(AceObject *)self propertyForKey:@"precipitationUnits"];
}

- (void)setPrecipitationUnits:(id)a3
{
}

- (NSString)pressureUnits
{
  return (NSString *)[(AceObject *)self propertyForKey:@"pressureUnits"];
}

- (void)setPressureUnits:(id)a3
{
}

- (NSString)speedUnits
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speedUnits"];
}

- (void)setSpeedUnits:(id)a3
{
}

- (NSString)temperatureUnits
{
  return (NSString *)[(AceObject *)self propertyForKey:@"temperatureUnits"];
}

- (void)setTemperatureUnits:(id)a3
{
}

@end