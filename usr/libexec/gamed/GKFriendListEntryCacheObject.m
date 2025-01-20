@interface GKFriendListEntryCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKFriendListEntryCacheObject

- (id)internalRepresentation
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKFriendListEntryCacheObject internalRepresentation]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKFriendListEntryCacheObject internalRepresentation]", [v7 UTF8String], 2611);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  v9 = [(GKFriendListEntryCacheObject *)self playerID];
  v10 = [(GKFriendListEntryCacheObject *)self managedObjectContext];
  v11 = +[GKPlayerProfileCacheObject playerProfileWithPlayerID:v9 inManagedObjectContext:v10];

  id v12 = [objc_alloc((Class)GKFriendPlayerInternal) initWithCacheObject:v11];

  return v12;
}

+ (id)entityName
{
  return @"FriendEntry";
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v6 = +[NSThread callStackSymbols];
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKFriendListEntryCacheObject updateWithServerRepresentation:]", v6);
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v7, "-[GKFriendListEntryCacheObject updateWithServerRepresentation:]", [v9 UTF8String], 2623);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }

  v24.receiver = self;
  v24.super_class = (Class)GKFriendListEntryCacheObject;
  [(GKCacheObject *)&v24 updateWithServerRepresentation:v4];
  v11 = [v4 objectForKeyedSubscript:@"player-id"];
  [(GKFriendListEntryCacheObject *)self setPlayerID:v11];

  id v12 = [v4 objectForKeyedSubscript:@"played-with"];
  -[GKFriendListEntryCacheObject setFriendPlayedWith:](self, "setFriendPlayedWith:", [v12 BOOLValue]);

  v13 = [v4 objectForKeyedSubscript:@"bi-directional"];
  -[GKFriendListEntryCacheObject setFriendBiDirectional:](self, "setFriendBiDirectional:", [v13 BOOLValue]);

  v14 = [v4 objectForKeyedSubscript:@"played-nearby"];
  -[GKFriendListEntryCacheObject setFriendPlayedNearby:](self, "setFriendPlayedNearby:", [v14 BOOLValue]);

  v15 = [v4 objectForKeyedSubscript:@"accepted-game-invitation"];
  -[GKFriendListEntryCacheObject setAcceptedGameInviteFromThisFriend:](self, "setAcceptedGameInviteFromThisFriend:", [v15 BOOLValue]);

  v16 = [v4 objectForKeyedSubscript:@"initiated-game-invitation"];
  -[GKFriendListEntryCacheObject setInitiatedGameInviteToThisFriend:](self, "setInitiatedGameInviteToThisFriend:", [v16 BOOLValue]);

  v17 = [v4 objectForKeyedSubscript:@"automatched-together"];
  -[GKFriendListEntryCacheObject setAutomatchedTogether:](self, "setAutomatchedTogether:", [v17 BOOLValue]);

  v18 = [v4 objectForKeyedSubscript:@"challenged-together"];
  -[GKFriendListEntryCacheObject setChallengedTogether:](self, "setChallengedTogether:", [v18 BOOLValue]);

  v19 = [v4 objectForKeyedSubscript:@"last-challenged-timestamp"];
  v20 = +[NSDate _gkDateFromServerTimestamp:v19];
  [(GKFriendListEntryCacheObject *)self setLastChallengedDate:v20];

  v21 = [v4 objectForKeyedSubscript:@"last-challenged-game"];
  [(GKFriendListEntryCacheObject *)self setLastChallengedGame:v21];

  v22 = [v4 objectForKeyedSubscript:GKContactsAssociationIDKey];
  v23 = +[GKContactsIntegrationUserSettings associationIDFromServerResult:v22];
  [(GKFriendListEntryCacheObject *)self setContactAssociationID:v23];
}

@end