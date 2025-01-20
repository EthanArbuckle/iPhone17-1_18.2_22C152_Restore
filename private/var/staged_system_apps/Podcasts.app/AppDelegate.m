@interface AppDelegate
+ (id)createWindowWithScene:(id)a3;
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (UIResponder)commandController;
- (UIWindow)window;
- (_TtC8Podcasts11AppDelegate)init;
- (_TtC8Podcasts19LibraryDataProvider)libraryDataProvider;
- (void)activeSystemRouteDidChangeWithNotification:(id)a3;
- (void)application:(id)a3 openStateRestorationActivity:(id)a4;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)handleDebugActivationFrom:(id)a3;
- (void)setCommandController:(id)a3;
- (void)willConnectScene;
@end

@implementation AppDelegate

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002DD9C(v4);
}

- (void)willConnectScene
{
  v2 = self;
  sub_10001A048();
}

- (_TtC8Podcasts19LibraryDataProvider)libraryDataProvider
{
  type metadata accessor for LibraryDataProvider(0);
  v3 = self;
  swift_retain();
  BaseObjectGraph.inject<A>(_:)();

  swift_release();

  return (_TtC8Podcasts19LibraryDataProvider *)v5;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  LOBYTE(self) = sub_10000E944(v10);
  _Block_release(v8);

  return self & 1;
}

- (UIWindow)window
{
  v3 = self;
  id v4 = self;
  id v5 = [v3 sharedApplication];
  id v6 = [v5 delegate];

  if (v6)
  {
    if ([v6 respondsToSelector:"window"])
    {
      id v7 = [v6 window];

      swift_unknownObjectRelease();
      goto LABEL_7;
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
  id v7 = 0;
LABEL_7:

  return (UIWindow *)v7;
}

+ (id)createWindowWithScene:(id)a3
{
  id v4 = self;
  id v5 = a3;
  id v6 = [v4 mainScreen];
  [v6 bounds];

  id v7 = objc_allocWithZone((Class)type metadata accessor for Window());
  id v8 = v5;
  id v9 = (void *)Window.init(frame:windowScene:)();
  type metadata accessor for Theme();
  id v10 = v9;
  v11 = (void *)static Theme.appTintColor.getter();
  [v10 setTintColor:v11];

  return v10;
}

- (UIResponder)commandController
{
  return (UIResponder *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                + OBJC_IVAR____TtC8Podcasts11AppDelegate_commandController));
}

- (_TtC8Podcasts11AppDelegate)init
{
  return (_TtC8Podcasts11AppDelegate *)sub_10001D500();
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  return sub_1000140E8(self, (uint64_t)a2, a3, (uint64_t)a4, sub_10002AD74);
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return sub_1000140E8(self, (uint64_t)a2, a3, (uint64_t)a4, sub_10001FA3C);
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v5 = (uint64_t)a5;
  if (!a4)
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  if (v5) {
LABEL_3:
  }
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_4:
  id v11 = a3;
  v12 = self;
  char v13 = sub_100306884(a3, v8, v10, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13 & 1;
}

- (void)setCommandController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Podcasts11AppDelegate_commandController);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Podcasts11AppDelegate_commandController) = (Class)a3;
  id v3 = a3;
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100348DFC();
}

- (void)applicationWillTerminate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1003490DC();
}

- (void)application:(id)a3 openStateRestorationActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_10034946C();
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for OpenURLOptionsKey(0);
  sub_10003ABC8((unint64_t *)&qword_1005F66E0, type metadata accessor for OpenURLOptionsKey);
  uint64_t v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  char v13 = self;
  char v14 = sub_10034971C((uint64_t)v10, v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14 & 1;
}

- (void)activeSystemRouteDidChangeWithNotification:(id)a3
{
  uint64_t v5 = self;
  v9[4] = sub_10000BB14;
  v9[5] = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_100059A98;
  v9[3] = &unk_100562D60;
  id v6 = _Block_copy(v9);
  id v7 = a3;
  uint64_t v8 = self;
  [v5 getActiveRouteWithTimeout:v6 completion:1.0];
  _Block_release(v6);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  sub_100054B1C((uint64_t)self + OBJC_IVAR____TtC8Podcasts11AppDelegate_pptViewHierarchyProxy, &qword_100601E18);
  sub_100054B1C((uint64_t)self + OBJC_IVAR____TtC8Podcasts11AppDelegate_flowController, &qword_100604710);
}

- (void)handleDebugActivationFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1003487D4(v4);
}

@end