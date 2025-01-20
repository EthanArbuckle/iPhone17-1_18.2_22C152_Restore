@interface SDUnlockKeyManager
+ (id)sharedKeyManager;
- (BOOL)autoUnlockEnabledUpdatedAfterFirstUnlock;
- (BOOL)initiateStashBagCreationWithManifest:(id)a3;
- (BOOL)ltkWaitingForUnlock;
- (BOOL)needsOffWristBeforePairedUnlock;
- (BOOL)outstandingStartLTK;
- (BOOL)pairedWatchSupportsRelock;
- (BOOL)remoteDeviceLocked;
- (BOOL)shouldStartUnlock;
- (BOOL)shouldUseTwoPartPill;
- (BOOL)startUnlockIfNeeded;
- (BOOL)unlockEnabled;
- (BOOL)unlockingForKeybagUnlock;
- (BOOL)updateLongTermKey:(id)a3;
- (BOOL)useEscrowRecord;
- (BOOL)waitingForAutoUnlockStateUpdateToStartPairedUnlock;
- (BOOL)wasInLockScreen;
- (NSDate)deviceSwitchUnlockRetryDate;
- (NSTimer)stashTimer;
- (OS_dispatch_source)delayedStartTimer;
- (OS_dispatch_source)longTermKeyTimer;
- (OS_dispatch_source)stateTimer;
- (SDUnlockKeyManager)init;
- (SDUnlockKeyMetricDates)metricDates;
- (SDUnlockSessionRecord)sessionRecord;
- (id)generateDebugInfo;
- (id)getWatchNameForTesting;
- (id)keybagAssertion;
- (id)stashHandler;
- (id)stateHandler;
- (id)stringForState:(int64_t)a3;
- (int64_t)unlockingState;
- (void)addObservers;
- (void)addObserversForTests;
- (void)bannerDidDismiss;
- (void)bannerLockButtonWasTapped;
- (void)beginUnlockIfNotOnLockScreen;
- (void)checkDevicePairingState;
- (void)consolidateLatencies:(id)a3;
- (void)debugInfoRequested:(id)a3;
- (void)deviceDidEnterConfigurationState:(id)a3;
- (void)devicesDidFailToPair:(id)a3;
- (void)devicesDidUnpair:(id)a3;
- (void)disableUnlockPairing;
- (void)disableUnlockPairingForSecurityManager:(id)a3;
- (void)establishStashBagWithCompletionHandler:(id)a3;
- (void)establishStashBagWithManifest:(id)a3 completionHandler:(id)a4;
- (void)handleActiveDeviceUpdated;
- (void)handleAutoUnlockEnabledStateUpdated;
- (void)handleClassALongTermKeyRequest:(id)a3;
- (void)handleConfigState;
- (void)handleCreateEscrowSecret:(id)a3;
- (void)handleEscrowSessionRequest:(unsigned int)a3 withUpdatedLongTermKey:(BOOL)a4;
- (void)handleLongTermKeyRequest:(id)a3;
- (void)handlePairedWatchWristStateChanged;
- (void)handleRemoteLockStateChanged:(id)a3;
- (void)handleResetState:(id)a3;
- (void)handleSessionKeyExchangeResponse:(id)a3;
- (void)handleSetupRequest:(id)a3;
- (void)handleStashConfirmation:(id)a3;
- (void)handleStashKeyExchangeResponse:(id)a3;
- (void)handleSystemUIChanged;
- (void)handleUILockStateChange;
- (void)handleUnlockConfirmation:(id)a3;
- (void)handleUnlockStateResponse:(id)a3;
- (void)idsController:(id)a3 didReceiveProtoData:(id)a4 forType:(unsigned __int16)a5;
- (void)idsControllerNearbyStateChanged:(id)a3;
- (void)initializeMetrics;
- (void)initiateRemoteUnlock;
- (void)invalidateDelayedStartTimer;
- (void)invalidateLongTermKeyTimer;
- (void)invalidateStashTimer;
- (void)invalidateStateTimer;
- (void)keyBagLockStateChange:(id)a3;
- (void)newDeviceBecameActive:(id)a3;
- (void)notifyStashStateWithError:(id)a3;
- (void)notifyUnlockStateWithState:(id)a3 error:(id)a4;
- (void)releaseKeyBagAssertion;
- (void)resetAndClearState;
- (void)resetSetupState;
- (void)resetState;
- (void)restartDelayedStartTimer:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)restartLongTermKeyTimer:(unint64_t)a3;
- (void)restartStashTimer;
- (void)restartStateTimer;
- (void)sendClassALongTermKeyResponse:(id)a3 sessionID:(unsigned int)a4 errorCode:(unsigned int)a5;
- (void)sendLongTermKeyResponse:(id)a3 requestID:(id)a4;
- (void)sendRelockRequestWithReset:(BOOL)a3;
- (void)sendSessionAuthenticationToken:(id)a3 sessionID:(unsigned int)a4;
- (void)sendSessionKeyExchangeRequest:(id)a3 usedEscrow:(BOOL)a4 sessionID:(unsigned int)a5;
- (void)sendSetupCreateEscrowRecordWithSessionID:(unsigned int)a3 stepData:(id)a4 errorCode:(int64_t)a5;
- (void)sendSetupSessionCreatedWithLocalKey:(id)a3 stepData:(id)a4 sessionID:(unsigned int)a5 errorCode:(int64_t)a6;
- (void)sendStartLTKTransfer;
- (void)sendStashKeyRequest:(id)a3 sessionID:(unsigned int)a4;
- (void)sendStashToken:(id)a3 sessionID:(unsigned int)a4;
- (void)sendStateRequest;
- (void)setAutoUnlockEnabledUpdatedAfterFirstUnlock:(BOOL)a3;
- (void)setDelayedStartTimer:(id)a3;
- (void)setDeviceSwitchUnlockRetryDate:(id)a3;
- (void)setKeybagAssertion:(id)a3;
- (void)setLongTermKeyTimer:(id)a3;
- (void)setLtkWaitingForUnlock:(BOOL)a3;
- (void)setMetricDates:(id)a3;
- (void)setNeedsOffWristBeforePairedUnlock:(BOOL)a3;
- (void)setOutstandingStartLTK:(BOOL)a3;
- (void)setRemoteDeviceLocked:(BOOL)a3;
- (void)setSessionRecord:(id)a3;
- (void)setStashHandler:(id)a3;
- (void)setStashTimer:(id)a3;
- (void)setStateHandler:(id)a3;
- (void)setStateTimer:(id)a3;
- (void)setUnlockingForKeybagUnlock:(BOOL)a3;
- (void)setUnlockingState:(int64_t)a3;
- (void)setUseEscrowRecord:(BOOL)a3;
- (void)setWaitingForAutoUnlockStateUpdateToStartPairedUnlock:(BOOL)a3;
- (void)setWasInLockScreen:(BOOL)a3;
- (void)startLTKExchange;
- (void)stashTimerFired:(id)a3;
- (void)syncUnlockEnabled:(BOOL)a3;
- (void)takeMobileKeybagAssertion;
- (void)unlockStateForDevice:(id)a3 completionHandler:(id)a4;
@end

@implementation SDUnlockKeyManager

- (BOOL)wasInLockScreen
{
  return self->_wasInLockScreen;
}

- (void)setWasInLockScreen:(BOOL)a3
{
  self->_wasInLockScreen = a3;
}

- (void)handleSystemUIChanged
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A888;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

+ (id)sharedKeyManager
{
  if (qword_100980458 != -1) {
    dispatch_once(&qword_100980458, &stru_1008D0CA0);
  }
  v2 = (void *)qword_100980450;

  return v2;
}

- (SDUnlockKeyManager)init
{
  v20.receiver = self;
  v20.super_class = (Class)SDUnlockKeyManager;
  v2 = [(SDUnlockSessionManager *)&v20 init];
  v3 = v2;
  if (v2)
  {
    stateTimer = v2->_stateTimer;
    v2->_stateTimer = 0;

    id stashHandler = v3->_stashHandler;
    v3->_id stashHandler = 0;

    id stateHandler = v3->_stateHandler;
    v3->_id stateHandler = 0;

    sessionRecord = v3->_sessionRecord;
    v3->_sessionRecord = 0;

    v3->_useEscrowRecord = 1;
    v3->_remoteDeviceLocked = 1;
    v3->_unlockingState = 0;
    v8 = +[SDStatusMonitor sharedMonitor];
    v3->_wasInLockScreen = [v8 deviceKeyBagLocked];

    v9 = objc_alloc_init(SDUnlockKeyMetricDates);
    metricDates = v3->_metricDates;
    v3->_metricDates = v9;

    [(SDUnlockKeyManager *)v3 addObservers];
    [(SDUnlockKeyManager *)v3 checkDevicePairingState];
    v11 = paired_unlock_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = [(SDUnlockSessionManager *)v3 pairingCompatibilityState];
      unsigned int v13 = [(SDUnlockSessionManager *)v3 deviceIsPaired];
      CFStringRef v14 = @"NO";
      if (v13) {
        CFStringRef v14 = @"YES";
      }
      *(_DWORD *)buf = 67109378;
      unsigned int v22 = v12;
      __int16 v23 = 2112;
      CFStringRef v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Key loading NanoRegitry, (compatibility state = %d, is paired = %@)", buf, 0x12u);
    }

    if ([(SDUnlockSessionManager *)v3 inConfigureState])
    {
      v15 = [(SDUnlockSessionManager *)v3 securityManager];
      v16 = [v15 localLongTermKey];
      if (v16)
      {
      }
      else
      {
        unsigned __int8 v17 = [(SDUnlockSessionManager *)v3 deviceIsPaired];

        if ((v17 & 1) == 0)
        {
          v18 = paired_unlock_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "NanoRegistry is already in the configure state", buf, 2u);
          }

          [(SDUnlockKeyManager *)v3 handleConfigState];
        }
      }
    }
    if (_os_feature_enabled_impl()) {
      [(SDUnlockKeyManager *)v3 setAutoUnlockEnabledUpdatedAfterFirstUnlock:1];
    }
  }
  return v3;
}

- (void)addObservers
{
  v14.receiver = self;
  v14.super_class = (Class)SDUnlockKeyManager;
  [(SDUnlockSessionManager *)&v14 addObservers];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handleUILockStateChange" name:@"com.apple.sharingd.UILockStatusChanged" object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"keyBagLockStateChange:" name:@"com.apple.sharingd.KeyBagLockStatusChanged" object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"handlePairedWatchWristStateChanged" name:@"com.apple.sharingd.PairedWatchWristStateChanged" object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"bannerDidDismiss" name:@"SDUnlockBannerCouldNotBeDisplayed" object:0];

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"bannerLockButtonWasTapped" name:@"SDUnlockBannerButtonTapped" object:0];

  v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"bannerDidDismiss" name:@"SDUnlockBannerDismissed" object:0];

  v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"handleAutoUnlockEnabledStateUpdated" name:@"SDAutoUnlockAKSManagerDynamicStoreUpdatedAfterFirstUnlockNotification" object:0];

  v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"devicesDidUnpair:" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];

  v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"newDeviceBecameActive:" name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];

  unsigned int v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"deviceDidEnterConfigurationState:" name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];

  unsigned int v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:self selector:"handleSystemUIChanged" name:@"com.apple.sharingd.SystemUIChanged" object:0];

  [(SDUnlockKeyManager *)self addObserversForTests];
}

- (void)debugInfoRequested:(id)a3
{
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [(SDUnlockKeyManager *)self generateDebugInfo];
  sub_100047144(v6, (uint64_t)v5);
}

- (id)generateDebugInfo
{
  v3 = objc_opt_new();
  v16.receiver = self;
  v16.super_class = (Class)SDUnlockKeyManager;
  v4 = [(SDUnlockSessionManager *)&v16 generateDebugInfo];
  [v3 addObjectsFromArray:v4];

  v5 = [(SDUnlockSessionManager *)self securityManager];
  if ([v5 checkForEscrowData]) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  v7 = +[NSString stringWithFormat:@"Escrow Secret Exists:%@", v6];
  [v3 addObject:v7];

  if ([(SDUnlockKeyManager *)self remoteDeviceLocked]) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  v9 = +[NSString stringWithFormat:@"Remote Device Locked:%@", v8];
  [v3 addObject:v9];

  v10 = [(SDUnlockKeyManager *)self stringForState:[(SDUnlockKeyManager *)self unlockingState]];
  v11 = +[NSString stringWithFormat:@"Unlocking State:%@", v10];
  [v3 addObject:v11];

  unsigned int v12 = [(SDUnlockSessionManager *)self securityManager];
  unsigned int v13 = [v12 allKeychainItems];
  objc_super v14 = +[NSString stringWithFormat:@"Keychain Items:%@", v13];
  [v3 addObject:v14];

  return v3;
}

- (id)getWatchNameForTesting
{
  v3 = [(SDUnlockSessionManager *)self activeDevice];

  if (v3)
  {
    v4 = [(SDUnlockSessionManager *)self activeDevice];
    v5 = [v4 valueForProperty:NRDevicePropertyName];
  }
  else
  {
    v5 = @"Nobody's Apple Watch";
  }
  CFStringRef v6 = +[NSUserDefaults standardUserDefaults];
  v7 = [v6 stringForKey:@"PairedUnlockWatchName"];
  CFStringRef v8 = v7;
  if (v7)
  {
    v9 = v7;

    v5 = v9;
  }

  return v5;
}

- (void)addObserversForTests
{
  int out_token = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1001F66B8;
  handler[3] = &unk_1008CACA8;
  handler[4] = self;
  notify_register_dispatch("PairedUnlock-banner-old", &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001F6728;
  v3[3] = &unk_1008CACA8;
  v3[4] = self;
  notify_register_dispatch("PairedUnlock-banner-new", &out_token, (dispatch_queue_t)&_dispatch_main_q, v3);

  notify_register_dispatch("PairedUnlock-banner-update", &out_token, (dispatch_queue_t)&_dispatch_main_q, &stru_1008D0CE0);
  notify_register_dispatch("PairedUnlock-banner-dismiss", &out_token, (dispatch_queue_t)&_dispatch_main_q, &stru_1008D0D00);
}

- (void)deviceDidEnterConfigurationState:(id)a3
{
  v4 = paired_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received config state notification", v6, 2u);
  }

  if ([(SDUnlockSessionManager *)self inConfigureState]
    && ![(SDUnlockSessionManager *)self deviceIsPaired])
  {
    [(SDUnlockKeyManager *)self handleConfigState];
  }
  else
  {
    v5 = paired_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1001FE5F8();
    }
  }
}

- (void)handleConfigState
{
  v3 = +[SDStatusMonitor sharedMonitor];
  if ([v3 deviceKeyBagUnlocked])
  {
  }
  else
  {
    v4 = +[SDStatusMonitor sharedMonitor];
    unsigned int v5 = [v4 deviceKeyBagDisabled];

    if (!v5)
    {
      BOOL v6 = 1;
      goto LABEL_6;
    }
  }
  [(SDUnlockKeyManager *)self startLTKExchange];
  BOOL v6 = 0;
LABEL_6:
  self->_ltkWaitingForUnlock = v6;
}

- (void)handleAutoUnlockEnabledStateUpdated
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F69E8;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)startLTKExchange
{
  [(SDUnlockSessionManager *)self updateSecurityManager];
  [(SDUnlockKeyManager *)self takeMobileKeybagAssertion];

  [(SDUnlockKeyManager *)self sendStartLTKTransfer];
}

- (void)keyBagLockStateChange:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v4 = paired_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = +[SDStatusMonitor sharedMonitor];
    sub_1001AC300((unint64_t)[v5 deviceKeyBagState]);
    BOOL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v17 = 138412290;
    CFStringRef v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Keybag state changed to %@", (uint8_t *)&v17, 0xCu);
  }
  v7 = +[SDStatusMonitor sharedMonitor];
  unsigned int v8 = [v7 deviceKeyBagUnlocked];

  if (!self->_ltkWaitingForUnlock || (v8 & 1) != 0)
  {
    if (!self->_ltkWaitingForUnlock) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v9 = +[SDStatusMonitor sharedMonitor];
  unsigned __int8 v10 = [v9 deviceKeyBagDisabled];

  if (v10)
  {
LABEL_8:
    [(SDUnlockKeyManager *)self startLTKExchange];
    self->_ltkWaitingForUnlock = 0;
  }
LABEL_9:
  if (_os_feature_enabled_impl())
  {
    [(SDUnlockKeyManager *)self setAutoUnlockEnabledUpdatedAfterFirstUnlock:1];
    if ((v8 & 1) == 0)
    {
LABEL_26:
      if (self->_unlockingForKeybagUnlock && [(SDUnlockKeyManager *)self unlockingState] <= 1)
      {
        objc_super v14 = paired_unlock_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Device locked before auth token sent. Cancelling", (uint8_t *)&v17, 2u);
        }

        v15 = [(SDUnlockSessionManager *)self metrics];

        if (v15)
        {
          objc_super v16 = [(SDUnlockSessionManager *)self metrics];
          [v16 setFailureReason:14];
        }
        [(SDUnlockKeyManager *)self resetAndClearState];
      }
      [(SDUnlockSessionManager *)self logMetrics];
      return;
    }
  }
  else if ([(SDUnlockKeyManager *)self autoUnlockEnabledUpdatedAfterFirstUnlock])
  {
    if (!v8) {
      goto LABEL_26;
    }
    if (![(SDUnlockKeyManager *)self shouldUseTwoPartPill])
    {
      self->_unlockingForKeybagUnlock = [(SDUnlockKeyManager *)self startUnlockIfNeeded];
      v11 = paired_unlock_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_unlockingForKeybagUnlock) {
          CFStringRef v12 = @"YES";
        }
        else {
          CFStringRef v12 = @"NO";
        }
        int v17 = 138412290;
        CFStringRef v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Paired Unlock started: %@", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  else
  {
    unsigned int v13 = paired_unlock_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not starting Paired Unlock until we can verify whether Auto Unlock is enabled", (uint8_t *)&v17, 2u);
    }

    [(SDUnlockKeyManager *)self setWaitingForAutoUnlockStateUpdateToStartPairedUnlock:1];
    if ((v8 & 1) == 0) {
      goto LABEL_26;
    }
  }
  if (!self->_unlockingForKeybagUnlock) {
    [(SDUnlockKeyManager *)self beginUnlockIfNotOnLockScreen];
  }
}

- (void)handleUILockStateChange
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = +[SDStatusMonitor sharedMonitor];
  unsigned int v4 = [v3 deviceUIUnlocked];

  unsigned int v5 = paired_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v4) {
      CFStringRef v6 = @"YES";
    }
    int v11 = 138412290;
    CFStringRef v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Key manager received UI lock state changed (UI unlocked: %@)", (uint8_t *)&v11, 0xCu);
  }

  if (v4)
  {
    v7 = [(SDUnlockSessionManager *)self securityManager];
    [v7 migrateEscrowDataIfNeeded];

    if ([(SDUnlockKeyManager *)self autoUnlockEnabledUpdatedAfterFirstUnlock])
    {
      if (self->_unlockingForKeybagUnlock) {
        goto LABEL_8;
      }
      if ([(SDUnlockKeyManager *)self shouldUseTwoPartPill])
      {
        if (!self->_unlockingForKeybagUnlock)
        {
          unsigned int v8 = paired_unlock_log();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_11;
          }
          LOWORD(v11) = 0;
          v9 = "Ignoring. Needs updated pill.";
          goto LABEL_10;
        }
LABEL_8:
        unsigned int v8 = paired_unlock_log();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
LABEL_11:

          return;
        }
        LOWORD(v11) = 0;
        v9 = "Already unlocking for keybag";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 2u);
        goto LABEL_11;
      }
      self->_unlockingForKeybagUnlock = [(SDUnlockKeyManager *)self startUnlockIfNeeded];
    }
    else
    {
      unsigned __int8 v10 = paired_unlock_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not starting Paired Unlock until we can verify whether Auto Unlock is enabled", (uint8_t *)&v11, 2u);
      }

      [(SDUnlockKeyManager *)self setWaitingForAutoUnlockStateUpdateToStartPairedUnlock:1];
    }
  }
}

- (void)beginUnlockIfNotOnLockScreen
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = +[SDStatusMonitor sharedMonitor];
  unsigned __int8 v4 = [v3 systemUIFlags];

  unsigned int v5 = +[SDStatusMonitor sharedMonitor];
  unsigned int v6 = [v5 deviceKeyBagUnlocked];

  if ((v4 & 2) != 0
    || ([(SDUnlockKeyManager *)self shouldUseTwoPartPill] & v6) != 1
    || self->_unlockingForKeybagUnlock)
  {
    v7 = paired_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if ((v4 & 2) != 0) {
        CFStringRef v8 = @"YES";
      }
      else {
        CFStringRef v8 = @"NO";
      }
      unsigned int v9 = [(SDUnlockKeyManager *)self shouldUseTwoPartPill];
      BOOL unlockingForKeybagUnlock = self->_unlockingForKeybagUnlock;
      if (v9) {
        CFStringRef v11 = @"YES";
      }
      else {
        CFStringRef v11 = @"NO";
      }
      int v19 = 138413058;
      if (v6) {
        CFStringRef v12 = @"YES";
      }
      else {
        CFStringRef v12 = @"NO";
      }
      CFStringRef v20 = v8;
      if (unlockingForKeybagUnlock) {
        CFStringRef v13 = @"YES";
      }
      else {
        CFStringRef v13 = @"NO";
      }
      __int16 v21 = 2112;
      CFStringRef v22 = v11;
      __int16 v23 = 2112;
      CFStringRef v24 = v12;
      __int16 v25 = 2112;
      CFStringRef v26 = v13;
      objc_super v14 = "Ignoring begin attempt. lock screen: %@, should use updated pill: %@, device unlocked: %@, ongoing watch unlock: %@";
      v15 = v7;
      uint32_t v16 = 42;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, v16);
    }
  }
  else
  {
    int v17 = paired_unlock_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Starting Paired Unlock if needed", (uint8_t *)&v19, 2u);
    }

    self->_BOOL unlockingForKeybagUnlock = [(SDUnlockKeyManager *)self startUnlockIfNeeded];
    v7 = paired_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_unlockingForKeybagUnlock) {
        CFStringRef v18 = @"YES";
      }
      else {
        CFStringRef v18 = @"NO";
      }
      int v19 = 138412290;
      CFStringRef v20 = v18;
      objc_super v14 = "Paired Unlock started: %@";
      v15 = v7;
      uint32_t v16 = 12;
      goto LABEL_18;
    }
  }
}

- (void)handlePairedWatchWristStateChanged
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F73E8;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)bannerDidDismiss
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F757C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)bannerLockButtonWasTapped
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F77B4;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)devicesDidUnpair:(id)a3
{
  id v4 = a3;
  unsigned int v5 = paired_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138477827;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received devices unpaired notification: %{private}@", (uint8_t *)&v14, 0xCu);
  }

  unsigned int v6 = [v4 userInfo];
  v7 = [v6 objectForKeyedSubscript:NRPairedDeviceRegistryDevice];

  CFStringRef v8 = paired_unlock_log();
  unsigned int v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138477827;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device from notification %{private}@", (uint8_t *)&v14, 0xCu);
    }

    unsigned __int8 v10 = [v7 valueForProperty:NRDevicePropertyPairingID];
    unsigned int v9 = [v10 UUIDString];

    CFStringRef v11 = [v7 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
    CFStringRef v12 = [v7 valueForProperty:NRDevicePropertyDeviceNameString];
    if (v9)
    {
      CFStringRef v13 = [[SDUnlockSecurityManager alloc] initWithPairingID:v9 pairingStorePath:v11 deviceName:v12];
      [(SDUnlockKeyManager *)self disableUnlockPairingForSecurityManager:v13];
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_1001FE6AC();
  }

  self->_outstandingStartLTK = 0;
  [(SDUnlockKeyManager *)self invalidateLongTermKeyTimer];
  [(SDUnlockKeyManager *)self releaseKeyBagAssertion];
}

- (void)devicesDidFailToPair:(id)a3
{
  id v4 = a3;
  unsigned int v5 = paired_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138477827;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received devices failed to pair notification: %{private}@", (uint8_t *)&v14, 0xCu);
  }

  unsigned int v6 = [v4 userInfo];
  v7 = [v6 objectForKeyedSubscript:NRPairedDeviceRegistryDevice];

  CFStringRef v8 = paired_unlock_log();
  unsigned int v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138477827;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device from notification %{private}@", (uint8_t *)&v14, 0xCu);
    }

    unsigned __int8 v10 = [v7 valueForProperty:NRDevicePropertyPairingID];
    unsigned int v9 = [v10 UUIDString];

    CFStringRef v11 = [v7 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
    CFStringRef v12 = [v7 valueForProperty:NRDevicePropertyDeviceNameString];
    if (v9)
    {
      CFStringRef v13 = [[SDUnlockSecurityManager alloc] initWithPairingID:v9 pairingStorePath:v11 deviceName:v12];
      [(SDUnlockKeyManager *)self disableUnlockPairingForSecurityManager:v13];
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_1001FE6E0();
  }

  self->_outstandingStartLTK = 0;
  [(SDUnlockKeyManager *)self invalidateLongTermKeyTimer];
  [(SDUnlockKeyManager *)self releaseKeyBagAssertion];
}

- (void)newDeviceBecameActive:(id)a3
{
  id v4 = paired_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(SDUnlockSessionManager *)self activeDeviceDescription];
    int v6 = 138477827;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device became active %{private}@", (uint8_t *)&v6, 0xCu);
  }
  [(SDUnlockKeyManager *)self handleActiveDeviceUpdated];
}

- (void)restartDelayedStartTimer:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v7 = paired_unlock_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Restarting delayed start timer", buf, 2u);
  }

  delayedStartTimer = self->_delayedStartTimer;
  if (!delayedStartTimer)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001F7F84;
    v11[3] = &unk_1008CB7D8;
    v11[4] = self;
    id v12 = v6;
    sub_1001B1B10(0, &_dispatch_main_q, v11);
    unsigned int v9 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
    unsigned __int8 v10 = self->_delayedStartTimer;
    self->_delayedStartTimer = v9;

    dispatch_resume((dispatch_object_t)self->_delayedStartTimer);
    delayedStartTimer = self->_delayedStartTimer;
  }
  sub_1001B1BC4(delayedStartTimer, a3);
}

- (void)invalidateDelayedStartTimer
{
  v3 = paired_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating delayed start timer", v6, 2u);
  }

  delayedStartTimer = self->_delayedStartTimer;
  if (delayedStartTimer)
  {
    dispatch_source_cancel(delayedStartTimer);
    unsigned int v5 = self->_delayedStartTimer;
    self->_delayedStartTimer = 0;
  }
}

- (void)restartLongTermKeyTimer:(unint64_t)a3
{
  unsigned int v5 = paired_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Restarting long-term key timer", buf, 2u);
  }

  longTermKeyTimer = self->_longTermKeyTimer;
  if (!longTermKeyTimer)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001F819C;
    v9[3] = &unk_1008CA4B8;
    v9[4] = self;
    sub_1001B1B10(0, &_dispatch_main_q, v9);
    v7 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
    CFStringRef v8 = self->_longTermKeyTimer;
    self->_longTermKeyTimer = v7;

    dispatch_resume((dispatch_object_t)self->_longTermKeyTimer);
    longTermKeyTimer = self->_longTermKeyTimer;
  }
  sub_1001B1BC4(longTermKeyTimer, a3);
}

- (void)invalidateLongTermKeyTimer
{
  v3 = paired_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating long-term key timer", v6, 2u);
  }

  longTermKeyTimer = self->_longTermKeyTimer;
  if (longTermKeyTimer)
  {
    dispatch_source_cancel(longTermKeyTimer);
    unsigned int v5 = self->_longTermKeyTimer;
    self->_longTermKeyTimer = 0;
  }
}

- (void)takeMobileKeybagAssertion
{
  v3 = paired_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Taking keybag assertion", (uint8_t *)&v7, 2u);
  }

  if (!self->_keybagAssertion)
  {
    id v4 = +[NSNumber numberWithDouble:(double)75 + 45.0 + 10.0, 0, @"MKBAssertionKey", @"MKBAssertionTimeout", @"RemoteProfile"];
    v9[1] = v4;
    +[NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:2];
    unsigned int v5 = (void *)MKBDeviceLockAssertion();
    id keybagAssertion = self->_keybagAssertion;
    self->_id keybagAssertion = v5;
  }
}

- (void)releaseKeyBagAssertion
{
  v3 = paired_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing keybag assertion", v5, 2u);
  }

  id keybagAssertion = self->_keybagAssertion;
  self->_id keybagAssertion = 0;
}

- (void)handleActiveDeviceUpdated
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F84F4;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)checkDevicePairingState
{
  if ([(SDUnlockSessionManager *)self deviceIsPaired]
    || [(SDUnlockSessionManager *)self inConfigureState])
  {
    v3 = paired_unlock_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = [(SDUnlockSessionManager *)self pairingCompatibilityState];
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Devices paired/pairing (state = %d)", (uint8_t *)v5, 8u);
    }
  }
  else
  {
    id v4 = paired_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Devices unpaired, disabling Paired Unlock", (uint8_t *)v5, 2u);
    }

    [(SDUnlockKeyManager *)self disableUnlockPairing];
  }
}

- (void)disableUnlockPairing
{
}

- (void)disableUnlockPairingForSecurityManager:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4)
  {
    [v4 deleteEscrowData];
    v8.receiver = self;
    v8.super_class = (Class)SDUnlockKeyManager;
    [(SDUnlockSessionManager *)&v8 disableUnlockPairingForSecManager:v5];
  }
  else
  {
    id v6 = [(SDUnlockSessionManager *)self securityManager];
    [v6 deleteEscrowData];

    v7.receiver = self;
    v7.super_class = (Class)SDUnlockKeyManager;
    [(SDUnlockSessionManager *)&v7 disableUnlockPairing];
  }
}

- (BOOL)unlockEnabled
{
  v7.receiver = self;
  v7.super_class = (Class)SDUnlockKeyManager;
  unsigned __int8 v3 = [(SDUnlockSessionManager *)&v7 unlockEnabled];
  id v4 = [(SDUnlockSessionManager *)self securityManager];
  unsigned __int8 v5 = [v4 checkForEscrowData];

  return v3 & v5;
}

- (void)syncUnlockEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(SDUnlockKeyManager *)self unlockEnabled];
  if (v3)
  {
    if ((v5 & 1) == 0)
    {
      id v6 = paired_unlock_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Local unlock disabled, remote enabled. Sending disable message", buf, 2u);
      }

      [(SDUnlockSessionManager *)self sendDisableMessage];
    }
  }
  else if (v5)
  {
    objc_super v7 = paired_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Remote unlock disabled, local enabled. Disabling local unlock", v8, 2u);
    }

    [(SDUnlockKeyManager *)self disableUnlockPairing];
  }
}

- (void)unlockStateForDevice:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v5 = [a4 copy:a3];
    id stateHandler = self->_stateHandler;
    self->_id stateHandler = v5;

    [(SDUnlockKeyManager *)self sendStateRequest];
  }
  else
  {
    uint64_t v7 = SFUnlockErrorDomian;
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    CFStringRef v11 = @"No completion handler";
    objc_super v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    unsigned int v9 = +[NSError errorWithDomain:v7 code:112 userInfo:v8];
    [(SDUnlockKeyManager *)self notifyUnlockStateWithState:0 error:v9];
  }
}

- (void)notifyUnlockStateWithState:(id)a3 error:(id)a4
{
  id stateHandler = (void (**)(id, id, id))self->_stateHandler;
  if (stateHandler)
  {
    stateHandler[2](stateHandler, a3, a4);
    id v6 = self->_stateHandler;
    self->_id stateHandler = 0;
  }

  [(SDUnlockKeyManager *)self invalidateStateTimer];
}

- (void)restartStateTimer
{
  BOOL v3 = paired_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Restarting state request key timer", buf, 2u);
  }

  stateTimer = self->_stateTimer;
  if (!stateTimer)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001F8BBC;
    v8[3] = &unk_1008CA4B8;
    v8[4] = self;
    sub_1001B1B10(0, &_dispatch_main_q, v8);
    id v5 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_stateTimer;
    self->_stateTimer = v5;

    dispatch_resume((dispatch_object_t)self->_stateTimer);
    stateTimer = self->_stateTimer;
  }
  dispatch_time_t v7 = sub_1001B1AF8(10.0 * 2.0 + 5.0);
  sub_1001B1BC4(stateTimer, v7);
}

- (void)invalidateStateTimer
{
  BOOL v3 = paired_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating state timer", v6, 2u);
  }

  stateTimer = self->_stateTimer;
  if (stateTimer)
  {
    dispatch_source_cancel(stateTimer);
    id v5 = self->_stateTimer;
    self->_stateTimer = 0;
  }
}

- (void)restartStashTimer
{
  stashTimer = self->_stashTimer;
  if (stashTimer) {
    [(NSTimer *)stashTimer invalidate];
  }
  id v4 = +[NSTimer scheduledTimerWithTimeInterval:self target:"stashTimerFired:" selector:0 userInfo:0 repeats:20.0];
  id v5 = self->_stashTimer;
  self->_stashTimer = v4;
}

- (void)stashTimerFired:(id)a3
{
  stashTimer = self->_stashTimer;
  self->_stashTimer = 0;

  uint64_t v5 = SFUnlockErrorDomian;
  NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
  CFStringRef v9 = @"Other side never responded";
  id v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  dispatch_time_t v7 = +[NSError errorWithDomain:v5 code:107 userInfo:v6];
  [(SDUnlockKeyManager *)self notifyStashStateWithError:v7];
}

- (void)invalidateStashTimer
{
  stashTimer = self->_stashTimer;
  if (stashTimer)
  {
    [(NSTimer *)stashTimer invalidate];
    id v4 = self->_stashTimer;
    self->_stashTimer = 0;
  }
}

- (void)establishStashBagWithCompletionHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001F8FBC;
  v4[3] = &unk_1008CB7D8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)establishStashBagWithManifest:(id)a3 completionHandler:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F9248;
  block[3] = &unk_1008CCF78;
  id v9 = a3;
  id v10 = a4;
  block[4] = self;
  id v6 = v9;
  id v7 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)notifyStashStateWithError:(id)a3
{
  id v4 = a3;
  id v5 = paired_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Calling stash handler with error = %@", (uint8_t *)&v8, 0xCu);
  }

  id stashHandler = (void (**)(id, BOOL, id))self->_stashHandler;
  if (stashHandler)
  {
    stashHandler[2](stashHandler, v4 == 0, v4);
    id v7 = self->_stashHandler;
    self->_id stashHandler = 0;
  }
  [(SDUnlockSessionManager *)self resetStashState];
  [(SDUnlockKeyManager *)self invalidateStashTimer];
}

- (void)resetSetupState
{
  self->_useEscrowRecord = 1;
  v2.receiver = self;
  v2.super_class = (Class)SDUnlockKeyManager;
  [(SDUnlockSessionManager *)&v2 resetSetupState];
}

- (void)resetAndClearState
{
  self->_useEscrowRecord = 1;
  if ((id)[(SDUnlockKeyManager *)self unlockingState] == (id)2)
  {
    id v3 = paired_unlock_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Confirmation failed, relocking watch.", buf, 2u);
    }

    [(SDUnlockKeyManager *)self sendRelockRequestWithReset:0];
    [(SDUnlockKeyManager *)self setUnlockingState:0];
  }
  id v4 = paired_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resetting state. Dismissing banner if not dismissed already", buf, 2u);
  }

  id v5 = +[SDHUDManager shared];
  [v5 dismissPairedUnlockBanner];

  v6.receiver = self;
  v6.super_class = (Class)SDUnlockKeyManager;
  [(SDUnlockSessionManager *)&v6 resetAndClearState];
}

- (void)resetState
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v3 = [(SDUnlockSessionManager *)self metrics];

  if (v3)
  {
    id v4 = paired_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(SDUnlockSessionManager *)self metrics];
      objc_super v6 = sub_100206BE8([v5 failureReason]);
      *(_DWORD *)buf = 138412290;
      int v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resetting key manager. Reason: %@", buf, 0xCu);
    }
    if ([(SDUnlockKeyManager *)self unlockingState] >= 1)
    {
      int64_t v7 = [(SDUnlockKeyManager *)self unlockingState];
      int v8 = [(SDUnlockSessionManager *)self metrics];
      [v8 setPhoneState:v7];
    }
    id v9 = [(SDUnlockKeyManager *)self metricDates];
    [(SDUnlockKeyManager *)self consolidateLatencies:v9];

    id v10 = objc_alloc_init(SDUnlockKeyMetricDates);
    [(SDUnlockKeyManager *)self setMetricDates:v10];
  }
  sessionRecord = self->_sessionRecord;
  self->_sessionRecord = 0;

  self->_BOOL unlockingForKeybagUnlock = 0;
  [(SDUnlockKeyManager *)self setUnlockingState:0];
  v12.receiver = self;
  v12.super_class = (Class)SDUnlockKeyManager;
  [(SDUnlockSessionManager *)&v12 resetState];
}

- (int64_t)unlockingState
{
  objc_super v2 = self;
  objc_sync_enter(v2);
  int64_t unlockingState = v2->_unlockingState;
  objc_sync_exit(v2);

  return unlockingState;
}

- (void)setUnlockingState:(int64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  v4->_int64_t unlockingState = a3;
  id v5 = paired_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = [(SDUnlockKeyManager *)v4 stringForState:v4->_unlockingState];
    int v7 = 138412290;
    int v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting unlocking state to %@", (uint8_t *)&v7, 0xCu);
  }
  objc_sync_exit(v4);
}

- (id)stringForState:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"Unknown State";
  }
  else {
    return *(&off_1008D0D40 + a3);
  }
}

- (void)idsController:(id)a3 didReceiveProtoData:(id)a4 forType:(unsigned __int16)a5
{
  int v5 = a5;
  id v10 = a3;
  id v8 = a4;
  if (v5 <= 1000)
  {
    switch(v5)
    {
      case 1:
        [(SDUnlockKeyManager *)self handleResetState:v8];
        break;
      case 2:
        id v9 = [[SDUnlockDisable alloc] initWithData:v8];
        [(SDUnlockSessionManager *)self logProtoBufReceived:v9];

        [(SDUnlockKeyManager *)self disableUnlockPairing];
        break;
      case 4:
        [(SDUnlockKeyManager *)self invalidateStateTimer];
        [(SDUnlockKeyManager *)self handleUnlockStateResponse:v8];
        break;
    }
  }
  else
  {
    switch(v5)
    {
      case 1001:
        [(SDUnlockKeyManager *)self handleRemoteLockStateChanged:v8];
        break;
      case 1002:
        [(SDUnlockKeyManager *)self handleSetupRequest:v8];
        break;
      case 1003:
        [(SDUnlockKeyManager *)self handleCreateEscrowSecret:v8];
        break;
      case 1004:
        [(SDUnlockSessionManager *)self invalidateUnlockTimer];
        [(SDUnlockKeyManager *)self handleSessionKeyExchangeResponse:v8];
        break;
      case 1005:
        [(SDUnlockSessionManager *)self invalidateUnlockTimer];
        [(SDUnlockKeyManager *)self handleUnlockConfirmation:v8];
        break;
      case 1006:
        [(SDUnlockKeyManager *)self invalidateStashTimer];
        [(SDUnlockKeyManager *)self handleStashKeyExchangeResponse:v8];
        break;
      case 1007:
        [(SDUnlockKeyManager *)self invalidateStashTimer];
        [(SDUnlockKeyManager *)self handleStashConfirmation:v8];
        break;
      case 1008:
        [(SDUnlockKeyManager *)self handleLongTermKeyRequest:v8];
        [(SDUnlockKeyManager *)self invalidateLongTermKeyTimer];
        break;
      case 1009:
        [(SDUnlockKeyManager *)self handleClassALongTermKeyRequest:v8];
        break;
      default:
        break;
    }
  }
}

- (void)idsControllerNearbyStateChanged:(id)a3
{
  id v4 = [(SDUnlockSessionManager *)self idsController];
  unsigned __int8 v5 = [v4 isDefaultPairedDeviceNearby];

  if ((v5 & 1) == 0)
  {
    [(SDUnlockKeyManager *)self setRemoteDeviceLocked:1];
  }
}

- (void)handleRemoteLockStateChanged:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  unsigned __int8 v5 = [[SDUnlockLockStateUpdated alloc] initWithData:v4];

  [(SDUnlockSessionManager *)self logProtoBufReceived:v5];
  if (v5 && [(SDUnlockLockStateUpdated *)v5 hasUnlocked])
  {
    if ([(SDUnlockKeyManager *)self unlockEnabled])
    {
      unsigned int v6 = [(SDUnlockLockStateUpdated *)v5 unlocked];
      int v7 = paired_unlock_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Lock device is unlocked", buf, 2u);
        }

        if (self->_delayedStartTimer || (id)[(SDUnlockKeyManager *)self unlockingState] == (id)1)
        {
          id v9 = paired_unlock_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int16 v23 = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Watch unlocked already. Dismissing banner", v23, 2u);
          }

          id v10 = +[SDHUDManager shared];
          [v10 dismissPairedUnlockBanner];

          CFStringRef v11 = [(SDUnlockSessionManager *)self metrics];

          if (v11)
          {
            objc_super v12 = [(SDUnlockSessionManager *)self metrics];
            [v12 setFailureReason:15];
          }
        }
        [(SDUnlockKeyManager *)self setRemoteDeviceLocked:0];
        [(SDUnlockKeyManager *)self resetState];
      }
      else
      {
        if (v8)
        {
          *(_WORD *)CFStringRef v22 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Lock device is locked", v22, 2u);
        }

        [(SDUnlockKeyManager *)self setRemoteDeviceLocked:1];
      }
    }
    else
    {
      uint64_t v13 = [(SDUnlockSessionManager *)self securityManager];
      if (v13)
      {
        int v14 = (void *)v13;
        id v15 = [(SDUnlockSessionManager *)self securityManager];
        uint32_t v16 = [v15 pairingID];
        int v17 = [(SDUnlockSessionManager *)self pairingID];
        if ([v16 isEqualToString:v17])
        {
          CFStringRef v18 = [(SDUnlockSessionManager *)self securityManager];
          int v19 = [v18 pairingStorePath];
          CFStringRef v20 = [(SDUnlockSessionManager *)self pairingStorePath];
          unsigned int v21 = [v19 isEqualToString:v20];

          if (v21) {
            [(SDUnlockSessionManager *)self sendDisableMessage];
          }
        }
        else
        {
        }
      }
    }
  }
}

- (void)handleLongTermKeyRequest:(id)a3
{
  self->_outstandingStartLTK = 0;
  id v4 = a3;
  unsigned __int8 v5 = [[SDUnlockLongTermKeyRequest alloc] initWithData:v4];

  [(SDUnlockSessionManager *)self logProtoBufReceived:v5];
  if (![(SDUnlockSessionManager *)self inConfigureState])
  {
    CFStringRef v11 = paired_unlock_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001FE7D0(self, v11);
    }

    goto LABEL_14;
  }
  [(SDUnlockSessionManager *)self updateSecurityManager];
  if (![(SDUnlockLongTermKeyRequest *)v5 hasLongTermKey]
    || ([(SDUnlockLongTermKeyRequest *)v5 longTermKey],
        unsigned int v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [(SDUnlockKeyManager *)self updateLongTermKey:v6],
        v6,
        !v7))
  {
    objc_super v12 = paired_unlock_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001FE714();
    }

    if ([(SDUnlockLongTermKeyRequest *)v5 hasLongTermKey]) {
      uint64_t v13 = &off_1008D0E58;
    }
    else {
      uint64_t v13 = &off_1008D0E50;
    }
    [(SDUnlockSessionManager *)self abortDevicePairingWithReason:*v13];
LABEL_14:
    [(SDUnlockKeyManager *)self releaseKeyBagAssertion];
    int v14 = [(SDUnlockLongTermKeyRequest *)v5 requestID];
    [(SDUnlockKeyManager *)self sendLongTermKeyResponse:0 requestID:v14];

    goto LABEL_15;
  }
  BOOL v8 = [(SDUnlockSessionManager *)self securityManager];
  id v9 = [v8 localLongTermKey];
  id v10 = [(SDUnlockLongTermKeyRequest *)v5 requestID];
  [(SDUnlockKeyManager *)self sendLongTermKeyResponse:v9 requestID:v10];

  [(SDUnlockKeyManager *)self releaseKeyBagAssertion];
LABEL_15:
}

- (void)handleClassALongTermKeyRequest:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [[SDUnlockClassALongTermKeyRequest alloc] initWithData:v4];

  [(SDUnlockSessionManager *)self logProtoBufReceived:v5];
  unsigned int v6 = +[SDStatusMonitor sharedMonitor];
  unsigned int v7 = [v6 deviceKeyBagUnlocked];

  if (v7)
  {
    if ([(SDUnlockClassALongTermKeyRequest *)v5 hasLongTermKey])
    {
      [(SDUnlockSessionManager *)self updateSecurityManager];
      BOOL v8 = [(SDUnlockClassALongTermKeyRequest *)v5 longTermKey];
      unsigned __int8 v9 = [(SDUnlockKeyManager *)self updateLongTermKey:v8];

      if (v9)
      {
        id v10 = [(SDUnlockSessionManager *)self securityManager];
        CFStringRef v11 = [v10 localLongTermKey];
        [(SDUnlockKeyManager *)self sendClassALongTermKeyResponse:v11 sessionID:[(SDUnlockClassALongTermKeyRequest *)v5 sessionID] errorCode:0];

        goto LABEL_13;
      }
      uint64_t v14 = 101;
    }
    else
    {
      uint64_t v14 = 103;
    }
  }
  else
  {
    objc_super v12 = +[SDStatusMonitor sharedMonitor];
    unsigned int v13 = [v12 deviceKeyBagDisabled];

    if (v13) {
      uint64_t v14 = 108;
    }
    else {
      uint64_t v14 = 102;
    }
  }
  id v15 = paired_unlock_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1001FE85C();
  }

  [(SDUnlockKeyManager *)self sendClassALongTermKeyResponse:0 sessionID:[(SDUnlockClassALongTermKeyRequest *)v5 sessionID] errorCode:v14];
  [(SDUnlockKeyManager *)self disableUnlockPairing];
LABEL_13:
}

- (BOOL)updateLongTermKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int8 v5 = [(SDUnlockSessionManager *)self securityManager];
    unsigned int v6 = [v5 generateLocalLongTermKey:1];

    if (v6)
    {
      unsigned int v7 = [(SDUnlockSessionManager *)self securityManager];
      BOOL v8 = [v7 signRemoteKey:v4 withLocalKey:v6 localKeyClass:1 remoteKeyClass:3];

      BOOL v9 = v8 != 0;
      if (v8)
      {
        id v10 = [(SDUnlockSessionManager *)self securityManager];
        [v10 updateLocalLongTermKey:v6 remoteLongTermKey:v8];
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)handleSetupRequest:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [[SDUnlockSetupRequest alloc] initWithData:v4];

  [(SDUnlockSessionManager *)self logProtoBufReceived:v5];
  unsigned int v6 = +[SDStatusMonitor sharedMonitor];
  unsigned int v7 = [v6 deviceKeyBagUnlocked];

  if (v7)
  {
    if (v5)
    {
      if (![(SDUnlockSetupRequest *)v5 hasLongTermKey])
      {
        id v10 = (id)[(SDUnlockSetupRequest *)v5 sessionID];
        CFStringRef v11 = self;
        uint64_t v12 = 0;
        goto LABEL_11;
      }
      BOOL v8 = [(SDUnlockSetupRequest *)v5 longTermKey];
      unsigned int v9 = [(SDUnlockKeyManager *)self updateLongTermKey:v8];

      if (v9)
      {
        id v10 = (id)[(SDUnlockSetupRequest *)v5 sessionID];
        CFStringRef v11 = self;
        uint64_t v12 = 1;
LABEL_11:
        [(SDUnlockKeyManager *)v11 handleEscrowSessionRequest:v10 withUpdatedLongTermKey:v12];
        goto LABEL_16;
      }
      uint64_t v15 = 101;
    }
    else
    {
      uint64_t v15 = 103;
    }
  }
  else
  {
    unsigned int v13 = +[SDStatusMonitor sharedMonitor];
    unsigned int v14 = [v13 deviceKeyBagDisabled];

    if (v14) {
      uint64_t v15 = 108;
    }
    else {
      uint64_t v15 = 102;
    }
  }
  uint32_t v16 = paired_unlock_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_1001FE8C4();
  }

  [(SDUnlockKeyManager *)self sendSetupSessionCreatedWithLocalKey:0 stepData:0 sessionID:[(SDUnlockSetupRequest *)v5 sessionID] errorCode:v15];
  [(SDUnlockKeyManager *)self disableUnlockPairing];
  [(SDUnlockKeyManager *)self resetSetupState];
LABEL_16:
}

- (void)handleEscrowSessionRequest:(unsigned int)a3 withUpdatedLongTermKey:(BOOL)a4
{
  uint64_t v5 = *(void *)&a3;
  unsigned int v7 = [(SDUnlockSessionManager *)self securityManager];
  uint64_t v8 = [v7 localLongTermKey];
  if (!v8)
  {

    goto LABEL_8;
  }
  unsigned int v9 = (void *)v8;
  id v10 = [(SDUnlockSessionManager *)self securityManager];
  CFStringRef v11 = [v10 remoteLongTermKey];

  if (!v11)
  {
LABEL_8:
    uint64_t v17 = 187;
    goto LABEL_9;
  }
  int v19 = 0;
  uint64_t v12 = [(SDUnlockSessionManager *)self securityManager];
  -[SDUnlockSessionManager setSetupAuthSession:](self, "setSetupAuthSession:", [v12 escrowCreationSessionAsOriginator:1 errorCode:&v19]);

  if ([(SDUnlockSessionManager *)self setupAuthSession] < 0)
  {
    uint64_t v17 = 188;
    if (v19 != -536870174 && v19 != -536362984)
    {
      if (v19 == -536362989) {
        uint64_t v17 = 188;
      }
      else {
        uint64_t v17 = 101;
      }
    }
  }
  else
  {
    unsigned int v13 = [(SDUnlockSessionManager *)self securityManager];
    unsigned int v14 = [v13 stepWithAuthSession:-[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession") data:0];

    if (v14)
    {
      if (a4)
      {
        uint64_t v15 = [(SDUnlockSessionManager *)self securityManager];
        uint32_t v16 = [v15 localLongTermKey];
        [(SDUnlockKeyManager *)self sendSetupSessionCreatedWithLocalKey:v16 stepData:v14 sessionID:v5 errorCode:0];
      }
      else
      {
        [(SDUnlockKeyManager *)self sendSetupSessionCreatedWithLocalKey:0 stepData:v14 sessionID:v5 errorCode:0];
      }

      return;
    }
    uint64_t v17 = 101;
  }
LABEL_9:
  CFStringRef v18 = paired_unlock_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_10003B004();
  }

  [(SDUnlockKeyManager *)self sendSetupSessionCreatedWithLocalKey:0 stepData:0 sessionID:v5 errorCode:v17];
  [(SDUnlockKeyManager *)self disableUnlockPairing];
  [(SDUnlockKeyManager *)self resetSetupState];
}

- (void)handleCreateEscrowSecret:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[SDUnlockSetupCreateSecret alloc] initWithData:v4];

  [(SDUnlockSessionManager *)self logProtoBufReceived:v5];
  unsigned int v6 = +[SDStatusMonitor sharedMonitor];
  unsigned int v7 = [v6 deviceKeyBagUnlocked];

  if (v7)
  {
    if (v5 && [(SDUnlockSetupCreateSecret *)v5 hasToken])
    {
      uint64_t v25 = 0;
      uint64_t v8 = [(SDUnlockSessionManager *)self securityManager];
      int64_t v9 = [(SDUnlockSessionManager *)self setupAuthSession];
      id v10 = [(SDUnlockSetupCreateSecret *)v5 token];
      CFStringRef v11 = [v8 stepWithAuthSession:v9 data:v10 authStep:0 errorCode:&v25];

      if (!v11)
      {
        if (v25 == -536363002)
        {
          int v19 = paired_unlock_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Bad signature, deleting bad LTKs", buf, 2u);
          }

          CFStringRef v20 = [(SDUnlockSessionManager *)self securityManager];
          [v20 deleteLongTermKeys];

          uint64_t v17 = 188;
        }
        else
        {
          uint64_t v17 = 101;
        }
        uint32_t v16 = @"Could not complete step";
        goto LABEL_11;
      }
      uint64_t v12 = [(SDUnlockSessionManager *)self securityManager];
      unsigned int v13 = [v12 escrowSecretWithAuthSession:-[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession")];

      if (v13)
      {
        unsigned int v14 = [(SDUnlockSessionManager *)self securityManager];
        unsigned __int8 v15 = [v14 storeEscrowData:v13];

        if (v15)
        {
          [(SDUnlockKeyManager *)self sendSetupCreateEscrowRecordWithSessionID:[(SDUnlockSetupCreateSecret *)v5 sessionID] stepData:v11 errorCode:0];
          [(SDUnlockSessionManager *)self enableUnlockPairing];
          [(SDUnlockKeyManager *)self resetSetupState];

          goto LABEL_14;
        }
        unsigned int v21 = +[SDStatusMonitor sharedMonitor];
        unsigned int v22 = [v21 deviceKeyBagLocked];
        CFStringRef v23 = @"NO";
        if (v22) {
          CFStringRef v23 = @"YES";
        }
        +[NSString stringWithFormat:@"Failed to store escrow secret (locked = %@)", v23];
        uint32_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint32_t v16 = @"Failed to create escrow secret";
      }
    }
    else
    {
      uint32_t v16 = @"No remote step data in message";
    }
    uint64_t v17 = 101;
  }
  else
  {
    uint32_t v16 = @"Device locked";
    uint64_t v17 = 102;
  }
LABEL_11:
  CFStringRef v18 = paired_unlock_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_1001FE92C();
  }

  [(SDUnlockKeyManager *)self sendSetupCreateEscrowRecordWithSessionID:[(SDUnlockSetupCreateSecret *)v5 sessionID] stepData:0 errorCode:v17];
  [(SDUnlockKeyManager *)self disableUnlockPairing];
  [(SDUnlockKeyManager *)self resetSetupState];

LABEL_14:
}

- (void)handleSessionKeyExchangeResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[SDUnlockSessionKeyExchangeResponse alloc] initWithData:v4];

  [(SDUnlockSessionManager *)self logProtoBufReceived:v5];
  unsigned int v6 = +[NSDate date];
  unsigned int v7 = [(SDUnlockKeyManager *)self metricDates];
  [v7 setKeyExchangeResponseReceived:v6];

  if ((id)[(SDUnlockKeyManager *)self unlockingState] == (id)1
    && [(SDUnlockSessionKeyExchangeResponse *)v5 hasKey])
  {
    if ([(SDUnlockSessionKeyExchangeResponse *)v5 hasSessionID]
      && (unsigned int v8 = [(SDUnlockSessionKeyExchangeResponse *)v5 sessionID],
          (id)[(SDUnlockSessionRecord *)self->_sessionRecord unlockSessionID] == (id)v8))
    {
      uint64_t v45 = 0;
      int64_t v9 = [(SDUnlockSessionManager *)self securityManager];
      int64_t v10 = [(SDUnlockSessionManager *)self unlockAuthSession];
      CFStringRef v11 = [(SDUnlockSessionKeyExchangeResponse *)v5 key];
      uint64_t v12 = [v9 stepWithAuthSession:v10 data:v11 authStep:0 errorCode:&v45];

      if (v12)
      {
        if ([(SDUnlockKeyManager *)self shouldUseTwoPartPill])
        {
          if (SBUIIsSystemApertureEnabled()) {
            double v13 = 5.0999999;
          }
          else {
            double v13 = 3.5999999;
          }
          unsigned int v14 = [(SDUnlockSessionManager *)self activeDevice];
          unsigned __int8 v15 = [v14 valueForProperty:NRDevicePropertyName];

          if (+[SFAutoUnlockManager autoUnlockEnabled])
          {
            uint32_t v16 = +[SDHUDManager shared];
            [v16 postPairedUnlockBannerFor:v15 needsLockButton:1 needsUpdate:1];

            uint64_t v17 = paired_unlock_log();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              double v47 = v13;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Auto Unlock enabled. Waiting %f sec for user to respond to pill...", buf, 0xCu);
            }

            dispatch_time_t v18 = sub_1001B1AF8(v13);
            v42[0] = _NSConcreteStackBlock;
            v42[1] = 3221225472;
            v42[2] = sub_1001FB0B4;
            v42[3] = &unk_1008CAF18;
            v42[4] = self;
            id v43 = v12;
            v44 = v5;
            [(SDUnlockKeyManager *)self restartDelayedStartTimer:v18 withCompletionHandler:v42];
          }
          else
          {
            v38 = [(SDUnlockKeyManager *)self metricDates];
            v39 = [v38 keyExchangeResponseReceived];
            v40 = [(SDUnlockKeyManager *)self metricDates];
            [v40 setPillUpdated:v39];

            [(SDUnlockKeyManager *)self sendSessionAuthenticationToken:v12 sessionID:[(SDUnlockSessionKeyExchangeResponse *)v5 sessionID]];
            v41 = +[SDHUDManager shared];
            [v41 postPairedUnlockBannerFor:v15 needsLockButton:1 needsUpdate:0];
          }
        }
        else
        {
          v33 = [(SDUnlockKeyManager *)self metricDates];
          v34 = [v33 keyExchangeResponseReceived];
          v35 = [(SDUnlockKeyManager *)self metricDates];
          [v35 setPillUpdated:v34];

          [(SDUnlockKeyManager *)self sendSessionAuthenticationToken:v12 sessionID:[(SDUnlockSessionKeyExchangeResponse *)v5 sessionID]];
        }
      }
      else
      {
        v28 = paired_unlock_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_1001FE9C8();
        }

        if (v45 == -536363002)
        {
          v29 = paired_unlock_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_1001FE994();
          }

          [(SDUnlockKeyManager *)self disableUnlockPairing];
          [(SDUnlockSessionManager *)self sendDisableMessage];
          v30 = [(SDUnlockSessionManager *)self securityManager];
          [v30 deleteLongTermKeys];

          v31 = [(SDUnlockSessionManager *)self metrics];

          if (v31)
          {
            v32 = [(SDUnlockSessionManager *)self metrics];
            [v32 setFailureReason:22];
          }
        }
        else
        {
          v36 = [(SDUnlockSessionManager *)self metrics];

          if (v36)
          {
            v37 = [(SDUnlockSessionManager *)self metrics];
            [v37 setFailureReason:3];
          }
          [(SDUnlockSessionManager *)self sendResetMessage:[(SDUnlockSessionKeyExchangeResponse *)v5 sessionID] reason:3];
        }
      }
    }
    else
    {
      CFStringRef v26 = paired_unlock_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v27 = [(SDUnlockSessionRecord *)self->_sessionRecord unlockSessionID];
        *(_DWORD *)buf = 134218240;
        double v47 = *(double *)&v27;
        __int16 v48 = 2048;
        uint64_t v49 = [(SDUnlockSessionKeyExchangeResponse *)v5 sessionID];
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Incorrect session ID (key ID: %ld, lock ID: %ld)", buf, 0x16u);
      }

      [(SDUnlockSessionManager *)self restartUnlockTimer:sub_1001B1AF8((double)45)];
    }
  }
  else if ([(SDUnlockSessionKeyExchangeResponse *)v5 hasKeyFailed] {
         && [(SDUnlockSessionKeyExchangeResponse *)v5 keyFailed])
  }
  {
    [(SDUnlockKeyManager *)self resetState];
    if (!self->_useEscrowRecord)
    {
      self->_useEscrowRecord = 1;
      int v19 = paired_unlock_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1001FE9FC();
      }

      self->_BOOL unlockingForKeybagUnlock = 1;
      CFStringRef v20 = [(SDUnlockSessionManager *)self metrics];

      if (v20)
      {
        unsigned int v21 = [(SDUnlockSessionManager *)self metrics];
        [v21 setRetriedWithEscrowRecord:1];
      }
      [(SDUnlockKeyManager *)self initiateRemoteUnlock];
    }
  }
  else
  {
    unsigned int v22 = paired_unlock_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1001FEA30(self, v5);
    }

    if ((id)[(SDUnlockKeyManager *)self unlockingState] == (id)1) {
      uint64_t v23 = 2;
    }
    else {
      uint64_t v23 = 9;
    }
    CFStringRef v24 = [(SDUnlockSessionManager *)self metrics];

    if (v24)
    {
      uint64_t v25 = [(SDUnlockSessionManager *)self metrics];
      [v25 setFailureReason:v23];
    }
    [(SDUnlockSessionManager *)self sendResetMessage:[(SDUnlockSessionKeyExchangeResponse *)v5 sessionID] reason:v23];
  }
}

- (void)handleUnlockConfirmation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[SDUnlockSessionConfirmation alloc] initWithData:v4];

  [(SDUnlockSessionManager *)self logProtoBufReceived:v5];
  unsigned int v6 = +[NSDate date];
  unsigned int v7 = [(SDUnlockKeyManager *)self metricDates];
  [v7 setConfirmationReceived:v6];

  if ((id)[(SDUnlockKeyManager *)self unlockingState] == (id)2
    && [(SDUnlockSessionConfirmation *)v5 hasSuccess]
    && [(SDUnlockSessionConfirmation *)v5 success]
    && ([(SDUnlockSessionManager *)self securityManager],
        unsigned int v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = objc_msgSend(v8, "confirmUnlockWithAuthSession:", -[SDUnlockSessionManager unlockAuthSession](self, "unlockAuthSession")), v8, v9))
  {
    self->_BOOL useEscrowRecord = 0;
    int64_t v10 = [(SDUnlockSessionManager *)self metrics];

    if (v10)
    {
      CFStringRef v11 = [(SDUnlockSessionManager *)self metrics];
      [v11 setSucceeded:1];
    }
    [(SDUnlockKeyManager *)self resetState];
    uint64_t v12 = paired_unlock_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "UNLOCK CONFIRMED!", (uint8_t *)&v26, 2u);
    }

    if (+[SFAutoUnlockManager autoUnlockEnabled]
      && ![(SDUnlockKeyManager *)self pairedWatchSupportsRelock])
    {
      double v13 = [(SDUnlockSessionManager *)self activeDevice];
      unsigned int v14 = [v13 valueForProperty:NRDevicePropertyName];

      unsigned __int8 v15 = +[SDHUDManager shared];
      [v15 postPairedUnlockBannerFor:v14 needsLockButton:0 needsUpdate:0];
    }
  }
  else
  {
    BOOL useEscrowRecord = self->_useEscrowRecord;
    uint64_t v17 = paired_unlock_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (useEscrowRecord)
    {
      if (v18)
      {
        LOWORD(v26) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Confirmation failed, resetting state", (uint8_t *)&v26, 2u);
      }

      int v19 = [(SDUnlockSessionManager *)self metrics];

      if (v19)
      {
        CFStringRef v20 = [(SDUnlockSessionManager *)self metrics];
        [v20 setFailureReason:25];
      }
      [(SDUnlockKeyManager *)self resetAndClearState];
    }
    else
    {
      if (v18)
      {
        unsigned int v21 = [(SDUnlockKeyManager *)self unlockingState];
        if ([(SDUnlockSessionConfirmation *)v5 hasSuccess]) {
          CFStringRef v22 = @"YES";
        }
        else {
          CFStringRef v22 = @"NO";
        }
        LODWORD(v26) = 67109634;
        if ([(SDUnlockSessionConfirmation *)v5 success]) {
          CFStringRef v23 = @"YES";
        }
        else {
          CFStringRef v23 = @"NO";
        }
        HIDWORD(v26) = v21;
        __int16 v27 = 2112;
        CFStringRef v28 = v22;
        __int16 v29 = 2112;
        CFStringRef v30 = v23;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Token unlock failed, retrying (state = %d, confirmation has success = %@, confirmation success = %@)", (uint8_t *)&v26, 0x1Cu);
      }

      [(SDUnlockKeyManager *)self resetAndClearState];
      self->_BOOL unlockingForKeybagUnlock = 1;
      CFStringRef v24 = [(SDUnlockSessionManager *)self metrics];

      if (v24)
      {
        uint64_t v25 = [(SDUnlockSessionManager *)self metrics];
        [v25 setRetriedWithEscrowRecord:1];
      }
      [(SDUnlockKeyManager *)self initiateRemoteUnlock];
    }
  }
}

- (void)handleResetState:(id)a3
{
  id v4 = a3;
  int64_t v10 = [[SDUnlockReset alloc] initWithData:v4];

  [(SDUnlockSessionManager *)self logProtoBufReceived:v10];
  if ([(SDUnlockReset *)v10 hasResetReason])
  {
    uint64_t v5 = [(SDUnlockSessionManager *)self metrics];

    if (v5)
    {
      unsigned __int16 v6 = (unsigned __int16)[(SDUnlockReset *)v10 resetReason];
      unsigned int v7 = [(SDUnlockSessionManager *)self metrics];
      [v7 setFailureReason:v6];
    }
  }
  sessionRecord = self->_sessionRecord;
  if (!sessionRecord
    || (unsigned int v9 = [(SDUnlockSessionRecord *)sessionRecord unlockSessionID],
        [(SDUnlockReset *)v10 sessionID] == v9))
  {
    [(SDUnlockKeyManager *)self resetAndClearState];
  }
}

- (void)handleStashKeyExchangeResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[SDUnlockStashKeyExchangeResponse alloc] initWithData:v4];

  [(SDUnlockSessionManager *)self logProtoBufReceived:v5];
  if ([(SDUnlockStashKeyExchangeResponse *)v5 hasKey])
  {
    unsigned __int16 v6 = [(SDUnlockSessionManager *)self securityManager];
    int64_t v7 = [(SDUnlockSessionManager *)self stashBagSession];
    unsigned int v8 = [(SDUnlockStashKeyExchangeResponse *)v5 key];
    unsigned int v9 = [v6 stepWithAuthSession:v7 data:v8];

    if (v9)
    {
      [(SDUnlockKeyManager *)self sendStashToken:v9 sessionID:[(SDUnlockStashKeyExchangeResponse *)v5 sessionID]];
    }
    else
    {
      unsigned __int8 v15 = paired_unlock_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1001FEAE8();
      }

      uint64_t v16 = SFUnlockErrorDomian;
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      CFStringRef v22 = @"Error creating stash token";
      uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      BOOL v18 = +[NSError errorWithDomain:v16 code:101 userInfo:v17];
      [(SDUnlockKeyManager *)self notifyStashStateWithError:v18];
    }
  }
  else
  {
    if ([(SDUnlockStashKeyExchangeResponse *)v5 hasErrorCode]) {
      unsigned int v10 = [(SDUnlockStashKeyExchangeResponse *)v5 errorCode];
    }
    else {
      unsigned int v10 = 103;
    }
    CFStringRef v11 = paired_unlock_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001FEB1C(v10, v11);
    }

    uint64_t v12 = SFUnlockErrorDomian;
    uint64_t v13 = v10;
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    CFStringRef v20 = @"Error getting repsonse key";
    unsigned int v9 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    unsigned int v14 = +[NSError errorWithDomain:v12 code:v13 userInfo:v9];
    [(SDUnlockKeyManager *)self notifyStashStateWithError:v14];
  }
}

- (void)handleStashConfirmation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[SDUnlockStashConfirmation alloc] initWithData:v4];

  [(SDUnlockSessionManager *)self logProtoBufReceived:v5];
  if ([(SDUnlockStashConfirmation *)v5 hasSuccess] && [(SDUnlockStashConfirmation *)v5 success])
  {
    [(SDUnlockKeyManager *)self notifyStashStateWithError:0];
  }
  else
  {
    uint64_t v6 = SFUnlockErrorDomian;
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    CFStringRef v10 = @"Other device failed to confirm stash setup";
    int64_t v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    unsigned int v8 = +[NSError errorWithDomain:v6 code:101 userInfo:v7];
    [(SDUnlockKeyManager *)self notifyStashStateWithError:v8];
  }
}

- (void)handleUnlockStateResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[SDUnlockStateResponse alloc] initWithData:v4];

  [(SDUnlockSessionManager *)self logProtoBufReceived:v5];
  if ([(SDUnlockStateResponse *)v5 hasUnlockEnabled]
    && [(SDUnlockStateResponse *)v5 hasPasscodeEnabled])
  {
    [(SDUnlockKeyManager *)self syncUnlockEnabled:[(SDUnlockStateResponse *)v5 unlockEnabled]];
    id v6 = objc_alloc((Class)SFUnlockState);
    int64_t v7 = +[NSNumber numberWithBool:[(SDUnlockKeyManager *)self unlockEnabled]];
    unsigned int v8 = +[NSNumber numberWithBool:[(SDUnlockStateResponse *)v5 passcodeEnabled]];
    id v9 = [v6 initWithUnlockEnabled:v7 remotePasscodeEnabled:v8];

    [(SDUnlockKeyManager *)self notifyUnlockStateWithState:v9 error:0];
  }
  else
  {
    CFStringRef v10 = paired_unlock_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001FEB94();
    }

    uint64_t v11 = SFUnlockErrorDomian;
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    CFStringRef v15 = @"Response is missing information";
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v13 = +[NSError errorWithDomain:v11 code:103 userInfo:v12];
    [(SDUnlockKeyManager *)self notifyUnlockStateWithState:0 error:v13];
  }
}

- (void)sendStartLTKTransfer
{
  id v3 = objc_alloc_init(SDUnlockStartLTKTransfer);
  [(SDUnlockStartLTKTransfer *)v3 setVersion:1];
  [(SDUnlockSessionManager *)self logProtoBufSend:v3];
  self->_outstandingStartLTK = 1;
  id v4 = [(SDUnlockSessionManager *)self idsController];
  uint64_t v5 = [(SDUnlockStartLTKTransfer *)v3 data];
  id v6 = +[NSNumber numberWithInteger:75];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001FBDE8;
  v7[3] = &unk_1008CA5A8;
  v7[4] = self;
  [v4 sendProtocolBufferData:v5 withType:108 timeout:v6 option:0 errorHandler:v7];

  [(SDUnlockKeyManager *)self restartLongTermKeyTimer:sub_1001B1AF8((double)75 + 45.0 + 10.0)];
}

- (void)sendLongTermKeyResponse:(id)a3 requestID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = objc_alloc_init(SDUnlockLongTermKeyResponse);
  [(SDUnlockLongTermKeyResponse *)v8 setVersion:1];
  [(SDUnlockLongTermKeyResponse *)v8 setRequestID:v7];

  if (v6) {
    [(SDUnlockLongTermKeyResponse *)v8 setLongTermKey:v6];
  }
  else {
    [(SDUnlockLongTermKeyResponse *)v8 setKeyFailed:1];
  }
  [(SDUnlockSessionManager *)self logProtoBufSend:v8];
  id v9 = [(SDUnlockSessionManager *)self idsController];
  CFStringRef v10 = [(SDUnlockLongTermKeyResponse *)v8 data];
  uint64_t v11 = +[NSNumber numberWithDouble:45.0];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001FBFC4;
  v12[3] = &unk_1008CA5A8;
  v12[4] = self;
  [v9 sendProtocolBufferData:v10 withType:107 timeout:v11 option:0 errorHandler:v12];
}

- (void)sendClassALongTermKeyResponse:(id)a3 sessionID:(unsigned int)a4 errorCode:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = objc_alloc_init(SDUnlockClassALongTermKeyResponse);
  [(SDUnlockClassALongTermKeyResponse *)v9 setVersion:1];
  [(SDUnlockClassALongTermKeyResponse *)v9 setSessionID:v6];
  if (v8) {
    [(SDUnlockClassALongTermKeyResponse *)v9 setLongTermKey:v8];
  }
  else {
    [(SDUnlockClassALongTermKeyResponse *)v9 setErrorCode:v5];
  }
  [(SDUnlockSessionManager *)self logProtoBufSend:v9];
  CFStringRef v10 = [(SDUnlockSessionManager *)self idsController];
  uint64_t v11 = [(SDUnlockClassALongTermKeyResponse *)v9 data];
  uint64_t v12 = +[NSNumber numberWithDouble:45.0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001FC174;
  v13[3] = &unk_1008CA5A8;
  v13[4] = self;
  [v10 sendProtocolBufferData:v11 withType:109 timeout:v12 option:0 dataClass:2 queueOneID:0 errorHandler:v13];
}

- (void)sendSetupSessionCreatedWithLocalKey:(id)a3 stepData:(id)a4 sessionID:(unsigned int)a5 errorCode:(int64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = objc_alloc_init(SDUnlockSetupSessionCreated);
  [(SDUnlockSetupSessionCreated *)v12 setVersion:1];
  [(SDUnlockSetupSessionCreated *)v12 setSessionID:v7];
  if (v10) {
    [(SDUnlockSetupSessionCreated *)v12 setLongTermKey:v10];
  }
  if (v11) {
    [(SDUnlockSetupSessionCreated *)v12 setToken:v11];
  }
  if (a6) {
    [(SDUnlockSetupSessionCreated *)v12 setErrorCode:a6];
  }
  [(SDUnlockSessionManager *)self logProtoBufSend:v12];
  uint64_t v13 = [(SDUnlockSessionManager *)self idsController];
  NSErrorUserInfoKey v14 = [(SDUnlockSetupSessionCreated *)v12 data];
  CFStringRef v15 = +[NSNumber numberWithDouble:45.0];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001FC2F4;
  v16[3] = &unk_1008CA5A8;
  v16[4] = self;
  [v13 sendProtocolBufferData:v14 withType:101 timeout:v15 option:0 errorHandler:v16];
}

- (void)sendSetupCreateEscrowRecordWithSessionID:(unsigned int)a3 stepData:(id)a4 errorCode:(int64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = objc_alloc_init(SDUnlockSetupCreateRecord);
  [(SDUnlockSetupCreateRecord *)v9 setVersion:1];
  [(SDUnlockSetupCreateRecord *)v9 setSessionID:v6];
  if (v8) {
    [(SDUnlockSetupCreateRecord *)v9 setToken:v8];
  }
  if (a5) {
    [(SDUnlockSetupCreateRecord *)v9 setErrorCode:a5];
  }
  [(SDUnlockSessionManager *)self logProtoBufSend:v9];
  id v10 = [(SDUnlockSessionManager *)self idsController];
  id v11 = [(SDUnlockSetupCreateRecord *)v9 data];
  uint64_t v12 = +[NSNumber numberWithDouble:45.0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001FC44C;
  v13[3] = &unk_1008CA5A8;
  v13[4] = self;
  [v10 sendProtocolBufferData:v11 withType:102 timeout:v12 option:0 errorHandler:v13];
}

- (void)sendSessionKeyExchangeRequest:(id)a3 usedEscrow:(BOOL)a4 sessionID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(SDUnlockSessionKeyExchangeRequest);
  [(SDUnlockSessionKeyExchangeRequest *)v9 setVersion:1];
  [(SDUnlockSessionKeyExchangeRequest *)v9 setSessionID:v5];
  [(SDUnlockSessionKeyExchangeRequest *)v9 setUsingRecord:v6];
  [(SDUnlockSessionKeyExchangeRequest *)v9 setKey:v8];

  [(SDUnlockSessionManager *)self logProtoBufSend:v9];
  id v10 = [(SDUnlockSessionManager *)self idsController];
  id v11 = [(SDUnlockSessionKeyExchangeRequest *)v9 data];
  uint64_t v12 = +[NSNumber numberWithDouble:45.0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001FC5B8;
  v13[3] = &unk_1008CA5A8;
  v13[4] = self;
  [v10 sendProtocolBufferData:v11 withType:103 timeout:v12 option:0 errorHandler:v13];

  [(SDUnlockKeyManager *)self setUnlockingState:1];
}

- (void)sendSessionAuthenticationToken:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(SDUnlockSessionAuthToken);
  [(SDUnlockSessionAuthToken *)v7 setVersion:1];
  [(SDUnlockSessionAuthToken *)v7 setSessionID:v4];
  [(SDUnlockSessionAuthToken *)v7 setAuthToken:v6];

  [(SDUnlockSessionManager *)self logProtoBufSend:v7];
  id v8 = [(SDUnlockSessionManager *)self idsController];
  id v9 = [(SDUnlockSessionAuthToken *)v7 data];
  id v10 = +[NSNumber numberWithDouble:45.0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001FC794;
  v11[3] = &unk_1008CA5A8;
  v11[4] = self;
  [v8 sendProtocolBufferData:v9 withType:104 timeout:v10 option:1 errorHandler:v11];

  [(SDUnlockSessionManager *)self restartUnlockTimer:sub_1001B1AF8((double)45)];
  [(SDUnlockKeyManager *)self setUnlockingState:2];
}

- (void)sendStashKeyRequest:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(SDUnlockStashKeyExchangeRequest);
  [(SDUnlockStashKeyExchangeRequest *)v7 setVersion:1];
  [(SDUnlockStashKeyExchangeRequest *)v7 setSessionID:v4];
  [(SDUnlockStashKeyExchangeRequest *)v7 setKey:v6];

  [(SDUnlockSessionManager *)self logProtoBufSend:v7];
  id v8 = [(SDUnlockSessionManager *)self idsController];
  id v9 = [(SDUnlockStashKeyExchangeRequest *)v7 data];
  id v10 = +[NSNumber numberWithDouble:45.0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001FC9CC;
  v11[3] = &unk_1008CA5A8;
  v11[4] = self;
  [v8 sendProtocolBufferData:v9 withType:105 timeout:v10 option:1 errorHandler:v11];

  [(SDUnlockKeyManager *)self restartStashTimer];
}

- (void)sendStashToken:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(SDUnlockStashToken);
  [(SDUnlockStashToken *)v7 setVersion:1];
  [(SDUnlockStashToken *)v7 setSessionID:v4];
  [(SDUnlockStashToken *)v7 setStashToken:v6];

  [(SDUnlockSessionManager *)self logProtoBufSend:v7];
  id v8 = [(SDUnlockSessionManager *)self idsController];
  id v9 = [(SDUnlockStashToken *)v7 data];
  id v10 = +[NSNumber numberWithDouble:45.0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001FCBE8;
  v11[3] = &unk_1008CA5A8;
  v11[4] = self;
  [v8 sendProtocolBufferData:v9 withType:106 timeout:v10 option:1 errorHandler:v11];

  [(SDUnlockKeyManager *)self restartStashTimer];
}

- (void)sendStateRequest
{
  id v3 = objc_alloc_init(SDUnlockStateRequest);
  [(SDUnlockStateRequest *)v3 setVersion:1];
  [(SDUnlockSessionManager *)self logProtoBufSend:v3];
  uint64_t v4 = [(SDUnlockSessionManager *)self idsController];
  uint64_t v5 = [(SDUnlockStateRequest *)v3 data];
  id v6 = +[NSNumber numberWithDouble:10.0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001FCDD8;
  v7[3] = &unk_1008CA5A8;
  v7[4] = self;
  [v4 sendProtocolBufferData:v5 withType:3 timeout:v6 option:1 errorHandler:v7];

  [(SDUnlockKeyManager *)self restartStateTimer];
}

- (void)sendRelockRequestWithReset:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_alloc_init(SDUnlockRelockRequest);
  [(SDUnlockRelockRequest *)v5 setVersion:1];
  id v6 = paired_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sending relock request", buf, 2u);
  }

  uint64_t v7 = [(SDUnlockSessionManager *)self idsController];
  id v8 = [(SDUnlockRelockRequest *)v5 data];
  [v7 sendProtocolBufferData:v8 withType:111 timeout:0 option:1 errorHandler:&stru_1008D0D20];

  if (v3)
  {
    id v9 = paired_unlock_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cancelling session", v10, 2u);
    }

    [(SDUnlockKeyManager *)self resetAndClearState];
  }
}

- (BOOL)pairedWatchSupportsRelock
{
  if (_os_feature_enabled_impl())
  {
    BOOL v3 = [(SDUnlockSessionManager *)self idsController];
    uint64_t v4 = [v3 activeIDSDevice];

    if (v4)
    {
      [v4 operatingSystemVersion];
      uint64_t v5 = v9;
      [v4 operatingSystemVersion];
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v8 = 0;
    }
    BOOL v6 = v5 == qword_100969778 && v8 >= qword_100969780 || v5 > qword_100969778;
  }
  else
  {
    uint64_t v4 = paired_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Using old behavior", buf, 2u);
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)shouldUseTwoPartPill
{
  if ((_os_feature_enabled_impl() & 1) != 0
    || (unsigned int v3 = +[SFAutoUnlockManager autoUnlockEnabled]) != 0)
  {
    LOBYTE(v3) = [(SDUnlockKeyManager *)self pairedWatchSupportsRelock];
  }
  return v3;
}

- (BOOL)shouldStartUnlock
{
  if ([(SDUnlockKeyManager *)self remoteDeviceLocked])
  {
    if (self->_unlockingForKeybagUnlock)
    {
      unsigned int v3 = paired_unlock_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v8 = 0;
        uint64_t v4 = "Ongoing unlock. Not starting";
        uint64_t v5 = (uint8_t *)&v8;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
      }
    }
    else
    {
      if (![(SDUnlockKeyManager *)self pairedWatchSupportsRelock]
        || ![(SDUnlockKeyManager *)self needsOffWristBeforePairedUnlock])
      {
        return 1;
      }
      unsigned int v3 = paired_unlock_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v7 = 0;
        uint64_t v4 = "Due to previous relock request, Paired Unlock disabled until watch goes off wrist";
        uint64_t v5 = (uint8_t *)&v7;
        goto LABEL_7;
      }
    }
  }
  else
  {
    unsigned int v3 = paired_unlock_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v4 = "Not initiating, remote unlocked";
      uint64_t v5 = buf;
      goto LABEL_7;
    }
  }

  return 0;
}

- (BOOL)startUnlockIfNeeded
{
  if ([(SDUnlockKeyManager *)self unlockEnabled])
  {
    BOOL v3 = [(SDUnlockKeyManager *)self shouldStartUnlock];
    if (v3)
    {
      [(SDUnlockKeyManager *)self initializeMetrics];
      [(SDUnlockKeyManager *)self initiateRemoteUnlock];
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    uint64_t v4 = paired_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not initiating, not enabled", v6, 2u);
    }

    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)initiateRemoteUnlock
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  BOOL v3 = paired_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v44 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Initiating unlock", v44, 2u);
  }

  if ([(SDUnlockKeyManager *)self unlockingState])
  {
    if ((id)[(SDUnlockKeyManager *)self unlockingState] == (id)1 && self->_sessionRecord)
    {
      uint64_t v4 = paired_unlock_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        sessionRecord = self->_sessionRecord;
        *(_DWORD *)v44 = 138412290;
        *(void *)&v44[4] = sessionRecord;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unlock already in progress with record = %@", v44, 0xCu);
      }

      [(SDUnlockSessionRecord *)self->_sessionRecord setExpireTime:dispatch_time([(SDUnlockSessionRecord *)self->_sessionRecord expireTime], 45000000000)];
      [(SDUnlockSessionManager *)self restartUnlockTimer:[(SDUnlockSessionRecord *)self->_sessionRecord expireTime]];
      BOOL v6 = [(SDUnlockSessionRecord *)self->_sessionRecord keyData];
      BOOL useEscrowRecord = self->_useEscrowRecord;
      __int16 v8 = self->_sessionRecord;
      goto LABEL_45;
    }
    uint64_t v9 = paired_unlock_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001FEF60();
    }

    id v10 = [(SDUnlockSessionManager *)self metrics];

    if (v10)
    {
      id v11 = [(SDUnlockSessionManager *)self metrics];
      [v11 setFailureReason:20];
    }
    [(SDUnlockKeyManager *)self resetAndClearState];
    return;
  }
  [(SDUnlockSessionManager *)self updateSecurityManager];
  if (![(SDUnlockSessionManager *)self activeDevicesMatch])
  {
    NSErrorUserInfoKey v21 = +[NSDate date];
    CFStringRef v22 = [v21 dateByAddingTimeInterval:(double)qword_100969788];

    CFStringRef v23 = paired_unlock_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1001FEEF8();
    }

    CFStringRef v24 = [(SDUnlockSessionManager *)self metrics];

    if (v24)
    {
      uint64_t v25 = [(SDUnlockSessionManager *)self metrics];
      [v25 setFailureReason:18];
    }
    [(SDUnlockKeyManager *)self resetState];
    deviceSwitchUnlockRetryDate = self->_deviceSwitchUnlockRetryDate;
    self->_deviceSwitchUnlockRetryDate = v22;

    return;
  }
  uint64_t v12 = paired_unlock_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v44 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Active devices match", v44, 2u);
  }

  uint64_t v13 = paired_unlock_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_useEscrowRecord) {
      CFStringRef v14 = @"YES";
    }
    else {
      CFStringRef v14 = @"NO";
    }
    *(_DWORD *)v44 = 138412290;
    *(void *)&v44[4] = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Using escrow record = %@", v44, 0xCu);
  }

  CFStringRef v15 = [(SDUnlockSessionManager *)self metrics];

  if (v15)
  {
    BOOL v16 = self->_useEscrowRecord;
    uint64_t v17 = [(SDUnlockSessionManager *)self metrics];
    [v17 setUsingEscrowRecord:v16];
  }
  if (self->_useEscrowRecord) {
    goto LABEL_25;
  }
  __int16 v27 = [(SDUnlockSessionManager *)self securityManager];
  -[SDUnlockSessionManager setUnlockAuthSession:](self, "setUnlockAuthSession:", [v27 unlockSessionAsOriginator:1 usingEscrow:0 escrowSecret:0]);

  if ([(SDUnlockSessionManager *)self unlockAuthSession] < 0)
  {
    id v43 = paired_unlock_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v44 = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Falling back to escrow record", v44, 2u);
    }

    self->_BOOL useEscrowRecord = 1;
LABEL_25:
    *(_DWORD *)v44 = 0;
    goto LABEL_26;
  }
  BOOL v28 = self->_useEscrowRecord;
  *(_DWORD *)v44 = 0;
  if (!v28) {
    goto LABEL_42;
  }
LABEL_26:
  BOOL v18 = [(SDUnlockSessionManager *)self securityManager];
  NSErrorUserInfoKey v19 = [v18 escrowData];

  if (v19)
  {
    CFStringRef v20 = [(SDUnlockSessionManager *)self securityManager];
    -[SDUnlockSessionManager setUnlockAuthSession:](self, "setUnlockAuthSession:", [v20 unlockSessionAsOriginator:1 usingEscrow:1 escrowSecret:v19 errorCode:v44]);
  }
  else
  {
    __int16 v29 = paired_unlock_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1001FEEC4();
    }

    CFStringRef v30 = [(SDUnlockSessionManager *)self metrics];

    if (!v30) {
      goto LABEL_41;
    }
    CFStringRef v20 = [(SDUnlockSessionManager *)self metrics];
    [v20 setFailureReason:23];
  }

LABEL_41:
LABEL_42:
  if (([(SDUnlockSessionManager *)self unlockAuthSession] & 0x8000000000000000) == 0)
  {
    v31 = [(SDUnlockSessionManager *)self securityManager];
    BOOL v6 = [v31 stepWithAuthSession:-[SDUnlockSessionManager unlockAuthSession](self, "unlockAuthSession") data:0];

    if (!v6)
    {
      v40 = paired_unlock_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_1001FEDD4();
      }

      v41 = [(SDUnlockSessionManager *)self metrics];

      if (v41)
      {
        v42 = [(SDUnlockSessionManager *)self metrics];
        [v42 setFailureReason:21];
      }
      [(SDUnlockKeyManager *)self resetState];
      goto LABEL_46;
    }
    v32 = objc_alloc_init(SDUnlockSessionRecord);
    v33 = self->_sessionRecord;
    self->_sessionRecord = v32;

    [(SDUnlockSessionRecord *)self->_sessionRecord setKeyData:v6];
    [(SDUnlockSessionRecord *)self->_sessionRecord setUnlockSessionID:[(SDUnlockSessionManager *)self generateSessionID]];
    [(SDUnlockSessionRecord *)self->_sessionRecord setExpireTime:sub_1001B1AF8((double)65)];
    [(SDUnlockSessionManager *)self restartUnlockTimer:[(SDUnlockSessionRecord *)self->_sessionRecord expireTime]];
    BOOL useEscrowRecord = self->_useEscrowRecord;
    __int16 v8 = self->_sessionRecord;
LABEL_45:
    [(SDUnlockKeyManager *)self sendSessionKeyExchangeRequest:v6 usedEscrow:useEscrowRecord sessionID:[(SDUnlockSessionRecord *)v8 unlockSessionID]];
LABEL_46:

    return;
  }
  v34 = paired_unlock_log();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    sub_1001FEE48((int *)v44, v34);
  }

  v35 = [(SDUnlockSessionManager *)self metrics];

  if (v35)
  {
    v36 = [(SDUnlockSessionManager *)self metrics];
    [v36 setFailureReason:21];
  }
  [(SDUnlockKeyManager *)self resetAndClearState];
  if (*(_DWORD *)v44 == -536870174 || *(_DWORD *)v44 == -536362984 || *(_DWORD *)v44 == -536362989)
  {
    v37 = auto_unlock_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      sub_1001FEE08();
    }

    v38 = [(SDUnlockSessionManager *)self metrics];

    if (v38)
    {
      v39 = [(SDUnlockSessionManager *)self metrics];
      [v39 setFailureReason:22];
    }
    [(SDUnlockKeyManager *)self disableUnlockPairing];
    [(SDUnlockSessionManager *)self sendDisableMessage];
    BOOL v6 = [(SDUnlockSessionManager *)self securityManager];
    [v6 deleteLongTermKeys];
    goto LABEL_46;
  }
}

- (BOOL)initiateStashBagCreationWithManifest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SDUnlockSessionManager *)self securityManager];
  BOOL v6 = [v5 escrowData];

  if (!v6)
  {
    id v11 = paired_unlock_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001FEFF0();
    }
    goto LABEL_10;
  }
  __int16 v7 = [(SDUnlockSessionManager *)self securityManager];
  -[SDUnlockSessionManager setStashBagSession:](self, "setStashBagSession:", [v7 stashBagSessionAsOriginator:1 escrowSecret:v6 manifest:v4]);

  if ([(SDUnlockSessionManager *)self stashBagSession] < 0)
  {
    id v11 = paired_unlock_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001FF024();
    }
LABEL_10:

    BOOL v10 = 0;
    goto LABEL_11;
  }
  __int16 v8 = [(SDUnlockSessionManager *)self securityManager];
  uint64_t v9 = [v8 stepWithAuthSession:-[SDUnlockSessionManager stashBagSession](self, "stashBagSession") data:0];

  BOOL v10 = v9 != 0;
  if (v9) {
    [(SDUnlockKeyManager *)self sendStashKeyRequest:v9 sessionID:[(SDUnlockSessionManager *)self generateSessionID]];
  }

LABEL_11:
  return v10;
}

- (void)initializeMetrics
{
  id v3 = objc_alloc_init((Class)SFPairedUnlockEvent);
  [(SDUnlockSessionManager *)self setMetrics:v3];

  id v4 = +[SFAutoUnlockManager autoUnlockEnabled];
  uint64_t v5 = [(SDUnlockSessionManager *)self metrics];
  [v5 setPhoneAutoUnlockEnabled:v4];

  BOOL v6 = [(SDUnlockKeyManager *)self shouldUseTwoPartPill];
  __int16 v7 = [(SDUnlockSessionManager *)self metrics];
  [v7 setCanRelock:v6];

  id v23 = +[NSDate date];
  __int16 v8 = +[NSCalendar currentCalendar];
  uint64_t v9 = [v8 components:32 fromDate:v23];
  BOOL v10 = [v9 hour];
  id v11 = [v8 maximumRangeOfUnit:32];
  uint64_t v13 = (uint64_t)((double)(unint64_t)(v10 - v11) / (double)v12 * 24.0);
  CFStringRef v14 = [(SDUnlockSessionManager *)self metrics];
  [v14 setAttemptHourLocal:(unsigned __int16)v13];

  CFStringRef v15 = [(SDUnlockSessionManager *)self idsController];
  BOOL v16 = [v15 activeIDSDevice];

  uint64_t v17 = [v16 productBuildVersion];
  BOOL v18 = [(SDUnlockSessionManager *)self metrics];
  [v18 setWatchSoftwareVersion:v17];

  NSErrorUserInfoKey v19 = [v16 modelIdentifier];
  CFStringRef v20 = [(SDUnlockSessionManager *)self metrics];
  [v20 setWatchHardwareModel:v19];

  NSErrorUserInfoKey v21 = +[NSDate date];
  CFStringRef v22 = [(SDUnlockKeyManager *)self metricDates];
  [v22 setStarted:v21];
}

- (void)consolidateLatencies:(id)a3
{
  id v50 = a3;
  id v4 = +[NSDate date];
  if (v50)
  {
    uint64_t v5 = [v50 started];
    if (v5)
    {
      BOOL v6 = (void *)v5;
      __int16 v7 = [(SDUnlockSessionManager *)self metrics];

      if (v7)
      {
        dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
        __int16 v8 = [v50 keyExchangeResponseReceived];

        if (v8)
        {
          uint64_t v9 = [v50 keyExchangeResponseReceived];
          BOOL v10 = [v50 started];
          [v9 timeIntervalSinceDate:v10];
          double v12 = v11;

          uint64_t v13 = [(SDUnlockSessionManager *)self metrics];
          [v13 setKeyExchangeDuration:(v12 * 1000.0)];
        }
        else
        {
          uint64_t v13 = [v50 started];
          [v4 timeIntervalSinceDate:v13];
          uint64_t v15 = (v14 * 1000.0);
          BOOL v16 = [(SDUnlockSessionManager *)self metrics];
          [v16 setKeyExchangeDuration:v15];
        }
        uint64_t v17 = [v50 keyExchangeResponseReceived];
        BOOL v18 = v50;
        if (v17
          && ([v50 pillUpdated],
              NSErrorUserInfoKey v19 = objc_claimAutoreleasedReturnValue(),
              v19,
              v17,
              BOOL v18 = v50,
              v19))
        {
          CFStringRef v20 = [v50 pillUpdated];
          NSErrorUserInfoKey v21 = [v50 keyExchangeResponseReceived];
          [v20 timeIntervalSinceDate:v21];
          uint64_t v23 = (v22 * 1000.0);
          CFStringRef v24 = [(SDUnlockSessionManager *)self metrics];
          [v24 setPillDelay:v23];
        }
        else
        {
          uint64_t v25 = [v18 keyExchangeResponseReceived];

          uint64_t v26 = v50;
          if (!v25)
          {
LABEL_13:
            uint64_t v29 = [v26 pillUpdated];
            if (v29
              && (CFStringRef v30 = (void *)v29,
                  [v50 confirmationReceived],
                  v31 = objc_claimAutoreleasedReturnValue(),
                  v31,
                  v30,
                  v31))
            {
              v32 = [v50 confirmationReceived];
              v33 = [v50 pillUpdated];
              [v32 timeIntervalSinceDate:v33];
              double v35 = v34;

              v36 = [(SDUnlockSessionManager *)self metrics];
              [v36 setConfirmationDuration:(v35 * 1000.0)];
            }
            else
            {
              v37 = [v50 pillUpdated];

              v38 = v50;
              if (!v37)
              {
LABEL_19:
                v42 = [v38 started];
                [v4 timeIntervalSinceDate:v42];
                uint64_t v44 = (v43 * 1000.0);
                uint64_t v45 = [(SDUnlockSessionManager *)self metrics];
                [v45 setTotalUnlockDuration:v44];

                v46 = [(SDUnlockSessionManager *)self metrics];
                LODWORD(v44) = [v46 keyExchangeDuration];
                double v47 = [(SDUnlockSessionManager *)self metrics];
                uint64_t v48 = [v47 confirmationDuration] + v44;
                uint64_t v49 = [(SDUnlockSessionManager *)self metrics];
                [v49 setTotalUnlockProcessDuration:v48];

                goto LABEL_20;
              }
              v36 = [v50 pillUpdated];
              [v4 timeIntervalSinceDate:v36];
              uint64_t v40 = (v39 * 1000.0);
              v41 = [(SDUnlockSessionManager *)self metrics];
              [v41 setConfirmationDuration:v40];
            }
            v38 = v50;
            goto LABEL_19;
          }
          CFStringRef v20 = [v50 keyExchangeResponseReceived];
          [v4 timeIntervalSinceDate:v20];
          uint64_t v28 = (v27 * 1000.0);
          NSErrorUserInfoKey v21 = [(SDUnlockSessionManager *)self metrics];
          [v21 setPillDelay:v28];
        }

        uint64_t v26 = v50;
        goto LABEL_13;
      }
    }
  }
LABEL_20:
}

- (BOOL)useEscrowRecord
{
  return self->_useEscrowRecord;
}

- (void)setUseEscrowRecord:(BOOL)a3
{
  self->_BOOL useEscrowRecord = a3;
}

- (NSTimer)stashTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStashTimer:(id)a3
{
}

- (BOOL)remoteDeviceLocked
{
  return self->_remoteDeviceLocked;
}

- (void)setRemoteDeviceLocked:(BOOL)a3
{
  self->_remoteDeviceLocked = a3;
}

- (BOOL)ltkWaitingForUnlock
{
  return self->_ltkWaitingForUnlock;
}

- (void)setLtkWaitingForUnlock:(BOOL)a3
{
  self->_ltkWaitingForUnlock = a3;
}

- (BOOL)outstandingStartLTK
{
  return self->_outstandingStartLTK;
}

- (void)setOutstandingStartLTK:(BOOL)a3
{
  self->_outstandingStartLTK = a3;
}

- (BOOL)unlockingForKeybagUnlock
{
  return self->_unlockingForKeybagUnlock;
}

- (void)setUnlockingForKeybagUnlock:(BOOL)a3
{
  self->_BOOL unlockingForKeybagUnlock = a3;
}

- (BOOL)needsOffWristBeforePairedUnlock
{
  return self->_needsOffWristBeforePairedUnlock;
}

- (void)setNeedsOffWristBeforePairedUnlock:(BOOL)a3
{
  self->_needsOffWristBeforePairedUnlock = a3;
}

- (BOOL)autoUnlockEnabledUpdatedAfterFirstUnlock
{
  return self->_autoUnlockEnabledUpdatedAfterFirstUnlock;
}

- (void)setAutoUnlockEnabledUpdatedAfterFirstUnlock:(BOOL)a3
{
  self->_autoUnlockEnabledUpdatedAfterFirstUnlock = a3;
}

- (BOOL)waitingForAutoUnlockStateUpdateToStartPairedUnlock
{
  return self->_waitingForAutoUnlockStateUpdateToStartPairedUnlock;
}

- (void)setWaitingForAutoUnlockStateUpdateToStartPairedUnlock:(BOOL)a3
{
  self->_waitingForAutoUnlockStateUpdateToStartPairedUnlock = a3;
}

- (NSDate)deviceSwitchUnlockRetryDate
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDeviceSwitchUnlockRetryDate:(id)a3
{
}

- (OS_dispatch_source)delayedStartTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDelayedStartTimer:(id)a3
{
}

- (OS_dispatch_source)stateTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 112, 1);
}

- (void)setStateTimer:(id)a3
{
}

- (OS_dispatch_source)longTermKeyTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLongTermKeyTimer:(id)a3
{
}

- (SDUnlockSessionRecord)sessionRecord
{
  return (SDUnlockSessionRecord *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSessionRecord:(id)a3
{
}

- (SDUnlockKeyMetricDates)metricDates
{
  return (SDUnlockKeyMetricDates *)objc_getProperty(self, a2, 136, 1);
}

- (void)setMetricDates:(id)a3
{
}

- (id)stashHandler
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setStashHandler:(id)a3
{
}

- (id)stateHandler
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setStateHandler:(id)a3
{
}

- (id)keybagAssertion
{
  return objc_getProperty(self, a2, 160, 1);
}

- (void)setKeybagAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keybagAssertion, 0);
  objc_storeStrong(&self->_stateHandler, 0);
  objc_storeStrong(&self->_stashHandler, 0);
  objc_storeStrong((id *)&self->_metricDates, 0);
  objc_storeStrong((id *)&self->_sessionRecord, 0);
  objc_storeStrong((id *)&self->_longTermKeyTimer, 0);
  objc_storeStrong((id *)&self->_stateTimer, 0);
  objc_storeStrong((id *)&self->_delayedStartTimer, 0);
  objc_storeStrong((id *)&self->_deviceSwitchUnlockRetryDate, 0);

  objc_storeStrong((id *)&self->_stashTimer, 0);
}

@end