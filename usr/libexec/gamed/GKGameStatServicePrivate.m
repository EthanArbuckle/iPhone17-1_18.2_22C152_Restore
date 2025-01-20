@interface GKGameStatServicePrivate
+ (Class)interfaceClass;
+ (id)currentFriendsPlayedList:(id)a3;
+ (id)filterUnreportedAndHiddenAchievements:(id)a3 includeUnreported:(BOOL)a4 includeHidden:(BOOL)a5;
+ (unint64_t)requiredEntitlements;
- (id)ensureGameObject:(id)a3 gameDescriptor:(id)a4;
- (id)ensureGameObjectsForDescriptors:(id)a3 moc:(id)a4;
- (id)existingReengagementAchievement:(id)a3 context:(id)a4;
- (id)findAchievementInternal:(id)a3 identifier:(id)a4 context:(id)a5 existingPercent:(double)a6 existingDate:(id)a7;
- (id)getCachedAcievementListForLocalPlayer:(id)a3 context:(id)a4;
- (id)processReengagementResults:(id)a3 localPlayer:(id)a4 expirationDate:(id)a5 context:(id)a6;
- (void)clearAchievementsCacheWithHandler:(id)a3;
- (void)clearLeaderboardsCacheWithHandler:(id)a3;
- (void)expireGamesFriendsPlayed;
- (void)getAchievementLeaderboardForRequest:(id)a3 handler:(id)a4;
- (void)getEntriesForLeaderboard:(id)a3 fetchOptions:(unint64_t)a4 gameDescriptor:(id)a5 localPlayer:(id)a6 playerScope:(int64_t)a7 timeScope:(int64_t)a8 range:(_NSRange)a9 players:(id)a10 handler:(id)a11;
- (void)getGamesFriendsPlayed:(int64_t)a3 type:(id)a4 fetchOptions:(unint64_t)a5 withinSecs:(int64_t)a6 matchingBundleIDs:(id)a7 handler:(id)a8;
- (void)getGamesFriendsPlayed:(int64_t)a3 type:(id)a4 withinSecs:(int64_t)a5 matchingBundleIDs:(id)a6 handler:(id)a7;
- (void)getHypotheticalLeaderboardRanksForScores:(id)a3 forGameDescriptor:(id)a4 handler:(id)a5;
- (void)getReengagementAchievement:(id)a3;
- (void)getReengagementAchievements:(id)a3;
- (void)loadAchievementsForGameWithProfileFetchOptions:(id)a3 players:(id)a4 includeUnreported:(BOOL)a5 includeHidden:(BOOL)a6 profileFetchOptions:(unint64_t)a7 withCompletionHandler:(id)a8;
- (void)loadGamesFriendsPlayed:(id)a3 matchingBundleIDs:(id)a4 handler:(id)a5;
- (void)loadReengagementAchievements:(id)a3 handler:(id)a4;
@end

@implementation GKGameStatServicePrivate

+ (unint64_t)requiredEntitlements
{
  return 0x100000;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class();
}

+ (id)filterUnreportedAndHiddenAchievements:(id)a3 includeUnreported:(BOOL)a4 includeHidden:(BOOL)a5
{
  id v7 = a3;
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_10007C7A4;
  v14 = &unk_1002D7640;
  id v15 = objc_alloc_init((Class)NSMutableDictionary);
  BOOL v16 = a4;
  BOOL v17 = a5;
  id v8 = v15;
  [v7 enumerateKeysAndObjectsUsingBlock:&v11];

  id v9 = [v8 copy:v11, v12, v13, v14];

  return v9;
}

- (void)loadAchievementsForGameWithProfileFetchOptions:(id)a3 players:(id)a4 includeUnreported:(BOOL)a5 includeHidden:(BOOL)a6 profileFetchOptions:(unint64_t)a7 withCompletionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10007CA00;
  v19[3] = &unk_1002D77A8;
  v19[4] = self;
  id v20 = v14;
  BOOL v24 = a5;
  BOOL v25 = a6;
  id v22 = a8;
  unint64_t v23 = a7;
  id v21 = v15;
  id v16 = v22;
  id v17 = v15;
  id v18 = v14;
  [(GKGameStatService *)self getAchievementsForGameDescriptor:v18 players:v17 handler:v19];
}

- (void)getEntriesForLeaderboard:(id)a3 fetchOptions:(unint64_t)a4 gameDescriptor:(id)a5 localPlayer:(id)a6 playerScope:(int64_t)a7 timeScope:(int64_t)a8 range:(_NSRange)a9 players:(id)a10 handler:(id)a11
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a10;
  id v18 = a11;
  v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 2840, "-[GKGameStatServicePrivate getEntriesForLeaderboard:fetchOptions:gameDescriptor:localPlayer:playerScope:timeScope:range:players:handler:]");
  id v20 = [(GKService *)self transactionGroupWithName:v19];

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10007D470;
  v36[3] = &unk_1002D77F8;
  v36[4] = self;
  id v37 = v14;
  id v38 = v15;
  id v39 = v16;
  int64_t v43 = a8;
  _NSRange v44 = a9;
  int64_t v42 = a7;
  id v40 = v17;
  id v21 = v20;
  id v41 = v21;
  unint64_t v45 = a4;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v14;
  [v21 perform:v36];
  v26 = [(GKService *)self clientProxy];
  v27 = [v26 replyQueue];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10007D75C;
  v33[3] = &unk_1002D3930;
  id v34 = v21;
  id v35 = v18;
  id v28 = v21;
  id v29 = v18;
  [v28 notifyOnQueue:v27 block:v33];
}

- (void)getAchievementLeaderboardForRequest:(id)a3 handler:(id)a4
{
}

- (void)getHypotheticalLeaderboardRanksForScores:(id)a3 forGameDescriptor:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (v9)
    {
      if ([v8 count])
      {
        v11 = [v9 bundleIdentifier];
        uint64_t v12 = +[GKService serviceFromService:self];
        id v20 = v11;
        v13 = +[NSArray arrayWithObjects:&v20 count:1];
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10007DA14;
        v15[3] = &unk_1002D7848;
        id v19 = v10;
        id v16 = v8;
        id v17 = v9;
        id v18 = self;
        [v12 getGameStatsForPlayer:0 bundleIDs:v13 handler:v15];
      }
      else
      {
        (*((void (**)(id, void *, void))v10 + 2))(v10, &__NSArray0__struct, 0);
      }
    }
    else
    {
      id v14 = +[NSError userErrorForCode:17 underlyingError:0];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
    }
  }
}

- (id)ensureGameObjectsForDescriptors:(id)a3 moc:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 _gkMapWithBlock:&stru_1002D7868];
  id v8 = +[GKGameCacheObject gamesForBundleIDs:v7 context:v6];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007DEF8;
  v11[3] = &unk_1002D7890;
  id v12 = v5;
  id v9 = v5;
  [v8 enumerateObjectsUsingBlock:v11];

  return v8;
}

- (id)ensureGameObject:(id)a3 gameDescriptor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 objectForKeyedSubscript:@"bundle-id"];
  id v8 = +[GKGameCacheObject gameForBundleID:v7 context:v5];
  if (v8
    || (id v8 = [(GKCacheObject *)[GKGameCacheObject alloc] initWithManagedObjectContext:v5], [(GKGameCacheObject *)v8 setBundleID:v7], v8))
  {
    [(GKGameCacheObject *)v8 updateWithGameDescriptor:v6];
  }

  return v8;
}

- (void)loadGamesFriendsPlayed:(id)a3 matchingBundleIDs:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = +[GKNetworkRequestManager commonNetworkRequestManager];
  uint64_t v12 = GKBagKeyGamesFriendsPlayed;
  v13 = [(GKService *)self clientProxy];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10007E158;
  v16[3] = &unk_1002D7928;
  id v17 = v8;
  id v18 = v9;
  v16[4] = self;
  id v14 = v8;
  id v15 = v9;
  [v11 issueRequest:v10 bagKey:v12 clientProxy:v13 handler:v16];
}

+ (id)currentFriendsPlayedList:(id)a3
{
  id v3 = a3;
  v4 = +[FriendsPlayedGameList _gkFetchRequest];
  id v23 = 0;
  id v5 = [v3 executeFetchRequest:v4 error:&v23];
  id v6 = v23;
  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers();
    }
    id v8 = os_log_GKDaemon;
    if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    id v9 = "Could not fetch data from cache: %@";
    id v10 = v8;
    uint32_t v11 = 12;
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
LABEL_7:
    uint64_t v12 = 0;
    goto LABEL_8;
  }
  uint64_t v14 = (uint64_t)[v5 count];
  if (!os_log_GKGeneral) {
    id v15 = (id)GKOSLoggers();
  }
  id v16 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v17 = v16;
    id v18 = +[NSNumber numberWithInteger:v14];
    *(_DWORD *)buf = 138412290;
    id v25 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "currentCacheCount: %@", buf, 0xCu);
  }
  if (!v14)
  {
    if (!os_log_GKGeneral) {
      id v21 = (id)GKOSLoggers();
    }
    id v22 = os_log_GKDaemon;
    if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    id v9 = "No gameFriendsPlayed data in cache, hitting server";
    id v10 = v22;
    uint32_t v11 = 2;
    goto LABEL_6;
  }
  uint64_t v12 = [v5 objectAtIndexedSubscript:0];
  if (v14 >= 2)
  {
    for (uint64_t i = 1; i != v14; ++i)
    {
      id v20 = [v5 objectAtIndexedSubscript:i];
      [v3 deleteObject:v20];
    }
  }
LABEL_8:

  return v12;
}

- (void)expireGamesFriendsPlayed
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  v4 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Expiring games friends played", buf, 2u);
  }
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 3110, "-[GKGameStatServicePrivate expireGamesFriendsPlayed]");
  id v6 = [(GKGameStatServicePrivate *)self currentLocalPlayer];
  id v7 = [v6 playerID];
  id v8 = [(GKService *)self transactionGroupWithName:v5 forPlayerID:v7];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007F1D0;
  v9[3] = &unk_1002D51F8;
  v9[4] = self;
  [v8 performOnManagedObjectContext:v9];
}

- (void)getGamesFriendsPlayed:(int64_t)a3 type:(id)a4 withinSecs:(int64_t)a5 matchingBundleIDs:(id)a6 handler:(id)a7
{
}

- (void)getGamesFriendsPlayed:(int64_t)a3 type:(id)a4 fetchOptions:(unint64_t)a5 withinSecs:(int64_t)a6 matchingBundleIDs:(id)a7 handler:(id)a8
{
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = [(GKGameStatServicePrivate *)self currentLocalPlayer];
  id v18 = [(GKService *)self clientProxy];
  id v19 = +[GKService serviceWithTransport:0 forClient:v18 localPlayer:v17];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10007F44C;
  v24[3] = &unk_1002D7978;
  id v29 = v16;
  int64_t v30 = a3;
  id v25 = v14;
  v26 = self;
  id v27 = v17;
  id v28 = v15;
  int64_t v31 = a6;
  unint64_t v32 = a5;
  id v20 = v15;
  id v21 = v17;
  id v22 = v14;
  id v23 = v16;
  [v19 getFriendsForPlayer:v21 commonFriends:0 handler:v24];
}

- (id)getCachedAcievementListForLocalPlayer:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:v5];
  id v8 = +[GKGameCacheObject gameForBundleID:v6 context:v5];

  id v9 = [v7 achievementLists];
  id v10 = +[NSMutableSet setWithSet:v9];

  uint32_t v11 = [v8 achievementLists];
  [v10 intersectSet:v11];

  uint64_t v12 = [v10 anyObject];

  return v12;
}

- (id)findAchievementInternal:(id)a3 identifier:(id)a4 context:(id)a5 existingPercent:(double)a6 existingDate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = +[GKCacheObject fetchRequestForContext:v14];
  id v17 = +[NSPredicate predicateWithFormat:@"game.bundleID == %@", v12];
  [v16 setPredicate:v17];

  id v18 = [v14 executeFetchRequest:v16 error:0];
  if (![v18 count])
  {
    id v30 = 0;
    goto LABEL_35;
  }
  id v19 = [(GKGameStatServicePrivate *)self getCachedAcievementListForLocalPlayer:v12 context:v14];
  id v51 = v12;
  id v52 = v15;
  v50 = v16;
  v53 = v19;
  v54 = v18;
  if (v19)
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v20 = [v19 entries];
    id v21 = [v20 countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v21)
    {
      id v22 = v21;
      id v23 = 0;
      uint64_t v24 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v22; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v60 != v24) {
            objc_enumerationMutation(v20);
          }
          v26 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          id v27 = [v26 identifier];
          unsigned int v28 = [v27 isEqualToString:v13];

          if (v28)
          {
            id v29 = v26;

            id v23 = v29;
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v22);

      if (v23) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    [v53 expire];
  }
  id v23 = 0;
LABEL_18:
  int64_t v31 = [v54 objectAtIndexedSubscript:0];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  unint64_t v32 = [v31 entries];
  id v33 = [v32 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v33)
  {
    id v34 = v33;
    v48 = v31;
    id v49 = v14;
    id v35 = 0;
    uint64_t v36 = *(void *)v56;
    do
    {
      for (j = 0; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v56 != v36) {
          objc_enumerationMutation(v32);
        }
        id v38 = *(void **)(*((void *)&v55 + 1) + 8 * (void)j);
        id v39 = [v38 identifier];
        unsigned int v40 = [v39 isEqualToString:v13];

        if (v40)
        {
          id v41 = v38;

          id v35 = v41;
        }
      }
      id v34 = [v32 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v34);

    if (v35)
    {
      int64_t v42 = [v35 internalRepresentation];
      [v23 percentComplete];
      double v44 = v43;
      id v14 = v49;
      if (v44 >= a6)
      {
        [v23 percentComplete];
        [v42 setPercentComplete:v45];
        v46 = [v23 lastReportedDate];
        [v42 setLastReportedDate:v46];
      }
      else
      {
        *(float *)&double v44 = a6;
        [v23 setPercentComplete:v44];
        [v23 setLastReportedDate:v52];
        [v42 setPercentComplete:a6];
        [v42 setLastReportedDate:v52];
      }
      int64_t v31 = v48;
      id v30 = v42;
    }
    else
    {
      id v30 = 0;
      int64_t v31 = v48;
      id v14 = v49;
    }
  }
  else
  {

    id v35 = 0;
    id v30 = 0;
  }

  id v12 = v51;
  id v15 = v52;
  id v16 = v50;
  id v18 = v54;
LABEL_35:

  return v30;
}

- (id)existingReengagementAchievement:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[ReengagementAchievementEntry _gkFetchRequest];
  id v8 = +[NSPredicate predicateWithFormat:@"playerID == %@", v5];
  [v7 setPredicate:v8];

  id v22 = 0;
  id v9 = [v6 executeFetchRequest:v7 error:&v22];
  id v10 = v22;
  if (v10)
  {
    if (!os_log_GKGeneral) {
      id v11 = (id)GKOSLoggers();
    }
    id v12 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Could not fetch reengagement data from cache: %@", buf, 0xCu);
    }
    id v13 = 0;
  }
  else
  {
    uint64_t v14 = (uint64_t)[v9 count];
    id v13 = (void *)v14;
    if (v14)
    {
      if (v14 >= 2)
      {
        if (!os_log_GKGeneral) {
          id v15 = (id)GKOSLoggers();
        }
        id v16 = (void *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          id v17 = v16;
          id v18 = +[NSNumber numberWithInteger:v13];
          *(_DWORD *)buf = 138412290;
          id v24 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "more than one reengagementAchievement need to cleanup: %@", buf, 0xCu);
        }
        uint64_t v19 = 1;
        do
        {
          id v20 = [v9 objectAtIndexedSubscript:v19];
          [v6 deleteObject:v20];

          ++v19;
        }
        while (v13 != (void *)v19);
      }
      id v13 = [v9 objectAtIndexedSubscript:0];
    }
  }

  return v13;
}

- (id)processReengagementResults:(id)a3 localPlayer:(id)a4 expirationDate:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 count])
  {
    uint64_t v14 = [v10 objectAtIndexedSubscript:0];
    id v15 = [v14 objectForKeyedSubscript:@"achievements"];
    if ([v15 count])
    {
      id v46 = v12;
      float v45 = [v14 objectForKeyedSubscript:@"game"];
      uint64_t v44 = [v45 objectForKeyedSubscript:@"bundle-id"];
      id v16 = [v15 objectAtIndexedSubscript:0];
      uint64_t v42 = [v16 objectForKeyedSubscript:@"achievement-id"];
      id v17 = [v16 objectForKeyedSubscript:@"achievement-pct"];
      unsigned int v40 = [v16 objectForKeyedSubscript:@"timestamp"];
      [v40 doubleValue];
      uint64_t v19 = +[NSDate dateWithTimeIntervalSince1970:v18 / 1000.0];
      id v20 = v11;
      id v21 = (void *)v19;
      v47 = v20;
      id v22 = [v20 playerID];
      id v23 = [(GKGameStatServicePrivate *)self existingReengagementAchievement:v22 context:v13];

      float v43 = v14;
      id v41 = v15;
      if (v23)
      {
        if (!os_log_GKGeneral) {
          id v24 = (id)GKOSLoggers();
        }
        id v25 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v23;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Using existing reengagement entry: %@", buf, 0xCu);
        }
        v26 = (void *)v44;
        id v27 = (void *)v42;
      }
      else
      {
        if (!os_log_GKGeneral) {
          id v33 = (id)GKOSLoggers();
        }
        id v39 = self;
        id v34 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Creating new reengagement entry", buf, 2u);
        }
        id v35 = [ReengagementAchievementEntry alloc];
        uint64_t v36 = +[ReengagementAchievementEntry entity];
        id v23 = [(ReengagementAchievementEntry *)v35 initWithEntity:v36 insertIntoManagedObjectContext:v13];

        v26 = (void *)v44;
        [(ReengagementAchievementEntry *)v23 setBundleID:v44];
        id v27 = (void *)v42;
        [(ReengagementAchievementEntry *)v23 setIdentifier:v42];
        id v37 = [v47 playerID];
        [(ReengagementAchievementEntry *)v23 setPlayerID:v37];

        self = v39;
      }
      [(ReengagementAchievementEntry *)v23 setPercentComplete:v17];
      [(ReengagementAchievementEntry *)v23 setLastReportedDate:v21];
      [(ReengagementAchievementEntry *)v23 setExpirationDate:v46];
      [v17 doubleValue];
      -[GKGameStatServicePrivate findAchievementInternal:identifier:context:existingPercent:existingDate:](self, "findAchievementInternal:identifier:context:existingPercent:existingDate:", v26, v27, v13, v21);
      id v30 = (id)objc_claimAutoreleasedReturnValue();

      id v12 = v46;
      id v11 = v47;
      uint64_t v14 = v43;
      id v15 = v41;
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v31 = (id)GKOSLoggers();
      }
      unint64_t v32 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Zero reengagement achievements from server", buf, 2u);
      }
      id v30 = 0;
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v28 = (id)GKOSLoggers();
    }
    id v29 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Zero server results for reengagement", buf, 2u);
    }
    id v30 = 0;
  }

  return v30;
}

- (void)loadReengagementAchievements:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v9 = +[GKNetworkRequestManager commonNetworkRequestManager];
  id v10 = [(GKService *)self clientProxy];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100080948;
  v13[3] = &unk_1002D7A18;
  id v14 = v6;
  id v15 = v7;
  v13[4] = self;
  id v11 = v6;
  id v12 = v7;
  [v9 issueRequest:v8 bagKey:@"gk-reengagement-achievements" clientProxy:v10 handler:v13];
}

- (void)getReengagementAchievements:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000812FC;
  v5[3] = &unk_1002D7A40;
  id v6 = a3;
  id v4 = v6;
  [(GKGameStatServicePrivate *)self getReengagementAchievement:v5];
}

- (void)getReengagementAchievement:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[GKPlayerCredentialController sharedController];
    id v6 = [(GKService *)self clientProxy];
    id v7 = [v5 pushCredentialForEnvironment:[v6 environment]];
    id v8 = [v7 playerInternal];

    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 3423, "-[GKGameStatServicePrivate getReengagementAchievement:]");
    id v10 = [(GKService *)self transactionGroupWithName:v9];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100081488;
    v13[3] = &unk_1002D5E50;
    v13[4] = self;
    id v14 = v8;
    id v15 = v10;
    id v16 = v4;
    id v11 = v10;
    id v12 = v8;
    [v11 performOnManagedObjectContext:v13];
  }
}

- (void)clearAchievementsCacheWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 3455, "-[GKGameStatServicePrivate clearAchievementsCacheWithHandler:]");
  id v6 = [(GKService *)self transactionGroupWithName:v5];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100081C50;
  v18[3] = &unk_1002D51F8;
  id v7 = v6;
  id v19 = v7;
  [v7 performOnManagedObjectContext:v18];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100081D24;
  v16[3] = &unk_1002D51F8;
  id v8 = v7;
  id v17 = v8;
  [v8 performOnManagedObjectContext:v16];
  id v9 = [(GKService *)self clientProxy];
  id v10 = [v9 replyQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100081DF8;
  v13[3] = &unk_1002D3930;
  id v14 = v8;
  id v15 = v4;
  id v11 = v8;
  id v12 = v4;
  [v11 notifyOnQueue:v10 block:v13];
}

- (void)clearLeaderboardsCacheWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameStatService.m", 3484, "-[GKGameStatServicePrivate clearLeaderboardsCacheWithHandler:]");
  id v6 = [(GKService *)self transactionGroupWithName:v5];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100081FF8;
  v15[3] = &unk_1002D51F8;
  id v7 = v6;
  id v16 = v7;
  [v7 performOnManagedObjectContext:v15];
  id v8 = [(GKService *)self clientProxy];
  id v9 = [v8 replyQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000820CC;
  v12[3] = &unk_1002D3930;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

@end