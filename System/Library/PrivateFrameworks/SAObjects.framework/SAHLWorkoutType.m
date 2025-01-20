@interface SAHLWorkoutType
+ (id)workoutType;
- (NSString)swimmingLocationType;
- (NSString)workoutCategory;
- (NSString)workoutLocationType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSwimmingLocationType:(id)a3;
- (void)setWorkoutCategory:(id)a3;
- (void)setWorkoutLocationType:(id)a3;
@end

@implementation SAHLWorkoutType

- (id)groupIdentifier
{
  return @"com.apple.ace.health";
}

- (id)encodedClassName
{
  return @"WorkoutType";
}

+ (id)workoutType
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)swimmingLocationType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"swimmingLocationType"];
}

- (void)setSwimmingLocationType:(id)a3
{
}

- (NSString)workoutCategory
{
  return (NSString *)[(AceObject *)self propertyForKey:@"workoutCategory"];
}

- (void)setWorkoutCategory:(id)a3
{
}

- (NSString)workoutLocationType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"workoutLocationType"];
}

- (void)setWorkoutLocationType:(id)a3
{
}

@end