@interface RaceWorkoutConfiguration
- (int64_t)hash;
@end

@implementation RaceWorkoutConfiguration

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = RaceWorkoutConfiguration.hash.getter();

  return v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  int64_t v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore24RaceWorkoutConfiguration_clusterUUID;
  uint64_t v4 = sub_236C73FE8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11WorkoutCore24RaceWorkoutConfiguration_lastWorkoutUUID, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11WorkoutCore24RaceWorkoutConfiguration_lastWorkoutDate;
  uint64_t v7 = sub_236C73F58();
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  v5((char *)self + OBJC_IVAR____TtC11WorkoutCore24RaceWorkoutConfiguration_bestWorkoutUUID, v4);
  v8((char *)self + OBJC_IVAR____TtC11WorkoutCore24RaceWorkoutConfiguration_bestWorkoutDate, v7);
  sub_236A57E80(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC11WorkoutCore24RaceWorkoutConfiguration_routeSnapshotData), *(void *)&self->super._anon_0[OBJC_IVAR____TtC11WorkoutCore24RaceWorkoutConfiguration_routeSnapshotData]);
  v9 = (char *)self + OBJC_IVAR____TtC11WorkoutCore24RaceWorkoutConfiguration__raceFilter;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF30570);
  v11 = *(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8);

  v11(v9, v10);
}

@end