@interface SASetCurrentDisplayRouteClientState
+ (id)setCurrentDisplayRouteClientState;
- (BOOL)requiresResponse;
- (SACurrentDisplayRouteClientState)clientState;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClientState:(id)a3;
@end

@implementation SASetCurrentDisplayRouteClientState

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetCurrentDisplayRouteClientState";
}

+ (id)setCurrentDisplayRouteClientState
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
  return 0;
}

@end