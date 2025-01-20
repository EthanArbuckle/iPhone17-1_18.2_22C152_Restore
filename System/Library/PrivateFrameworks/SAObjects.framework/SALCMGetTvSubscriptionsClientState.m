@interface SALCMGetTvSubscriptionsClientState
+ (id)getTvSubscriptionsClientState;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (SALCMTvSubscriptionsClientState)clientState;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClientState:(id)a3;
@end

@implementation SALCMGetTvSubscriptionsClientState

- (id)groupIdentifier
{
  return @"com.apple.ace.livecontent";
}

- (id)encodedClassName
{
  return @"GetTvSubscriptionsClientState";
}

+ (id)getTvSubscriptionsClientState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SALCMTvSubscriptionsClientState)clientState
{
  return (SALCMTvSubscriptionsClientState *)AceObjectAceObjectForProperty(self, @"clientState");
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