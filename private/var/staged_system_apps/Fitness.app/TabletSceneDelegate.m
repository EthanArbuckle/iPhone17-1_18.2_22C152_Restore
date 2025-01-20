@interface TabletSceneDelegate
- (BOOL)aggregatorShouldAllowEngagementBadging:(id)a3;
- (UIWindow)window;
- (_TtC10FitnessApp19TabletSceneDelegate)init;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setWindow:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4;
@end

@implementation TabletSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (_TtC10FitnessApp19TabletSceneDelegate)init
{
  return (_TtC10FitnessApp19TabletSceneDelegate *)sub_10059C524();
}

- (void).cxx_destruct
{
  swift_release();
  sub_1000656A0(*(void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_browsingCoordinator), *(void *)&self->window[OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_browsingCoordinator]);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_fitnessAppBadgeAggregator));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_wheelchairUseCache));
  id v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_seymourNotificationResponseCoordinator);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10059E21C(v8, v10);
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10059E538(v7);
}

- (void)sceneDidDisconnect:(id)a3
{
  sub_10007E4EC(*(void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_navigator) + 11, (*(void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_navigator))[14]);
  id v5 = a3;
  id v6 = self;
  dispatch thunk of MetricSceneLifecycleReporting.reportDidDisconnect()();
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_10007E2D8(0, (unint64_t *)&unk_1009633F0);
  sub_10059FB2C();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_10059E7B4(v6);

  swift_bridgeObjectRelease();
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10059EA24();
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10059ED90();
}

- (void)sceneDidEnterBackground:(id)a3
{
  (*(unsigned char **)((char *)&self->super.super.isa
             + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_fitnessAppBadgeAggregator))[OBJC_IVAR___CHFitnessAppBadgeAggregator_isBrowsingSeymour] = 0;
  sub_10007E4EC(*(void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_navigator) + 11, (*(void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_navigator))[14]);
  id v5 = a3;
  uint64_t v6 = self;
  dispatch thunk of MetricSceneLifecycleReporting.reportDidEnterBackground()();
}

- (BOOL)aggregatorShouldAllowEngagementBadging:(id)a3
{
  return 1;
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10059EEFC();
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_10059F634(v10, (uint64_t)v11, (void (**)(void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

@end