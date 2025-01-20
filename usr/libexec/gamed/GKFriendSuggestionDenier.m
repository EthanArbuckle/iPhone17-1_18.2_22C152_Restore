@interface GKFriendSuggestionDenier
- (GKFriendSuggestionDenier)init;
- (id)initInMemory:(BOOL)a3 legacyDenier:(id)a4;
- (void)clearDenyList;
- (void)deleteAllWithCompletionHandler:(id)a3;
- (void)denyContactID:(NSString *)a3 completionHandler:(id)a4;
- (void)denyListWithCompletionHandler:(id)a3;
- (void)denyPlayerID:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation GKFriendSuggestionDenier

- (GKFriendSuggestionDenier)init
{
  return (GKFriendSuggestionDenier *)FriendSuggestionDenier.init()();
}

- (id)initInMemory:(BOOL)a3 legacyDenier:(id)a4
{
  return FriendSuggestionDenier.init(inMemory:legacyDenier:)(a3, a4);
}

- (void)clearDenyList
{
  v2 = self;
  sub_1001A0BDC();
}

- (void)denyContactID:(NSString *)a3 completionHandler:(id)a4
{
}

- (void)denyPlayerID:(NSString *)a3 completionHandler:(id)a4
{
}

- (void)denyListWithCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)deleteAllWithCompletionHandler:(id)a3
{
}

@end