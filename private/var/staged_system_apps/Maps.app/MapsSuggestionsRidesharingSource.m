@interface MapsSuggestionsRidesharingSource
+ (BOOL)isEnabled;
+ (unint64_t)disposition;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (BOOL)refreshing;
- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (BOOL)suspended;
- (OS_dispatch_queue)queue;
- (RideBookingRideStatusObserverProxy)rideStatusObserverProxy;
- (double)updateSuggestionEntriesWithHandler:(id)a3;
- (id)initFromResourceDepot:(id)a3 name:(id)a4;
- (void)rideStatusMapDidChange:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRefreshing:(BOOL)a3;
- (void)setRideStatusObserverProxy:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation MapsSuggestionsRidesharingSource

- (void)start
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "start", v5, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  [(MapsSuggestionsRidesharingSource *)v4 setSuspended:0];
  objc_sync_exit(v4);
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v21 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRidesharingSource.m";
      __int16 v29 = 1024;
      int v30 = 56;
      __int16 v31 = 2082;
      v32 = "-[MapsSuggestionsRidesharingSource initFromResourceDepot:name:]";
      __int16 v33 = 2082;
      v34 = "nil == (resourceDepot)";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!", location, 0x26u);
    }
    goto LABEL_11;
  }
  v8 = [v6 oneSourceDelegate];

  if (!v8)
  {
    v21 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRidesharingSource.m";
      __int16 v29 = 1024;
      int v30 = 57;
      __int16 v31 = 2082;
      v32 = "-[MapsSuggestionsRidesharingSource initFromResourceDepot:name:]";
      __int16 v33 = 2082;
      v34 = "nil == (resourceDepot.oneSourceDelegate)";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!", location, 0x26u);
    }
LABEL_11:

    v20 = 0;
    goto LABEL_12;
  }
  v9 = [v6 oneSourceDelegate];
  v27.receiver = self;
  v27.super_class = (Class)MapsSuggestionsRidesharingSource;
  v10 = [(MapsSuggestionsRidesharingSource *)&v27 initWithDelegate:v9 name:v7];

  if (v10)
  {
    id v11 = [(MapsSuggestionsRidesharingSource *)v10 uniqueName];
    v12 = (const char *)[v11 cStringUsingEncoding:4];
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v14;

    id oneShotCallbackBlock = v10->_oneShotCallbackBlock;
    v10->_id oneShotCallbackBlock = 0;

    uint64_t v17 = [v6 oneAppGuardian];
    guardian = v10->_guardian;
    v10->_guardian = (MapsSuggestionsAppGuardian *)v17;

    objc_initWeak((id *)location, v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001893C;
    block[3] = &unk_1012E6708;
    objc_copyWeak(&v26, (id *)location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v19 = v10->_queue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100A9115C;
    v23[3] = &unk_1012F6090;
    objc_copyWeak(&v24, (id *)location);
    notify_register_dispatch("MapsSuggestionsRidesharingSourceShouldRefresh", &v10->_token, v19, v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)location);
  }
  self = v10;
  v20 = self;
LABEL_12:

  return v20;
}

- (void)setRefreshing:(BOOL)a3
{
  self->_refreshing = a3;
}

- (void)rideStatusMapDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  if ([(MapsSuggestionsRidesharingSource *)v6 suspended])
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Returning from %@ because we are suspended", buf, 0xCu);
    }
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = [(MapsSuggestionsRidesharingSource *)v6 uniqueName];
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v10;
      __int16 v18 = 2080;
      v19 = "_updateRideBookingRideStatuses";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    id v11 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateRideBookingRideStatuses", "", buf, 2u);
    }

    objc_sync_exit(v6);
  }
  else
  {
    objc_sync_exit(v6);

    objc_initWeak((id *)buf, v6);
    queue = v6->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100088B88;
    v13[3] = &unk_1012E6690;
    objc_copyWeak(&v15, (id *)buf);
    id v14 = v5;
    dispatch_async(queue, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "updateSuggestionEntriesWithHandler", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  if ((+[MapsSuggestionsSiri isEnabled] & 1) == 0)
  {
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)objc_super v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "User turned off Siri: we're not using our suggestions", v27, 2u);
    }

    queue = self->_queue;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100A91420;
    v24[3] = &unk_1012E9950;
    v8 = &v26;
    objc_copyWeak(&v26, buf);
    v25 = v4;
    dispatch_async(queue, v24);
    v9 = v25;
    goto LABEL_11;
  }
  if (MapsSuggestionsIsInCoarseLocation())
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)objc_super v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Maps is in Coarse Location", v27, 2u);
    }

    id v7 = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100A9163C;
    block[3] = &unk_1012E9950;
    v8 = &v23;
    objc_copyWeak(&v23, buf);
    v22 = v4;
    dispatch_async(v7, block);
    v9 = v22;
LABEL_11:

    objc_destroyWeak(v8);
    goto LABEL_12;
  }
  id v14 = self;
  objc_sync_enter(v14);
  if (![(MapsSuggestionsRidesharingSource *)v14 suspended])
  {
    objc_sync_exit(v14);

    v16 = v14->_queue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10007A064;
    v18[3] = &unk_1012E9950;
    objc_copyWeak(&v20, buf);
    v19 = v4;
    dispatch_async(v16, v18);
    GEOConfigGetDouble();
    double v12 = v17;

    objc_destroyWeak(&v20);
    goto LABEL_13;
  }
  id v15 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Suspended, so no need to update", v27, 2u);
  }

  if (v4) {
    v4[2](v4);
  }
  objc_sync_exit(v14);

LABEL_12:
  double v12 = 0.0;
LABEL_13:
  objc_destroyWeak(buf);

  return v12;
}

- (BOOL)suspended
{
  return self->_suspended;
}

+ (unint64_t)disposition
{
  return 1;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return a3 == 9;
}

+ (BOOL)isEnabled
{
  int v2 = sub_10008034C();
  if (v2)
  {
    LOBYTE(v2) = GEOConfigGetBOOL();
  }
  return v2;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  return 0;
}

- (void)stop
{
  [(MapsSuggestionsAppGuardian *)self->_guardian unregisterAllBundleIDsForSource:self];
  v3 = self;
  objc_sync_enter(v3);
  [(MapsSuggestionsRidesharingSource *)v3 setSuspended:1];
  objc_sync_exit(v3);

  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "stop", v5, 2u);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)refreshing
{
  return self->_refreshing;
}

- (RideBookingRideStatusObserverProxy)rideStatusObserverProxy
{
  return self->_rideStatusObserverProxy;
}

- (void)setRideStatusObserverProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideStatusObserverProxy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_guardian, 0);

  objc_storeStrong(&self->_oneShotCallbackBlock, 0);
}

@end