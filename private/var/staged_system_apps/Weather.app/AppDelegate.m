@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (_TtC7Weather11AppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (id)createSceneContainer;
- (void)application:(id)a3 didDiscardSceneSessions:(id)a4;
- (void)didBecomeFocused;
- (void)didBecomeKeyWindow;
- (void)didEnterBackground;
- (void)didLoseFocus;
- (void)willEnterForeground;
- (void)willTerminate;
@end

@implementation AppDelegate

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_10001F948((int)v11, v9);

  return v12;
}

- (_TtC7Weather11AppDelegate)init
{
  return (_TtC7Weather11AppDelegate *)sub_10001282C();
}

- (void)willEnterForeground
{
  v2 = self;
  sub_10001FB3C((uint64_t)"Application will enter foreground", 33, (void (*)(uint64_t, uint64_t))&dispatch thunk of ApplicationStateManagerType.willEnterForeground());
}

- (void)didBecomeKeyWindow
{
  v2 = self;
  sub_10022458C();
}

- (void)didBecomeFocused
{
  v2 = self;
  sub_100224648();
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  return sub_10003E424(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))sub_1000A0428);
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return sub_10003E424(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))sub_100082744);
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  sub_1001ABC4C(0, &qword_100E6F480);
  sub_10036431C();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_1001781AC((uint64_t)self + OBJC_IVAR____TtC7Weather11AppDelegate____lazy_storage___resolver, &qword_100E6F2A0);
  swift_release();
  swift_release();
  sub_1001781AC((uint64_t)self + OBJC_IVAR____TtC7Weather11AppDelegate____lazy_storage___stateManager, &qword_100E6F460);
  sub_1001781AC((uint64_t)self + OBJC_IVAR____TtC7Weather11AppDelegate____lazy_storage___windowFocusManager, &qword_100E6F438);
  sub_1001781AC((uint64_t)self + OBJC_IVAR____TtC7Weather11AppDelegate____lazy_storage___debugPresenter, &qword_100E6F448);
  swift_release();
  swift_release();

  swift_release();
}

- (void)willTerminate
{
  v2 = self;
  sub_100363A64();
}

- (void)didEnterBackground
{
  v2 = self;
  sub_10001FB3C((uint64_t)"Application did enter background", 32, (void (*)(uint64_t, uint64_t))&dispatch thunk of ApplicationStateManagerType.didEnterBackground());
}

- (id)createSceneContainer
{
  v2 = self;
  sub_100363FD4(v5);

  sub_1001B1E64(v5, v5[3]);
  v3 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0((uint64_t)v5);

  return v3;
}

- (void)didLoseFocus
{
  v2 = self;
  sub_100364104();
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_1003641D8((uint64_t)v11, v7, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return self & 1;
}

@end