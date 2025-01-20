@interface BKRecentBookOpenResultTracker
+ (id)_cachePath;
+ (void)removeCache;
- (BKLRUCache)cache;
- (BKRecentBookOpenResultTracker)init;
- (BOOL)shouldAutoOpenAsset:(id)a3;
- (id)_loadCache;
- (id)_mutableResultsForAsset:(id)a3;
- (id)resultsForAsset:(id)a3;
- (void)_addEvent:(id)a3 forAsset:(id)a4;
- (void)openDidFinishForAsset:(id)a3;
- (void)openDidStartForAsset:(id)a3;
- (void)save;
- (void)setCache:(id)a3;
@end

@implementation BKRecentBookOpenResultTracker

- (BKRecentBookOpenResultTracker)init
{
  v7.receiver = self;
  v7.super_class = (Class)BKRecentBookOpenResultTracker;
  v2 = [(BKRecentBookOpenResultTracker *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(BKRecentBookOpenResultTracker *)v2 _loadCache];
    cache = v3->_cache;
    v3->_cache = (BKLRUCache *)v4;
  }
  return v3;
}

- (id)_loadCache
{
  v2 = +[BKRecentBookOpenResultTracker _cachePath];
  v3 = +[NSFileManager defaultManager];
  unsigned int v4 = [v3 fileExistsAtPath:v2 isDirectory:0];

  id v5 = 0;
  if (!v4) {
    goto LABEL_13;
  }
  v6 = +[NSURL fileURLWithPath:v2];
  if (v6)
  {
    id v13 = 0;
    objc_super v7 = +[NSData dataWithContentsOfURL:v6 options:0 error:&v13];
    id v5 = v13;
    if (v7)
    {
      v8 = +[NSKeyedUnarchiver unarchiveObjectWithData:v7];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    id v5 = +[NSError errorWithDomain:off_100B1E4C8 code:20 userInfo:0];
    v8 = 0;
  }

  if (v5)
  {
    v9 = sub_100079470();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1007EA978();
    }
  }
  if (!v8)
  {
LABEL_13:
    v10 = sub_100079470();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Creating new cache", v12, 2u);
    }

    v8 = [[BKLRUCache alloc] initWithCapacity:10];
  }

  return v8;
}

+ (id)_cachePath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 lastObject];
  unsigned int v4 = [v3 stringByAppendingPathComponent:@"BKRecentOpenResultsCache_v20230710"];

  return v4;
}

- (id)resultsForAsset:(id)a3
{
  return [(BKLRUCache *)self->_cache objectForKey:a3];
}

- (id)_mutableResultsForAsset:(id)a3
{
  v3 = [(BKRecentBookOpenResultTracker *)self resultsForAsset:a3];
  unsigned int v4 = v3;
  if (v3) {
    id v5 = [v3 mutableCopy];
  }
  else {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  }
  v6 = v5;

  return v6;
}

- (void)openDidStartForAsset:(id)a3
{
  id v4 = a3;
  id v5 = +[BKUserActivityManager sharedInstance];
  unsigned int v6 = [v5 isInBackground];

  if (v6)
  {
    objc_super v7 = sub_100079470();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Ignoring asset open start in background", v9, 2u);
    }
  }
  else
  {
    v8 = +[BKRecentBookOpenTrackingEvent eventForStart:1];
    [(BKRecentBookOpenResultTracker *)self _addEvent:v8 forAsset:v4];
  }
}

- (void)openDidFinishForAsset:(id)a3
{
  id v4 = a3;
  id v5 = +[BKRecentBookOpenTrackingEvent eventForStart:0];
  [(BKRecentBookOpenResultTracker *)self _addEvent:v5 forAsset:v4];
}

- (BOOL)shouldAutoOpenAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(BKRecentBookOpenResultTracker *)self resultsForAsset:v4];
  unsigned int v6 = [v5 lastObject];
  if (![v4 length])
  {
    v17 = sub_100079470();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23[0]) = 0;
      v18 = "Asset has no ID.";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)v23, 2u);
    }
LABEL_14:
    BOOL v19 = 1;
LABEL_15:

    goto LABEL_21;
  }
  if (!v6)
  {
    v17 = sub_100079470();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23[0]) = 0;
      v18 = "Asset has no recent open events.";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if ([v6 isStart])
  {
    objc_super v7 = [v6 timestamp];
    [v7 timeIntervalSinceNow];
    double v9 = fabs(v8);

    if (v9 <= 300.0)
    {
      v17 = sub_100079470();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
LABEL_27:
        BOOL v19 = 0;
        goto LABEL_15;
      }
      LOWORD(v23[0]) = 0;
      v20 = "Asset recently did not finish opening.";
    }
    else
    {
      v10 = (char *)[v5 count];
      unint64_t v11 = 0;
      uint64_t v12 = (uint64_t)(v10 - 1);
      id v13 = &v10[-((unint64_t)(v10 - 1) & ((uint64_t)(v10 - 1) >> 63))];
      while (v12-- >= 1)
      {
        v15 = [v5 objectAtIndexedSubscript:v12];
        unsigned __int8 v16 = [v15 isStart];

        ++v11;
        if ((v16 & 1) == 0) {
          goto LABEL_19;
        }
      }
      unint64_t v11 = (unint64_t)v13;
LABEL_19:
      if (v11 < 3) {
        goto LABEL_20;
      }
      v17 = sub_100079470();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      LOWORD(v23[0]) = 0;
      v20 = "Asset had several consecutive failures opening.";
    }
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)v23, 2u);
    goto LABEL_27;
  }
LABEL_20:
  BOOL v19 = 1;
LABEL_21:
  v21 = sub_100079470();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v23[0] = 67240192;
    v23[1] = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Recommending auto-open? %{public}d", (uint8_t *)v23, 8u);
  }

  return v19;
}

- (void)_addEvent:(id)a3 forAsset:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  objc_super v7 = [(BKRecentBookOpenResultTracker *)self _mutableResultsForAsset:v6];
  if ((unint64_t)[v7 count] >= 3) {
    [v7 removeObjectAtIndex:0];
  }
  [v7 addObject:v8];
  [(BKLRUCache *)self->_cache setObject:v7 forKey:v6];

  [(BKRecentBookOpenResultTracker *)self save];
}

- (void)save
{
  v3 = +[BKRecentBookOpenResultTracker _cachePath];
  cache = self->_cache;
  id v9 = 0;
  id v5 = +[NSKeyedArchiver archivedDataWithRootObject:cache requiringSecureCoding:0 error:&v9];
  id v6 = v9;
  if (v6)
  {
    objc_super v7 = v6;
    id v8 = sub_100079470();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1007EAA48();
    }
LABEL_7:

    goto LABEL_8;
  }
  if (([v5 writeToFile:v3 atomically:1] & 1) == 0)
  {
    objc_super v7 = +[NSError errorWithDomain:off_100B1E4C8 code:30 userInfo:0];
    id v8 = sub_100079470();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1007EA9E0();
    }
    goto LABEL_7;
  }
LABEL_8:
}

+ (void)removeCache
{
  v2 = +[BKRecentBookOpenResultTracker _cachePath];
  v3 = +[NSFileManager defaultManager];
  if ([v3 fileExistsAtPath:v2 isDirectory:0])
  {
    id v4 = +[NSFileManager defaultManager];
    id v7 = 0;
    [v4 removeItemAtPath:v2 error:&v7];
    id v5 = v7;

    if (v5)
    {
      id v6 = sub_100079470();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1007EAAB0();
      }
    }
  }
}

- (BKLRUCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end