@interface FaceTimeNotificationProvider
- (_TtC13callservicesd28FaceTimeNotificationProvider)init;
- (void)handlePendingMessageDidReceiveCancelNotification:(id)a3;
- (void)handlePendingMessageDidReceiveInviteNotification:(id)a3;
@end

@implementation FaceTimeNotificationProvider

- (_TtC13callservicesd28FaceTimeNotificationProvider)init
{
}

- (void).cxx_destruct
{
  sub_100208490(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13callservicesd28FaceTimeNotificationProvider_updateBadgeValue));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd28FaceTimeNotificationProvider_contactsDataProvider));
  sub_100210614((uint64_t)self + OBJC_IVAR____TtC13callservicesd28FaceTimeNotificationProvider_badgeCategory, &qword_10058B240);
  sub_100208490(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13callservicesd28FaceTimeNotificationProvider_openURL));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd28FaceTimeNotificationProvider_notificationCenter));
  swift_bridgeObjectRelease();
  sub_100208490(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13callservicesd28FaceTimeNotificationProvider_add));
  sub_100208490(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13callservicesd28FaceTimeNotificationProvider_replace));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC13callservicesd28FaceTimeNotificationProvider_removeNotification);

  sub_100208490(v3);
}

- (void)handlePendingMessageDidReceiveInviteNotification:(id)a3
{
}

- (void)handlePendingMessageDidReceiveCancelNotification:(id)a3
{
}

@end