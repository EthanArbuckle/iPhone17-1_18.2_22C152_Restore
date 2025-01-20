@interface IntervalWorkout
- (BOOL)isEqual:(id)a3;
- (_TtC11WorkoutCore15IntervalWorkout)init;
- (int64_t)hash;
@end

@implementation IntervalWorkout

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = IntervalWorkout.hash.getter();

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
  char v6 = IntervalWorkout.isEqual(_:)((uint64_t)v8);

  sub_236A5C318((uint64_t)v8);
  return v6 & 1;
}

- (_TtC11WorkoutCore15IntervalWorkout)init
{
  result = (_TtC11WorkoutCore15IntervalWorkout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  int64_t v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore15IntervalWorkout__name;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80D8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11WorkoutCore15IntervalWorkout_uuid;
  uint64_t v6 = sub_236C73FE8();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC11WorkoutCore15IntervalWorkout__warmupBlock;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A80F0);
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9((char *)self + OBJC_IVAR____TtC11WorkoutCore15IntervalWorkout__cooldownBlock, v8);
  v10 = (char *)self + OBJC_IVAR____TtC11WorkoutCore15IntervalWorkout__stepBlocks;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688A8110);
  v12 = *(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8);

  v12(v10, v11);
}

@end