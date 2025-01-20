@interface SAHAStringValue
+ (id)stringValue;
- (NSString)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setValue:(id)a3;
@end

@implementation SAHAStringValue

- (id)groupIdentifier
{
  return @"com.apple.ace.homeautomation";
}

- (id)encodedClassName
{
  return @"StringValue";
}

+ (id)stringValue
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)value
{
  return (NSString *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

@end