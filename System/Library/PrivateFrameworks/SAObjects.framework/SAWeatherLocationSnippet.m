@interface SAWeatherLocationSnippet
+ (id)locationSnippet;
- (NSArray)weatherLocations;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setWeatherLocations:(id)a3;
@end

@implementation SAWeatherLocationSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"LocationSnippet";
}

+ (id)locationSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)weatherLocations
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"weatherLocations", v3);
}

- (void)setWeatherLocations:(id)a3
{
}

@end