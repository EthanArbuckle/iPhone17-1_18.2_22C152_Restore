@interface GKLeaderboardSetCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKLeaderboardSetCacheObject

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v6 = +[NSThread callStackSymbols];
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKLeaderboardSetCacheObject updateWithServerRepresentation:]", v6);
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v7, "-[GKLeaderboardSetCacheObject updateWithServerRepresentation:]", [v9 UTF8String], 2094);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }

  v30.receiver = self;
  v30.super_class = (Class)GKLeaderboardSetCacheObject;
  [(GKCacheObject *)&v30 updateWithServerRepresentation:v4];
  v11 = [v4 objectForKey:@"set-name"];
  [(GKLeaderboardSetCacheObject *)self setIdentifier:v11];

  v12 = [v4 objectForKey:@"set-group-name"];
  [(GKLeaderboardSetCacheObject *)self setGroupIdentifier:v12];

  v13 = [v4 objectForKey:@"set-title"];
  [(GKLeaderboardSetCacheObject *)self setTitle:v13];

  v14 = [(GKLeaderboardSetCacheObject *)self leaderboardTitleMapList];

  if (!v14)
  {
    v15 = [GKLeaderboardTitleMapListCacheObject alloc];
    v16 = [(GKLeaderboardSetCacheObject *)self managedObjectContext];
    v17 = [(GKCacheObject *)v15 initWithManagedObjectContext:v16];
    [(GKLeaderboardSetCacheObject *)self setLeaderboardTitleMapList:v17];
  }
  v18 = [v4 objectForKey:@"set-image-urls"];
  if (v18) {
    id v19 = [(GKCacheObject *)self updateImagesWithImageURLs:v18];
  }
  v20 = [v4 objectForKey:@"leaderboards"];
  v21 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v20 count]);
  v22 = [(GKLeaderboardSetCacheObject *)self leaderboardTitleMapList];
  v23 = [v22 entries];
  v24 = [v23 _gkMapDictionaryWithKeyPath:@"identifier"];
  [v21 addEntriesFromDictionary:v24];

  v25 = [(GKLeaderboardSetCacheObject *)self leaderboardTitleMapList];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000EB5CC;
  v27[3] = &unk_1002DA018;
  id v28 = v21;
  v29 = self;
  id v26 = v21;
  [v25 updateEntriesWithRepresentations:v20 entryForRepresentation:v27 reuseEntriesByIndex:0];
}

- (id)internalRepresentation
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKLeaderboardSetCacheObject internalRepresentation]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKLeaderboardSetCacheObject internalRepresentation]", [v7 UTF8String], 2135);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  id v9 = +[GKLeaderboardSetInternal internalRepresentation];
  v10 = [(GKLeaderboardSetCacheObject *)self identifier];
  [v9 setIdentifier:v10];

  v11 = [(GKLeaderboardSetCacheObject *)self groupIdentifier];
  [v9 setGroupIdentifier:v11];

  v12 = [(GKLeaderboardSetCacheObject *)self title];
  [v9 setTitle:v12];

  v13 = [(GKLeaderboardSetCacheObject *)self leaderboardTitleMapList];
  v14 = [v13 entries];
  v15 = [v14 _gkMapDictionaryWithKeyPath:@"identifier" valueKeyPath:@"localizedTitle"];
  [v9 setLeaderboardIdentifiers:v15];

  v16 = [(GKCacheObject *)self imageURLDictionary];
  [v9 setIcons:v16];

  return v9;
}

+ (id)entityName
{
  return @"LeaderboardSet";
}

@end