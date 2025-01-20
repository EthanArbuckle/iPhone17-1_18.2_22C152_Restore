@interface GKFriendRecommendationListCacheObject
+ (Class)entryClass;
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKFriendRecommendationListCacheObject

+ (id)entityName
{
  return @"FriendRecommendationList";
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
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKFriendRecommendationListCacheObject updateWithServerRepresentation:expirationDate:]", v9);
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v12 = [v11 lastPathComponent];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v10, "-[GKFriendRecommendationListCacheObject updateWithServerRepresentation:expirationDate:]", [v12 UTF8String], 2813);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }

  v26.receiver = self;
  v26.super_class = (Class)GKFriendRecommendationListCacheObject;
  [(GKExpiringCacheObject *)&v26 updateWithServerRepresentation:v6 expirationDate:v7];
  v14 = [v6 objectForKeyedSubscript:@"recommendations"];
  id v15 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v14 count]];
  v16 = [(GKFriendRecommendationListCacheObject *)self entries];
  v17 = [v16 _gkMapDictionaryWithKeyPath:@"playerID"];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000EF698;
  v23[3] = &unk_1002DA018;
  id v18 = v15;
  id v24 = v18;
  id v19 = v17;
  id v25 = v19;
  [(GKListCacheObject *)self updateEntriesWithRepresentations:v14 entryForRepresentation:v23 reuseEntriesByIndex:0];
  v20 = [(GKFriendListCacheObject *)self playerIDs];
  v21 = [(GKFriendRecommendationListCacheObject *)self player];
  unsigned int v22 = [v21 isLocalPlayer];

  if (v22) {
    +[GKPlayerProfileCacheObject setFamiliarPlayerIDs:v20 familiarity:4];
  }
  [(GKFriendListCacheObject *)self populateFriendNamesFromServerRepresentationDictionary:v18];
}

- (id)internalRepresentation
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKFriendRecommendationListCacheObject internalRepresentation]", v4);
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKFriendRecommendationListCacheObject internalRepresentation]", [v7 UTF8String], 2852);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  v9 = [(GKFriendRecommendationListCacheObject *)self entries];
  id v10 = [v9 count];

  id v31 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v10];
  uint64_t v11 = [(GKFriendRecommendationListCacheObject *)self managedObjectContext];
  id v12 = [(GKFriendListCacheObject *)self playerIDs];
  v30 = (void *)v11;
  v13 = +[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:v12 inManagedObjectContext:v11];

  v29 = v13;
  v14 = [v13 _gkMapDictionaryWithKeyPath:@"playerID"];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v15 = [(GKFriendRecommendationListCacheObject *)self entries];
  id v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v33;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v21 = [v20 playerID];
        if (v21)
        {
          unsigned int v22 = [v14 objectForKeyedSubscript:v21];
          if ([v22 familiarity] == 4)
          {
            id v23 = [objc_alloc((Class)GKFriendRecommendationInternal) initWithCacheObject:v22];
            id v24 = [v20 reason];
            [v23 setReason:v24];

            id v25 = [v20 reason2];
            [v23 setReason2:v25];

            objc_super v26 = [v20 rid];
            [v23 setRid:[v26 unsignedIntegerValue]];

            v27 = [v20 source];
            [v23 setSource:[v27 integerValue]];

            [v31 addObject:v23];
          }
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v17);
  }

  return v31;
}

@end