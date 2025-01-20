@interface SDAutoUnlockLockSession
- (BOOL)attemptPrewarmed;
- (BOOL)attemptTimedOut;
- (BOOL)awdlUp;
- (BOOL)canceled;
- (BOOL)chosenDevice;
- (BOOL)connected;
- (BOOL)deviceWasLocked;
- (BOOL)doNotPostUnlockConfirmation;
- (BOOL)foundPeer;
- (BOOL)handleFoundBLEDevice:(id)a3;
- (BOOL)handleFoundBLEDevice:(id)a3 available:(BOOL)a4 lockedOnWrist:(BOOL)a5;
- (BOOL)imageDataAlreadyCached;
- (BOOL)isAcceptor;
- (BOOL)isWaitingToCompleteUnlock;
- (BOOL)lockedKeyBag;
- (BOOL)needsNewImage;
- (BOOL)oldWatch;
- (BOOL)onlyRanging;
- (BOOL)otherProviderCancel;
- (BOOL)otherSessionCancel;
- (BOOL)peerInRange:(id)a3;
- (BOOL)receivedAWDLInfo;
- (BOOL)receivedAuthPromptResponse;
- (BOOL)receivedExchangeRequest;
- (BOOL)sendingConfirmation;
- (BOOL)sentExchangeResponse;
- (BOOL)sentImageData;
- (BOOL)shouldWaitToCompleteUnlock;
- (BOOL)supportsConfirmationACK;
- (BOOL)unlockSucceeded;
- (BOOL)useProxy;
- (BOOL)usingProxy;
- (BOOL)waitingForDisplayOrClamshell;
- (BOOL)wifiState;
- (NSArray)peerList;
- (NSData)externalACMContext;
- (NSData)imageData;
- (NSData)imageHash;
- (NSData)peerMacAddress;
- (NSDate)attemptStartDate;
- (NSDate)confirmationSendDate;
- (NSDate)connectionDate;
- (NSDate)discoveryDate;
- (NSDate)displayOrClamshellWaitingDate;
- (NSDate)exchageResponseDate;
- (NSDate)firstSend;
- (NSDate)prewarmIdleStartDate;
- (NSDate)prewarmStartDate;
- (NSString)proxyDeviceModel;
- (NSString)watchBuildVersion;
- (NSString)watchModelID;
- (NSString)watchOSVersion;
- (NSUUID)bluetoothID;
- (OS_dispatch_source)confirmationTimer;
- (OS_dispatch_source)displayTimer;
- (SDAutoUnlockIconTransferStore)iconTransferStore;
- (SDAutoUnlockLockSession)initWithAutoUnlockDevice:(id)a3 sessionID:(id)a4 bleDevice:(id)a5;
- (SDUnlockSessionAuthToken)sessionAuthToken;
- (SFAutoUnlockDevice)autoUnlockDevice;
- (double)attemptTime;
- (double)awdlInfoExchange;
- (double)awdlTotal;
- (double)btBootstrap;
- (double)btOverall;
- (double)completeExchange;
- (double)confirmation;
- (double)connectionTime;
- (double)connectionWaitTime;
- (double)discoveryTime;
- (double)displayClamshellWaitTime;
- (double)keyRequestExchange;
- (double)peerFoundInterval;
- (double)prewarmIdleTime;
- (double)proxyConnectionTime;
- (double)proxyDiscoveryTime;
- (double)tokenExchange;
- (id)aksPeerAvailable;
- (id)attemptResults;
- (id)getAppName;
- (id)hintToken;
- (int)proxyRSSI;
- (int)watchRSSI;
- (int64_t)configChangeType;
- (int64_t)displayCount;
- (int64_t)lastSleepType;
- (int64_t)timeSinceLastMachineWake;
- (unint64_t)connectedBluetoothDevices;
- (void)_cancel;
- (void)_handleCanceledAfterSuccess;
- (void)addObservers;
- (void)cancel;
- (void)cancelWiFiRequest;
- (void)clamshellStateChanged:(id)a3;
- (void)completeAttemptIfNecessary;
- (void)completeAttemptPostNotification:(BOOL)a3;
- (void)connectionActivated;
- (void)consumeAuthTokenIfReady;
- (void)deviceConnected:(id)a3;
- (void)displayConfigChanged:(id)a3;
- (void)handleAWDLInfo:(id)a3;
- (void)handleAWDLUp;
- (void)handleAuthPromptResponse:(id)a3;
- (void)handleCanceledAfterSuccess;
- (void)handleConfirmationACK;
- (void)handleDecryptionFailure:(int64_t)a3;
- (void)handleMessageWithWrapper:(id)a3;
- (void)handlePeerFound:(BOOL)a3;
- (void)handlePeerInRange;
- (void)handlePeerOutOfRange;
- (void)handleRangingResults:(id)a3 errorCode:(int64_t)a4;
- (void)handleRangingStarted;
- (void)handleSessionAuthToken:(id)a3;
- (void)handleSessionKeyExchangeRequest:(id)a3;
- (void)handleTimerFired;
- (void)handleWiFiRequestInvalidated;
- (void)invalidate;
- (void)invalidateConfirmationTimer;
- (void)invalidateNoDisconnect;
- (void)invalidateTimerIfReady;
- (void)lockKeyBagIfNeeded;
- (void)logResults;
- (void)notifyDelegateWithError:(id)a3;
- (void)removeObservers;
- (void)restartConfirmationTimer:(unint64_t)a3 error:(id)a4;
- (void)sendAWDLInfoData:(id)a3 type:(unsigned __int16)a4 completionHandler:(id)a5;
- (void)sendAuthPromptImageDataIfReady:(id)a3;
- (void)sendAuthPromptRequestWithImageHash:(id)a3 appName:(id)a4;
- (void)sendKeyExchangeResponseWithData:(id)a3;
- (void)sendUnlockConfirmation:(BOOL)a3 withError:(id)a4;
- (void)sendUnlockConfirmation:(BOOL)a3 withError:(id)a4 suppressNotification:(BOOL)a5;
- (void)setAttemptPrewarmed:(BOOL)a3;
- (void)setAttemptStartDate:(id)a3;
- (void)setAttemptTime:(double)a3;
- (void)setAttemptTimedOut:(BOOL)a3;
- (void)setAutoUnlockDevice:(id)a3;
- (void)setAwdlInfoExchange:(double)a3;
- (void)setAwdlTotal:(double)a3;
- (void)setAwdlUp:(BOOL)a3;
- (void)setBluetoothID:(id)a3;
- (void)setBtBootstrap:(double)a3;
- (void)setBtOverall:(double)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setChosenDevice:(BOOL)a3;
- (void)setCompleteExchange:(double)a3;
- (void)setConfigChangeType:(int64_t)a3;
- (void)setConfirmation:(double)a3;
- (void)setConfirmationSendDate:(id)a3;
- (void)setConfirmationTimer:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setConnectedBluetoothDevices:(unint64_t)a3;
- (void)setConnectionDate:(id)a3;
- (void)setConnectionTime:(double)a3;
- (void)setConnectionWaitTime:(double)a3;
- (void)setDeviceWasLocked:(BOOL)a3;
- (void)setDiscoveryDate:(id)a3;
- (void)setDiscoveryTime:(double)a3;
- (void)setDisplayClamshellWaitTime:(double)a3;
- (void)setDisplayCount:(int64_t)a3;
- (void)setDisplayOrClamshellWaitingDate:(id)a3;
- (void)setDisplayTimer:(id)a3;
- (void)setDoNotPostUnlockConfirmation:(BOOL)a3;
- (void)setExchageResponseDate:(id)a3;
- (void)setExternalACMContext:(id)a3;
- (void)setFirstSend:(id)a3;
- (void)setFoundPeer:(BOOL)a3;
- (void)setIconTransferStore:(id)a3;
- (void)setImageData:(id)a3;
- (void)setImageDataAlreadyCached:(BOOL)a3;
- (void)setImageHash:(id)a3;
- (void)setKeyRequestExchange:(double)a3;
- (void)setLastSleepType:(int64_t)a3;
- (void)setLockedKeyBag:(BOOL)a3;
- (void)setNeedsNewImage:(BOOL)a3;
- (void)setOldWatch:(BOOL)a3;
- (void)setOnlyRanging:(BOOL)a3;
- (void)setOtherProviderCancel:(BOOL)a3;
- (void)setOtherSessionCancel:(BOOL)a3;
- (void)setPeerFoundInterval:(double)a3;
- (void)setPeerList:(id)a3;
- (void)setPeerMacAddress:(id)a3;
- (void)setPrewarmIdleStartDate:(id)a3;
- (void)setPrewarmIdleTime:(double)a3;
- (void)setPrewarmStartDate:(id)a3;
- (void)setProxyConnectionTime:(double)a3;
- (void)setProxyDeviceModel:(id)a3;
- (void)setProxyDiscoveryTime:(double)a3;
- (void)setProxyRSSI:(int)a3;
- (void)setReceivedAWDLInfo:(BOOL)a3;
- (void)setReceivedAuthPromptResponse:(BOOL)a3;
- (void)setReceivedExchangeRequest:(BOOL)a3;
- (void)setSendingConfirmation:(BOOL)a3;
- (void)setSentExchangeResponse:(BOOL)a3;
- (void)setSentImageData:(BOOL)a3;
- (void)setSessionAuthToken:(id)a3;
- (void)setShouldWaitToCompleteUnlock:(BOOL)a3;
- (void)setSupportsConfirmationACK:(BOOL)a3;
- (void)setTimeSinceLastMachineWake:(int64_t)a3;
- (void)setTokenExchange:(double)a3;
- (void)setUnlockSucceeded:(BOOL)a3;
- (void)setUseProxy:(BOOL)a3;
- (void)setWaitingForDisplayOrClamshell:(BOOL)a3;
- (void)setWaitingToCompleteUnlock:(BOOL)a3;
- (void)setWatchBuildVersion:(id)a3;
- (void)setWatchModelID:(id)a3;
- (void)setWatchOSVersion:(id)a3;
- (void)setWatchRSSI:(int)a3;
- (void)setWifiState:(BOOL)a3;
- (void)startAWDL;
- (void)tearDownAWDLIfNecessary;
- (void)updateImageData:(id)a3 imageHash:(id)a4;
@end

@implementation SDAutoUnlockLockSession

- (SDAutoUnlockLockSession)initWithAutoUnlockDevice:(id)a3 sessionID:(id)a4 bleDevice:(id)a5
{
  id v9 = a3;
  v10 = (NSString *)a4;
  id v11 = a5;
  v12 = [v9 uniqueID];
  v36.receiver = self;
  v36.super_class = (Class)SDAutoUnlockLockSession;
  v13 = [(SDAutoUnlockAuthSession *)&v36 initWithDevice:v12 sessionID:v10 bleDevice:v11];

  if (v13)
  {
    v14 = auto_unlock_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Creating lock session (session ID = %@)", buf, 0xCu);
    }

    v15 = +[SDAutoUnlockTransport sharedTransport];
    v16 = [(SDAutoUnlockPairingSession *)v13 deviceID];
    v17 = [v15 idsDeviceForUniqueID:v16];

    uint64_t v18 = [v9 modelIdentifier];
    watchModelID = v13->_watchModelID;
    v13->_watchModelID = (NSString *)v18;

    uint64_t v20 = [v9 productBuildVersion];
    watchBuildVersion = v13->_watchBuildVersion;
    v13->_watchBuildVersion = (NSString *)v20;

    id obj = a3;
    if (v17) {
      [v17 operatingSystemVersion:a3];
    }
    else {
      memset(v35, 0, sizeof(v35));
    }
    uint64_t v22 = sub_1000D2F74(v35);
    watchOSVersion = v13->_watchOSVersion;
    v13->_watchOSVersion = (NSString *)v22;

    v24 = +[SDAutoUnlockTransport sharedTransport];
    v25 = [(SDAutoUnlockPairingSession *)v13 deviceID];
    uint64_t v26 = [v24 modelIdentifierForDeviceID:v25];
    v27 = v13->_watchModelID;
    v13->_watchModelID = (NSString *)v26;

    v28 = auto_unlock_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v13->_watchModelID;
      v30 = v13->_watchBuildVersion;
      v31 = v13->_watchOSVersion;
      *(_DWORD *)buf = 138412802;
      v38 = v29;
      __int16 v39 = 2112;
      v40 = v30;
      __int16 v41 = 2112;
      v42 = v31;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Watch info (model ID: %@, build: %@, os version: %@)", buf, 0x20u);
    }

    [(SDAutoUnlockAuthSession *)v13 setProtocol:2];
    objc_storeStrong((id *)&v13->_autoUnlockDevice, obj);
    v13->_watchRSSI = [v11 rssi];
    v32 = +[SDStatusMonitor sharedMonitor];
    -[SDAutoUnlockLockSession setDeviceWasLocked:](v13, "setDeviceWasLocked:", [v32 deviceKeyBagUnlocked] ^ 1);

    [(SDAutoUnlockLockSession *)v13 addObservers];
  }

  return v13;
}

- (void)invalidate
{
  v9.receiver = self;
  v9.super_class = (Class)SDAutoUnlockLockSession;
  [(SDAutoUnlockAuthSession *)&v9 invalidate];
  [(SDAutoUnlockPairingSession *)self setDelegate:0];
  [(SDAutoUnlockLockSession *)self removeObservers];
  v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping BLE connection", buf, 2u);
  }

  v4 = +[SDNearbyAgent sharedNearbyAgent];
  v5 = [(SDAutoUnlockAuthSession *)self bleDevice];
  [v4 stopUnlockBLEConnectionWithDevice:v5];

  [(SDAutoUnlockLockSession *)self setWaitingForDisplayOrClamshell:0];
  v6 = +[SDStatusMonitor sharedMonitor];
  [v6 removePreventExitForLocaleReason:@"AutoUnlockConfirmationTimerPreventExitReason"];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023A118;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)invalidateNoDisconnect
{
  v2.receiver = self;
  v2.super_class = (Class)SDAutoUnlockLockSession;
  [(SDAutoUnlockAuthSession *)&v2 invalidate];
}

- (void)completeAttemptIfNecessary
{
  v3 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023A250;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)tearDownAWDLIfNecessary
{
  v3 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023A3D8;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)cancel
{
  v3 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023A58C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_cancel
{
  if (![(SDAutoUnlockLockSession *)self canceled])
  {
    [(SDAutoUnlockLockSession *)self setCanceled:1];
    unsigned __int8 v3 = [(SDAutoUnlockLockSession *)self unlockSucceeded];
    v4 = auto_unlock_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (!v5)
      {
LABEL_11:

        return;
      }
      v6 = [(SDAutoUnlockPairingSession *)self deviceID];
      v7 = [(SDAutoUnlockPairingSession *)self sessionID];
      v8 = [v7 UUIDString];
      *(_DWORD *)buf = 138412546;
      v19 = v6;
      __int16 v20 = 2112;
      v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Lock session canceled after success (device ID: %@, session ID: %@)", buf, 0x16u);
    }
    else
    {
      if (v5)
      {
        objc_super v9 = [(SDAutoUnlockPairingSession *)self deviceID];
        v10 = [(SDAutoUnlockPairingSession *)self sessionID];
        id v11 = [v10 UUIDString];
        *(_DWORD *)buf = 138412546;
        v19 = v9;
        __int16 v20 = 2112;
        v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Lock session canceled (device ID: %@, session ID: %@)", buf, 0x16u);
      }
      if ([(SDAutoUnlockLockSession *)self otherSessionCancel])
      {
        uint64_t v12 = SFAutoUnlockErrorDomain;
        NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
        CFStringRef v17 = @"Attempt Cancelled";
        v4 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
        v6 = +[NSError errorWithDomain:v12 code:118 userInfo:v4];
        [(SDAutoUnlockLockSession *)self notifyDelegateWithError:v6];
      }
      else
      {
        [(SDAutoUnlockLockSession *)self lockKeyBagIfNeeded];
        uint64_t v13 = SFAutoUnlockErrorDomain;
        NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
        CFStringRef v15 = @"Attempt Cancelled";
        v4 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
        v6 = +[NSError errorWithDomain:v13 code:118 userInfo:v4];
        [(SDAutoUnlockLockSession *)self sendUnlockConfirmation:0 withError:v6];
      }
    }

    goto LABEL_11;
  }
}

- (void)cancelWiFiRequest
{
  unsigned __int8 v3 = [(SDAutoUnlockAuthSession *)self wifiRequest];

  v4 = auto_unlock_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = [(SDAutoUnlockAuthSession *)self wifiRequest];
      *(_DWORD *)buf = 138412290;
      objc_super v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Canceling WiFi request: %@", buf, 0xCu);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10023A998;
    block[3] = &unk_1008CA4B8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not Canceling WiFi request: nil", buf, 2u);
    }
  }
}

- (void)lockKeyBagIfNeeded
{
  if (![(SDAutoUnlockLockSession *)self lockedKeyBag]
    && ![(SDAutoUnlockLockSession *)self otherProviderCancel])
  {
    id v4 = +[SDStatusMonitor sharedMonitor];
    if ([v4 deviceKeyBagUnlocked]
      && [(SDAutoUnlockLockSession *)self deviceWasLocked])
    {
      unsigned int v3 = [(SDAutoUnlockAuthSession *)self aksSuccess];

      if (v3)
      {
        [(SDAutoUnlockLockSession *)self setLockedKeyBag:1];
        sub_10001CC04();
      }
    }
    else
    {
    }
  }
}

- (void)handleCanceledAfterSuccess
{
  unsigned int v3 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023AB64;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_handleCanceledAfterSuccess
{
  if ([(SDAutoUnlockLockSession *)self unlockSucceeded])
  {
    [(SDAutoUnlockLockSession *)self setCanceled:1];
    [(SDAutoUnlockAuthSession *)self setErrorType:14];
    unsigned int v3 = auto_unlock_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Handling cancel at end", buf, 2u);
    }

    [(SDAutoUnlockLockSession *)self lockKeyBagIfNeeded];
  }
  else
  {
    id v4 = auto_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not cancelled", v5, 2u);
    }
  }
}

- (void)handleDecryptionFailure:(int64_t)a3
{
  if (![(SDAutoUnlockLockSession *)self canceled]
    && ![(SDAutoUnlockLockSession *)self unlockSucceeded])
  {
    switch(a3)
    {
      case 191:
        CFStringRef v5 = @"Watch Missing Encryption Key";
        break;
      case 198:
        CFStringRef v5 = @"Watch Missing IDS Device For BT UUID";
        break;
      case 195:
        CFStringRef v5 = @"Watch Not First Unlocked";
        break;
      default:
        CFStringRef v5 = @"Decryption failure";
        break;
    }
    uint64_t v6 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    CFStringRef v10 = v5;
    v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    v8 = +[NSError errorWithDomain:v6 code:a3 userInfo:v7];

    [(SDAutoUnlockLockSession *)self notifyDelegateWithError:v8];
  }
}

- (void)addObservers
{
  unsigned int v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"deviceConnected:" name:SFBluetoothNotificationNameConnected object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"displayConfigChanged:" name:@"com.apple.sharingd.ExternalDisplaysChanged" object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"clamshellStateChanged:" name:@"com.apple.sharingd.ClamshellStatusChanged" object:0];
}

- (void)removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)clamshellStateChanged:(id)a3
{
  if ([(SDAutoUnlockLockSession *)self waitingForDisplayOrClamshell])
  {
    [(SDAutoUnlockLockSession *)self setConfigChangeType:1];
    id v4 = auto_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clamshell changed", v5, 2u);
    }

    [(SDAutoUnlockLockSession *)self consumeAuthTokenIfReady];
  }
}

- (void)displayConfigChanged:(id)a3
{
  if ([(SDAutoUnlockLockSession *)self waitingForDisplayOrClamshell])
  {
    [(SDAutoUnlockLockSession *)self setConfigChangeType:2];
    id v4 = auto_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Display config changed", v5, 2u);
    }

    [(SDAutoUnlockLockSession *)self consumeAuthTokenIfReady];
  }
}

- (void)logResults
{
  unsigned int v3 = [(SDAutoUnlockLockSession *)self attemptTimedOut];
  id v4 = auto_unlock_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v84) = 0;
      uint64_t v6 = "Attempt timed out for session";
      v7 = v4;
      uint32_t v8 = 2;
LABEL_84:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v84, v8);
    }
  }
  else
  {
    if (v5)
    {
      unsigned int v9 = [(SDAutoUnlockLockSession *)self usingProxy];
      *(double *)&CFStringRef v10 = COERCE_DOUBLE(@"YES");
      if (!v9) {
        *(double *)&CFStringRef v10 = COERCE_DOUBLE(@"NO");
      }
      int v84 = 138412290;
      double v85 = *(double *)&v10;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Automation: Used Proxy Device %@", (uint8_t *)&v84, 0xCu);
    }

    id v11 = auto_unlock_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      double v12 = [(SDAutoUnlockLockSession *)self watchModelID];
      int v84 = 138412290;
      double v85 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Automation: Key Device Model %@", (uint8_t *)&v84, 0xCu);
    }
    uint64_t v13 = auto_unlock_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = [(SDAutoUnlockLockSession *)self proxyDeviceModel];
      int v84 = 138412290;
      double v85 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Automation: Proxy Device Model %@", (uint8_t *)&v84, 0xCu);
    }
    CFStringRef v15 = auto_unlock_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      [(SDAutoUnlockLockSession *)self proxyDiscoveryTime];
      int v84 = 134217984;
      double v85 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Automation: Phone Bluetooth Discovery %0.2fs", (uint8_t *)&v84, 0xCu);
    }

    CFStringRef v17 = auto_unlock_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      [(SDAutoUnlockLockSession *)self proxyConnectionTime];
      int v84 = 134217984;
      double v85 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Automation: Phone Connection Time %0.2fs", (uint8_t *)&v84, 0xCu);
    }

    v19 = auto_unlock_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      [(SDAutoUnlockLockSession *)self discoveryTime];
      if (v20 == 0.0)
      {
        double v26 = 0.0;
      }
      else
      {
        [(SDAutoUnlockLockSession *)self discoveryTime];
        double v22 = v21;
        [(SDAutoUnlockLockSession *)self proxyDiscoveryTime];
        double v24 = v22 - v23;
        [(SDAutoUnlockLockSession *)self proxyConnectionTime];
        double v26 = v24 - v25;
      }
      int v84 = 134217984;
      double v85 = v26;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Automation: Watch Bluetooth Discovery %0.2fs", (uint8_t *)&v84, 0xCu);
    }

    v27 = auto_unlock_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      [(SDAutoUnlockLockSession *)self connectionWaitTime];
      int v84 = 134217984;
      double v85 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Automation: Watch Connection Wait Time %0.2fs", (uint8_t *)&v84, 0xCu);
    }

    v29 = auto_unlock_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      [(SDAutoUnlockLockSession *)self connectionTime];
      int v84 = 134217984;
      double v85 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Automation: Watch Connection Time %0.2fs", (uint8_t *)&v84, 0xCu);
    }

    v31 = auto_unlock_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      [(SDAutoUnlockLockSession *)self awdlInfoExchange];
      int v84 = 134217984;
      double v85 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Automation: Bluetooth Info Exchange %0.2fs", (uint8_t *)&v84, 0xCu);
    }

    v33 = auto_unlock_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      [(SDAutoUnlockLockSession *)self keyRequestExchange];
      int v84 = 134217984;
      double v85 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Automation: Bluetooth Key Exchange %0.2fs", (uint8_t *)&v84, 0xCu);
    }

    v35 = auto_unlock_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      [(SDAutoUnlockLockSession *)self tokenExchange];
      int v84 = 134217984;
      double v85 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Automation: Bluetooth Token Exchange %0.2fs", (uint8_t *)&v84, 0xCu);
    }

    v37 = auto_unlock_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      [(SDAutoUnlockLockSession *)self confirmation];
      int v84 = 134217984;
      double v85 = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Automation: Bluetooth Unlock Confirmation %0.2fs", (uint8_t *)&v84, 0xCu);
    }

    __int16 v39 = auto_unlock_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      [(SDAutoUnlockAuthSession *)self awdlInterval];
      int v84 = 134217984;
      double v85 = v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Automation: AWDL Bring Up %0.2fs", (uint8_t *)&v84, 0xCu);
    }

    __int16 v41 = auto_unlock_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      [(SDAutoUnlockLockSession *)self peerFoundInterval];
      int v84 = 134217984;
      double v85 = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Automation: Peer Found %0.2fs", (uint8_t *)&v84, 0xCu);
    }

    v43 = auto_unlock_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      [(SDAutoUnlockAuthSession *)self rangingInterval];
      int v84 = 134217984;
      double v85 = v44;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Automation: Ranging Results %0.2fs", (uint8_t *)&v84, 0xCu);
    }

    v45 = auto_unlock_log();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v46 = [(SDAutoUnlockLockSession *)self configChangeType];
      double v47 = 0.0;
      if (v46 == 2) {
        [(SDAutoUnlockLockSession *)self displayClamshellWaitTime];
      }
      int v84 = 134217984;
      double v85 = v47;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Automation: Time Waiting For Display %0.2f", (uint8_t *)&v84, 0xCu);
    }

    v48 = auto_unlock_log();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v49 = [(SDAutoUnlockLockSession *)self configChangeType];
      double v50 = 0.0;
      if (v49 == 1) {
        [(SDAutoUnlockLockSession *)self displayClamshellWaitTime];
      }
      int v84 = 134217984;
      double v85 = v50;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Automation: Time Waiting For Clamshell %0.2f", (uint8_t *)&v84, 0xCu);
    }

    v51 = auto_unlock_log();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      [(SDAutoUnlockLockSession *)self awdlTotal];
      int v84 = 134217984;
      double v85 = v52;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Automation: Wi-Fi Total %0.2fs", (uint8_t *)&v84, 0xCu);
    }

    v53 = auto_unlock_log();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      [(SDAutoUnlockLockSession *)self btBootstrap];
      int v84 = 134217984;
      double v85 = v54;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Automation: Bluetooth Bootstrap Total %0.2fs", (uint8_t *)&v84, 0xCu);
    }

    v55 = auto_unlock_log();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      [(SDAutoUnlockLockSession *)self btBootstrap];
      double v57 = v56;
      [(SDAutoUnlockLockSession *)self awdlTotal];
      double v59 = v57 + v58;
      [(SDAutoUnlockLockSession *)self confirmation];
      int v84 = 134217984;
      double v85 = v59 + v60;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Automation: Bootstrap + Wi-Fi Total + Confirmation %0.2fs", (uint8_t *)&v84, 0xCu);
    }

    v61 = auto_unlock_log();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      [(SDAutoUnlockLockSession *)self btOverall];
      int v84 = 134217984;
      double v85 = v62;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Automation: Bluetooth Overall Total %0.2fs", (uint8_t *)&v84, 0xCu);
    }

    if ([(SDAutoUnlockLockSession *)self attemptPrewarmed])
    {
      v63 = auto_unlock_log();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        [(SDAutoUnlockLockSession *)self prewarmIdleTime];
        int v84 = 134217984;
        double v85 = v64;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Automation: Idle time due to prewarming %0.2fs", (uint8_t *)&v84, 0xCu);
      }
    }
    v65 = auto_unlock_log();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      [(SDAutoUnlockLockSession *)self completeExchange];
      int v84 = 134217984;
      double v85 = v66;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Automation: Complete exchange %0.2fs", (uint8_t *)&v84, 0xCu);
    }

    v67 = auto_unlock_log();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v68 = [(SDAutoUnlockLockSession *)self watchRSSI];
      int v84 = 67109120;
      LODWORD(v85) = v68;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Automation: Key Device RSSI %d", (uint8_t *)&v84, 8u);
    }

    v69 = auto_unlock_log();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v70 = [(SDAutoUnlockLockSession *)self proxyRSSI];
      int v84 = 67109120;
      LODWORD(v85) = v70;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Automation: Proxy Device RSSI %d", (uint8_t *)&v84, 8u);
    }

    v71 = auto_unlock_log();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v72 = [(SDAutoUnlockAuthSession *)self shouldUnlock];
      *(double *)&CFStringRef v73 = COERCE_DOUBLE(@"YES");
      if (!v72) {
        *(double *)&CFStringRef v73 = COERCE_DOUBLE(@"NO");
      }
      int v84 = 138412290;
      double v85 = *(double *)&v73;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Automation: Within Range %@", (uint8_t *)&v84, 0xCu);
    }

    v74 = auto_unlock_log();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v75 = [(SDAutoUnlockLockSession *)self connectedBluetoothDevices];
      int v84 = 67109120;
      LODWORD(v85) = v75;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Automation: Already Connected Bluetooth Devices %d", (uint8_t *)&v84, 8u);
    }

    v76 = auto_unlock_log();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      *(double *)&int64_t v77 = COERCE_DOUBLE((id)[(SDAutoUnlockLockSession *)self timeSinceLastMachineWake]);
      int v84 = 134217984;
      double v85 = *(double *)&v77;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Automation: Time Since Last Wake %ld seconds", (uint8_t *)&v84, 0xCu);
    }

    v78 = auto_unlock_log();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      [(SDAutoUnlockLockSession *)self lastSleepType];
      sub_1000D35C4();
      double v79 = COERCE_DOUBLE((id)objc_claimAutoreleasedReturnValue());
      int v84 = 138412290;
      double v85 = v79;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Automation: Last Sleep Type %@", (uint8_t *)&v84, 0xCu);
    }
    v80 = auto_unlock_log();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v81 = [(SDAutoUnlockLockSession *)self canceled];
      *(double *)&CFStringRef v82 = COERCE_DOUBLE(@"YES");
      if (!v81) {
        *(double *)&CFStringRef v82 = COERCE_DOUBLE(@"NO");
      }
      int v84 = 138412290;
      double v85 = *(double *)&v82;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Automation: Cancelled %@", (uint8_t *)&v84, 0xCu);
    }

    id v4 = auto_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(double *)&CFStringRef v83 = COERCE_DOUBLE(@"NO");
      if ([(SDAutoUnlockLockSession *)self unlockSucceeded]
        && ![(SDAutoUnlockLockSession *)self canceled])
      {
        *(double *)&CFStringRef v83 = COERCE_DOUBLE(@"YES");
      }
      int v84 = 138412290;
      double v85 = *(double *)&v83;
      uint64_t v6 = "Automation: Successful Session %@";
      v7 = v4;
      uint32_t v8 = 12;
      goto LABEL_84;
    }
  }
}

- (id)attemptResults
{
  unsigned int v3 = objc_opt_new();
  id v4 = [(SDAutoUnlockPairingSession *)self deviceID];
  [v3 setObject:v4 forKeyedSubscript:SDAutoUnlockManagerMetricDeviceIDKey];

  BOOL v5 = [(SDAutoUnlockLockSession *)self watchModelID];
  [v3 setObject:v5 forKeyedSubscript:SDAutoUnlockManagerMetricKeyDeviceModelKey];

  uint64_t v6 = [(SDAutoUnlockLockSession *)self watchBuildVersion];
  [v3 setObject:v6 forKeyedSubscript:SDAutoUnlockManagerMetricWatchBuildVersionKey];

  v7 = [(SDAutoUnlockLockSession *)self watchOSVersion];
  [v3 setObject:v7 forKeyedSubscript:SDAutoUnlockManagerMetricWatchOSVersionKey];

  uint32_t v8 = [(SDAutoUnlockLockSession *)self proxyDeviceModel];

  if (v8)
  {
    unsigned int v9 = [(SDAutoUnlockLockSession *)self proxyDeviceModel];
    [v3 setObject:v9 forKeyedSubscript:SDAutoUnlockManagerMetricProxyDeviceModelKey];
  }
  CFStringRef v10 = +[NSNumber numberWithBool:[(SDAutoUnlockLockSession *)self usingProxy]];
  [v3 setObject:v10 forKeyedSubscript:SDAutoUnlockManagerMetricUsingProxyDeviceKey];

  [(SDAutoUnlockLockSession *)self discoveryTime];
  if (v11 == 0.0)
  {
    [v3 setObject:&off_100903330 forKeyedSubscript:SDAutoUnlockManagerMetricBluetoothKeyDeviceDiscoveryKey];
  }
  else
  {
    [(SDAutoUnlockLockSession *)self discoveryTime];
    double v13 = v12;
    [(SDAutoUnlockLockSession *)self proxyDiscoveryTime];
    double v15 = v13 - v14;
    [(SDAutoUnlockLockSession *)self proxyConnectionTime];
    CFStringRef v17 = +[NSNumber numberWithDouble:v15 - v16];
    [v3 setObject:v17 forKeyedSubscript:SDAutoUnlockManagerMetricBluetoothKeyDeviceDiscoveryKey];
  }
  [(SDAutoUnlockLockSession *)self proxyDiscoveryTime];
  double v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v18 forKeyedSubscript:SDAutoUnlockManagerMetricBluetoothProxyDeviceDiscoveryKey];

  [(SDAutoUnlockLockSession *)self connectionTime];
  v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v19 forKeyedSubscript:SDAutoUnlockManagerMetricBluetoothKeyConnectionKey];

  [(SDAutoUnlockLockSession *)self proxyConnectionTime];
  double v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v20 forKeyedSubscript:SDAutoUnlockManagerMetricBluetoothProxyConnectionKey];

  [(SDAutoUnlockLockSession *)self awdlInfoExchange];
  double v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v21 forKeyedSubscript:SDAutoUnlockManagerMetricBluetoothAWDLExchangeKey];

  [(SDAutoUnlockLockSession *)self keyRequestExchange];
  double v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v22 forKeyedSubscript:SDAutoUnlockManagerMetricBluetoothKeyRequestExchangeKey];

  [(SDAutoUnlockLockSession *)self tokenExchange];
  double v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v23 forKeyedSubscript:SDAutoUnlockManagerMetricBluetoothTokenExchangeKey];

  [(SDAutoUnlockLockSession *)self confirmation];
  double v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v24 forKeyedSubscript:SDAutoUnlockManagerMetricBluetoothConfirmationKey];

  if ([(SDAutoUnlockLockSession *)self unlockSucceeded]) {
    uint64_t v25 = [(SDAutoUnlockLockSession *)self canceled] ^ 1;
  }
  else {
    uint64_t v25 = 0;
  }
  double v26 = +[NSNumber numberWithInt:v25];
  [v3 setObject:v26 forKeyedSubscript:SDAutoUnlockManagerMetricSuccessKey];

  [(SDAutoUnlockAuthSession *)self awdlInterval];
  v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v27 forKeyedSubscript:SDAutoUnlockManagerMetricAWDLBringUpKey];

  [(SDAutoUnlockLockSession *)self peerFoundInterval];
  double v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v28 forKeyedSubscript:SDAutoUnlockManagerMetricAWDLPeerFoundKey];

  [(SDAutoUnlockAuthSession *)self rangingInterval];
  v29 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v29 forKeyedSubscript:SDAutoUnlockManagerMetricAWDLRangingKey];

  if ((id)[(SDAutoUnlockLockSession *)self configChangeType] == (id)2)
  {
    double v30 = &SDAutoUnlockManagerMetricDisplayWaitKey;
  }
  else
  {
    if ((id)[(SDAutoUnlockLockSession *)self configChangeType] != (id)1) {
      goto LABEL_14;
    }
    double v30 = &SDAutoUnlockManagerMetricClamshellWaitKey;
  }
  [(SDAutoUnlockLockSession *)self displayClamshellWaitTime];
  v31 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v31 forKeyedSubscript:*v30];

LABEL_14:
  double v32 = [(SDAutoUnlockAuthSession *)self attemptError];

  if (v32)
  {
    v33 = [(SDAutoUnlockAuthSession *)self attemptError];
    double v34 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v33 code]);
    [v3 setObject:v34 forKeyedSubscript:SDAutoUnlockManagerMetricErrorCodeKey];

    v35 = [(SDAutoUnlockAuthSession *)self attemptError];
    double v36 = [v35 domain];
    [v3 setObject:v36 forKeyedSubscript:SDAutoUnlockManagerMetricErrorDomainKey];

    v37 = [(SDAutoUnlockAuthSession *)self attemptError];
    double v38 = [v37 localizedDescription];
    [v3 setObject:v38 forKeyedSubscript:SDAutoUnlockManagerMetricErrorStringKey];
  }
  __int16 v39 = +[NSNumber numberWithInteger:[(SDAutoUnlockAuthSession *)self errorType]];
  [v3 setObject:v39 forKeyedSubscript:SDAutoUnlockManagerMetricErrorTypeKey];

  double v40 = +[NSNumber numberWithInt:[(SDAutoUnlockLockSession *)self watchRSSI]];
  [v3 setObject:v40 forKeyedSubscript:SDAutoUnlockManagerMetricKeyDeviceRSSIKey];

  if ([(SDAutoUnlockLockSession *)self proxyRSSI])
  {
    __int16 v41 = +[NSNumber numberWithInt:[(SDAutoUnlockLockSession *)self proxyRSSI]];
    [v3 setObject:v41 forKeyedSubscript:SDAutoUnlockManagerMetricProxyDeviceRSSIKey];
  }
  double v42 = [(SDAutoUnlockAuthSession *)self distance];
  [v3 setObject:v42 forKeyedSubscript:SDAutoUnlockManagerMetricDistanceKey];

  v43 = +[NSNumber numberWithBool:[(SDAutoUnlockAuthSession *)self shouldUnlock]];
  [v3 setObject:v43 forKeyedSubscript:SDAutoUnlockManagerMetricWithinRangeKey];

  double v44 = +[NSNumber numberWithBool:[(SDAutoUnlockLockSession *)self attemptPrewarmed]];
  [v3 setObject:v44 forKeyedSubscript:SDAutoUnlockManagerMetricPrewarmKey];

  [(SDAutoUnlockLockSession *)self prewarmIdleTime];
  v45 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v45 forKeyedSubscript:SDAutoUnlockManagerMetricPrewarmTimeKey];

  [(SDAutoUnlockLockSession *)self attemptTime];
  int64_t v46 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v46 forKeyedSubscript:SDAutoUnlockManagerMetricAttemptTimeKey];

  [(SDAutoUnlockLockSession *)self completeExchange];
  double v47 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v47 forKeyedSubscript:SDAutoUnlockManagerMetricTimeKey];

  v48 = [(SDAutoUnlockAuthSession *)self wifiRangingResults];
  [v3 setObject:v48 forKeyedSubscript:SDAutoUnlockManagerMetricWiFiResultsKey];

  int64_t v49 = +[NSNumber numberWithUnsignedInteger:[(SDAutoUnlockLockSession *)self connectedBluetoothDevices]];
  [v3 setObject:v49 forKeyedSubscript:SDAutoUnlockManagerMetricConnectedBluetoothDevicesKey];

  double v50 = +[NSNumber numberWithInteger:[(SDAutoUnlockLockSession *)self timeSinceLastMachineWake]];
  [v3 setObject:v50 forKeyedSubscript:SDAutoUnlockManagerMetricTimeSinceLastWakeKey];

  v51 = +[NSNumber numberWithInteger:[(SDAutoUnlockLockSession *)self lastSleepType]];
  [v3 setObject:v51 forKeyedSubscript:SDAutoUnlockManagerMetricLastSleepTypeKey];

  return v3;
}

- (BOOL)isAcceptor
{
  return 0;
}

- (id)hintToken
{
  if ((id)[(SDAutoUnlockAuthSession *)self attemptType] == (id)2
    && ([(SDAutoUnlockPairingSession *)self aksSession],
        unsigned int v3 = objc_claimAutoreleasedReturnValue(),
        unsigned int v4 = [v3 sessionIsValid],
        v3,
        v4))
  {
    BOOL v5 = [(SDAutoUnlockPairingSession *)self aksSession];
    uint64_t v6 = [v5 generateACMContextData];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)usingProxy
{
  unsigned int v3 = [(SDAutoUnlockLockSession *)self autoUnlockDevice];
  if ([v3 supportsAlwaysDirect])
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v5 = [(SDAutoUnlockLockSession *)self proxyDeviceModel];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (id)getAppName
{
  return 0;
}

- (void)updateImageData:(id)a3 imageHash:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((id)[(SDAutoUnlockAuthSession *)self attemptType] == (id)2)
  {
    uint32_t v8 = SFMainQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10023C678;
    block[3] = &unk_1008CAF18;
    block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    unsigned int v9 = auto_unlock_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1002430F8();
    }
  }
}

- (void)setChosenDevice:(BOOL)a3
{
  BOOL v5 = SFMainQueue();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10023C964;
  v6[3] = &unk_1008CB9D8;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (void)setAttemptPrewarmed:(BOOL)a3
{
  BOOL v5 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10023CB20;
  v6[3] = &unk_1008CB9D8;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (void)setDoNotPostUnlockConfirmation:(BOOL)a3
{
  BOOL v5 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10023CBD8;
  v6[3] = &unk_1008CB9D8;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (void)connectionActivated
{
  kdebug_trace();
  if ([(SDAutoUnlockAuthSession *)self useAKSToken])
  {
    unsigned int v3 = +[SDAutoUnlockAKSManager sharedManager];
    BOOL v4 = [(SDAutoUnlockPairingSession *)self deviceID];
    -[SDAutoUnlockAuthSession setUseAKSToken:](self, "setUseAKSToken:", [v3 canCreateTokenSessionForDeviceID:v4]);

    BOOL v5 = auto_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unable to create token session, using escrow", v9, 2u);
    }
  }
  id v6 = +[NSDate date];
  [(SDAutoUnlockLockSession *)self setFirstSend:v6];

  if ((id)[(SDAutoUnlockAuthSession *)self attemptType] == (id)1
    || ([(SDAutoUnlockLockSession *)self autoUnlockDevice],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 supportsApproveIcon],
        v7,
        (v8 & 1) == 0))
  {
    [(SDAutoUnlockAuthSession *)self sendAWDLInfo];
    [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8((double)35)];
  }
}

- (BOOL)handleFoundBLEDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1000D2224(v4);
  LOBYTE(self) = [(SDAutoUnlockLockSession *)self handleFoundBLEDevice:v4 available:v5 lockedOnWrist:sub_1000D2284(v4)];

  return (char)self;
}

- (BOOL)handleFoundBLEDevice:(id)a3 available:(BOOL)a4 lockedOnWrist:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  unsigned __int8 v8 = auto_unlock_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    if (v5) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    id v11 = [(SDAutoUnlockLockSession *)self autoUnlockDevice];
    *(_DWORD *)buf = 138412802;
    CFStringRef v26 = v9;
    __int16 v27 = 2112;
    CFStringRef v28 = v10;
    __int16 v29 = 2112;
    double v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found Device {\n\tavailable: %@,\n\tlocked on wrist: %@\n\tdevice:%@\n}", buf, 0x20u);
  }
  id v12 = [(SDAutoUnlockLockSession *)self discoveryDate];

  if (!v12)
  {
    double v14 = +[NSDate date];
    [(SDAutoUnlockLockSession *)self setDiscoveryDate:v14];

    double v15 = [(SDAutoUnlockLockSession *)self aksPeerAvailable];
    if (v15)
    {
      [(SDAutoUnlockLockSession *)self notifyDelegateWithError:v15];
    }
    else
    {
      if (v6)
      {
        BOOL v13 = 1;
        [(SDAutoUnlockLockSession *)self setFoundPeer:1];
        double v16 = [(SDAutoUnlockPairingSession *)self delegate];
        [v16 sessionDidStartConnection:self];

LABEL_20:
        return v13;
      }
      if (v5)
      {
        SFLocalizedStringForKey();
        CFStringRef v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v18 = 135;
      }
      else
      {
        CFStringRef v17 = @"Watch Not On Wrist";
        uint64_t v18 = 158;
      }
      uint64_t v19 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
      double v24 = v17;
      double v20 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      double v21 = +[NSError errorWithDomain:v19 code:v18 userInfo:v20];
      [(SDAutoUnlockLockSession *)self notifyDelegateWithError:v21];
    }
    BOOL v13 = 0;
    goto LABEL_20;
  }
  return 1;
}

- (void)deviceConnected:(id)a3
{
  id v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKeyedSubscript:SFBluetoothNotificationKeyPeerDevice];
  BOOL v6 = [v5 identifier];
  BOOL v7 = [(SDAutoUnlockAuthSession *)self bleDevice];
  unsigned __int8 v8 = [v7 identifier];
  unsigned int v9 = [v6 isEqual:v8];

  if (v9)
  {
    CFStringRef v10 = +[NSDate date];
    [(SDAutoUnlockLockSession *)self setConnectionDate:v10];

    id v11 = [v4 objectForKeyedSubscript:SFBluetoothNotificationKeyConnectStart];
    [v11 doubleValue];
    double v13 = v12;

    double v14 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v13];
    double v15 = [(SDAutoUnlockLockSession *)self discoveryDate];
    [v15 timeIntervalSinceDate:v14];
    -[SDAutoUnlockLockSession setDiscoveryTime:](self, "setDiscoveryTime:");

    double v16 = [(SDAutoUnlockLockSession *)self discoveryDate];

    if (v16)
    {
      CFStringRef v17 = [(SDAutoUnlockLockSession *)self discoveryDate];
      [v17 timeIntervalSinceDate:v14];
      -[SDAutoUnlockLockSession setDiscoveryTime:](self, "setDiscoveryTime:");

      uint64_t v18 = [v4 objectForKeyedSubscript:SFBluetoothNotificationKeyConnectTime];
      [v18 doubleValue];
      double v20 = v19;
      [(SDAutoUnlockLockSession *)self discoveryTime];
      double v22 = v20 - v21;
    }
    else
    {
      uint64_t v18 = [v4 objectForKeyedSubscript:SFBluetoothNotificationKeyConnectTime];
      [v18 doubleValue];
    }
    [(SDAutoUnlockLockSession *)self setConnectionTime:v22];

    NSErrorUserInfoKey v23 = [(SDAutoUnlockLockSession *)self attemptStartDate];
    [v14 timeIntervalSinceDate:v23];
    -[SDAutoUnlockLockSession setConnectionWaitTime:](self, "setConnectionWaitTime:");

    [(SDAutoUnlockAuthSession *)self setErrorType:9];
    [(SDAutoUnlockLockSession *)self setConnected:1];
    double v24 = auto_unlock_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412290;
      CFStringRef v26 = v5;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Device connected %@", (uint8_t *)&v25, 0xCu);
    }
  }
}

- (id)aksPeerAvailable
{
  unsigned int v3 = +[SDAutoUnlockAKSManager sharedManager];
  id v4 = [(SDAutoUnlockPairingSession *)self deviceID];
  BOOL v5 = [v3 remoteLTKForDeviceID:v4];

  uint64_t v6 = sub_10001D4C4(v5);
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v8 = v6;
    unsigned int v9 = auto_unlock_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v10 = sub_10001D9A8(v8);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Peer not available %@", buf, 0xCu);
    }
    id v11 = sub_1000D0418();
    uint64_t v12 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    double v16 = v11;
    double v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    BOOL v7 = +[NSError errorWithDomain:v12 code:128 userInfo:v13];
  }

  return v7;
}

- (void)invalidateTimerIfReady
{
  if ([(SDAutoUnlockLockSession *)self receivedAWDLInfo]
    && [(SDAutoUnlockLockSession *)self receivedExchangeRequest])
  {
    [(SDAutoUnlockPairingSession *)self invalidateResponseTimer];
  }
}

- (void)handleTimerFired
{
  unsigned int v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Timer fired", buf, 2u);
  }

  if ([(SDAutoUnlockLockSession *)self onlyRanging])
  {
    id v4 = SFAutoUnlockErrorDomain;
    BOOL v5 = [(SDAutoUnlockAuthSession *)self startAWDLError];

    if (v5)
    {
      uint64_t v6 = [(SDAutoUnlockAuthSession *)self startAWDLError];
      uint64_t v7 = (uint64_t)[v6 code];

      uint64_t v8 = [(SDAutoUnlockAuthSession *)self startAWDLError];
      uint64_t v9 = [v8 domain];

      CFStringRef v10 = @"Failed to Start AWDL";
      id v4 = (id)v9;
    }
    else
    {
      CFStringRef v17 = [(SDAutoUnlockAuthSession *)self rangingStart];

      if (v17)
      {
        CFStringRef v10 = @"Ranging Timeout: Results Not Returned";
        uint64_t v7 = 137;
      }
      else
      {
        [(SDAutoUnlockAuthSession *)self setErrorType:6];
        CFStringRef v10 = @"Ranging Timeout: Couldn’t Find Peer";
        uint64_t v7 = 138;
      }
    }
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    CFStringRef v29 = v10;
    double v20 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    double v21 = +[NSError errorWithDomain:v4 code:v7 userInfo:v20];

    [(SDAutoUnlockLockSession *)self sendUnlockConfirmation:0 withError:v21];
  }
  else
  {
    if ([(SDAutoUnlockLockSession *)self waitingForDisplayOrClamshell])
    {
      id v11 = auto_unlock_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Timeout while waiting for a display or clamshell", buf, 2u);
      }

      uint64_t v12 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      CFStringRef v27 = @"Mac Clamshelled Without Display";
      double v13 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      double v14 = +[NSError errorWithDomain:v12 code:145 userInfo:v13];

      [(SDAutoUnlockLockSession *)self sendUnlockConfirmation:0 withError:v14];
      [(SDAutoUnlockLockSession *)self setWaitingForDisplayOrClamshell:0];
      NSErrorUserInfoKey v15 = objc_opt_new();
      double v16 = [(SDAutoUnlockLockSession *)self displayOrClamshellWaitingDate];
      [v15 timeIntervalSinceDate:v16];
      -[SDAutoUnlockLockSession setDisplayClamshellWaitTime:](self, "setDisplayClamshellWaitTime:");
    }
    else
    {
      if ([(SDAutoUnlockLockSession *)self foundPeer])
      {
        [(SDAutoUnlockAuthSession *)self setErrorType:3];
        v22.receiver = self;
        v22.super_class = (Class)SDAutoUnlockLockSession;
        [(SDAutoUnlockPairingSession *)&v22 handleTimerFired];
        return;
      }
      uint64_t v18 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
      CFStringRef v25 = @"Apple Watch Not Found";
      double v19 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      double v14 = +[NSError errorWithDomain:v18 code:131 userInfo:v19];

      [(SDAutoUnlockLockSession *)self notifyDelegateWithError:v14];
    }
  }
}

- (void)restartConfirmationTimer:(unint64_t)a3 error:(id)a4
{
  id v6 = a4;
  uint64_t v7 = auto_unlock_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Restarting confirmation timer", buf, 2u);
  }

  uint64_t v8 = [(SDAutoUnlockLockSession *)self confirmationTimer];

  if (!v8)
  {
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    id v9 = &_dispatch_main_q;
    double v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    NSErrorUserInfoKey v15 = sub_10023DA20;
    double v16 = &unk_1008CA248;
    objc_copyWeak(&v18, (id *)buf);
    id v17 = v6;
    CFStringRef v10 = sub_1001B1B10(0, &_dispatch_main_q, &v13);
    -[SDAutoUnlockLockSession setConfirmationTimer:](self, "setConfirmationTimer:", v10, v13, v14, v15, v16);

    id v11 = [(SDAutoUnlockLockSession *)self confirmationTimer];
    dispatch_resume(v11);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  uint64_t v12 = [(SDAutoUnlockLockSession *)self confirmationTimer];
  sub_1001B1BC4(v12, a3);
}

- (void)invalidateConfirmationTimer
{
  unsigned int v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating confirmation timer", v6, 2u);
  }

  id v4 = [(SDAutoUnlockLockSession *)self confirmationTimer];

  if (v4)
  {
    BOOL v5 = [(SDAutoUnlockLockSession *)self confirmationTimer];
    dispatch_source_cancel(v5);

    [(SDAutoUnlockLockSession *)self setConfirmationTimer:0];
  }
}

- (void)handleRangingResults:(id)a3 errorCode:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023DC08;
  block[3] = &unk_1008CBB30;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (BOOL)peerInRange:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    BOOL v5 = +[NSUserDefaults standardUserDefaults];
    if ([v5 BOOLForKey:@"phoneAutoUnlockSkipRanging"])
    {
      id v6 = auto_unlock_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Skipping ranging due to default phoneAutoUnlockSkipRanging", v10, 2u);
      }

      LOBYTE(v6) = 1;
      uint64_t v7 = self;
      uint64_t v8 = 1;
      goto LABEL_9;
    }
  }
  BOOL v5 = [v4 objectAtIndexedSubscript:0];
  id v6 = [v5 distanceMeters];
  [(SDAutoUnlockAuthSession *)self setDistance:v6];

  LODWORD(v6) = [v5 shouldUnlock];
  if (v6)
  {
    uint64_t v8 = (uint64_t)[v5 shouldUnlock];
    uint64_t v7 = self;
LABEL_9:
    [(SDAutoUnlockAuthSession *)v7 setShouldUnlock:v8];
  }

  return (char)v6;
}

- (void)handlePeerInRange
{
  unsigned int v3 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  dispatch_assert_queue_V2(v3);

  if (![(SDAutoUnlockLockSession *)self canceled])
  {
    id v4 = auto_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = (__CFString *)sub_1000D940C(0);
      *(_DWORD *)buf = 138412290;
      NSErrorUserInfoKey v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "handlePeerInRange %@", buf, 0xCu);
    }
    id v6 = objc_opt_new();
    uint64_t v7 = [(SDAutoUnlockAuthSession *)self awdlStart];
    [v6 timeIntervalSinceDate:v7];
    -[SDAutoUnlockLockSession setAwdlTotal:](self, "setAwdlTotal:");

    [(SDAutoUnlockLockSession *)self setOnlyRanging:0];
    if ([(SDAutoUnlockAuthSession *)self isAuthenticatingForSiri])
    {
      uint64_t v8 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
      CFStringRef v13 = @"Siri SPI Succeeded";
      id v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      id v10 = +[NSError errorWithDomain:v8 code:218 userInfo:v9];

      [(SDAutoUnlockLockSession *)self sendUnlockConfirmation:0 withError:v10];
      [(SDAutoUnlockLockSession *)self notifyDelegateWithError:v10];
LABEL_11:

      return;
    }
    if ([(SDAutoUnlockLockSession *)self attemptPrewarmed]
      && [(SDAutoUnlockLockSession *)self shouldWaitToCompleteUnlock])
    {
      int64_t v11 = auto_unlock_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempt was prewarmed and not told to complete, waiting for trigger to complete unlock.", buf, 2u);
      }

      [(SDAutoUnlockLockSession *)self setWaitingToCompleteUnlock:1];
      id v10 = +[NSDate date];
      [(SDAutoUnlockLockSession *)self setPrewarmIdleStartDate:v10];
      goto LABEL_11;
    }
    [(SDAutoUnlockLockSession *)self consumeAuthTokenIfReady];
  }
}

- (void)handlePeerOutOfRange
{
  unsigned int v3 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  dispatch_assert_queue_V2(v3);

  [(SDAutoUnlockPairingSession *)self invalidateResponseTimer];
  if (![(SDAutoUnlockLockSession *)self canceled])
  {
    id v4 = SFAutoUnlockErrorDomain;
    if ([(SDAutoUnlockAuthSession *)self rangingTimedOut])
    {
      BOOL v5 = [(SDAutoUnlockAuthSession *)self rangingErrorString];
      if ([(SDAutoUnlockAuthSession *)self wifiRangingErrorCode])
      {
        int64_t v6 = [(SDAutoUnlockAuthSession *)self wifiRangingErrorCode];
        uint64_t v7 = [(SDAutoUnlockAuthSession *)self wifiErrorDomain];

        id v4 = (id)v7;
      }
      else
      {
        int64_t v6 = 139;
      }
    }
    else
    {
      [(SDAutoUnlockAuthSession *)self setErrorType:8];
      BOOL v5 = SFLocalizedStringForKey();
      int64_t v6 = 130;
    }
    uint64_t v8 = auto_unlock_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100243160();
    }

    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v12 = v5;
    id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v10 = +[NSError errorWithDomain:v4 code:v6 userInfo:v9];

    [(SDAutoUnlockLockSession *)self sendUnlockConfirmation:0 withError:v10];
  }
}

- (void)handleAWDLUp
{
  unsigned int v3 = [(SDAutoUnlockAuthSession *)self awdlStart];
  if (v3 && (id v11 = v3, v4 = [(SDAutoUnlockLockSession *)self awdlUp], v3 = v11, (v4 & 1) == 0))
  {
    [(SDAutoUnlockLockSession *)self peerFoundInterval];
    double v6 = v5;

    if (v6 == 0.0)
    {
      [(SDAutoUnlockLockSession *)self setAwdlUp:1];
      uint64_t v7 = +[NSDate date];
      uint64_t v8 = [(SDAutoUnlockAuthSession *)self awdlStart];
      [v7 timeIntervalSinceDate:v8];
      -[SDAutoUnlockAuthSession setAwdlInterval:](self, "setAwdlInterval:");

      id v9 = auto_unlock_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        [(SDAutoUnlockAuthSession *)self awdlInterval];
        *(_DWORD *)buf = 134217984;
        uint64_t v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AWDL up (%.2f)", buf, 0xCu);
      }
    }
  }
  else
  {
  }
}

- (void)handlePeerFound:(BOOL)a3
{
  if (a3)
  {
    [(SDAutoUnlockLockSession *)self setPeerFoundInterval:0.0];
  }
  else
  {
    id v8 = (id)objc_opt_new();
    unsigned __int8 v4 = [(SDAutoUnlockAuthSession *)self awdlStart];
    [v8 timeIntervalSinceDate:v4];
    double v6 = v5;
    [(SDAutoUnlockAuthSession *)self awdlInterval];
    [(SDAutoUnlockLockSession *)self setPeerFoundInterval:v6 - v7];
  }
}

- (void)handleRangingStarted
{
  unsigned int v3 = +[NSDate date];
  [(SDAutoUnlockAuthSession *)self setRangingStart:v3];

  kdebug_trace();
  [(SDAutoUnlockAuthSession *)self setErrorType:12];
  unsigned __int8 v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 integerForKey:@"phoneAutoUnlockAWDLRangingTimeout"];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    double v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1002431C8();
    }

    double v8 = (double)v6;
  }
  else
  {
    double v8 = 10.0;
  }
  [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8(v8)];
}

- (void)handleWiFiRequestInvalidated
{
  objc_super v2 = auto_unlock_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "WiFi request invalidated", v3, 2u);
  }
}

- (void)notifyDelegateWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(SDAutoUnlockAuthSession *)self attemptError];

  if (!v5) {
    [(SDAutoUnlockAuthSession *)self setAttemptError:v4];
  }
  uint64_t v6 = auto_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Auth lock session notifying delegate with error: %@", (uint8_t *)&v12, 0xCu);
  }

  if (v4)
  {
    if ([(SDAutoUnlockLockSession *)self otherSessionCancel]) {
      goto LABEL_12;
    }
    double v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = [v4 localizedDescription];
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Automation: Session Dismissed: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    double v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Automation: Success", (uint8_t *)&v12, 2u);
    }
  }

LABEL_12:
  id v9 = [(SDAutoUnlockPairingSession *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(SDAutoUnlockPairingSession *)self delegate];
    [v11 session:self didCompleteWithError:v4];
  }
}

- (void)handleMessageWithWrapper:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 messageType];
  switch(v5)
  {
    case 7u:
      kdebug_trace();
      uint64_t v6 = +[NSDate date];
      double v7 = [(SDAutoUnlockAuthSession *)self awdlStart];
      [v6 timeIntervalSinceDate:v7];
      -[SDAutoUnlockLockSession setKeyRequestExchange:](self, "setKeyRequestExchange:");

      double v8 = auto_unlock_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received SDUnlockSessionKeyExchangeRequest", buf, 2u);
      }

      id v9 = [v4 payload];
      [(SDAutoUnlockLockSession *)self handleSessionKeyExchangeRequest:v9];
      goto LABEL_18;
    case 8u:
    case 0xAu:
    case 0xCu:
      goto LABEL_19;
    case 9u:
      id v13 = +[NSDate date];
      uint64_t v14 = [(SDAutoUnlockLockSession *)self exchageResponseDate];
      [v13 timeIntervalSinceDate:v14];
      -[SDAutoUnlockLockSession setTokenExchange:](self, "setTokenExchange:");

      NSErrorUserInfoKey v15 = +[NSDate date];
      double v16 = [(SDAutoUnlockLockSession *)self attemptStartDate];
      [v15 timeIntervalSinceDate:v16];
      -[SDAutoUnlockLockSession setBtBootstrap:](self, "setBtBootstrap:");

      kdebug_trace();
      id v17 = auto_unlock_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received SDUnlockSessionAuthToken", v19, 2u);
      }

      [(SDAutoUnlockPairingSession *)self invalidateResponseTimer];
      id v9 = [v4 payload];
      [(SDAutoUnlockLockSession *)self handleSessionAuthToken:v9];
      goto LABEL_18;
    case 0xBu:
      [(SDAutoUnlockLockSession *)self invalidateConfirmationTimer];
      [(SDAutoUnlockLockSession *)self handleConfirmationACK];
      goto LABEL_19;
    case 0xDu:
      id v18 = auto_unlock_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received SDAutoUnlockAuthPromptResponse", v21, 2u);
      }

      id v9 = [v4 payload];
      [(SDAutoUnlockLockSession *)self handleAuthPromptResponse:v9];
      goto LABEL_18;
    default:
      if (v5 != 301) {
        goto LABEL_19;
      }
      kdebug_trace();
      char v10 = +[NSDate date];
      id v11 = [(SDAutoUnlockLockSession *)self connectionDate];
      int v12 = v11;
      if (!v11)
      {
        int v12 = [(SDAutoUnlockLockSession *)self firstSend];
      }
      [v10 timeIntervalSinceDate:v12];
      -[SDAutoUnlockLockSession setAwdlInfoExchange:](self, "setAwdlInfoExchange:");
      if (!v11) {

      }
      id v9 = [v4 payload];
      [(SDAutoUnlockLockSession *)self handleAWDLInfo:v9];
LABEL_18:

LABEL_19:
      return;
  }
}

- (void)handleAWDLInfo:(id)a3
{
  id v4 = a3;
  if (![(SDAutoUnlockLockSession *)self receivedAWDLInfo])
  {
    [(SDAutoUnlockLockSession *)self setReceivedAWDLInfo:1];
    if (![(SDAutoUnlockLockSession *)self sentExchangeResponse]) {
      [(SDAutoUnlockLockSession *)self invalidateTimerIfReady];
    }
    unsigned int v5 = [[SDAutoUnlockAWDLInfo alloc] initWithData:v4];
    uint64_t v6 = [(SDAutoUnlockAWDLInfo *)v5 awdlInfo];
    double v7 = sub_1000D2064(v6);

    double v8 = auto_unlock_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received AWDL Info %@", buf, 0xCu);
    }

    if (!v7)
    {
      double v19 = auto_unlock_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10024323C();
      }

      goto LABEL_36;
    }
    [(SDAutoUnlockAuthSession *)self setRemoteAWDLInfo:v7];
    if (sub_1000D9060(@"AURestrictOldWatch", 1)
      && [(SDAutoUnlockAWDLInfo *)v5 version] < 3uLL)
    {
      [(SDAutoUnlockLockSession *)self setOldWatch:1];
      id v9 = +[NSString stringWithFormat:@"Watch using old protocol (version: %d)", [(SDAutoUnlockAWDLInfo *)v5 version]];
      char v10 = auto_unlock_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100243270();
      }

      uint64_t v11 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      CFStringRef v27 = v9;
      int v12 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      uint64_t v13 = v11;
      uint64_t v14 = 126;
    }
    else
    {
      if ([(SDAutoUnlockAWDLInfo *)v5 hasSupportsConfirmationACK]
        && [(SDAutoUnlockAWDLInfo *)v5 supportsConfirmationACK])
      {
        NSErrorUserInfoKey v15 = auto_unlock_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Session supports confirmation ACK", buf, 2u);
        }

        [(SDAutoUnlockLockSession *)self setSupportsConfirmationACK:[(SDAutoUnlockAWDLInfo *)v5 supportsConfirmationACK]];
      }
      if ([(SDAutoUnlockAWDLInfo *)v5 hasKeyData]
        || [(SDAutoUnlockAWDLInfo *)v5 hasErrorCode])
      {
        id v9 = objc_alloc_init(SDUnlockSessionKeyExchangeRequest);
        [(SDUnlockSessionKeyExchangeRequest *)v9 setVersion:[(SDAutoUnlockAWDLInfo *)v5 version]];
        double v16 = [(SDAutoUnlockAWDLInfo *)v5 keyData];
        [(SDUnlockSessionKeyExchangeRequest *)v9 setKey:v16];

        [(SDUnlockSessionKeyExchangeRequest *)v9 setUsingRecord:[(SDAutoUnlockAWDLInfo *)v5 useToken] ^ 1];
        if ([(SDAutoUnlockAWDLInfo *)v5 hasErrorCode]) {
          [(SDUnlockSessionKeyExchangeRequest *)v9 setErrorCode:[(SDAutoUnlockAWDLInfo *)v5 errorCode]];
        }
        id v17 = [(SDUnlockSessionKeyExchangeRequest *)v9 data];
        [(SDAutoUnlockLockSession *)self handleSessionKeyExchangeRequest:v17];

        id v18 = auto_unlock_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Using new protocol", buf, 2u);
        }

        goto LABEL_35;
      }
      if ([(SDAutoUnlockAWDLInfo *)v5 version] == 1)
      {
        double v20 = auto_unlock_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Using legacy protocol", buf, 2u);
        }

        [(SDAutoUnlockAuthSession *)self setProtocol:0];
        goto LABEL_36;
      }
      id v9 = +[NSString stringWithFormat:@"Received AWDL Info message missing information (info: %@)", v5];
      double v21 = auto_unlock_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100243270();
      }

      uint64_t v22 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
      CFStringRef v25 = v9;
      int v12 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      uint64_t v13 = v22;
      uint64_t v14 = 103;
    }
    NSErrorUserInfoKey v23 = +[NSError errorWithDomain:v13 code:v14 userInfo:v12];
    [(SDAutoUnlockLockSession *)self sendUnlockConfirmation:0 withError:v23];

LABEL_35:
LABEL_36:
  }
}

- (void)handleAuthPromptResponse:(id)a3
{
  id v4 = a3;
  if ([(SDAutoUnlockLockSession *)self receivedAuthPromptResponse])
  {
    unsigned int v5 = auto_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1002432D8();
    }
  }
  else
  {
    [(SDAutoUnlockLockSession *)self setReceivedAuthPromptResponse:1];
    unsigned int v5 = [[SDAutoUnlockAuthPromptResponse alloc] initWithData:v4];
    if (([v5 hasKeyData] & 1) != 0
      || [v5 hasErrorCode])
    {
      uint64_t v6 = objc_alloc_init(SDUnlockSessionKeyExchangeRequest);
      [(SDUnlockSessionKeyExchangeRequest *)v6 setVersion:[v5 version]];
      double v7 = [v5 keyData];
      [(SDUnlockSessionKeyExchangeRequest *)v6 setKey:v7];

      [(SDUnlockSessionKeyExchangeRequest *)v6 setUsingRecord:1];
      [(SDAutoUnlockLockSession *)self setNeedsNewImage:[v5 needsImageData]];
      if ([v5 hasErrorCode]) {
        [(SDUnlockSessionKeyExchangeRequest *)v6 setErrorCode:[v5 errorCode]];
      }
      double v8 = [(SDAutoUnlockLockSession *)self imageData];
      [(SDAutoUnlockLockSession *)self sendAuthPromptImageDataIfReady:v8];

      id v9 = [(SDUnlockSessionKeyExchangeRequest *)v6 data];
      [(SDAutoUnlockLockSession *)self handleSessionKeyExchangeRequest:v9];
    }
    else
    {
      +[NSString stringWithFormat:@"Received auth prompt response missing information: %@"], v5);
      uint64_t v6 = (SDUnlockSessionKeyExchangeRequest *)objc_claimAutoreleasedReturnValue();
      char v10 = auto_unlock_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100243270();
      }

      uint64_t v11 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
      NSErrorUserInfoKey v15 = v6;
      int v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      uint64_t v13 = +[NSError errorWithDomain:v11 code:103 userInfo:v12];
      [(SDAutoUnlockLockSession *)self sendUnlockConfirmation:0 withError:v13];
    }
  }
}

- (void)handleSessionKeyExchangeRequest:(id)a3
{
  id v4 = a3;
  [(SDAutoUnlockLockSession *)self setReceivedExchangeRequest:1];
  [(SDAutoUnlockLockSession *)self invalidateTimerIfReady];
  if (![(SDAutoUnlockLockSession *)self canceled])
  {
    unsigned int v5 = [[SDUnlockSessionKeyExchangeRequest alloc] initWithData:v4];
    if (![(SDUnlockSessionKeyExchangeRequest *)v5 hasErrorCode]
      && [(SDUnlockSessionKeyExchangeRequest *)v5 hasKey]
      && [(SDUnlockSessionKeyExchangeRequest *)v5 hasUsingRecord])
    {
      uint64_t v6 = [(SDAutoUnlockAuthSession *)self bleDevice];
      unsigned __int8 v7 = [(SDAutoUnlockLockSession *)self handleFoundBLEDevice:v6 available:1 lockedOnWrist:0];

      if ((v7 & 1) == 0)
      {
        auto_unlock_log();
        double v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "Found device is not available", buf, 2u);
        }
        goto LABEL_29;
      }
      double v8 = [(SDAutoUnlockPairingSession *)self aksSession];

      if (v8)
      {
        id v9 = auto_unlock_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received fallback AKS session", buf, 2u);
        }

        char v10 = [(SDAutoUnlockPairingSession *)self aksSession];
        [v10 resetSession];

        [(SDAutoUnlockPairingSession *)self setAksSession:0];
      }
      if ((id)[(SDAutoUnlockAuthSession *)self attemptType] == (id)1)
      {
        unint64_t v11 = [(SDAutoUnlockAuthSession *)self protocol];
        unsigned int v12 = [(SDUnlockSessionKeyExchangeRequest *)v5 usingRecord];
        BOOL v13 = v11 == 2;
        if (v11 == 2) {
          uint64_t v14 = 0;
        }
        else {
          uint64_t v14 = v12;
        }
        NSErrorUserInfoKey v15 = +[SDAutoUnlockAKSManager sharedManager];
        double v16 = [(SDAutoUnlockPairingSession *)self deviceID];
        id v17 = [v15 aksAuthSessionForDeviceID:v16 originator:0 usingEscrow:v14 attestation:v13 sessionType:2];
        [(SDAutoUnlockPairingSession *)self setAksSession:v17];
      }
      else if ((id)[(SDAutoUnlockAuthSession *)self attemptType] == (id)2)
      {
        NSErrorUserInfoKey v15 = +[SDAutoUnlockAKSManager sharedManager];
        NSErrorUserInfoKey v26 = [(SDAutoUnlockPairingSession *)self deviceID];
        CFStringRef v27 = +[SDAutoUnlockSessionManager sharedManager];
        NSErrorUserInfoKey v28 = [v27 attemptExternalACMContext];
        CFStringRef v29 = [v15 aksAuthorizationSessionForDeviceID:v26 attestation:0 originator:0 externalACMContext:v28 sessionType:3];
        [(SDAutoUnlockPairingSession *)self setAksSession:v29];
      }
      else
      {
        NSErrorUserInfoKey v15 = auto_unlock_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_1002433A8(self, v15);
        }
      }

      double v30 = [(SDAutoUnlockPairingSession *)self aksSession];
      unsigned int v31 = [v30 sessionIsValid];

      if (v31)
      {
        double v32 = [(SDAutoUnlockPairingSession *)self aksSession];
        v33 = [(SDUnlockSessionKeyExchangeRequest *)v5 key];
        id v36 = 0;
        unsigned int v34 = [v32 stepSessionWithData:v33 outputData:&v36];
        id v35 = v36;

        if (v34)
        {
          [(SDAutoUnlockLockSession *)self sendKeyExchangeResponseWithData:v35];
          uint64_t v19 = 0;
          double v20 = 0;
        }
        else
        {
          double v20 = @"Exchange request step failed";
          uint64_t v19 = 101;
        }

LABEL_25:
        if (!v20) {
          goto LABEL_30;
        }
        goto LABEL_26;
      }
      double v20 = @"Lock session invalid";
      uint64_t v19 = 101;
LABEL_26:
      double v21 = auto_unlock_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10024330C();
      }

      uint64_t v22 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
      __int16 v39 = v20;
      NSErrorUserInfoKey v23 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      NSErrorUserInfoKey v24 = +[NSError errorWithDomain:v22 code:v19 userInfo:v23];
      [(SDAutoUnlockLockSession *)self sendUnlockConfirmation:0 withError:v24];

LABEL_29:
      goto LABEL_30;
    }
    if (![(SDUnlockSessionKeyExchangeRequest *)v5 hasErrorCode])
    {
      double v20 = +[NSString stringWithFormat:@"Key exhange request is missing information (request: %@)", v5];
      uint64_t v19 = 103;
      goto LABEL_25;
    }
    int v18 = [(SDUnlockSessionKeyExchangeRequest *)v5 errorCode];
    uint64_t v19 = v18;
    if (v18 <= 183)
    {
      if (v18 <= 118)
      {
        if (v18 == 102)
        {
          CFStringRef v25 = auto_unlock_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_100243374();
          }

          double v20 = [(SDAutoUnlockAuthSession *)self bleDevice];
          [(SDAutoUnlockLockSession *)self handleFoundBLEDevice:v20 available:0 lockedOnWrist:1];
          goto LABEL_29;
        }
        if (v18 == 114)
        {
          double v20 = @"Remote WiFi failure";
          uint64_t v19 = 114;
          goto LABEL_26;
        }
      }
      else
      {
        switch(v18)
        {
          case 119:
            double v20 = @"Watch not in state to perform Auto Unlock";
            uint64_t v19 = 119;
            goto LABEL_26;
          case 158:
            double v20 = @"Watch off wrist";
            uint64_t v19 = 158;
            goto LABEL_26;
          case 159:
            double v20 = @"Watch locked and off wrist";
            goto LABEL_26;
        }
      }
    }
    else if (v18 > 209)
    {
      switch(v18)
      {
        case 210:
          double v20 = @"Not enough motion detected";
          uint64_t v19 = 210;
          goto LABEL_26;
        case 213:
          double v20 = @"Watch Not Armed";
          uint64_t v19 = 213;
          goto LABEL_26;
        case 215:
          double v20 = @"Phone needs to be unlocked after Watch unlocked and on wrist";
          uint64_t v19 = 215;
          goto LABEL_26;
      }
    }
    else
    {
      switch(v18)
      {
        case 184:
          double v20 = @"Auth prompts disabled on remote";
          uint64_t v19 = 184;
          goto LABEL_26;
        case 199:
          SFIsGreenTeaDevice();
          SFLocalizedStringForKey();
          double v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = 199;
          goto LABEL_25;
        case 204:
          SFLocalizedStringForKey();
          double v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = 204;
          goto LABEL_25;
      }
    }
    double v20 = @"Remote AKS session failed";
    goto LABEL_26;
  }
  auto_unlock_log();
  unsigned int v5 = (SDUnlockSessionKeyExchangeRequest *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Key exchange request: attempt cancelled", buf, 2u);
  }
LABEL_30:
}

- (void)handleSessionAuthToken:(id)a3
{
  id v4 = a3;
  if ([(SDAutoUnlockLockSession *)self canceled])
  {
    unsigned int v5 = auto_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)NSErrorUserInfoKey v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Auth token: attempt cancelled", v24, 2u);
    }
    goto LABEL_28;
  }
  uint64_t v6 = [(SDAutoUnlockLockSession *)self sessionAuthToken];

  if (v6)
  {
    unsigned int v5 = auto_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100243510();
    }
    goto LABEL_28;
  }
  unsigned int v5 = [[SDUnlockSessionAuthToken alloc] initWithData:v4];
  if (([v5 hasErrorCode] & 1) != 0
    || ![v5 hasAuthToken])
  {
    if ([v5 hasErrorCode])
    {
      unsigned int v9 = [v5 errorCode];
      uint64_t v10 = v9;
      if (v9 == 179)
      {
        CFStringRef v11 = @"User denied authorization request";
        goto LABEL_25;
      }
      if (v9 == 180)
      {
        CFStringRef v11 = @"Error posting authorization request";
        uint64_t v10 = 180;
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v10 = 103;
    }
    CFStringRef v11 = @"Auth token transfer failed";
    goto LABEL_25;
  }
  [(SDAutoUnlockLockSession *)self setSessionAuthToken:v5];
  unsigned __int8 v7 = objc_opt_new();
  double v8 = [(SDAutoUnlockLockSession *)self attemptStartDate];
  [v7 timeIntervalSinceDate:v8];
  -[SDAutoUnlockLockSession setBtOverall:](self, "setBtOverall:");

  if ([v5 version] >= 2
    && (id)[(SDAutoUnlockAuthSession *)self attemptType] == (id)2)
  {
    [(SDAutoUnlockLockSession *)self consumeAuthTokenIfReady];
    goto LABEL_28;
  }
  unsigned int v12 = [(SDAutoUnlockPairingSession *)self aksSession];
  BOOL v13 = [v12 generateSessionToken];
  [(SDAutoUnlockAuthSession *)self setSessionRangingKey:v13];

  uint64_t v14 = [(SDAutoUnlockAuthSession *)self sessionRangingKey];

  if (v14)
  {
    [(SDAutoUnlockLockSession *)self startAWDL];
    [(SDAutoUnlockLockSession *)self setOnlyRanging:1];
    NSErrorUserInfoKey v15 = +[NSUserDefaults standardUserDefaults];
    uint64_t v16 = (uint64_t)[v15 integerForKey:@"phoneAutoUnlockPeerDiscoveryTimeout"];
    if (v16 < 1)
    {
      double v19 = 10.0;
    }
    else
    {
      uint64_t v17 = v16;
      int v18 = auto_unlock_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_10024349C();
      }

      double v19 = (double)v17;
    }
    [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8(v19)];

    goto LABEL_28;
  }
  CFStringRef v11 = @"Failed to generate ranging token";
  uint64_t v10 = 101;
LABEL_25:
  double v20 = auto_unlock_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_100243434();
  }

  uint64_t v21 = SFAutoUnlockErrorDomain;
  NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
  CFStringRef v26 = v11;
  uint64_t v22 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  NSErrorUserInfoKey v23 = +[NSError errorWithDomain:v21 code:v10 userInfo:v22];
  [(SDAutoUnlockLockSession *)self sendUnlockConfirmation:0 withError:v23];

LABEL_28:
}

- (void)handleConfirmationACK
{
  unsigned int v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)NSErrorUserInfoKey v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received SDAutoUnlockSessionConfirmationACK", v15, 2u);
  }

  id v4 = objc_opt_new();
  unsigned int v5 = [(SDAutoUnlockLockSession *)self confirmationSendDate];
  [v4 timeIntervalSinceDate:v5];
  -[SDAutoUnlockLockSession setConfirmation:](self, "setConfirmation:");

  [(SDAutoUnlockAuthSession *)self setErrorType:0];
  uint64_t v6 = +[NSDate date];
  unsigned __int8 v7 = [(SDAutoUnlockLockSession *)self attemptStartDate];
  [v6 timeIntervalSinceDate:v7];
  -[SDAutoUnlockLockSession setAttemptTime:](self, "setAttemptTime:");

  LODWORD(v6) = [(SDAutoUnlockLockSession *)self attemptPrewarmed];
  [(SDAutoUnlockLockSession *)self attemptTime];
  double v9 = v8;
  if (v6)
  {
    [(SDAutoUnlockLockSession *)self prewarmIdleTime];
    double v9 = v9 - v10;
  }
  [(SDAutoUnlockLockSession *)self setCompleteExchange:v9];
  [(SDAutoUnlockLockSession *)self setUnlockSucceeded:1];
  if ((id)[(SDAutoUnlockAuthSession *)self attemptType] == (id)2
    && [(SDAutoUnlockLockSession *)self sentImageData])
  {
    CFStringRef v11 = [(SDAutoUnlockLockSession *)self iconTransferStore];
    unsigned int v12 = [(SDAutoUnlockLockSession *)self imageHash];
    BOOL v13 = [(SDAutoUnlockPairingSession *)self deviceID];
    uint64_t v14 = [(SDAutoUnlockAuthSession *)self appName];
    [v11 storeCachedImageForHash:v12 device:v13 appName:v14];
  }
  [(SDAutoUnlockLockSession *)self notifyDelegateWithError:0];
}

- (void)startAWDL
{
  kdebug_trace();
  unsigned int v3 = [(SDAutoUnlockAuthSession *)self remoteAWDLInfo];
  id v4 = [(SDAutoUnlockAuthSession *)self peerListFromAWDLInfo:v3];
  [(SDAutoUnlockLockSession *)self setPeerList:v4];

  unsigned int v5 = [(SDAutoUnlockAuthSession *)self remoteAWDLInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"AWDL_IF_MAC_ADDRESS"];
  [(SDAutoUnlockLockSession *)self setPeerMacAddress:v6];

  unsigned __int8 v7 = [(SDAutoUnlockAuthSession *)self remoteAWDLInfo];
  double v8 = +[NSMutableDictionary dictionaryWithDictionary:v7];

  double v9 = [(SDAutoUnlockAuthSession *)self localAWDLInfo];
  [v8 setObject:v9 forKeyedSubscript:@"AWDL_INFO_SELF"];

  [(SDAutoUnlockAuthSession *)self setErrorType:11];
  double v10 = +[NSDate date];
  [(SDAutoUnlockAuthSession *)self setAwdlStart:v10];

  CFStringRef v11 = objc_opt_new();
  unsigned int v12 = [(SDAutoUnlockLockSession *)self peerList];
  BOOL v13 = [v12 firstObject];
  [v11 setNiRangingPeer:v13];

  uint64_t v14 = [(SDAutoUnlockLockSession *)self peerMacAddress];
  [v11 setMacAddressData:v14];

  location[0] = 0;
  objc_initWeak(location, self);
  NSErrorUserInfoKey v15 = +[NSUserDefaults standardUserDefaults];
  unsigned int v16 = [v15 BOOLForKey:@"phoneAutoUnlockSkipRanging"];
  uint64_t v17 = auto_unlock_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_100243544(v16, v17);
  }

  if (v16)
  {
    int v18 = auto_unlock_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Skipping ranging due to default phoneAutoUnlockSkipRanging", buf, 2u);
    }

    id WeakRetained = objc_loadWeakRetained(location);
    [WeakRetained handleRangingResults:0 errorCode:0];
  }
  else
  {
    NSErrorUserInfoKey v28 = v8;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1002406B0;
    v37[3] = &unk_1008D1FA0;
    v37[4] = self;
    objc_copyWeak(&v38, location);
    CFStringRef v27 = objc_retainBlock(v37);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100240844;
    void v35[3] = &unk_1008D1FC8;
    objc_copyWeak(&v36, location);
    CFStringRef v26 = objc_retainBlock(v35);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100240924;
    v33[3] = &unk_1008CA3B0;
    objc_copyWeak(&v34, location);
    double v20 = objc_retainBlock(v33);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1002409A4;
    v31[3] = &unk_1008D1FF0;
    objc_copyWeak(&v32, location);
    uint64_t v21 = objc_retainBlock(v31);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100240A60;
    v29[3] = &unk_1008CA3B0;
    objc_copyWeak(&v30, location);
    uint64_t v22 = objc_retainBlock(v29);
    NSErrorUserInfoKey v23 = [[SDAutoUnlockWiFiRequest alloc] initWithAwdlInfo:v28 isRangingInitiator:1 rangingPeer:v11 queueAvailableHandler:&stru_1008D1F78 awdlStartedHandler:v27 peerFoundHandler:v26 rangingStartedHandler:v20 rangingCompletedHandler:v21 invalidationHandler:v22];
    [(SDAutoUnlockAuthSession *)self setWifiRequest:v23];

    NSErrorUserInfoKey v24 = +[SDAutoUnlockWiFiManager sharedManager];
    NSErrorUserInfoKey v25 = [(SDAutoUnlockAuthSession *)self wifiRequest];
    [v24 scheduleWiFiRequest:v25];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);

    objc_destroyWeak(&v38);
    double v8 = v28;
  }

  objc_destroyWeak(location);
}

- (void)consumeAuthTokenIfReady
{
  unsigned int v3 = +[SDStatusMonitor sharedMonitor];
  unsigned int v4 = [v3 currentConsoleUser];

  int v5 = variable initialization expression of SDAirDropHashStoreCDB.destroyed();
  int v6 = variable initialization expression of SDAirDropHashStoreCDB.destroyed();
  unsigned __int8 v7 = [(SDAutoUnlockPairingSession *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(SDAutoUnlockPairingSession *)self delegate];
    unsigned int v10 = [v9 isDisplayOff];
  }
  else
  {
    unsigned int v10 = 0;
  }
  CFStringRef v11 = auto_unlock_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = @"NO";
    if (v4) {
      CFStringRef v13 = @"YES";
    }
    else {
      CFStringRef v13 = @"NO";
    }
    if (v5) {
      CFStringRef v14 = @"YES";
    }
    else {
      CFStringRef v14 = @"NO";
    }
    *(_DWORD *)buf = 138413058;
    CFStringRef v49 = v13;
    if (v6) {
      CFStringRef v15 = @"YES";
    }
    else {
      CFStringRef v15 = @"NO";
    }
    __int16 v50 = 2112;
    CFStringRef v51 = v14;
    __int16 v52 = 2112;
    CFStringRef v53 = v15;
    if (v10) {
      CFStringRef v12 = @"YES";
    }
    __int16 v54 = 2112;
    CFStringRef v55 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Current user: %@, clamshell closed: %@, display connected: %@ display off: %@", buf, 0x2Au);
  }

  if ((v4 & v5 & (v6 ^ 1) | v10))
  {
    if (v10)
    {
      uint64_t v16 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
      CFStringRef v45 = @"Device display is off";
      uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      int v18 = +[NSError errorWithDomain:v16 code:217 userInfo:v17];

      [(SDAutoUnlockLockSession *)self sendUnlockConfirmation:0 withError:v18];
LABEL_41:

      return;
    }
    id v30 = auto_unlock_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Waiting for a display or clamshell change", buf, 2u);
    }

    if (![(SDAutoUnlockLockSession *)self waitingForDisplayOrClamshell])
    {
      [(SDAutoUnlockLockSession *)self setWaitingForDisplayOrClamshell:1];
      unsigned int v31 = objc_opt_new();
      [(SDAutoUnlockLockSession *)self setDisplayOrClamshellWaitingDate:v31];

      [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8(5.0)];
    }
    return;
  }
  if ([(SDAutoUnlockLockSession *)self waitingForDisplayOrClamshell])
  {
    double v19 = objc_opt_new();
    double v20 = [(SDAutoUnlockLockSession *)self displayOrClamshellWaitingDate];
    [v19 timeIntervalSinceDate:v20];
    -[SDAutoUnlockLockSession setDisplayClamshellWaitTime:](self, "setDisplayClamshellWaitTime:");
  }
  uint64_t v21 = [(SDAutoUnlockLockSession *)self sessionAuthToken];
  if (!v21) {
    return;
  }
  int v18 = (void *)v21;
  if ([(SDAutoUnlockAuthSession *)self inRange])
  {

LABEL_25:
    [(SDAutoUnlockPairingSession *)self invalidateResponseTimer];
    [(SDAutoUnlockLockSession *)self setWaitingForDisplayOrClamshell:0];
    uint64_t v22 = +[SDStatusMonitor sharedMonitor];
    -[SDAutoUnlockLockSession setDeviceWasLocked:](self, "setDeviceWasLocked:", [v22 deviceKeyBagUnlocked] ^ 1);

    NSErrorUserInfoKey v23 = [(SDAutoUnlockPairingSession *)self aksSession];
    NSErrorUserInfoKey v24 = [(SDAutoUnlockLockSession *)self sessionAuthToken];
    NSErrorUserInfoKey v25 = [v24 authToken];
    unsigned int v26 = [v23 stepSessionWithData:v25 outputData:0];

    CFStringRef v27 = auto_unlock_log();
    NSErrorUserInfoKey v28 = v27;
    if (v26)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "AKS Unlock succeeded", buf, 2u);
      }

      CFStringRef v29 = +[SDStatusMonitor sharedMonitor];
      [v29 addPreventExitForLocaleReason:@"AutoUnlockConfirmationTimerPreventExitReason"];

      [(SDAutoUnlockAuthSession *)self setAksSuccess:1];
      [(SDAutoUnlockAuthSession *)self setErrorType:13];
      if (![(SDAutoUnlockLockSession *)self doNotPostUnlockConfirmation]) {
        [(SDAutoUnlockLockSession *)self sendUnlockConfirmation:1 withError:0];
      }
    }
    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1002435C0(v28, v34, v35, v36, v37, v38, v39, v40);
      }

      uint64_t v41 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
      CFStringRef v47 = @"Auth token failed";
      double v42 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      v43 = +[NSError errorWithDomain:v41 code:101 userInfo:v42];
      [(SDAutoUnlockLockSession *)self sendUnlockConfirmation:0 withError:v43];
    }
    return;
  }
  id v32 = [(SDAutoUnlockLockSession *)self sessionAuthToken];
  if ([v32 version] <= 1)
  {

    goto LABEL_41;
  }
  int64_t v33 = [(SDAutoUnlockAuthSession *)self attemptType];

  if (v33 == 2) {
    goto LABEL_25;
  }
}

- (void)sendAWDLInfoData:(id)a3 type:(unsigned __int16)a4 completionHandler:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = +[SDAutoUnlockAKSManager sharedManager];
  CFStringRef v11 = [v10 localDeviceID];

  if (v11)
  {
    CFStringRef v12 = [(SDAutoUnlockPairingSession *)self wrapPayload:v8 withType:v6 useProxy:[(SDAutoUnlockLockSession *)self useProxy] senderID:v11];
    CFStringRef v13 = auto_unlock_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v14 = [(SDAutoUnlockAuthSession *)self bleDevice];
      *(_DWORD *)buf = 67109120;
      unsigned int v24 = [v14 useBTPipe];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Sending with useBTPipe %d", buf, 8u);
    }
    CFStringRef v15 = [(SDAutoUnlockAuthSession *)self bleDevice];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100241248;
    v19[3] = &unk_1008D2018;
    v19[4] = self;
    id v20 = v9;
    [(SDAutoUnlockAuthSession *)self sendData:v12 bleDevice:v15 completionHandler:v19];

    goto LABEL_9;
  }
  uint64_t v16 = auto_unlock_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_100243638();
  }

  if (v9)
  {
    uint64_t v17 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    CFStringRef v22 = @"Missing local IDS ID";
    CFStringRef v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    int v18 = +[NSError errorWithDomain:v17 code:194 userInfo:v12];
    (*((void (**)(id, void *))v9 + 2))(v9, v18);

LABEL_9:
  }
}

- (void)sendAuthPromptRequestWithImageHash:(id)a3 appName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SDAutoUnlockAKSManager sharedManager];
  id v9 = [v8 localDeviceID];

  if (v9)
  {
    unsigned int v10 = objc_opt_new();
    [v10 setVersion:1];
    [v10 setIconHash:v6];
    [v10 setAppName:v7];
    CFStringRef v11 = [(SDAutoUnlockAuthSession *)self navBarTitle];
    [v10 setNavBarTitle:v11];

    CFStringRef v12 = auto_unlock_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100243708();
    }

    CFStringRef v13 = [v10 data];
    CFStringRef v14 = [(SDAutoUnlockPairingSession *)self wrapPayload:v13 withType:12 useProxy:0 senderID:v9];

    CFStringRef v15 = [(SDAutoUnlockAuthSession *)self bleDevice];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10024155C;
    v18[3] = &unk_1008CA5A8;
    v18[4] = self;
    [(SDAutoUnlockAuthSession *)self sendData:v14 bleDevice:v15 completionHandler:v18];
  }
  else
  {
    uint64_t v16 = auto_unlock_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1002436D4();
    }

    uint64_t v17 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    CFStringRef v20 = @"Missing local IDS ID";
    unsigned int v10 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    CFStringRef v14 = +[NSError errorWithDomain:v17 code:194 userInfo:v10];
    [(SDAutoUnlockLockSession *)self notifyDelegateWithError:v14];
  }

  [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8(30.0)];
}

- (void)sendAuthPromptImageDataIfReady:(id)a3
{
  id v4 = a3;
  int v5 = sub_1000D9060(@"AUDisableIconCache", 0);
  unsigned int v6 = 0;
  if (!v5) {
    unsigned int v6 = [(SDAutoUnlockLockSession *)self imageDataAlreadyCached];
  }
  if ([(SDAutoUnlockLockSession *)self sentImageData]
    || ![(SDAutoUnlockLockSession *)self chosenDevice])
  {
    goto LABEL_10;
  }
  id v7 = [(SDAutoUnlockLockSession *)self imageData];
  id v8 = v7;
  if (v7) {
    unsigned int v9 = v6;
  }
  else {
    unsigned int v9 = 0;
  }
  if (v9 == 1)
  {
    unsigned __int8 v10 = [(SDAutoUnlockLockSession *)self needsNewImage];

    if ((v10 & 1) == 0)
    {
LABEL_10:
      CFStringRef v11 = auto_unlock_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        if ([(SDAutoUnlockLockSession *)self sentImageData]) {
          CFStringRef v12 = @"YES";
        }
        else {
          CFStringRef v12 = @"NO";
        }
        if ([(SDAutoUnlockLockSession *)self chosenDevice]) {
          CFStringRef v13 = @"YES";
        }
        else {
          CFStringRef v13 = @"NO";
        }
        CFStringRef v14 = [(SDAutoUnlockLockSession *)self imageData];
        if (v14) {
          CFStringRef v15 = @"YES";
        }
        else {
          CFStringRef v15 = @"NO";
        }
        if ([(SDAutoUnlockLockSession *)self imageDataAlreadyCached]) {
          CFStringRef v16 = @"YES";
        }
        else {
          CFStringRef v16 = @"NO";
        }
        *(_DWORD *)buf = 138413314;
        if ([(SDAutoUnlockLockSession *)self needsNewImage]) {
          CFStringRef v17 = @"YES";
        }
        else {
          CFStringRef v17 = @"NO";
        }
        *(void *)v43 = v12;
        *(_WORD *)&v43[8] = 2112;
        *(void *)&v43[10] = v13;
        __int16 v44 = 2112;
        CFStringRef v45 = v15;
        __int16 v46 = 2112;
        CFStringRef v47 = v16;
        __int16 v48 = 2112;
        CFStringRef v49 = v17;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not sending image data (already sent %@, chosen: %@, data %@, already cached %@, needs new image: %@)", buf, 0x34u);
      }
      goto LABEL_28;
    }
  }
  else
  {

    if (!v8) {
      goto LABEL_10;
    }
  }
  int v18 = auto_unlock_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    if ([(SDAutoUnlockLockSession *)self chosenDevice]) {
      CFStringRef v19 = @"YES";
    }
    else {
      CFStringRef v19 = @"NO";
    }
    CFStringRef v20 = [(SDAutoUnlockLockSession *)self imageData];
    if (v20) {
      CFStringRef v21 = @"YES";
    }
    else {
      CFStringRef v21 = @"NO";
    }
    if (v6) {
      CFStringRef v22 = @"YES";
    }
    else {
      CFStringRef v22 = @"NO";
    }
    if (v5) {
      CFStringRef v23 = @"YES";
    }
    else {
      CFStringRef v23 = @"NO";
    }
    *(_DWORD *)buf = 138413314;
    if ([(SDAutoUnlockLockSession *)self needsNewImage]) {
      CFStringRef v24 = @"YES";
    }
    else {
      CFStringRef v24 = @"NO";
    }
    *(void *)v43 = v19;
    *(_WORD *)&v43[8] = 2112;
    *(void *)&v43[10] = v21;
    __int16 v44 = 2112;
    CFStringRef v45 = v22;
    __int16 v46 = 2112;
    CFStringRef v47 = v23;
    __int16 v48 = 2112;
    CFStringRef v49 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sending image data (chosen: %@, data: %@, already cached: %@, cache disabled: %@ needs new image: %@)", buf, 0x34u);
  }
  unsigned int v25 = 0;
  int v26 = 1;
  *(void *)&long long v27 = 67109376;
  long long v40 = v27;
  do
  {
    NSErrorUserInfoKey v28 = auto_unlock_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v43 = 10000;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Using max size %ld", buf, 0xCu);
    }

    CFStringRef v29 = (char *)[v4 length];
    if ((unint64_t)&v29[-v25] >= 0x2710) {
      uint64_t v30 = 10000;
    }
    else {
      uint64_t v30 = (uint64_t)&v29[-v25];
    }
    unsigned int v31 = [v4 subdataWithRange:v25, v30, v40];
    unsigned int v32 = [v31 length];
    unint64_t v33 = (unint64_t)[v31 length] >> 4;
    uint64_t v34 = objc_opt_new();
    [v34 setVersion:1];
    [v34 setImageData:v31];
    [v34 setFinalMessage:v33 < 0x271];
    uint64_t v35 = auto_unlock_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      id v36 = [v31 length];
      *(_DWORD *)buf = v40;
      *(_DWORD *)v43 = v26;
      *(_WORD *)&v43[4] = 2048;
      *(void *)&v43[6] = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Sending SDAutoUnlockAuthPromptImageData (message count: %u, size: %ld)", buf, 0x12u);
    }
    v25 += v32;

    uint64_t v37 = [v34 data];
    uint64_t v38 = [(SDAutoUnlockPairingSession *)self wrapPayload:v37 withType:14];

    uint64_t v39 = [(SDAutoUnlockAuthSession *)self bleDevice];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100241B2C;
    v41[3] = &unk_1008CA5A8;
    v41[4] = self;
    [(SDAutoUnlockAuthSession *)self sendData:v38 bleDevice:v39 direct:1 completionHandler:v41];

    ++v26;
  }
  while (v33 > 0x270);
  [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8(30.0)];
  [(SDAutoUnlockLockSession *)self setSentImageData:1];
LABEL_28:
}

- (void)sendKeyExchangeResponseWithData:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new();
  [v5 setVersion:2];
  [v5 setKey:v4];

  [(SDAutoUnlockAuthSession *)self setErrorType:10];
  unsigned int v6 = objc_opt_new();
  [(SDAutoUnlockLockSession *)self setExchageResponseDate:v6];

  id v7 = auto_unlock_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending SDUnlockSessionKeyExchangeResponse", buf, 2u);
  }

  id v8 = [v5 data];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100241E10;
  v9[3] = &unk_1008CA5A8;
  v9[4] = self;
  [(SDAutoUnlockAuthSession *)self sendData:v8 type:8 errorHandler:v9];

  kdebug_trace();
  [(SDAutoUnlockLockSession *)self setSentExchangeResponse:1];
  [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8((double)35)];
}

- (void)completeAttemptPostNotification:(BOOL)a3
{
  int v5 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100241F98;
  v6[3] = &unk_1008CB9D8;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (void)sendUnlockConfirmation:(BOOL)a3 withError:(id)a4
{
}

- (void)sendUnlockConfirmation:(BOOL)a3 withError:(id)a4 suppressNotification:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  if ([(SDAutoUnlockLockSession *)self connected]
    || [(SDAutoUnlockLockSession *)self receivedAWDLInfo]
    || [(SDAutoUnlockLockSession *)self receivedAuthPromptResponse])
  {
    if ([(SDAutoUnlockLockSession *)self sendingConfirmation])
    {
      unsigned int v9 = auto_unlock_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Already sending confirmation", buf, 2u);
      }
    }
    else
    {
      [(SDAutoUnlockLockSession *)self setSendingConfirmation:1];
      unsigned __int8 v10 = objc_opt_new();
      [v10 setVersion:1];
      [v10 setSuccess:v6];
      [v10 setSupportsACK:-[SDAutoUnlockLockSession supportsConfirmationACK](self, "supportsConfirmationACK")];
      [v10 setSuppressNotification:v5];
      CFStringRef v11 = objc_opt_new();
      [(SDAutoUnlockLockSession *)self setConfirmationSendDate:v11];

      CFStringRef v12 = auto_unlock_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sending SDUnlockSessionConfirmation", buf, 2u);
      }

      uint64_t v13 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
      CFStringRef v28 = @"Confirmation failed";
      CFStringRef v14 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      CFStringRef v15 = +[NSError errorWithDomain:v13 code:136 userInfo:v14];

      CFStringRef v16 = [v10 data];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1002422E8;
      v22[3] = &unk_1008CA5D0;
      id v17 = v8;
      id v23 = v17;
      CFStringRef v24 = self;
      id v25 = v15;
      id v18 = v15;
      [(SDAutoUnlockAuthSession *)self sendData:v16 type:10 completionHandler:v22];

      [(SDAutoUnlockPairingSession *)self invalidateResponseTimer];
      dispatch_time_t v19 = sub_1001B1AF8(5.0);
      if (v17) {
        id v20 = v17;
      }
      else {
        id v20 = v18;
      }
      [(SDAutoUnlockLockSession *)self restartConfirmationTimer:v19 error:v20];
    }
  }
  else
  {
    CFStringRef v21 = auto_unlock_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Never connected, skipping confirmation", buf, 2u);
    }

    [(SDAutoUnlockLockSession *)self notifyDelegateWithError:v8];
  }
}

- (NSUUID)bluetoothID
{
  return self->_bluetoothID;
}

- (void)setBluetoothID:(id)a3
{
}

- (BOOL)useProxy
{
  return self->_useProxy;
}

- (void)setUseProxy:(BOOL)a3
{
  self->_useProxy = a3;
}

- (BOOL)wifiState
{
  return self->_wifiState;
}

- (void)setWifiState:(BOOL)a3
{
  self->_wifiState = a3;
}

- (BOOL)otherSessionCancel
{
  return self->_otherSessionCancel;
}

- (void)setOtherSessionCancel:(BOOL)a3
{
  self->_otherSessionCancel = a3;
}

- (BOOL)otherProviderCancel
{
  return self->_otherProviderCancel;
}

- (void)setOtherProviderCancel:(BOOL)a3
{
  self->_otherProviderCancel = a3;
}

- (BOOL)attemptTimedOut
{
  return self->_attemptTimedOut;
}

- (void)setAttemptTimedOut:(BOOL)a3
{
  self->_attemptTimedOut = a3;
}

- (BOOL)chosenDevice
{
  return self->_chosenDevice;
}

- (BOOL)unlockSucceeded
{
  return self->_unlockSucceeded;
}

- (void)setUnlockSucceeded:(BOOL)a3
{
  self->_unlockSucceeded = a3;
}

- (NSDate)attemptStartDate
{
  return self->_attemptStartDate;
}

- (void)setAttemptStartDate:(id)a3
{
}

- (NSDate)prewarmStartDate
{
  return self->_prewarmStartDate;
}

- (void)setPrewarmStartDate:(id)a3
{
}

- (double)discoveryTime
{
  return self->_discoveryTime;
}

- (void)setDiscoveryTime:(double)a3
{
  self->_discoveryTime = a3;
}

- (double)proxyDiscoveryTime
{
  return self->_proxyDiscoveryTime;
}

- (void)setProxyDiscoveryTime:(double)a3
{
  self->_proxyDiscoveryTime = a3;
}

- (NSString)proxyDeviceModel
{
  return self->_proxyDeviceModel;
}

- (void)setProxyDeviceModel:(id)a3
{
}

- (int)proxyRSSI
{
  return self->_proxyRSSI;
}

- (void)setProxyRSSI:(int)a3
{
  self->_proxyRSSI = a3;
}

- (double)proxyConnectionTime
{
  return self->_proxyConnectionTime;
}

- (void)setProxyConnectionTime:(double)a3
{
  self->_proxyConnectionTime = a3;
}

- (unint64_t)connectedBluetoothDevices
{
  return self->_connectedBluetoothDevices;
}

- (void)setConnectedBluetoothDevices:(unint64_t)a3
{
  self->_connectedBluetoothDevices = a3;
}

- (int64_t)timeSinceLastMachineWake
{
  return self->_timeSinceLastMachineWake;
}

- (void)setTimeSinceLastMachineWake:(int64_t)a3
{
  self->_timeSinceLastMachineWake = a3;
}

- (int64_t)lastSleepType
{
  return self->_lastSleepType;
}

- (void)setLastSleepType:(int64_t)a3
{
  self->_lastSleepType = a3;
}

- (BOOL)attemptPrewarmed
{
  return self->_attemptPrewarmed;
}

- (BOOL)doNotPostUnlockConfirmation
{
  return self->_doNotPostUnlockConfirmation;
}

- (SFAutoUnlockDevice)autoUnlockDevice
{
  return self->_autoUnlockDevice;
}

- (void)setAutoUnlockDevice:(id)a3
{
}

- (NSData)externalACMContext
{
  return self->_externalACMContext;
}

- (void)setExternalACMContext:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (NSData)imageHash
{
  return self->_imageHash;
}

- (void)setImageHash:(id)a3
{
}

- (SDAutoUnlockIconTransferStore)iconTransferStore
{
  return self->_iconTransferStore;
}

- (void)setIconTransferStore:(id)a3
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

- (BOOL)oldWatch
{
  return self->_oldWatch;
}

- (void)setOldWatch:(BOOL)a3
{
  self->_oldWatch = a3;
}

- (BOOL)onlyRanging
{
  return self->_onlyRanging;
}

- (void)setOnlyRanging:(BOOL)a3
{
  self->_onlyRanging = a3;
}

- (BOOL)foundPeer
{
  return self->_foundPeer;
}

- (void)setFoundPeer:(BOOL)a3
{
  self->_foundPeer = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)lockedKeyBag
{
  return self->_lockedKeyBag;
}

- (void)setLockedKeyBag:(BOOL)a3
{
  self->_lockedKeyBag = a3;
}

- (BOOL)deviceWasLocked
{
  return self->_deviceWasLocked;
}

- (void)setDeviceWasLocked:(BOOL)a3
{
  self->_deviceWasLocked = a3;
}

- (BOOL)receivedAWDLInfo
{
  return self->_receivedAWDLInfo;
}

- (void)setReceivedAWDLInfo:(BOOL)a3
{
  self->_receivedAWDLInfo = a3;
}

- (BOOL)receivedAuthPromptResponse
{
  return self->_receivedAuthPromptResponse;
}

- (void)setReceivedAuthPromptResponse:(BOOL)a3
{
  self->_receivedAuthPromptResponse = a3;
}

- (BOOL)sendingConfirmation
{
  return self->_sendingConfirmation;
}

- (void)setSendingConfirmation:(BOOL)a3
{
  self->_sendingConfirmation = a3;
}

- (BOOL)sentExchangeResponse
{
  return self->_sentExchangeResponse;
}

- (void)setSentExchangeResponse:(BOOL)a3
{
  self->_sentExchangeResponse = a3;
}

- (BOOL)receivedExchangeRequest
{
  return self->_receivedExchangeRequest;
}

- (void)setReceivedExchangeRequest:(BOOL)a3
{
  self->_receivedExchangeRequest = a3;
}

- (BOOL)supportsConfirmationACK
{
  return self->_supportsConfirmationACK;
}

- (void)setSupportsConfirmationACK:(BOOL)a3
{
  self->_supportsConfirmationACK = a3;
}

- (BOOL)waitingForDisplayOrClamshell
{
  return self->_waitingForDisplayOrClamshell;
}

- (void)setWaitingForDisplayOrClamshell:(BOOL)a3
{
  self->_waitingForDisplayOrClamshell = a3;
}

- (BOOL)sentImageData
{
  return self->_sentImageData;
}

- (void)setSentImageData:(BOOL)a3
{
  self->_sentImageData = a3;
}

- (BOOL)imageDataAlreadyCached
{
  return self->_imageDataAlreadyCached;
}

- (void)setImageDataAlreadyCached:(BOOL)a3
{
  self->_imageDataAlreadyCached = a3;
}

- (BOOL)needsNewImage
{
  return self->_needsNewImage;
}

- (void)setNeedsNewImage:(BOOL)a3
{
  self->_needsNewImage = a3;
}

- (BOOL)shouldWaitToCompleteUnlock
{
  return self->_shouldWaitToCompleteUnlock;
}

- (void)setShouldWaitToCompleteUnlock:(BOOL)a3
{
  self->_shouldWaitToCompleteUnlock = a3;
}

- (BOOL)isWaitingToCompleteUnlock
{
  return self->_waitingToCompleteUnlock;
}

- (void)setWaitingToCompleteUnlock:(BOOL)a3
{
  self->_waitingToCompleteUnlock = a3;
}

- (NSArray)peerList
{
  return self->_peerList;
}

- (void)setPeerList:(id)a3
{
}

- (NSData)peerMacAddress
{
  return self->_peerMacAddress;
}

- (void)setPeerMacAddress:(id)a3
{
}

- (SDUnlockSessionAuthToken)sessionAuthToken
{
  return self->_sessionAuthToken;
}

- (void)setSessionAuthToken:(id)a3
{
}

- (int)watchRSSI
{
  return self->_watchRSSI;
}

- (void)setWatchRSSI:(int)a3
{
  self->_watchRSSI = a3;
}

- (int64_t)displayCount
{
  return self->_displayCount;
}

- (void)setDisplayCount:(int64_t)a3
{
  self->_displayCount = a3;
}

- (int64_t)configChangeType
{
  return self->_configChangeType;
}

- (void)setConfigChangeType:(int64_t)a3
{
  self->_configChangeType = a3;
}

- (OS_dispatch_source)displayTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 496, 1);
}

- (void)setDisplayTimer:(id)a3
{
}

- (OS_dispatch_source)confirmationTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 504, 1);
}

- (void)setConfirmationTimer:(id)a3
{
}

- (BOOL)awdlUp
{
  return self->_awdlUp;
}

- (void)setAwdlUp:(BOOL)a3
{
  self->_awdlUp = a3;
}

- (NSString)watchModelID
{
  return self->_watchModelID;
}

- (void)setWatchModelID:(id)a3
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

- (NSDate)discoveryDate
{
  return self->_discoveryDate;
}

- (void)setDiscoveryDate:(id)a3
{
}

- (NSDate)connectionDate
{
  return self->_connectionDate;
}

- (void)setConnectionDate:(id)a3
{
}

- (NSDate)firstSend
{
  return self->_firstSend;
}

- (void)setFirstSend:(id)a3
{
}

- (NSDate)exchageResponseDate
{
  return self->_exchageResponseDate;
}

- (void)setExchageResponseDate:(id)a3
{
}

- (NSDate)displayOrClamshellWaitingDate
{
  return self->_displayOrClamshellWaitingDate;
}

- (void)setDisplayOrClamshellWaitingDate:(id)a3
{
}

- (NSDate)confirmationSendDate
{
  return self->_confirmationSendDate;
}

- (void)setConfirmationSendDate:(id)a3
{
}

- (NSDate)prewarmIdleStartDate
{
  return self->_prewarmIdleStartDate;
}

- (void)setPrewarmIdleStartDate:(id)a3
{
}

- (double)btOverall
{
  return self->_btOverall;
}

- (void)setBtOverall:(double)a3
{
  self->_btOverall = a3;
}

- (double)btBootstrap
{
  return self->_btBootstrap;
}

- (void)setBtBootstrap:(double)a3
{
  self->_btBootstrap = a3;
}

- (double)awdlInfoExchange
{
  return self->_awdlInfoExchange;
}

- (void)setAwdlInfoExchange:(double)a3
{
  self->_awdlInfoExchange = a3;
}

- (double)keyRequestExchange
{
  return self->_keyRequestExchange;
}

- (void)setKeyRequestExchange:(double)a3
{
  self->_keyRequestExchange = a3;
}

- (double)tokenExchange
{
  return self->_tokenExchange;
}

- (void)setTokenExchange:(double)a3
{
  self->_tokenExchange = a3;
}

- (double)confirmation
{
  return self->_confirmation;
}

- (void)setConfirmation:(double)a3
{
  self->_confirmation = a3;
}

- (double)peerFoundInterval
{
  return self->_peerFoundInterval;
}

- (void)setPeerFoundInterval:(double)a3
{
  self->_peerFoundInterval = a3;
}

- (double)awdlTotal
{
  return self->_awdlTotal;
}

- (void)setAwdlTotal:(double)a3
{
  self->_awdlTotal = a3;
}

- (double)attemptTime
{
  return self->_attemptTime;
}

- (void)setAttemptTime:(double)a3
{
  self->_attemptTime = a3;
}

- (double)completeExchange
{
  return self->_completeExchange;
}

- (void)setCompleteExchange:(double)a3
{
  self->_completeExchange = a3;
}

- (double)connectionTime
{
  return self->_connectionTime;
}

- (void)setConnectionTime:(double)a3
{
  self->_connectionTime = a3;
}

- (double)connectionWaitTime
{
  return self->_connectionWaitTime;
}

- (void)setConnectionWaitTime:(double)a3
{
  self->_connectionWaitTime = a3;
}

- (double)displayClamshellWaitTime
{
  return self->_displayClamshellWaitTime;
}

- (void)setDisplayClamshellWaitTime:(double)a3
{
  self->_displayClamshellWaitTime = a3;
}

- (double)prewarmIdleTime
{
  return self->_prewarmIdleTime;
}

- (void)setPrewarmIdleTime:(double)a3
{
  self->_prewarmIdleTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prewarmIdleStartDate, 0);
  objc_storeStrong((id *)&self->_confirmationSendDate, 0);
  objc_storeStrong((id *)&self->_displayOrClamshellWaitingDate, 0);
  objc_storeStrong((id *)&self->_exchageResponseDate, 0);
  objc_storeStrong((id *)&self->_firstSend, 0);
  objc_storeStrong((id *)&self->_connectionDate, 0);
  objc_storeStrong((id *)&self->_discoveryDate, 0);
  objc_storeStrong((id *)&self->_watchOSVersion, 0);
  objc_storeStrong((id *)&self->_watchBuildVersion, 0);
  objc_storeStrong((id *)&self->_watchModelID, 0);
  objc_storeStrong((id *)&self->_confirmationTimer, 0);
  objc_storeStrong((id *)&self->_displayTimer, 0);
  objc_storeStrong((id *)&self->_sessionAuthToken, 0);
  objc_storeStrong((id *)&self->_peerMacAddress, 0);
  objc_storeStrong((id *)&self->_peerList, 0);
  objc_storeStrong((id *)&self->_iconTransferStore, 0);
  objc_storeStrong((id *)&self->_imageHash, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_externalACMContext, 0);
  objc_storeStrong((id *)&self->_autoUnlockDevice, 0);
  objc_storeStrong((id *)&self->_proxyDeviceModel, 0);
  objc_storeStrong((id *)&self->_prewarmStartDate, 0);
  objc_storeStrong((id *)&self->_attemptStartDate, 0);

  objc_storeStrong((id *)&self->_bluetoothID, 0);
}

@end