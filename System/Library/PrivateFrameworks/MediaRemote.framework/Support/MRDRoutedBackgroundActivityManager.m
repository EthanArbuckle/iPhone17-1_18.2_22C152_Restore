@interface MRDRoutedBackgroundActivityManager
- (BOOL)isPresentingBackgroundActivity;
- (MPMediaControls)mediaControls;
- (MRAVEndpoint)activeSystemEndpoint;
- (MRDMediaActivityManager)mediaActivityManager;
- (MRDMediaAppInFocusMonitor)focusMonitor;
- (MRDRoutedBackgroundActivityManager)init;
- (MRNowPlayingController)nowPlayingController;
- (MRRouteRepresentable)optimisticRoute;
- (NSArray)optimisticDevices;
- (NSMutableDictionary)backgroundActivityControllers;
- (OS_dispatch_queue)queue;
- (id)controllerForType:(unint64_t)a3;
- (id)makeControllerWithIdentifier:(id)a3;
- (uint64_t)supportsCustomSystemAperturePill;
- (unint64_t)activeBackgroundActivityType;
- (unint64_t)pillTypeWithEndpoint:(id)a3;
- (unsigned)playbackState;
- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3;
- (void)_handleLayoutDidChangeNotification:(id)a3;
- (void)_handleOutputDevicesDidChangeNotification:(id)a3;
- (void)_presentRoutePickerWithConfiguration:(id)a3;
- (void)_reevaluatePillsIfDisplayMonitorAndFocusMonitorAreInSyncWithReason:(id)a3;
- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5;
- (void)dealloc;
- (void)dismissPillWithReason:(id)a3;
- (void)dismissSystemAperturePillWithReason:(id)a3;
- (void)mediaApplicationsInFocus:(id)a3;
- (void)openRoutePicker;
- (void)presentAudioBluePill:(id)a3 remoteControl:(BOOL)a4 reason:(id)a5;
- (void)presentBluePillWithPlainType:(unint64_t)a3 pulseType:(unint64_t)a4 route:(id)a5 remoteControl:(BOOL)a6 reason:(id)a7;
- (void)presentSystemApertureBluePill:(id)a3 remoteControl:(BOOL)a4 reason:(id)a5;
- (void)presentVideoBluePill:(id)a3 remoteControl:(BOOL)a4 reason:(id)a5;
- (void)reevaluatePillsWithReason:(id)a3;
- (void)setActiveSystemEndpoint:(id)a3;
- (void)setBackgroundActivityControllers:(id)a3;
- (void)setFocusMonitor:(id)a3;
- (void)setMediaActivityManager:(id)a3;
- (void)setMediaControls:(id)a3;
- (void)setNowPlayingController:(id)a3;
- (void)setOptimisticDevices:(id)a3;
- (void)setOptimisticRoute:(id)a3;
- (void)setPlaybackState:(unsigned int)a3;
- (void)setQueue:(id)a3;
- (void)updateActiveBackgroundActivityWithType:(unint64_t)a3 reason:(id)a4;
@end

@implementation MRDRoutedBackgroundActivityManager

- (void)dismissPillWithReason:(id)a3
{
  id v4 = a3;
  if ([(MRDRoutedBackgroundActivityManager *)self supportsCustomSystemAperturePill])
  {
    [(MRDRoutedBackgroundActivityManager *)self dismissSystemAperturePillWithReason:v4];
  }
  else if ([(MRDRoutedBackgroundActivityManager *)self isPresentingBackgroundActivity])
  {
    v5 = _MRLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDRRC].RBAM Asked to dismissPill because %@", (uint8_t *)&v6, 0xCu);
    }

    [(MRDRoutedBackgroundActivityManager *)self updateActiveBackgroundActivityWithType:0 reason:v4];
  }
}

- (void)dismissSystemAperturePillWithReason:(id)a3
{
  id v4 = a3;
  v5 = [(MRDRoutedBackgroundActivityManager *)self mediaActivityManager];
  unsigned int v6 = [v5 isPresentingConnectedPill];

  if (v6)
  {
    id v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[MRDRRC].RBAM Asked to dismissPill because %@", (uint8_t *)&v9, 0xCu);
    }

    v8 = [(MRDRoutedBackgroundActivityManager *)self mediaActivityManager];
    [v8 dismissConnectedBanner];
  }
}

- (void)reevaluatePillsWithReason:(id)a3
{
  id v15 = a3;
  id v4 = [(MRDRoutedBackgroundActivityManager *)self mediaActivityManager];
  if (([v4 isPresentingBanner] & 1) == 0)
  {

LABEL_5:
    unsigned int v6 = [(MRDRoutedBackgroundActivityManager *)self activeSystemEndpoint];
    unint64_t v7 = [(MRDRoutedBackgroundActivityManager *)self pillTypeWithEndpoint:v6];

    if (v7)
    {
      if (v7 != 2)
      {
        if (v7 != 1) {
          goto LABEL_15;
        }
        v8 = [(MRDRoutedBackgroundActivityManager *)self activeSystemEndpoint];
        uint64_t v9 = [v8 isLocalEndpoint] ^ 1;
        id v10 = self;
        v11 = 0;
LABEL_11:
        [(MRDRoutedBackgroundActivityManager *)v10 presentAudioBluePill:v11 remoteControl:v9 reason:v15];
LABEL_14:

        goto LABEL_15;
      }
      v8 = [(MRDRoutedBackgroundActivityManager *)self activeSystemEndpoint];
      uint64_t v9 = [v8 isLocalEndpoint] ^ 1;
      id v10 = self;
      v11 = 0;
    }
    else
    {
      v12 = [(MRDRoutedBackgroundActivityManager *)self optimisticRoute];

      if (!v12)
      {
        [(MRDRoutedBackgroundActivityManager *)self dismissPillWithReason:v15];
        goto LABEL_15;
      }
      v13 = [(MRDRoutedBackgroundActivityManager *)self optimisticDevices];
      unsigned int v14 = objc_msgSend(v13, "mr_containsVideoOutputDevice");

      v8 = [(MRDRoutedBackgroundActivityManager *)self optimisticRoute];
      id v10 = self;
      v11 = v8;
      uint64_t v9 = 0;
      if (!v14) {
        goto LABEL_11;
      }
    }
    [(MRDRoutedBackgroundActivityManager *)v10 presentVideoBluePill:v11 remoteControl:v9 reason:v15];
    goto LABEL_14;
  }
  v5 = [(MRDRoutedBackgroundActivityManager *)self optimisticRoute];

  if (v5) {
    goto LABEL_5;
  }
LABEL_15:
}

- (unint64_t)pillTypeWithEndpoint:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    unsigned __int8 v6 = [v4 isLocalEndpoint];
    unint64_t v7 = [v5 resolvedOutputDevices];
    if ([v5 isLocalEndpoint])
    {
      v8 = objc_msgSend(v7, "msv_firstWhere:", &stru_1004174E8);
      BOOL v9 = v8 != 0;
    }
    else
    {
      BOOL v9 = 0;
    }
    v11 = +[MRDDisplayMonitor sharedMonitor];
    unsigned __int8 v12 = [v11 routePickerVisible];

    v13 = [(MRDRoutedBackgroundActivityManager *)self focusMonitor];
    unsigned int v14 = [v13 mediaBundlesInFocus];

    id v15 = objc_msgSend(v14, "msv_firstWhere:", &stru_100417528);

    if ([v14 count]) {
      BOOL v16 = v9;
    }
    else {
      BOOL v16 = 0;
    }
    if (v12) {
      char v17 = 0;
    }
    else {
      char v17 = (v15 != 0) & ~v6 | v16;
    }
    v18 = [v5 outputDevices];
    unsigned int v19 = objc_msgSend(v18, "mr_containsVideoOutputDevice");

    uint64_t v20 = 1;
    if (v19) {
      uint64_t v20 = 2;
    }
    if (v17) {
      unint64_t v10 = v20;
    }
    else {
      unint64_t v10 = 0;
    }
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (void)_reevaluatePillsIfDisplayMonitorAndFocusMonitorAreInSyncWithReason:(id)a3
{
  id v11 = a3;
  id v4 = +[MRDDisplayMonitor sharedMonitor];
  id v5 = [v4 presentedBundleIdentifiers];
  unsigned __int8 v6 = [(MRDRoutedBackgroundActivityManager *)self focusMonitor];
  id v7 = [v6 bundlesInFocus];
  if (v5 == v7)
  {

    goto LABEL_5;
  }
  v8 = v7;
  unsigned __int8 v9 = [v5 isEqual:v7];

  unint64_t v10 = v11;
  if (v9)
  {
LABEL_5:
    [(MRDRoutedBackgroundActivityManager *)self reevaluatePillsWithReason:v11];
    unint64_t v10 = v11;
  }
}

- (MRDMediaAppInFocusMonitor)focusMonitor
{
  return self->_focusMonitor;
}

- (uint64_t)supportsCustomSystemAperturePill
{
  if (qword_10047E508 != -1) {
    dispatch_once(&qword_10047E508, &stru_10041FB00);
  }
  return byte_10047E510;
}

- (MRRouteRepresentable)optimisticRoute
{
  return self->_optimisticRoute;
}

- (void)mediaApplicationsInFocus:(id)a3
{
}

- (MRDMediaActivityManager)mediaActivityManager
{
  return +[MRDMediaActivityManager manager];
}

- (MRAVEndpoint)activeSystemEndpoint
{
  return self->_activeSystemEndpoint;
}

- (void)_handleLayoutDidChangeNotification:(id)a3
{
}

- (MRDRoutedBackgroundActivityManager)init
{
  v22.receiver = self;
  v22.super_class = (Class)MRDRoutedBackgroundActivityManager;
  v2 = [(MRDRoutedBackgroundActivityManager *)&v22 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mediaremote.MRDRoutedBackgroundActivityManager", v3);
    [(MRDRoutedBackgroundActivityManager *)v2 setQueue:v4];

    uint64_t v5 = +[MRNowPlayingController userSelectedEndpointController];
    nowPlayingController = v2->_nowPlayingController;
    v2->_nowPlayingController = (MRNowPlayingController *)v5;

    [(MRNowPlayingController *)v2->_nowPlayingController setDelegate:v2];
    [(MRNowPlayingController *)v2->_nowPlayingController beginLoadingUpdates];
    uint64_t v7 = +[NSMutableDictionary dictionary];
    backgroundActivityControllers = v2->_backgroundActivityControllers;
    v2->_backgroundActivityControllers = (NSMutableDictionary *)v7;

    unsigned __int8 v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"_handleActiveSystemEndpointDidChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];

    unint64_t v10 = +[NSNotificationCenter defaultCenter];
    uint64_t v11 = MRAVEndpointDidAddOutputDeviceNotification;
    unsigned __int8 v12 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    [v10 addObserver:v2 selector:"_handleOutputDevicesDidChangeNotification:" name:v11 object:v12];

    v13 = +[NSNotificationCenter defaultCenter];
    uint64_t v14 = MRAVEndpointDidChangeOutputDeviceNotification;
    id v15 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    [v13 addObserver:v2 selector:"_handleOutputDevicesDidChangeNotification:" name:v14 object:v15];

    BOOL v16 = +[NSNotificationCenter defaultCenter];
    uint64_t v17 = MRAVEndpointDidRemoveOutputDeviceNotification;
    v18 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    [v16 addObserver:v2 selector:"_handleOutputDevicesDidChangeNotification:" name:v17 object:v18];

    unsigned int v19 = +[NSNotificationCenter defaultCenter];
    uint64_t v20 = +[MRDDisplayMonitor sharedMonitor];
    [v19 addObserver:v2 selector:"_handleLayoutDidChangeNotification:" name:@"MRDisplayMonitorLayoutDidChangeNotification" object:v20];
  }
  return v2;
}

- (void)dealloc
{
  [(MRNowPlayingController *)self->_nowPlayingController endLoadingUpdates];
  v3.receiver = self;
  v3.super_class = (Class)MRDRoutedBackgroundActivityManager;
  [(MRDRoutedBackgroundActivityManager *)&v3 dealloc];
}

- (id)makeControllerWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MRDBackgroundActivityController controllerForBackgroundActivityIdentifier:v4];
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000445D0;
  v7[3] = &unk_1004171D0;
  objc_copyWeak(&v8, &location);
  [v5 handleUserInteractionsWithBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (id)controllerForType:(unint64_t)a3
{
  if (a3)
  {
    id v4 = self;
    objc_sync_enter(v4);
    uint64_t v5 = [(MRDRoutedBackgroundActivityManager *)v4 backgroundActivityControllers];
    unsigned __int8 v6 = +[NSNumber numberWithUnsignedInteger:a3];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];

    if (!v7)
    {
      id v8 = sub_1000441C4(a3);
      uint64_t v7 = [(MRDRoutedBackgroundActivityManager *)v4 makeControllerWithIdentifier:v8];

      unsigned __int8 v9 = [(MRDRoutedBackgroundActivityManager *)v4 backgroundActivityControllers];
      unint64_t v10 = +[NSNumber numberWithUnsignedInteger:a3];
      [v9 setObject:v7 forKeyedSubscript:v10];
    }
    objc_sync_exit(v4);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)presentSystemApertureBluePill:(id)a3 remoteControl:(BOOL)a4 reason:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = _MRLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[MRDRRC].RBAM Asked to presentApertureBluePill because %@", buf, 0xCu);
  }

  uint64_t v11 = [(MRDRoutedBackgroundActivityManager *)self mediaActivityManager];
  [v11 dismissConnectedBanner];

  if (v8)
  {
    id v12 = v8;
    v13 = 0;
  }
  else
  {
    v13 = [(MRDRoutedBackgroundActivityManager *)self activeSystemEndpoint];
    uint64_t v14 = [(MRDRoutedBackgroundActivityManager *)self activeSystemEndpoint];
    id v12 = +[MRIRRoute routeWithEndpoint:v14];
  }
  id v15 = [(MRDRoutedBackgroundActivityManager *)self mediaActivityManager];
  BOOL v16 = [(MRDRoutedBackgroundActivityManager *)self optimisticDevices];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100044918;
  v17[3] = &unk_100417550;
  v17[4] = self;
  [v15 postConnectedBannerRequestForRoute:v12 devices:v16 endpoint:v13 remoteControl:v6 completion:v17];
}

- (void)presentAudioBluePill:(id)a3 remoteControl:(BOOL)a4 reason:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([(MRDRoutedBackgroundActivityManager *)self supportsCustomSystemAperturePill])
  {
    unint64_t v10 = +[MRDDisplayMonitor sharedMonitor];
    uint64_t v11 = [v10 primaryUIApplicationBundleIdentifier];

    id v12 = [(MRDRoutedBackgroundActivityManager *)self mediaActivityManager];
    unsigned __int8 v13 = [v12 presentingConnectedPillFor:v11];

    if (v13)
    {
      uint64_t v14 = _MRLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        id v16 = v8;
        __int16 v17 = 2112;
        v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[MRDRRC].RBAM Dropping audio pill for %@ because another one is already visible - %@", (uint8_t *)&v15, 0x16u);
      }
    }
    else
    {
      [(MRDRoutedBackgroundActivityManager *)self presentSystemApertureBluePill:v8 remoteControl:v6 reason:v9];
    }
  }
  else
  {
    [(MRDRoutedBackgroundActivityManager *)self presentBluePillWithPlainType:1 pulseType:2 route:v8 remoteControl:v6 reason:v9];
  }
}

- (void)presentVideoBluePill:(id)a3 remoteControl:(BOOL)a4 reason:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([(MRDRoutedBackgroundActivityManager *)self supportsCustomSystemAperturePill])
  {
    unint64_t v10 = +[MRDDisplayMonitor sharedMonitor];
    uint64_t v11 = [v10 primaryUIApplicationBundleIdentifier];

    id v12 = [(MRDRoutedBackgroundActivityManager *)self mediaActivityManager];
    unsigned __int8 v13 = [v12 presentingConnectedPillFor:v11];

    if (v13)
    {
      uint64_t v14 = _MRLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        id v16 = v8;
        __int16 v17 = 2112;
        v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[MRDRRC].RBAM Dropping video pill for %@ because another one is already visible - %@", (uint8_t *)&v15, 0x16u);
      }
    }
    else
    {
      [(MRDRoutedBackgroundActivityManager *)self presentSystemApertureBluePill:v8 remoteControl:v6 reason:v9];
    }
  }
  else
  {
    [(MRDRoutedBackgroundActivityManager *)self presentBluePillWithPlainType:3 pulseType:4 route:v8 remoteControl:v6 reason:v9];
  }
}

- (void)presentBluePillWithPlainType:(unint64_t)a3 pulseType:(unint64_t)a4 route:(id)a5 remoteControl:(BOOL)a6 reason:(id)a7
{
  id v17 = a7;
  unsigned int v11 = [(MRDRoutedBackgroundActivityManager *)self playbackState];
  unint64_t v12 = [(MRDRoutedBackgroundActivityManager *)self activeBackgroundActivityType];
  if (a5) {
    unint64_t v13 = a4;
  }
  else {
    unint64_t v13 = a3;
  }
  if (v11 != 1 || a5 == 0) {
    unint64_t v15 = a3;
  }
  else {
    unint64_t v15 = a4;
  }
  if (v12 == a4) {
    unint64_t v16 = v13;
  }
  else {
    unint64_t v16 = v15;
  }
  if (v12 != v16) {
    -[MRDRoutedBackgroundActivityManager updateActiveBackgroundActivityWithType:reason:](self, "updateActiveBackgroundActivityWithType:reason:");
  }
}

- (unint64_t)activeBackgroundActivityType
{
  v2 = [(MRDRoutedBackgroundActivityManager *)self backgroundActivityControllers];
  objc_super v3 = objc_msgSend(v2, "msv_firstWhere:", &stru_100417590);

  if (v3)
  {
    id v4 = [v3 first];
    id v5 = [v4 unsignedIntegerValue];
  }
  else
  {
    id v5 = 0;
  }

  return (unint64_t)v5;
}

- (BOOL)isPresentingBackgroundActivity
{
  return [(MRDRoutedBackgroundActivityManager *)self activeBackgroundActivityType] != 0;
}

- (void)updateActiveBackgroundActivityWithType:(unint64_t)a3 reason:(id)a4
{
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  id v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 - 1 > 3) {
      CFStringRef v9 = @"None";
    }
    else {
      CFStringRef v9 = off_100417680[a3 - 1];
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v23 = v9;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRDRRC].RBAM Asked to updateActiveBackgroundActivity withType:%@ because %@", buf, 0x16u);
  }

  unint64_t v10 = [(MRDRoutedBackgroundActivityManager *)v7 controllerForType:a3];
  if (([v10 isBackgroundActivityActive] & 1) == 0)
  {
    [v10 setIsBackgroundActivityActive:1];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    unsigned int v11 = [(MRDRoutedBackgroundActivityManager *)v7 backgroundActivityControllers];
    unint64_t v12 = [v11 allValues];

    id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v18;
      do
      {
        unint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v12);
          }
          unint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v15);
          if (v16 != v10) {
            [v16 setIsBackgroundActivityActive:0];
          }
          unint64_t v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
  objc_sync_exit(v7);
}

- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5
{
  -[MRDRoutedBackgroundActivityManager setPlaybackState:](self, "setPlaybackState:", *(void *)&a5, *(void *)&a4);

  [(MRDRoutedBackgroundActivityManager *)self reevaluatePillsWithReason:@"playback state changed"];
}

- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:kMRMediaRemoteActiveEndpointTypeUserInfoKey];
  unsigned int v7 = [v6 intValue];

  if (!v7)
  {
    id v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRDRRC].RBAM _handleActiveSystemEndpointDidChangeNotification: %@", buf, 0xCu);
    }

    CFStringRef v9 = [v4 userInfo];
    unint64_t v10 = [v9 objectForKeyedSubscript:kMRAVEndpointOutputDeviceIdentifierUserInfoKey];

    unsigned int v11 = [(MRDRoutedBackgroundActivityManager *)self queue];
    id v12 = v10;
    MRAVEndpointResolveActiveSystemEndpointWithType();
  }
}

- (void)_handleOutputDevicesDidChangeNotification:(id)a3
{
}

- (void)setActiveSystemEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_activeSystemEndpoint, a3);

  [(MRDRoutedBackgroundActivityManager *)self reevaluatePillsWithReason:@"active system endpoint changed"];
}

- (void)setOptimisticRoute:(id)a3
{
  objc_storeStrong((id *)&self->_optimisticRoute, a3);

  [(MRDRoutedBackgroundActivityManager *)self reevaluatePillsWithReason:@"optimistic route changed"];
}

- (void)openRoutePicker
{
  objc_super v3 = [(MRDRoutedBackgroundActivityManager *)self activeSystemEndpoint];
  id v4 = [v3 outputDeviceUIDs];
  id v5 = [v4 firstObject];

  id v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [(MRDRoutedBackgroundActivityManager *)self activeSystemEndpoint];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDRRC].RBAM pill tapped, will open route picker for %@ (%@)", buf, 0x16u);
  }
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2050000000;
  id v8 = (void *)qword_10047DF18;
  uint64_t v34 = qword_10047DF18;
  if (!qword_10047DF18)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100045C68;
    v36 = &unk_100415FF8;
    v37 = &v31;
    sub_100045C68((uint64_t)buf);
    id v8 = (void *)v32[3];
  }
  CFStringRef v9 = v8;
  _Block_object_dispose(&v31, 8);
  id v10 = objc_alloc_init(v9);
  unsigned int v11 = [(MRDRoutedBackgroundActivityManager *)self focusMonitor];
  id v12 = [v11 bundlesInFocus];

  id v13 = objc_msgSend(v12, "msv_firstWhere:", &stru_100417600);
  if (_os_feature_enabled_impl())
  {
    if (v13)
    {
      [v10 setPresentingAppBundleID:v13];
    }
    else
    {
      unint64_t v16 = [v12 anyObject];
      [v10 setPresentingAppBundleID:v16];
    }
  }
  else
  {
    id v14 = +[NSBundle mainBundle];
    unint64_t v15 = [v14 bundleIdentifier];
    [v10 setPresentingAppBundleID:v15];
  }
  if (v13) {
    uint64_t v17 = 3;
  }
  else {
    uint64_t v17 = 2;
  }
  [v10 setStyle:v17];
  if (MRAVOutputContextGetSharedAudioPresentationContext())
  {
    long long v18 = (void *)MRAVOutputContextCopyUniqueIdentifier();
    [v10 setRoutingContextUID:v18];
  }
  long long v19 = +[MRDDisplayMonitor sharedMonitor];
  long long v20 = [v19 primaryUIApplicationBundleIdentifier];

  v21 = [(MRDRoutedBackgroundActivityManager *)self nowPlayingController];
  objc_super v22 = [v21 destination];
  CFStringRef v23 = [v22 client];
  __int16 v24 = [v23 bundleIdentifier];

  if (v24) {
    id v25 = v24;
  }
  else {
    id v25 = v20;
  }
  id v26 = v25;
  if (v26)
  {
    v27 = +[MRDMediaBundleManager shared];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100045908;
    v28[3] = &unk_100417628;
    id v29 = v10;
    v30 = self;
    [v27 queryEligibilityOf:v26 completionHandler:v28];
  }
  else
  {
    [(MRDRoutedBackgroundActivityManager *)self _presentRoutePickerWithConfiguration:v10];
  }
}

- (void)_presentRoutePickerWithConfiguration:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v5 = (void *)qword_10047DF28;
  uint64_t v16 = qword_10047DF28;
  if (!qword_10047DF28)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100045E30;
    v12[3] = &unk_100415FF8;
    v12[4] = &v13;
    sub_100045E30((uint64_t)v12);
    id v5 = (void *)v14[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v13, 8);
  unsigned int v7 = (MPMediaControls *)[[v6 alloc] initWithConfiguration:v4 shouldObserveRoutingContextUIDChanges:0];
  mediaControls = self->_mediaControls;
  self->_mediaControls = v7;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100045B00;
  v9[3] = &unk_1004171D0;
  objc_copyWeak(&v10, &location);
  [(MPMediaControls *)self->_mediaControls setDismissHandler:v9];
  [(MPMediaControls *)self->_mediaControls present];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (NSArray)optimisticDevices
{
  return self->_optimisticDevices;
}

- (void)setOptimisticDevices:(id)a3
{
}

- (void)setFocusMonitor:(id)a3
{
}

- (MRNowPlayingController)nowPlayingController
{
  return self->_nowPlayingController;
}

- (void)setNowPlayingController:(id)a3
{
}

- (unsigned)playbackState
{
  return self->_playbackState;
}

- (void)setPlaybackState:(unsigned int)a3
{
  self->_playbackState = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setMediaActivityManager:(id)a3
{
}

- (NSMutableDictionary)backgroundActivityControllers
{
  return self->_backgroundActivityControllers;
}

- (void)setBackgroundActivityControllers:(id)a3
{
}

- (MPMediaControls)mediaControls
{
  return self->_mediaControls;
}

- (void)setMediaControls:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_storeStrong((id *)&self->_backgroundActivityControllers, 0);
  objc_storeStrong((id *)&self->_mediaActivityManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nowPlayingController, 0);
  objc_storeStrong((id *)&self->_activeSystemEndpoint, 0);
  objc_storeStrong((id *)&self->_focusMonitor, 0);
  objc_storeStrong((id *)&self->_optimisticDevices, 0);

  objc_storeStrong((id *)&self->_optimisticRoute, 0);
}

@end