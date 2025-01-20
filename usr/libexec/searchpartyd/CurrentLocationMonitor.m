@interface CurrentLocationMonitor
- (_TtC12searchpartyd22CurrentLocationMonitor)init;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
@end

@implementation CurrentLocationMonitor

- (_TtC12searchpartyd22CurrentLocationMonitor)init
{
  result = (_TtC12searchpartyd22CurrentLocationMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1004270C8((uint64_t)self + OBJC_IVAR____TtC12searchpartyd22CurrentLocationMonitor_delegate);

  swift_release();

  swift_release();
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_10001D4B0(0, (unint64_t *)&qword_101646830);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  sub_1004B770C(v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  static os_log_type_t.error.getter();
  if (qword_101636B48 != -1) {
    swift_once();
  }
  sub_10000588C((uint64_t *)&unk_10163AD00);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_101342130;
  swift_errorRetain();
  sub_10000588C(&qword_101638D40);
  uint64_t v10 = String.init<A>(describing:)();
  uint64_t v12 = v11;
  *(void *)(v9 + 56) = &type metadata for String;
  *(void *)(v9 + 64) = sub_10000B4CC();
  *(void *)(v9 + 32) = v10;
  *(void *)(v9 + 40) = v12;
  os_log(_:dso:log:_:_:)();

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1004B7D18(a4);
}

@end