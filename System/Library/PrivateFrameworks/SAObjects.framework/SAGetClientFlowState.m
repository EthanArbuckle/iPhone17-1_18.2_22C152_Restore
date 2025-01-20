@interface SAGetClientFlowState
+ (id)getClientFlowState;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (SAClientFlowState)clientState;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClientState:(id)a3;
@end

@implementation SAGetClientFlowState

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"GetClientFlowState";
}

+ (id)getClientFlowState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAClientFlowState)clientState
{
  return (SAClientFlowState *)AceObjectAceObjectForProperty(self, @"clientState");
}

- (void)setClientState:(id)a3
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