@interface GKInternalRepresentation
+ (id)internalRepresentationForCacheObject:(id)a3;
- (id)initWithCacheObject:(id)a3;
- (void)updateWithCacheObject:(id)a3;
@end

@implementation GKInternalRepresentation

+ (id)internalRepresentationForCacheObject:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithCacheObject:v4];

  return v5;
}

- (id)initWithCacheObject:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v6 = +[NSThread callStackSymbols];
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKInternalRepresentation(Cache) initWithCacheObject:]", v6);
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation+Cache.m"];
    id v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v7, "-[GKInternalRepresentation(Cache) initWithCacheObject:]", [v9 UTF8String], 35);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }

  v14.receiver = self;
  v14.super_class = (Class)GKInternalRepresentation;
  v11 = [(GKInternalRepresentation *)&v14 init];
  v12 = v11;
  if (v11) {
    [(GKInternalRepresentation *)v11 updateWithCacheObject:v4];
  }

  return v12;
}

- (void)updateWithCacheObject:(id)a3
{
  id v19 = a3;
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v4 = +[NSThread callStackSymbols];
    id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKInternalRepresentation(Cache) updateWithCacheObject:]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation+Cache.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKInternalRepresentation(Cache) updateWithCacheObject:]", [v7 UTF8String], 46);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  id v9 = [(id)objc_opt_class() secureCodedPropertyKeys];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v10 = [v9 allKeys];
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v16 = [v9 objectForKey:v15];
        if ([v16 isMemberOfClass:objc_opt_class()])
        {
          v17 = 0;
        }
        else
        {
          v17 = [v19 valueForKey:v15];
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v17) {
            goto LABEL_15;
          }
          [(GKInternalRepresentation *)self setValue:v17 forKey:v15];
        }

LABEL_15:
      }
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
}

@end