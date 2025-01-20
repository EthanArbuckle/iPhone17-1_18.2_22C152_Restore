@interface EVRoutingFeatureDiscoverySource
- (BOOL)_shouldShowVehicleCombination:(id)a3;
- (BOOL)isAvailable;
- (BOOL)wantsAllRouteCollectionChanges;
- (EVRoutingFeatureDiscoverySource)initWithPriority:(int64_t)a3 delegate:(id)a4;
- (FeatureDiscoveryModel)model;
- (FeatureDiscoverySourceDelegate)delegate;
- (NSArray)unpairedVehicles;
- (int64_t)priority;
- (int64_t)transportType;
- (void)_didSelectModel;
- (void)_didViewModel;
- (void)_dismiss;
- (void)_loadUpairedVehicles;
- (void)_markCurrentVehicleCombinationAsViewed;
- (void)_reloadAvailability;
- (void)setAvailable:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setTransportType:(int64_t)a3;
- (void)setTransportType:(int64_t)a3 routeCollection:(id)a4;
- (void)setUnpairedVehicles:(id)a3;
- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4;
@end

@implementation EVRoutingFeatureDiscoverySource

- (void)_reloadAvailability
{
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004A268;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setAvailable:(BOOL)a3
{
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100011A30;
  v6[3] = &unk_1012E9838;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  v6[4] = self;
  dispatch_async(isolationQueue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_loadUpairedVehicles
{
  objc_initWeak(&location, self);
  v2 = +[VGVirtualGarageService sharedService];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100030608;
  v3[3] = &unk_1012E6E78;
  objc_copyWeak(&v4, &location);
  [v2 virtualGarageGetListOfUnpairedVehiclesWithReply:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)setUnpairedVehicles:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_unpairedVehicles;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_unpairedVehicles, a3);
      v9 = sub_1000519B4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = (id)v7;
        v11 = v10;
        if (v7)
        {
          if ([v10 count])
          {
            v12 = [v11 componentsJoinedByString:@", "];
            v13 = +[NSString stringWithFormat:@"<%p> [%@]", v11, v12];
          }
          else
          {
            v13 = +[NSString stringWithFormat:@"<%p> (empty)", v11];
          }
        }
        else
        {
          v13 = @"<nil>";
        }

        *(_DWORD *)buf = 138412290;
        v15 = v13;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "RoutePlanning did update unpaired vehicles: %@", buf, 0xCu);
      }
      [(EVRoutingFeatureDiscoverySource *)self _reloadAvailability];
    }
  }
}

- (EVRoutingFeatureDiscoverySource)initWithPriority:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)EVRoutingFeatureDiscoverySource;
  unint64_t v7 = [(EVRoutingFeatureDiscoverySource *)&v21 init];
  unsigned __int8 v8 = v7;
  if (v7)
  {
    v7->_priority = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    id v9 = +[NSString stringWithFormat:@"com.apple.maps.featurediscovery.evrouting.isolation.%p", v8];
    id v10 = (const char *)[v9 UTF8String];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    isolationQueue = v8->_isolationQueue;
    v8->_isolationQueue = (OS_dispatch_queue *)v12;

    id v14 = +[NSString stringWithFormat:@"com.apple.maps.featurediscovery.evrouting.callback.%p", v8];
    v15 = (const char *)[v14 UTF8String];
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
    callbackQueue = v8->_callbackQueue;
    v8->_callbackQueue = (OS_dispatch_queue *)v17;

    v19 = +[VGVirtualGarageService sharedService];
    [v19 registerObserver:v8];

    [(EVRoutingFeatureDiscoverySource *)v8 _loadUpairedVehicles];
  }

  return v8;
}

- (BOOL)isAvailable
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100D02558;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setTransportType:(int64_t)a3 routeCollection:(id)a4
{
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D0268C;
  block[3] = &unk_1012F0708;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  dispatch_async(isolationQueue, block);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (FeatureDiscoveryModel)model
{
  unsigned __int8 v3 = [(EVRoutingFeatureDiscoverySource *)self isAvailable];
  id v4 = sub_10000A540();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will suggest EV routing.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v33 = [FeatureDiscoveryModel alloc];
    uint64_t v6 = self->_unpairedVehicles;
    if ((id)[(NSArray *)v6 count] == (id)1)
    {
      unint64_t v7 = [(NSArray *)v6 firstObject];
      uint64_t v8 = [v7 pairedAppIdentifier];
      BOOL v9 = v8 != 0;
    }
    else
    {
      BOOL v9 = 0;
    }
    if ([(NSArray *)v6 count] < 2) {
      int v11 = 0;
    }
    else {
      int v11 = sub_100CDB9C4(v6);
    }
    if ((v9 | v11) == 1)
    {
      dispatch_queue_t v12 = [(NSArray *)v6 firstObject];
      v13 = [v12 pairedAppIdentifier];

      id v14 = +[UIScreen mainScreen];
      [v14 scale];
      uint64_t v15 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v13, 0);
    }
    else
    {
      uint64_t v15 = sub_100CDBC88();
    }

    uint64_t v16 = sub_100CDBB04(self->_unpairedVehicles);
    dispatch_queue_t v17 = +[NSBundle mainBundle];
    v32 = [v17 localizedStringForKey:@"Try EV subtitle [Subtitle, Route Planning, Feature Discovery, EV]", @"localized string not found", 0 value table];
    v18 = self->_unpairedVehicles;
    if ([(NSArray *)v18 count])
    {
      if ((id)[(NSArray *)v18 count] == (id)1 || sub_100CDB9C4(v18))
      {
        v19 = [(NSArray *)v18 firstObject];
        v20 = [v19 iapIdentifier];
        if (v20
          && ([v19 siriIntentsIdentifier],
              objc_super v21 = objc_claimAutoreleasedReturnValue(),
              v21,
              v20,
              !v21))
        {
          v29 = +[NSBundle mainBundle];
          v23 = [v29 localizedStringForKey:@"Try EV action button with single vehicle (CarPlay) [Action, Route Planning, Feature Discovery, EV]", @"localized string not found", 0 value table];

          v24 = [v19 manufacturer];
          v25 = v24;
          if (!v24)
          {
            v25 = [v19 displayName];
          }
        }
        else
        {
          v22 = +[NSBundle mainBundle];
          v23 = [v22 localizedStringForKey:@"Try EV action button with single vehicle (SiriIntents) [Action, Route Planning, Feature Discovery, EV]", @"localized string not found", 0 value table];

          v24 = [v19 manufacturer];
          v25 = v24;
          if (!v24)
          {
            v25 = [v19 displayName];
          }
        }
        v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v25);
        if (!v24)
        {

          v24 = 0;
        }
        v26 = (void *)v16;
      }
      else
      {
        v19 = +[NSBundle mainBundle];
        v28 = [v19 localizedStringForKey:@"Try EV action button with multiple vehicles [Action, Route Planning, Feature Discovery, EV]", @"localized string not found", 0 value table];
        v26 = (void *)v16;
      }
      v27 = (void *)v15;
    }
    else
    {
      v26 = (void *)v16;
      v27 = (void *)v15;
      v28 = 0;
    }

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100D02C6C;
    v38[3] = &unk_1012E6708;
    objc_copyWeak(&v39, buf);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100D02CAC;
    v36[3] = &unk_1012E6708;
    objc_copyWeak(&v37, buf);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100D02CEC;
    v34[3] = &unk_1012E6708;
    objc_copyWeak(&v35, buf);
    LOBYTE(v31) = 0;
    id v10 = [(FeatureDiscoveryModel *)v33 initWithImage:v27 title:v26 subtitle:v32 actionTitle:v28 actionHandler:v38 bodyTapHandler:0 displayedHandler:v36 dismissHandler:v34 disableAffordanceAfterAction:v31];
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);

    objc_destroyWeak(buf);
  }
  else
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will not suggest EV routing: it is not available.", (uint8_t *)buf, 2u);
    }

    id v10 = 0;
  }

  return v10;
}

- (BOOL)wantsAllRouteCollectionChanges
{
  return 0;
}

- (void)_dismiss
{
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100D02DDC;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_didViewModel
{
  unsigned __int8 v3 = +[MKMapService sharedService];
  [v3 captureUserAction:449 onTarget:8 eventValue:0];

  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100D02F40;
  v5[3] = &unk_1012E6708;
  objc_copyWeak(&v6, &location);
  dispatch_async(isolationQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_didSelectModel
{
  unsigned __int8 v3 = +[MKMapService sharedService];
  [v3 captureUserAction:451 onTarget:8 eventValue:0];

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100D03138;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldShowVehicleCombination:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = sub_100099700(v3, &stru_101321BD8);
    id v5 = [v4 sortedArrayUsingComparator:&stru_101321BF8];
    id v6 = [v5 componentsJoinedByString:@"_"];
  }
  else
  {
    id v6 = 0;
  }
  BOOL v7 = sub_100CDBC9C(v6);

  return v7;
}

- (void)_markCurrentVehicleCombinationAsViewed
{
  v2 = self->_unpairedVehicles;
  if ([(NSArray *)v2 count])
  {
    id v3 = sub_100099700(v2, &stru_101321BD8);
    id v4 = [v3 sortedArrayUsingComparator:&stru_101321BF8];
    id v5 = [v4 componentsJoinedByString:@"_"];
  }
  else
  {
    id v5 = 0;
  }

  sub_100CDBF90(v5);
}

- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D03430;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v10, &location);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v10);
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

- (NSArray)unpairedVehicles
{
  return self->_unpairedVehicles;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unpairedVehicles, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end