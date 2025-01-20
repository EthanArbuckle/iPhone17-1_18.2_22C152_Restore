@interface MRDRouteRecommendationController
- (BOOL)isRoutePlaying:(id)a3;
- (BOOL)shouldUseVideoSymbolForDevices:(id)a3 bundleIdentifier:(id)a4;
- (MPMediaControls)mediaControls;
- (MRAVEndpoint)activeSystemEndpoint;
- (MRAVEndpoint)localSystemEndpoint;
- (MRAVRoutingDiscoverySession)discoverySession;
- (MRDMediaActivityManager)mediaActivityManager;
- (MRDMediaAppInFocusMonitor)focusMonitor;
- (MRDNowPlayingStateMonitor)nowPlayingStateMonitor;
- (MRDRouteRecommendationController)init;
- (MRDRoutedBackgroundActivityManager)routedBackgroundActivityManager;
- (MRRouteRecommender)recommender;
- (MRRouteRepresentable)lastDonatedPickerChoice;
- (MRRouteRepresentable)lastUnusedAutoRoute;
- (MRRouteValidator)validator;
- (MSVTimer)undoTimer;
- (NSArray)recommendedRoutes;
- (NSArray)visibleMediaApps;
- (NSMutableArray)signpostIds;
- (NSString)lastUnusedAutoRouteBundleIdentifier;
- (OS_dispatch_queue)queue;
- (id)_updateMediaControlsBlob:(id)a3 sender:(id)a4;
- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3;
- (void)_handleLayoutDidChangeNotification:(id)a3;
- (void)_handleOutputDevicesDidChangeNotification:(id)a3;
- (void)airPlayTo:(id)a3 completion:(id)a4;
- (void)clearUnusedAutoRoute;
- (void)didReceiveNewRecommendations:(id)a3 forBundleIdentifier:(id)a4;
- (void)dismissAllBannerRequests;
- (void)donatePickerChoiceFor:(id)a3 bundleIdentifier:(id)a4 contextIdentifier:(id)a5;
- (void)handOffQueueOrAirPlay:(id)a3 sourceEndpoint:(id)a4 destinationEndpoint:(id)a5 playerPath:(id)a6 completion:(id)a7;
- (void)handleAutoRouteResult:(unint64_t)a3 forRoute:(id)a4 primaryBundleIdentifier:(id)a5 isOutsideApp:(BOOL)a6 contextIdentifier:(id)a7;
- (void)handleDeltaResult:(unint64_t)a3 forRoute:(id)a4 devicesToAdd:(id)a5 sourceEndpoint:(id)a6 primaryBundleIdentifier:(id)a7 isOutsideApp:(BOOL)a8 contextIdentifier:(id)a9;
- (void)handlePlaybackStartForEndpoint:(id)a3 bundleIdentifier:(id)a4 eligibleForRecommendationsOutsideApp:(BOOL)a5;
- (void)handleResult:(unint64_t)a3 forRoute:(id)a4 devices:(id)a5 endpoint:(id)a6 primaryBundleIdentifier:(id)a7 isOutsideApp:(BOOL)a8 contextIdentifier:(id)a9;
- (void)ingestMockedRecommendation:(id)a3 classification:(int64_t)a4 isCallToAction:(BOOL)a5;
- (void)mediaApplicationsInFocus:(id)a3;
- (void)openRoutePickerForRouteUID:(id)a3;
- (void)performTopologyModificationToRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 requestName:(id)a6 completion:(id)a7;
- (void)remoteControl:(id)a3 completion:(id)a4;
- (void)route:(id)a3 endpoint:(id)a4 bundleIdentifier:(id)a5 emittedEvent:(unint64_t)a6;
- (void)sendEventForAutoRouteBannerResult:(unint64_t)a3 routeCandidate:(id)a4 bundleIdentifier:(id)a5 isOutsideApp:(BOOL)a6 contextIdentifier:(id)a7;
- (void)sendEventForCallToActionForRouteCandidate:(id)a3 bundleIdentifier:(id)a4 isOutsideApp:(BOOL)a5 contextIdentifier:(id)a6;
- (void)sendEventForOneTapSuggestionBannerResult:(unint64_t)a3 routeCandidate:(id)a4 bundleIdentifier:(id)a5 isOutsideApp:(BOOL)a6 contextIdentifier:(id)a7;
- (void)setASEToLocal;
- (void)setActiveSystemEndpoint:(id)a3;
- (void)setDiscoverySession:(id)a3;
- (void)setFocusMonitor:(id)a3;
- (void)setLastDonatedPickerChoice:(id)a3;
- (void)setLastUnusedAutoRoute:(id)a3;
- (void)setLastUnusedAutoRouteBundleIdentifier:(id)a3;
- (void)setLocalSystemEndpoint:(id)a3;
- (void)setMediaActivityManager:(id)a3;
- (void)setMediaControls:(id)a3;
- (void)setNowPlayingStateMonitor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecommendedRoutes:(id)a3;
- (void)setRecommender:(id)a3;
- (void)setRoutedBackgroundActivityManager:(id)a3;
- (void)setSignpostIds:(id)a3;
- (void)setUndoTimer:(id)a3;
- (void)setValidator:(id)a3;
- (void)setVisibleMediaApps:(id)a3;
- (void)setup;
- (void)setupTimerForRoute:(id)a3 bundleIdentifier:(id)a4;
- (void)signpostEndWillShowBanner:(BOOL)a3;
- (void)stopAirPlayingAndRemoteControlling;
@end

@implementation MRDRouteRecommendationController

- (MRRouteValidator)validator
{
  v2 = self;
  objc_sync_enter(v2);
  validator = v2->_validator;
  if (!validator)
  {
    v4 = objc_alloc_init(MRDRouteValidator);
    v5 = v2->_validator;
    v2->_validator = (MRRouteValidator *)v4;

    validator = v2->_validator;
  }
  v6 = validator;
  objc_sync_exit(v2);

  return v6;
}

- (void)_handleLayoutDidChangeNotification:(id)a3
{
  v4 = [(MRDRouteRecommendationController *)self lastUnusedAutoRouteBundleIdentifier];
  if (!v4) {
    goto LABEL_11;
  }
  v5 = +[MRDDisplayMonitor sharedMonitor];
  if ([v5 displayOn])
  {
    v6 = +[MRDDisplayMonitor sharedMonitor];
    v7 = [v6 presentedBundleIdentifiers];
    unsigned int v8 = [v7 containsObject:v4];

    if (v8)
    {
      v9 = [(MRDRouteRecommendationController *)self undoTimer];

      if (v9)
      {
        [(MRDRouteRecommendationController *)self setUndoTimer:0];
        v10 = _MRLogForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138412290;
          v14 = v4;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[MRDRRC] cancelling timer, %@ is in focus again", (uint8_t *)&v13, 0xCu);
        }
      }
      goto LABEL_11;
    }
  }
  else
  {
  }
  v11 = [(MRDRouteRecommendationController *)self undoTimer];

  if (!v11)
  {
    v12 = [(MRDRouteRecommendationController *)self lastUnusedAutoRoute];
    [(MRDRouteRecommendationController *)self setupTimerForRoute:v12 bundleIdentifier:v4];
  }
LABEL_11:
}

- (void)mediaApplicationsInFocus:(id)a3
{
  id v4 = a3;
  v5 = [v4 allObjects];
  [(MRDRouteRecommendationController *)self setVisibleMediaApps:v5];

  v6 = [(MRDRouteRecommendationController *)self focusMonitor];
  unsigned int v7 = [v6 lockScreenVisible];

  if ([v4 count]) {
    int v8 = 1;
  }
  else {
    int v8 = v7;
  }
  v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      CFStringRef v10 = @"OnEvents";
    }
    else {
      CFStringRef v10 = @"Paused";
    }
    id v11 = [v4 count];
    CFStringRef v12 = @"NO";
    *(_DWORD *)v22 = 138413058;
    *(void *)&v22[4] = v10;
    *(_WORD *)&v22[12] = 2048;
    if (v7) {
      CFStringRef v12 = @"YES";
    }
    *(void *)&v22[14] = v11;
    __int16 v23 = 2112;
    id v24 = v4;
    __int16 v25 = 2112;
    CFStringRef v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[MRDRRC] setting mode to %@: %lu media apps in focus: %@, lockscreen: %@", v22, 0x2Au);
  }

  int v13 = [(MRDRouteRecommendationController *)self recommender];
  v14 = v13;
  if (v8)
  {
    id v15 = [v13 mode];

    if (v15 == (id)1)
    {
      v16 = _MRLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[MRDRRC] mode already set to update on events - won't set again", v22, 2u);
      }
    }
    else
    {
      v16 = [(MRDRouteRecommendationController *)self recommender];
      [v16 setMode:1];
    }

    v17 = +[NSUUID UUID];
    [(NSMutableArray *)self->_signpostIds addObject:v17];
    v18 = _MRLogForCategory();
    v19 = (char *)[v17 hash];
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v20 = (os_signpost_id_t)v19;
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)v22 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "RequestRouteRecommendations", "", v22, 2u);
      }
    }
  }
  else
  {
    [v13 setMode:0];

    [(MRDRouteRecommendationController *)self dismissAllBannerRequests];
  }
  v21 = [(MRDRouteRecommendationController *)self routedBackgroundActivityManager];
  [v21 mediaApplicationsInFocus:v4];
}

- (MRRouteRecommender)recommender
{
  v2 = self;
  objc_sync_enter(v2);
  recommender = v2->_recommender;
  if (!recommender)
  {
    id v4 = objc_alloc_init(MRDIRDRouteRecommender);
    v5 = v2->_recommender;
    v2->_recommender = (MRRouteRecommender *)v4;

    [(MRRouteRecommender *)v2->_recommender setDelegate:v2];
    recommender = v2->_recommender;
  }
  v6 = recommender;
  objc_sync_exit(v2);

  return v6;
}

- (void)didReceiveNewRecommendations:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRDRRC] %@", buf, 0xCu);
  }

  [(MRDRouteRecommendationController *)self setRecommendedRoutes:v6];
  v9 = +[NSNotificationCenter defaultCenter];
  [v9 postNotificationName:@"MRRouteRecommenderDidReceiveNewRecommendationsNotification" object:self];

  CFStringRef v10 = objc_msgSend(v6, "msv_compactMap:", &stru_10041FC70);
  id v11 = +[MRDDisplayMonitor sharedMonitor];
  id v12 = [v11 primaryUIApplicationBundleIdentifier];

  int v13 = +[MRUserSettings currentSettings];
  unsigned int v14 = [v13 showRouteRecommendationsOutsideApps];
  if (v7) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }

  if (v15)
  {
    v16 = _MRLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v32 = v12;
      __int16 v33 = 2112;
      id v34 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[MRDRRC] overriding %@ with %@ - request outside app", buf, 0x16u);
    }

    id v17 = v7;
    id v12 = v17;
  }
  else
  {
    v18 = [(MRDRouteRecommendationController *)self recommender];
    id v19 = [v18 mode];

    if (v19 != (id)1)
    {
      v22 = _MRLogForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v25 = [(MRDRouteRecommendationController *)self recommender];
        id v26 = [v25 mode];
        id v27 = [v10 count];
        *(_DWORD *)buf = 134218498;
        id v32 = v26;
        __int16 v33 = 2048;
        id v34 = v27;
        __int16 v35 = 2112;
        id v36 = v12;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[MRDRRC] Session mode is %ld - ignoring %lu recommendations - primary: %@", buf, 0x20u);
      }
      goto LABEL_17;
    }
  }
  os_signpost_id_t v20 = +[MRDDisplayMonitor sharedMonitor];
  unsigned int v21 = [v20 lockScreenVisible];

  if (v21)
  {
    v22 = _MRLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [v10 count];
      *(_DWORD *)buf = 134217984;
      id v32 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[MRDRRC] lockscreen is visible - ignoring %lu recommendations", buf, 0xCu);
    }
LABEL_17:

    [(MRDRouteRecommendationController *)self signpostEndWillShowBanner:0];
    goto LABEL_18;
  }
  id v24 = [(MRDRouteRecommendationController *)self validator];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1001751CC;
  v28[3] = &unk_10041FD88;
  v28[4] = self;
  id v12 = v12;
  id v29 = v12;
  BOOL v30 = v7 != 0;
  [v24 bestRecommendationIn:v10 primaryBundleIdentifier:v12 eligibleToShowRecommendationsOutsideApp:v15 completion:v28];

LABEL_18:
}

- (void)setVisibleMediaApps:(id)a3
{
}

- (void)setRecommendedRoutes:(id)a3
{
}

- (MRDRoutedBackgroundActivityManager)routedBackgroundActivityManager
{
  return self->_routedBackgroundActivityManager;
}

- (NSArray)recommendedRoutes
{
  return self->_recommendedRoutes;
}

- (NSString)lastUnusedAutoRouteBundleIdentifier
{
  return self->_lastUnusedAutoRouteBundleIdentifier;
}

- (MRDMediaAppInFocusMonitor)focusMonitor
{
  return self->_focusMonitor;
}

- (MRDRouteRecommendationController)init
{
  v13.receiver = self;
  v13.super_class = (Class)MRDRouteRecommendationController;
  v2 = [(MRDRouteRecommendationController *)&v13 init];
  if (v2)
  {
    v3 = [[MRDMediaAppInFocusMonitor alloc] initWithDelegate:v2];
    [(MRDRouteRecommendationController *)v2 setFocusMonitor:v3];

    id v4 = [[MRDNowPlayingStateMonitor alloc] initWithDelegate:v2];
    [(MRDRouteRecommendationController *)v2 setNowPlayingStateMonitor:v4];

    v5 = +[MRAVRoutingDiscoverySessionConfiguration configurationWithEndpointFeatures:8];
    id v6 = +[MRAVRoutingDiscoverySession discoverySessionWithConfiguration:v5];
    [(MRDRouteRecommendationController *)v2 setDiscoverySession:v6];

    id v7 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    [(MRDRouteRecommendationController *)v2 setActiveSystemEndpoint:v7];

    int v8 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    [(MRDRouteRecommendationController *)v2 setLocalSystemEndpoint:v8];

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.MediaRemote.MRDRouteRecommendationController.queue", v9);
    [(MRDRouteRecommendationController *)v2 setQueue:v10];

    id v11 = +[NSMutableArray array];
    [(MRDRouteRecommendationController *)v2 setSignpostIds:v11];

    [(MRDRouteRecommendationController *)v2 setup];
  }
  return v2;
}

- (void)setup
{
  v3 = [(MRDRouteRecommendationController *)self discoverySession];
  [v3 setAlwaysAllowUpdates:1];

  objc_initWeak(&location, self);
  id v4 = +[NSNotificationCenter defaultCenter];
  v5 = +[MRAVLocalEndpoint sharedLocalEndpoint];
  [v4 addObserver:self selector:"_handleOutputDevicesDidChangeNotification:" name:MRAVEndpointDidAddOutputDeviceNotification object:v5];

  id v6 = +[NSNotificationCenter defaultCenter];
  id v7 = +[MRAVLocalEndpoint sharedLocalEndpoint];
  [v6 addObserver:self selector:"_handleOutputDevicesDidChangeNotification:" name:MRAVEndpointDidChangeOutputDeviceNotification object:v7];

  int v8 = +[NSNotificationCenter defaultCenter];
  v9 = +[MRAVLocalEndpoint sharedLocalEndpoint];
  [v8 addObserver:self selector:"_handleOutputDevicesDidChangeNotification:" name:MRAVEndpointDidRemoveOutputDeviceNotification object:v9];

  dispatch_queue_t v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"_handleActiveSystemEndpointDidChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];

  id v11 = +[NSNotificationCenter defaultCenter];
  id v12 = +[MRDDisplayMonitor sharedMonitor];
  [v11 addObserver:self selector:"_handleLayoutDidChangeNotification:" name:@"MRDisplayMonitorLayoutDidChangeNotification" object:v12];

  objc_super v13 = _MRLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v14 = [(MRDRouteRecommendationController *)self discoverySession];
    uint64_t v15 = [(MRDRouteRecommendationController *)self discoverySession];
    *(_DWORD *)buf = 134218498;
    id v29 = self;
    __int16 v30 = 2048;
    v31 = v14;
    __int16 v32 = 2112;
    __int16 v33 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[MRDRRC] <%p> Setup RRC: discovery session (%p) = %@", buf, 0x20u);
  }
  v16 = [(MRDRouteRecommendationController *)self discoverySession];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001746A4;
  v25[3] = &unk_100418710;
  objc_copyWeak(&v26, &location);
  id v17 = [v16 addEndpointsAddedCallback:v25];

  v18 = [(MRDRouteRecommendationController *)self discoverySession];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001748B8;
  v23[3] = &unk_100418710;
  objc_copyWeak(&v24, &location);
  id v19 = [v18 addEndpointsModifiedCallback:v23];

  os_signpost_id_t v20 = _MRLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v21 = [(MRDRouteRecommendationController *)self discoverySession];
    v22 = [(MRDRouteRecommendationController *)self discoverySession];
    *(_DWORD *)buf = 134218498;
    id v29 = self;
    __int16 v30 = 2048;
    v31 = v21;
    __int16 v32 = 2112;
    __int16 v33 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[MRDRRC] <%p> Setup RRC: added callbacks for discovery session (%p) = %@", buf, 0x20u);
  }
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (MRDMediaActivityManager)mediaActivityManager
{
  return +[MRDMediaActivityManager manager];
}

- (void)dismissAllBannerRequests
{
  id v2 = [(MRDRouteRecommendationController *)self mediaActivityManager];
  [v2 dismissAllBannerRequests];
}

- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:kMRMediaRemoteActiveEndpointTypeUserInfoKey];
  unsigned int v7 = [v6 intValue];

  if (!v7)
  {
    int v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRDRRC] _handleActiveSystemEndpointDidChangeNotification: %@", buf, 0xCu);
    }

    v9 = [v4 userInfo];
    dispatch_queue_t v10 = [v9 objectForKeyedSubscript:kMRAVEndpointOutputDeviceIdentifierUserInfoKey];

    id v11 = [(MRDRouteRecommendationController *)self queue];
    id v12 = v10;
    MRAVEndpointResolveActiveSystemEndpointWithType();
  }
}

- (void)_handleOutputDevicesDidChangeNotification:(id)a3
{
  id v6 = +[MRAVLocalEndpoint sharedLocalEndpoint];
  if ([v6 shouldDonate])
  {
    id v4 = [(MRDRouteRecommendationController *)self recommender];
    v5 = +[MRIRRoute routeWithEndpoint:v6];
    [v4 updateRouteCandidate:v5];
  }
}

- (void)donatePickerChoiceFor:(id)a3 bundleIdentifier:(id)a4 contextIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(MRDRouteRecommendationController *)self lastDonatedPickerChoice];
  unsigned int v12 = [v8 isEqual:v11];

  if (v12)
  {
    objc_super v13 = _MRLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[MRDRRC] Not dropping duplicate picker choice for %@ - picks are distributed", (uint8_t *)&v16, 0xCu);
    }
  }
  [(MRDRouteRecommendationController *)self setLastDonatedPickerChoice:v8];
  id v14 = [objc_alloc((Class)IRMediaEvent) initWithEventType:0 eventSubType:0];
  [v14 setBundleID:v10];

  [v14 setContextIdentifier:v9];
  uint64_t v15 = [(MRDRouteRecommendationController *)self recommender];
  [v15 addEvent:v14 forRouteCandidate:v8];
}

- (void)signpostEndWillShowBanner:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(MRDRouteRecommendationController *)self signpostIds];
  id v6 = [v5 count];

  if (v6)
  {
    unsigned int v7 = [(MRDRouteRecommendationController *)self signpostIds];
    id v8 = [v7 firstObject];

    id v9 = [(MRDRouteRecommendationController *)self signpostIds];
    [v9 removeFirstObject];

    id v10 = _MRLogForCategory();
    id v11 = (char *)[v8 hash];
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = (os_signpost_id_t)v11;
      if (os_signpost_enabled(v10))
      {
        CFStringRef v13 = @"NO";
        if (v3) {
          CFStringRef v13 = @"YES";
        }
        int v14 = 138412290;
        CFStringRef v15 = v13;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, v12, "RequestRouteRecommendations", "willShowBanner = %@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

- (BOOL)shouldUseVideoSymbolForDevices:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6
    && (+[MRUserSettings currentSettings],
        unsigned int v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 preferRoutesMatchingMediaType],
        v7,
        v8))
  {
    id v9 = +[MRDMediaBundleManager shared];
    id v10 = [v9 cachedEligibilityOf:v6];

    if ([v10 isVideoApp]) {
      unsigned __int8 v11 = objc_msgSend(v5, "mr_containsVideoOutputDevice");
    }
    else {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = objc_msgSend(v5, "mr_containsVideoOutputDevice");
  }

  return v11;
}

- (void)setASEToLocal
{
  BOOL v3 = [(MRDRouteRecommendationController *)self activeSystemEndpoint];
  unsigned __int8 v4 = [v3 isLocalEndpoint];

  if ((v4 & 1) == 0)
  {
    id v6 = [objc_alloc((Class)MRUpdateActiveSystemEndpointRequest) initWithOutputDeviceUID:0 reason:@"Coriander setASEToLocal"];
    [v6 setChangeType:0];
    id v5 = [(MRDRouteRecommendationController *)self queue];
    [v6 perform:v5 completion:&stru_10041FDC8];
  }
}

- (void)stopAirPlayingAndRemoteControlling
{
  id v4 = [objc_alloc((Class)MRUpdateActiveSystemEndpointRequest) initWithOutputDeviceUID:0 reason:@"Coriander Clear State"];
  [v4 setChangeType:0];
  BOOL v3 = [(MRDRouteRecommendationController *)self queue];
  [v4 perform:v3 completion:&stru_10041FDE8];
}

- (void)sendEventForOneTapSuggestionBannerResult:(unint64_t)a3 routeCandidate:(id)a4 bundleIdentifier:(id)a5 isOutsideApp:(BOOL)a6 contextIdentifier:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  switch(a3)
  {
    case 0uLL:
      CFStringRef v15 = _MRLogForCategory();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_7;
      }
      __int16 v22 = 0;
      int v16 = "[MRDRRC] banner not presented, no events will be sent";
      id v17 = (uint8_t *)&v22;
      goto LABEL_6;
    case 1uLL:
      uint64_t v18 = 3;
      goto LABEL_12;
    case 2uLL:
      CFStringRef v15 = _MRLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v21 = 0;
        int v16 = "[MRDRRC] banner long pressed, route picker will be shown, no banner events will be sent";
        id v17 = (uint8_t *)&v21;
LABEL_6:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, v17, 2u);
      }
LABEL_7:

      goto LABEL_13;
    case 3uLL:
      uint64_t v18 = 4;
      goto LABEL_12;
    case 4uLL:
      uint64_t v18 = 8;
      goto LABEL_12;
    default:
      uint64_t v18 = 0;
LABEL_12:
      id v19 = [objc_alloc((Class)IRMediaEvent) initWithEventType:v18 eventSubType:0];
      [v19 setBundleID:v13];
      [v19 setIsOutsideApp:v8];
      [v19 setContextIdentifier:v14];
      os_signpost_id_t v20 = [(MRDRouteRecommendationController *)self recommender];
      [v20 addEvent:v19 forRouteCandidate:v12];

LABEL_13:
      return;
  }
}

- (void)sendEventForAutoRouteBannerResult:(unint64_t)a3 routeCandidate:(id)a4 bundleIdentifier:(id)a5 isOutsideApp:(BOOL)a6 contextIdentifier:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  switch(a3)
  {
    case 0uLL:
      int v16 = _MRLogForCategory();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_8;
      }
      __int16 v22 = 0;
      id v17 = "[MRDRRC] banner not presented, no events will be sent";
      uint64_t v18 = (uint8_t *)&v22;
      goto LABEL_7;
    case 1uLL:
      uint64_t v15 = 2;
      goto LABEL_11;
    case 2uLL:
      int v16 = _MRLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v21 = 0;
        id v17 = "[MRDRRC] banner long pressed, route picker will be shown, no banner events will be sent";
        uint64_t v18 = (uint8_t *)&v21;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, v18, 2u);
      }
LABEL_8:

      goto LABEL_12;
    case 3uLL:
    case 4uLL:
      uint64_t v15 = 1;
      goto LABEL_11;
    default:
      uint64_t v15 = 0;
LABEL_11:
      id v19 = [objc_alloc((Class)IRMediaEvent) initWithEventType:v15 eventSubType:0];
      [v19 setBundleID:v13];
      [v19 setIsOutsideApp:v8];
      [v19 setContextIdentifier:v14];
      os_signpost_id_t v20 = [(MRDRouteRecommendationController *)self recommender];
      [v20 addEvent:v19 forRouteCandidate:v12];

LABEL_12:
      return;
  }
}

- (void)sendEventForCallToActionForRouteCandidate:(id)a3 bundleIdentifier:(id)a4 isOutsideApp:(BOOL)a5 contextIdentifier:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v14 = [objc_alloc((Class)IRMediaEvent) initWithEventType:11 eventSubType:0];
  [v14 setBundleID:v11];

  [v14 setIsOutsideApp:v6];
  [v14 setContextIdentifier:v10];

  id v13 = [(MRDRouteRecommendationController *)self recommender];
  [v13 addEvent:v14 forRouteCandidate:v12];
}

- (void)airPlayTo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(MRDRouteRecommendationController *)self localSystemEndpoint];
    *(_DWORD *)buf = 138412546;
    id v26 = v9;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRDRRC] Will AirPlay %@ to %@", buf, 0x16u);
  }
  id v10 = [(MRDRouteRecommendationController *)self localSystemEndpoint];
  objc_initWeak((id *)buf, v10);

  id v11 = objc_alloc((Class)MRRequestDetails);
  id v12 = +[NSUUID UUID];
  id v13 = [v12 UUIDString];
  id v14 = [v11 initWithName:@"RouteRecommendation.AirPlay" requestID:v13 reason:@"MRDRRC/AP"];

  id v15 = [objc_alloc((Class)MRGroupTopologyModificationRequest) initWithRequestDetails:v14 type:3 outputDevices:v6];
  [v15 setMuteUntilFinished:1];
  int v16 = [(MRDRouteRecommendationController *)self localSystemEndpoint];
  id v17 = [(MRDRouteRecommendationController *)self queue];
  id v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  __int16 v21 = sub_100177070;
  __int16 v22 = &unk_10041FE50;
  id v18 = v7;
  id v23 = v18;
  objc_copyWeak(&v24, (id *)buf);
  [v16 modifyTopologyWithRequest:v15 withReplyQueue:v17 completion:&v19];

  [(MRDRouteRecommendationController *)self setASEToLocal];
  objc_destroyWeak(&v24);

  objc_destroyWeak((id *)buf);
}

- (void)handOffQueueOrAirPlay:(id)a3 sourceEndpoint:(id)a4 destinationEndpoint:(id)a5 playerPath:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = _MRLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v14 uniqueIdentifier];
    *(_DWORD *)buf = 138412802;
    __int16 v33 = v18;
    __int16 v34 = 2112;
    id v35 = v12;
    __int16 v36 = 2112;
    id v37 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[MRDRRC] Will try to HandOff or AirPlay to %@ (%@) pp: %@", buf, 0x20u);
  }
  id v19 = +[MRUserSettings currentSettings];
  unsigned __int8 v20 = [v19 enableQueueHandOffForRouteRecommendations];

  if (v20)
  {
    id v21 = objc_alloc_init((Class)MRPlaybackSessionMigrateRequest);
    [v21 setPlayerPath:v15];
    id v22 = objc_alloc((Class)MRRequestDetails);
    id v23 = +[NSUUID UUID];
    id v24 = [v23 UUIDString];
    id v25 = [v22 initWithName:@"RouteRecommendation.HandOffQueueOrAirPlay" requestID:v24 reason:@"MRDRRC/QHOFallbackToAirPlay"];

    id v26 = [objc_alloc((Class)MRGroupTopologyModificationRequest) initWithRequestDetails:v25 type:3 outputDevices:v12];
    [v26 setMuteUntilFinished:1];
    __int16 v27 = [(MRDRouteRecommendationController *)self queue];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1001773F4;
    v29[3] = &unk_1004189B0;
    id v31 = v16;
    id v30 = v14;
    [v13 migrateToEndpointOrModifyTopology:v30 migrationRequest:v21 topologyModificationRequest:v26 withReplyQueue:v27 completion:v29];
  }
  else
  {
    id v28 = _MRLogForCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[MRDRRC] HandOff is disabled, AirPlaying...", buf, 2u);
    }

    [(MRDRouteRecommendationController *)self airPlayTo:v12 completion:v16];
  }
}

- (void)remoteControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)MRUpdateActiveSystemEndpointRequest);
  id v9 = [v6 outputDeviceUIDs];
  id v10 = [v9 firstObject];
  id v11 = [v8 initWithOutputDeviceUID:v10 reason:@"Coriander One-Tap Recommendation accepted"];

  [v11 setChangeType:0];
  id v12 = [(MRDRouteRecommendationController *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100177554;
  v15[3] = &unk_10041FE78;
  id v16 = v6;
  id v17 = v7;
  id v13 = v6;
  id v14 = v7;
  [v11 perform:v12 completion:v15];
}

- (void)performTopologyModificationToRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 requestName:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = v12;
  id v15 = v13;
  id v16 = a7;
  id v17 = a6;
  id v18 = a3;
  id v19 = +[NSDate date];
  unsigned __int8 v20 = +[NSString stringWithFormat:@"MRDRRC:TM/%@", v17];

  id v21 = +[NSUUID UUID];
  id v22 = [v21 UUIDString];

  id v23 = [v18 routeIdentifier];

  v141 = v15;
  id v24 = [v15 debugName];
  id v25 = MRAVOutputDeviceArrayDescription();
  id v26 = +[NSString stringWithFormat:@"route=%@, endpoint=%@, devices=%@", v23, v24, v25];

  id v27 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", v20, v22];
  id v28 = v27;
  if (v26) {
    [v27 appendFormat:@" for %@", v26];
  }
  id v29 = _MRLogForCategory();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v156 = v28;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v149[0] = _NSConcreteStackBlock;
  v149[1] = 3221225472;
  v149[2] = sub_1001787BC;
  v149[3] = &unk_100419A30;
  id v138 = v26;
  id v150 = v138;
  id v145 = v20;
  id v151 = v145;
  id v144 = v22;
  id v152 = v144;
  id v137 = v19;
  id v153 = v137;
  id v136 = v16;
  id v154 = v136;
  v135 = objc_retainBlock(v149);
  id v30 = v141;
  if (v141) {
    unsigned int v31 = objc_msgSend(v14, "mr_any:", &stru_10041FE98);
  }
  else {
    unsigned int v31 = 0;
  }
  __int16 v32 = [(MRDRouteRecommendationController *)self focusMonitor];
  __int16 v33 = [v32 bundlesInFocus];

  v139 = v33;
  __int16 v34 = objc_msgSend(v33, "msv_filter:", &stru_10041FEB8);
  id v35 = +[NSSet setWithArray:v34];

  __int16 v36 = [(MRDRouteRecommendationController *)self focusMonitor];
  id v37 = [v36 mediaBundlesInFocus];

  v140 = v37;
  id v38 = [v37 mutableCopy];
  [v38 minusSet:v35];
  v143 = v35;
  if ([v35 count]) {
    BOOL v39 = [v38 count] == 0;
  }
  else {
    BOOL v39 = 0;
  }
  id v40 = v38;
  uint64_t v41 = [(MRDRouteRecommendationController *)self localSystemEndpoint];
  v42 = self;
  uint64_t v43 = [(MRDRouteRecommendationController *)self activeSystemEndpoint];
  v44 = (void *)v43;
  BOOL v129 = v39;
  if (v39) {
    v45 = (void *)v43;
  }
  else {
    v45 = (void *)v41;
  }
  id v142 = v45;
  v46 = [v142 uniqueIdentifier];
  v47 = [v141 uniqueIdentifier];
  v134 = (void *)v41;
  uint64_t v119 = v41;
  v48 = v44;
  uint64_t v49 = +[NSString stringWithFormat:@"visible RC: %@\n visible AP: %@\n sEP: %@, dEP: %@\n ASE: %@ local: %@", v143, v38, v46, v47, v44, v119];

  v50 = _MRLogForCategory();
  v51 = v40;
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v156 = v145;
    __int16 v157 = 2114;
    id v158 = v144;
    __int16 v159 = 2112;
    CFStringRef v160 = (const __CFString *)v49;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }
  v133 = (void *)v49;

  if (v31)
  {
    v127 = v14;
    v52 = +[MRDMediaRemoteServer server];
    v53 = [v52 nowPlayingServer];
    v54 = [v142 origin];
    v55 = [v53 originClientForOrigin:v54];

    v56 = [v55 activeNowPlayingClient];
    v57 = [v56 client];
    uint64_t v58 = [v57 bundleIdentifier];

    v126 = v55;
    v59 = [v55 activeNowPlayingClient];
    v60 = [v59 activePlayerClient];
    unsigned int v61 = [v60 isPlaying];

    v121 = v48;
    v122 = v42;
    v132 = (void *)v58;
    v125 = v51;
    if (v58) {
      LODWORD(v58) = [v139 containsObject:v58];
    }
    id v62 = v141;
    v63 = +[MRDMediaRemoteServer server];
    v64 = [v63 nowPlayingServer];
    v65 = [v62 origin];
    v66 = [v64 originClientForOrigin:v65];

    v67 = [v66 activeNowPlayingClient];
    v68 = [v67 client];
    uint64_t v69 = [v68 bundleIdentifier];

    v123 = v66;
    v70 = [v66 activeNowPlayingClient];
    v71 = [v70 activePlayerClient];
    unsigned int v72 = [v71 isPlaying];

    if (v69) {
      unsigned int v73 = [v140 containsObject:v69];
    }
    else {
      unsigned int v73 = 0;
    }
    v76 = [v142 uniqueIdentifier];
    id v124 = v62;
    uint64_t v77 = [v62 uniqueIdentifier];
    v78 = (void *)v77;
    if (v61) {
      CFStringRef v79 = @"YES";
    }
    else {
      CFStringRef v79 = @"NO";
    }
    if (v72) {
      CFStringRef v80 = @"YES";
    }
    else {
      CFStringRef v80 = @"NO";
    }
    v128 = (void *)v69;
    uint64_t v81 = +[NSString stringWithFormat:@"sEP: %@\n dEP: %@\n sNP: %@\n dNP: %@\n sPL: %@ - dPL: %@\n", v76, v77, v132, v69, v79, v80];

    v82 = _MRLogForCategory();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v156 = v145;
      __int16 v157 = 2114;
      id v158 = v144;
      __int16 v159 = 2112;
      CFStringRef v160 = (const __CFString *)v81;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    id v30 = v141;
    v83 = v132;
    if (((v61 ^ 1 | v58) & 1) == 0 && [v140 count])
    {
      v84 = +[NSString stringWithFormat:@"Pausing ASE - NP: %@", v132];
      v85 = _MRLogForCategory();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v156 = v145;
        __int16 v157 = 2114;
        id v158 = v144;
        __int16 v159 = 2112;
        CFStringRef v160 = v84;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      v83 = v132;
      id v146 = v132;
      id v147 = v144;
      id v148 = v145;
      MRMediaRemoteSendCommandToPlayer();
    }
    if (v129)
    {
      if (v61)
      {
        id v14 = v127;
        if (v58)
        {
          v86 = (void *)v81;
          v87 = _MRLogForCategory();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            id v156 = v145;
            __int16 v157 = 2114;
            id v158 = v144;
            __int16 v159 = 2112;
            CFStringRef v160 = @"Only RC, source playing: QHO/AP";
            _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
          }

          id v88 = [objc_alloc((Class)MRClient) initWithBundleIdentifier:v83];
          id v89 = objc_alloc((Class)MRPlayerPath);
          v90 = +[MROrigin localOrigin];
          id v91 = [v89 initWithOrigin:v90 client:v88 player:0];

          v83 = v132;
          v48 = v121;
          v92 = v124;
          v75 = v135;
          [(MRDRouteRecommendationController *)v122 handOffQueueOrAirPlay:v127 sourceEndpoint:v121 destinationEndpoint:v124 playerPath:v91 completion:v135];

          v51 = v125;
        }
        else
        {
          uint64_t v96 = +[NSString stringWithFormat:@"Only RC, source was playing %@ (not FG): Migrating", v83];
          v97 = _MRLogForCategory();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            id v156 = v145;
            __int16 v157 = 2114;
            id v158 = v144;
            __int16 v159 = 2112;
            CFStringRef v160 = (const __CFString *)v96;
            _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
          }

          id v98 = [v143 mutableCopy];
          if (v83) {
            +[NSSet setWithObject:v83];
          }
          else {
            +[NSSet set];
          }
          v131 = (void *)v96;
          v120 = v86 = (void *)v81;
          [v98 minusSet:v120];
          v103 = [v98 anyObject];
          v104 = +[NSString stringWithFormat:@"migration candidates: %@, will try to migrate %@", v98, v103];
          v105 = _MRLogForCategory();
          if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            id v156 = v145;
            __int16 v157 = 2114;
            id v158 = v144;
            __int16 v159 = 2112;
            CFStringRef v160 = v104;
            _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
          }

          id v106 = [objc_alloc((Class)MRClient) initWithBundleIdentifier:v103];
          id v107 = objc_alloc((Class)MRPlayerPath);
          v108 = +[MROrigin localOrigin];
          id v109 = [v107 initWithOrigin:v108 client:v106 player:0];

          v92 = v124;
          v75 = v135;
          [(MRDRouteRecommendationController *)v122 handOffQueueOrAirPlay:v127 sourceEndpoint:v121 destinationEndpoint:v124 playerPath:v109 completion:v135];

          id v30 = v141;
          v51 = v125;
          v83 = v132;
          v48 = v121;
        }
        goto LABEL_52;
      }
      if ((v73 & v72) == 0)
      {
        uint64_t v99 = +[NSString stringWithFormat:@"Only RC, source is not playing, NP: %@ dPL: %@ HIJACK/QHO/AP", v128, v80];
        v100 = _MRLogForCategory();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          id v156 = v145;
          __int16 v157 = 2114;
          id v158 = v144;
          __int16 v159 = 2112;
          CFStringRef v160 = (const __CFString *)v99;
          _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        }
        v130 = (void *)v99;

        id v14 = v127;
        if (v58)
        {
          id v101 = v83;
        }
        else
        {
          id v102 = [v143 mutableCopy];
          if (v83) {
            +[NSSet setWithObject:v83];
          }
          else {
          v110 = +[NSSet set];
          }
          [v102 minusSet:v110];
          id v101 = [v102 anyObject];
          v111 = +[NSString stringWithFormat:@"migration candidates: %@", v102];
          v112 = _MRLogForCategory();
          if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            id v156 = v145;
            __int16 v157 = 2114;
            id v158 = v144;
            __int16 v159 = 2112;
            CFStringRef v160 = v111;
            _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
          }
        }
        v86 = (void *)v81;
        v113 = +[NSString stringWithFormat:@"will try to migrate %@", v101];
        v114 = _MRLogForCategory();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          id v156 = v145;
          __int16 v157 = 2114;
          id v158 = v144;
          __int16 v159 = 2112;
          CFStringRef v160 = v113;
          _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        }

        id v115 = [objc_alloc((Class)MRClient) initWithBundleIdentifier:v101];
        id v116 = objc_alloc((Class)MRPlayerPath);
        v117 = +[MROrigin localOrigin];
        id v118 = [v116 initWithOrigin:v117 client:v115 player:0];

        v48 = v121;
        v92 = v124;
        v75 = v135;
        [(MRDRouteRecommendationController *)v122 handOffQueueOrAirPlay:v127 sourceEndpoint:v121 destinationEndpoint:v124 playerPath:v118 completion:v135];

        id v30 = v141;
        v51 = v125;
        v83 = v132;
        goto LABEL_52;
      }
      v86 = (void *)v81;
      v94 = +[NSString stringWithFormat:@"Only RC, source is not playing, destination is playing %@ (FG locally): RC", v128];
      v95 = _MRLogForCategory();
      v51 = v125;
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v156 = v145;
        __int16 v157 = 2114;
        id v158 = v144;
        __int16 v159 = 2112;
        CFStringRef v160 = v94;
        _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      v92 = v124;
      v75 = v135;
      [(MRDRouteRecommendationController *)v122 remoteControl:v124 completion:v135];

      id v14 = v127;
    }
    else
    {
      v86 = (void *)v81;
      v93 = _MRLogForCategory();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v156 = v145;
        __int16 v157 = 2114;
        id v158 = v144;
        __int16 v159 = 2112;
        CFStringRef v160 = @"Non-RC visible: AP";
        _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      id v14 = v127;
      v75 = v135;
      [(MRDRouteRecommendationController *)v42 airPlayTo:v127 completion:v135];
      v92 = v124;
      v51 = v125;
    }
    v48 = v121;
LABEL_52:

    goto LABEL_53;
  }
  v74 = _MRLogForCategory();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v156 = v145;
    __int16 v157 = 2114;
    id v158 = v144;
    __int16 v159 = 2112;
    CFStringRef v160 = @"Route is not RC: AP";
    _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  v75 = v135;
  [(MRDRouteRecommendationController *)v42 airPlayTo:v14 completion:v135];
LABEL_53:
}

- (void)handleDeltaResult:(unint64_t)a3 forRoute:(id)a4 devicesToAdd:(id)a5 sourceEndpoint:(id)a6 primaryBundleIdentifier:(id)a7 isOutsideApp:(BOOL)a8 contextIdentifier:(id)a9
{
  BOOL v9 = a8;
  id v15 = a4;
  id v42 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  [(MRDRouteRecommendationController *)self sendEventForOneTapSuggestionBannerResult:a3 routeCandidate:v15 bundleIdentifier:v17 isOutsideApp:v9 contextIdentifier:v18];
  if (a3 == 2)
  {
    id v35 = [(MRDRouteRecommendationController *)self activeSystemEndpoint];
    __int16 v36 = [v35 outputDeviceUIDs];
    id v37 = [v36 firstObject];
    [(MRDRouteRecommendationController *)self openRoutePickerForRouteUID:v37];
  }
  else if (a3 == 1)
  {
    uint64_t v41 = +[NSUUID UUID];
    id v19 = _MRLogForCategory();
    unsigned __int8 v20 = (char *)[v41 hash];
    if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v21 = (os_signpost_id_t)v20;
      if (os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "ApplyRouteRecommendation", "", buf, 2u);
      }
    }

    id v40 = +[NSDate date];
    id v22 = +[NSUUID UUID];
    id v23 = [v22 UUIDString];

    id v24 = [v15 routeIdentifier];
    id v25 = [v16 debugName];
    id v26 = MRAVOutputDeviceArrayDescription();
    id v27 = +[NSString stringWithFormat:@"route=%@, sourceEndpoint=%@, devicesToAdd=%@", v24, v25, v26];

    id v28 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"MRDRRC:TM/DeltaOTSBannerTapped", v23];
    id v29 = v28;
    if (v27) {
      [v28 appendFormat:@" for %@", v27];
    }
    id v30 = _MRLogForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v52 = v29;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, v16);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100178F90;
    v43[3] = &unk_10041FF08;
    objc_copyWeak(&v50, (id *)buf);
    id v44 = v42;
    id v31 = v27;
    id v45 = v31;
    v46 = @"MRDRRC:TM/DeltaOTSBannerTapped";
    id v32 = v23;
    id v47 = v32;
    id v33 = v40;
    id v48 = v33;
    id v34 = v41;
    id v49 = v34;
    [v16 addOutputDevices:v44 initiator:@"DeltaOTSBannerTapped" withReplyQueue:0 completion:v43];

    objc_destroyWeak(&v50);
    objc_destroyWeak((id *)buf);
  }
  else if (a3 - 3 <= 1)
  {
    BOOL v38 = [(MRDRouteRecommendationController *)self shouldUseVideoSymbolForDevices:v42 bundleIdentifier:v17];
    BOOL v39 = [(MRDRouteRecommendationController *)self mediaActivityManager];
    [v39 presentControlCenterCallToActionVideo:v38 completion:0];
  }
}

- (void)handleResult:(unint64_t)a3 forRoute:(id)a4 devices:(id)a5 endpoint:(id)a6 primaryBundleIdentifier:(id)a7 isOutsideApp:(BOOL)a8 contextIdentifier:(id)a9
{
  BOOL v9 = a8;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  [(MRDRouteRecommendationController *)self sendEventForOneTapSuggestionBannerResult:a3 routeCandidate:v15 bundleIdentifier:v18 isOutsideApp:v9 contextIdentifier:a9];
  if (a3 == 2)
  {
    id v25 = [(MRDRouteRecommendationController *)self activeSystemEndpoint];
    id v26 = [v25 outputDeviceUIDs];
    id v27 = [v26 firstObject];
    [(MRDRouteRecommendationController *)self openRoutePickerForRouteUID:v27];

LABEL_8:
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    id v19 = +[NSUUID UUID];
    unsigned __int8 v20 = _MRLogForCategory();
    os_signpost_id_t v21 = (char *)[v19 hash];
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v22 = (os_signpost_id_t)v21;
      if (os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, v22, "ApplyRouteRecommendation", "", buf, 2u);
      }
    }

    id v23 = [(MRDRouteRecommendationController *)self routedBackgroundActivityManager];
    [v23 setOptimisticDevices:v16];

    id v24 = [(MRDRouteRecommendationController *)self routedBackgroundActivityManager];
    [v24 setOptimisticRoute:v15];

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100179534;
    v30[3] = &unk_10041FCE8;
    v30[4] = self;
    id v31 = v16;
    id v32 = v19;
    id v25 = v19;
    [(MRDRouteRecommendationController *)self performTopologyModificationToRoute:v15 devices:v31 endpoint:v17 requestName:@"OTSBannerTapped" completion:v30];

    goto LABEL_8;
  }
  if (a3 - 3 <= 1)
  {
    BOOL v28 = [(MRDRouteRecommendationController *)self shouldUseVideoSymbolForDevices:v16 bundleIdentifier:v18];
    id v29 = [(MRDRouteRecommendationController *)self mediaActivityManager];
    [v29 presentControlCenterCallToActionVideo:v28 completion:0];
  }
LABEL_9:
}

- (void)handleAutoRouteResult:(unint64_t)a3 forRoute:(id)a4 primaryBundleIdentifier:(id)a5 isOutsideApp:(BOOL)a6 contextIdentifier:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  [(MRDRouteRecommendationController *)self sendEventForAutoRouteBannerResult:a3 routeCandidate:v12 bundleIdentifier:v13 isOutsideApp:v8 contextIdentifier:a7];
  if (a3 <= 1)
  {
    [(MRDRouteRecommendationController *)self stopAirPlayingAndRemoteControlling];
    goto LABEL_14;
  }
  if (a3 == 2)
  {
    id v14 = [v12 nodes];
    id v15 = [v14 anyObject];
    id v16 = [v15 avOutputDeviceIdentifier];
    [(MRDRouteRecommendationController *)self openRoutePickerForRouteUID:v16];
  }
  [(MRDRouteRecommendationController *)self setLastUnusedAutoRoute:v12];
  [(MRDRouteRecommendationController *)self setLastUnusedAutoRouteBundleIdentifier:v13];
  id v17 = +[MRDDisplayMonitor sharedMonitor];
  if ([v17 displayOn])
  {
    id v18 = +[MRDDisplayMonitor sharedMonitor];
    id v19 = [v18 presentedBundleIdentifiers];
    unsigned int v20 = [v19 containsObject:v13];

    if (v20)
    {
      os_signpost_id_t v21 = [(MRDRouteRecommendationController *)self undoTimer];

      if (v21)
      {
        [(MRDRouteRecommendationController *)self setUndoTimer:0];
        os_signpost_id_t v22 = _MRLogForCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 138412290;
          id v25 = v13;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[MRDRRC] cancelling existing timer, %@ is in focus", (uint8_t *)&v24, 0xCu);
        }
      }
      goto LABEL_14;
    }
  }
  else
  {
  }
  id v23 = [(MRDRouteRecommendationController *)self undoTimer];

  if (!v23) {
    [(MRDRouteRecommendationController *)self setupTimerForRoute:v12 bundleIdentifier:v13];
  }
LABEL_14:
}

- (void)setupTimerForRoute:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[MRUserSettings currentSettings];
  unsigned int v9 = [v8 undoUnusedAutoRoutes];

  if (v9)
  {
    id v10 = +[MRUserSettings currentSettings];
    [v10 undoUnusedAutoRouteTimerDuration];
    double v12 = v11;

    if (v12 > 0.0)
    {
      id v13 = _MRLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v24 = v6;
        __int16 v25 = 2112;
        id v26 = v7;
        __int16 v27 = 2048;
        double v28 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[MRDRRC] Setting up timer for %@ (%@) for %f seconds", buf, 0x20u);
      }

      [(MRDRouteRecommendationController *)self setLastUnusedAutoRoute:v6];
      objc_initWeak((id *)buf, self);
      id v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      id v17 = sub_100179B0C;
      id v18 = &unk_10041FF30;
      id v19 = v7;
      unsigned int v20 = self;
      id v21 = v6;
      objc_copyWeak(&v22, (id *)buf);
      id v14 = +[MSVTimer timerWithInterval:0 repeats:&v15 block:v12];
      -[MRDRouteRecommendationController setUndoTimer:](self, "setUndoTimer:", v14, v15, v16, v17, v18);

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (BOOL)isRoutePlaying:(id)a3
{
  id v3 = a3;
  id v4 = +[MRDMediaRemoteServer server];
  id v5 = [v4 nowPlayingServer];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = objc_msgSend(v3, "nodes", 0);
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) avOutputDeviceIdentifier];
        double v11 = [v5 originClientForGroupLeaderOfDeviceUID:v10];

        LOBYTE(v10) = [v11 isPlaying];
        if (v10)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (void)clearUnusedAutoRoute
{
  [(MRDRouteRecommendationController *)self setLastUnusedAutoRoute:0];
  [(MRDRouteRecommendationController *)self setLastUnusedAutoRouteBundleIdentifier:0];

  [(MRDRouteRecommendationController *)self setUndoTimer:0];
}

- (void)openRoutePickerForRouteUID:(id)a3
{
  id v4 = a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDRRC] Long pressed - will open route picker for %@", (uint8_t *)&buf, 0xCu);
  }

  id v6 = objc_alloc_init((Class)sub_10017A144());
  id v7 = +[NSBundle mainBundle];
  uint64_t v8 = [v7 bundleIdentifier];
  [v6 setPresentingAppBundleID:v8];

  [v6 setStyle:2];
  if (MRAVOutputContextGetSharedAudioPresentationContext())
  {
    unsigned int v9 = (void *)MRAVOutputContextCopyUniqueIdentifier();
    [v6 setRoutingContextUID:v9];
  }
  [v6 setRouteUID:v4];
  objc_initWeak(&location, self);
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2050000000;
  uint64_t v10 = (void *)qword_10047E538;
  uint64_t v23 = qword_10047E538;
  if (!qword_10047E538)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    __int16 v25 = sub_10017AFB0;
    id v26 = &unk_100415FF8;
    __int16 v27 = &v20;
    sub_10017AFB0((uint64_t)&buf);
    uint64_t v10 = (void *)v21[3];
  }
  double v11 = v10;
  _Block_object_dispose(&v20, 8);
  double v12 = (MPMediaControls *)[[v11 alloc] initWithConfiguration:v6 shouldObserveRoutingContextUIDChanges:0];
  mediaControls = self->_mediaControls;
  self->_mediaControls = v12;

  long long v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  long long v16 = sub_10017A228;
  id v17 = &unk_1004171D0;
  objc_copyWeak(&v18, &location);
  [(MPMediaControls *)self->_mediaControls setDismissHandler:&v14];
  [(MPMediaControls *)self->_mediaControls present];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)route:(id)a3 endpoint:(id)a4 bundleIdentifier:(id)a5 emittedEvent:(unint64_t)a6
{
  uint64_t v10 = (__CFString *)a3;
  id v44 = a4;
  double v11 = (__CFString *)a5;
  double v12 = _MRLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    CFStringRef v46 = v10;
    __int16 v47 = 2112;
    CFStringRef v48 = v11;
    __int16 v49 = 2048;
    unint64_t v50 = a6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDRRC] route: %@ bundleIdentifier: %@, emittedEvent: %ld", buf, 0x20u);
  }
  unint64_t v43 = a6;

  long long v13 = +[MRDMediaBundleManager shared];
  long long v14 = [v13 cachedEligibilityOf:v11];

  id v42 = v14;
  unsigned int v15 = [v14 isEligible];
  uint64_t v41 = self;
  long long v16 = [(MRDRouteRecommendationController *)self focusMonitor];
  id v17 = [v16 bundlesInFocus];
  unsigned __int8 v18 = [v17 containsObject:v11];

  unsigned int v19 = [v44 isLocalEndpoint];
  uint64_t v20 = +[MRDDisplayMonitor sharedMonitor];
  if ([v20 homeScreenVisible])
  {
    unsigned int v21 = 1;
  }
  else
  {
    uint64_t v22 = +[MRDDisplayMonitor sharedMonitor];
    unsigned int v21 = [v22 controlCenterVisible];
  }
  uint64_t v23 = +[MRDDisplayMonitor sharedMonitor];
  unsigned int v24 = [v23 siriVisible];

  if (v18) {
    int v25 = 0;
  }
  else {
    int v25 = v21 & (v24 ^ 1);
  }
  uint64_t v26 = v19 & v15 & v25;
  __int16 v27 = _MRLogForCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    if (v26) {
      CFStringRef v28 = @"YES";
    }
    else {
      CFStringRef v28 = @"NO";
    }
    if (v19) {
      CFStringRef v29 = @"YES";
    }
    else {
      CFStringRef v29 = @"NO";
    }
    if (v15) {
      CFStringRef v30 = @"YES";
    }
    else {
      CFStringRef v30 = @"NO";
    }
    id v40 = v11;
    if (v25) {
      CFStringRef v31 = @"YES";
    }
    else {
      CFStringRef v31 = @"NO";
    }
    id v32 = v10;
    if (v24) {
      CFStringRef v33 = @"YES";
    }
    else {
      CFStringRef v33 = @"NO";
    }
    id v34 = [(MRDRouteRecommendationController *)v41 focusMonitor];
    id v35 = [v34 bundlesInFocus];
    *(_DWORD *)long long buf = 138413570;
    CFStringRef v46 = v28;
    __int16 v47 = 2112;
    CFStringRef v48 = v29;
    __int16 v49 = 2112;
    unint64_t v50 = (unint64_t)v30;
    __int16 v51 = 2112;
    CFStringRef v52 = v31;
    double v11 = v40;
    __int16 v53 = 2112;
    CFStringRef v54 = v33;
    uint64_t v10 = v32;
    __int16 v55 = 2112;
    v56 = v35;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[MRDRRC] eligible: %@, route: %@, app: %@, vis: %@ - siri: %@ - %@", buf, 0x3Eu);
  }
  if (v43 && v43 != 2)
  {
    if (v43 == 1)
    {
      __int16 v36 = v41;
      [(MRDRouteRecommendationController *)v41 handlePlaybackStartForEndpoint:v44 bundleIdentifier:v11 eligibleForRecommendationsOutsideApp:v26];
      uint64_t v37 = 5;
    }
    else
    {
      uint64_t v37 = 0;
      __int16 v36 = v41;
    }
    id v38 = [objc_alloc((Class)IRMediaEvent) initWithEventType:v37 eventSubType:0];
    [v38 setBundleID:v11];
    [v38 setIsOutsideApp:v26];
    BOOL v39 = [(MRDRouteRecommendationController *)v36 recommender];
    [v39 addEvent:v38 forRouteCandidate:v10];
  }
}

- (void)handlePlaybackStartForEndpoint:(id)a3 bundleIdentifier:(id)a4 eligibleForRecommendationsOutsideApp:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[MRIRRoute routeWithEndpoint:v8];
  double v11 = [(MRDRouteRecommendationController *)self lastUnusedAutoRoute];
  unsigned int v12 = [v11 isEqual:v10];

  long long v13 = _MRLogForCategory();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      int v19 = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[MRDRRC] playbackStarted ForEndpoint: %@ bundleIdentifier: %@, invalidating timer", (uint8_t *)&v19, 0x16u);
    }

    [(MRDRouteRecommendationController *)self clearUnusedAutoRoute];
  }
  else
  {
    if (v14)
    {
      int v19 = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[MRDRRC] playbackStarted forUnrelatedEndpoint: %@ bundleIdentifier: %@", (uint8_t *)&v19, 0x16u);
    }
  }
  unsigned int v15 = +[MRUserSettings currentSettings];
  unsigned __int8 v16 = [v15 showRouteRecommendationsOutsideApps];

  if ((v16 & 1) == 0)
  {
    unsigned __int8 v18 = _MRLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[MRDRRC] requestCurrentContextWithBundleID not enabled", (uint8_t *)&v19, 2u);
    }
    goto LABEL_15;
  }
  if (v5)
  {
    id v17 = _MRLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[MRDRRC] playback started for %@-%@; will request context update",
        (uint8_t *)&v19,
        0x16u);
    }

    unsigned __int8 v18 = [(MRDRouteRecommendationController *)self recommender];
    [v18 requestCurrentContextWithBundleID:v9];
LABEL_15:
  }
}

- (void)ingestMockedRecommendation:(id)a3 classification:(int64_t)a4 isCallToAction:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = +[MRIRRoute debugRouteWithDebugIdentifier:a3];
  id v9 = objc_alloc_init(MRDIRRouteRecommendation);
  [(MRDIRRouteRecommendation *)v9 setRoute:v8];
  [(MRDIRRouteRecommendation *)v9 setClassification:a4];
  [(MRDIRRouteRecommendation *)v9 setCallToAction:v5];
  double v11 = v9;
  uint64_t v10 = +[NSArray arrayWithObjects:&v11 count:1];
  [(MRDRouteRecommendationController *)self didReceiveNewRecommendations:v10 forBundleIdentifier:0];
}

- (id)_updateMediaControlsBlob:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_10017A144();
  id v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:0];
  if (!v8)
  {
    id v13 = v6;
    goto LABEL_12;
  }
  id v9 = [(MRDRouteRecommendationController *)self nowPlayingStateMonitor];
  uint64_t v10 = [v9 nowPlayingApp];

  [v8 setNowPlayingAppBundleID:v10];
  double v11 = [(MRDRouteRecommendationController *)self visibleMediaApps];
  [v8 setVisibleMediaApps:v11];

  if ([v7 isEqualToString:@"com.apple.MediaRemoteUI"])
  {
    id v12 = +[MRSystemMediaBundles systemMediaBundleIDForBundleID:v10 type:1];
  }
  else
  {
    if ([v7 isEqualToString:@"com.apple.mediaremoted"])
    {
      BOOL v14 = [(MRDRouteRecommendationController *)self visibleMediaApps];
      if ([v14 count] == (id)1)
      {
        unsigned int v15 = [(MRDRouteRecommendationController *)self visibleMediaApps];
        unsigned __int8 v16 = [v15 firstObject];
      }
      else
      {
        unsigned __int8 v16 = 0;
      }

      if (!v16) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    id v12 = v7;
  }
  unsigned __int8 v16 = v12;
  if (v12)
  {
LABEL_10:
    id v17 = +[MRDMediaBundleManager shared];
    unsigned __int8 v18 = [v17 cachedEligibilityOf:v16];

    objc_msgSend(v8, "setDonatingAppEligible:", objc_msgSend(v18, "isEligible"));
    [v8 setDonatingAppBundleID:v16];
  }
LABEL_11:
  id v13 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];

LABEL_12:

  return v13;
}

- (void)setRecommender:(id)a3
{
}

- (void)setValidator:(id)a3
{
}

- (void)setFocusMonitor:(id)a3
{
}

- (void)setMediaActivityManager:(id)a3
{
}

- (MRDNowPlayingStateMonitor)nowPlayingStateMonitor
{
  return self->_nowPlayingStateMonitor;
}

- (void)setNowPlayingStateMonitor:(id)a3
{
}

- (MRAVRoutingDiscoverySession)discoverySession
{
  return self->_discoverySession;
}

- (void)setDiscoverySession:(id)a3
{
}

- (void)setRoutedBackgroundActivityManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (MRAVEndpoint)activeSystemEndpoint
{
  return self->_activeSystemEndpoint;
}

- (void)setActiveSystemEndpoint:(id)a3
{
}

- (MRAVEndpoint)localSystemEndpoint
{
  return self->_localSystemEndpoint;
}

- (void)setLocalSystemEndpoint:(id)a3
{
}

- (MPMediaControls)mediaControls
{
  return self->_mediaControls;
}

- (void)setMediaControls:(id)a3
{
}

- (MRRouteRepresentable)lastDonatedPickerChoice
{
  return self->_lastDonatedPickerChoice;
}

- (void)setLastDonatedPickerChoice:(id)a3
{
}

- (MRRouteRepresentable)lastUnusedAutoRoute
{
  return self->_lastUnusedAutoRoute;
}

- (void)setLastUnusedAutoRoute:(id)a3
{
}

- (void)setLastUnusedAutoRouteBundleIdentifier:(id)a3
{
}

- (NSArray)visibleMediaApps
{
  return self->_visibleMediaApps;
}

- (MSVTimer)undoTimer
{
  return self->_undoTimer;
}

- (void)setUndoTimer:(id)a3
{
}

- (NSMutableArray)signpostIds
{
  return self->_signpostIds;
}

- (void)setSignpostIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostIds, 0);
  objc_storeStrong((id *)&self->_undoTimer, 0);
  objc_storeStrong((id *)&self->_visibleMediaApps, 0);
  objc_storeStrong((id *)&self->_lastUnusedAutoRouteBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUnusedAutoRoute, 0);
  objc_storeStrong((id *)&self->_lastDonatedPickerChoice, 0);
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_storeStrong((id *)&self->_localSystemEndpoint, 0);
  objc_storeStrong((id *)&self->_activeSystemEndpoint, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_recommendedRoutes, 0);
  objc_storeStrong((id *)&self->_routedBackgroundActivityManager, 0);
  objc_storeStrong((id *)&self->_discoverySession, 0);
  objc_storeStrong((id *)&self->_nowPlayingStateMonitor, 0);
  objc_storeStrong((id *)&self->_mediaActivityManager, 0);
  objc_storeStrong((id *)&self->_focusMonitor, 0);
  objc_storeStrong((id *)&self->_validator, 0);

  objc_storeStrong((id *)&self->_recommender, 0);
}

@end