@interface SAWeatherObject
+ (id)object;
- (NSString)view;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setView:(id)a3;
@end

@implementation SAWeatherObject

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"Object";
}

+ (id)object
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)view
{
  return (NSString *)[(AceObject *)self propertyForKey:@"view"];
}

- (void)setView:(id)a3
{
}

@end