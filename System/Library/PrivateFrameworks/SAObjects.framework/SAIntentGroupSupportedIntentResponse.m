@interface SAIntentGroupSupportedIntentResponse
+ (id)supportedIntentResponse;
- (BOOL)requiresResponse;
- (NSArray)commands;
- (NSString)useCaseId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommands:(id)a3;
- (void)setUseCaseId:(id)a3;
@end

@implementation SAIntentGroupSupportedIntentResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"SupportedIntentResponse";
}

+ (id)supportedIntentResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)commands
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"commands", v3);
}

- (void)setCommands:(id)a3
{
}

- (NSString)useCaseId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"useCaseId"];
}

- (void)setUseCaseId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end