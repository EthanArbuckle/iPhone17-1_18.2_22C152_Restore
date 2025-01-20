@interface SAIntentGroupIntentSearchResponse
+ (id)intentSearchResponse;
- (BOOL)requiresResponse;
- (NSArray)metadata;
- (NSString)jsonEncodedIntent;
- (SAIntentGroupProtobufMessage)intent;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIntent:(id)a3;
- (void)setJsonEncodedIntent:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation SAIntentGroupIntentSearchResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"IntentSearchResponse";
}

+ (id)intentSearchResponse
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

- (NSArray)metadata
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"metadata", v3);
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end