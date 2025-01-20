@interface SAIntentGroupIntentInvocationResponse
+ (id)intentInvocationResponse;
- (BOOL)backgroundLaunch;
- (BOOL)requiresResponse;
- (NSArray)parameters;
- (NSString)launchId;
- (NSString)utterance;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBackgroundLaunch:(BOOL)a3;
- (void)setLaunchId:(id)a3;
- (void)setParameters:(id)a3;
- (void)setUtterance:(id)a3;
@end

@implementation SAIntentGroupIntentInvocationResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"IntentInvocationResponse";
}

+ (id)intentInvocationResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)backgroundLaunch
{
  return AceObjectBoolForProperty(self, @"backgroundLaunch");
}

- (void)setBackgroundLaunch:(BOOL)a3
{
}

- (NSString)launchId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"launchId"];
}

- (void)setLaunchId:(id)a3
{
}

- (NSArray)parameters
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"parameters", v3);
}

- (void)setParameters:(id)a3
{
}

- (NSString)utterance
{
  return (NSString *)[(AceObject *)self propertyForKey:@"utterance"];
}

- (void)setUtterance:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end