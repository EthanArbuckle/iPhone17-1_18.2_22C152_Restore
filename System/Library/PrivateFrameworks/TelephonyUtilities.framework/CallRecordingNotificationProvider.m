@interface CallRecordingNotificationProvider
- (_TtC13callservicesd33CallRecordingNotificationProvider)init;
- (void)handleCallRecordingStateChangedWithNotification:(id)a3;
@end

@implementation CallRecordingNotificationProvider

- (void)handleCallRecordingStateChangedWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1002F2354((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC13callservicesd33CallRecordingNotificationProvider)init
{
}

- (void).cxx_destruct
{
  sub_100208490(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13callservicesd33CallRecordingNotificationProvider_updateBadgeValue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd33CallRecordingNotificationProvider_queue));
  sub_100210614((uint64_t)self + OBJC_IVAR____TtC13callservicesd33CallRecordingNotificationProvider_badgeCategory, &qword_10058B240);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd33CallRecordingNotificationProvider_notificationCenter));
  swift_bridgeObjectRelease();
  sub_100208490(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13callservicesd33CallRecordingNotificationProvider_add));
  sub_100208490(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13callservicesd33CallRecordingNotificationProvider_replace));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC13callservicesd33CallRecordingNotificationProvider_removeNotification);

  sub_100208490(v3);
}

@end