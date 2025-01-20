@interface SACFFetchScriptResponse
+ (id)fetchScriptResponse;
- (BOOL)requiresResponse;
- (NSArray)flowScripts;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFlowScripts:(id)a3;
@end

@implementation SACFFetchScriptResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow";
}

- (id)encodedClassName
{
  return @"FetchScriptResponse";
}

+ (id)fetchScriptResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)flowScripts
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"flowScripts", v3);
}

- (void)setFlowScripts:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end