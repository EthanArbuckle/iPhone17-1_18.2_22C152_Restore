@interface MRDMediaServerAVRoutingDataSource
- (BOOL)currentRouteSupportsVolumeControl;
- (BOOL)resetPickedRouteForSource:(unsigned int)a3;
- (BOOL)resetPickedSystemRouteForSource:(unsigned int)a3;
- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4;
- (BOOL)setPickedSystemRoute:(id)a3 withPassword:(id)a4 forSource:(unsigned int)a5;
- (BOOL)unpickAirPlayRoutes;
- (MRDMediaServerAVRoutingDataSource)init;
- (id)_descriptionForDiscoveryMode:(unsigned int)a3;
- (id)_mediaServerController;
- (id)_oddsShimDataSource;
- (id)pickableRoutesForCategory:(id)a3;
- (id)pickableRoutesForCategory:(id)a3 source:(unsigned int)a4;
- (id)pickedRoute;
- (id)pickedRouteForCategory:(id)a3;
- (id)pickedRouteForCategory:(id)a3 source:(unsigned int)a4;
- (id)pickedRoutes;
- (id)pickedRoutesForCategory:(id)a3 source:(unsigned int)a4;
- (unsigned)externalScreenType;
- (void)_avSessionMediaServicesResetNotification:(id)a3;
- (void)_externalScreenDidChangeNotification:(id)a3;
- (void)_notifyDelegateRoutesDidChange;
- (void)_portStatusDidChangeNotification:(id)a3;
- (void)_registerAVSystemControllerNotifications;
- (void)_unregisterAVSystemControllerNotifications;
- (void)dealloc;
- (void)setDiscoveryMode:(unsigned int)a3;
- (void)userCancelledPickingRoute:(id)a3;
@end

@implementation MRDMediaServerAVRoutingDataSource

- (unsigned)externalScreenType
{
  v2 = [(MRDMediaServerAVRoutingDataSource *)self _mediaServerController];
  v3 = [v2 attributeForKey:AVSystemController_CurrentExternalScreenAttribute];

  id v4 = v3;
  if ([v4 isEqualToString:AVSystemController_ExternalScreenType_AirPlay])
  {
    unsigned int v5 = 1;
  }
  else if ([v4 isEqualToString:AVSystemController_ExternalScreenType_TVOut])
  {
    unsigned int v5 = 2;
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (id)_mediaServerController
{
  return +[AVSystemController sharedAVSystemController];
}

- (MRDMediaServerAVRoutingDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRDMediaServerAVRoutingDataSource;
  v2 = [(MRDAVRoutingDataSource *)&v6 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    id v4 = off_100476898();
    [v3 addObserver:v2 selector:"_avSessionMediaServicesResetNotification:" name:v4 object:0];

    [(MRDMediaServerAVRoutingDataSource *)v2 _registerAVSystemControllerNotifications];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MRDMediaServerAVRoutingDataSource;
  [(MRDMediaServerAVRoutingDataSource *)&v4 dealloc];
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v6.receiver = self;
  v6.super_class = (Class)MRDMediaServerAVRoutingDataSource;
  -[MRDAVRoutingDataSource setDiscoveryMode:](&v6, "setDiscoveryMode:");
  unsigned int v5 = [(MRDMediaServerAVRoutingDataSource *)self _oddsShimDataSource];
  [v5 setDiscoveryMode:v3];
}

- (BOOL)currentRouteSupportsVolumeControl
{
  v2 = [(MRDMediaServerAVRoutingDataSource *)self _mediaServerController];
  unsigned __int8 v3 = [v2 currentRouteHasVolumeControl];

  return v3;
}

- (id)pickedRoute
{
  v2 = [(MRDMediaServerAVRoutingDataSource *)self pickedRoutes];
  unsigned __int8 v3 = [v2 firstObject];

  return v3;
}

- (id)pickedRoutes
{
  return [(MRDMediaServerAVRoutingDataSource *)self pickedRoutesForCategory:@"MRDAVRoutingCategoryMedia" source:0];
}

- (id)pickedRouteForCategory:(id)a3
{
  return [(MRDMediaServerAVRoutingDataSource *)self pickedRouteForCategory:a3 source:0];
}

- (id)pickedRouteForCategory:(id)a3 source:(unsigned int)a4
{
  objc_super v4 = [(MRDMediaServerAVRoutingDataSource *)self pickedRoutesForCategory:a3 source:*(void *)&a4];
  unsigned int v5 = [v4 firstObject];

  return v5;
}

- (id)pickedRoutesForCategory:(id)a3 source:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = [(MRDMediaServerAVRoutingDataSource *)self pickableRoutesForCategory:v6 source:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v13 isPicked]) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)pickableRoutesForCategory:(id)a3
{
  return [(MRDMediaServerAVRoutingDataSource *)self pickableRoutesForCategory:a3 source:0];
}

- (id)pickableRoutesForCategory:(id)a3 source:(unsigned int)a4
{
  id v5 = a3;
  v22 = v5;
  if (v5)
  {
    id v6 = v5;
    if ([v5 isEqualToString:@"MRDAVRoutingCategoryMedia"])
    {
      id v7 = @"Audio/Video";
    }
    else if ([v6 isEqualToString:@"MRDAVRoutingCategorySystem"])
    {
      id v7 = @"Default";
    }
    else
    {
      id v7 = v6;
    }
    id v9 = [(MRDMediaServerAVRoutingDataSource *)self _mediaServerController];
    v8 = [v9 pickableRoutesForCategory:v7];
  }
  else
  {
    id v7 = [(MRDMediaServerAVRoutingDataSource *)self _mediaServerController];
    v8 = [(__CFString *)v7 attributeForKey:AVSystemController_PickableRoutesAttribute];
  }

  id v10 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v11 = sub_10016A460();
  v12 = [v11 uppercaseString];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v8;
  id v13 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v26;
    uint64_t v23 = kMRMediaRemoteRouteIsLocalDeviceRouteKey;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(id *)(*((void *)&v25 + 1) + 8 * i);
        long long v18 = [v17 valueForKeyPath:@"AirPlayPortExtendedInfo.deviceID"];
        if ([v18 isEqualToString:v12])
        {
          id v19 = [v17 mutableCopy];
          [v19 setObject:&__kCFBooleanTrue forKey:v23];

          id v17 = v19;
        }
        v20 = [[MRDMediaServerAVRoute alloc] initWithDictionary:v17];
        [v10 addObject:v20];
      }
      id v14 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  return v10;
}

- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4
{
  return [(MRDMediaServerAVRoutingDataSource *)self setPickedRoute:a3 withPassword:a4 forSource:0];
}

- (BOOL)setPickedSystemRoute:(id)a3 withPassword:(id)a4 forSource:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MRDMediaServerAVRoutingDataSource *)self _oddsShimDataSource];
  unsigned int v11 = [v10 setPickedSystemRoute:v8 withPassword:v9 forSource:v5];

  v12 = _MRLogForCategory();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      id v14 = [v8 name];
      int v17 = 138412546;
      long long v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = 0;
      uint64_t v15 = "Successfully picked route named %@. (error = %@)";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, 0x16u);
    }
  }
  else if (v13)
  {
    id v14 = [v8 name];
    int v17 = 138412546;
    long long v18 = v14;
    __int16 v19 = 2112;
    uint64_t v20 = 0;
    uint64_t v15 = "Failed to pick route named %@. (error = %@)";
    goto LABEL_6;
  }

  return v11;
}

- (BOOL)resetPickedRouteForSource:(unsigned int)a3
{
  [(MRDMediaServerAVRoutingDataSource *)self pickableRoutesForCategory:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    long long v16 = self;
    unsigned int v17 = a3;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        unsigned int v11 = objc_msgSend(v10, "type", v16);
        if ([v11 isEqualToString:@"AVAudioRoute_Speaker"])
        {

LABEL_13:
          unsigned __int8 v14 = [(MRDMediaServerAVRoutingDataSource *)v16 setPickedRoute:v10 withPassword:0 forSource:v17];
          goto LABEL_14;
        }
        v12 = [v10 type];
        unsigned int v13 = [v12 isEqualToString:@"AVAudioRoute_Headphone"];

        if (v13) {
          goto LABEL_13;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      unsigned __int8 v14 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
  }
LABEL_14:

  return v14;
}

- (BOOL)resetPickedSystemRouteForSource:(unsigned int)a3
{
  return [(MRDMediaServerAVRoutingDataSource *)self resetPickedRouteForSource:*(void *)&a3];
}

- (void)userCancelledPickingRoute:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(MRDMediaServerAVRoutingDataSource *)self _mediaServerController];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v6 dictionary];
    [v4 didCancelRoutePicking:v5];
  }
}

- (BOOL)unpickAirPlayRoutes
{
  unsigned __int8 v3 = [(MRDMediaServerAVRoutingDataSource *)self _mediaServerController];
  id v8 = 0;
  unsigned __int8 v4 = [v3 setAttribute:&__kCFBooleanTrue forKey:AVSystemController_RouteAwayFromAirPlayAttribute error:&v8];
  id v5 = v8;

  if (v4)
  {
    [(MRDMediaServerAVRoutingDataSource *)self _notifyDelegateRoutesDidChange];
  }
  else
  {
    id v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10032DF8C((uint64_t)v5, v6);
    }
  }
  return v4;
}

- (void)_externalScreenDidChangeNotification:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"MRDAVRoutingDataSourceExternalScreenDidChangeNotification" object:self];
}

- (void)_portStatusDidChangeNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:AVSystemController_RouteDescriptionKey_PortStatusChangeReason];
  int v6 = [v5 intValue];

  uint64_t v7 = 0;
  if (v6 <= 200469)
  {
    if (v6 <= 200400)
    {
      if (v6 == -71891)
      {
        uint64_t v7 = 4;
        goto LABEL_23;
      }
      if (!v6) {
        goto LABEL_23;
      }
      goto LABEL_20;
    }
    if (v6 != 200401)
    {
      if (v6 == 200453) {
        goto LABEL_16;
      }
      goto LABEL_20;
    }
LABEL_18:
    uint64_t v7 = 2;
    goto LABEL_23;
  }
  if (v6 > 1886609777)
  {
    if (v6 != 1886609778)
    {
      if (v6 != 1886610035)
      {
        if (v6 == 1886613355) {
          goto LABEL_23;
        }
        goto LABEL_20;
      }
LABEL_16:
      uint64_t v7 = 3;
      goto LABEL_23;
    }
LABEL_17:
    uint64_t v7 = 1;
    goto LABEL_23;
  }
  if (v6 == 200470) {
    goto LABEL_17;
  }
  if (v6 == 1886609766) {
    goto LABEL_18;
  }
LABEL_20:
  id v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)long long v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AirPlay Error: Unknown VADPortStatus: %d", buf, 8u);
  }

  uint64_t v7 = 5;
LABEL_23:
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v4 objectForKey:AVSystemController_RouteDescriptionKey_RouteName];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)long long v20 = v6;
    *(_WORD *)&v20[4] = 2112;
    *(void *)&v20[6] = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "VAD port status changed to %i for route %@", buf, 0x12u);
  }
  unsigned int v11 = _MRLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v4 objectForKey:AVSystemController_RouteDescriptionKey_RouteName];
    *(_DWORD *)buf = 134218242;
    *(void *)long long v20 = v7;
    *(_WORD *)&v20[8] = 2112;
    *(void *)&v20[10] = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MRMediaRemoteRouteStatus changed to %li for route %@", buf, 0x16u);
  }
  unsigned int v13 = [[MRDMediaServerAVRoute alloc] initWithDictionary:v4];
  unsigned __int8 v14 = +[NSNumber numberWithInt:v7, @"MRDAVRoutingDataSourceAVRouteUserInfoKey", @"MRDAVRoutingDataSourceRouteStatusUserInfoKey", v13];
  v18[1] = v14;
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:2];

  long long v16 = +[NSNotificationCenter defaultCenter];
  [v16 postNotificationName:@"MRDAVRoutingDataSourceRouteStatusDidChangeNotification" object:self userInfo:v15];
}

- (void)_avSessionMediaServicesResetNotification:(id)a3
{
  id v4 = _MRLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MediaServerAVRoutingDataSource] AVAudioSessionMediaServicesWereReset notification received -- re-registering notifications and resetting cache", v6, 2u);
  }

  [(MRDMediaServerAVRoutingDataSource *)self _unregisterAVSystemControllerNotifications];
  [(MRDMediaServerAVRoutingDataSource *)self _registerAVSystemControllerNotifications];
  [(MRDMediaServerAVRoutingDataSource *)self setDiscoveryMode:[(MRDAVRoutingDataSource *)self discoveryMode]];
  [(MRDMediaServerAVRoutingDataSource *)self _notifyDelegateRoutesDidChange];
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"MRDAVRoutingDataSourceExternalScreenDidChangeNotification" object:self];
}

- (void)_registerAVSystemControllerNotifications
{
  unsigned __int8 v3 = +[AVSystemController sharedAVSystemController];
  id v4 = off_100476898();
  uint64_t v15 = v4;
  id v5 = +[NSArray arrayWithObjects:&v15 count:1];
  [v3 setAttribute:v5 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

  if (AVSystemController_ExternalScreenDidChangeNotification)
  {
    uint64_t v14 = AVSystemController_ExternalScreenDidChangeNotification;
    int v6 = +[NSArray arrayWithObjects:&v14 count:1];
    [v3 setAttribute:v6 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    uint64_t v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"_externalScreenDidChangeNotification:" name:AVSystemController_ExternalScreenDidChangeNotification object:v3];
  }
  if (AVSystemController_PickableRoutesDidChangeNotification)
  {
    uint64_t v13 = AVSystemController_PickableRoutesDidChangeNotification;
    id v8 = +[NSArray arrayWithObjects:&v13 count:1];
    [v3 setAttribute:v8 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:self selector:"_pickableRoutesDidChangeNotification:" name:AVSystemController_PickableRoutesDidChangeNotification object:v3];
  }
  if (AVSystemController_PortStatusDidChangeNotification)
  {
    uint64_t v12 = AVSystemController_PortStatusDidChangeNotification;
    id v10 = +[NSArray arrayWithObjects:&v12 count:1];
    [v3 setAttribute:v10 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    unsigned int v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:self selector:"_portStatusDidChangeNotification:" name:AVSystemController_PortStatusDidChangeNotification object:v3];
  }
}

- (void)_unregisterAVSystemControllerNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:AVSystemController_ExternalScreenDidChangeNotification object:0];
  [v3 removeObserver:self name:AVSystemController_PickableRoutesDidChangeNotification object:0];
  [v3 removeObserver:self name:AVSystemController_PortStatusDidChangeNotification object:0];
}

- (id)_descriptionForDiscoveryMode:(unsigned int)a3
{
  id v3 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();

  return v3;
}

- (void)_notifyDelegateRoutesDidChange
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"MRDAVRoutingDataSourcePickableRoutesDidChangeNotification" object:self];
}

- (id)_oddsShimDataSource
{
  oddsShimDataSource = self->_oddsShimDataSource;
  if (!oddsShimDataSource)
  {
    id v4 = objc_alloc_init(MRDOutputDeviceRoutingDataSource);
    id v5 = self->_oddsShimDataSource;
    self->_oddsShimDataSource = v4;

    oddsShimDataSource = self->_oddsShimDataSource;
  }

  return oddsShimDataSource;
}

- (void).cxx_destruct
{
}

@end