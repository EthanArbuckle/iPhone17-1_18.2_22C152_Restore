@interface SDAutoUnlockSuggestionManager
- (BOOL)alwaysShowSetupRetry;
- (BOOL)canSuggestForDeviceID:(id)a3;
- (BOOL)featureSuggestedForDeviceID:(id)a3;
- (BOOL)foundFirstPeer;
- (BOOL)ignoreBackOff;
- (BOOL)retriedSetup;
- (BOOL)shouldSendRequestsForDeviceID:(id)a3;
- (BOOL)suggestionsEnabled;
- (NSArray)currentBluetoothIDs;
- (NSMutableArray)foundPeers;
- (NSMutableArray)suggestedPeers;
- (NSString)setupRetryDeviceID;
- (NSString)suggestedDeviceID;
- (NSUUID)suggestionManagerSessionID;
- (OS_dispatch_queue)suggestionManagerQueue;
- (OS_dispatch_source)deviceTimer;
- (OS_dispatch_source)scanTimer;
- (OS_dispatch_source)serviceTimer;
- (OS_dispatch_source)setupRetryDeviceTimer;
- (SDAutoUnlockSuggestionManager)init;
- (SFAutoUnlockDevice)lastSuccessfulDevice;
- (SFAutoUnlockDevice)setupRetryDevice;
- (SFAutoUnlockDevice)suggestedPeer;
- (SFBLEScanner)scanner;
- (id)testDeviceID;
- (void)_systemHasPoweredOn;
- (void)_systemWillSleep;
- (void)addObservers;
- (void)handleFoundPeer:(id)a3;
- (void)handleTestSuggestion;
- (void)invalidateScanTimer;
- (void)invalidateScanner;
- (void)invalidateServiceTimer;
- (void)invalidateSetupRetryDeviceTimer;
- (void)invalidateSuggestedDeviceTimer;
- (void)invalidateSuggestionService;
- (void)loadSuggestedPeers;
- (void)postNotificationIfNeeded;
- (void)postSuggestionNotification;
- (void)restartScanTimer:(unint64_t)a3;
- (void)restartServiceTimer:(unint64_t)a3;
- (void)restartSetupRetryDeviceTimer:(int64_t)a3;
- (void)restartSuggestedDeviceTimer:(int64_t)a3;
- (void)screenLockUnlocked:(id)a3;
- (void)sendStartAdvertisingToDeviceID:(id)a3;
- (void)setCurrentBluetoothIDs:(id)a3;
- (void)setDeviceTimer:(id)a3;
- (void)setFeatureSuggestedForDeviceID:(id)a3;
- (void)setFoundFirstPeer:(BOOL)a3;
- (void)setFoundPeers:(id)a3;
- (void)setLastSuccessfulDevice:(id)a3;
- (void)setRetriedSetup;
- (void)setScanTimer:(id)a3;
- (void)setScanner:(id)a3;
- (void)setServiceTimer:(id)a3;
- (void)setSetupRetryDevice:(id)a3;
- (void)setSetupRetryDeviceID:(id)a3;
- (void)setSetupRetryDeviceTimer:(id)a3;
- (void)setSuggestedDeviceID:(id)a3;
- (void)setSuggestedPeer:(id)a3;
- (void)setSuggestedPeers:(id)a3;
- (void)setSuggestionManagerQueue:(id)a3;
- (void)setSuggestionManagerSessionID:(id)a3;
- (void)setupRetryIfNeeded;
- (void)setupRetryNotificationDismissed;
- (void)startScanningForIDSDeviceIDs:(id)a3;
- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6;
- (void)updateDefaultsForDeviceID:(id)a3;
- (void)updateSuggestionService;
- (void)watchAvailableForUnlockWithCompletionHandler:(id)a3;
@end

@implementation SDAutoUnlockSuggestionManager

- (SDAutoUnlockSuggestionManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)SDAutoUnlockSuggestionManager;
  v2 = [(SDAutoUnlockSuggestionManager *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.sharingd.auto-unlock.suggestion-manager-queue", 0);
    suggestionManagerQueue = v2->_suggestionManagerQueue;
    v2->_suggestionManagerQueue = (OS_dispatch_queue *)v3;

    v5 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:@"C42094B4-B936-4673-8034-4EEFD437BEB0"];
    suggestionManagerSessionID = v2->_suggestionManagerSessionID;
    v2->_suggestionManagerSessionID = v5;

    uint64_t v7 = objc_opt_new();
    foundPeers = v2->_foundPeers;
    v2->_foundPeers = (NSMutableArray *)v7;

    [(SDAutoUnlockSuggestionManager *)v2 loadSuggestedPeers];
    v9 = +[SDAutoUnlockTransport sharedTransport];
    [v9 addClient:v2 forIdentifer:@"C42094B4-B936-4673-8034-4EEFD437BEB0"];

    [(SDAutoUnlockSuggestionManager *)v2 addObservers];
  }
  return v2;
}

- (void)addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_systemWillSleep" name:@"com.apple.sharingd.SystemWillSleep" object:0];
  [v3 addObserver:self selector:"_systemHasPoweredOn" name:@"com.apple.sharingd.SystemHasPoweredOn" object:0];
}

- (void)handleTestSuggestion
{
  if (IsAppleInternalBuild())
  {
    id v3 = +[SDAutoUnlockTransport sharedTransport];
    v4 = [(SDAutoUnlockSuggestionManager *)self testDeviceID];
    id v6 = [v3 autoUnlockDeviceForDeviceID:v4];

    if (v6)
    {
      v5 = [(SDAutoUnlockSuggestionManager *)self foundPeers];
      [v5 setObject:v6 atIndexedSubscript:0];

      [(SDAutoUnlockSuggestionManager *)self postSuggestionNotification];
    }
  }
}

- (void)screenLockUnlocked:(id)a3
{
  v4 = auto_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received screen lock unlocked notification", v6, 2u);
  }

  [(SDAutoUnlockSuggestionManager *)self triggerDevicesIfNeeded];
  v5 = +[SDAutoUnlockAKSManager sharedManager];
  [v5 updateDynamicStoreEnabled];

  [(SDAutoUnlockSuggestionManager *)self setupRetryIfNeeded];
}

- (void)setupRetryIfNeeded
{
  if (IsAppleInternalBuild())
  {
    unsigned int v3 = [(SDAutoUnlockSuggestionManager *)self retriedSetup];
    unsigned int v4 = [(SDAutoUnlockSuggestionManager *)self alwaysShowSetupRetry];
    unsigned int v5 = v4;
    if ((!v3 || v4)
      && ([(SDAutoUnlockSuggestionManager *)self lastSuccessfulDevice],
          id v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          v6))
    {
      uint64_t v7 = [(SDAutoUnlockSuggestionManager *)self lastSuccessfulDevice];
      [(SDAutoUnlockSuggestionManager *)self setSetupRetryDevice:v7];

      [(SDAutoUnlockSuggestionManager *)self setLastSuccessfulDevice:0];
      id v13 = +[SDAutoUnlockNotificationsManager sharedManager];
      v8 = [(SDAutoUnlockSuggestionManager *)self setupRetryDevice];
      [v13 showSetupRetryNotificationWithDevice:v8];
    }
    else
    {
      v9 = auto_unlock_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        if (v3) {
          CFStringRef v10 = @"YES";
        }
        else {
          CFStringRef v10 = @"NO";
        }
        if (v5) {
          CFStringRef v11 = @"YES";
        }
        else {
          CFStringRef v11 = @"NO";
        }
        v12 = [(SDAutoUnlockSuggestionManager *)self lastSuccessfulDevice];
        *(_DWORD *)buf = 138412802;
        CFStringRef v15 = v10;
        __int16 v16 = 2112;
        CFStringRef v17 = v11;
        __int16 v18 = 2112;
        v19 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not initiating setup retry (already retried: %@, always show: %@, lastSuccessfulDevice: %@)", buf, 0x20u);
      }
    }
  }
}

- (void)setupRetryNotificationDismissed
{
  [(SDAutoUnlockSuggestionManager *)self setRetriedSetup];

  [(SDAutoUnlockSuggestionManager *)self setSetupRetryDevice:0];
}

- (void)setSetupRetryDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_setupRetryDeviceID, a3);
  if (!self->_setupRetryDeviceID)
  {
    unsigned int v4 = auto_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Retry setup device ID cleared", v5, 2u);
    }

    [(SDAutoUnlockSuggestionManager *)self invalidateSuggestedDeviceTimer];
  }
}

- (void)restartSetupRetryDeviceTimer:(int64_t)a3
{
  unsigned int v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Restarting retry setup device timer", buf, 2u);
  }

  id v6 = [(SDAutoUnlockSuggestionManager *)self setupRetryDeviceTimer];

  if (!v6)
  {
    uint64_t v7 = [(SDAutoUnlockSuggestionManager *)self suggestionManagerQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001E1D9C;
    v12[3] = &unk_1008CA4B8;
    v12[4] = self;
    v8 = sub_1001B1B10(0, v7, v12);
    [(SDAutoUnlockSuggestionManager *)self setSetupRetryDeviceTimer:v8];

    v9 = [(SDAutoUnlockSuggestionManager *)self setupRetryDeviceTimer];
    dispatch_resume(v9);
  }
  CFStringRef v10 = [(SDAutoUnlockSuggestionManager *)self setupRetryDeviceTimer];
  dispatch_time_t v11 = sub_1001B1AF8((double)a3);
  sub_1001B1BC4(v10, v11);
}

- (void)invalidateSetupRetryDeviceTimer
{
  unsigned int v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invaliding setup device device timer", v6, 2u);
  }

  unsigned int v4 = [(SDAutoUnlockSuggestionManager *)self setupRetryDeviceTimer];

  if (v4)
  {
    unsigned int v5 = [(SDAutoUnlockSuggestionManager *)self setupRetryDeviceTimer];
    dispatch_source_cancel(v5);

    [(SDAutoUnlockSuggestionManager *)self setSetupRetryDeviceTimer:0];
  }
}

- (void)postNotificationIfNeeded
{
  unsigned int v3 = [(SDAutoUnlockSuggestionManager *)self foundPeers];
  id v4 = [v3 count];

  if (v4)
  {
    unsigned int v5 = [(SDAutoUnlockSuggestionManager *)self foundPeers];
    [v5 sortUsingComparator:&stru_1008D0668];

    id v6 = auto_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(SDAutoUnlockSuggestionManager *)self foundPeers];
      int v8 = 138412290;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Suggestion Found Peers %@", (uint8_t *)&v8, 0xCu);
    }
    [(SDAutoUnlockSuggestionManager *)self postSuggestionNotification];
  }
}

- (void)postSuggestionNotification
{
  unsigned int v3 = [(SDAutoUnlockSuggestionManager *)self foundPeers];
  id v4 = [v3 objectAtIndexedSubscript:0];
  [(SDAutoUnlockSuggestionManager *)self setSuggestedPeer:v4];

  id v6 = +[SDAutoUnlockNotificationsManager sharedManager];
  unsigned int v5 = [(SDAutoUnlockSuggestionManager *)self suggestedPeer];
  [v6 showSuggestionNotificationWithDevice:v5];
}

- (void)setSuggestedDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedDeviceID, a3);
  if (!self->_suggestedDeviceID)
  {
    id v4 = auto_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Suggested device ID cleared", v5, 2u);
    }

    [(SDAutoUnlockSuggestionManager *)self invalidateSuggestedDeviceTimer];
  }
}

- (void)restartSuggestedDeviceTimer:(int64_t)a3
{
  unsigned int v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Restarting suggested device timer", buf, 2u);
  }

  id v6 = [(SDAutoUnlockSuggestionManager *)self deviceTimer];

  if (!v6)
  {
    uint64_t v7 = [(SDAutoUnlockSuggestionManager *)self suggestionManagerQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001E22D4;
    v12[3] = &unk_1008CA4B8;
    v12[4] = self;
    int v8 = sub_1001B1B10(0, v7, v12);
    [(SDAutoUnlockSuggestionManager *)self setDeviceTimer:v8];

    v9 = [(SDAutoUnlockSuggestionManager *)self deviceTimer];
    dispatch_resume(v9);
  }
  CFStringRef v10 = [(SDAutoUnlockSuggestionManager *)self deviceTimer];
  dispatch_time_t v11 = sub_1001B1AF8((double)a3);
  sub_1001B1BC4(v10, v11);
}

- (void)invalidateSuggestedDeviceTimer
{
  unsigned int v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invaliding suggested device timer", v6, 2u);
  }

  id v4 = [(SDAutoUnlockSuggestionManager *)self deviceTimer];

  if (v4)
  {
    unsigned int v5 = [(SDAutoUnlockSuggestionManager *)self deviceTimer];
    dispatch_source_cancel(v5);

    [(SDAutoUnlockSuggestionManager *)self setDeviceTimer:0];
  }
}

- (void)updateSuggestionService
{
  unsigned int v3 = +[SDAutoUnlockSessionManager sharedManager];
  [v3 addServiceClientForIdentifier:@"com.apple.sharing.auto-unlock-suggestion-manager"];

  dispatch_time_t v4 = sub_1001B1AF8(30.0);

  [(SDAutoUnlockSuggestionManager *)self restartServiceTimer:v4];
}

- (void)invalidateSuggestionService
{
  unsigned int v3 = +[SDAutoUnlockSessionManager sharedManager];
  [v3 removeServiceClientForIdentifier:@"com.apple.sharing.auto-unlock-suggestion-manager"];

  [(SDAutoUnlockSuggestionManager *)self invalidateServiceTimer];
}

- (void)restartServiceTimer:(unint64_t)a3
{
  unsigned int v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Restarting suggestion service timer", buf, 2u);
  }

  id v6 = [(SDAutoUnlockSuggestionManager *)self serviceTimer];

  if (!v6)
  {
    uint64_t v7 = [(SDAutoUnlockSuggestionManager *)self suggestionManagerQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001E2604;
    v11[3] = &unk_1008CA4B8;
    v11[4] = self;
    int v8 = sub_1001B1B10(0, v7, v11);
    [(SDAutoUnlockSuggestionManager *)self setServiceTimer:v8];

    v9 = [(SDAutoUnlockSuggestionManager *)self serviceTimer];
    dispatch_resume(v9);
  }
  CFStringRef v10 = [(SDAutoUnlockSuggestionManager *)self serviceTimer];
  sub_1001B1BC4(v10, a3);
}

- (void)invalidateServiceTimer
{
  unsigned int v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invaliding suggestion service timer", v6, 2u);
  }

  dispatch_time_t v4 = [(SDAutoUnlockSuggestionManager *)self serviceTimer];

  if (v4)
  {
    unsigned int v5 = [(SDAutoUnlockSuggestionManager *)self serviceTimer];
    dispatch_source_cancel(v5);

    [(SDAutoUnlockSuggestionManager *)self setServiceTimer:0];
  }
}

- (void)startScanningForIDSDeviceIDs:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SDAutoUnlockSuggestionManager *)self scanner];

  if (v5)
  {
    id v6 = auto_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Already scanning for suggestions", buf, 2u);
    }
LABEL_19:

    [(SDAutoUnlockSuggestionManager *)self restartScanTimer:sub_1001B1AF8(30.0)];
    goto LABEL_20;
  }
  uint64_t v7 = +[SDAutoUnlockTransport sharedTransport];
  int v8 = [v7 autoUnlockEligibleWatches];
  v9 = [v8 allObjects];

  CFStringRef v10 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = v9;
  id v11 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v36;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v6);
        }
        v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        CFStringRef v15 = [v14 uniqueID];
        unsigned int v16 = [v4 containsObject:v15];

        if (v16)
        {
          CFStringRef v17 = [v14 bluetoothID];
          [v10 addObject:v17];
        }
      }
      id v11 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v11);
  }

  if ([v10 count])
  {
    id location = 0;
    objc_initWeak(&location, self);
    __int16 v18 = [(SDAutoUnlockSuggestionManager *)self scanner];

    if (v18)
    {
      v19 = [(SDAutoUnlockSuggestionManager *)self scanner];
      [v19 invalidate];
    }
    id v20 = [objc_alloc((Class)SFBLEScanner) initWithType:16];
    [(SDAutoUnlockSuggestionManager *)self setScanner:v20];

    v21 = [(SDAutoUnlockSuggestionManager *)self suggestionManagerQueue];
    v22 = [(SDAutoUnlockSuggestionManager *)self scanner];
    [v22 setDispatchQueue:v21];

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1001E2C0C;
    v32[3] = &unk_1008CD1B0;
    objc_copyWeak(&v33, &location);
    v23 = [(SDAutoUnlockSuggestionManager *)self scanner];
    [v23 setDeviceFoundHandler:v32];

    v24 = [(SDAutoUnlockSuggestionManager *)self scanner];
    [v24 setInvalidationHandler:&stru_1008D0688];

    v25 = auto_unlock_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v10;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Suggestion scanning for bluetooth IDs %@", buf, 0xCu);
    }

    v26 = [v10 allObjects];
    v27 = [(SDAutoUnlockSuggestionManager *)self scanner];
    [v27 setDeviceFilter:v26];

    v28 = [v10 allObjects];
    [(SDAutoUnlockSuggestionManager *)self setCurrentBluetoothIDs:v28];

    v29 = [(SDAutoUnlockSuggestionManager *)self scanner];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1001E2CE4;
    v31[3] = &unk_1008CA5A8;
    v31[4] = self;
    [v29 activateWithCompletion:v31];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

    goto LABEL_19;
  }
  v30 = auto_unlock_log();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "No devices to scan for, not starting suggetion scanner", buf, 2u);
  }

LABEL_20:
}

- (void)handleFoundPeer:(id)a3
{
  id v4 = a3;
  unsigned int v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v24 = 138412290;
    *(void *)&v24[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Suggestion manager found peer: %@", v24, 0xCu);
  }

  uint64_t v6 = [v4 identifier];
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v7 = (void *)v6;
  int v8 = [(SDAutoUnlockSuggestionManager *)self currentBluetoothIDs];
  v9 = [v4 identifier];
  unsigned int v10 = [v8 containsObject:v9];

  if (v10)
  {
    BOOL v11 = sub_1000D2224(v4);
    uint64_t v12 = +[SDAutoUnlockTransport sharedTransport];
    id v13 = [v4 identifier];
    v14 = [v12 autoUnlockDeviceForBluetoothID:v13];

    if (v14) {
      unsigned int v15 = [v14 supportsAdvertisingUnlocked] ^ 1 | v11;
    }
    else {
      unsigned int v15 = 0;
    }
    __int16 v18 = auto_unlock_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      if (v14) {
        CFStringRef v19 = @"YES";
      }
      else {
        CFStringRef v19 = @"NO";
      }
      if ([v14 supportsAdvertisingUnlocked]) {
        CFStringRef v20 = @"YES";
      }
      else {
        CFStringRef v20 = @"NO";
      }
      *(_DWORD *)v24 = 138412802;
      *(void *)&v24[4] = v19;
      if (v11) {
        CFStringRef v21 = @"YES";
      }
      else {
        CFStringRef v21 = @"NO";
      }
      *(_WORD *)&v24[12] = 2112;
      *(void *)&v24[14] = v20;
      __int16 v25 = 2112;
      CFStringRef v26 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Suggestion manager peer (device: %@, supports advertising unlocked: %@, unlocked on wrist: %@)", v24, 0x20u);
    }

    if (v15)
    {
      v22 = [(SDAutoUnlockSuggestionManager *)self foundPeers];
      if ([v22 containsObject:v4])
      {
LABEL_27:

        goto LABEL_28;
      }
      unsigned __int8 v23 = [v14 unlockEnabled];

      if ((v23 & 1) == 0)
      {
        if (![(SDAutoUnlockSuggestionManager *)self foundFirstPeer])
        {
          [(SDAutoUnlockSuggestionManager *)self setFoundFirstPeer:1];
          [(SDAutoUnlockSuggestionManager *)self restartScanTimer:sub_1001B1AF8(3.0)];
        }
        v22 = [(SDAutoUnlockSuggestionManager *)self foundPeers];
        [v22 addObject:v14];
        goto LABEL_27;
      }
    }
  }
  else
  {
LABEL_7:
    v14 = auto_unlock_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = [v4 identifier];
      CFStringRef v17 = [v16 UUIDString];
      *(_DWORD *)v24 = 138412290;
      *(void *)&v24[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not looking for peer, ignoring: %@", v24, 0xCu);
    }
  }
LABEL_28:
}

- (void)invalidateScanner
{
  unsigned int v3 = [(SDAutoUnlockSuggestionManager *)self scanner];

  if (v3)
  {
    id v4 = auto_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating suggestion scanner", v7, 2u);
    }

    unsigned int v5 = [(SDAutoUnlockSuggestionManager *)self scanner];
    [v5 invalidate];

    [(SDAutoUnlockSuggestionManager *)self setScanner:0];
    [(SDAutoUnlockSuggestionManager *)self setCurrentBluetoothIDs:0];
    [(SDAutoUnlockSuggestionManager *)self setFoundFirstPeer:0];
    uint64_t v6 = [(SDAutoUnlockSuggestionManager *)self foundPeers];
    [v6 removeAllObjects];

    [(SDAutoUnlockSuggestionManager *)self invalidateScanTimer];
  }
}

- (void)restartScanTimer:(unint64_t)a3
{
  unsigned int v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Restarting suggestion scan timer", buf, 2u);
  }

  uint64_t v6 = [(SDAutoUnlockSuggestionManager *)self scanTimer];

  if (!v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001E32BC;
    v10[3] = &unk_1008CA4B8;
    v10[4] = self;
    uint64_t v7 = sub_1001B1B10(0, &_dispatch_main_q, v10);
    [(SDAutoUnlockSuggestionManager *)self setScanTimer:v7];

    int v8 = [(SDAutoUnlockSuggestionManager *)self scanTimer];
    dispatch_resume(v8);
  }
  v9 = [(SDAutoUnlockSuggestionManager *)self scanTimer];
  sub_1001B1BC4(v9, a3);
}

- (void)invalidateScanTimer
{
  unsigned int v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invaliding suggestion scan timer", v6, 2u);
  }

  id v4 = [(SDAutoUnlockSuggestionManager *)self scanTimer];

  if (v4)
  {
    unsigned int v5 = [(SDAutoUnlockSuggestionManager *)self scanTimer];
    dispatch_source_cancel(v5);

    [(SDAutoUnlockSuggestionManager *)self setScanTimer:0];
  }
}

- (void)sendStartAdvertisingToDeviceID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = objc_opt_new();
  [v5 setVersion:2];
  uint64_t v6 = +[SDAutoUnlockTransport sharedTransport];
  uint64_t v7 = [v5 data];
  int v8 = [(SDAutoUnlockSuggestionManager *)self suggestionManagerSessionID];
  v9 = +[NSNumber numberWithInteger:15];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E351C;
  v11[3] = &unk_1008CA5A8;
  id v12 = v4;
  id v10 = v4;
  [v6 sendPayload:v7 toDevice:v10 type:401 sessionID:v8 timeout:v9 errorHandler:v11];
}

- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  BOOL v11 = [(SDAutoUnlockSuggestionManager *)self suggestionManagerQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001E3650;
  v14[3] = &unk_1008CA3D8;
  unsigned __int16 v18 = a5;
  id v15 = v10;
  id v16 = v9;
  CFStringRef v17 = self;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(v11, v14);
}

- (void)watchAvailableForUnlockWithCompletionHandler:(id)a3
{
}

- (BOOL)shouldSendRequestsForDeviceID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[SDAutoUnlockAKSManager sharedManager];
  unsigned int v6 = [v5 deviceEnabledAsKey:v4];

  uint64_t v7 = auto_unlock_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    if (v6) {
      CFStringRef v8 = @"YES";
    }
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    CFStringRef v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Should send request (device: %@ enabled: %@)", (uint8_t *)&v11, 0x16u);
  }

  if (v6) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = [(SDAutoUnlockSuggestionManager *)self canSuggestForDeviceID:v4];
  }

  return v9;
}

- (BOOL)canSuggestForDeviceID:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 objectForKey:@"AutoUnlockPeerRetries"];
  unsigned int v6 = [v5 objectForKeyedSubscript:v3];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"AutoUnlockRetryDate"];
  CFStringRef v8 = [v6 objectForKeyedSubscript:@"AutoUnlockRetryMultiplier"];
  if ((uint64_t)[v8 integerValue] > 2048)
  {
    id v12 = auto_unlock_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v3;
      __int16 v18 = 2048;
      id v19 = [v8 integerValue];
      __int16 v13 = "Reached limit of suggestions (device %@, multiplier: %ld)";
      goto LABEL_8;
    }
  }
  else
  {
    if (!v7
      || (BOOL v9 = objc_opt_new(),
          [v9 timeIntervalSinceDate:v7],
          double v11 = v10,
          v9,
          v11 >= 0.0))
    {
      BOOL v14 = 1;
      goto LABEL_11;
    }
    id v12 = auto_unlock_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v3;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v13 = "Suggestions still backing off (device %@, retry date %@)";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 0x16u);
    }
  }

  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)updateDefaultsForDeviceID:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 objectForKey:@"AutoUnlockPeerRetries"];
  id v6 = [v5 mutableCopy];

  uint64_t v7 = [v6 objectForKeyedSubscript:v3];
  id v8 = [v7 mutableCopy];

  uint64_t v9 = [v8 objectForKeyedSubscript:@"AutoUnlockRetryMultiplier"];
  if (v9) {
    double v10 = (_UNKNOWN **)v9;
  }
  else {
    double v10 = &off_100902E08;
  }
  if ((uint64_t)[v10 integerValue] > 128)
  {
    double v12 = 604800.0;
  }
  else
  {
    uint64_t v11 = (uint64_t)[v10 integerValue];
    if (v11 >= 24) {
      double v12 = (double)(3600 * v11);
    }
    else {
      double v12 = 86400.0;
    }
  }
  __int16 v13 = objc_opt_new();
  BOOL v14 = [v13 dateByAddingTimeInterval:v12];

  id v15 = auto_unlock_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138413058;
    id v19 = v3;
    __int16 v20 = 2048;
    id v21 = [v10 integerValue];
    __int16 v22 = 2048;
    uint64_t v23 = (uint64_t)v12;
    __int16 v24 = 2112;
    __int16 v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Next suggestion (device: %@, multiplier: %ld, seconds: %ld, retry date %@)", (uint8_t *)&v18, 0x2Au);
  }

  int v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 2 * (void)[v10 integerValue]);

  if (!v8)
  {
    id v8 = (id)objc_opt_new();
    if (v6) {
      goto LABEL_13;
    }
LABEL_15:
    id v6 = (id)objc_opt_new();
    goto LABEL_13;
  }
  if (!v6) {
    goto LABEL_15;
  }
LABEL_13:
  [v8 setObject:v14 forKeyedSubscript:@"AutoUnlockRetryDate"];
  [v8 setObject:v16 forKeyedSubscript:@"AutoUnlockRetryMultiplier"];
  id v17 = [v8 copy];
  [v6 setObject:v17 forKeyedSubscript:v3];

  [v4 setObject:v6 forKey:@"AutoUnlockPeerRetries"];
  [v4 synchronize];
}

- (BOOL)featureSuggestedForDeviceID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SDAutoUnlockSuggestionManager *)self suggestedPeers];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)setFeatureSuggestedForDeviceID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting feature suggested for device: %@", (uint8_t *)&v11, 0xCu);
  }

  if (v4)
  {
    unsigned __int8 v6 = [(SDAutoUnlockSuggestionManager *)self suggestedPeers];
    unsigned __int8 v7 = [v6 containsObject:v4];

    if ((v7 & 1) == 0)
    {
      id v8 = [(SDAutoUnlockSuggestionManager *)self suggestedPeers];
      [v8 addObject:v4];

      uint64_t v9 = +[NSUserDefaults standardUserDefaults];
      double v10 = [(SDAutoUnlockSuggestionManager *)self suggestedPeers];
      [v9 setObject:v10 forKey:@"AutoUnlockSuggestedPeers"];

      [v9 synchronize];
    }
  }
}

- (void)loadSuggestedPeers
{
  id v6 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v6 objectForKey:@"AutoUnlockSuggestedPeers"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = [v3 mutableCopy];
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  unsigned int v5 = v4;
  [(SDAutoUnlockSuggestionManager *)self setSuggestedPeers:v4];
}

- (BOOL)retriedSetup
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 integerForKey:@"AutoUnlockSetupRetryVersion"];
  id v4 = auto_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Retry version: %ld", (uint8_t *)&v6, 0xCu);
  }

  return (uint64_t)v3 > 0;
}

- (void)setRetriedSetup
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  [v2 setInteger:1 forKey:@"AutoUnlockSetupRetryVersion"];
}

- (BOOL)suggestionsEnabled
{
  return sub_1000D9060(@"AUSuggestionsEnabled", 1) != 0;
}

- (BOOL)ignoreBackOff
{
  return sub_1000D9060(@"AUSuggestionsIgnoreBackoff", 0) != 0;
}

- (id)testDeviceID
{
  id v2 = (void *)sub_1000D91F0(@"AUSuggestionsTestDeviceID");

  return v2;
}

- (BOOL)alwaysShowSetupRetry
{
  return sub_1000D9060(@"AUAlwaysShowSetupRetry", 0) != 0;
}

- (void)_systemWillSleep
{
  suggestionManagerQueue = self->_suggestionManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E42E4;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(suggestionManagerQueue, block);
}

- (void)_systemHasPoweredOn
{
  suggestionManagerQueue = self->_suggestionManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E4360;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(suggestionManagerQueue, block);
}

- (NSString)suggestedDeviceID
{
  return self->_suggestedDeviceID;
}

- (NSString)setupRetryDeviceID
{
  return self->_setupRetryDeviceID;
}

- (SFAutoUnlockDevice)lastSuccessfulDevice
{
  return self->_lastSuccessfulDevice;
}

- (void)setLastSuccessfulDevice:(id)a3
{
}

- (BOOL)foundFirstPeer
{
  return self->_foundFirstPeer;
}

- (void)setFoundFirstPeer:(BOOL)a3
{
  self->_foundFirstPeer = a3;
}

- (SFBLEScanner)scanner
{
  return self->_scanner;
}

- (void)setScanner:(id)a3
{
}

- (NSMutableArray)foundPeers
{
  return self->_foundPeers;
}

- (void)setFoundPeers:(id)a3
{
}

- (OS_dispatch_source)scanTimer
{
  return self->_scanTimer;
}

- (void)setScanTimer:(id)a3
{
}

- (NSArray)currentBluetoothIDs
{
  return self->_currentBluetoothIDs;
}

- (void)setCurrentBluetoothIDs:(id)a3
{
}

- (OS_dispatch_source)serviceTimer
{
  return self->_serviceTimer;
}

- (void)setServiceTimer:(id)a3
{
}

- (OS_dispatch_source)deviceTimer
{
  return self->_deviceTimer;
}

- (void)setDeviceTimer:(id)a3
{
}

- (OS_dispatch_source)setupRetryDeviceTimer
{
  return self->_setupRetryDeviceTimer;
}

- (void)setSetupRetryDeviceTimer:(id)a3
{
}

- (NSMutableArray)suggestedPeers
{
  return self->_suggestedPeers;
}

- (void)setSuggestedPeers:(id)a3
{
}

- (SFAutoUnlockDevice)suggestedPeer
{
  return self->_suggestedPeer;
}

- (void)setSuggestedPeer:(id)a3
{
}

- (NSUUID)suggestionManagerSessionID
{
  return self->_suggestionManagerSessionID;
}

- (void)setSuggestionManagerSessionID:(id)a3
{
}

- (SFAutoUnlockDevice)setupRetryDevice
{
  return self->_setupRetryDevice;
}

- (void)setSetupRetryDevice:(id)a3
{
}

- (OS_dispatch_queue)suggestionManagerQueue
{
  return self->_suggestionManagerQueue;
}

- (void)setSuggestionManagerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionManagerQueue, 0);
  objc_storeStrong((id *)&self->_setupRetryDevice, 0);
  objc_storeStrong((id *)&self->_suggestionManagerSessionID, 0);
  objc_storeStrong((id *)&self->_suggestedPeer, 0);
  objc_storeStrong((id *)&self->_suggestedPeers, 0);
  objc_storeStrong((id *)&self->_setupRetryDeviceTimer, 0);
  objc_storeStrong((id *)&self->_deviceTimer, 0);
  objc_storeStrong((id *)&self->_serviceTimer, 0);
  objc_storeStrong((id *)&self->_currentBluetoothIDs, 0);
  objc_storeStrong((id *)&self->_scanTimer, 0);
  objc_storeStrong((id *)&self->_foundPeers, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulDevice, 0);
  objc_storeStrong((id *)&self->_setupRetryDeviceID, 0);

  objc_storeStrong((id *)&self->_suggestedDeviceID, 0);
}

@end