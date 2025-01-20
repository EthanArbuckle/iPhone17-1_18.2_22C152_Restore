@interface GKFriendListCacheObject
+ (Class)entryClass;
+ (id)cacheFriendList:(id)a3 withTimeToLive:(double)a4 forProfile:(id)a5 managedObjectContext:(id)a6 commonFriends:(BOOL)a7;
+ (id)entityName;
- (NSArray)filterableFriends;
- (id)internalRepresentation;
- (id)playerIDs;
- (void)populateFriendNamesFromServerRepresentationDictionary:(id)a3;
@end

@implementation GKFriendListCacheObject

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

+ (id)entityName
{
  return @"FriendList";
}

- (id)playerIDs
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKFriendListCacheObject playerIDs]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKFriendListCacheObject playerIDs]", [v7 UTF8String], 2430);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  v9 = [(GKFriendListCacheObject *)self entries];
  v10 = [v9 _gkValuesForKeyPath:@"playerID"];

  return v10;
}

+ (id)cacheFriendList:(id)a3 withTimeToLive:(double)a4 forProfile:(id)a5 managedObjectContext:(id)a6 commonFriends:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v14, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v15 = +[NSThread callStackSymbols];
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "+[GKFriendListCacheObject cacheFriendList:withTimeToLive:forProfile:managedObjectContext:commonFriends:]", v15);
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v18 = [v17 lastPathComponent];
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v16, "+[GKFriendListCacheObject cacheFriendList:withTimeToLive:forProfile:managedObjectContext:commonFriends:]", [v18 UTF8String], 2440);

    +[NSException raise:@"GameKit Exception", @"%@", v19 format];
  }

  v20 = +[NSDate dateWithTimeIntervalSinceNow:a4];
  v21 = [(GKCacheObject *)[GKFriendListCacheObject alloc] initWithManagedObjectContext:v13];
  [v12 setFriendList:v21];
  [(GKFriendListCacheObject *)v21 setExpirationDate:v20];
  [(GKFriendListCacheObject *)v21 setCommon:v7];
  [(GKFriendListCacheObject *)v21 setPlayer:v12];
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v11 count]);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000ED538;
  v30[3] = &unk_1002DA0A8;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  id v31 = v22;
  [(GKListCacheObject *)v21 updateEntriesWithRepresentations:v11 entryForRepresentation:v30 reuseEntriesByIndex:0];
  v23 = [(GKFriendListCacheObject *)v21 player];
  unsigned int v24 = [v23 isLocalPlayer];

  if (v24)
  {
    v25 = [(GKFriendListCacheObject *)v21 playerIDs];
    +[GKPlayerProfileCacheObject setFamiliarPlayerIDs:v25 familiarity:2];
  }
  id v26 = [v22 copy];
  [(GKFriendListCacheObject *)v21 populateFriendNamesFromServerRepresentationDictionary:v26];

  v27 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v28 = (id)GKOSLoggers();
    v27 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    sub_1000FBA48();
  }

  return v21;
}

- (void)populateFriendNamesFromServerRepresentationDictionary:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v6 = +[NSThread callStackSymbols];
    BOOL v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKFriendListCacheObject populateFriendNamesFromServerRepresentationDictionary:]", v6);
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v7, "-[GKFriendListCacheObject populateFriendNamesFromServerRepresentationDictionary:]", [v9 UTF8String], 2495);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }

  if ([v4 count])
  {
    id v11 = [(GKFriendListCacheObject *)self playerIDs];
    id v12 = [(GKFriendListCacheObject *)self managedObjectContext];
    id v13 = +[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:v11 inManagedObjectContext:v12];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000ED920;
    v14[3] = &unk_1002DA0D0;
    id v15 = v4;
    [v13 enumerateObjectsUsingBlock:v14];
  }
}

- (id)internalRepresentation
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKFriendListCacheObject internalRepresentation]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKFriendListCacheObject internalRepresentation]", [v7 UTF8String], 2569);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  id v9 = [(GKFriendListCacheObject *)self entries];
  id v10 = [v9 count];

  id v35 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v10];
  uint64_t v11 = [(GKFriendListCacheObject *)self managedObjectContext];
  id v12 = [(GKFriendListCacheObject *)self playerIDs];
  id v13 = +[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:v12 inManagedObjectContext:v11];

  id v31 = [v13 _gkDistinctValuesForKeyPath:@"lastPlayedGame"];
  v14 = [v31 allObjects];
  v33 = (void *)v11;
  id v15 = +[GKGameCacheObject gamesForBundleIDs:v14 context:v11];

  v30 = v15;
  v34 = [v15 _gkMapDictionaryWithKeyPath:@"bundleID"];
  v32 = v13;
  v16 = [v13 _gkMapDictionaryWithKeyPath:@"playerID"];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v17 = [(GKFriendListCacheObject *)self entries];
  id v18 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v37;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = [*(id *)(*((void *)&v36 + 1) + 8 * i) playerID];
        if (v22)
        {
          v23 = [v16 objectForKeyedSubscript:v22];
          if ([v23 familiarity] == 2)
          {
            id v24 = [objc_alloc((Class)GKFriendPlayerInternal) initWithCacheObject:v23];
            v25 = [v23 lastPlayedGame];

            if (v25)
            {
              id v26 = [v23 lastPlayedGame];
              v27 = [v34 objectForKeyedSubscript:v26];

              id v28 = [v27 internalRepresentation];
              [v24 setLastPlayedGame:v28];
            }
            [v35 addObject:v24];
          }
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v19);
  }

  return v35;
}

- (NSArray)filterableFriends
{
  v2 = self;
  sub_100162F18();

  type metadata accessor for GKFilterableFriend();
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

@end