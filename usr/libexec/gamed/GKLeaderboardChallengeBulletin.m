@interface GKLeaderboardChallengeBulletin
+ (BOOL)shouldProcessNotification;
+ (BOOL)supportsSecureCoding;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (GKLeaderboardChallengeBulletin)init;
- (GKLeaderboardChallengeBulletin)initWithCoder:(id)a3;
- (GKLeaderboardChallengeBulletin)initWithPushNotification:(id)a3;
- (void)handleAction:(id)a3;
@end

@implementation GKLeaderboardChallengeBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)handleAction:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  sub_1001DA74C();

  swift_bridgeObjectRelease();
}

+ (BOOL)shouldProcessNotification
{
  return sub_1001DAA6C() & 1;
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  v4 = _Block_copy(a4);
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v4);
  sub_1001DAB18(v5, ObjCClassMetadata, v4);
  _Block_release(v4);

  swift_bridgeObjectRelease();
}

- (GKLeaderboardChallengeBulletin)initWithPushNotification:(id)a3
{
  if (a3) {
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  return (GKLeaderboardChallengeBulletin *)sub_1001DCFC4(v3);
}

- (GKLeaderboardChallengeBulletin)init
{
  return (GKLeaderboardChallengeBulletin *)sub_1001DD134();
}

- (GKLeaderboardChallengeBulletin)initWithCoder:(id)a3
{
  return (GKLeaderboardChallengeBulletin *)sub_1001DD18C(a3);
}

@end