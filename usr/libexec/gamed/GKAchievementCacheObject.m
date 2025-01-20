@interface GKAchievementCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKAchievementCacheObject

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v6 = +[NSThread callStackSymbols];
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKAchievementCacheObject updateWithServerRepresentation:]", v6);
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v7, "-[GKAchievementCacheObject updateWithServerRepresentation:]", [v9 UTF8String], 1895);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }

  v16.receiver = self;
  v16.super_class = (Class)GKAchievementCacheObject;
  [(GKCacheObject *)&v16 updateWithServerRepresentation:v4];
  v11 = [v4 objectForKey:@"achievement-id"];
  [(GKAchievementCacheObject *)self setIdentifier:v11];

  v12 = [v4 objectForKey:@"group-achievement-id"];
  [(GKAchievementCacheObject *)self setGroupIdentifier:v12];

  v13 = [v4 objectForKey:@"achievement-pct"];
  [v13 floatValue];
  -[GKAchievementCacheObject setPercentComplete:](self, "setPercentComplete:");

  v14 = [v4 objectForKey:@"timestamp"];
  v15 = +[NSDate _gkDateFromServerTimestamp:v14];
  [(GKAchievementCacheObject *)self setLastReportedDate:v15];
}

- (id)internalRepresentation
{
  return 0;
}

+ (id)entityName
{
  return @"Achievement";
}

@end