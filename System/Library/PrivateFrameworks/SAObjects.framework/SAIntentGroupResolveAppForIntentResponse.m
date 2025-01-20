@interface SAIntentGroupResolveAppForIntentResponse
+ (id)resolveAppForIntentResponse;
- (BOOL)requiresResponse;
- (NSArray)appsList;
- (NSNumber)needsConfirmation;
- (NSString)resolutionType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppsList:(id)a3;
- (void)setNeedsConfirmation:(id)a3;
- (void)setResolutionType:(id)a3;
@end

@implementation SAIntentGroupResolveAppForIntentResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"ResolveAppForIntentResponse";
}

+ (id)resolveAppForIntentResponse
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

- (NSNumber)needsConfirmation
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"needsConfirmation"];
}

- (void)setNeedsConfirmation:(id)a3
{
}

- (NSString)resolutionType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"resolutionType"];
}

- (void)setResolutionType:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end