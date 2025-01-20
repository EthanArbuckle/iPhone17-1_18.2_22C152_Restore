@interface SAWeatherAbstractObject
+ (id)abstractObject;
- (NSArray)dailyForecasts;
- (NSArray)hourlyForecasts;
- (NSString)extendedForecastUrl;
- (NSString)weatherRequest;
- (SAWeatherAirQualityObject)airQuality;
- (SAWeatherCurrentConditions)currentConditions;
- (SAWeatherLocation)weatherLocation;
- (SAWeatherUnits)units;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAirQuality:(id)a3;
- (void)setCurrentConditions:(id)a3;
- (void)setDailyForecasts:(id)a3;
- (void)setExtendedForecastUrl:(id)a3;
- (void)setHourlyForecasts:(id)a3;
- (void)setUnits:(id)a3;
- (void)setWeatherLocation:(id)a3;
- (void)setWeatherRequest:(id)a3;
@end

@implementation SAWeatherAbstractObject

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"AbstractObject";
}

+ (id)abstractObject
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAWeatherAirQualityObject)airQuality
{
  return (SAWeatherAirQualityObject *)AceObjectAceObjectForProperty(self, @"airQuality");
}

- (void)setAirQuality:(id)a3
{
}

- (SAWeatherCurrentConditions)currentConditions
{
  return (SAWeatherCurrentConditions *)AceObjectAceObjectForProperty(self, @"currentConditions");
}

- (void)setCurrentConditions:(id)a3
{
}

- (NSArray)dailyForecasts
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"dailyForecasts", v3);
}

- (void)setDailyForecasts:(id)a3
{
}

- (NSString)extendedForecastUrl
{
  return (NSString *)[(AceObject *)self propertyForKey:@"extendedForecastUrl"];
}

- (void)setExtendedForecastUrl:(id)a3
{
}

- (NSArray)hourlyForecasts
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"hourlyForecasts", v3);
}

- (void)setHourlyForecasts:(id)a3
{
}

- (SAWeatherUnits)units
{
  return (SAWeatherUnits *)AceObjectAceObjectForProperty(self, @"units");
}

- (void)setUnits:(id)a3
{
}

- (SAWeatherLocation)weatherLocation
{
  return (SAWeatherLocation *)AceObjectAceObjectForProperty(self, @"weatherLocation");
}

- (void)setWeatherLocation:(id)a3
{
}

- (NSString)weatherRequest
{
  return (NSString *)[(AceObject *)self propertyForKey:@"weatherRequest"];
}

- (void)setWeatherRequest:(id)a3
{
}

@end