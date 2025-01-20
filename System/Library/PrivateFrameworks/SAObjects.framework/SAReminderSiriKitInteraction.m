@interface SAReminderSiriKitInteraction
+ (id)siriKitInteraction;
- (SAIntentGroupProtobufMessage)intent;
- (SAIntentGroupProtobufMessage)intentResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIntent:(id)a3;
- (void)setIntentResponse:(id)a3;
@end

@implementation SAReminderSiriKitInteraction

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
}

- (id)encodedClassName
{
  return @"SiriKitInteraction";
}

+ (id)siriKitInteraction
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

- (SAIntentGroupProtobufMessage)intentResponse
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, @"intentResponse");
}

- (void)setIntentResponse:(id)a3
{
}

@end