@interface SAIntentGroupBatchSlotResolutionResultStepResult
+ (id)batchSlotResolutionResultStepResult;
- (NSString)base64EncodedProtobufMessage;
- (NSString)jsonEncodedSlotResolutionResult;
- (NSString)keyPath;
- (NSString)typeName;
- (SACommandFailed)commandFailed;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBase64EncodedProtobufMessage:(id)a3;
- (void)setCommandFailed:(id)a3;
- (void)setJsonEncodedSlotResolutionResult:(id)a3;
- (void)setKeyPath:(id)a3;
- (void)setTypeName:(id)a3;
@end

@implementation SAIntentGroupBatchSlotResolutionResultStepResult

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"BatchSlotResolutionResultStepResult";
}

+ (id)batchSlotResolutionResultStepResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)base64EncodedProtobufMessage
{
  return (NSString *)[(AceObject *)self propertyForKey:@"base64EncodedProtobufMessage"];
}

- (void)setBase64EncodedProtobufMessage:(id)a3
{
}

- (SACommandFailed)commandFailed
{
  return (SACommandFailed *)AceObjectAceObjectForProperty(self, @"commandFailed");
}

- (void)setCommandFailed:(id)a3
{
}

- (NSString)jsonEncodedSlotResolutionResult
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsonEncodedSlotResolutionResult"];
}

- (void)setJsonEncodedSlotResolutionResult:(id)a3
{
}

- (NSString)keyPath
{
  return (NSString *)[(AceObject *)self propertyForKey:@"keyPath"];
}

- (void)setKeyPath:(id)a3
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