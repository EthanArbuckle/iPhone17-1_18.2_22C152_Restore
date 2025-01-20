@interface GKChallengeListCacheObject
+ (Class)entryClass;
+ (id)entityName;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKChallengeListCacheObject

+ (id)entityName
{
  return @"ChallengeList";
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v31 = a4;
  v7 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v7, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v8 = +[NSThread callStackSymbols];
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKChallengeListCacheObject updateWithServerRepresentation:expirationDate:]", v8);
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v11 = [v10 lastPathComponent];
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v9, "-[GKChallengeListCacheObject updateWithServerRepresentation:expirationDate:]", [v11 UTF8String], 4437);

    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }

  v39.receiver = self;
  v39.super_class = (Class)GKChallengeListCacheObject;
  [(GKExpiringCacheObject *)&v39 updateWithServerRepresentation:v6 expirationDate:v31];
  v13 = [(GKChallengeListCacheObject *)self managedObjectContext];
  v30 = v6;
  v14 = [v6 objectForKey:@"results"];
  id v15 = [v14 count];
  v16 = +[NSMutableArray arrayWithCapacity:v15];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v17 = v14;
  id v18 = [v17 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v36;
    do
    {
      v21 = 0;
      do
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)v21) objectForKeyedSubscript:@"challenge-id"];
        if (v22) {
          [v16 addObject:v22];
        }

        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v19 = [v17 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v19);
  }

  v23 = +[GKChallengeCacheObject challengesWithChallengeIDs:v16 context:v13];
  v24 = +[NSMutableDictionary dictionaryWithCapacity:v15];
  v25 = [v23 _gkMapDictionaryWithKeyPath:@"challengeID"];
  [v24 addEntriesFromDictionary:v25];

  v26 = [(GKChallengeListCacheObject *)self player];
  v27 = [v26 playerID];

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000F8BEC;
  v32[3] = &unk_1002DA018;
  id v33 = v24;
  id v34 = v27;
  id v28 = v27;
  id v29 = v24;
  [(GKListCacheObject *)self updateEntriesWithRepresentations:v17 entryForRepresentation:v32 reuseEntriesByIndex:0];
}

@end