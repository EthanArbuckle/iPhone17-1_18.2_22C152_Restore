@interface SAIntentGroupDirectInvocation
- (NSData)data;
- (NSString)invocationIdentifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setData:(id)a3;
- (void)setInvocationIdentifier:(id)a3;
@end

@implementation SAIntentGroupDirectInvocation

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"DirectInvocation";
}

- (NSData)data
{
  return (NSData *)[(AceObject *)self propertyForKey:@"data"];
}

- (void)setData:(id)a3
{
}

- (NSString)invocationIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"invocationIdentifier"];
}

- (void)setInvocationIdentifier:(id)a3
{
}

@end