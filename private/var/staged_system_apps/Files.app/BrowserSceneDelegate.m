@interface BrowserSceneDelegate
- (UIWindow)window;
- (_TtC5Files20BrowserSceneDelegate)init;
- (id)stateRestorationActivityForScene:(id)a3;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation BrowserSceneDelegate

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002BB30(v4);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10003740C(v8, v9, v10);
}

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC5Files20BrowserSceneDelegate_window));
}

- (_TtC5Files20BrowserSceneDelegate)init
{
  return (_TtC5Files20BrowserSceneDelegate *)sub_1000D804C();
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files20BrowserSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files20BrowserSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10024E5C8(v4);
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100266E84(v7);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_10009E6C4(0, &qword_10070BDA0);
  sub_1000B86A8(&qword_10070BDA8, &qword_10070BDA0);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_100267E38(v6);

  swift_bridgeObjectRelease();
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_100268100(v10, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002683CC();
}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_100264BF0();

  return v6;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end