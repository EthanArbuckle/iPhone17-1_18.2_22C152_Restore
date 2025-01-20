@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC5Files11AppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)application:(id)a3 didDiscardSceneSessions:(id)a4;
- (void)buildMenuWithBuilder:(id)a3;
- (void)observedApplicationDidEnterBackgroundWithSender:(id)a3;
@end

@implementation AppDelegate

- (_TtC5Files11AppDelegate)init
{
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AppDelegate();
  return [(AppDelegate *)&v4 init];
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_1000BACE4(&qword_1007061D0, type metadata accessor for LaunchOptionsKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  char v8 = sub_100028348();

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_100019268(v9, v10);

  return v12;
}

- (void)buildMenuWithBuilder:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_100410678(a3);
  swift_unknownObjectRelease();
}

- (void)observedApplicationDidEnterBackgroundWithSender:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1004109B0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  sub_10009E6C4(0, (unint64_t *)&unk_10070D320);
  sub_1000B86A8((unint64_t *)&unk_10070BDC0, (unint64_t *)&unk_10070D320);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_100411320(v7, v6);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end