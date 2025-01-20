@interface MRDUIActivityServer
- (BOOL)hasNowPlayingAssertion;
- (MRDActiveUserController)activeUserController;
- (MRDUIActivityController)activityController;
- (MRDUIActivityServer)init;
- (MRDiscoveredGroupSession)discoveredSession;
- (MRPlayerPath)electedPlayer;
- (MSVTimer)activeUserChangedTimer;
- (MSVTimer)nowPlayingActivityAssertionEndTimer;
- (NSArray)activeRecommendationActivities;
- (NSDate)nowPlayingActivityAssertionEndDate;
- (NSMutableDictionary)routeRecommendationActivities;
- (NSMutableDictionary)suppressedBundleIdentifiers;
- (NSSet)activeRecommendations;
- (NSString)nowPlayingActivityUserIdentifier;
- (OS_dispatch_queue)queue;
- (id)combinedSuppressedBundleIdentifiers;
- (void)_activeUserDidChange:(id)a3 previous:(id)a4;
- (void)_handleElectedPlayerDidChangeNotification:(id)a3;
- (void)_handleIsPlayingDidChangeNotification:(id)a3;
- (void)_handlePlaybackQueueDidChangeNotification:(id)a3;
- (void)acquireGroupSessionLowPowerPlatterAssertionWithReply:(id)a3;
- (void)acquireGroupSessionNearbyAssertionForSession:(id)a3 withReply:(id)a4;
- (void)acquireLockScreenControlsAssertionWithReply:(id)a3;
- (void)acquireNowPlayingActivityAssertionForRouteIdentifier:(id)a3 withDuration:(int64_t)a4 preferredState:(int64_t)a5 withReply:(id)a6;
- (void)acquireQuickControlsAssertionWithReply:(id)a3;
- (void)acquireRouteRecommendationAssertionForIdentifiers:(id)a3 withReply:(id)a4;
- (void)acquireScreenMirroringQuickControlsAssertionWithReply:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)contextForActivityIdentifier:(id)a3 reply:(id)a4;
- (void)evaluateState;
- (void)nearbyGroupSessionDismissed:(id)a3;
- (void)nowPlayingEnded;
- (void)releaseGroupSessionLowPowerPlatterAssertionWithReply:(id)a3;
- (void)releaseGroupSessionNearbyAssertionWithReply:(id)a3;
- (void)releaseLockScreenControlsAssertionWithReply:(id)a3;
- (void)releaseQuickControlsAssertionWithReply:(id)a3;
- (void)releaseRouteRecommendationAssertionWithReply:(id)a3;
- (void)releaseScreenMirroringQuickControlsAssertionWithReply:(id)a3;
- (void)releaseTimeBasedNowPlayingActivityAssertions;
- (void)routeRecommendationDismissed;
- (void)setActiveRecommendationActivities:(id)a3;
- (void)setActiveRecommendations:(id)a3;
- (void)setActiveUserChangedTimer:(id)a3;
- (void)setActiveUserController:(id)a3;
- (void)setDiscoveredSession:(id)a3;
- (void)setElectedPlayer:(id)a3;
- (void)setNowPlayingActivityAssertionEndDate:(id)a3;
- (void)setNowPlayingActivityAssertionEndTimer:(id)a3;
- (void)setNowPlayingActivityUserIdentifier:(id)a3;
- (void)setPreferredState:(int64_t)a3 reply:(id)a4;
- (void)setRouteRecommendationActivities:(id)a3;
- (void)setSuppressedBundleIdentifiers:(id)a3;
- (void)suppressPresentationOverBundleIdentifiers:(id)a3 reply:(id)a4;
- (void)updateActiveUser;
@end

@implementation MRDUIActivityServer

- (MRDUIActivityServer)init
{
  v16.receiver = self;
  v16.super_class = (Class)MRDUIActivityServer;
  v2 = [(MRDUIActivityServer *)&v16 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = +[MRDUIServer sharedServer];
    v5 = [v4 messageQueue];
    dispatch_queue_t v6 = dispatch_queue_create_with_target_V2("com.apple.MRDUIActivityServer.queue", v3, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = +[NSDate distantPast];
    nowPlayingActivityAssertionEndDate = v2->_nowPlayingActivityAssertionEndDate;
    v2->_nowPlayingActivityAssertionEndDate = (NSDate *)v8;

    v10 = +[MRDUIServer sharedServer];
    [v10 addClientObserver:v2];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"_handleElectedPlayerDidChangeNotification:" name:kMRMediaRemoteElectedPlayerDidChangeNotification object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v2 selector:"_handleIsPlayingDidChangeNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification object:0];

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v2 selector:"_handlePlaybackQueueDidChangeNotification:" name:kMRPlayerPlaybackQueueChangedNotification object:0];

    v14 = (void *)MRSupportsSystemUIActivitiesBlock;
    MRSupportsSystemUIActivitiesBlock = &stru_1004170F8;
  }
  return v2;
}

- (void)acquireLockScreenControlsAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = +[MRDUIServer sharedServer];
  dispatch_queue_t v6 = +[NSXPCConnection currentConnection];
  id v7 = [v5 clientForConnection:v6];

  [v7 setHasLockScreenAssertion:1];
  [(MRDUIActivityServer *)self evaluateState];
  v4[2](v4);
}

- (void)releaseLockScreenControlsAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = +[MRDUIServer sharedServer];
  dispatch_queue_t v6 = +[NSXPCConnection currentConnection];
  id v7 = [v5 clientForConnection:v6];

  [v7 setHasLockScreenAssertion:0];
  [(MRDUIActivityServer *)self evaluateState];
  v4[2](v4);
}

- (void)acquireQuickControlsAssertionWithReply:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = +[MRDUIServer sharedServer];
  dispatch_queue_t v6 = +[NSXPCConnection currentConnection];
  id v9 = [v5 clientForConnection:v6];

  [v9 setHasQuickControlsAssertion:1];
  [(MRDUIActivityServer *)self evaluateState];
  id v7 = [(MRDUIActivityServer *)self activityController];
  uint64_t v8 = [v7 nowPlayingActivityIdentifier];
  v4[2](v4, v8);
}

- (void)releaseQuickControlsAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = +[MRDUIServer sharedServer];
  dispatch_queue_t v6 = +[NSXPCConnection currentConnection];
  id v7 = [v5 clientForConnection:v6];

  [v7 setHasQuickControlsAssertion:0];
  [(MRDUIActivityServer *)self evaluateState];
  v4[2](v4);
}

- (void)acquireScreenMirroringQuickControlsAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = +[MRDUIServer sharedServer];
  dispatch_queue_t v6 = +[NSXPCConnection currentConnection];
  id v7 = [v5 clientForConnection:v6];

  [v7 setHasScreenMirroringAssertion:1];
  [(MRDUIActivityServer *)self evaluateState];
  v4[2](v4);
}

- (void)releaseScreenMirroringQuickControlsAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = +[MRDUIServer sharedServer];
  dispatch_queue_t v6 = +[NSXPCConnection currentConnection];
  id v7 = [v5 clientForConnection:v6];

  [v7 setHasScreenMirroringAssertion:0];
  [(MRDUIActivityServer *)self evaluateState];
  v4[2](v4);
}

- (void)acquireGroupSessionNearbyAssertionForSession:(id)a3 withReply:(id)a4
{
  dispatch_queue_t v6 = (void (**)(void))a4;
  id v7 = a3;
  uint64_t v8 = +[MRDUIServer sharedServer];
  id v9 = +[NSXPCConnection currentConnection];
  id v10 = [v8 clientForConnection:v9];

  [(MRDUIActivityServer *)self setDiscoveredSession:v7];
  [v10 setHasGroupSessionNearbyAssertion:1];
  [(MRDUIActivityServer *)self evaluateState];
  v6[2](v6);
}

- (void)releaseGroupSessionNearbyAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = +[MRDUIServer sharedServer];
  dispatch_queue_t v6 = +[NSXPCConnection currentConnection];
  id v7 = [v5 clientForConnection:v6];

  [v7 setHasGroupSessionNearbyAssertion:0];
  [(MRDUIActivityServer *)self evaluateState];
  v4[2](v4);
}

- (void)acquireRouteRecommendationAssertionForIdentifiers:(id)a3 withReply:(id)a4
{
  dispatch_queue_t v6 = (void (**)(void))a4;
  id v7 = a3;
  uint64_t v8 = +[MRDUIServer sharedServer];
  id v9 = +[NSXPCConnection currentConnection];
  id v10 = [v8 clientForConnection:v9];

  [v10 setRouteRecommendationIdentifiers:v7];
  [v10 setHasRouteRecommendationAssertion:1];
  [(MRDUIActivityServer *)self evaluateState];
  v6[2](v6);
}

- (void)acquireNowPlayingActivityAssertionForRouteIdentifier:(id)a3 withDuration:(int64_t)a4 preferredState:(int64_t)a5 withReply:(id)a6
{
  id v34 = a3;
  id v10 = (void (**)(void))a6;
  v11 = +[MRDUIServer sharedServer];
  v12 = +[NSXPCConnection currentConnection];
  v13 = [v11 clientForConnection:v12];

  v14 = [v13 bundleID];
  v15 = +[NSString stringWithFormat:@"NowPlayingActivityAssertion for client: %@<%p>, duration: %ld", v14, v13, a4];

  if (([v34 isEqualToString:MRNowPlayingActivityActiveRouteIdentifier] & 1) == 0)
  {
    if ([v34 isEqualToString:MRNowPlayingActivityLocalRouteIdentifier]) {
      objc_super v16 = 0;
    }
    else {
      objc_super v16 = v34;
    }
    id v17 = v16;
    v18 = +[MRDMediaRemoteServer server];
    [v18 routingServer];
    v33 = v13;
    v19 = v10;
    v21 = int64_t v20 = a5;
    v22 = [v21 systemEndpointController];
    id v23 = [objc_alloc((Class)MRUpdateActiveSystemEndpointRequest) initWithOutputDeviceUID:v17 type:0 reason:v15];

    [v22 updateSystemEndpointForRequest:v23];
    a5 = v20;
    id v10 = v19;
    v13 = v33;
  }
  if (a4 == 2)
  {
    double v24 = 480.0;
  }
  else
  {
    if (a4 != 1)
    {
      if (!a4) {
        [v13 setHasNowPlayingActivityAssertion:1];
      }
      goto LABEL_15;
    }
    double v24 = 10.0;
  }
  v25 = +[NSDate dateWithTimeIntervalSinceNow:v24];
  v26 = [(MRDUIActivityServer *)self nowPlayingActivityAssertionEndDate];
  [v25 timeIntervalSinceDate:v26];
  double v28 = v27;

  if (v28 > 0.0) {
    [(MRDUIActivityServer *)self setNowPlayingActivityAssertionEndDate:v25];
  }

LABEL_15:
  v29 = [(MRDUIActivityServer *)self activityController];
  v30 = [v29 nowPlayingActivityIdentifier];

  v31 = [(MRDUIActivityServer *)self activityController];
  v32 = [(MRDUIActivityServer *)self combinedSuppressedBundleIdentifiers];
  if (v30) {
    [v31 updateNowPlayingActivityState:a5 suppressedBundleIdentifiers:v32];
  }
  else {
    [v31 startNowPlayingActivityWithPreferredState:a5 suppressedBundleIdentifiers:v32];
  }

  [(MRDUIActivityServer *)self updateActiveUser];
  [(MRDUIActivityServer *)self evaluateState];
  v10[2](v10);
}

- (void)updateActiveUser
{
  v3 = [(MRDUIActivityServer *)self activeUserController];
  v4 = [(MRDUIActivityServer *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100038FEC;
  v8[3] = &unk_100417120;
  v8[4] = self;
  [v3 observeActiveUserWithQueue:v4 handler:v8];

  v5 = [(MRDUIActivityServer *)self activeUserController];
  dispatch_queue_t v6 = [(MRDUIActivityServer *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100039008;
  v7[3] = &unk_100415E18;
  v7[4] = self;
  [v5 fetchActiveUserWithQueue:v6 completion:v7];
}

- (void)setPreferredState:(int64_t)a3 reply:(id)a4
{
  dispatch_queue_t v6 = (void (**)(void))a4;
  id v7 = +[MRDUIServer sharedServer];
  uint64_t v8 = +[NSXPCConnection currentConnection];
  id v9 = [v7 clientForConnection:v8];

  id v10 = _MRLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v9 bundleID];
    int v16 = 138412802;
    id v17 = v11;
    __int16 v18 = 2048;
    v19 = v9;
    __int16 v20 = 2048;
    int64_t v21 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[MRDUIActivityServer] Client %@<%p> setting preferred state: %ld", (uint8_t *)&v16, 0x20u);
  }
  v12 = [(MRDUIActivityServer *)self activityController];
  v13 = [v12 nowPlayingActivityIdentifier];

  if (v13)
  {
    v14 = [(MRDUIActivityServer *)self activityController];
    v15 = [(MRDUIActivityServer *)self combinedSuppressedBundleIdentifiers];
    [v14 updateNowPlayingActivityState:a3 suppressedBundleIdentifiers:v15];
  }
  v6[2](v6);
}

- (void)releaseTimeBasedNowPlayingActivityAssertions
{
  id v3 = +[NSDate distantPast];
  [(MRDUIActivityServer *)self setNowPlayingActivityAssertionEndDate:v3];
}

- (id)combinedSuppressedBundleIdentifiers
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  suppressedBundleIdentifiers = self->_suppressedBundleIdentifiers;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000393D0;
  v8[3] = &unk_100417148;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)suppressedBundleIdentifiers enumerateKeysAndObjectsUsingBlock:v8];
  dispatch_queue_t v6 = [v5 allObjects];

  return v6;
}

- (void)suppressPresentationOverBundleIdentifiers:(id)a3 reply:(id)a4
{
  id v19 = a3;
  dispatch_queue_t v6 = (void (**)(void))a4;
  id v7 = +[MRDUIServer sharedServer];
  uint64_t v8 = +[NSXPCConnection currentConnection];
  id v9 = [v7 clientForConnection:v8];

  if (!self->_suppressedBundleIdentifiers)
  {
    id v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    suppressedBundleIdentifiers = self->_suppressedBundleIdentifiers;
    self->_suppressedBundleIdentifiers = v10;
  }
  id v12 = [v19 copy];
  v13 = self->_suppressedBundleIdentifiers;
  v14 = [v9 bundleID];
  [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];

  v15 = [(MRDUIActivityServer *)self activityController];
  int v16 = [v15 nowPlayingActivityIdentifier];

  if (v16)
  {
    id v17 = [(MRDUIActivityServer *)self activityController];
    __int16 v18 = [(MRDUIActivityServer *)self combinedSuppressedBundleIdentifiers];
    [v17 updateNowPlayingActivityState:1 suppressedBundleIdentifiers:v18];
  }
  v6[2](v6);
}

- (void)releaseRouteRecommendationAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  id v5 = +[MRDUIServer sharedServer];
  dispatch_queue_t v6 = +[NSXPCConnection currentConnection];
  id v7 = [v5 clientForConnection:v6];

  [v7 setRouteRecommendationIdentifiers:&__NSArray0__struct];
  [v7 setHasRouteRecommendationAssertion:0];
  [(MRDUIActivityServer *)self evaluateState];
  v4[2](v4);
}

- (void)routeRecommendationDismissed
{
  v2 = +[MRDUIServer sharedServer];
  id v3 = [v2 clients];
  v4 = objc_msgSend(v3, "msv_filter:", &stru_100417188);

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "routeRecommendationDismissed", (void)v10);
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)nowPlayingEnded
{
  id v2 = [(MRDUIActivityServer *)self activeUserController];
  [v2 stopObserving];
}

- (void)contextForActivityIdentifier:(id)a3 reply:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v10 = [(MRDUIActivityServer *)self activityController];
  id v9 = [v10 contextForActivityIdentifier:v8];

  (*((void (**)(id, void *))a4 + 2))(v7, v9);
}

- (void)acquireGroupSessionLowPowerPlatterAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  id v5 = +[MRDUIServer sharedServer];
  id v6 = +[NSXPCConnection currentConnection];
  id v7 = [v5 clientForConnection:v6];

  [v7 setHasGroupSessionLowPowerPlatterAssertion:1];
  [(MRDUIActivityServer *)self evaluateState];
  v4[2](v4);
}

- (void)releaseGroupSessionLowPowerPlatterAssertionWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  id v5 = +[MRDUIServer sharedServer];
  id v6 = +[NSXPCConnection currentConnection];
  id v7 = [v5 clientForConnection:v6];

  [v7 setHasGroupSessionLowPowerPlatterAssertion:0];
  [(MRDUIActivityServer *)self evaluateState];
  v4[2](v4);
}

- (void)nearbyGroupSessionDismissed:(id)a3
{
  id v3 = a3;
  v4 = +[MRDUIServer sharedServer];
  id v5 = [v4 clients];
  id v6 = objc_msgSend(v5, "msv_filter:", &stru_1004171A8);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v11), "nearbyGroupSessionDismissed:", v3, (void)v12);
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)hasNowPlayingAssertion
{
  id v2 = +[MRDUIServer sharedServer];
  id v3 = [v2 clients];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "hasQuickControlsAssertion", (void)v12) & 1) != 0
          || ([v9 hasLockScreenAssertion] & 1) != 0
          || ([v9 hasNowPlayingActivityAssertion] & 1) != 0)
        {
          BOOL v10 = 1;
          goto LABEL_14;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      BOOL v10 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_14:

  return v10;
}

- (void)evaluateState
{
  id v2 = +[MRDUIServer sharedServer];
  id v3 = [v2 clients];

  id v66 = objc_alloc_init((Class)NSMutableArray);
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = v3;
  id v69 = [obj countByEnumeratingWithState:&v81 objects:v93 count:16];
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  if (v69)
  {
    uint64_t v68 = *(void *)v82;
    do
    {
      for (i = 0; i != v69; i = (char *)i + 1)
      {
        uint64_t v71 = v4;
        uint64_t v72 = v7;
        if (*(void *)v82 != v68) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        unsigned int v12 = [v11 hasQuickControlsAssertion];
        unsigned int v13 = [v11 hasLockScreenAssertion];
        unsigned int v14 = [v11 hasScreenMirroringAssertion];
        unsigned int v15 = [v11 hasGroupSessionNearbyAssertion];
        if ([v11 hasRouteRecommendationAssertion])
        {
          [v11 routeRecommendationIdentifiers];
          uint64_t v67 = v6;
          v17 = uint64_t v16 = v5;
          [v66 addObjectsFromArray:v17];

          uint64_t v5 = v16;
          uint64_t v6 = v67;
        }
        v8 += v12;
        v9 += v13;
        uint64_t v7 = v72 + v14;
        v6 += v15;
        v5 += [v11 hasGroupSessionLowPowerPlatterAssertion];
        uint64_t v4 = v71 + [v11 hasNowPlayingActivityAssertion];
      }
      id v69 = [obj countByEnumeratingWithState:&v81 objects:v93 count:16];
    }
    while (v69);
  }
  uint64_t v18 = v6;

  if (v9 > 0 || v8 > 0 || v4 >= 1)
  {
    id v19 = self;
    double v24 = [(MRDUIActivityServer *)self activityController];
    v25 = [v24 nowPlayingActivityIdentifier];

    if (v25) {
      goto LABEL_20;
    }
    id v23 = [(MRDUIActivityServer *)self activityController];
    v26 = [(MRDUIActivityServer *)self combinedSuppressedBundleIdentifiers];
    [v23 startNowPlayingActivityWithPreferredState:0 suppressedBundleIdentifiers:v26];
  }
  else
  {
    id v19 = self;
    __int16 v20 = [(MRDUIActivityServer *)self nowPlayingActivityAssertionEndDate];
    [v20 timeIntervalSinceNow];
    double v22 = v21;

    if (v22 <= 0.0)
    {
      id v23 = [(MRDUIActivityServer *)self activityController];
      [v23 endNowPlayingActivity];
    }
    else
    {
      id v23 = _MRLogForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        sub_10032B0A8(self, v23);
      }
    }
  }

LABEL_20:
  double v27 = [(MRDUIActivityServer *)v19 activityController];
  double v28 = v27;
  if (v7 < 1) {
    [v27 endMirroringActivity];
  }
  else {
    [v27 startMirroringActivity];
  }

  v29 = [(MRDUIActivityServer *)v19 activityController];
  v30 = v29;
  if (v18 < 1) {
    [v29 endGroupSessionNearbyActivity];
  }
  else {
    [v29 startGroupSessionNearbyActivity:v19->_discoveredSession];
  }

  v31 = [(MRDUIActivityServer *)v19 activityController];
  v32 = v31;
  if (v5 < 1) {
    [v31 endGroupSessionLowPowerPlatterActivity];
  }
  else {
    [v31 startGroupSessionLowPowerPlatterActivity];
  }

  v33 = [(MRDUIActivityServer *)v19 activeRecommendationActivities];
  unsigned __int8 v34 = [v66 isEqualToArray:v33];

  if ((v34 & 1) == 0)
  {
    v35 = [(MRDUIActivityServer *)v19 activeRecommendationActivities];
    v36 = [(MRDUIActivityServer *)v19 routeRecommendationActivities];

    if (!v36)
    {
      v37 = objc_opt_new();
      [(MRDUIActivityServer *)v19 setRouteRecommendationActivities:v37];
    }
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v38 = v35;
    id v39 = [v38 countByEnumeratingWithState:&v77 objects:v92 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v78;
      do
      {
        for (j = 0; j != v40; j = (char *)j + 1)
        {
          if (*(void *)v78 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = *(void **)(*((void *)&v77 + 1) + 8 * (void)j);
          v44 = [(MRDUIActivityServer *)v19 routeRecommendationActivities];
          v45 = [v44 objectForKeyedSubscript:v43];

          if (v45)
          {
            if ([v66 containsObject:v43]) {
              goto LABEL_45;
            }
            v46 = [(MRDUIActivityServer *)self activityController];
            [v46 endRouteRecommendationActivityFor:v45];

            v47 = _MRLogForCategory();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v86 = v43;
              __int16 v87 = 2112;
              v88 = v45;
              _os_log_debug_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "[MRDUIActivityServer] >>+ ending recommendation for route %@ with LA id: %@", buf, 0x16u);
            }

            v48 = [(MRDUIActivityServer *)self routeRecommendationActivities];
            [v48 setObject:0 forKeyedSubscript:v43];
          }
          else
          {
            v48 = _MRLogForCategory();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v86 = v43;
              _os_log_debug_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "[MRDUIActivityServer] >>+ could not find activity id for %@", buf, 0xCu);
            }
          }

LABEL_45:
          id v19 = self;
        }
        id v40 = [v38 countByEnumeratingWithState:&v77 objects:v92 count:16];
      }
      while (v40);
    }

    v49 = _MRLogForCategory();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      sub_10032B020((uint64_t)obj, (uint64_t)v66, v49);
    }

    id v50 = v66;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v51 = [v50 countByEnumeratingWithState:&v73 objects:v91 count:16];
    if (v51)
    {
      id v52 = v51;
      uint64_t v53 = *(void *)v74;
      double v54 = 0.0;
      do
      {
        for (k = 0; k != v52; k = (char *)k + 1)
        {
          if (*(void *)v74 != v53) {
            objc_enumerationMutation(v50);
          }
          v56 = *(void **)(*((void *)&v73 + 1) + 8 * (void)k);
          v57 = [(MRDUIActivityServer *)v19 routeRecommendationActivities];
          v58 = [v57 objectForKeyedSubscript:v56];

          v59 = [(MRDUIActivityServer *)v19 activityController];
          v60 = v59;
          if (v58)
          {
            [v59 setRouteRecommendationRelevanceScore:v58 activityIdentifier:v54];
            v61 = v60;
          }
          else
          {
            v61 = [v59 startRouteRecommendationActivityFor:v56 relevanceScore:v54];

            v62 = _MRLogForCategory();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v86 = v61;
              __int16 v87 = 2112;
              v88 = v56;
              __int16 v89 = 2048;
              double v90 = -v54;
              _os_log_debug_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "[MRDUIActivityServer] >>+ %@ for AVOD %@ (%f)", buf, 0x20u);
            }

            v63 = [(MRDUIActivityServer *)self routeRecommendationActivities];
            [v63 setObject:v61 forKeyedSubscript:v56];
          }
          double v54 = v54 + -1.0;

          id v19 = self;
        }
        id v52 = [v50 countByEnumeratingWithState:&v73 objects:v91 count:16];
      }
      while (v52);
    }
    v64 = +[NSSet setWithArray:v50];
    [(MRDUIActivityServer *)v19 setActiveRecommendations:v64];

    [(MRDUIActivityServer *)v19 setActiveRecommendationActivities:v50];
  }
}

- (MRDUIActivityController)activityController
{
  activityController = self->_activityController;
  if (!activityController)
  {
    uint64_t v4 = objc_alloc_init(MRDUIActivityController);
    uint64_t v5 = self->_activityController;
    self->_activityController = v4;

    [(MRDUIActivityController *)self->_activityController setDelegate:self];
    activityController = self->_activityController;
  }

  return activityController;
}

- (void)setNowPlayingActivityAssertionEndDate:(id)a3
{
  id v5 = a3;
  uint64_t v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    nowPlayingActivityAssertionEndDate = self->_nowPlayingActivityAssertionEndDate;
    *(_DWORD *)buf = 138412546;
    unsigned int v15 = nowPlayingActivityAssertionEndDate;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDUIActivityServer] Update now playing activity end date from: %@ -> %@", buf, 0x16u);
  }

  objc_storeStrong((id *)&self->_nowPlayingActivityAssertionEndDate, a3);
  [(MSVTimer *)self->_nowPlayingActivityAssertionEndTimer invalidate];
  [v5 timeIntervalSinceNow];
  double v9 = v8 + 1.0;
  if (v8 + 1.0 > 0.0)
  {
    objc_initWeak((id *)buf, self);
    BOOL v10 = [(MRDUIActivityServer *)self queue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003A658;
    v12[3] = &unk_1004171D0;
    objc_copyWeak(&v13, (id *)buf);
    long long v11 = +[MSVTimer timerWithInterval:0 repeats:v10 queue:v12 block:v9];
    [(MRDUIActivityServer *)self setNowPlayingActivityAssertionEndTimer:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_handleElectedPlayerDidChangeNotification:(id)a3
{
  uint64_t v4 = [a3 playerPath];
  id v5 = [(MRDUIActivityServer *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003A7B8;
  v7[3] = &unk_1004158D8;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_handleIsPlayingDidChangeNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v5 = MRGetPlayerPathFromUserInfo();

  id v6 = [(MRDUIActivityServer *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003A9B4;
  v8[3] = &unk_1004158D8;
  id v9 = v5;
  BOOL v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)_handlePlaybackQueueDidChangeNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v5 = MRGetPlayerPathFromUserInfo();

  id v6 = [(MRDUIActivityServer *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003AB68;
  v8[3] = &unk_1004158D8;
  id v9 = v5;
  BOOL v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)_activeUserDidChange:(id)a3 previous:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v7;
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRDUIActivityServer] Active user changed from %@ to %@", buf, 0x16u);
  }

  id v9 = [(MRDUIActivityServer *)self activityController];
  BOOL v10 = [v9 nowPlayingActivityIdentifier];

  long long v11 = +[MRDMediaRemoteServer server];
  unsigned int v12 = [v11 routingServer];
  id v13 = [v12 systemEndpointController];
  unsigned int v14 = [v13 activeOutputDeviceUID];

  if (v7)
  {
    unsigned int v15 = [(MRDUIActivityServer *)self nowPlayingActivityUserIdentifier];
    unsigned __int8 v16 = [v7 isEqualToString:v15];

    char v17 = v16 ^ 1;
    if (v6)
    {
LABEL_5:
      uint64_t v18 = [(MRDUIActivityServer *)self nowPlayingActivityUserIdentifier];
      unsigned __int8 v19 = [v6 isEqualToString:v18];

      char v20 = v19 ^ 1;
      goto LABEL_8;
    }
  }
  else
  {
    char v17 = 1;
    if (v6) {
      goto LABEL_5;
    }
  }
  char v20 = 1;
LABEL_8:
  if (v10) {
    BOOL v21 = v14 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  if (v21) {
    char v22 = 1;
  }
  else {
    char v22 = v17;
  }
  if (v22)
  {
    if (!v10) {
      char v20 = 1;
    }
    if ((v20 & 1) == 0)
    {
      id v23 = _MRLogForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[MRDUIActivityServer] Invalidating ASE reset timer because initial user is active", buf, 2u);
      }

      [(MRDUIActivityServer *)self setActiveUserChangedTimer:0];
    }
  }
  else
  {
    double v24 = _MRLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[MRDUIActivityServer] Scheduling ASE reset timer because initial user is not active", buf, 2u);
    }

    v25 = +[MRUserSettings currentSettings];
    [v25 activeUserTimeoutInterval];
    double v27 = v26;

    objc_initWeak((id *)buf, self);
    double v28 = [(MRDUIActivityServer *)self queue];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10003AFD8;
    v30[3] = &unk_1004171D0;
    objc_copyWeak(&v31, (id *)buf);
    v29 = +[MSVTimer timerWithInterval:0 repeats:v28 queue:v30 block:v27];
    [(MRDUIActivityServer *)self setActiveUserChangedTimer:v29];

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDUIActivityServer *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003B1CC;
  v7[3] = &unk_1004158D8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MRPlayerPath)electedPlayer
{
  return self->_electedPlayer;
}

- (void)setElectedPlayer:(id)a3
{
}

- (MRDiscoveredGroupSession)discoveredSession
{
  return self->_discoveredSession;
}

- (void)setDiscoveredSession:(id)a3
{
}

- (NSSet)activeRecommendations
{
  return self->_activeRecommendations;
}

- (void)setActiveRecommendations:(id)a3
{
}

- (NSArray)activeRecommendationActivities
{
  return self->_activeRecommendationActivities;
}

- (void)setActiveRecommendationActivities:(id)a3
{
}

- (NSMutableDictionary)routeRecommendationActivities
{
  return self->_routeRecommendationActivities;
}

- (void)setRouteRecommendationActivities:(id)a3
{
}

- (NSMutableDictionary)suppressedBundleIdentifiers
{
  return self->_suppressedBundleIdentifiers;
}

- (void)setSuppressedBundleIdentifiers:(id)a3
{
}

- (NSDate)nowPlayingActivityAssertionEndDate
{
  return self->_nowPlayingActivityAssertionEndDate;
}

- (MSVTimer)nowPlayingActivityAssertionEndTimer
{
  return self->_nowPlayingActivityAssertionEndTimer;
}

- (void)setNowPlayingActivityAssertionEndTimer:(id)a3
{
}

- (MRDActiveUserController)activeUserController
{
  return self->_activeUserController;
}

- (void)setActiveUserController:(id)a3
{
}

- (NSString)nowPlayingActivityUserIdentifier
{
  return self->_nowPlayingActivityUserIdentifier;
}

- (void)setNowPlayingActivityUserIdentifier:(id)a3
{
}

- (MSVTimer)activeUserChangedTimer
{
  return self->_activeUserChangedTimer;
}

- (void)setActiveUserChangedTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeUserChangedTimer, 0);
  objc_storeStrong((id *)&self->_nowPlayingActivityUserIdentifier, 0);
  objc_storeStrong((id *)&self->_activeUserController, 0);
  objc_storeStrong((id *)&self->_nowPlayingActivityAssertionEndTimer, 0);
  objc_storeStrong((id *)&self->_nowPlayingActivityAssertionEndDate, 0);
  objc_storeStrong((id *)&self->_suppressedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_routeRecommendationActivities, 0);
  objc_storeStrong((id *)&self->_activeRecommendationActivities, 0);
  objc_storeStrong((id *)&self->_activeRecommendations, 0);
  objc_storeStrong((id *)&self->_discoveredSession, 0);
  objc_storeStrong((id *)&self->_electedPlayer, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_activityController, 0);
}

@end