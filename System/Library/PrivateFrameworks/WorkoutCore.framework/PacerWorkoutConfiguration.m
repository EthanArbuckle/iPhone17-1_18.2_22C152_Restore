@interface PacerWorkoutConfiguration
- (int64_t)hash;
@end

@implementation PacerWorkoutConfiguration

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = PacerWorkoutConfiguration.hash.getter();

  return v3;
}

- (void).cxx_destruct
{
  int64_t v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore25PacerWorkoutConfiguration__distanceGoal;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A9438);
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11WorkoutCore25PacerWorkoutConfiguration__timeGoal;

  v6(v5, v4);
}

@end