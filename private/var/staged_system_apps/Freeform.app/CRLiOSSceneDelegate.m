@interface CRLiOSSceneDelegate
- (NSUserActivity)userActivity;
- (UIActivityItemsConfigurationReading)activityItemsConfiguration;
- (UIWindow)window;
- (_TtC8Freeform19CRLiOSSceneDelegate)init;
- (id)stateRestorationActivityForScene:(id)a3;
- (void)didTapWelcomeContinueButton:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)qa_importFileFor:(id)a3;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setUserActivity:(id)a3;
- (void)setWindow:(id)a3;
- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
- (void)windowScene:(id)a3 userDidAcceptCloudKitShareWithMetadata:(id)a4;
@end

@implementation CRLiOSSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = self;
  sub_100A717D8(v11, v8, v9);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_10050BF48(0, &qword_1016787B8);
  sub_10062E0F4((unint64_t *)&unk_10168E2B0, &qword_1016787B8);
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v6 = self;
  sub_100A97738();
  swift_bridgeObjectRelease();
}

- (void)sceneDidDisconnect:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_100A97AD0();
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_100A771E8((uint64_t)v5);
}

- (void)sceneWillResignActive:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_100A77710((uint64_t)v5);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v5 = self;
  id v6 = a3;
  id v7 = self;
  id v8 = [v5 defaultCenter];
  id v9 = v8;
  if (qword_10166F838 != -1)
  {
    swift_once();
    id v8 = v9;
  }
  [v8 postNotificationName:qword_10171B728 object:v6];
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_100A779A8((uint64_t)v5);
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  id v11 = a3;
  id v9 = a4;
  v10 = self;
  sub_100A97F68(v9);
  _Block_release(v8);
}

- (NSUserActivity)userActivity
{
  return (NSUserActivity *)0;
}

- (void)setUserActivity:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"userActivity", 12, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/App/CRLiOSSceneDelegate.swift", 87, 2, 394);
}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v5 = self;
  id v6 = a3;
  id v7 = self;
  if ([v5 isMainThread])
  {
    id v8 = sub_100A783E0();
    sub_100A78C10(v8);
  }
  else
  {
    sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"stateRestorationActivity(for:)", 30, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/App/CRLiOSSceneDelegate.swift", 87, 2, 424, (uint64_t)"Expected stateRestorationActivity(for:) to be called on the main thread.", 72, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"stateRestorationActivity(for:)", 30, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/App/CRLiOSSceneDelegate.swift", 87, 2, 424);
  }
  id v9 = sub_100A783E0();

  return v9;
}

- (void)windowScene:(id)a3 userDidAcceptCloudKitShareWithMetadata:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = self;
  sub_100A7D46C(v6);
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = self;
  sub_100A95BA8(v6);
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  id v11 = a3;
  id v13 = a5;
  v12 = self;
  sub_100A980DC(v8, v10);

  swift_bridgeObjectRelease();
}

- (_TtC8Freeform19CRLiOSSceneDelegate)init
{
  return (_TtC8Freeform19CRLiOSSceneDelegate *)sub_100A81F8C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_100522AD8(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate____lazy_storage___boardLibrary));
  sub_100522AD8(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate____lazy_storage___boardPreviewImageCache));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate____lazy_storage___splitViewController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate____lazy_storage___sidebarViewController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate_boardViewControllerTransitioningDelegate));
  swift_unknownObjectWeakDestroy();
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate_welcomeControllerDidDismissContinuation, &qword_10168E108);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate____lazy_storage___stateRestorationUserActivity));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate____lazy_storage___handoffUserActivity));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate_acceptCloudKitShareAlertController));
  id v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate_downloadSharedCopyAlertController);
}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a6;
  uint64_t v10 = self;
  sub_100A8DECC();

  swift_unknownObjectRelease();
}

- (void)didTapWelcomeContinueButton:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_100A8E268();

  sub_100522F00((uint64_t)v6, &qword_101672BF0);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100A93298(v4);
}

- (void)qa_importFileFor:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v5 - 8, v6);
  id v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  type metadata accessor for MainActor();
  id v10 = a3;
  id v11 = self;
  id v12 = v10;
  id v13 = v11;
  uint64_t v14 = static MainActor.shared.getter();
  v15 = (void *)swift_allocObject();
  v15[2] = v14;
  v15[3] = &protocol witness table for MainActor;
  v15[4] = v12;
  v15[5] = v13;
  sub_1005912D0((uint64_t)v8, (uint64_t)&unk_10168E1F8, (uint64_t)v15);

  swift_release();
}

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  v2 = self;
  sub_100A95020();
  id v4 = v3;

  return (UIActivityItemsConfigurationReading *)v4;
}

@end