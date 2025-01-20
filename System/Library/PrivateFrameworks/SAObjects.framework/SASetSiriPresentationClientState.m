@interface SASetSiriPresentationClientState
+ (id)setSiriPresentationClientState;
- (BOOL)requiresResponse;
- (SASiriPresentationClientState)clientState;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClientState:(id)a3;
@end

@implementation SASetSiriPresentationClientState

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetSiriPresentationClientState";
}

+ (id)setSiriPresentationClientState
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
  return 0;
}

@end