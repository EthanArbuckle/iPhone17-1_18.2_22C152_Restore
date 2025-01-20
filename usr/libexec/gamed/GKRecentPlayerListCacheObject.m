@interface GKRecentPlayerListCacheObject
+ (Class)entryClass;
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKRecentPlayerListCacheObject

+ (id)entityName
{
  return @"RecentPlayerList";
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
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKRecentPlayerListCacheObject updateWithServerRepresentation:expirationDate:]", v9);
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v12 = [v11 lastPathComponent];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v10, "-[GKRecentPlayerListCacheObject updateWithServerRepresentation:expirationDate:]", [v12 UTF8String], 3349);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }

  v15.receiver = self;
  v15.super_class = (Class)GKRecentPlayerListCacheObject;
  [(GKExpiringCacheObject *)&v15 updateWithServerRepresentation:v6 expirationDate:v7];
  v14 = [v6 objectForKeyedSubscript:@"results"];
  [(GKListCacheObject *)self updateEntriesWithRepresentations:v14 entryForRepresentation:&stru_1002DA130 reuseEntriesByIndex:1];
}

- (id)internalRepresentation
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKRecentPlayerListCacheObject internalRepresentation]", v4);
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKRecentPlayerListCacheObject internalRepresentation]", [v7 UTF8String], 3360);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  v9 = [(GKRecentPlayerListCacheObject *)self managedObjectContext];
  v10 = [(GKRecentPlayerListCacheObject *)self entries];
  v11 = [v10 _gkValuesForKeyPath:@"playerID"];
  id v12 = +[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:v11 inManagedObjectContext:v9];

  v13 = [v12 _gkMapDictionaryWithKeyPath:@"playerID"];
  v14 = [(GKRecentPlayerListCacheObject *)self entries];
  objc_super v15 = [v14 array];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000F2770;
  v19[3] = &unk_1002DA158;
  id v20 = v13;
  v21 = self;
  id v16 = v13;
  v17 = [v15 _gkMapWithBlock:v19];

  return v17;
}

@end