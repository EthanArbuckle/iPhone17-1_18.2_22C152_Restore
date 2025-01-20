@interface GKPlayerListCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKPlayerListCacheObject

+ (id)entityName
{
  return @"PlayerList";
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v9 = +[NSThread callStackSymbols];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKPlayerListCacheObject updateWithServerRepresentation:expirationDate:]", v9);
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v12 = [v11 lastPathComponent];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v10, "-[GKPlayerListCacheObject updateWithServerRepresentation:expirationDate:]", [v12 UTF8String], 4373);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }

  v15.receiver = self;
  v15.super_class = (Class)GKPlayerListCacheObject;
  [(GKExpiringCacheObject *)&v15 updateWithServerRepresentation:v6 expirationDate:v7];
  v14 = [v6 objectForKeyedSubscript:@"results"];
  [(GKListCacheObject *)self updateEntriesWithRepresentations:v14 entryForRepresentation:&stru_1002DA318 reuseEntriesByIndex:1];
}

- (id)internalRepresentation
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKPlayerListCacheObject internalRepresentation]", v4);
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKPlayerListCacheObject internalRepresentation]", [v7 UTF8String], 4383);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  v9 = [(GKPlayerListCacheObject *)self managedObjectContext];
  v10 = [(GKPlayerListCacheObject *)self entries];
  v11 = [v10 _gkValuesForKeyPath:@"playerID"];

  id v12 = +[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:v11 inManagedObjectContext:v9];
  v13 = [v12 _gkMapDictionaryWithKeyPath:@"playerID"];
  v14 = [(GKPlayerListCacheObject *)self entries];
  objc_super v15 = [v14 array];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000F8568;
  v19[3] = &unk_1002DA340;
  id v20 = v13;
  id v16 = v13;
  v17 = [v15 _gkMapWithBlock:v19];

  return v17;
}

@end