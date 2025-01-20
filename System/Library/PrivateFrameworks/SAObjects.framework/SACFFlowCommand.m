@interface SACFFlowCommand
+ (id)flowCommand;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSDictionary)jsDialogScripts;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setJsDialogScripts:(id)a3;
@end

@implementation SACFFlowCommand

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow";
}

- (id)encodedClassName
{
  return @"FlowCommand";
}

+ (id)flowCommand
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)jsDialogScripts
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"jsDialogScripts"];
}

- (void)setJsDialogScripts:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end