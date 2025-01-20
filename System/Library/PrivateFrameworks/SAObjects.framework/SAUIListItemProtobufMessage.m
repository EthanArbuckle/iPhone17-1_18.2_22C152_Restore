@interface SAUIListItemProtobufMessage
+ (id)listItemProtobufMessage;
- (NSData)dynamicURLImageResourceData;
- (NSData)dynamicURLImageResourceDataEvodBumper;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDynamicURLImageResourceData:(id)a3;
- (void)setDynamicURLImageResourceDataEvodBumper:(id)a3;
@end

@implementation SAUIListItemProtobufMessage

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"ListItemProtobufMessage";
}

+ (id)listItemProtobufMessage
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)dynamicURLImageResourceData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"dynamicURLImageResourceData"];
}

- (void)setDynamicURLImageResourceData:(id)a3
{
}

- (NSData)dynamicURLImageResourceDataEvodBumper
{
  return (NSData *)[(AceObject *)self propertyForKey:@"dynamicURLImageResourceDataEvodBumper"];
}

- (void)setDynamicURLImageResourceDataEvodBumper:(id)a3
{
}

@end