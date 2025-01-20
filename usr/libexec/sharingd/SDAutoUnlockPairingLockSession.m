@interface SDAutoUnlockPairingLockSession
+ (int64_t)setupRequestVersion;
- (BOOL)canceled;
- (BOOL)keyDeviceLocked;
- (BOOL)ltkHashMatches;
- (BOOL)placeholder;
- (BOOL)receivedSetupACK;
- (BOOL)receivedTokenACK;
- (BOOL)setupRetryDevice;
- (BOOL)unlockEnabled;
- (BOOL)upsellDevice;
- (BOOL)useAttestedProtocol;
- (BOOL)validatePasscode:(id)a3;
- (BOOL)waitingForCloudPairing;
- (NSData)remoteLTKHash;
- (NSDate)keyExchangeDate;
- (NSDate)tokenExchangeDate;
- (NSError)setupError;
- (NSString)companionDeviceModel;
- (NSString)keyDeviceModel;
- (NSString)passcode;
- (NSString)setupMessageIdentifier;
- (NSString)tokenMessageIdentifier;
- (NSString)watchBuildVersion;
- (NSString)watchOSVersion;
- (OS_dispatch_source)ltkTimer;
- (SDAutoUnlockPairingLockSession)initWithDevice:(id)a3 sessionID:(id)a4;
- (SDUnlockSetupSessionCreated)sessionCreatedMessage;
- (double)keyExchangeInterval;
- (double)tokenExchangeInterval;
- (id)generatedError;
- (id)userInfoCompanionViewNotSyncing;
- (id)userInfoForInternetSharing;
- (id)userInfoForKeychainMismatch;
- (id)userInfoForMacNotSignedIn;
- (id)userInfoForMissingLTK;
- (id)userInfoForNewProtocol;
- (id)userInfoForNoCommunincation;
- (id)userInfoForNoPasscode;
- (id)userInfoForNoWristDetection;
- (id)userInfoForNoWristDetectionNoPasscode;
- (id)userInfoForNotCloudPaired;
- (id)userInfoForOldProtocol;
- (id)userInfoForWatchLocked;
- (id)userInfoForWatchNotSignedIn;
- (id)userInfoForiPhoneNeedsUnlock;
- (int)watchNewLTKSyncStatus;
- (int)watchOldLTKSyncStatus;
- (int64_t)ltkTimerRetryCount;
- (int64_t)messageTimeout;
- (int64_t)messageTimeoutFromServer;
- (int64_t)responseTimeout;
- (int64_t)responseTimeoutFromServer;
- (int64_t)sendState;
- (unsigned)errorType;
- (void)cancel;
- (void)handleDeviceAuthenticationSetupRequest;
- (void)handleEscrowSessionRequest;
- (void)handleKeyDeviceLocked;
- (void)handleLTKTimerFired;
- (void)handleMessage:(id)a3 fromDeviceID:(id)a4 type:(unsigned __int16)a5;
- (void)handleSetupCreateRecord:(id)a3;
- (void)handleSetupSessionCreated:(id)a3 fromDeviceID:(id)a4;
- (void)handleSuccessfulPairing;
- (void)handleTimerFired;
- (void)invalidate;
- (void)invalidateLTKTimer;
- (void)notifyDelegateKeyDeviceIsLocked;
- (void)notifyDelegateWithError:(id)a3;
- (void)onqueue_cancel;
- (void)onqueue_start;
- (void)onqueue_updateForCloudPairing;
- (void)restartLTKTimer;
- (void)sendCreateSecretWithStepData:(id)a3 sessionID:(unsigned int)a4;
- (void)sendSetupRequest;
- (void)setCanceled:(BOOL)a3;
- (void)setCompanionDeviceModel:(id)a3;
- (void)setErrorType:(unsigned int)a3;
- (void)setKeyDeviceLocked:(BOOL)a3;
- (void)setKeyDeviceModel:(id)a3;
- (void)setKeyExchangeDate:(id)a3;
- (void)setKeyExchangeInterval:(double)a3;
- (void)setLtkTimer:(id)a3;
- (void)setLtkTimerRetryCount:(int64_t)a3;
- (void)setMessageTimeout:(int64_t)a3;
- (void)setMessageTimeoutFromServer:(int64_t)a3;
- (void)setPasscode:(id)a3;
- (void)setPlaceholder:(BOOL)a3;
- (void)setReceivedSetupACK:(BOOL)a3;
- (void)setReceivedTokenACK:(BOOL)a3;
- (void)setRemoteLTKHash:(id)a3;
- (void)setResponseTimeout:(int64_t)a3;
- (void)setResponseTimeoutFromServer:(int64_t)a3;
- (void)setSendState:(int64_t)a3;
- (void)setSessionCreatedMessage:(id)a3;
- (void)setSetupError:(id)a3;
- (void)setSetupMessageIdentifier:(id)a3;
- (void)setSetupRetryDevice:(BOOL)a3;
- (void)setTokenExchangeDate:(id)a3;
- (void)setTokenExchangeInterval:(double)a3;
- (void)setTokenMessageIdentifier:(id)a3;
- (void)setUnlockEnabled:(BOOL)a3;
- (void)setUpsellDevice:(BOOL)a3;
- (void)setWaitingForCloudPairing:(BOOL)a3;
- (void)setWatchBuildVersion:(id)a3;
- (void)setWatchNewLTKSyncStatus:(int)a3;
- (void)setWatchOSVersion:(id)a3;
- (void)setWatchOldLTKSyncStatus:(int)a3;
- (void)start;
- (void)transport:(id)a3 didReceiveMessageACKForIdentifier:(id)a4;
- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6;
- (void)updateForCloudPairing;
@end

@implementation SDAutoUnlockPairingLockSession

- (SDAutoUnlockPairingLockSession)initWithDevice:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SDAutoUnlockPairingLockSession;
  v7 = [(SDAutoUnlockPairingSession *)&v33 initWithDevice:v6 sessionID:a4];
  v8 = v7;
  if (v7)
  {
    v7->_sendState = 0;
    v9 = +[SDAutoUnlockTransport sharedTransport];
    uint64_t v10 = [v9 modelIdentifierForDeviceID:v6];
    keyDeviceModel = v8->_keyDeviceModel;
    v8->_keyDeviceModel = (NSString *)v10;

    v12 = +[SDAutoUnlockTransport sharedTransport];
    v13 = [(SDAutoUnlockPairingSession *)v8 deviceID];
    v14 = [v12 idsDeviceForUniqueID:v13];

    if (v14)
    {
      v15 = +[SDAutoUnlockTransport sharedTransport];
      v16 = [v15 autoUnlockDeviceForIDSDevice:v14 cloudPaired:0 cached:0];

      uint64_t v17 = [v16 productBuildVersion];
      watchBuildVersion = v8->_watchBuildVersion;
      v8->_watchBuildVersion = (NSString *)v17;

      [v14 operatingSystemVersion];
      uint64_t v19 = sub_1000D2F74(v32);
      watchOSVersion = v8->_watchOSVersion;
      v8->_watchOSVersion = (NSString *)v19;

      v21 = auto_unlock_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v8->_watchOSVersion;
        v23 = v8->_watchBuildVersion;
        *(_DWORD *)buf = 138412802;
        int64_t v35 = (int64_t)v22;
        __int16 v36 = 2112;
        CFStringRef v37 = (const __CFString *)v23;
        __int16 v38 = 2112;
        int64_t v39 = (int64_t)v16;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Created session (OS version: %@, build: %@, device: %@)", buf, 0x20u);
      }
    }
    unsigned __int8 v31 = 0;
    v8->_int64_t responseTimeout = (int64_t)sub_1000D31C0((char *)&v31);
    v8->_responseTimeoutFromServer = v31;
    unsigned __int8 v31 = 0;
    v8->_int64_t messageTimeout = (int64_t)sub_1000D34B4((char *)&v31);
    v8->_int64_t messageTimeoutFromServer = v31;
    v24 = auto_unlock_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int64_t responseTimeout = v8->_responseTimeout;
      CFStringRef v26 = @"YES";
      int64_t messageTimeout = v8->_messageTimeout;
      int64_t messageTimeoutFromServer = v8->_messageTimeoutFromServer;
      if (v8->_responseTimeoutFromServer) {
        CFStringRef v29 = @"YES";
      }
      else {
        CFStringRef v29 = @"NO";
      }
      *(_DWORD *)buf = 134218754;
      if (!messageTimeoutFromServer) {
        CFStringRef v26 = @"NO";
      }
      int64_t v35 = responseTimeout;
      __int16 v36 = 2112;
      CFStringRef v37 = v29;
      __int16 v38 = 2048;
      int64_t v39 = messageTimeout;
      __int16 v40 = 2112;
      CFStringRef v41 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Updated timeouts (responseTimeout: %ld, responseTimeoutFromServer: %@, messageTimeout: %ld, messageTimeoutFromServer: %@)", buf, 0x2Au);
    }

    v8->_watchOldLTKSyncStatus = -1;
    v8->_watchNewLTKSyncStatus = -1;
  }
  return v8;
}

- (void)start
{
  v3 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035720;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)onqueue_start
{
  v3 = [(SDAutoUnlockPairingLockSession *)self generatedError];
  if (!v3)
  {
    v4 = +[SDAutoUnlockTransport sharedTransport];
    v5 = [(SDAutoUnlockPairingSession *)self deviceID];
    id v6 = [v4 idsDeviceForUniqueID:v5];

    if ([v6 isConnected] && objc_msgSend(v6, "isNearby"))
    {
      if (![(SDAutoUnlockPairingLockSession *)self placeholder])
      {
        v18 = +[SDAutoUnlockAKSManager sharedManager];
        if ([v18 viewSyncing])
        {
        }
        else
        {
          unsigned __int8 v20 = +[SDAutoUnlockAKSManager useKeychainForLTKSyncing];

          if (v20)
          {
            v21 = auto_unlock_log();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_10003ADA8();
            }

            uint64_t v22 = SFAutoUnlockErrorDomain;
            NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
            CFStringRef v40 = @"View not syncing";
            v11 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
            uint64_t v12 = v22;
            uint64_t v13 = 121;
            goto LABEL_14;
          }
        }
        v23 = +[SDStatusMonitor sharedMonitor];
        unsigned __int8 v24 = [v23 internetSharingEnabled];

        if (v24)
        {
          v25 = auto_unlock_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_10003AC90();
          }

          uint64_t v26 = SFAutoUnlockErrorDomain;
          v11 = [(SDAutoUnlockPairingLockSession *)self userInfoForInternetSharing];
          uint64_t v12 = v26;
          uint64_t v13 = 146;
        }
        else
        {
          uint64_t v27 = [(SDAutoUnlockPairingLockSession *)self passcode];
          if (v27
            && (v28 = (void *)v27,
                [(SDAutoUnlockPairingLockSession *)self passcode],
                CFStringRef v29 = objc_claimAutoreleasedReturnValue(),
                id v30 = [v29 length],
                v29,
                v28,
                v30))
          {
            unsigned __int8 v31 = [(SDAutoUnlockPairingLockSession *)self passcode];
            unsigned int v32 = [(SDAutoUnlockPairingLockSession *)self validatePasscode:v31];

            if (v32)
            {
              [(SDAutoUnlockPairingLockSession *)self sendSetupRequest];
              objc_super v33 = +[SDAutoUnlockAKSManager sharedManager];
              [v33 reloadPairingRecordsIfNeeded];

              goto LABEL_15;
            }
            __int16 v36 = auto_unlock_log();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
              sub_10003AD74();
            }

            uint64_t v37 = SFAutoUnlockErrorDomain;
            v11 = [(SDAutoUnlockPairingLockSession *)self userInfoForKeychainMismatch];
            uint64_t v12 = v37;
            uint64_t v13 = 174;
          }
          else
          {
            v34 = auto_unlock_log();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              sub_10003ACC4(self, v34);
            }

            uint64_t v35 = SFAutoUnlockErrorDomain;
            NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
            CFStringRef v42 = @"No password";
            v11 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
            uint64_t v12 = v35;
            uint64_t v13 = 112;
          }
        }
LABEL_14:
        uint64_t v17 = +[NSError errorWithDomain:v12 code:v13 userInfo:v11];
        [(SDAutoUnlockPairingLockSession *)self notifyDelegateWithError:v17];

LABEL_15:
        goto LABEL_16;
      }
      v7 = auto_unlock_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v38 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device is placeholder", v38, 2u);
      }

      v8 = +[SDAutoUnlockTransport sharedTransport];
      unsigned int v9 = [v8 localDeviceIDSRegistered];

      if (v9)
      {
        uint64_t v10 = SFAutoUnlockErrorDomain;
        v11 = [(SDAutoUnlockPairingLockSession *)self userInfoForWatchNotSignedIn];
        uint64_t v12 = v10;
        uint64_t v13 = 150;
        goto LABEL_14;
      }
      uint64_t v19 = auto_unlock_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v38 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Mac not IDS registered", v38, 2u);
      }

      uint64_t v15 = SFAutoUnlockErrorDomain;
      uint64_t v16 = [(SDAutoUnlockPairingLockSession *)self userInfoForMacNotSignedIn];
    }
    else
    {
      v14 = auto_unlock_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10003ADDC(v6, v14);
      }

      uint64_t v15 = SFAutoUnlockErrorDomain;
      uint64_t v16 = [(SDAutoUnlockPairingLockSession *)self userInfoForNoCommunincation];
    }
    v11 = (void *)v16;
    uint64_t v12 = v15;
    uint64_t v13 = 178;
    goto LABEL_14;
  }
  [(SDAutoUnlockPairingLockSession *)self notifyDelegateWithError:v3];
LABEL_16:
}

- (void)cancel
{
  v3 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035CCC;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)onqueue_cancel
{
  if (![(SDAutoUnlockPairingLockSession *)self canceled])
  {
    [(SDAutoUnlockPairingLockSession *)self setCanceled:1];
    [(SDAutoUnlockPairingSession *)self invalidateResponseTimer];
    uint64_t v3 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
    CFStringRef v7 = @"Pairing lock session canceled";
    v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
    v5 = +[NSError errorWithDomain:v3 code:118 userInfo:v4];
    [(SDAutoUnlockPairingLockSession *)self notifyDelegateWithError:v5];
  }
}

- (void)updateForCloudPairing
{
  uint64_t v3 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035E50;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)onqueue_updateForCloudPairing
{
  if (![(SDAutoUnlockPairingLockSession *)self canceled]
    && ![(SDAutoUnlockPairingLockSession *)self unlockEnabled]
    && [(SDAutoUnlockPairingLockSession *)self waitingForCloudPairing])
  {
    [(SDAutoUnlockPairingLockSession *)self handleSuccessfulPairing];
  }
}

- (void)invalidate
{
  v7.receiver = self;
  v7.super_class = (Class)SDAutoUnlockPairingLockSession;
  [(SDAutoUnlockPairingSession *)&v7 invalidate];
  uint64_t v3 = [(SDAutoUnlockPairingSession *)self aksSession];
  unsigned int v4 = [v3 resetSession];

  v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v4) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reset Session: %@", buf, 0xCu);
  }
}

- (id)generatedError
{
  int v3 = sub_1000D9060(@"AUGenerateNoPasscode", 0);
  int v4 = sub_1000D9060(@"AUGenerateNoWristDetection", 0);
  int v5 = sub_1000D9060(@"AUGenerateNoCommunication", 0);
  if (v3 && v4)
  {
    uint64_t v6 = SFAutoUnlockErrorDomain;
    uint64_t v7 = [(SDAutoUnlockPairingLockSession *)self userInfoForNoWristDetectionNoPasscode];
LABEL_10:
    v8 = (void *)v7;
    CFStringRef v9 = +[NSError errorWithDomain:v6 code:119 userInfo:v7];

    goto LABEL_11;
  }
  if (v4)
  {
    uint64_t v6 = SFAutoUnlockErrorDomain;
    uint64_t v7 = [(SDAutoUnlockPairingLockSession *)self userInfoForNoWristDetection];
    goto LABEL_10;
  }
  if (v3)
  {
    uint64_t v6 = SFAutoUnlockErrorDomain;
    uint64_t v7 = [(SDAutoUnlockPairingLockSession *)self userInfoForNoPasscode];
    goto LABEL_10;
  }
  if (v5)
  {
    uint64_t v6 = SFAutoUnlockErrorDomain;
    uint64_t v7 = [(SDAutoUnlockPairingLockSession *)self userInfoForNoCommunincation];
    goto LABEL_10;
  }
  CFStringRef v9 = 0;
LABEL_11:

  return v9;
}

- (void)handleTimerFired
{
  int v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Response timer fired", v10, 2u);
  }

  [(SDAutoUnlockPairingLockSession *)self setErrorType:1];
  if ((id)[(SDAutoUnlockPairingLockSession *)self sendState] == (id)1)
  {
    CFStringRef v4 = @"Timeout waiting for response to initial request";
    uint64_t v5 = 153;
  }
  else
  {
    int64_t v6 = [(SDAutoUnlockPairingLockSession *)self sendState];
    CFStringRef v4 = @"Request timeout";
    if (v6 == 2)
    {
      CFStringRef v4 = @"Timeout waiting for response to token exchange request";
      uint64_t v5 = 154;
    }
    else
    {
      uint64_t v5 = 103;
    }
  }
  NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
  CFStringRef v12 = v4;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  if ([(SDAutoUnlockPairingLockSession *)self waitingForCloudPairing])
  {
    uint64_t v8 = [(SDAutoUnlockPairingLockSession *)self userInfoForNotCloudPaired];

    uint64_t v5 = 134;
    uint64_t v7 = (void *)v8;
  }
  CFStringRef v9 = +[NSError errorWithDomain:SFAutoUnlockErrorDomain code:v5 userInfo:v7];
  [(SDAutoUnlockPairingLockSession *)self notifyDelegateWithError:v9];
}

- (BOOL)validatePasscode:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = auto_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Validating passcode", (uint8_t *)v13, 2u);
  }

  uint64_t v5 = [v3 dataUsingEncoding:4];

  int v6 = MKBUnlockDevice();
  uint64_t v7 = auto_unlock_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v13[0] = 67109120;
      v13[1] = v6;
      CFStringRef v9 = "Passcode invalid (error: %d)";
      uint64_t v10 = v7;
      uint32_t v11 = 8;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)v13, v11);
    }
  }
  else if (v8)
  {
    LOWORD(v13[0]) = 0;
    CFStringRef v9 = "Passcode validated";
    uint64_t v10 = v7;
    uint32_t v11 = 2;
    goto LABEL_8;
  }

  return v6 == 0;
}

+ (int64_t)setupRequestVersion
{
  return 2;
}

- (BOOL)useAttestedProtocol
{
  return 1;
}

- (void)notifyDelegateWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v55 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pairing lock session notifying delegate with error: %@", buf, 0xCu);
  }

  if ([v4 code] == (id)134)
  {
    BOOL v6 = IsAppleInternalBuild() != 0;
    if (!v4) {
      goto LABEL_23;
    }
  }
  else
  {
    BOOL v6 = 0;
    if (!v4) {
      goto LABEL_23;
    }
  }
  if ([v4 code] != (id)119
    && [v4 code] != (id)150
    && [v4 code] != (id)178
    && [v4 code] != (id)148
    && [v4 code] != (id)125
    && [v4 code] != (id)129
    && [v4 code] != (id)146
    && [v4 code] != (id)173
    && [v4 code] != (id)174
    && [v4 code] != (id)177
    && [v4 code] != (id)196)
  {
    char v7 = [v4 code] == (id)205 || v6;
    if ((v7 & 1) == 0)
    {
      uint64_t v8 = SFAutoUnlockErrorDomain;
      id v9 = [v4 code];
      uint64_t v10 = [(SDAutoUnlockPairingLockSession *)self userInfoForNoCommunincation];
      uint64_t v11 = +[NSError errorWithDomain:v8 code:v9 userInfo:v10];

      id v4 = (id)v11;
    }
  }
LABEL_23:
  CFStringRef v12 = [(SDAutoUnlockPairingSession *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    v14 = [(SDAutoUnlockPairingSession *)self delegate];
    [v14 session:self didCompleteWithError:v4];
  }
  uint64_t v15 = [(SDAutoUnlockPairingLockSession *)self setupError];
  uint64_t v16 = (void *)v15;
  if (v15) {
    uint64_t v17 = (void *)v15;
  }
  else {
    uint64_t v17 = v4;
  }
  id v18 = v17;

  if ([v4 code] == (id)150)
  {
    uint64_t v19 = +[SDAutoUnlockTransport sharedTransport];
    unsigned __int8 v20 = [v19 watchExistedInUnlockList];
    unsigned int v21 = [v20 BOOLValue];

    if (v21)
    {
      uint64_t v22 = [v19 lastSeenWatchDate];
    }
    else
    {
      uint64_t v22 = 0;
    }
    v53 = (void *)v22;

    unsigned int v52 = v21;
  }
  else
  {
    v53 = 0;
    unsigned int v52 = 1;
  }
  BOOL v51 = v4 == 0;
  v23 = +[SDAutoUnlockAKSManager sharedManager];
  unsigned __int8 v24 = [(SDAutoUnlockPairingSession *)self deviceID];
  v25 = [(SDAutoUnlockPairingLockSession *)self remoteLTKHash];
  unsigned int v50 = [v23 ltkSyncStatusForDeviceID:v24 hash:v25 modern:0] != 0;

  uint64_t v26 = +[SDAutoUnlockAKSManager sharedManager];
  uint64_t v27 = [(SDAutoUnlockPairingSession *)self deviceID];
  v28 = [(SDAutoUnlockPairingLockSession *)self remoteLTKHash];
  unsigned int v49 = [v26 ltkSyncStatusForDeviceID:v27 hash:v28 modern:1] != 0;

  v48 = [(SDAutoUnlockPairingLockSession *)self keyDeviceModel];
  v47 = [(SDAutoUnlockPairingLockSession *)self companionDeviceModel];
  [(SDAutoUnlockPairingLockSession *)self keyExchangeInterval];
  double v30 = v29;
  [(SDAutoUnlockPairingLockSession *)self tokenExchangeInterval];
  double v32 = v31;
  unsigned int v46 = [(SDAutoUnlockPairingLockSession *)self keyDeviceLocked];
  unsigned int v45 = [(SDAutoUnlockPairingLockSession *)self errorType];
  v44 = [v18 domain];
  unsigned int v43 = [v18 code];
  unsigned __int8 v40 = [(SDAutoUnlockPairingLockSession *)self upsellDevice];
  unsigned int v39 = [(SDAutoUnlockPairingLockSession *)self responseTimeout];
  LOBYTE(v26) = [(SDAutoUnlockPairingLockSession *)self responseTimeoutFromServer] != 0;
  unsigned int v33 = [(SDAutoUnlockPairingLockSession *)self messageTimeout];
  unsigned __int8 v34 = [(SDAutoUnlockPairingLockSession *)self messageTimeoutFromServer] != 0;
  CFStringRef v42 = v18;
  unsigned __int8 v35 = [(SDAutoUnlockPairingLockSession *)self setupRetryDevice];
  LODWORD(v28) = [(SDAutoUnlockPairingLockSession *)self watchOldLTKSyncStatus];
  NSErrorUserInfoKey v41 = v4;
  unsigned int v36 = [(SDAutoUnlockPairingLockSession *)self watchNewLTKSyncStatus];
  uint64_t v37 = [(SDAutoUnlockPairingLockSession *)self watchBuildVersion];
  __int16 v38 = [(SDAutoUnlockPairingLockSession *)self watchOSVersion];
  sub_1000D18C8(v48, v47, v46, v51, v45, v44, v43, v52, v30, v32, v53, v40, v39, v26, v33, v34, v35, v50, v49,
    v28,
    v36,
    v37,
    v38,
    [(SDAutoUnlockPairingLockSession *)self receivedSetupACK],
    [(SDAutoUnlockPairingLockSession *)self receivedTokenACK]);
}

- (void)notifyDelegateKeyDeviceIsLocked
{
  id v3 = [(SDAutoUnlockPairingSession *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SDAutoUnlockPairingSession *)self delegate];
    [v5 sessionDidReceiveKeyDeviceLocked:self];
  }
}

- (void)restartLTKTimer
{
  id v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Restarting LTK timer", buf, 2u);
  }

  char v4 = [(SDAutoUnlockPairingLockSession *)self ltkTimer];

  if (!v4)
  {
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    id v5 = [(SDAutoUnlockPairingSession *)self sessionQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100036B8C;
    v10[3] = &unk_1008CA3B0;
    objc_copyWeak(&v11, (id *)buf);
    BOOL v6 = sub_1001B1B10(0, v5, v10);
    [(SDAutoUnlockPairingLockSession *)self setLtkTimer:v6];

    char v7 = [(SDAutoUnlockPairingLockSession *)self ltkTimer];
    dispatch_resume(v7);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  uint64_t v8 = [(SDAutoUnlockPairingLockSession *)self ltkTimer];
  dispatch_time_t v9 = sub_1001B1AF8(15.0);
  sub_1001B1BC4(v8, v9);
}

- (void)invalidateLTKTimer
{
  id v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidate LTK timer", v6, 2u);
  }

  char v4 = [(SDAutoUnlockPairingLockSession *)self ltkTimer];

  if (v4)
  {
    id v5 = [(SDAutoUnlockPairingLockSession *)self ltkTimer];
    dispatch_source_cancel(v5);

    [(SDAutoUnlockPairingLockSession *)self setLtkTimer:0];
  }
}

- (void)handleLTKTimerFired
{
  id v3 = +[SDAutoUnlockAKSManager sharedManager];
  char v4 = [(SDAutoUnlockPairingSession *)self deviceID];
  [v3 checkRemoteLTKForDeviceID:v4];

  id v5 = +[SDAutoUnlockAKSManager sharedManager];
  BOOL v6 = [(SDAutoUnlockPairingSession *)self deviceID];
  [v5 updatePreferredRemoteLTKForDeviceID:v6];

  unsigned int v7 = [(SDAutoUnlockPairingLockSession *)self ltkHashMatches];
  uint64_t v8 = +[SDAutoUnlockAKSManager sharedManager];
  dispatch_time_t v9 = [(SDAutoUnlockPairingSession *)self deviceID];
  uint64_t v10 = [v8 remoteLTKForDeviceID:v9];

  if (v10 && v7)
  {
    [(SDAutoUnlockPairingLockSession *)self handleEscrowSessionRequest];
  }
  else if ([(SDAutoUnlockPairingLockSession *)self ltkTimerRetryCount] > 4)
  {
    id v11 = auto_unlock_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Timed out waiting for LTK to sync", v15, 2u);
    }

    uint64_t v12 = SFAutoUnlockErrorDomain;
    char v13 = [(SDAutoUnlockPairingLockSession *)self userInfoForMissingLTK];
    v14 = +[NSError errorWithDomain:v12 code:176 userInfo:v13];
    [(SDAutoUnlockPairingLockSession *)self notifyDelegateWithError:v14];
  }
  else
  {
    [(SDAutoUnlockPairingLockSession *)self setLtkTimerRetryCount:(char *)[(SDAutoUnlockPairingLockSession *)self ltkTimerRetryCount] + 1];
    [(SDAutoUnlockPairingLockSession *)self restartLTKTimer];
  }
}

- (BOOL)ltkHashMatches
{
  id v3 = [(SDAutoUnlockPairingLockSession *)self remoteLTKHash];

  if (v3)
  {
    char v10 = 0;
    char v4 = +[SDAutoUnlockAKSManager sharedManager];
    id v5 = [(SDAutoUnlockPairingSession *)self deviceID];
    BOOL v6 = [(SDAutoUnlockPairingLockSession *)self remoteLTKHash];
    unsigned int v7 = [v4 hashMatchesAnyRemoteLTKForDeviceID:v5 ltkHash:v6 isPreferred:&v10];

    if (v7 && !v10)
    {
      uint64_t v8 = auto_unlock_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_10003AEB0();
      }
    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (void)handleMessage:(id)a3 fromDeviceID:(id)a4 type:(unsigned __int16)a5
{
  int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  char v10 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  dispatch_assert_queue_V2(v10);

  if (v5 > 2001)
  {
    if (v5 != 2002)
    {
      if (v5 != 2004)
      {
        if (v5 != 2005) {
          goto LABEL_18;
        }
        goto LABEL_9;
      }
      goto LABEL_15;
    }
  }
  else if (v5 != 102)
  {
    if (v5 != 104)
    {
      if (v5 != 105) {
        goto LABEL_18;
      }
LABEL_9:
      [(SDAutoUnlockPairingLockSession *)self setKeyDeviceLocked:1];
      id v11 = auto_unlock_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received SDAutoUnlockMessageTypePairingKeyDeviceLocked", buf, 2u);
      }

      [(SDAutoUnlockPairingLockSession *)self handleKeyDeviceLocked];
      goto LABEL_18;
    }
LABEL_15:
    uint64_t v15 = objc_opt_new();
    uint64_t v16 = [(SDAutoUnlockPairingLockSession *)self tokenExchangeDate];
    [v15 timeIntervalSinceDate:v16];
    -[SDAutoUnlockPairingLockSession setTokenExchangeInterval:](self, "setTokenExchangeInterval:");

    uint64_t v17 = auto_unlock_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received SDUnlockSetupCreateRecord", v18, 2u);
    }

    [(SDAutoUnlockPairingSession *)self invalidateResponseTimer];
    [(SDAutoUnlockPairingLockSession *)self handleSetupCreateRecord:v8];
    goto LABEL_18;
  }
  uint64_t v12 = objc_opt_new();
  char v13 = [(SDAutoUnlockPairingLockSession *)self keyExchangeDate];
  [v12 timeIntervalSinceDate:v13];
  -[SDAutoUnlockPairingLockSession setKeyExchangeInterval:](self, "setKeyExchangeInterval:");

  v14 = auto_unlock_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received SDUnlockSetupSessionCreated", v19, 2u);
  }

  [(SDAutoUnlockPairingSession *)self invalidateResponseTimer];
  [(SDAutoUnlockPairingLockSession *)self handleSetupSessionCreated:v8 fromDeviceID:v9];
LABEL_18:
}

- (void)handleKeyDeviceLocked
{
  if ([(SDAutoUnlockPairingLockSession *)self canceled])
  {
    id v3 = auto_unlock_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not notified of locked device, session canceled", buf, 2u);
    }
  }
  else
  {
    id v5 = [(SDAutoUnlockPairingLockSession *)self userInfoForWatchLocked];
    char v4 = +[NSError errorWithDomain:SFAutoUnlockErrorDomain code:119 userInfo:v5];
    [(SDAutoUnlockPairingLockSession *)self notifyDelegateWithError:v4];
  }
}

- (void)handleSetupSessionCreated:(id)a3 fromDeviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SDAutoUnlockPairingLockSession *)self canceled])
  {
    id v8 = auto_unlock_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v61) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Pairing session canceled for session created", (uint8_t *)&v61, 2u);
    }

    goto LABEL_52;
  }
  id v9 = [[SDUnlockSetupSessionCreated alloc] initWithData:v6];
  [(SDAutoUnlockPairingLockSession *)self setSessionCreatedMessage:v9];

  char v10 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
  unsigned int v11 = [v10 hasErrorCode];

  if (v11)
  {
    uint64_t v12 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
    unsigned int v13 = [v12 errorCode];

    v14 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
    unsigned int v15 = [v14 hasFailureReasons];

    if (!v15) {
      goto LABEL_32;
    }
    uint64_t v16 = auto_unlock_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
      int v61 = 67109120;
      LODWORD(v62) = [v17 failureReasons];
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received failure reasons %d", (uint8_t *)&v61, 8u);
    }
    id v18 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
    unsigned __int8 v19 = [v18 failureReasons];

    if ((v19 & 4) != 0)
    {
      unsigned int v45 = [(SDAutoUnlockPairingLockSession *)self userInfoCompanionViewNotSyncing];
      unsigned int v46 = self;
      uint64_t v47 = 7;
    }
    else
    {
      unsigned __int8 v20 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
      if ([v20 failureReasons])
      {
        v48 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
        unsigned __int8 v49 = [v48 failureReasons];

        if ((v49 & 2) != 0)
        {
          unsigned int v45 = [(SDAutoUnlockPairingLockSession *)self userInfoForNoWristDetectionNoPasscode];
          unsigned int v46 = self;
          uint64_t v47 = 4;
          goto LABEL_48;
        }
      }
      else
      {
      }
      unsigned int v50 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
      unsigned __int8 v51 = [v50 failureReasons];

      if (v51)
      {
        unsigned int v45 = [(SDAutoUnlockPairingLockSession *)self userInfoForNoPasscode];
        unsigned int v46 = self;
        uint64_t v47 = 2;
      }
      else
      {
        unsigned int v52 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
        unsigned __int8 v53 = [v52 failureReasons];

        if ((v53 & 2) == 0)
        {
          v54 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
          unsigned __int8 v55 = [v54 failureReasons];

          if ((v55 & 8) == 0)
          {
LABEL_32:
            switch(v13)
            {
              case 0x7Du:
                v57 = auto_unlock_log();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
                  sub_10003AF9C();
                }

                unsigned int v45 = [(SDAutoUnlockPairingLockSession *)self userInfoForMissingLTK];
                unsigned int v13 = 125;
                break;
              case 0x81u:
                v58 = auto_unlock_log();
                if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
                  sub_10003AFD0();
                }

                unsigned int v45 = [(SDAutoUnlockPairingLockSession *)self userInfoForMissingLTK];
                unsigned int v13 = 129;
                break;
              case 0xC4u:
                v56 = auto_unlock_log();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
                  sub_10003AF68();
                }

                unsigned int v45 = [(SDAutoUnlockPairingLockSession *)self userInfoForMissingLTK];
                unsigned int v13 = 196;
                break;
              default:
                unsigned int v45 = 0;
                break;
            }
            goto LABEL_49;
          }
          unsigned int v45 = [(SDAutoUnlockPairingLockSession *)self userInfoForiPhoneNeedsUnlock];
          unsigned int v13 = 177;
LABEL_49:
          v59 = auto_unlock_log();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
            sub_10003AEF0(v13, v59);
          }

          v60 = +[NSError errorWithDomain:SFAutoUnlockErrorDomain code:v13 userInfo:v45];
          [(SDAutoUnlockPairingLockSession *)self notifyDelegateWithError:v60];

          goto LABEL_52;
        }
        unsigned int v45 = [(SDAutoUnlockPairingLockSession *)self userInfoForNoWristDetection];
        unsigned int v46 = self;
        uint64_t v47 = 3;
      }
    }
LABEL_48:
    [(SDAutoUnlockPairingLockSession *)v46 setErrorType:v47];
    unsigned int v13 = 119;
    goto LABEL_49;
  }
  unsigned int v21 = auto_unlock_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
    int v61 = 67109120;
    LODWORD(v62) = [v22 version];
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Pairing session version is %d", (uint8_t *)&v61, 8u);
  }
  v23 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
  unsigned int v24 = [v23 version];

  if (v24 == 4)
  {
    v25 = +[SDAutoUnlockAKSManager sharedManager];
    uint64_t v26 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
    uint64_t v27 = [v26 longTermKey];
    [v25 signAndStoreRemoteLTK:v27 forDeviceID:v7];

    [(SDAutoUnlockPairingLockSession *)self handleDeviceAuthenticationSetupRequest];
  }
  else
  {
    v28 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
    unsigned int v29 = [v28 hasWatchOldLTKSyncStatus];

    if (v29)
    {
      double v30 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
      -[SDAutoUnlockPairingLockSession setWatchOldLTKSyncStatus:](self, "setWatchOldLTKSyncStatus:", [v30 watchOldLTKSyncStatus]);
    }
    double v31 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
    unsigned int v32 = [v31 hasWatchNewLTKSyncStatus];

    if (v32)
    {
      unsigned int v33 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
      -[SDAutoUnlockPairingLockSession setWatchNewLTKSyncStatus:](self, "setWatchNewLTKSyncStatus:", [v33 watchNewLTKSyncStatus]);
    }
    unsigned __int8 v34 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
    unsigned int v35 = [v34 hasLtkHash];

    if (v35)
    {
      unsigned int v36 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
      uint64_t v37 = [v36 ltkHash];
      [(SDAutoUnlockPairingLockSession *)self setRemoteLTKHash:v37];

      __int16 v38 = auto_unlock_log();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v39 = [(SDAutoUnlockPairingLockSession *)self remoteLTKHash];
        int v61 = 138412290;
        v62 = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Remote LTK Hash: %@", (uint8_t *)&v61, 0xCu);
      }
    }
    if (![(SDAutoUnlockPairingLockSession *)self ltkHashMatches])
    {
      unsigned __int8 v40 = +[SDAutoUnlockAKSManager sharedManager];
      NSErrorUserInfoKey v41 = [(SDAutoUnlockPairingSession *)self deviceID];
      [v40 checkRemoteLTKForDeviceID:v41];

      CFStringRef v42 = +[SDAutoUnlockAKSManager sharedManager];
      unsigned int v43 = [(SDAutoUnlockPairingSession *)self deviceID];
      [v42 updatePreferredRemoteLTKForDeviceID:v43];
    }
    v44 = +[SDAutoUnlockAKSManager sharedManager];
    [v44 updateLTKs];

    [(SDAutoUnlockPairingLockSession *)self handleEscrowSessionRequest];
  }
LABEL_52:
}

- (void)handleEscrowSessionRequest
{
  if ([(SDAutoUnlockPairingLockSession *)self canceled])
  {
    id v3 = auto_unlock_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Pairing session canceled for session request", buf, 2u);
    }

    return;
  }
  if (sub_1000D9060(@"AURestrictOldWatch", 1))
  {
    char v4 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
    unsigned int v5 = [v4 version];

    if (v5 < 2uLL)
    {
      id v6 = auto_unlock_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
        *(_DWORD *)buf = 67109120;
        LODWORD(v55) = [v7 version];
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setup received response from old watch (version: %d)", buf, 8u);
      }
      id v8 = [(SDAutoUnlockPairingLockSession *)self userInfoForOldProtocol];
      uint64_t v9 = SFAutoUnlockErrorDomain;
      uint64_t v10 = 126;
LABEL_14:
      unsigned int v15 = +[NSError errorWithDomain:v9 code:v10 userInfo:v8];
      [(SDAutoUnlockPairingLockSession *)self notifyDelegateWithError:v15];

      goto LABEL_15;
    }
  }
  unsigned int v11 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
  unsigned int v12 = [v11 version];

  if (v12 > 3uLL)
  {
    unsigned int v13 = auto_unlock_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
      *(_DWORD *)buf = 67109120;
      LODWORD(v55) = [v14 version];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Setup received response from new watch (version: %d)", buf, 8u);
    }
    id v8 = [(SDAutoUnlockPairingLockSession *)self userInfoForNewProtocol];
    uint64_t v9 = SFAutoUnlockErrorDomain;
    uint64_t v10 = 173;
    goto LABEL_14;
  }
  uint64_t v51 = 0;
  uint64_t v16 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
  unsigned int v17 = [v16 hasToken];

  if (!v17)
  {
    uint64_t v51 = 155;
    id v30 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
    if ([v30 hasToken]) {
      CFStringRef v32 = @"YES";
    }
    else {
      CFStringRef v32 = @"NO";
    }
    unsigned int v33 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
    unsigned __int8 v34 = [v33 token];
    +[NSString stringWithFormat:@"Auto Unlock: Missing information for escrow session (has token = %@, token = %@)", v32, v34];
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_27;
  }
  unsigned int v18 = [(SDAutoUnlockPairingLockSession *)self ltkHashMatches];
  unsigned __int8 v19 = +[SDAutoUnlockAKSManager sharedManager];
  unsigned __int8 v20 = [(SDAutoUnlockPairingSession *)self deviceID];
  unsigned int v21 = [v19 remoteLTKForDeviceID:v20];

  if (v21 && v18)
  {
    uint64_t v22 = +[SDAutoUnlockAKSManager sharedManager];
    v23 = [(SDAutoUnlockPairingSession *)self deviceID];
    unsigned int v24 = [v22 aksPairingSessionForDeviceID:v23 originator:0 errorCode:&v51 requiresAttestation:1 requiresEscrow:0];
    [(SDAutoUnlockPairingSession *)self setAksSession:v24];

    v25 = [(SDAutoUnlockPairingSession *)self aksSession];
    LODWORD(v23) = [v25 sessionIsValid];

    if (!v23)
    {
      if (v51 == 148)
      {
        id v8 = [(SDAutoUnlockPairingLockSession *)self userInfoForMissingLTK];
      }
      else
      {
        NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
        CFStringRef v59 = @"Invalid AKS session";
        id v8 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        unsigned __int8 v49 = auto_unlock_log();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          sub_10003B06C();
        }
      }
      uint64_t v9 = SFAutoUnlockErrorDomain;
      uint64_t v10 = v51;
      goto LABEL_14;
    }
    uint64_t v26 = [(SDAutoUnlockPairingSession *)self aksSession];
    uint64_t v27 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
    v28 = [v27 token];
    id v50 = 0;
    unsigned int v29 = [v26 stepSessionWithData:v28 outputData:&v50];
    id v30 = v50;

    if (v29)
    {
      double v31 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
      -[SDAutoUnlockPairingLockSession sendCreateSecretWithStepData:sessionID:](self, "sendCreateSecretWithStepData:sessionID:", v30, [v31 sessionID]);

      id v8 = 0;
    }
    else
    {
      uint64_t v51 = 162;
      id v8 = @"Could not setup escrow session";
    }
LABEL_27:

    if (!v8) {
      return;
    }
    unsigned int v35 = auto_unlock_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_10003B004();
    }

    uint64_t v36 = SFAutoUnlockErrorDomain;
    uint64_t v37 = v51;
    NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
    CFStringRef v53 = @"Request failure";
    __int16 v38 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    unsigned int v39 = +[NSError errorWithDomain:v36 code:v37 userInfo:v38];
    [(SDAutoUnlockPairingLockSession *)self notifyDelegateWithError:v39];

LABEL_15:
    return;
  }
  unsigned __int8 v40 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
  unsigned int v41 = [v40 ltkSyncing];

  if (v41)
  {
    [(SDAutoUnlockPairingLockSession *)self restartLTKTimer];
  }
  else
  {
    CFStringRef v42 = auto_unlock_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v43 = @"NO";
      if (v21) {
        CFStringRef v44 = @"YES";
      }
      else {
        CFStringRef v44 = @"NO";
      }
      if (v18) {
        CFStringRef v43 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v55 = v44;
      __int16 v56 = 2112;
      CFStringRef v57 = v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "LTK invalid (exists: %@, hash matches: %@)", buf, 0x16u);
    }

    if (v21) {
      uint64_t v45 = 193;
    }
    else {
      uint64_t v45 = 148;
    }
    uint64_t v51 = v45;
    uint64_t v46 = SFAutoUnlockErrorDomain;
    uint64_t v47 = [(SDAutoUnlockPairingLockSession *)self userInfoForMissingLTK];
    v48 = +[NSError errorWithDomain:v46 code:v45 userInfo:v47];
    [(SDAutoUnlockPairingLockSession *)self notifyDelegateWithError:v48];
  }
}

- (void)handleDeviceAuthenticationSetupRequest
{
  if (![(SDAutoUnlockPairingLockSession *)self canceled])
  {
    *(void *)buf = 0;
    char v4 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
    unsigned int v5 = [v4 hasToken];

    if (v5)
    {
      id v6 = +[SDAutoUnlockAKSManager sharedManager];
      id v7 = [(SDAutoUnlockPairingSession *)self deviceID];
      id v8 = [v6 remoteLTKForDeviceID:v7];

      if (v8)
      {
        uint64_t v9 = +[SDAutoUnlockAKSManager sharedManager];
        uint64_t v10 = [(SDAutoUnlockPairingSession *)self deviceID];
        unsigned int v11 = [v9 aksPairingSessionForDeviceID:v10 originator:0 errorCode:buf requiresAttestation:1 requiresEscrow:0];
        [(SDAutoUnlockPairingSession *)self setAksSession:v11];

        unsigned int v12 = [(SDAutoUnlockPairingSession *)self aksSession];
        LODWORD(v10) = [v12 sessionIsValid];

        if (v10)
        {
          unsigned int v13 = [(SDAutoUnlockPairingSession *)self aksSession];
          v14 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
          unsigned int v15 = [v14 token];
          id v33 = 0;
          unsigned int v16 = [v13 stepSessionWithData:v15 outputData:&v33];
          id v17 = v33;

          if (v16)
          {
            unsigned int v18 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
            -[SDAutoUnlockPairingLockSession sendCreateSecretWithStepData:sessionID:](self, "sendCreateSecretWithStepData:sessionID:", v17, [v18 sessionID]);

            unsigned __int8 v19 = 0;
          }
          else
          {
            *(void *)buf = 162;
            unsigned __int8 v19 = @"Could not setup device authentication session";
          }
LABEL_14:

          if (!v19) {
            return;
          }
          v23 = auto_unlock_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_10003B004();
          }

          uint64_t v24 = SFAutoUnlockErrorDomain;
          uint64_t v25 = *(void *)buf;
          NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
          CFStringRef v36 = @"Request failure";
          uint64_t v26 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
          uint64_t v27 = +[NSError errorWithDomain:v24 code:v25 userInfo:v26];
          [(SDAutoUnlockPairingLockSession *)self notifyDelegateWithError:v27];

          goto LABEL_29;
        }
        if (*(void *)buf == 148)
        {
          unsigned __int8 v19 = [(SDAutoUnlockPairingLockSession *)self userInfoForMissingLTK];
        }
        else
        {
          NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
          CFStringRef v38 = @"Invalid AKS session";
          unsigned __int8 v19 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
          CFStringRef v32 = auto_unlock_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_10003B06C();
          }
        }
        uint64_t v30 = SFAutoUnlockErrorDomain;
        uint64_t v31 = *(void *)buf;
      }
      else
      {
        v28 = auto_unlock_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_10003B0A0();
        }

        uint64_t v29 = SFAutoUnlockErrorDomain;
        unsigned __int8 v19 = [(SDAutoUnlockPairingLockSession *)self userInfoForMissingLTK];
        uint64_t v30 = v29;
        uint64_t v31 = 148;
      }
      uint64_t v26 = +[NSError errorWithDomain:v30 code:v31 userInfo:v19];
      [(SDAutoUnlockPairingLockSession *)self notifyDelegateWithError:v26];
LABEL_29:

      return;
    }
    *(void *)buf = 155;
    id v17 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
    if ([v17 hasToken]) {
      CFStringRef v20 = @"YES";
    }
    else {
      CFStringRef v20 = @"NO";
    }
    unsigned int v21 = [(SDAutoUnlockPairingLockSession *)self sessionCreatedMessage];
    uint64_t v22 = [v21 token];
    +[NSString stringWithFormat:@"Auto Unlock: Missing information for escrow session (has token = %@, token = %@)", v20, v22];
    unsigned __int8 v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  id v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Pairing session canceled for session request", buf, 2u);
  }
}

- (void)handleSetupCreateRecord:(id)a3
{
  id v4 = a3;
  if ([(SDAutoUnlockPairingLockSession *)self canceled])
  {
    unsigned int v5 = auto_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pairing session canceled for session request", buf, 2u);
    }
    goto LABEL_15;
  }
  id v6 = [[SDUnlockSetupCreateRecord alloc] initWithData:v4];
  unsigned int v5 = v6;
  if (v6
    && [(SDUnlockSetupCreateRecord *)v6 hasToken]
    && ([v5 hasErrorCode] & 1) == 0)
  {
    unsigned int v13 = [(SDAutoUnlockPairingSession *)self aksSession];
    v14 = [v5 token];
    unsigned int v15 = [v13 stepSessionWithData:v14 outputData:0];

    if (!v15)
    {
      id v8 = @"Final step failed";
      uint64_t v7 = 164;
      goto LABEL_11;
    }
    unsigned int v16 = [(SDAutoUnlockPairingSession *)self aksSession];
    id v17 = [(SDAutoUnlockPairingLockSession *)self passcode];
    uint64_t v7 = (uint64_t)[v16 finalizeEscrowPairing:v17];

    if (v7)
    {
      id v8 = @"Finalizing pairing failed";
LABEL_11:
      uint64_t v9 = auto_unlock_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10003B0D4();
      }

      uint64_t v10 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
      CFStringRef v40 = @"Record failure";
      unsigned int v11 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      unsigned int v12 = +[NSError errorWithDomain:v10 code:v7 userInfo:v11];
      [(SDAutoUnlockPairingLockSession *)self notifyDelegateWithError:v12];

      goto LABEL_14;
    }
    if (![v5 hasPairedDeviceID])
    {
      id v8 = @"Pairing response missing companion device ID";
      uint64_t v7 = 156;
      goto LABEL_11;
    }
    unsigned int v18 = +[SDAutoUnlockAKSManager sharedManager];
    unsigned __int8 v19 = [v5 pairedDeviceID];
    CFStringRef v20 = [(SDAutoUnlockPairingSession *)self deviceID];
    [v18 setCompanionID:v19 forWatchID:v20];

    unsigned int v21 = +[SDAutoUnlockAKSManager sharedManager];
    uint64_t v22 = [(SDAutoUnlockPairingSession *)self sessionID];
    v23 = [v22 UUIDString];
    uint64_t v24 = [(SDAutoUnlockPairingSession *)self deviceID];
    [v21 setPairingID:v23 forWatchID:v24];

    uint64_t v25 = +[SDAutoUnlockTransport sharedTransport];
    uint64_t v26 = [v5 pairedDeviceID];
    id v8 = [v25 idsDeviceForUniqueID:v26];

    uint64_t v27 = [(__CFString *)v8 modelIdentifier];
    [(SDAutoUnlockPairingLockSession *)self setCompanionDeviceModel:v27];

    v28 = [(SDAutoUnlockPairingSession *)self aksSession];
    unsigned int v11 = [v28 generateSessionToken];

    if (v11)
    {
      uint64_t v29 = +[SDAutoUnlockAKSManager sharedManager];
      uint64_t v30 = [(SDAutoUnlockPairingSession *)self deviceID];
      unsigned int v31 = [v29 storeRangingKey:v11 forDeviceID:v30];

      if (v31)
      {
        [(SDAutoUnlockPairingLockSession *)self handleSuccessfulPairing];
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v36 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
      CFStringRef v44 = @"Failed to store session token";
      id v33 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      uint64_t v34 = v36;
      uint64_t v35 = 168;
    }
    else
    {
      uint64_t v32 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
      CFStringRef v42 = @"Failed to create session token";
      id v33 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      uint64_t v34 = v32;
      uint64_t v35 = 167;
    }
    NSErrorUserInfoKey v37 = +[NSError errorWithDomain:v34 code:v35 userInfo:v33];
    [(SDAutoUnlockPairingLockSession *)self notifyDelegateWithError:v37];

    goto LABEL_14;
  }
  if ([v5 hasErrorCode]) {
    uint64_t v7 = [v5 errorCode];
  }
  else {
    uint64_t v7 = 171;
  }
  id v8 = +[NSString stringWithFormat:@"Auto Unlock: Creating escrow record failed (error code: %d)", [v5 errorCode]];
  if (v8) {
    goto LABEL_11;
  }
LABEL_15:
}

- (void)handleSuccessfulPairing
{
  id v3 = +[SDAutoUnlockTransport sharedTransport];
  id v4 = [(SDAutoUnlockPairingSession *)self deviceID];
  unsigned int v5 = [v3 idsDeviceForUniqueID:v4];

  id v6 = +[SDAutoUnlockTransport sharedTransport];
  uint64_t v7 = [v6 autoUnlockDeviceForIDSDevice:v5 cloudPaired:0 cached:0];

  if ([v7 unlockEnabled])
  {
    [(SDAutoUnlockPairingLockSession *)self setUnlockEnabled:1];
    [(SDAutoUnlockPairingLockSession *)self notifyDelegateWithError:0];
    id v8 = auto_unlock_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
  if (![v7 unlockEnabled]) {
    goto LABEL_11;
  }
  uint64_t v9 = [v7 bluetoothID];
  if (!v9) {
    goto LABEL_11;
  }
  uint64_t v10 = (void *)v9;
  unsigned int v11 = [v7 proxyBluetoothID];
  if (v11)
  {

    goto LABEL_9;
  }
  unsigned int v12 = [v7 supportsAlwaysDirect];

  if (!v12)
  {
LABEL_11:
    uint64_t v14 = [v7 bluetoothID];
    if (v14
      && (unsigned int v15 = (void *)v14,
          [v7 proxyBluetoothID],
          unsigned int v16 = objc_claimAutoreleasedReturnValue(),
          v16,
          v15,
          v16))
    {
      id v17 = auto_unlock_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10003B17C();
      }

      uint64_t v18 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
      CFStringRef v35 = @"Unlock not enabled after pairing";
      id v8 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      unsigned __int8 v19 = +[NSError errorWithDomain:v18 code:133 userInfo:v8];
      [(SDAutoUnlockPairingLockSession *)self notifyDelegateWithError:v19];
    }
    else
    {
      CFStringRef v20 = auto_unlock_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v21 = [v7 bluetoothID];
        uint64_t v22 = [v21 UUIDString];
        v23 = [v7 proxyBluetoothID];
        uint64_t v24 = [v23 UUIDString];
        *(_DWORD *)buf = 138412546;
        NSErrorUserInfoKey v37 = v22;
        __int16 v38 = 2112;
        NSErrorUserInfoKey v39 = v24;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Waiting for cloud pairing (Watch ID: %@, Companion ID: %@)", buf, 0x16u);
      }
      [(SDAutoUnlockPairingLockSession *)self setWaitingForCloudPairing:1];
      id v8 = objc_opt_new();
      uint64_t v25 = [v7 bluetoothID];

      if (!v25)
      {
        uint64_t v26 = [(SDAutoUnlockPairingSession *)self deviceID];
        [v8 addObject:v26];
      }
      uint64_t v27 = [v7 proxyBluetoothID];

      if (!v27)
      {
        v28 = +[SDAutoUnlockAKSManager sharedManager];
        uint64_t v29 = [(SDAutoUnlockPairingSession *)self deviceID];
        uint64_t v30 = [v28 companionIDForWatchID:v29];

        if (v30)
        {
          [v8 addObject:v30];
        }
        else
        {
          unsigned int v31 = auto_unlock_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
            sub_10003B13C();
          }
        }
      }
      uint64_t v32 = auto_unlock_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        NSErrorUserInfoKey v37 = v8;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Retrying cloud pairing for specific devices %@", buf, 0xCu);
      }

      id v33 = +[SDAutoUnlockTransport sharedTransport];
      [v33 triggerCloudPairRetryWithShortRetryDeviceIDs:v8];

      [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8(480.0)];
    }
    goto LABEL_30;
  }
LABEL_9:
  [(SDAutoUnlockPairingLockSession *)self setUnlockEnabled:1];
  [(SDAutoUnlockPairingLockSession *)self notifyDelegateWithError:0];
  id v8 = auto_unlock_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
LABEL_10:
    unsigned int v13 = [(SDAutoUnlockPairingSession *)self deviceID];
    *(_DWORD *)buf = 138412290;
    NSErrorUserInfoKey v37 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Enabled for device: %@", buf, 0xCu);
  }
LABEL_30:
}

- (void)sendSetupRequest
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003902C;
  v7[3] = &unk_1008CA7B8;
  v7[4] = self;
  v2 = objc_retainBlock(v7);
  id v3 = +[SDAutoUnlockAKSManager sharedManager];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100039390;
  v5[3] = &unk_1008CA7E0;
  id v6 = v2;
  id v4 = v2;
  [v3 generateLocalAttestedLTKIfNeccessaryWithCompletion:v5];
}

- (void)sendCreateSecretWithStepData:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = auto_unlock_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending SDUnlockSetupCreateSecret", buf, 2u);
  }

  [(SDAutoUnlockPairingLockSession *)self setSendState:2];
  id v8 = objc_alloc_init(SDUnlockSetupCreateSecret);
  [(SDUnlockSetupCreateSecret *)v8 setSessionID:v4];
  [(SDUnlockSetupCreateSecret *)v8 setToken:v6];

  uint64_t v9 = objc_opt_new();
  [(SDAutoUnlockPairingLockSession *)self setTokenExchangeDate:v9];

  unsigned int v10 = [(SDAutoUnlockPairingLockSession *)self useAttestedProtocol];
  unsigned int v11 = [(SDAutoUnlockPairingSession *)self transport];
  unsigned int v12 = [(SDUnlockSetupCreateSecret *)v8 data];
  unsigned int v13 = [(SDAutoUnlockPairingSession *)self deviceID];
  uint64_t v14 = [(SDAutoUnlockPairingSession *)self sessionID];
  unsigned int v15 = +[NSNumber numberWithInteger:[(SDAutoUnlockPairingLockSession *)self messageTimeout]];
  uint64_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  CFStringRef v20 = sub_1000395B8;
  unsigned int v21 = &unk_1008CA6A8;
  uint64_t v22 = self;
  if (v10) {
    uint64_t v16 = 2003;
  }
  else {
    uint64_t v16 = 103;
  }
  id v17 = [v11 sendAutoUnlockPayload:v12 toDevice:v13 type:v16 sessionID:v14 queueOneID:0 timeout:v15 completion:&v18 queueOneID:v18 queueTwoID:v19 queueThreeID:v20 queueFourID:v21 queueFiveID:v22];
  [(SDAutoUnlockPairingLockSession *)self setTokenMessageIdentifier:v17];

  [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8((double)[(SDAutoUnlockPairingLockSession *)self responseTimeout])];
}

- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  unsigned int v11 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003979C;
  v14[3] = &unk_1008CA3D8;
  v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  unsigned __int16 v17 = a5;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(v11, v14);
}

- (void)transport:(id)a3 didReceiveMessageACKForIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = auto_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(SDAutoUnlockPairingLockSession *)self setupMessageIdentifier];
    id v8 = [(SDAutoUnlockPairingLockSession *)self tokenMessageIdentifier];
    int v11 = 138412802;
    id v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received ACK (identifier: %@, setup ID: %@, token ID: %@)", (uint8_t *)&v11, 0x20u);
  }
  if ([(SDAutoUnlockPairingLockSession *)self receivedSetupACK])
  {
    [(SDAutoUnlockPairingLockSession *)self setReceivedSetupACK:1];
  }
  else
  {
    id v9 = [(SDAutoUnlockPairingLockSession *)self setupMessageIdentifier];
    -[SDAutoUnlockPairingLockSession setReceivedSetupACK:](self, "setReceivedSetupACK:", [v5 isEqualToString:v9]);
  }
  if ([(SDAutoUnlockPairingLockSession *)self receivedTokenACK])
  {
    [(SDAutoUnlockPairingLockSession *)self setReceivedTokenACK:1];
  }
  else
  {
    id v10 = [(SDAutoUnlockPairingLockSession *)self tokenMessageIdentifier];
    -[SDAutoUnlockPairingLockSession setReceivedTokenACK:](self, "setReceivedTokenACK:", [v5 isEqualToString:v10]);
  }
}

- (id)userInfoForiPhoneNeedsUnlock
{
  v2 = SFLocalizedStringForKey();
  id v3 = SFLocalizedStringForKey();
  v6[0] = NSLocalizedDescriptionKey;
  v6[1] = SFAutoUnlockManagerErrorTitleKey;
  v7[0] = v2;
  v7[1] = v2;
  v6[2] = SFAutoUnlockManagerErrorBodyKey;
  v7[2] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (id)userInfoForKeychainMismatch
{
  v2 = SFLocalizedStringForKey();
  id v3 = SFLocalizedStringForKey();
  v6[0] = NSLocalizedDescriptionKey;
  v6[1] = SFAutoUnlockManagerErrorTitleKey;
  v7[0] = v2;
  v7[1] = v2;
  v6[2] = SFAutoUnlockManagerErrorBodyKey;
  v7[2] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (id)userInfoForInternetSharing
{
  v2 = SFLocalizedStringForKey();
  id v3 = SFLocalizedStringForKey();
  v6[0] = NSLocalizedDescriptionKey;
  v6[1] = SFAutoUnlockManagerErrorTitleKey;
  v7[0] = v2;
  v7[1] = v2;
  v6[2] = SFAutoUnlockManagerErrorBodyKey;
  v7[2] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (id)userInfoForMissingLTK
{
  v2 = SFLocalizedStringForKey();
  id v3 = SFLocalizedStringForKey();
  v6[0] = NSLocalizedDescriptionKey;
  v6[1] = SFAutoUnlockManagerErrorTitleKey;
  v7[0] = v2;
  v7[1] = v2;
  v6[2] = SFAutoUnlockManagerErrorBodyKey;
  v7[2] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (id)userInfoForWatchNotSignedIn
{
  v2 = SFLocalizedStringForKey();
  id v3 = SFLocalizedStringForKey();
  v6[0] = NSLocalizedDescriptionKey;
  v6[1] = SFAutoUnlockManagerErrorTitleKey;
  v7[0] = v2;
  v7[1] = v2;
  v6[2] = SFAutoUnlockManagerErrorBodyKey;
  v7[2] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (id)userInfoForMacNotSignedIn
{
  v2 = SFLocalizedStringForKey();
  id v3 = SFLocalizedStringForKey();
  v6[0] = NSLocalizedDescriptionKey;
  v6[1] = SFAutoUnlockManagerErrorTitleKey;
  v7[0] = v2;
  v7[1] = v2;
  v6[2] = SFAutoUnlockManagerErrorBodyKey;
  v7[2] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (id)userInfoForNotCloudPaired
{
  v4[0] = NSLocalizedDescriptionKey;
  v4[1] = SFAutoUnlockManagerErrorTitleKey;
  v5[0] = @"[Internal] Bluetooth cloud pairing in progress.";
  v5[1] = @"[Internal] Bluetooth cloud pairing in progress.";
  v4[2] = SFAutoUnlockManagerErrorBodyKey;
  v5[2] = @"Auto Unlock can't be set up when your Mac is bluetooth cloud pairing to your Apple Watch. Please try again later.";
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

- (id)userInfoForWatchLocked
{
  v2 = SFLocalizedStringForKey();
  id v3 = SFLocalizedStringForKey();
  v6[0] = NSLocalizedDescriptionKey;
  v6[1] = SFAutoUnlockManagerErrorTitleKey;
  v7[0] = v2;
  v7[1] = v2;
  v6[2] = SFAutoUnlockManagerErrorBodyKey;
  v7[2] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (id)userInfoCompanionViewNotSyncing
{
  v2 = SFLocalizedStringForKey();
  id v3 = SFLocalizedStringForKey();
  v6[0] = NSLocalizedDescriptionKey;
  v6[1] = SFAutoUnlockManagerErrorTitleKey;
  v7[0] = v2;
  v7[1] = v2;
  v6[2] = SFAutoUnlockManagerErrorBodyKey;
  v7[2] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (id)userInfoForNoWristDetectionNoPasscode
{
  v2 = SFLocalizedStringForKey();
  id v3 = SFLocalizedStringForKey();
  v6[0] = NSLocalizedDescriptionKey;
  v6[1] = SFAutoUnlockManagerErrorTitleKey;
  v7[0] = v2;
  v7[1] = v2;
  v6[2] = SFAutoUnlockManagerErrorBodyKey;
  v7[2] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (id)userInfoForNoWristDetection
{
  v2 = SFLocalizedStringForKey();
  id v3 = SFLocalizedStringForKey();
  v6[0] = NSLocalizedDescriptionKey;
  v6[1] = SFAutoUnlockManagerErrorTitleKey;
  v7[0] = v2;
  v7[1] = v2;
  v6[2] = SFAutoUnlockManagerErrorBodyKey;
  v7[2] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (id)userInfoForNoPasscode
{
  v2 = SFLocalizedStringForKey();
  id v3 = SFLocalizedStringForKey();
  v6[0] = NSLocalizedDescriptionKey;
  v6[1] = SFAutoUnlockManagerErrorTitleKey;
  v7[0] = v2;
  v7[1] = v2;
  v6[2] = SFAutoUnlockManagerErrorBodyKey;
  v7[2] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (id)userInfoForNoCommunincation
{
  v2 = SFLocalizedStringForKey();
  id v3 = SFLocalizedStringForKey();
  v6[0] = NSLocalizedDescriptionKey;
  v6[1] = SFAutoUnlockManagerErrorTitleKey;
  v7[0] = v2;
  v7[1] = v2;
  v6[2] = SFAutoUnlockManagerErrorBodyKey;
  v7[2] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (id)userInfoForOldProtocol
{
  v2 = SFLocalizedStringForKey();
  id v3 = SFLocalizedStringForKey();
  v6[0] = NSLocalizedDescriptionKey;
  v6[1] = SFAutoUnlockManagerErrorTitleKey;
  v7[0] = v2;
  v7[1] = v2;
  v6[2] = SFAutoUnlockManagerErrorBodyKey;
  v7[2] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (id)userInfoForNewProtocol
{
  v2 = SFLocalizedStringForKey();
  id v3 = SFLocalizedStringForKey();
  v6[0] = NSLocalizedDescriptionKey;
  v6[1] = SFAutoUnlockManagerErrorTitleKey;
  v7[0] = v2;
  v7[1] = v2;
  v6[2] = SFAutoUnlockManagerErrorBodyKey;
  v7[2] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (BOOL)upsellDevice
{
  return self->_upsellDevice;
}

- (void)setUpsellDevice:(BOOL)a3
{
  self->_upsellDevice = a3;
}

- (BOOL)setupRetryDevice
{
  return self->_setupRetryDevice;
}

- (void)setSetupRetryDevice:(BOOL)a3
{
  self->_setupRetryDevice = a3;
}

- (BOOL)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (BOOL)waitingForCloudPairing
{
  return self->_waitingForCloudPairing;
}

- (void)setWaitingForCloudPairing:(BOOL)a3
{
  self->_waitingForCloudPairing = a3;
}

- (int64_t)sendState
{
  return self->_sendState;
}

- (void)setSendState:(int64_t)a3
{
  self->_sendState = a3;
}

- (NSString)keyDeviceModel
{
  return self->_keyDeviceModel;
}

- (void)setKeyDeviceModel:(id)a3
{
}

- (NSString)watchBuildVersion
{
  return self->_watchBuildVersion;
}

- (void)setWatchBuildVersion:(id)a3
{
}

- (NSString)watchOSVersion
{
  return self->_watchOSVersion;
}

- (void)setWatchOSVersion:(id)a3
{
}

- (NSString)companionDeviceModel
{
  return self->_companionDeviceModel;
}

- (void)setCompanionDeviceModel:(id)a3
{
}

- (NSError)setupError
{
  return self->_setupError;
}

- (void)setSetupError:(id)a3
{
}

- (BOOL)keyDeviceLocked
{
  return self->_keyDeviceLocked;
}

- (void)setKeyDeviceLocked:(BOOL)a3
{
  self->_keyDeviceLocked = a3;
}

- (BOOL)unlockEnabled
{
  return self->_unlockEnabled;
}

- (void)setUnlockEnabled:(BOOL)a3
{
  self->_unlockEnabled = a3;
}

- (OS_dispatch_source)ltkTimer
{
  return self->_ltkTimer;
}

- (void)setLtkTimer:(id)a3
{
}

- (unsigned)errorType
{
  return self->_errorType;
}

- (void)setErrorType:(unsigned int)a3
{
  self->_errorType = a3;
}

- (SDUnlockSetupSessionCreated)sessionCreatedMessage
{
  return self->_sessionCreatedMessage;
}

- (void)setSessionCreatedMessage:(id)a3
{
}

- (int64_t)responseTimeout
{
  return self->_responseTimeout;
}

- (void)setResponseTimeout:(int64_t)a3
{
  self->_int64_t responseTimeout = a3;
}

- (int64_t)responseTimeoutFromServer
{
  return self->_responseTimeoutFromServer;
}

- (void)setResponseTimeoutFromServer:(int64_t)a3
{
  self->_responseTimeoutFromServer = a3;
}

- (int64_t)messageTimeout
{
  return self->_messageTimeout;
}

- (void)setMessageTimeout:(int64_t)a3
{
  self->_int64_t messageTimeout = a3;
}

- (int64_t)messageTimeoutFromServer
{
  return self->_messageTimeoutFromServer;
}

- (void)setMessageTimeoutFromServer:(int64_t)a3
{
  self->_int64_t messageTimeoutFromServer = a3;
}

- (int64_t)ltkTimerRetryCount
{
  return self->_ltkTimerRetryCount;
}

- (void)setLtkTimerRetryCount:(int64_t)a3
{
  self->_ltkTimerRetryCount = a3;
}

- (NSDate)keyExchangeDate
{
  return self->_keyExchangeDate;
}

- (void)setKeyExchangeDate:(id)a3
{
}

- (NSDate)tokenExchangeDate
{
  return self->_tokenExchangeDate;
}

- (void)setTokenExchangeDate:(id)a3
{
}

- (double)keyExchangeInterval
{
  return self->_keyExchangeInterval;
}

- (void)setKeyExchangeInterval:(double)a3
{
  self->_keyExchangeInterval = a3;
}

- (double)tokenExchangeInterval
{
  return self->_tokenExchangeInterval;
}

- (void)setTokenExchangeInterval:(double)a3
{
  self->_tokenExchangeInterval = a3;
}

- (NSData)remoteLTKHash
{
  return self->_remoteLTKHash;
}

- (void)setRemoteLTKHash:(id)a3
{
}

- (int)watchOldLTKSyncStatus
{
  return self->_watchOldLTKSyncStatus;
}

- (void)setWatchOldLTKSyncStatus:(int)a3
{
  self->_watchOldLTKSyncStatus = a3;
}

- (int)watchNewLTKSyncStatus
{
  return self->_watchNewLTKSyncStatus;
}

- (void)setWatchNewLTKSyncStatus:(int)a3
{
  self->_watchNewLTKSyncStatus = a3;
}

- (BOOL)receivedSetupACK
{
  return self->_receivedSetupACK;
}

- (void)setReceivedSetupACK:(BOOL)a3
{
  self->_receivedSetupACK = a3;
}

- (BOOL)receivedTokenACK
{
  return self->_receivedTokenACK;
}

- (void)setReceivedTokenACK:(BOOL)a3
{
  self->_receivedTokenACK = a3;
}

- (NSString)setupMessageIdentifier
{
  return self->_setupMessageIdentifier;
}

- (void)setSetupMessageIdentifier:(id)a3
{
}

- (NSString)tokenMessageIdentifier
{
  return self->_tokenMessageIdentifier;
}

- (void)setTokenMessageIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_setupMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteLTKHash, 0);
  objc_storeStrong((id *)&self->_tokenExchangeDate, 0);
  objc_storeStrong((id *)&self->_keyExchangeDate, 0);
  objc_storeStrong((id *)&self->_sessionCreatedMessage, 0);
  objc_storeStrong((id *)&self->_ltkTimer, 0);
  objc_storeStrong((id *)&self->_setupError, 0);
  objc_storeStrong((id *)&self->_companionDeviceModel, 0);
  objc_storeStrong((id *)&self->_watchOSVersion, 0);
  objc_storeStrong((id *)&self->_watchBuildVersion, 0);
  objc_storeStrong((id *)&self->_keyDeviceModel, 0);

  objc_storeStrong((id *)&self->_passcode, 0);
}

@end