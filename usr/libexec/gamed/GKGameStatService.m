@interface GKGameStatService
+ (Class)interfaceClass;
+ (id)friendsRequiringHydration:(id)a3;
+ (id)getFriendsWhoHaveTheseAchievementsPredicate:(id)a3 playerID:(id)a4 gameBundleID:(id)a5;
+ (id)leaderboards:(id)a3 filteredWithIDs:(id)a4;
+ (unint64_t)requiredEntitlements;
- (id)getFriendsWhoHaveTheseAchievements:(id)a3 playerID:(id)a4 gameBundleID:(id)a5 context:(id)a6;
- (id)playerScopeName:(int64_t)a3;
- (id)timeScopeName:(int64_t)a3;
- (id)updateSigningStatusIfChanged:(id)a3;
- (void)_getRecentMatchesForGameDescriptor:(id)a3 type:(int)a4 reference:(id)a5 handler:(id)a6;
- (void)achievementsForPlayersAndGameDescriptor:(id)a3 players:(id)a4 context:(id)a5 handler:(id)a6;
- (void)cleanUpLeaderboardTitles:(id)a3 set:(id)a4 context:(id)a5;
- (void)createLeaderboardBasedOnID:(id)a3 recipients:(id)a4 inviteMessage:(id)a5 context:(id)a6 duration:(double)a7 handler:(id)a8;
- (void)deleteLeaderboardWithID:(id)a3 handler:(id)a4;
- (void)endLeaderboardWithID:(id)a3 handler:(id)a4;
- (void)fetchAchievementDescriptionsForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5;
- (void)fetchAchievementsForGameDescriptor:(id)a3 players:(id)a4 context:(id)a5 handler:(id)a6;
- (void)fetchLeaderboardWithRecordID:(id)a3 context:(id)a4 handler:(id)a5;
- (void)fetchLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 setIdentifier:(id)a5 context:(id)a6 handler:(id)a7;
- (void)fetchRecentGamesBetweenPlayer:(id)a3 otherPlayer:(id)a4 context:(id)a5 handler:(id)a6;
- (void)fetchRecentPlayersWithPlayer:(id)a3 game:(id)a4 context:(id)a5 handler:(id)a6;
- (void)generateEntriesFromServerResponse:(id)a3 context:(id)a4 leaderboard:(id)a5 handler:(id)a6;
- (void)getAchievementDescriptionsForGameDescriptor:(id)a3 handler:(id)a4;
- (void)getAchievementsForGameDescriptor:(id)a3 players:(id)a4 handler:(id)a5;
- (void)getDefaultLeaderboardIDWithHandler:(id)a3;
- (void)getEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 handler:(id)a10;
- (void)getEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 locale:(id)a10 handler:(id)a11;
- (void)getLeaderboardForRequest:(id)a3 handler:(id)a4;
- (void)getLeaderboardSetsForGameDescriptor:(id)a3 handler:(id)a4;
- (void)getLeaderboardSummaryForGameDescriptor:(id)a3 localPlayer:(id)a4 baseLeaderboardID:(id)a5 leaderboardID:(id)a6 timeScope:(int64_t)a7 handler:(id)a8;
- (void)getLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 leaderboardIDs:(id)a5 setIdentifier:(id)a6 handler:(id)a7;
- (void)getLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 setIdentifier:(id)a5 handler:(id)a6;
- (void)getPreviousInstanceForLeaderboard:(id)a3 gameDescriptor:(id)a4 player:(id)a5 handler:(id)a6;
- (void)getRecentGamesWithPlayer:(id)a3 handler:(id)a4;
- (void)getRecentMatchesForGameDescriptor:(id)a3 achievementIdentifier:(id)a4 handler:(id)a5;
- (void)getRecentMatchesForGameDescriptor:(id)a3 includeCompatibleMultiplayerGames:(BOOL)a4 handler:(id)a5;
- (void)getRecentMatchesForGameDescriptor:(id)a3 leaderboardIdentifier:(id)a4 handler:(id)a5;
- (void)getRecentMatchesForGameDescriptor:(id)a3 otherPlayer:(id)a4 handler:(id)a5;
- (void)getRecentPlayersForGameDescriptor:(id)a3 handler:(id)a4;
- (void)getRecentPlayersWithHandler:(id)a3;
- (void)loadAchievementDescriptionsForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5;
- (void)loadAchievementsForGameDescriptor:(id)a3 players:(id)a4 context:(id)a5 handler:(id)a6;
- (void)loadEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 context:(id)a10 handler:(id)a11;
- (void)loadEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 context:(id)a10 locale:(id)a11 handler:(id)a12;
- (void)loadLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 setIdentifier:(id)a5 context:(id)a6 bagKey:(id)a7 handler:(id)a8;
- (void)loadPreviousInstanceForLeaderboard:(id)a3 gameDescriptor:(id)a4 player:(id)a5 playerPlayedIn:(BOOL)a6 context:(id)a7 handler:(id)a8;
- (void)loadRecentGamesBetweenPlayer:(id)a3 otherPlayer:(id)a4 context:(id)a5 handler:(id)a6;
- (void)loadRecentPlayersWithPlayer:(id)a3 game:(id)a4 context:(id)a5 handler:(id)a6;
- (void)mixinHasActiveChallengesWithLeaderboards:(id)a3 playerID:(id)a4 bundleID:(id)a5 completionHandler:(id)a6;
- (void)primeCacheWithAchievementDescriptions:(id)a3 context:(id)a4 gameDescriptor:(id)a5 players:(id)a6 missingPlayers:(id)a7;
- (void)resetAchievementsWithHandler:(id)a3;
- (void)setDefaultLeaderboardID:(id)a3 handler:(id)a4;
- (void)startLeaderboardWithID:(id)a3 handler:(id)a4;
- (void)submitAchievements:(id)a3 whileScreeningChallenges:(BOOL)a4 withEligibleChallenges:(id)a5 handler:(id)a6;
- (void)submitInstanceScore:(int64_t)a3 context:(unint64_t)a4 leaderboard:(id)a5 forPlayer:(id)a6 whileScreeningChallenges:(BOOL)a7 withEligibleChallenges:(id)a8 handler:(id)a9;
- (void)submitScore:(int64_t)a3 context:(unint64_t)a4 leaderboardIDs:(id)a5 forPlayer:(id)a6 whileScreeningChallenges:(BOOL)a7 withEligibleChallenges:(id)a8 gameDescriptor:(id)a9 handler:(id)a10;
- (void)submitScores:(id)a3 whileScreeningChallenges:(BOOL)a4 withEligibleChallenges:(id)a5 handler:(id)a6;
- (void)updateLeaderboardsWithIDs:(id)a3 gameDescriptor:(id)a4 player:(id)a5 context:(id)a6 handler:(id)a7;
- (void)updatePlayersForEntries:(id)a3 localPlayerEntry:(id)a4 handler:(id)a5;
@end

@implementation GKGameStatService

+ (unint64_t)requiredEntitlements
{
  return 16;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class();
}

- (void)_getRecentMatchesForGameDescriptor:(id)a3 type:(int)a4 reference:(id)a5 handler:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [a3 dictionaryForRequest];
  if (!v12)
  {
    v13 = [(GKService *)self clientProxy];
    v12 = [v13 gameDescriptor];
  }
  uint64_t v14 = [v12 objectForKeyedSubscript:@"bundle-id"];
  v31 = (void *)v14;
  if (v7 == 3)
  {
    v15 = +[NSPredicate predicateWithFormat:@"game.bundleID = %@ AND type = %d AND reference = %@", v14, 3, v10, v14];
    v46[0] = @"game";
    v46[1] = @"match-type";
    v47[0] = v12;
    v47[1] = @"achievement-compatible";
    v46[2] = @"achievement-id";
    v47[2] = v10;
    v16 = v47;
    v17 = v46;
  }
  else
  {
    if (v7 != 2)
    {
      if (v7 == 1)
      {
        v15 = +[NSPredicate predicateWithFormat:@"game.bundleID = %@ AND type = %d", v14, 1];
        v50[0] = @"game";
        v50[1] = @"match-type";
        v51[0] = v12;
        v51[1] = @"multiplayer-compatible";
        v16 = v51;
        v17 = v50;
      }
      else
      {
        v15 = +[NSPredicate predicateWithFormat:@"game.bundleID = %@ AND type = %d", v14, v7];
        v44[0] = @"game";
        v44[1] = @"match-type";
        v45[0] = v12;
        v45[1] = @"exact-match";
        v16 = v45;
        v17 = v44;
      }
      uint64_t v18 = 2;
      goto LABEL_12;
    }
    v15 = +[NSPredicate predicateWithFormat:@"game.bundleID = %@ AND type = %d AND reference = %@", v14, 2, v10, v14];
    v48[0] = @"game";
    v48[1] = @"match-type";
    v49[0] = v12;
    v49[1] = @"leaderboard-compatible";
    v48[2] = @"leaderboard-id";
    v49[2] = v10;
    v16 = v49;
    v17 = v48;
  }
  uint64_t v18 = 3;
LABEL_12:
  v19 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v17 count:v18];
  v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 118, "-[GKGameStatService _getRecentMatchesForGameDescriptor:type:reference:handler:]");
  v21 = [(GKService *)self transactionGroupWithName:v20];

  v22 = [(GKService *)self clientProxy];
  v23 = [v22 replyQueue];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100065848;
  v36[3] = &unk_1002D6BA8;
  id v24 = v21;
  id v37 = v24;
  id v25 = v15;
  id v38 = v25;
  id v26 = v19;
  id v39 = v26;
  v40 = self;
  int v43 = v7;
  id v27 = v10;
  id v41 = v27;
  id v28 = v12;
  id v42 = v28;
  [v24 performOnQueue:v23 block:v36];

  if (v11)
  {
    v29 = [(GKService *)self clientProxy];
    v30 = [v29 replyQueue];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100066238;
    v32[3] = &unk_1002D3A48;
    id v33 = v24;
    v34 = self;
    id v35 = v11;
    [v33 notifyOnQueue:v30 block:v32];
  }
}

- (void)getRecentMatchesForGameDescriptor:(id)a3 leaderboardIdentifier:(id)a4 handler:(id)a5
{
}

- (void)getRecentMatchesForGameDescriptor:(id)a3 achievementIdentifier:(id)a4 handler:(id)a5
{
}

- (void)getRecentMatchesForGameDescriptor:(id)a3 includeCompatibleMultiplayerGames:(BOOL)a4 handler:(id)a5
{
}

- (void)fetchRecentPlayersWithPlayer:(id)a3 game:(id)a4 context:(id)a5 handler:(id)a6
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100066608;
  v14[3] = &unk_1002D39A8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  uint64_t v18 = self;
  id v19 = a6;
  id v10 = v19;
  id v11 = v17;
  id v12 = v16;
  id v13 = v15;
  [v11 performBlock:v14];
}

- (void)fetchRecentGamesBetweenPlayer:(id)a3 otherPlayer:(id)a4 context:(id)a5 handler:(id)a6
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000668DC;
  v14[3] = &unk_1002D39A8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  uint64_t v18 = self;
  id v19 = a6;
  id v10 = v19;
  id v11 = v17;
  id v12 = v16;
  id v13 = v15;
  [v11 performBlock:v14];
}

- (void)loadRecentPlayersWithPlayer:(id)a3 game:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 296, "-[GKGameStatService loadRecentPlayersWithPlayer:game:context:handler:]");
  id v15 = [(GKService *)self clientProxy];
  id v16 = +[GKCacheTransactionGroup transactionGroupWithName:v14 context:v12 client:v15];

  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  id v17 = +[GKPreferences shared];
  id v18 = [v17 maxRecentPlayersCount];
  [v17 maxRecentPlayersTime];
  +[NSDate dateWithTimeIntervalSinceNow:-v19];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100066D74;
  v32[3] = &unk_1002D6C70;
  id v39 = v18;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v33 = v20;
  id v21 = v11;
  id v34 = v21;
  id v35 = self;
  id v38 = v40;
  id v22 = v16;
  id v36 = v22;
  id v23 = v10;
  id v37 = v23;
  [v22 performOnManagedObjectContext:v32];
  id v24 = [(GKService *)self clientProxy];
  id v25 = [v24 replyQueue];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000679B8;
  v28[3] = &unk_1002D4248;
  id v26 = v13;
  id v30 = v26;
  v31 = v40;
  id v27 = v22;
  id v29 = v27;
  [v27 notifyOnQueue:v25 block:v28];

  _Block_object_dispose(v40, 8);
}

- (void)loadRecentGamesBetweenPlayer:(id)a3 otherPlayer:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 375, "-[GKGameStatService loadRecentGamesBetweenPlayer:otherPlayer:context:handler:]");
  id v15 = [(GKService *)self clientProxy];
  id v16 = +[GKCacheTransactionGroup transactionGroupWithName:v14 context:v12 client:v15];

  v50[0] = 0;
  v50[1] = v50;
  void v50[2] = 0x2020000000;
  v50[3] = 0;
  id v17 = +[GKPreferences shared];
  id v18 = [v17 maxRecentPlayersCount];
  [v17 maxRecentPlayersTime];
  id v20 = +[NSDate dateWithTimeIntervalSinceNow:-v19];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  void v45[2] = sub_100067D98;
  v45[3] = &unk_1002D6C98;
  id v21 = v16;
  id v46 = v21;
  id v49 = v18;
  id v22 = v20;
  id v47 = v22;
  id v23 = v11;
  id v48 = v23;
  [v12 performBlockAndWait:v45];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100067EA8;
  v37[3] = &unk_1002D6CC0;
  id v24 = v21;
  id v38 = v24;
  id v39 = self;
  v44 = v50;
  id v25 = v12;
  id v40 = v25;
  id v26 = v10;
  id v41 = v26;
  id v27 = v23;
  id v42 = v27;
  id v28 = v22;
  id v43 = v28;
  [v24 perform:v37];
  id v29 = [(GKService *)self clientProxy];
  id v30 = [v29 replyQueue];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000689EC;
  v33[3] = &unk_1002D4248;
  id v31 = v13;
  id v35 = v31;
  id v36 = v50;
  id v32 = v24;
  id v34 = v32;
  [v32 notifyOnQueue:v30 block:v33];

  _Block_object_dispose(v50, 8);
}

- (void)getRecentPlayersForGameDescriptor:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 453, "-[GKGameStatService getRecentPlayersForGameDescriptor:handler:]");
  v9 = [(GKService *)self transactionGroupWithName:v8];

  id v10 = [(GKService *)self clientProxy];
  id v11 = [v10 replyQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100068C48;
  v19[3] = &unk_1002D3980;
  id v12 = v9;
  id v20 = v12;
  id v13 = v6;
  id v21 = v13;
  id v22 = self;
  [v12 performOnQueue:v11 block:v19];

  if (v7)
  {
    uint64_t v14 = [(GKService *)self clientProxy];
    id v15 = [v14 replyQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000694F0;
    v16[3] = &unk_1002D3930;
    id v18 = v7;
    id v17 = v12;
    [v17 notifyOnQueue:v15 block:v16];
  }
}

- (void)getRecentGamesWithPlayer:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 507, "-[GKGameStatService getRecentGamesWithPlayer:handler:]");
  id v7 = [(GKService *)self transactionGroupWithName:v6];

  v8 = [(GKService *)self clientProxy];
  v9 = [v8 replyQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100069750;
  v16[3] = &unk_1002D3A70;
  id v10 = v7;
  id v17 = v10;
  id v18 = self;
  [v10 performOnQueue:v9 block:v16];

  if (v5)
  {
    id v11 = [(GKService *)self clientProxy];
    id v12 = [v11 replyQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100069F98;
    v13[3] = &unk_1002D3930;
    id v15 = v5;
    id v14 = v10;
    [v14 notifyOnQueue:v12 block:v13];
  }
}

- (void)getRecentMatchesForGameDescriptor:(id)a3 otherPlayer:(id)a4 handler:(id)a5
{
  if (a4) {
    [(GKGameStatService *)self getRecentGamesWithPlayer:a4 handler:a5];
  }
  else {
    [(GKGameStatService *)self getRecentPlayersForGameDescriptor:a3 handler:a5];
  }
}

- (void)getRecentPlayersWithHandler:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006A0F0;
  v5[3] = &unk_1002D6D38;
  id v6 = a3;
  id v4 = v6;
  [(GKGameStatService *)self getRecentPlayersForGameDescriptor:0 handler:v5];
}

- (void)fetchAchievementDescriptionsForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006A1E0;
  v10[3] = &unk_1002D3A48;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v7 = v13;
  id v8 = v12;
  id v9 = v11;
  [v8 performBlock:v10];
}

- (void)loadAchievementDescriptionsForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_10006A568;
  void v32[4] = sub_10006A578;
  id v33 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 603, "-[GKGameStatService loadAchievementDescriptionsForGameDescriptor:context:handler:]");
  id v12 = [(GKService *)self clientProxy];
  id v13 = +[GKCacheTransactionGroup transactionGroupWithName:v11 context:v9 client:v12];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10006A580;
  v24[3] = &unk_1002D6DD8;
  id v14 = v8;
  id v25 = v14;
  id v29 = v32;
  id v15 = v10;
  id v28 = v15;
  id v30 = v31;
  id v16 = v13;
  id v26 = v16;
  id v27 = self;
  [v16 performOnManagedObjectContext:v24];
  id v17 = [(GKService *)self clientProxy];
  id v18 = [v17 replyQueue];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10006AEFC;
  v20[3] = &unk_1002D6E00;
  id v19 = v16;
  id v21 = v19;
  id v22 = v32;
  id v23 = v31;
  [v19 notifyOnQueue:v18 block:v20];

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v32, 8);
}

+ (id)friendsRequiringHydration:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v18 = v3;
  id obj = [v3 objectForKeyedSubscript:@"results"];
  id v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v10 = [v9 objectForKeyedSubscript:@"friends-with-achievement"];
        id v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v21;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v21 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)j) objectForKeyedSubscript:@"friend-player-id"];
              [v4 addObject:v15];
            }
            id v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v12);
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }

  id v16 = [v4 copy];

  return v16;
}

+ (id)getFriendsWhoHaveTheseAchievementsPredicate:(id)a3 playerID:(id)a4 gameBundleID:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[NSPredicate predicateWithFormat:@"game.bundleID == %@", a5];
  id v10 = +[NSPredicate predicateWithFormat:@"achievementDescription.identifier IN %@", v8];
  id v11 = +[NSPredicate predicateWithFormat:@"achievementDescription.groupIdentifier IN %@", v8];

  v19[0] = v10;
  v19[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v19 count:2];
  uint64_t v13 = +[NSCompoundPredicate orPredicateWithSubpredicates:v12];

  id v14 = +[NSPredicate predicateWithFormat:@"player.playerID == %@", v7];

  v18[0] = v14;
  v18[1] = v9;
  v18[2] = v13;
  id v15 = +[NSArray arrayWithObjects:v18 count:3];
  id v16 = +[NSCompoundPredicate andPredicateWithSubpredicates:v15];

  return v16;
}

- (id)getFriendsWhoHaveTheseAchievements:(id)a3 playerID:(id)a4 gameBundleID:(id)a5 context:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 count])
  {
    os_signpost_id_t v13 = os_signpost_id_generate(os_log_GKPerf);
    id v14 = os_log_GKPerf;
    id v15 = v14;
    unint64_t v52 = v13 - 1;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "FriendsWhoHaveThisQuery", "", buf, 2u);
    }

    id v56 = v11;
    uint64_t v16 = +[GKGameStatService getFriendsWhoHaveTheseAchievementsPredicate:v9 playerID:v10 gameBundleID:v11];
    id v17 = +[GKCacheObject fetchRequestForContext:v12];
    v54 = (void *)v16;
    [v17 setPredicate:v16];
    id v74 = 0;
    v53 = v17;
    id v18 = [v12 executeFetchRequest:v17 error:&v74];
    id v19 = v74;
    if (v19)
    {
      if (!os_log_GKGeneral) {
        id v20 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_100082140();
      }
    }
    v51 = v19;
    os_signpost_id_t spid = v13;
    id v55 = v12;
    id v57 = v10;
    long long v21 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v18 count]);
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v22 = v18;
    id v23 = [v22 countByEnumeratingWithState:&v70 objects:v78 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v71;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v71 != v25) {
            objc_enumerationMutation(v22);
          }
          long long v27 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          id v28 = [v27 achievementDescription];
          id v29 = [v28 identifier];

          id v30 = [v27 achievementDescription];
          id v31 = [v30 groupIdentifier];

          if ([v29 length]) {
            [v21 setObject:v27 forKeyedSubscript:v29];
          }
          if ([v31 length]) {
            [v21 setObject:v27 forKeyedSubscript:v31];
          }
        }
        id v24 = [v22 countByEnumeratingWithState:&v70 objects:v78 count:16];
      }
      while (v24);
    }
    v50 = v22;

    id v61 = objc_alloc_init((Class)NSMutableArray);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v58 = v9;
    id obj = v9;
    id v32 = [obj countByEnumeratingWithState:&v66 objects:v77 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v60 = *(void *)v67;
      do
      {
        for (j = 0; j != v33; j = (char *)j + 1)
        {
          if (*(void *)v67 != v60) {
            objc_enumerationMutation(obj);
          }
          id v35 = [v21 objectForKeyedSubscript:*(void *)(*((void *)&v66 + 1) + 8 * (void)j)];
          id v36 = [v35 entries];
          id v37 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v36 count]);

          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v38 = [v35 entries];
          id v39 = [v38 countByEnumeratingWithState:&v62 objects:v76 count:16];
          if (v39)
          {
            id v40 = v39;
            uint64_t v41 = *(void *)v63;
            do
            {
              for (k = 0; k != v40; k = (char *)k + 1)
              {
                if (*(void *)v63 != v41) {
                  objc_enumerationMutation(v38);
                }
                id v43 = [*(id *)(*((void *)&v62 + 1) + 8 * (void)k) internalRepresentation];
                [v37 addObject:v43];
              }
              id v40 = [v38 countByEnumeratingWithState:&v62 objects:v76 count:16];
            }
            while (v40);
          }

          id v44 = [v37 copy];
          [v61 addObject:v44];
        }
        id v33 = [obj countByEnumeratingWithState:&v66 objects:v77 count:16];
      }
      while (v33);
    }

    v45 = os_log_GKPerf;
    id v46 = v45;
    id v10 = v57;
    if (v52 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_INTERVAL_END, spid, "FriendsWhoHaveThisQuery", "", buf, 2u);
    }

    id v47 = [v61 copy];
    id v9 = v58;
    id v12 = v55;
    id v11 = v56;
  }
  else
  {
    id v47 = 0;
  }

  return v47;
}

- (void)getAchievementDescriptionsForGameDescriptor:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 796, "-[GKGameStatService getAchievementDescriptionsForGameDescriptor:handler:]");
  id v9 = [(GKService *)self transactionGroupWithName:v8];

  id v10 = [(GKService *)self clientProxy];
  id v11 = [v10 replyQueue];

  id v12 = [v7 dictionaryForRequest];

  if (!v12)
  {
    os_signpost_id_t v13 = [(GKService *)self clientProxy];
    id v12 = [v13 gameDescriptor];
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10006BC60;
  v20[3] = &unk_1002D4FB0;
  void v20[4] = self;
  id v14 = v12;
  id v21 = v14;
  id v15 = v9;
  id v22 = v15;
  id v16 = v11;
  id v23 = v16;
  [v15 performOnManagedObjectContext:v20];
  if (v6)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10006C448;
    v17[3] = &unk_1002D3930;
    id v19 = v6;
    id v18 = v15;
    [v18 notifyOnQueue:v16 block:v17];
  }
}

- (void)fetchAchievementsForGameDescriptor:(id)a3 players:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 1;
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 865, "-[GKGameStatService fetchAchievementsForGameDescriptor:players:context:handler:]");
  id v15 = [(GKService *)self clientProxy];
  id v16 = +[GKCacheTransactionGroup transactionGroupWithName:v14 context:v12 client:v15];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10006C738;
  v28[3] = &unk_1002D6F58;
  void v28[4] = self;
  id v17 = v10;
  id v29 = v17;
  id v18 = v11;
  id v30 = v18;
  id v19 = v16;
  id v31 = v19;
  id v32 = v33;
  [v19 performOnManagedObjectContext:v28];
  id v20 = [(GKService *)self clientProxy];
  id v21 = [v20 replyQueue];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10006CDDC;
  v24[3] = &unk_1002D43A0;
  id v22 = v13;
  id v26 = v22;
  id v23 = v19;
  id v25 = v23;
  long long v27 = v33;
  [v23 notifyOnQueue:v21 block:v24];

  _Block_object_dispose(v33, 8);
}

- (void)achievementsForPlayersAndGameDescriptor:(id)a3 players:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 950, "-[GKGameStatService achievementsForPlayersAndGameDescriptor:players:context:handler:]");
  id v15 = [(GKService *)self clientProxy];
  id v16 = +[GKCacheTransactionGroup transactionGroupWithName:v14 context:v12 client:v15];

  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10006D100;
  v27[3] = &unk_1002D6FC8;
  id v17 = v10;
  id v28 = v17;
  id v18 = v11;
  id v29 = v18;
  id v19 = v16;
  id v30 = v19;
  id v31 = self;
  id v20 = v13;
  id v32 = v20;
  id v33 = v34;
  [v19 performOnManagedObjectContext:v27];
  id v21 = [(GKService *)self clientProxy];
  id v22 = [v21 replyQueue];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10006DC74;
  v24[3] = &unk_1002D4D08;
  id v23 = v19;
  id v25 = v23;
  id v26 = v34;
  [v23 notifyOnQueue:v22 block:v24];

  _Block_object_dispose(v34, 8);
}

- (void)loadAchievementsForGameDescriptor:(id)a3 players:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [a4 _gkMapWithBlock:&stru_1002D7008];
  [(GKGameStatService *)self achievementsForPlayersAndGameDescriptor:v12 players:v13 context:v11 handler:v10];
}

- (void)primeCacheWithAchievementDescriptions:(id)a3 context:(id)a4 gameDescriptor:(id)a5 players:(id)a6 missingPlayers:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 1065, "-[GKGameStatService primeCacheWithAchievementDescriptions:context:gameDescriptor:players:missingPlayers:]");
  id v18 = [v12 transactionGroupWithName:v17];

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10006E124;
  v37[3] = &unk_1002D4518;
  void v37[4] = self;
  id v19 = v14;
  id v38 = v19;
  id v39 = v16;
  id v20 = v13;
  id v40 = v20;
  id v21 = v18;
  id v41 = v21;
  id v22 = v16;
  [v21 perform:v37];
  id v23 = [(GKService *)self clientProxy];
  id v24 = [v23 replyQueue];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10006E238;
  v30[3] = &unk_1002D4860;
  id v31 = v12;
  id v32 = v21;
  id v33 = self;
  id v34 = v19;
  id v35 = v15;
  id v36 = v20;
  id v25 = v20;
  id v26 = v15;
  id v27 = v19;
  id v28 = v21;
  id v29 = v12;
  [v29 join:v28 queue:v24 block:v30];
}

- (void)getAchievementsForGameDescriptor:(id)a3 players:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v11 = objc_alloc((Class)GKGameDescriptor);
    id v12 = [(GKService *)self clientProxy];
    id v13 = [v12 gameDescriptor];
    id v8 = [v11 initWithDictionary:v13];
  }
  id v14 = [(GKService *)self transactionGroupBypassingMultiUser];
  id v15 = [v8 bundleIdentifier];
  id v16 = [v8 dictionaryForRequest];
  if (v16)
  {
    if (v15)
    {
LABEL_5:
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10006E754;
      v26[3] = &unk_1002D5FB0;
      v26[4] = self;
      id v27 = v16;
      id v28 = v9;
      id v17 = v14;
      id v29 = v17;
      id v30 = v8;
      [v17 performOnManagedObjectContext:v26];
      if (v10)
      {
        id v18 = [(GKService *)self clientProxy];
        id v19 = [v18 replyQueue];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10006EA5C;
        v23[3] = &unk_1002D3930;
        id v25 = v10;
        id v24 = v17;
        [v24 notifyOnQueue:v19 block:v23];
      }
      goto LABEL_14;
    }
  }
  else
  {
    id v20 = [(GKService *)self clientProxy];
    id v16 = [v20 gameDescriptor];

    if (v15) {
      goto LABEL_5;
    }
  }
  if (!os_log_GKGeneral) {
    id v21 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
    sub_1000821E8();
  }
  id v22 = +[NSError userErrorForCode:17 underlyingError:0];
  [v14 setError:v22];

LABEL_14:
}

- (void)submitAchievements:(id)a3 whileScreeningChallenges:(BOOL)a4 withEligibleChallenges:(id)a5 handler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 1161, "-[GKGameStatService submitAchievements:whileScreeningChallenges:withEligibleChallenges:handler:]");
  id v13 = [(GKService *)self transactionGroupWithName:v12];

  id v14 = +[NSDate date];
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 0;
  id v15 = [(GKService *)self clientProxy];
  id v16 = [v15 replyQueue];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10006ED64;
  v27[3] = &unk_1002D6830;
  id v17 = v13;
  id v28 = v17;
  id v29 = self;
  id v18 = v9;
  id v30 = v18;
  id v19 = v14;
  id v31 = v19;
  id v32 = v33;
  [v17 performOnQueue:v16 block:v27];

  if (v11)
  {
    id v20 = [(GKService *)self clientProxy];
    id v21 = [v20 replyQueue];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10006F510;
    v22[3] = &unk_1002D70E8;
    id v26 = v33;
    v22[4] = self;
    id v25 = v11;
    id v23 = v17;
    id v24 = v18;
    [v23 notifyOnQueue:v21 block:v22];
  }
  _Block_object_dispose(v33, 8);
}

- (void)resetAchievementsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 1245, "-[GKGameStatService resetAchievementsWithHandler:]");
  id v6 = [(GKService *)self transactionGroupWithName:v5];

  id v7 = [(GKService *)self clientProxy];
  id v8 = [v7 replyQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006F838;
  v15[3] = &unk_1002D3A70;
  id v9 = v6;
  id v16 = v9;
  id v17 = self;
  [v9 performOnQueue:v8 block:v15];

  if (v4)
  {
    id v10 = [(GKService *)self clientProxy];
    id v11 = [v10 replyQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10006FCA0;
    v12[3] = &unk_1002D3930;
    id v14 = v4;
    id v13 = v9;
    [v13 notifyOnQueue:v11 block:v12];
  }
}

- (void)getLeaderboardForRequest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 gameBundleID];

  if (!v8)
  {
    id v9 = [(GKService *)self clientProxy];
    id v10 = [v9 bundleIdentifier];
    [v6 setGameBundleID:v10];
  }
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 1303, "-[GKGameStatService getLeaderboardForRequest:handler:]");
  id v12 = [(GKService *)self transactionGroupWithName:v11];

  id v13 = [(GKService *)self clientProxy];
  id v14 = [v13 replyQueue];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10006FF2C;
  v22[3] = &unk_1002D3980;
  id v15 = v12;
  id v23 = v15;
  id v16 = v6;
  id v24 = v16;
  id v25 = self;
  [v15 performOnQueue:v14 block:v22];

  if (v7)
  {
    id v17 = [(GKService *)self clientProxy];
    id v18 = [v17 replyQueue];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    void v19[2] = sub_100070148;
    v19[3] = &unk_1002D3930;
    id v21 = v7;
    id v20 = v15;
    [v20 notifyOnQueue:v18 block:v19];
  }
}

- (void)submitScores:(id)a3 whileScreeningChallenges:(BOOL)a4 withEligibleChallenges:(id)a5 handler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 1325, "-[GKGameStatService submitScores:whileScreeningChallenges:withEligibleChallenges:handler:]");
  id v13 = [(GKService *)self transactionGroupWithName:v12];

  id v14 = +[NSDate date];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v15 = v9;
  id v16 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      id v19 = 0;
      do
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * (void)v19) setDate:v14];
        id v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v17);
  }

  +[GKScoreSubmissionBulletin presentForScores:v15];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100070490;
  v28[3] = &unk_1002D48B0;
  id v20 = v15;
  id v29 = v20;
  id v30 = self;
  id v21 = v10;
  id v31 = v21;
  id v22 = v13;
  id v32 = v22;
  [v22 perform:v28];
  if (v11)
  {
    id v23 = [(GKService *)self clientProxy];
    id v24 = [v23 replyQueue];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100070614;
    v25[3] = &unk_1002D3930;
    id v27 = v11;
    id v26 = v22;
    [v26 notifyOnQueue:v24 block:v25];
  }
}

- (void)cleanUpLeaderboardTitles:(id)a3 set:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v10, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v11 = +[NSThread callStackSymbols];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKGameStatService cleanUpLeaderboardTitles:set:context:]", v11);
    id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m"];
    id v14 = [v13 lastPathComponent];
    id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v12, "-[GKGameStatService cleanUpLeaderboardTitles:set:context:]", [v14 UTF8String], 1353);

    +[NSException raise:@"GameKit Exception", @"%@", v15 format];
  }

  id v16 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v7 count]);
  id v17 = [v8 leaderboardTitleMapList];
  uint64_t v18 = [v17 entries];
  id v19 = [v18 _gkMapDictionaryWithKeyPath:@"identifier"];
  [v16 addEntriesFromDictionary:v19];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v20 = v7;
  id v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v26 = [v25 baseLeaderboardID];
        id v27 = [v16 objectForKey:v26];

        id v28 = [v27 localizedTitle];
        [v25 setLocalizedTitle:v28];
      }
      id v22 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v22);
  }
}

- (void)fetchLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 setIdentifier:(id)a5 context:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  void v19[2] = sub_100070A64;
  v19[3] = &unk_1002D6CE8;
  id v20 = a5;
  id v21 = v12;
  id v22 = v13;
  id v23 = a6;
  id v24 = self;
  id v25 = a7;
  id v14 = v25;
  id v15 = v23;
  id v16 = v13;
  id v17 = v12;
  id v18 = v20;
  [v15 performBlock:v19];
}

- (void)loadLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 setIdentifier:(id)a5 context:(id)a6 bagKey:(id)a7 handler:(id)a8
{
  id v36 = a3;
  id v14 = a4;
  id v37 = a5;
  id v15 = a6;
  id v35 = a7;
  id v16 = a8;
  id v17 = [v14 playerID];

  if (!v17)
  {
    id v18 = +[NSString stringWithFormat:@"Assertion failed"];
    id v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m"];
    id v20 = [v19 lastPathComponent];
    id v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (player.playerID != ((void *)0))\n[%s (%s:%d)]", v18, "-[GKGameStatService loadLeaderboardsForGameDescriptor:player:setIdentifier:context:bagKey:handler:]", [v20 UTF8String], 1412);

    +[NSException raise:@"GameKit Exception", @"%@", v21 format];
  }
  id v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 1414, "-[GKGameStatService loadLeaderboardsForGameDescriptor:player:setIdentifier:context:bagKey:handler:]");
  id v23 = [(GKService *)self clientProxy];
  id v24 = +[GKCacheTransactionGroup transactionGroupWithName:v22 context:v15 client:v23];

  v51[0] = 0;
  v51[1] = v51;
  void v51[2] = 0x2020000000;
  v51[3] = 0;
  id v25 = [(GKService *)self clientProxy];
  id v26 = [v25 replyQueue];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100070FE0;
  v42[3] = &unk_1002D7160;
  id v27 = v36;
  id v43 = v27;
  id v28 = v14;
  id v44 = v28;
  id v29 = v37;
  id v45 = v29;
  id v30 = v35;
  id v46 = v30;
  id v47 = self;
  v50 = v51;
  id v31 = v24;
  id v48 = v31;
  id v32 = v15;
  id v49 = v32;
  [v31 performOnQueue:v26 block:v42];

  if (v16)
  {
    long long v33 = [(GKService *)self clientProxy];
    long long v34 = [v33 replyQueue];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100071754;
    v38[3] = &unk_1002D4248;
    id v40 = v16;
    id v41 = v51;
    id v39 = v31;
    [v39 notifyOnQueue:v34 block:v38];
  }
  _Block_object_dispose(v51, 8);
}

- (void)getLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 setIdentifier:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 1503, "-[GKGameStatService getLeaderboardsForGameDescriptor:player:setIdentifier:handler:]");
  id v15 = [(GKService *)self transactionGroupWithName:v14];

  id v16 = [(GKService *)self clientProxy];
  id v17 = [v16 replyQueue];

  if (v10)
  {
    if (v11) {
      goto LABEL_6;
    }
  }
  else
  {
    id v18 = objc_alloc((Class)GKGameDescriptor);
    id v19 = [(GKService *)self clientProxy];
    id v20 = [v19 gameDescriptor];
    id v21 = [v18 initWithDictionary:v20];

    id v10 = v21;
    if (v11) {
      goto LABEL_6;
    }
  }
  uint64_t v55 = 0;
  id v56 = &v55;
  uint64_t v57 = 0x3032000000;
  id v58 = sub_10006A568;
  v59 = sub_10006A578;
  id v60 = 0;
  id v22 = [v15 context];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100071D00;
  v52[3] = &unk_1002D4D08;
  id v53 = v15;
  v54 = &v55;
  [v22 performBlockAndWait:v52];

  id v11 = (id)v56[5];
  _Block_object_dispose(&v55, 8);

  if (v11)
  {
LABEL_6:
    id v23 = [v11 playerID];

    if (v23)
    {
      id v24 = [(GKService *)self clientProxy];
      [v24 replyQueue];
      id v25 = v17;
      v27 = id v26 = v12;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100071E78;
      v41[3] = &unk_1002D6E50;
      id v28 = &v42;
      id v11 = v11;
      id v42 = v11;
      id v36 = v10;
      id v43 = v10;
      id v37 = v15;
      id v29 = v15;
      id v44 = v29;
      id v45 = self;
      id v30 = v26;
      id v31 = v26;
      id v17 = v25;
      id v46 = v31;
      id v47 = v25;
      [v29 performOnQueue:v27 block:v41];

      if (v13)
      {
        id v32 = [(GKService *)self clientProxy];
        long long v33 = [v32 replyQueue];
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100072918;
        v38[3] = &unk_1002D3930;
        id v40 = v13;
        id v39 = v29;
        [v39 notifyOnQueue:v33 block:v38];
      }
      id v12 = v30;
      id v10 = v36;
      id v15 = v37;
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v34 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_1000822C4();
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100071E08;
      block[3] = &unk_1002D3A20;
      id v28 = &v49;
      id v49 = v13;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    goto LABEL_20;
  }
  if (!os_log_GKGeneral) {
    id v35 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
    sub_100082290();
  }
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  void v50[2] = sub_100071D98;
  v50[3] = &unk_1002D3A20;
  id v28 = &v51;
  id v51 = v13;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v50);
  id v11 = 0;
LABEL_20:
}

- (void)setDefaultLeaderboardID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 1597, "-[GKGameStatService setDefaultLeaderboardID:handler:]");
  id v9 = [(GKService *)self transactionGroupWithName:v8];

  id v10 = [(GKService *)self clientProxy];
  id v11 = [v10 replyQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  void v19[2] = sub_100072B7C;
  v19[3] = &unk_1002D3980;
  id v12 = v6;
  id v20 = v12;
  id v21 = self;
  id v13 = v9;
  id v22 = v13;
  [v13 performOnQueue:v11 block:v19];

  if (v7)
  {
    id v14 = [(GKService *)self clientProxy];
    id v15 = [v14 replyQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100072F28;
    v16[3] = &unk_1002D3930;
    id v18 = v7;
    id v17 = v13;
    [v17 notifyOnQueue:v15 block:v16];
  }
}

- (void)getDefaultLeaderboardIDWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[GKService serviceFromService:self];
  id v6 = [(GKService *)self clientProxy];
  id v7 = [v6 bundleIdentifier];
  id v12 = v7;
  id v8 = +[NSArray arrayWithObjects:&v12 count:1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000730C4;
  v10[3] = &unk_1002D4F88;
  id v11 = v4;
  id v9 = v4;
  [v5 getGameStatsForPlayer:0 bundleIDs:v8 handler:v10];
}

- (void)getLeaderboardSetsForGameDescriptor:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 1644, "-[GKGameStatService getLeaderboardSetsForGameDescriptor:handler:]");
  id v9 = [(GKService *)self transactionGroupWithName:v8];

  id v10 = [v7 dictionaryForRequest];

  if (v10
    || ([(GKService *)self clientProxy],
        id v11 = objc_claimAutoreleasedReturnValue(),
        [v11 gameDescriptor],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10))
  {
    id v12 = [v9 context];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000733C8;
    v22[3] = &unk_1002D4888;
    id v13 = v10;
    id v23 = v13;
    id v24 = v9;
    id v25 = self;
    [v12 performBlockAndWait:v22];
  }
  else
  {
    id v18 = +[NSError userErrorForCode:17 underlyingError:0];
    [v9 setError:v18];

    id v13 = 0;
  }
  id v14 = [(GKService *)self clientProxy];
  id v15 = [v14 replyQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  void v19[2] = sub_100073B30;
  v19[3] = &unk_1002D3930;
  id v20 = v9;
  id v21 = v6;
  id v16 = v9;
  id v17 = v6;
  [v16 notifyOnQueue:v15 block:v19];
}

- (void)updateLeaderboardsWithIDs:(id)a3 gameDescriptor:(id)a4 player:(id)a5 context:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [v14 playerID];

  if (!v17)
  {
    id v18 = +[NSString stringWithFormat:@"Assertion failed"];
    id v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m"];
    [v19 lastPathComponent];
    id v20 = v16;
    id v21 = v13;
    id v22 = v12;
    id v23 = objc_claimAutoreleasedReturnValue();
    id v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (player.playerID != ((void *)0))\n[%s (%s:%d)]", v18, "-[GKGameStatService updateLeaderboardsWithIDs:gameDescriptor:player:context:handler:]", [v23 UTF8String], 1726);

    id v12 = v22;
    id v13 = v21;
    id v16 = v20;

    +[NSException raise:@"GameKit Exception", @"%@", v24 format];
  }
  id v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 1728, "-[GKGameStatService updateLeaderboardsWithIDs:gameDescriptor:player:context:handler:]");
  id v26 = [(GKService *)self clientProxy];
  id v27 = +[GKCacheTransactionGroup transactionGroupWithName:v25 context:v15 client:v26];

  id v28 = [(GKService *)self clientProxy];
  id v29 = [v28 replyQueue];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100073F28;
  v40[3] = &unk_1002D6E50;
  id v30 = v13;
  id v41 = v30;
  id v31 = v14;
  id v42 = v31;
  id v32 = v12;
  id v43 = v32;
  id v44 = self;
  id v33 = v27;
  id v45 = v33;
  id v34 = v15;
  id v46 = v34;
  [v33 performOnQueue:v29 block:v40];

  if (v16)
  {
    id v35 = [(GKService *)self clientProxy];
    id v36 = [v35 replyQueue];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000744C8;
    v37[3] = &unk_1002D3930;
    id v39 = v16;
    id v38 = v33;
    [v38 notifyOnQueue:v36 block:v37];
  }
}

+ (id)leaderboards:(id)a3 filteredWithIDs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6 && [v6 count])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100074620;
    v10[3] = &unk_1002D6A18;
    id v11 = v7;
    id v8 = [v5 _gkFilterWithBlock:v10];
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

- (id)updateSigningStatusIfChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(GKService *)self clientProxy];
  unsigned __int8 v6 = [v5 isDevSigned];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007475C;
  v8[3] = &unk_1002D7298;
  unsigned __int8 v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v4;
}

- (void)getLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 leaderboardIDs:(id)a5 setIdentifier:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 1811, "-[GKGameStatService getLeaderboardsForGameDescriptor:player:leaderboardIDs:setIdentifier:handler:]");
  id v18 = [(GKService *)self transactionGroupWithName:v17];

  id v19 = [(GKService *)self clientProxy];
  id v20 = [v19 replyQueue];

  if (v12) {
    goto LABEL_3;
  }
  id v21 = objc_alloc((Class)GKGameDescriptor);
  id v22 = [(GKService *)self clientProxy];
  id v23 = [v22 gameDescriptor];
  id v12 = [v21 initWithDictionary:v23];

  if (v12)
  {
LABEL_3:
    if (v13)
    {
LABEL_6:
      id v26 = [v13 playerID];

      if (v26)
      {
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_100074F94;
        v41[3] = &unk_1002D7200;
        id v27 = v18;
        id v42 = v27;
        id v43 = self;
        id v28 = v12;
        id v44 = v28;
        id v29 = v13;
        id v45 = v29;
        id v46 = v15;
        id v47 = v14;
        id v30 = v20;
        id v48 = v30;
        [v27 performOnQueue:v30 block:v41];
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100076434;
        v35[3] = &unk_1002D39A8;
        id v36 = v27;
        id v37 = self;
        id v13 = v29;
        id v38 = v13;
        id v12 = v28;
        id v39 = v12;
        id v40 = v16;
        [v36 notifyOnQueue:v30 block:v35];

        id v31 = v42;
      }
      else
      {
        if (!os_log_GKGeneral) {
          id v32 = (id)GKOSLoggers();
        }
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
          sub_100082360();
        }
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100074F24;
        block[3] = &unk_1002D3A20;
        id v50 = v16;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        id v31 = v50;
      }

      goto LABEL_14;
    }
    uint64_t v56 = 0;
    uint64_t v57 = &v56;
    uint64_t v58 = 0x3032000000;
    v59 = sub_10006A568;
    id v60 = sub_10006A578;
    id v61 = 0;
    id v24 = [v18 context];
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100074E1C;
    v53[3] = &unk_1002D4D08;
    id v54 = v18;
    uint64_t v55 = &v56;
    [v24 performBlockAndWait:v53];

    id v25 = (id)v57[5];
    if (v25)
    {
      id v13 = v25;

      _Block_object_dispose(&v56, 8);
      goto LABEL_6;
    }
    if (!os_log_GKGeneral) {
      id v34 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100082290();
    }
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    void v51[2] = sub_100074EB4;
    v51[3] = &unk_1002D3A20;
    id v52 = v16;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v51);

    _Block_object_dispose(&v56, 8);
    id v13 = 0;
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v33 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_10008232C();
    }
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_100074DAC;
    v62[3] = &unk_1002D3A20;
    id v63 = v16;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v62);

    id v12 = 0;
  }
LABEL_14:
}

- (void)mixinHasActiveChallengesWithLeaderboards:(id)a3 playerID:(id)a4 bundleID:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 count] && (_os_feature_enabled_impl() & 1) != 0)
  {
    id v14 = +[GKService serviceFromService:self];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    void v19[2] = sub_1000767FC;
    v19[3] = &unk_1002D53D8;
    id v20 = v10;
    id v21 = self;
    id v22 = v13;
    id v15 = v13;
    id v16 = v10;
    [v14 getActiveLeaderboardChallengeDetailsForPlayerID:v11 bundleID:v12 allowStaleChallengeDetailsData:1 completionHandler:v19];
  }
  else
  {
    id v17 = [(GKService *)self clientProxy];
    id v18 = [v17 replyQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000767E8;
    block[3] = &unk_1002D3930;
    id v24 = v10;
    id v25 = v13;
    id v16 = v13;
    id v14 = v10;
    dispatch_async(v18, block);

    id v15 = v25;
  }
}

- (void)fetchLeaderboardWithRecordID:(id)a3 context:(id)a4 handler:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100076B34;
  v10[3] = &unk_1002D3A48;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v7 = v13;
  id v8 = v12;
  id v9 = v11;
  [v8 performBlock:v10];
}

- (void)loadPreviousInstanceForLeaderboard:(id)a3 gameDescriptor:(id)a4 player:(id)a5 playerPlayedIn:(BOOL)a6 context:(id)a7 handler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v37 = a8;
  id v17 = [v15 playerID];

  if (!v17)
  {
    id v18 = +[NSString stringWithFormat:@"Assertion failed"];
    id v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m"];
    id v20 = [v19 lastPathComponent];
    id v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (player.playerID != ((void *)0))\n[%s (%s:%d)]", v18, "-[GKGameStatService loadPreviousInstanceForLeaderboard:gameDescriptor:player:playerPlayedIn:context:handler:]", [v20 UTF8String], 2036);

    +[NSException raise:@"GameKit Exception", @"%@", v21 format];
  }
  id v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 2038, "-[GKGameStatService loadPreviousInstanceForLeaderboard:gameDescriptor:player:playerPlayedIn:context:handler:]");
  id v23 = [(GKService *)self clientProxy];
  id v24 = +[GKCacheTransactionGroup transactionGroupWithName:v22 context:v16 client:v23];

  id v25 = [(GKService *)self clientProxy];
  id v26 = [v25 replyQueue];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100076F18;
  v41[3] = &unk_1002D62C8;
  id v42 = v14;
  id v43 = v15;
  BOOL v48 = a6;
  id v44 = v13;
  id v45 = self;
  id v27 = v24;
  id v46 = v27;
  id v47 = v16;
  id v28 = v16;
  id v29 = v13;
  id v30 = v15;
  id v31 = v14;
  [v27 performOnQueue:v26 block:v41];

  id v32 = [(GKService *)self clientProxy];
  id v33 = [v32 replyQueue];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100077458;
  v38[3] = &unk_1002D3930;
  id v39 = v27;
  id v40 = v37;
  id v34 = v27;
  id v35 = v37;
  [v34 notifyOnQueue:v33 block:v38];
}

- (void)getPreviousInstanceForLeaderboard:(id)a3 gameDescriptor:(id)a4 player:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 2093, "-[GKGameStatService getPreviousInstanceForLeaderboard:gameDescriptor:player:handler:]");
  id v15 = [(GKService *)self transactionGroupWithName:v14];

  if (v11) {
    goto LABEL_3;
  }
  id v16 = objc_alloc((Class)GKGameDescriptor);
  id v17 = [(GKService *)self clientProxy];
  id v18 = [v17 gameDescriptor];
  id v11 = [v16 initWithDictionary:v18];

  if (v11)
  {
LABEL_3:
    if (v12)
    {
LABEL_6:
      id v21 = [v12 playerID];

      if (v21)
      {
        id v22 = [(GKService *)self clientProxy];
        id v23 = [v22 replyQueue];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_100077C94;
        v39[3] = &unk_1002D4518;
        id v24 = v15;
        id v40 = v24;
        id v41 = self;
        id v42 = v10;
        id v25 = v11;
        id v43 = v25;
        id v26 = v12;
        id v44 = v26;
        [v24 performOnQueue:v23 block:v39];

        id v27 = [(GKService *)self clientProxy];
        id v28 = [v27 replyQueue];
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_1000781CC;
        void v33[3] = &unk_1002D5400;
        id v34 = v24;
        id v38 = v13;
        id v35 = self;
        id v12 = v26;
        id v36 = v12;
        id v11 = v25;
        id v37 = v11;
        [v34 notifyOnQueue:v28 block:v33];

        id v29 = v40;
      }
      else
      {
        if (!os_log_GKGeneral) {
          id v30 = (id)GKOSLoggers();
        }
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
          sub_1000825F4();
        }
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100077C24;
        block[3] = &unk_1002D3A20;
        id v46 = v13;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        id v29 = v46;
      }

      goto LABEL_14;
    }
    uint64_t v52 = 0;
    id v53 = &v52;
    uint64_t v54 = 0x3032000000;
    uint64_t v55 = sub_10006A568;
    uint64_t v56 = sub_10006A578;
    id v57 = 0;
    id v19 = [v15 context];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100077B1C;
    void v49[3] = &unk_1002D4D08;
    id v50 = v15;
    id v51 = &v52;
    [v19 performBlockAndWait:v49];

    id v20 = (id)v53[5];
    if (v20)
    {
      id v12 = v20;

      _Block_object_dispose(&v52, 8);
      goto LABEL_6;
    }
    if (!os_log_GKGeneral) {
      id v32 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_1000825C0();
    }
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100077BB4;
    void v47[3] = &unk_1002D3A20;
    id v48 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v47);

    _Block_object_dispose(&v52, 8);
    id v12 = 0;
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v31 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_10008258C();
    }
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100077AAC;
    v58[3] = &unk_1002D3A20;
    id v59 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v58);

    id v11 = 0;
  }
LABEL_14:
}

- (void)updatePlayersForEntries:(id)a3 localPlayerEntry:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = +[NSMutableArray arrayWithArray:v10];
  id v12 = v11;
  if (v8) {
    [v11 addObject:v8];
  }
  id v13 = +[GKAnonymousPlayerInternal internalRepresentation];
  id v14 = [v10 _gkValuesForKeyPath:@"player.playerID"];

  id v15 = +[GKService serviceFromService:self];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  void v19[2] = sub_1000785A4;
  v19[3] = &unk_1002D53D8;
  id v20 = v12;
  id v21 = v13;
  id v22 = v9;
  id v16 = v9;
  id v17 = v13;
  id v18 = v12;
  [v15 getProfilesForPlayerIDs:v14 handler:v19];
}

- (void)generateEntriesFromServerResponse:(id)a3 context:(id)a4 leaderboard:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 2219, "-[GKGameStatService generateEntriesFromServerResponse:context:leaderboard:handler:]");
  id v15 = [(GKService *)self clientProxy];
  id v16 = +[GKCacheTransactionGroup transactionGroupWithName:v14 context:v13 client:v15];

  if (v10)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100078990;
    v24[3] = &unk_1002D4FB0;
    id v25 = v10;
    id v26 = v11;
    id v27 = v16;
    id v28 = self;
    [v27 performOnManagedObjectContext:v24];
  }
  id v17 = [(GKService *)self clientProxy];
  id v18 = [v17 replyQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000790B8;
  v21[3] = &unk_1002D3930;
  id v22 = v16;
  id v23 = v12;
  id v19 = v16;
  id v20 = v12;
  [v19 notifyOnQueue:v18 block:v21];
}

- (void)loadEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 context:(id)a10 handler:(id)a11
{
}

- (void)loadEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 context:(id)a10 locale:(id)a11 handler:(id)a12
{
  id v15 = a3;
  id v36 = a4;
  id v16 = a5;
  id v17 = a10;
  id v18 = a11;
  id v40 = a12;
  id v19 = a9;
  id v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 2306, "-[GKGameStatService loadEntriesForLeaderboard:gameDescriptor:localPlayer:playerScope:timeScope:range:players:context:locale:handler:]");
  id v21 = [(GKService *)self clientProxy];
  id v22 = +[GKCacheTransactionGroup transactionGroupWithName:v20 context:v17 client:v21];

  id v23 = [v19 _gkMapWithBlock:&stru_1002D74B8];

  id v24 = [(GKService *)self clientProxy];
  id v25 = [v24 replyQueue];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  void v44[2] = sub_1000794B8;
  v44[3] = &unk_1002D7508;
  id v45 = v36;
  id v46 = v16;
  id v47 = v15;
  id v48 = self;
  int64_t v53 = a7;
  int64_t v54 = a6;
  _NSRange v55 = a8;
  id v49 = v23;
  id v50 = v18;
  id v26 = v22;
  id v51 = v26;
  id v52 = v17;
  id v39 = v17;
  id v27 = v18;
  id v28 = v23;
  id v29 = v15;
  id v30 = v16;
  id v31 = v36;
  [v26 performOnQueue:v25 block:v44];

  id v32 = [(GKService *)self clientProxy];
  id v33 = [v32 replyQueue];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100079A04;
  v41[3] = &unk_1002D3930;
  id v42 = v26;
  id v43 = v40;
  id v34 = v26;
  id v35 = v40;
  [v34 notifyOnQueue:v33 block:v41];
}

- (id)playerScopeName:(int64_t)a3
{
  if (a3 == 1) {
    return @"FRIENDS";
  }
  else {
    return @"ALL";
  }
}

- (id)timeScopeName:(int64_t)a3
{
  CFStringRef v3 = @"AllTIME";
  if (a3 == 1) {
    CFStringRef v3 = @"THISWEEK";
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"TODAY";
  }
}

- (void)getEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 handler:(id)a10
{
}

- (void)getEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 locale:(id)a10 handler:(id)a11
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v43 = a9;
  id v17 = a10;
  id v18 = a11;
  id v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 2402, "-[GKGameStatService getEntriesForLeaderboard:gameDescriptor:localPlayer:playerScope:timeScope:range:players:locale:handler:]");
  id v20 = [(GKService *)self transactionGroupWithName:v19];

  if (v15) {
    goto LABEL_3;
  }
  id v21 = objc_alloc((Class)GKGameDescriptor);
  id v22 = [(GKService *)self clientProxy];
  id v23 = [v22 gameDescriptor];
  id v15 = [v21 initWithDictionary:v23];

  if (v15)
  {
LABEL_3:
    id v24 = [v14 baseLeaderboardID];
    id v25 = [v24 length];

    if (!v25)
    {
      if (!os_log_GKGeneral) {
        id v35 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_1000827A4();
      }
      id v36 = [(GKService *)self clientProxy];
      id v37 = [v36 replyQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007A2C4;
      block[3] = &unk_1002D3A20;
      id v72 = v18;
      dispatch_async(v37, block);

      id v34 = v72;
      goto LABEL_19;
    }
    if (v16)
    {
LABEL_7:
      id v28 = [v16 playerID];

      if (v28)
      {
        id v29 = [(GKService *)self clientProxy];
        id v30 = [v29 replyQueue];
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_10007A4C4;
        void v47[3] = &unk_1002D7530;
        id v31 = v20;
        id v48 = v31;
        id v49 = self;
        id v50 = v14;
        id v15 = v15;
        id v51 = v15;
        id v16 = v16;
        id v52 = v16;
        int64_t v55 = a6;
        int64_t v56 = a7;
        _NSRange v57 = a8;
        id v53 = v43;
        id v54 = v17;
        [v31 performOnQueue:v30 block:v47];

        id v32 = [(GKService *)self clientProxy];
        id v33 = [v32 replyQueue];
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        void v44[2] = sub_10007A7D4;
        v44[3] = &unk_1002D3930;
        id v46 = v18;
        id v45 = v31;
        [v45 notifyOnQueue:v33 block:v44];

        id v34 = v48;
      }
      else
      {
        if (!os_log_GKGeneral) {
          id v38 = (id)GKOSLoggers();
        }
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
          sub_10008280C();
        }
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_10007A44C;
        v58[3] = &unk_1002D3A20;
        id v59 = v18;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v58);
        id v34 = v59;
      }
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v65 = 0;
    long long v66 = &v65;
    uint64_t v67 = 0x3032000000;
    long long v68 = sub_10006A568;
    long long v69 = sub_10006A578;
    id v70 = 0;
    id v26 = [v20 context];
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_10007A33C;
    v62[3] = &unk_1002D4D08;
    id v63 = v20;
    long long v64 = &v65;
    [v26 performBlockAndWait:v62];

    id v27 = (id)v66[5];
    if (v27)
    {
      id v16 = v27;

      _Block_object_dispose(&v65, 8);
      goto LABEL_7;
    }
    if (!os_log_GKGeneral) {
      id v40 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_1000827D8();
    }
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_10007A3D4;
    v60[3] = &unk_1002D3A20;
    id v61 = v18;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v60);

    _Block_object_dispose(&v65, 8);
    id v16 = 0;
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v39 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100082770();
    }
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_10007A24C;
    v73[3] = &unk_1002D3A20;
    id v74 = v18;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v73);

    id v15 = 0;
  }
LABEL_20:
}

- (void)submitScore:(int64_t)a3 context:(unint64_t)a4 leaderboardIDs:(id)a5 forPlayer:(id)a6 whileScreeningChallenges:(BOOL)a7 withEligibleChallenges:(id)a8 gameDescriptor:(id)a9 handler:(id)a10
{
  id v14 = a6;
  id v15 = a8;
  id v16 = a10;
  id v17 = a9;
  id v18 = a5;
  id v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 2478, "-[GKGameStatService submitScore:context:leaderboardIDs:forPlayer:whileScreeningChallenges:withEligibleChallenges:gameDescriptor:handler:]");
  id v20 = [(GKService *)self transactionGroupWithName:v19];

  id v21 = +[NSDate date];
  id v22 = +[NSMutableSet setWithArray:v18];

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10007AAA0;
  v30[3] = &unk_1002D75D0;
  id v31 = v21;
  id v32 = v14;
  id v33 = v22;
  id v34 = v20;
  id v35 = self;
  id v36 = v15;
  int64_t v38 = a3;
  unint64_t v39 = a4;
  id v37 = v16;
  id v23 = v16;
  id v24 = v15;
  id v25 = v20;
  id v26 = v22;
  id v27 = v14;
  id v28 = v21;
  [(GKGameStatService *)self getLeaderboardsForGameDescriptor:v17 player:v27 leaderboardIDs:v26 setIdentifier:0 handler:v30];
}

- (void)submitInstanceScore:(int64_t)a3 context:(unint64_t)a4 leaderboard:(id)a5 forPlayer:(id)a6 whileScreeningChallenges:(BOOL)a7 withEligibleChallenges:(id)a8 handler:(id)a9
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 2580, "-[GKGameStatService submitInstanceScore:context:leaderboard:forPlayer:whileScreeningChallenges:withEligibleChallenges:handler:]");
  id v19 = [(GKService *)self transactionGroupWithName:v18];

  +[NSDate date];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10007BB0C;
  v30[3] = &unk_1002D75F8;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v31 = v20;
  id v21 = v14;
  id v32 = v21;
  int64_t v37 = a3;
  unint64_t v38 = a4;
  id v22 = v15;
  id v33 = v22;
  id v23 = v16;
  id v34 = v23;
  id v35 = self;
  id v24 = v19;
  id v36 = v24;
  [v24 perform:v30];
  if (v17)
  {
    id v25 = [(GKService *)self clientProxy];
    id v26 = [v25 replyQueue];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10007BF3C;
    v27[3] = &unk_1002D3C38;
    id v28 = v24;
    id v29 = v17;
    [v28 notifyOnQueue:v26 block:v27];
  }
}

- (void)createLeaderboardBasedOnID:(id)a3 recipients:(id)a4 inviteMessage:(id)a5 context:(id)a6 duration:(double)a7 handler:(id)a8
{
  if (a8) {
    (*((void (**)(id, void, void, double))a8 + 2))(a8, 0, 0, a7);
  }
}

- (void)startLeaderboardWithID:(id)a3 handler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)endLeaderboardWithID:(id)a3 handler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)deleteLeaderboardWithID:(id)a3 handler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)getLeaderboardSummaryForGameDescriptor:(id)a3 localPlayer:(id)a4 baseLeaderboardID:(id)a5 leaderboardID:(id)a6 timeScope:(int64_t)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if (v14 && v16)
  {
    id v19 = objc_alloc_init((Class)NSMutableDictionary);
    id v20 = [v14 dictionaryForRequest];
    [v19 setObject:v20 forKeyedSubscript:@"game"];
    id v21 = [v15 playerID];
    [v19 setObject:v21 forKeyedSubscript:@"player-id"];

    [v19 setObject:v16 forKeyedSubscript:@"base-leaderboard-id"];
    if ([v17 length]) {
      [v19 setObject:v17 forKeyedSubscript:@"leaderboard-id"];
    }
    id v22 = [(GKGameStatService *)self timeScopeName:a7];
    [v19 setObject:v22 forKeyedSubscript:@"time-scope"];

    id v23 = +[GKNetworkRequestManager commonNetworkRequestManager];
    id v24 = [(GKService *)self clientProxy];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10007C2A4;
    v26[3] = &unk_1002D50A0;
    v26[4] = self;
    id v27 = v18;
    [v23 issueRequest:v19 bagKey:@"gk-get-leaderboard-summary" clientProxy:v24 handler:v26];
  }
  else
  {
    id v25 = +[NSError userErrorForCode:16 underlyingError:0];
    (*((void (**)(id, void, void *))v18 + 2))(v18, 0, v25);
  }
}

@end