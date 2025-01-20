@interface SAGetDynamiteClientState
+ (id)getDynamiteClientState;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (SADynamiteClientState)clientState;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClientState:(id)a3;
@end

@implementation SAGetDynamiteClientState

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"GetDynamiteClientState";
}

+ (id)getDynamiteClientState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SADynamiteClientState)clientState
{
  return (SADynamiteClientState *)AceObjectAceObjectForProperty(self, @"clientState");
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