@interface WorkoutConfiguration
+ (id)deserializeFromPersistence:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)analyticsKey;
- (NSString)analyticsSubActivities;
- (_TtC11WorkoutCore20WorkoutConfiguration)init;
- (id)serialize;
- (int64_t)hash;
@end

@implementation WorkoutConfiguration

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_236AB4B64();

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
  char v6 = sub_236AB6D64((uint64_t)v8);

  sub_236A73174((uint64_t)v8, (uint64_t *)&unk_2688AA9F0);
  return v6 & 1;
}

- (_TtC11WorkoutCore20WorkoutConfiguration)init
{
  result = (_TtC11WorkoutCore20WorkoutConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  int64_t v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore20WorkoutConfiguration_uuid;
  uint64_t v4 = sub_236C73FE8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  sub_236A73174((uint64_t)self + OBJC_IVAR____TtC11WorkoutCore20WorkoutConfiguration_scheduledDate, &qword_26AF2FE50);
  sub_236A73174((uint64_t)self + OBJC_IVAR____TtC11WorkoutCore20WorkoutConfiguration_lastCompletedDate, &qword_26AF2FE50);
  sub_236A73174((uint64_t)self + OBJC_IVAR____TtC11WorkoutCore20WorkoutConfiguration_route, &qword_2688A8928);
  sub_236A73174((uint64_t)self + OBJC_IVAR____TtC11WorkoutCore20WorkoutConfiguration_originalConfigurationReferenceUUID, &qword_2688A81B8);

  swift_bridgeObjectRelease();
}

+ (id)deserializeFromPersistence:(id)a3
{
  uint64_t v3 = qword_26AF2FF40;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  v5 = (char *)qword_26AF2FF38;
  swift_retain();
  static WorkoutConfiguration.deserialize(from:requiringOccurrence:validator:)(v4, 0, v5, v13);

  swift_release();
  uint64_t v6 = v14;
  if (v14)
  {
    v7 = __swift_project_boxed_opaque_existential_1(v13, v14);
    uint64_t v8 = *(void *)(v6 - 8);
    MEMORY[0x270FA5388](v7);
    v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    v11 = (void *)sub_236C75918();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)serialize
{
  v2 = self;
  id v3 = WorkoutConfiguration.serialize()();

  return v3;
}

- (NSString)analyticsKey
{
  swift_beginAccess();
  v2 = (void *)sub_236C74E28();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)analyticsSubActivities
{
  v2 = (void *)sub_236C74E28();

  return (NSString *)v2;
}

@end