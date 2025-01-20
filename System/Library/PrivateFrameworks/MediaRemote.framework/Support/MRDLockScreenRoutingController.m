@interface MRDLockScreenRoutingController
- (BOOL)hasTriggered;
- (BOOL)shouldRun;
- (HMHomeManager)homeManager;
- (MRAVEndpoint)ase;
- (MRDDisplayMonitor)displayMonitor;
- (MRDLockScreenRoutingController)init;
- (MRDLockScreenRoutingControllerDataSource)dataSource;
- (MRDLockScreenRoutingProvider)provider;
- (MRLockScreenUIControllable)uiController;
- (MRRateLimiter)debouncer;
- (NSSet)currentHomeUserIdentifiers;
- (OS_dispatch_queue)queue;
- (id)_createProvider;
- (id)_nowPlayingControllerConfigurationForUID:(id)a3 topologyIdentifier:(id)a4;
- (id)nearbyDevicesIdentifiers;
- (void)_externalDeviceHomeServerDidReceiveSystemEndpointUpdateRequestNotification:(id)a3;
- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3;
- (void)_handleLayoutDidChangeNotification:(id)a3;
- (void)_onQueue_immediatelyReevaluateRemoteControlState;
- (void)_onQueue_reevaluateRemoteControlState;
- (void)_updateRecommendedEndpointWithOutputDeviceUID:(id)a3 reason:(id)a4;
- (void)devicesUpdated;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)routeRecommendationDismissed;
- (void)setAse:(id)a3;
- (void)setCurrentHomeUserIdentifiers:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDebouncer:(id)a3;
- (void)setDisplayMonitor:(id)a3;
- (void)setHasTriggered:(BOOL)a3;
- (void)setHomeManager:(id)a3;
- (void)setProvider:(id)a3;
- (void)setQueue:(id)a3;
- (void)setShouldRun:(BOOL)a3;
- (void)setUiController:(id)a3;
- (void)startObservationIfNeeded;
@end

@implementation MRDLockScreenRoutingController

- (void)devicesUpdated
{
  v3 = [(MRDLockScreenRoutingController *)self queue];
  dispatch_assert_queue_V2(v3);

  [(MRDLockScreenRoutingController *)self _onQueue_reevaluateRemoteControlState];
}

- (void)_onQueue_reevaluateRemoteControlState
{
  id v2 = [(MRDLockScreenRoutingController *)self debouncer];
  [v2 update];
}

- (void)_onQueue_immediatelyReevaluateRemoteControlState
{
  v3 = [(MRDLockScreenRoutingController *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(MRDLockScreenRoutingController *)self nearbyDevicesIdentifiers];
  if ([(MRDLockScreenRoutingController *)self shouldRun]
    && ![(MRDLockScreenRoutingController *)self hasTriggered]
    && [v4 count])
  {
    v5 = +[MRUserSettings currentSettings];
    unsigned __int8 v6 = [v5 supportManyRecommendationsPlatters];

    if ((v6 & 1) != 0
      || ([(MRDLockScreenRoutingController *)self dataSource],
          v7 = objc_claimAutoreleasedReturnValue(),
          unsigned int v8 = [v7 lockScreenPlatterActive],
          v7,
          !v8))
    {
      v9 = dispatch_group_create();
      id v25 = objc_alloc_init((Class)NSMutableSet);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v22 = v4;
      id obj = v4;
      id v10 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v24 = *(void *)v38;
        do
        {
          v12 = 0;
          do
          {
            if (*(void *)v38 != v24) {
              objc_enumerationMutation(obj);
            }
            v13 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v12);
            dispatch_group_enter(v9);
            v14 = [v13 componentsSeparatedByString:@"|"];
            v15 = [v14 firstObject];
            v16 = [(MRDLockScreenRoutingController *)self _nowPlayingControllerConfigurationForUID:v15 topologyIdentifier:v13];
            id v17 = [objc_alloc((Class)MRNowPlayingController) initWithConfiguration:v16];
            v30[0] = _NSConcreteStackBlock;
            v30[1] = 3221225472;
            v30[2] = sub_10005B494;
            v30[3] = &unk_100417FC8;
            v31 = v9;
            id v32 = v14;
            v33 = v13;
            id v34 = v25;
            v35 = self;
            id v36 = v15;
            id v18 = v15;
            id v19 = v14;
            [v17 performRequestWithCompletion:v30];

            v12 = (char *)v12 + 1;
          }
          while (v11 != v12);
          id v11 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v11);
      }

      v20 = [(MRDLockScreenRoutingController *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005B768;
      block[3] = &unk_1004159B8;
      id v27 = obj;
      id v28 = v25;
      v29 = self;
      id v21 = v25;
      dispatch_group_notify(v9, v20, block);

      v4 = v22;
    }
    else
    {
      v9 = _MRLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[ProximityController] Maintaining proactive device because lock screen platter is active.", buf, 2u);
      }
    }
  }
}

- (id)nearbyDevicesIdentifiers
{
  v3 = [(MRDLockScreenRoutingController *)self provider];
  v4 = [v3 nearbyDeviceIdentifiers];

  v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[ProximityController] >>+ MRDLockScreenRoutingController.nearbyDevicesIdentifiers: %@", buf, 0xCu);
  }

  unsigned __int8 v6 = +[MRUserSettings currentSettings];
  unsigned int v7 = [v6 supportManyRecommendationsPlatters];

  if (v7)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10005AD48;
    v15[3] = &unk_100417F00;
    v16 = @"LOCAL";
    unsigned int v8 = objc_msgSend(v4, "msv_filter:", v15);
    v9 = [(MRDLockScreenRoutingController *)self ase];
    if ([v9 isLocalEndpoint])
    {
      id v10 = &__NSArray0__struct;
    }
    else
    {
      CFStringRef v17 = @"LOCAL";
      id v10 = +[NSArray arrayWithObjects:&v17 count:1];
    }

    v12 = [v10 arrayByAddingObjectsFromArray:v8];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10005AD6C;
    v14[3] = &unk_100417F00;
    v14[4] = self;
    objc_msgSend(v12, "msv_filter:", v14);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = v4;
  }

  return v11;
}

- (void)_handleLayoutDidChangeNotification:(id)a3
{
  v4 = [(MRDLockScreenRoutingController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D600;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (BOOL)shouldRun
{
  v3 = [(MRDLockScreenRoutingController *)self displayMonitor];
  if ([v3 lockScreenVisible])
  {
    v4 = [(MRDLockScreenRoutingController *)self displayMonitor];
    unsigned int v5 = [v4 controlCenterVisible] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (MRDDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MRDLockScreenRoutingProvider)provider
{
  return self->_provider;
}

- (MRDLockScreenRoutingController)init
{
  v21.receiver = self;
  v21.super_class = (Class)MRDLockScreenRoutingController;
  id v2 = [(MRDLockScreenRoutingController *)&v21 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MediaRemote.ProximityController", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[MRDDisplayMonitor sharedMonitor];
    displayMonitor = v2->_displayMonitor;
    v2->_displayMonitor = (MRDDisplayMonitor *)v6;

    unsigned int v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_handleLayoutDidChangeNotification:" name:@"MRDisplayMonitorLayoutDidChangeNotification" object:v2->_displayMonitor];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"_externalDeviceHomeServerDidReceiveSystemEndpointUpdateRequestNotification:" name:@"MRDExternalDeviceHomeServerDidReceiveSystemEndpointUpdateRequestNotification" object:0];

    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"_handleActiveSystemEndpointDidChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];

    uint64_t v11 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    ase = v2->_ase;
    v2->_ase = (MRAVEndpoint *)v11;

    id v13 = objc_alloc((Class)MRRateLimiter);
    v14 = [(MRDLockScreenRoutingController *)v2 queue];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10005ACBC;
    v19[3] = &unk_100415CC8;
    v15 = v2;
    v20 = v15;
    v16 = (MRRateLimiter *)[v13 initWithInterval:@"MRDLockScreenRoutingController" name:v14 queue:v19 block:1.0];
    debouncer = v15->_debouncer;
    v15->_debouncer = v16;

    [(MRDLockScreenRoutingController *)v15 startObservationIfNeeded];
  }
  return v2;
}

- (void)startObservationIfNeeded
{
  v3 = [(MRDLockScreenRoutingController *)self provider];

  if (!v3)
  {
    dispatch_queue_t v4 = [(MRDLockScreenRoutingController *)self _createProvider];
    [(MRDLockScreenRoutingController *)self setProvider:v4];
  }
  id v5 = [(MRDLockScreenRoutingController *)self provider];
  [v5 startObservationIfNeeded];
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  dispatch_queue_t v4 = [a3 homes];
  id v5 = objc_msgSend(v4, "msv_compactMap:", &stru_100417F40);
  uint64_t v6 = +[NSSet setWithArray:v5];

  id obj = self;
  objc_sync_enter(obj);
  currentHomeUserIdentifiers = obj->_currentHomeUserIdentifiers;
  obj->_currentHomeUserIdentifiers = (NSSet *)v6;

  objc_sync_exit(obj);
}

- (NSSet)currentHomeUserIdentifiers
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_homeManager)
  {
    v3 = +[NSDate date];
    dispatch_queue_t v4 = +[NSUUID UUID];
    id v5 = [v4 UUIDString];

    uint64_t v6 = (__CFString *)[objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"MRDLockScreenRoutingController.HMHomeManager", v5];
    unsigned int v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v29 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
    }

    unsigned int v8 = (HMHomeManager *)[objc_alloc((Class)HMHomeManager) initWithOptions:1];
    homeManager = v2->_homeManager;
    v2->_homeManager = v8;

    [(HMHomeManager *)v2->_homeManager setDelegate:v2];
    id v10 = _MRLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = +[NSDate date];
      [v11 timeIntervalSinceDate:v3];
      *(_DWORD *)buf = 138543874;
      CFStringRef v29 = @"MRDLockScreenRoutingController.HMHomeManager";
      __int16 v30 = 2114;
      v31 = v5;
      __int16 v32 = 2048;
      uint64_t v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
    }
  }
  currentHomeUserIdentifiers = v2->_currentHomeUserIdentifiers;
  if (!currentHomeUserIdentifiers)
  {
    v14 = +[NSDate date];
    v15 = +[NSUUID UUID];
    v16 = [v15 UUIDString];

    CFStringRef v17 = (__CFString *)[objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"MRDLockScreenRoutingController.HMHomeManager.currentHomeUserIdentifiers", v16];
    id v18 = _MRLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v29 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
    }

    id v19 = [(HMHomeManager *)v2->_homeManager homes];
    v20 = objc_msgSend(v19, "msv_compactMap:", &stru_100417F60);
    uint64_t v21 = +[NSSet setWithArray:v20];
    v22 = v2->_currentHomeUserIdentifiers;
    v2->_currentHomeUserIdentifiers = (NSSet *)v21;

    v23 = _MRLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = +[NSDate date];
      [v24 timeIntervalSinceDate:v14];
      *(_DWORD *)buf = 138543874;
      CFStringRef v29 = @"MRDLockScreenRoutingController.HMHomeManager.currentHomeUserIdentifiers";
      __int16 v30 = 2114;
      v31 = v16;
      __int16 v32 = 2048;
      uint64_t v33 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
    }
    currentHomeUserIdentifiers = v2->_currentHomeUserIdentifiers;
  }
  v26 = currentHomeUserIdentifiers;
  objc_sync_exit(v2);

  return v26;
}

- (id)_createProvider
{
  v3 = +[MRUserSettings currentSettings];
  unsigned int v4 = [v3 sourceRecommendationsPlattersFromIR];

  if (v4)
  {
    id v5 = +[MRDMediaRemoteServer server];
    uint64_t v6 = [v5 routingServer];
    unsigned int v7 = [v6 recommendationController];

    unsigned int v8 = [v7 recommender];
    if (v8)
    {
      v9 = [MRDIntelligentRoutingLockScreenRoutingProvider alloc];
      id v10 = [(MRDLockScreenRoutingController *)self queue];
      uint64_t v11 = [(MRDIntelligentRoutingLockScreenRoutingProvider *)v9 initWithDelegate:self queue:v10 routeRecommender:v8 routeRecommendationStore:v7];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v12 = [MRDProximityLockScreenRoutingProvider alloc];
    id v13 = [(MRDLockScreenRoutingController *)self queue];
    uint64_t v11 = [(MRDProximityLockScreenRoutingProvider *)v12 initWithDispatchQueue:v13];

    [(MRDIntelligentRoutingLockScreenRoutingProvider *)v11 setDelegate:self];
  }

  return v11;
}

- (void)_updateRecommendedEndpointWithOutputDeviceUID:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[ProximityController] Updating recommended endpoint to device %@ because %@", (uint8_t *)&v11, 0x16u);
  }

  [(MRDLockScreenRoutingController *)self setHasTriggered:1];
  id v9 = [objc_alloc((Class)MRUpdateActiveSystemEndpointRequest) initWithOutputDeviceUID:v6 type:2 reason:v7];
  id v10 = [(MRDLockScreenRoutingController *)self queue];
  [v9 perform:v10 completion:0];
}

- (id)_nowPlayingControllerConfigurationForUID:(id)a3 topologyIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)MRDestination) initWithOutputDeviceUID:v6];
  id v8 = [objc_alloc((Class)MRNowPlayingControllerConfiguration) initWithDestination:v7];
  [v8 setRequestPlaybackState:1];
  [v8 setRequestPlaybackQueue:0];
  [v8 setRequestClientProperties:0];
  [v8 setRequestSupportedCommands:0];
  [v8 setRequestLastPlayingDate:0];
  id v9 = +[NSString stringWithFormat:@"ProximityController(%@<%@>)", v6, v5];

  [v8 setLabel:v9];

  return v8;
}

- (void)_externalDeviceHomeServerDidReceiveSystemEndpointUpdateRequestNotification:(id)a3
{
  unsigned int v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:MRAVEndpointOutputDeviceUserInfoKey];

  id v6 = +[MRUserSettings currentSettings];
  unsigned int v7 = [v6 sourceRecommendationsPlattersFromIR];

  if (v7)
  {
    [(MRDLockScreenRoutingController *)self startObservationIfNeeded];
  }
  else
  {
    id v8 = [(MRDLockScreenRoutingController *)self queue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10005BB8C;
    v9[3] = &unk_1004158D8;
    v9[4] = self;
    id v10 = v5;
    dispatch_async(v8, v9);
  }
}

- (MRLockScreenUIControllable)uiController
{
  uiController = self->_uiController;
  if (!uiController)
  {
    unsigned int v4 = +[MRDUIControllerProvider lockScreenUIControllerWithDelegate:self];
    id v5 = self->_uiController;
    self->_uiController = v4;

    uiController = self->_uiController;
  }

  return uiController;
}

- (void)routeRecommendationDismissed
{
  id v2 = _MRLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[ProximityController] routeRecommendationDismissed", v3, 2u);
  }
}

- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3
{
  unsigned int v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:kMRMediaRemoteActiveEndpointTypeUserInfoKey];
  unsigned int v6 = [v5 intValue];

  if (!v6)
  {
    unsigned int v7 = +[MRUserSettings currentSettings];
    unsigned int v8 = [v7 sourceRecommendationsPlattersFromIR];

    if (v8) {
      [(MRDLockScreenRoutingController *)self startObservationIfNeeded];
    }
    id v9 = [(MRDLockScreenRoutingController *)self queue];
    MRAVEndpointResolveActiveSystemEndpointWithType();
  }
}

- (MRDLockScreenRoutingControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (MRDLockScreenRoutingControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void)setProvider:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (BOOL)hasTriggered
{
  return self->_hasTriggered;
}

- (void)setHasTriggered:(BOOL)a3
{
  self->_hasTriggered = a3;
}

- (void)setShouldRun:(BOOL)a3
{
  self->_shouldRun = a3;
}

- (void)setDisplayMonitor:(id)a3
{
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (void)setCurrentHomeUserIdentifiers:(id)a3
{
}

- (MRRateLimiter)debouncer
{
  return self->_debouncer;
}

- (void)setDebouncer:(id)a3
{
}

- (void)setUiController:(id)a3
{
}

- (MRAVEndpoint)ase
{
  return self->_ase;
}

- (void)setAse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ase, 0);
  objc_storeStrong((id *)&self->_uiController, 0);
  objc_storeStrong((id *)&self->_debouncer, 0);
  objc_storeStrong((id *)&self->_currentHomeUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_provider, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end