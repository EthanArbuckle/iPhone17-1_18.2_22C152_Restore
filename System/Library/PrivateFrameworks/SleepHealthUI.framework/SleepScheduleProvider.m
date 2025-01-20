@interface SleepScheduleProvider
- (_TtC13SleepHealthUI21SleepScheduleProvider)init;
- (void)dealloc;
- (void)sleepStore:(id)a3 sleepEventDidOccur:(id)a4;
- (void)sleepStore:(id)a3 sleepEventRecordDidChange:(id)a4;
- (void)sleepStore:(id)a3 sleepScheduleDidChange:(id)a4;
@end

@implementation SleepScheduleProvider

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SleepHealthUI21SleepScheduleProvider_sleepStore);
  v3 = self;
  objc_msgSend(v2, sel_removeObserver_, v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for SleepScheduleProvider();
  [(SleepScheduleProvider *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SleepHealthUI21SleepScheduleProvider_query);
}

- (_TtC13SleepHealthUI21SleepScheduleProvider)init
{
  result = (_TtC13SleepHealthUI21SleepScheduleProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)sleepStore:(id)a3 sleepScheduleDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1AD971A04(a4);
}

- (void)sleepStore:(id)a3 sleepEventRecordDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1AD971E2C(v7, "[%{public}s] Observed sleep event record change to %{public}s");
}

- (void)sleepStore:(id)a3 sleepEventDidOccur:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1AD971E2C(v7, "[%{public}s] Observed sleep event %{public}s");
}

@end