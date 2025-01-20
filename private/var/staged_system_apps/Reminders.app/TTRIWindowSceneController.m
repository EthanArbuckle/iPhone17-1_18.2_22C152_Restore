@interface TTRIWindowSceneController
- (TTRIWindowSceneController)init;
- (id)stateRestorationActivityForScene:(id)a3;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
- (void)windowScene:(id)a3 userDidAcceptCloudKitShareWithMetadata:(id)a4;
@end

@implementation TTRIWindowSceneController

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001A6D4(v4);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001B3D4(v4);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10001F568(v8, v9, v10);
}

- (TTRIWindowSceneController)init
{
  sub_1000178C8();
  return result;
}

- (void).cxx_destruct
{
  sub_1000499D4((uint64_t)self + OBJC_IVAR___TTRIWindowSceneController_delegate);

  sub_10003B6F8((uint64_t)self + OBJC_IVAR___TTRIWindowSceneController_rootModuleInterface, &qword_100799F30);
  sub_10003B6F8((uint64_t)self + OBJC_IVAR___TTRIWindowSceneController_lastEnterForegroundDate, &qword_100799F20);
  swift_unknownObjectRelease();

  swift_release();

  swift_unknownObjectRelease();
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100656A2C(v4);
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100656EE8(v4);
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100657184(v4);
}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_100657794(v4);

  return v6;
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  id v9 = a3;
  id v10 = self;
  sub_10065863C(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  sub_100657CAC(v6, v7);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_1000368FC(0, &qword_1007A8DE0);
  sub_100020484(&qword_1007AD720, &qword_1007A8DE0);
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  id v7 = self;
  sub_100658038(v6);

  swift_bridgeObjectRelease();
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  unint64_t v8 = (void (**)(void *, void))_Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  v12 = self;
  BOOL v11 = sub_100652C58(v10);
  ((void (**)(void *, BOOL))v8)[2](v8, v11);
  _Block_release(v8);
}

- (void)windowScene:(id)a3 userDidAcceptCloudKitShareWithMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  sub_1006588D0(v7);
}

@end