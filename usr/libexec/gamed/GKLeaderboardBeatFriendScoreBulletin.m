@interface GKLeaderboardBeatFriendScoreBulletin
+ (BOOL)supportsSecureCoding;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (GKLeaderboardBeatFriendScoreBulletin)init;
- (GKLeaderboardBeatFriendScoreBulletin)initWithCoder:(id)a3;
- (GKLeaderboardBeatFriendScoreBulletin)initWithPushNotification:(id)a3;
- (void)handleAction:(id)a3;
@end

@implementation GKLeaderboardBeatFriendScoreBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)handleAction:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  v4 = _Block_copy(a4);
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v4);
  sub_1001CC69C(v5, ObjCClassMetadata, (void (**)(void, void))v4);
  _Block_release(v4);

  swift_bridgeObjectRelease();
}

- (GKLeaderboardBeatFriendScoreBulletin)initWithPushNotification:(id)a3
{
  if (a3) {
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  return (GKLeaderboardBeatFriendScoreBulletin *)sub_1001CD4F0(v3);
}

- (GKLeaderboardBeatFriendScoreBulletin)init
{
  return (GKLeaderboardBeatFriendScoreBulletin *)sub_1001CD5E8();
}

- (GKLeaderboardBeatFriendScoreBulletin)initWithCoder:(id)a3
{
  return (GKLeaderboardBeatFriendScoreBulletin *)sub_1001CD640(a3);
}

@end