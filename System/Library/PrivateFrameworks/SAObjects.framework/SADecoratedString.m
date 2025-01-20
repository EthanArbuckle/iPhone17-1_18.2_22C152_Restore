@interface SADecoratedString
+ (id)decoratedString;
- (NSArray)regions;
- (NSString)text;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRegions:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SADecoratedString

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DecoratedString";
}

+ (id)decoratedString
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)regions
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"regions", v3);
}

- (void)setRegions:(id)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

@end