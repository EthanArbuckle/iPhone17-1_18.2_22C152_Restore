@interface SceneDelegate
- (UIWindow)window;
- (_TtC7Journal13SceneDelegate)init;
- (void)applicationDidUnlock;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setWindow:(id)a3;
- (void)showSystemAlertWithNotification:(id)a3;
- (void)windowScene:(UIWindowScene *)a3 performActionForShortcutItem:(UIApplicationShortcutItem *)a4 completionHandler:(id)a5;
@end

@implementation SceneDelegate

- (void)showSystemAlertWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1002DE3F0((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC7Journal13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Journal13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Journal13SceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (_TtC7Journal13SceneDelegate)init
{
  return (_TtC7Journal13SceneDelegate *)sub_100354968();
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100358A18(v8, v10);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100359580();
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1003598DC();
}

- (void)applicationDidUnlock
{
  v2 = self;
  sub_1000541DC();
}

- (void)sceneDidEnterBackground:(id)a3
{
  uint64_t v5 = sub_100010218(&qword_100809590);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = qword_1007F6C18;
  id v9 = a3;
  v10 = self;
  if (v8 != -1) {
    swift_once();
  }
  sub_100242018(0, 0);
  sub_100083830();
  uint64_t v11 = type metadata accessor for AppLaunchAction();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
  uint64_t v12 = (uint64_t)v10 + OBJC_IVAR____TtC7Journal13SceneDelegate_deferredLaunchAction;
  swift_beginAccess();
  sub_100359BFC((uint64_t)v7, v12);
  swift_endAccess();
}

- (void)sceneDidDisconnect:(id)a3
{
  uint64_t v5 = self;
  id v6 = a3;
  v7 = self;
  id v8 = [v5 defaultCenter];
  [v8 removeObserver:v7];
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_10001B284(0, &qword_1008095F8);
  sub_10035B534();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  v7 = self;
  sub_10035A2D8();

  swift_bridgeObjectRelease();
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10035A80C(v7);
}

- (void)windowScene:(UIWindowScene *)a3 performActionForShortcutItem:(UIApplicationShortcutItem *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100010218(&qword_1007FA1D0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1008095B8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1007FA5D8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_10035886C((uint64_t)v11, (uint64_t)&unk_100804550, (uint64_t)v16);
  swift_release();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal13SceneDelegate_deferredLaunchAction, &qword_100809590);
}

@end