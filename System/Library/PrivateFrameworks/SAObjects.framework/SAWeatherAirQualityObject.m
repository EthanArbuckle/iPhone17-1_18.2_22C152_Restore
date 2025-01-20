@interface SAWeatherAirQualityObject
+ (id)airQualityObject;
- (NSArray)pollutants;
- (NSString)airQualityRatingCategory;
- (NSString)localizedCategoryName;
- (SAWeatherLocation)airQualityLocation;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)airQualityIndex;
- (void)setAirQualityIndex:(int64_t)a3;
- (void)setAirQualityLocation:(id)a3;
- (void)setAirQualityRatingCategory:(id)a3;
- (void)setLocalizedCategoryName:(id)a3;
- (void)setPollutants:(id)a3;
@end

@implementation SAWeatherAirQualityObject

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"AirQualityObject";
}

+ (id)airQualityObject
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)airQualityIndex
{
  return AceObjectIntegerForProperty(self, @"airQualityIndex");
}

- (void)setAirQualityIndex:(int64_t)a3
{
}

- (SAWeatherLocation)airQualityLocation
{
  return (SAWeatherLocation *)AceObjectAceObjectForProperty(self, @"airQualityLocation");
}

- (void)setAirQualityLocation:(id)a3
{
}

- (NSString)airQualityRatingCategory
{
  return (NSString *)[(AceObject *)self propertyForKey:@"airQualityRatingCategory"];
}

- (void)setAirQualityRatingCategory:(id)a3
{
}

- (NSString)localizedCategoryName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"localizedCategoryName"];
}

- (void)setLocalizedCategoryName:(id)a3
{
}

- (NSArray)pollutants
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"pollutants", v3);
}

- (void)setPollutants:(id)a3
{
}

@end