@interface CSDUserNotificationController
- (CSDUserNotificationController)init;
- (CSDUserNotificationController)initWithCallFilterController:(id)a3;
- (void)dealloc;
- (void)momentCapturedForStreamToken:(int64_t)a3 requesterID:(id)a4 reply:(id)a5;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation CSDUserNotificationController

- (CSDUserNotificationController)initWithCallFilterController:(id)a3
{
  id v3 = a3;
  sub_10035D19C();
  return result;
}

- (void)dealloc
{
  v2 = self;
  sub_10035D470();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  swift_release();
}

- (CSDUserNotificationController)init
{
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  *(void *)(swift_allocObject() + 16) = v8;
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_10035E594();

  swift_release();
}

- (void)momentCapturedForStreamToken:(int64_t)a3 requesterID:(id)a4 reply:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  _Block_copy(v7);
  v11 = self;
  sub_10035EC14(a3, v8, v10, (uint64_t)v11, (void (**)(void, void))v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

@end