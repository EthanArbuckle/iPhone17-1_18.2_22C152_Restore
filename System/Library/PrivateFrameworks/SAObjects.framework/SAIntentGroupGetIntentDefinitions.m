@interface SAIntentGroupGetIntentDefinitions
+ (id)getIntentDefinitions;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)queries;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setQueries:(id)a3;
@end

@implementation SAIntentGroupGetIntentDefinitions

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"GetIntentDefinitions";
}

+ (id)getIntentDefinitions
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)queries
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"queries", v3);
}

- (void)setQueries:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end