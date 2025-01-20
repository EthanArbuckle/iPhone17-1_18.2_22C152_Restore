@interface SAWeatherLocationSearchCompleted
+ (id)locationSearchCompleted;
+ (id)locationSearchCompletedWithWeatherLocations:(id)a3;
- (BOOL)requiresResponse;
- (NSArray)weatherLocations;
- (SAWeatherLocationSearchCompleted)initWithWeatherLocations:(id)a3;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setWeatherLocations:(id)a3;
@end

@implementation SAWeatherLocationSearchCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"LocationSearchCompleted";
}

+ (id)locationSearchCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)locationSearchCompletedWithWeatherLocations:(id)a3
{
  id v3 = a3;
  v4 = [[SAWeatherLocationSearchCompleted alloc] initWithWeatherLocations:v3];

  return v4;
}

- (SAWeatherLocationSearchCompleted)initWithWeatherLocations:(id)a3
{
  id v4 = a3;
  v5 = [(AceObject *)self init];
  v6 = v5;
  if (v5) {
    [(SAWeatherLocationSearchCompleted *)v5 setWeatherLocations:v4];
  }

  return v6;
}

- (NSArray)weatherLocations
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"weatherLocations", v3);
}

- (void)setWeatherLocations:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end