@interface SAHLSetWorkoutState
+ (id)setWorkoutState;
- (BOOL)requiresResponse;
- (SAHLWorkoutState)targetWorkoutState;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTargetWorkoutState:(id)a3;
@end

@implementation SAHLSetWorkoutState

- (id)groupIdentifier
{
  return @"com.apple.ace.health";
}

- (id)encodedClassName
{
  return @"SetWorkoutState";
}

+ (id)setWorkoutState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAHLWorkoutState)targetWorkoutState
{
  return (SAHLWorkoutState *)AceObjectAceObjectForProperty(self, @"targetWorkoutState");
}

- (void)setTargetWorkoutState:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end