@interface SceneDelegate
- (UIWindow)window;
- (_TtC6Health13SceneDelegate)init;
- (id)stateRestorationActivityForScene:(id)a3;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation SceneDelegate

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000CA54();
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000C814(0xD000000000000018, 0x80000001000D51B0);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  v8 = (void (*)(char *, uint64_t))a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100015EF0(v8, v9, v10);
}

- (_TtC6Health13SceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Health13SceneDelegate____lazy_storage___introFlowManager) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Health13SceneDelegate_deepLinkHandler) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Health13SceneDelegate_window) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC6Health13SceneDelegate_rootViewController;
  id v4 = (objc_class *)type metadata accessor for SceneDelegate();
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(SceneDelegate *)&v6 init];
}

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC6Health13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Health13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Health13SceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000C814(0xD000000000000019, 0x80000001000D5190);
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000C814(0xD00000000000001BLL, 0x80000001000D5150);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_10001E254(0, &qword_100106EC0);
  sub_100017328(&qword_100106EC8, &qword_100106EC0);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  sub_1000053CC(v6);

  swift_bridgeObjectRelease();
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10007D564(v7);
}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_10007C7E0(v4);

  return v6;
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  v8 = (void (**)(void *, void))_Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  v12 = self;
  char v11 = sub_10007C2DC(v10);
  v8[2](v8, v11 & 1);
  _Block_release(v8);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6Health13SceneDelegate_rootViewController);
}

@end