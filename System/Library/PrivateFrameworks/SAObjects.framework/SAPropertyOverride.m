@interface SAPropertyOverride
+ (id)propertyOverride;
- (NSString)property;
- (NSString)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setProperty:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SAPropertyOverride

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"PropertyOverride";
}

+ (id)propertyOverride
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)property
{
  return (NSString *)[(AceObject *)self propertyForKey:@"property"];
}

- (void)setProperty:(id)a3
{
}

- (NSString)value
{
  return (NSString *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

@end