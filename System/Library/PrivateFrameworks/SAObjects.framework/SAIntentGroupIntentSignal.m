@interface SAIntentGroupIntentSignal
+ (id)intentSignal;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSString)jsonEncodedIntent;
- (SAIntentGroupProtobufMessage)intent;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIntent:(id)a3;
- (void)setJsonEncodedIntent:(id)a3;
@end

@implementation SAIntentGroupIntentSignal

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"IntentSignal";
}

+ (id)intentSignal
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAIntentGroupProtobufMessage)intent
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, @"intent");
}

- (void)setIntent:(id)a3
{
}

- (NSString)jsonEncodedIntent
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsonEncodedIntent"];
}

- (void)setJsonEncodedIntent:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end