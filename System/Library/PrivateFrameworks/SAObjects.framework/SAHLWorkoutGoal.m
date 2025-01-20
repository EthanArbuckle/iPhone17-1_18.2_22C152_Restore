@interface SAHLWorkoutGoal
+ (id)workoutGoal;
- (NSString)workoutGoalUnitType;
- (double)goalValue;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setGoalValue:(double)a3;
- (void)setWorkoutGoalUnitType:(id)a3;
@end

@implementation SAHLWorkoutGoal

- (id)groupIdentifier
{
  return @"com.apple.ace.health";
}

- (id)encodedClassName
{
  return @"WorkoutGoal";
}

+ (id)workoutGoal
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (double)goalValue
{
  return AceObjectDoubleForProperty(self, @"goalValue");
}

- (void)setGoalValue:(double)a3
{
}

- (NSString)workoutGoalUnitType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"workoutGoalUnitType"];
}

- (void)setWorkoutGoalUnitType:(id)a3
{
}

@end