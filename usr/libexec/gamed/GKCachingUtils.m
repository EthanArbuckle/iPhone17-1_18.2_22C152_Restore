@interface GKCachingUtils
+ (id)compatiblePlatforms:(id)a3 platformLookup:(id)a4 moc:(id)a5;
+ (id)constructCompatiblePlatforms:(id)a3 moc:(id)a4;
+ (id)constructSupportedTransports:(id)a3 moc:(id)a4;
+ (id)ensureGamesPlayedList:(id)a3 playerID:(id)a4;
+ (id)existingGamePlatforms:(id)a3;
+ (id)existingSupportedTransports:(id)a3;
+ (id)supportedTransports:(id)a3 transportLookup:(id)a4 moc:(id)a5;
+ (void)ensureGameInGamesPlayed:(id)a3 playerID:(id)a4 bundleID:(id)a5 gameDescriptor:(id)a6 updateWidget:(BOOL)a7;
@end

@implementation GKCachingUtils

+ (id)compatiblePlatforms:(id)a3 platformLookup:(id)a4 moc:(id)a5
{
  id v7 = a4;
  id v23 = a5;
  v8 = [a3 objectForKeyedSubscript:@"platforms"];
  if ([v8 count])
  {
    id v9 = objc_alloc_init((Class)NSMutableSet);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v22 = v8;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v15, "length", v22))
          {
            v16 = [v7 objectForKeyedSubscript:v15];

            if (!v16)
            {
              v17 = [GamePlatform alloc];
              v18 = +[GamePlatform entity];
              v19 = [(GamePlatform *)v17 initWithEntity:v18 insertIntoManagedObjectContext:v23];

              [(GamePlatform *)v19 setName:v15];
              [v7 setObject:v19 forKeyedSubscript:v15];
            }
            v20 = [v7 objectForKeyedSubscript:v15];
            [v9 addObject:v20];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
    }

    v8 = v22;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)constructCompatiblePlatforms:(id)a3 moc:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[GKCachingUtils existingGamePlatforms:v5];
  v8 = +[GKCachingUtils compatiblePlatforms:v6 platformLookup:v7 moc:v5];

  return v8;
}

+ (id)constructSupportedTransports:(id)a3 moc:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[GKCachingUtils existingSupportedTransports:v5];
  v8 = +[GKCachingUtils supportedTransports:v6 transportLookup:v7 moc:v5];

  return v8;
}

+ (void)ensureGameInGamesPlayed:(id)a3 playerID:(id)a4 bundleID:(id)a5 gameDescriptor:(id)a6 updateWidget:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!os_log_GKGeneral) {
    id v15 = (id)GKOSLoggers();
  }
  v16 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v49 = v12;
    __int16 v50 = 2112;
    id v51 = v13;
    __int16 v52 = 2112;
    id v53 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Attempting to add game to games played: %@, %@, %@", buf, 0x20u);
  }
  if (v12 && v13 && v14)
  {
    BOOL v41 = v7;
    id v42 = v11;
    v17 = +[GKCachingUtils ensureGamesPlayedList:v11 playerID:v12];
    v18 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v40 = v17;
    v19 = [v17 entries];
    id v20 = [v19 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v44;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v44 != v22) {
            objc_enumerationMutation(v19);
          }
          long long v24 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          long long v25 = [v24 bundleID];

          if (v25)
          {
            long long v26 = [v24 bundleID];
            [v18 setObject:v24 forKeyedSubscript:v26];
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v21);
    }

    uint64_t v27 = [v18 objectForKeyedSubscript:v13];
    if (v27)
    {
      v28 = (GameSummary *)v27;
      v29 = v40;
      [v40 removeEntriesObject:v27];
      id v11 = v42;
      BOOL v30 = v41;
    }
    else
    {
      v31 = [GameSummary alloc];
      v32 = +[GameSummary entity];
      id v11 = v42;
      v28 = [(GameSummary *)v31 initWithEntity:v32 insertIntoManagedObjectContext:v42];

      BOOL v30 = v41;
      v29 = v40;
    }
    [v29 insertObject:v28 inEntriesAtIndex:0];
    v33 = +[GKCachingUtils constructCompatiblePlatforms:v14 moc:v11];
    [(GameSummary *)v28 setCompatiblePlatforms:v33];

    v34 = [v14 objectForKeyedSubscript:@"adam-id"];
    [(GameSummary *)v28 setAdamID:v34];

    v35 = [v14 objectForKeyedSubscript:@"bundle-id"];
    [(GameSummary *)v28 setBundleID:v35];

    v36 = [v14 objectForKeyedSubscript:@"is-arcade-game"];
    [(GameSummary *)v28 setIsArcade:v36];

    v37 = +[NSDate now];
    [(GameSummary *)v28 setPlayedAt:v37];

    if (v30)
    {
      id v38 = [objc_alloc((Class)CHSTimelineController) initForAvocadoIdentifier:@"ContinuePlayingWidget" inBundleIdentifier:@"com.apple.gamecenter.widgets.extension"];
      id v39 = [v38 reloadTimelineWithReason:&stru_1002E4F58];
    }
    +[GKClientProxy enumerateClientsUsingBlock:&stru_1002DC3C0];
  }
}

+ (id)ensureGamesPlayedList:(id)a3 playerID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = +[GamesPlayedSummaryList _gkFetchRequest];
  v8 = +[NSPredicate predicateWithFormat:@"playerID == %@", v6];
  [v7 setPredicate:v8];

  id v9 = +[NSManagedObject _gkRetrieveCleanEntry:v5 request:v7];
  if (!v9)
  {
    id v10 = [GamesPlayedSummaryList alloc];
    id v11 = +[GamesPlayedSummaryList entity];
    id v9 = [(GamesPlayedSummaryList *)v10 initWithEntity:v11 insertIntoManagedObjectContext:v5];

    [(GamesPlayedSummaryList *)v9 setPlayerID:v6];
  }

  return v9;
}

+ (id)existingGamePlatforms:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = +[GamePlatform _gkFetchRequest];
  id v6 = [v3 executeFetchRequest:v5 error:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 name];
        id v13 = [v12 length];

        if (v13)
        {
          id v14 = [v11 name];
          [v4 setObject:v11 forKeyedSubscript:v14];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v4;
}

+ (id)existingSupportedTransports:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = +[GKSupportedTransportVersionCacheObject _gkFetchRequest];
  id v6 = [v3 executeFetchRequest:v5 error:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = [v11 version];
        [v4 setObject:v11 forKeyedSubscript:v12];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v4;
}

+ (id)supportedTransports:(id)a3 transportLookup:(id)a4 moc:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [a3 objectForKeyedSubscript:@"supported-transports"];
  if ([v9 count])
  {
    id v10 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v9 count]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v9;
    id v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          long long v16 = [GKSupportedTransportVersionCacheObject alloc];
          long long v17 = +[GKSupportedTransportVersionCacheObject entity];
          long long v18 = [(GKSupportedTransportVersionCacheObject *)v16 initWithEntity:v17 insertIntoManagedObjectContext:v8];

          [(GKSupportedTransportVersionCacheObject *)v18 setVersion:v15];
          [v7 setObject:v18 forKeyedSubscript:v15];
          long long v19 = [v7 objectForKeyedSubscript:v15];
          [v10 addObject:v19];
        }
        id v12 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

@end