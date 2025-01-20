@interface SAHAAttributeValue
+ (id)attributeValue;
- (NSString)units;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setUnits:(id)a3;
@end

@implementation SAHAAttributeValue

- (id)groupIdentifier
{
  return @"com.apple.ace.homeautomation";
}

- (id)encodedClassName
{
  return @"AttributeValue";
}

+ (id)attributeValue
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)units
{
  return (NSString *)[(AceObject *)self propertyForKey:@"units"];
}

- (void)setUnits:(id)a3
{
}

@end