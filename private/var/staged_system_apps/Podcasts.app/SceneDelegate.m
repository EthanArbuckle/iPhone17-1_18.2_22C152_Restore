@interface SceneDelegate
- (_TtC8Podcasts13SceneDelegate)init;
- (id)stateRestorationActivityForScene:(id)a3;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 restoreInteractionStateWithUserActivity:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation SceneDelegate

- (void)scene:(id)a3 restoreInteractionStateWithUserActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  [v6 setUserActivity:v7];
  sub_100023A04(v7);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10002EE4C(v8, v10);
}

- (_TtC8Podcasts13SceneDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneDelegate();
  return [(SceneDelegate *)&v3 init];
}

- (void)sceneWillEnterForeground:(id)a3
{
}

- (void)sceneDidBecomeActive:(id)a3
{
}

- (void)sceneWillResignActive:(id)a3
{
}

- (void)sceneDidEnterBackground:(id)a3
{
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_10004D29C(0, &qword_1005FECE8);
  sub_10002F7C8(&qword_1005FECF0, &qword_1005FECE8);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_1002A5BD0(v6);

  swift_bridgeObjectRelease();
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100023A04(v7);
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = a3;
  id v10 = self;
  sub_1002A64F0(v6, v8);

  swift_bridgeObjectRelease();
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  id v11 = a3;
  id v13 = a5;
  v12 = self;
  sub_1002A66D8(v8, v10);

  swift_bridgeObjectRelease();
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  sub_1002A68D4(v10, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (id)stateRestorationActivityForScene:(id)a3
{
  v5 = self;
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = [v5 sharedApplication];
  [v8 ignoreSnapshotOnNextApplicationLaunch];

  id v9 = [v6 userActivity];

  return v9;
}

@end