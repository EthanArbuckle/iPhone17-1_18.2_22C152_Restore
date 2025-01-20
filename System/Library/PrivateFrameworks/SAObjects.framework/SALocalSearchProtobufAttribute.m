@interface SALocalSearchProtobufAttribute
+ (id)protobufAttribute;
- (NSString)name;
- (NSString)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setName:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SALocalSearchProtobufAttribute

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"ProtobufAttribute";
}

+ (id)protobufAttribute
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
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