@interface SACFClientFlowRequestCallback
+ (id)clientFlowRequestCallback;
- (BOOL)shouldResetFlowTaskState;
- (NSArray)applicationContextObjects;
- (NSArray)conversationStateAttachments;
- (NSArray)dictationPromptAbortValues;
- (NSArray)dictationPromptTargetNodes;
- (NSArray)disambiguationPromptAbortValues;
- (NSArray)disambiguationPromptResponseTargets;
- (NSArray)displayHintsAsJson;
- (NSArray)weightedPromptAbortValues;
- (NSArray)weightedPromptResponseOptions;
- (NSArray)weightedPromptResponseTargets;
- (NSNumber)disambiguationPromptAmbiguityId;
- (NSNumber)objectDisambiguation;
- (NSNumber)weightedPromptStrict;
- (NSString)dictationPromptTargetDomain;
- (NSString)disambiguationPromptTargetDomain;
- (NSString)nlInput;
- (NSString)weightedPromptTargetDomain;
- (SAIntentGroupSiriKitMetrics)siriKitMetrics;
- (SASVSystemDialogActOutput)systemDialogActOutput;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setApplicationContextObjects:(id)a3;
- (void)setConversationStateAttachments:(id)a3;
- (void)setDictationPromptAbortValues:(id)a3;
- (void)setDictationPromptTargetDomain:(id)a3;
- (void)setDictationPromptTargetNodes:(id)a3;
- (void)setDisambiguationPromptAbortValues:(id)a3;
- (void)setDisambiguationPromptAmbiguityId:(id)a3;
- (void)setDisambiguationPromptResponseTargets:(id)a3;
- (void)setDisambiguationPromptTargetDomain:(id)a3;
- (void)setDisplayHintsAsJson:(id)a3;
- (void)setNlInput:(id)a3;
- (void)setObjectDisambiguation:(id)a3;
- (void)setShouldResetFlowTaskState:(BOOL)a3;
- (void)setSiriKitMetrics:(id)a3;
- (void)setSystemDialogActOutput:(id)a3;
- (void)setWeightedPromptAbortValues:(id)a3;
- (void)setWeightedPromptResponseOptions:(id)a3;
- (void)setWeightedPromptResponseTargets:(id)a3;
- (void)setWeightedPromptStrict:(id)a3;
- (void)setWeightedPromptTargetDomain:(id)a3;
@end

@implementation SACFClientFlowRequestCallback

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow";
}

- (id)encodedClassName
{
  return @"ClientFlowRequestCallback";
}

+ (id)clientFlowRequestCallback
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)applicationContextObjects
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"applicationContextObjects", v3);
}

- (void)setApplicationContextObjects:(id)a3
{
}

- (NSArray)conversationStateAttachments
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"conversationStateAttachments", &unk_1EFD72F00);
}

- (void)setConversationStateAttachments:(id)a3
{
}

- (NSArray)dictationPromptAbortValues
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"dictationPromptAbortValues"];
}

- (void)setDictationPromptAbortValues:(id)a3
{
}

- (NSString)dictationPromptTargetDomain
{
  return (NSString *)[(AceObject *)self propertyForKey:@"dictationPromptTargetDomain"];
}

- (void)setDictationPromptTargetDomain:(id)a3
{
}

- (NSArray)dictationPromptTargetNodes
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"dictationPromptTargetNodes"];
}

- (void)setDictationPromptTargetNodes:(id)a3
{
}

- (NSArray)disambiguationPromptAbortValues
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"disambiguationPromptAbortValues"];
}

- (void)setDisambiguationPromptAbortValues:(id)a3
{
}

- (NSNumber)disambiguationPromptAmbiguityId
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"disambiguationPromptAmbiguityId"];
}

- (void)setDisambiguationPromptAmbiguityId:(id)a3
{
}

- (NSArray)disambiguationPromptResponseTargets
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"disambiguationPromptResponseTargets"];
}

- (void)setDisambiguationPromptResponseTargets:(id)a3
{
}

- (NSString)disambiguationPromptTargetDomain
{
  return (NSString *)[(AceObject *)self propertyForKey:@"disambiguationPromptTargetDomain"];
}

- (void)setDisambiguationPromptTargetDomain:(id)a3
{
}

- (NSArray)displayHintsAsJson
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"displayHintsAsJson"];
}

- (void)setDisplayHintsAsJson:(id)a3
{
}

- (NSString)nlInput
{
  return (NSString *)[(AceObject *)self propertyForKey:@"nlInput"];
}

- (void)setNlInput:(id)a3
{
}

- (NSNumber)objectDisambiguation
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"objectDisambiguation"];
}

- (void)setObjectDisambiguation:(id)a3
{
}

- (BOOL)shouldResetFlowTaskState
{
  return AceObjectBoolForProperty(self, @"shouldResetFlowTaskState");
}

- (void)setShouldResetFlowTaskState:(BOOL)a3
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

- (NSArray)weightedPromptAbortValues
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"weightedPromptAbortValues"];
}

- (void)setWeightedPromptAbortValues:(id)a3
{
}

- (NSArray)weightedPromptResponseOptions
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"weightedPromptResponseOptions"];
}

- (void)setWeightedPromptResponseOptions:(id)a3
{
}

- (NSArray)weightedPromptResponseTargets
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"weightedPromptResponseTargets"];
}

- (void)setWeightedPromptResponseTargets:(id)a3
{
}

- (NSNumber)weightedPromptStrict
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"weightedPromptStrict"];
}

- (void)setWeightedPromptStrict:(id)a3
{
}

- (NSString)weightedPromptTargetDomain
{
  return (NSString *)[(AceObject *)self propertyForKey:@"weightedPromptTargetDomain"];
}

- (void)setWeightedPromptTargetDomain:(id)a3
{
}

@end