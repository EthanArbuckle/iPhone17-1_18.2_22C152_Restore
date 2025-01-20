@interface SDAutoUnlockSessionManager
+ (id)sharedManager;
- (BOOL)advertisingEnabled;
- (BOOL)attemptInProgress;
- (BOOL)attemptPrewarmed;
- (BOOL)autoRelockAssertionTimerActive;
- (BOOL)behaviorChangedAfterUpgrade;
- (BOOL)cachedDeviceWiFiState;
- (BOOL)cachedWatchWiFiState;
- (BOOL)currentlyAdvertising;
- (BOOL)deviceCurrentlyUnlockedByWatch;
- (BOOL)disablePairingForDeviceID:(id)a3 pairingID:(id)a4;
- (BOOL)doNotPostUnlockConfirmation;
- (BOOL)extendedTimer;
- (BOOL)isBeingUsedForSiri;
- (BOOL)isDisplayOff;
- (BOOL)lastLockedByRelock;
- (BOOL)lastUnlockedByWatch;
- (BOOL)needsArming;
- (BOOL)needsStrictMotionCheck;
- (BOOL)notifiedForProxy;
- (BOOL)phoneAutoUnlockSupportedByDevice:(id)a3;
- (BOOL)presentedBluetoothError;
- (BOOL)presentedWiFiError;
- (BOOL)preventRadarNotification;
- (BOOL)previousConnectedState;
- (BOOL)previousNearbyState;
- (BOOL)previousSessionExists:(id)a3;
- (BOOL)proxyAdvertisementForPeer:(id)a3;
- (BOOL)proxyNotAvailableForUnlock;
- (BOOL)shouldNotify;
- (BOOL)shouldShowErrorForBluetoothEnabled:(BOOL)a3;
- (BOOL)shouldShowErrorForWiFiEnabled:(BOOL)a3;
- (BOOL)suppressAlert;
- (BOOL)unlockEnabledForPeer:(id)a3;
- (BOOL)useBTPipe;
- (BOOL)watchLockedAndOnWrist;
- (BOOL)watchLockedOnWristForPeer:(id)a3;
- (BOOL)watchUnlockEnabled;
- (BOOL)wifiStateNeedsUpdating;
- (NSData)attemptExternalACMContext;
- (NSData)previousMacAddressData;
- (NSDate)advertisingChangedDate;
- (NSDate)attemptStart;
- (NSDate)lastUnlockDate;
- (NSDate)lockStateChangedDate;
- (NSDate)nearbyDeviceChangedDate;
- (NSDate)pipeConnectionChangedDate;
- (NSDate)prewarmStart;
- (NSDate)wristStateChangedDate;
- (NSDictionary)awdlInfo;
- (NSError)authSessionError;
- (NSHashTable)observerTable;
- (NSMutableArray)canceledAuthLockSessions;
- (NSMutableArray)canceledPairingKeySessions;
- (NSMutableArray)keysWithAKSTokens;
- (NSMutableArray)locksWithAKSTokens;
- (NSMutableArray)previousSessionIDs;
- (NSMutableDictionary)cachedMetrics;
- (NSMutableDictionary)keyAuthSessions;
- (NSMutableDictionary)keyPairingSessions;
- (NSMutableDictionary)keyRegistrationSessionsByDeviceID;
- (NSMutableDictionary)lockAuthSessions;
- (NSMutableDictionary)lockPairingSessions;
- (NSMutableDictionary)lockRegistrationSessionsByDeviceID;
- (NSMutableDictionary)proxySessions;
- (NSMutableSet)serviceClients;
- (NSSet)eligibleDevices;
- (NSSet)scanAutoUnlockDevices;
- (NSSet)scanPhoneIDs;
- (NSSet)scanWatchIDs;
- (NSString)attemptAppName;
- (NSString)attemptBundlePath;
- (NSString)attemptID;
- (NSString)attemptNavBarTitle;
- (NSString)incrementedCountID;
- (NSString)proxyDeviceModel;
- (NSString)scanErrorString;
- (NSString)state;
- (OS_dispatch_queue)sessionManagerQueue;
- (OS_dispatch_source)magnetLinkTimer;
- (OS_dispatch_source)nearbyPushTimer;
- (OS_dispatch_source)scanTimer;
- (SDAutoUnlockIconTransferStore)iconTransferStore;
- (SDAutoUnlockLocalDeviceController)localDeviceController;
- (SDAutoUnlockPeer)remotePeer;
- (SDAutoUnlockSessionManager)init;
- (SDAutoUnlockSessionManager)initWithTransport:(id)a3 magnetTransport:(id)a4 keyManager:(id)a5;
- (SDAutoUnlockSuggestionManager)suggestionManager;
- (SDAutoUnlockTransportProtocol)autoUnlockTransport;
- (SDKeyManaging)keyManager;
- (SDUnlockMagnetTransport)magnetTransport;
- (SFAutoUnlockDevice)attemptDevice;
- (SFDeviceDiscovery)scanner;
- (double)proxyConnectionTime;
- (double)proxyDiscoverTime;
- (id)attemptActivatedHandler;
- (id)baseResultsDictionaryForError:(id)a3;
- (id)errorStringForBluetoothEnabled:(BOOL)a3 wifiEnabled:(BOOL)a4 faceIDEnabled:(BOOL)a5;
- (id)getUpsellNotificationBodyTextForEvent:(id)a3;
- (id)isActiveDeviceNearby;
- (id)isBluetoothEnabled;
- (id)isFaceIDEnabled;
- (id)isSignedIntoPrimaryiCloudAccount;
- (id)isWifiEnabled;
- (id)stringForState:(int64_t)a3;
- (id)unlockedOnWristDate;
- (int)proxyRSSI;
- (int)screenDisplayChangedToken;
- (int64_t)attemptCount;
- (int64_t)attemptType;
- (int64_t)bluetoothErrorCount;
- (int64_t)connectedBluetoothDevices;
- (int64_t)errorCodeForBluetoothEnabled:(BOOL)a3 wifiEnabled:(BOOL)a4 faceIDEnabled:(BOOL)a5;
- (int64_t)idsMacCount;
- (int64_t)idsMacCountCache;
- (int64_t)lastProxyState;
- (int64_t)lastSleepType;
- (int64_t)periocularStatus;
- (int64_t)proxyErrorCode;
- (int64_t)timeSinceLastMachineWake;
- (int64_t)wifiErrorCount;
- (os_state_data_s)dumpState;
- (unint64_t)stateHandle;
- (void)addNotificationsObservers;
- (void)addServiceClientForIdentifier:(id)a3;
- (void)armDevicesWaitingForUnlock;
- (void)attemptAutoUnlock;
- (void)attemptAutoUnlockForSiri;
- (void)attemptAutoUnlockForType:(int64_t)a3;
- (void)attemptAutoUnlockForType:(int64_t)a3 externalACMContext:(id)a4 preventRadarNotification:(BOOL)a5 bundlePath:(id)a6 appName:(id)a7 navBarTitle:(id)a8 reply:(id)a9;
- (void)attemptAutoUnlockForType:(int64_t)a3 preventRadarNotification:(BOOL)a4;
- (void)attemptAutoUnlockWithoutNotifyingWatch;
- (void)authPromptInfoWithCompletionHandler:(id)a3;
- (void)autoUnlockStateWithCompletionHandler:(id)a3;
- (void)beginKeyRegistrationIfNecessary;
- (void)btPipeConnectionChanged:(id)a3;
- (void)cancelAllLockSessionsForScanTimeout;
- (void)cancelAttemptsForDeviceUnlocked;
- (void)cancelAutoUnlock;
- (void)cancelAutoUnlockWithCancelReason:(int64_t)a3 usingTool:(BOOL)a4;
- (void)cancelEnablingAllDevices;
- (void)cancelEnablingAutoUnlockForDevice:(id)a3;
- (void)cancelEnablingAutoUnlockForDeviceID:(id)a3;
- (void)cancelMagnetLinkTimer;
- (void)cancelParallelRegistrationSessionsForDeviceID:(id)a3 newSessionID:(id)a4;
- (void)cleanUpProxySessions;
- (void)clearAllKeysWithTokens;
- (void)clearPhoneAutoUnlockNotification:(BOOL)a3;
- (void)completeAutoUnlockWithNotification:(BOOL)a3;
- (void)completeSuccessfulAttempt;
- (void)createKeySessionWithBLEDevice:(id)a3 sessionID:(id)a4 wrapper:(id)a5 useEncryption:(BOOL)a6;
- (void)createLockSessionWithWatchDevice:(id)a3;
- (void)createPairingKeySessionWithIdentifier:(id)a3 deviceID:(id)a4 requestData:(id)a5;
- (void)createPairingLockSessionWithDevice:(id)a3 passcode:(id)a4;
- (void)createProxySessionWithDeviceID:(id)a3;
- (void)createRegistrationKeySessionWithIdentifier:(id)a3 deviceID:(id)a4 requestData:(id)a5 locallyGenerated:(BOOL)a6;
- (void)createRegistrationLockSessionWithDeviceID:(id)a3 sessionID:(id)a4 requestData:(id)a5;
- (void)decrementAttemptCount;
- (void)disableAutoUnlockForAllWatches;
- (void)disableAutoUnlockForDevice:(id)a3 completionHandler:(id)a4;
- (void)disableKeyPairingForDeviceID:(id)a3;
- (void)donateDeviceUnlockedWithMask:(BOOL)a3;
- (void)eligibleDevicesFilterCompatibleDevices:(id)a3;
- (void)eligibleDevicesRequestFromBundleID:(id)a3 withCompletionHandler:(id)a4;
- (void)enableAutoUnlockWithDevice:(id)a3 passcode:(id)a4;
- (void)failedAttemptBeforeStarting:(id)a3 metricErrorString:(id)a4;
- (void)generateAttemptForType:(int64_t)a3;
- (void)generateStateDump;
- (void)grabLanguageAssertionForAutoRelock;
- (void)handleAuthenticationSessionStarted;
- (void)handleBLEDataReceivedNotification:(id)a3;
- (void)handleBLEScanTimerFired;
- (void)handleBioLockout;
- (void)handleBluetoothPowerChanged:(id)a3;
- (void)handleDisableMessageForKey:(id)a3 fromDeviceID:(id)a4;
- (void)handleDisableMessageForLock:(id)a3 fromDeviceID:(id)a4;
- (void)handleDisplayStateChanged:(unint64_t)a3;
- (void)handleFoundPeer:(id)a3;
- (void)handleLockConnectionStartedForSession:(id)a3;
- (void)handleLockSessionCompleted:(id)a3 error:(id)a4;
- (void)handleLockStateChanged;
- (void)handlePairedDeviceLockStateChanged;
- (void)handleProxyConnectionStartedForSession:(id)a3;
- (void)handleProxySessionCompleted:(id)a3 error:(id)a4;
- (void)handleRelockMessage;
- (void)handleScanTimerFired;
- (void)handleUnexpectedDisablement:(id)a3;
- (void)handleWiFiPowerChanged:(id)a3;
- (void)idsController:(id)a3 didReceiveProtoData:(id)a4 forType:(unsigned __int16)a5 deviceID:(id)a6;
- (void)incrementAttemptCount;
- (void)initializeAttemptState;
- (void)initializeCaptureBlock;
- (void)initializeRemotePeer;
- (void)invalidateAttempt;
- (void)invalidateExistingSessionsForBLEDevice:(id)a3 incomingSessionID:(id)a4;
- (void)invalidateScanTimer;
- (void)invalidateScanner;
- (void)keyBagLockStateChange:(id)a3;
- (void)loadPresentedBluetoothError;
- (void)loadPresentedWiFiError;
- (void)loadPreviousSessionIDs;
- (void)logUnintentionalAutoUnlockAttempt:(unint64_t)a3;
- (void)notifyObserverOfAttemptBeganWithDevice:(id)a3;
- (void)notifyObserverOfEnabledDevice:(id)a3;
- (void)notifyObserverOfFailedToEnableDevice:(id)a3 error:(id)a4;
- (void)notifyObserverOfKeyDeviceLockWithDevice:(id)a3;
- (void)notifyObserversOfUnlockCompletionWithDevice:(id)a3;
- (void)notifyObserversOfUnlockFailureWithResults:(id)a3 error:(id)a4;
- (void)onqueue_keyBagLockStateChange:(id)a3;
- (void)onqueue_start;
- (void)performRegistrationIfNecessaryForLockSession:(id)a3 error:(id)a4;
- (void)pipeConnectionChanged:(id)a3;
- (void)prewarmAutoUnlock;
- (void)registerObserver:(id)a3;
- (void)registerRemotePeerIfNecessary;
- (void)releaseLanguageAssertionForAutoRelock;
- (void)removeServiceClientForIdentifier:(id)a3;
- (void)repairCloudPairing;
- (void)requestRelock;
- (void)restartScanTimer:(unint64_t)a3;
- (void)savePresentedBluetoothError;
- (void)savePresentedWiFiError;
- (void)sendDisableMessageToDeviceID:(id)a3 pairingID:(id)a4;
- (void)session:(id)a3 didCompleteWithError:(id)a4;
- (void)sessionDidReceiveKeyDeviceLocked:(id)a3;
- (void)sessionDidStartConnection:(id)a3;
- (void)setAdvertisingChangedDate:(id)a3;
- (void)setAttemptActivatedHandler:(id)a3;
- (void)setAttemptAppName:(id)a3;
- (void)setAttemptBundlePath:(id)a3;
- (void)setAttemptCount:(int64_t)a3;
- (void)setAttemptDevice:(id)a3;
- (void)setAttemptExternalACMContext:(id)a3;
- (void)setAttemptID:(id)a3;
- (void)setAttemptInProgress:(BOOL)a3;
- (void)setAttemptNavBarTitle:(id)a3;
- (void)setAttemptPrewarmed:(BOOL)a3;
- (void)setAttemptStart:(id)a3;
- (void)setAttemptType:(int64_t)a3;
- (void)setAuthSessionError:(id)a3;
- (void)setAutoRelockAssertionTimerActive:(BOOL)a3;
- (void)setAwdlInfo:(id)a3;
- (void)setBluetoothErrorCount:(int64_t)a3;
- (void)setCachedDeviceWiFiState:(BOOL)a3;
- (void)setCachedMetrics:(id)a3;
- (void)setCachedWatchWiFiState:(BOOL)a3;
- (void)setCanceledAuthLockSessions:(id)a3;
- (void)setCanceledPairingKeySessions:(id)a3;
- (void)setConnectedBluetoothDevices:(int64_t)a3;
- (void)setCurrentlyAdvertising:(BOOL)a3;
- (void)setDoNotPostUnlockConfirmation:(BOOL)a3;
- (void)setEligibleDevices:(id)a3;
- (void)setExtendedTimer:(BOOL)a3;
- (void)setIconTransferStore:(id)a3;
- (void)setIdsMacCountCache:(int64_t)a3;
- (void)setIncrementedCountID:(id)a3;
- (void)setIsActiveDeviceNearby:(id)a3;
- (void)setIsBeingUsedForSiri:(BOOL)a3;
- (void)setIsBluetoothEnabled:(id)a3;
- (void)setIsFaceIDEnabled:(id)a3;
- (void)setIsSignedIntoPrimaryiCloudAccount:(id)a3;
- (void)setIsWifiEnabled:(id)a3;
- (void)setKeyAuthSessions:(id)a3;
- (void)setKeyPairingSessions:(id)a3;
- (void)setKeyRegistrationSessionsByDeviceID:(id)a3;
- (void)setKeysWithAKSTokens:(id)a3;
- (void)setLastLockedByRelock:(BOOL)a3;
- (void)setLastProxyState:(int64_t)a3;
- (void)setLastSleepType:(int64_t)a3;
- (void)setLastUnlockDate:(id)a3;
- (void)setLastUnlockedByWatch:(BOOL)a3;
- (void)setLocalDeviceController:(id)a3;
- (void)setLockAuthSessions:(id)a3;
- (void)setLockPairingSessions:(id)a3;
- (void)setLockRegistrationSessionsByDeviceID:(id)a3;
- (void)setLockStateChangedDate:(id)a3;
- (void)setLocksWithAKSTokens:(id)a3;
- (void)setMagnetLinkTimer:(id)a3;
- (void)setNearbyDeviceChangedDate:(id)a3;
- (void)setNearbyPushTimer:(id)a3;
- (void)setNeedsArming:(BOOL)a3;
- (void)setNeedsStrictMotionCheck:(BOOL)a3;
- (void)setNotifiedForProxy:(BOOL)a3;
- (void)setObserverTable:(id)a3;
- (void)setPeriocularStatus:(int64_t)a3;
- (void)setPipeConnectionChangedDate:(id)a3;
- (void)setPresentedBluetoothError:(BOOL)a3;
- (void)setPresentedWiFiError:(BOOL)a3;
- (void)setPreventRadarNotification:(BOOL)a3;
- (void)setPreviousConnectedState:(BOOL)a3;
- (void)setPreviousMacAddressData:(id)a3;
- (void)setPreviousNearbyState:(BOOL)a3;
- (void)setPreviousSessionIDs:(id)a3;
- (void)setPrewarmStart:(id)a3;
- (void)setProxyConnectionTime:(double)a3;
- (void)setProxyDeviceModel:(id)a3;
- (void)setProxyDiscoverTime:(double)a3;
- (void)setProxyErrorCode:(int64_t)a3;
- (void)setProxyNotAvailableForUnlock:(BOOL)a3;
- (void)setProxyRSSI:(int)a3;
- (void)setProxySessions:(id)a3;
- (void)setRemotePeer:(id)a3;
- (void)setScanAutoUnlockDevices:(id)a3;
- (void)setScanErrorString:(id)a3;
- (void)setScanPhoneIDs:(id)a3;
- (void)setScanTimer:(id)a3;
- (void)setScanWatchIDs:(id)a3;
- (void)setScanner:(id)a3;
- (void)setScreenDisplayChangedToken:(int)a3;
- (void)setServiceClients:(id)a3;
- (void)setSessionManagerQueue:(id)a3;
- (void)setState:(id)a3;
- (void)setStateHandle:(unint64_t)a3;
- (void)setSuggestionManager:(id)a3;
- (void)setSuppressAlert:(BOOL)a3;
- (void)setTimeSinceLastMachineWake:(int64_t)a3;
- (void)setUpMagnetLinkTimer;
- (void)setUseBTPipe:(BOOL)a3;
- (void)setWatchUnlockEnabled:(BOOL)a3;
- (void)setWifiErrorCount:(int64_t)a3;
- (void)setWifiStateNeedsUpdating:(BOOL)a3;
- (void)setWristStateChangedDate:(id)a3;
- (void)start;
- (void)startScannerWithWatchBluetoothIDs:(id)a3 phoneBluetoothIDs:(id)a4;
- (void)storePreviousSessionID:(id)a3;
- (void)transport:(id)a3 didReceiveDisableMessage:(id)a4 fromDeviceID:(id)a5;
- (void)transport:(id)a3 didReceiveKeyOriginatingRegistrationRequestWithSessionID:(id)a4 deviceID:(id)a5 requestData:(id)a6;
- (void)transport:(id)a3 didReceivePairingRequestWithSessionID:(id)a4 deviceID:(id)a5 requestData:(id)a6;
- (void)transport:(id)a3 didReceiveRegistrationRequestWithSessionID:(id)a4 deviceID:(id)a5 requestData:(id)a6;
- (void)transportDidChangeDevices:(id)a3;
- (void)transportDidChangeNearbyState:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateStringForProxySession;
- (void)upsellBehaviorChangedAfterUpgradeIfNecessary;
- (void)upsellPhoneAutoUnlock;
@end

@implementation SDAutoUnlockSessionManager

+ (id)sharedManager
{
  if (qword_10097FD48 != -1) {
    dispatch_once(&qword_10097FD48, &stru_1008CBE40);
  }
  v2 = (void *)qword_10097FD40;

  return v2;
}

- (SDAutoUnlockSessionManager)init
{
  v3 = +[SDAutoUnlockTransport sharedTransport];
  v4 = +[SDUnlockIDSController sharedController];
  v5 = +[SDAutoUnlockAKSManager sharedManager];
  v6 = [(SDAutoUnlockSessionManager *)self initWithTransport:v3 magnetTransport:v4 keyManager:v5];

  return v6;
}

- (SDAutoUnlockSessionManager)initWithTransport:(id)a3 magnetTransport:(id)a4 keyManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v58.receiver = self;
  v58.super_class = (Class)SDAutoUnlockSessionManager;
  v11 = [(SDAutoUnlockSessionManager *)&v58 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_autoUnlockTransport, v8);
    id v13 = objc_storeWeak((id *)&v12->_magnetTransport, v9);
    [v9 addDelegate:v12];

    objc_storeWeak((id *)&v12->_keyManager, v10);
    id isSignedIntoPrimaryiCloudAccount = v12->_isSignedIntoPrimaryiCloudAccount;
    v12->_id isSignedIntoPrimaryiCloudAccount = &stru_1008CBE80;

    id location = 0;
    objc_initWeak(&location, v12);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100092154;
    v55[3] = &unk_1008CBEA8;
    objc_copyWeak(&v56, &location);
    v15 = objc_retainBlock(v55);
    id isFaceIDEnabled = v12->_isFaceIDEnabled;
    v12->_id isFaceIDEnabled = v15;

    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_1000921A4;
    v53[3] = &unk_1008CBEA8;
    objc_copyWeak(&v54, &location);
    v17 = objc_retainBlock(v53);
    id isWifiEnabled = v12->_isWifiEnabled;
    v12->_id isWifiEnabled = v17;

    id isBluetoothEnabled = v12->_isBluetoothEnabled;
    v12->_id isBluetoothEnabled = &stru_1008CBEC8;

    id isActiveDeviceNearby = v12->_isActiveDeviceNearby;
    v12->_id isActiveDeviceNearby = &stru_1008CBEE8;

    v12->_idsMacCountCache = -1;
    v12->_timeSinceLastMachineWake = -1;
    uint64_t v21 = objc_opt_new();
    lockAuthSessions = v12->_lockAuthSessions;
    v12->_lockAuthSessions = (NSMutableDictionary *)v21;

    uint64_t v23 = objc_opt_new();
    keyAuthSessions = v12->_keyAuthSessions;
    v12->_keyAuthSessions = (NSMutableDictionary *)v23;

    uint64_t v25 = objc_opt_new();
    lockPairingSessions = v12->_lockPairingSessions;
    v12->_lockPairingSessions = (NSMutableDictionary *)v25;

    uint64_t v27 = objc_opt_new();
    keyPairingSessions = v12->_keyPairingSessions;
    v12->_keyPairingSessions = (NSMutableDictionary *)v27;

    uint64_t v29 = objc_opt_new();
    canceledAuthLockSessions = v12->_canceledAuthLockSessions;
    v12->_canceledAuthLockSessions = (NSMutableArray *)v29;

    uint64_t v31 = objc_opt_new();
    canceledPairingKeySessions = v12->_canceledPairingKeySessions;
    v12->_canceledPairingKeySessions = (NSMutableArray *)v31;

    uint64_t v33 = objc_opt_new();
    serviceClients = v12->_serviceClients;
    v12->_serviceClients = (NSMutableSet *)v33;

    uint64_t v35 = objc_opt_new();
    proxySessions = v12->_proxySessions;
    v12->_proxySessions = (NSMutableDictionary *)v35;

    uint64_t v37 = objc_opt_new();
    locksWithAKSTokens = v12->_locksWithAKSTokens;
    v12->_locksWithAKSTokens = (NSMutableArray *)v37;

    uint64_t v39 = objc_opt_new();
    keysWithAKSTokens = v12->_keysWithAKSTokens;
    v12->_keysWithAKSTokens = (NSMutableArray *)v39;

    uint64_t v41 = +[NSMutableDictionary dictionary];
    keyRegistrationSessionsByDeviceID = v12->_keyRegistrationSessionsByDeviceID;
    v12->_keyRegistrationSessionsByDeviceID = (NSMutableDictionary *)v41;

    uint64_t v43 = +[NSMutableDictionary dictionary];
    lockRegistrationSessionsByDeviceID = v12->_lockRegistrationSessionsByDeviceID;
    v12->_lockRegistrationSessionsByDeviceID = (NSMutableDictionary *)v43;

    dispatch_queue_t v45 = dispatch_queue_create("com.apple.sharingd.auto-unlock.session-manager-queue", 0);
    sessionManagerQueue = v12->_sessionManagerQueue;
    v12->_sessionManagerQueue = (OS_dispatch_queue *)v45;

    uint64_t v47 = +[NSHashTable hashTableWithOptions:517];
    observerTable = v12->_observerTable;
    v12->_observerTable = (NSHashTable *)v47;

    int v49 = SFDeviceClassCodeGet();
    if (v49 == 7 || v49 == 1)
    {
      v50 = +[SDNearbyAgent sharedNearbyAgent];
      id v51 = [v50 sharedNearbyPipe];
    }
    objc_destroyWeak(&v54);
    objc_destroyWeak(&v56);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)start
{
  v3 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000922FC;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)onqueue_start
{
  v3 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_assert_queue_V2(v3);

  v4 = auto_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Session manager starting", buf, 2u);
  }

  [(SDAutoUnlockSessionManager *)self addNotificationsObservers];
  v5 = +[SDAutoUnlockTransport sharedTransport];
  [v5 setPrimaryClient:self];

  v6 = +[SDAutoUnlockAKSManager sharedManager];
  [v6 start];

  v7 = (SDAutoUnlockSuggestionManager *)objc_opt_new();
  suggestionManager = self->_suggestionManager;
  self->_suggestionManager = v7;

  id v9 = +[SDAutoUnlockTransport sharedTransport];
  self->_previousNearbyState = [v9 deviceNearby];

  id v10 = objc_alloc_init(SDAutoUnlockIconTransferStore);
  iconTransferStore = self->_iconTransferStore;
  self->_iconTransferStore = v10;

  [(SDAutoUnlockSessionManager *)self initializeAttemptState];
  [(SDAutoUnlockSessionManager *)self initializeCaptureBlock];
  [(SDAutoUnlockSessionManager *)self updateAdvertising];
  v12 = auto_unlock_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Resetting in progress state", buf, 2u);
  }

  sub_1000D2CF0(0);
  [(SDAutoUnlockSessionManager *)self loadPresentedBluetoothError];
  [(SDAutoUnlockSessionManager *)self loadPresentedWiFiError];
  if (SFDeviceClassCodeGet() != 8)
  {
    id v13 = +[SDStatusMonitor sharedMonitor];
    -[SDAutoUnlockSessionManager setCachedDeviceWiFiState:](self, "setCachedDeviceWiFiState:", [v13 wirelessEnabled]);
  }
  v14 = +[SDAutoUnlockTransport sharedTransport];
  v15 = [v14 autoUnlockEligibleWatchesWithCloudPairing:0];

  v16 = auto_unlock_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Auto Unlock eligible devices %@", buf, 0xCu);
  }

  v17 = +[SDAutoUnlockWiFiManager sharedManager];
  [v17 start];

  v18 = +[SDAutoUnlockTransport sharedTransport];
  [v18 updateApproveBluetoothIDs];

  v19 = [SDAutoUnlockLocalDeviceController alloc];
  v20 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  uint64_t v21 = [(SDAutoUnlockLocalDeviceController *)v19 initWithQueue:v20];
  [(SDAutoUnlockSessionManager *)self setLocalDeviceController:v21];

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000926B4;
  v23[3] = &unk_1008CA3B0;
  objc_copyWeak(&v24, (id *)buf);
  v22 = [(SDAutoUnlockSessionManager *)self localDeviceController];
  [v22 setDeviceEnteredBioLockoutHandler:v23];

  [(SDAutoUnlockSessionManager *)self initializeRemotePeer];
  if (MKBDeviceUnlockedSinceBoot() == 1) {
    [(SDAutoUnlockSessionManager *)self registerRemotePeerIfNecessary];
  }
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);
}

- (void)initializeAttemptState
{
  v3 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_assert_queue_V2(v3);

  self->_attemptCount = 0;
  v4 = +[SDStatusMonitor sharedMonitor];
  unsigned int v5 = [v4 deviceKeyBagUnlocked];

  v6 = auto_unlock_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device unlocked on start up", buf, 2u);
    }

    id v8 = +[NSDate date];
    [(SDAutoUnlockSessionManager *)self setLastUnlockDate:v8];

    id v9 = +[NSDate date];
    [(SDAutoUnlockSessionManager *)self setLockStateChangedDate:v9];
  }
  else
  {
    if (v7)
    {
      id v10 = +[SDStatusMonitor sharedMonitor];
      *(_DWORD *)buf = 134217984;
      id v15 = [v10 deviceKeyBagState];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "### Device not unlocked on start up (state: %ld)", buf, 0xCu);
    }
    dispatch_time_t v11 = dispatch_time(0, 5000000000);
    v12 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000928F0;
    block[3] = &unk_1008CA4B8;
    block[4] = self;
    dispatch_after(v11, v12, block);
  }
}

- (void)addNotificationsObservers
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handleBLEDataReceivedNotification:" name:@"SDNearbyAgentNotificationUnlockBLEDataReceived" object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"keyBagLockStateChange:" name:@"com.apple.sharingd.KeyBagLockStatusChanged" object:0];

  unsigned int v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"handleWiFiPowerChanged:" name:@"com.apple.sharingd.WirelessPowerChanged" object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"btPipeConnectionChanged:" name:SFNotificationNamePipeConnectionStateChanged object:0];

  BOOL v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"handleAuthenticationSessionStarted" name:@"SDAuthenticationSessionStarted" object:0];

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"btPipeConnectionChanged:" name:SFNotificationNameBTPoweredOff object:0];

  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"handlePairedDeviceLockStateChanged" name:@"com.apple.sharingd.PairedWatchLockStateChanged" object:0];

  id v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"handleUnexpectedDisablement:" name:@"SDAutoUnlockAKSManagerUnexpectedDisablementNotification" object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100092D10, @"com.apple.purplebuddy.setupdone", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id location = 0;
  objc_initWeak(&location, self);
  v12 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100092E04;
  v13[3] = &unk_1008CA370;
  objc_copyWeak(&v14, &location);
  notify_register_dispatch("com.apple.iokit.hid.displayStatus", &self->_screenDisplayChangedToken, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100092F10;
  v7[3] = &unk_1008CA640;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100093088;
  v7[3] = &unk_1008CA640;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)notifyObserverOfKeyDeviceLockWithDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100093200;
  v7[3] = &unk_1008CA640;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)notifyObserverOfEnabledDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009344C;
  v7[3] = &unk_1008CA640;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)notifyObserverOfFailedToEnableDevice:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000936BC;
  block[3] = &unk_1008CAF18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)notifyObserverOfAttemptBeganWithDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009390C;
  v7[3] = &unk_1008CA640;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)notifyObserversOfUnlockCompletionWithDevice:(id)a3
{
  id v4 = a3;
  if (![(SDAutoUnlockSessionManager *)self suppressAlert]) {
    [(SDAutoUnlockSessionManager *)self completeSuccessfulAttempt];
  }
  unsigned int v5 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100093B6C;
  v7[3] = &unk_1008CA640;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)notifyObserversOfUnlockFailureWithResults:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100093DDC;
  block[3] = &unk_1008CAF18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)repairCloudPairing
{
  v2 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_async(v2, &stru_1008CBF08);
}

- (void)eligibleDevicesFilterCompatibleDevices:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        dispatch_time_t v11 = [v10 modelIdentifier:v14];
        BOOL v12 = sub_1000D35D0(v11);

        if (!v12)
        {
          id v13 = auto_unlock_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            sub_1000A4218(v18, v10, &v19, v13);
          }

          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v7);
  }

  [v5 minusSet:v4];
}

- (BOOL)phoneAutoUnlockSupportedByDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 modelIdentifier];
  if (sub_1000D35D0(v4))
  {
    id v5 = [v3 productVersion];
    BOOL v6 = sub_1000D36C4(v5);

    if (v6)
    {
      BOOL v7 = 1;
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v8 = auto_unlock_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000A4290(v3, v8);
  }

  BOOL v7 = 0;
LABEL_8:

  return v7;
}

- (void)eligibleDevicesRequestFromBundleID:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009437C;
  block[3] = &unk_1008CAD48;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)enableAutoUnlockWithDevice:(id)a3 passcode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SDAutoUnlockSessionManager *)self localDeviceController];
  unsigned __int8 v9 = [v8 faceIDEnabled];

  if ((v9 & 1) == 0)
  {
    uint64_t v17 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    CFStringRef v31 = @"FaceID not enabled";
    long long v14 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v15 = v17;
    uint64_t v16 = 205;
LABEL_7:
    v18 = +[NSError errorWithDomain:v15 code:v16 userInfo:v14];
    [(SDAutoUnlockSessionManager *)self notifyObserverOfFailedToEnableDevice:v6 error:v18];

    goto LABEL_11;
  }
  int v10 = sub_1000D3140();
  dispatch_time_t v11 = auto_unlock_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "### Unable to enable Auto Unlock due to profile", buf, 2u);
    }

    uint64_t v13 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    CFStringRef v29 = @"Disabled due to profile";
    long long v14 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v15 = v13;
    uint64_t v16 = 111;
    goto LABEL_7;
  }
  if (v12)
  {
    uint64_t v19 = [v6 uniqueID];
    *(_DWORD *)buf = 138412546;
    id v25 = v6;
    __int16 v26 = 2112;
    uint64_t v27 = v19;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Enabling device %@, id %@", buf, 0x16u);
  }
  v20 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009498C;
  block[3] = &unk_1008CAF18;
  block[4] = self;
  id v22 = v6;
  id v23 = v7;
  dispatch_async(v20, block);

LABEL_11:
}

- (void)cancelEnablingAllDevices
{
  id v3 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100094A24;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)cancelEnablingAutoUnlockForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100094C28;
  v7[3] = &unk_1008CA640;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)cancelEnablingAutoUnlockForDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cancel enabling device %@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [(SDAutoUnlockSessionManager *)self lockPairingSessions];
  id v7 = [v6 objectForKeyedSubscript:v4];

  if (v7 && ([v7 canceled] & 1) == 0)
  {
    [v7 cancel];
    id v8 = [v7 sessionID];
    unsigned __int8 v9 = [v8 UUIDString];
    [(SDAutoUnlockSessionManager *)self disablePairingForDeviceID:v4 pairingID:v9];
  }
  else
  {
    id v8 = auto_unlock_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No pairing lock session to cancel (device id: %@)", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)disableAutoUnlockForAllWatches
{
  id v3 = +[SDAutoUnlockTransport sharedTransport];
  id v4 = [v3 enabledAutoUnlockDevicesUsingCache:1];
  id v5 = [v4 allObjects];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "type", (void)v12) == (id)1) {
          [(SDAutoUnlockSessionManager *)self disableAutoUnlockForDevice:v11 completionHandler:0];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)disableAutoUnlockForDevice:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = auto_unlock_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Disabling Auto Unlock (device: %@)", buf, 0xCu);
  }

  sub_1000D459C(@"com.apple.watch.auto-unlock.disabled");
  uint64_t v9 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000950AC;
  block[3] = &unk_1008CAD48;
  id v13 = v6;
  long long v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)attemptAutoUnlockForType:(int64_t)a3
{
}

- (void)attemptAutoUnlockForType:(int64_t)a3 preventRadarNotification:(BOOL)a4
{
}

- (void)attemptAutoUnlockForType:(int64_t)a3 externalACMContext:(id)a4 preventRadarNotification:(BOOL)a5 bundlePath:(id)a6 appName:(id)a7 navBarTitle:(id)a8 reply:(id)a9
{
  BOOL v12 = a5;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a4;
  uint64_t v21 = auto_unlock_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v22 = a3 == 2;
    id v32 = v19;
    id v23 = v16;
    id v24 = v18;
    id v25 = v20;
    id v26 = v17;
    int64_t v27 = a3;
    BOOL v28 = v12;
    if (v22) {
      CFStringRef v29 = @"Approve with Apple Watch";
    }
    else {
      CFStringRef v29 = @"Auto Unlock";
    }
    NSErrorUserInfoKey v30 = (__CFString *)sub_1000D940C(0);
    *(_DWORD *)buf = 138412546;
    CFStringRef v35 = v29;
    BOOL v12 = v28;
    a3 = v27;
    id v17 = v26;
    id v20 = v25;
    id v18 = v24;
    id v16 = v23;
    id v19 = v32;
    __int16 v36 = 2112;
    uint64_t v37 = v30;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Begin %@: %@", buf, 0x16u);
  }
  kdebug_trace();
  [(SDAutoUnlockSessionManager *)self setAttemptActivatedHandler:v16];

  [(SDAutoUnlockSessionManager *)self setAttemptType:a3];
  [(SDAutoUnlockSessionManager *)self setAttemptBundlePath:v19];

  [(SDAutoUnlockSessionManager *)self setAttemptAppName:v18];
  [(SDAutoUnlockSessionManager *)self setAttemptNavBarTitle:v17];

  [(SDAutoUnlockSessionManager *)self setAttemptExternalACMContext:v20];
  [(SDAutoUnlockSessionManager *)self setPreventRadarNotification:v12];
  CFStringRef v31 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100095428;
  block[3] = &unk_1008CBF30;
  void block[4] = self;
  void block[5] = a3;
  dispatch_async(v31, block);
}

- (void)generateAttemptForType:(int64_t)a3
{
  id v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Test mode attempt", buf, 2u);
  }

  BOOL v6 = a3 == 2;
  id v7 = objc_alloc_init((Class)SFAutoUnlockDevice);
  [v7 setName:@"Apple Watch"];
  [v7 setModelName:@"Apple Watch"];
  id v8 = +[NSUUID UUID];
  uint64_t v9 = [v8 UUIDString];
  [v7 setUniqueID:v9];

  [(SDAutoUnlockSessionManager *)self notifyObserverOfAttemptBeganWithDevice:v7];
  uint64_t v10 = variable initialization expression of HeadphoneProxFeatureClient.delegate();
  uint64_t v11 = (uint64_t)sub_1000D34D4();
  uint64_t v12 = variable initialization expression of HeadphoneProxFeatureClient.delegate();
  uint64_t v13 = sub_1000D25CC();
  long long v14 = (void *)v13;
  id v15 = &off_100907400;
  if (v13) {
    id v15 = (_UNKNOWN **)v13;
  }
  id v16 = v15;

  [v16 doubleValue];
  dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
  id v19 = SFMainQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000956BC;
  block[3] = &unk_1008CBF58;
  id v23 = v7;
  id v24 = v16;
  uint64_t v27 = v11;
  uint64_t v28 = v12;
  id v25 = self;
  uint64_t v26 = v10;
  BOOL v29 = v6;
  id v20 = v16;
  id v21 = v7;
  dispatch_after(v18, v19, block);
}

- (void)failedAttemptBeforeStarting:(id)a3 metricErrorString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_assert_queue_V2(v8);

  [(SDAutoUnlockSessionManager *)self setAttemptStart:0];
  [(SDAutoUnlockSessionManager *)self setPrewarmStart:0];
  v15[0] = SDAutoUnlockManagerMetricSuccessKey;
  v15[1] = SDAutoUnlockManagerMetricErrorDomainKey;
  v16[0] = &off_100902868;
  v16[1] = SFAutoUnlockErrorDomain;
  v15[2] = SDAutoUnlockManagerMetricErrorCodeKey;
  uint64_t v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 code]);
  v16[2] = v9;
  v16[3] = v6;
  v15[3] = SDAutoUnlockManagerMetricErrorStringKey;
  v15[4] = @"SDAutoUnlockBypassMetricLog";
  v16[4] = &__kCFBooleanTrue;
  v15[5] = SDAutoUnlockManagerMetricConnectedBluetoothDevicesKey;
  uint64_t v10 = +[NSNumber numberWithInteger:[(SDAutoUnlockSessionManager *)self connectedBluetoothDevices]];
  v16[5] = v10;
  v15[6] = SDAutoUnlockManagerMetricTimeSinceLastWakeKey;
  uint64_t v11 = +[NSNumber numberWithInteger:[(SDAutoUnlockSessionManager *)self timeSinceLastMachineWake]];
  v16[6] = v11;
  v15[7] = SDAutoUnlockManagerMetricLastSleepTypeKey;
  uint64_t v12 = +[NSNumber numberWithInteger:[(SDAutoUnlockSessionManager *)self lastSleepType]];
  v16[7] = v12;
  uint64_t v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:8];

  id v14 = [v13 mutableCopy];
  [(SDAutoUnlockSessionManager *)self setCachedMetrics:v14];

  [(SDAutoUnlockSessionManager *)self notifyObserversOfUnlockFailureWithResults:v13 error:v7];
  [(SDAutoUnlockSessionManager *)self setLastSleepType:0];
  [(SDAutoUnlockSessionManager *)self setTimeSinceLastMachineWake:-1];
  [(SDAutoUnlockSessionManager *)self setConnectedBluetoothDevices:0];
}

- (void)attemptAutoUnlock
{
  if ([(SDAutoUnlockSessionManager *)self attemptInProgress]
    && [(SDAutoUnlockSessionManager *)self attemptPrewarmed])
  {
    [(SDAutoUnlockSessionManager *)self setAttemptPrewarmed:0];
    if ([(SDAutoUnlockSessionManager *)self isBeingUsedForSiri])
    {
      id v3 = auto_unlock_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SPI attempt overlap with prewarm attempt", buf, 2u);
      }

      uint64_t v4 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v145 = NSLocalizedDescriptionKey;
      CFStringRef v146 = @"SPI attempt overlap with prewarm attempt, try again when phone is not prewarming";
      id v5 = +[NSDictionary dictionaryWithObjects:&v146 forKeys:&v145 count:1];
      id v6 = +[NSError errorWithDomain:v4 code:219 userInfo:v5];

      [(SDAutoUnlockSessionManager *)self failedAttemptBeforeStarting:v6 metricErrorString:@"SPI attempt overlap with prewarm attempt, try again when phone is not prewarming"];
    }
    else
    {
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      v40 = [(SDAutoUnlockSessionManager *)self lockAuthSessions];
      id v6 = [v40 allValues];

      id v41 = [v6 countByEnumeratingWithState:&v117 objects:v147 count:16];
      if (v41)
      {
        id v42 = v41;
        uint64_t v43 = *(void *)v118;
        do
        {
          for (i = 0; i != v42; i = (char *)i + 1)
          {
            if (*(void *)v118 != v43) {
              objc_enumerationMutation(v6);
            }
            dispatch_queue_t v45 = *(void **)(*((void *)&v117 + 1) + 8 * i);
            if ([v45 attemptPrewarmed])
            {
              [v45 setDoNotPostUnlockConfirmation:-[SDAutoUnlockSessionManager doNotPostUnlockConfirmation](self, "doNotPostUnlockConfirmation")];
              [v45 completeAttemptIfNecessary];
            }
          }
          id v42 = [v6 countByEnumeratingWithState:&v117 objects:v147 count:16];
        }
        while (v42);
      }
    }
    goto LABEL_52;
  }
  if (![(SDAutoUnlockSessionManager *)self attemptInProgress])
  {
    v115[0] = _NSConcreteStackBlock;
    v115[1] = 3221225472;
    v115[2] = sub_100096E14;
    v115[3] = &unk_1008CBF80;
    v115[4] = self;
    id v116 = 0;
    uint64_t v9 = objc_retainBlock(v115);
    [(SDAutoUnlockSessionManager *)self setConnectedBluetoothDevices:variable initialization expression of HeadphoneProxFeatureClient.delegate()];
    [(SDAutoUnlockSessionManager *)self setTimeSinceLastMachineWake:(uint64_t)sub_1000D34D4()];
    [(SDAutoUnlockSessionManager *)self setLastSleepType:variable initialization expression of HeadphoneProxFeatureClient.delegate()];
    uint64_t v10 = objc_opt_new();
    [(SDAutoUnlockSessionManager *)self setAttemptStart:v10];

    uint64_t v11 = auto_unlock_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v12 = [(SDAutoUnlockSessionManager *)self attemptCount];
      int64_t v13 = [(SDAutoUnlockSessionManager *)self connectedBluetoothDevices];
      int64_t v14 = [(SDAutoUnlockSessionManager *)self timeSinceLastMachineWake];
      [(SDAutoUnlockSessionManager *)self lastSleepType];
      id v15 = sub_1000D35C4();
      *(_DWORD *)buf = 134218754;
      int64_t v138 = v12;
      __int16 v139 = 2048;
      int64_t v140 = v13;
      __int16 v141 = 2048;
      int64_t v142 = v14;
      __int16 v143 = 2112;
      v144 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Starting attempt (attempt count: %ld, bluetooth devices: %ld, time since last wake: %ld seconds, sleep type: %@)", buf, 0x2Au);
    }
    id v16 = [(SDAutoUnlockSessionManager *)self autoUnlockTransport];
    double v17 = [v16 enabledAutoUnlockDevicesUsingCache:1];
    dispatch_time_t v18 = [v17 allObjects];

    if ([v18 count])
    {
      id v19 = [(SDAutoUnlockSessionManager *)self isBluetoothEnabled];
      uint64_t v20 = v19[2]();

      id v21 = [(SDAutoUnlockSessionManager *)self isWifiEnabled];
      uint64_t v22 = v21[2]();

      if ((id)[(SDAutoUnlockSessionManager *)self attemptType] != (id)2 && (v22 & 1) == 0) {
        [(SDAutoUnlockSessionManager *)self presentedWiFiError];
      }
      id v23 = [(SDAutoUnlockSessionManager *)self isFaceIDEnabled];
      uint64_t v24 = v23[2]();

      if (v24)
      {
        if (v20 & v22)
        {
          id v25 = +[SDStatusMonitor sharedMonitor];
          unsigned int v26 = [v25 internetSharingEnabled];

          if (v26)
          {
            uint64_t v27 = auto_unlock_log();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "### Mac is internet sharing", buf, 2u);
            }

            uint64_t v28 = SFLocalizedStringForKey();
            uint64_t v29 = SFAutoUnlockErrorDomain;
            NSErrorUserInfoKey v131 = NSLocalizedDescriptionKey;
            v132 = v28;
            NSErrorUserInfoKey v30 = +[NSDictionary dictionaryWithObjects:&v132 forKeys:&v131 count:1];
            id v6 = +[NSError errorWithDomain:v29 code:146 userInfo:v30];

            [(SDAutoUnlockSessionManager *)self failedAttemptBeforeStarting:v6 metricErrorString:v28];
            ((void (*)(void *, void))v9[2])(v9, 0);
            goto LABEL_24;
          }
          id v56 = [(SDAutoUnlockSessionManager *)self isActiveDeviceNearby];
          int v57 = v56[2]();

          if ((v57 & 1) == 0)
          {
            v63 = auto_unlock_log();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "### Device is not nearby", buf, 2u);
            }

            uint64_t v64 = SFAutoUnlockErrorDomain;
            NSErrorUserInfoKey v129 = NSLocalizedDescriptionKey;
            CFStringRef v130 = @"Device not connected";
            v65 = +[NSDictionary dictionaryWithObjects:&v130 forKeys:&v129 count:1];
            id v6 = +[NSError errorWithDomain:v64 code:186 userInfo:v65];

            CFStringRef v39 = @"Device not nearby";
            goto LABEL_61;
          }
          objc_super v58 = [(SDAutoUnlockSessionManager *)self remotePeer];
          unsigned int v59 = [v58 isKeyBagLocked];

          if (v59)
          {
            v60 = auto_unlock_log();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "### Watch needs to be unlocked", buf, 2u);
            }

            uint64_t v61 = SFAutoUnlockErrorDomain;
            NSErrorUserInfoKey v127 = NSLocalizedDescriptionKey;
            CFStringRef v128 = @"Watch needs to be unlocked";
            v62 = +[NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];
            id v6 = +[NSError errorWithDomain:v61 code:102 userInfo:v62];

            CFStringRef v39 = @"Watch locked and unarmed";
LABEL_61:
            uint64_t v37 = self;
            v38 = v6;
            goto LABEL_29;
          }
          [(SDAutoUnlockSessionManager *)self attemptCount];
          v66 = [(SDAutoUnlockSessionManager *)self remotePeer];
          int v67 = [v66 canPerformUnlocks];

          if (v67)
          {
            [(SDAutoUnlockSessionManager *)self lastUnlockDate];

            uint64_t v28 = +[NSDate dateWithTimeIntervalSinceNow:-23400.0];
            v68 = [(SDAutoUnlockSessionManager *)self lastUnlockDate];
            [v68 timeIntervalSinceDate:v28];
            double v70 = v69;

            if (v70 < 0.0)
            {
              v84 = auto_unlock_log();
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
              {
                v85 = [(SDAutoUnlockSessionManager *)self lastUnlockDate];
                *(_DWORD *)buf = 138412546;
                int64_t v138 = (int64_t)v85;
                __int16 v139 = 2112;
                int64_t v140 = (int64_t)v28;
                _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "Last unlock date: %@, should be after: %@", buf, 0x16u);
              }
            }
            else if (![(SDAutoUnlockSessionManager *)self lastLockedByRelock])
            {
              v104 = v28;
              sub_1000D2CF0(1);
              [(SDAutoUnlockSessionManager *)self setAttemptInProgress:1];
              v71 = +[NSUUID UUID];
              v72 = [v71 UUIDString];
              [(SDAutoUnlockSessionManager *)self setAttemptID:v72];

              v73 = objc_opt_new();
              long long v111 = 0u;
              long long v112 = 0u;
              long long v113 = 0u;
              long long v114 = 0u;
              id obj = v18;
              id v74 = [obj countByEnumeratingWithState:&v111 objects:v122 count:16];
              if (v74)
              {
                id v75 = v74;
                uint64_t v106 = *(void *)v112;
                v103 = v73;
                while (2)
                {
                  for (j = 0; j != v75; j = (char *)j + 1)
                  {
                    if (*(void *)v112 != v106) {
                      objc_enumerationMutation(obj);
                    }
                    v77 = *(void **)(*((void *)&v111 + 1) + 8 * (void)j);
                    v78 = [v77 uniqueID];
                    v79 = [(SDAutoUnlockSessionManager *)self remotePeer];
                    v80 = [v79 deviceID];
                    unsigned int v81 = [v78 isEqualToString:v80];

                    if (v81)
                    {
                      v73 = v103;
                      [v103 addObject:v77];
                      goto LABEL_93;
                    }
                  }
                  id v75 = [obj countByEnumeratingWithState:&v111 objects:v122 count:16];
                  v73 = v103;
                  if (v75) {
                    continue;
                  }
                  break;
                }
              }
LABEL_93:

              [(SDAutoUnlockSessionManager *)self setScanAutoUnlockDevices:v73];
              v94 = +[SDNearbyAgent sharedNearbyAgent];
              [v94 setAutoUnlockActive:1];

              long long v109 = 0u;
              long long v110 = 0u;
              long long v107 = 0u;
              long long v108 = 0u;
              v89 = v73;
              id v95 = [(__CFString *)v89 countByEnumeratingWithState:&v107 objects:v121 count:16];
              if (v95)
              {
                id v96 = v95;
                LODWORD(v97) = 0;
                uint64_t v98 = *(void *)v108;
                do
                {
                  for (k = 0; k != v96; k = (char *)k + 1)
                  {
                    if (*(void *)v108 != v98) {
                      objc_enumerationMutation(v89);
                    }
                    v100 = *(void **)(*((void *)&v107 + 1) + 8 * (void)k);
                    if ([v100 supportsHEIC]) {
                      int v101 = 2;
                    }
                    else {
                      int v101 = 1;
                    }
                    uint64_t v97 = v101 | v97;
                    [(SDAutoUnlockSessionManager *)self createLockSessionWithWatchDevice:v100];
                  }
                  id v96 = [(__CFString *)v89 countByEnumeratingWithState:&v107 objects:v121 count:16];
                }
                while (v96);
              }
              else
              {
                uint64_t v97 = 0;
              }

              if ((id)[(SDAutoUnlockSessionManager *)self attemptType] == (id)2) {
                [(SDAutoUnlockSessionManager *)self generateAppIconImageWithOptions:v97];
              }
              v102 = auto_unlock_log();
              uint64_t v28 = v104;
              if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                int64_t v138 = (int64_t)v89;
                _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "Connecting to watches: %@", buf, 0xCu);
              }

              ((void (*)(void *, uint64_t))v9[2])(v9, 1);
              id v6 = 0;
              goto LABEL_110;
            }
            v86 = auto_unlock_log();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
            {
              if (v70 < 0.0) {
                CFStringRef v87 = @"NO";
              }
              else {
                CFStringRef v87 = @"YES";
              }
              if ([(SDAutoUnlockSessionManager *)self lastLockedByRelock]) {
                CFStringRef v88 = @"YES";
              }
              else {
                CFStringRef v88 = @"NO";
              }
              *(_DWORD *)buf = 138412546;
              int64_t v138 = (int64_t)v87;
              __int16 v139 = 2112;
              int64_t v140 = (int64_t)v88;
              _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "### Device needs to be unlocked through another method first (unlocked recently: %@, last locked by relock %@)", buf, 0x16u);
            }

            if (v70 < 0.0)
            {
              v89 = +[NSString stringWithFormat:@"No unlocks in the last %f hrs", 0x4018000000000000];
              uint64_t v90 = 214;
            }
            else
            {
              v89 = @"Blocked PAU attempt due to Relock";
              uint64_t v90 = 216;
            }
            v91 = SFLocalizedStringForKey();
            uint64_t v92 = SFAutoUnlockErrorDomain;
            NSErrorUserInfoKey v123 = NSLocalizedDescriptionKey;
            v124 = v91;
            v93 = +[NSDictionary dictionaryWithObjects:&v124 forKeys:&v123 count:1];
            id v6 = +[NSError errorWithDomain:v92 code:v90 userInfo:v93];

            [(SDAutoUnlockSessionManager *)self failedAttemptBeforeStarting:v6 metricErrorString:v89];
            ((void (*)(void *, void))v9[2])(v9, 0);

LABEL_110:
LABEL_24:

LABEL_51:
            goto LABEL_52;
          }
          v82 = auto_unlock_log();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "### Device needs to be unlocked through another method first (device armed: NO)", buf, 2u);
          }

          uint64_t v83 = SFAutoUnlockErrorDomain;
          NSErrorUserInfoKey v125 = NSLocalizedDescriptionKey;
          CFStringRef v33 = @"Token not armed";
          CFStringRef v126 = @"Token not armed";
          v34 = +[NSDictionary dictionaryWithObjects:&v126 forKeys:&v125 count:1];
          uint64_t v35 = v83;
          uint64_t v36 = 213;
LABEL_28:
          id v6 = +[NSError errorWithDomain:v35 code:v36 userInfo:v34];

          uint64_t v37 = self;
          v38 = v6;
          CFStringRef v39 = v33;
LABEL_29:
          [(SDAutoUnlockSessionManager *)v37 failedAttemptBeforeStarting:v38 metricErrorString:v39];
          ((void (*)(void *, void))v9[2])(v9, 0);
          goto LABEL_51;
        }
      }
      else
      {
        v46 = auto_unlock_log();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "### FaceID disabled. Disabling Auto Unlock for all key devices", buf, 2u);
        }

        [(SDAutoUnlockSessionManager *)self disableAutoUnlockForAllWatches];
      }
      uint64_t v47 = auto_unlock_log();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v48 = @"YES";
        if (v20) {
          CFStringRef v49 = @"NO";
        }
        else {
          CFStringRef v49 = @"YES";
        }
        if (v22) {
          CFStringRef v48 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        int64_t v138 = (int64_t)v49;
        __int16 v139 = 2112;
        int64_t v140 = (int64_t)v48;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "### Interfaces off (bluetooth off: %@, wifi off: %@)", buf, 0x16u);
      }

      int64_t v50 = [(SDAutoUnlockSessionManager *)self errorCodeForBluetoothEnabled:v20 wifiEnabled:v22 faceIDEnabled:v24];
      id v51 = [(SDAutoUnlockSessionManager *)self errorStringForBluetoothEnabled:v20 wifiEnabled:v22 faceIDEnabled:v24];
      BOOL v52 = [(SDAutoUnlockSessionManager *)self shouldShowErrorForBluetoothEnabled:v20];
      uint64_t v53 = SFAutoUnlockErrorDomain;
      v134[0] = v51;
      v133[0] = NSLocalizedDescriptionKey;
      v133[1] = @"SDAutoUnlockShowScreenLockError";
      id v54 = +[NSNumber numberWithBool:v52];
      v134[1] = v54;
      v55 = +[NSDictionary dictionaryWithObjects:v134 forKeys:v133 count:2];
      id v6 = +[NSError errorWithDomain:v53 code:v50 userInfo:v55];

      [(SDAutoUnlockSessionManager *)self failedAttemptBeforeStarting:v6 metricErrorString:v51];
      ((void (*)(void *, void))v9[2])(v9, 0);

      goto LABEL_51;
    }
    CFStringRef v31 = auto_unlock_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "### No enabled devices for attempt", buf, 2u);
    }

    uint64_t v32 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v135 = NSLocalizedDescriptionKey;
    CFStringRef v33 = @"No enabled devices";
    CFStringRef v136 = @"No enabled devices";
    v34 = +[NSDictionary dictionaryWithObjects:&v136 forKeys:&v135 count:1];
    uint64_t v35 = v32;
    uint64_t v36 = 117;
    goto LABEL_28;
  }
  id v6 = auto_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [(SDAutoUnlockSessionManager *)self attemptInProgress];
    CFStringRef v8 = @"NO";
    if (v7) {
      CFStringRef v8 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    int64_t v138 = (int64_t)v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempt already in progress (progress state: %@)", buf, 0xCu);
  }
LABEL_52:
}

- (void)prewarmAutoUnlock
{
  id v3 = [(SDAutoUnlockSessionManager *)self localDeviceController];
  unsigned int v4 = [v3 shouldPrewarmAttempt];

  if (v4)
  {
    id v5 = auto_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Beginning prewarming of unlock attempt", v7, 2u);
    }

    [(SDAutoUnlockSessionManager *)self setAttemptPrewarmed:1];
    id v6 = objc_opt_new();
    [(SDAutoUnlockSessionManager *)self setPrewarmStart:v6];

    [(SDAutoUnlockSessionManager *)self attemptAutoUnlockForType:1];
  }
  else
  {
    [(SDAutoUnlockSessionManager *)self setAttemptPrewarmed:0];
  }
}

- (void)attemptAutoUnlockForSiri
{
  id v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "attemptAutoUnlockForSiri", v4, 2u);
  }

  [(SDAutoUnlockSessionManager *)self setIsBeingUsedForSiri:1];
  [(SDAutoUnlockSessionManager *)self attemptAutoUnlockForType:1];
}

- (void)attemptAutoUnlockWithoutNotifyingWatch
{
  id v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Calling attemptAutoUnlockWithoutNotifyingWatch", v4, 2u);
  }

  [(SDAutoUnlockSessionManager *)self setDoNotPostUnlockConfirmation:1];
  [(SDAutoUnlockSessionManager *)self attemptAutoUnlockForType:1];
}

- (void)completeAutoUnlockWithNotification:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Complete Auto Unlock, Post Notification: %@", buf, 0xCu);
  }

  unsigned int v7 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100097258;
  v8[3] = &unk_1008CB9D8;
  v8[4] = self;
  BOOL v9 = v3;
  dispatch_async(v7, v8);
}

- (void)donateDeviceUnlockedWithMask:(BOOL)a3
{
  BOOL v4 = !a3;
  id v5 = +[NSNumber numberWithInt:v4];
  CFStringRef v6 = [(SDAutoUnlockSessionManager *)self cachedMetrics];
  [v6 setObject:v5 forKeyedSubscript:SDAutoUnlockManagerMetricMaskKey];

  id v7 = [(SDAutoUnlockSessionManager *)self localDeviceController];
  [v7 deviceUnlockedWithMask:v4];
}

- (void)invalidateAttempt
{
  BOOL v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating attempt", buf, 2u);
  }

  [(SDAutoUnlockSessionManager *)self setAttemptActivatedHandler:0];
  [(SDAutoUnlockSessionManager *)self setAttemptType:0];
  [(SDAutoUnlockSessionManager *)self setAttemptDevice:0];
  [(SDAutoUnlockSessionManager *)self setAttemptExternalACMContext:0];
  [(SDAutoUnlockSessionManager *)self setAttemptBundlePath:0];
  [(SDAutoUnlockSessionManager *)self setAttemptAppName:0];
  [(SDAutoUnlockSessionManager *)self setAttemptID:0];
  [(SDAutoUnlockSessionManager *)self setAttemptStart:0];
  [(SDAutoUnlockSessionManager *)self setPrewarmStart:0];
  [(SDAutoUnlockSessionManager *)self setAuthSessionError:0];
  [(SDAutoUnlockSessionManager *)self setIncrementedCountID:0];
  [(SDAutoUnlockSessionManager *)self setLastSleepType:0];
  [(SDAutoUnlockSessionManager *)self setTimeSinceLastMachineWake:-1];
  [(SDAutoUnlockSessionManager *)self setConnectedBluetoothDevices:0];
  [(SDAutoUnlockSessionManager *)self setAttemptPrewarmed:0];
  [(SDAutoUnlockSessionManager *)self setAttemptInProgress:0];
  [(SDAutoUnlockSessionManager *)self setProxyNotAvailableForUnlock:0];
  [(SDAutoUnlockSessionManager *)self setScanWatchIDs:0];
  [(SDAutoUnlockSessionManager *)self setScanPhoneIDs:0];
  [(SDAutoUnlockSessionManager *)self setScanAutoUnlockDevices:0];
  [(SDAutoUnlockSessionManager *)self setDoNotPostUnlockConfirmation:0];
  [(SDAutoUnlockSessionManager *)self invalidateScanner];
  BOOL v4 = +[SDNearbyAgent sharedNearbyAgent];
  [v4 setAutoUnlockActive:0];

  [(SDAutoUnlockSessionManager *)self setIsBeingUsedForSiri:0];
  [(SDAutoUnlockSessionManager *)self cleanUpProxySessions];
  sub_1000D2CF0(0);
  id v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Posting state changed: Attempt invalidated", v9, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, SFAutoUnlockStateChangedNotification, 0, 0, 1u);
  if ([(SDAutoUnlockSessionManager *)self wifiStateNeedsUpdating])
  {
    id v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating WiFi state after attempt", v8, 2u);
    }

    [(SDAutoUnlockSessionManager *)self handleWiFiPowerChanged:0];
  }
}

- (void)completeSuccessfulAttempt
{
  [(SDAutoUnlockSessionManager *)self setLastUnlockedByWatch:1];

  [(SDAutoUnlockSessionManager *)self grabLanguageAssertionForAutoRelock];
}

- (void)cancelAutoUnlock
{
}

- (void)cancelAutoUnlockWithCancelReason:(int64_t)a3 usingTool:(BOOL)a4
{
  id v7 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100097A84;
  block[3] = &unk_1008CBFA8;
  BOOL v9 = a4;
  void block[4] = self;
  void block[5] = a3;
  dispatch_async(v7, block);
}

- (void)cancelAttemptsForDeviceUnlocked
{
  BOOL v3 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_assert_queue_V2(v3);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v4 = [(SDAutoUnlockSessionManager *)self lockAuthSessions];
  id v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      BOOL v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) aksSuccess])
        {

          uint64_t v10 = auto_unlock_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)CFStringRef v11 = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Canceling attempt in progress – device unlocked", v11, 2u);
          }

          [(SDAutoUnlockSessionManager *)self cancelAutoUnlock];
          return;
        }
        BOOL v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
}

- (void)logUnintentionalAutoUnlockAttempt:(unint64_t)a3
{
  id v5 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009823C;
  v6[3] = &unk_1008CBF30;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)incrementAttemptCount
{
  BOOL v3 = +[SDStatusMonitor sharedMonitor];
  unsigned __int8 v4 = [v3 deviceKeyBagUnlocked];

  if ((v4 & 1) == 0)
  {
    id v5 = [(SDAutoUnlockSessionManager *)self attemptID];
    id v6 = [(SDAutoUnlockSessionManager *)self incrementedCountID];
    unsigned __int8 v7 = [v5 isEqualToString:v6];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = [(SDAutoUnlockSessionManager *)self attemptID];
      [(SDAutoUnlockSessionManager *)self setIncrementedCountID:v8];

      [(SDAutoUnlockSessionManager *)self setAttemptCount:(char *)[(SDAutoUnlockSessionManager *)self attemptCount] + 1];
      BOOL v9 = auto_unlock_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109120;
        v10[1] = [(SDAutoUnlockSessionManager *)self attemptCount];
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Incremented attempt count %d", (uint8_t *)v10, 8u);
      }
    }
  }
}

- (void)decrementAttemptCount
{
  if ([(SDAutoUnlockSessionManager *)self attemptCount] >= 1)
  {
    BOOL v3 = auto_unlock_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Decrementing", v4, 2u);
    }

    [(SDAutoUnlockSessionManager *)self setAttemptCount:(char *)[(SDAutoUnlockSessionManager *)self attemptCount] - 1];
  }
}

- (void)requestRelock
{
  BOOL v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sending relock request", v7, 2u);
  }

  unsigned __int8 v4 = objc_alloc_init(SDAutoUnlockRelockRequest);
  [(SDAutoUnlockRelockRequest *)v4 setVersion:1];
  id v5 = [(SDAutoUnlockRelockRequest *)v4 data];
  id v6 = [(SDAutoUnlockSessionManager *)self magnetTransport];
  [v6 sendProtocolBufferData:v5 withType:110 timeout:0 option:1 errorHandler:&stru_1008CBFC8];
}

- (void)autoUnlockStateWithCompletionHandler:(id)a3
{
  unsigned __int8 v4 = (void (**)(id, void *, void))a3;
  if ([(SDAutoUnlockSessionManager *)self attemptInProgress])
  {
    id v5 = [(SDAutoUnlockSessionManager *)self attemptDevice];

    if (v5) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 2;
    }
  }
  else
  {
    uint64_t v6 = 1;
  }
  unsigned __int8 v7 = auto_unlock_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ([(SDAutoUnlockSessionManager *)self attemptInProgress]) {
      CFStringRef v8 = @"YES";
    }
    else {
      CFStringRef v8 = @"NO";
    }
    BOOL v9 = [(SDAutoUnlockSessionManager *)self attemptDevice];
    uint64_t v10 = [(SDAutoUnlockSessionManager *)self stringForState:v6];
    int v12 = 138412802;
    CFStringRef v13 = v8;
    __int16 v14 = 2112;
    long long v15 = v9;
    __int16 v16 = 2112;
    double v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "State requested (attempt in progress: %@, device: %@, state: %@)", (uint8_t *)&v12, 0x20u);
  }
  CFStringRef v11 = +[NSNumber numberWithInteger:v6];
  v4[2](v4, v11, 0);
}

- (id)stringForState:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unexpected";
  }
  else {
    return *(&off_1008CC0E0 + a3);
  }
}

- (void)authPromptInfoWithCompletionHandler:(id)a3
{
  BOOL v3 = (void (**)(id, void *, void))a3;
  unsigned __int8 v4 = auto_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Returning auth prompt info", v7, 2u);
  }

  id v5 = +[SDAutoUnlockNotificationsManager sharedManager];
  uint64_t v6 = [v5 notificationModel];
  v3[2](v3, v6, 0);
}

- (BOOL)disablePairingForDeviceID:(id)a3 pairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = auto_unlock_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Disabling (device ID: %@, pairingID: %@)", (uint8_t *)&v12, 0x16u);
  }

  BOOL v9 = +[SDAutoUnlockAKSManager sharedManager];
  unsigned __int8 v10 = [v9 disablePairingWithKeyDevice:v6];

  [(SDAutoUnlockSessionManager *)self sendDisableMessageToDeviceID:v6 pairingID:v7];
  return v10;
}

- (void)sendDisableMessageToDeviceID:(id)a3 pairingID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(SDUnlockDisable);
  [(SDUnlockDisable *)v7 setVersion:1];
  [(SDUnlockDisable *)v7 setPairingID:v6];

  CFStringRef v8 = auto_unlock_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = (objc_class *)objc_opt_class();
    unsigned __int8 v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138412546;
    dispatch_time_t v18 = v10;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending %@ %@", buf, 0x16u);
  }
  CFStringRef v11 = +[SDAutoUnlockTransport sharedTransport];
  int v12 = [(SDUnlockDisable *)v7 data];
  id v13 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100098C18;
  v15[3] = &unk_1008CA5A8;
  id v16 = v5;
  id v14 = v5;
  [v11 sendPayload:v12 toDevice:v14 type:2 sessionID:0 timeout:v13 errorHandler:v15];
}

- (void)transport:(id)a3 didReceiveDisableMessage:(id)a4 fromDeviceID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100098D54;
  block[3] = &unk_1008CAF18;
  id v13 = v8;
  id v14 = v7;
  id v15 = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, block);
}

- (void)handleDisableMessageForKey:(id)a3 fromDeviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SDAutoUnlockAKSManager sharedManager];
  BOOL v9 = [v8 keyPairingIDForDeviceID:v7];

  id v10 = [(SDAutoUnlockSessionManager *)self keyPairingSessions];
  id v11 = [v10 objectForKeyedSubscript:v7];

  if (v9)
  {
    int v12 = [v6 pairingID];
    unsigned __int8 v13 = [v12 isEqualToString:v9];

    if ((v13 & 1) == 0 && !v11)
    {
      id v14 = auto_unlock_log();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:

        goto LABEL_14;
      }
      id v15 = [v6 pairingID];
      int v25 = 138412546;
      id v26 = v9;
      __int16 v27 = 2112;
      uint64_t v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not disabling (local pairingID: %@, received pairingID: %@)", (uint8_t *)&v25, 0x16u);
LABEL_6:

      goto LABEL_13;
    }
  }
  if (v11)
  {
    [v11 cancel];
    id v16 = [v6 pairingID];

    if (v16)
    {
      double v17 = [(SDAutoUnlockSessionManager *)self canceledPairingKeySessions];
      dispatch_time_t v18 = [v6 pairingID];
      [v17 addObject:v18];
    }
    __int16 v19 = [v11 sessionID];
    uint64_t v20 = [v19 UUIDString];
    id v21 = [v6 pairingID];
    unsigned int v22 = [v20 isEqualToString:v21];

    if (!v22)
    {
      id v14 = auto_unlock_log();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      id v15 = [v6 pairingID];
      id v23 = [v11 sessionID];
      uint64_t v24 = [v23 UUIDString];
      int v25 = 138412802;
      id v26 = v7;
      __int16 v27 = 2112;
      uint64_t v28 = v15;
      __int16 v29 = 2112;
      NSErrorUserInfoKey v30 = v24;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "### Received disable while enabling device but pairing IDs don't match (lock device: %@, received pairing ID: %@, session ID: %@)", (uint8_t *)&v25, 0x20u);

      goto LABEL_6;
    }
  }
  [(SDAutoUnlockSessionManager *)self disableKeyPairingForDeviceID:v7];
LABEL_14:
}

- (void)handleDisableMessageForLock:(id)a3 fromDeviceID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[SDAutoUnlockAKSManager sharedManager];
  id v8 = [v7 pairingIDForWatchID:v6];

  if (v8
    && [v5 hasPairingID]
    && ([v5 pairingID],
        BOOL v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 isEqualToString:v8],
        v9,
        !v10))
  {
    id v11 = auto_unlock_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [v5 pairingID];
      int v13 = 138412546;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not disabling (local pairingID: %@, received pairingID: %@)", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    id v11 = +[SDAutoUnlockAKSManager sharedManager];
    [v11 disablePairingWithKeyDevice:v6];
  }
}

- (void)disableKeyPairingForDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = +[SDAutoUnlockAKSManager sharedManager];
  [v5 deleteEscrowSecretForDeviceID:v4];

  id v6 = +[SDAutoUnlockAKSManager sharedManager];
  [v6 deleteRangingKeyForDeviceID:v4];

  id v7 = +[SDAutoUnlockTransport sharedTransport];
  id v8 = [v7 deviceTypeForDeviceID:v4];

  if (v8 == (id)2)
  {
    BOOL v9 = auto_unlock_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Removing remote LTK for %@", (uint8_t *)&v11, 0xCu);
    }

    unsigned int v10 = +[SDAutoUnlockAKSManager sharedManager];
    [v10 removeRemoteLTKForDeviceID:v4];
  }
  [(SDAutoUnlockSessionManager *)self updateAdvertising];
}

- (void)createPairingLockSessionWithDevice:(id)a3 passcode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SDAutoUnlockSessionManager *)self lockPairingSessions];
  BOOL v9 = [v6 uniqueID];
  unsigned int v10 = [v8 objectForKeyedSubscript:v9];

  if (!v10)
  {
    int v13 = [SDAutoUnlockPairingLockSession alloc];
    id v14 = [v6 uniqueID];
    __int16 v15 = +[NSUUID UUID];
    int v11 = [(SDAutoUnlockPairingLockSession *)v13 initWithDevice:v14 sessionID:v15];

    [v11 setDelegate:self];
    [v11 setPasscode:v7];
    -[NSObject setPlaceholder:](v11, "setPlaceholder:", [v6 placeholder]);
    id v16 = [(SDAutoUnlockSessionManager *)self suggestionManager];
    double v17 = [v16 suggestedDeviceID];
    dispatch_time_t v18 = [v6 uniqueID];
    id v19 = [v17 isEqualToString:v18];

    if (v19)
    {
      uint64_t v20 = [(SDAutoUnlockSessionManager *)self suggestionManager];
      [v20 setSuggestedDeviceID:0];
    }
    id v21 = [(SDAutoUnlockSessionManager *)self suggestionManager];
    unsigned int v22 = [v21 setupRetryDeviceID];
    id v23 = [v6 uniqueID];
    id v24 = [v22 isEqualToString:v23];

    if (v24)
    {
      int v25 = [(SDAutoUnlockSessionManager *)self suggestionManager];
      [v25 setSetupRetryDeviceID:0];
    }
    [v11 setSetupRetryDevice:v24];
    [v11 setUpsellDevice:v19];
    [v11 start];
    id v12 = [(SDAutoUnlockSessionManager *)self lockPairingSessions];
    id v26 = [v6 uniqueID];
    [v12 setObject:v11 forKeyedSubscript:v26];

    goto LABEL_9;
  }
  int v11 = auto_unlock_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(SDAutoUnlockSessionManager *)self lockPairingSessions];
    int v27 = 138412290;
    uint64_t v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Pairing lock session in progress %@", (uint8_t *)&v27, 0xCu);
LABEL_9:
  }
}

- (void)createPairingKeySessionWithIdentifier:(id)a3 deviceID:(id)a4 requestData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    int v11 = [(SDAutoUnlockSessionManager *)self keyPairingSessions];
    id v12 = [v11 objectForKeyedSubscript:v9];

    if (v12)
    {
      auto_unlock_log();
      int v13 = (SDAutoUnlockPairingKeySession *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v13->super.super, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        goto LABEL_11;
      }
      id v14 = [(SDAutoUnlockSessionManager *)self keyPairingSessions];
      int v17 = 138412290;
      dispatch_time_t v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, &v13->super.super, OS_LOG_TYPE_DEFAULT, "Pairing key session in progress %@", (uint8_t *)&v17, 0xCu);
    }
    else
    {
      int v13 = [[SDAutoUnlockPairingKeySession alloc] initWithDevice:v9 sessionID:v8];
      [(SDAutoUnlockPairingSession *)v13 setDelegate:self];
      [(SDAutoUnlockPairingKeySession *)v13 setRequestData:v10];
      [(SDAutoUnlockPairingKeySession *)v13 start];
      id v14 = [(SDAutoUnlockSessionManager *)self keyPairingSessions];
      [v14 setObject:v13 forKeyedSubscript:v9];
    }

    goto LABEL_10;
  }
  __int16 v15 = auto_unlock_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1000A44F0();
  }

  id v16 = +[SDAutoUnlockTransport sharedTransport];
  [v16 logDevices];

LABEL_11:
}

- (void)createLockSessionWithWatchDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)SFBLEDevice);
  id v6 = [v4 bluetoothID];
  [v5 setIdentifier:v6];

  [v5 setUseBTPipe:1];
  id v7 = [(SDAutoUnlockSessionManager *)self lockAuthSessions];
  id v8 = [v5 identifier];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v12 = [SDAutoUnlockLockSession alloc];
    int v13 = +[NSUUID UUID];
    id v10 = [(SDAutoUnlockLockSession *)v12 initWithAutoUnlockDevice:v4 sessionID:v13 bleDevice:v5];

    [v10 setUseProxy:0];
    id v14 = [(SDAutoUnlockSessionManager *)self attemptStart];
    [v10 setAttemptStartDate:v14];

    __int16 v15 = [(SDAutoUnlockSessionManager *)self prewarmStart];
    [v10 setPrewarmStartDate:v15];

    [v10 setAttemptType:[(SDAutoUnlockSessionManager *)self attemptType]];
    -[NSObject setUseEncryption:](v10, "setUseEncryption:", [v4 supportsEncryption]);
    [v10 setConnectedBluetoothDevices:[(SDAutoUnlockSessionManager *)self connectedBluetoothDevices]];
    [v10 setTimeSinceLastMachineWake:[(SDAutoUnlockSessionManager *)self timeSinceLastMachineWake]];
    [v10 setLastSleepType:[(SDAutoUnlockSessionManager *)self lastSleepType]];
    [v10 setAttemptPrewarmed:[(SDAutoUnlockSessionManager *)self attemptPrewarmed]];
    [v10 setDoNotPostUnlockConfirmation:[(SDAutoUnlockSessionManager *)self doNotPostUnlockConfirmation]];
    [v10 setIsAuthenticatingForSiri:[(SDAutoUnlockSessionManager *)self isBeingUsedForSiri]];
    [v10 setDelegate:self];
    id v16 = [(SDAutoUnlockSessionManager *)self lastUnlockDate];
    [v10 setLastLocalUnlockDate:v16];

    int v17 = [(SDAutoUnlockSessionManager *)self lockStateChangedDate];
    [v17 timeIntervalSinceNow];
    double v19 = v18;

    uint64_t v20 = auto_unlock_log();
    id v21 = v20;
    if (v19 < (double)-480)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_1000A4524(480, self, v21);
      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v22 = [(SDAutoUnlockSessionManager *)self lockStateChangedDate];
      int v29 = 67109378;
      LODWORD(v30[0]) = 8;
      WORD2(v30[0]) = 2112;
      *(void *)((char *)v30 + 6) = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Phone was used within the last %d min. Last lock/unlock date: %@. Telling Watch to skip motion check", (uint8_t *)&v29, 0x12u);
    }
    [v10 setSkipMotionCheck:v19 >= (double)-480];
    if ((id)[(SDAutoUnlockSessionManager *)self attemptType] == (id)2)
    {
      id v23 = auto_unlock_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [(SDAutoUnlockSessionManager *)self attemptExternalACMContext];
        int v29 = 138412290;
        v30[0] = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Lock session setting context %@", (uint8_t *)&v29, 0xCu);
      }
      int v25 = [(SDAutoUnlockSessionManager *)self attemptExternalACMContext];
      [v10 setExternalACMContext:v25];
    }
    id v26 = [(SDAutoUnlockSessionManager *)self locksWithAKSTokens];
    int v27 = [v4 uniqueID];
    -[NSObject setUseAKSToken:](v10, "setUseAKSToken:", [v26 containsObject:v27]);

    [v10 start];
    int v11 = [(SDAutoUnlockSessionManager *)self lockAuthSessions];
    uint64_t v28 = [v5 identifier];
    [v11 setObject:v10 forKeyedSubscript:v28];

    goto LABEL_14;
  }
  id v10 = auto_unlock_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = [(SDAutoUnlockSessionManager *)self lockAuthSessions];
    int v29 = 138412290;
    v30[0] = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Auth lock session in progress %@", (uint8_t *)&v29, 0xCu);
LABEL_14:
  }
}

- (void)createKeySessionWithBLEDevice:(id)a3 sessionID:(id)a4 wrapper:(id)a5 useEncryption:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [(SDAutoUnlockSessionManager *)self invalidateExistingSessionsForBLEDevice:v10 incomingSessionID:v11];
  int v13 = [(SDAutoUnlockSessionManager *)self keyAuthSessions];
  id v14 = [v11 UUIDString];
  __int16 v15 = [v13 objectForKeyedSubscript:v14];

  if (!v15)
  {
    id v16 = [[SDAutoUnlockKeySession alloc] initWithBLEDevice:v10 sessionID:v11];
    [(SDAutoUnlockPairingSession *)v16 setDelegate:self];
    [(SDAutoUnlockAuthSession *)v16 setUseEncryption:v6];
    double v18 = [(SDAutoUnlockSessionManager *)self keysWithAKSTokens];
    double v19 = [v10 identifier];
    -[SDAutoUnlockAuthSession setUseAKSToken:](v16, "setUseAKSToken:", [v18 containsObject:v19]);

    [(SDAutoUnlockKeySession *)v16 setLocalDeviceNeedsArming:[(SDAutoUnlockSessionManager *)self needsArming]];
    uint64_t v20 = [(SDAutoUnlockSessionManager *)self keysWithAKSTokens];
    id v21 = [v10 identifier];
    [v20 removeObject:v21];

    [(SDAutoUnlockKeySession *)v16 setWifiEnabled:[(SDAutoUnlockSessionManager *)self cachedWatchWiFiState]];
    unsigned int v22 = [(SDAutoUnlockSessionManager *)self localDeviceController];
    id v23 = [v22 wakeGestureDates];
    [(SDAutoUnlockKeySession *)v16 setWakeGestureDates:v23];

    id v24 = [(SDAutoUnlockSessionManager *)self unlockedOnWristDate];
    [(SDAutoUnlockKeySession *)v16 setUnlockedOnWristDate:v24];

    [(SDAutoUnlockKeySession *)v16 setNeedsStrictMotionCheck:[(SDAutoUnlockSessionManager *)self needsStrictMotionCheck]];
    [(SDAutoUnlockAuthSession *)v16 start];
    [(SDAutoUnlockKeySession *)v16 handleMessageWithWrapper:v12];
    int v17 = [(SDAutoUnlockSessionManager *)self keyAuthSessions];
    int v25 = [v11 UUIDString];
    [v17 setObject:v16 forKeyedSubscript:v25];

    goto LABEL_5;
  }
  auto_unlock_log();
  id v16 = (SDAutoUnlockKeySession *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v16->super.super.super, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = [(SDAutoUnlockSessionManager *)self keyAuthSessions];
    int v26 = 138412290;
    int v27 = v17;
    _os_log_impl((void *)&_mh_execute_header, &v16->super.super.super, OS_LOG_TYPE_DEFAULT, "Auth key session in progress %@", (uint8_t *)&v26, 0xCu);
LABEL_5:
  }
}

- (void)createProxySessionWithDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = +[SDAutoUnlockTransport sharedTransport];
  BOOL v6 = [v5 bluetoothIDForIDSID:v4];
  id v7 = objc_alloc_init((Class)SFBLEDevice);
  [v7 setIdentifier:v6];
  id v8 = [(SDAutoUnlockSessionManager *)self proxySessions];
  id v9 = [v7 identifier];
  id v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    id v11 = auto_unlock_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Already sent trigger to device", v19, 2u);
    }
  }
  else
  {
    kdebug_trace();
    id v12 = [SDAutoUnlockProxySession alloc];
    int v13 = +[NSUUID UUID];
    id v14 = [(SDAutoUnlockProxySession *)v12 initWithDevice:v4 sessionID:v13 bleDevice:v7];

    __int16 v15 = [v5 modelIdentifierForDeviceID:v4];
    [(SDAutoUnlockProxySession *)v14 setModel:v15];

    id v16 = [(SDAutoUnlockSessionManager *)self attemptStart];
    [(SDAutoUnlockProxySession *)v14 setStartDate:v16];

    [(SDAutoUnlockPairingSession *)v14 setDelegate:self];
    [(SDAutoUnlockProxySession *)v14 start];
    int v17 = [(SDAutoUnlockSessionManager *)self proxySessions];
    double v18 = [v7 identifier];
    [v17 setObject:v14 forKeyedSubscript:v18];
  }
}

- (void)updateStringForProxySession
{
  if (![(SDAutoUnlockSessionManager *)self proxyErrorCode])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    BOOL v3 = [(SDAutoUnlockSessionManager *)self proxySessions];
    id v4 = [v3 allValues];

    id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v10 = [v9 state];
          if ((uint64_t)v10 <= [(SDAutoUnlockSessionManager *)self lastProxyState]) {
            id v11 = [(SDAutoUnlockSessionManager *)self lastProxyState];
          }
          else {
            id v11 = [v9 state];
          }
          [(SDAutoUnlockSessionManager *)self setLastProxyState:v11];
        }
        id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    if ((id)[(SDAutoUnlockSessionManager *)self lastProxyState] == (id)2)
    {
      CFStringRef v12 = @"Trigger Send Failed With Timeout";
      uint64_t v13 = 142;
    }
    else
    {
      if ((id)[(SDAutoUnlockSessionManager *)self lastProxyState] != (id)3) {
        return;
      }
      CFStringRef v12 = @"Unable to Find Proxy Watch";
      uint64_t v13 = 132;
    }
    [(SDAutoUnlockSessionManager *)self setScanErrorString:v12];
    [(SDAutoUnlockSessionManager *)self setProxyErrorCode:v13];
  }
}

- (void)cleanUpProxySessions
{
  [(SDAutoUnlockSessionManager *)self updateStringForProxySession];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(SDAutoUnlockSessionManager *)self proxySessions];
  id v4 = [v3 allValues];

  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) invalidate];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  id v9 = [(SDAutoUnlockSessionManager *)self proxySessions];
  [v9 removeAllObjects];

  [(SDAutoUnlockSessionManager *)self setLastProxyState:0];
  [(SDAutoUnlockSessionManager *)self setNotifiedForProxy:0];
  [(SDAutoUnlockSessionManager *)self setProxyDiscoverTime:0.0];
  [(SDAutoUnlockSessionManager *)self setProxyDeviceModel:0];
  [(SDAutoUnlockSessionManager *)self setProxyConnectionTime:0.0];
  [(SDAutoUnlockSessionManager *)self setProxyErrorCode:0];
  [(SDAutoUnlockSessionManager *)self setProxyRSSI:0];
}

- (void)clearAllKeysWithTokens
{
  BOOL v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing all keys with tokens", v5, 2u);
  }

  id v4 = [(SDAutoUnlockSessionManager *)self keysWithAKSTokens];
  [v4 removeAllObjects];
}

- (void)cancelAllLockSessionsForScanTimeout
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(SDAutoUnlockSessionManager *)self lockAuthSessions];
  BOOL v3 = [v2 allValues];

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 setAttemptTimedOut:1];
        [v8 cancel];
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)invalidateExistingSessionsForBLEDevice:(id)a3 incomingSessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SDAutoUnlockTransport sharedTransport];
  long long v9 = [v6 identifier];
  long long v10 = [v8 cachedIDSDeviceIDsForBluetoothID:v9];
  uint64_t v28 = [v10 firstObject];

  int v26 = self;
  long long v11 = [(SDAutoUnlockSessionManager *)self keyAuthSessions];
  id v12 = [v11 copy];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
  long long v15 = v13;
  if (!v14)
  {
LABEL_16:

    goto LABEL_17;
  }
  id v16 = v14;
  id v25 = v6;
  char v27 = 0;
  uint64_t v17 = *(void *)v30;
  do
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v30 != v17) {
        objc_enumerationMutation(v13);
      }
      uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8 * i);
      uint64_t v20 = [v13 objectForKeyedSubscript:v19];
      id v21 = [v7 UUIDString];
      if (([v21 isEqualToString:v19] & 1) == 0)
      {
        unsigned int v22 = [v20 deviceID];
        unsigned int v23 = [v22 isEqualToString:v28];

        if (!v23) {
          goto LABEL_12;
        }
        id v24 = auto_unlock_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v20;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Invalidating existing session: %@", buf, 0xCu);
        }

        [v20 invalidateOnQueue];
        id v21 = [(SDAutoUnlockSessionManager *)v26 keyAuthSessions];
        [v21 setObject:0 forKeyedSubscript:v19];
        char v27 = 1;
      }

LABEL_12:
    }
    id v16 = [v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
  }
  while (v16);

  id v6 = v25;
  if (v27)
  {
    long long v15 = +[SDAutoUnlockNotificationsManager sharedManager];
    [v15 removeAutoUnlockNotification];
    goto LABEL_16;
  }
LABEL_17:
}

- (void)createRegistrationKeySessionWithIdentifier:(id)a3 deviceID:(id)a4 requestData:(id)a5 locallyGenerated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    id v13 = [(SDAutoUnlockSessionManager *)self keyRegistrationSessionsByDeviceID];
    id v14 = [v13 objectForKeyedSubscript:v11];

    if (v14)
    {
      long long v15 = auto_unlock_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [(SDAutoUnlockSessionManager *)self keyRegistrationSessionsByDeviceID];
        int v21 = 138412290;
        unsigned int v22 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Registration key session in progress %@", (uint8_t *)&v21, 0xCu);
      }
    }
    else
    {
      uint64_t v19 = [(SDAutoUnlockPairingSession *)[SDAutoUnlockRegistrationKeySession alloc] initWithDevice:v11 sessionID:v10];
      [(SDAutoUnlockPairingSession *)v19 setDelegate:self];
      [(SDAutoUnlockRegistrationKeySession *)v19 setRequestData:v12];
      [(SDAutoUnlockRegistrationKeySession *)v19 setLocallyGenerated:v6];
      [(SDAutoUnlockRegistrationKeySession *)v19 start];
      uint64_t v20 = [(SDAutoUnlockSessionManager *)self keyRegistrationSessionsByDeviceID];
      [v20 setObject:v19 forKeyedSubscript:v11];
    }
  }
  else
  {
    uint64_t v17 = auto_unlock_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000A45DC();
    }

    double v18 = +[SDAutoUnlockTransport sharedTransport];
    [v18 logDevices];
  }
}

- (void)createRegistrationLockSessionWithDeviceID:(id)a3 sessionID:(id)a4 requestData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = [(SDAutoUnlockSessionManager *)self lockRegistrationSessionsByDeviceID];
    id v12 = [v11 objectForKeyedSubscript:v8];

    if (v12)
    {
      id v13 = auto_unlock_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(SDAutoUnlockSessionManager *)self lockRegistrationSessionsByDeviceID];
        int v20 = 138412290;
        int v21 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Registration lock session in progress %@", (uint8_t *)&v20, 0xCu);
      }
    }
    else
    {
      if (v9)
      {
        uint64_t v17 = v9;
      }
      else
      {
        uint64_t v17 = +[NSUUID UUID];
      }
      id v13 = v17;
      double v18 = [[SDAutoUnlockRegistrationLockSession alloc] initWithDevice:v8 sessionID:v17];
      [(SDAutoUnlockPairingSession *)v18 setDelegate:self];
      [(SDAutoUnlockRegistrationLockSession *)v18 setRequestData:v10];
      [(SDAutoUnlockRegistrationLockSession *)v18 start];
      uint64_t v19 = [(SDAutoUnlockSessionManager *)self lockRegistrationSessionsByDeviceID];
      [v19 setObject:v18 forKeyedSubscript:v8];
    }
  }
  else
  {
    long long v15 = auto_unlock_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000A4610();
    }

    id v16 = +[SDAutoUnlockTransport sharedTransport];
    [v16 logDevices];
  }
}

- (void)armDevicesWaitingForUnlock
{
  BOOL v3 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[SDStatusMonitor sharedMonitor];
  unsigned int v5 = [v4 deviceKeyBagUnlocked];

  if (v5)
  {
    id v6 = [(SDAutoUnlockSessionManager *)self remotePeer];
    [v6 handleDeviceUnlocked];
  }
}

- (void)initializeRemotePeer
{
  BOOL v3 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[SDAutoUnlockTransport sharedTransport];
  unsigned int v5 = [v4 activeDevice];

  id v6 = [v5 uniqueIDOverride];
  if (v6)
  {
    id v7 = [(SDAutoUnlockSessionManager *)self keyManager];
    id v8 = [v7 remoteLTKForDeviceID:v6];

    id v9 = auto_unlock_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        int v12 = 138412290;
        id v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Initialized remote peer to %@", (uint8_t *)&v12, 0xCu);
      }

      id v11 = [[SDAutoUnlockPeer alloc] initWithDeviceID:v6];
      [(SDAutoUnlockSessionManager *)self setRemotePeer:v11];
    }
    else
    {
      if (v10)
      {
        int v12 = 138412290;
        id v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Could not find remote LTK for active device: %@", (uint8_t *)&v12, 0xCu);
      }

      [(SDAutoUnlockSessionManager *)self setRemotePeer:0];
    }
  }
}

- (void)registerRemotePeerIfNecessary
{
  BOOL v3 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[SDAutoUnlockTransport sharedTransport];
  unsigned int v5 = [v4 activeDevice];

  id v6 = [(SDAutoUnlockSessionManager *)self remotePeer];
  id v7 = [v6 deviceID];
  id v8 = [v5 uniqueIDOverride];
  unsigned __int8 v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0) {
    [(SDAutoUnlockSessionManager *)self initializeRemotePeer];
  }
  BOOL v10 = [(SDAutoUnlockSessionManager *)self remotePeer];
  unsigned int v11 = [v10 shouldRegister];

  if (v11)
  {
    int v12 = [(SDAutoUnlockSessionManager *)self remotePeer];
    [v12 handleRegistrationBegan];

    id v13 = [(SDAutoUnlockSessionManager *)self remotePeer];
    id v14 = [v13 deviceID];
    [(SDAutoUnlockSessionManager *)self createRegistrationLockSessionWithDeviceID:v14 sessionID:0 requestData:0];
LABEL_10:

    goto LABEL_11;
  }
  long long v15 = +[SDAutoUnlockAKSManager sharedManager];
  id v16 = [(SDAutoUnlockSessionManager *)self remotePeer];
  uint64_t v17 = [v16 deviceID];
  id v13 = [v15 remoteLTKForDeviceID:v17];

  uint64_t v18 = sub_10001D4C4(v13);
  uint64_t v19 = [(SDAutoUnlockSessionManager *)self remotePeer];
  LODWORD(v17) = [v19 canPerformUnlocks];

  if (v17 && v18 != 3)
  {
    int v20 = auto_unlock_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [(SDAutoUnlockSessionManager *)self remotePeer];
      unsigned int v22 = sub_10001D9A8(v18);
      int v25 = 138412546;
      int v26 = v21;
      __int16 v27 = 2112;
      uint64_t v28 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Mismatch between peer state (%@) and AKS state (%@)", (uint8_t *)&v25, 0x16u);
    }
    sub_10001D790(v13);
    unsigned int v23 = [(SDAutoUnlockSessionManager *)self remotePeer];
    [v23 handleRegistrationBegan];

    id v14 = [(SDAutoUnlockSessionManager *)self remotePeer];
    id v24 = [v14 deviceID];
    [(SDAutoUnlockSessionManager *)self createRegistrationLockSessionWithDeviceID:v24 sessionID:0 requestData:0];

    goto LABEL_10;
  }
LABEL_11:
}

- (void)cancelParallelRegistrationSessionsForDeviceID:(id)a3 newSessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_assert_queue_V2(v8);

  unsigned __int8 v9 = [(SDAutoUnlockSessionManager *)self lockRegistrationSessionsByDeviceID];
  BOOL v10 = [v9 objectForKeyedSubscript:v6];
  unsigned int v11 = v10;
  if (v10)
  {
    int v12 = [v10 sessionID];
    id v13 = [v12 UUIDString];
    id v14 = [v7 UUIDString];
    id v15 = [v13 compare:v14];

    if (v15 == (id)1)
    {
      id v16 = auto_unlock_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        uint64_t v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Invalidating existing registration session: %@", (uint8_t *)&v17, 0xCu);
      }

      [v11 invalidate];
      [v9 setObject:0 forKeyedSubscript:v6];
    }
  }
}

- (void)session:(id)a3 didCompleteWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009B538;
  block[3] = &unk_1008CAF18;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)handleLockSessionCompleted:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v6 autoUnlockDevice];
  id v10 = [(SDAutoUnlockSessionManager *)self canceledAuthLockSessions];
  unsigned int v11 = [v6 sessionID];
  unsigned int v12 = [v10 containsObject:v11];

  if (v12)
  {
    id v13 = [(SDAutoUnlockSessionManager *)self canceledAuthLockSessions];
    id v14 = [v6 sessionID];
    [v13 removeObject:v14];

    id v15 = [(SDAutoUnlockSessionManager *)self suggestionManager];
    [v15 setLastSuccessfulDevice:0];

    if (v7)
    {
      [(SDAutoUnlockSessionManager *)self performRegistrationIfNecessaryForLockSession:v6 error:v7];
    }
    else
    {
      int v21 = auto_unlock_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Canceled at end", buf, 2u);
      }

      [v6 handleCanceledAfterSuccess];
    }
    if ([v6 otherSessionCancel])
    {
      unsigned int v22 = [(SDAutoUnlockSessionManager *)self locksWithAKSTokens];
      unsigned int v23 = [v6 deviceID];
      [v22 removeObject:v23];

LABEL_31:
    }
  }
  else if (v7)
  {
    id v16 = [(SDAutoUnlockSessionManager *)self lockAuthSessions];
    id v17 = [v16 count];

    if ((unint64_t)v17 <= 1)
    {
      [v6 logResults];
      int v25 = [v6 autoUnlockDevice];
      v62 = v25;
      int v26 = +[NSArray arrayWithObjects:&v62 count:1];
      __int16 v27 = [v6 wifiRangingResults];
      [(SDAutoUnlockSessionManager *)self createRadarForError:v7 devices:v26 rangingResults:v27];

      uint64_t v28 = [v6 attemptResults];
      id v29 = [v28 mutableCopy];
      [(SDAutoUnlockSessionManager *)self setCachedMetrics:v29];

      [(SDAutoUnlockSessionManager *)self notifyObserversOfUnlockFailureWithResults:v28 error:v7];
      long long v30 = [(SDAutoUnlockSessionManager *)self locksWithAKSTokens];
      long long v31 = [v6 deviceID];
      [v30 removeObject:v31];

      long long v32 = [(SDAutoUnlockSessionManager *)self suggestionManager];
      [v32 setLastSuccessfulDevice:0];

      if ([v7 code] == (id)145) {
        [(SDAutoUnlockSessionManager *)self decrementAttemptCount];
      }
      else {
        [(SDAutoUnlockSessionManager *)self performRegistrationIfNecessaryForLockSession:v6 error:v7];
      }
      [(SDAutoUnlockSessionManager *)self invalidateAttempt];
    }
    else
    {
      uint64_t v18 = auto_unlock_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [v6 sessionID];
        int v20 = [(SDAutoUnlockSessionManager *)self lockAuthSessions];
        *(_DWORD *)buf = 138412802;
        int v57 = v19;
        __int16 v58 = 2112;
        id v59 = v7;
        __int16 v60 = 2112;
        uint64_t v61 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Session failed (id: %@, error: %@, outstanding sessions: %@)", buf, 0x20u);
      }
      [(SDAutoUnlockSessionManager *)self setAuthSessionError:v7];
    }
    if ([v7 code] == (id)101) {
      [(SDAutoUnlockSessionManager *)self registerRemotePeerIfNecessary];
    }
  }
  else
  {
    if ((id)[(SDAutoUnlockSessionManager *)self attemptType] == (id)1)
    {
      unsigned int v22 = +[NSUserDefaults standardUserDefaults];
      if ([v22 BOOLForKey:@"phoneAutoUnlockSkipPrewarmOnNextUnlock"])
      {
        id v24 = auto_unlock_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Skipped donating positive mask signal due to default phoneAutoUnlockSkipPrewarmOnNextUnlock", buf, 2u);
        }
      }
      else
      {
        id v24 = [(SDAutoUnlockSessionManager *)self localDeviceController];
        [v24 deviceUnlockedWithMask:1];
      }

      [v6 logResults];
      v38 = [v6 attemptResults];
      [v9 setResults:v38];

      CFStringRef v39 = [v9 results];
      id v40 = [v39 mutableCopy];
      [(SDAutoUnlockSessionManager *)self setCachedMetrics:v40];

      id v41 = [(SDAutoUnlockSessionManager *)self locksWithAKSTokens];
      id v42 = [v6 deviceID];
      [v41 addObject:v42];

      uint64_t v43 = [(SDAutoUnlockSessionManager *)self suggestionManager];
      [v43 setLastSuccessfulDevice:v9];

      [(SDAutoUnlockSessionManager *)self notifyObserversOfUnlockCompletionWithDevice:v9];
      [(SDAutoUnlockSessionManager *)self invalidateAttempt];
      goto LABEL_31;
    }
    if ((id)[(SDAutoUnlockSessionManager *)self attemptType] != (id)2)
    {
      unsigned int v22 = auto_unlock_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1000A46F4(self);
      }
      goto LABEL_31;
    }
    [v6 logResults];
    CFStringRef v33 = [v6 attemptResults];
    [v9 setResults:v33];

    v34 = [v9 results];
    id v35 = [v34 mutableCopy];
    [(SDAutoUnlockSessionManager *)self setCachedMetrics:v35];

    uint64_t v36 = [v6 hintToken];
    [v9 setHintToken:v36];

    uint64_t v37 = [v9 hintToken];

    if (v37)
    {
      [(SDAutoUnlockSessionManager *)self notifyObserversOfUnlockCompletionWithDevice:v9];
    }
    else
    {
      uint64_t v47 = auto_unlock_log();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        sub_1000A4678(self);
      }

      CFStringRef v48 = [v9 results];
      uint64_t v49 = SFAutoUnlockErrorDomain;
      NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
      CFStringRef v55 = @"Missing authorization token";
      int64_t v50 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      id v51 = +[NSError errorWithDomain:v49 code:185 userInfo:v50];
      [(SDAutoUnlockSessionManager *)self notifyObserversOfUnlockFailureWithResults:v48 error:v51];
    }
    BOOL v52 = [(SDAutoUnlockSessionManager *)self locksWithAKSTokens];
    uint64_t v53 = [v6 deviceID];
    [v52 removeObject:v53];

    [(SDAutoUnlockSessionManager *)self invalidateAttempt];
  }
  [v6 invalidate];
  v44 = [(SDAutoUnlockSessionManager *)self lockAuthSessions];
  dispatch_queue_t v45 = [v6 bleDevice];
  v46 = [v45 identifier];
  [v44 removeObjectForKey:v46];

  [(SDAutoUnlockSessionManager *)self setScanErrorString:0];
}

- (void)handleProxySessionCompleted:(id)a3 error:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  [v15 connectionTime];
  -[SDAutoUnlockSessionManager setProxyConnectionTime:](self, "setProxyConnectionTime:");
  if (v6)
  {
    -[SDAutoUnlockSessionManager setProxyErrorCode:](self, "setProxyErrorCode:", [v6 code]);
    id v7 = [v6 localizedDescription];
    [(SDAutoUnlockSessionManager *)self setScanErrorString:v7];

    -[SDAutoUnlockSessionManager setProxyNotAvailableForUnlock:](self, "setProxyNotAvailableForUnlock:", [v6 code] == (id)144);
    if ([v6 code] != (id)135) {
      goto LABEL_8;
    }
    id v8 = [(SDAutoUnlockSessionManager *)self lockAuthSessions];
    if ((unint64_t)[v8 count] < 2)
    {
      id v9 = [(SDAutoUnlockSessionManager *)self proxySessions];
      id v10 = [v9 count];

      if (v10 != (id)1) {
        goto LABEL_8;
      }
      id v8 = [(SDAutoUnlockSessionManager *)self baseResultsDictionaryForError:v6];
      unsigned int v11 = [v15 results];
      [v8 addEntriesFromDictionary:v11];

      [(SDAutoUnlockSessionManager *)self setCachedMetrics:v8];
      [(SDAutoUnlockSessionManager *)self notifyObserversOfUnlockFailureWithResults:v8 error:v6];
      [(SDAutoUnlockSessionManager *)self invalidateAttempt];
    }
  }
  else
  {
    -[SDAutoUnlockSessionManager setLastProxyState:](self, "setLastProxyState:", [v15 state]);
  }
LABEL_8:
  [v15 invalidate];
  unsigned int v12 = [(SDAutoUnlockSessionManager *)self proxySessions];
  id v13 = [v15 bleDevice];
  id v14 = [v13 identifier];
  [v12 removeObjectForKey:v14];
}

- (void)sessionDidStartConnection:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SDAutoUnlockSessionManager *)self handleLockConnectionStartedForSession:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SDAutoUnlockSessionManager *)self handleProxyConnectionStartedForSession:v4];
    }
  }
}

- (void)handleLockConnectionStartedForSession:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SDAutoUnlockSessionManager *)self localDeviceController];
  id v6 = [v5 faceIDEnabled];

  unsigned int v7 = [(SDAutoUnlockSessionManager *)self cachedDeviceWiFiState];
  if ((id)[(SDAutoUnlockSessionManager *)self attemptType] == (id)2) {
    int v8 = 1;
  }
  else {
    int v8 = v7;
  }
  id v9 = auto_unlock_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"NO";
    if (v7) {
      CFStringRef v10 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v52 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Wi-Fi powered on: %@", buf, 0xCu);
  }

  [(SDAutoUnlockSessionManager *)self invalidateScanner];
  if (v8)
  {
    unsigned int v11 = [v4 autoUnlockDevice];
    unsigned int v12 = [(SDAutoUnlockSessionManager *)self attemptDevice];

    if (v12)
    {
      id v13 = auto_unlock_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(SDAutoUnlockSessionManager *)self attemptDevice];
        *(_DWORD *)buf = 138412546;
        CFStringRef v52 = v11;
        __int16 v53 = 2112;
        NSErrorUserInfoKey v54 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Already connected (new device: %@, attempt device: %@)", buf, 0x16u);
      }
    }
    else
    {
      [(SDAutoUnlockSessionManager *)self setAttemptDevice:v11];
      [v4 setChosenDevice:1];
      if (![(SDAutoUnlockSessionManager *)self notifiedForProxy])
      {
        id v29 = [(SDAutoUnlockSessionManager *)self attemptDevice];
        [(SDAutoUnlockSessionManager *)self notifyObserverOfAttemptBeganWithDevice:v29];

        [(SDAutoUnlockSessionManager *)self incrementAttemptCount];
      }
      long long v30 = auto_unlock_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Posting state changed: Scan stopped - session in progress", buf, 2u);
      }

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, SFAutoUnlockStateChangedNotification, 0, 0, 1u);
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v32 = [(SDAutoUnlockSessionManager *)self lockAuthSessions];
      id v13 = [v32 allValues];

      id v33 = [v13 countByEnumeratingWithState:&v43 objects:v55 count:16];
      if (v33)
      {
        id v34 = v33;
        id v42 = v11;
        uint64_t v35 = *(void *)v44;
        do
        {
          for (i = 0; i != v34; i = (char *)i + 1)
          {
            if (*(void *)v44 != v35) {
              objc_enumerationMutation(v13);
            }
            uint64_t v37 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            v38 = [v37 sessionID];
            CFStringRef v39 = [v4 sessionID];
            unsigned __int8 v40 = [v38 isEqual:v39];

            if ((v40 & 1) == 0)
            {
              id v41 = [(SDAutoUnlockSessionManager *)self canceledAuthLockSessions];
              [v41 addObject:v38];

              [v37 setOtherSessionCancel:1];
              [v37 cancel];
            }
          }
          id v34 = [v13 countByEnumeratingWithState:&v43 objects:v55 count:16];
        }
        while (v34);
        unsigned int v11 = v42;
      }
    }
  }
  else
  {
    id v15 = auto_unlock_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "### Discovered peer but Wi-Fi is off", buf, 2u);
    }

    id v16 = +[SDStatusMonitor sharedMonitor];
    id v17 = [v16 bluetoothEnabled];

    int64_t v18 = [(SDAutoUnlockSessionManager *)self errorCodeForBluetoothEnabled:v17 wifiEnabled:0 faceIDEnabled:v6];
    unsigned int v11 = [(SDAutoUnlockSessionManager *)self errorStringForBluetoothEnabled:v17 wifiEnabled:0 faceIDEnabled:v6];
    BOOL v19 = [(SDAutoUnlockSessionManager *)self shouldShowErrorForWiFiEnabled:0];
    uint64_t v20 = SFAutoUnlockErrorDomain;
    v49[0] = NSLocalizedDescriptionKey;
    v49[1] = @"SDAutoUnlockShowScreenLockError";
    v50[0] = v11;
    int v21 = +[NSNumber numberWithBool:v19];
    v50[1] = v21;
    unsigned int v22 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
    id v13 = +[NSError errorWithDomain:v20 code:v18 userInfo:v22];

    v47[0] = SDAutoUnlockManagerMetricSuccessKey;
    v47[1] = SDAutoUnlockManagerMetricErrorDomainKey;
    v48[0] = &off_100902868;
    v48[1] = v20;
    v47[2] = SDAutoUnlockManagerMetricErrorCodeKey;
    unsigned int v23 = +[NSNumber numberWithInteger:v18];
    v48[2] = v23;
    v48[3] = v11;
    v47[3] = SDAutoUnlockManagerMetricErrorStringKey;
    v47[4] = SDAutoUnlockManagerMetricConnectedBluetoothDevicesKey;
    id v24 = +[NSNumber numberWithInteger:[(SDAutoUnlockSessionManager *)self connectedBluetoothDevices]];
    v48[4] = v24;
    v47[5] = SDAutoUnlockManagerMetricTimeSinceLastWakeKey;
    int v25 = +[NSNumber numberWithInteger:[(SDAutoUnlockSessionManager *)self timeSinceLastMachineWake]];
    v48[5] = v25;
    v47[6] = SDAutoUnlockManagerMetricLastSleepTypeKey;
    int v26 = +[NSNumber numberWithInteger:[(SDAutoUnlockSessionManager *)self lastSleepType]];
    v48[6] = v26;
    __int16 v27 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:7];

    id v28 = [v27 mutableCopy];
    [(SDAutoUnlockSessionManager *)self setCachedMetrics:v28];

    [(SDAutoUnlockSessionManager *)self notifyObserversOfUnlockFailureWithResults:v27 error:v13];
    [(SDAutoUnlockSessionManager *)self invalidateAttempt];
  }
}

- (void)handleProxyConnectionStartedForSession:(id)a3
{
  id v4 = a3;
  if (![(SDAutoUnlockSessionManager *)self notifiedForProxy])
  {
    unsigned int v5 = [(SDAutoUnlockSessionManager *)self attemptDevice];

    if (!v5)
    {
      id v6 = objc_alloc_init((Class)SFAutoUnlockDevice);
      [v6 setName:@"Proxied Apple Watch"];
      [v6 setModelName:@"Apple Watch"];
      [(SDAutoUnlockSessionManager *)self notifyObserverOfAttemptBeganWithDevice:v6];
      [(SDAutoUnlockSessionManager *)self setNotifiedForProxy:1];
      [(SDAutoUnlockSessionManager *)self incrementAttemptCount];
      unsigned int v7 = [(SDAutoUnlockSessionManager *)self scanTimer];

      if (v7)
      {
        int v8 = [(SDAutoUnlockSessionManager *)self scanner];
        [v8 setTimeout:0.0];

        id v9 = [(SDAutoUnlockSessionManager *)self scanner];
        [v9 setTimeoutHandler:0];

        [(SDAutoUnlockSessionManager *)self restartScanTimer:sub_1001B1AF8(12.0)];
      }
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      CFStringRef v10 = [(SDAutoUnlockSessionManager *)self lockAuthSessions];
      unsigned int v11 = [v10 allValues];

      id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          id v15 = 0;
          do
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            id v16 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v15);
            [v4 connectionTime];
            [v16 setProxyConnectionTime:];
            id v17 = [v4 model];
            [v16 setProxyDeviceModel:v17];

            id v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v13);
      }

      int64_t v18 = [v4 model];
      [(SDAutoUnlockSessionManager *)self setProxyDeviceModel:v18];

      -[SDAutoUnlockSessionManager setProxyRSSI:](self, "setProxyRSSI:", [v4 proxyRSSI]);
      [v4 proxyDiscoveryTime];
      -[SDAutoUnlockSessionManager setProxyDiscoverTime:](self, "setProxyDiscoverTime:");
    }
  }
}

- (void)sessionDidReceiveKeyDeviceLocked:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[SDAutoUnlockTransport sharedTransport];
  id v6 = [v4 deviceID];

  id v7 = [v5 autoUnlockDeviceForDeviceID:v6];

  [(SDAutoUnlockSessionManager *)self notifyObserverOfKeyDeviceLockWithDevice:v7];
}

- (BOOL)isDisplayOff
{
  v2 = +[SDStatusMonitor sharedMonitor];
  char v3 = [v2 screenOn] ^ 1;

  return v3;
}

- (void)performRegistrationIfNecessaryForLockSession:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v7 code];
  if (v9 == (id)136)
  {
    if ([(SDAutoUnlockSessionManager *)self suppressAlert])
    {
LABEL_11:
      id v12 = [(SDAutoUnlockSessionManager *)self remotePeer];
      [v12 handleConfirmationFailed];

      [(SDAutoUnlockSessionManager *)self registerRemotePeerIfNecessary];
      goto LABEL_12;
    }
    CFStringRef v10 = auto_unlock_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Locking device on confirmation failed error", buf, 2u);
    }

    unsigned int v11 = [(SDAutoUnlockSessionManager *)self localDeviceController];
    [v11 lockDevice];
LABEL_10:

    goto LABEL_11;
  }
  if ([v6 aksSuccess] && (objc_msgSend(v6, "unlockSucceeded") & 1) == 0)
  {
    unsigned int v11 = auto_unlock_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "AKS unlocked but unlock did not succeed", v13, 2u);
    }
    goto LABEL_10;
  }
LABEL_12:
}

- (void)transportDidChangeDevices:(id)a3
{
  id v4 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009D480;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)transportDidChangeNearbyState:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009D5B4;
  v7[3] = &unk_1008CA640;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)transport:(id)a3 didReceivePairingRequestWithSessionID:(id)a4 deviceID:(id)a5 requestData:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10009D740;
  v16[3] = &unk_1008CA770;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, v16);
}

- (void)transport:(id)a3 didReceiveRegistrationRequestWithSessionID:(id)a4 deviceID:(id)a5 requestData:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10009D850;
  v16[3] = &unk_1008CA770;
  v16[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v19 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(v12, v16);
}

- (void)transport:(id)a3 didReceiveKeyOriginatingRegistrationRequestWithSessionID:(id)a4 deviceID:(id)a5 requestData:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10009D998;
  v16[3] = &unk_1008CA770;
  v16[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v19 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(v12, v16);
}

- (void)idsController:(id)a3 didReceiveProtoData:(id)a4 forType:(unsigned __int16)a5 deviceID:(id)a6
{
  int v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v7 == 2001)
  {
    id v15 = [[SDAutoUnlockSessionWrapper alloc] initWithData:v11];
    if ([(SDAutoUnlockSessionWrapper *)v15 hasSessionID]
      && ([(SDAutoUnlockSessionWrapper *)v15 sessionID],
          id v16 = objc_claimAutoreleasedReturnValue(),
          id v17 = [v16 length],
          v16,
          v17 == (id)16))
    {
      id v18 = objc_alloc((Class)NSUUID);
      id v19 = [(SDAutoUnlockSessionWrapper *)v15 sessionID];
      id v20 = [v18 initWithUUIDBytes:[v19 bytes]];

      long long v21 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10009DD50;
      v23[3] = &unk_1008CA770;
      void v23[4] = self;
      id v24 = v20;
      id v25 = v12;
      int v26 = v15;
      long long v22 = v20;
      dispatch_async(v21, v23);
    }
    else
    {
      long long v22 = auto_unlock_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1000A4770(v15, (uint64_t)v11, v22);
      }
    }
  }
  else if (v7 == 110)
  {
    id v13 = auto_unlock_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received relock request", buf, 2u);
    }

    id v14 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009DC90;
    block[3] = &unk_1008CA640;
    void block[4] = self;
    id v28 = v12;
    dispatch_async(v14, block);
  }
}

- (void)startScannerWithWatchBluetoothIDs:(id)a3 phoneBluetoothIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  id v8 = [(SDAutoUnlockSessionManager *)self scanner];

  if (v8)
  {
    id v9 = [(SDAutoUnlockSessionManager *)self scanner];
    [v9 invalidate];
  }
  id v10 = objc_opt_new();
  [(SDAutoUnlockSessionManager *)self setScanner:v10];

  id v11 = [(SDAutoUnlockSessionManager *)self scanner];
  [v11 setDiscoveryFlags:1];

  id v12 = [(SDAutoUnlockSessionManager *)self scanner];
  id v13 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  [v12 setDispatchQueue:v13];

  id v14 = [(SDAutoUnlockSessionManager *)self scanner];
  [v14 setScanRate:50];

  id v15 = [(SDAutoUnlockSessionManager *)self scanner];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10009E2E8;
  v34[3] = &unk_1008CBFF0;
  objc_copyWeak(&v35, &location);
  [v15 setDeviceFoundHandler:v34];

  id v16 = [(SDAutoUnlockSessionManager *)self scanner];
  [v16 setChangeFlags:1];

  id v17 = [(SDAutoUnlockSessionManager *)self scanner];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10009E36C;
  v32[3] = &unk_1008CC018;
  objc_copyWeak(&v33, &location);
  [v17 setDeviceChangedHandler:v32];

  id v18 = [(SDAutoUnlockSessionManager *)self scanner];
  [v18 setInvalidationHandler:&stru_1008CC038];

  id v19 = [v6 setByAddingObjectsFromSet:v7];
  id v20 = [(SDAutoUnlockSessionManager *)self scanner];
  [v20 setDeviceFilter:v19];

  long long v21 = auto_unlock_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v38 = *(double *)&v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Scanning for bluetooth IDs %@", buf, 0xCu);
  }

  [(SDAutoUnlockSessionManager *)self setScanWatchIDs:v6];
  [(SDAutoUnlockSessionManager *)self setScanPhoneIDs:v7];
  long long v22 = (void *)sub_1000D91F0(@"AUBLEScanTimeout");
  unsigned int v23 = v22;
  if (v22) {
    double v24 = (double)(uint64_t)[v22 integerValue];
  }
  else {
    double v24 = 4.0;
  }
  id v25 = [(SDAutoUnlockSessionManager *)self scanner];
  [v25 setTimeout:v24];

  int v26 = [(SDAutoUnlockSessionManager *)self scanner];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  void v30[2] = sub_10009E458;
  v30[3] = &unk_1008CA3B0;
  objc_copyWeak(&v31, &location);
  [v26 setTimeoutHandler:v30];

  __int16 v27 = auto_unlock_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v38 = v24;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Using BLE scan timeout %.2f seconds", buf, 0xCu);
  }

  id v28 = [(SDAutoUnlockSessionManager *)self scanner];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10009E528;
  v29[3] = &unk_1008CA5A8;
  v29[4] = self;
  [v28 activateWithCompletion:v29];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

- (void)invalidateScanner
{
  char v3 = [(SDAutoUnlockSessionManager *)self scanner];

  if (v3)
  {
    id v4 = auto_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating scanner", v9, 2u);
    }

    [(SDAutoUnlockSessionManager *)self setExtendedTimer:0];
    unsigned int v5 = [(SDAutoUnlockSessionManager *)self scanner];
    [v5 setTimeout:0.0];

    id v6 = [(SDAutoUnlockSessionManager *)self scanner];
    [v6 setTimeoutHandler:0];

    id v7 = [(SDAutoUnlockSessionManager *)self scanner];
    [v7 setInvalidationHandler:0];

    id v8 = [(SDAutoUnlockSessionManager *)self scanner];
    [v8 invalidate];

    [(SDAutoUnlockSessionManager *)self setScanner:0];
    [(SDAutoUnlockSessionManager *)self invalidateScanTimer];
  }
}

- (void)handleFoundPeer:(id)a3
{
  id v4 = a3;
  unsigned int v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found BLE peer: %@", buf, 0xCu);
  }

  id v6 = [v4 identifier];
  id v7 = [(SDAutoUnlockSessionManager *)self scanWatchIDs];
  unsigned int v8 = [v7 containsObject:v6];

  if (v8)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v9 = [(SDAutoUnlockSessionManager *)self lockAuthSessions];
    id v10 = [v9 allValues];

    id v11 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v35;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          id v16 = [v15 bleDevice];
          id v17 = [v16 identifier];
          unsigned int v18 = [v17 isEqual:v6];

          if (v18) {
            [v15 handleFoundBLEDevice:v4];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v12);
    }
LABEL_24:

    goto LABEL_25;
  }
  id v19 = [(SDAutoUnlockSessionManager *)self scanPhoneIDs];
  unsigned int v20 = [v19 containsObject:v6];

  if (v20)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v21 = [(SDAutoUnlockSessionManager *)self proxySessions];
    id v10 = [v21 allValues];

    id v22 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v31;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v10);
          }
          int v26 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
          __int16 v27 = [v26 bleDevice];
          id v28 = [v27 identifier];
          unsigned int v29 = [v28 isEqual:v6];

          if (v29) {
            [v26 handleFoundBLEDevice:v4];
          }
        }
        id v23 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v23);
    }
    goto LABEL_24;
  }
LABEL_25:
}

- (void)restartScanTimer:(unint64_t)a3
{
  unsigned int v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Restarting scan timer", buf, 2u);
  }

  id v6 = [(SDAutoUnlockSessionManager *)self scanTimer];

  if (!v6)
  {
    id v7 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10009EC04;
    v11[3] = &unk_1008CA4B8;
    v11[4] = self;
    unsigned int v8 = sub_1001B1B10(0, v7, v11);
    [(SDAutoUnlockSessionManager *)self setScanTimer:v8];

    id v9 = [(SDAutoUnlockSessionManager *)self scanTimer];
    dispatch_resume(v9);
  }
  id v10 = [(SDAutoUnlockSessionManager *)self scanTimer];
  sub_1001B1BC4(v10, a3);
}

- (void)invalidateScanTimer
{
  char v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating scan timer", v6, 2u);
  }

  id v4 = [(SDAutoUnlockSessionManager *)self scanTimer];

  if (v4)
  {
    unsigned int v5 = [(SDAutoUnlockSessionManager *)self scanTimer];
    dispatch_source_cancel(v5);

    [(SDAutoUnlockSessionManager *)self setScanTimer:0];
  }
}

- (void)handleBLEScanTimerFired
{
  [(SDAutoUnlockSessionManager *)self updateStringForProxySession];
  [(SDAutoUnlockSessionManager *)self cancelAllLockSessionsForScanTimeout];
  [(SDAutoUnlockSessionManager *)self handleScanTimerFired];
  [(SDAutoUnlockSessionManager *)self invalidateAttempt];

  [(SDAutoUnlockSessionManager *)self setScanErrorString:0];
}

- (void)handleScanTimerFired
{
  id v3 = SFAutoUnlockErrorDomain;
  uint64_t v4 = [(SDAutoUnlockSessionManager *)self scanErrorString];
  unsigned int v5 = (void *)v4;
  id v6 = @"Apple Watch Not Found";
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  id v7 = v6;

  unsigned int v8 = objc_opt_new();
  [v8 setObject:v3 forKeyedSubscript:SDAutoUnlockManagerMetricErrorDomainKey];
  [v8 setObject:&off_100902868 forKeyedSubscript:SDAutoUnlockManagerMetricSuccessKey];
  id v9 = +[NSNumber numberWithInteger:[(SDAutoUnlockSessionManager *)self connectedBluetoothDevices]];
  [v8 setObject:v9 forKeyedSubscript:SDAutoUnlockManagerMetricConnectedBluetoothDevicesKey];

  id v10 = +[NSNumber numberWithInteger:[(SDAutoUnlockSessionManager *)self timeSinceLastMachineWake]];
  [v8 setObject:v10 forKeyedSubscript:SDAutoUnlockManagerMetricTimeSinceLastWakeKey];

  id v11 = +[NSNumber numberWithInteger:[(SDAutoUnlockSessionManager *)self lastSleepType]];
  [v8 setObject:v11 forKeyedSubscript:SDAutoUnlockManagerMetricLastSleepTypeKey];

  if ([(SDAutoUnlockSessionManager *)self notifiedForProxy])
  {
    int64_t v12 = [(SDAutoUnlockSessionManager *)self proxyErrorCode];
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 143;
    }
    [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:SDAutoUnlockManagerMetricUsingProxyDeviceKey];
    id v14 = [(SDAutoUnlockSessionManager *)self proxyDeviceModel];
    [v8 setObject:v14 forKeyedSubscript:SDAutoUnlockManagerMetricProxyDeviceModelKey];

    id v15 = +[NSNumber numberWithInt:[(SDAutoUnlockSessionManager *)self proxyRSSI]];
    [v8 setObject:v15 forKeyedSubscript:SDAutoUnlockManagerMetricProxyDeviceRSSIKey];

    [(SDAutoUnlockSessionManager *)self proxyDiscoverTime];
    id v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v8 setObject:v16 forKeyedSubscript:SDAutoUnlockManagerMetricBluetoothProxyDeviceDiscoveryKey];

    [v8 setObject:&off_1009028B0 forKeyedSubscript:SDAutoUnlockManagerMetricErrorTypeKey];
  }
  else
  {
    id v17 = [(SDAutoUnlockSessionManager *)self authSessionError];

    if (v17)
    {
      unsigned int v18 = [(SDAutoUnlockSessionManager *)self authSessionError];
      id v19 = [v18 userInfo];
      uint64_t v20 = [v19 objectForKeyedSubscript:NSLocalizedDescriptionKey];

      long long v21 = [(SDAutoUnlockSessionManager *)self authSessionError];
      uint64_t v13 = (uint64_t)[v21 code];

      id v7 = (__CFString *)v20;
    }
    else if ([(SDAutoUnlockSessionManager *)self proxyNotAvailableForUnlock])
    {

      [v8 setObject:&off_1009028C8 forKeyedSubscript:SDAutoUnlockManagerMetricErrorTypeKey];
      id v7 = @"Watch Not On Wrist";
      uint64_t v13 = 144;
    }
    else
    {
      [v8 setObject:&off_1009028E0 forKeyedSubscript:SDAutoUnlockManagerMetricErrorTypeKey];
      uint64_t v13 = 131;
    }
  }
  [v8 setObject:v7 forKeyedSubscript:SDAutoUnlockManagerMetricErrorStringKey];
  id v22 = +[NSNumber numberWithInteger:v13];
  [v8 setObject:v22 forKeyedSubscript:SDAutoUnlockManagerMetricErrorCodeKey];

  NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
  id v28 = v7;
  id v23 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  uint64_t v24 = +[NSError errorWithDomain:v3 code:v13 userInfo:v23];

  id v25 = [(SDAutoUnlockSessionManager *)self scanAutoUnlockDevices];
  int v26 = [v25 allObjects];
  [(SDAutoUnlockSessionManager *)self createRadarForError:v24 devices:v26 rangingResults:0];

  [(SDAutoUnlockSessionManager *)self setCachedMetrics:v8];
  [(SDAutoUnlockSessionManager *)self notifyObserversOfUnlockFailureWithResults:v8 error:v24];
}

- (BOOL)unlockEnabledForPeer:(id)a3
{
  return CFDictionaryGetInt64() != 0;
}

- (BOOL)proxyAdvertisementForPeer:(id)a3
{
  return CFDictionaryGetInt64() != 0;
}

- (BOOL)watchLockedOnWristForPeer:(id)a3
{
  return CFDictionaryGetInt64() != 0;
}

- (BOOL)advertisingEnabled
{
  return 0;
}

- (BOOL)watchLockedAndOnWrist
{
  return 0;
}

- (int64_t)idsMacCount
{
  if ([(SDAutoUnlockSessionManager *)self idsMacCountCache] < 0)
  {
    id v3 = +[SDAutoUnlockTransport sharedTransport];
    uint64_t v4 = [v3 idsMacDeviceIDs];
    -[SDAutoUnlockSessionManager setIdsMacCountCache:](self, "setIdsMacCountCache:", [v4 count]);
  }

  return [(SDAutoUnlockSessionManager *)self idsMacCountCache];
}

- (void)addServiceClientForIdentifier:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SDAutoUnlockSessionManager *)self serviceClients];
  [v5 addObject:v4];

  [(SDAutoUnlockSessionManager *)self updateAdvertising];
}

- (void)removeServiceClientForIdentifier:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SDAutoUnlockSessionManager *)self serviceClients];
  [v5 removeObject:v4];

  [(SDAutoUnlockSessionManager *)self updateAdvertising];
}

- (void)handleBLEDataReceivedNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"SDNearbyAgentNotificationInfoKeyBLEDevice"];

  id v7 = auto_unlock_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v41 = v6;
    __int16 v42 = 1024;
    LODWORD(v43) = [(SDAutoUnlockSessionWrapper *)v6 useBTPipe];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received message from bleDevice %@, useBTPipe %d", buf, 0x12u);
  }

  unsigned int v8 = [v4 userInfo];

  id v9 = [v8 objectForKeyedSubscript:@"SDNearbyAgentNotificationInfoKeyBLEData"];

  id v10 = [[SDAutoUnlockSessionWrapper alloc] initWithData:v9];
  id v11 = auto_unlock_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received wrapper %@", buf, 0xCu);
  }

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10009F890;
  v37[3] = &unk_1008CC060;
  v37[4] = self;
  int64_t v12 = v6;
  double v38 = v12;
  uint64_t v13 = v10;
  CFStringRef v39 = v13;
  id v14 = objc_retainBlock(v37);
  if ([(SDAutoUnlockSessionWrapper *)v13 hasEncryptedPayload])
  {
    uint64_t v36 = 0;
    id v15 = +[SDAutoUnlockAKSManager sharedManager];
    id v16 = [(SDAutoUnlockSessionWrapper *)v13 encryptedPayload];
    id v17 = [(SDAutoUnlockSessionWrapper *)v13 authTag];
    unsigned int v18 = [(SDAutoUnlockSessionWrapper *)v13 nonce];
    id v19 = [(SDAutoUnlockSessionWrapper *)v12 identifier];
    uint64_t v20 = [v15 decryptMessage:v16 authTag:v17 nonce:v18 bluetoothID:v19 cachedDevices:1 errorCode:&v36];

    if (v20)
    {
      long long v21 = [[SDAutoUnlockSessionWrapper alloc] initWithData:v20];
      ((void (*)(void *, SDAutoUnlockSessionWrapper *, uint64_t))v14[2])(v14, v21, 1);
    }
    else
    {
      id v22 = auto_unlock_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1000A4944((uint64_t)&v36, v22, v23, v24, v25, v26, v27, v28);
      }

      long long v21 = (SDAutoUnlockSessionWrapper *)objc_opt_new();
      [(SDAutoUnlockSessionWrapper *)v21 setVersion:1];
      unsigned int v29 = +[SDStatusMonitor sharedMonitor];
      if ([v29 deviceWasUnlockedOnce]) {
        uint64_t v30 = v36;
      }
      else {
        uint64_t v30 = 195;
      }
      [(SDAutoUnlockSessionWrapper *)v21 setErrorCode:v30];

      long long v31 = objc_opt_new();
      [v31 setVersion:1];
      [v31 setMessageType:309];
      long long v32 = [(SDAutoUnlockSessionWrapper *)v21 data];
      [v31 setPayload:v32];

      long long v33 = auto_unlock_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v41 = v21;
        __int16 v42 = 2112;
        long long v43 = v31;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Sending %@ Wrapper %@", buf, 0x16u);
      }

      long long v34 = +[SDNearbyAgent sharedNearbyAgent];
      long long v35 = [v31 data];
      [v34 sendUnlockData:v35 toBLEDevice:v12 completion:&stru_1008CC080];
    }
  }
  else
  {
    ((void (*)(void *, SDAutoUnlockSessionWrapper *, void))v14[2])(v14, v13, 0);
  }
}

- (void)handleRelockMessage
{
  id v3 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SDAutoUnlockSessionManager *)self localDeviceController];
  [v4 lockWithBioLockOut];

  [(SDAutoUnlockSessionManager *)self setLastLockedByRelock:1];
  [(SDAutoUnlockSessionManager *)self cancelAutoUnlock];
  id v5 = [(SDAutoUnlockSessionManager *)self cachedMetrics];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:SDAutoUnlockManagerMetricManualRelockKey];
}

- (void)keyBagLockStateChange:(id)a3
{
  id v4 = a3;
  id v5 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009FD74;
  v7[3] = &unk_1008CA640;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)onqueue_keyBagLockStateChange:(id)a3
{
  id v4 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[SDStatusMonitor sharedMonitor];
    id v7 = sub_1001AC300((unint64_t)[v6 deviceKeyBagState]);
    int v10 = 138412290;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Keybag state changed to %@", (uint8_t *)&v10, 0xCu);
  }
  id v8 = objc_opt_new();
  [(SDAutoUnlockSessionManager *)self setLockStateChangedDate:v8];

  id v9 = +[SDAutoUnlockAKSManager sharedManager];
  [v9 handleKeyBagLockStateChanged];

  [(SDAutoUnlockSessionManager *)self handleLockStateChanged];
}

- (void)clearPhoneAutoUnlockNotification:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    id v4 = auto_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User declined to enable Phone Auto Unlock", v7, 2u);
    }

    id v5 = +[NSUserDefaults standardUserDefaults];
    [v5 setBool:1 forKey:@"AutoUnlockDeclinedToEnablePAU"];
  }
  id v6 = +[SDAutoUnlockNotificationsManager sharedManager];
  [v6 clearPhoneAutoUnlockUpsellNotification:v3];
}

- (BOOL)behaviorChangedAfterUpgrade
{
  v2 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_assert_queue_V2(v2);

  BOOL v3 = +[NSUserDefaults standardUserDefaults];
  [v3 floatForKey:@"AutoUnlockLastSeenVersion"];
  float v5 = v4;
  id v6 = SFDeviceProductVersion();
  [v6 floatValue];
  float v8 = v7;

  id v9 = auto_unlock_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"NO";
    int v12 = 138413058;
    if (v5 < 15.0) {
      CFStringRef v10 = @"YES";
    }
    CFStringRef v13 = v10;
    __int16 v14 = 2048;
    double v15 = v5;
    __int16 v16 = 2048;
    double v17 = v8;
    __int16 v18 = 2048;
    uint64_t v19 = 15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "behavior changed: %@, last seen version: %f, current version: %f, firstSupportedVersion: %ld", (uint8_t *)&v12, 0x2Au);
  }

  return v5 < 15.0;
}

- (void)upsellBehaviorChangedAfterUpgradeIfNecessary
{
  BOOL v3 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_assert_queue_V2(v3);

  float v4 = +[SDAutoUnlockTransport sharedTransport];
  float v5 = [v4 enabledAutoUnlockDevicesUsingCache:1];
  id v6 = [v5 count];

  unsigned int v7 = [(SDAutoUnlockSessionManager *)self behaviorChangedAfterUpgrade];
  float v8 = auto_unlock_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"NO";
    if (v6) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    if (v7) {
      CFStringRef v9 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v20 = v10;
    __int16 v21 = 2112;
    CFStringRef v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AutoUnlock Enabled: %@, behavior changed after upgrade: %@", buf, 0x16u);
  }

  if (v6) {
    unsigned int v11 = v7;
  }
  else {
    unsigned int v11 = 0;
  }
  if (v11 == 1)
  {
    unsigned __int8 v12 = +[SFSiriController isSiriEnabled];
    CFStringRef v13 = +[NSUserDefaults standardUserDefaults];
    __int16 v14 = SFDeviceProductVersion();
    [v14 floatValue];
    [v13 setFloat:@"AutoUnlockLastSeenVersion" forKey:];

    dispatch_time_t v15 = dispatch_time(0, 3000000000);
    __int16 v16 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A02CC;
    block[3] = &unk_1008CC0A0;
    unsigned __int8 v18 = v12;
    dispatch_after(v15, v16, block);
  }
}

- (id)getUpsellNotificationBodyTextForEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[SFSiriController isSiriEnabled];
  id v6 = [(SDAutoUnlockSessionManager *)self localDeviceController];
  unsigned int v7 = [v6 supportsPeriocular];

  float v8 = auto_unlock_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"NO";
    if (v7) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    if (v5) {
      CFStringRef v9 = @"YES";
    }
    int v15 = 138412546;
    CFStringRef v16 = v10;
    __int16 v17 = 2112;
    CFStringRef v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Displaying upsell text. Supports periocular: %@. Siri enabled: %@", (uint8_t *)&v15, 0x16u);
  }

  if (_os_feature_enabled_impl())
  {
    unsigned int v11 = [v4 value];
    unsigned __int8 v12 = [v11 stringValue];
    [v12 isEqualToString:@"com.apple.faceid.any-face-covering.detected"];
  }
  CFStringRef v13 = SFLocalizedStringForKey();

  return v13;
}

- (void)upsellPhoneAutoUnlock
{
  BOOL v3 = [(SDAutoUnlockSessionManager *)self localDeviceController];
  if ([v3 faceIDEnabled] && SFDeviceSupportsAutoUnlock())
  {
    char v4 = sub_1000D3140();

    if ((v4 & 1) == 0)
    {
      unsigned int v5 = +[NSUserDefaults standardUserDefaults];
      unsigned int v6 = [v5 BOOLForKey:@"AutoUnlockDeclinedToEnablePAU"];
      unsigned int v7 = [v5 BOOLForKey:@"AutoUnlockAlreadyEnabledBefore"];
      unsigned int v8 = v7;
      if ((v6 & 1) == 0 && !v7)
      {
        CFStringRef v9 = +[SDAutoUnlockTransport sharedTransport];
        CFStringRef v10 = [v9 pairedAutoUnlockDevice];

        if (!v10
          || ([v10 unlockEnabled] & 1) != 0
          || ![(SDAutoUnlockSessionManager *)self phoneAutoUnlockSupportedByDevice:v10])
        {
          uint64_t v30 = auto_unlock_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v31 = @"YES";
            if (!v10) {
              CFStringRef v31 = @"NO";
            }
            *(_DWORD *)buf = 138412290;
            double v48 = *(double *)&v31;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Skipping upsell. Current Active Watch found:%@", buf, 0xCu);
          }

          if (v10)
          {
            long long v32 = auto_unlock_log();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              if ([v10 unlockEnabled]) {
                CFStringRef v33 = @"YES";
              }
              else {
                CFStringRef v33 = @"NO";
              }
              if ([(SDAutoUnlockSessionManager *)self phoneAutoUnlockSupportedByDevice:v10])
              {
                CFStringRef v34 = @"YES";
              }
              else
              {
                CFStringRef v34 = @"NO";
              }
              *(_DWORD *)buf = 138412546;
              double v48 = *(double *)&v33;
              __int16 v49 = 2112;
              CFStringRef v50 = v34;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Watch unlockEnabled:%@, Watch HW/SW compatible:%@", buf, 0x16u);
            }

            if ([v10 unlockEnabled]) {
              [v5 setBool:1 forKey:@"AutoUnlockAlreadyEnabledBefore"];
            }
          }
          goto LABEL_29;
        }
        unsigned int v11 = auto_unlock_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v12 = [v10 uniqueID];
          *(_DWORD *)buf = 138412290;
          double v48 = *(double *)&v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Current Active Watch ID %@", buf, 0xCu);
        }
        CFStringRef v13 = +[SDStatusMonitor sharedMonitor];
        if ([v13 pairedWatchWristState] == (id)3)
        {
          __int16 v14 = +[SDStatusMonitor sharedMonitor];
          unsigned int v15 = [v14 pairedWatchLockState];

          if (!v15)
          {
            if ([(SDAutoUnlockSessionManager *)self shouldNotify])
            {
              CFStringRef v16 = sub_1000D4644(1);
              __int16 v17 = [v16 firstObject];
              if (v17)
              {
                CFStringRef v18 = +[NSDate date];
                uint64_t v19 = [v17 endDate];
                [v18 timeIntervalSinceDate:v19];
                double v21 = v20;
              }
              else
              {
                double v21 = 10.0;
              }
              unsigned __int8 v40 = auto_unlock_log();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                double v48 = v21;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Last Mask Detection %f seconds ago", buf, 0xCu);
              }

              if (v21 >= 10.0)
              {
                long long v44 = auto_unlock_log();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Skipping upsell. Last Mask Detection too long ago", buf, 2u);
                }
              }
              else
              {
                [v5 setInteger:(char *)[v5 integerForKey:@"AutoUnlockLastUpsellState"] + 1 forKey:@"AutoUnlockLastUpsellState"];
                id v41 = +[NSDate date];
                [v5 setObject:v41 forKey:@"AutoUnlockLastUpsellDate"];

                dispatch_time_t v42 = dispatch_time(0, 3000000000);
                long long v43 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
                v45[0] = _NSConcreteStackBlock;
                v45[1] = 3221225472;
                v45[2] = sub_1000A0C68;
                v45[3] = &unk_1008CA640;
                v45[4] = self;
                id v46 = v17;
                dispatch_after(v42, v43, v45);
              }
              goto LABEL_29;
            }
            long long v35 = auto_unlock_log();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Skipping upsell. Should not notify based on previous notification and upsell state", buf, 2u);
            }
            goto LABEL_56;
          }
        }
        else
        {
        }
        long long v35 = auto_unlock_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v36 = +[SDStatusMonitor sharedMonitor];
          id v37 = [v36 pairedWatchWristState];
          double v38 = +[SDStatusMonitor sharedMonitor];
          unsigned int v39 = [v38 pairedWatchLockState];
          *(_DWORD *)buf = 134218240;
          double v48 = *(double *)&v37;
          __int16 v49 = 1024;
          LODWORD(v50) = v39;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Skipping upsell. Active watch not on wrist (state: %ld) and unlocked (state: %d). Skipping upsell.", buf, 0x12u);
        }
LABEL_56:

        goto LABEL_29;
      }
      CFStringRef v10 = auto_unlock_log();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_29:

        goto LABEL_30;
      }
      CFStringRef v28 = @"NO";
      if (v6) {
        CFStringRef v29 = @"YES";
      }
      else {
        CFStringRef v29 = @"NO";
      }
      if (v8) {
        CFStringRef v28 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      double v48 = *(double *)&v29;
      __int16 v49 = 2112;
      CFStringRef v50 = v28;
      uint64_t v25 = "Skipping upsell. User declined to enable PAU after reading the pop up: %@, PAU already enabled before: %@";
      uint64_t v26 = v10;
      uint32_t v27 = 22;
LABEL_28:
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      goto LABEL_29;
    }
  }
  else
  {
  }
  unsigned int v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = [(SDAutoUnlockSessionManager *)self localDeviceController];
    if ([v10 faceIDEnabled]) {
      CFStringRef v22 = @"YES";
    }
    else {
      CFStringRef v22 = @"NO";
    }
    if (SFDeviceSupportsAutoUnlock()) {
      CFStringRef v23 = @"YES";
    }
    else {
      CFStringRef v23 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    if (sub_1000D3140()) {
      CFStringRef v24 = @"YES";
    }
    else {
      CFStringRef v24 = @"NO";
    }
    double v48 = *(double *)&v22;
    __int16 v49 = 2112;
    CFStringRef v50 = v23;
    __int16 v51 = 2112;
    CFStringRef v52 = v24;
    uint64_t v25 = "Skipping upsell. FaceIDEnabled:%@, SFDeviceSupportsAutoUnlock:%@, SDAutoUnlockDisallowedDueToManagement:%@";
    uint64_t v26 = v5;
    uint32_t v27 = 32;
    goto LABEL_28;
  }
LABEL_30:
}

- (BOOL)shouldNotify
{
  v2 = +[NSUserDefaults standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"AutoUnlockLastUpsellDate"];
  if (v3)
  {
    char v4 = +[NSCalendar currentCalendar];
    unsigned int v5 = +[NSDate date];
    unsigned int v6 = [v4 components:32 fromDate:v3 toDate:v5 options:0];
    uint64_t v7 = (uint64_t)[v6 hour];
  }
  else
  {
    uint64_t v7 = 0;
  }
  unsigned int v8 = auto_unlock_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v3;
    __int16 v16 = 2048;
    uint64_t v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Last notification date: %@, %ld hours ago", (uint8_t *)&v14, 0x16u);
  }

  BOOL v9 = v7 > 48;
  if (v3 && v7 < 49) {
    goto LABEL_16;
  }
  id v10 = [v2 integerForKey:@"AutoUnlockLastUpsellState"];
  unsigned int v11 = auto_unlock_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    id v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Number of notifications sent for this phone: %ld", (uint8_t *)&v14, 0xCu);
  }

  if (!v10)
  {
    BOOL v9 = 1;
    goto LABEL_17;
  }
  if (v10 == (id)2)
  {
    BOOL v9 = v7 > 168;
    goto LABEL_17;
  }
  if (v10 != (id)1)
  {
    unsigned __int8 v12 = auto_unlock_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No more upselling for this watch", (uint8_t *)&v14, 2u);
    }

LABEL_16:
    BOOL v9 = 0;
  }
LABEL_17:

  return v9;
}

- (void)handleUnexpectedDisablement:(id)a3
{
  BOOL v3 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = [v3 BOOLForKey:@"AutoUnlockAlreadyEnabledBefore"];
  unsigned int v5 = auto_unlock_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting upsell notification defaults", buf, 2u);
    }

    [v3 removeObjectForKey:@"AutoUnlockLastUpsellState"];
    [v3 removeObjectForKey:@"AutoUnlockLastUpsellDate"];
    [v3 removeObjectForKey:@"AutoUnlockDeclinedToEnablePAU"];
    [v3 removeObjectForKey:@"AutoUnlockAlreadyEnabledBefore"];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Keeping upsell notification defaults", v7, 2u);
    }
  }
}

- (void)handleLockStateChanged
{
  BOOL v3 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = +[SDStatusMonitor sharedMonitor];
  unsigned int v5 = [v4 deviceKeyBagUnlocked];

  if (v5)
  {
    BOOL v6 = +[SDAutoUnlockTransport sharedTransport];
    [v6 updateApproveBluetoothIDs];

    [(SDAutoUnlockSessionManager *)self armDevicesWaitingForUnlock];
    [(SDAutoUnlockSessionManager *)self registerRemotePeerIfNecessary];
    if (![(SDAutoUnlockSessionManager *)self doNotPostUnlockConfirmation]) {
      [(SDAutoUnlockSessionManager *)self cancelAttemptsForDeviceUnlocked];
    }
    if (![(SDAutoUnlockSessionManager *)self lastUnlockedByWatch])
    {
      [(SDAutoUnlockSessionManager *)self setLastLockedByRelock:0];
      [(SDAutoUnlockSessionManager *)self upsellPhoneAutoUnlock];
    }
    uint64_t v7 = +[NSDate date];
    [(SDAutoUnlockSessionManager *)self setLastUnlockDate:v7];

    if ([(SDAutoUnlockSessionManager *)self attemptCount] >= 1)
    {
      unsigned int v8 = auto_unlock_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resetting attempt count", v16, 2u);
      }

      [(SDAutoUnlockSessionManager *)self setAttemptCount:0];
    }
  }
  else
  {
    BOOL v9 = +[SDStatusMonitor sharedMonitor];
    -[SDAutoUnlockSessionManager setCachedDeviceWiFiState:](self, "setCachedDeviceWiFiState:", [v9 wirelessEnabled]);

    if ([(SDAutoUnlockSessionManager *)self lastUnlockedByWatch]) {
      [(SDAutoUnlockSessionManager *)self releaseLanguageAssertionForAutoRelock];
    }
    if ([(SDAutoUnlockSessionManager *)self periocularStatus])
    {
      id v10 = +[NSNumber numberWithInteger:[(SDAutoUnlockSessionManager *)self periocularStatus]];
      unsigned int v11 = [(SDAutoUnlockSessionManager *)self cachedMetrics];
      [v11 setObject:v10 forKeyedSubscript:SDAutoUnlockManagerMetricPeriocularStatus];
    }
    [(SDAutoUnlockSessionManager *)self setPeriocularStatus:0];
    [(SDAutoUnlockSessionManager *)self setLastUnlockedByWatch:0];
    [(SDAutoUnlockSessionManager *)self setSuppressAlert:0];
    [(SDAutoUnlockSessionManager *)self cancelMagnetLinkTimer];
    uint64_t v12 = [(SDAutoUnlockSessionManager *)self cachedMetrics];
    if (v12)
    {
      CFStringRef v13 = (void *)v12;
      unsigned __int8 v14 = [(SDAutoUnlockSessionManager *)self isBeingUsedForSiri];

      if ((v14 & 1) == 0)
      {
        id v15 = [(SDAutoUnlockSessionManager *)self cachedMetrics];
        sub_1000D0424(v15);

        [(SDAutoUnlockSessionManager *)self setCachedMetrics:0];
      }
    }
  }
}

- (id)unlockedOnWristDate
{
  return 0;
}

- (void)pipeConnectionChanged:(id)a3
{
  unsigned int v4 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A1338;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)handleDisplayStateChanged:(unint64_t)a3
{
  unsigned int v5 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_assert_queue_V2(v5);

  if (!a3 && [(SDAutoUnlockSessionManager *)self attemptInProgress])
  {
    BOOL v6 = auto_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Canceling attempt in progress – device screen turned off", v7, 2u);
    }

    [(SDAutoUnlockSessionManager *)self cancelAutoUnlock];
  }
}

- (void)beginKeyRegistrationIfNecessary
{
  BOOL v3 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_assert_queue_V2(v3);

  id v13 = +[SDStatusMonitor sharedMonitor];
  if ([v13 deviceKeyBagUnlocked])
  {
    unsigned int v4 = [(SDAutoUnlockSessionManager *)self needsArming];

    if (v4)
    {
      [(SDAutoUnlockSessionManager *)self setNeedsArming:0];
      unsigned int v5 = auto_unlock_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking if key originated registration is needed", buf, 2u);
      }

      BOOL v6 = +[SDAutoUnlockAKSManager sharedManager];
      [v6 updateLTKs];

      uint64_t v7 = +[SDAutoUnlockTransport sharedTransport];
      unsigned int v8 = [v7 pairedDeviceID];

      BOOL v9 = +[SDAutoUnlockAKSManager sharedManager];
      id v10 = [v9 remoteLTKForDeviceID:v8];

      unsigned int v11 = auto_unlock_log();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Beginning key originated registration", buf, 2u);
        }

        unsigned int v11 = +[NSUUID UUID];
        [(SDAutoUnlockSessionManager *)self createRegistrationKeySessionWithIdentifier:v11 deviceID:v8 requestData:0 locallyGenerated:1];
      }
      else if (v12)
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not find remote LTK for %@", buf, 0xCu);
      }
    }
  }
  else
  {
  }
}

- (void)handleBioLockout
{
  BOOL v3 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = auto_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device entered bio lockout, resetting all key devices", buf, 2u);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned int v5 = [(SDAutoUnlockSessionManager *)self lockRegistrationSessionsByDeviceID];
  BOOL v6 = [v5 allValues];

  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) invalidate];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  unsigned int v11 = [(SDAutoUnlockSessionManager *)self remotePeer];
  [v11 handleBioLockout];

  BOOL v12 = [(SDAutoUnlockSessionManager *)self lockRegistrationSessionsByDeviceID];
  [v12 removeAllObjects];

  [(SDAutoUnlockSessionManager *)self cancelAutoUnlock];
  [(SDAutoUnlockSessionManager *)self registerRemotePeerIfNecessary];
}

- (void)handlePairedDeviceLockStateChanged
{
  BOOL v3 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A18B0;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)handleAuthenticationSessionStarted
{
  BOOL v3 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A19CC;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)grabLanguageAssertionForAutoRelock
{
  v2 = auto_unlock_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    uint64_t v8 = 70;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Delay releasing language assertion for Auto Relock for %ld seconds", (uint8_t *)&v7, 0xCu);
  }

  BOOL v3 = +[NSDate now];
  unsigned int v4 = [v3 dateByAddingTimeInterval:70.0];

  unsigned int v5 = +[SDStatusMonitor sharedMonitor];
  [v5 addPreventExitForLocaleReason:@"AutoUnlockAutoRelockPreventExitReason"];

  BOOL v6 = +[SDStatusMonitor sharedMonitor];
  [v6 pushDateForPreventExitForLocaleReason:@"AutoUnlockAutoRelockPreventExitReason" expirationDate:v4];
}

- (void)releaseLanguageAssertionForAutoRelock
{
  v2 = auto_unlock_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Release language assertion for Auto Relock", v4, 2u);
  }

  BOOL v3 = +[SDStatusMonitor sharedMonitor];
  [v3 removePreventExitForLocaleReason:@"AutoUnlockAutoRelockPreventExitReason"];
}

- (BOOL)deviceCurrentlyUnlockedByWatch
{
  BOOL v3 = +[SDStatusMonitor sharedMonitor];
  if ([v3 deviceKeyBagUnlocked]) {
    BOOL v4 = [(SDAutoUnlockSessionManager *)self lastUnlockedByWatch];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)setUpMagnetLinkTimer
{
  BOOL v3 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  [(SDAutoUnlockSessionManager *)self setMagnetLinkTimer:v4];

  unsigned int v5 = [(SDAutoUnlockSessionManager *)self magnetLinkTimer];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000A1E60;
  handler[3] = &unk_1008CA4B8;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);

  BOOL v6 = [(SDAutoUnlockSessionManager *)self magnetLinkTimer];
  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);

  uint64_t v8 = [(SDAutoUnlockSessionManager *)self magnetLinkTimer];
  dispatch_source_set_cancel_handler(v8, &stru_1008CC0C0);

  uint64_t v9 = [(SDAutoUnlockSessionManager *)self magnetLinkTimer];
  dispatch_activate(v9);

  id v10 = auto_unlock_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Magnet Link Timer Activated", v11, 2u);
  }
}

- (void)btPipeConnectionChanged:(id)a3
{
  dispatch_source_t v4 = (__CFString *)a3;
  if (!_os_feature_enabled_impl()) {
    goto LABEL_26;
  }
  unsigned int v5 = [(__CFString *)v4 userInfo];
  BOOL v6 = [v5 objectForKeyedSubscript:SFNotificationKeyConnectionState];
  id v7 = [v6 integerValue];

  uint64_t v8 = auto_unlock_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    CFStringRef v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "btPipeConnectionChanged Notification: %@", (uint8_t *)&v23, 0xCu);
  }

  if (v7 != (id)2)
  {
    if (v7 == (id)1) {
      [(SDAutoUnlockSessionManager *)self cancelMagnetLinkTimer];
    }
    goto LABEL_26;
  }
  uint64_t v9 = auto_unlock_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = [(SDAutoUnlockSessionManager *)self lastUnlockedByWatch];
    CFStringRef v11 = @"NO";
    if (v10) {
      CFStringRef v11 = @"YES";
    }
    int v23 = 138412290;
    CFStringRef v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device unlock by Phone Auto Unlock status: %@", (uint8_t *)&v23, 0xCu);
  }

  BOOL v12 = +[NSDate now];
  long long v13 = [(SDAutoUnlockSessionManager *)self lastUnlockDate];
  [v12 timeIntervalSinceDate:v13];
  double v15 = v14;

  if (v15 > 60.0)
  {
    CFStringRef v18 = [(SDAutoUnlockSessionManager *)self cachedMetrics];
    [v18 setObject:&__kCFBooleanTrue forKeyedSubscript:SDAutoUnlockManagerMetricAutoRelockWindowExpiredKey];

    [(SDAutoUnlockSessionManager *)self deviceCurrentlyUnlockedByWatch];
  }
  else if ([(SDAutoUnlockSessionManager *)self deviceCurrentlyUnlockedByWatch])
  {
    long long v16 = auto_unlock_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Device Unlocked & AutoRelock Window Not Expired, BTPipe Disconnected, Create Magnet Link Timer", (uint8_t *)&v23, 2u);
    }

    uint64_t v17 = [(SDAutoUnlockSessionManager *)self magnetLinkTimer];

    if (!v17) {
      [(SDAutoUnlockSessionManager *)self setUpMagnetLinkTimer];
    }
    goto LABEL_26;
  }
  uint64_t v19 = auto_unlock_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v20 = [(SDAutoUnlockSessionManager *)self deviceCurrentlyUnlockedByWatch];
    CFStringRef v21 = @"NO";
    if (v20) {
      CFStringRef v22 = @"YES";
    }
    else {
      CFStringRef v22 = @"NO";
    }
    if (v15 > 60.0) {
      CFStringRef v21 = @"YES";
    }
    int v23 = 138412546;
    CFStringRef v24 = v22;
    __int16 v25 = 2112;
    CFStringRef v26 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Not Creating Magnet Link Timer, deviceCurrentlyUnlockedByWatch: %@, autoRelockWindowExpired: %@", (uint8_t *)&v23, 0x16u);
  }

LABEL_26:
}

- (void)cancelMagnetLinkTimer
{
  uint64_t v3 = [(SDAutoUnlockSessionManager *)self magnetLinkTimer];
  if (v3)
  {
    dispatch_source_t v4 = (void *)v3;
    unsigned int v5 = [(SDAutoUnlockSessionManager *)self magnetLinkTimer];
    intptr_t v6 = dispatch_source_testcancel(v5);

    if (!v6)
    {
      id v7 = [(SDAutoUnlockSessionManager *)self magnetLinkTimer];
      dispatch_source_cancel(v7);

      [(SDAutoUnlockSessionManager *)self setMagnetLinkTimer:0];
      uint64_t v8 = [(SDAutoUnlockSessionManager *)self cachedMetrics];
      uint64_t v9 = SDAutoUnlockManagerMetricAutoRelockTimerCanceledKey;
      unsigned int v10 = [v8 objectForKeyedSubscript:SDAutoUnlockManagerMetricAutoRelockTimerCanceledKey];

      CFStringRef v11 = [(SDAutoUnlockSessionManager *)self cachedMetrics];
      BOOL v12 = v11;
      if (v10)
      {
        long long v13 = [v11 objectForKeyedSubscript:v9];
        unsigned int v14 = [v13 intValue];

        BOOL v12 = +[NSNumber numberWithInt:v14 + 1];
        double v15 = [(SDAutoUnlockSessionManager *)self cachedMetrics];
        [v15 setObject:v12 forKeyedSubscript:v9];
      }
      else
      {
        [v11 setObject:&off_100902898 forKeyedSubscript:v9];
      }

      long long v16 = auto_unlock_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Cancelled Magnet Link Timer", v17, 2u);
      }
    }
  }
}

- (id)baseResultsDictionaryForError:(id)a3
{
  id v4 = a3;
  unsigned int v5 = objc_opt_new();
  intptr_t v6 = [v4 domain];
  [v5 setObject:v6 forKeyedSubscript:SDAutoUnlockManagerMetricErrorDomainKey];

  [v5 setObject:&off_100902868 forKeyedSubscript:SDAutoUnlockManagerMetricSuccessKey];
  id v7 = +[NSNumber numberWithInteger:[(SDAutoUnlockSessionManager *)self connectedBluetoothDevices]];
  [v5 setObject:v7 forKeyedSubscript:SDAutoUnlockManagerMetricConnectedBluetoothDevicesKey];

  uint64_t v8 = +[NSNumber numberWithInteger:[(SDAutoUnlockSessionManager *)self timeSinceLastMachineWake]];
  [v5 setObject:v8 forKeyedSubscript:SDAutoUnlockManagerMetricTimeSinceLastWakeKey];

  uint64_t v9 = +[NSNumber numberWithInteger:[(SDAutoUnlockSessionManager *)self lastSleepType]];
  [v5 setObject:v9 forKeyedSubscript:SDAutoUnlockManagerMetricLastSleepTypeKey];

  unsigned int v10 = [v4 localizedDescription];
  [v5 setObject:v10 forKeyedSubscript:SDAutoUnlockManagerMetricErrorStringKey];

  id v11 = [v4 code];
  BOOL v12 = +[NSNumber numberWithInteger:v11];
  [v5 setObject:v12 forKeyedSubscript:SDAutoUnlockManagerMetricErrorCodeKey];

  return v5;
}

- (void)handleBluetoothPowerChanged:(id)a3
{
  id v4 = +[SDStatusMonitor sharedMonitor];
  unsigned int v5 = [v4 bluetoothEnabled];

  intptr_t v6 = auto_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v5) {
      CFStringRef v7 = @"YES";
    }
    int v8 = 138412290;
    CFStringRef v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Bluetooth power changed (interface on: %@)", (uint8_t *)&v8, 0xCu);
  }

  if (v5)
  {
    [(SDAutoUnlockSessionManager *)self setBluetoothErrorCount:0];
    [(SDAutoUnlockSessionManager *)self setPresentedBluetoothError:0];
    [(SDAutoUnlockSessionManager *)self savePresentedBluetoothError];
  }
}

- (void)handleWiFiPowerChanged:(id)a3
{
  id v4 = +[SDStatusMonitor sharedMonitor];
  -[SDAutoUnlockSessionManager setCachedDeviceWiFiState:](self, "setCachedDeviceWiFiState:", [v4 wirelessEnabled]);

  unsigned int v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [(SDAutoUnlockSessionManager *)self cachedDeviceWiFiState];
    CFStringRef v7 = @"NO";
    if (v6) {
      CFStringRef v7 = @"YES";
    }
    int v8 = 138412290;
    CFStringRef v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Wi-Fi power changed (interface on: %@)", (uint8_t *)&v8, 0xCu);
  }
}

- (id)errorStringForBluetoothEnabled:(BOOL)a3 wifiEnabled:(BOOL)a4 faceIDEnabled:(BOOL)a5
{
  if (!a5)
  {
    unsigned int v5 = @"### FaceID needs to be enabled for this feature to work";
    goto LABEL_12;
  }
  if (a3 || a4)
  {
    if (!a3) {
      goto LABEL_11;
    }
    if (a4)
    {
      unsigned int v5 = 0;
      goto LABEL_12;
    }
  }
  SFIsGreenTeaDevice();
LABEL_11:
  SFLocalizedStringForKey();
  unsigned int v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v5;
}

- (int64_t)errorCodeForBluetoothEnabled:(BOOL)a3 wifiEnabled:(BOOL)a4 faceIDEnabled:(BOOL)a5
{
  int64_t v5 = 123;
  if (!a3 && !a4) {
    int64_t v5 = 124;
  }
  uint64_t v6 = 120;
  if (a4) {
    uint64_t v6 = 0;
  }
  if (a3) {
    int64_t v5 = v6;
  }
  if (a5) {
    return v5;
  }
  else {
    return 205;
  }
}

- (BOOL)shouldShowErrorForBluetoothEnabled:(BOOL)a3
{
  if (a3) {
    return 0;
  }
  if ([(SDAutoUnlockSessionManager *)self presentedBluetoothError])
  {
    id v4 = auto_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already presented Bluetooth off error", (uint8_t *)v7, 2u);
    }

    return 0;
  }
  if ([(SDAutoUnlockSessionManager *)self bluetoothErrorCount] >= 5)
  {
    [(SDAutoUnlockSessionManager *)self setPresentedBluetoothError:1];
    [(SDAutoUnlockSessionManager *)self savePresentedBluetoothError];
    return 0;
  }
  [(SDAutoUnlockSessionManager *)self setBluetoothErrorCount:(char *)[(SDAutoUnlockSessionManager *)self bluetoothErrorCount] + 1];
  uint64_t v6 = auto_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = [(SDAutoUnlockSessionManager *)self bluetoothErrorCount];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "### Bluetooth error count: %d", (uint8_t *)v7, 8u);
  }

  return 1;
}

- (BOOL)shouldShowErrorForWiFiEnabled:(BOOL)a3
{
  if (a3) {
    return 0;
  }
  if ([(SDAutoUnlockSessionManager *)self presentedWiFiError])
  {
    id v4 = auto_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already presented Wi-Fi off error", (uint8_t *)v7, 2u);
    }

    return 0;
  }
  if ([(SDAutoUnlockSessionManager *)self wifiErrorCount] >= 5)
  {
    [(SDAutoUnlockSessionManager *)self setPresentedWiFiError:1];
    [(SDAutoUnlockSessionManager *)self savePresentedWiFiError];
    return 0;
  }
  [(SDAutoUnlockSessionManager *)self setWifiErrorCount:(char *)[(SDAutoUnlockSessionManager *)self wifiErrorCount] + 1];
  uint64_t v6 = auto_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = [(SDAutoUnlockSessionManager *)self wifiErrorCount];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "### WiFi error count: %d", (uint8_t *)v7, 8u);
  }

  return 1;
}

- (void)loadPresentedBluetoothError
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  -[SDAutoUnlockSessionManager setPresentedBluetoothError:](self, "setPresentedBluetoothError:", [v3 BOOLForKey:@"AutoUnlockPresentedBluetoothError"]);
}

- (void)loadPresentedWiFiError
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  -[SDAutoUnlockSessionManager setPresentedWiFiError:](self, "setPresentedWiFiError:", [v3 BOOLForKey:@"AutoUnlockPresentedWiFiError"]);
}

- (void)savePresentedBluetoothError
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 setBool:-[SDAutoUnlockSessionManager presentedBluetoothError](self, "presentedBluetoothError") forKey:@"AutoUnlockPresentedBluetoothError"];
  [v3 synchronize];
}

- (void)savePresentedWiFiError
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 setBool:-[SDAutoUnlockSessionManager presentedWiFiError](self, "presentedWiFiError") forKey:@"AutoUnlockPresentedWiFiError"];
  [v3 synchronize];
}

- (void)generateStateDump
{
  v2 = auto_unlock_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000A4BB0();
  }
}

- (void)initializeCaptureBlock
{
  id v3 = [(SDAutoUnlockSessionManager *)self sessionManagerQueue];
  [(SDAutoUnlockSessionManager *)self setStateHandle:os_state_add_handler()];
}

- (os_state_data_s)dumpState
{
  id v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dumping state", buf, 2u);
  }

  NSAppendPrintF();
  id v4 = 0;
  uint64_t v5 = [(SDAutoUnlockSessionManager *)self state];
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    uint64_t v20 = v5;
    NSAppendPrintF();
    id v7 = v4;

    id v4 = v7;
  }
  int v8 = +[SDAutoUnlockAKSManager sharedManager];
  CFStringRef v9 = [v8 state];

  if (v9)
  {
    CFStringRef v21 = v9;
    NSAppendPrintF();
    id v10 = v4;

    id v4 = v10;
  }
  id v11 = +[SDAutoUnlockTransport sharedTransport];
  BOOL v12 = [v11 state];

  if (v12)
  {
    NSAppendPrintF();
    id v13 = v4;

    id v4 = v13;
  }
  NSAppendPrintF();
  id v14 = v4;

  if (v14)
  {
    id v15 = +[NSPropertyListSerialization dataWithPropertyList:v14 format:200 options:0 error:0];
    id v16 = [v15 length];
    uint64_t v17 = (os_state_data_s *)malloc_type_calloc(1uLL, (size_t)v16 + 200, 0xD2D2FD3FuLL);
    CFStringRef v18 = v17;
    if (v17)
    {
      v17->var0 = 1;
      v17->var1.var1 = v16;
      __strlcpy_chk();
      id v15 = v15;
      memcpy(v18->var4, [v15 bytes], (size_t)v16);
    }
  }
  else
  {
    id v15 = 0;
    CFStringRef v18 = 0;
  }

  return v18;
}

- (NSString)state
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  NSAppendPrintF();
  id v5 = 0;

  NSAppendPrintF();
  id v6 = v5;

  id v7 = objc_opt_new();
  id v37 = sub_1000D22B4(v7);
  NSAppendPrintF();
  id v8 = v6;

  CFStringRef v9 = +[SDStatusMonitor sharedMonitor];
  if ([v9 deviceSupportsRanging]) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  CFStringRef v38 = v10;
  NSAppendPrintF();
  id v11 = v8;

  BOOL v12 = +[SDStatusMonitor sharedMonitor];
  unsigned int v39 = [v12 modelCode];
  NSAppendPrintF();
  id v13 = v11;

  id v14 = +[SDStatusMonitor sharedMonitor];
  if ([v14 deviceKeyBagDisabled]) {
    CFStringRef v15 = @"NO";
  }
  else {
    CFStringRef v15 = @"YES";
  }
  CFStringRef v40 = v15;
  NSAppendPrintF();
  id v16 = v13;

  uint64_t v17 = +[SDStatusMonitor sharedMonitor];
  if ([v17 deviceKeyBagUnlocked]) {
    CFStringRef v18 = @"YES";
  }
  else {
    CFStringRef v18 = @"NO";
  }
  CFStringRef v41 = v18;
  NSAppendPrintF();
  id v19 = v16;

  uint64_t v20 = [(SDAutoUnlockSessionManager *)self lockStateChangedDate];
  dispatch_time_t v42 = sub_1000D22B4(v20);
  NSAppendPrintF();
  id v21 = v19;

  NSAppendPrintF();
  id v22 = v21;

  int64_t v43 = [(SDAutoUnlockSessionManager *)self attemptCount];
  NSAppendPrintF();
  id v23 = v22;

  CFStringRef v24 = [(SDAutoUnlockSessionManager *)self lastUnlockDate];
  if (v24) {
    CFStringRef v25 = @"YES";
  }
  else {
    CFStringRef v25 = @"NO";
  }
  CFStringRef v44 = v25;
  NSAppendPrintF();
  id v26 = v23;

  uint32_t v27 = [(SDAutoUnlockSessionManager *)self advertisingChangedDate];
  long long v45 = sub_1000D22B4(v27);
  NSAppendPrintF();
  id v28 = v26;

  CFStringRef v29 = +[SDAutoUnlockTransport sharedTransport];
  if ([v29 deviceNearby]) {
    CFStringRef v30 = @"YES";
  }
  else {
    CFStringRef v30 = @"NO";
  }
  CFStringRef v46 = v30;
  NSAppendPrintF();
  id v31 = v28;

  long long v32 = [(SDAutoUnlockSessionManager *)self nearbyDeviceChangedDate];
  uint64_t v47 = sub_1000D22B4(v32);
  NSAppendPrintF();
  id v33 = v31;

  double v48 = [(SDAutoUnlockSessionManager *)self lockRegistrationSessionsByDeviceID];
  NSAppendPrintF();
  id v34 = v33;

  __int16 v49 = [(SDAutoUnlockSessionManager *)self remotePeer];
  NSAppendPrintF();
  id v35 = v34;

  return (NSString *)v35;
}

- (void)storePreviousSessionID:(id)a3
{
  id v13 = a3;
  [(SDAutoUnlockSessionManager *)self loadPreviousSessionIDs];
  id v4 = [(SDAutoUnlockSessionManager *)self previousSessionIDs];
  id v5 = [v13 UUIDString];
  [v4 insertObject:v5 atIndex:0];

  id v6 = [(SDAutoUnlockSessionManager *)self previousSessionIDs];
  id v7 = [v6 count];

  if ((unint64_t)v7 >= 0x65)
  {
    do
    {
      id v8 = [(SDAutoUnlockSessionManager *)self previousSessionIDs];
      [v8 removeLastObject];

      CFStringRef v9 = [(SDAutoUnlockSessionManager *)self previousSessionIDs];
      id v10 = [v9 count];
    }
    while ((unint64_t)v10 > 0x64);
  }
  id v11 = +[NSUserDefaults standardUserDefaults];
  BOOL v12 = [(SDAutoUnlockSessionManager *)self previousSessionIDs];
  [v11 setObject:v12 forKey:@"ApproveSessionIDs"];

  [v11 synchronize];
}

- (BOOL)previousSessionExists:(id)a3
{
  id v4 = a3;
  [(SDAutoUnlockSessionManager *)self loadPreviousSessionIDs];
  id v5 = [(SDAutoUnlockSessionManager *)self previousSessionIDs];
  id v6 = [v4 UUIDString];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (void)loadPreviousSessionIDs
{
  id v3 = [(SDAutoUnlockSessionManager *)self previousSessionIDs];

  if (!v3)
  {
    id v8 = +[NSUserDefaults standardUserDefaults];
    id v4 = [v8 objectForKey:@"ApproveSessionIDs"];
    id v5 = [v4 mutableCopy];
    [(SDAutoUnlockSessionManager *)self setPreviousSessionIDs:v5];

    id v6 = [(SDAutoUnlockSessionManager *)self previousSessionIDs];

    if (!v6)
    {
      id v7 = objc_opt_new();
      [(SDAutoUnlockSessionManager *)self setPreviousSessionIDs:v7];
    }
  }
}

- (void)setState:(id)a3
{
}

- (BOOL)attemptInProgress
{
  return self->_attemptInProgress;
}

- (void)setAttemptInProgress:(BOOL)a3
{
  self->_attemptInProgress = a3;
}

- (NSData)attemptExternalACMContext
{
  return self->_attemptExternalACMContext;
}

- (void)setAttemptExternalACMContext:(id)a3
{
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (NSDictionary)awdlInfo
{
  return self->_awdlInfo;
}

- (void)setAwdlInfo:(id)a3
{
}

- (OS_dispatch_queue)sessionManagerQueue
{
  return self->_sessionManagerQueue;
}

- (void)setSessionManagerQueue:(id)a3
{
}

- (NSHashTable)observerTable
{
  return self->_observerTable;
}

- (void)setObserverTable:(id)a3
{
}

- (SDAutoUnlockSuggestionManager)suggestionManager
{
  return self->_suggestionManager;
}

- (void)setSuggestionManager:(id)a3
{
}

- (NSMutableDictionary)lockAuthSessions
{
  return self->_lockAuthSessions;
}

- (void)setLockAuthSessions:(id)a3
{
}

- (NSMutableArray)canceledPairingKeySessions
{
  return self->_canceledPairingKeySessions;
}

- (void)setCanceledPairingKeySessions:(id)a3
{
}

- (NSMutableArray)canceledAuthLockSessions
{
  return self->_canceledAuthLockSessions;
}

- (void)setCanceledAuthLockSessions:(id)a3
{
}

- (NSMutableDictionary)keyAuthSessions
{
  return self->_keyAuthSessions;
}

- (void)setKeyAuthSessions:(id)a3
{
}

- (NSMutableDictionary)lockPairingSessions
{
  return self->_lockPairingSessions;
}

- (void)setLockPairingSessions:(id)a3
{
}

- (NSMutableDictionary)keyPairingSessions
{
  return self->_keyPairingSessions;
}

- (void)setKeyPairingSessions:(id)a3
{
}

- (NSMutableDictionary)proxySessions
{
  return self->_proxySessions;
}

- (void)setProxySessions:(id)a3
{
}

- (NSMutableArray)locksWithAKSTokens
{
  return self->_locksWithAKSTokens;
}

- (void)setLocksWithAKSTokens:(id)a3
{
}

- (NSMutableArray)keysWithAKSTokens
{
  return self->_keysWithAKSTokens;
}

- (void)setKeysWithAKSTokens:(id)a3
{
}

- (NSMutableDictionary)keyRegistrationSessionsByDeviceID
{
  return self->_keyRegistrationSessionsByDeviceID;
}

- (void)setKeyRegistrationSessionsByDeviceID:(id)a3
{
}

- (NSMutableDictionary)lockRegistrationSessionsByDeviceID
{
  return self->_lockRegistrationSessionsByDeviceID;
}

- (void)setLockRegistrationSessionsByDeviceID:(id)a3
{
}

- (NSMutableSet)serviceClients
{
  return self->_serviceClients;
}

- (void)setServiceClients:(id)a3
{
}

- (BOOL)watchUnlockEnabled
{
  return self->_watchUnlockEnabled;
}

- (void)setWatchUnlockEnabled:(BOOL)a3
{
  self->_watchUnlockEnabled = a3;
}

- (NSData)previousMacAddressData
{
  return self->_previousMacAddressData;
}

- (void)setPreviousMacAddressData:(id)a3
{
}

- (BOOL)previousNearbyState
{
  return self->_previousNearbyState;
}

- (void)setPreviousNearbyState:(BOOL)a3
{
  self->_previousNearbyState = a3;
}

- (OS_dispatch_source)nearbyPushTimer
{
  return self->_nearbyPushTimer;
}

- (void)setNearbyPushTimer:(id)a3
{
}

- (BOOL)attemptPrewarmed
{
  return self->_attemptPrewarmed;
}

- (void)setAttemptPrewarmed:(BOOL)a3
{
  self->_attemptPrewarmed = a3;
}

- (NSDate)prewarmStart
{
  return self->_prewarmStart;
}

- (void)setPrewarmStart:(id)a3
{
}

- (NSDate)attemptStart
{
  return self->_attemptStart;
}

- (void)setAttemptStart:(id)a3
{
}

- (BOOL)extendedTimer
{
  return self->_extendedTimer;
}

- (void)setExtendedTimer:(BOOL)a3
{
  self->_extendedTimer = a3;
}

- (SFDeviceDiscovery)scanner
{
  return self->_scanner;
}

- (void)setScanner:(id)a3
{
}

- (SFAutoUnlockDevice)attemptDevice
{
  return self->_attemptDevice;
}

- (void)setAttemptDevice:(id)a3
{
}

- (int64_t)attemptType
{
  return self->_attemptType;
}

- (void)setAttemptType:(int64_t)a3
{
  self->_attemptType = a3;
}

- (NSString)attemptBundlePath
{
  return self->_attemptBundlePath;
}

- (void)setAttemptBundlePath:(id)a3
{
}

- (NSString)attemptAppName
{
  return self->_attemptAppName;
}

- (void)setAttemptAppName:(id)a3
{
}

- (NSString)attemptNavBarTitle
{
  return self->_attemptNavBarTitle;
}

- (void)setAttemptNavBarTitle:(id)a3
{
}

- (id)attemptActivatedHandler
{
  return self->_attemptActivatedHandler;
}

- (void)setAttemptActivatedHandler:(id)a3
{
}

- (OS_dispatch_source)scanTimer
{
  return self->_scanTimer;
}

- (void)setScanTimer:(id)a3
{
}

- (double)proxyDiscoverTime
{
  return self->_proxyDiscoverTime;
}

- (void)setProxyDiscoverTime:(double)a3
{
  self->_proxyDiscoverTime = a3;
}

- (BOOL)notifiedForProxy
{
  return self->_notifiedForProxy;
}

- (void)setNotifiedForProxy:(BOOL)a3
{
  self->_notifiedForProxy = a3;
}

- (NSString)scanErrorString
{
  return self->_scanErrorString;
}

- (void)setScanErrorString:(id)a3
{
}

- (NSError)authSessionError
{
  return self->_authSessionError;
}

- (void)setAuthSessionError:(id)a3
{
}

- (int64_t)proxyErrorCode
{
  return self->_proxyErrorCode;
}

- (void)setProxyErrorCode:(int64_t)a3
{
  self->_proxyErrorCode = a3;
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

- (int64_t)lastProxyState
{
  return self->_lastProxyState;
}

- (void)setLastProxyState:(int64_t)a3
{
  self->_lastProxyState = a3;
}

- (double)proxyConnectionTime
{
  return self->_proxyConnectionTime;
}

- (void)setProxyConnectionTime:(double)a3
{
  self->_proxyConnectionTime = a3;
}

- (BOOL)proxyNotAvailableForUnlock
{
  return self->_proxyNotAvailableForUnlock;
}

- (void)setProxyNotAvailableForUnlock:(BOOL)a3
{
  self->_proxyNotAvailableForUnlock = a3;
}

- (NSSet)scanAutoUnlockDevices
{
  return self->_scanAutoUnlockDevices;
}

- (void)setScanAutoUnlockDevices:(id)a3
{
}

- (NSSet)scanWatchIDs
{
  return self->_scanWatchIDs;
}

- (void)setScanWatchIDs:(id)a3
{
}

- (NSSet)scanPhoneIDs
{
  return self->_scanPhoneIDs;
}

- (void)setScanPhoneIDs:(id)a3
{
}

- (int64_t)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(int64_t)a3
{
  self->_attemptCount = a3;
}

- (NSString)attemptID
{
  return self->_attemptID;
}

- (void)setAttemptID:(id)a3
{
}

- (NSString)incrementedCountID
{
  return self->_incrementedCountID;
}

- (void)setIncrementedCountID:(id)a3
{
}

- (int64_t)connectedBluetoothDevices
{
  return self->_connectedBluetoothDevices;
}

- (void)setConnectedBluetoothDevices:(int64_t)a3
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

- (NSSet)eligibleDevices
{
  return self->_eligibleDevices;
}

- (void)setEligibleDevices:(id)a3
{
}

- (int64_t)wifiErrorCount
{
  return self->_wifiErrorCount;
}

- (void)setWifiErrorCount:(int64_t)a3
{
  self->_wifiErrorCount = a3;
}

- (int64_t)bluetoothErrorCount
{
  return self->_bluetoothErrorCount;
}

- (void)setBluetoothErrorCount:(int64_t)a3
{
  self->_bluetoothErrorCount = a3;
}

- (BOOL)presentedBluetoothError
{
  return self->_presentedBluetoothError;
}

- (void)setPresentedBluetoothError:(BOOL)a3
{
  self->_presentedBluetoothError = a3;
}

- (BOOL)presentedWiFiError
{
  return self->_presentedWiFiError;
}

- (void)setPresentedWiFiError:(BOOL)a3
{
  self->_presentedWiFiError = a3;
}

- (BOOL)currentlyAdvertising
{
  return self->_currentlyAdvertising;
}

- (void)setCurrentlyAdvertising:(BOOL)a3
{
  self->_currentlyAdvertising = a3;
}

- (int64_t)idsMacCountCache
{
  return self->_idsMacCountCache;
}

- (void)setIdsMacCountCache:(int64_t)a3
{
  self->_idsMacCountCache = a3;
}

- (NSDate)advertisingChangedDate
{
  return self->_advertisingChangedDate;
}

- (void)setAdvertisingChangedDate:(id)a3
{
}

- (NSDate)wristStateChangedDate
{
  return self->_wristStateChangedDate;
}

- (void)setWristStateChangedDate:(id)a3
{
}

- (NSDate)lockStateChangedDate
{
  return self->_lockStateChangedDate;
}

- (void)setLockStateChangedDate:(id)a3
{
}

- (NSDate)nearbyDeviceChangedDate
{
  return self->_nearbyDeviceChangedDate;
}

- (void)setNearbyDeviceChangedDate:(id)a3
{
}

- (NSDate)pipeConnectionChangedDate
{
  return self->_pipeConnectionChangedDate;
}

- (void)setPipeConnectionChangedDate:(id)a3
{
}

- (BOOL)previousConnectedState
{
  return self->_previousConnectedState;
}

- (void)setPreviousConnectedState:(BOOL)a3
{
  self->_previousConnectedState = a3;
}

- (BOOL)autoRelockAssertionTimerActive
{
  return self->_autoRelockAssertionTimerActive;
}

- (void)setAutoRelockAssertionTimerActive:(BOOL)a3
{
  self->_autoRelockAssertionTimerActive = a3;
}

- (BOOL)cachedDeviceWiFiState
{
  return self->_cachedDeviceWiFiState;
}

- (void)setCachedDeviceWiFiState:(BOOL)a3
{
  self->_cachedDeviceWiFiState = a3;
}

- (BOOL)cachedWatchWiFiState
{
  return self->_cachedWatchWiFiState;
}

- (void)setCachedWatchWiFiState:(BOOL)a3
{
  self->_cachedWatchWiFiState = a3;
}

- (BOOL)wifiStateNeedsUpdating
{
  return self->_wifiStateNeedsUpdating;
}

- (void)setWifiStateNeedsUpdating:(BOOL)a3
{
  self->_wifiStateNeedsUpdating = a3;
}

- (BOOL)useBTPipe
{
  return self->_useBTPipe;
}

- (void)setUseBTPipe:(BOOL)a3
{
  self->_useBTPipe = a3;
}

- (BOOL)preventRadarNotification
{
  return self->_preventRadarNotification;
}

- (void)setPreventRadarNotification:(BOOL)a3
{
  self->_preventRadarNotification = a3;
}

- (NSMutableDictionary)cachedMetrics
{
  return self->_cachedMetrics;
}

- (void)setCachedMetrics:(id)a3
{
}

- (NSMutableArray)previousSessionIDs
{
  return self->_previousSessionIDs;
}

- (void)setPreviousSessionIDs:(id)a3
{
}

- (SDAutoUnlockIconTransferStore)iconTransferStore
{
  return self->_iconTransferStore;
}

- (void)setIconTransferStore:(id)a3
{
}

- (SDAutoUnlockLocalDeviceController)localDeviceController
{
  return self->_localDeviceController;
}

- (void)setLocalDeviceController:(id)a3
{
}

- (OS_dispatch_source)magnetLinkTimer
{
  return self->_magnetLinkTimer;
}

- (void)setMagnetLinkTimer:(id)a3
{
}

- (NSDate)lastUnlockDate
{
  return self->_lastUnlockDate;
}

- (void)setLastUnlockDate:(id)a3
{
}

- (BOOL)lastUnlockedByWatch
{
  return self->_lastUnlockedByWatch;
}

- (void)setLastUnlockedByWatch:(BOOL)a3
{
  self->_lastUnlockedByWatch = a3;
}

- (BOOL)lastLockedByRelock
{
  return self->_lastLockedByRelock;
}

- (void)setLastLockedByRelock:(BOOL)a3
{
  self->_lastLockedByRelock = a3;
}

- (BOOL)doNotPostUnlockConfirmation
{
  return self->_doNotPostUnlockConfirmation;
}

- (void)setDoNotPostUnlockConfirmation:(BOOL)a3
{
  self->_doNotPostUnlockConfirmation = a3;
}

- (BOOL)suppressAlert
{
  return self->_suppressAlert;
}

- (void)setSuppressAlert:(BOOL)a3
{
  self->_suppressAlert = a3;
}

- (int64_t)periocularStatus
{
  return self->_periocularStatus;
}

- (void)setPeriocularStatus:(int64_t)a3
{
  self->_periocularStatus = a3;
}

- (int)screenDisplayChangedToken
{
  return self->_screenDisplayChangedToken;
}

- (void)setScreenDisplayChangedToken:(int)a3
{
  self->_screenDisplayChangedToken = a3;
}

- (BOOL)needsArming
{
  return self->_needsArming;
}

- (void)setNeedsArming:(BOOL)a3
{
  self->_needsArming = a3;
}

- (BOOL)isBeingUsedForSiri
{
  return self->_isBeingUsedForSiri;
}

- (void)setIsBeingUsedForSiri:(BOOL)a3
{
  self->_isBeingUsedForSiri = a3;
}

- (BOOL)needsStrictMotionCheck
{
  return self->_needsStrictMotionCheck;
}

- (void)setNeedsStrictMotionCheck:(BOOL)a3
{
  self->_needsStrictMotionCheck = a3;
}

- (SDAutoUnlockTransportProtocol)autoUnlockTransport
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoUnlockTransport);

  return (SDAutoUnlockTransportProtocol *)WeakRetained;
}

- (SDUnlockMagnetTransport)magnetTransport
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_magnetTransport);

  return (SDUnlockMagnetTransport *)WeakRetained;
}

- (SDKeyManaging)keyManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyManager);

  return (SDKeyManaging *)WeakRetained;
}

- (id)isSignedIntoPrimaryiCloudAccount
{
  return self->_isSignedIntoPrimaryiCloudAccount;
}

- (void)setIsSignedIntoPrimaryiCloudAccount:(id)a3
{
}

- (id)isFaceIDEnabled
{
  return self->_isFaceIDEnabled;
}

- (void)setIsFaceIDEnabled:(id)a3
{
}

- (id)isWifiEnabled
{
  return self->_isWifiEnabled;
}

- (void)setIsWifiEnabled:(id)a3
{
}

- (id)isBluetoothEnabled
{
  return self->_isBluetoothEnabled;
}

- (void)setIsBluetoothEnabled:(id)a3
{
}

- (id)isActiveDeviceNearby
{
  return self->_isActiveDeviceNearby;
}

- (void)setIsActiveDeviceNearby:(id)a3
{
}

- (SDAutoUnlockPeer)remotePeer
{
  return self->_remotePeer;
}

- (void)setRemotePeer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePeer, 0);
  objc_storeStrong(&self->_isActiveDeviceNearby, 0);
  objc_storeStrong(&self->_isBluetoothEnabled, 0);
  objc_storeStrong(&self->_isWifiEnabled, 0);
  objc_storeStrong(&self->_isFaceIDEnabled, 0);
  objc_storeStrong(&self->_isSignedIntoPrimaryiCloudAccount, 0);
  objc_destroyWeak((id *)&self->_keyManager);
  objc_destroyWeak((id *)&self->_magnetTransport);
  objc_destroyWeak((id *)&self->_autoUnlockTransport);
  objc_storeStrong((id *)&self->_lastUnlockDate, 0);
  objc_storeStrong((id *)&self->_magnetLinkTimer, 0);
  objc_storeStrong((id *)&self->_localDeviceController, 0);
  objc_storeStrong((id *)&self->_iconTransferStore, 0);
  objc_storeStrong((id *)&self->_previousSessionIDs, 0);
  objc_storeStrong((id *)&self->_cachedMetrics, 0);
  objc_storeStrong((id *)&self->_pipeConnectionChangedDate, 0);
  objc_storeStrong((id *)&self->_nearbyDeviceChangedDate, 0);
  objc_storeStrong((id *)&self->_lockStateChangedDate, 0);
  objc_storeStrong((id *)&self->_wristStateChangedDate, 0);
  objc_storeStrong((id *)&self->_advertisingChangedDate, 0);
  objc_storeStrong((id *)&self->_eligibleDevices, 0);
  objc_storeStrong((id *)&self->_incrementedCountID, 0);
  objc_storeStrong((id *)&self->_attemptID, 0);
  objc_storeStrong((id *)&self->_scanPhoneIDs, 0);
  objc_storeStrong((id *)&self->_scanWatchIDs, 0);
  objc_storeStrong((id *)&self->_scanAutoUnlockDevices, 0);
  objc_storeStrong((id *)&self->_proxyDeviceModel, 0);
  objc_storeStrong((id *)&self->_authSessionError, 0);
  objc_storeStrong((id *)&self->_scanErrorString, 0);
  objc_storeStrong((id *)&self->_scanTimer, 0);
  objc_storeStrong(&self->_attemptActivatedHandler, 0);
  objc_storeStrong((id *)&self->_attemptNavBarTitle, 0);
  objc_storeStrong((id *)&self->_attemptAppName, 0);
  objc_storeStrong((id *)&self->_attemptBundlePath, 0);
  objc_storeStrong((id *)&self->_attemptDevice, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
  objc_storeStrong((id *)&self->_attemptStart, 0);
  objc_storeStrong((id *)&self->_prewarmStart, 0);
  objc_storeStrong((id *)&self->_nearbyPushTimer, 0);
  objc_storeStrong((id *)&self->_previousMacAddressData, 0);
  objc_storeStrong((id *)&self->_serviceClients, 0);
  objc_storeStrong((id *)&self->_lockRegistrationSessionsByDeviceID, 0);
  objc_storeStrong((id *)&self->_keyRegistrationSessionsByDeviceID, 0);
  objc_storeStrong((id *)&self->_keysWithAKSTokens, 0);
  objc_storeStrong((id *)&self->_locksWithAKSTokens, 0);
  objc_storeStrong((id *)&self->_proxySessions, 0);
  objc_storeStrong((id *)&self->_keyPairingSessions, 0);
  objc_storeStrong((id *)&self->_lockPairingSessions, 0);
  objc_storeStrong((id *)&self->_keyAuthSessions, 0);
  objc_storeStrong((id *)&self->_canceledAuthLockSessions, 0);
  objc_storeStrong((id *)&self->_canceledPairingKeySessions, 0);
  objc_storeStrong((id *)&self->_lockAuthSessions, 0);
  objc_storeStrong((id *)&self->_suggestionManager, 0);
  objc_storeStrong((id *)&self->_observerTable, 0);
  objc_storeStrong((id *)&self->_sessionManagerQueue, 0);
  objc_storeStrong((id *)&self->_awdlInfo, 0);
  objc_storeStrong((id *)&self->_attemptExternalACMContext, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end