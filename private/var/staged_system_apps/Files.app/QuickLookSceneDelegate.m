@interface QuickLookSceneDelegate
- (UIWindow)window;
- (_TtC5Files22QuickLookSceneDelegate)init;
- (id)stateRestorationActivityForScene:(id)a3;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation QuickLookSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10044D20C(v8, v9, v10);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10044FAAC(v4);
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100451F10(v7);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_10009E6C4(0, &qword_10070BDA0);
  sub_1000B86A8(&qword_10070BDA8, &qword_10070BDA0);
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  id v7 = self;
  sub_1004521A0();

  swift_bridgeObjectRelease();
}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_100451550();

  return v6;
}

- (_TtC5Files22QuickLookSceneDelegate)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_window) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_viewController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_documentManager) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_currentQuickLookPreviewItemObserver) = 0;
  id v3 = (char *)self + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_currentQuickLookURL;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_isSharedScene) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for QuickLookSceneDelegate();
  return [(QuickLookSceneDelegate *)&v6 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_currentQuickLookPreviewItemObserver));
  id v3 = (char *)self + OBJC_IVAR____TtC5Files22QuickLookSceneDelegate_currentQuickLookURL;

  sub_1001939F8((uint64_t)v3);
}

@end