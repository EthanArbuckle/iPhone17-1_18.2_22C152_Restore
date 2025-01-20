@interface CarPlaySceneDelegate
- (UIWindow)window;
- (_TtC5Music20CarPlaySceneDelegate)init;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation CarPlaySceneDelegate

- (_TtC5Music20CarPlaySceneDelegate)init
{
  return (_TtC5Music20CarPlaySceneDelegate *)sub_1006CA190();
}

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC5Music20CarPlaySceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music20CarPlaySceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music20CarPlaySceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1006CB564(v8);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_100057778(0, (unint64_t *)&unk_1010A8230);
  sub_10006B444(&qword_1010B6AF0, (unint64_t *)&unk_1010A8230);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_1006CB758(v6);

  swift_bridgeObjectRelease();
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1006CC250();
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1006CC30C(v4);
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1006CC518(v4);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  swift_release();
}

@end