@interface SAHLWorkoutState
+ (id)workoutState;
- (NSString)workoutStateValue;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setWorkoutStateValue:(id)a3;
@end

@implementation SAHLWorkoutState

- (id)groupIdentifier
{
  return @"com.apple.ace.health";
}

- (id)encodedClassName
{
  return @"WorkoutState";
}

+ (id)workoutState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)workoutStateValue
{
  return (NSString *)[(AceObject *)self propertyForKey:@"workoutStateValue"];
}

- (void)setWorkoutStateValue:(id)a3
{
}

@end