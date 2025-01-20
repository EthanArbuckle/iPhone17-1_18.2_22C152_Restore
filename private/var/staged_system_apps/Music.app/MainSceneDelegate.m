@interface MainSceneDelegate
- (UIWindow)window;
- (_TtC5Music17MainSceneDelegate)init;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation MainSceneDelegate

- (_TtC5Music17MainSceneDelegate)init
{
  return (_TtC5Music17MainSceneDelegate *)sub_100009A9C();
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10004506C(v8, v9, v10);
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100018E20(v4);
}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a6;
  id v10 = self;
  id v11 = [v8 traitCollection];
  sub_1000679FC(v11, v9);

  swift_unknownObjectRelease();
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000253D8(v4);
}

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC5Music17MainSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music17MainSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music17MainSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003E1DE8(v4);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003E0B98(v4);
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003E2148(v4);
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1003E16B0(v6, v7);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_100057778(0, (unint64_t *)&unk_1010A8230);
  sub_10004697C(&qword_1010B6AF0, (unint64_t *)&unk_1010A8230);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_10004B2E4(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  type metadata accessor for LaunchOptions(0);
  swift_allocObject();
  id v10 = a3;
  id v13 = a4;
  id v11 = v10;
  v12 = self;
  swift_retain();
  if (sub_1002833CC(v13, v11, (uint64_t)sub_10018064C, v9))
  {
    sub_100285AC8();

    swift_release();
  }
  else
  {
  }
  swift_release();
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music17MainSceneDelegate____lazy_storage___tabBarController));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC5Music17MainSceneDelegate____lazy_storage___splitViewController);
}

@end