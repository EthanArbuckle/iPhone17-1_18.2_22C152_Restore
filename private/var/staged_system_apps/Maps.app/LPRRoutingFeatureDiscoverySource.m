@interface LPRRoutingFeatureDiscoverySource
- (BOOL)isAvailable;
- (BOOL)wantsAllRouteCollectionChanges;
- (FeatureDiscoveryModel)model;
- (FeatureDiscoverySourceDelegate)delegate;
- (LPRRoutingFeatureDiscoverySource)initWithPriority:(int64_t)a3 delegate:(id)a4;
- (VGVirtualGarage)virtualGarage;
- (int64_t)priority;
- (int64_t)transportType;
- (unint64_t)numberOfLPRLVehicles;
- (void)_didSelectModel;
- (void)_didViewModel;
- (void)_dismiss;
- (void)_reloadAvailability;
- (void)dealloc;
- (void)setAvailable:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setTransportType:(int64_t)a3;
- (void)setTransportType:(int64_t)a3 routeCollection:(id)a4;
- (void)setVirtualGarage:(id)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
- (void)virtualGarageDidUpdate:(id)a3;
@end

@implementation LPRRoutingFeatureDiscoverySource

- (LPRRoutingFeatureDiscoverySource)initWithPriority:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v28.receiver = self;
  v28.super_class = (Class)LPRRoutingFeatureDiscoverySource;
  v7 = [(LPRRoutingFeatureDiscoverySource *)&v28 init];
  v8 = v7;
  if (v7)
  {
    v7->_priority = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    id v9 = +[NSString stringWithFormat:@"com.apple.maps.featurediscovery.lprrouting.isolation.%p", v8];
    v10 = (const char *)[v9 UTF8String];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    isolationQueue = v8->_isolationQueue;
    v8->_isolationQueue = (OS_dispatch_queue *)v12;

    id v14 = +[NSString stringWithFormat:@"com.apple.maps.featurediscovery.lprrouting.callback.%p", v8];
    v15 = (const char *)[v14 UTF8String];
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
    callbackQueue = v8->_callbackQueue;
    v8->_callbackQueue = (OS_dispatch_queue *)v17;

    v19 = +[NSUserDefaults standardUserDefaults];
    v8->_unint64_t modelViewedTimes = (unint64_t)[v19 integerForKey:@"LPRRoutingFeatureDiscoverySourceViewedTimesKey"];

    unint64_t modelViewedTimes = v8->_modelViewedTimes;
    if (modelViewedTimes < GEOConfigGetUInteger())
    {
      objc_initWeak(&location, v8);
      v21 = +[VGVirtualGarageService sharedService];
      [v21 registerObserver:v8];

      v22 = +[VGVirtualGarageService sharedService];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1007E9F9C;
      v25[3] = &unk_1012E65A8;
      objc_copyWeak(&v26, &location);
      [v22 virtualGarageGetGarageWithReply:v25];

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    _GEOConfigAddDelegateListenerForKey();
    v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v8 selector:"_reloadAvailability" name:@"UsingOfflineMapsStateChangedNotification" object:0];
  }
  return v8;
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForAllKeys();
  v3.receiver = self;
  v3.super_class = (Class)LPRRoutingFeatureDiscoverySource;
  [(LPRRoutingFeatureDiscoverySource *)&v3 dealloc];
}

- (void)setTransportType:(int64_t)a3 routeCollection:(id)a4
{
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007EA1C8;
  block[3] = &unk_1012F0708;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  dispatch_async(isolationQueue, block);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (BOOL)isAvailable
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007EA2D8;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setAvailable:(BOOL)a3
{
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1007EA3A8;
  v6[3] = &unk_1012E9838;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  v6[4] = self;
  dispatch_async(isolationQueue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (FeatureDiscoveryModel)model
{
  unsigned __int8 v3 = [(LPRRoutingFeatureDiscoverySource *)self isAvailable];
  v4 = sub_10000A540();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Will suggest LPR routing.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v15 = [FeatureDiscoveryModel alloc];
    uint64_t v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"Try LPR title [Title, Route Planning, Feature Discovery, LPR]", @"localized string not found", 0 value table];
    BOOL v8 = +[NSBundle mainBundle];
    char v9 = [v8 localizedStringForKey:@"Try LPR subtitle [Subtitle, Route Planning, Feature Discovery, LPR]", @"localized string not found", 0 value table];
    v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:@"[LPR Onboarding] Add Plate" value:@"localized string not found" table:0];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1007EA8AC;
    v20[3] = &unk_1012E6708;
    objc_copyWeak(&v21, buf);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1007EA8EC;
    v18[3] = &unk_1012E6708;
    objc_copyWeak(&v19, buf);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1007EA92C;
    v16[3] = &unk_1012E6708;
    objc_copyWeak(&v17, buf);
    LOBYTE(v14) = 0;
    dispatch_queue_t v12 = [(FeatureDiscoveryModel *)v15 initWithImage:0 title:v7 subtitle:v9 actionTitle:v11 actionHandler:v20 bodyTapHandler:0 displayedHandler:v18 dismissHandler:v16 disableAffordanceAfterAction:v14];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);

    objc_destroyWeak(buf);
  }
  else
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Will not suggest LPR routing: it is not available.", (uint8_t *)buf, 2u);
    }

    dispatch_queue_t v12 = 0;
  }

  return v12;
}

- (BOOL)wantsAllRouteCollectionChanges
{
  return 0;
}

- (void)_dismiss
{
  +[GEOAPPortal captureUserAction:4 target:671 value:0];
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1007EAA34;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_didViewModel
{
  +[GEOAPPortal captureUserAction:2186 target:504 value:0];
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1007EAB88;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_didSelectModel
{
  +[GEOAPPortal captureUserAction:2115 target:504 value:0];

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1012F95D0);
}

- (unint64_t)numberOfLPRLVehicles
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(LPRRoutingFeatureDiscoverySource *)self virtualGarage];
  unsigned __int8 v3 = [v2 vehicles];

  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        char v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) licensePlate];

        if (v9) {
          ++v6;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)_reloadAvailability
{
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1007EAFC4;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == MapsFeaturesConfig_EnableAlberta
    && a3.var1 == (void *)*((void *)&MapsFeaturesConfig_EnableAlberta + 1))
  {
    [(LPRRoutingFeatureDiscoverySource *)self _reloadAvailability];
  }
}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007EB31C;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (FeatureDiscoverySourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FeatureDiscoverySourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (VGVirtualGarage)virtualGarage
{
  return self->_virtualGarage;
}

- (void)setVirtualGarage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualGarage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end