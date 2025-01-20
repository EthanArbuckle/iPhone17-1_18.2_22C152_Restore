@interface PaymentPolygonCache
- (BOOL)cachedPolygonForLocation:(id)a3 withCompletion:(id)a4;
- (PaymentPolygonCache)init;
- (void)_deleteCachedFiles;
- (void)cachePolygon:(id)a3 forLocation:(id)a4;
@end

@implementation PaymentPolygonCache

- (PaymentPolygonCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)PaymentPolygonCache;
  v2 = [(PaymentPolygonCache *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("PaymentPolygonCacheQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)_deleteCachedFiles
{
}

- (BOOL)cachedPolygonForLocation:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_initWeak((id *)location, self);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10098F590;
    block[3] = &unk_1012E9730;
    objc_copyWeak(&v15, (id *)location);
    id v14 = v7;
    id v13 = v6;
    dispatch_async(queue, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v9 = sub_100021338();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/PaymentPolygonCache.m";
      __int16 v17 = 1024;
      int v18 = 82;
      __int16 v19 = 2082;
      v20 = "-[PaymentPolygonCache cachedPolygonForLocation:withCompletion:]";
      __int16 v21 = 2082;
      v22 = "nil == location";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Location cannot be nil", location, 0x26u);
    }

    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/PaymentPolygonCache.m";
      __int16 v17 = 1024;
      int v18 = 82;
      __int16 v19 = 2082;
      v20 = "-[PaymentPolygonCache cachedPolygonForLocation:withCompletion:]";
      __int16 v21 = 2082;
      v22 = "nil == location";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Location cannot be nil", location, 0x26u);
    }
  }
  return v6 != 0;
}

- (void)cachePolygon:(id)a3 forLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10098FB14;
  v11[3] = &unk_1012E9340;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
}

@end