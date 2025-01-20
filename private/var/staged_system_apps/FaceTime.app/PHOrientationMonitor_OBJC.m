@interface PHOrientationMonitor_OBJC
- (BOOL)orientationEventsEnabled;
- (_TtC8FaceTime25PHOrientationMonitor_OBJC)init;
- (int64_t)deviceOrientation;
- (int64_t)interfaceOrientation;
- (int64_t)lastValidInterfaceOrientation;
- (int64_t)makeInterfaceOrientationFrom:(int64_t)a3 whenFailing:(int64_t)a4;
- (void)setOrientationEventsEnabled:(BOOL)a3;
@end

@implementation PHOrientationMonitor_OBJC

- (void)setOrientationEventsEnabled:(BOOL)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v5 = self;
  sub_10000AFD0(a3);
  swift_release();
}

- (int64_t)makeInterfaceOrientationFrom:(int64_t)a3 whenFailing:(int64_t)a4
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  int64_t v6 = sub_10000C570(a3, a4);
  swift_release();
  return v6;
}

- (void).cxx_destruct
{
}

- (int64_t)lastValidInterfaceOrientation
{
  return sub_10000EDAC(self, (uint64_t)a2, 67, (uint64_t (*)(void))sub_10001ADCC);
}

- (int64_t)deviceOrientation
{
  return sub_10000EDAC(self, (uint64_t)a2, 59, (uint64_t (*)(void))sub_10001ADF8);
}

- (int64_t)interfaceOrientation
{
  return sub_10000EDAC(self, (uint64_t)a2, 63, (uint64_t (*)(void))sub_10004FC3C);
}

- (BOOL)orientationEventsEnabled
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  unsigned __int8 v4 = sub_10004FCF0();
  swift_release();

  return v4 & 1;
}

- (_TtC8FaceTime25PHOrientationMonitor_OBJC)init
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  result = (_TtC8FaceTime25PHOrientationMonitor_OBJC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end