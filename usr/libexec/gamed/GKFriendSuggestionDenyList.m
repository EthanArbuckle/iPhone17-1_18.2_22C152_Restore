@interface GKFriendSuggestionDenyList
+ (GKFriendSuggestionDenyList)empty;
- (GKFriendSuggestionDenyList)init;
- (GKFriendSuggestionDenyList)initWithContactIDs:(id)a3 playerIDs:(id)a4;
- (NSSet)contactIDs;
- (NSSet)playerIDs;
@end

@implementation GKFriendSuggestionDenyList

+ (GKFriendSuggestionDenyList)empty
{
  id v2 = sub_1001A046C();

  return (GKFriendSuggestionDenyList *)v2;
}

- (NSSet)contactIDs
{
  return (NSSet *)sub_1001A052C((uint64_t)self, (uint64_t)a2, (void (*)(void))FriendSuggestionDenyList.contactIDs.getter);
}

- (NSSet)playerIDs
{
  return (NSSet *)sub_1001A052C((uint64_t)self, (uint64_t)a2, (void (*)(void))FriendSuggestionDenyList.playerIDs.getter);
}

- (GKFriendSuggestionDenyList)initWithContactIDs:(id)a3 playerIDs:(id)a4
{
  uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  return (GKFriendSuggestionDenyList *)sub_1001A0598(v4, v5);
}

- (GKFriendSuggestionDenyList)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end