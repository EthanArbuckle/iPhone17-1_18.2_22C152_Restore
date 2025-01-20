@interface GKRemoveAllFriendsNetworkRequest
+ (id)bagKey;
- (id)initRequest;
@end

@implementation GKRemoveAllFriendsNetworkRequest

+ (id)bagKey
{
  return @"gk-remove-all-friends";
}

- (id)initRequest
{
  v3.receiver = self;
  v3.super_class = (Class)GKRemoveAllFriendsNetworkRequest;
  return [(GKRemoveFriendNetworkRequest *)&v3 initWithFriendPlayerID:&stru_1002E4F58];
}

@end