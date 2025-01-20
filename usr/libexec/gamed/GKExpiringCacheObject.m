@interface GKExpiringCacheObject
+ (id)fetchSortDescriptors;
+ (void)expireObjectsMatchingPredicate:(id)a3 context:(id)a4;
+ (void)invalidateObjectsMatchingPredicate:(id)a3 context:(id)a4;
- (BOOL)expired;
- (BOOL)isValid;
- (void)awakeFromInsert;
- (void)expire;
- (void)invalidate;
- (void)updateWithServerRepresentation:(id)a3;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKExpiringCacheObject

+ (id)fetchSortDescriptors
{
  v2 = +[NSSortDescriptor sortDescriptorWithKey:@"timeStamp" ascending:0];
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (BOOL)isValid
{
  v2 = [(GKExpiringCacheObject *)self expirationDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)invalidate
{
  BOOL v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKExpiringCacheObject invalidate]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKExpiringCacheObject invalidate]", [v7 UTF8String], 612);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  [(GKExpiringCacheObject *)self setExpirationDate:0];
}

- (void)expire
{
  BOOL v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKExpiringCacheObject expire]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKExpiringCacheObject expire]", [v7 UTF8String], 618);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  if ([(GKExpiringCacheObject *)self isValid])
  {
    v9 = +[NSDate dateWithTimeIntervalSinceNow:-1.0];
    [(GKExpiringCacheObject *)self setExpirationDate:v9];

    if (!os_log_GKGeneral) {
      id v10 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
      sub_1000FB56C();
    }
  }
}

- (BOOL)expired
{
  BOOL v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKExpiringCacheObject expired]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKExpiringCacheObject expired]", [v7 UTF8String], 627);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  if (![(GKExpiringCacheObject *)self isValid]) {
    return 1;
  }
  v9 = [(GKExpiringCacheObject *)self expirationDate];
  [v9 timeIntervalSinceNow];
  BOOL v11 = v10 <= 0.0;

  return v11;
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate dateWithTimeIntervalSinceNow:30.0];
  [(GKExpiringCacheObject *)self updateWithServerRepresentation:v4 expirationDate:v5];
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB5D4();
  }
  v9 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    double v10 = +[NSThread callStackSymbols];
    BOOL v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]", v10);
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v13 = [v12 lastPathComponent];
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v11, "-[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:]", [v13 UTF8String], 645);

    +[NSException raise:@"GameKit Exception", @"%@", v14 format];
  }

  v15 = +[NSDate date];
  v16.receiver = self;
  v16.super_class = (Class)GKExpiringCacheObject;
  [(GKCacheObject *)&v16 updateWithServerRepresentation:v6];
  if (!v7)
  {
    id v7 = [(GKExpiringCacheObject *)self expirationDate];
    if (!v7) {
      id v7 = v15;
    }
  }
  [(GKExpiringCacheObject *)self setTimeStamp:v15];
  [(GKExpiringCacheObject *)self setExpirationDate:v7];
}

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)GKExpiringCacheObject;
  [(GKExpiringCacheObject *)&v4 awakeFromInsert];
  BOOL v3 = +[NSDate date];
  [(GKExpiringCacheObject *)self setTimeStamp:v3];
}

+ (void)expireObjectsMatchingPredicate:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB608();
  }
  v9 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    double v10 = +[NSThread callStackSymbols];
    BOOL v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "+[GKExpiringCacheObject expireObjectsMatchingPredicate:context:]", v10);
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v13 = [v12 lastPathComponent];
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v11, "+[GKExpiringCacheObject expireObjectsMatchingPredicate:context:]", [v13 UTF8String], 665);

    +[NSException raise:@"GameKit Exception", @"%@", v14 format];
  }

  v15 = [a1 objectsMatchingPredicate:v6 context:v7];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) expire];
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v17);
  }
}

+ (void)invalidateObjectsMatchingPredicate:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v9 = +[NSThread callStackSymbols];
    double v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "+[GKExpiringCacheObject invalidateObjectsMatchingPredicate:context:]", v9);
    BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v12 = [v11 lastPathComponent];
    id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v10, "+[GKExpiringCacheObject invalidateObjectsMatchingPredicate:context:]", [v12 UTF8String], 674);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }

  v14 = [a1 objectsMatchingPredicate:v6 context:v7];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v18) setExpirationDate:0];
        uint64_t v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }
}

@end