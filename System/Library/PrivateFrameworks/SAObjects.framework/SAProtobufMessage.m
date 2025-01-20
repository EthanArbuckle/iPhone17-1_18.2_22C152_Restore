@interface SAProtobufMessage
+ (id)protobufMessage;
- (NSData)data;
- (NSString)typeName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setData:(id)a3;
- (void)setTypeName:(id)a3;
@end

@implementation SAProtobufMessage

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ProtobufMessage";
}

+ (id)protobufMessage
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)data
{
  return (NSData *)[(AceObject *)self propertyForKey:@"data"];
}

- (void)setData:(id)a3
{
}

- (NSString)typeName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"typeName"];
}

- (void)setTypeName:(id)a3
{
}

@end