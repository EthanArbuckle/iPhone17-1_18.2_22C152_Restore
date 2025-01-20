@interface TrafficIncidentsSourceManager
+ (id)sharedInstance;
- (TrafficIncidentsSourceManager)init;
- (id)_VKTrafficIncidentFeatureForIncidentReport:(id)a3;
- (id)cachedIncidentsPersonalizedItems;
- (id)cachedVKTrafficIncidentFeatureItemsForSelectedRoute:(id)a3;
- (id)observers;
- (void)_addReport:(id)a3;
- (void)_addVKTrafficIncidentFeatureItemToCache:(id)a3;
- (void)_refreshDataSource;
- (void)addObserver:(id)a3;
- (void)incidentsStorageManagerDidAddReport:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation TrafficIncidentsSourceManager

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(TrafficIncidentsSourceManager *)self observers];
  [v5 unregisterObserver:v4];
}

- (void)_refreshDataSource
{
  v3 = +[TrafficIncidentsStorageManager sharedInstance];
  id v4 = [v3 visibleReports];

  id v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  cachedVKTrafficIncidentFeatureItems = self->_cachedVKTrafficIncidentFeatureItems;
  self->_cachedVKTrafficIncidentFeatureItems = v5;

  v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  cachedIncidentsPersonalizedItems = self->_cachedIncidentsPersonalizedItems;
  self->_cachedIncidentsPersonalizedItems = v7;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        -[TrafficIncidentsSourceManager _addReport:](self, "_addReport:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v13), (void)v16);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v11);
  }

  v14 = [(TrafficIncidentsSourceManager *)self observers];
  [v14 incidentsSourceManagerDidUpdate];

  v15 = sub_100109DA8();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "TrafficIncidentsSourceManager did update with reports %@", buf, 0xCu);
  }
}

- (TrafficIncidentsSourceManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)TrafficIncidentsSourceManager;
  v2 = [(TrafficIncidentsSourceManager *)&v16 init];
  if (v2)
  {
    v3 = +[TrafficIncidentsStorageManager sharedInstance];
    [v3 addObserver:v2];

    id v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    cachedIncidentsPersonalizedItems = v2->_cachedIncidentsPersonalizedItems;
    v2->_cachedIncidentsPersonalizedItems = v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("TrafficIncidentsSourceManager.cachedIncidentsPersonalizedItemsLock", v6);
    cachedIncidentsPersonalizedItemsLockQueue = v2->_cachedIncidentsPersonalizedItemsLockQueue;
    v2->_cachedIncidentsPersonalizedItemsLockQueue = (OS_dispatch_queue *)v7;

    id v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    cachedVKTrafficIncidentFeatureItems = v2->_cachedVKTrafficIncidentFeatureItems;
    v2->_cachedVKTrafficIncidentFeatureItems = v9;

    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("TrafficIncidentsSourceManager.cachedVKTrafficIncidentFeatureItemsLock", v11);
    cachedVKTrafficIncidentFeatureItemsLockQueue = v2->_cachedVKTrafficIncidentFeatureItemsLockQueue;
    v2->_cachedVKTrafficIncidentFeatureItemsLockQueue = (OS_dispatch_queue *)v12;

    [(TrafficIncidentsSourceManager *)v2 _refreshDataSource];
    v14 = v2;
  }

  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(TrafficIncidentsSourceManager *)self observers];
  [v5 registerObserver:v4];
}

- (id)observers
{
  observers = self->_observers;
  if (!observers)
  {
    id v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___TrafficIncidentsSourceManagerObserver queue:&_dispatch_main_q];
    id v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

+ (id)sharedInstance
{
  if (qword_10160FB40 != -1) {
    dispatch_once(&qword_10160FB40, &stru_1012FA040);
  }
  v2 = (void *)qword_10160FB38;

  return v2;
}

- (id)cachedIncidentsPersonalizedItems
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100104024;
  id v10 = sub_100104890;
  id v11 = 0;
  cachedIncidentsPersonalizedItemsLockQueue = self->_cachedIncidentsPersonalizedItemsLockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002592C;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cachedIncidentsPersonalizedItemsLockQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)cachedVKTrafficIncidentFeatureItemsForSelectedRoute:(id)a3
{
  id v5 = a3;
  v25 = v5;
  if (v5)
  {
    uint64_t v6 = (GEOComposedRoute *)v5;
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = sub_100104024;
    v37 = sub_100104890;
    id v38 = 0;
    cachedVKTrafficIncidentFeatureItemsLockQueue = self->_cachedVKTrafficIncidentFeatureItemsLockQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1008277AC;
    block[3] = &unk_1012E73F0;
    block[4] = self;
    block[5] = &v33;
    dispatch_sync(cachedVKTrafficIncidentFeatureItemsLockQueue, block);
    if (self->_selectedRoute == v6 && [(id)v34[5] count])
    {
      id v23 = (id)v34[5];
    }
    else
    {
      objc_storeStrong((id *)&self->_selectedRoute, a3);
      uint64_t v8 = +[TrafficIncidentsStorageManager sharedInstance];
      id v9 = [v8 visibleReports];
      id v10 = [v9 copy];

      id v11 = objc_alloc_init((Class)NSMutableArray);
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v28 objects:v39 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v29;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(v12);
            }
            objc_super v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            long long v17 = +[TrafficIncidentLayoutManager sharedInstance];
            unsigned __int8 v18 = [v17 isIncidentTypeDisplayedOnMap:[v16 incidentType]];

            if (v18)
            {
              long long v19 = [(TrafficIncidentsSourceManager *)self _VKTrafficIncidentFeatureForIncidentReport:v16];
              if (v19) {
                [v11 addObject:v19];
              }
            }
          }
          id v13 = [v12 countByEnumeratingWithState:&v28 objects:v39 count:16];
        }
        while (v13);
      }

      v20 = self->_cachedVKTrafficIncidentFeatureItemsLockQueue;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1008277F8;
      v26[3] = &unk_1012E5D58;
      v26[4] = self;
      id v21 = v11;
      id v27 = v21;
      dispatch_sync(v20, v26);
      v22 = v27;
      id v23 = v21;
    }
    _Block_object_dispose(&v33, 8);
  }
  else
  {
    id v23 = &__NSArray0__struct;
  }

  return v23;
}

- (void)_addVKTrafficIncidentFeatureItemToCache:(id)a3
{
  id v4 = [(TrafficIncidentsSourceManager *)self _VKTrafficIncidentFeatureForIncidentReport:a3];
  cachedVKTrafficIncidentFeatureItemsLockQueue = self->_cachedVKTrafficIncidentFeatureItemsLockQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1008278D8;
  v7[3] = &unk_1012E5D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(cachedVKTrafficIncidentFeatureItemsLockQueue, v7);
}

- (id)_VKTrafficIncidentFeatureForIncidentReport:(id)a3
{
  id v4 = a3;
  int64_t v5 = +[TrafficIncidentLayoutItem vkTrafficIncidentTypeForGEOType:](TrafficIncidentLayoutItem, "vkTrafficIncidentTypeForGEOType:", [v4 incidentType]);
  id v6 = [v4 mapItemLocation];
  dispatch_queue_t v7 = [v6 latLng];
  [v7 lat];
  double v9 = v8;
  id v10 = [v4 mapItemLocation];
  id v11 = [v10 latLng];
  [v11 lng];
  double v13 = v12;

  id v14 = objc_alloc((Class)VKUserReportedTrafficIncident);
  v15 = [v4 uniqueID];

  objc_super v16 = [v15 UUIDString];
  id v17 = [v14 initWithIncidentType:v5 uniqueIdentifier:v16 position:self->_selectedRoute onRoute:v9 incidentType:v13 position:1.79769313e308];

  return v17;
}

- (void)_addReport:(id)a3
{
  id v4 = a3;
  int64_t v5 = +[TrafficIncidentLayoutManager sharedInstance];
  unsigned int v6 = [v5 isIncidentTypeDisplayedOnMap:[v4 incidentType]];

  if (v6)
  {
    dispatch_queue_t v7 = [[TrafficIncidentPersonalizedItem alloc] initWithIncidentReport:v4];
    cachedIncidentsPersonalizedItemsLockQueue = self->_cachedIncidentsPersonalizedItemsLockQueue;
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    double v12 = sub_100827B14;
    double v13 = &unk_1012E5D58;
    id v14 = self;
    v15 = v7;
    double v9 = v7;
    dispatch_sync(cachedIncidentsPersonalizedItemsLockQueue, &v10);
    -[TrafficIncidentsSourceManager _addVKTrafficIncidentFeatureItemToCache:](self, "_addVKTrafficIncidentFeatureItemToCache:", v4, v10, v11, v12, v13, v14);
  }
}

- (void)incidentsStorageManagerDidAddReport:(id)a3
{
  id v4 = a3;
  [(TrafficIncidentsSourceManager *)self _addReport:v4];
  int64_t v5 = [(TrafficIncidentsSourceManager *)self observers];
  [v5 incidentsSourceManagerDidUpdate];

  unsigned int v6 = sub_100109DA8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "TrafficIncidentsSourceManager did update with report %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIncidentsPersonalizedItemsLockQueue, 0);
  objc_storeStrong((id *)&self->_cachedIncidentsPersonalizedItems, 0);
  objc_storeStrong((id *)&self->_cachedVKTrafficIncidentFeatureItemsLockQueue, 0);
  objc_storeStrong((id *)&self->_cachedVKTrafficIncidentFeatureItems, 0);
  objc_storeStrong((id *)&self->_selectedRoute, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end