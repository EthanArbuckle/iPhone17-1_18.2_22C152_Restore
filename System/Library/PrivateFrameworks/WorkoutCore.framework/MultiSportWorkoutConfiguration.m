@interface MultiSportWorkoutConfiguration
- (NSString)analyticsSubActivities;
- (int64_t)hash;
@end

@implementation MultiSportWorkoutConfiguration

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = MultiSportWorkoutConfiguration.hash.getter();

  return v3;
}

- (void).cxx_destruct
{
  int64_t v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore30MultiSportWorkoutConfiguration__subConfigs;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A8AF8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11WorkoutCore30MultiSportWorkoutConfiguration__title;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80D8);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (NSString)analyticsSubActivities
{
  v2 = self;
  MultiSportWorkoutConfiguration.analyticsSubActivities.getter();

  int64_t v3 = (void *)sub_236C74E28();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end