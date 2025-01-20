@interface MapsSuggestionsOfflineService
- (BOOL)_anyDownloadedRegionContainsCoordinate:(id)a3;
- (BOOL)shouldKeepEntryWhenOffline:(id)a3;
- (MapsSuggestionsOfflineService)init;
@end

@implementation MapsSuggestionsOfflineService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)shouldKeepEntryWhenOffline:(id)a3
{
  id v4 = a3;
  if (GEOConfigGetBOOL())
  {
    if ([v4 type] == (id)24)
    {
      v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Not showing ContactActivity entries while offline", buf, 2u);
      }
      BOOL v6 = 0;
      goto LABEL_20;
    }
    v5 = [v4 geoMapItem];
    if (v5)
    {
      v7 = [v4 geoMapItem];
      [v7 coordinate];
      double v9 = v8;
      double v11 = v10;

      LODWORD(v7) = -[MapsSuggestionsOfflineService _anyDownloadedRegionContainsCoordinate:](self, "_anyDownloadedRegionContainsCoordinate:", v9, v11);
      v12 = GEOFindOrCreateLog();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
      if (!v7)
      {
        if (v13)
        {
          *(_WORD *)v17 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Entry's map item is NOT within a downloaded region, throwing away entry.", v17, 2u);
        }
        BOOL v6 = 0;
        goto LABEL_19;
      }
      if (!v13)
      {
        BOOL v6 = 1;
        goto LABEL_19;
      }
      __int16 v18 = 0;
      v14 = "Entry's map item is within a downloaded region, keeping entry.";
      BOOL v6 = 1;
      v15 = (uint8_t *)&v18;
    }
    else
    {
      v12 = GEOFindOrCreateLog();
      BOOL v6 = 1;
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
LABEL_19:

        goto LABEL_20;
      }
      *(_WORD *)v19 = 0;
      v14 = "Entry does not have an associated map item, keeping entry.";
      v15 = v19;
    }
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v14, v15, 2u);
    goto LABEL_19;
  }
  v5 = GEOFindOrCreateLog();
  BOOL v6 = 1;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Maps was NOT forced into offline mode, keeping entry.", v21, 2u);
  }
LABEL_20:

  return v6;
}

- (MapsSuggestionsOfflineService)init
{
  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsOfflineService;
  v2 = [(MapsSuggestionsOfflineService *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MapsSuggestionsOfflineServiceQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    BOOL v6 = (GEOMapDataSubscriptionManager *)objc_alloc_init((Class)GEOMapDataSubscriptionManager);
    subscriptionManager = v2->_subscriptionManager;
    v2->_subscriptionManager = v6;
  }
  return v2;
}

- (BOOL)_anyDownloadedRegionContainsCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  BOOL v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  queue = self->_queue;
  subscriptionManager = self->_subscriptionManager;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100A6184C;
  v13[3] = &unk_101315760;
  objc_super v9 = v6;
  double v16 = var0;
  double v17 = var1;
  v14 = v9;
  v15 = &v18;
  [(GEOMapDataSubscriptionManager *)subscriptionManager fetchAllSubscriptionsWithCallbackQueue:queue completionHandler:v13];
  GEOConfigGetDouble();
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
  dispatch_group_wait(v9, v11);
  LOBYTE(v6) = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)v6;
}

@end