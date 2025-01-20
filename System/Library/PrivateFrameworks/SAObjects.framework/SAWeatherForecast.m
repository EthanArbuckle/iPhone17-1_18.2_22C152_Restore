@interface SAWeatherForecast
+ (id)forecast;
- (NSNumber)chanceOfPrecipitation;
- (NSNumber)isUserRequested;
- (NSNumber)timeIndex;
- (SAWeatherCondition)condition;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setChanceOfPrecipitation:(id)a3;
- (void)setCondition:(id)a3;
- (void)setIsUserRequested:(id)a3;
- (void)setTimeIndex:(id)a3;
@end

@implementation SAWeatherForecast

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"Forecast";
}

+ (id)forecast
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)chanceOfPrecipitation
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"chanceOfPrecipitation"];
}

- (void)setChanceOfPrecipitation:(id)a3
{
}

- (SAWeatherCondition)condition
{
  return (SAWeatherCondition *)AceObjectAceObjectForProperty(self, @"condition");
}

- (void)setCondition:(id)a3
{
}

- (NSNumber)isUserRequested
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"isUserRequested"];
}

- (void)setIsUserRequested:(id)a3
{
}

- (NSNumber)timeIndex
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"timeIndex"];
}

- (void)setTimeIndex:(id)a3
{
}

@end