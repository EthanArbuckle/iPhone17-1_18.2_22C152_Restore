@interface GKAchievementPointsListCacheObject
+ (Class)entryClass;
+ (id)entityName;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKAchievementPointsListCacheObject

+ (id)entityName
{
  return @"AchievementPointsList";
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v9 = +[NSThread callStackSymbols];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKAchievementPointsListCacheObject updateWithServerRepresentation:expirationDate:]", v9);
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v12 = [v11 lastPathComponent];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v10, "-[GKAchievementPointsListCacheObject updateWithServerRepresentation:expirationDate:]", [v12 UTF8String], 3637);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }

  v76.receiver = self;
  v76.super_class = (Class)GKAchievementPointsListCacheObject;
  [(GKExpiringCacheObject *)&v76 updateWithServerRepresentation:v6 expirationDate:v7];
  v14 = [v6 objectForKey:@"results"];
  if (v14)
  {
    id v53 = v7;
    id v54 = v6;
    v52 = self;
    v55 = [(GKAchievementPointsListCacheObject *)self managedObjectContext];
    id v15 = [v14 count];
    v58 = +[NSMutableArray arrayWithCapacity:v15];
    v16 = +[NSMutableDictionary dictionaryWithCapacity:v15];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v51 = v14;
    id obj = v14;
    id v17 = [obj countByEnumeratingWithState:&v72 objects:v79 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v73;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v73 != v19) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          v22 = [v21 objectForKey:@"game"];
          v23 = [v22 objectForKey:@"bundle-id"];
          if (v23)
          {
            [v58 addObject:v22];
            [v16 setObject:v21 forKey:v23];
          }
        }
        id v18 = [obj countByEnumeratingWithState:&v72 objects:v79 count:16];
      }
      while (v18);
    }

    v24 = +[GKGameCacheObject gamesForGameDescriptors:v58 context:v55];
    v59 = +[NSMutableDictionary dictionaryWithCapacity:v15];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v56 = v24;
    id v25 = [v56 countByEnumeratingWithState:&v68 objects:v78 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v69;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v69 != v27) {
            objc_enumerationMutation(v56);
          }
          v29 = *(void **)(*((void *)&v68 + 1) + 8 * (void)j);
          v30 = [v29 bundleID];
          v31 = [v16 objectForKey:v30];
          v32 = [v31 objectForKey:@"game"];
          [v29 updateWithGameDescriptor:v32];

          v33 = [v31 objectForKey:@"name"];
          if (v33) {
            [v29 setName:v33];
          }
          [v59 setObject:v29 forKey:v30];
        }
        id v26 = [v56 countByEnumeratingWithState:&v68 objects:v78 count:16];
      }
      while (v26);
    }

    v34 = +[NSMutableDictionary dictionaryWithCapacity:v15];
    v35 = [v59 allValues];
    v36 = [(GKAchievementPointsListCacheObject *)v52 player];
    v37 = +[GKGameRecordCacheObject recordsForGames:v35 playerProfile:v36];

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v38 = v37;
    id v39 = [v38 countByEnumeratingWithState:&v64 objects:v77 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v65;
      do
      {
        for (k = 0; k != v40; k = (char *)k + 1)
        {
          if (*(void *)v65 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = *(void **)(*((void *)&v64 + 1) + 8 * (void)k);
          v44 = [v43 game];
          v45 = [v44 bundleID];

          [v34 setObject:v43 forKey:v45];
        }
        id v40 = [v38 countByEnumeratingWithState:&v64 objects:v77 count:16];
      }
      while (v40);
    }

    v46 = [(GKAchievementPointsListCacheObject *)v52 entries];
    v47 = [v46 _gkMapDictionaryWithKeyPath:@"gameRecord.game.bundleID"];

    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_1000F45CC;
    v60[3] = &unk_1002DA290;
    id v61 = v59;
    id v62 = v47;
    id v63 = v34;
    id v48 = v34;
    id v49 = v47;
    id v50 = v59;
    [(GKListCacheObject *)v52 updateEntriesWithRepresentations:obj entryForRepresentation:v60 reuseEntriesByIndex:0];

    id v7 = v53;
    id v6 = v54;
    v14 = v51;
  }
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

@end