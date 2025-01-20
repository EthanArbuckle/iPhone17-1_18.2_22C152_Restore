@interface SAGetWristDetectionStatusClientState
+ (id)getWristDetectionStatusClientState;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (SAWristDetectionStatusClientState)clientState;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClientState:(id)a3;
@end

@implementation SAGetWristDetectionStatusClientState

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"GetWristDetectionStatusClientState";
}

+ (id)getWristDetectionStatusClientState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAWristDetectionStatusClientState)clientState
{
  return (SAWristDetectionStatusClientState *)AceObjectAceObjectForProperty(self, @"clientState");
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