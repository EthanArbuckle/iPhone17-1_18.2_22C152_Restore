@interface SAGetSiriPresentationClientState
+ (id)getSiriPresentationClientState;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (SASiriPresentationClientState)clientState;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClientState:(id)a3;
@end

@implementation SAGetSiriPresentationClientState

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"GetSiriPresentationClientState";
}

+ (id)getSiriPresentationClientState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASiriPresentationClientState)clientState
{
  return (SASiriPresentationClientState *)AceObjectAceObjectForProperty(self, @"clientState");
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