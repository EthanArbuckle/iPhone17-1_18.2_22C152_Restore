@interface GKPlayerInternal
+ (int)familiarity;
+ (unsigned)piecesToLoad;
- (void)updateWithCacheObject:(id)a3;
@end

@implementation GKPlayerInternal

- (void)updateWithCacheObject:(id)a3
{
  id v25 = a3;
  v4 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = +[NSThread callStackSymbols];
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKPlayerInternal(Cache) updateWithCacheObject:]", v5);
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation+Cache.m"];
    id v8 = [v7 lastPathComponent];
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v6, "-[GKPlayerInternal(Cache) updateWithCacheObject:]", [v8 UTF8String], 170);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }

  v10 = [v25 playerID];
  [(GKPlayerInternal *)self setPlayerID:v10];

  v11 = [v25 alias];
  [(GKPlayerInternal *)self setAlias:v11];

  v12 = [v25 avatarType];
  [(GKPlayerInternal *)self setAvatarType:v12];

  uint64_t v13 = [v25 friendLevel];
  v14 = (void *)v13;
  if (v13) {
    v15 = (_UNKNOWN **)v13;
  }
  else {
    v15 = &off_1002F2288;
  }
  [(GKPlayerInternal *)self setFriendLevel:v15];

  v16 = [v25 friendBiDirectional];
  [(GKPlayerInternal *)self setFriendBiDirectional:v16];

  v17 = [v25 friendPlayedWith];
  [(GKPlayerInternal *)self setFriendPlayedWith:v17];

  v18 = [v25 friendPlayedNearby];
  [(GKPlayerInternal *)self setFriendPlayedNearby:v18];

  v19 = [v25 acceptedGameInviteFromThisFriend];
  [(GKPlayerInternal *)self setAcceptedGameInviteFromThisFriend:v19];

  v20 = [v25 initiatedGameInviteToThisFriend];
  [(GKPlayerInternal *)self setInitiatedGameInviteToThisFriend:v20];

  v21 = [v25 automatchedTogether];
  [(GKPlayerInternal *)self setAutomatchedTogether:v21];

  v22 = [v25 imageURLDictionary];
  [(GKPlayerInternal *)self setPhotos:v22];

  -[GKPlayerInternal setNumberOfFriends:](self, "setNumberOfFriends:", (unsigned __int16)[v25 numberOfFriends]);
  -[GKPlayerInternal setNumberOfFriendsInCommon:](self, "setNumberOfFriendsInCommon:", (unsigned __int16)[v25 numberOfFriendsInCommon]);
  -[GKPlayerInternal setNumberOfGames:](self, "setNumberOfGames:", (unsigned __int16)[v25 numberOfGames]);
  -[GKPlayerInternal setNumberOfGamesInCommon:](self, "setNumberOfGamesInCommon:", (unsigned __int16)[v25 numberOfGamesInCommon]);
  -[GKPlayerInternal setNumberOfAchievements:](self, "setNumberOfAchievements:", [v25 numberOfAchievements]);
  -[GKPlayerInternal setNumberOfAchievementPoints:](self, "setNumberOfAchievementPoints:", [v25 numberOfAchievementPoints]);
  -[GKPlayerInternal setAchievementsVisibility:](self, "setAchievementsVisibility:", [v25 achievementsVisibility]);
  -[GKPlayerInternal setFriendsVisibility:](self, "setFriendsVisibility:", [v25 friendsVisibility]);
  -[GKPlayerInternal setGamesPlayedVisibility:](self, "setGamesPlayedVisibility:", [v25 gamesPlayedVisibility]);
  -[GKPlayerInternal setGlobalFriendListAccess:](self, "setGlobalFriendListAccess:", [v25 globalFriendListAccess]);
  -[GKPlayerInternal setIsArcadeSubscriber:](self, "setIsArcadeSubscriber:", [v25 isArcadeSubscriber]);
  -[GKPlayerInternal setContactsIntegrationConsent:](self, "setContactsIntegrationConsent:", [v25 contactsIntegrationConsent]);
  v23 = [v25 contactsAssociationID];
  [(GKPlayerInternal *)self setContactsAssociationID:v23];

  v24 = [v25 serviceLastUpdatedTimestamp];
  [(GKPlayerInternal *)self setServiceLastUpdatedTimestamp:v24];

  -[GKPlayerInternal setAllowReceivingFriendInvites:](self, "setAllowReceivingFriendInvites:", [v25 allowReceivingFriendInvites]);
  -[GKPlayerInternal setAllowChallengeFriendInvites:](self, "setAllowChallengeFriendInvites:", [v25 allowChallengeFriendInvites]);
  -[GKPlayerInternal setAllowMultiplayerFriendInvites:](self, "setAllowMultiplayerFriendInvites:", [v25 allowMultiplayerFriendInvites]);
}

+ (unsigned)piecesToLoad
{
  id v2 = [a1 familiarity];

  return +[GKPlayerProfileCacheObject piecesToLoadForFamiliarity:v2];
}

+ (int)familiarity
{
  return 0;
}

@end