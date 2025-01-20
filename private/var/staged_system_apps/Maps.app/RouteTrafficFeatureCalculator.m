@interface RouteTrafficFeatureCalculator
- (NSCache)cache;
- (NSCache)sharedFeatureCache;
- (NSMapTable)completionHandlers;
- (OS_dispatch_queue)synchronizationQueue;
- (RouteTrafficFeatureCalculator)init;
- (id)_cacheKeyForRoutes:(id)a3;
- (id)cachedSharedTrafficFeaturesForRoutes:(id)a3;
- (id)cachedTrafficFeaturesForRoute:(id)a3;
- (void)_calculateCameraFeaturesForRoute:(id)a3;
- (void)_startCalculationTaskForRoute:(id)a3 completion:(id)a4;
- (void)clearCachedSharedTrafficFeaturesForRoutes:(id)a3;
- (void)clearCachedTrafficFeaturesForRoute:(id)a3;
- (void)getSharedTrafficFeaturesForRoutes:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)getTrafficFeaturesForRoute:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)setCache:(id)a3;
- (void)setCompletionHandlers:(id)a3;
- (void)setSharedFeatureCache:(id)a3;
- (void)setSynchronizationQueue:(id)a3;
@end

@implementation RouteTrafficFeatureCalculator

- (RouteTrafficFeatureCalculator)init
{
  v16.receiver = self;
  v16.super_class = (Class)RouteTrafficFeatureCalculator;
  v2 = [(RouteTrafficFeatureCalculator *)&v16 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init((Class)NSCache);
    cache = v2->_cache;
    v2->_cache = v3;

    v5 = (NSCache *)objc_alloc_init((Class)NSCache);
    sharedFeatureCache = v2->_sharedFeatureCache;
    v2->_sharedFeatureCache = v5;

    uint64_t v7 = +[NSMapTable strongToStrongObjectsMapTable];
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = (NSMapTable *)v7;

    v9 = +[NSString stringWithFormat:@"com.apple.Maps.%@.synchronization.%p", objc_opt_class(), v2];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_UTILITY, 0);

    id v12 = v9;
    dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], v11);
    synchronizationQueue = v2->_synchronizationQueue;
    v2->_synchronizationQueue = (OS_dispatch_queue *)v13;
  }
  return v2;
}

- (id)cachedSharedTrafficFeaturesForRoutes:(id)a3
{
  v4 = [(RouteTrafficFeatureCalculator *)self _cacheKeyForRoutes:a3];
  v5 = [(RouteTrafficFeatureCalculator *)self sharedFeatureCache];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (NSCache)sharedFeatureCache
{
  return self->_sharedFeatureCache;
}

- (id)_cacheKeyForRoutes:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v3 count]];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) uniqueRouteID:v13];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = [v4 componentsJoinedByString:@","];

  return v11;
}

- (void)getSharedTrafficFeaturesForRoutes:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v27 = a4;
  id v26 = a5;
  group = dispatch_group_create();
  id v9 = objc_alloc_init((Class)NSMutableArray);
  v25 = [(RouteTrafficFeatureCalculator *)self _cacheKeyForRoutes:v8];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100AA6768;
  v43[3] = &unk_1012F0F88;
  id v24 = v9;
  id v44 = v24;
  v10 = objc_retainBlock(v43);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v40;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if (objc_msgSend(v16, "transportType", v24) != 1)
        {
          v17 = [(RouteTrafficFeatureCalculator *)self cachedTrafficFeaturesForRoute:v16];
          if (v17)
          {
            ((void (*)(void *, void *))v10[2])(v10, v17);
          }
          else
          {
            dispatch_group_enter(group);
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472;
            v36[2] = sub_100AA6874;
            v36[3] = &unk_101316480;
            v38 = v10;
            v37 = group;
            [(RouteTrafficFeatureCalculator *)self getTrafficFeaturesForRoute:v16 completionQueue:v27 completionHandler:v36];
          }
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v13);
  }

  v18 = [(RouteTrafficFeatureCalculator *)self synchronizationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063B9C;
  block[3] = &unk_1012EF358;
  id v30 = v24;
  v31 = self;
  id v32 = v25;
  id v33 = v27;
  id v34 = v11;
  id v35 = v26;
  id v19 = v11;
  id v20 = v26;
  id v21 = v27;
  id v22 = v25;
  id v23 = v24;
  dispatch_group_notify(group, v18, block);
}

- (OS_dispatch_queue)synchronizationQueue
{
  return self->_synchronizationQueue;
}

- (id)cachedTrafficFeaturesForRoute:(id)a3
{
  id v4 = a3;
  id v5 = [(RouteTrafficFeatureCalculator *)self cache];
  id v6 = [v4 uniqueRouteID];

  id v7 = [v5 objectForKey:v6];

  return v7;
}

- (void)clearCachedTrafficFeaturesForRoute:(id)a3
{
  id v4 = a3;
  id v5 = sub_100AA6378();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 uniqueRouteID];
    int v9 = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Clearing cached traffic features for route with ID: %@", (uint8_t *)&v9, 0xCu);
  }
  id v7 = [(RouteTrafficFeatureCalculator *)self cache];
  id v8 = [v4 uniqueRouteID];
  [v7 removeObjectForKey:v8];
}

- (void)clearCachedSharedTrafficFeaturesForRoutes:(id)a3
{
  id v4 = [(RouteTrafficFeatureCalculator *)self _cacheKeyForRoutes:a3];
  id v5 = sub_100AA6378();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Clearing cached shared traffic features for routes: %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(RouteTrafficFeatureCalculator *)self sharedFeatureCache];
  [v6 removeObjectForKey:v4];
}

- (void)getTrafficFeaturesForRoute:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  int v9 = a4;
  id v10 = a5;
  if ([v8 transportType] == 1
    || ([v8 uniqueRouteID], id v11 = objc_claimAutoreleasedReturnValue(), v11, !v11))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100AA662C;
    block[3] = &unk_1012E5F78;
    id v23 = v8;
    id v24 = v10;
    id v16 = v10;
    id v17 = v8;
    dispatch_async(v9, block);

    long long v15 = v24;
  }
  else
  {
    id v12 = [(RouteTrafficFeatureCalculator *)self synchronizationQueue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100AA6648;
    v18[3] = &unk_1012ED778;
    v18[4] = self;
    id v19 = v8;
    id v20 = v9;
    id v21 = v10;
    id v13 = v10;
    id v14 = v8;
    dispatch_async(v12, v18);

    long long v15 = v19;
  }
}

- (void)_startCalculationTaskForRoute:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RouteTrafficFeatureCalculator *)self synchronizationQueue];
  dispatch_assert_queue_V2(v8);

  int v9 = sub_100AA6378();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v6 uniqueRouteID];
    int v16 = 138412290;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Starting calculation for route with ID: %@", (uint8_t *)&v16, 0xCu);
  }
  id v11 = [(RouteTrafficFeatureCalculator *)self completionHandlers];
  id v12 = [v6 uniqueRouteID];
  id v13 = [v11 objectForKey:v12];

  if (v13)
  {
    [v13 addObject:v7];
  }
  else
  {
    id v13 = +[NSMutableArray arrayWithObject:v7];
    id v14 = [(RouteTrafficFeatureCalculator *)self completionHandlers];
    long long v15 = [v6 uniqueRouteID];
    [v14 setObject:v13 forKey:v15];

    [(RouteTrafficFeatureCalculator *)self _calculateCameraFeaturesForRoute:v6];
  }
}

- (void)_calculateCameraFeaturesForRoute:(id)a3
{
  id v4 = a3;
  v46 = self;
  id v5 = [(RouteTrafficFeatureCalculator *)self synchronizationQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc((Class)NSMutableArray);
  id v7 = [v4 enrouteNotices];
  id v8 = [v6 initWithCapacity:[v7 count]];

  int v9 = sub_100AA6378();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v4 uniqueRouteID];
    id v11 = [v4 enrouteNotices];
    id v12 = [v11 count];
    id v13 = [v4 enrouteNotices];
    *(_DWORD *)buf = 138412803;
    id v62 = v10;
    __int16 v63 = 2048;
    id v64 = v12;
    __int16 v65 = 2113;
    v66 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Route with ID: %@ has %lu enroute notices: %{private}@", buf, 0x20u);
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v56 = 0u;
  long long v55 = 0u;
  id v14 = [v4 enrouteNotices];
  id v15 = [v14 countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v56;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v56 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v55 + 1) + 8 * (void)v18);
        id v20 = [v19 trafficCamera];
        if (v20 || ([v19 trafficSignal], (id v20 = objc_claimAutoreleasedReturnValue()) != 0))
        {

LABEL_11:
          id v21 = +[VKTrafficFeature newTrafficFeatureForEnrouteNotice:v19 onRoute:v4];
          if (v21)
          {
            id v22 = v21;
            [v8 addObject:v21];
          }
          else
          {
            id v23 = sub_100AA6378();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              id v24 = [v19 identifier];
              *(_DWORD *)buf = 138412547;
              id v62 = v24;
              __int16 v63 = 2113;
              id v64 = v19;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Traffic feature for notice %@ (%{private}@) was nil; ignoring",
                buf,
                0x16u);
            }
            id v22 = 0;
          }
          goto LABEL_16;
        }
        v25 = [v19 routeAnnotation];

        if (v25) {
          goto LABEL_11;
        }
        id v22 = sub_100AA6378();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          id v26 = [v19 identifier];
          *(_DWORD *)buf = 138412290;
          id v62 = v26;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Enroute notice %@ has nil traffic camera, traffic signal and route annotation; ignoring",
            buf,
            0xCu);
        }
LABEL_16:

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v27 = [v14 countByEnumeratingWithState:&v55 objects:v60 count:16];
      id v16 = v27;
    }
    while (v27);
  }

  id v28 = [v8 copy];
  if ([v28 count])
  {
    v29 = [(RouteTrafficFeatureCalculator *)v46 cache];
    id v30 = [v4 uniqueRouteID];
    [v29 setObject:v28 forKey:v30];
  }
  v31 = sub_100AA6378();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    id v32 = [v28 count];
    id v33 = [v4 uniqueRouteID];
    *(_DWORD *)buf = 134218499;
    id v62 = v32;
    __int16 v63 = 2113;
    id v64 = v28;
    __int16 v65 = 2112;
    v66 = v33;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Finished calculation with %lu traffic features (%{private}@) for route with ID: %@", buf, 0x20u);
  }
  id v34 = [(RouteTrafficFeatureCalculator *)v46 completionHandlers];
  id v35 = v4;
  v36 = [v4 uniqueRouteID];
  v37 = [v34 objectForKey:v36];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v37;
  id v38 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v52;
    do
    {
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v52 != v40) {
          objc_enumerationMutation(obj);
        }
        long long v42 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v43 = [v42 completionQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100AA7058;
        block[3] = &unk_1012E66E0;
        void block[4] = v42;
        id v49 = v35;
        id v50 = v28;
        dispatch_async(v43, block);
      }
      id v39 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v39);
  }

  id v44 = [(RouteTrafficFeatureCalculator *)v46 completionHandlers];
  v45 = [v35 uniqueRouteID];
  [v44 removeObjectForKey:v45];
}

- (void)setSynchronizationQueue:(id)a3
{
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void)setSharedFeatureCache:(id)a3
{
}

- (NSMapTable)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_sharedFeatureCache, 0);
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
}

@end