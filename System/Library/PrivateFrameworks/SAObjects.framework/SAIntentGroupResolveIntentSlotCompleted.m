@interface SAIntentGroupResolveIntentSlotCompleted
+ (id)resolveIntentSlotCompleted;
- (BOOL)requiresResponse;
- (NSString)jsonEncodedIntentSlotResolutionResult;
- (SAIntentGroupProtobufMessage)intentSlotResolutionResult;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIntentSlotResolutionResult:(id)a3;
- (void)setJsonEncodedIntentSlotResolutionResult:(id)a3;
@end

@implementation SAIntentGroupResolveIntentSlotCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"ResolveIntentSlotCompleted";
}

+ (id)resolveIntentSlotCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAIntentGroupProtobufMessage)intentSlotResolutionResult
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, @"intentSlotResolutionResult");
}

- (void)setIntentSlotResolutionResult:(id)a3
{
}

- (NSString)jsonEncodedIntentSlotResolutionResult
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsonEncodedIntentSlotResolutionResult"];
}

- (void)setJsonEncodedIntentSlotResolutionResult:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end