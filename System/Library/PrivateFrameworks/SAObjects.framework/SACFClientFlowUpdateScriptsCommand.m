@interface SACFClientFlowUpdateScriptsCommand
+ (id)clientFlowUpdateScriptsCommand;
- (BOOL)requiresResponse;
- (NSArray)scripts;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setScripts:(id)a3;
@end

@implementation SACFClientFlowUpdateScriptsCommand

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow";
}

- (id)encodedClassName
{
  return @"ClientFlowUpdateScriptsCommand";
}

+ (id)clientFlowUpdateScriptsCommand
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)scripts
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"scripts", v3);
}

- (void)setScripts:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end