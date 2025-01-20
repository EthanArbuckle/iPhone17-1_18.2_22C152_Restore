@interface SAIntentGroupRunSiriKitExecutor
+ (id)runSiriKitExecutor;
- (BOOL)directAction;
- (BOOL)eyesFree;
- (BOOL)multiUser;
- (BOOL)mutatingCommand;
- (BOOL)requiresConditionalMultiUserGrounding;
- (BOOL)requiresResponse;
- (BOOL)textToSpeechEnabled;
- (BOOL)voiceTriggerEnabled;
- (NSArray)parameterMetadata;
- (NSArray)parameterPrompts;
- (NSString)confirmationState;
- (NSString)goalID;
- (NSString)inputOrigin;
- (NSString)interactionType;
- (NSString)mode;
- (NSString)parentGoalID;
- (NSString)sessionHandOffContinuityID;
- (NSString)turnId;
- (NSString)userInitiatedAction;
- (NSString)usoVerb;
- (SAIntentGroupAceBargeInState)bargeInState;
- (SAIntentGroupParse)parse;
- (SAIntentGroupSiriKitAppSelectionState)appSelectionState;
- (SAIntentGroupSiriKitListPosition)readingListPosition;
- (SAIntentGroupSiriKitMetrics)siriKitMetrics;
- (SAIntentGroupSiriKitRemoteExecution)remoteExecution;
- (SAPerson)identifiedUserMeCard;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppSelectionState:(id)a3;
- (void)setBargeInState:(id)a3;
- (void)setConfirmationState:(id)a3;
- (void)setDirectAction:(BOOL)a3;
- (void)setEyesFree:(BOOL)a3;
- (void)setGoalID:(id)a3;
- (void)setIdentifiedUserMeCard:(id)a3;
- (void)setInputOrigin:(id)a3;
- (void)setInteractionType:(id)a3;
- (void)setMode:(id)a3;
- (void)setMultiUser:(BOOL)a3;
- (void)setParameterMetadata:(id)a3;
- (void)setParameterPrompts:(id)a3;
- (void)setParentGoalID:(id)a3;
- (void)setParse:(id)a3;
- (void)setReadingListPosition:(id)a3;
- (void)setRemoteExecution:(id)a3;
- (void)setRequiresConditionalMultiUserGrounding:(BOOL)a3;
- (void)setSessionHandOffContinuityID:(id)a3;
- (void)setSiriKitMetrics:(id)a3;
- (void)setTextToSpeechEnabled:(BOOL)a3;
- (void)setTurnId:(id)a3;
- (void)setUserInitiatedAction:(id)a3;
- (void)setUsoVerb:(id)a3;
- (void)setVoiceTriggerEnabled:(BOOL)a3;
@end

@implementation SAIntentGroupRunSiriKitExecutor

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"RunSiriKitExecutor";
}

+ (id)runSiriKitExecutor
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAIntentGroupSiriKitAppSelectionState)appSelectionState
{
  return (SAIntentGroupSiriKitAppSelectionState *)AceObjectAceObjectForProperty(self, @"appSelectionState");
}

- (void)setAppSelectionState:(id)a3
{
}

- (SAIntentGroupAceBargeInState)bargeInState
{
  return (SAIntentGroupAceBargeInState *)AceObjectAceObjectForProperty(self, @"bargeInState");
}

- (void)setBargeInState:(id)a3
{
}

- (NSString)confirmationState
{
  return (NSString *)[(AceObject *)self propertyForKey:@"confirmationState"];
}

- (void)setConfirmationState:(id)a3
{
}

- (BOOL)directAction
{
  return AceObjectBoolForProperty(self, @"directAction");
}

- (void)setDirectAction:(BOOL)a3
{
}

- (BOOL)eyesFree
{
  return AceObjectBoolForProperty(self, @"eyesFree");
}

- (void)setEyesFree:(BOOL)a3
{
}

- (NSString)goalID
{
  return (NSString *)[(AceObject *)self propertyForKey:@"goalID"];
}

- (void)setGoalID:(id)a3
{
}

- (SAPerson)identifiedUserMeCard
{
  return (SAPerson *)AceObjectAceObjectForProperty(self, @"identifiedUserMeCard");
}

- (void)setIdentifiedUserMeCard:(id)a3
{
}

- (NSString)inputOrigin
{
  return (NSString *)[(AceObject *)self propertyForKey:@"inputOrigin"];
}

- (void)setInputOrigin:(id)a3
{
}

- (NSString)interactionType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"interactionType"];
}

- (void)setInteractionType:(id)a3
{
}

- (NSString)mode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"mode"];
}

- (void)setMode:(id)a3
{
}

- (BOOL)multiUser
{
  return AceObjectBoolForProperty(self, @"multiUser");
}

- (void)setMultiUser:(BOOL)a3
{
}

- (NSArray)parameterMetadata
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"parameterMetadata", v3);
}

- (void)setParameterMetadata:(id)a3
{
}

- (NSArray)parameterPrompts
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"parameterPrompts"];
}

- (void)setParameterPrompts:(id)a3
{
}

- (NSString)parentGoalID
{
  return (NSString *)[(AceObject *)self propertyForKey:@"parentGoalID"];
}

- (void)setParentGoalID:(id)a3
{
}

- (SAIntentGroupParse)parse
{
  return (SAIntentGroupParse *)AceObjectAceObjectForProperty(self, @"parse");
}

- (void)setParse:(id)a3
{
}

- (SAIntentGroupSiriKitListPosition)readingListPosition
{
  return (SAIntentGroupSiriKitListPosition *)AceObjectAceObjectForProperty(self, @"readingListPosition");
}

- (void)setReadingListPosition:(id)a3
{
}

- (SAIntentGroupSiriKitRemoteExecution)remoteExecution
{
  return (SAIntentGroupSiriKitRemoteExecution *)AceObjectAceObjectForProperty(self, @"remoteExecution");
}

- (void)setRemoteExecution:(id)a3
{
}

- (BOOL)requiresConditionalMultiUserGrounding
{
  return AceObjectBoolForProperty(self, @"requiresConditionalMultiUserGrounding");
}

- (void)setRequiresConditionalMultiUserGrounding:(BOOL)a3
{
}

- (NSString)sessionHandOffContinuityID
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sessionHandOffContinuityID"];
}

- (void)setSessionHandOffContinuityID:(id)a3
{
}

- (SAIntentGroupSiriKitMetrics)siriKitMetrics
{
  return (SAIntentGroupSiriKitMetrics *)AceObjectAceObjectForProperty(self, @"siriKitMetrics");
}

- (void)setSiriKitMetrics:(id)a3
{
}

- (BOOL)textToSpeechEnabled
{
  return AceObjectBoolForProperty(self, @"textToSpeechEnabled");
}

- (void)setTextToSpeechEnabled:(BOOL)a3
{
}

- (NSString)turnId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"turnId"];
}

- (void)setTurnId:(id)a3
{
}

- (NSString)userInitiatedAction
{
  return (NSString *)[(AceObject *)self propertyForKey:@"userInitiatedAction"];
}

- (void)setUserInitiatedAction:(id)a3
{
}

- (NSString)usoVerb
{
  return (NSString *)[(AceObject *)self propertyForKey:@"usoVerb"];
}

- (void)setUsoVerb:(id)a3
{
}

- (BOOL)voiceTriggerEnabled
{
  return AceObjectBoolForProperty(self, @"voiceTriggerEnabled");
}

- (void)setVoiceTriggerEnabled:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end