@interface APCacheGCActivity
- (APCacheGCActivity)initWithCache:(id)a3;
- (APPersistentCache)cache;
- (APXPCActivityCriteria)criteria;
- (BOOL)runActivity:(id)a3;
- (NSString)taskID;
- (void)deferActivity:(id)a3 completionHandler:(id)a4;
- (void)setCache:(id)a3;
- (void)terminateActivity:(id)a3;
@end

@implementation APCacheGCActivity

- (APCacheGCActivity)initWithCache:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)APCacheGCActivity;
  v5 = [(APCacheGCActivity *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_cache, v4);
  }

  return v6;
}

- (NSString)taskID
{
  return (NSString *)@"com.apple.ap.promotedcontentd.gc";
}

- (BOOL)runActivity:(id)a3
{
  id v4 = a3;
  v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Starting Cache GC activity.", buf, 2u);
  }

  v6 = [(APCacheGCActivity *)self cache];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000AAD4;
  v9[3] = &unk_10022E530;
  id v10 = v4;
  id v7 = v4;
  [v6 startGCWithCompletionHandler:v9];

  return 1;
}

- (void)deferActivity:(id)a3 completionHandler:(id)a4
{
  v5 = (void (**)(id, uint64_t))a4;
  v6 = APLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Request GC activity deferral.", v8, 2u);
  }

  id v7 = [(APCacheGCActivity *)self cache];
  [v7 stopGC];

  v5[2](v5, 1);
}

- (void)terminateActivity:(id)a3
{
  id v3 = [(APCacheGCActivity *)self cache];
  [v3 stopGC];
}

- (APXPCActivityCriteria)criteria
{
  return self->criteria;
}

- (APPersistentCache)cache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);

  return (APPersistentCache *)WeakRetained;
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cache);
  objc_storeStrong((id *)&self->criteria, 0);

  objc_storeStrong((id *)&self->taskID, 0);
}

@end