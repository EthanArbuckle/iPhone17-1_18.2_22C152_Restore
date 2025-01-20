@interface LocalNotificationCenterImpl
- (_TtC34SiriCrossDeviceArbitrationFeedback27LocalNotificationCenterImpl)init;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation LocalNotificationCenterImpl

- (_TtC34SiriCrossDeviceArbitrationFeedback27LocalNotificationCenterImpl)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34SiriCrossDeviceArbitrationFeedback27LocalNotificationCenterImpl_center));
  sub_25C75F0CC((uint64_t)self + OBJC_IVAR____TtC34SiriCrossDeviceArbitrationFeedback27LocalNotificationCenterImpl_delegate);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC34SiriCrossDeviceArbitrationFeedback27LocalNotificationCenterImpl_queue);
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_25C777B9C((uint64_t)v9, (uint64_t)v10, (uint64_t)v11, (void (**)(void, void))v8);
  _Block_release(v8);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  LocalNotificationCenterImpl.userNotificationCenter(_:didReceive:withCompletionHandler:)((uint64_t)v10, (uint64_t)v11, (uint64_t)sub_25C77828C, v9);

  swift_release();
}

@end