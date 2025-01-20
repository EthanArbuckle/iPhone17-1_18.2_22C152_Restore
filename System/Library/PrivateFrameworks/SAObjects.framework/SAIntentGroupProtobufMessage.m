@interface SAIntentGroupProtobufMessage
+ (id)protobufMessage;
- (NSData)data;
- (NSString)debugString;
- (NSString)typeName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setData:(id)a3;
- (void)setDebugString:(id)a3;
- (void)setTypeName:(id)a3;
@end

@implementation SAIntentGroupProtobufMessage

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
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

- (NSString)debugString
{
  return (NSString *)[(AceObject *)self propertyForKey:@"debugString"];
}

- (void)setDebugString:(id)a3
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