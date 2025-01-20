@interface SAWeatherLocationAdd
+ (id)locationAdd;
- (BOOL)requiresResponse;
- (SAWeatherLocation)weatherLocation;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setWeatherLocation:(id)a3;
@end

@implementation SAWeatherLocationAdd

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"LocationAdd";
}

+ (id)locationAdd
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