@interface UserNotificationServiceImpl
- (_TtC34SiriCrossDeviceArbitrationFeedback27UserNotificationServiceImpl)init;
@end

@implementation UserNotificationServiceImpl

- (_TtC34SiriCrossDeviceArbitrationFeedback27UserNotificationServiceImpl)init
{
}

- (void).cxx_destruct
{
  sub_25C75F8D0((uint64_t)self + OBJC_IVAR____TtC34SiriCrossDeviceArbitrationFeedback27UserNotificationServiceImpl_notificationCenter, &qword_26B3535D8);
  sub_25C75F0CC((uint64_t)self + OBJC_IVAR____TtC34SiriCrossDeviceArbitrationFeedback27UserNotificationServiceImpl_delegate);
  swift_unknownObjectRelease();
  sub_25C75F8D0((uint64_t)self + OBJC_IVAR____TtC34SiriCrossDeviceArbitrationFeedback27UserNotificationServiceImpl_currentRequest, (uint64_t *)&unk_26B3535F8);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC34SiriCrossDeviceArbitrationFeedback27UserNotificationServiceImpl_timer);
}

@end