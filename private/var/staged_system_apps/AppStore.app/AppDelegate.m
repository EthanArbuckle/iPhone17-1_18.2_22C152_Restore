@interface AppDelegate
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (UIWindow)window;
- (_TtC8AppStore11AppDelegate)init;
- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4;
- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)handleDebugActivationFrom:(id)a3;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)mediaTokenAccountDidChange;
- (void)setWindow:(id)a3;
- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation AppDelegate

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000E00C();
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_100467DC0(&qword_1009810F0, 255, type metadata accessor for LaunchOptionsKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  char v8 = sub_10003FB90();

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  if (!a4) {
    return 30;
  }
  id v6 = a4;
  id v7 = a3;
  char v8 = self;
  id v9 = [v6 traitCollection];
  id v10 = [v9 userInterfaceIdiom];

  if (v10 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC8AppStore11AppDelegate_window));
}

- (_TtC8AppStore11AppDelegate)init
{
  return (_TtC8AppStore11AppDelegate *)sub_10000F598();
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore11AppDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore11AppDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100466CF0();
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100466F28();
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for OpenURLOptionsKey(0);
  sub_100467DC0(&qword_100981100, 255, type metadata accessor for OpenURLOptionsKey);
  uint64_t v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  v13 = self;
  char v14 = sub_1004670E0((uint64_t)v10, v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14 & 1;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  LOBYTE(self) = sub_10046763C(v10);
  _Block_release(v8);

  return self & 1;
}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  id v12 = self;
  sub_100467950(v11, (uint64_t)sub_100466CD8, v9);

  swift_release();
}

- (void)mediaTokenAccountDidChange
{
  v2 = self;
  sub_100464F9C();
}

- (void)handleDebugActivationFrom:(id)a3
{
  id v4 = a3;
  v5 = self;
  if ([v4 state] == (id)3) {
    sub_1004650FC();
  }
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v9 = type metadata accessor for BootstrapPhase();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_100466C60;
  *(void *)(v15 + 24) = v14;
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for BootstrapPhase.presentingContent(_:), v9);
  id v16 = a3;
  id v17 = a4;
  v18 = self;
  swift_retain();
  BootstrapPendingClosuresHandler.performClosure(after:priority:canPerformImmediately:closure:)();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  swift_release();
  swift_release();
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  uint64_t v7 = type metadata accessor for BootstrapPhase();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(swift_allocObject() + 16) = self;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for BootstrapPhase.presentingContent(_:), v7);
  uint64_t v11 = self;
  id v12 = a3;
  id v13 = a4;
  BootstrapPendingClosuresHandler.performClosure(after:priority:canPerformImmediately:closure:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  swift_release();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10009626C(*(void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore11AppDelegate_pptViewHierarchyProxy));

  swift_release();
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
  id v12 = self;
  sub_1006B20C0(a3, v8, v10, v5);
  char v14 = v13;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14 & 1;
}

@end