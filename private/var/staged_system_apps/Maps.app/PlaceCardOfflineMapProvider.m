@interface PlaceCardOfflineMapProvider
- (BOOL)isRegionDownloaded;
- (MKMapItem)mapItem;
- (MapDataSubscriptionInfo)subscriptionInfo;
- (NSProgress)downloadProgress;
- (PlaceCardOfflineMapProvider)initWithMapItem:(id)a3;
- (int64_t)downloadState;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setSubscriptionInfo:(id)a3;
- (void)subscriptionInfosDidChange:(id)a3;
@end

@implementation PlaceCardOfflineMapProvider

- (PlaceCardOfflineMapProvider)initWithMapItem:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PlaceCardOfflineMapProvider;
  v6 = [(PlaceCardOfflineMapProvider *)&v16 init];
  if (v6)
  {
    v7 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___MUOfflineMapProviderObserver queue:&_dispatch_main_q];
    observers = v6->_observers;
    v6->_observers = v7;

    objc_storeStrong((id *)&v6->_mapItem, a3);
    v9 = +[MapsOfflineUIHelper sharedHelper];
    [v9 addObserver:v6];

    v10 = +[MapsOfflineUIHelper sharedHelper];
    v11 = [(PlaceCardOfflineMapProvider *)v6 mapItem];
    v12 = [v11 _geoMapItem];
    v13 = [v12 offlineDownloadRegion];
    v14 = [v10 subscriptionInfoForRegion:v13];
    [(PlaceCardOfflineMapProvider *)v6 setSubscriptionInfo:v14];
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[MapsOfflineUIHelper sharedHelper];
  [v3 removeObserver:self];

  [(PlaceCardOfflineMapProvider *)self setSubscriptionInfo:0];
  v4.receiver = self;
  v4.super_class = (Class)PlaceCardOfflineMapProvider;
  [(PlaceCardOfflineMapProvider *)&v4 dealloc];
}

- (void)setSubscriptionInfo:(id)a3
{
  id v5 = (MapDataSubscriptionInfo *)a3;
  subscriptionInfo = self->_subscriptionInfo;
  if (subscriptionInfo != v5 && ![(MapDataSubscriptionInfo *)subscriptionInfo isEqual:v5])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v21 = v5;
    if (qword_101610668 != -1) {
      dispatch_once(&qword_101610668, &stru_1013161C8);
    }
    id v7 = (id)qword_101610670;
    id v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v13 = [(MapDataSubscriptionInfo *)self->_subscriptionInfo state];
          [v13 removeObserver:self forKeyPath:v12 context:off_1015F3A40];
        }
        id v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->_subscriptionInfo, a3);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    if (qword_101610668 != -1) {
      dispatch_once(&qword_101610668, &stru_1013161C8);
    }
    id v5 = v21;
    id v14 = (id)qword_101610670;
    id v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * (void)j);
          v20 = [(MapDataSubscriptionInfo *)self->_subscriptionInfo state];
          [v20 addObserver:self forKeyPath:v19 options:0 context:off_1015F3A40];
        }
        id v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v16);
    }
  }
}

- (int64_t)downloadState
{
  v3 = [(MapDataSubscriptionInfo *)self->_subscriptionInfo state];
  objc_super v4 = (char *)[v3 loadState];

  if ((unint64_t)(v4 - 1) < 2) {
    return 5;
  }
  if (v4 == (char *)3) {
    return 1;
  }
  if (v4) {
    return 0;
  }
  id v5 = [(MapDataSubscriptionInfo *)self->_subscriptionInfo state];
  unint64_t v6 = (unint64_t)[v5 downloadState];

  if (v6 >= 6) {
    return 0;
  }
  return qword_100F73480[v6];
}

- (NSProgress)downloadProgress
{
  v2 = [(PlaceCardOfflineMapProvider *)self subscriptionInfo];
  v3 = [v2 state];
  objc_super v4 = [v3 downloadProgress];

  return (NSProgress *)v4;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)subscriptionInfosDidChange:(id)a3
{
  objc_super v4 = +[MapsOfflineUIHelper sharedHelper];
  id v5 = [(PlaceCardOfflineMapProvider *)self mapItem];
  unint64_t v6 = [v5 _geoMapItem];
  id v7 = [v6 offlineDownloadRegion];
  id v8 = [v4 subscriptionInfoForRegion:v7];
  [(PlaceCardOfflineMapProvider *)self setSubscriptionInfo:v8];

  observers = self->_observers;

  [(GEOObserverHashTable *)observers offlineMapProviderUpdated:self];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1015F3A40 != a6) {
    goto LABEL_8;
  }
  v13 = [(PlaceCardOfflineMapProvider *)self subscriptionInfo];
  id v14 = [v13 state];
  if (v14 != v11)
  {

LABEL_8:
    v16.receiver = self;
    v16.super_class = (Class)PlaceCardOfflineMapProvider;
    [(PlaceCardOfflineMapProvider *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_9;
  }
  if (qword_101610668 != -1) {
    dispatch_once(&qword_101610668, &stru_1013161C8);
  }
  unsigned int v15 = [(id)qword_101610670 containsObject:v10];

  if (!v15) {
    goto LABEL_8;
  }
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A97640;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v18, &location);
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
LABEL_9:
}

- (MapDataSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (BOOL)isRegionDownloaded
{
  return self->_regionDownloaded;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end