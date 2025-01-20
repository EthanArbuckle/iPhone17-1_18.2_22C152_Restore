@interface TTRLocationChangeMonitor
- (_TtC15RemindersUICore24TTRLocationChangeMonitor)init;
- (void)dealloc;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation TTRLocationChangeMonitor

- (void)dealloc
{
  v2 = self;
  TTRLocationChangeMonitor.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  sub_1B91161D4(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC15RemindersUICore24TTRLocationChangeMonitor_lastResult), self->locationChange[OBJC_IVAR____TtC15RemindersUICore24TTRLocationChangeMonitor_lastResult]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore24TTRLocationChangeMonitor_locationManager));
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15RemindersUICore24TTRLocationChangeMonitor_timer);
}

- (_TtC15RemindersUICore24TTRLocationChangeMonitor)init
{
  result = (_TtC15RemindersUICore24TTRLocationChangeMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  v4 = (objc_class *)a3;
  v5._id internal = self;
  id internal = v5._internal;
  v5.super.isa = v4;
  TTRLocationChangeMonitor.locationManagerDidChangeAuthorization(_:)(v5);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_1B90BFD68(0, &qword_1EB9B4A40);
  unint64_t v6 = sub_1B996EE50();
  id v7 = a3;
  v8 = self;
  sub_1B9116208(v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_1B91163EC(v8);
}

@end