@interface SessionDarwinNotification
+ (NSString)sessionGuidedRunWorkoutAppRequirementConfirmation;
+ (NSString)sessionGuidedWalkWorkoutAppRequirementConfirmation;
+ (NSString)sessionMindAppRequirementConfirmation;
+ (NSString)sessionUpdated;
+ (NSString)sessionWorkoutAppRequirementConfirmation;
+ (int)sessionStatusToken;
- (_TtC13SeymourClient25SessionDarwinNotification)init;
@end

@implementation SessionDarwinNotification

+ (int)sessionStatusToken
{
  return 5355107;
}

+ (NSString)sessionUpdated
{
  v2 = (void *)sub_1D5AB4DE0();
  return (NSString *)v2;
}

+ (NSString)sessionMindAppRequirementConfirmation
{
  v2 = (void *)sub_1D5AB4DE0();
  return (NSString *)v2;
}

+ (NSString)sessionWorkoutAppRequirementConfirmation
{
  v2 = (void *)sub_1D5AB4DE0();
  return (NSString *)v2;
}

+ (NSString)sessionGuidedRunWorkoutAppRequirementConfirmation
{
  v2 = (void *)sub_1D5AB4DE0();
  return (NSString *)v2;
}

+ (NSString)sessionGuidedWalkWorkoutAppRequirementConfirmation
{
  v2 = (void *)sub_1D5AB4DE0();
  return (NSString *)v2;
}

- (_TtC13SeymourClient25SessionDarwinNotification)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SessionDarwinNotification();
  return [(SessionDarwinNotification *)&v3 init];
}

@end