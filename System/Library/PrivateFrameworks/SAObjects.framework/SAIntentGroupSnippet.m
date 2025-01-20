@interface SAIntentGroupSnippet
+ (id)snippet;
- (BOOL)widgetAllowed;
- (NSArray)commands;
- (NSArray)snippetTemplates;
- (NSNumber)widgetIndex;
- (NSString)appId;
- (NSString)jsonEncodedIntent;
- (NSString)jsonEncodedIntentResponse;
- (SAIntentGroupProtobufMessage)intent;
- (SAIntentGroupProtobufMessage)intentResponse;
- (SAServerBoundCommand)processSynapseFlowCommand;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppId:(id)a3;
- (void)setCommands:(id)a3;
- (void)setIntent:(id)a3;
- (void)setIntentResponse:(id)a3;
- (void)setJsonEncodedIntent:(id)a3;
- (void)setJsonEncodedIntentResponse:(id)a3;
- (void)setProcessSynapseFlowCommand:(id)a3;
- (void)setSnippetTemplates:(id)a3;
- (void)setWidgetAllowed:(BOOL)a3;
- (void)setWidgetIndex:(id)a3;
@end

@implementation SAIntentGroupSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"Snippet";
}

+ (id)snippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)appId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appId"];
}

- (void)setAppId:(id)a3
{
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"commands", &unk_1EFD73568);
}

- (void)setCommands:(id)a3
{
}

- (SAIntentGroupProtobufMessage)intent
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, @"intent");
}

- (void)setIntent:(id)a3
{
}

- (SAIntentGroupProtobufMessage)intentResponse
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, @"intentResponse");
}

- (void)setIntentResponse:(id)a3
{
}

- (NSString)jsonEncodedIntent
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsonEncodedIntent"];
}

- (void)setJsonEncodedIntent:(id)a3
{
}

- (NSString)jsonEncodedIntentResponse
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsonEncodedIntentResponse"];
}

- (void)setJsonEncodedIntentResponse:(id)a3
{
}

- (SAServerBoundCommand)processSynapseFlowCommand
{
  return (SAServerBoundCommand *)AceObjectAceObjectForProperty(self, @"processSynapseFlowCommand");
}

- (void)setProcessSynapseFlowCommand:(id)a3
{
}

- (NSArray)snippetTemplates
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"snippetTemplates", v3);
}

- (void)setSnippetTemplates:(id)a3
{
}

- (BOOL)widgetAllowed
{
  return AceObjectBoolForProperty(self, @"widgetAllowed");
}

- (void)setWidgetAllowed:(BOOL)a3
{
}

- (NSNumber)widgetIndex
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"widgetIndex"];
}

- (void)setWidgetIndex:(id)a3
{
}

@end