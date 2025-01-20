@interface SDAutoUnlockPairingKeySession
- (BOOL)canCreatePairing;
- (BOOL)canceled;
- (BOOL)companionCurrentlySyncing;
- (BOOL)companionNeedsUnlock;
- (BOOL)companionViewNotSyncing;
- (BOOL)ltkHashMatches;
- (BOOL)requestedLTKForRemote;
- (BOOL)useAttestedProtocol;
- (BOOL)waitingForLTK;
- (BOOL)waitingForUnlock;
- (NSData)longTermKey;
- (NSData)requestData;
- (SDAutoUnlockPairingKeySession)initWithDevice:(id)a3 sessionID:(id)a4;
- (SDUnlockSetupRequest)request;
- (void)addObservers;
- (void)cancel;
- (void)handleCreateEscrowSecret:(id)a3;
- (void)handleMessage:(id)a3 fromDeviceID:(id)a4 type:(unsigned __int16)a5;
- (void)handleTimerFired;
- (void)invalidate;
- (void)notifyDelegateWithError:(id)a3;
- (void)onqueue_cancel;
- (void)onqueue_start;
- (void)sendKeyDeviceLocked;
- (void)sendSetupCreateEscrowRecordStepData:(id)a3 error:(id)a4;
- (void)sendSetupSessionCreatedWithLocalAttestedKey:(id)a3 stepData:(id)a4 error:(id)a5 failureReason:(unsigned int)a6;
- (void)sendSetupSessionCreatedWithLocalKey:(id)a3 stepData:(id)a4 error:(id)a5 failureReason:(unsigned int)a6 ltkSyncing:(id)a7;
- (void)setCanceled:(BOOL)a3;
- (void)setCompanionCurrentlySyncing:(BOOL)a3;
- (void)setCompanionNeedsUnlock:(BOOL)a3;
- (void)setCompanionViewNotSyncing:(BOOL)a3;
- (void)setLongTermKey:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestData:(id)a3;
- (void)setRequestedLTKForRemote:(BOOL)a3;
- (void)setWaitingForLTK:(BOOL)a3;
- (void)setWaitingForUnlock:(BOOL)a3;
- (void)start;
- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6;
- (void)watchLTKsChanged:(id)a3;
@end

@implementation SDAutoUnlockPairingKeySession

- (SDAutoUnlockPairingKeySession)initWithDevice:(id)a3 sessionID:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SDAutoUnlockPairingKeySession;
  v4 = [(SDAutoUnlockPairingSession *)&v7 initWithDevice:a3 sessionID:a4];
  v5 = v4;
  if (v4) {
    [(SDAutoUnlockPairingKeySession *)v4 addObservers];
  }
  return v5;
}

- (void)invalidate
{
  v8.receiver = self;
  v8.super_class = (Class)SDAutoUnlockPairingKeySession;
  [(SDAutoUnlockPairingSession *)&v8 invalidate];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = [(SDAutoUnlockPairingSession *)self aksSession];
  unsigned int v5 = [v4 resetSession];

  v6 = auto_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v5) {
      CFStringRef v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Reset Session: %@", buf, 0xCu);
  }
}

- (void)start
{
  v3 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CC00;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)onqueue_start
{
  v3 = [SDUnlockSetupRequest alloc];
  v4 = [(SDAutoUnlockPairingKeySession *)self requestData];
  unsigned int v5 = [(SDUnlockSetupRequest *)v3 initWithData:v4];
  [(SDAutoUnlockPairingKeySession *)self setRequest:v5];

  [(SDAutoUnlockPairingKeySession *)self handleSetupRequest];
}

- (void)cancel
{
  v3 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CD10;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)onqueue_cancel
{
  if (![(SDAutoUnlockPairingKeySession *)self canceled])
  {
    [(SDAutoUnlockPairingKeySession *)self setCanceled:1];
    uint64_t v3 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
    CFStringRef v7 = @"Pairing key session canceled";
    v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
    unsigned int v5 = +[NSError errorWithDomain:v3 code:118 userInfo:v4];
    [(SDAutoUnlockPairingKeySession *)self notifyDelegateWithError:v5];
  }
}

- (BOOL)canCreatePairing
{
  return 0;
}

- (BOOL)ltkHashMatches
{
  uint64_t v3 = [(SDAutoUnlockPairingKeySession *)self request];
  unsigned int v4 = [v3 hasLtkHash];

  if (v4)
  {
    char v12 = 0;
    unsigned int v5 = +[SDAutoUnlockAKSManager sharedManager];
    NSErrorUserInfoKey v6 = [(SDAutoUnlockPairingSession *)self deviceID];
    CFStringRef v7 = [(SDAutoUnlockPairingKeySession *)self request];
    objc_super v8 = [v7 ltkHash];
    unsigned int v9 = [v5 hashMatchesAnyRemoteLTKForDeviceID:v6 ltkHash:v8 isPreferred:&v12];

    if (v9 && !v12)
    {
      CFStringRef v10 = auto_unlock_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        sub_10002EAD8(v10);
      }
    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (BOOL)useAttestedProtocol
{
  v2 = [(SDAutoUnlockPairingKeySession *)self request];
  BOOL v3 = [v2 version] == 2;

  return v3;
}

- (void)handleTimerFired
{
  uint64_t v3 = SFAutoUnlockErrorDomain;
  NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
  CFStringRef v12 = @"Timeout waiting for response from Mac";
  unsigned int v4 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  unsigned int v5 = +[NSError errorWithDomain:v3 code:197 userInfo:v4];

  if ([(SDAutoUnlockPairingKeySession *)self waitingForLTK])
  {
    NSErrorUserInfoKey v6 = auto_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002EB1C(v6);
    }

    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    CFStringRef v10 = @"Timeout waiting for LTKs";
    CFStringRef v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    uint64_t v8 = +[NSError errorWithDomain:v3 code:196 userInfo:v7];

    [(SDAutoUnlockPairingKeySession *)self sendSetupSessionCreatedWithLocalKey:0 stepData:0 error:v8 failureReason:0 ltkSyncing:0];
    unsigned int v5 = (void *)v8;
  }
  [(SDAutoUnlockPairingKeySession *)self notifyDelegateWithError:v5];
  [(SDAutoUnlockPairingSession *)self invalidateResponseTimer];
}

- (void)addObservers
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"keyBagLockStateChange:" name:@"com.apple.sharingd.KeyBagLockStatusChanged" object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"watchLTKsChanged:" name:@"SDAutoUnlockAKSManagerWatchLTKsUpdatedNotification" object:0];
}

- (void)watchLTKsChanged:(id)a3
{
  id v4 = a3;
  unsigned int v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSErrorUserInfoKey v6 = [v4 userInfo];
    *(_DWORD *)buf = 138412290;
    uint64_t v31 = (uint64_t)v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Watch LTKs changed (user info: %@)", buf, 0xCu);
  }
  if ([(SDAutoUnlockPairingKeySession *)self waitingForLTK])
  {
    CFStringRef v7 = [v4 userInfo];

    if (v7)
    {
      [(SDAutoUnlockPairingKeySession *)self setWaitingForLTK:0];
      uint64_t v8 = [v4 userInfo];
      NSErrorUserInfoKey v9 = [v8 objectForKeyedSubscript:@"SDAutoUnlockAKSManagerCompanionViewSyncing"];

      if (v9) {
        uint64_t v10 = [v9 BOOLValue] ^ 1;
      }
      else {
        uint64_t v10 = 0;
      }
      [(SDAutoUnlockPairingKeySession *)self setCompanionViewNotSyncing:v10];
      NSErrorUserInfoKey v11 = [v4 userInfo];
      CFStringRef v12 = [v11 objectForKeyedSubscript:@"SDAutoUnlockAKSManagerCompanionNeedsUnlock"];
      -[SDAutoUnlockPairingKeySession setCompanionNeedsUnlock:](self, "setCompanionNeedsUnlock:", [v12 BOOLValue]);

      v13 = [v4 userInfo];
      v14 = [v13 objectForKeyedSubscript:@"SDAutoUnlockAKSManagerCompanionCurrentlySyncing"];
      -[SDAutoUnlockPairingKeySession setCompanionCurrentlySyncing:](self, "setCompanionCurrentlySyncing:", [v14 BOOLValue]);

      v15 = +[SDAutoUnlockAKSManager sharedManager];
      v16 = [(SDAutoUnlockPairingSession *)self deviceID];
      unsigned int v17 = [v15 ltkExistsForKeyDevice:v16];

      unsigned int v18 = [(SDAutoUnlockPairingKeySession *)self ltkHashMatches];
      if ([(SDAutoUnlockPairingKeySession *)self companionViewNotSyncing]
        || [(SDAutoUnlockPairingKeySession *)self companionNeedsUnlock]
        || [(SDAutoUnlockPairingKeySession *)self companionCurrentlySyncing]
        || (v17 & v18) != 0)
      {
        [(SDAutoUnlockPairingKeySession *)self handleSetupRequest];
      }
      else
      {
        v19 = auto_unlock_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = [(SDAutoUnlockPairingSession *)self deviceID];
          v25 = (void *)v24;
          CFStringRef v26 = @"NO";
          if (v17) {
            CFStringRef v27 = @"YES";
          }
          else {
            CFStringRef v27 = @"NO";
          }
          *(_DWORD *)buf = 138412802;
          uint64_t v31 = v24;
          __int16 v32 = 2112;
          CFStringRef v33 = v27;
          if (v18) {
            CFStringRef v26 = @"YES";
          }
          __int16 v34 = 2112;
          CFStringRef v35 = v26;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Incorrect LTK (deviceID: %@, ltk exists: %@, hashes match: %@)", buf, 0x20u);
        }
        if (v17) {
          uint64_t v20 = 129;
        }
        else {
          uint64_t v20 = 125;
        }
        uint64_t v21 = SFAutoUnlockErrorDomain;
        NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
        CFStringRef v29 = @"Incorrect LTK";
        v22 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        v23 = +[NSError errorWithDomain:v21 code:v20 userInfo:v22];

        [(SDAutoUnlockPairingKeySession *)self sendSetupSessionCreatedWithLocalKey:0 stepData:0 error:v23 failureReason:0 ltkSyncing:0];
        [(SDAutoUnlockPairingKeySession *)self notifyDelegateWithError:v23];
        [(SDAutoUnlockPairingSession *)self invalidateResponseTimer];
      }
    }
    else
    {
      NSErrorUserInfoKey v9 = auto_unlock_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Response missing view syncing state", buf, 2u);
      }
    }
  }
}

- (void)notifyDelegateWithError:(id)a3
{
  id v4 = a3;
  unsigned int v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pairing key session notifying delegate with error: %@", (uint8_t *)&v9, 0xCu);
  }

  NSErrorUserInfoKey v6 = [(SDAutoUnlockPairingSession *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(SDAutoUnlockPairingSession *)self delegate];
    [v8 session:self didCompleteWithError:v4];
  }
}

- (void)handleMessage:(id)a3 fromDeviceID:(id)a4 type:(unsigned __int16)a5
{
  int v5 = a5;
  id v7 = a3;
  uint64_t v8 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  dispatch_assert_queue_V2(v8);

  if (v5 == 2003 || v5 == 103)
  {
    int v9 = auto_unlock_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received SDUnlockSetupCreateSecret", v10, 2u);
    }

    [(SDAutoUnlockPairingSession *)self invalidateResponseTimer];
    [(SDAutoUnlockPairingKeySession *)self handleCreateEscrowSecret:v7];
  }
}

- (void)handleCreateEscrowSecret:(id)a3
{
  id v4 = a3;
  if (![(SDAutoUnlockPairingKeySession *)self canceled])
  {
    NSErrorUserInfoKey v6 = +[SDStatusMonitor sharedMonitor];
    unsigned int v7 = [v6 deviceKeyBagUnlocked];

    uint64_t v8 = [[SDUnlockSetupCreateSecret alloc] initWithData:v4];
    int v5 = v8;
    if (v7)
    {
      if (v8 && [(SDUnlockSetupCreateSecret *)v8 hasToken])
      {
        int v9 = [(SDAutoUnlockPairingSession *)self aksSession];
        id v10 = [v5 token];
        id v38 = 0;
        unsigned int v11 = [v9 stepSessionWithData:v10 outputData:&v38];
        id v12 = v38;

        if (v11)
        {
          v13 = [(SDAutoUnlockPairingSession *)self aksSession];
          v14 = [v13 generateSessionToken];

          if (v14)
          {
            v15 = +[SDAutoUnlockAKSManager sharedManager];
            v16 = [(SDAutoUnlockPairingSession *)self deviceID];
            unsigned int v17 = [v15 storeRangingKey:v14 forDeviceID:v16];

            if (v17)
            {
              unsigned int v18 = +[SDAutoUnlockAKSManager sharedManager];
              [v18 updateDynamicStoreEnabled];

              v19 = [(SDAutoUnlockPairingKeySession *)self request];
              unsigned int v20 = [v19 version];

              if (v20 != 1)
              {
                [(SDAutoUnlockPairingKeySession *)self sendSetupCreateEscrowRecordStepData:v12 error:0];
                __int16 v32 = [(SDAutoUnlockPairingSession *)self aksSession];
                [v32 confirmSession];

                CFStringRef v33 = auto_unlock_log();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Pairing Enabled", buf, 2u);
                }

                [(SDAutoUnlockPairingKeySession *)self notifyDelegateWithError:0];
                goto LABEL_24;
              }
              uint64_t v21 = [(SDAutoUnlockPairingSession *)self aksSession];
              v22 = [v21 generateEscrowSecret];

              if (v22)
              {
                v23 = +[SDAutoUnlockAKSManager sharedManager];
                uint64_t v24 = [(SDAutoUnlockPairingSession *)self sessionID];
                v25 = [v24 UUIDString];
                CFStringRef v26 = [(SDAutoUnlockPairingSession *)self deviceID];
                v37 = v22;
                unsigned int v27 = [v23 storeEscrowSecret:v22 pairingID:v25 deviceID:v26 requiresUnlock:1];

                if (v27)
                {
                  [(SDAutoUnlockPairingKeySession *)self sendSetupCreateEscrowRecordStepData:v12 error:0];
                  NSErrorUserInfoKey v28 = auto_unlock_log();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Pairing Enabled", buf, 2u);
                  }

                  [(SDAutoUnlockPairingKeySession *)self notifyDelegateWithError:0];
                  CFStringRef v29 = +[SDAutoUnlockAKSManager sharedManager];
                  [v29 updateDynamicStoreEnabled];

LABEL_24:
LABEL_33:

                  goto LABEL_34;
                }
                CFStringRef v30 = @"Failed to store escrow secret";
                uint64_t v31 = 170;
                v22 = v37;
              }
              else
              {
                CFStringRef v30 = @"Failed to create escrow secret";
                uint64_t v31 = 169;
              }
            }
            else
            {
              CFStringRef v30 = @"Failed to store session token";
              uint64_t v31 = 166;
            }
          }
          else
          {
            CFStringRef v30 = @"Failed to create session token";
            uint64_t v31 = 165;
          }
        }
        else
        {
          CFStringRef v30 = @"Could not complete step";
          uint64_t v31 = 163;
        }
      }
      else
      {
        CFStringRef v30 = @"No remote step data in message";
        uint64_t v31 = 160;
      }
    }
    else
    {
      CFStringRef v30 = @"Device locked";
      uint64_t v31 = 102;
    }
    __int16 v34 = auto_unlock_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_10002EB60((uint64_t)v30, v34);
    }

    uint64_t v35 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
    CFStringRef v41 = @"Request failure";
    v36 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    id v12 = +[NSError errorWithDomain:v35 code:v31 userInfo:v36];

    [(SDAutoUnlockPairingKeySession *)self sendSetupCreateEscrowRecordStepData:0 error:v12];
    [(SDAutoUnlockPairingKeySession *)self notifyDelegateWithError:v12];
    goto LABEL_33;
  }
  int v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pairing canceled for create secret", buf, 2u);
  }
LABEL_34:
}

- (void)sendKeyDeviceLocked
{
  unsigned int v11 = objc_alloc_init(SDAutoUnlockKeyDeviceLocked);
  [(SDAutoUnlockKeyDeviceLocked *)v11 setVersion:1];
  unsigned int v3 = [(SDAutoUnlockPairingKeySession *)self useAttestedProtocol];
  id v4 = [(SDAutoUnlockPairingSession *)self transport];
  int v5 = [(SDAutoUnlockKeyDeviceLocked *)v11 data];
  NSErrorUserInfoKey v6 = [(SDAutoUnlockPairingSession *)self deviceID];
  unsigned int v7 = [(SDAutoUnlockPairingSession *)self sessionID];
  uint64_t v8 = +[NSNumber numberWithInteger:45];
  if (v3) {
    uint64_t v9 = 2005;
  }
  else {
    uint64_t v9 = 105;
  }
  id v10 = [v4 sendAutoUnlockPayload:v5 toDevice:v6 type:v9 sessionID:v7 queueOneID:0 timeout:v8 completion:&stru_1008CA680];
}

- (void)sendSetupSessionCreatedWithLocalKey:(id)a3 stepData:(id)a4 error:(id)a5 failureReason:(unsigned int)a6 ltkSyncing:(id)a7
{
  id v40 = a3;
  id v39 = a4;
  id v38 = a5;
  id v11 = a7;
  if (sub_1000D9060(@"AUUseOldProtocolVersion", 0)) {
    int v12 = 1;
  }
  else {
    int v12 = 2;
  }
  if (sub_1000D9060(@"AUUseNewWatchVersion", 0)) {
    unsigned int v13 = 3;
  }
  else {
    unsigned int v13 = v12;
  }
  v14 = +[SDStatusMonitor sharedMonitor];
  unsigned int v15 = [v14 deviceRequiresNewRanging];

  if (v15) {
    uint64_t v16 = 3;
  }
  else {
    uint64_t v16 = v13;
  }
  unsigned int v17 = auto_unlock_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v18 = @"NO";
    if (v15) {
      CFStringRef v18 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v43 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Device using new ranging: %@", buf, 0xCu);
  }

  v19 = +[SDAutoUnlockAKSManager sharedManager];
  unsigned int v20 = [(SDAutoUnlockPairingSession *)self deviceID];
  uint64_t v21 = [(SDAutoUnlockPairingKeySession *)self request];
  v22 = [v21 ltkHash];
  id v23 = [v19 ltkSyncStatusForDeviceID:v20 hash:v22 modern:0];

  uint64_t v24 = +[SDAutoUnlockAKSManager sharedManager];
  v25 = [(SDAutoUnlockPairingSession *)self deviceID];
  CFStringRef v26 = [(SDAutoUnlockPairingKeySession *)self request];
  unsigned int v27 = [v26 ltkHash];
  id v28 = [v24 ltkSyncStatusForDeviceID:v25 hash:v27 modern:1];

  CFStringRef v29 = +[SDAutoUnlockAKSManager sharedManager];
  CFStringRef v30 = [v29 ltkHashForLocalLTK];

  uint64_t v31 = objc_alloc_init(SDUnlockSetupSessionCreated);
  [(SDUnlockSetupSessionCreated *)v31 setVersion:v16];
  if (v40) {
    -[SDUnlockSetupSessionCreated setLongTermKey:](v31, "setLongTermKey:");
  }
  if (v39) {
    -[SDUnlockSetupSessionCreated setToken:](v31, "setToken:");
  }
  if (v38) {
    -[SDUnlockSetupSessionCreated setErrorCode:](v31, "setErrorCode:", [v38 code]);
  }
  if (a6) {
    -[SDUnlockSetupSessionCreated setFailureReasons:](v31, "setFailureReasons:");
  }
  if (v11) {
    -[SDUnlockSetupSessionCreated setLtkSyncing:](v31, "setLtkSyncing:", [v11 BOOLValue]);
  }
  if (v30) {
    [(SDUnlockSetupSessionCreated *)v31 setLtkHash:v30];
  }
  [(SDUnlockSetupSessionCreated *)v31 setWatchOldLTKSyncStatus:v23];
  [(SDUnlockSetupSessionCreated *)v31 setWatchNewLTKSyncStatus:v28];
  __int16 v32 = +[SDAutoUnlockTransport sharedTransport];
  CFStringRef v33 = [(SDUnlockSetupSessionCreated *)v31 data];
  __int16 v34 = [(SDAutoUnlockPairingSession *)self deviceID];
  uint64_t v35 = [(SDAutoUnlockPairingSession *)self sessionID];
  v36 = +[NSNumber numberWithInteger:45];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10002E1DC;
  v41[3] = &unk_1008CA5A8;
  v41[4] = self;
  [v32 sendPayload:v33 toDevice:v34 type:102 sessionID:v35 timeout:v36 errorHandler:v41];

  [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8((double)60)];
}

- (void)sendSetupSessionCreatedWithLocalAttestedKey:(id)a3 stepData:(id)a4 error:(id)a5 failureReason:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  unsigned int v13 = objc_alloc_init(SDUnlockSetupSessionCreated);
  [(SDUnlockSetupSessionCreated *)v13 setVersion:4];
  [(SDUnlockSetupSessionCreated *)v13 setLongTermKey:v12];

  [(SDUnlockSetupSessionCreated *)v13 setToken:v11];
  if (v10) {
    -[SDUnlockSetupSessionCreated setErrorCode:](v13, "setErrorCode:", [v10 code]);
  }
  if (v6) {
    [(SDUnlockSetupSessionCreated *)v13 setFailureReasons:v6];
  }
  v14 = [(SDAutoUnlockPairingSession *)self transport];
  unsigned int v15 = [(SDUnlockSetupSessionCreated *)v13 data];
  uint64_t v16 = [(SDAutoUnlockPairingSession *)self deviceID];
  unsigned int v17 = [(SDAutoUnlockPairingSession *)self sessionID];
  CFStringRef v18 = +[NSNumber numberWithInteger:45];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002E4A4;
  v20[3] = &unk_1008CA6A8;
  v20[4] = self;
  id v19 = [v14 sendAutoUnlockPayload:v15 toDevice:v16 type:2002 sessionID:v17 queueOneID:0 timeout:v18 completion:v20];

  [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8((double)60)];
}

- (void)sendSetupCreateEscrowRecordStepData:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(SDUnlockSetupCreateRecord);
  uint64_t v9 = v8;
  if (v6) {
    [(SDUnlockSetupCreateRecord *)v8 setToken:v6];
  }
  if (v7) {
    -[SDUnlockSetupCreateRecord setErrorCode:](v9, "setErrorCode:", [v7 code]);
  }
  unsigned int v10 = [(SDAutoUnlockPairingKeySession *)self useAttestedProtocol];
  id v11 = [(SDAutoUnlockPairingSession *)self transport];
  id v12 = [(SDUnlockSetupCreateRecord *)v9 data];
  unsigned int v13 = [(SDAutoUnlockPairingSession *)self deviceID];
  v14 = [(SDAutoUnlockPairingSession *)self sessionID];
  unsigned int v15 = +[NSNumber numberWithInteger:45];
  CFStringRef v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  unsigned int v20 = sub_10002E72C;
  uint64_t v21 = &unk_1008CA6A8;
  v22 = self;
  if (v10) {
    uint64_t v16 = 2004;
  }
  else {
    uint64_t v16 = 104;
  }
  id v17 = [v11 sendAutoUnlockPayload:v12 toDevice:v13 type:v16 sessionID:v14 queueOneID:0 timeout:v15 completion:&v18 queueOneID:v18 queueTwoID:v19 queueThreeID:v20 queueFourID:v21 queueFiveID:v22];
}

- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002E8FC;
  v14[3] = &unk_1008CA3D8;
  v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  unsigned __int16 v17 = a5;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(v11, v14);
}

- (NSData)requestData
{
  return self->_requestData;
}

- (void)setRequestData:(id)a3
{
}

- (BOOL)waitingForUnlock
{
  return self->_waitingForUnlock;
}

- (void)setWaitingForUnlock:(BOOL)a3
{
  self->_waitingForUnlock = a3;
}

- (BOOL)waitingForLTK
{
  return self->_waitingForLTK;
}

- (void)setWaitingForLTK:(BOOL)a3
{
  self->_waitingForLTK = a3;
}

- (BOOL)requestedLTKForRemote
{
  return self->_requestedLTKForRemote;
}

- (void)setRequestedLTKForRemote:(BOOL)a3
{
  self->_requestedLTKForRemote = a3;
}

- (BOOL)companionViewNotSyncing
{
  return self->_companionViewNotSyncing;
}

- (void)setCompanionViewNotSyncing:(BOOL)a3
{
  self->_companionViewNotSyncing = a3;
}

- (BOOL)companionNeedsUnlock
{
  return self->_companionNeedsUnlock;
}

- (void)setCompanionNeedsUnlock:(BOOL)a3
{
  self->_companionNeedsUnlock = a3;
}

- (BOOL)companionCurrentlySyncing
{
  return self->_companionCurrentlySyncing;
}

- (void)setCompanionCurrentlySyncing:(BOOL)a3
{
  self->_companionCurrentlySyncing = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (SDUnlockSetupRequest)request
{
  return (SDUnlockSetupRequest *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRequest:(id)a3
{
}

- (NSData)longTermKey
{
  return self->_longTermKey;
}

- (void)setLongTermKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longTermKey, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_requestData, 0);
}

@end