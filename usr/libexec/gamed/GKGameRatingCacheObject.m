@interface GKGameRatingCacheObject
+ (id)entityName;
+ (id)ratingForGameDescriptor:(id)a3 context:(id)a4;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKGameRatingCacheObject

+ (id)ratingForGameDescriptor:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v9 = +[NSThread callStackSymbols];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "+[GKGameRatingCacheObject ratingForGameDescriptor:context:]", v9);
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v12 = [v11 lastPathComponent];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v10, "+[GKGameRatingCacheObject ratingForGameDescriptor:context:]", [v12 UTF8String], 2022);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }

  v14 = [v6 objectForKeyedSubscript:@"bundle-id"];
  v15 = [v6 objectForKeyedSubscript:@"bundle-version"];
  v16 = +[NSPredicate predicateWithFormat:@"bundleID = %@ && bundleVersion = %@", v14, v15];
  v17 = [a1 firstObjectMatchingPredicate:v16 context:v7];
  if (!v17)
  {
    v17 = [(GKCacheObject *)[GKGameRatingCacheObject alloc] initWithManagedObjectContext:v7];
    [(GKGameRatingCacheObject *)v17 setBundleID:v14];
    [(GKGameRatingCacheObject *)v17 setBundleVersion:v15];
  }

  return v17;
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v9 = +[NSThread callStackSymbols];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKGameRatingCacheObject updateWithServerRepresentation:expirationDate:]", v9);
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v12 = [v11 lastPathComponent];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v10, "-[GKGameRatingCacheObject updateWithServerRepresentation:expirationDate:]", [v12 UTF8String], 2042);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }

  v19.receiver = self;
  v19.super_class = (Class)GKGameRatingCacheObject;
  [(GKExpiringCacheObject *)&v19 updateWithServerRepresentation:v6 expirationDate:v7];
  v14 = [v6 objectForKeyedSubscript:@"rating"];
  v15 = v14;
  if (v14)
  {
    [v14 floatValue];
    *(float *)&double v17 = v16 / 5.0;
    v18 = +[NSNumber numberWithFloat:v17];
    [(GKGameRatingCacheObject *)self setRating:v18];
  }
}

+ (id)entityName
{
  return @"GameRating";
}

@end