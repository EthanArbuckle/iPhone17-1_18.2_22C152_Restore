@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (_TtC9StocksApp11AppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)application:(id)a3 didDiscardSceneSessions:(id)a4;
- (void)application:(id)a3 didFailToRegisterForRemoteNotificationsWithError:(id)a4;
- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5;
- (void)application:(id)a3 didRegisterForRemoteNotificationsWithDeviceToken:(id)a4;
- (void)application:(id)a3 performFetchWithCompletionHandler:(id)a4;
- (void)applicationWillTerminate:(id)a3;
- (void)buildMenuWithBuilder:(id)a3;
- (void)validateCommand:(id)a3;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_100010CC4(&qword_1000539C0, 255, type metadata accessor for LaunchOptionsKey);
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v7 = a3;
  v8 = self;
  char v9 = sub_10000F850(v4);

  swift_bridgeObjectRelease();
  return v9 & 1;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_100010CC4(&qword_1000539C0, 255, type metadata accessor for LaunchOptionsKey);
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v7 = a3;
  v8 = self;
  char v9 = sub_100010D0C(v7, v4);

  swift_bridgeObjectRelease();
  return v9 & 1;
}

- (void)application:(id)a3 didRegisterForRemoteNotificationsWithDeviceToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  sub_100013EC4(0, (unint64_t *)&unk_100054DE0);
  v11 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  sub_10001703C(v8, v10);
}

- (_TtC9StocksApp11AppDelegate)init
{
  return (_TtC9StocksApp11AppDelegate *)sub_100006E04();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_100008070((uint64_t)self + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___resolver, (unint64_t *)&qword_100053EA0, &qword_1000548B0, (uint64_t)&protocol descriptor for ResolverType);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9StocksApp11AppDelegate____lazy_storage___menuManager));

  swift_release();
}

- (void)applicationWillTerminate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100018AFC();
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_100018DA4(v9);

  return v12;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  sub_100013EC4(0, &qword_100053EF0);
  sub_100019AD0();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_100019014(v6);

  swift_bridgeObjectRelease();
}

- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5
{
  id v7 = _Block_copy(a5);
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  id v10 = a3;
  v11 = self;
  sub_1000193B0(v8, (uint64_t)sub_100019B74, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)application:(id)a3 didFailToRegisterForRemoteNotificationsWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_100019628();
}

- (void)application:(id)a3 performFetchWithCompletionHandler:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_10001976C((uint64_t)sub_100019A20, v7);

  swift_release();
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  v5 = (objc_class *)a5;
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
    v5 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_4:
  id v11 = a3;
  id v12 = self;
  char v13 = sub_1000198E0(v8, v10, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13 & 1;
}

- (void)buildMenuWithBuilder:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  id v6 = (id)sub_1000175B4();
  [v6 buildMenuWithBuilder:a3];
  swift_unknownObjectRelease();
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id v4 = self;
  sub_100018244((uint64_t)a3, v12);

  uint64_t v5 = v13;
  if (v13)
  {
    id v6 = sub_1000136F8(v12, v13);
    uint64_t v7 = *(void *)(v5 - 8);
    __chkstk_darwin(v6);
    uint64_t v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    uint64_t v10 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    sub_10001373C((uint64_t)v12);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100018468();
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    id v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    uint64_t v7 = self;
  }
  char v8 = sub_100018618((uint64_t)a3, (uint64_t)v10);

  sub_10001897C((uint64_t)v10);
  return v8 & 1;
}

@end