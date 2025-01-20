@interface AppDelegate
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (UIWindow)window;
- (_TtC6Health11AppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)application:(id)a3 didDiscardSceneSessions:(id)a4;
- (void)setWindow:(id)a3;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_10002069C(&qword_1001065F0, 255, type metadata accessor for LaunchOptionsKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  char v8 = sub_1000121BC();

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = [v9 role];
  id v13 = objc_allocWithZone((Class)UISceneConfiguration);
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v13 initWithName:v14 sessionRole:v12];

  return v15;
}

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC6Health11AppDelegate_window));
}

- (_TtC6Health11AppDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Health11AppDelegate_window) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC6Health11AppDelegate____lazy_storage___pluginNotificationRouter) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDelegate();
  return [(AppDelegate *)&v3 init];
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Health11AppDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Health11AppDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  id v5 = a3;
  id v6 = self;
  sub_10006D1A4();
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for OpenURLOptionsKey(0);
  sub_10002069C(&qword_100104488, 255, type metadata accessor for OpenURLOptionsKey);
  uint64_t v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = self;
  BOOL v14 = sub_10006D3CC((uint64_t)v10, v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC6Health11AppDelegate____lazy_storage___pluginNotificationRouter);
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v5 = (uint64_t)a5;
  if (!a4)
  {
    uint64_t v8 = 0;
    unint64_t v10 = 0;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;
  if (v5) {
LABEL_3:
  }
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_4:
  id v11 = a3;
  id v12 = self;
  char v13 = sub_10007DF68((uint64_t)a3, v8, v10, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13 & 1;
}

@end