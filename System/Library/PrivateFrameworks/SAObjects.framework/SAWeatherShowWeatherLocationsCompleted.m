@interface SAWeatherShowWeatherLocationsCompleted
+ (id)showWeatherLocationsCompleted;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAWeatherShowWeatherLocationsCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"ShowWeatherLocationsCompleted";
}

+ (id)showWeatherLocationsCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end