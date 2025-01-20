@interface SADistance
+ (id)distance;
- (NSNumber)value;
- (NSString)unit;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setUnit:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SADistance

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"Distance";
}

+ (id)distance
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)unit
{
  return (NSString *)[(AceObject *)self propertyForKey:@"unit"];
}

- (void)setUnit:(id)a3
{
}

- (NSNumber)value
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

@end