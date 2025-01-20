@interface GKOnDeviceMultiplayerGameListCacheObject
+ (Class)entryClass;
+ (id)entityName;
- (id)bundleIDs;
- (id)multiplayerGames;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKOnDeviceMultiplayerGameListCacheObject

- (id)bundleIDs
{
  v2 = [(GKOnDeviceMultiplayerGameListCacheObject *)self entries];
  v3 = [v2 array];
  v4 = [v3 _gkMapWithBlock:&stru_1002DA220];

  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "found cachedBundleIDs: %@", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

- (id)multiplayerGames
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = [(GKOnDeviceMultiplayerGameListCacheObject *)self entries];
  id v5 = [v4 array];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F38CC;
  v8[3] = &unk_1002DA248;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  return v6;
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v9 = +[NSThread callStackSymbols];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKOnDeviceMultiplayerGameListCacheObject updateWithServerRepresentation:expirationDate:]", v9);
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v12 = [v11 lastPathComponent];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v10, "-[GKOnDeviceMultiplayerGameListCacheObject updateWithServerRepresentation:expirationDate:]", [v12 UTF8String], 3559);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }

  v15.receiver = self;
  v15.super_class = (Class)GKOnDeviceMultiplayerGameListCacheObject;
  [(GKExpiringCacheObject *)&v15 updateWithServerRepresentation:v6 expirationDate:v7];
  v14 = [v6 objectForKeyedSubscript:@"game-features"];
  [(GKListCacheObject *)self updateEntriesWithRepresentations:v14 entryForRepresentation:&stru_1002DA268 reuseEntriesByIndex:1];
}

+ (id)entityName
{
  return @"GKOnDeviceMultiplayerGameList";
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

@end