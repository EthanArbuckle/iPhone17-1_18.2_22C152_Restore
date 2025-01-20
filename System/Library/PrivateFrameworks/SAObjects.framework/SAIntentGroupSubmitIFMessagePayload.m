@interface SAIntentGroupSubmitIFMessagePayload
- (BOOL)requiresResponse;
- (NSData)data;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setData:(id)a3;
@end

@implementation SAIntentGroupSubmitIFMessagePayload

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"SubmitIFMessagePayload";
}

- (NSData)data
{
  return (NSData *)[(AceObject *)self propertyForKey:@"data"];
}

- (void)setData:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end