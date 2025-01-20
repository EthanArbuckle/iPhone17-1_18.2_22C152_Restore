@interface MRDGroupSessionManager
- (BOOL)advertisingPreferenceEnabled;
- (BOOL)automaticSharePlayPreferenceEnabled;
- (BOOL)canDiscoverGroupSessions;
- (BOOL)checkCanJoinGroupSessionWithError:(id *)a3;
- (BOOL)hasGuestParticipants;
- (BOOL)isAdvertising;
- (BOOL)isProxyAdvertising;
- (BOOL)sessionManagementScreenVisible;
- (BOOL)shouldNotifyForSessionIdentifier:(id)a3;
- (MRDGroupSession)session;
- (MRDGroupSessionAdvertiser)advertiser;
- (MRDGroupSessionEligibilityMonitor)eligibilityMonitor;
- (MRDGroupSessionHomeObserver)homeObserver;
- (MRDGroupSessionListener)homePodListener;
- (MRDGroupSessionListener)listener;
- (MRDGroupSessionManager)initWithEligibilityMonitor:(id)a3;
- (MRDGroupSessionProxyAuthorizationListener)proxyAuthorizationListener;
- (MRGroupSessionToken)airPlayLeaderGroupSessionToken;
- (MSVTimer)playbackTimeoutTimer;
- (NSDate)lastSessionEventDate;
- (NSHashTable)observers;
- (NSMapTable)pendingCompletions;
- (NSMutableDictionary)acknowledgeResetTimers;
- (NSMutableDictionary)notifiedPendingParticipants;
- (NSMutableOrderedSet)acknowledgedSessionIdentifiers;
- (NSMutableSet)discoveredSessions;
- (NSMutableSet)notificationSuppressIDs;
- (NSString)notAdvertisingReason;
- (NSString)notProxyAdvertisingReason;
- (NSUserDefaults)sharePlayDefaults;
- (OS_dispatch_queue)notificationQueue;
- (OS_dispatch_queue)queue;
- (_TtP12mediaremoted33MRDGroupSessionUIManagerInterface_)uiManager;
- (id)assertSessionManagementScreenVisible;
- (id)listenerForSessionWithIdentifier:(id)a3;
- (int64_t)sessionManagementScreenVisibleCount;
- (void)_joinGroupSessionWithToken:(id)a3 completion:(id)a4;
- (void)acknowledgeSession:(id)a3;
- (void)addObserver:(id)a3;
- (void)advertiser:(id)a3 didReceiveInvitationRequest:(id)a4 accessHandler:(id)a5;
- (void)advertiser:(id)a3 didReceiveJoinRequest:(id)a4 accessHandler:(id)a5;
- (void)cancelAcknowledgeResetTimerForSessionIdentifier:(id)a3;
- (void)cleanupExistingSessionIfNeeded;
- (void)clearDiscoveredSessions;
- (void)collectDiagnostic:(id)a3;
- (void)dealloc;
- (void)dismissAllDiscoveredSessions;
- (void)displayJoinRequest:(id)a3 handler:(id)a4;
- (void)eligibilityMonitor:(id)a3 eligibilityStatusDidChange:(id)a4;
- (void)fetchUserIdentity:(id)a3;
- (void)finishRemoteControlGroupSession:(id)a3;
- (void)groupSessionProxyAuthorizationListener:(id)a3 didCancelJoinRequest:(id)a4 withSessionToken:(id)a5;
- (void)groupSessionProxyAuthorizationListener:(id)a3 didReceiveJoinRequest:(id)a4 withSessionToken:(id)a5 handler:(id)a6;
- (void)handleBoopAdvertisementEnabledChangeNotification:(id)a3;
- (void)handleDeviceInfoChangeNotification:(id)a3;
- (void)handleGroupSessionEvent:(int64_t)a3 withOptions:(id)a4 completion:(id)a5;
- (void)handleGroupSessionSelectionEvent:(id)a3 forDiscoveredSession:(id)a4 completion:(id)a5;
- (void)handleLocalMusicStateUpdateNotification:(id)a3;
- (void)handleNearbyDiscoveryPreferenceChangedNotification:(id)a3;
- (void)handleNowPlayingApplicationDidChangeNotification:(id)a3;
- (void)handlePlaybackStateDidChangeNotification:(id)a3;
- (void)invalidatePlaybackTimeoutTimerWithReason:(id)a3;
- (void)joinGroupSessionWithNearbyGroup:(id)a3 hostSigningKey:(id)a4 joinToken:(id)a5 completion:(id)a6;
- (void)joinGroupSessionWithToken:(id)a3 completion:(id)a4;
- (void)leaveRemoteControlGroupSession:(id)a3;
- (void)listener:(id)a3 didDiscoverSession:(id)a4;
- (void)listener:(id)a3 didLoseSession:(id)a4;
- (void)notifyObserversWithBlock:(id)a3;
- (void)reevaluateAdvertisement;
- (void)reevaluateDiscoveryMode;
- (void)reevaluatePlaybackState;
- (void)reevaluateProxyAdvertisement;
- (void)releaseSessionManagementScreenVisibleAssertion;
- (void)removeObserver:(id)a3;
- (void)resetAcknowledgementForSessionIdentifier:(id)a3;
- (void)session:(id)a3 didChangeState:(int64_t)a4;
- (void)session:(id)a3 didUpdateParticipants:(id)a4;
- (void)session:(id)a3 didUpdatePendingParticipants:(id)a4;
- (void)setAcknowledgeResetTimers:(id)a3;
- (void)setAcknowledgedSessionIdentifiers:(id)a3;
- (void)setAdvertisingPreferenceEnabled:(BOOL)a3;
- (void)setDiscoveredSessions:(id)a3;
- (void)setDiscoveryEnabled:(BOOL)a3;
- (void)setHasGuestParticipants:(BOOL)a3;
- (void)setIsAdvertising:(BOOL)a3;
- (void)setIsProxyAdvertising:(BOOL)a3;
- (void)setLastSessionEventDate:(id)a3;
- (void)setNotAdvertisingReason:(id)a3;
- (void)setNotProxyAdvertisingReason:(id)a3;
- (void)setNotifiedPendingParticipants:(id)a3;
- (void)setPlaybackTimeoutTimer:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionManagementScreenVisibleCount:(int64_t)a3;
- (void)startAcknowledgeResetTimerForSessionIdentifier:(id)a3;
- (void)startRemoteControlGroupSessionWithRouteType:(unsigned __int8)a3 completion:(id)a4;
- (void)updateAdvertisementPreferences;
@end

@implementation MRDGroupSessionManager

- (MRDGroupSession)session
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100095C4C;
  v11 = sub_100095C5C;
  id v12 = 0;
  v3 = [(MRDGroupSessionManager *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014310;
  v6[3] = &unk_100415CF0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (MRDGroupSession *)v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MRDGroupSessionManager)initWithEligibilityMonitor:(id)a3
{
  id v5 = a3;
  v54.receiver = self;
  v54.super_class = (Class)MRDGroupSessionManager;
  v6 = [(MRDGroupSessionManager *)&v54 init];
  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v7 = +[NSHashTable weakObjectsHashTable];
  observers = v6->_observers;
  v6->_observers = (NSHashTable *)v7;

  uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.amp.MediaRemote.MRDGroupSessionManager.queue", v9);
  queue = v6->_queue;
  v6->_queue = (OS_dispatch_queue *)v10;

  id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v13 = MRGroupSessionSubsystemGetNotificationQueue();
  dispatch_queue_t v14 = dispatch_queue_create_with_target_V2("com.apple.amp.MediaRemote.MRDGroupSessionManager.notificationQueue", v12, v13);
  notificationQueue = v6->_notificationQueue;
  v6->_notificationQueue = (OS_dispatch_queue *)v14;

  uint64_t v16 = +[NSMapTable strongToStrongObjectsMapTable];
  pendingCompletions = v6->_pendingCompletions;
  v6->_pendingCompletions = (NSMapTable *)v16;

  v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  discoveredSessions = v6->_discoveredSessions;
  v6->_discoveredSessions = v18;

  v20 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  notificationSuppressIDs = v6->_notificationSuppressIDs;
  v6->_notificationSuppressIDs = v20;

  v22 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
  acknowledgedSessionIdentifiers = v6->_acknowledgedSessionIdentifiers;
  v6->_acknowledgedSessionIdentifiers = v22;

  v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  acknowledgeResetTimers = v6->_acknowledgeResetTimers;
  v6->_acknowledgeResetTimers = v24;

  v26 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  notifiedPendingParticipants = v6->_notifiedPendingParticipants;
  v6->_notifiedPendingParticipants = v26;

  objc_storeStrong((id *)&v6->_eligibilityMonitor, a3);
  v6->_advertisingPreferenceEnabled = MRGroupSessionNearbyContactDiscoveryEnabled();
  uint64_t v28 = +[NearbySessionsAdvertiser createWithDelegate:v6];
  advertiser = v6->_advertiser;
  v6->_advertiser = (MRDGroupSessionAdvertiser *)v28;

  if (MSVDeviceIsAudioAccessory())
  {
    v30 = objc_alloc_init(_TtC12mediaremoted16HomePodUIManager);
    uiManager = v6->_uiManager;
    v6->_uiManager = (_TtP12mediaremoted33MRDGroupSessionUIManagerInterface_ *)v30;

    uint64_t v32 = +[MRDGroupSessionHomeObserver shared];
    homeObserver = v6->_homeObserver;
    v6->_homeObserver = (MRDGroupSessionHomeObserver *)v32;
LABEL_6:

    goto LABEL_7;
  }
  uint64_t v34 = +[MRDGroupSessionUIManager create];
  v35 = v6->_uiManager;
  v6->_uiManager = (_TtP12mediaremoted33MRDGroupSessionUIManagerInterface_ *)v34;

  v36 = +[MRUserSettings currentSettings];
  unsigned int v37 = [v36 groupSessionListenForProxyJoinRequests];

  if (v37)
  {
    v38 = [[MRDGroupSessionProxyAuthorizationListener alloc] initWithDelegate:v6];
    homeObserver = v6->_proxyAuthorizationListener;
    v6->_proxyAuthorizationListener = v38;
    goto LABEL_6;
  }
LABEL_7:
  v39 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.TelephonyUtilities.sharePlayAppPolicies"];
  sharePlayDefaults = v6->_sharePlayDefaults;
  v6->_sharePlayDefaults = v39;

  MRMediaRemoteSetWantsNowPlayingNotifications();
  v41 = +[NSNotificationCenter defaultCenter];
  [v41 addObserver:v6 selector:"handleNowPlayingApplicationDidChangeNotification:" name:kMRMediaRemoteNowPlayingApplicationDidChangeNotification object:0];

  v42 = +[NSNotificationCenter defaultCenter];
  [v42 addObserver:v6 selector:"handlePlaybackStateDidChangeNotification:" name:kMRMediaRemotePlayerPlaybackStateDidChangeNotification object:0];

  v43 = +[NSNotificationCenter defaultCenter];
  [v43 addObserver:v6 selector:"handleLocalMusicStateUpdateNotification:" name:@"MRDMusicUserStateCenterLocalStateDidUpdateNotification" object:0];

  v44 = +[NSNotificationCenter defaultCenter];
  [v44 addObserver:v6 selector:"handleNearbyDiscoveryPreferenceChangedNotification:" name:MRGroupSessionNearbyContactDiscoveryPreferenceDidChangeNotification object:0];

  [v5 addObserver:v6];
  v45 = +[MRSharedSettings currentSettings];
  unsigned int v46 = [v45 supportGroupSessionHomePodBoop];

  if (v46)
  {
    if (MSVDeviceIsAudioAccessory())
    {
      v47 = +[NSNotificationCenter defaultCenter];
      [v47 addObserver:v6 selector:"handleDeviceInfoChangeNotification:" name:kMRDeviceInfoDidChangeNotification object:0];
    }
    v48 = +[NSNotificationCenter defaultCenter];
    v49 = +[MRUserSettings groupSessionBoopAdvertisementEnabledDidChangeNotification];
    [v48 addObserver:v6 selector:"handleBoopAdvertisementEnabledChangeNotification:" name:v49 object:0];
  }
  v50 = [(MRDGroupSessionManager *)v6 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100093460;
  block[3] = &unk_100415CC8;
  v53 = v6;
  dispatch_async(v50, block);

LABEL_12:
  return v6;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  id v4 = _MRLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionManager] Dealloc", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)MRDGroupSessionManager;
  [(MRDGroupSessionManager *)&v5 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MRDGroupSessionManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000935B4;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MRDGroupSessionManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000936BC;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)startRemoteControlGroupSessionWithRouteType:(unsigned __int8)a3 completion:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10009388C;
  v19[3] = &unk_100418408;
  uint64_t v7 = [[MRDGroupSessionCreateTimingEvents alloc] initWithRouteType:v4];
  v20 = v7;
  v21 = self;
  id v8 = v6;
  id v22 = v8;
  uint64_t v9 = objc_retainBlock(v19);
  dispatch_queue_t v10 = [(MRDGroupSessionManager *)self queue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100093974;
  v14[3] = &unk_100419D70;
  v14[4] = self;
  v15 = v7;
  char v18 = v4;
  id v16 = v9;
  id v17 = v8;
  id v11 = v8;
  id v12 = v7;
  v13 = v9;
  dispatch_async(v10, v14);
}

- (void)leaveRemoteControlGroupSession:(id)a3
{
  id v3 = a3;
  if ([v3 isHosted])
  {
    uint64_t v4 = _MRLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10032CEB0();
    }
  }
  else
  {
    [v3 finish];
  }
}

- (void)finishRemoteControlGroupSession:(id)a3
{
  id v3 = a3;
  if ([v3 isHosted])
  {
    [v3 finish];
  }
  else
  {
    uint64_t v4 = _MRLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10032CF18();
    }
  }
}

- (void)joinGroupSessionWithToken:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100094B5C;
  v8[3] = &unk_100419DC0;
  id v9 = a3;
  id v10 = a4;
  id v6 = v9;
  id v7 = v10;
  [(MRDGroupSessionManager *)self _joinGroupSessionWithToken:v6 completion:v8];
}

- (id)listenerForSessionWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(MRDGroupSessionManager *)self homePodListener],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 hasDiscoveredSessionForIdentifier:v4],
        v5,
        v6))
  {
    uint64_t v7 = [(MRDGroupSessionManager *)self homePodListener];
  }
  else
  {
    uint64_t v7 = [(MRDGroupSessionManager *)self listener];
  }
  id v8 = (void *)v7;

  return v8;
}

- (void)_joinGroupSessionWithToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000950E4;
  v17[3] = &unk_1004187A8;
  v17[4] = self;
  id v7 = a4;
  id v18 = v7;
  id v8 = objc_retainBlock(v17);
  id v9 = [(MRDGroupSessionManager *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000951C0;
  v13[3] = &unk_100416438;
  v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(v9, v13);
}

- (id)assertSessionManagementScreenVisible
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100095C4C;
  id v11 = sub_100095C5C;
  id v12 = 0;
  id v3 = [(MRDGroupSessionManager *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100095C64;
  v6[3] = &unk_100415940;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)releaseSessionManagementScreenVisibleAssertion
{
  id v3 = [(MRDGroupSessionManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100095D5C;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (BOOL)sessionManagementScreenVisible
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(MRDGroupSessionManager *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100095E48;
  v5[3] = &unk_100415CF0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)handleGroupSessionEvent:(int64_t)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a4;
  char v9 = (void (**)(id, void *))a5;
  if (a3 == 1)
  {
    id v10 = [v8 objectForKeyedSubscript:MRGroupSessionEventOptionDiscoveredSessionIdentifier];
    if (v10)
    {
      [(MRDGroupSessionManager *)self handleGroupSessionSelectionEvent:v8 forDiscoveredSession:v10 completion:v9];
    }
    else
    {
      id v12 = +[NSError msv_errorWithDomain:MRGroupSessionError code:2 debugDescription:@"No identifier provided."];
      v9[2](v9, v12);
    }
  }
  else
  {
    id v11 = _MRLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10032D0F4();
    }

    id v10 = +[NSError msv_errorWithDomain:MRGroupSessionError, 2, @"Unknown event type: %ld", a3 code debugDescription];
    v9[2](v9, v10);
  }
}

- (void)handleGroupSessionSelectionEvent:(id)a3 forDiscoveredSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MRDGroupSessionManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000960B4;
  v15[3] = &unk_100418320;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)cleanupExistingSessionIfNeeded
{
  id v3 = [(MRDGroupSessionManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = self->_session;
  session = self->_session;
  self->_session = 0;

  uint64_t v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  notifiedPendingParticipants = self->_notifiedPendingParticipants;
  self->_notifiedPendingParticipants = v6;

  self->_hasGuestParticipants = 0;
  if (v4)
  {
    unsigned __int8 v8 = [(MRDGroupSession *)v4 isHosted];
    unsigned int v9 = [(MRDGroupSession *)v4 isHosted];
    [(MRDGroupSession *)v4 removeObserver:self];
    if (v9)
    {
      id v10 = _MRLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        unsigned int v37 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionManager] Implicitly ending %{public}@ because of new session.", buf, 0xCu);
      }

      [(MRDGroupSessionManager *)self finishRemoteControlGroupSession:v4];
    }
    if ((v8 & 1) == 0)
    {
      id v11 = +[MRDMediaRemoteServer server];
      id v12 = [v11 routingServer];
      id v13 = [v12 systemEndpointController];
      id v14 = [objc_alloc((Class)MRUpdateActiveSystemEndpointRequest) initWithOutputDeviceUID:0 reason:@"MRGroupSession.implicit.leave"];
      [v13 updateSystemEndpointForRequest:v14];

      id v15 = _MRLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        unsigned int v37 = v4;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionManager] Implicitly leaving %{public}@ because of new session.", buf, 0xCu);
      }

      [(MRDGroupSessionManager *)self leaveRemoteControlGroupSession:v4];
    }
  }
  else
  {
    [0 removeObserver:self];
  }
  id v16 = [(MRDGroupSessionManager *)self pendingCompletions];
  id v17 = [(MRDGroupSession *)v4 identifier];
  id v18 = [v16 objectForKey:v17];

  if (v18)
  {
    v19 = [(MRDGroupSessionManager *)self pendingCompletions];
    v20 = [(MRDGroupSession *)v4 identifier];
    [v19 removeObjectForKey:v20];

    v21 = [(MRDGroupSessionManager *)self notificationQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009671C;
    block[3] = &unk_100416938;
    id v35 = v18;
    dispatch_async(v21, block);

    id v22 = v35;
LABEL_17:

    goto LABEL_18;
  }
  if (v4)
  {
    if ([(MRDGroupSession *)v4 isHosted])
    {
      v23 = [(MRDGroupSessionManager *)self advertiser];
      [v23 setActiveSession:0 identity:0];

      [(MRDGroupSessionManager *)self reevaluateAdvertisement];
    }
    v24 = [(MRDGroupSessionManager *)self observers];
    v25 = [v24 allObjects];

    v26 = [(MRDGroupSessionManager *)self notificationQueue];
    v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    v29 = sub_10009679C;
    v30 = &unk_1004159B8;
    id v31 = v25;
    uint64_t v32 = v4;
    v33 = self;
    id v22 = v25;
    dispatch_async(v26, &v27);

    goto LABEL_17;
  }
LABEL_18:
  [(MRDGroupSessionManager *)self reevaluateDiscoveryMode];
}

- (void)fetchUserIdentity:(id)a3
{
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_100095C4C;
  v36 = sub_100095C5C;
  id v37 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_100095C4C;
  v30 = sub_100095C5C;
  id v31 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100096C18;
  v22[3] = &unk_100419EB0;
  v24 = &v32;
  v25 = &v26;
  v22[4] = self;
  id v4 = a3;
  id v23 = v4;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100096D30;
  v20[3] = &unk_100416938;
  objc_super v5 = objc_retainBlock(v22);
  id v21 = v5;
  uint64_t v6 = objc_retainBlock(v20);
  id v7 = objc_alloc((Class)MRBlockGuard);
  unsigned __int8 v8 = [(MRDGroupSessionManager *)self queue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100096DE8;
  v18[3] = &unk_100415FA8;
  id v9 = v4;
  id v19 = v9;
  id v10 = [v7 initWithTimeout:@"Wait for user identity" reason:v8 queue:v18 handler:10.0];
  id v11 = (void *)v33[5];
  v33[5] = (uint64_t)v10;

  id v12 = +[NSNotificationCenter defaultCenter];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100096E68;
  v16[3] = &unk_100419ED8;
  id v13 = v6;
  id v17 = v13;
  uint64_t v14 = [v12 addObserverForName:@"MRDMusicUserStateCenterCloudStateDidUpdateNotification" object:0 queue:0 usingBlock:v16];
  id v15 = (void *)v27[5];
  v27[5] = v14;

  v13[2](v13);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
}

- (void)joinGroupSessionWithNearbyGroup:(id)a3 hostSigningKey:(id)a4 joinToken:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(MRDGroupSessionManager *)self queue];
  dispatch_assert_queue_V2(v14);

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10009714C;
  v35[3] = &unk_1004187A8;
  v35[4] = self;
  id v15 = v13;
  id v36 = v15;
  id v16 = objc_retainBlock(v35);
  id v17 = +[MRDMusicUserStateCenter sharedCenter];
  id v18 = [v17 localActiveIdentity];

  if (!v18)
  {
    v29 = _MRLogForCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_10032D15C();
    }

    uint64_t v30 = MRGroupSessionError;
    CFStringRef v31 = @"Cannot join session without identity.";
    goto LABEL_10;
  }
  if ([v18 type] != (id)1)
  {
    uint64_t v32 = _MRLogForCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_10032D190();
    }

    uint64_t v30 = MRGroupSessionError;
    CFStringRef v31 = @"Cannot join session without resolvable identity.";
LABEL_10:
    v33 = +[NSError msv_errorWithDomain:v30 code:4 debugDescription:v31];
    ((void (*)(void *, void *))v16[2])(v16, v33);

    goto LABEL_11;
  }
  id v19 = +[MRDGroupSessionProvider remoteControlSessionForExistingSessionWithNearbyGroup:v10 identity:v18 hostSigningKey:v11 joinToken:v12];
  id v34 = v12;
  id v20 = v11;
  id v21 = v10;
  session = self->_session;
  self->_session = v19;
  id v23 = v19;

  v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  notifiedPendingParticipants = self->_notifiedPendingParticipants;
  self->_notifiedPendingParticipants = v24;

  self->_hasGuestParticipants = 0;
  uint64_t v26 = [(MRDGroupSessionManager *)self pendingCompletions];
  id v27 = objc_retainBlock(v15);
  uint64_t v28 = [(MRDGroupSession *)v23 identifier];
  [v26 setObject:v27 forKey:v28];

  id v10 = v21;
  id v11 = v20;
  id v12 = v34;

  [(MRDGroupSession *)v23 addObserver:self];
  [(MRDGroupSession *)v23 start];

  [(MRDGroupSessionManager *)self reevaluateDiscoveryMode];
LABEL_11:
}

- (BOOL)checkCanJoinGroupSessionWithError:(id *)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_100095C4C;
  id v12 = sub_100095C5C;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100097340;
  v7[3] = &unk_100418A28;
  v7[4] = self;
  void v7[5] = &v8;
  id v4 = objc_retainBlock(v7);
  char v5 = ((uint64_t (*)(void))v4[2])();
  if (a3) {
    *a3 = (id) v9[5];
  }

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)dismissAllDiscoveredSessions
{
  id v3 = [(MRDGroupSessionManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(NSMutableSet *)self->_discoveredSessions copy];
  char v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionManager] Dismissing all discovered sessions", buf, 2u);
  }

  uint64_t v6 = [(MRDGroupSessionManager *)self notificationQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000975AC;
  v8[3] = &unk_1004158D8;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)reevaluateAdvertisement
{
  id v3 = [(MRDGroupSessionManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = self->_session;
  unint64_t v5 = (unint64_t)[(MRDGroupSession *)v4 state] & 0xFFFFFFFFFFFFFFFELL;
  if (v4) {
    BOOL v6 = v5 == 2;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    uint64_t v8 = [(MRDGroupSessionManager *)self pendingCompletions];
    id v9 = [(MRDGroupSession *)v4 identifier];
    uint64_t v10 = [v8 objectForKey:v9];
    BOOL v7 = v10 != 0;
  }
  else
  {
    BOOL v7 = 1;
  }
  unsigned int v11 = [(MRDGroupSession *)v4 isHosted];
  id v12 = +[MRDMediaRemoteServer server];
  id v13 = [v12 nowPlayingServer];
  uint64_t v14 = +[MROrigin localOrigin];
  id v15 = [v13 originClientForOrigin:v14];
  id v16 = [v15 activeNowPlayingClient];
  id v17 = [v16 activePlayerClient];

  if ([v17 isPlaying])
  {
    id v18 = [v17 playerPath];
    id v19 = [v18 client];
    unsigned int v20 = [v19 isSystemMediaApplication] ^ 1;
  }
  else
  {
    unsigned int v20 = 0;
  }
  airPlayLeaderGroupSessionToken = self->_airPlayLeaderGroupSessionToken;
  if ([(MRDGroupSessionManager *)self advertisingPreferenceEnabled])
  {
    if (MSVDeviceIsAppleTV())
    {
      CFStringRef v22 = @"Platform not supported";
    }
    else if (MSVDeviceIsAudioAccessory() {
           && (+[MRSharedSettings currentSettings],
    }
               uint64_t v28 = objc_claimAutoreleasedReturnValue(),
               unsigned int v29 = [v28 supportGroupSessionHomePodBoop],
               v28,
               !v29))
    {
      CFStringRef v22 = @"Feature not enabled";
    }
    else if (MSVDeviceIsAudioAccessory() {
           && (+[MRUserSettings currentSettings],
    }
               uint64_t v30 = objc_claimAutoreleasedReturnValue(),
               unsigned int v31 = [v30 groupSessionBoopAdvertisementEnabled],
               v30,
               !v31))
    {
      CFStringRef v22 = @"Disabled by user";
    }
    else
    {
      if (v4) {
        char v32 = v7;
      }
      else {
        char v32 = 1;
      }
      if (v4) {
        CFStringRef v22 = @"Session not ready";
      }
      else {
        CFStringRef v22 = @"No session";
      }
      if ((v32 & 1) == 0)
      {
        if (!v11)
        {
          CFStringRef v22 = @"Session is not hosted.";
          if (![(MRDGroupSessionManager *)self isAdvertising]) {
            goto LABEL_22;
          }
          goto LABEL_15;
        }
        if (airPlayLeaderGroupSessionToken) {
          char v33 = 1;
        }
        else {
          char v33 = v20;
        }
        if (v20) {
          CFStringRef v22 = @"Another app is now playing.";
        }
        else {
          CFStringRef v22 = @"Leader token available";
        }
        if ((v33 & 1) == 0)
        {
          if ([(MRDGroupSessionManager *)self isAdvertising])
          {
            CFStringRef v22 = 0;
            goto LABEL_22;
          }
          [(MRDGroupSessionManager *)self setIsAdvertising:1];
          id v34 = _MRLogForCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            int v35 = 138543362;
            id v36 = v4;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionManager] Begin advertising for session: %{public}@", (uint8_t *)&v35, 0xCu);
          }

          v24 = [(MRDGroupSessionManager *)self advertiser];
          [v24 beginAdvertising];
          CFStringRef v22 = 0;
          goto LABEL_18;
        }
      }
    }
  }
  else
  {
    CFStringRef v22 = @"Setting disabled";
  }
  if ([(MRDGroupSessionManager *)self isAdvertising])
  {
LABEL_15:
    [(MRDGroupSessionManager *)self setIsAdvertising:0];
    id v23 = _MRLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = 138543362;
      id v36 = (void *)v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionManager] Stopping advertisement because: %{public}@", (uint8_t *)&v35, 0xCu);
    }

    v24 = [(MRDGroupSessionManager *)self advertiser];
    [v24 endAdvertising];
LABEL_18:

    goto LABEL_22;
  }
  if (v11)
  {
    v25 = [(MRDGroupSessionManager *)self notAdvertisingReason];
    if (v25 != v22)
    {
      uint64_t v26 = v25;
      unsigned __int8 v27 = [(__CFString *)v25 isEqual:v22];

      if ((v27 & 1) == 0)
      {
        v24 = _MRLogForCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          int v35 = 138543362;
          id v36 = (void *)v22;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[MRDGroupSessionManager] Not advertising hosted session because: %{public}@", (uint8_t *)&v35, 0xCu);
        }
        goto LABEL_18;
      }
    }
  }
LABEL_22:
  [(MRDGroupSessionManager *)self setNotAdvertisingReason:v22];
}

- (void)reevaluateProxyAdvertisement
{
  id v3 = [(MRDGroupSessionManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = self->_airPlayLeaderGroupSessionToken;
  if (![(MRDGroupSessionManager *)self advertisingPreferenceEnabled])
  {
    CFStringRef v5 = @"Setting disabled";
    goto LABEL_5;
  }
  if (MSVDeviceIsAppleTV())
  {
    CFStringRef v5 = @"Platform not supported";
LABEL_5:
    if ([(MRDGroupSessionManager *)self isProxyAdvertising])
    {
LABEL_6:
      [(MRDGroupSessionManager *)self setIsProxyAdvertising:0];
      BOOL v6 = _MRLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543362;
        id v18 = (void *)v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionManager] Stopping proxy advertisement because: %{public}@", (uint8_t *)&v17, 0xCu);
      }

      BOOL v7 = [(MRDGroupSessionManager *)self advertiser];
      [v7 endProxyAdvertising];

      [(MRDGroupSessionManager *)self reevaluateAdvertisement];
      goto LABEL_24;
    }
    if (v4)
    {
      uint64_t v8 = [(MRDGroupSessionManager *)self notProxyAdvertisingReason];
      if (v8 != v5)
      {
        id v9 = v8;
        unsigned __int8 v10 = [(__CFString *)v8 isEqual:v5];

        if ((v10 & 1) == 0)
        {
          unsigned int v11 = _MRLogForCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            int v17 = 138543362;
            id v18 = (void *)v5;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[MRDGroupSessionManager] Not advertising proxy session because: %{public}@", (uint8_t *)&v17, 0xCu);
          }
        }
      }
    }
    goto LABEL_24;
  }
  if (MSVDeviceIsAudioAccessory())
  {
    id v12 = +[MRUserSettings currentSettings];
    unsigned int v13 = [v12 groupSessionBoopAdvertisementEnabled];

    if (!v13)
    {
      CFStringRef v5 = @"Disabled by user";
      goto LABEL_5;
    }
  }
  unsigned int v14 = [(MRDGroupSessionManager *)self isProxyAdvertising];
  if (!v4)
  {
    CFStringRef v5 = @"Leader token not available";
    if (!v14) {
      goto LABEL_24;
    }
    goto LABEL_6;
  }
  if ((v14 & 1) == 0)
  {
    [(MRDGroupSessionManager *)self reevaluateAdvertisement];
    [(MRDGroupSessionManager *)self setIsProxyAdvertising:1];
    id v15 = _MRLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionManager] Begin proxy advertising for token: %{public}@", (uint8_t *)&v17, 0xCu);
    }

    id v16 = [(MRDGroupSessionManager *)self advertiser];
    [v16 beginProxyAdvertisingWithToken:v4];
  }
  CFStringRef v5 = 0;
LABEL_24:
  [(MRDGroupSessionManager *)self setNotProxyAdvertisingReason:v5];
}

- (void)updateAdvertisementPreferences
{
  id v3 = [(MRDGroupSessionManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100097E80;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)canDiscoverGroupSessions
{
  id v3 = +[MRDMusicUserStateCenter sharedCenter];
  if ([v3 isMusicAppInstalled])
  {
    id v4 = [(MRDGroupSessionManager *)self eligibilityMonitor];
    CFStringRef v5 = [v4 eligibilityStatus];
    if ([v5 idsAccountIsValid]) {
      BOOL v6 = self->_session == 0;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)reevaluateDiscoveryMode
{
  id v3 = [(MRDGroupSessionManager *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(MRDGroupSessionManager *)self canDiscoverGroupSessions];

  [(MRDGroupSessionManager *)self setDiscoveryEnabled:v4];
}

- (void)setDiscoveryEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  CFStringRef v5 = [(MRDGroupSessionManager *)self queue];
  dispatch_assert_queue_V2(v5);

  listener = self->_listener;
  if (v3)
  {
    if (!listener)
    {
      BOOL v7 = _MRLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionManager] Start listening for nearby sessions", buf, 2u);
      }

      uint64_t v8 = +[NearbySessionsListener createWithDelegate:self];
      id v9 = self->_listener;
      self->_listener = v8;

      unsigned __int8 v10 = +[MRSharedSettings currentSettings];
      unsigned int v11 = [v10 supportGroupSessionHomePodBoop];

      if (v11)
      {
        id v12 = +[NearbySessionsListener createForHomePodWithDelegate:self];
        homePodListener = self->_homePodListener;
        self->_homePodListener = v12;
      }
    }
  }
  else if (listener)
  {
    unsigned int v14 = _MRLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionManager] Stop listening for nearby sessions", v17, 2u);
    }

    id v15 = self->_listener;
    self->_listener = 0;

    id v16 = self->_homePodListener;
    self->_homePodListener = 0;

    [(MRDGroupSessionManager *)self clearDiscoveredSessions];
  }
}

- (BOOL)shouldNotifyForSessionIdentifier:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(MRDGroupSessionManager *)self queue];
  dispatch_assert_queue_V2(v5);

  LOBYTE(self) = [(NSMutableOrderedSet *)self->_acknowledgedSessionIdentifiers containsObject:v4];
  return self ^ 1;
}

- (BOOL)automaticSharePlayPreferenceEnabled
{
  v2 = [(NSUserDefaults *)self->_sharePlayDefaults objectForKey:@"CPAppPolicy.AutoSharePlayToggle"];
  BOOL v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (void)startAcknowledgeResetTimerForSessionIdentifier:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(MRDGroupSessionManager *)self queue];
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  BOOL v6 = [(MRDGroupSessionManager *)self queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100098324;
  v9[3] = &unk_100419F00;
  id v7 = v4;
  id v10 = v7;
  objc_copyWeak(&v11, &location);
  uint64_t v8 = +[MSVTimer timerWithInterval:0 repeats:v6 queue:v9 block:480.0];
  [(NSMutableDictionary *)self->_acknowledgeResetTimers setObject:v8 forKeyedSubscript:v7];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)cancelAcknowledgeResetTimerForSessionIdentifier:(id)a3
{
  id v6 = a3;
  id v4 = [(MRDGroupSessionManager *)self queue];
  dispatch_assert_queue_V2(v4);

  CFStringRef v5 = [(NSMutableDictionary *)self->_acknowledgeResetTimers objectForKeyedSubscript:v6];
  [v5 invalidate];

  [(NSMutableDictionary *)self->_acknowledgeResetTimers setObject:0 forKeyedSubscript:v6];
}

- (void)resetAcknowledgementForSessionIdentifier:(id)a3
{
  id v5 = a3;
  id v4 = [(MRDGroupSessionManager *)self queue];
  dispatch_assert_queue_V2(v4);

  [(NSMutableOrderedSet *)self->_acknowledgedSessionIdentifiers removeObject:v5];
}

- (void)clearDiscoveredSessions
{
  BOOL v3 = [(MRDGroupSessionManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(NSMutableSet *)self->_discoveredSessions copy];
  id v5 = [(MRDGroupSessionManager *)self notificationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100098600;
  block[3] = &unk_1004158D8;
  id v9 = v4;
  id v10 = self;
  id v6 = v4;
  dispatch_async(v5, block);

  [(NSMutableSet *)self->_discoveredSessions removeAllObjects];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100098728;
  v7[3] = &unk_100419F28;
  v7[4] = self;
  [(MRDGroupSessionManager *)self notifyObserversWithBlock:v7];
}

- (void)reevaluatePlaybackState
{
  BOOL v3 = [(MRDGroupSessionManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[MRDMediaRemoteServer server];
  id v5 = [v4 nowPlayingServer];
  id v6 = +[MROrigin localOrigin];
  id v7 = [v5 originClientForOrigin:v6];
  uint64_t v8 = [v7 activeNowPlayingClient];
  id v9 = [v8 activePlayerClient];

  if (![(MRDGroupSession *)self->_session isHosted]
    || [(MRDGroupSession *)self->_session state] != (id)3)
  {
    CFStringRef v12 = @"No active session";
    goto LABEL_6;
  }
  id v10 = [(MRDGroupSession *)self->_session participants];
  id v11 = [v10 count];

  if ((unint64_t)v11 <= 1)
  {
    CFStringRef v12 = @"No participants in session";
LABEL_6:
    [(MRDGroupSessionManager *)self invalidatePlaybackTimeoutTimerWithReason:v12];
    goto LABEL_7;
  }
  if ([v9 isPlaying] && self->_playbackTimeoutTimer) {
    [(MRDGroupSessionManager *)self invalidatePlaybackTimeoutTimerWithReason:@"Session changed to playing"];
  }
  if (([v9 isPlaying] & 1) == 0 && !self->_playbackTimeoutTimer)
  {
    unsigned int v13 = _MRLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionManager] Starting timeout timer because: Session changed to not playing", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    unsigned int v14 = +[MRUserSettings currentSettings];
    [v14 groupSessionEndAfterPauseInterval];
    id v16 = v15;

    int v17 = [(MRDGroupSessionManager *)self queue];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100098A44;
    v20[3] = &unk_100419F50;
    objc_copyWeak(v21, buf);
    v21[1] = v16;
    id v18 = +[MSVTimer timerWithInterval:0 repeats:v17 queue:v20 block:*(double *)&v16 + 2.0];
    playbackTimeoutTimer = self->_playbackTimeoutTimer;
    self->_playbackTimeoutTimer = v18;

    objc_destroyWeak(v21);
    objc_destroyWeak(buf);
  }
LABEL_7:
}

- (void)invalidatePlaybackTimeoutTimerWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDGroupSessionManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MRDGroupSessionManager *)self playbackTimeoutTimer];

  if (v6)
  {
    id v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionManager] Invalidating timeout timer because: %@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v8 = [(MRDGroupSessionManager *)self playbackTimeoutTimer];
    [v8 invalidate];

    [(MRDGroupSessionManager *)self setPlaybackTimeoutTimer:0];
  }
}

- (void)displayJoinRequest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MRDGroupSessionManager *)self sessionManagementScreenVisible])
  {
    uint64_t v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionManager] Suppressing join request because session management UI is visible", v9, 2u);
    }
  }
  else
  {
    uint64_t v8 = [(MRDGroupSessionManager *)self uiManager];
    [v8 displayJoinRequest:v6 handler:v7];
  }
}

- (void)session:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  id v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = sub_10017B008(a4);
    *(_DWORD *)buf = 138543618;
    id v15 = v8;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[MRDGroupSessionManager] Processing state change to: %{public}@ for session: %{public}@.", buf, 0x16u);
  }
  int v9 = [(MRDGroupSessionManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100098EEC;
  block[3] = &unk_100415AA8;
  id v12 = v6;
  int64_t v13 = a4;
  void block[4] = self;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)session:(id)a3 didUpdateParticipants:(id)a4
{
  id v5 = [(MRDGroupSessionManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000999D8;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)session:(id)a3 didUpdatePendingParticipants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isHosted] & 1) == 0)
  {
    uint64_t v8 = [(MRDGroupSessionManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100099ABC;
    block[3] = &unk_1004159B8;
    id v10 = v7;
    id v11 = self;
    id v12 = v6;
    dispatch_async(v8, block);
  }
}

- (void)handleNearbyDiscoveryPreferenceChangedNotification:(id)a3
{
}

- (void)acknowledgeSession:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDGroupSessionManager *)self queue];
  dispatch_assert_queue_V2(v5);

  if (v4 && ![v4 source])
  {
    if ((unint64_t)[(NSMutableOrderedSet *)self->_acknowledgedSessionIdentifiers count] >= 0xB) {
      [(NSMutableOrderedSet *)self->_acknowledgedSessionIdentifiers removeObjectAtIndex:0];
    }
    acknowledgedSessionIdentifiers = self->_acknowledgedSessionIdentifiers;
    id v7 = [v4 identifier];
    [(NSMutableOrderedSet *)acknowledgedSessionIdentifiers addObject:v7];

    uint64_t v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [v4 identifier];
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionManager] Acknowledged session: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (NSMutableSet)discoveredSessions
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = sub_100095C4C;
  id v11 = sub_100095C5C;
  id v12 = 0;
  BOOL v3 = [(MRDGroupSessionManager *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009A5E4;
  v6[3] = &unk_100415CF0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSMutableSet *)v4;
}

- (void)handleNowPlayingApplicationDidChangeNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:kMRNowPlayingPlayerPathUserInfoKey];

  id v6 = [v5 origin];
  unsigned int v7 = [v6 isLocal];

  if (v7)
  {
    uint64_t v8 = [(MRDGroupSessionManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009A714;
    block[3] = &unk_100415CC8;
    void block[4] = self;
    dispatch_async(v8, block);
  }
}

- (void)handlePlaybackStateDidChangeNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:kMRNowPlayingPlayerPathUserInfoKey];

  id v6 = [v5 origin];
  unsigned int v7 = [v6 isLocal];

  if (v7)
  {
    uint64_t v8 = [(MRDGroupSessionManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009A800;
    block[3] = &unk_100415CC8;
    void block[4] = self;
    dispatch_async(v8, block);
  }
}

- (void)handleLocalMusicStateUpdateNotification:(id)a3
{
  id v4 = [(MRDGroupSessionManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009A8C4;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)handleDeviceInfoChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = MRGetDeviceInfoFromUserInfo();

  unsigned int v7 = [v4 userInfo];

  uint64_t v8 = MRGetOriginFromUserInfo();

  if ([v8 isLocal])
  {
    uint64_t v9 = [v6 leaderDeviceInfo];
    int v10 = [v9 groupSessionToken];
    id v11 = [v10 copy];

    id v12 = [(MRDGroupSessionManager *)self queue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10009AA0C;
    v14[3] = &unk_1004158D8;
    v14[4] = self;
    id v15 = v11;
    id v13 = v11;
    dispatch_sync(v12, v14);
  }
}

- (void)handleBoopAdvertisementEnabledChangeNotification:(id)a3
{
  id v4 = [(MRDGroupSessionManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009ABE8;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)advertiser:(id)a3 didReceiveJoinRequest:(id)a4 accessHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionManager] Received join request: %{public}@", buf, 0xCu);
  }

  [(MRDGroupSessionManager *)self session];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10009ADA4;
  v13[3] = &unk_10041A0E8;
  v13[4] = self;
  id v14 = v7;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v8;
  id v10 = v8;
  id v11 = v15;
  id v12 = v7;
  +[MRDGroupSessionApprovalManager shouldAutoApproveRequest:v12 withSession:v11 completion:v13];
}

- (void)advertiser:(id)a3 didReceiveInvitationRequest:(id)a4 accessHandler:(id)a5
{
}

- (void)groupSessionProxyAuthorizationListener:(id)a3 didReceiveJoinRequest:(id)a4 withSessionToken:(id)a5 handler:(id)a6
{
  id v26 = a3;
  id v27 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [v10 equivalentMediaIdentifier];
  if (v12)
  {
    id v13 = dispatch_group_create();
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = sub_100095C4C;
    v42[4] = sub_100095C5C;
    id v43 = 0;
    id v14 = _MRLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v27 identifier];
      *(_DWORD *)buf = 138412546;
      id v45 = v15;
      __int16 v46 = 2112;
      v47 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionManager] %@ - Attempting to discover target device via WHA: %@", buf, 0x16u);
    }
    id v25 = objc_alloc_init((Class)MRAVLightweightReconnaissanceSession);
    dispatch_group_enter(v13);
    id v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    id v18 = [(MRDGroupSessionManager *)self notificationQueue];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10009B88C;
    v37[3] = &unk_10041A110;
    id v19 = v27;
    id v38 = v19;
    v41 = v42;
    id v20 = v12;
    id v39 = v20;
    id v21 = v13;
    v40 = v21;
    [v25 searchEndpointsForOutputDeviceUID:v20 timeout:v17 reason:v18 queue:v37 completion:15.0];

    CFStringRef v22 = _MRLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v19;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionManager] Displaying proxy authorization request: %@", buf, 0xCu);
    }

    MRAnalyticsSendEvent();
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10009BA78;
    v28[3] = &unk_10041A178;
    id v34 = v11;
    id v29 = v19;
    id v30 = v20;
    unsigned int v31 = self;
    id v32 = v10;
    id v23 = v21;
    char v33 = v23;
    int v35 = v42;
    uint64_t v36 = 0x402E000000000000;
    [(MRDGroupSessionManager *)self displayJoinRequest:v29 handler:v28];

    _Block_object_dispose(v42, 8);
  }
  else
  {
    v24 = _MRLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10032D240();
    }

    if (v11) {
      (*((void (**)(id, void))v11 + 2))(v11, 0);
    }
  }
}

- (void)groupSessionProxyAuthorizationListener:(id)a3 didCancelJoinRequest:(id)a4 withSessionToken:(id)a5
{
}

- (void)listener:(id)a3 didDiscoverSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRDGroupSessionManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009BF34;
  block[3] = &unk_1004159B8;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)listener:(id)a3 didLoseSession:(id)a4
{
  id v5 = a4;
  id v6 = [(MRDGroupSessionManager *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009C6B4;
  v8[3] = &unk_1004158D8;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)notifyObserversWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDGroupSessionManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MRDGroupSessionManager *)self observers];
  id v7 = [v6 allObjects];

  id v8 = [(MRDGroupSessionManager *)self notificationQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009C9D4;
  v11[3] = &unk_100416988;
  id v12 = v7;
  id v13 = v4;
  id v9 = v4;
  id v10 = v7;
  dispatch_async(v8, v11);
}

- (void)eligibilityMonitor:(id)a3 eligibilityStatusDidChange:(id)a4
{
  id v5 = [(MRDGroupSessionManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009CB58;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDGroupSessionManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009CC14;
  v7[3] = &unk_1004158D8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async_and_wait(v5, v7);
}

- (void)setDiscoveredSessions:(id)a3
{
}

- (void)setSession:(id)a3
{
}

- (MRGroupSessionToken)airPlayLeaderGroupSessionToken
{
  return self->_airPlayLeaderGroupSessionToken;
}

- (NSMutableOrderedSet)acknowledgedSessionIdentifiers
{
  return self->_acknowledgedSessionIdentifiers;
}

- (void)setAcknowledgedSessionIdentifiers:(id)a3
{
}

- (NSMutableDictionary)acknowledgeResetTimers
{
  return self->_acknowledgeResetTimers;
}

- (void)setAcknowledgeResetTimers:(id)a3
{
}

- (MSVTimer)playbackTimeoutTimer
{
  return self->_playbackTimeoutTimer;
}

- (void)setPlaybackTimeoutTimer:(id)a3
{
}

- (NSMutableDictionary)notifiedPendingParticipants
{
  return self->_notifiedPendingParticipants;
}

- (void)setNotifiedPendingParticipants:(id)a3
{
}

- (MRDGroupSessionAdvertiser)advertiser
{
  return self->_advertiser;
}

- (NSMutableSet)notificationSuppressIDs
{
  return self->_notificationSuppressIDs;
}

- (BOOL)advertisingPreferenceEnabled
{
  return self->_advertisingPreferenceEnabled;
}

- (void)setAdvertisingPreferenceEnabled:(BOOL)a3
{
  self->_advertisingPreferenceEnabled = a3;
}

- (BOOL)isAdvertising
{
  return self->_isAdvertising;
}

- (void)setIsAdvertising:(BOOL)a3
{
  self->_isAdvertising = a3;
}

- (NSString)notAdvertisingReason
{
  return self->_notAdvertisingReason;
}

- (void)setNotAdvertisingReason:(id)a3
{
}

- (NSString)notProxyAdvertisingReason
{
  return self->_notProxyAdvertisingReason;
}

- (void)setNotProxyAdvertisingReason:(id)a3
{
}

- (BOOL)isProxyAdvertising
{
  return self->_isProxyAdvertising;
}

- (void)setIsProxyAdvertising:(BOOL)a3
{
  self->_isProxyAdvertising = a3;
}

- (BOOL)hasGuestParticipants
{
  return self->_hasGuestParticipants;
}

- (void)setHasGuestParticipants:(BOOL)a3
{
  self->_hasGuestParticipants = a3;
}

- (MRDGroupSessionListener)listener
{
  return self->_listener;
}

- (MRDGroupSessionListener)homePodListener
{
  return self->_homePodListener;
}

- (_TtP12mediaremoted33MRDGroupSessionUIManagerInterface_)uiManager
{
  return self->_uiManager;
}

- (MRDGroupSessionHomeObserver)homeObserver
{
  return self->_homeObserver;
}

- (MRDGroupSessionProxyAuthorizationListener)proxyAuthorizationListener
{
  return self->_proxyAuthorizationListener;
}

- (MRDGroupSessionEligibilityMonitor)eligibilityMonitor
{
  return self->_eligibilityMonitor;
}

- (NSUserDefaults)sharePlayDefaults
{
  return self->_sharePlayDefaults;
}

- (NSMapTable)pendingCompletions
{
  return self->_pendingCompletions;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (NSDate)lastSessionEventDate
{
  return self->_lastSessionEventDate;
}

- (void)setLastSessionEventDate:(id)a3
{
}

- (int64_t)sessionManagementScreenVisibleCount
{
  return self->_sessionManagementScreenVisibleCount;
}

- (void)setSessionManagementScreenVisibleCount:(int64_t)a3
{
  self->_sessionManagementScreenVisibleCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastSessionEventDate, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pendingCompletions, 0);
  objc_storeStrong((id *)&self->_sharePlayDefaults, 0);
  objc_storeStrong((id *)&self->_eligibilityMonitor, 0);
  objc_storeStrong((id *)&self->_proxyAuthorizationListener, 0);
  objc_storeStrong((id *)&self->_homeObserver, 0);
  objc_storeStrong((id *)&self->_uiManager, 0);
  objc_storeStrong((id *)&self->_homePodListener, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_notProxyAdvertisingReason, 0);
  objc_storeStrong((id *)&self->_notAdvertisingReason, 0);
  objc_storeStrong((id *)&self->_notificationSuppressIDs, 0);
  objc_storeStrong((id *)&self->_advertiser, 0);
  objc_storeStrong((id *)&self->_notifiedPendingParticipants, 0);
  objc_storeStrong((id *)&self->_playbackTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_acknowledgeResetTimers, 0);
  objc_storeStrong((id *)&self->_acknowledgedSessionIdentifiers, 0);
  objc_storeStrong((id *)&self->_airPlayLeaderGroupSessionToken, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_discoveredSessions, 0);
}

@end