@interface SAIntentGroupProcessIntentCompleted
+ (id)processIntentCompleted;
- (BOOL)requiresResponse;
- (NSString)lastAttemptedStep;
- (SAIntentGroupBatchSlotResolutionResult)batchSlotResolutionResult;
- (SAIntentGroupConfirmIntentCompleted)confirmIntentCompleted;
- (SAIntentGroupHandleIntentCompleted)handleIntentCompleted;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBatchSlotResolutionResult:(id)a3;
- (void)setConfirmIntentCompleted:(id)a3;
- (void)setHandleIntentCompleted:(id)a3;
- (void)setLastAttemptedStep:(id)a3;
@end

@implementation SAIntentGroupProcessIntentCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"ProcessIntentCompleted";
}

+ (id)processIntentCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAIntentGroupBatchSlotResolutionResult)batchSlotResolutionResult
{
  return (SAIntentGroupBatchSlotResolutionResult *)AceObjectAceObjectForProperty(self, @"batchSlotResolutionResult");
}

- (void)setBatchSlotResolutionResult:(id)a3
{
}

- (SAIntentGroupConfirmIntentCompleted)confirmIntentCompleted
{
  return (SAIntentGroupConfirmIntentCompleted *)AceObjectAceObjectForProperty(self, @"confirmIntentCompleted");
}

- (void)setConfirmIntentCompleted:(id)a3
{
}

- (SAIntentGroupHandleIntentCompleted)handleIntentCompleted
{
  return (SAIntentGroupHandleIntentCompleted *)AceObjectAceObjectForProperty(self, @"handleIntentCompleted");
}

- (void)setHandleIntentCompleted:(id)a3
{
}

- (NSString)lastAttemptedStep
{
  return (NSString *)[(AceObject *)self propertyForKey:@"lastAttemptedStep"];
}

- (void)setLastAttemptedStep:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end