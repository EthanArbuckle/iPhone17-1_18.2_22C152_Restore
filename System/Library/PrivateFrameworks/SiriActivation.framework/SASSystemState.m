@interface SASSystemState
+ (SASSystemState)new;
+ (id)sharedSystemState;
- (AEInvalidatable)restrictionEnforcer;
- (AFNotifyObserver)observerBluetoothGuestConnected;
- (AFNotifyObserver)observerWirelessSplitter;
- (AFNotifyObserver)remoteWebcamModeEnabled;
- (BOOL)_deviceIsUnlocked;
- (BOOL)_mapsAppIsVisibleOnLockscreen;
- (BOOL)accessibilityShortcutEnabled;
- (BOOL)callHangUpEnabled;
- (BOOL)carDNDActive;
- (BOOL)carDNDActiveOrEyesFreeAndShouldHaveFullScreenPresentation:(BOOL)a3;
- (BOOL)carPlaySupportsAnyEnhancedSiriCharacteristics;
- (BOOL)carPlaySupportsEnhancedSiriCharacteristic:(unint64_t)a3;
- (BOOL)deviceIsBlocked;
- (BOOL)deviceIsPasscodeLocked;
- (BOOL)deviceScreenIsOn;
- (BOOL)didAssessmentModeRecieveInitialStateUpdate;
- (BOOL)enabled;
- (BOOL)hasRingingCall;
- (BOOL)hasUnlockedSinceBoot;
- (BOOL)isATV;
- (BOOL)isAssessmentModeActive;
- (BOOL)isCallAudioRouteAllowed;
- (BOOL)isConnectedToBluetoothVehicle;
- (BOOL)isConnectedToCarPlay;
- (BOOL)isConnectedToEyesFreeDevice;
- (BOOL)isConnectedToTrustedCarPlay;
- (BOOL)isGuestConnected;
- (BOOL)isInAAAGame;
- (BOOL)isInActiveCall;
- (BOOL)isPad;
- (BOOL)isRemoteWebcamMode;
- (BOOL)isRightHandDrive;
- (BOOL)isWirelessSplitterOn;
- (BOOL)liftToWakeDetected;
- (BOOL)rightHandDrive;
- (BOOL)siriInCallEnabled;
- (BOOL)siriIsEnabled;
- (BOOL)siriIsRestricted;
- (BOOL)siriIsSupported;
- (BOOL)smartCoverClosed;
- (BOOL)supportsCarPlayVehicleData;
- (CARAutomaticDNDStatus)carAutomaticDNDStatus;
- (CARSessionStatus)carPlaySessionStatus;
- (CGSize)carPlayPrimaryScreenPhysicalSize;
- (CRFeatureAvailability)carFeatureAvailability;
- (CXCallObserver)callObserver;
- (FBSDisplayLayoutMonitor)displayLayoutMonitor;
- (NSArray)currentCarPlaySupportedOEMAppIdList;
- (NSHashTable)listeners;
- (NSMutableSet)activeCalls;
- (NSString)vehicleManufacturer;
- (NSString)vehicleModel;
- (NSString)vehicleName;
- (SASCallRouteObserver)callRouteObserver;
- (SASLockStateMonitor)lockStateMonitor;
- (SASSystemState)init;
- (id)_initForTesting;
- (id)currentSpokenLanguageCode;
- (int)carPlayConnectionState;
- (int)gameMonitorNotifyToken;
- (int)gameState;
- (int64_t)_carPlayTransportTypeFromConfiguration:(id)a3;
- (int64_t)carPlayEnhancedVoiceTriggerMode;
- (int64_t)carPlayTransportType;
- (unint64_t)carDNDStatus;
- (unint64_t)carPlayEnhancedSiriCharacteristics;
- (void)_fetchOEMAppContext;
- (void)_fetchVehicleInformation;
- (void)_setCarPlayConnectionState:(int)a3;
- (void)_updateAccessibilityState;
- (void)_updateCarPlayConnectionState;
- (void)_updateEnhancedVoiceTriggerMode;
- (void)_voiceTriggerModeChanged:(id)a3;
- (void)addStateChangeListener:(id)a3;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)monitorCarSessions;
- (void)monitorLockState;
- (void)registerForGameMonitoring;
- (void)removeStateChangeListener:(id)a3;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setAccessibilityShortcutEnabled:(BOOL)a3;
- (void)setActiveCalls:(id)a3;
- (void)setCallObserver:(id)a3;
- (void)setCallRouteObserver:(id)a3;
- (void)setCarAutomaticDNDStatus:(id)a3;
- (void)setCarFeatureAvailability:(id)a3;
- (void)setCarPlayConnectionState:(int)a3;
- (void)setCarPlayEnhancedSiriCharacteristics:(unint64_t)a3;
- (void)setCarPlayEnhancedVoiceTriggerMode:(int64_t)a3;
- (void)setCarPlayPrimaryScreenPhysicalSize:(CGSize)a3;
- (void)setCarPlaySessionStatus:(id)a3;
- (void)setCarPlayTransportType:(int64_t)a3;
- (void)setCurrentCarPlaySupportedOEMAppIdList:(id)a3;
- (void)setDidAssessmentModeRecieveInitialStateUpdate:(BOOL)a3;
- (void)setDisplayLayoutMonitor:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGameMonitorNotifyToken:(int)a3;
- (void)setGameState:(int)a3;
- (void)setIsAssessmentModeActive:(BOOL)a3;
- (void)setLiftToWakeDetected:(BOOL)a3;
- (void)setListeners:(id)a3;
- (void)setLockStateMonitor:(id)a3;
- (void)setObserverBluetoothGuestConnected:(id)a3;
- (void)setObserverWirelessSplitter:(id)a3;
- (void)setRemoteWebcamModeEnabled:(id)a3;
- (void)setRestrictionEnforcer:(id)a3;
- (void)setRightHandDrive:(BOOL)a3;
- (void)setSupportsCarPlayVehicleData:(BOOL)a3;
- (void)setVehicleManufacturer:(id)a3;
- (void)setVehicleModel:(id)a3;
- (void)setVehicleName:(id)a3;
- (void)shouldBeginRestrictingForAssessmentModeWithCompletion:(id)a3;
- (void)shouldEndRestrictingForAssessmentModeWithCompletion:(id)a3;
@end

@implementation SASSystemState

- (BOOL)siriIsEnabled
{
  v3 = [MEMORY[0x1E4F4E538] sharedPreferences];
  -[SASSystemState setEnabled:](self, "setEnabled:", [v3 assistantIsEnabled]);

  return [(SASSystemState *)self enabled];
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)siriIsRestricted
{
  return MEMORY[0x1F410AC10](self, a2);
}

- (BOOL)isInActiveCall
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(NSMutableSet *)self->_activeCalls count];
  v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[SASSystemState isInActiveCall]";
    __int16 v7 = 2048;
    uint64_t v8 = v2;
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s CXCallObserver activeCalls:%lu", (uint8_t *)&v5, 0x16u);
  }
  return v2 != 0;
}

- (BOOL)isAssessmentModeActive
{
  return self->_isAssessmentModeActive;
}

- (BOOL)deviceIsPasscodeLocked
{
  uint64_t v2 = [(SASSystemState *)self lockStateMonitor];
  unint64_t v3 = ((unint64_t)[v2 lockState] >> 1) & 1;

  return v3;
}

- (SASLockStateMonitor)lockStateMonitor
{
  lockStateMonitor = self->_lockStateMonitor;
  if (!lockStateMonitor)
  {
    v4 = objc_alloc_init(SASLockStateMonitor);
    int v5 = self->_lockStateMonitor;
    self->_lockStateMonitor = v4;

    lockStateMonitor = self->_lockStateMonitor;
  }
  return lockStateMonitor;
}

void __22__SASSystemState_init__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = (os_log_t *)MEMORY[0x1E4F4E360];
    v11 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      v16 = "-[SASSystemState init]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s #modes DisplayTransition called transition=%@", (uint8_t *)&v15, 0x16u);
    }
    v12 = [v9 transitionReasons];
    if ([v12 containsObject:*MEMORY[0x1E4FA6D58]])
    {
      [*(id *)(a1 + 32) setLiftToWakeDetected:1];
      v13 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315138;
        v16 = "-[SASSystemState init]_block_invoke";
        _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #modes Device went through liftToWake transition setLiftToWake:YES", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      v14 = *v10;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315138;
        v16 = "-[SASSystemState init]_block_invoke";
        _os_log_impl(&dword_1D9588000, v14, OS_LOG_TYPE_DEFAULT, "%s #modes Device went to sleep or went through another transition setLiftToWake:NO", (uint8_t *)&v15, 0xCu);
      }
      [*(id *)(a1 + 32) setLiftToWakeDetected:0];
    }
  }
}

- (void)setLiftToWakeDetected:(BOOL)a3
{
  self->_liftToWakeDetected = a3;
}

+ (id)sharedSystemState
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SASSystemState_sharedSystemState__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSystemState_onceToken != -1) {
    dispatch_once(&sharedSystemState_onceToken, block);
  }
  uint64_t v2 = (void *)sharedSystemState_sharedSystemState;
  return v2;
}

uint64_t __35__SASSystemState_sharedSystemState__block_invoke(uint64_t a1)
{
  sharedSystemState_sharedSystemState = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (id)_initForTesting
{
  v3.receiver = self;
  v3.super_class = (Class)SASSystemState;
  return [(SASSystemState *)&v3 init];
}

- (SASSystemState)init
{
  v34.receiver = self;
  v34.super_class = (Class)SASSystemState;
  uint64_t v2 = [(SASSystemState *)&v34 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_carPlayConnectionState = 0;
    v2->_supportsCarPlayVehicleData = 0;
    [(SASSystemState *)v2 _updateAccessibilityState];
    [(SASSystemState *)v3 monitorCarSessions];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_HomeButtonTripleClickEnabled, (CFStringRef)*MEMORY[0x1E4FB9348], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    int v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(SASSystemState *)v3 setListeners:v5];

    v6 = objc_alloc_init(SASCallRouteObserver);
    callRouteObserver = v3->_callRouteObserver;
    v3->_callRouteObserver = v6;

    id v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeCalls = v3->_activeCalls;
    v3->_activeCalls = v8;

    v10 = (CXCallObserver *)objc_alloc_init(MEMORY[0x1E4F191A0]);
    callObserver = v3->_callObserver;
    v3->_callObserver = v10;

    [(CXCallObserver *)v3->_callObserver setDelegate:v3 queue:0];
    if ([MEMORY[0x1E4F4E638] isSAEEnabled])
    {
      [(SASSystemState *)v3 setGameState:0];
      [(SASSystemState *)v3 registerForGameMonitoring];
    }
    [(SASSystemState *)v3 setLiftToWakeDetected:0];
    v12 = [MEMORY[0x1E4F62950] configurationForDefaultMainDisplayMonitor];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __22__SASSystemState_init__block_invoke;
    aBlock[3] = &unk_1E6B68410;
    v13 = v3;
    v33 = v13;
    v14 = _Block_copy(aBlock);
    [v12 setTransitionHandler:v14];
    uint64_t v15 = [MEMORY[0x1E4F62948] monitorWithConfiguration:v12];
    displayLayoutMonitor = v13->_displayLayoutMonitor;
    v13->_displayLayoutMonitor = (FBSDisplayLayoutMonitor *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.siri.ActivationService.SystemState", 0);
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F4E518]) initWithName:@"com.apple.bluetooth.WirelessSplitterOn" options:1 queue:v17 delegate:0];
    observerWirelessSplitter = v13->_observerWirelessSplitter;
    v13->_observerWirelessSplitter = (AFNotifyObserver *)v18;

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F4E518]) initWithName:@"com.apple.bluetooth.GuestConnected" options:1 queue:v17 delegate:0];
    observerBluetoothGuestConnected = v13->_observerBluetoothGuestConnected;
    v13->_observerBluetoothGuestConnected = (AFNotifyObserver *)v20;

    id v22 = objc_alloc(MEMORY[0x1E4F4E518]);
    uint64_t v23 = [v22 initWithName:*MEMORY[0x1E4F74F20] options:1 queue:v17 delegate:0];
    remoteWebcamModeEnabled = v13->_remoteWebcamModeEnabled;
    v13->_remoteWebcamModeEnabled = (AFNotifyObserver *)v23;

    objc_initWeak(&location, v13);
    v25 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __22__SASSystemState_init__block_invoke_122;
    block[3] = &unk_1E6B675D8;
    objc_copyWeak(&v30, &location);
    dispatch_async(v25, block);

    uint64_t v26 = [MEMORY[0x1E4F47078] registerRestrictionEnforcer:v13 machServiceName:@"com.apple.siri.assessment-mode-restriction"];
    restrictionEnforcer = v13->_restrictionEnforcer;
    v13->_restrictionEnforcer = (AEInvalidatable *)v26;

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __22__SASSystemState_init__block_invoke_122(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  char v3 = [v2 isActive];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __22__SASSystemState_init__block_invoke_2;
  v4[3] = &unk_1E6B67938;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  char v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v5);
}

uint64_t __22__SASSystemState_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (([WeakRetained didAssessmentModeRecieveInitialStateUpdate] & 1) == 0) {
      [v4 setIsAssessmentModeActive:*(unsigned __int8 *)(a1 + 40)];
    }
  }
  return MEMORY[0x1F41817F8]();
}

+ (SASSystemState)new
{
  return 0;
}

- (void)addStateChangeListener:(id)a3
{
  id v4 = a3;
  id v5 = [(SASSystemState *)self listeners];
  [v5 addObject:v4];
}

- (void)removeStateChangeListener:(id)a3
{
  id v4 = a3;
  id v5 = [(SASSystemState *)self listeners];
  [v5 removeObject:v4];
}

- (id)currentSpokenLanguageCode
{
  uint64_t v2 = [MEMORY[0x1E4F4E538] sharedPreferences];
  char v3 = [v2 languageCode];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F4E538] sharedPreferences];
    char v3 = [v4 bestSupportedLanguageCodeForLanguageCode:0];
  }
  return v3;
}

- (void)monitorLockState
{
  id v2 = [(SASSystemState *)self lockStateMonitor];
}

- (BOOL)hasUnlockedSinceBoot
{
  id v2 = [(SASSystemState *)self lockStateMonitor];
  char v3 = [v2 hasUnlockedSinceBoot];

  return v3;
}

- (BOOL)deviceIsBlocked
{
  id v2 = [(SASSystemState *)self lockStateMonitor];
  char v3 = [v2 isBlocked];

  return v3;
}

- (BOOL)deviceScreenIsOn
{
  id v2 = [(SASSystemState *)self lockStateMonitor];
  char v3 = [v2 isScreenOn];

  return v3;
}

- (BOOL)_deviceIsUnlocked
{
  id v2 = [(SASSystemState *)self lockStateMonitor];
  BOOL v3 = [v2 lockState] == 0;

  return v3;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [v5 hasEnded];
  id v7 = (void *)*MEMORY[0x1E4F4E360];
  BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      id v9 = v7;
      v10 = [v5 UUID];
      *(_DWORD *)buf = 136315394;
      v27 = "-[SASSystemState callObserver:callChanged:]";
      __int16 v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s CXCallObserver Ended:%@", buf, 0x16u);
    }
    activeCalls = self->_activeCalls;
    v12 = [v5 UUID];
    [(NSMutableSet *)activeCalls removeObject:v12];
  }
  else
  {
    if (v8)
    {
      v13 = v7;
      v14 = [v5 UUID];
      *(_DWORD *)buf = 136315394;
      v27 = "-[SASSystemState callObserver:callChanged:]";
      __int16 v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s CXCallObserver Changed:%@", buf, 0x16u);
    }
    uint64_t v15 = self->_activeCalls;
    v12 = [v5 UUID];
    [(NSMutableSet *)v15 addObject:v12];
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v16 = [(SASSystemState *)self listeners];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v20++), "callStateChangedToIsActive:isOutgoing:", -[SASSystemState isInActiveCall](self, "isInActiveCall"), objc_msgSend(v5, "isOutgoing"));
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v18);
  }

  if ([(NSMutableSet *)self->_activeCalls count] == 1)
  {
    [(SASCallRouteObserver *)self->_callRouteObserver startObserving];
  }
  else if (![(NSMutableSet *)self->_activeCalls count])
  {
    [(SASCallRouteObserver *)self->_callRouteObserver stopObserving];
  }
}

- (BOOL)hasRingingCall
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(CXCallObserver *)self->_callObserver calls];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        int v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v6 hasConnected] & 1) == 0 && !objc_msgSend(v6, "hasEnded"))
        {
          LODWORD(v3) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v18 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  id v7 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = @"NO";
    if (v3) {
      BOOL v8 = @"YES";
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[SASSystemState hasRingingCall]";
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s CXCallObserver hasRingingCall:%@", buf, 0x16u);
  }
  return v3;
}

- (BOOL)isCallAudioRouteAllowed
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [(SASCallRouteObserver *)self->_callRouteObserver isCallAudioRouteAllowed];
  uint64_t v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = @"NO";
    if (v2) {
      uint64_t v4 = @"YES";
    }
    int v6 = 136315394;
    id v7 = "-[SASSystemState isCallAudioRouteAllowed]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  return v2;
}

- (BOOL)isWirelessSplitterOn
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(AFNotifyObserver *)self->_observerWirelessSplitter state];
  uint64_t v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    int v6 = "-[SASSystemState isWirelessSplitterOn]";
    __int16 v7 = 1024;
    BOOL v8 = v2 != 0;
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s %i", (uint8_t *)&v5, 0x12u);
  }
  return v2 != 0;
}

- (BOOL)isGuestConnected
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(AFNotifyObserver *)self->_observerBluetoothGuestConnected state];
  uint64_t v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    int v6 = "-[SASSystemState isGuestConnected]";
    __int16 v7 = 1024;
    BOOL v8 = v2 != 0;
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s %i", (uint8_t *)&v5, 0x12u);
  }
  return v2 != 0;
}

- (BOOL)isInAAAGame
{
  return [(SASSystemState *)self gameState] == 2;
}

- (void)registerForGameMonitoring
{
  objc_initWeak(&location, self);
  uint64_t v3 = MEMORY[0x1E4F14428];
  id v4 = MEMORY[0x1E4F14428];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SASSystemState_registerForGameMonitoring__block_invoke;
  v5[3] = &unk_1E6B68438;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch("com.apple.system.console_mode_model_manager_assertion_changed", &self->_gameMonitorNotifyToken, v3, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __43__SASSystemState_registerForGameMonitoring__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t state64 = 0;
    if (!notify_get_state(a2, &state64) && state64 <= 2) {
      objc_msgSend(WeakRetained, "setGameState:");
    }
  }
}

- (BOOL)carDNDActiveOrEyesFreeAndShouldHaveFullScreenPresentation:(BOOL)a3
{
  if ([(SASSystemState *)self isConnectedToEyesFreeDevice]
    || a3
    || [(SASSystemState *)self carDNDActive]
    || (BOOL v5 = [(SASSystemState *)self _internalAlwaysEyesFreeEnabled]))
  {
    if ([(SASSystemState *)self _deviceIsUnlocked]) {
      LOBYTE(v5) = 0;
    }
    else {
      LOBYTE(v5) = ![(SASSystemState *)self _mapsAppIsVisibleOnLockscreen];
    }
  }
  return v5;
}

- (BOOL)_mapsAppIsVisibleOnLockscreen
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = [(SASSystemState *)self displayLayoutMonitor];
  uint64_t v3 = [v2 currentLayout];
  id v4 = [v3 elements];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v10 = [v9 identifier];
          int v11 = [v10 isEqualToString:@"com.apple.Maps"];

          if (v11)
          {
            if ([v9 layoutRole] == 6)
            {
              BOOL v12 = 1;
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (BOOL)carDNDActive
{
  return [(SASSystemState *)self carDNDStatus] == 2;
}

- (unint64_t)carDNDStatus
{
  if (![MEMORY[0x1E4F57EC0] isAutomaticDNDAvailable]) {
    return 1;
  }
  uint64_t v3 = [(SASSystemState *)self carAutomaticDNDStatus];
  unint64_t v4 = [v3 cachedAutomaticDNDActiveState];

  return v4;
}

- (void)monitorCarSessions
{
  if ([MEMORY[0x1E4F57EC0] isAutomaticDNDAvailable])
  {
    uint64_t v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v3 addObserver:self selector:sel__pairedVehiclesDidChange_ name:*MEMORY[0x1E4F57EB0] object:0];

    [(SASSystemState *)self setCurrentCarPlaySupportedOEMAppIdList:0];
    id v4 = objc_alloc_init(MEMORY[0x1E4F57ED8]);
    [(SASSystemState *)self setCarPlaySessionStatus:v4];

    uint64_t v5 = [(SASSystemState *)self carPlaySessionStatus];
    [v5 addSessionObserver:self];

    id v6 = objc_alloc_init(MEMORY[0x1E4F57EC0]);
    [(SASSystemState *)self setCarAutomaticDNDStatus:v6];

    uint64_t v7 = [(SASSystemState *)self carAutomaticDNDStatus];
    [v7 fetchAutomaticDNDAssertionWithReply:0];

    id v8 = objc_alloc_init(MEMORY[0x1E4F57F08]);
    [(SASSystemState *)self setCarFeatureAvailability:v8];

    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:self selector:sel__voiceTriggerModeChanged_ name:*MEMORY[0x1E4F57EA8] object:0];
  }
}

- (void)_setCarPlayConnectionState:(int)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_carPlayConnectionState != a3)
  {
    self->_carPlayConnectionState = a3;
    switch(a3)
    {
      case 2:
        uint64_t v3 = *MEMORY[0x1E4F4E360];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        int v5 = 136315138;
        id v6 = "-[SASSystemState _setCarPlayConnectionState:]";
        id v4 = "%s Paired to a trusted CarPlay device.";
        goto LABEL_11;
      case 1:
        uint64_t v3 = *MEMORY[0x1E4F4E360];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        int v5 = 136315138;
        id v6 = "-[SASSystemState _setCarPlayConnectionState:]";
        id v4 = "%s Paired to an untrusted CarPlay device.";
        goto LABEL_11;
      case 0:
        uint64_t v3 = *MEMORY[0x1E4F4E360];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
        {
          int v5 = 136315138;
          id v6 = "-[SASSystemState _setCarPlayConnectionState:]";
          id v4 = "%s Disconnected from CarPlay display.";
LABEL_11:
          _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
        }
        break;
    }
  }
}

- (void)_updateCarPlayConnectionState
{
  uint64_t v3 = [(SASSystemState *)self carPlaySessionStatus];
  id v4 = [v3 currentSession];
  int v5 = [v4 MFiCertificateSerialNumber];

  if (v5)
  {
    v6[5] = MEMORY[0x1E4F143A8];
    v6[6] = 3221225472;
    v6[7] = __47__SASSystemState__updateCarPlayConnectionState__block_invoke;
    v6[8] = &unk_1E6B68488;
    v6[9] = self;
    CRIsPairedWithCertificateSerialNumber();
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__SASSystemState__updateCarPlayConnectionState__block_invoke_3;
    v6[3] = &unk_1E6B678E8;
    v6[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __47__SASSystemState__updateCarPlayConnectionState__block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__SASSystemState__updateCarPlayConnectionState__block_invoke_2;
  v2[3] = &unk_1E6B68460;
  char v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __47__SASSystemState__updateCarPlayConnectionState__block_invoke_2(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void **)(a1 + 32);
  if (v1) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  return [v2 _setCarPlayConnectionState:v3];
}

uint64_t __47__SASSystemState__updateCarPlayConnectionState__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCarPlayConnectionState:0];
}

- (void)_fetchVehicleInformation
{
  uint64_t v3 = [(CARSessionStatus *)self->_carPlaySessionStatus currentSession];
  id v4 = [v3 configuration];

  int v5 = [v4 vehicleName];
  vehicleName = self->_vehicleName;
  self->_vehicleName = v5;

  uint64_t v7 = [v4 vehicleModelName];
  vehicleModel = self->_vehicleModel;
  self->_vehicleModel = v7;

  id v9 = [v4 vehicleManufacturer];
  vehicleManufacturer = self->_vehicleManufacturer;
  self->_vehicleManufacturer = v9;

  self->_rightHandDrive = [v4 rightHandDrive];
  unint64_t v11 = [v4 supportsSiriZLL];
  if ([v4 supportsSiriZLLButton]) {
    v11 |= 2uLL;
  }
  if ([v4 supportsSiriMixable]) {
    v11 |= 4uLL;
  }
  if ([v4 supportsVehicleData]) {
    self->_supportsCarPlayVehicleData = 1;
  }
  self->_carPlayEnhancedSiriCharacteristics = v11;
  self->_carPlayTransportType = [(SASSystemState *)self _carPlayTransportTypeFromConfiguration:v4];
  [(SASSystemState *)self _updateEnhancedVoiceTriggerMode];
  uint64_t v14 = 0;
  long long v15 = (CGSize *)&v14;
  uint64_t v16 = 0x3010000000;
  long long v17 = &unk_1D95EAB2F;
  long long v18 = *MEMORY[0x1E4F1DB30];
  BOOL v12 = [v4 screens];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__SASSystemState__fetchVehicleInformation__block_invoke;
  v13[3] = &unk_1E6B684B0;
  v13[4] = &v14;
  [v12 enumerateObjectsUsingBlock:v13];

  self->_carPlayPrimaryScreenPhysicalSize = v15[2];
  _Block_object_dispose(&v14, 8);
}

void __42__SASSystemState__fetchVehicleInformation__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if (![v9 screenType])
  {
    [v9 physicalSize];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    *(void *)(v6 + 32) = v7;
    *(void *)(v6 + 40) = v8;
    *a4 = 1;
  }
}

- (void)_updateEnhancedVoiceTriggerMode
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CARSessionStatus *)self->_carPlaySessionStatus currentSession];
  char v4 = [(CRFeatureAvailability *)self->_carFeatureAvailability deviceSupportedCarPlayFeatures];
  if (!v3)
  {
    int v5 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      long long v13 = "-[SASSystemState _updateEnhancedVoiceTriggerMode]";
      uint64_t v6 = "%s #CarPlay CARSession is currently nil, setting mode to be not applicable.";
      goto LABEL_7;
    }
LABEL_8:
    int64_t v7 = 0;
    goto LABEL_9;
  }
  if ((v4 & 2) == 0)
  {
    int v5 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      long long v13 = "-[SASSystemState _updateEnhancedVoiceTriggerMode]";
      uint64_t v6 = "%s #CarPlay Enhanced Siri is not supported, setting mode to be not applicable.";
LABEL_7:
      _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v12, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v8 = [v3 voiceTriggerMode];
  switch(v8)
  {
    case 2:
      uint64_t v10 = *MEMORY[0x1E4F4E360];
      int64_t v7 = 1;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_INFO))
      {
        int v12 = 136315138;
        long long v13 = "-[SASSystemState _updateEnhancedVoiceTriggerMode]";
        int64_t v7 = 1;
        _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_INFO, "%s #CarPlay Enhanced Siri voice trigger mode is activity detection", (uint8_t *)&v12, 0xCu);
      }
      break;
    case 1:
      unint64_t v11 = *MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_INFO))
      {
        int v12 = 136315138;
        long long v13 = "-[SASSystemState _updateEnhancedVoiceTriggerMode]";
        _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_INFO, "%s #CarPlay Enhanced Siri voice trigger mode is trigger detection", (uint8_t *)&v12, 0xCu);
      }
      int64_t v7 = 2;
      break;
    case -1:
      id v9 = *MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_INFO))
      {
        int v12 = 136315138;
        long long v13 = "-[SASSystemState _updateEnhancedVoiceTriggerMode]";
        _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_INFO, "%s #CarPlay Enhanced Siri voice trigger mode is disabled", (uint8_t *)&v12, 0xCu);
      }
      int64_t v7 = 3;
      break;
    default:
      goto LABEL_10;
  }
LABEL_9:
  self->_carPlayEnhancedVoiceTriggerMode = v7;
LABEL_10:
}

- (int64_t)_carPlayTransportTypeFromConfiguration:(id)a3
{
  id v3 = a3;
  if ([v3 supportsVehicleData])
  {
    int64_t v4 = 3;
  }
  else
  {
    unint64_t v5 = [v3 transportType];
    if (v5 > 3) {
      int64_t v4 = 2;
    }
    else {
      int64_t v4 = qword_1D95D8598[v5];
    }
  }

  return v4;
}

- (void)_fetchOEMAppContext
{
  id v3 = [(CARSessionStatus *)self->_carPlaySessionStatus currentSession];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F57EF0]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__SASSystemState__fetchOEMAppContext__block_invoke;
    v6[3] = &unk_1E6B684D8;
    v6[4] = self;
    [v4 fetchApplicationBundleIdentifiersForCarIntents:v6];
  }
  else
  {
    currentCarPlaySupportedOEMAppIdList = self->_currentCarPlaySupportedOEMAppIdList;
    self->_currentCarPlaySupportedOEMAppIdList = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

void __37__SASSystemState__fetchOEMAppContext__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int64_t v7 = (os_log_t *)MEMORY[0x1E4F4E360];
  if (v5)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = [v5 allObjects];
    [v8 setCurrentCarPlaySupportedOEMAppIdList:v9];
  }
  else
  {
    uint64_t v10 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
      __37__SASSystemState__fetchOEMAppContext__block_invoke_cold_1((uint64_t)v6, v10);
    }
  }
  os_log_t v11 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
  {
    int v12 = *(void **)(a1 + 32);
    long long v13 = v11;
    uint64_t v14 = [v12 currentCarPlaySupportedOEMAppIdList];
    int v15 = 136315394;
    uint64_t v16 = "-[SASSystemState _fetchOEMAppContext]_block_invoke";
    __int16 v17 = 2112;
    long long v18 = v14;
    _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_INFO, "%s #CarPlay supported OEM apps: %@", (uint8_t *)&v15, 0x16u);
  }
}

- (BOOL)isConnectedToCarPlay
{
  return [(SASSystemState *)self carPlayConnectionState] != 0;
}

- (BOOL)supportsCarPlayVehicleData
{
  return self->_supportsCarPlayVehicleData;
}

- (BOOL)isConnectedToTrustedCarPlay
{
  return [(SASSystemState *)self carPlayConnectionState] == 2;
}

- (BOOL)isRightHandDrive
{
  return self->_rightHandDrive;
}

- (BOOL)carPlaySupportsAnyEnhancedSiriCharacteristics
{
  return [(SASSystemState *)self carPlayEnhancedSiriCharacteristics] != 0;
}

- (BOOL)carPlaySupportsEnhancedSiriCharacteristic:(unint64_t)a3
{
  uint64_t v4 = [(SASSystemState *)self carPlayEnhancedSiriCharacteristics];
  return SASCarPlayEnhancedSiriCharacteristicsContainsCharacteristic(v4, a3);
}

- (unint64_t)carPlayEnhancedSiriCharacteristics
{
  return self->_carPlayEnhancedSiriCharacteristics;
}

- (int64_t)carPlayEnhancedVoiceTriggerMode
{
  return self->_carPlayEnhancedVoiceTriggerMode;
}

- (int64_t)carPlayTransportType
{
  return self->_carPlayTransportType;
}

- (BOOL)isPad
{
  return MEMORY[0x1F410AD70](self, a2);
}

- (BOOL)smartCoverClosed
{
  return BKSHIDServicesIsSmartCoverClosed() != 0;
}

- (BOOL)isATV
{
  return MEMORY[0x1F410AD30](self, a2);
}

- (void)sessionDidConnect:(id)a3
{
  [(SASSystemState *)self _updateCarPlayConnectionState];
  [(SASSystemState *)self _fetchVehicleInformation];
  [(SASSystemState *)self _fetchOEMAppContext];
}

- (void)_voiceTriggerModeChanged:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[SASSystemState _voiceTriggerModeChanged:]";
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_INFO, "%s #CarPlay Enhanced Siri voice trigger mode changed", (uint8_t *)&v5, 0xCu);
  }
  [(SASSystemState *)self _updateEnhancedVoiceTriggerMode];
}

- (void)sessionDidDisconnect:(id)a3
{
  [(SASSystemState *)self _updateCarPlayConnectionState];
  [(SASSystemState *)self _fetchVehicleInformation];
  [(SASSystemState *)self _fetchOEMAppContext];
}

- (void)_updateAccessibilityState
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)_AXSTripleClickCopyOptions();
  -[SASSystemState setAccessibilityShortcutEnabled:](self, "setAccessibilityShortcutEnabled:", [v3 count] != 0);

  uint64_t v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = @"YES";
    if (!self->_accessibilityShortcutEnabled) {
      int v5 = @"NO";
    }
    int v6 = 136315394;
    uint64_t v7 = "-[SASSystemState _updateAccessibilityState]";
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s Enabled:%@", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)siriIsSupported
{
  uint64_t v2 = [(SASSystemState *)self currentSpokenLanguageCode];
  if (v2 && (AFPreferencesLanguageIsSupported() & 1) != 0
    || ([MEMORY[0x1E4F4E538] sharedPreferences],
        id v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isCurrentLocaleNativelySupported],
        v3,
        v4))
  {
    char v5 = AFAssistantCapable();
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isConnectedToEyesFreeDevice
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F50B70], "sharedInstance", 0);
  id v3 = [v2 connectedDevices];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "ac_isEyesFree"))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)isConnectedToBluetoothVehicle
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F50B70], "sharedInstance", 0);
  id v3 = [v2 connectedDevices];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "ac_isBluetoothVehicle"))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)isRemoteWebcamMode
{
  return [(AFNotifyObserver *)self->_remoteWebcamModeEnabled state] != 0;
}

- (BOOL)siriInCallEnabled
{
  int v2 = AFSupportsSiriInCall();
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F4E538] sharedPreferences];
    char v4 = [v3 siriInCallEnabled];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)callHangUpEnabled
{
  if ((AFSupportsSiriInCall() & 1) != 0 || !AFSupportsCallHangUp()) {
    return 0;
  }
  int v2 = [MEMORY[0x1E4FB4FE8] sharedPreferences];
  char v3 = [v2 canUseVoiceTriggerDuringPhoneCall];

  return v3;
}

- (void)shouldBeginRestrictingForAssessmentModeWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SASSystemState_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke;
  block[3] = &unk_1E6B67BA0;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __72__SASSystemState_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setDidAssessmentModeRecieveInitialStateUpdate:1];
    [v3 setIsAssessmentModeActive:1];
    id v4 = dispatch_group_create();
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    char v22 = 1;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = [v3 listeners];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            dispatch_group_enter(v4);
            v14[0] = MEMORY[0x1E4F143A8];
            v14[1] = 3221225472;
            v14[2] = __72__SASSystemState_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke_2;
            v14[3] = &unk_1E6B68500;
            uint64_t v16 = v21;
            int v15 = v4;
            [v9 assessmentModeChangedToIsActive:1 completion:v14];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v6);
    }

    long long v10 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__SASSystemState_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke_3;
    block[3] = &unk_1E6B68528;
    uint64_t v13 = v21;
    id v12 = *(id *)(a1 + 32);
    dispatch_group_notify(v4, v10, block);

    _Block_object_dispose(v21, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __72__SASSystemState_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    *(unsigned char *)(v2 + 24) = a2;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __72__SASSystemState_shouldBeginRestrictingForAssessmentModeWithCompletion___block_invoke_3(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v2 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 32);
    v2(v3, 0);
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = *MEMORY[0x1E4F4E698];
    uint64_t v9 = *MEMORY[0x1E4F28228];
    uint64_t v6 = [NSString stringWithFormat:@"Failed to deactivate assistant"];
    v10[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v8 = [v4 errorWithDomain:v5 code:0 userInfo:v7];
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v8);
  }
}

- (void)shouldEndRestrictingForAssessmentModeWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SASSystemState_shouldEndRestrictingForAssessmentModeWithCompletion___block_invoke;
  block[3] = &unk_1E6B67BA0;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __70__SASSystemState_shouldEndRestrictingForAssessmentModeWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setDidAssessmentModeRecieveInitialStateUpdate:1];
    [v3 setIsAssessmentModeActive:0];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = objc_msgSend(v3, "listeners", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 assessmentModeChangedToIsActive:0 completion:0];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setLockStateMonitor:(id)a3
{
}

- (int)carPlayConnectionState
{
  return self->_carPlayConnectionState;
}

- (void)setCarPlayConnectionState:(int)a3
{
  self->_carPlayConnectionState = a3;
}

- (void)setSupportsCarPlayVehicleData:(BOOL)a3
{
  self->_supportsCarPlayVehicleData = a3;
}

- (BOOL)accessibilityShortcutEnabled
{
  return self->_accessibilityShortcutEnabled;
}

- (void)setAccessibilityShortcutEnabled:(BOOL)a3
{
  self->_accessibilityShortcutEnabled = a3;
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
}

- (NSMutableSet)activeCalls
{
  return self->_activeCalls;
}

- (void)setActiveCalls:(id)a3
{
}

- (SASCallRouteObserver)callRouteObserver
{
  return self->_callRouteObserver;
}

- (void)setCallRouteObserver:(id)a3
{
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
}

- (BOOL)liftToWakeDetected
{
  return self->_liftToWakeDetected;
}

- (int)gameMonitorNotifyToken
{
  return self->_gameMonitorNotifyToken;
}

- (void)setGameMonitorNotifyToken:(int)a3
{
  self->_gameMonitorNotifyToken = a3;
}

- (int)gameState
{
  return self->_gameState;
}

- (void)setGameState:(int)a3
{
  self->_gameState = a3;
}

- (NSArray)currentCarPlaySupportedOEMAppIdList
{
  return self->_currentCarPlaySupportedOEMAppIdList;
}

- (void)setCurrentCarPlaySupportedOEMAppIdList:(id)a3
{
}

- (CARSessionStatus)carPlaySessionStatus
{
  return self->_carPlaySessionStatus;
}

- (void)setCarPlaySessionStatus:(id)a3
{
}

- (CARAutomaticDNDStatus)carAutomaticDNDStatus
{
  return self->_carAutomaticDNDStatus;
}

- (void)setCarAutomaticDNDStatus:(id)a3
{
}

- (CRFeatureAvailability)carFeatureAvailability
{
  return self->_carFeatureAvailability;
}

- (void)setCarFeatureAvailability:(id)a3
{
}

- (NSString)vehicleName
{
  return self->_vehicleName;
}

- (void)setVehicleName:(id)a3
{
}

- (NSString)vehicleModel
{
  return self->_vehicleModel;
}

- (void)setVehicleModel:(id)a3
{
}

- (NSString)vehicleManufacturer
{
  return self->_vehicleManufacturer;
}

- (void)setVehicleManufacturer:(id)a3
{
}

- (BOOL)rightHandDrive
{
  return self->_rightHandDrive;
}

- (void)setRightHandDrive:(BOOL)a3
{
  self->_rightHandDrive = a3;
}

- (NSHashTable)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (AFNotifyObserver)observerWirelessSplitter
{
  return self->_observerWirelessSplitter;
}

- (void)setObserverWirelessSplitter:(id)a3
{
}

- (AFNotifyObserver)observerBluetoothGuestConnected
{
  return self->_observerBluetoothGuestConnected;
}

- (void)setObserverBluetoothGuestConnected:(id)a3
{
}

- (AFNotifyObserver)remoteWebcamModeEnabled
{
  return self->_remoteWebcamModeEnabled;
}

- (void)setRemoteWebcamModeEnabled:(id)a3
{
}

- (void)setCarPlayEnhancedSiriCharacteristics:(unint64_t)a3
{
  self->_carPlayEnhancedSiriCharacteristics = a3;
}

- (void)setCarPlayEnhancedVoiceTriggerMode:(int64_t)a3
{
  self->_carPlayEnhancedVoiceTriggerMode = a3;
}

- (void)setCarPlayTransportType:(int64_t)a3
{
  self->_carPlayTransportType = a3;
}

- (CGSize)carPlayPrimaryScreenPhysicalSize
{
  double width = self->_carPlayPrimaryScreenPhysicalSize.width;
  double height = self->_carPlayPrimaryScreenPhysicalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCarPlayPrimaryScreenPhysicalSize:(CGSize)a3
{
  self->_carPlayPrimaryScreenPhysicalSize = a3;
}

- (void)setIsAssessmentModeActive:(BOOL)a3
{
  self->_isAssessmentModeActive = a3;
}

- (BOOL)didAssessmentModeRecieveInitialStateUpdate
{
  return self->_didAssessmentModeRecieveInitialStateUpdate;
}

- (void)setDidAssessmentModeRecieveInitialStateUpdate:(BOOL)a3
{
  self->_didAssessmentModeRecieveInitialStateUpdate = a3;
}

- (AEInvalidatable)restrictionEnforcer
{
  return self->_restrictionEnforcer;
}

- (void)setRestrictionEnforcer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictionEnforcer, 0);
  objc_storeStrong((id *)&self->_remoteWebcamModeEnabled, 0);
  objc_storeStrong((id *)&self->_observerBluetoothGuestConnected, 0);
  objc_storeStrong((id *)&self->_observerWirelessSplitter, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_vehicleManufacturer, 0);
  objc_storeStrong((id *)&self->_vehicleModel, 0);
  objc_storeStrong((id *)&self->_vehicleName, 0);
  objc_storeStrong((id *)&self->_carFeatureAvailability, 0);
  objc_storeStrong((id *)&self->_carAutomaticDNDStatus, 0);
  objc_storeStrong((id *)&self->_carPlaySessionStatus, 0);
  objc_storeStrong((id *)&self->_currentCarPlaySupportedOEMAppIdList, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_callRouteObserver, 0);
  objc_storeStrong((id *)&self->_activeCalls, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_lockStateMonitor, 0);
}

void __37__SASSystemState__fetchOEMAppContext__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[SASSystemState _fetchOEMAppContext]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D9588000, a2, OS_LOG_TYPE_ERROR, "%s #CarPlay failed to lookup car intent extensions: %@", (uint8_t *)&v2, 0x16u);
}

@end