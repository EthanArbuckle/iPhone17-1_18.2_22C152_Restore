@interface SDAutoUnlockKeySession
- (BOOL)alerted;
- (BOOL)authenticatingForSiri;
- (BOOL)didDelayWorkDueToPowerAssertion;
- (BOOL)handleAWDLInfo:(id)a3;
- (BOOL)invalidated;
- (BOOL)keyInState;
- (BOOL)localDeviceNeedsArming;
- (BOOL)needsImageData;
- (BOOL)needsStrictMotionCheck;
- (BOOL)oldApproveProtocol;
- (BOOL)promptedForApproval;
- (BOOL)promptingForApproval;
- (BOOL)sentAWDLInfo;
- (BOOL)sessionCompleted;
- (BOOL)shouldAlertOnNotify;
- (BOOL)shouldDelayWorkDueToPowerAssertion;
- (BOOL)suppressWatchNotification;
- (BOOL)userRequestRequired;
- (BOOL)usingImageCache;
- (BOOL)wifiEnabled;
- (NSArray)peerList;
- (NSArray)wakeGestureDates;
- (NSData)authPromptIconHash;
- (NSData)proxyRequestData;
- (NSDate)phoneUnlockDate;
- (NSDate)unlockedOnWristDate;
- (NSMutableData)authPromptIconData;
- (NSNumber)unlockAllowed;
- (OS_dispatch_source)assertionTimer;
- (OS_os_transaction)transaction;
- (SDAutoUnlockKeySession)initWithBLEDevice:(id)a3 sessionID:(id)a4;
- (SDAutoUnlockMacIconCache)iconCache;
- (SDUnlockMotionDetector)motionDetector;
- (SDUnlockSessionKeyExchangeResponse)exchangeResponse;
- (id)wifiRequestStartedHandler;
- (int)errorRequestingUnlock;
- (int)powerAssertionState;
- (int64_t)remoteCacheID;
- (unsigned)powerAssertionID;
- (void)_invalidate;
- (void)addObservers;
- (void)alertOfUnlock;
- (void)createAuthTokenIfReady;
- (void)createWiFiRequest;
- (void)declareSystemActivityAssertion;
- (void)deviceDisconnected:(id)a3;
- (void)handleAuthPromptImageData:(id)a3;
- (void)handleAuthPromptRequest:(id)a3;
- (void)handleCleanUpAWDL;
- (void)handleMessageWithWrapper:(id)a3;
- (void)handleSessionKeyExchangeResponse:(id)a3;
- (void)handleUnlockConfirmation:(id)a3;
- (void)invalidate;
- (void)invalidateAssertionTimer;
- (void)invalidateOnQueue;
- (void)logAutoUnlockEnd;
- (void)logAutoUnlockStart;
- (void)notifyDelegateWithError:(id)a3;
- (void)nq_awdlNetworkStarted;
- (void)nq_handleWiFiRequestInvalidated;
- (void)nq_handleWiFiRequestStartedWithStartAWDLHandler:(id)a3;
- (void)postBeganUnlockingNotification;
- (void)releaseIdleSleepAssertion;
- (void)removeObservers;
- (void)restartAssertionTimer;
- (void)sendAWDLInfoWithKeyData:(id)a3 error:(id)a4;
- (void)sendAuthPromptResponseWithData:(id)a3 error:(id)a4;
- (void)sendConfirmationACK;
- (void)sendKeyExchangeRequestWithData:(id)a3 error:(id)a4;
- (void)sendSessionAuthToken:(id)a3 error:(id)a4;
- (void)setAlerted:(BOOL)a3;
- (void)setAssertionTimer:(id)a3;
- (void)setAuthPromptIconData:(id)a3;
- (void)setAuthPromptIconHash:(id)a3;
- (void)setAuthenticatingForSiri:(BOOL)a3;
- (void)setDidDelayWorkDueToPowerAssertion:(BOOL)a3;
- (void)setErrorRequestingUnlock:(int)a3;
- (void)setExchangeResponse:(id)a3;
- (void)setIconCache:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setLocalDeviceNeedsArming:(BOOL)a3;
- (void)setMotionDetector:(id)a3;
- (void)setNeedsImageData:(BOOL)a3;
- (void)setNeedsStrictMotionCheck:(BOOL)a3;
- (void)setOldApproveProtocol:(BOOL)a3;
- (void)setPeerList:(id)a3;
- (void)setPhoneUnlockDate:(id)a3;
- (void)setPowerAssertionID:(unsigned int)a3;
- (void)setPowerAssertionState:(int)a3;
- (void)setPromptedForApproval:(BOOL)a3;
- (void)setPromptingForApproval:(BOOL)a3;
- (void)setProxyRequestData:(id)a3;
- (void)setRemoteCacheID:(int64_t)a3;
- (void)setSentAWDLInfo:(BOOL)a3;
- (void)setSessionCompleted:(BOOL)a3;
- (void)setShouldAlertOnNotify:(BOOL)a3;
- (void)setShouldDelayWorkDueToPowerAssertion:(BOOL)a3;
- (void)setSuppressWatchNotification:(BOOL)a3;
- (void)setTransaction:(id)a3;
- (void)setUnlockAllowed:(id)a3;
- (void)setUnlockedOnWristDate:(id)a3;
- (void)setUserRequestRequired:(BOOL)a3;
- (void)setUsingImageCache:(BOOL)a3;
- (void)setWakeGestureDates:(id)a3;
- (void)setWifiEnabled:(BOOL)a3;
- (void)setWifiRequestStartedHandler:(id)a3;
- (void)systemIsActive:(id)a3;
@end

@implementation SDAutoUnlockKeySession

- (SDAutoUnlockKeySession)initWithBLEDevice:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SDAutoUnlockKeySession;
  v7 = [(SDAutoUnlockAuthSession *)&v21 initWithDevice:0 sessionID:a4 bleDevice:v6];
  v8 = v7;
  if (v7)
  {
    v7->_powerAssertionID = 0;
    v9 = +[SDAutoUnlockTransport sharedTransport];
    v10 = [v6 identifier];
    v11 = [v9 cachedIDSDeviceIDsForBluetoothID:v10];
    v12 = [v11 firstObject];
    [(SDAutoUnlockPairingSession *)v8 setDeviceID:v12];

    v13 = [(SDAutoUnlockPairingSession *)v8 deviceID];

    if (!v13)
    {
      v14 = +[SDAutoUnlockTransport sharedTransport];
      v15 = [v6 identifier];
      v16 = [v14 idsDeviceForBluetoothID:v15];

      v17 = [v16 uniqueID];
      [(SDAutoUnlockPairingSession *)v8 setDeviceID:v17];
    }
    [(SDAutoUnlockKeySession *)v8 addObservers];
    v18 = auto_unlock_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [(SDAutoUnlockPairingSession *)v8 deviceID];
      *(_DWORD *)buf = 138412290;
      v23 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Key session initialized (device id: %@)", buf, 0xCu);
    }
  }

  return v8;
}

- (void)invalidate
{
  v3 = SFHighPriorityQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000248B0;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)invalidateOnQueue
{
  v3 = SFHighPriorityQueue();
  dispatch_assert_queue_V2(v3);

  [(SDAutoUnlockKeySession *)self _invalidate];
}

- (void)_invalidate
{
  if (![(SDAutoUnlockKeySession *)self invalidated])
  {
    [(SDAutoUnlockKeySession *)self setInvalidated:1];
    [(SDAutoUnlockKeySession *)self setSuppressWatchNotification:0];
    [(SDAutoUnlockKeySession *)self setDidDelayWorkDueToPowerAssertion:0];
    v3 = [(SDAutoUnlockKeySession *)self motionDetector];

    if (v3)
    {
      v4 = [(SDAutoUnlockKeySession *)self motionDetector];
      [v4 invalidate];

      [(SDAutoUnlockKeySession *)self setMotionDetector:0];
    }
    v5 = +[SDAutoUnlockWiFiManager sharedManager];
    id v6 = [(SDAutoUnlockAuthSession *)self wifiRequest];
    [v5 cancelWiFiRequest:v6];

    [(SDAutoUnlockAuthSession *)self setWifiRequest:0];
    [(SDAutoUnlockKeySession *)self removeObservers];
    if ([(SDAutoUnlockKeySession *)self promptingForApproval])
    {
      v7 = auto_unlock_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing authorization request", buf, 2u);
      }

      v8 = +[SDAutoUnlockNotificationsManager sharedManager];
      [v8 removeAuthorizationRequestNotification];
    }
    sub_1000D2CF0(0);
    v11.receiver = self;
    v11.super_class = (Class)SDAutoUnlockKeySession;
    [(SDAutoUnlockAuthSession *)&v11 invalidate];
    v9 = [(SDAutoUnlockPairingSession *)self sessionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100024AD8;
    block[3] = &unk_1008CA4B8;
    block[4] = self;
    dispatch_async(v9, block);
  }
}

- (BOOL)keyInState
{
  if ((id)[(SDAutoUnlockAuthSession *)self protocol] != (id)2) {
    return 1;
  }
  v2 = +[SDStatusMonitor sharedMonitor];
  unsigned int v3 = [v2 deviceKeyBagDisabled];

  v4 = +[SDStatusMonitor sharedMonitor];
  id v5 = [v4 watchWristState];

  if ((v3 & 1) == 0 && v5 != (id)1) {
    return 1;
  }
  v7 = auto_unlock_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"YES";
    if (v3) {
      CFStringRef v9 = @"NO";
    }
    else {
      CFStringRef v9 = @"YES";
    }
    if (v5 == (id)1) {
      CFStringRef v8 = @"NO";
    }
    int v11 = 138412546;
    CFStringRef v12 = v9;
    __int16 v13 = 2112;
    CFStringRef v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Watch not in state. Passcode enabled: %@, wrist detection enabled: %@", (uint8_t *)&v11, 0x16u);
  }

  v10 = +[SDAutoUnlockAKSManager sharedManager];
  [v10 deleteEscrowSecretForPhones];

  return 0;
}

- (void)notifyDelegateWithError:(id)a3
{
  id v4 = a3;
  id v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Auth key session notifying delegate with error: %@", (uint8_t *)&v10, 0xCu);
  }

  if (![(SDAutoUnlockKeySession *)self sessionCompleted])
  {
    [(SDAutoUnlockKeySession *)self setSessionCompleted:1];
    if ([(SDAutoUnlockKeySession *)self shouldAlertOnNotify])
    {
      id v6 = auto_unlock_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Alerting on notify", (uint8_t *)&v10, 2u);
      }

      [(SDAutoUnlockKeySession *)self alertOfUnlock];
    }
    v7 = [(SDAutoUnlockPairingSession *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      CFStringRef v9 = [(SDAutoUnlockPairingSession *)self delegate];
      [v9 session:self didCompleteWithError:v4];
    }
  }
}

- (void)postBeganUnlockingNotification
{
  if ([(SDAutoUnlockAuthSession *)self isAuthenticatingForSiri])
  {
    id v4 = +[SDAutoUnlockNotificationsManager sharedManager];
    unsigned int v3 = [(SDAutoUnlockPairingSession *)self deviceID];
    [v4 showAuthenticatedSiriForDeviceID:v3];
  }
}

- (void)addObservers
{
  unsigned int v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"deviceDisconnected:" name:SFBluetoothNotificationNameDisconnected object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"systemIsActive:" name:@"com.apple.sharingd.SystemHasPoweredOn" object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"systemIsActive:" name:@"com.apple.sharingd.SystemWillNotSleep" object:0];
}

- (void)removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)deviceDisconnected:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:SFBluetoothNotificationKeyPeerDevice];

  id v6 = [v5 identifier];
  v7 = [(SDAutoUnlockAuthSession *)self bleDevice];
  char v8 = [v7 identifier];
  unsigned int v9 = [v6 isEqual:v8];

  if (v9)
  {
    int v10 = auto_unlock_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v5 identifier];
      CFStringRef v12 = [v11 UUIDString];
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BLE peer disconnected (identifier: %@)", buf, 0xCu);
    }
    uint64_t v13 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    CFStringRef v17 = @"BLE Peer disconnected";
    CFStringRef v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v15 = +[NSError errorWithDomain:v13 code:186 userInfo:v14];
    [(SDAutoUnlockKeySession *)self notifyDelegateWithError:v15];
  }
}

- (void)systemIsActive:(id)a3
{
  id v4 = a3;
  id v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "System is active", buf, 2u);
  }

  id v6 = self;
  objc_sync_enter(v6);
  unsigned int v7 = [(SDAutoUnlockKeySession *)v6 didDelayWorkDueToPowerAssertion];
  if (v7)
  {
    char v8 = auto_unlock_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Beginning delayed work", buf, 2u);
    }

    [(SDAutoUnlockKeySession *)v6 setDidDelayWorkDueToPowerAssertion:0];
  }
  [(SDAutoUnlockKeySession *)v6 setShouldDelayWorkDueToPowerAssertion:0];
  objc_sync_exit(v6);

  if (v7)
  {
    unsigned int v9 = SFHighPriorityQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000252F4;
    block[3] = &unk_1008CA4B8;
    block[4] = v6;
    dispatch_async(v9, block);
  }
}

- (void)alertOfUnlock
{
  if ([(SDAutoUnlockKeySession *)self userRequestRequired]
    || [(SDAutoUnlockKeySession *)self alerted]
    || [(SDAutoUnlockKeySession *)self suppressWatchNotification])
  {
    id v3 = auto_unlock_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Authorization allowed by request, not showing alert", buf, 2u);
    }
  }
  else
  {
    [(SDAutoUnlockKeySession *)self setAlerted:1];
    id v5 = +[SDAutoUnlockNotificationsManager sharedManager];
    id v4 = [(SDAutoUnlockPairingSession *)self deviceID];
    [v5 showUnlockedByDeviceNotificationWithDeviceID:v4];
  }
}

- (void)createWiFiRequest
{
  id v3 = +[NSDate date];
  [(SDAutoUnlockAuthSession *)self setAwdlStart:v3];

  id v4 = [(SDAutoUnlockAuthSession *)self remoteAWDLInfo];
  id v5 = +[NSMutableDictionary dictionaryWithDictionary:v4];

  id v6 = [(SDAutoUnlockAuthSession *)self localAWDLInfo];
  [v5 setObject:v6 forKeyedSubscript:@"AWDL_INFO_SELF"];

  unsigned int v7 = +[SDNearbyAgent sharedNearbyAgent];
  char v8 = [v7 dispatchQueue];

  location[0] = 0;
  objc_initWeak(location, self);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10002571C;
  v29[3] = &unk_1008CA508;
  id v9 = v8;
  id v30 = v9;
  objc_copyWeak(&v31, location);
  int v10 = objc_retainBlock(v29);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10002585C;
  v25[3] = &unk_1008CA558;
  id v11 = v9;
  id v26 = v11;
  objc_copyWeak(&v28, location);
  v27 = self;
  CFStringRef v12 = objc_retainBlock(v25);
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  objc_super v21 = sub_100025A88;
  v22 = &unk_1008CA580;
  id v13 = v11;
  id v23 = v13;
  objc_copyWeak(&v24, location);
  CFStringRef v14 = objc_retainBlock(&v19);
  v15 = [SDAutoUnlockWiFiRequest alloc];
  NSErrorUserInfoKey v16 = -[SDAutoUnlockWiFiRequest initWithAwdlInfo:isRangingInitiator:rangingPeer:queueAvailableHandler:awdlStartedHandler:peerFoundHandler:rangingStartedHandler:rangingCompletedHandler:invalidationHandler:](v15, "initWithAwdlInfo:isRangingInitiator:rangingPeer:queueAvailableHandler:awdlStartedHandler:peerFoundHandler:rangingStartedHandler:rangingCompletedHandler:invalidationHandler:", v5, 0, 0, v10, v12, 0, 0, 0, v14, v19, v20, v21, v22);
  [(SDAutoUnlockAuthSession *)self setWifiRequest:v16];

  CFStringRef v17 = +[SDAutoUnlockWiFiManager sharedManager];
  v18 = [(SDAutoUnlockAuthSession *)self wifiRequest];
  [v17 scheduleWiFiRequest:v18];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&v31);
  objc_destroyWeak(location);
}

- (void)nq_awdlNetworkStarted
{
  id v3 = +[SDNearbyAgent sharedNearbyAgent];
  id v4 = [v3 dispatchQueue];
  dispatch_assert_queue_V2(v4);

  kdebug_trace();
  id v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[SDStatusMonitor sharedMonitor];
    unsigned int v7 = [v6 awdlInfo];
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AWDL network up with info %@", (uint8_t *)&v12, 0xCu);
  }
  char v8 = auto_unlock_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = +[NSDate date];
    int v10 = [(SDAutoUnlockAuthSession *)self awdlStart];
    [v9 timeIntervalSinceDate:v10];
    int v12 = 134217984;
    id v13 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Automation: AWDL started %0.2f", (uint8_t *)&v12, 0xCu);
  }
}

- (void)nq_handleWiFiRequestStartedWithStartAWDLHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[SDNearbyAgent sharedNearbyAgent];
  id v6 = [v5 dispatchQueue];
  dispatch_assert_queue_V2(v6);

  [(SDAutoUnlockKeySession *)self setWifiRequestStartedHandler:v4];

  [(SDAutoUnlockKeySession *)self createAuthTokenIfReady];
}

- (void)nq_handleWiFiRequestInvalidated
{
  v2 = +[SDNearbyAgent sharedNearbyAgent];
  id v3 = [v2 dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = auto_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000297F8();
  }
}

- (void)handleMessageWithWrapper:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 messageType];
  switch(v5)
  {
    case 8u:
      id v6 = auto_unlock_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received SDUnlockSessionKeyExchangeResponse", (uint8_t *)&v34, 2u);
      }

      [(SDAutoUnlockPairingSession *)self invalidateResponseTimer];
      unsigned int v7 = [v4 payload];
      [(SDAutoUnlockKeySession *)self handleSessionKeyExchangeResponse:v7];

      break;
    case 9u:
    case 0xBu:
    case 0xDu:
      break;
    case 0xAu:
      uint64_t v20 = auto_unlock_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Received SDUnlockSessionConfirmation", (uint8_t *)&v34, 2u);
      }

      [(SDAutoUnlockPairingSession *)self invalidateResponseTimer];
      objc_super v21 = [v4 payload];
      [(SDAutoUnlockKeySession *)self handleUnlockConfirmation:v21];

      break;
    case 0xCu:
      sub_1000D2CF0(1);
      v22 = auto_unlock_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Finished setting in progress", (uint8_t *)&v34, 2u);
      }

      if ([v4 hasSenderID])
      {
        id v23 = objc_alloc((Class)NSUUID);
        id v24 = [v4 senderID];
        id v25 = [v23 initWithUUIDBytes:[v24 bytes]];
        id v26 = [v25 UUIDString];
        [(SDAutoUnlockPairingSession *)self setDeviceID:v26];

        v27 = auto_unlock_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          id v28 = [(SDAutoUnlockPairingSession *)self deviceID];
          int v34 = 138412290;
          v35 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Key session received device id: %@", (uint8_t *)&v34, 0xCu);
        }
      }
      v29 = auto_unlock_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Received SDAutoUnlockAuthPromptRequest", (uint8_t *)&v34, 2u);
      }

      id v30 = [v4 payload];
      [(SDAutoUnlockKeySession *)self handleAuthPromptRequest:v30];

      break;
    case 0xEu:
      id v31 = auto_unlock_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Received SDAutoUnlockAuthPromptImageData", (uint8_t *)&v34, 2u);
      }

      v32 = [v4 payload];
      [(SDAutoUnlockKeySession *)self handleAuthPromptImageData:v32];

      break;
    case 0xFu:
      v33 = auto_unlock_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Received SDAutoUnlockMessageTypeCleanUpAWDL", (uint8_t *)&v34, 2u);
      }

      [(SDAutoUnlockKeySession *)self handleCleanUpAWDL];
      break;
    default:
      if (v5 == 301)
      {
        sub_1000D2CF0(1);
        char v8 = auto_unlock_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v34) = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Finished setting in progress", (uint8_t *)&v34, 2u);
        }

        if ([v4 hasSenderID])
        {
          id v9 = objc_alloc((Class)NSUUID);
          id v10 = [v4 senderID];
          id v11 = [v9 initWithUUIDBytes:[v10 bytes]];
          int v12 = [v11 UUIDString];
          [(SDAutoUnlockPairingSession *)self setDeviceID:v12];

          id v13 = auto_unlock_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v14 = [(SDAutoUnlockPairingSession *)self deviceID];
            int v34 = 138412290;
            v35 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Key session received device id: %@", (uint8_t *)&v34, 0xCu);
          }
        }
        v15 = auto_unlock_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          NSErrorUserInfoKey v16 = [(SDAutoUnlockPairingSession *)self sessionID];
          int v34 = 138412290;
          v35 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Received SDAutoUnlockMessageTypeAWDLInfo %@", (uint8_t *)&v34, 0xCu);
        }
        kdebug_trace();
        CFStringRef v17 = [v4 payload];
        unsigned int v18 = [(SDAutoUnlockKeySession *)self handleAWDLInfo:v17];

        if (v18)
        {
          [(SDAutoUnlockKeySession *)self postBeganUnlockingNotification];
          v19 = self;
          objc_sync_enter(v19);
          if ([(SDAutoUnlockKeySession *)v19 shouldDelayWorkDueToPowerAssertion])
          {
            [(SDAutoUnlockKeySession *)v19 setDidDelayWorkDueToPowerAssertion:1];
            objc_sync_exit(v19);
          }
          else
          {
            objc_sync_exit(v19);

            [(SDAutoUnlockKeySession *)v19 beginAKSSession];
          }
        }
      }
      break;
  }
}

- (BOOL)handleAWDLInfo:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [[SDAutoUnlockAWDLInfo alloc] initWithData:v4];

  id v6 = [(SDAutoUnlockAWDLInfo *)v5 awdlInfo];
  unsigned int v7 = sub_1000D2064(v6);

  if (v7)
  {
    if ([(SDAutoUnlockAWDLInfo *)v5 version] == 1)
    {
      char v8 = auto_unlock_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v42 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Using legacy protocol", v42, 2u);
      }
      uint64_t v9 = 0;
    }
    else
    {
      unsigned int v29 = [(SDAutoUnlockAWDLInfo *)v5 version];
      char v8 = auto_unlock_log();
      BOOL v30 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v29 == 4)
      {
        if (v30)
        {
          *(_WORD *)v42 = 0;
          uint64_t v9 = 2;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Using attested protocol", v42, 2u);
        }
        else
        {
          uint64_t v9 = 2;
        }
      }
      else
      {
        if (v30)
        {
          *(_WORD *)v42 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Using modern protocol", v42, 2u);
        }
        uint64_t v9 = 1;
      }
    }

    [(SDAutoUnlockAuthSession *)self setProtocol:v9];
    [(SDAutoUnlockKeySession *)self logAutoUnlockStart];
    [(SDAutoUnlockKeySession *)self declareSystemActivityAssertion];
    if ([(SDAutoUnlockAuthSession *)self useAKSToken]) {
      BOOL v31 = [(SDAutoUnlockAWDLInfo *)v5 useToken];
    }
    else {
      BOOL v31 = 0;
    }
    [(SDAutoUnlockAuthSession *)self setUseAKSToken:v31];
    [(SDAutoUnlockAuthSession *)self setRemoteAWDLInfo:v7];
    if ([(SDAutoUnlockAWDLInfo *)v5 authPrompt]) {
      uint64_t v32 = 2;
    }
    else {
      uint64_t v32 = 1;
    }
    [(SDAutoUnlockAuthSession *)self setAttemptType:v32];
    if ((id)[(SDAutoUnlockAuthSession *)self attemptType] == (id)2)
    {
      [(SDAutoUnlockKeySession *)self setOldApproveProtocol:1];
      [(SDAutoUnlockKeySession *)self setUserRequestRequired:1];
    }
    v33 = [(SDAutoUnlockAWDLInfo *)v5 appName];
    [(SDAutoUnlockAuthSession *)self setAppName:v33];

    [(SDAutoUnlockAWDLInfo *)v5 phoneUnlockDate];
    int v34 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [(SDAutoUnlockKeySession *)self setPhoneUnlockDate:v34];

    if ([(SDAutoUnlockAWDLInfo *)v5 hasIsAuthenticatingForSiri]) {
      BOOL v35 = [(SDAutoUnlockAWDLInfo *)v5 isAuthenticatingForSiri];
    }
    else {
      BOOL v35 = 0;
    }
    [(SDAutoUnlockKeySession *)self setAuthenticatingForSiri:v35];
    if ([(SDAutoUnlockAWDLInfo *)v5 hasSkipMotionCheck]) {
      BOOL v36 = [(SDAutoUnlockAWDLInfo *)v5 skipMotionCheck];
    }
    else {
      BOOL v36 = 0;
    }
    [(SDAutoUnlockAuthSession *)self setSkipMotionCheck:v36];
    if ((id)[(SDAutoUnlockAuthSession *)self protocol] != (id)4
      || ![(SDAutoUnlockKeySession *)self localDeviceNeedsArming])
    {
      BOOL v40 = 1;
      goto LABEL_39;
    }
    uint64_t v37 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
    CFStringRef v44 = @"Key Needs To Be Armed";
    v38 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    id v28 = +[NSError errorWithDomain:v37 code:213 userInfo:v38];

    v39 = auto_unlock_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_100029914();
    }

    [(SDAutoUnlockKeySession *)self sendKeyExchangeRequestWithData:0 error:v28];
    [(SDAutoUnlockPairingSession *)self invalidateResponseTimer];
  }
  else
  {
    id v10 = auto_unlock_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000298A4(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    unsigned int v18 = auto_unlock_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10002982C(v18, v19, v20, v21, v22, v23, v24, v25);
    }

    uint64_t v26 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
    CFStringRef v46 = @"AWDL Info Failure";
    v27 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    id v28 = +[NSError errorWithDomain:v26 code:114 userInfo:v27];
  }
  [(SDAutoUnlockKeySession *)self notifyDelegateWithError:v28];

  BOOL v40 = 0;
LABEL_39:

  return v40;
}

- (void)handleAuthPromptRequest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [[SDAutoUnlockAuthPromptRequest alloc] initWithData:v4];
  if ([(SDAutoUnlockAuthPromptRequest *)v5 hasIconHash])
  {
    [(SDAutoUnlockKeySession *)self logAutoUnlockStart];
    [(SDAutoUnlockKeySession *)self declareSystemActivityAssertion];
    [(SDAutoUnlockAuthSession *)self setUseAKSToken:0];
    [(SDAutoUnlockAuthSession *)self setAttemptType:2];
    id v6 = [(SDAutoUnlockAuthPromptRequest *)v5 appName];
    [(SDAutoUnlockAuthSession *)self setAppName:v6];

    [(SDAutoUnlockKeySession *)self setUserRequestRequired:1];
    unsigned int v7 = [(SDAutoUnlockAuthPromptRequest *)v5 navBarTitle];
    [(SDAutoUnlockAuthSession *)self setNavBarTitle:v7];

    char v8 = objc_alloc_init(SDAutoUnlockMacIconCache);
    [(SDAutoUnlockKeySession *)self setIconCache:v8];

    if (sub_1000D9060(@"AUDisableIconCache", 0))
    {
      uint64_t v9 = auto_unlock_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Image caching disabled", v20, 2u);
      }
    }
    else
    {
      uint64_t v13 = [(SDAutoUnlockKeySession *)self iconCache];
      uint64_t v14 = [(SDAutoUnlockAuthPromptRequest *)v5 iconHash];
      id v10 = [v13 iconImageDataForHash:v14];

      if (v10)
      {
        uint64_t v15 = auto_unlock_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v20 = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Prompting with cached image", v20, 2u);
        }

        [(SDAutoUnlockKeySession *)self setUsingImageCache:1];
        id v16 = [objc_alloc((Class)NSMutableData) initWithData:v10];
        [(SDAutoUnlockKeySession *)self setAuthPromptIconData:v16];

        [(SDAutoUnlockKeySession *)self promptForApproval];
        goto LABEL_14;
      }
    }
    [(SDAutoUnlockKeySession *)self setNeedsImageData:1];
    id v10 = 0;
LABEL_14:
    uint64_t v17 = [(SDAutoUnlockAuthPromptRequest *)v5 iconHash];
    [(SDAutoUnlockKeySession *)self setAuthPromptIconHash:v17];

    unsigned int v18 = [(SDAutoUnlockAuthPromptRequest *)v5 appName];
    [(SDAutoUnlockAuthSession *)self setAppName:v18];

    uint64_t v19 = self;
    objc_sync_enter(v19);
    if ([(SDAutoUnlockKeySession *)v19 shouldDelayWorkDueToPowerAssertion])
    {
      [(SDAutoUnlockKeySession *)v19 setDidDelayWorkDueToPowerAssertion:1];
      objc_sync_exit(v19);
    }
    else
    {
      objc_sync_exit(v19);

      [(SDAutoUnlockKeySession *)v19 beginAKSSession];
    }
    goto LABEL_17;
  }
  uint64_t v11 = auto_unlock_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100029948((uint64_t)v5, v11);
  }

  NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
  CFStringRef v22 = @"Auth prompt request missing info";
  uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v10 = +[NSError errorWithDomain:SFAutoUnlockErrorDomain code:114 userInfo:v12];

  [(SDAutoUnlockKeySession *)self sendAuthPromptResponseWithData:0 error:v10];
LABEL_17:
}

- (void)handleAuthPromptImageData:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [[SDAutoUnlockAuthPromptImageData alloc] initWithData:v4];

  if (![(SDAutoUnlockAuthPromptImageData *)v5 hasImageData])
  {
    id v6 = auto_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100029A08();
    }
    goto LABEL_7;
  }
  if ([(SDAutoUnlockKeySession *)self usingImageCache])
  {
    id v6 = auto_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000299D4();
    }
LABEL_7:

    goto LABEL_8;
  }
  unsigned int v7 = [(SDAutoUnlockKeySession *)self authPromptIconData];

  if (!v7)
  {
    id v8 = objc_alloc_init((Class)NSMutableData);
    [(SDAutoUnlockKeySession *)self setAuthPromptIconData:v8];
  }
  uint64_t v9 = [(SDAutoUnlockKeySession *)self authPromptIconData];
  id v10 = [(SDAutoUnlockAuthPromptImageData *)v5 imageData];
  [v9 appendData:v10];

  uint64_t v11 = auto_unlock_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(SDAutoUnlockAuthPromptImageData *)v5 imageData];
    id v13 = [v12 length];
    uint64_t v14 = [(SDAutoUnlockKeySession *)self authPromptIconData];
    int v15 = 134218240;
    id v16 = v13;
    __int16 v17 = 2048;
    id v18 = [v14 length];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received image data (length: %ld, total: %ld)", (uint8_t *)&v15, 0x16u);
  }
  if ([(SDAutoUnlockAuthPromptImageData *)v5 finalMessage]) {
    [(SDAutoUnlockKeySession *)self promptForApproval];
  }
LABEL_8:
}

- (void)handleSessionKeyExchangeResponse:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  unsigned int v5 = [[SDUnlockSessionKeyExchangeResponse alloc] initWithData:v4];

  if ([(SDUnlockSessionKeyExchangeResponse *)v5 hasKey])
  {
    [(SDAutoUnlockKeySession *)self setExchangeResponse:v5];
    if ([(SDUnlockSessionKeyExchangeResponse *)v5 version] >= 2
      && [(SDAutoUnlockKeySession *)self userRequestRequired])
    {
      [(SDAutoUnlockKeySession *)self createAuthTokenIfReady];
    }
    else
    {
      [(SDAutoUnlockKeySession *)self createWiFiRequest];
    }
  }
  else
  {
    if ([(SDUnlockSessionKeyExchangeResponse *)v5 hasKeyFailed]
      && [(SDUnlockSessionKeyExchangeResponse *)v5 keyFailed])
    {
      uint64_t v6 = 101;
    }
    else
    {
      uint64_t v6 = 103;
    }
    unsigned int v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100029A70();
    }

    uint64_t v8 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Exchange response failed";
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v10 = +[NSError errorWithDomain:v8 code:v6 userInfo:v9];

    [(SDAutoUnlockKeySession *)self sendSessionAuthToken:0 error:v10];
    [(SDAutoUnlockKeySession *)self notifyDelegateWithError:v10];
  }
}

- (void)createAuthTokenIfReady
{
  id v4 = [(SDAutoUnlockKeySession *)self exchangeResponse];
  if (!v4) {
    goto LABEL_9;
  }
  unsigned int v5 = [(SDAutoUnlockKeySession *)self userRequestRequired];
  if (v5)
  {
    v2 = [(SDAutoUnlockKeySession *)self unlockAllowed];
    if ([v2 BOOLValue])
    {

LABEL_22:
      uint64_t v19 = [(SDAutoUnlockPairingSession *)self aksSession];
      uint64_t v20 = [(SDAutoUnlockKeySession *)self exchangeResponse];
      NSErrorUserInfoKey v21 = [v20 key];
      id v42 = 0;
      unsigned int v22 = [v19 stepSessionWithData:v21 outputData:&v42];
      id v13 = (__CFString *)v42;

      if (v22)
      {
        uint64_t v23 = [(SDAutoUnlockKeySession *)self exchangeResponse];
        if ([v23 version] < 2)
        {
        }
        else
        {
          unsigned int v24 = [(SDAutoUnlockKeySession *)self userRequestRequired];

          if (v24)
          {
            uint64_t v25 = auto_unlock_log();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
              sub_100029B40();
            }

            [(SDAutoUnlockKeySession *)self sendSessionAuthToken:v13 error:0];
            goto LABEL_42;
          }
        }
        BOOL v30 = [(SDAutoUnlockPairingSession *)self aksSession];
        BOOL v31 = [v30 generateSessionToken];
        [(SDAutoUnlockAuthSession *)self setSessionRangingKey:v31];

        uint64_t v32 = [(SDAutoUnlockAuthSession *)self sessionRangingKey];

        if (v32)
        {
          v33 = [(SDAutoUnlockAuthSession *)self remoteAWDLInfo];
          int v34 = [(SDAutoUnlockAuthSession *)self peerListFromAWDLInfo:v33];
          [(SDAutoUnlockKeySession *)self setPeerList:v34];

          __int16 v17 = objc_opt_new();
          BOOL v35 = [(SDAutoUnlockKeySession *)self peerList];
          BOOL v36 = [v35 firstObject];
          [v17 setNiRangingPeer:v36];

          uint64_t v37 = +[SDAutoUnlockWiFiManager sharedManager];
          v38 = [(SDAutoUnlockAuthSession *)self wifiRequest];
          [v37 updateWiFiRequest:v38 setRangingPeer:v17];

          v39 = auto_unlock_log();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
            sub_100029BE8();
          }

          [(SDAutoUnlockKeySession *)self sendSessionAuthToken:v13 error:0];
          goto LABEL_41;
        }
        BOOL v40 = auto_unlock_log();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          sub_100029BB4();
        }

        uint64_t v27 = SFAutoUnlockErrorDomain;
        NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
        CFStringRef v48 = @"Failed to generate ranging session token";
        id v28 = &v48;
        unsigned int v29 = &v47;
      }
      else
      {
        uint64_t v26 = auto_unlock_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_100029C5C();
        }

        uint64_t v27 = SFAutoUnlockErrorDomain;
        NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
        CFStringRef v46 = @"Creating auth token failed";
        id v28 = &v46;
        unsigned int v29 = &v45;
      }
      v41 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v29 count:1];
      __int16 v17 = +[NSError errorWithDomain:v27 code:101 userInfo:v41];

LABEL_40:
      [(SDAutoUnlockKeySession *)self sendSessionAuthToken:0 error:v17];
      [(SDAutoUnlockKeySession *)self notifyDelegateWithError:v17];
LABEL_41:

LABEL_42:
      return;
    }
    if ([(SDAutoUnlockKeySession *)self userRequestRequired])
    {

      goto LABEL_9;
    }
  }
  else if ([(SDAutoUnlockKeySession *)self userRequestRequired])
  {
LABEL_9:

    goto LABEL_10;
  }
  id v18 = [(SDAutoUnlockKeySession *)self wifiRequestStartedHandler];

  if (v5) {
  if (v18)
  }
    goto LABEL_22;
LABEL_10:
  if ([(SDAutoUnlockKeySession *)self userRequestRequired])
  {
    uint64_t v6 = [(SDAutoUnlockKeySession *)self unlockAllowed];
    if (v6)
    {
      unsigned int v7 = (void *)v6;
      uint64_t v8 = [(SDAutoUnlockKeySession *)self unlockAllowed];
      unsigned __int8 v9 = [v8 BOOLValue];

      if ((v9 & 1) == 0)
      {
        unsigned int v10 = [(SDAutoUnlockKeySession *)self errorRequestingUnlock];
        NSErrorUserInfoKey v11 = @"Error posting authorization request";
        if (v10)
        {
          uint64_t v12 = 180;
        }
        else
        {
          NSErrorUserInfoKey v11 = @"User denied authorization request";
          uint64_t v12 = 179;
        }
        id v13 = v11;
        uint64_t v14 = auto_unlock_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_100029AD8();
        }

        uint64_t v15 = SFAutoUnlockErrorDomain;
        NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
        CFStringRef v44 = v13;
        id v16 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        __int16 v17 = +[NSError errorWithDomain:v15 code:v12 userInfo:v16];

        goto LABEL_40;
      }
    }
  }
}

- (void)handleUnlockConfirmation:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [[SDUnlockSessionConfirmation alloc] initWithData:v4];

  if ([(SDUnlockSessionConfirmation *)v5 success])
  {
    [(SDAutoUnlockKeySession *)self setSuppressWatchNotification:[(SDUnlockSessionConfirmation *)v5 suppressNotification]];
    if ([(SDUnlockSessionConfirmation *)v5 hasSupportsACK]
      && [(SDUnlockSessionConfirmation *)v5 supportsACK])
    {
      [(SDAutoUnlockKeySession *)self sendConfirmationACK];
      char v6 = 1;
    }
    else
    {
      char v6 = 0;
    }
    NSErrorUserInfoKey v11 = [(SDAutoUnlockPairingSession *)self aksSession];
    -[SDAutoUnlockAuthSession setAksSuccess:](self, "setAksSuccess:", [v11 confirmSession]);

    uint64_t v12 = auto_unlock_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = [(SDAutoUnlockAuthSession *)self aksSuccess];
      CFStringRef v14 = @"NO";
      if (v13) {
        CFStringRef v14 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Session confirmed %@", buf, 0xCu);
    }

    if (![(SDAutoUnlockKeySession *)self usingImageCache])
    {
      uint64_t v15 = [(SDAutoUnlockKeySession *)self authPromptIconData];
      if (v15)
      {
        id v16 = (void *)v15;
        __int16 v17 = [(SDAutoUnlockKeySession *)self authPromptIconHash];

        if (v17)
        {
          id v18 = auto_unlock_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = [(SDAutoUnlockAuthSession *)self appName];
            *(_DWORD *)buf = 138412290;
            CFStringRef v27 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Caching image for app %@", buf, 0xCu);
          }
          iconCache = self->_iconCache;
          NSErrorUserInfoKey v21 = [(SDAutoUnlockKeySession *)self authPromptIconData];
          unsigned int v22 = [(SDAutoUnlockKeySession *)self authPromptIconHash];
          uint64_t v23 = [(SDAutoUnlockAuthSession *)self appName];
          [(SDAutoUnlockMacIconCache *)iconCache cacheIconImageData:v21 hash:v22 appName:v23];
        }
      }
    }
    if ((v6 & 1) == 0) {
      [(SDAutoUnlockKeySession *)self notifyDelegateWithError:0];
    }
  }
  else
  {
    unsigned int v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100029C90();
    }

    uint64_t v8 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    CFStringRef v25 = @"Confirmation failed";
    unsigned __int8 v9 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    unsigned int v10 = +[NSError errorWithDomain:v8 code:101 userInfo:v9];
    [(SDAutoUnlockKeySession *)self notifyDelegateWithError:v10];
  }
}

- (void)handleCleanUpAWDL
{
  id v3 = +[SDAutoUnlockWiFiManager sharedManager];
  id v4 = [(SDAutoUnlockAuthSession *)self wifiRequest];
  [v3 cancelWiFiRequest:v4];

  [(SDAutoUnlockAuthSession *)self setWifiRequest:0];
}

- (void)sendAWDLInfoWithKeyData:(id)a3 error:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (uint64_t)a4;
  if (!v7)
  {
    if ([(SDAutoUnlockKeySession *)self wifiEnabled]
      || (+[SDStatusMonitor sharedMonitor],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v9 = [v8 wirelessEnabled],
          v8,
          (v9 & 1) != 0))
    {
      uint64_t v7 = 0;
    }
    else
    {
      unsigned int v10 = auto_unlock_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100029CF8();
      }

      uint64_t v11 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      CFStringRef v27 = @"WiFi interface disabled on Watch";
      uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      uint64_t v7 = +[NSError errorWithDomain:v11 code:199 userInfo:v12];
    }
  }
  uint64_t v13 = [(SDAutoUnlockAuthSession *)self awdlInfoData];
  if (!(v13 | v7))
  {
    CFStringRef v14 = auto_unlock_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100029CC4();
    }

    uint64_t v15 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    CFStringRef v25 = @"Failed to serialize AWDL Info";
    id v16 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v7 = +[NSError errorWithDomain:v15 code:114 userInfo:v16];
  }
  __int16 v17 = auto_unlock_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Sending SDAutoUnlockAWDLInfo", buf, 2u);
  }

  id v18 = objc_alloc_init(SDAutoUnlockAWDLInfo);
  [(SDAutoUnlockAWDLInfo *)v18 setVersion:3];
  [(SDAutoUnlockAWDLInfo *)v18 setAwdlInfo:v13];
  [(SDAutoUnlockAWDLInfo *)v18 setUseToken:[(SDAutoUnlockAuthSession *)self useAKSToken]];
  [(SDAutoUnlockAWDLInfo *)v18 setKeyData:v6];
  [(SDAutoUnlockAWDLInfo *)v18 setSupportsConfirmationACK:1];
  if (v7) {
    -[SDAutoUnlockAWDLInfo setErrorCode:](v18, "setErrorCode:", [(id)v7 code]);
  }
  uint64_t v19 = [(SDAutoUnlockAWDLInfo *)v18 data];
  uint64_t v20 = [(SDAutoUnlockPairingSession *)self wrapPayload:v19 withType:301];

  NSErrorUserInfoKey v21 = [(SDAutoUnlockAuthSession *)self bleDevice];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100027CAC;
  v22[3] = &unk_1008CA5A8;
  v22[4] = self;
  [(SDAutoUnlockAuthSession *)self sendData:v20 bleDevice:v21 direct:1 completionHandler:v22];

  if (v7)
  {
    if (!v13) {
      [(SDAutoUnlockKeySession *)self notifyDelegateWithError:v7];
    }
  }
  else
  {
    [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8((double)15)];
  }
  kdebug_trace();
}

- (void)sendAuthPromptResponseWithData:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(SDAutoUnlockAuthPromptResponse);
  [(SDAutoUnlockAuthPromptResponse *)v8 setVersion:1];
  [(SDAutoUnlockAuthPromptResponse *)v8 setKeyData:v7];

  [(SDAutoUnlockAuthPromptResponse *)v8 setNeedsImageData:[(SDAutoUnlockKeySession *)self needsImageData]];
  if (v6) {
    -[SDAutoUnlockAuthPromptResponse setErrorCode:](v8, "setErrorCode:", [v6 code]);
  }
  unsigned __int8 v9 = auto_unlock_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending SDAutoUnlockAuthPromptResponse", buf, 2u);
  }

  unsigned int v10 = [(SDAutoUnlockAuthPromptResponse *)v8 data];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100027F78;
  v11[3] = &unk_1008CA5A8;
  v11[4] = self;
  [(SDAutoUnlockAuthSession *)self sendData:v10 type:13 errorHandler:v11];

  [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8((double)15)];
}

- (void)sendKeyExchangeRequestWithData:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(SDUnlockSessionKeyExchangeRequest);
  [(SDUnlockSessionKeyExchangeRequest *)v8 setVersion:1];
  [(SDUnlockSessionKeyExchangeRequest *)v8 setUsingRecord:[(SDAutoUnlockAuthSession *)self useAKSToken] ^ 1];
  if (v6) {
    [(SDUnlockSessionKeyExchangeRequest *)v8 setKey:v6];
  }
  if (v7) {
    -[SDUnlockSessionKeyExchangeRequest setErrorCode:](v8, "setErrorCode:", [v7 code]);
  }
  unsigned __int8 v9 = auto_unlock_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending SDUnlockSessionKeyExchangeRequest", buf, 2u);
  }

  unsigned int v10 = [(SDUnlockSessionKeyExchangeRequest *)v8 data];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100028238;
  v11[3] = &unk_1008CA5A8;
  v11[4] = self;
  [(SDAutoUnlockAuthSession *)self sendData:v10 type:7 errorHandler:v11];

  kdebug_trace();
  [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8((double)15)];
}

- (void)sendSessionAuthToken:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  [v8 setVersion:2];
  if (v6) {
    [v8 setAuthToken:v6];
  }
  if (v7) {
    [v8 setErrorCode:[v7 code]];
  }
  unsigned __int8 v9 = auto_unlock_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending SDUnlockSessionAuthToken", buf, 2u);
  }

  unsigned int v10 = [v8 data];
  uint64_t v11 = [(SDAutoUnlockPairingSession *)self wrapPayload:v10 withType:9];

  uint64_t v12 = [(SDAutoUnlockAuthSession *)self bleDevice];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002853C;
  v15[3] = &unk_1008CA5D0;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  [(SDAutoUnlockAuthSession *)self sendData:v11 bleDevice:v12 direct:1 completionHandler:v15];

  kdebug_trace();
  [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8((double)15)];
}

- (void)sendConfirmationACK
{
  id v3 = objc_opt_new();
  [v3 setVersion:1];
  [v3 setSuccess:1];
  [(SDAutoUnlockKeySession *)self setShouldAlertOnNotify:1];
  id v4 = auto_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending SDAutoUnlockSessionConfirmationACK", buf, 2u);
  }

  unsigned int v5 = [v3 data];
  id v6 = [(SDAutoUnlockPairingSession *)self wrapPayload:v5 withType:11];

  id v7 = [(SDAutoUnlockAuthSession *)self bleDevice];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100028888;
  v8[3] = &unk_1008CA5A8;
  v8[4] = self;
  [(SDAutoUnlockAuthSession *)self sendData:v6 bleDevice:v7 direct:1 completionHandler:v8];

  [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8((double)2)];
}

- (void)declareSystemActivityAssertion
{
  [(SDAutoUnlockKeySession *)self setShouldDelayWorkDueToPowerAssertion:0];
  id v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;

  p_powerAssertionID = &self->_powerAssertionID;
  if (self->_powerAssertionID)
  {
    id v6 = auto_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Grabbing assertion we already have", (uint8_t *)&v17, 2u);
    }
  }
  else
  {
    p_powerAssertionState = &self->_powerAssertionState;
    self->_powerAssertionState = 1;
    uint64_t v8 = auto_unlock_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Grabbing system activity assertion for Auto Unlock key session", (uint8_t *)&v17, 2u);
    }

    int v9 = IOPMAssertionDeclareSystemActivity();
    if (v9 && *p_powerAssertionState)
    {
      int v10 = v9;
      uint64_t v11 = auto_unlock_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100029DFC(v10, v11);
      }

      unsigned int *p_powerAssertionID = 0;
      [(SDAutoUnlockKeySession *)self releaseIdleSleepAssertion];
    }
    else
    {
      uint64_t v12 = auto_unlock_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *p_powerAssertionID;
        int v14 = *p_powerAssertionState;
        int v17 = 134218240;
        uint64_t v18 = v13;
        __int16 v19 = 1024;
        int v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Power assertion (assertion %ld, state %d)", (uint8_t *)&v17, 0x12u);
      }

      if (*p_powerAssertionState)
      {
        [(SDAutoUnlockKeySession *)self setShouldDelayWorkDueToPowerAssertion:1];
        uint64_t v15 = auto_unlock_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = *p_powerAssertionState;
          int v17 = 67109120;
          LODWORD(v18) = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "System wake scheduled for key session (state %d)", (uint8_t *)&v17, 8u);
        }
      }
      [(SDAutoUnlockKeySession *)self restartAssertionTimer];
    }
  }
}

- (void)releaseIdleSleepAssertion
{
  if (self->_powerAssertionID)
  {
    id v3 = auto_unlock_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing key power assertion", v5, 2u);
    }

    IOPMAssertionRelease(self->_powerAssertionID);
    self->_powerAssertionID = 0;
  }
  transaction = self->_transaction;
  self->_transaction = 0;
}

- (void)restartAssertionTimer
{
  id v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Restarting assertion timer", buf, 2u);
  }

  id v4 = [(SDAutoUnlockKeySession *)self assertionTimer];

  if (!v4)
  {
    unsigned int v5 = [(SDAutoUnlockPairingSession *)self sessionQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100028D58;
    v10[3] = &unk_1008CA4B8;
    v10[4] = self;
    id v6 = sub_1001B1B10(0, v5, v10);
    [(SDAutoUnlockKeySession *)self setAssertionTimer:v6];

    id v7 = [(SDAutoUnlockKeySession *)self assertionTimer];
    dispatch_resume(v7);
  }
  uint64_t v8 = [(SDAutoUnlockKeySession *)self assertionTimer];
  dispatch_time_t v9 = sub_1001B1AF8(20.0);
  sub_1001B1BC4(v8, v9);
}

- (void)invalidateAssertionTimer
{
  id v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating aggressive advertising timer", v6, 2u);
  }

  id v4 = [(SDAutoUnlockKeySession *)self assertionTimer];

  if (v4)
  {
    unsigned int v5 = [(SDAutoUnlockKeySession *)self assertionTimer];
    dispatch_source_cancel(v5);

    [(SDAutoUnlockKeySession *)self setAssertionTimer:0];
  }
}

- (void)logAutoUnlockStart
{
  id v3 = sub_1000D30EC(1);
  unint64_t v4 = [(SDAutoUnlockAuthSession *)self protocol];
  unsigned int v5 = @"Mac";
  if (v4 == 2) {
    unsigned int v5 = @"Phone";
  }
  v12[0] = @"Start";
  v11[0] = @"State";
  v11[1] = @"DeviceID";
  id v6 = v5;
  id v7 = [(SDAutoUnlockAuthSession *)self bleDevice];
  uint64_t v8 = [v7 identifier];
  dispatch_time_t v9 = [v8 UUIDString];
  v11[2] = @"UnlockPeerType";
  v12[1] = v9;
  v12[2] = v6;
  int v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  SFPowerLogTimeSensitiveEvent();
}

- (void)logAutoUnlockEnd
{
  id v3 = sub_1000D30EC(1);
  unint64_t v4 = [(SDAutoUnlockAuthSession *)self protocol];
  unsigned int v5 = @"Mac";
  if (v4 == 2) {
    unsigned int v5 = @"Phone";
  }
  v13[0] = @"End";
  v12[0] = @"State";
  v12[1] = @"DeviceID";
  id v6 = v5;
  id v7 = [(SDAutoUnlockAuthSession *)self bleDevice];
  uint64_t v8 = [v7 identifier];
  dispatch_time_t v9 = [v8 UUIDString];
  v13[1] = v9;
  v13[2] = v6;
  v12[2] = @"UnlockPeerType";
  void v12[3] = @"Success";
  int v10 = +[NSNumber numberWithBool:[(SDAutoUnlockKeySession *)self alerted]];
  v13[3] = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];

  SFPowerLogTimeSensitiveEvent();
}

- (BOOL)wifiEnabled
{
  return self->_wifiEnabled;
}

- (void)setWifiEnabled:(BOOL)a3
{
  self->_wifiEnabled = a3;
}

- (NSArray)wakeGestureDates
{
  return self->_wakeGestureDates;
}

- (void)setWakeGestureDates:(id)a3
{
}

- (NSDate)unlockedOnWristDate
{
  return self->_unlockedOnWristDate;
}

- (void)setUnlockedOnWristDate:(id)a3
{
}

- (BOOL)needsStrictMotionCheck
{
  return self->_needsStrictMotionCheck;
}

- (void)setNeedsStrictMotionCheck:(BOOL)a3
{
  self->_needsStrictMotionCheck = a3;
}

- (BOOL)localDeviceNeedsArming
{
  return self->_localDeviceNeedsArming;
}

- (void)setLocalDeviceNeedsArming:(BOOL)a3
{
  self->_localDeviceNeedsArming = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSDate)phoneUnlockDate
{
  return self->_phoneUnlockDate;
}

- (void)setPhoneUnlockDate:(id)a3
{
}

- (BOOL)sentAWDLInfo
{
  return self->_sentAWDLInfo;
}

- (void)setSentAWDLInfo:(BOOL)a3
{
  self->_sentAWDLInfo = a3;
}

- (BOOL)userRequestRequired
{
  return self->_userRequestRequired;
}

- (void)setUserRequestRequired:(BOOL)a3
{
  self->_userRequestRequired = a3;
}

- (BOOL)sessionCompleted
{
  return self->_sessionCompleted;
}

- (void)setSessionCompleted:(BOOL)a3
{
  self->_sessionCompleted = a3;
}

- (BOOL)alerted
{
  return self->_alerted;
}

- (void)setAlerted:(BOOL)a3
{
  self->_alerted = a3;
}

- (BOOL)shouldAlertOnNotify
{
  return self->_shouldAlertOnNotify;
}

- (void)setShouldAlertOnNotify:(BOOL)a3
{
  self->_shouldAlertOnNotify = a3;
}

- (BOOL)promptedForApproval
{
  return self->_promptedForApproval;
}

- (void)setPromptedForApproval:(BOOL)a3
{
  self->_promptedForApproval = a3;
}

- (BOOL)promptingForApproval
{
  return self->_promptingForApproval;
}

- (void)setPromptingForApproval:(BOOL)a3
{
  self->_promptingForApproval = a3;
}

- (BOOL)oldApproveProtocol
{
  return self->_oldApproveProtocol;
}

- (void)setOldApproveProtocol:(BOOL)a3
{
  self->_oldApproveProtocol = a3;
}

- (NSNumber)unlockAllowed
{
  return self->_unlockAllowed;
}

- (void)setUnlockAllowed:(id)a3
{
}

- (int)errorRequestingUnlock
{
  return self->_errorRequestingUnlock;
}

- (void)setErrorRequestingUnlock:(int)a3
{
  self->_errorRequestingUnlock = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (unsigned)powerAssertionID
{
  return self->_powerAssertionID;
}

- (void)setPowerAssertionID:(unsigned int)a3
{
  self->_powerAssertionID = a3;
}

- (int)powerAssertionState
{
  return self->_powerAssertionState;
}

- (void)setPowerAssertionState:(int)a3
{
  self->_powerAssertionState = a3;
}

- (id)wifiRequestStartedHandler
{
  return self->_wifiRequestStartedHandler;
}

- (void)setWifiRequestStartedHandler:(id)a3
{
}

- (int64_t)remoteCacheID
{
  return self->_remoteCacheID;
}

- (void)setRemoteCacheID:(int64_t)a3
{
  self->_remoteCacheID = a3;
}

- (NSArray)peerList
{
  return self->_peerList;
}

- (void)setPeerList:(id)a3
{
}

- (NSData)proxyRequestData
{
  return self->_proxyRequestData;
}

- (void)setProxyRequestData:(id)a3
{
}

- (OS_dispatch_source)assertionTimer
{
  return self->_assertionTimer;
}

- (void)setAssertionTimer:(id)a3
{
}

- (SDUnlockSessionKeyExchangeResponse)exchangeResponse
{
  return self->_exchangeResponse;
}

- (void)setExchangeResponse:(id)a3
{
}

- (NSMutableData)authPromptIconData
{
  return self->_authPromptIconData;
}

- (void)setAuthPromptIconData:(id)a3
{
}

- (SDAutoUnlockMacIconCache)iconCache
{
  return self->_iconCache;
}

- (void)setIconCache:(id)a3
{
}

- (NSData)authPromptIconHash
{
  return self->_authPromptIconHash;
}

- (void)setAuthPromptIconHash:(id)a3
{
}

- (BOOL)needsImageData
{
  return self->_needsImageData;
}

- (void)setNeedsImageData:(BOOL)a3
{
  self->_needsImageData = a3;
}

- (BOOL)usingImageCache
{
  return self->_usingImageCache;
}

- (void)setUsingImageCache:(BOOL)a3
{
  self->_usingImageCache = a3;
}

- (BOOL)shouldDelayWorkDueToPowerAssertion
{
  return self->_shouldDelayWorkDueToPowerAssertion;
}

- (void)setShouldDelayWorkDueToPowerAssertion:(BOOL)a3
{
  self->_shouldDelayWorkDueToPowerAssertion = a3;
}

- (BOOL)didDelayWorkDueToPowerAssertion
{
  return self->_didDelayWorkDueToPowerAssertion;
}

- (void)setDidDelayWorkDueToPowerAssertion:(BOOL)a3
{
  self->_didDelayWorkDueToPowerAssertion = a3;
}

- (BOOL)suppressWatchNotification
{
  return self->_suppressWatchNotification;
}

- (void)setSuppressWatchNotification:(BOOL)a3
{
  self->_suppressWatchNotification = a3;
}

- (BOOL)authenticatingForSiri
{
  return self->_authenticatingForSiri;
}

- (void)setAuthenticatingForSiri:(BOOL)a3
{
  self->_authenticatingForSiri = a3;
}

- (SDUnlockMotionDetector)motionDetector
{
  return self->_motionDetector;
}

- (void)setMotionDetector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionDetector, 0);
  objc_storeStrong((id *)&self->_authPromptIconHash, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_authPromptIconData, 0);
  objc_storeStrong((id *)&self->_exchangeResponse, 0);
  objc_storeStrong((id *)&self->_assertionTimer, 0);
  objc_storeStrong((id *)&self->_proxyRequestData, 0);
  objc_storeStrong((id *)&self->_peerList, 0);
  objc_storeStrong(&self->_wifiRequestStartedHandler, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_unlockAllowed, 0);
  objc_storeStrong((id *)&self->_phoneUnlockDate, 0);
  objc_storeStrong((id *)&self->_unlockedOnWristDate, 0);

  objc_storeStrong((id *)&self->_wakeGestureDates, 0);
}

@end