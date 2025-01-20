@interface OfflineMapsFeatureDiscoverySource
- (BOOL)active;
- (BOOL)hasInitialData;
- (BOOL)showFeature;
- (GEOObserverHashTable)observers;
- (OfflineMapsFeatureDiscoveryActionDelegate)actionDelegate;
- (OfflineMapsFeatureDiscoverySource)initWithInsights:(id)a3 locationUpdater:(id)a4 isActive:(BOOL)a5;
- (id)offlineMapsDiscoveryModel;
- (void)_notifyObservers;
- (void)_showTipFromModelData:(id)a3;
- (void)didUpdateLocation:(id)a3;
- (void)setActionDelegate:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setShowFeature:(BOOL)a3;
- (void)updateFeatureEligibility;
@end

@implementation OfflineMapsFeatureDiscoverySource

- (void)updateFeatureEligibility
{
  if (self->_active)
  {
    v4 = +[UIDevice currentDevice];
    if ([v4 userInterfaceIdiom])
    {
      v5 = +[UIDevice currentDevice];
      id v6 = [v5 userInterfaceIdiom];

      if (v6 != (id)1)
      {
        v7 = sub_1000493C0();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = objc_opt_class();
          id v9 = v8;
          v10 = NSStringFromSelector(a2);
          int v14 = 138412546;
          v15 = v8;
          __int16 v16 = 2112;
          v17 = v10;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ %@: Offline Maps tip is only supported on iPhone and iPad.", (uint8_t *)&v14, 0x16u);
        }
        goto LABEL_13;
      }
    }
    else
    {
    }
    if ([(MapsLocationUpdater *)self->_locationUpdater startLocationUpdatesForDelegate:self])return; {
    v7 = sub_1000493C0();
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      v11 = "Could not start location updater for Offline Tip.";
      v12 = v7;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    v7 = sub_1000493C0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      v11 = "The Offline Maps feature is NOT active. Is the feature flag on?";
      v12 = v7;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v14, 2u);
    }
  }
LABEL_13:
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___HomeDataProvidingObserver queue:0];
    id v6 = self->_observers;
    self->_observers = v5;

    objc_sync_exit(v4);
    observers = self->_observers;
  }

  return observers;
}

- (OfflineMapsFeatureDiscoverySource)initWithInsights:(id)a3 locationUpdater:(id)a4 isActive:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)OfflineMapsFeatureDiscoverySource;
  v11 = [(OfflineMapsFeatureDiscoverySource *)&v19 init];
  if (v11)
  {
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.Maps.Home.OfflineMapsTip", v12);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v11->_msgInsights, a3);
    model = v11->_model;
    v11->_model = 0;

    objc_storeStrong((id *)&v11->_locationUpdater, a4);
    __int16 v16 = [[OfflineMapsSuggestionsDataProvider alloc] initWithClientType:1 callbackQueue:v11->_queue];
    dataProvider = v11->_dataProvider;
    v11->_dataProvider = v16;

    v11->_active = a5;
    v11->_showFeature = 0;
  }

  return v11;
}

- (void)didUpdateLocation:(id)a3
{
  id v4 = a3;
  v5 = sub_1000493C0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 latLng];
    [v6 lat];
    uint64_t v8 = v7;
    id v9 = [v4 latLng];
    [v9 lng];
    *(_DWORD *)buf = 134283777;
    uint64_t v16 = v8;
    __int16 v17 = 2049;
    uint64_t v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Offline Maps Tip - Received Location Update at %{private}f, %{private}f", buf, 0x16u);
  }
  [(MapsLocationUpdater *)self->_locationUpdater stopLocationUpdates];
  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100017FCC;
  v12[3] = &unk_1012E6690;
  objc_copyWeak(&v14, (id *)buf);
  id v13 = v4;
  id v11 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)setActionDelegate:(id)a3
{
}

- (id)offlineMapsDiscoveryModel
{
  return self->_model;
}

- (void)_notifyObservers
{
  if (self->_active) {
    [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
  }
}

- (void)_showTipFromModelData:(id)a3
{
  id v4 = a3;
  objc_initWeak(location, self);
  id v14 = [FeatureDiscoveryModel alloc];
  v5 = [v4 tipImage];
  id v6 = [v4 tipTitle];
  uint64_t v7 = [v4 tipSubtitle];
  uint64_t v8 = [v4 tipActionTitle];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1005D8340;
  v23[3] = &unk_1012E9340;
  objc_copyWeak(&v25, location);
  v23[4] = self;
  id v9 = v4;
  id v24 = v9;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1005D84F4;
  v20[3] = &unk_1012E6690;
  objc_copyWeak(&v22, location);
  id v21 = v9;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1005D8624;
  v17[3] = &unk_1012E7ED0;
  id v10 = v21;
  id v18 = v10;
  objc_copyWeak(&v19, location);
  LOBYTE(v13) = 1;
  id v11 = [(FeatureDiscoveryModel *)v14 initWithImage:v5 title:v6 subtitle:v7 actionTitle:v8 actionHandler:v23 bodyTapHandler:0 displayedHandler:v20 dismissHandler:v17 disableAffordanceAfterAction:v13];
  model = self->_model;
  self->_model = v11;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005D872C;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v16, location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v25);
  objc_destroyWeak(location);
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)hasInitialData
{
  return self->hasInitialData;
}

- (BOOL)showFeature
{
  return self->_showFeature;
}

- (void)setShowFeature:(BOOL)a3
{
  self->_showFeature = a3;
}

- (OfflineMapsFeatureDiscoveryActionDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (OfflineMapsFeatureDiscoveryActionDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_locationUpdater, 0);

  objc_storeStrong((id *)&self->_msgInsights, 0);
}

@end