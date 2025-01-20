@interface SAWeatherLocationDelete
+ (id)locationDelete;
- (BOOL)requiresResponse;
- (SAWeatherLocation)weatherLocation;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setWeatherLocation:(id)a3;
@end

@implementation SAWeatherLocationDelete

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"LocationDelete";
}

+ (id)locationDelete
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAWeatherLocation)weatherLocation
{
  return (SAWeatherLocation *)AceObjectAceObjectForProperty(self, @"weatherLocation");
}

- (void)setWeatherLocation:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end