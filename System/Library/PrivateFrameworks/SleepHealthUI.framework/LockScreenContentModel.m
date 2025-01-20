@interface LockScreenContentModel
- (_TtC13SleepHealthUI22LockScreenContentModel)init;
- (void)dealloc;
- (void)sleepStore:(id)a3 sleepScheduleModelDidChange:(id)a4;
@end

@implementation LockScreenContentModel

- (void)dealloc
{
  v2 = self;
  LockScreenContentModel.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI22LockScreenContentModel__state;
  v4 = (uint64_t (*)(void, uint64_t))MEMORY[0x1E4F1AC70];
  sub_1AD8ACE20(0, &qword_1E9A4AC28, (uint64_t)&type metadata for LockScreenContentState, MEMORY[0x1E4F1AC70]);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v3, v5);
  v6 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI22LockScreenContentModel__alarmButtonPressed;
  sub_1AD8ACE20(0, (unint64_t *)&qword_1E9A4AC40, MEMORY[0x1E4FBB390], v4);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  swift_release();
  sub_1AD8AD984((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI22LockScreenContentModel____lazy_storage___gregorianCalendar, (uint64_t (*)(void))sub_1AD8AD950);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SleepHealthUI22LockScreenContentModel_sleepScheduleModel);
}

- (void)sleepStore:(id)a3 sleepScheduleModelDidChange:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  sub_1AD8ACB30(v6);
}

- (_TtC13SleepHealthUI22LockScreenContentModel)init
{
  result = (_TtC13SleepHealthUI22LockScreenContentModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end