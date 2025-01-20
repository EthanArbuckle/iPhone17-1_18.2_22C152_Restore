@interface WatchAppInstalledProvider
- (_TtC13SleepHealthUI25WatchAppInstalledProvider)init;
- (void)dealloc;
@end

@implementation WatchAppInstalledProvider

- (_TtC13SleepHealthUI25WatchAppInstalledProvider)init
{
  return (_TtC13SleepHealthUI25WatchAppInstalledProvider *)WatchAppInstalledProvider.init()();
}

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13SleepHealthUI25WatchAppInstalledProvider_watchAppStateObserver))
  {
    v3 = self;
    swift_retain();
    sub_1AD9DDA90();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WatchAppInstalledProvider();
  [(WatchAppInstalledProvider *)&v5 dealloc];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI25WatchAppInstalledProvider__isWatchAppInstalled;
  sub_1AD8F1C48(0, (unint64_t *)&qword_1E9A4AC40, MEMORY[0x1E4F1AC70]);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();
}

@end