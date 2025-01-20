@interface SARDNativeFlowContextUpdate
- (BOOL)requiresResponse;
- (BOOL)resetFlowTaskState;
- (NSArray)applicationContext;
- (NSArray)attachments;
- (NSArray)clientFlowUpdateContextList;
- (NSData)pegasusConversationContext;
- (NSData)promptContextProto;
- (SAIntentGroupSiriKitMetrics)siriKitMetrics;
- (SASVSystemDialogActOutput)systemDialogActOutput;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setApplicationContext:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setClientFlowUpdateContextList:(id)a3;
- (void)setPegasusConversationContext:(id)a3;
- (void)setPromptContextProto:(id)a3;
- (void)setResetFlowTaskState:(BOOL)a3;
- (void)setSiriKitMetrics:(id)a3;
- (void)setSystemDialogActOutput:(id)a3;
@end

@implementation SARDNativeFlowContextUpdate

- (id)groupIdentifier
{
  return @"com.apple.ace.requestdispatch";
}

- (id)encodedClassName
{
  return @"NativeFlowContextUpdate";
}

- (NSArray)applicationContext
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"applicationContext", v3);
}

- (void)setApplicationContext:(id)a3
{
}

- (NSArray)attachments
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"attachments", &unk_1EFD72F00);
}

- (void)setAttachments:(id)a3
{
}

- (NSArray)clientFlowUpdateContextList
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"clientFlowUpdateContextList", v3);
}

- (void)setClientFlowUpdateContextList:(id)a3
{
}

- (NSData)pegasusConversationContext
{
  return (NSData *)[(AceObject *)self propertyForKey:@"pegasusConversationContext"];
}

- (void)setPegasusConversationContext:(id)a3
{
}

- (NSData)promptContextProto
{
  return (NSData *)[(AceObject *)self propertyForKey:@"promptContextProto"];
}

- (void)setPromptContextProto:(id)a3
{
}

- (BOOL)resetFlowTaskState
{
  return AceObjectBoolForProperty(self, @"resetFlowTaskState");
}

- (void)setResetFlowTaskState:(BOOL)a3
{
}

- (SAIntentGroupSiriKitMetrics)siriKitMetrics
{
  return (SAIntentGroupSiriKitMetrics *)AceObjectAceObjectForProperty(self, @"siriKitMetrics");
}

- (void)setSiriKitMetrics:(id)a3
{
}

- (SASVSystemDialogActOutput)systemDialogActOutput
{
  return (SASVSystemDialogActOutput *)AceObjectAceObjectForProperty(self, @"systemDialogActOutput");
}

- (void)setSystemDialogActOutput:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end