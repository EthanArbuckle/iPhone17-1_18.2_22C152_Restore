@interface SAHLStartWorkout
+ (id)startWorkout;
- (BOOL)isOpenGoal;
- (BOOL)requiresResponse;
- (BOOL)skipActivitySetup;
- (NSString)workoutUserMode;
- (SAHLWorkoutGoal)workoutGoal;
- (SAHLWorkoutType)workoutType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIsOpenGoal:(BOOL)a3;
- (void)setSkipActivitySetup:(BOOL)a3;
- (void)setWorkoutGoal:(id)a3;
- (void)setWorkoutType:(id)a3;
- (void)setWorkoutUserMode:(id)a3;
@end

@implementation SAHLStartWorkout

- (id)groupIdentifier
{
  return @"com.apple.ace.health";
}

- (id)encodedClassName
{
  return @"StartWorkout";
}

+ (id)startWorkout
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)isOpenGoal
{
  return AceObjectBoolForProperty(self, @"isOpenGoal");
}

- (void)setIsOpenGoal:(BOOL)a3
{
}

- (BOOL)skipActivitySetup
{
  return AceObjectBoolForProperty(self, @"skipActivitySetup");
}

- (void)setSkipActivitySetup:(BOOL)a3
{
}

- (SAHLWorkoutGoal)workoutGoal
{
  return (SAHLWorkoutGoal *)AceObjectAceObjectForProperty(self, @"workoutGoal");
}

- (void)setWorkoutGoal:(id)a3
{
}

- (SAHLWorkoutType)workoutType
{
  return (SAHLWorkoutType *)AceObjectAceObjectForProperty(self, @"workoutType");
}

- (void)setWorkoutType:(id)a3
{
}

- (NSString)workoutUserMode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"workoutUserMode"];
}

- (void)setWorkoutUserMode:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end