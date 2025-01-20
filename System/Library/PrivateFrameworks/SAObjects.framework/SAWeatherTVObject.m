@interface SAWeatherTVObject
+ (id)tVObject;
- (NSString)view;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setView:(id)a3;
@end

@implementation SAWeatherTVObject

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"TVObject";
}

+ (id)tVObject
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