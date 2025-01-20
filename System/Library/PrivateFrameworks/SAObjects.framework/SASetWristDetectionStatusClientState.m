@interface SASetWristDetectionStatusClientState
+ (id)setWristDetectionStatusClientState;
- (BOOL)requiresResponse;
- (SAWristDetectionStatusClientState)clientState;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClientState:(id)a3;
@end

@implementation SASetWristDetectionStatusClientState

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetWristDetectionStatusClientState";
}

+ (id)setWristDetectionStatusClientState
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
  return 0;
}

@end