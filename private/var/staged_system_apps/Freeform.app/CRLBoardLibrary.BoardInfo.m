@interface CRLBoardLibrary.BoardInfo
- (void)activeParticipantListChangedNotification:(id)a3;
- (void)shareStateUpdatedWithShare:(id)a3;
@end

@implementation CRLBoardLibrary.BoardInfo

- (void)activeParticipantListChangedNotification:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  sub_100F0473C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

- (void)shareStateUpdatedWithShare:(id)a3
{
  id v4 = a3;
  swift_retain();
  sub_100F0E550(a3);

  swift_release();
}

@end