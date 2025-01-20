@interface SAIntentGroupResolveAppForIntent
+ (id)resolveAppForIntent;
- (BOOL)requiresResponse;
- (NSArray)appsList;
- (NSString)jsonEncodedIntent;
- (SAIntentGroupProtobufMessage)intent;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppsList:(id)a3;
- (void)setIntent:(id)a3;
- (void)setJsonEncodedIntent:(id)a3;
@end

@implementation SAIntentGroupResolveAppForIntent

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"ResolveAppForIntent";
}

+ (id)resolveAppForIntent
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)appsList
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"appsList", v3);
}

- (void)setAppsList:(id)a3
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