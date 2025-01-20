@interface SleepSettingsProvider
- (_TtC13SleepHealthUI21SleepSettingsProvider)init;
- (void)dealloc;
- (void)sleepStore:(id)a3 sleepFocusConfigurationDidUpdate:(id)a4;
- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4;
@end

@implementation SleepSettingsProvider

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SleepHealthUI21SleepSettingsProvider_sleepStore);
  v3 = self;
  objc_msgSend(v2, sel_removeObserver_, v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for SleepSettingsProvider();
  [(SleepSettingsProvider *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

- (_TtC13SleepHealthUI21SleepSettingsProvider)init
{
  result = (_TtC13SleepHealthUI21SleepSettingsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1AD8A3FC0(v7);
}

- (void)sleepStore:(id)a3 sleepFocusConfigurationDidUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1AD8A4464(v7);
}

@end