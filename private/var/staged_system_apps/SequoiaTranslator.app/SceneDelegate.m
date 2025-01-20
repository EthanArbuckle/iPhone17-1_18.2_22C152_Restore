@interface SceneDelegate
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (UIWindow)window;
- (_TtC17SequoiaTranslator13SceneDelegate)init;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6;
@end

@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC17SequoiaTranslator13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator13SceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10019AF8C(v8, v10);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10019C3B8();
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10019C598();
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10019C6F0();
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_10000B0CC(0, &qword_1002F9720);
  sub_10007854C((unint64_t *)&unk_1002F9728, &qword_1002F9720);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_10019C87C(v6);

  swift_bridgeObjectRelease();
}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a6;
  id v10 = self;
  sub_10019CAB4(v8);

  swift_unknownObjectRelease();
}

- (_TtC17SequoiaTranslator13SceneDelegate)init
{
  return (_TtC17SequoiaTranslator13SceneDelegate *)sub_1001932E4();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator13SceneDelegate_sharedTranslationOptions));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator13SceneDelegate____lazy_storage___favoritesImporter));

  swift_release();
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100195884(v6, v7);

  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10019CB78(v6);
}

- (void)sceneDidDisconnect:
{
  id v0 = [self sharedApplication];
  id v1 = [v0 delegate];

  if (v1)
  {
    type metadata accessor for AppDelegate();
    uint64_t v2 = swift_dynamicCastClass();
    if (v2)
    {
      uint64_t v3 = *(void *)(v2 + OBJC_IVAR____TtC17SequoiaTranslator11AppDelegate_interruptionController);
      swift_retain();
      swift_unknownObjectRelease();
      if (v3)
      {
        *(void *)(v3 + 24) = 0;
        swift_unknownObjectWeakAssign();
        swift_release();
      }
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
}

@end