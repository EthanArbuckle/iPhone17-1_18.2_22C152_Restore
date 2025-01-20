@interface GKFriendRequestListCacheObject
+ (Class)entryClass;
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKFriendRequestListCacheObject

+ (id)entityName
{
  return @"FriendRequestList";
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
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKFriendRequestListCacheObject updateWithServerRepresentation:expirationDate:]", v9);
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v12 = [v11 lastPathComponent];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v10, "-[GKFriendRequestListCacheObject updateWithServerRepresentation:expirationDate:]", [v12 UTF8String], 2930);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }

  v14 = [(GKFriendRequestListCacheObject *)self managedObjectContext];
  v31.receiver = self;
  v31.super_class = (Class)GKFriendRequestListCacheObject;
  [(GKExpiringCacheObject *)&v31 updateWithServerRepresentation:v6 expirationDate:v7];
  v15 = [v6 objectForKey:@"results"];
  v16 = [(GKFriendRequestListCacheObject *)self entries];
  v17 = [v16 _gkMapDictionaryWithKeyPath:@"playerID"];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000F0348;
  v29[3] = &unk_1002DA0A8;
  id v18 = v17;
  id v30 = v18;
  [(GKListCacheObject *)self updateEntriesWithRepresentations:v15 entryForRepresentation:v29 reuseEntriesByIndex:0];
  v19 = [(GKFriendListCacheObject *)self playerIDs];
  v20 = [(GKFriendRequestListCacheObject *)self player];
  unsigned int v21 = [v20 isLocalPlayer];

  if (v21) {
    +[GKPlayerProfileCacheObject setFamiliarPlayerIDs:v19 familiarity:3];
  }
  v22 = [v15 _gkMapDictionaryWithKeyPath:@"playerID"];
  [(GKFriendListCacheObject *)self populateFriendNamesFromServerRepresentationDictionary:v22];
  id v23 = objc_alloc((Class)NSFetchRequest);
  v24 = +[GKFriendRequestListEntryCacheObject entityName];
  id v25 = [v23 initWithEntityName:v24];

  v26 = +[NSPredicate predicateWithFormat:@"wasViewed == NO"];
  [v25 setPredicate:v26];

  id v27 = [v14 countForFetchRequest:v25 error:0];
  v28 = +[GKBadgeController sharedController];
  [v28 setBadgeCount:v27 forBundleID:GKGameCenterIdentifier badgeType:1];
}

- (id)internalRepresentation
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKFriendRequestListCacheObject internalRepresentation]", v4);
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKFriendRequestListCacheObject internalRepresentation]", [v7 UTF8String], 2969);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  v9 = [(GKFriendRequestListCacheObject *)self entries];
  id v10 = [v9 count];

  id v29 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v10];
  uint64_t v11 = [(GKFriendRequestListCacheObject *)self managedObjectContext];
  id v12 = [(GKFriendListCacheObject *)self playerIDs];
  v28 = (void *)v11;
  v13 = +[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:v12 inManagedObjectContext:v11];

  id v27 = v13;
  v14 = [v13 _gkMapDictionaryWithKeyPath:@"playerID"];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v15 = [(GKFriendRequestListCacheObject *)self entries];
  id v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        unsigned int v21 = [v20 playerID];
        if (v21)
        {
          v22 = [v14 objectForKeyedSubscript:v21];
          if ([v22 familiarity] == 3)
          {
            id v23 = [objc_alloc((Class)GKFriendRequestInternal) initWithCacheObject:v22];
            v24 = [v20 date];
            [v23 setDate:v24];

            id v25 = [v20 message];
            [v23 setMessage:v25];

            [v29 addObject:v23];
          }
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v17);
  }

  return v29;
}

@end