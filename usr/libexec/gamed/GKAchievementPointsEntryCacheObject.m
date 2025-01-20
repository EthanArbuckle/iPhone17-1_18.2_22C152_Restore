@interface GKAchievementPointsEntryCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKAchievementPointsEntryCacheObject

+ (id)entityName
{
  return @"AchievementPointsEntry";
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v6 = +[NSThread callStackSymbols];
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKAchievementPointsEntryCacheObject updateWithServerRepresentation:]", v6);
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v7, "-[GKAchievementPointsEntryCacheObject updateWithServerRepresentation:]", [v9 UTF8String], 3720);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }

  v12.receiver = self;
  v12.super_class = (Class)GKAchievementPointsEntryCacheObject;
  [(GKCacheObject *)&v12 updateWithServerRepresentation:v4];
  v11 = [(GKAchievementPointsEntryCacheObject *)self gameRecord];
  [v11 updateAchievementsWithServerRepresentation:v4];
}

- (id)internalRepresentation
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKAchievementPointsEntryCacheObject internalRepresentation]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKAchievementPointsEntryCacheObject internalRepresentation]", [v7 UTF8String], 3729);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  id v9 = [(GKAchievementPointsEntryCacheObject *)self gameRecord];
  v10 = [v9 internalRepresentation];

  return v10;
}

@end