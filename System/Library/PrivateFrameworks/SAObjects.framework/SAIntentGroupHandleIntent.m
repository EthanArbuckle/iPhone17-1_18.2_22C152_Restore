@interface SAIntentGroupHandleIntent
+ (id)handleIntent;
- (BOOL)allowsPunchOut;
- (BOOL)requiresResponse;
- (NSString)jsonEncodedIntent;
- (SAIntentGroupProtobufMessage)intent;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAllowsPunchOut:(BOOL)a3;
- (void)setIntent:(id)a3;
- (void)setJsonEncodedIntent:(id)a3;
@end

@implementation SAIntentGroupHandleIntent

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"HandleIntent";
}

+ (id)handleIntent
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)allowsPunchOut
{
  return AceObjectBoolForProperty(self, @"allowsPunchOut");
}

- (void)setAllowsPunchOut:(BOOL)a3
{
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
  return 1;
}

@end