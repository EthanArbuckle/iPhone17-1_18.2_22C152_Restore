@interface SAIntentGroupHandleIntentCompleted
+ (id)handleIntentCompleted;
- (BOOL)requiresResponse;
- (NSString)jsonEncodedIntentResponse;
- (SAIntentGroupProtobufMessage)intentResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIntentResponse:(id)a3;
- (void)setJsonEncodedIntentResponse:(id)a3;
@end

@implementation SAIntentGroupHandleIntentCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"HandleIntentCompleted";
}

+ (id)handleIntentCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAIntentGroupProtobufMessage)intentResponse
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, @"intentResponse");
}

- (void)setIntentResponse:(id)a3
{
}

- (NSString)jsonEncodedIntentResponse
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsonEncodedIntentResponse"];
}

- (void)setJsonEncodedIntentResponse:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end