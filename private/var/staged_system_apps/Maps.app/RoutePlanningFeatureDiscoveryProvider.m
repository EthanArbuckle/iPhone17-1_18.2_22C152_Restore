@interface RoutePlanningFeatureDiscoveryProvider
- (BOOL)_updateCurrentModelAndNotify:(BOOL)a3;
- (BOOL)updateWithTransportType:(int64_t)a3 routeCollection:(id)a4;
- (FeatureDiscoveryModel)suggestedModel;
- (RoutePlanningFeatureDiscoveryProvider)init;
- (TransitPayActionDelegate)transitPayActionDelegate;
- (id)_bestModelForCurrentState;
- (id)changeHandler;
- (void)markFeatureDiscoveryViewShown;
- (void)setChangeHandler:(id)a3;
- (void)setTransitPayActionDelegate:(id)a3;
- (void)source:(id)a3 didUpdateAvailability:(BOOL)a4;
@end

@implementation RoutePlanningFeatureDiscoveryProvider

- (RoutePlanningFeatureDiscoveryProvider)init
{
  v12.receiver = self;
  v12.super_class = (Class)RoutePlanningFeatureDiscoveryProvider;
  v2 = [(RoutePlanningFeatureDiscoveryProvider *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = [[TransitPayDiscoverySource alloc] initWithPriority:0 delegate:v2];
    v13[0] = v4;
    v5 = [[DTMFeatureDiscoverySource alloc] initWithPriority:3 delegate:v3];
    v13[1] = v5;
    v6 = [[LPRRoutingFeatureDiscoverySource alloc] initWithPriority:2 delegate:v3];
    v13[2] = v6;
    v7 = [[EnvironmentalFeatureDiscoverySource alloc] initWithPriority:4 delegate:v3];
    v13[3] = v7;
    v8 = +[NSArray arrayWithObjects:v13 count:4];

    uint64_t v9 = [v8 sortedArrayUsingComparator:&stru_101319328];
    sources = v3->_sources;
    v3->_sources = (NSArray *)v9;
  }
  return v3;
}

- (BOOL)updateWithTransportType:(int64_t)a3 routeCollection:(id)a4
{
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (self->_transportType == a3
    && ((routeCollection = self->_routeCollection,
         unint64_t v9 = (unint64_t)v7,
         id v10 = routeCollection,
         !(v9 | (unint64_t)v10))
     || (v11 = v10,
         unsigned int v12 = [(id)v9 isEqual:v10],
         v11,
         (id)v9,
         v12)))
  {
    os_unfair_lock_unlock(&self->_lock);
    BOOL v13 = 0;
  }
  else
  {
    uint64_t v14 = [v7 routes];
    uint64_t v15 = [(RouteCollection *)self->_routeCollection routes];
    if (v14 | v15) {
      unsigned int v16 = [(id)v14 isEqual:v15];
    }
    else {
      unsigned int v16 = 1;
    }

    v17 = sub_10000A540();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      unint64_t v18 = self->_transportType - 1;
      if (v18 > 4) {
        CFStringRef v19 = @"Undefined";
      }
      else {
        CFStringRef v19 = off_1013193C8[v18];
      }
      if ((unint64_t)(a3 - 1) > 4) {
        CFStringRef v20 = @"Undefined";
      }
      else {
        CFStringRef v20 = off_1013193C8[a3 - 1];
      }
      v21 = @"NO";
      *(_DWORD *)buf = 138413058;
      CFStringRef v37 = v19;
      __int16 v38 = 2112;
      if (v16) {
        v21 = @"YES";
      }
      CFStringRef v39 = v20;
      __int16 v40 = 2048;
      id v41 = v7;
      __int16 v42 = 2112;
      v43 = v21;
      v22 = v21;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Updating transport type from %@ to %@, route collection to %p (only route idx changed: %@)", buf, 0x2Au);
    }
    self->_transportType = a3;
    objc_storeStrong((id *)&self->_routeCollection, a4);
    id v23 = [(NSArray *)self->_sources copy];
    os_unfair_lock_unlock(&self->_lock);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v24 = v23;
    id v25 = [v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v32;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (!v16
            || objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "wantsAllRouteCollectionChanges", (void)v31))
          {
            [v29 setTransportType:a3 routeCollection:v7];
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v26);
    }

    BOOL v13 = [(RoutePlanningFeatureDiscoveryProvider *)self _updateCurrentModelAndNotify:0];
  }

  return v13;
}

- (BOOL)_updateCurrentModelAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(RoutePlanningFeatureDiscoveryProvider *)self _bestModelForCurrentState];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  suggestedModel = self->_suggestedModel;
  unint64_t v8 = v5;
  id v9 = suggestedModel;
  if (v8 | (unint64_t)v9
    && (id v10 = v9, v11 = [(id)v8 isEqual:v9],
                  v10,
                  (id)v8,
                  !v11))
  {
    BOOL v13 = sub_10000A540();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Suggestion did change to %@", buf, 0xCu);
    }

    objc_storeStrong((id *)&self->_suggestedModel, v5);
    uint64_t v14 = [(RoutePlanningFeatureDiscoveryProvider *)self changeHandler];
    os_unfair_lock_unlock(p_lock);
    if (v3 && v14)
    {
      uint64_t v15 = sub_10000A540();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Will notify suggestion did change", buf, 2u);
      }

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100B5B214;
      v17[3] = &unk_1012E5F78;
      id v19 = v14;
      id v18 = (id)v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v17);
    }
    BOOL v12 = 1;
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    BOOL v12 = 0;
  }

  return v12;
}

- (id)_bestModelForCurrentState
{
  v2 = sub_100099700(self->_sources, &stru_101319368);
  BOOL v3 = [v2 firstObject];

  return v3;
}

- (void)setTransitPayActionDelegate:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    BOOL v12 = sub_100021338();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      id v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/RoutePlanningFeatureDiscoveryProvider.m";
      __int16 v20 = 1024;
      int v21 = 119;
      __int16 v22 = 2082;
      id v23 = "-[RoutePlanningFeatureDiscoveryProvider setTransitPayActionDelegate:]";
      __int16 v24 = 2082;
      id v25 = "nil == transitPayActionDelegate";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Transit + Pay requires an action delegate", buf, 0x26u);
    }

    GEOFindOrCreateLog();
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      id v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/RoutePlanningFeatureDiscoveryProvider.m";
      __int16 v20 = 1024;
      int v21 = 119;
      __int16 v22 = 2082;
      id v23 = "-[RoutePlanningFeatureDiscoveryProvider setTransitPayActionDelegate:]";
      __int16 v24 = 2082;
      id v25 = "nil == transitPayActionDelegate";
      _os_log_impl((void *)&_mh_execute_header, &v6->super, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Transit + Pay requires an action delegate", buf, 0x26u);
    }
    goto LABEL_17;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitPayActionDelegate);

  if (!WeakRetained)
  {
    objc_storeWeak((id *)&self->_transitPayActionDelegate, v4);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_sources;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned int v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v11 setTransitPayActionDelegate:v4];
          }
        }
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
LABEL_17:
  }
}

- (void)markFeatureDiscoveryViewShown
{
}

- (void)source:(id)a3 didUpdateAvailability:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_10000A540();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    id v10 = @"NO";
    if (v4) {
      id v10 = @"YES";
    }
    unsigned int v11 = v10;
    int v12 = 138412546;
    long long v13 = v9;
    __int16 v14 = 2112;
    long long v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Availability of %@ changed to %@.", (uint8_t *)&v12, 0x16u);
  }
  [(RoutePlanningFeatureDiscoveryProvider *)self _updateCurrentModelAndNotify:1];
}

- (FeatureDiscoveryModel)suggestedModel
{
  return self->_suggestedModel;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
}

- (TransitPayActionDelegate)transitPayActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitPayActionDelegate);

  return (TransitPayActionDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transitPayActionDelegate);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_suggestedModel, 0);
  objc_storeStrong((id *)&self->_sources, 0);

  objc_storeStrong((id *)&self->_routeCollection, 0);
}

@end