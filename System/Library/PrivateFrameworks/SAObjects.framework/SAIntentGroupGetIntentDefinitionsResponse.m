@interface SAIntentGroupGetIntentDefinitionsResponse
+ (id)getIntentDefinitionsResponse;
- (BOOL)requiresResponse;
- (NSArray)intentDefinitionInfos;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIntentDefinitionInfos:(id)a3;
@end

@implementation SAIntentGroupGetIntentDefinitionsResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"GetIntentDefinitionsResponse";
}

+ (id)getIntentDefinitionsResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)intentDefinitionInfos
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"intentDefinitionInfos", v3);
}

- (void)setIntentDefinitionInfos:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end