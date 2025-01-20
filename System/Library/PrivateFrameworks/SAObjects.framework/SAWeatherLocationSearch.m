@interface SAWeatherLocationSearch
+ (id)locationSearch;
- (BOOL)requiresResponse;
- (NSString)locationId;
- (NSURL)identifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIdentifier:(id)a3;
- (void)setLocationId:(id)a3;
@end

@implementation SAWeatherLocationSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"LocationSearch";
}

+ (id)locationSearch
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)identifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"identifier");
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)locationId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"locationId"];
}

- (void)setLocationId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end