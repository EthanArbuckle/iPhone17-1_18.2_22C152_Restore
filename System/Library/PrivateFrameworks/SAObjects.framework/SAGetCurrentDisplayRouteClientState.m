@interface SAGetCurrentDisplayRouteClientState
+ (id)getCurrentDisplayRouteClientState;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (SACurrentDisplayRouteClientState)clientState;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClientState:(id)a3;
@end

@implementation SAGetCurrentDisplayRouteClientState

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"GetCurrentDisplayRouteClientState";
}

+ (id)getCurrentDisplayRouteClientState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SACurrentDisplayRouteClientState)clientState
{
  return (SACurrentDisplayRouteClientState *)AceObjectAceObjectForProperty(self, @"clientState");
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