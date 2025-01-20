@interface GoalWorkoutConfiguration
- (NSString)analyticsKey;
- (int64_t)hash;
@end

@implementation GoalWorkoutConfiguration

- (NSString)analyticsKey
{
  v2 = self;
  GoalWorkoutConfiguration.analyticsKey.getter();

  v3 = (void *)sub_236C74E28();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = GoalWorkoutConfiguration.hash.getter();

  return v3;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC11WorkoutCore24GoalWorkoutConfiguration__goal;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9438);
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end