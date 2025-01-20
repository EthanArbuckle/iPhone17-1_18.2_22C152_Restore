@interface GKAchievementListCacheObject
+ (id)entityName;
- (BOOL)isValid;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKAchievementListCacheObject

+ (id)entityName
{
  return @"AchievementList";
}

- (BOOL)isValid
{
  v7.receiver = self;
  v7.super_class = (Class)GKAchievementListCacheObject;
  if (![(GKExpiringCacheObject *)&v7 isValid]) {
    return 0;
  }
  v3 = [(GKAchievementListCacheObject *)self game];
  v4 = [v3 name];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v9 = +[NSThread callStackSymbols];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKAchievementListCacheObject updateWithServerRepresentation:expirationDate:]", v9);
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v12 = [v11 lastPathComponent];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v10, "-[GKAchievementListCacheObject updateWithServerRepresentation:expirationDate:]", [v12 UTF8String], 1828);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }

  v15.receiver = self;
  v15.super_class = (Class)GKAchievementListCacheObject;
  [(GKExpiringCacheObject *)&v15 updateWithServerRepresentation:v6 expirationDate:v7];
  v14 = [v6 objectForKeyedSubscript:@"results"];
  [(GKListCacheObject *)self updateEntriesWithRepresentations:v14 entryForRepresentation:&stru_1002D9F58 reuseEntriesByIndex:1];
}

- (id)internalRepresentation
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = +[NSThread callStackSymbols];
    BOOL v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKAchievementListCacheObject internalRepresentation]", v4);
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKAchievementListCacheObject internalRepresentation]", [v7 UTF8String], 1838);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  v9 = [(GKAchievementListCacheObject *)self game];
  v10 = [v9 achievementDescriptionList];
  v11 = [v10 entries];

  id v12 = [(GKAchievementListCacheObject *)self entries];
  v13 = [(GKAchievementListCacheObject *)self player];
  v14 = [v13 playerID];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000E9D14;
  v25[3] = &unk_1002D9F80;
  id v15 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2 * [v12 count]];
  id v26 = v15;
  [v12 enumerateObjectsUsingBlock:v25];
  v16 = [v11 array];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000E9DAC;
  v22[3] = &unk_1002D9FA8;
  id v23 = v15;
  id v24 = v14;
  id v17 = v14;
  id v18 = v15;
  uint64_t v19 = [v16 _gkFilterWithBlock:v22];

  if (v19) {
    v20 = (void *)v19;
  }
  else {
    v20 = &__NSArray0__struct;
  }

  return v20;
}

@end