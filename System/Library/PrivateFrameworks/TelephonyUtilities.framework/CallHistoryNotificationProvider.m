@interface CallHistoryNotificationProvider
- (NSString)description;
- (_TtC13callservicesd31CallHistoryNotificationProvider)init;
- (void)callInteractionsDidChangeForManager:(id)a3;
- (void)handleCallHistoryDatabaseChangedWithNotification:(id)a3;
@end

@implementation CallHistoryNotificationProvider

- (_TtC13callservicesd31CallHistoryNotificationProvider)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_callInteractionManager));
  sub_1002018DC((uint64_t)self + OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_callHistoryDataSource);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_callProviderManager));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100235804((uint64_t)self + OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_mostRecentCallDate, &qword_100584B40);
  sub_1002018DC((uint64_t)self + OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_contactStore);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_inCallServiceProcessObserver));
  swift_release();
  swift_release();
  sub_100235C28(OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_dialRecentCall);
  sub_100235C28(OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_findConversationLink);
  sub_100235C28(OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_blockHandles);
  swift_unknownObjectRelease();
  sub_100235C28(OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_add);
  sub_100235C28(OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_replace);
  sub_100235C28(OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_removeNotification);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC13callservicesd31CallHistoryNotificationProvider_updateBadgeValue);

  sub_100208490(v3);
}

- (void)callInteractionsDidChangeForManager:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1002DCA94();
  swift_unknownObjectRelease();
}

- (void)handleCallHistoryDatabaseChangedWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1002DCBD8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (NSString)description
{
  v2 = self;
  sub_1002DD34C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end