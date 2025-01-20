@interface FMAppDelegate
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (UIWindow)window;
- (_TtC6FindMy13FMAppDelegate)init;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)setWindow:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation FMAppDelegate

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001DE5C(v4);
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  unint64_t v4 = (unint64_t)a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_100045ACC(&qword_1006AEA00, type metadata accessor for LaunchOptionsKey);
    unint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v7 = a3;
  v8 = self;
  sub_10002359C(v7, v4);

  swift_bridgeObjectRelease();
  return 1;
}

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC6FindMy13FMAppDelegate_window));
}

- (_TtC6FindMy13FMAppDelegate)init
{
  return (_TtC6FindMy13FMAppDelegate *)sub_100008330();
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  LOBYTE(self) = sub_1000B3B38((void (*)(void, void, void))v10);
  _Block_release(v8);

  return self & 1;
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
  char v13 = sub_100118E04(a3, v8, v10, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13 & 1;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6FindMy13FMAppDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6FindMy13FMAppDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)applicationWillResignActive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1003EBC24(0xD00000000000001FLL, 0x800000010059A090);
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1003EAEDC();
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1003EB698();
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_1003EB9D8((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)applicationWillTerminate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1003EBC24(0xD00000000000001CLL, 0x8000000100599FF0);
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6FindMy13FMAppDelegate_dateFormatter);
}

@end