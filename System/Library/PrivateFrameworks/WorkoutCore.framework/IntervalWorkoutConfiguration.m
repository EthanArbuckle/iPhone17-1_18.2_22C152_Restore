@interface IntervalWorkoutConfiguration
- (BOOL)isEqual:(id)a3;
- (int64_t)hash;
@end

@implementation IntervalWorkoutConfiguration

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = IntervalWorkoutConfiguration.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_236C75478();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  unsigned __int8 v6 = IntervalWorkoutConfiguration.isEqual(_:)((uint64_t)v8);

  sub_236A73174((uint64_t)v8, (uint64_t *)&unk_2688AA9F0);
  return v6 & 1;
}

- (void).cxx_destruct
{
  int64_t v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore28IntervalWorkoutConfiguration__intervalWorkout;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688AAB20);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11WorkoutCore28IntervalWorkoutConfiguration__forceUpdatePublisher;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30670);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end