@interface SAWeatherShowWeatherLocations
+ (id)showWeatherLocations;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAWeatherShowWeatherLocations

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"ShowWeatherLocations";
}

+ (id)showWeatherLocations
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 1;
}

@end