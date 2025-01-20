@interface SAWeatherCurrentConditions
+ (id)currentConditions;
- (NSNumber)dayOfWeek;
- (NSNumber)percentOfMoonFaceVisible;
- (NSNumber)uvIndex;
- (NSString)dewPoint;
- (NSString)heatIndex;
- (NSString)moonPhase;
- (NSString)percentHumidity;
- (NSString)sunrise;
- (NSString)sunset;
- (NSString)temperature;
- (NSString)timeOfObservation;
- (NSString)timeZone;
- (NSString)totalDailyPrecipitation;
- (NSString)visibility;
- (NSString)windChill;
- (SAWeatherBarometricPressure)barometricPressure;
- (SAWeatherCondition)condition;
- (SAWeatherWindSpeed)windSpeed;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBarometricPressure:(id)a3;
- (void)setCondition:(id)a3;
- (void)setDayOfWeek:(id)a3;
- (void)setDewPoint:(id)a3;
- (void)setHeatIndex:(id)a3;
- (void)setMoonPhase:(id)a3;
- (void)setPercentHumidity:(id)a3;
- (void)setPercentOfMoonFaceVisible:(id)a3;
- (void)setSunrise:(id)a3;
- (void)setSunset:(id)a3;
- (void)setTemperature:(id)a3;
- (void)setTimeOfObservation:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setTotalDailyPrecipitation:(id)a3;
- (void)setUvIndex:(id)a3;
- (void)setVisibility:(id)a3;
- (void)setWindChill:(id)a3;
- (void)setWindSpeed:(id)a3;
@end

@implementation SAWeatherCurrentConditions

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"CurrentConditions";
}

+ (id)currentConditions
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAWeatherBarometricPressure)barometricPressure
{
  return (SAWeatherBarometricPressure *)AceObjectAceObjectForProperty(self, @"barometricPressure");
}

- (void)setBarometricPressure:(id)a3
{
}

- (SAWeatherCondition)condition
{
  return (SAWeatherCondition *)AceObjectAceObjectForProperty(self, @"condition");
}

- (void)setCondition:(id)a3
{
}

- (NSNumber)dayOfWeek
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"dayOfWeek"];
}

- (void)setDayOfWeek:(id)a3
{
}

- (NSString)dewPoint
{
  return (NSString *)[(AceObject *)self propertyForKey:@"dewPoint"];
}

- (void)setDewPoint:(id)a3
{
}

- (NSString)heatIndex
{
  return (NSString *)[(AceObject *)self propertyForKey:@"heatIndex"];
}

- (void)setHeatIndex:(id)a3
{
}

- (NSString)moonPhase
{
  return (NSString *)[(AceObject *)self propertyForKey:@"moonPhase"];
}

- (void)setMoonPhase:(id)a3
{
}

- (NSString)percentHumidity
{
  return (NSString *)[(AceObject *)self propertyForKey:@"percentHumidity"];
}

- (void)setPercentHumidity:(id)a3
{
}

- (NSNumber)percentOfMoonFaceVisible
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"percentOfMoonFaceVisible"];
}

- (void)setPercentOfMoonFaceVisible:(id)a3
{
}

- (NSString)sunrise
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sunrise"];
}

- (void)setSunrise:(id)a3
{
}

- (NSString)sunset
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sunset"];
}

- (void)setSunset:(id)a3
{
}

- (NSString)temperature
{
  return (NSString *)[(AceObject *)self propertyForKey:@"temperature"];
}

- (void)setTemperature:(id)a3
{
}

- (NSString)timeOfObservation
{
  return (NSString *)[(AceObject *)self propertyForKey:@"timeOfObservation"];
}

- (void)setTimeOfObservation:(id)a3
{
}

- (NSString)timeZone
{
  return (NSString *)[(AceObject *)self propertyForKey:@"timeZone"];
}

- (void)setTimeZone:(id)a3
{
}

- (NSString)totalDailyPrecipitation
{
  return (NSString *)[(AceObject *)self propertyForKey:@"totalDailyPrecipitation"];
}

- (void)setTotalDailyPrecipitation:(id)a3
{
}

- (NSNumber)uvIndex
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"uvIndex"];
}

- (void)setUvIndex:(id)a3
{
}

- (NSString)visibility
{
  return (NSString *)[(AceObject *)self propertyForKey:@"visibility"];
}

- (void)setVisibility:(id)a3
{
}

- (NSString)windChill
{
  return (NSString *)[(AceObject *)self propertyForKey:@"windChill"];
}

- (void)setWindChill:(id)a3
{
}

- (SAWeatherWindSpeed)windSpeed
{
  return (SAWeatherWindSpeed *)AceObjectAceObjectForProperty(self, @"windSpeed");
}

- (void)setWindSpeed:(id)a3
{
}

@end