@interface SAIntentGroupLaunchAppWithIntent
+ (id)launchAppWithIntent;
- (BOOL)doNotDismissSiri;
- (BOOL)requiresResponse;
- (NSString)jsonEncodedHandledIntent;
- (NSString)jsonEncodedHandledIntentResponse;
- (SAIntentGroupProtobufMessage)handledIntent;
- (SAIntentGroupProtobufMessage)handledIntentResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDoNotDismissSiri:(BOOL)a3;
- (void)setHandledIntent:(id)a3;
- (void)setHandledIntentResponse:(id)a3;
- (void)setJsonEncodedHandledIntent:(id)a3;
- (void)setJsonEncodedHandledIntentResponse:(id)a3;
@end

@implementation SAIntentGroupLaunchAppWithIntent

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"LaunchAppWithIntent";
}

+ (id)launchAppWithIntent
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)doNotDismissSiri
{
  return AceObjectBoolForProperty(self, @"doNotDismissSiri");
}

- (void)setDoNotDismissSiri:(BOOL)a3
{
}

- (SAIntentGroupProtobufMessage)handledIntent
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, @"handledIntent");
}

- (void)setHandledIntent:(id)a3
{
}

- (SAIntentGroupProtobufMessage)handledIntentResponse
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, @"handledIntentResponse");
}

- (void)setHandledIntentResponse:(id)a3
{
}

- (NSString)jsonEncodedHandledIntent
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsonEncodedHandledIntent"];
}

- (void)setJsonEncodedHandledIntent:(id)a3
{
}

- (NSString)jsonEncodedHandledIntentResponse
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsonEncodedHandledIntentResponse"];
}

- (void)setJsonEncodedHandledIntentResponse:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end