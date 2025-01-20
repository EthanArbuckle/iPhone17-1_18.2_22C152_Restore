@interface GKFriendBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (GKFriendBulletin)init;
- (GKFriendBulletin)initWithCoder:(id)a3;
- (GKFriendBulletin)initWithPushNotification:(id)a3;
- (void)handleAction:(id)a3;
@end

@implementation GKFriendBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  v4 = _Block_copy(a4);
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v4);
  sub_10018796C(v5, ObjCClassMetadata, (void (**)(void, void))v4);
  _Block_release(v4);

  swift_bridgeObjectRelease();
}

- (void)handleAction:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  sub_10018A90C();
  swift_bridgeObjectRelease();
}

- (GKFriendBulletin)initWithPushNotification:(id)a3
{
  if (a3) {
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  return (GKFriendBulletin *)sub_10018BBD8(v3);
}

- (GKFriendBulletin)init
{
  return (GKFriendBulletin *)sub_10018BCD0();
}

- (GKFriendBulletin)initWithCoder:(id)a3
{
  return (GKFriendBulletin *)sub_10018BD28(a3);
}

@end