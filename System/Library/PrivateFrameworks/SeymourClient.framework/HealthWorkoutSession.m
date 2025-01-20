@interface HealthWorkoutSession
- (_TtC13SeymourClient20HealthWorkoutSession)init;
- (void)workoutBuilder:(id)a3 didCollectDataOfTypes:(id)a4;
- (void)workoutBuilder:(id)a3 didEndActivity:(id)a4;
- (void)workoutBuilderDidCollectEvent:(id)a3;
- (void)workoutSession:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5 date:(id)a6;
- (void)workoutSession:(id)a3 didFailWithError:(id)a4;
@end

@implementation HealthWorkoutSession

- (_TtC13SeymourClient20HealthWorkoutSession)init
{
  result = (_TtC13SeymourClient20HealthWorkoutSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1D594F53C((uint64_t)self + OBJC_IVAR____TtC13SeymourClient20HealthWorkoutSession_workout, &qword_1EA727930);
  sub_1D5A0A7B0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13SeymourClient20HealthWorkoutSession_caloriesUpdated));
  sub_1D594F53C((uint64_t)self + OBJC_IVAR____TtC13SeymourClient20HealthWorkoutSession____lazy_storage___calorieStream, &qword_1EA7278C8);
  sub_1D5A0A7B0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13SeymourClient20HealthWorkoutSession_sessionStateUpdated));
  sub_1D594F53C((uint64_t)self + OBJC_IVAR____TtC13SeymourClient20HealthWorkoutSession____lazy_storage___sessionStateStream, &qword_1EA7278E8);
  swift_bridgeObjectRelease();
}

- (void)workoutBuilder:(id)a3 didCollectDataOfTypes:(id)a4
{
  sub_1D59E8AE0(0, (unint64_t *)&unk_1EBDE15D8);
  sub_1D5A5F120();
  uint64_t v6 = sub_1D5AB5350();
  id v7 = a3;
  v8 = self;
  HealthWorkoutSession.workoutBuilder(_:didCollectDataOf:)((uint64_t)v7, v6);

  swift_bridgeObjectRelease();
}

- (void)workoutBuilderDidCollectEvent:(id)a3
{
  uint64_t v4 = qword_1EBDE3740;
  id v10 = a3;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1D5AB4B50();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EBDE37B0);
  id v7 = sub_1D5AB4B30();
  os_log_type_t v8 = sub_1D5AB5430();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D5947000, v7, v8, "HealthWorkoutSession: Workout Builder Collected Event.", v9, 2u);
    MEMORY[0x1D945AAC0](v9, -1, -1);
  }
}

- (void)workoutBuilder:(id)a3 didEndActivity:(id)a4
{
  uint64_t v6 = qword_1EBDE3740;
  id v7 = a3;
  id v8 = a4;
  v12 = self;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1D5AB4B50();
  __swift_project_value_buffer(v9, (uint64_t)qword_1EBDE37B0);
  v10._countAndFlagsBits = 0xD000000000000072;
  v10._object = (void *)0x80000001D5AC9ED0;
  v11._object = (void *)0x80000001D5AC9F50;
  v11._countAndFlagsBits = 0xD000000000000019;
  Logger.trace(file:function:)(v10, v11);
  sub_1D5A5AF60(3u);
}

- (void)workoutSession:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5 date:(id)a6
{
  uint64_t v8 = sub_1D5AB1CE0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  Swift::String v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D5AB1CB0();
  id v12 = a3;
  v13 = self;
  sub_1D5A5F188();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)workoutSession:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_1D5A5F480(v8);
}

@end