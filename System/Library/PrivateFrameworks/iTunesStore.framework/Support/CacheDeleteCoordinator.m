@interface CacheDeleteCoordinator
+ (id)sharedInstance;
- (BOOL)_isStale;
- (CacheDeleteCoordinator)init;
- (OS_dispatch_source)scheduledTimer;
- (id)_periodic:(id)a3 urgency:(int)a4;
- (id)_purchaseHistoryCache;
- (id)_purge:(id)a3 urgency:(int)a4;
- (id)_purgeable:(id)a3 urgency:(int)a4;
- (int64_t)_targetVolumeFromString:(id)a3;
- (unint64_t)_currentPurgeable;
- (void)_cancelPurge;
- (void)_pushUpdatedAvailableStorage;
- (void)_refreshPurgeableStorage;
- (void)dealloc;
- (void)registerCacheDeleteInfoCallbacks;
- (void)setScheduledTimer:(id)a3;
- (void)updatePurgeableStorage;
@end

@implementation CacheDeleteCoordinator

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E2A8;
  block[3] = &unk_1003A31A0;
  block[4] = a1;
  if (qword_100401CB8 != -1) {
    dispatch_once(&qword_100401CB8, block);
  }
  v2 = (void *)qword_100401CB0;

  return v2;
}

- (CacheDeleteCoordinator)init
{
  v7.receiver = self;
  v7.super_class = (Class)CacheDeleteCoordinator;
  v2 = [(CacheDeleteCoordinator *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.itunesstored.CacheDeleteCoordinator.dispatch", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    [(CacheDeleteCoordinator *)v2 registerCacheDeleteInfoCallbacks];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(CacheDeleteCoordinator *)self scheduledTimer];

  if (v3)
  {
    dispatch_queue_t v4 = [(CacheDeleteCoordinator *)self scheduledTimer];
    dispatch_source_cancel(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)CacheDeleteCoordinator;
  [(CacheDeleteCoordinator *)&v5 dealloc];
}

- (void)registerCacheDeleteInfoCallbacks
{
  objc_initWeak(&location, self);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10004E790;
  v25[3] = &unk_1003A42E8;
  v14 = &v26;
  objc_copyWeak(&v26, &location);
  v17 = objc_retainBlock(v25);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10004E7FC;
  v23[3] = &unk_1003A42E8;
  v15 = &v24;
  objc_copyWeak(&v24, &location);
  v18 = objc_retainBlock(v23);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10004E868;
  v21[3] = &unk_1003A4248;
  v16 = &v22;
  objc_copyWeak(&v22, &location);
  v2 = objc_retainBlock(v21);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10004E8A8;
  v19[3] = &unk_1003A42E8;
  objc_copyWeak(&v20, &location);
  v3 = objc_retainBlock(v19);
  int v4 = CacheDeleteRegisterInfoCallbacks();
  objc_super v5 = +[SSLogConfig sharedConfig];
  unsigned int v6 = [v5 shouldLog];
  unsigned int v7 = [v5 shouldLogToDisk];
  v8 = [v5 OSLogObject];
  v9 = v8;
  if (v7) {
    v6 |= 2u;
  }
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_8;
  }
  v10 = objc_opt_class();
  int v28 = 138412802;
  v29 = v10;
  __int16 v30 = 2112;
  v31 = off_1004008B0;
  __int16 v32 = 1024;
  int v33 = v4;
  id v11 = v10;
  LODWORD(v13) = 28;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v28, v13, &v26, &v24, &v22);
    free(v12);
    SSFileLog();
LABEL_8:
  }
  objc_destroyWeak(&v20);

  objc_destroyWeak(v16);
  objc_destroyWeak(v15);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

- (void)updatePurgeableStorage
{
  v3 = [(CacheDeleteCoordinator *)self scheduledTimer];

  if (!v3)
  {
    dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    [(CacheDeleteCoordinator *)self setScheduledTimer:v4];

    objc_super v5 = [(CacheDeleteCoordinator *)self scheduledTimer];
    dispatch_time_t v6 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);

    unsigned int v7 = [(CacheDeleteCoordinator *)self scheduledTimer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004EA34;
    handler[3] = &unk_1003A3140;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);

    v8 = [(CacheDeleteCoordinator *)self scheduledTimer];
    dispatch_resume(v8);
  }
}

- (void)_cancelPurge
{
  v2 = +[SSLogConfig sharedConfig];
  unsigned int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  objc_super v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_9;
  }
  LODWORD(v9) = 138412290;
  *(void *)((char *)&v9 + 4) = objc_opt_class();
  id v6 = *(id *)((char *)&v9 + 4);
  LODWORD(v8) = 12;
  unsigned int v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_super v5 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v7, 4, &v9, v8, v9);
    free(v7);
    SSFileLog();
LABEL_9:
  }
}

- (unint64_t)_currentPurgeable
{
  id v2 = objc_alloc_init((Class)SSAppPurchaseHistoryCache);
  unsigned int v3 = (char *)[v2 purgeableSpace];
  if (+[ISURLOperation sharedCFURLCache])
  {
    +[ISURLOperation sharedCFURLCache];
    v3 += CFURLCacheCurrentDiskUsage();
  }

  return (unint64_t)v3;
}

- (BOOL)_isStale
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double lastUpdate = self->_lastUpdate;
  return Current - lastUpdate > 3600.0 || lastUpdate == 0.0;
}

- (id)_periodic:(id)a3 urgency:(int)a4
{
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  unsigned int v7 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

  uint64_t v8 = +[SSLogConfig sharedConfig];
  unsigned int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  id v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    v10 &= 2u;
  }
  if (v10)
  {
    int v20 = 138412802;
    id v21 = (id)objc_opt_class();
    __int16 v22 = 2112;
    v23 = v7;
    __int16 v24 = 2048;
    uint64_t v25 = a4;
    id v12 = v21;
    LODWORD(v17) = 32;
    uint64_t v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13) {
      goto LABEL_10;
    }
    id v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v20, v17);
    free(v13);
    SSFileLog();
  }

LABEL_10:
  v18[1] = @"CACHE_DELETE_AMOUNT";
  v19[0] = v6;
  v18[0] = @"CACHE_DELETE_VOLUME";
  v14 = +[NSNumber numberWithInteger:0];
  v19[1] = v14;
  v15 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v15;
}

- (id)_purchaseHistoryCache
{
  purchaseHistoryCache = self->__purchaseHistoryCache;
  if (!purchaseHistoryCache)
  {
    int v4 = (SSAppPurchaseHistoryCache *)objc_alloc_init((Class)SSAppPurchaseHistoryCache);
    id v5 = self->__purchaseHistoryCache;
    self->__purchaseHistoryCache = v4;

    purchaseHistoryCache = self->__purchaseHistoryCache;
  }

  return purchaseHistoryCache;
}

- (id)_purge:(id)a3 urgency:(int)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

  if ((id)[(CacheDeleteCoordinator *)self _targetVolumeFromString:v7] == (id)2)
  {
    id v9 = [v8 unsignedLongLongValue];
    unint64_t v10 = [(CacheDeleteCoordinator *)self _currentPurgeable];
    id v11 = [(CacheDeleteCoordinator *)self _purchaseHistoryCache];
    [v11 purge:v9];

    if (+[ISURLOperation sharedCFURLCache])
    {
      +[ISURLOperation sharedCFURLCache];
      CFURLCacheRemoveAllCachedResponses();
    }
    unint64_t v12 = v10 - [(CacheDeleteCoordinator *)self _currentPurgeable];
    uint64_t v13 = self;
    objc_sync_enter(v13);
    v13->_double lastUpdate = 0.0;
    combinedSpaceByUrgency = v13->_combinedSpaceByUrgency;
    v13->_combinedSpaceByUrgency = 0;

    objc_sync_exit(v13);
    v15 = +[SSLogConfig sharedConfig];
    unsigned int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    v18 = [v15 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (v17)
    {
      int v28 = 138413058;
      id v29 = (id)objc_opt_class();
      __int16 v30 = 2112;
      v31 = v8;
      __int16 v32 = 2048;
      unint64_t v33 = v12;
      __int16 v34 = 2048;
      uint64_t v35 = a4;
      id v19 = v29;
      LODWORD(v25) = 42;
      __int16 v24 = &v28;
      int v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_13:

        goto LABEL_15;
      }
      v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v28, v25);
      free(v20);
      __int16 v24 = (int *)v18;
      SSFileLog();
    }

    goto LABEL_13;
  }
  unint64_t v12 = 0;
LABEL_15:
  v26[1] = @"CACHE_DELETE_AMOUNT";
  v27[0] = v7;
  v26[0] = @"CACHE_DELETE_VOLUME";
  id v21 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v12, v24);
  v27[1] = v21;
  __int16 v22 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];

  return v22;
}

- (id)_purgeable:(id)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  unsigned int v7 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  if ((id)[(CacheDeleteCoordinator *)self _targetVolumeFromString:v7] != (id)2)
  {
    id v15 = 0;
    goto LABEL_28;
  }
  uint64_t v8 = +[SSLogConfig sharedConfig];
  unsigned int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  id v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    v10 &= 2u;
  }
  if (v10)
  {
    int v34 = 138412546;
    id v35 = (id)objc_opt_class();
    __int16 v36 = 2048;
    id v37 = (id)(int)v4;
    id v12 = v35;
    LODWORD(v31) = 22;
    __int16 v30 = &v34;
    uint64_t v13 = (void *)_os_log_send_and_compose_impl();

    if (v13)
    {
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v34, v31);
      v14 = (int *)objc_claimAutoreleasedReturnValue();
      free(v13);
      __int16 v30 = v14;
      SSFileLog();
    }
  }
  else
  {
  }
  unsigned int v16 = self;
  objc_sync_enter(v16);
  if (!v16->_combinedSpaceByUrgency || [(CacheDeleteCoordinator *)v16 _isStale]) {
    [(CacheDeleteCoordinator *)v16 _refreshPurgeableStorage];
  }
  combinedSpaceByUrgency = v16->_combinedSpaceByUrgency;
  v18 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4, v30);
  id v19 = [(NSDictionary *)combinedSpaceByUrgency objectForKey:v18];

  if (v19) {
    id v15 = [v19 unsignedLongLongValue];
  }
  else {
    id v15 = 0;
  }

  objc_sync_exit(v16);
  int v20 = +[SSLogConfig sharedConfig];
  unsigned int v21 = [v20 shouldLog];
  if ([v20 shouldLogToDisk]) {
    int v22 = v21 | 2;
  }
  else {
    int v22 = v21;
  }
  v23 = [v20 OSLogObject];
  if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
    v22 &= 2u;
  }
  if (!v22) {
    goto LABEL_26;
  }
  __int16 v24 = objc_opt_class();
  int v34 = 138412802;
  id v35 = v24;
  __int16 v36 = 2048;
  id v37 = v15;
  __int16 v38 = 2048;
  uint64_t v39 = (int)v4;
  id v25 = v24;
  LODWORD(v31) = 32;
  __int16 v30 = &v34;
  id v26 = (void *)_os_log_send_and_compose_impl();

  if (v26)
  {
    v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v34, v31);
    free(v26);
    __int16 v30 = (int *)v23;
    SSFileLog();
LABEL_26:
  }
LABEL_28:
  v32[0] = @"CACHE_DELETE_VOLUME";
  v32[1] = @"CACHE_DELETE_AMOUNT";
  v33[0] = v7;
  v27 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v15, v30);
  v33[1] = v27;
  int v28 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];

  return v28;
}

- (void)_pushUpdatedAvailableStorage
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(CacheDeleteCoordinator *)self _refreshPurgeableStorage];
  unsigned int v3 = [(CacheDeleteCoordinator *)self scheduledTimer];

  if (v3)
  {
    uint64_t v4 = [(CacheDeleteCoordinator *)self scheduledTimer];
    dispatch_source_cancel(v4);

    [(CacheDeleteCoordinator *)self setScheduledTimer:0];
  }
  id v5 = self;
  objc_sync_enter(v5);
  combinedSpaceByUrgency = v5->_combinedSpaceByUrgency;
  if (combinedSpaceByUrgency) {
    id v7 = [(NSDictionary *)combinedSpaceByUrgency copy];
  }
  else {
    id v7 = 0;
  }
  objc_sync_exit(v5);

  if (v7)
  {
    v18[0] = @"CACHE_DELETE_ID";
    v18[1] = @"CACHE_DELETE_VOLUME";
    v19[0] = off_1004008B0;
    v19[1] = @"/private/var/mobile";
    void v18[2] = @"CACHE_DELETE_AMOUNT";
    void v19[2] = v7;
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
    CacheDeleteUpdatePurgeable();
    unsigned int v9 = +[SSLogConfig sharedConfig];
    unsigned int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    id v12 = [v9 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      v11 &= 2u;
    }
    if (v11)
    {
      *(_DWORD *)unsigned int v16 = 138412802;
      *(void *)&v16[4] = objc_opt_class();
      *(_WORD *)&v16[12] = 2112;
      *(void *)&v16[14] = v7;
      *(_WORD *)&v16[22] = 2112;
      CFStringRef v17 = @"/private/var/mobile";
      id v13 = *(id *)&v16[4];
      LODWORD(v15) = 32;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_16:

        goto LABEL_17;
      }
      id v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, v16, v15, *(_OWORD *)v16, *(void *)&v16[16], v17);
      free(v14);
      SSFileLog();
    }

    goto LABEL_16;
  }
LABEL_17:
}

- (void)_refreshPurgeableStorage
{
  unsigned int v3 = +[SSLogConfig sharedConfig];
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (v5)
  {
    LODWORD(v20) = 138412290;
    *(void *)((char *)&v20 + 4) = objc_opt_class();
    id v7 = *(id *)((char *)&v20 + 4);
    LODWORD(v19) = 12;
    v18 = &v20;
    uint64_t v8 = (void *)_os_log_send_and_compose_impl();

    if (v8)
    {
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v20, v19, v20);
      unsigned int v9 = (long long *)objc_claimAutoreleasedReturnValue();
      free(v8);
      v18 = v9;
      SSFileLog();
    }
  }
  else
  {
  }
  unint64_t v10 = [(CacheDeleteCoordinator *)self _currentPurgeable];
  int v11 = objc_opt_new();
  uint64_t v12 = 1;
  do
  {
    id v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v10, v18);
    v14 = +[NSNumber numberWithInt:v12];
    [v11 setObject:v13 forKey:v14];

    uint64_t v12 = (v12 + 1);
  }
  while (v12 != 5);
  uint64_t v15 = self;
  objc_sync_enter(v15);
  unsigned int v16 = (NSDictionary *)[v11 copy];
  combinedSpaceByUrgency = v15->_combinedSpaceByUrgency;
  v15->_combinedSpaceByUrgency = v16;

  v15->_double lastUpdate = CFAbsoluteTimeGetCurrent();
  objc_sync_exit(v15);
}

- (int64_t)_targetVolumeFromString:(id)a3
{
  id v3 = a3;
  unsigned int v4 = v3;
  if (v3 && ([v3 isEqualToString:@"/private/var"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"/private/var/mobile"]) {
      int64_t v5 = 2;
    }
    else {
      int64_t v5 = 1;
    }
  }
  else
  {
    int64_t v5 = 1;
  }

  return v5;
}

- (OS_dispatch_source)scheduledTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40, 1);
}

- (void)setScheduledTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledTimer, 0);
  objc_storeStrong((id *)&self->__purchaseHistoryCache, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_combinedSpaceByUrgency, 0);
}

@end