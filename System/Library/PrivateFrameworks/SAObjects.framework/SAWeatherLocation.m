@interface SAWeatherLocation
+ (id)location;
- (NSString)locationId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLocationId:(id)a3;
@end

@implementation SAWeatherLocation

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"Location";
}

+ (id)location
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)locationId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"locationId"];
}

- (void)setLocationId:(id)a3
{
}

@end