@interface NSManagedObjectContext
- (unint64_t)_gkCountObjectsFromRequest:(id)a3;
- (void)_gkClearAllEntriesOfEntity:(id)a3;
- (void)_gkDeleteObjects:(id)a3;
- (void)_gkSafeSave;
@end

@implementation NSManagedObjectContext

- (void)_gkSafeSave
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[NSManagedObjectContext(GKAdditions) _gkSafeSave]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/NSManagedObjectContext+GKAdditions.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[NSManagedObjectContext(GKAdditions) _gkSafeSave]", [v7 UTF8String], 32);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  v15[0] = 0;
  unsigned __int8 v9 = [(NSManagedObjectContext *)self save:v15];
  id v10 = v15[0];
  v11 = os_log_GKGeneral;
  if (v9)
  {
    if (!os_log_GKGeneral) {
      id v12 = (id)GKOSLoggers();
    }
    v13 = os_log_GKCache;
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
      sub_100125BC4((uint64_t)self, v13);
    }
  }
  else
  {
    if (!os_log_GKGeneral)
    {
      id v14 = (id)GKOSLoggers();
      v11 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100125C3C((uint64_t)self, (uint64_t)v10, v11);
    }
    [(NSManagedObjectContext *)self rollback];
  }
}

- (void)_gkDeleteObjects:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = v4;
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          unsigned __int8 v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            -[NSManagedObjectContext deleteObject:](self, "deleteObject:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9), (void)v10);
            unsigned __int8 v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
    else
    {
      +[NSException raise:@"GKInvalidParameter" format:@"objects parameter must be of kind NSSet, NSOrderedSet or NSArray"];
    }
  }
}

- (void)_gkClearAllEntriesOfEntity:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:v4];

  id v6 = [objc_alloc((Class)NSBatchDeleteRequest) initWithFetchRequest:v5];
  id v13 = 0;
  id v7 = [(NSManagedObjectContext *)self executeRequest:v6 error:&v13];
  id v8 = v13;
  if (v8)
  {
    if (!os_log_GKGeneral) {
      id v9 = (id)GKOSLoggers();
    }
    long long v10 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100125CC4(v10);
    }
    long long v11 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v12 = (id)GKOSLoggers();
      long long v11 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Clear entries error: %@", buf, 0xCu);
    }
  }
}

- (unint64_t)_gkCountObjectsFromRequest:(id)a3
{
  id v10 = 0;
  unint64_t v3 = [(NSManagedObjectContext *)self countForFetchRequest:a3 error:&v10];
  id v4 = v10;
  if (v4)
  {
    if (!os_log_GKGeneral) {
      id v5 = (id)GKOSLoggers();
    }
    id v6 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100125D08(v6);
    }
    id v7 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v8 = (id)GKOSLoggers();
      id v7 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Count for objects: %@", buf, 0xCu);
    }
  }

  return v3;
}

@end