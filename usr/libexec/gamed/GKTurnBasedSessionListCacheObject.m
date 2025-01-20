@interface GKTurnBasedSessionListCacheObject
+ (Class)entryClass;
+ (id)entityName;
+ (void)expireListsForSessionID:(id)a3 context:(id)a4;
- (id)internalRepresentation;
- (id)sessionIDs;
- (id)sessions;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKTurnBasedSessionListCacheObject

+ (id)entityName
{
  return @"TurnBasedSessionList";
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (id)sessionIDs
{
  v2 = [(GKTurnBasedSessionListCacheObject *)self entries];
  v3 = [v2 _gkValuesForKeyPath:@"sessionID"];

  return v3;
}

- (id)sessions
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKTurnBasedSessionListCacheObject sessions]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKTurnBasedSessionListCacheObject sessions]", [v7 UTF8String], 4237);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  v9 = [(GKTurnBasedSessionListCacheObject *)self sessionIDs];
  v10 = [(GKTurnBasedSessionListCacheObject *)self managedObjectContext];
  v11 = +[GKTurnBasedSessionCacheObject sessionsWithSessionIDs:v9 inContext:v10];

  return v11;
}

- (id)internalRepresentation
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKTurnBasedSessionListCacheObject internalRepresentation]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKTurnBasedSessionListCacheObject internalRepresentation]", [v7 UTF8String], 4244);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  v9 = [(GKTurnBasedSessionListCacheObject *)self sessions];
  v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [*(id *)(*((void *)&v18 + 1) + 8 * i) internalRepresentation];
        [v10 addObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v10;
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v32 = a4;
  id v7 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v7, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v8 = +[NSThread callStackSymbols];
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKTurnBasedSessionListCacheObject updateWithServerRepresentation:expirationDate:]", v8);
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v11 = [v10 lastPathComponent];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v9, "-[GKTurnBasedSessionListCacheObject updateWithServerRepresentation:expirationDate:]", [v11 UTF8String], 4257);

    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }

  v40.receiver = self;
  v40.super_class = (Class)GKTurnBasedSessionListCacheObject;
  [(GKExpiringCacheObject *)&v40 updateWithServerRepresentation:v6 expirationDate:v32];
  uint64_t v13 = [(GKTurnBasedSessionListCacheObject *)self managedObjectContext];
  v31 = v6;
  uint64_t v14 = [v6 objectForKey:@"sessions"];
  v15 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v14 count]);
  v16 = [(GKTurnBasedSessionListCacheObject *)self entries];
  v17 = [v16 _gkMapDictionaryWithKeyPath:@"sessionID"];

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000F7AE0;
  v37[3] = &unk_1002DA018;
  id v18 = v15;
  id v38 = v18;
  id v19 = v17;
  id v39 = v19;
  v29 = v14;
  [(GKListCacheObject *)self updateEntriesWithRepresentations:v14 entryForRepresentation:v37 reuseEntriesByIndex:0];
  long long v20 = [v18 allKeys];
  v30 = (void *)v13;
  long long v21 = +[GKTurnBasedSessionCacheObject sessionsWithSessionIDs:v20 inContext:v13];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v27 = [v26 sessionID];
        v28 = [v18 objectForKeyedSubscript:v27];
        [v26 updateWithServerRepresentation:v28];
      }
      id v23 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v23);
  }
}

+ (void)expireListsForSessionID:(id)a3 context:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  id v6 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v7 = +[NSThread callStackSymbols];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "+[GKTurnBasedSessionListCacheObject expireListsForSessionID:context:]", v7);
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v10 = [v9 lastPathComponent];
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v8, "+[GKTurnBasedSessionListCacheObject expireListsForSessionID:context:]", [v10 UTF8String], 4294);

    +[NSException raise:@"GameKit Exception", @"%@", v11 format];
  }

  id v12 = +[NSPredicate predicateWithFormat:@"sessionID = %@", v14];
  uint64_t v13 = +[GKCacheObject objectsMatchingPredicate:v12 context:v5];

  [v13 enumerateObjectsUsingBlock:&stru_1002DA2F8];
}

@end