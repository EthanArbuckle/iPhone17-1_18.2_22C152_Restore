@interface WeatherPrefetchScheduler
- (_TtC13SleepHealthUI24WeatherPrefetchScheduler)init;
- (void)dealloc;
- (void)sleepStore:(id)a3 sleepEventDidOccur:(id)a4;
- (void)sleepStore:(id)a3 sleepScheduleModelDidChange:(id)a4;
- (void)sleepStore:(id)a3 sleepScheduleStateDidChange:(unint64_t)a4;
@end

@implementation WeatherPrefetchScheduler

- (void)dealloc
{
  v2 = self;
  sub_1AD93C620();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for WeatherPrefetchScheduler();
  [(WeatherPrefetchScheduler *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  sub_1AD894998((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI24WeatherPrefetchScheduler_lastWakeUp);
  objc_super v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SleepHealthUI24WeatherPrefetchScheduler_timer);
}

- (_TtC13SleepHealthUI24WeatherPrefetchScheduler)init
{
  result = (_TtC13SleepHealthUI24WeatherPrefetchScheduler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)sleepStore:(id)a3 sleepScheduleModelDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  _s13SleepHealthUI24WeatherPrefetchSchedulerC10sleepStore_0G22ScheduleModelDidChangeySo09HKSPSleepH0C_So0miJ0CtF_0();
}

- (void)sleepStore:(id)a3 sleepScheduleStateDidChange:(unint64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1AD93CE4C(a4);
}

- (void)sleepStore:(id)a3 sleepEventDidOccur:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1AD93D148(v7);
}

@end