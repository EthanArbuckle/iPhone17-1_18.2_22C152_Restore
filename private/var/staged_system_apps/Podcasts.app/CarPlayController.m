@interface CarPlayController
- (CarPlayController)init;
- (void)proxyShouldShowDialogForReason:(int64_t)a3 podcastTitle:(id)a4;
- (void)sceneDidBecomeActive:(id)a3;
- (void)templateApplicationScene:(id)a3 didConnectInterfaceController:(id)a4;
- (void)templateWillAppear:(id)a3 animated:(BOOL)a4;
@end

@implementation CarPlayController

- (CarPlayController)init
{
  return (CarPlayController *)CarPlayController.init()();
}

- (void).cxx_destruct
{
  swift_release();

  sub_100054B1C((uint64_t)self + OBJC_IVAR___CarPlayController_nowPlayingController, &qword_1005F9D38);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_100054B1C((uint64_t)self + OBJC_IVAR___CarPlayController_activeTemplateProvider, &qword_1005F9E98);
  swift_release();
  swift_release();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CarPlayController_tabBarTemplate);
}

- (void)templateApplicationScene:(id)a3 didConnectInterfaceController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001EAFE8(v7);
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s8Podcasts17CarPlayControllerC20sceneDidBecomeActiveyySo7UISceneCF_0();
}

- (void)templateWillAppear:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  _s8Podcasts17CarPlayControllerC18templateWillAppear_8animatedySo10CPTemplateC_SbtF_0(v5);
}

- (void)proxyShouldShowDialogForReason:(int64_t)a3 podcastTitle:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = self;
  CarPlayController.proxyShouldShowDialog(for:podcastTitle:)(a3);

  swift_bridgeObjectRelease();
}

@end