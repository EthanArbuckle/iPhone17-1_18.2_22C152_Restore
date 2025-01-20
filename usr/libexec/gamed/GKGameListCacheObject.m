@interface GKGameListCacheObject
+ (Class)entryClass;
+ (id)entityName;
- (id)internalRepresentation;
- (id)internalRepresentationIncludingInstalledGames:(BOOL)a3;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKGameListCacheObject

+ (id)entityName
{
  return @"GameList";
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v9 = +[NSThread callStackSymbols];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKGameListCacheObject updateWithServerRepresentation:expirationDate:]", v9);
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v12 = [v11 lastPathComponent];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v10, "-[GKGameListCacheObject updateWithServerRepresentation:expirationDate:]", [v12 UTF8String], 3048);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }

  v73.receiver = self;
  v73.super_class = (Class)GKGameListCacheObject;
  [(GKExpiringCacheObject *)&v73 updateWithServerRepresentation:v6 expirationDate:v7];
  if (v6)
  {
    id v52 = v7;
    v54 = self;
    uint64_t v14 = [(GKGameListCacheObject *)self managedObjectContext];
    id v53 = v6;
    v15 = [v6 objectForKeyedSubscript:@"results"];
    id v16 = [v15 count];
    v17 = +[NSMutableDictionary dictionaryWithCapacity:v16];
    v58 = +[NSMutableArray arrayWithCapacity:v16];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id obj = v15;
    id v18 = [obj countByEnumeratingWithState:&v69 objects:v76 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v70;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v70 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          v23 = [v22 objectForKeyedSubscript:@"game"];
          v24 = [v23 objectForKeyedSubscript:@"bundle-id"];
          if (v24)
          {
            [v58 addObject:v23];
            [v17 setObject:v22 forKey:v24];
          }
        }
        id v19 = [obj countByEnumeratingWithState:&v69 objects:v76 count:16];
      }
      while (v19);
    }

    v51 = (void *)v14;
    +[GKGameCacheObject gamesForGameDescriptors:v58 context:v14];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v56 = (id)objc_claimAutoreleasedReturnValue();
    id v25 = [v56 countByEnumeratingWithState:&v65 objects:v75 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v66;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v66 != v27) {
            objc_enumerationMutation(v56);
          }
          v29 = *(void **)(*((void *)&v65 + 1) + 8 * (void)j);
          v30 = [v29 bundleID];
          v31 = [v17 objectForKey:v30];
          v32 = [v31 objectForKeyedSubscript:@"name"];
          if (v32) {
            [v29 setName:v32];
          }
          v33 = [v31 objectForKeyedSubscript:@"software-type"];
          if (v33) {
            [v29 setSoftwareType:v33];
          }
        }
        id v26 = [v56 countByEnumeratingWithState:&v65 objects:v75 count:16];
      }
      while (v26);
    }
    v34 = [(GKGameListCacheObject *)v54 entries];
    v35 = [v34 _gkMapDictionaryWithKeyPath:@"bundleID"];

    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_1000F11F8;
    v63[3] = &unk_1002DA0A8;
    id v36 = v35;
    id v64 = v36;
    [(GKListCacheObject *)v54 updateEntriesWithRepresentations:obj entryForRepresentation:v63 reuseEntriesByIndex:0];
    uint64_t v37 = [(GKGameListCacheObject *)v54 player];
    v38 = (void *)v37;
    if (v37)
    {
      v49 = (void *)v37;
      id v50 = v36;
      +[GKGameRecordCacheObject recordsForGames:v56 playerProfile:v37];
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v55 = (id)objc_claimAutoreleasedReturnValue();
      id v39 = [v55 countByEnumeratingWithState:&v59 objects:v74 count:16];
      if (v39)
      {
        id v40 = v39;
        uint64_t v41 = *(void *)v60;
        do
        {
          for (k = 0; k != v40; k = (char *)k + 1)
          {
            if (*(void *)v60 != v41) {
              objc_enumerationMutation(v55);
            }
            v43 = *(void **)(*((void *)&v59 + 1) + 8 * (void)k);
            v44 = [v43 game];
            v45 = [v44 bundleID];

            v46 = [v17 objectForKey:v45];
            v47 = [v46 objectForKeyedSubscript:@"timestamp"];
            if (v47)
            {
              v48 = +[NSDate _gkDateFromServerTimestamp:v47];
              [v43 setLastPlayedDate:v48];
            }
          }
          id v40 = [v55 countByEnumeratingWithState:&v59 objects:v74 count:16];
        }
        while (v40);
      }

      v38 = v49;
      id v36 = v50;
    }

    id v7 = v52;
    id v6 = v53;
  }
}

- (id)internalRepresentation
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKGameListCacheObject internalRepresentation]", v4);
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKGameListCacheObject internalRepresentation]", [v7 UTF8String], 3122);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  return [(GKGameListCacheObject *)self internalRepresentationIncludingInstalledGames:0];
}

- (id)internalRepresentationIncludingInstalledGames:(BOOL)a3
{
  v4 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = +[NSThread callStackSymbols];
    id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKGameListCacheObject internalRepresentationIncludingInstalledGames:]", v5);
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v8 = [v7 lastPathComponent];
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v6, "-[GKGameListCacheObject internalRepresentationIncludingInstalledGames:]", [v8 UTF8String], 3129);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }

  v10 = [(GKGameListCacheObject *)self entries];
  v11 = [v10 _gkValuesForKeyPath:@"bundleID"];

  id v12 = +[NSPredicate predicateWithFormat:@"game.bundleID IN %@", v11];
  v13 = [(GKGameListCacheObject *)self player];
  uint64_t v14 = [v13 gameRecords];
  v15 = [v14 filteredSetUsingPredicate:v12];

  id v16 = +[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:0 comparator:&stru_1002DA110];
  v17 = +[NSArray arrayWithObject:v16];
  id v18 = [v15 sortedArrayUsingDescriptors:v17];

  id v19 = [v18 _gkValuesForKeyPath:@"internalRepresentation"];

  return v19;
}

@end