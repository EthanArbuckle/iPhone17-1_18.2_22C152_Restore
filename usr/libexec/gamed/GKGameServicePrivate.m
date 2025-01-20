@interface GKGameServicePrivate
+ (Class)interfaceClass;
+ (unint64_t)requiredEntitlements;
- (BOOL)requiresAuthenticationForSelector:(SEL)a3;
- (id)ampController;
- (id)cachedGamesPlayed:(id)a3 context:(id)a4;
- (id)internalGameSummariesFromResults:(id)a3 limit:(id)a4;
- (void)addGameActivityForActivityType:(id)a3 BundleID:(id)a4 userInfo:(id)a5 handler:(id)a6;
- (void)clearAppMetadataCacheWithCompletion:(id)a3;
- (void)clearGlobalGameCacheWithHandler:(id)a3;
- (void)fetchActivitiesForBundleID:(id)a3 ascending:(BOOL)a4 handler:(id)a5;
- (void)fetchGameMetadataForBundleIDs:(id)a3 responseKind:(int)a4 context:(id)a5 handler:(id)a6;
- (void)fetchGameStatsForPlayer:(id)a3 bundleIdentifiers:(id)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7;
- (void)fetchGamesForPlayer:(id)a3 includeInstalled:(BOOL)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7;
- (void)fetchGamesWithAchievementStatsForPlayer:(id)a3 context:(id)a4 handler:(id)a5;
- (void)fetchInstalledGameIdCacheWithHandler:(id)a3;
- (void)fetchOnDeviceMultiplayerGamesInContext:(id)a3 forBundleIDs:(id)a4 handler:(id)a5;
- (void)fetchRatingForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5;
- (void)fetchTopGamesInContext:(id)a3 handler:(id)a4;
- (void)getAppMetadataForBundleIDs:(id)a3 adamIDs:(id)a4 withCompletion:(id)a5;
- (void)getFriendListAccessForAllGames:(id)a3;
- (void)getGameInstallDataForBundleIDs:(id)a3 withCompletion:(id)a4;
- (void)getGameMetadataForBundleIDs:(id)a3 handler:(id)a4;
- (void)getGameStatsForPlayer:(id)a3 bundleIDs:(id)a4 handler:(id)a5;
- (void)getGamesForPlayer:(id)a3 includeInstalled:(BOOL)a4 handler:(id)a5;
- (void)getGamesPlayedMetaData:(id)a3 handler:(id)a4;
- (void)getGamesPlayedSummaries:(id)a3 limit:(id)a4 handler:(id)a5;
- (void)getGamesPlayedSummaries:(id)a3 limit:(id)a4 withinSecs:(id)a5 handler:(id)a6;
- (void)getGamesWithAchievementStatsForPlayer:(id)a3 handler:(id)a4;
- (void)getOnDeviceMultiplayerGamesForBundleIDs:(id)a3 handler:(id)a4;
- (void)getTopGamesWithHandler:(id)a3;
- (void)loadGameMetadataForBundleIDs:(id)a3 context:(id)a4 handler:(id)a5;
- (void)loadGameStatsForPlayer:(id)a3 bundleIdentifiers:(id)a4 context:(id)a5 handler:(id)a6;
- (void)loadGamesForPlayer:(id)a3 context:(id)a4 handler:(id)a5;
- (void)loadGamesWithAchievementStatsForPlayer:(id)a3 context:(id)a4 handler:(id)a5;
- (void)loadOnDeviceMultiplayerGamesWithContext:(id)a3 forBundleIDs:(id)a4 handler:(id)a5;
- (void)loadRatingForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5;
- (void)loadTopGamesWithContext:(id)a3 handler:(id)a4;
- (void)removeAllGameActivitiesForBundleID:(id)a3 handler:(id)a4;
- (void)removeAllGameActivitiesWithHandler:(id)a3;
- (void)removeGameForBundleID:(id)a3 handler:(id)a4;
- (void)restoreGameIdCacheWithHandler:(id)a3;
- (void)scanInstalledGamesForPlayer:(id)a3 transaction:(id)a4;
- (void)submitFriendListAccess:(id)a3 value:(id)a4 handler:(id)a5;
- (void)triggerGameActivityForChallenge:(id)a3 bundleID:(id)a4 handler:(id)a5;
@end

@implementation GKGameServicePrivate

+ (unint64_t)requiredEntitlements
{
  return 0x100000;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class();
}

- (id)cachedGamesPlayed:(id)a3 context:(id)a4
{
  id v5 = a4;
  v6 = +[NSPredicate predicateWithFormat:@"playerID == %@", a3];
  v7 = +[GamesPlayed _gkFetchRequest];
  [v7 setPredicate:v6];
  v8 = [v5 executeFetchRequest:v7 error:0];
  if ([v8 count])
  {
    v9 = [v8 objectAtIndexedSubscript:0];
    if ((unint64_t)[v8 count] >= 2)
    {
      unint64_t v10 = 1;
      do
      {
        v11 = [v8 objectAtIndexedSubscript:v10];
        [v5 deleteObject:v11];

        ++v10;
      }
      while (v10 < (unint64_t)[v8 count]);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)submitFriendListAccess:(id)a3 value:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[GKPlayerGameSettingsNetworkRequest alloc] initWithBundleID:v10 value:v9];

  v12 = +[GKNetworkRequestManager commonNetworkRequestManager];
  v13 = [(GKService *)self clientProxy];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005368C;
  v15[3] = &unk_1002D5EE8;
  v15[4] = self;
  id v16 = v8;
  id v14 = v8;
  [v12 writeToNetwork:v11 clientProxy:v13 handler:v15];
}

- (void)getGamesPlayedMetaData:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 626, "-[GKGameServicePrivate getGamesPlayedMetaData:handler:]");
  id v9 = [(GKService *)self transactionGroupWithName:v8];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100053AF0;
  v18[3] = &unk_1002D5F60;
  id v10 = v6;
  id v19 = v10;
  id v11 = v7;
  id v22 = v11;
  id v12 = v9;
  id v20 = v12;
  v21 = self;
  [v12 performOnManagedObjectContext:v18];
  if (v11)
  {
    v13 = [(GKService *)self clientProxy];
    id v14 = [v13 replyQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000549E4;
    v15[3] = &unk_1002D3C38;
    id v16 = v12;
    id v17 = v11;
    [v16 notifyOnQueue:v14 block:v15];
  }
}

- (void)getGamesPlayedSummaries:(id)a3 limit:(id)a4 handler:(id)a5
{
}

- (void)getGamesPlayedSummaries:(id)a3 limit:(id)a4 withinSecs:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(GKService *)self transactionGroupBypassingMultiUser];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100054C38;
  v24[3] = &unk_1002D5FB0;
  id v15 = v10;
  id v25 = v15;
  id v16 = v14;
  id v26 = v16;
  id v17 = v12;
  id v27 = v17;
  v28 = self;
  id v18 = v11;
  id v29 = v18;
  [v16 performOnManagedObjectContext:v24];
  if (v13)
  {
    id v19 = [(GKService *)self clientProxy];
    id v20 = [v19 replyQueue];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100055728;
    v21[3] = &unk_1002D3C38;
    id v22 = v16;
    id v23 = v13;
    [v22 notifyOnQueue:v20 block:v21];
  }
}

- (void)getGameInstallDataForBundleIDs:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v18 = 0;
  id v8 = +[GKGameInstallDataFetcher createAndReturnError:&v18];
  id v9 = v18;
  if (v9)
  {
    id v10 = [(GKService *)self clientProxy];
    id v11 = [v10 replyQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100055924;
    block[3] = &unk_1002D3930;
    id v17 = v7;
    id v16 = v9;
    dispatch_async(v11, block);

    id v12 = v17;
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10005593C;
    v13[3] = &unk_1002D4F38;
    v13[4] = self;
    id v14 = v7;
    [v8 fetchGameInstallInfoFor:v6 completionHandler:v13];
    id v12 = v14;
  }
}

- (id)ampController
{
  return +[GKAMPController controller];
}

- (void)getAppMetadataForBundleIDs:(id)a3 adamIDs:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 903, "-[GKGameServicePrivate getAppMetadataForBundleIDs:adamIDs:withCompletion:]");
  id v12 = +[GKDispatchGroup dispatchGroupWithName:v11];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100055C48;
  v23[3] = &unk_1002D48B0;
  v23[4] = self;
  id v13 = v12;
  id v24 = v13;
  id v25 = v8;
  id v26 = v9;
  id v14 = v9;
  id v15 = v8;
  [v13 perform:v23];
  id v16 = [(GKService *)self clientProxy];
  id v17 = [v16 replyQueue];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100055FB4;
  v20[3] = &unk_1002D3930;
  id v21 = v13;
  id v22 = v10;
  id v18 = v13;
  id v19 = v10;
  [v18 notifyOnQueue:v17 block:v20];
}

- (void)clearAppMetadataCacheWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 940, "-[GKGameServicePrivate clearAppMetadataCacheWithCompletion:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000561C4;
  v15[3] = &unk_1002D3A70;
  void v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  id v8 = [(GKService *)self clientProxy];
  id v9 = [v8 replyQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005637C;
  v12[3] = &unk_1002D3930;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (id)internalGameSummariesFromResults:(id)a3 limit:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v7, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v8 = +[NSThread callStackSymbols];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKGameServicePrivate internalGameSummariesFromResults:limit:]", v8);
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameService.m"];
    id v11 = [v10 lastPathComponent];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v9, "-[GKGameServicePrivate internalGameSummariesFromResults:limit:]", [v11 UTF8String], 968);

    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }

  id v13 = objc_alloc_init((Class)NSMutableArray);
  if ([v5 count])
  {
    id v14 = [v5 count];
    id v30 = v6;
    if (v6)
    {
      id v15 = [v6 longValue];
      if (v15 >= [v5 count]) {
        id v14 = [v5 count];
      }
      else {
        id v14 = [v6 longValue];
      }
    }
    id v16 = v14;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v31 = v5;
    id v17 = v5;
    id v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v33;
      uint64_t v21 = GKGameCenterIdentifier;
LABEL_10:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        id v23 = *(void **)(*((void *)&v32 + 1) + 8 * v22);
        id v24 = [v23 bundleID];
        unsigned __int8 v25 = [v24 isEqualToString:v21];

        if ((v25 & 1) == 0)
        {
          id v26 = [objc_alloc((Class)GKGameSummaryInternal) initWithGameSummary:v23];
          [v13 addObject:v26];
          id v27 = [v13 count];

          if (v27 >= v16) {
            break;
          }
        }
        if (v19 == (id)++v22)
        {
          id v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v19) {
            goto LABEL_10;
          }
          break;
        }
      }
    }

    id v6 = v30;
    id v5 = v31;
  }
  id v28 = [v13 copy];

  return v28;
}

- (BOOL)requiresAuthenticationForSelector:(SEL)a3
{
  if (sel_isEqual("getTopGamesWithHandler:", a3)) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)GKGameServicePrivate;
  return [(GKService *)&v6 requiresAuthenticationForSelector:a3];
}

- (void)fetchTopGamesInContext:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 1004, "-[GKGameServicePrivate fetchTopGamesInContext:handler:]");
  id v9 = [(GKService *)self clientProxy];
  id v10 = +[GKCacheTransactionGroup transactionGroupWithName:v8 context:v6 client:v9];

  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10005697C;
  v21[3] = &unk_1002D6040;
  id v11 = v10;
  id v22 = v11;
  id v23 = v25;
  id v24 = v27;
  [v11 performOnManagedObjectContext:v21];
  id v12 = [(GKService *)self clientProxy];
  id v13 = [v12 replyQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100056A90;
  v16[3] = &unk_1002D4B48;
  id v14 = v7;
  id v18 = v14;
  id v15 = v11;
  id v17 = v15;
  id v19 = v27;
  uint64_t v20 = v25;
  [v15 notifyOnQueue:v13 block:v16];

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
}

- (void)loadTopGamesWithContext:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 1028, "-[GKGameServicePrivate loadTopGamesWithContext:handler:]");
  id v9 = [(GKService *)self clientProxy];
  id v10 = +[GKCacheTransactionGroup transactionGroupWithName:v8 context:v7 client:v9];

  id v11 = [(GKService *)self clientProxy];
  id v12 = [v11 replyQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100056D24;
  v21[3] = &unk_1002D3A70;
  void v21[4] = self;
  id v13 = v10;
  id v22 = v13;
  [v13 performOnQueue:v12 block:v21];

  id v14 = [(GKService *)self clientProxy];
  id v15 = [v14 replyQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100056FEC;
  v18[3] = &unk_1002D3930;
  id v19 = v13;
  id v20 = v6;
  id v16 = v13;
  id v17 = v6;
  [v16 notifyOnQueue:v15 block:v18];
}

- (void)getTopGamesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 1065, "-[GKGameServicePrivate getTopGamesWithHandler:]");
  id v6 = [(GKService *)self transactionGroupWithName:v5];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100057218;
  v14[3] = &unk_1002D3A70;
  v14[4] = self;
  id v7 = v6;
  id v15 = v7;
  [v7 perform:v14];
  if (v4)
  {
    id v8 = [(GKService *)self clientProxy];
    id v9 = [v8 replyQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10005780C;
    v10[3] = &unk_1002D3A48;
    id v11 = v7;
    id v12 = self;
    id v13 = v4;
    [v11 notifyOnQueue:v9 block:v10];
  }
}

- (void)fetchOnDeviceMultiplayerGamesInContext:(id)a3 forBundleIDs:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 1122, "-[GKGameServicePrivate fetchOnDeviceMultiplayerGamesInContext:forBundleIDs:handler:]");
  id v12 = [(GKService *)self clientProxy];
  id v13 = +[GKCacheTransactionGroup transactionGroupWithName:v11 context:v8 client:v12];

  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100057D94;
  void v25[3] = &unk_1002D6108;
  id v14 = v9;
  id v26 = v14;
  id v15 = v13;
  id v27 = v15;
  char v28 = v30;
  id v29 = v32;
  [v15 performOnManagedObjectContext:v25];
  id v16 = [(GKService *)self clientProxy];
  id v17 = [v16 replyQueue];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10005800C;
  v20[3] = &unk_1002D4B48;
  id v18 = v10;
  id v22 = v18;
  id v19 = v15;
  id v21 = v19;
  id v23 = v32;
  id v24 = v30;
  [v19 notifyOnQueue:v17 block:v20];

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
}

- (void)loadOnDeviceMultiplayerGamesWithContext:(id)a3 forBundleIDs:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 1160, "-[GKGameServicePrivate loadOnDeviceMultiplayerGamesWithContext:forBundleIDs:handler:]");
  id v12 = [(GKService *)self clientProxy];
  id v13 = +[GKCacheTransactionGroup transactionGroupWithName:v11 context:v10 client:v12];

  id v14 = [(GKService *)self clientProxy];
  id v15 = [v14 replyQueue];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000582CC;
  void v25[3] = &unk_1002D3980;
  id v26 = v8;
  id v27 = self;
  id v16 = v13;
  id v28 = v16;
  id v17 = v8;
  [v16 performOnQueue:v15 block:v25];

  id v18 = [(GKService *)self clientProxy];
  id v19 = [v18 replyQueue];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100058620;
  v22[3] = &unk_1002D3930;
  id v23 = v16;
  id v24 = v9;
  id v20 = v16;
  id v21 = v9;
  [v20 notifyOnQueue:v19 block:v22];
}

- (void)getOnDeviceMultiplayerGamesForBundleIDs:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 1192, "-[GKGameServicePrivate getOnDeviceMultiplayerGamesForBundleIDs:handler:]");
  id v9 = [(GKService *)self transactionGroupWithName:v8];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005886C;
  v17[3] = &unk_1002D3980;
  v17[4] = self;
  id v10 = v9;
  id v18 = v10;
  id v11 = v6;
  id v19 = v11;
  [v10 perform:v17];
  if (v7)
  {
    id v12 = [(GKService *)self clientProxy];
    id v13 = [v12 replyQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100058ECC;
    v14[3] = &unk_1002D3930;
    id v16 = v7;
    id v15 = v10;
    [v15 notifyOnQueue:v13 block:v14];
  }
}

- (void)scanInstalledGamesForPlayer:(id)a3 transaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GKService *)self clientProxy];
  id v9 = [v8 replyQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100059050;
  v12[3] = &unk_1002D3980;
  void v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  [v11 performOnQueue:v9 block:v12];
}

- (void)fetchGamesForPlayer:(id)a3 includeInstalled:(BOOL)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  BOOL v38 = a5 == 2;
  id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 1311, "-[GKGameServicePrivate fetchGamesForPlayer:includeInstalled:responseKind:context:handler:]");
  id v16 = [(GKService *)self clientProxy];
  id v17 = +[GKCacheTransactionGroup transactionGroupWithName:v15 context:v13 client:v16];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100059A5C;
  v29[3] = &unk_1002D6210;
  id v18 = v12;
  id v30 = v18;
  char v33 = v37;
  long long v34 = v39;
  int v35 = a5;
  id v19 = v17;
  BOOL v36 = a4;
  id v31 = v19;
  long long v32 = self;
  [v19 performOnManagedObjectContext:v29];
  id v20 = [(GKService *)self clientProxy];
  id v21 = [v20 replyQueue];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10005A038;
  v24[3] = &unk_1002D4B48;
  id v22 = v14;
  id v26 = v22;
  id v23 = v19;
  id v25 = v23;
  id v27 = v39;
  id v28 = v37;
  [v23 notifyOnQueue:v21 block:v24];

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);
}

- (void)loadGamesForPlayer:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 1386, "-[GKGameServicePrivate loadGamesForPlayer:context:handler:]");
  id v12 = [(GKService *)self clientProxy];
  id v13 = +[GKCacheTransactionGroup transactionGroupWithName:v11 context:v9 client:v12];

  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  void v27[3] = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10005A308;
  v22[3] = &unk_1002D6368;
  id v14 = v8;
  id v23 = v14;
  id v15 = v13;
  id v24 = v15;
  id v25 = self;
  id v26 = v27;
  [v15 performOnManagedObjectContext:v22];
  if (v10)
  {
    id v16 = [(GKService *)self clientProxy];
    id v17 = [v16 replyQueue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10005AEF4;
    v18[3] = &unk_1002D4248;
    id v20 = v10;
    id v21 = v27;
    id v19 = v15;
    [v19 notifyOnQueue:v17 block:v18];
  }
  _Block_object_dispose(v27, 8);
}

- (void)getGamesForPlayer:(id)a3 includeInstalled:(BOOL)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 1477, "-[GKGameServicePrivate getGamesForPlayer:includeInstalled:handler:]");
  id v11 = [(GKService *)self transactionGroupWithName:v10];

  id v12 = [v8 playerID];

  if (!v12)
  {
    id v13 = +[GKLocalPlayerInternal internalRepresentation];

    id v14 = [v11 context];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10005B23C;
    void v30[3] = &unk_1002D40E0;
    id v8 = v13;
    id v31 = v8;
    [v14 performBlockAndWait:v30];
  }
  id v15 = [(GKService *)self clientProxy];
  id v16 = [v15 replyQueue];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10005B298;
  void v25[3] = &unk_1002D6458;
  void v25[4] = self;
  id v17 = v8;
  id v26 = v17;
  BOOL v29 = a4;
  id v18 = v9;
  id v28 = v18;
  id v19 = v11;
  id v27 = v19;
  [v19 performOnQueue:v16 block:v25];

  if (v18)
  {
    id v20 = [(GKService *)self clientProxy];
    id v21 = [v20 replyQueue];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10005BCF4;
    v22[3] = &unk_1002D3930;
    id v24 = v18;
    id v23 = v19;
    [v23 notifyOnQueue:v21 block:v22];
  }
}

- (void)fetchGameStatsForPlayer:(id)a3 bundleIdentifiers:(id)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 1559, "-[GKGameServicePrivate fetchGameStatsForPlayer:bundleIdentifiers:responseKind:context:handler:]");
  id v17 = [(GKService *)self clientProxy];
  id v18 = +[GKCacheTransactionGroup transactionGroupWithName:v16 context:v14 client:v17];

  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  BOOL v42 = a5 == 2;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10005C054;
  v31[3] = &unk_1002D64A8;
  id v37 = [v13 count];
  int v35 = v41;
  id v19 = v12;
  id v32 = v19;
  id v20 = v13;
  id v33 = v20;
  BOOL v36 = v39;
  int v38 = a5;
  id v21 = v18;
  id v34 = v21;
  [v21 performOnManagedObjectContext:v31];
  id v22 = [(GKService *)self clientProxy];
  id v23 = [v22 replyQueue];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10005C37C;
  v26[3] = &unk_1002D4B48;
  id v24 = v15;
  id v28 = v24;
  id v25 = v21;
  id v27 = v25;
  BOOL v29 = v39;
  id v30 = v41;
  [v25 notifyOnQueue:v23 block:v26];

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
}

- (void)loadGameStatsForPlayer:(id)a3 bundleIdentifiers:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 1612, "-[GKGameServicePrivate loadGameStatsForPlayer:bundleIdentifiers:context:handler:]");
  id v15 = [(GKService *)self clientProxy];
  id v16 = +[GKCacheTransactionGroup transactionGroupWithName:v14 context:v13 client:v15];

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10005C610;
  void v27[3] = &unk_1002D4FB0;
  id v28 = v11;
  id v29 = v10;
  id v17 = v16;
  id v30 = v17;
  id v31 = self;
  id v18 = v10;
  id v19 = v11;
  [v17 performOnManagedObjectContext:v27];
  id v20 = [(GKService *)self clientProxy];
  id v21 = [v20 replyQueue];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10005D050;
  v24[3] = &unk_1002D3930;
  id v25 = v17;
  id v26 = v12;
  id v22 = v17;
  id v23 = v12;
  [v22 notifyOnQueue:v21 block:v24];
}

- (void)getGameStatsForPlayer:(id)a3 bundleIDs:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 1711, "-[GKGameServicePrivate getGameStatsForPlayer:bundleIDs:handler:]");
  id v12 = [(GKService *)self transactionGroupWithName:v11];

  id v13 = [(GKService *)self clientProxy];
  id v14 = [v13 replyQueue];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10005D300;
  v24[3] = &unk_1002D6628;
  id v15 = v12;
  id v25 = v15;
  id v16 = v8;
  id v26 = v16;
  id v27 = self;
  id v17 = v9;
  id v28 = v17;
  id v18 = v10;
  id v29 = v18;
  [v15 performOnQueue:v14 block:v24];

  if (v18)
  {
    id v19 = [(GKService *)self clientProxy];
    id v20 = [v19 replyQueue];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10005DD84;
    v21[3] = &unk_1002D3930;
    id v23 = v18;
    id v22 = v15;
    [v22 notifyOnQueue:v20 block:v21];
  }
}

- (void)fetchGameMetadataForBundleIDs:(id)a3 responseKind:(int)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!os_log_GKGeneral) {
    id v13 = (id)GKOSLoggers();
  }
  id v14 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "GKGameService: fetchGameMetadataForBundleIDs:", buf, 2u);
  }
  id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 1782, "-[GKGameServicePrivate fetchGameMetadataForBundleIDs:responseKind:context:handler:]");
  id v16 = [(GKService *)self clientProxy];
  id v17 = +[GKCacheTransactionGroup transactionGroupWithName:v15 context:v11 client:v16];

  *(void *)buf = 0;
  int v38 = buf;
  uint64_t v39 = 0x2020000000;
  BOOL v40 = a4 == 2;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  char v36 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10005E0E8;
  v29[3] = &unk_1002D6650;
  id v18 = v10;
  id v30 = v18;
  id v32 = buf;
  id v33 = v35;
  int v34 = a4;
  id v19 = v17;
  id v31 = v19;
  [v19 performOnManagedObjectContext:v29];
  id v20 = [(GKService *)self clientProxy];
  id v21 = [v20 replyQueue];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10005E444;
  v24[3] = &unk_1002D4B48;
  id v22 = v12;
  id v26 = v22;
  id v23 = v19;
  id v25 = v23;
  id v27 = v35;
  id v28 = buf;
  [v23 notifyOnQueue:v21 block:v24];

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(buf, 8);
}

- (void)loadGameMetadataForBundleIDs:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers();
  }
  id v12 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "GKGameService: loadGameMetadataForBundleIDs:", buf, 2u);
  }
  id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 1836, "-[GKGameServicePrivate loadGameMetadataForBundleIDs:context:handler:]");
  id v14 = [(GKService *)self clientProxy];
  id v15 = +[GKCacheTransactionGroup transactionGroupWithName:v13 context:v9 client:v14];

  *(void *)buf = 0;
  id v30 = buf;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10005E74C;
  v24[3] = &unk_1002D6368;
  id v16 = v8;
  id v25 = v16;
  id v17 = v15;
  id v26 = v17;
  id v27 = self;
  id v28 = buf;
  [v17 performOnManagedObjectContext:v24];
  if (v10)
  {
    id v18 = [(GKService *)self clientProxy];
    id v19 = [v18 replyQueue];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10005EEB0;
    v20[3] = &unk_1002D4248;
    id v22 = v10;
    id v23 = buf;
    id v21 = v17;
    [v21 notifyOnQueue:v19 block:v20];
  }
  _Block_object_dispose(buf, 8);
}

- (void)getGameMetadataForBundleIDs:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKGameService: getGameMetadataForBundleIDs:", buf, 2u);
  }
  id v10 = [(GKService *)self transactionGroupBypassingMultiUser];
  id v11 = [(GKService *)self clientProxy];
  id v12 = [v11 replyQueue];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10005F128;
  v20[3] = &unk_1002D6790;
  void v20[4] = self;
  id v13 = v6;
  id v21 = v13;
  id v14 = v7;
  id v24 = v14;
  id v15 = v10;
  id v22 = v15;
  id v16 = v12;
  id v23 = v16;
  [v15 perform:v20];
  if (v14)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10005F858;
    v17[3] = &unk_1002D3930;
    id v19 = v14;
    id v18 = v15;
    [v18 notifyOnQueue:v16 block:v17];
  }
}

- (void)fetchRatingForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005F9B8;
  v11[3] = &unk_1002D39F8;
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  id v15 = a5;
  id v8 = v15;
  id v9 = v13;
  id v10 = v12;
  [v9 performBlock:v11];
}

- (void)loadRatingForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 1976, "-[GKGameServicePrivate loadRatingForGameDescriptor:context:handler:]");
  id v12 = [(GKService *)self clientProxy];
  id v13 = +[GKCacheTransactionGroup transactionGroupWithName:v11 context:v9 client:v12];

  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10005FE48;
  void v25[3] = &unk_1002D6830;
  id v14 = v8;
  id v26 = v14;
  id v27 = self;
  id v15 = v13;
  id v28 = v15;
  id v16 = v9;
  id v29 = v16;
  id v30 = v31;
  [v15 perform:v25];
  id v17 = [(GKService *)self clientProxy];
  id v18 = [v17 replyQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100060348;
  v21[3] = &unk_1002D4248;
  id v19 = v10;
  id v23 = v19;
  id v24 = v31;
  id v20 = v15;
  id v22 = v20;
  [v20 notifyOnQueue:v18 block:v21];

  _Block_object_dispose(v31, 8);
}

- (void)fetchGamesWithAchievementStatsForPlayer:(id)a3 context:(id)a4 handler:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100060480;
  v10[3] = &unk_1002D3A48;
  id v11 = a3;
  id v12 = self;
  id v13 = a5;
  id v8 = v13;
  id v9 = v11;
  [a4 performBlock:v10];
}

- (void)loadGamesWithAchievementStatsForPlayer:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 2044, "-[GKGameServicePrivate loadGamesWithAchievementStatsForPlayer:context:handler:]");
  id v12 = [(GKService *)self clientProxy];
  id v13 = +[GKCacheTransactionGroup transactionGroupWithName:v11 context:v9 client:v12];

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000608A8;
  v24[3] = &unk_1002D6368;
  id v14 = v8;
  id v25 = v14;
  id v15 = v13;
  id v26 = v15;
  id v27 = self;
  id v28 = v29;
  [v15 performOnManagedObjectContext:v24];
  id v16 = [(GKService *)self clientProxy];
  id v17 = [v16 replyQueue];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100060FC0;
  v20[3] = &unk_1002D4248;
  id v18 = v10;
  id v22 = v18;
  id v23 = v29;
  id v19 = v15;
  id v21 = v19;
  [v19 notifyOnQueue:v17 block:v20];

  _Block_object_dispose(v29, 8);
}

- (void)getGamesWithAchievementStatsForPlayer:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 2093, "-[GKGameServicePrivate getGamesWithAchievementStatsForPlayer:handler:]");
  id v9 = [(GKService *)self transactionGroupWithName:v8];

  id v10 = [(GKService *)self clientProxy];
  id v11 = [v10 replyQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100061240;
  v19[3] = &unk_1002D3980;
  id v12 = v9;
  id v20 = v12;
  id v13 = v6;
  id v21 = v13;
  id v22 = self;
  [v12 performOnQueue:v11 block:v19];

  if (v7)
  {
    id v14 = [(GKService *)self clientProxy];
    id v15 = [v14 replyQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100061C40;
    v16[3] = &unk_1002D3930;
    id v18 = v7;
    id v17 = v12;
    [v17 notifyOnQueue:v15 block:v16];
  }
}

- (void)removeGameForBundleID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 2155, "-[GKGameServicePrivate removeGameForBundleID:handler:]");
  id v9 = [(GKService *)self transactionGroupWithName:v8];

  if (v6)
  {
    id v10 = [(GKService *)self clientProxy];
    id v11 = [v10 replyQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100061EC0;
    v16[3] = &unk_1002D3980;
    id v17 = v9;
    id v18 = self;
    id v19 = v6;
    [v17 performOnQueue:v11 block:v16];
  }
  if (v7)
  {
    id v12 = [(GKService *)self clientProxy];
    id v13 = [v12 replyQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100062200;
    v14[3] = &unk_1002D3A20;
    id v15 = v7;
    [v9 notifyOnQueue:v13 block:v14];
  }
}

- (void)fetchInstalledGameIdCacheWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 2189, "-[GKGameServicePrivate fetchInstalledGameIdCacheWithHandler:]");
  id v6 = [(GKService *)self transactionGroupWithName:v5 forPlayerID:0];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000623A8;
  v16[3] = &unk_1002D51F8;
  id v7 = v6;
  id v17 = v7;
  [v7 performOnManagedObjectContext:v16];
  id v8 = [(GKService *)self clientProxy];
  id v9 = [v8 replyQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100062574;
  v12[3] = &unk_1002D3A48;
  id v13 = v7;
  id v14 = self;
  id v15 = v4;
  id v10 = v4;
  id v11 = v7;
  [v11 notifyOnQueue:v9 block:v12];
}

- (void)restoreGameIdCacheWithHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKCache;
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_100064BAC(v6);
  }
  id v7 = +[GKApplicationWorkspace defaultWorkspace];
  id v8 = objc_alloc((Class)NSMutableSet);
  id v9 = [v7 availableGameIdentifiers];
  id v10 = [v8 initWithArray:v9];

  [v10 removeObject:GKWidgetIdentifier];
  id v11 = [v10 allObjects];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10006277C;
  v14[3] = &unk_1002D5EE8;
  id v15 = v10;
  id v16 = v4;
  id v12 = v10;
  id v13 = v4;
  [(GKGameService *)self storeGameForBundleIDs:v11 completion:v14];
}

- (void)clearGlobalGameCacheWithHandler:(id)a3
{
  id v20 = a3;
  id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 2231, "-[GKGameServicePrivate clearGlobalGameCacheWithHandler:]");
  id v5 = [(GKService *)self localPlayer];
  id v6 = [v5 playerID];
  id v7 = [(GKService *)self transactionGroupWithName:v4 forPlayerID:v6];

  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  v34[2] = objc_opt_class();
  v34[3] = objc_opt_class();
  +[NSArray arrayWithObjects:v34 count:4];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v13 = [v12 _gkFetchRequest];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100062AB0;
        void v25[3] = &unk_1002D68F8;
        id v26 = v13;
        id v14 = v7;
        id v27 = v14;
        id v28 = v12;
        id v15 = v13;
        [v14 performOnManagedObjectContext:v25];
      }
      id v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v9);
  }

  id v16 = [(GKService *)self clientProxy];
  id v17 = [v16 replyQueue];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100062C58;
  v22[3] = &unk_1002D3930;
  id v23 = v7;
  id v24 = v20;
  id v18 = v7;
  id v19 = v20;
  [v18 notifyOnQueue:v17 block:v22];
}

- (void)getFriendListAccessForAllGames:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(GKService *)self transactionGroupBypassingMultiUser];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100062FF8;
    v12[3] = &unk_1002D69F0;
    void v12[4] = self;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = v5;
    id v14 = &stru_1002D6938;
    [v5 performOnManagedObjectContext:v12];
    id v6 = [(GKService *)self clientProxy];
    id v7 = [v6 replyQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000638EC;
    v9[3] = &unk_1002D3C38;
    id v10 = v5;
    id v11 = v4;
    id v8 = v5;
    [v8 notifyOnQueue:v7 block:v9];
  }
}

- (void)triggerGameActivityForChallenge:(id)a3 bundleID:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(GKService *)self transport];
  id v12 = [(GKService *)self clientProxy];
  id v13 = [(GKService *)self localPlayer];
  id v14 = +[GKService serviceWithTransport:v11 forClient:v12 localPlayer:v13];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100063AB4;
  v17[3] = &unk_1002D6A68;
  void v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v15 = v9;
  id v16 = v8;
  [v14 getLeaderboardChallengeDetailsForChallengeID:v10 allowStaleData:1 completionHandler:v17];
}

- (void)addGameActivityForActivityType:(id)a3 BundleID:(id)a4 userInfo:(id)a5 handler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)GKGameActivityInternal) initWithActivityType:v12 bundleID:v11 andUserInfo:v10];

  id v14 = +[GKGameService sharedGameActivityStore];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100064320;
  v16[3] = &unk_1002D3A20;
  id v17 = v9;
  id v15 = v9;
  [v14 add:v13 completionHandler:v16];
}

- (void)fetchActivitiesForBundleID:(id)a3 ascending:(BOOL)a4 handler:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = +[GKGameService sharedGameActivityStore];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100064404;
  v11[3] = &unk_1002D3EF8;
  id v12 = v7;
  id v10 = v7;
  [v9 fetchActivitiesWithBundleID:v8 ascending:v5 completionHandler:v11];
}

- (void)removeAllGameActivitiesWithHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[GKGameService sharedGameActivityStore];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000644C0;
  v6[3] = &unk_1002D3A20;
  id v7 = v3;
  id v5 = v3;
  [v4 removeAllActivitiesWithCompletionHandler:v6];
}

- (void)removeAllGameActivitiesForBundleID:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[GKGameService sharedGameActivityStore];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006459C;
  v9[3] = &unk_1002D3A20;
  id v10 = v5;
  id v8 = v5;
  [v7 removeActivitiesForBundleID:v6 completionHandler:v9];
}

@end