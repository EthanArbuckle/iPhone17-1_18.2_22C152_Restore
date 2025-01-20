@interface AXVisualAlertManager
+ (id)sharedVisualAlertManager;
+ (void)initialize;
- (AXCameraTorchManagerBackgroundAdapter)_asyncManagerAdapter;
- (AXVisualAlertManager)init;
- (BOOL)_hasVideoConferenceCameraTorchManager;
- (BOOL)_isCameraInUse;
- (BOOL)_isRingerSwitchException:(unint64_t)a3;
- (BOOL)_isTorchDeviceOn;
- (BOOL)_isTorchDeviceOpen;
- (BOOL)_isTorchEnabledInControlCenter;
- (BOOL)_shouldHandleVisualAlertsForVideoConferenceCallsInConferenceFramework;
- (BOOL)_supportsVisualAlertsForVideoConferenceCalls;
- (DNDStateService)disturbanceService;
- (NSDictionary)_activePattern;
- (NSDictionary)_patterns;
- (NSString)description;
- (id)_normalizedStrobePatternForOriginalPattern:(id)a3;
- (id)existingBulletinForBulletin:(id)a3;
- (int)ringerStateNotifyToken;
- (unint64_t)_typeToUseForVisualAlertAfterCaptureSessionStopsRunning;
- (void)_beginVisualAlertForType:(unint64_t)a3 repeat:(BOOL)a4;
- (void)_beginVisualAlertForType:(unint64_t)a3 repeat:(BOOL)a4 skipAutomaticStopOnUserInteraction:(BOOL)a5 bundleId:(id)a6;
- (void)_endVisualAlert;
- (void)_handleBeginVisualAlertForAlarmWithSound:(BOOL)a3;
- (void)_handleBeginVisualAlertForIncomingCall;
- (void)_handleBeginVisualAlertForIncomingVideoConferenceCall;
- (void)_handleCaptureSessionDidStartRunning;
- (void)_handleCaptureSessionDidStopRunning;
- (void)_handleDeviceWasLocked;
- (void)_handleDeviceWasUnlocked;
- (void)_handleEndVisualAlertForAlarm;
- (void)_handleEndVisualAlertForIncomingCall;
- (void)_handleEndVisualAlertForIncomingVideoConferenceCall;
- (void)_handleLockButtonPressed;
- (void)_handleQuietModeWasDisabled;
- (void)_handleQuietModeWasEnabled;
- (void)_handleRingerSwitchToggled;
- (void)_handleSecondaryVisualAlertManagerDidStart;
- (void)_handleTorchInControlCenterWasDisabled;
- (void)_handleTorchInControlCenterWasEnabled;
- (void)_handleVideoConferenceCallRinging;
- (void)_handleVisualAlertForExternalApplication;
- (void)_handleVisualAlertForIncomingMessage;
- (void)_handleVisualAlertForRegularNotification:(id)a3;
- (void)_handleVolumeChanged;
- (void)_insertCustomLogicForSystemWideServer;
- (void)_processNextVisualAlertComponent;
- (void)_setActivePattern:(id)a3;
- (void)_setTorchDeviceOn:(BOOL)a3 withCompletion:(id)a4;
- (void)_setTorchDeviceOpen:(BOOL)a3 withCompletion:(id)a4;
- (void)_setTypeToUseForVisualAlertAfterCaptureSessionStopsRunning:(unint64_t)a3;
- (void)_springBoardLockButtonPress:(id)a3;
- (void)_springBoardLockStateChange:(id)a3;
- (void)_springBoardVolumeChange:(id)a3;
- (void)_startForAlertTypes:(unint64_t)a3 cameraTorchManager:(id)a4;
- (void)_stop;
- (void)addBulletin:(id)a3;
- (void)dealloc;
- (void)removeBulletin:(id)a3;
- (void)setDisturbanceService:(id)a3;
- (void)setRingerStateNotifyToken:(int)a3;
- (void)startForAlertTypes:(unint64_t)a3 cameraTorchManager:(id)a4;
- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4;
- (void)stop;
@end

@implementation AXVisualAlertManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _VisualAlertManager = objc_opt_new();
    MEMORY[0x270F9A758]();
  }
}

- (AXVisualAlertManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)AXVisualAlertManager;
  v2 = [(AXVisualAlertManager *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F22868]);
    v4 = (void *)MEMORY[0x263EF83A0];
    uint64_t v5 = [v3 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    timer = v2->_timer;
    v2->_timer = (AXDispatchTimer *)v5;

    [(AXDispatchTimer *)v2->_timer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F22868]) initWithTargetSerialQueue:v4];
    torchForceShutdownTimer = v2->_torchForceShutdownTimer;
    v2->_torchForceShutdownTimer = (AXDispatchTimer *)v7;

    uint64_t IsSpringBoard = AXProcessIsSpringBoard();
    AXPrintLine();
    if (AXProcessIsSpringBoard()) {
      [(AXVisualAlertManager *)v2 _insertCustomLogicForSystemWideServer];
    }
  }
  return v2;
}

- (void)dealloc
{
  [(AXVisualAlertManager *)self _stop];
  v3.receiver = self;
  v3.super_class = (Class)AXVisualAlertManager;
  [(AXVisualAlertManager *)&v3 dealloc];
}

- (void)addBulletin:(id)a3
{
  id v4 = a3;
  bulletins = self->_bulletins;
  id v8 = v4;
  if (!bulletins)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_bulletins;
    self->_bulletins = v6;

    id v4 = v8;
    bulletins = self->_bulletins;
  }
  [(NSMutableArray *)bulletins axSafelyAddObject:v4];
}

- (id)existingBulletinForBulletin:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = self->_bulletins;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "sectionIdentifier", (void)v14);
        objc_super v11 = [v4 sectionIdentifier];
        char v12 = [v10 isEqualToString:v11];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)removeBulletin:(id)a3
{
}

- (void)_setTorchDeviceOpen:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = v6;
  if (self->_torchDeviceOpen == v4)
  {
    if (v6)
    {
      id v8 = dispatch_get_global_queue(0, 0);
      dispatch_async(v8, v7);
    }
  }
  else
  {
    self->_torchDeviceOpen = v4;
    if (v4)
    {
      v9 = [MEMORY[0x263F22988] sharedInstance];
      char v10 = [v9 ignoreLogging];

      if ((v10 & 1) == 0)
      {
        objc_super v11 = [MEMORY[0x263F22988] identifier];
        char v12 = AXLoggerForFacility();

        os_log_type_t v13 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v12, v13))
        {
          long long v14 = AXColorizeFormatLog();
          long long v15 = _AXStringForArgs();
          if (os_log_type_enabled(v12, v13))
          {
            *(_DWORD *)buf = 138543362;
            v27 = v15;
            _os_log_impl(&dword_22D39A000, v12, v13, "%{public}@", buf, 0xCu);
          }
        }
      }
      asyncManagerAdapter = self->_asyncManagerAdapter;
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __59__AXVisualAlertManager__setTorchDeviceOpen_withCompletion___block_invoke;
      v24[3] = &unk_2649A6DF0;
      id v25 = v7;
      [(AXCameraTorchManagerBackgroundAdapter *)asyncManagerAdapter openTorchDeviceWithCompletion:v24];
    }
    else
    {
      [(AXCameraTorchManagerBackgroundAdapter *)self->_asyncManagerAdapter closeTorchDeviceWithCompletion:v6];
      long long v17 = [MEMORY[0x263F22988] sharedInstance];
      char v18 = [v17 ignoreLogging];

      if ((v18 & 1) == 0)
      {
        uint64_t v19 = [MEMORY[0x263F22988] identifier];
        v20 = AXLoggerForFacility();

        os_log_type_t v21 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v20, v21))
        {
          v22 = AXColorizeFormatLog();
          v23 = _AXStringForArgs();
          if (os_log_type_enabled(v20, v21))
          {
            *(_DWORD *)buf = 138543362;
            v27 = v23;
            _os_log_impl(&dword_22D39A000, v20, v21, "%{public}@", buf, 0xCu);
          }
        }
      }
    }
  }
}

uint64_t __59__AXVisualAlertManager__setTorchDeviceOpen_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_setTorchDeviceOn:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = v6;
  if (self->_torchDeviceOn == v4)
  {
    id v8 = [MEMORY[0x263F22988] sharedInstance];
    char v9 = [v8 ignoreLogging];

    if ((v9 & 1) == 0)
    {
      char v10 = [MEMORY[0x263F22988] identifier];
      objc_super v11 = AXLoggerForFacility();

      os_log_type_t v12 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v11, v12))
      {
        os_log_type_t v13 = AXColorizeFormatLog();
        long long v14 = _AXStringForArgs();
        if (os_log_type_enabled(v11, v12))
        {
          *(_DWORD *)buf = 138543362;
          v31 = v14;
          _os_log_impl(&dword_22D39A000, v11, v12, "%{public}@", buf, 0xCu);
        }
      }
    }
    if (v7)
    {
      long long v15 = dispatch_get_global_queue(0, 0);
      dispatch_async(v15, v7);
    }
  }
  else
  {
    self->_torchDeviceOn = v4;
    if (v4)
    {
      long long v16 = [MEMORY[0x263F22988] sharedInstance];
      char v17 = [v16 ignoreLogging];

      if ((v17 & 1) == 0)
      {
        char v18 = [MEMORY[0x263F22988] identifier];
        uint64_t v19 = AXLoggerForFacility();

        os_log_type_t v20 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v19, v20))
        {
          os_log_type_t v21 = AXColorizeFormatLog();
          CFAbsoluteTimeGetCurrent();
          v22 = _AXStringForArgs();
          if (os_log_type_enabled(v19, v20))
          {
            *(_DWORD *)buf = 138543362;
            v31 = v22;
            _os_log_impl(&dword_22D39A000, v19, v20, "%{public}@", buf, 0xCu);
          }
        }
      }
      asyncManagerAdapter = self->_asyncManagerAdapter;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __57__AXVisualAlertManager__setTorchDeviceOn_withCompletion___block_invoke;
      v28[3] = &unk_2649A6DA0;
      v28[4] = self;
      id v29 = v7;
      [(AXCameraTorchManagerBackgroundAdapter *)asyncManagerAdapter turnTorchOnWithCompletion:v28];
      v24 = v29;
    }
    else
    {
      id v25 = self->_asyncManagerAdapter;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __57__AXVisualAlertManager__setTorchDeviceOn_withCompletion___block_invoke_498;
      v26[3] = &unk_2649A6DA0;
      v26[4] = self;
      id v27 = v6;
      [(AXCameraTorchManagerBackgroundAdapter *)v25 turnTorchOffWithCompletion:v26];
      v24 = v27;
    }
  }
}

uint64_t __57__AXVisualAlertManager__setTorchDeviceOn_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F22988] sharedInstance];
  char v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x263F22988] identifier];
    id v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = AXColorizeFormatLog();
      CFAbsoluteTimeGetCurrent();
      char v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        os_log_type_t v12 = v9;
        _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", buf, 0xCu);
      }
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  }
  return result;
}

uint64_t __57__AXVisualAlertManager__setTorchDeviceOn_withCompletion___block_invoke_498(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F22988] sharedInstance];
  char v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x263F22988] identifier];
    id v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = AXColorizeFormatLog();
      CFAbsoluteTimeGetCurrent();
      char v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        os_log_type_t v12 = v9;
        _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", buf, 0xCu);
      }
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  }
  return result;
}

- (NSDictionary)_patterns
{
  patterns = self->_patterns;
  if (!patterns)
  {
    id v4 = objc_alloc(NSDictionary);
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v5 URLForResource:@"AXVisualAlertPatterns" withExtension:@"plist"];
    os_log_type_t v7 = (NSDictionary *)[v4 initWithContentsOfURL:v6];
    id v8 = self->_patterns;
    self->_patterns = v7;

    patterns = self->_patterns;
  }
  return patterns;
}

- (NSString)description
{
  char v3 = [(AXCameraTorchManagerBackgroundAdapter *)self->_asyncManagerAdapter synchronousTorchManager];
  id v4 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)AXVisualAlertManager;
  uint64_t v5 = [(AXVisualAlertManager *)&v10 description];
  id v6 = (objc_class *)objc_opt_class();
  os_log_type_t v7 = NSStringFromClass(v6);
  id v8 = [v4 stringWithFormat:@"%@ (camera torch manager: <%@: %p>)", v5, v7, v3];

  return (NSString *)v8;
}

+ (id)sharedVisualAlertManager
{
  return (id)_VisualAlertManager;
}

- (void)_springBoardLockButtonPress:(id)a3
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 postNotificationName:@"AXVisualAlertLockButtonPressedNotification" object:0];
}

- (void)_springBoardVolumeChange:(id)a3
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 postNotificationName:@"AXVisualAlertVolumeChangeNotification" object:0];
}

- (void)_springBoardLockStateChange:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 userInfo];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v5 = (void *)getkSBNotificationKeyDeviceLockStateSymbolLoc_ptr;
  uint64_t v15 = getkSBNotificationKeyDeviceLockStateSymbolLoc_ptr;
  if (!getkSBNotificationKeyDeviceLockStateSymbolLoc_ptr)
  {
    id v6 = (void *)SpringBoardUILibrary();
    v13[3] = (uint64_t)dlsym(v6, "kSBNotificationKeyDeviceLockState");
    getkSBNotificationKeyDeviceLockStateSymbolLoc_ptr = v13[3];
    uint64_t v5 = (void *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v5) {
    -[AXVisualAlertManager _springBoardLockStateChange:]();
  }
  os_log_type_t v7 = [v4 objectForKey:*v5];
  uint64_t v8 = [v7 BOOLValue];

  char v9 = [MEMORY[0x263F08A00] defaultCenter];
  long long v16 = @"AXVisualAlertLockStateKey";
  objc_super v10 = [NSNumber numberWithBool:v8];
  v17[0] = v10;
  objc_super v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  [v9 postNotificationName:@"AXVisualAlertLockStateChangeNotification" object:0 userInfo:v11];
}

- (void)_startForAlertTypes:(unint64_t)a3 cameraTorchManager:(id)a4
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [(AXVisualAlertManager *)self _stop];
  self->_unint64_t alertTypes = a3;
  asyncManagerAdapter = self->_asyncManagerAdapter;
  self->_asyncManagerAdapter = 0;

  if (v6)
  {
    uint64_t v8 = [[AXCameraTorchManagerBackgroundAdapter alloc] initWithCameraTorchManager:v6];
    char v9 = self->_asyncManagerAdapter;
    self->_asyncManagerAdapter = v8;

    objc_super v10 = objc_opt_new();
    v84[0] = MEMORY[0x263EF8330];
    v84[1] = 3221225472;
    v84[2] = __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke;
    v84[3] = &unk_2649A6E40;
    v84[4] = self;
    v79 = (void *)MEMORY[0x230F7CF50](v84);
    unint64_t alertTypes = self->_alertTypes;
    if (alertTypes)
    {
      uint64_t v12 = [AXTelephonyNotificationHandler alloc];
      uint64_t v13 = [(VISAXNotificationHandler *)v12 initWithNotificationName:*MEMORY[0x263F7E310] target:self dispatcher:v79];
      [v10 addObject:v13];
      uint64_t v14 = [AXTelephonyNotificationHandler alloc];
      uint64_t v15 = [(VISAXNotificationHandler *)v14 initWithNotificationName:*MEMORY[0x263F7E308] target:self dispatcher:&__block_literal_global_536];

      [v10 addObject:v15];
      unint64_t alertTypes = self->_alertTypes;
    }
    if ((alertTypes & 2) != 0)
    {
      long long v16 = [AXTelephonyNotificationHandler alloc];
      char v17 = [(VISAXNotificationHandler *)v16 initWithNotificationName:*MEMORY[0x263F7E328] target:self dispatcher:v79];
      [v10 addObject:v17];
      char v18 = [AXTelephonyNotificationHandler alloc];
      uint64_t v19 = [(VISAXNotificationHandler *)v18 initWithNotificationName:*MEMORY[0x263F7E308] target:self dispatcher:&__block_literal_global_536];

      [v10 addObject:v19];
      unint64_t alertTypes = self->_alertTypes;
    }
    if ((alertTypes & 3) != 0)
    {
      os_log_type_t v20 = [AXTelephonyNotificationHandler alloc];
      os_log_type_t v21 = [(VISAXNotificationHandler *)v20 initWithNotificationName:*MEMORY[0x263F7E360] target:self dispatcher:&__block_literal_global];
      [v10 addObject:v21];

      unint64_t alertTypes = self->_alertTypes;
    }
    if ((alertTypes & 0x10) != 0)
    {
      v22 = [(VISAXNotificationHandler *)[AXDistributedNotificationHandler alloc] initWithNotificationName:@"AXVisualAlert" target:self handler:sel__handleVisualAlertForExternalApplication];
      [v10 addObject:v22];
    }
    if (AXProcessIsSpringBoard())
    {
      v23 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v85 = 0;
      v86 = &v85;
      uint64_t v87 = 0x2020000000;
      v24 = (void *)getSBLockButtonPressedNotificationSymbolLoc_ptr;
      uint64_t v88 = getSBLockButtonPressedNotificationSymbolLoc_ptr;
      if (!getSBLockButtonPressedNotificationSymbolLoc_ptr)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        v90 = __getSBLockButtonPressedNotificationSymbolLoc_block_invoke;
        v91 = &unk_2649A6E18;
        v92 = &v85;
        id v25 = (void *)SpringBoardUILibrary();
        v26 = dlsym(v25, "SBLockButtonPressedNotification");
        *(void *)(v92[1] + 24) = v26;
        getSBLockButtonPressedNotificationSymbolLoc_ptr = *(void *)(v92[1] + 24);
        v24 = (void *)v86[3];
      }
      _Block_object_dispose(&v85, 8);
      if (!v24) {
        -[AXVisualAlertManager _startForAlertTypes:cameraTorchManager:]();
      }
      [v23 addObserver:self selector:sel__springBoardLockButtonPress_ name:*v24 object:0];

      id v27 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v85 = 0;
      v86 = &v85;
      uint64_t v87 = 0x2020000000;
      uint64_t v28 = (void *)getSBVolumeButtonPressedNotificationSymbolLoc_ptr;
      uint64_t v88 = getSBVolumeButtonPressedNotificationSymbolLoc_ptr;
      if (!getSBVolumeButtonPressedNotificationSymbolLoc_ptr)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        v90 = __getSBVolumeButtonPressedNotificationSymbolLoc_block_invoke;
        v91 = &unk_2649A6E18;
        v92 = &v85;
        id v29 = (void *)SpringBoardUILibrary();
        v30 = dlsym(v29, "SBVolumeButtonPressedNotification");
        *(void *)(v92[1] + 24) = v30;
        getSBVolumeButtonPressedNotificationSymbolLoc_ptr = *(void *)(v92[1] + 24);
        uint64_t v28 = (void *)v86[3];
      }
      _Block_object_dispose(&v85, 8);
      if (!v28) {
        -[AXVisualAlertManager _startForAlertTypes:cameraTorchManager:]();
      }
      [v27 addObserver:self selector:sel__springBoardVolumeChange_ name:*v28 object:0];

      v31 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v85 = 0;
      v86 = &v85;
      uint64_t v87 = 0x2020000000;
      uint64_t v32 = (void *)getSBDeviceLockStateChangedNotificationSymbolLoc_ptr;
      uint64_t v88 = getSBDeviceLockStateChangedNotificationSymbolLoc_ptr;
      if (!getSBDeviceLockStateChangedNotificationSymbolLoc_ptr)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        v90 = __getSBDeviceLockStateChangedNotificationSymbolLoc_block_invoke;
        v91 = &unk_2649A6E18;
        v92 = &v85;
        v33 = (void *)SpringBoardUILibrary();
        v34 = dlsym(v33, "SBDeviceLockStateChangedNotification");
        *(void *)(v92[1] + 24) = v34;
        getSBDeviceLockStateChangedNotificationSymbolLoc_ptr = *(void *)(v92[1] + 24);
        uint64_t v32 = (void *)v86[3];
      }
      _Block_object_dispose(&v85, 8);
      if (!v32) {
        -[AXVisualAlertManager _startForAlertTypes:cameraTorchManager:]();
      }
      [v31 addObserver:self selector:sel__springBoardLockStateChange_ name:*v32 object:0];
    }
    v78 = [[AXAutoForwardingLocalNotificationHandler alloc] initWithNotificationName:@"AXVisualAlertLockButtonPressedNotification" target:self handler:sel__handleLockButtonPressed];
    [v10 addObject:v78];
    v77 = [[AXAutoForwardingLocalNotificationHandler alloc] initWithNotificationName:@"AXVisualAlertVolumeChangeNotification" target:self handler:sel__handleVolumeChanged];
    [v10 addObject:v77];
    v35 = [AXAutoForwardingLocalNotificationHandler alloc];
    v82[0] = MEMORY[0x263EF8330];
    v82[1] = 3221225472;
    v82[2] = __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_4;
    v82[3] = &unk_2649A6EA8;
    id v83 = &__block_literal_global_557;
    v36 = [(AXAutoForwardingLocalNotificationHandler *)v35 initWithNotificationName:@"AXVisualAlertLockStateChangeNotification", self, v82, sel__handleDeviceWasLocked, sel__handleDeviceWasUnlocked, 0 target dispatcher possibleHandlers];
    deviceLockStateChangedNotificationHandler = self->_deviceLockStateChangedNotificationHandler;
    self->_deviceLockStateChangedNotificationHandler = v36;

    [v10 addObject:self->_deviceLockStateChangedNotificationHandler];
    v76 = [[AXAutoForwardingLocalNotificationHandler alloc] initWithNotificationName:@"AXVisualAlertManagerDoNotDisturbStatusChangedNotification", self, &__block_literal_global_563, sel__handleQuietModeWasEnabled, sel__handleQuietModeWasDisabled, 0 target dispatcher possibleHandlers];
    [v10 addObject:v76];
    v38 = [[AXAutoForwardingLocalNotificationHandler alloc] initWithNotificationName:@"AXVisualAlertManagerControlCenterTorchWasEnabledNotification" target:self handler:sel__handleTorchInControlCenterWasEnabled];
    torchInControlCenterWasEnabledNotificationHandler = self->_torchInControlCenterWasEnabledNotificationHandler;
    self->_torchInControlCenterWasEnabledNotificationHandler = &v38->super.super;

    [v10 addObject:self->_torchInControlCenterWasEnabledNotificationHandler];
    v75 = [[AXAutoForwardingLocalNotificationHandler alloc] initWithNotificationName:@"AXVisualAlertManagerControlCenterTorchWasDisabledNotification" target:self handler:sel__handleTorchInControlCenterWasDisabled];
    [v10 addObject:v75];
    v40 = [AXAutoForwardingLocalNotificationHandler alloc];
    v41 = [(AXAutoForwardingLocalNotificationHandler *)v40 initWithNotificationName:*MEMORY[0x263EF9700] target:self handler:sel__handleCaptureSessionDidStartRunning];
    [v10 addObject:v41];
    v42 = [AXAutoForwardingLocalNotificationHandler alloc];
    v43 = [(AXAutoForwardingLocalNotificationHandler *)v42 initWithNotificationName:*MEMORY[0x263EF9708] target:self handler:sel__handleCaptureSessionDidStopRunning];
    [v10 addObject:v43];
    if (AXProcessIsSpringBoard())
    {
      v44 = [(VISAXNotificationHandler *)[AXDistributedNotificationHandler alloc] initWithNotificationName:@"AXVisualAlertManagerDidStartNotification" target:self handler:sel__handleSecondaryVisualAlertManagerDidStart];
      [v10 addObject:v44];
      v45 = [NSClassFromString(&cfstr_Sblockscreenma.isa) safeValueForKey:@"sharedInstanceIfExists"];
      int v46 = [v45 safeBoolForKey:@"isUILocked"];

      if (v46) {
        v47 = sel__handleDeviceWasLocked;
      }
      else {
        v47 = sel__handleDeviceWasUnlocked;
      }
      [(VISAXNotificationHandler *)self->_deviceLockStateChangedNotificationHandler processHandler:v47];
      v48 = [MEMORY[0x263F3A7B0] serviceForClientIdentifier:@"com.apple.accessibility.visual.alerts"];
      [(AXVisualAlertManager *)self setDisturbanceService:v48];

      v49 = [(AXVisualAlertManager *)self disturbanceService];
      [v49 addStateUpdateListener:self withCompletionHandler:&__block_literal_global_596];

      v50 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_600;
      block[3] = &unk_2649A6EF0;
      block[4] = self;
      dispatch_async(v50, block);
    }
    else
    {
      v51 = [MEMORY[0x263F22988] sharedInstance];
      char v52 = [v51 ignoreLogging];

      if ((v52 & 1) == 0)
      {
        v53 = [MEMORY[0x263F22988] identifier];
        v54 = AXLoggerForFacility();

        os_log_type_t v55 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v54, v55))
        {
          v56 = AXColorizeFormatLog();
          uint64_t v74 = [(AXVisualAlertManager *)self _hasVideoConferenceCameraTorchManager];
          v57 = _AXStringForArgs();
          if (os_log_type_enabled(v54, v55))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v57;
            _os_log_impl(&dword_22D39A000, v54, v55, "%{public}@", (uint8_t *)&buf, 0xCu);
          }
        }
      }
      if ([(AXVisualAlertManager *)self _hasVideoConferenceCameraTorchManager])
      {
        v58 = [(VISAXNotificationHandler *)[AXDistributedNotificationHandler alloc] initWithNotificationName:@"AXVisualAlertManagerVideoConferenceCallRingingNotification" target:self handler:sel__handleVideoConferenceCallRinging];
        [v10 addObject:v58];
        v59 = [(VISAXNotificationHandler *)[AXDistributedNotificationHandler alloc] initWithNotificationName:@"AXVisualAlertManagerVideoConferenceCallHandledNotification" target:self handler:sel__handleEndVisualAlertForIncomingVideoConferenceCall];

        [v10 addObject:v59];
      }
      +[AXDistributedNotificationHandler postDistributedNotificationWithName:@"AXVisualAlertManagerDidStartNotification"];
    }
    v60 = (NSArray *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v10];
    notificationHandlers = self->_notificationHandlers;
    self->_notificationHandlers = v60;

    self->_isRingerSwitchSilent = BKSHIDServicesGetRingerState() == 0;
    v62 = [MEMORY[0x263F22988] sharedInstance];
    char v63 = [v62 ignoreLogging];

    if ((v63 & 1) == 0)
    {
      v64 = [MEMORY[0x263F22988] identifier];
      v65 = AXLoggerForFacility();

      os_log_type_t v66 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v65, v66))
      {
        v67 = AXColorizeFormatLog();
        v68 = _AXStringForArgs();
        if (os_log_type_enabled(v65, v66))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v68;
          _os_log_impl(&dword_22D39A000, v65, v66, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    if (AXProcessIsSpringBoard())
    {
      v69 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v85 = 0;
      v86 = &v85;
      uint64_t v87 = 0x2020000000;
      v70 = (void *)getSBRingerChangedNotificationSymbolLoc_ptr;
      uint64_t v88 = getSBRingerChangedNotificationSymbolLoc_ptr;
      if (!getSBRingerChangedNotificationSymbolLoc_ptr)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        v90 = __getSBRingerChangedNotificationSymbolLoc_block_invoke;
        v91 = &unk_2649A6E18;
        v92 = &v85;
        v71 = (void *)SpringBoardUILibrary();
        v72 = dlsym(v71, "SBRingerChangedNotification");
        *(void *)(v92[1] + 24) = v72;
        getSBRingerChangedNotificationSymbolLoc_ptr = *(void *)(v92[1] + 24);
        v70 = (void *)v86[3];
      }
      _Block_object_dispose(&v85, 8);
      if (!v70) {
        -[AXVisualAlertManager _startForAlertTypes:cameraTorchManager:].cold.4();
      }
      [v69 addObserver:self selector:sel__handleRingerSwitchToggled name:*v70 object:0];
    }
    else
    {
      v73 = (const char *)[@"com.apple.springboard.ringerstate" UTF8String];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_616;
      handler[3] = &unk_2649A6F18;
      handler[4] = self;
      notify_register_dispatch(v73, &self->_ringerStateNotifyToken, MEMORY[0x263EF83A0], handler);
    }
  }
}

char *__63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [MEMORY[0x263F7E1A0] sharedInstance];
  objc_super v11 = [v10 callServicesClientCapabilities];
  [v11 setWantsToScreenCalls:1];

  uint64_t v12 = [MEMORY[0x263F7E1A0] sharedInstance];
  uint64_t v13 = [v12 callServicesClientCapabilities];
  [v13 save];

  if (!v9 || ([v9 isOutgoing] & 1) != 0) {
    goto LABEL_18;
  }
  char v33 = [v9 isVideo];
  int v32 = [v9 status];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  id v39 = 0;
  AXPerformBlockSynchronouslyOnMainThread();
  [(id)v35[5] removeObject:v9];
  uint64_t v14 = [(id)v35[5] count];
  uint64_t v15 = [MEMORY[0x263F22988] sharedInstance];
  char v16 = [v15 ignoreLogging];

  if ((v16 & 1) == 0)
  {
    char v17 = [MEMORY[0x263F22988] identifier];
    char v18 = AXLoggerForFacility();

    os_log_type_t v19 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v18, v19))
    {
      os_log_type_t v20 = AXColorizeFormatLog();
      os_log_type_t v21 = _AXStringForArgs();
      if (os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)long long buf = 138543362;
        v41 = v21;
        _os_log_impl(&dword_22D39A000, v18, v19, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (v14)
  {
    v22 = [MEMORY[0x263F22988] sharedInstance];
    char v23 = [v22 ignoreLogging];

    if ((v23 & 1) == 0)
    {
      v24 = [MEMORY[0x263F22988] identifier];
      id v25 = AXLoggerForFacility();

      os_log_type_t v26 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v25, v26))
      {
        id v27 = AXColorizeFormatLog();
        uint64_t v28 = _AXStringForArgs();
        if (os_log_type_enabled(v25, v26))
        {
          *(_DWORD *)long long buf = 138543362;
          v41 = v28;
          _os_log_impl(&dword_22D39A000, v25, v26, "%{public}@", buf, 0xCu);
        }
      }
    }
    goto LABEL_16;
  }
  if ((v32 - 3) < 2) {
    char v31 = v33;
  }
  else {
    char v31 = 0;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 105) = v31;
  if ((v32 - 3) < 2)
  {
    if (v33) {
      id v29 = sel__handleBeginVisualAlertForIncomingVideoConferenceCall;
    }
    else {
      id v29 = sel__handleBeginVisualAlertForIncomingCall;
    }
  }
  else
  {
    if (v32 != 1 && v32 != 6)
    {
LABEL_16:
      id v29 = 0;
      goto LABEL_17;
    }
    if (v33) {
      id v29 = sel__handleEndVisualAlertForIncomingVideoConferenceCall;
    }
    else {
      id v29 = sel__handleEndVisualAlertForIncomingCall;
    }
  }
LABEL_17:
  _Block_object_dispose(&v34, 8);

  if (v14) {
LABEL_18:
  }
    id v29 = 0;

  return v29;
}

void __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_518(uint64_t a1)
{
  id v6 = [MEMORY[0x263F7E1A0] sharedInstance];
  v2 = [v6 currentAudioAndVideoCalls];
  uint64_t v3 = [v2 mutableCopy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

char *__63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_534(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if ([v3 status] == 4 && objc_msgSend(v3, "shouldSuppressRingtone"))
  {
    if ([v3 isVideo]) {
      uint64_t v4 = sel__handleEndVisualAlertForIncomingVideoConferenceCall;
    }
    else {
      uint64_t v4 = sel__handleEndVisualAlertForIncomingCall;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

char *__63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (([v3 isOutgoing] & 1) != 0 || !objc_msgSend(v3, "isConnecting"))
  {
    uint64_t v4 = 0;
  }
  else if ([v3 isVideo])
  {
    uint64_t v4 = sel__handleEndVisualAlertForIncomingVideoConferenceCall;
  }
  else
  {
    uint64_t v4 = sel__handleEndVisualAlertForIncomingCall;
  }

  return v4;
}

char *__63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_3(uint64_t a1, int a2)
{
  v2 = &selRef__handleDeviceWasLocked;
  if (!a2) {
    v2 = &selRef__handleDeviceWasUnlocked;
  }
  return *v2;
}

uint64_t __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = [a4 objectForKey:@"AXVisualAlertLockStateKey"];
  [v5 BOOLValue];

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v6();
}

char *__63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = [a4 objectForKeyedSubscript:@"active"];
  int v5 = [v4 BOOLValue];
  id v6 = &selRef__handleQuietModeWasEnabled;
  if (!v5) {
    id v6 = &selRef__handleQuietModeWasDisabled;
  }
  id v7 = *v6;

  return v7;
}

void __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F22988] sharedInstance];
    char v5 = [v4 ignoreLogging];

    if ((v5 & 1) == 0)
    {
      id v6 = [MEMORY[0x263F22988] identifier];
      id v7 = AXLoggerForFacility();

      os_log_type_t v8 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v7, v8))
      {
        id v9 = AXColorizeFormatLog();
        objc_super v10 = _AXStringForArgs();
        if (os_log_type_enabled(v7, v8))
        {
          *(_DWORD *)long long buf = 138543362;
          uint64_t v12 = v10;
          _os_log_impl(&dword_22D39A000, v7, v8, "%{public}@", buf, 0xCu);
        }
      }
    }
  }
}

void __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_600(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) disturbanceService];
  id v14 = 0;
  id v3 = [v2 queryCurrentStateWithError:&v14];
  id v4 = v14;
  int v5 = [v3 isActive];

  if (v4)
  {
    id v6 = [MEMORY[0x263F22988] sharedInstance];
    char v7 = [v6 ignoreLogging];

    if ((v7 & 1) == 0)
    {
      os_log_type_t v8 = [MEMORY[0x263F22988] identifier];
      id v9 = AXLoggerForFacility();

      os_log_type_t v10 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v9, v10))
      {
        objc_super v11 = AXColorizeFormatLog();
        uint64_t v12 = _AXStringForArgs();
        if (os_log_type_enabled(v9, v10))
        {
          *(_DWORD *)long long buf = 138543362;
          char v16 = v12;
          _os_log_impl(&dword_22D39A000, v9, v10, "%{public}@", buf, 0xCu);
        }
      }
    }
  }
  if (v5)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_604;
    block[3] = &unk_2649A6EF0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_604(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleQuietModeWasEnabled];
}

uint64_t __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_616(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleRingerSwitchToggled];
}

- (void)_stop
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F22988] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    int v5 = [MEMORY[0x263F22988] identifier];
    id v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      os_log_type_t v8 = AXColorizeFormatLog();
      id v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v15 = 138543362;
        char v16 = v9;
        _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  if (self->_asyncManagerAdapter)
  {
    if (AXProcessIsSpringBoard())
    {
      [(AXVisualAlertManager *)self setDisturbanceService:0];
      os_log_type_t v10 = [MEMORY[0x263F08A00] defaultCenter];
      [v10 removeObserver:self];
    }
    else
    {
      notify_cancel([(AXVisualAlertManager *)self ringerStateNotifyToken]);
    }
    [(NSArray *)self->_notificationHandlers makeObjectsPerformSelector:sel_invalidate];
    notificationHandlers = self->_notificationHandlers;
    self->_notificationHandlers = 0;

    [(AXVisualAlertManager *)self _endVisualAlert];
    asyncManagerAdapter = self->_asyncManagerAdapter;
    self->_asyncManagerAdapter = 0;

    deviceLockStateChangedNotificationHandler = self->_deviceLockStateChangedNotificationHandler;
    self->_deviceLockStateChangedNotificationHandler = 0;

    torchInControlCenterWasEnabledNotificationHandler = self->_torchInControlCenterWasEnabledNotificationHandler;
    self->_torchInControlCenterWasEnabledNotificationHandler = 0;

    self->_isDeviceLocked = 0;
  }
}

- (void)startForAlertTypes:(unint64_t)a3 cameraTorchManager:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a4;
  int v5 = [MEMORY[0x263F22988] sharedInstance];
  char v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    os_log_type_t v7 = [MEMORY[0x263F22988] identifier];
    os_log_type_t v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      os_log_type_t v10 = AXColorizeFormatLog();
      objc_super v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)long long buf = 138543362;
        id v14 = v11;
        _os_log_impl(&dword_22D39A000, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  AXPerformBlockOnMainThread();
}

uint64_t __62__AXVisualAlertManager_startForAlertTypes_cameraTorchManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startForAlertTypes:*(void *)(a1 + 48) cameraTorchManager:*(void *)(a1 + 40)];
}

- (void)stop
{
}

uint64_t __28__AXVisualAlertManager_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stop];
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a4;
  int v5 = [MEMORY[0x263F22988] sharedInstance];
  char v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    os_log_type_t v7 = [MEMORY[0x263F22988] identifier];
    os_log_type_t v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      os_log_type_t v10 = AXColorizeFormatLog();
      id v17 = v4;
      objc_super v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)long long buf = 138543362;
        os_log_type_t v21 = v11;
        _os_log_impl(&dword_22D39A000, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  id v12 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v17);
  char v18 = @"active";
  uint64_t v13 = NSNumber;
  id v14 = [v4 state];
  uint64_t v15 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "isActive"));
  os_log_type_t v19 = v15;
  char v16 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  [v12 postNotificationName:@"AXVisualAlertManagerDoNotDisturbStatusChangedNotification" object:0 userInfo:v16];
}

- (BOOL)_isCameraInUse
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [NSClassFromString(&cfstr_Uiapplication.isa) sharedApplication];
  id v3 = [v2 safeValueForKey:@"_sensorActivityDataProvider"];
  id v4 = [v3 safeSetForKey:@"activeCameraAndMicrophoneActivityAttributions"];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (![*(id *)(*((void *)&v11 + 1) + 8 * i) safeIntegerForKey:@"sensor"])
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)_isRingerSwitchException:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = a3 == 32 && (self->_alertTypes & 0x20) != 0;
  id v4 = [MEMORY[0x263F22988] sharedInstance];
  char v5 = [v4 ignoreLogging];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x263F22988] identifier];
    uint64_t v7 = AXLoggerForFacility();

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v7, v8))
    {
      BOOL v9 = AXColorizeFormatLog();
      os_log_type_t v10 = _AXStringForArgs();
      if (os_log_type_enabled(v7, v8))
      {
        *(_DWORD *)long long buf = 138543362;
        long long v13 = v10;
        _os_log_impl(&dword_22D39A000, v7, v8, "%{public}@", buf, 0xCu);
      }
    }
  }
  return v3;
}

- (void)_beginVisualAlertForType:(unint64_t)a3 repeat:(BOOL)a4
{
}

- (void)_beginVisualAlertForType:(unint64_t)a3 repeat:(BOOL)a4 skipAutomaticStopOnUserInteraction:(BOOL)a5 bundleId:(id)a6
{
  BOOL v6 = a5;
  BOOL v104 = a4;
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v105 = a6;
  BOOL v9 = [MEMORY[0x263F22938] sharedInstance];
  unsigned int v10 = [v9 shouldFlashWhileUnlocked];

  long long v11 = [MEMORY[0x263F22988] sharedInstance];
  char v12 = [v11 ignoreLogging];

  if ((v12 & 1) == 0)
  {
    long long v13 = [MEMORY[0x263F22988] identifier];
    uint64_t v14 = AXLoggerForFacility();

    os_log_type_t v15 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = AXColorizeFormatLog();
      BOOL v102 = v6;
      uint64_t v103 = v10;
      unint64_t v98 = a3;
      BOOL v100 = v104;
      id v17 = _AXStringForArgs();
      if (os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)long long buf = 138543362;
        v111 = v17;
        _os_log_impl(&dword_22D39A000, v14, v15, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (self->_isDeviceLocked) {
    char v18 = 1;
  }
  else {
    char v18 = v10;
  }
  if ((v18 & 1) == 0)
  {
    os_log_type_t v26 = [MEMORY[0x263F22988] sharedInstance];
    char v27 = [v26 ignoreLogging];

    if ((v27 & 1) == 0)
    {
      uint64_t v28 = [MEMORY[0x263F22988] identifier];
      uint64_t v22 = AXLoggerForFacility();

      os_log_type_t v29 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v22, v29))
      {
        v30 = AXColorizeFormatLog();
        char v31 = _AXStringForArgs();
        if (os_log_type_enabled(v22, v29))
        {
          *(_DWORD *)long long buf = 138543362;
          v111 = v31;
          _os_log_impl(&dword_22D39A000, v22, v29, "%{public}@", buf, 0xCu);
        }
      }
      goto LABEL_61;
    }
    goto LABEL_62;
  }
  if (AXProcessIsSpringBoard()
    && !self->_isDeviceLocked
    && [(AXVisualAlertManager *)self _isCameraInUse])
  {
    os_log_type_t v19 = [MEMORY[0x263F22988] sharedInstance];
    char v20 = [v19 ignoreLogging];

    if ((v20 & 1) == 0)
    {
      os_log_type_t v21 = [MEMORY[0x263F22988] identifier];
      uint64_t v22 = AXLoggerForFacility();

      os_log_type_t v23 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = AXColorizeFormatLog();
        id v25 = _AXStringForArgs();
        if (os_log_type_enabled(v22, v23))
        {
          *(_DWORD *)long long buf = 138543362;
          v111 = v25;
          _os_log_impl(&dword_22D39A000, v22, v23, "%{public}@", buf, 0xCu);
        }
      }
LABEL_61:
    }
  }
  else
  {
    if (self->_isRingerSwitchSilent)
    {
      int v32 = [MEMORY[0x263F22938] sharedInstance];
      if ([v32 shouldFlashForAlertInSilentMode])
      {
      }
      else
      {
        BOOL v33 = [(AXVisualAlertManager *)self _isRingerSwitchException:a3];

        if (!v33)
        {
          v54 = [MEMORY[0x263F22988] sharedInstance];
          char v55 = [v54 ignoreLogging];

          if ((v55 & 1) == 0)
          {
            v56 = [MEMORY[0x263F22988] identifier];
            uint64_t v22 = AXLoggerForFacility();

            os_log_type_t v57 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v22, v57))
            {
              v58 = AXColorizeFormatLog();
              v59 = _AXStringForArgs();
              if (os_log_type_enabled(v22, v57))
              {
                *(_DWORD *)long long buf = 138543362;
                v111 = v59;
                _os_log_impl(&dword_22D39A000, v22, v57, "%{public}@", buf, 0xCu);
              }
            }
            goto LABEL_61;
          }
          goto LABEL_62;
        }
      }
    }
    if (a3 - 1 <= 1 && self->_isQuietModeEnabled)
    {
      uint64_t v34 = [MEMORY[0x263F22988] sharedInstance];
      char v35 = [v34 ignoreLogging];

      if ((v35 & 1) == 0)
      {
        uint64_t v36 = [MEMORY[0x263F22988] identifier];
        uint64_t v22 = AXLoggerForFacility();

        os_log_type_t v37 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v22, v37))
        {
          v38 = AXColorizeFormatLog();
          id v39 = _AXStringForArgs();
          if (os_log_type_enabled(v22, v37))
          {
            *(_DWORD *)long long buf = 138543362;
            v111 = v39;
            _os_log_impl(&dword_22D39A000, v22, v37, "%{public}@", buf, 0xCu);
          }
        }
        goto LABEL_61;
      }
    }
    else if (self->_isTorchEnabledInControlCenter)
    {
      v40 = [MEMORY[0x263F22988] sharedInstance];
      char v41 = [v40 ignoreLogging];

      if ((v41 & 1) == 0)
      {
        uint64_t v42 = [MEMORY[0x263F22988] identifier];
        uint64_t v22 = AXLoggerForFacility();

        os_log_type_t v43 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v22, v43))
        {
          v44 = AXColorizeFormatLog();
          v45 = _AXStringForArgs();
          if (os_log_type_enabled(v22, v43))
          {
            *(_DWORD *)long long buf = 138543362;
            v111 = v45;
            _os_log_impl(&dword_22D39A000, v22, v43, "%{public}@", buf, 0xCu);
          }
        }
        goto LABEL_61;
      }
    }
    else if (self->_captureSessionRunning)
    {
      int v46 = [MEMORY[0x263F22988] sharedInstance];
      char v47 = [v46 ignoreLogging];

      if ((v47 & 1) == 0)
      {
        v48 = [MEMORY[0x263F22988] identifier];
        v49 = AXLoggerForFacility();

        os_log_type_t v50 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v49, v50))
        {
          v51 = AXColorizeFormatLog();
          unint64_t v98 = (unint64_t)self;
          char v52 = _AXStringForArgs();
          if (os_log_type_enabled(v49, v50))
          {
            *(_DWORD *)long long buf = 138543362;
            v111 = v52;
            _os_log_impl(&dword_22D39A000, v49, v50, "%{public}@", buf, 0xCu);
          }
        }
      }
      if (v104) {
        unint64_t v53 = a3;
      }
      else {
        unint64_t v53 = 0;
      }
      -[AXVisualAlertManager _setTypeToUseForVisualAlertAfterCaptureSessionStopsRunning:](self, "_setTypeToUseForVisualAlertAfterCaptureSessionStopsRunning:", v53, v98, v100, v102, v103);
    }
    else
    {
      if (AXProcessIsSpringBoard())
      {
        v60 = _AXFrontBoardFocusedAppProcesses();
        v61 = [v60 firstObject];
        v62 = [v61 bundleIdentifier];
        int v63 = [v62 isEqualToString:*MEMORY[0x263F22798]];

        if (v63)
        {
          v64 = [MEMORY[0x263F22988] sharedInstance];
          char v65 = [v64 ignoreLogging];

          if (v65) {
            goto LABEL_62;
          }
          os_log_type_t v66 = [MEMORY[0x263F22988] identifier];
          uint64_t v22 = AXLoggerForFacility();

          os_log_type_t v67 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v22, v67))
          {
            v68 = AXColorizeFormatLog();
            v69 = _AXStringForArgs();
            if (os_log_type_enabled(v22, v67))
            {
              *(_DWORD *)long long buf = 138543362;
              v111 = v69;
              _os_log_impl(&dword_22D39A000, v22, v67, "%{public}@", buf, 0xCu);
            }
          }
          goto LABEL_61;
        }
      }
      v70 = objc_msgSend(MEMORY[0x263F22988], "sharedInstance", v98, v100, v102, v103);
      char v71 = [v70 ignoreLogging];

      if ((v71 & 1) == 0)
      {
        v72 = [MEMORY[0x263F22988] identifier];
        v73 = AXLoggerForFacility();

        os_log_type_t v74 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v73, v74))
        {
          v75 = AXColorizeFormatLog();
          v76 = _AXStringForArgs();
          if (os_log_type_enabled(v73, v74))
          {
            *(_DWORD *)long long buf = 138543362;
            v111 = v76;
            _os_log_impl(&dword_22D39A000, v73, v74, "%{public}@", buf, 0xCu);
          }
        }
      }
      [(AXVisualAlertManager *)self _endVisualAlert];
      if (!_AXSVisualAlertEnabled() || (MGGetBoolAnswer() & 1) == 0)
      {
        v78 = [MEMORY[0x263F22988] sharedInstance];
        char v79 = [v78 ignoreLogging];

        if (v79) {
          goto LABEL_62;
        }
        v80 = [MEMORY[0x263F22988] identifier];
        uint64_t v22 = AXLoggerForFacility();

        os_log_type_t v81 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v22, v81))
        {
          v82 = AXColorizeFormatLog();
          id v83 = _AXStringForArgs();
          if (os_log_type_enabled(v22, v81))
          {
            *(_DWORD *)long long buf = 138543362;
            v111 = v83;
            _os_log_impl(&dword_22D39A000, v22, v81, "%{public}@", buf, 0xCu);
          }
        }
        goto LABEL_61;
      }
      if ((uint64_t)a3 > 7)
      {
        if (a3 == 8 || a3 == 16)
        {
          v77 = @"PushNotification";
        }
        else
        {
          if (a3 != 32) {
            goto LABEL_62;
          }
          v77 = @"Alarm";
        }
      }
      else if (a3 - 1 >= 2)
      {
        if (a3 != 4) {
          goto LABEL_62;
        }
        v77 = @"IncomingMessage";
      }
      else
      {
        v77 = @"IncomingCall";
      }
      v84 = [MEMORY[0x263F22988] sharedInstance];
      char v85 = [v84 ignoreLogging];

      if ((v85 & 1) == 0)
      {
        v86 = [MEMORY[0x263F22988] identifier];
        uint64_t v87 = AXLoggerForFacility();

        os_log_type_t v88 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v87, v88))
        {
          v89 = AXColorizeFormatLog();
          v99 = self;
          v101 = v77;
          v90 = _AXStringForArgs();
          if (os_log_type_enabled(v87, v88))
          {
            *(_DWORD *)long long buf = 138543362;
            v111 = v90;
            _os_log_impl(&dword_22D39A000, v87, v88, "%{public}@", buf, 0xCu);
          }
        }
      }
      v91 = [(AXVisualAlertManager *)self _patterns];
      v92 = [v91 objectForKey:v77];

      uint64_t v93 = [MEMORY[0x263F08A00] defaultCenter];
      v108[0] = @"bundleId";
      v108[1] = @"visualAlertType";
      v109[0] = &stru_26E103E68;
      v94 = [NSNumber numberWithUnsignedInteger:a3];
      v109[1] = v94;
      v95 = [NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:2];
      [v93 postNotificationName:@"AXVisualAlertEvent" object:0 userInfo:v95];

      self->_skipAutomaticStopOnUserInteraction = v6;
      objc_initWeak((id *)buf, self);
      torchForceShutdownTimer = self->_torchForceShutdownTimer;
      v106[0] = MEMORY[0x263EF8330];
      v106[1] = 3221225472;
      v106[2] = __100__AXVisualAlertManager__beginVisualAlertForType_repeat_skipAutomaticStopOnUserInteraction_bundleId___block_invoke;
      v106[3] = &unk_2649A6F68;
      objc_copyWeak(&v107, (id *)buf);
      v106[4] = self;
      [(AXDispatchTimer *)torchForceShutdownTimer afterDelay:v106 processBlock:180.0];
      v97 = [(AXVisualAlertManager *)self _normalizedStrobePatternForOriginalPattern:v92];
      [(AXVisualAlertManager *)self _setActivePattern:v97];

      self->_shouldRepeatPattern = v104;
      self->_activePatternCursor = 0;
      [(AXVisualAlertManager *)self _setTorchDeviceOpen:1 withCompletion:0];
      [(AXVisualAlertManager *)self _processNextVisualAlertComponent];
      objc_destroyWeak(&v107);
      objc_destroyWeak((id *)buf);
    }
  }
LABEL_62:
}

void __100__AXVisualAlertManager__beginVisualAlertForType_repeat_skipAutomaticStopOnUserInteraction_bundleId___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained _isTorchDeviceOpen])
  {
    id v2 = objc_loadWeakRetained(v1);
    int v3 = [v2 _isTorchDeviceOn];

    if (v3)
    {
      id v4 = [MEMORY[0x263F22988] sharedInstance];
      char v5 = [v4 ignoreLogging];

      if ((v5 & 1) == 0)
      {
        BOOL v6 = [MEMORY[0x263F22988] identifier];
        uint64_t v7 = AXLoggerForFacility();

        os_log_type_t v8 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v7, v8))
        {
          BOOL v9 = AXColorizeFormatLog();
          unsigned int v10 = _AXStringForArgs();
          if (os_log_type_enabled(v7, v8))
          {
            *(_DWORD *)long long buf = 138543362;
            uint64_t v14 = v10;
            _os_log_impl(&dword_22D39A000, v7, v8, "%{public}@", buf, 0xCu);
          }
        }
      }
      id v11 = objc_loadWeakRetained(v1);
      [v11 _endVisualAlert];
    }
  }
  else
  {
  }
}

- (void)_endVisualAlert
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263F22988] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    char v5 = [MEMORY[0x263F22988] identifier];
    BOOL v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      os_log_type_t v8 = AXColorizeFormatLog();
      BOOL v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v11 = 138543362;
        char v12 = v9;
        _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  [(AXDispatchTimer *)self->_timer cancel];
  [(AXDispatchTimer *)self->_torchForceShutdownTimer cancel];
  [(AXVisualAlertManager *)self _setTorchDeviceOn:0 withCompletion:0];
  [(AXVisualAlertManager *)self _setTorchDeviceOpen:0 withCompletion:0];
  [(AXVisualAlertManager *)self _setActivePattern:0];
  [(AXVisualAlertManager *)self _setTypeToUseForVisualAlertAfterCaptureSessionStopsRunning:0];
  self->_shouldRepeatPattern = 0;
  self->_activePatternCursor = 0;
  self->_skipAutomaticStopOnUserInteraction = 0;
  unsigned int v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 postNotificationName:@"AXVisualAlertEventEnded" object:0 userInfo:0];
}

- (void)_processNextVisualAlertComponent
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v3 = [(AXVisualAlertManager *)self _activePattern];
  char v4 = [v3 objectForKey:@"StrobePattern"];

  if (!v4)
  {
    BOOL v9 = [MEMORY[0x263F22988] sharedInstance];
    char v10 = [v9 ignoreLogging];

    if ((v10 & 1) == 0)
    {
      int v11 = [MEMORY[0x263F22988] identifier];
      char v12 = AXLoggerForFacility();

      os_log_type_t v13 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = AXColorizeFormatLog();
        uint64_t v15 = _AXStringForArgs();
        if (os_log_type_enabled(v12, v13))
        {
          *(_DWORD *)long long buf = 138543362;
          char v31 = v15;
          _os_log_impl(&dword_22D39A000, v12, v13, "%{public}@", buf, 0xCu);
        }
      }
    }
LABEL_11:
    [(AXVisualAlertManager *)self _endVisualAlert];
    goto LABEL_23;
  }
  unint64_t activePatternCursor = self->_activePatternCursor;
  if (activePatternCursor >= [v4 count] - 1)
  {
    if (self->_shouldRepeatPattern)
    {
      self->_unint64_t activePatternCursor = 0;
      [(AXVisualAlertManager *)self _processNextVisualAlertComponent];
      goto LABEL_23;
    }
    uint64_t v16 = [MEMORY[0x263F22988] sharedInstance];
    char v17 = [v16 ignoreLogging];

    if ((v17 & 1) == 0)
    {
      char v18 = [MEMORY[0x263F22988] identifier];
      os_log_type_t v19 = AXLoggerForFacility();

      os_log_type_t v20 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v19, v20))
      {
        os_log_type_t v21 = AXColorizeFormatLog();
        uint64_t v22 = _AXStringForArgs();
        if (os_log_type_enabled(v19, v20))
        {
          *(_DWORD *)long long buf = 138543362;
          char v31 = v22;
          _os_log_impl(&dword_22D39A000, v19, v20, "%{public}@", buf, 0xCu);
        }
      }
    }
    goto LABEL_11;
  }
  BOOL v6 = [v4 objectAtIndex:self->_activePatternCursor];
  os_log_type_t v7 = [v4 objectAtIndex:self->_activePatternCursor + 1];
  self->_activePatternCursor += 2;
  if (v6) {
    uint64_t v8 = [v6 BOOLValue];
  }
  else {
    uint64_t v8 = 0;
  }
  int v23 = [v7 intValue];
  objc_initWeak((id *)buf, self);
  double v24 = (double)v23 / 1000.0;
  id v25 = self->_timer;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __56__AXVisualAlertManager__processNextVisualAlertComponent__block_invoke;
  v27[3] = &unk_2649A6FB8;
  os_log_type_t v26 = v25;
  uint64_t v28 = v26;
  v29[1] = *(id *)&v24;
  objc_copyWeak(v29, (id *)buf);
  [(AXVisualAlertManager *)self _setTorchDeviceOn:v8 withCompletion:v27];
  objc_destroyWeak(v29);

  objc_destroyWeak((id *)buf);
LABEL_23:
}

void __56__AXVisualAlertManager__processNextVisualAlertComponent__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  double v2 = *(double *)(a1 + 48);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__AXVisualAlertManager__processNextVisualAlertComponent__block_invoke_2;
  v3[3] = &unk_2649A6F90;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  [v1 afterDelay:v3 processBlock:v2];
  objc_destroyWeak(&v4);
}

void __56__AXVisualAlertManager__processNextVisualAlertComponent__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _processNextVisualAlertComponent];
}

- (void)_handleBeginVisualAlertForIncomingCall
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_alertTypes)
  {
    int v3 = [MEMORY[0x263F22988] sharedInstance];
    char v4 = [v3 ignoreLogging];

    if ((v4 & 1) == 0)
    {
      char v5 = [MEMORY[0x263F22988] identifier];
      BOOL v6 = AXLoggerForFacility();

      os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v6, v7))
      {
        uint64_t v8 = AXColorizeFormatLog();
        BOOL v9 = _AXStringForArgs();
        if (os_log_type_enabled(v6, v7))
        {
          int v10 = 138543362;
          int v11 = v9;
          _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
        }
      }
    }
    [(AXVisualAlertManager *)self _beginVisualAlertForType:1 repeat:1];
  }
}

- (void)_handleEndVisualAlertForIncomingCall
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263F22988] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    char v5 = [MEMORY[0x263F22988] identifier];
    BOOL v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = AXColorizeFormatLog();
      BOOL v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v10 = 138543362;
        int v11 = v9;
        _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  [(AXVisualAlertManager *)self _endVisualAlert];
}

- (void)_handleBeginVisualAlertForIncomingVideoConferenceCall
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if ((self->_alertTypes & 2) != 0)
  {
    int v3 = [MEMORY[0x263F22988] sharedInstance];
    char v4 = [v3 ignoreLogging];

    if ((v4 & 1) == 0)
    {
      char v5 = [MEMORY[0x263F22988] identifier];
      BOOL v6 = AXLoggerForFacility();

      os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v6, v7))
      {
        uint64_t v8 = AXColorizeFormatLog();
        uint64_t IsSpringBoard = AXProcessIsSpringBoard();
        uint64_t v26 = [(AXVisualAlertManager *)self _shouldHandleVisualAlertsForVideoConferenceCallsInConferenceFramework];
        BOOL v9 = _AXStringForArgs();
        if (os_log_type_enabled(v6, v7))
        {
          *(_DWORD *)long long buf = 138543362;
          uint64_t v28 = v9;
          _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", buf, 0xCu);
        }
      }
    }
    if (AXProcessIsSpringBoard()
      && [(AXVisualAlertManager *)self _shouldHandleVisualAlertsForVideoConferenceCallsInConferenceFramework])
    {
      int v10 = [MEMORY[0x263F22988] sharedInstance];
      char v11 = [v10 ignoreLogging];

      if ((v11 & 1) == 0)
      {
        uint64_t v12 = [MEMORY[0x263F22988] identifier];
        os_log_type_t v13 = AXLoggerForFacility();

        os_log_type_t v14 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v13, v14))
        {
          uint64_t v15 = AXColorizeFormatLog();
          uint64_t v16 = _AXStringForArgs();
          if (os_log_type_enabled(v13, v14))
          {
            *(_DWORD *)long long buf = 138543362;
            uint64_t v28 = v16;
            _os_log_impl(&dword_22D39A000, v13, v14, "%{public}@", buf, 0xCu);
          }
        }
      }
      +[AXDistributedNotificationHandler postDistributedNotificationWithName:@"AXVisualAlertManagerVideoConferenceCallRingingNotification", IsSpringBoard, v26];
      self->_videoConferenceCallRinging = 1;
    }
    else
    {
      char v17 = objc_msgSend(MEMORY[0x263F22988], "sharedInstance", IsSpringBoard, v26);
      char v18 = [v17 ignoreLogging];

      if ((v18 & 1) == 0)
      {
        os_log_type_t v19 = [MEMORY[0x263F22988] identifier];
        os_log_type_t v20 = AXLoggerForFacility();

        os_log_type_t v21 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v20, v21))
        {
          uint64_t v22 = AXColorizeFormatLog();
          int v23 = _AXStringForArgs();
          if (os_log_type_enabled(v20, v21))
          {
            *(_DWORD *)long long buf = 138543362;
            uint64_t v28 = v23;
            _os_log_impl(&dword_22D39A000, v20, v21, "%{public}@", buf, 0xCu);
          }
        }
      }
      unint64_t alertTypes = self->_alertTypes;
      self->_unint64_t alertTypes = alertTypes | 1;
      [(AXVisualAlertManager *)self _handleBeginVisualAlertForIncomingCall];
      self->_unint64_t alertTypes = alertTypes;
    }
  }
}

- (void)_handleEndVisualAlertForIncomingVideoConferenceCall
{
  if (AXProcessIsSpringBoard()
    && [(AXVisualAlertManager *)self _shouldHandleVisualAlertsForVideoConferenceCallsInConferenceFramework])
  {
    +[AXDistributedNotificationHandler postDistributedNotificationWithName:@"AXVisualAlertManagerVideoConferenceCallHandledNotification"];
    self->_videoConferenceCallRinging = 0;
  }
  else
  {
    [(AXVisualAlertManager *)self _handleEndVisualAlertForIncomingCall];
  }
}

- (void)_handleBeginVisualAlertForAlarmWithSound:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  char v4 = [MEMORY[0x263F22988] sharedInstance];
  char v5 = [v4 ignoreLogging];

  if ((v5 & 1) == 0)
  {
    BOOL v6 = [MEMORY[0x263F22988] identifier];
    os_log_type_t v7 = AXLoggerForFacility();

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v7, v8))
    {
      BOOL v9 = AXColorizeFormatLog();
      int v10 = _AXStringForArgs();
      if (os_log_type_enabled(v7, v8))
      {
        *(_DWORD *)long long buf = 138543362;
        uint64_t v12 = v10;
        _os_log_impl(&dword_22D39A000, v7, v8, "%{public}@", buf, 0xCu);
      }
    }
  }
  if ((self->_alertTypes & 0x20) != 0) {
    [(AXVisualAlertManager *)self _beginVisualAlertForType:32 repeat:1 skipAutomaticStopOnUserInteraction:0 bundleId:0];
  }
}

- (void)_handleEndVisualAlertForAlarm
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  char v4 = [MEMORY[0x263F22988] sharedInstance];
  char v5 = [v4 ignoreLogging];

  if ((v5 & 1) == 0)
  {
    BOOL v6 = [MEMORY[0x263F22988] identifier];
    os_log_type_t v7 = AXLoggerForFacility();

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v7, v8))
    {
      BOOL v9 = AXColorizeFormatLog();
      Name = sel_getName(a2);
      unint64_t alertTypes = self->_alertTypes;
      int v10 = _AXStringForArgs();
      if (os_log_type_enabled(v7, v8))
      {
        *(_DWORD *)long long buf = 138543362;
        os_log_type_t v21 = v10;
        _os_log_impl(&dword_22D39A000, v7, v8, "%{public}@", buf, 0xCu);
      }
    }
  }
  if ((self->_alertTypes & 0x20) != 0)
  {
    char v11 = [MEMORY[0x263F22988] sharedInstance];
    char v12 = [v11 ignoreLogging];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = [MEMORY[0x263F22988] identifier];
      os_log_type_t v14 = AXLoggerForFacility();

      os_log_type_t v15 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = AXColorizeFormatLog();
        char v17 = _AXStringForArgs();
        if (os_log_type_enabled(v14, v15))
        {
          *(_DWORD *)long long buf = 138543362;
          os_log_type_t v21 = v17;
          _os_log_impl(&dword_22D39A000, v14, v15, "%{public}@", buf, 0xCu);
        }
      }
    }
    [(AXVisualAlertManager *)self _endVisualAlert];
  }
}

- (void)_handleVisualAlertForRegularNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((self->_alertTypes & 8) != 0)
  {
    char v5 = [MEMORY[0x263F22988] sharedInstance];
    char v6 = [v5 ignoreLogging];

    if ((v6 & 1) == 0)
    {
      os_log_type_t v7 = [MEMORY[0x263F22988] identifier];
      os_log_type_t v8 = AXLoggerForFacility();

      os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v8, v9))
      {
        int v10 = AXColorizeFormatLog();
        char v11 = _AXStringForArgs();
        if (os_log_type_enabled(v8, v9))
        {
          int v12 = 138543362;
          uint64_t v13 = v11;
          _os_log_impl(&dword_22D39A000, v8, v9, "%{public}@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
    [(AXVisualAlertManager *)self _beginVisualAlertForType:8 repeat:0 skipAutomaticStopOnUserInteraction:0 bundleId:v4];
  }
}

- (void)_handleVisualAlertForExternalApplication
{
  unint64_t alertTypes = self->_alertTypes;
  if ((alertTypes & 0x10) != 0)
  {
    self->_unint64_t alertTypes = alertTypes | 8;
    [(AXVisualAlertManager *)self _handleVisualAlertForRegularNotification:0];
    self->_unint64_t alertTypes = alertTypes;
  }
}

- (void)_handleVisualAlertForIncomingMessage
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ((self->_alertTypes & 4) != 0)
  {
    int v3 = [MEMORY[0x263F22988] sharedInstance];
    char v4 = [v3 ignoreLogging];

    if ((v4 & 1) == 0)
    {
      char v5 = [MEMORY[0x263F22988] identifier];
      char v6 = AXLoggerForFacility();

      os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v6, v7))
      {
        os_log_type_t v8 = AXColorizeFormatLog();
        os_log_type_t v9 = _AXStringForArgs();
        if (os_log_type_enabled(v6, v7))
        {
          int v10 = 138543362;
          char v11 = v9;
          _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
        }
      }
    }
    [(AXVisualAlertManager *)self _beginVisualAlertForType:4 repeat:0];
  }
}

- (void)_handleSecondaryVisualAlertManagerDidStart
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_isDeviceLocked) {
    [(VISAXNotificationHandler *)self->_deviceLockStateChangedNotificationHandler processHandler:sel__handleDeviceWasLocked];
  }
  if (self->_isTorchEnabledInControlCenter) {
    [(VISAXNotificationHandler *)self->_torchInControlCenterWasEnabledNotificationHandler processHandler:sel__handleTorchInControlCenterWasEnabled];
  }
  if (self->_videoConferenceCallRinging && self->_videoConferenceCallExists)
  {
    int v3 = [MEMORY[0x263F22988] sharedInstance];
    char v4 = [v3 ignoreLogging];

    if ((v4 & 1) == 0)
    {
      char v5 = [MEMORY[0x263F22988] identifier];
      char v6 = AXLoggerForFacility();

      os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v6, v7))
      {
        os_log_type_t v8 = AXColorizeFormatLog();
        os_log_type_t v9 = _AXStringForArgs();
        if (os_log_type_enabled(v6, v7))
        {
          int v10 = 138543362;
          char v11 = v9;
          _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
        }
      }
    }
    [(AXVisualAlertManager *)self _handleBeginVisualAlertForIncomingVideoConferenceCall];
  }
}

- (void)_handleVideoConferenceCallRinging
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ((self->_alertTypes & 2) != 0
    && [(AXVisualAlertManager *)self _hasVideoConferenceCameraTorchManager])
  {
    int v3 = [MEMORY[0x263F22988] sharedInstance];
    char v4 = [v3 ignoreLogging];

    if ((v4 & 1) == 0)
    {
      char v5 = [MEMORY[0x263F22988] identifier];
      char v6 = AXLoggerForFacility();

      os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v6, v7))
      {
        os_log_type_t v8 = AXColorizeFormatLog();
        os_log_type_t v9 = _AXStringForArgs();
        if (os_log_type_enabled(v6, v7))
        {
          int v10 = 138543362;
          char v11 = v9;
          _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
        }
      }
    }
    [(AXVisualAlertManager *)self _handleBeginVisualAlertForIncomingVideoConferenceCall];
  }
}

- (void)_handleLockButtonPressed
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263F22988] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    char v5 = [MEMORY[0x263F22988] identifier];
    char v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      os_log_type_t v8 = AXColorizeFormatLog();
      os_log_type_t v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)long long buf = 138543362;
        char v11 = v9;
        _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (!self->_skipAutomaticStopOnUserInteraction) {
    [(AXVisualAlertManager *)self _endVisualAlert];
  }
}

- (void)_handleVolumeChanged
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263F22988] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    char v5 = [MEMORY[0x263F22988] identifier];
    char v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      os_log_type_t v8 = AXColorizeFormatLog();
      os_log_type_t v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v10 = 138543362;
        char v11 = v9;
        _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  [(AXVisualAlertManager *)self _handleLockButtonPressed];
}

- (void)_handleDeviceWasLocked
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263F22988] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    char v5 = [MEMORY[0x263F22988] identifier];
    char v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      os_log_type_t v8 = AXColorizeFormatLog();
      os_log_type_t v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)long long buf = 138543362;
        char v11 = v9;
        _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", buf, 0xCu);
      }
    }
  }
  self->_isDeviceLocked = 1;
}

- (void)_handleDeviceWasUnlocked
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  self->_isDeviceLocked = 0;
  int v3 = [MEMORY[0x263F22988] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    char v5 = [MEMORY[0x263F22988] identifier];
    char v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      os_log_type_t v8 = AXColorizeFormatLog();
      os_log_type_t v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)long long buf = 138543362;
        char v11 = v9;
        _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (!self->_skipAutomaticStopOnUserInteraction) {
    [(AXVisualAlertManager *)self _endVisualAlert];
  }
}

- (void)_handleRingerSwitchToggled
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  self->_BOOL isRingerSwitchSilent = BKSHIDServicesGetRingerState() == 0;
  int v3 = [MEMORY[0x263F22988] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    char v5 = [MEMORY[0x263F22988] identifier];
    char v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      os_log_type_t v8 = AXColorizeFormatLog();
      BOOL isRingerSwitchSilent = self->_isRingerSwitchSilent;
      os_log_type_t v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)long long buf = 138543362;
        os_log_type_t v21 = v9;
        _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (self->_isRingerSwitchSilent)
  {
    int v10 = [MEMORY[0x263F22938] sharedInstance];
    char v11 = [v10 shouldFlashForAlertInSilentMode];

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = [MEMORY[0x263F22988] sharedInstance];
      char v13 = [v12 ignoreLogging];

      if ((v13 & 1) == 0)
      {
        uint64_t v14 = [MEMORY[0x263F22988] identifier];
        os_log_type_t v15 = AXLoggerForFacility();

        os_log_type_t v16 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v15, v16))
        {
          char v17 = AXColorizeFormatLog();
          char v18 = _AXStringForArgs();
          if (os_log_type_enabled(v15, v16))
          {
            *(_DWORD *)long long buf = 138543362;
            os_log_type_t v21 = v18;
            _os_log_impl(&dword_22D39A000, v15, v16, "%{public}@", buf, 0xCu);
          }
        }
      }
      [(AXVisualAlertManager *)self _endVisualAlert];
    }
  }
}

- (void)_handleQuietModeWasEnabled
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263F22988] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    char v5 = [MEMORY[0x263F22988] identifier];
    char v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      os_log_type_t v8 = AXColorizeFormatLog();
      os_log_type_t v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v10 = 138543362;
        char v11 = v9;
        _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  self->_isQuietModeEnabled = 1;
  [(AXVisualAlertManager *)self _endVisualAlert];
}

- (void)_handleQuietModeWasDisabled
{
  self->_isQuietModeEnabled = 0;
}

- (void)_handleTorchInControlCenterWasEnabled
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  self->_isTorchEnabledInControlCenter = 1;
  int v3 = [MEMORY[0x263F22988] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    char v5 = [MEMORY[0x263F22988] identifier];
    char v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      os_log_type_t v8 = AXColorizeFormatLog();
      os_log_type_t v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v10 = 138543362;
        char v11 = v9;
        _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  [(AXVisualAlertManager *)self _endVisualAlert];
}

- (void)_handleTorchInControlCenterWasDisabled
{
  self->_isTorchEnabledInControlCenter = 0;
}

- (void)_handleCaptureSessionDidStartRunning
{
  self->_captureSessionRunning = 1;
}

- (void)_handleCaptureSessionDidStopRunning
{
  self->_captureSessionRunning = 0;
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __59__AXVisualAlertManager__handleCaptureSessionDidStopRunning__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) _typeToUseForVisualAlertAfterCaptureSessionStopsRunning];
  if (result)
  {
    uint64_t v3 = result;
    char v4 = [MEMORY[0x263F22988] sharedInstance];
    char v5 = [v4 ignoreLogging];

    if ((v5 & 1) == 0)
    {
      char v6 = [MEMORY[0x263F22988] identifier];
      os_log_type_t v7 = AXLoggerForFacility();

      os_log_type_t v8 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v7, v8))
      {
        os_log_type_t v9 = AXColorizeFormatLog();
        int v10 = _AXStringForArgs();
        if (os_log_type_enabled(v7, v8))
        {
          int v11 = 138543362;
          uint64_t v12 = v10;
          _os_log_impl(&dword_22D39A000, v7, v8, "%{public}@", (uint8_t *)&v11, 0xCu);
        }
      }
    }
    [*(id *)(a1 + 32) _beginVisualAlertForType:v3 repeat:1];
    return [*(id *)(a1 + 32) _setTypeToUseForVisualAlertAfterCaptureSessionStopsRunning:0];
  }
  return result;
}

- (void)_insertCustomLogicForSystemWideServer
{
  id v2 = [MEMORY[0x263F229D0] sharedInstance];
  [v2 performValidations:&__block_literal_global_774 withPreValidationHandler:&__block_literal_global_809 postValidationHandler:&__block_literal_global_818 safeCategoryInstallationHandler:&__block_literal_global_821];
}

uint64_t __61__AXVisualAlertManager__insertCustomLogicForSystemWideServer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"BBSound"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BBBulletin", @"sectionID", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBControlCenterController", @"sharedInstanceIfExists", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBLockScreenManager", @"sharedInstanceIfExists", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"isUILocked", "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"SBPrototypeController", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBPrototypeController", @"rootSettings", "@", 0);
  [v2 validateClass:@"SpringBoard" hasInstanceVariable:@"_sensorActivityDataProvider" withType:"SBSensorActivityDataProvider"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSensorActivityDataProvider", @"activeCameraAndMicrophoneActivityAttributions", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSensorActivityAttribution", @"sensor", "q", 0);

  return 1;
}

uint64_t __61__AXVisualAlertManager__insertCustomLogicForSystemWideServer__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AXVisualAlerts"];
  [v2 setOverrideProcessName:@"Visual Alerts"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __61__AXVisualAlertManager__insertCustomLogicForSystemWideServer__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"AXVisualAlertSBNCSoundController" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXVisualAlertSBNCScreenController" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AXVisualAlertSBUIFlashlightController" canInteractWithTargetClass:1];
}

- (id)_normalizedStrobePatternForOriginalPattern:(id)a3
{
  id v3 = a3;
  char v4 = [v3 objectForKey:@"StrobePattern"];

  char v5 = v3;
  if (!v4)
  {
    char v6 = [v3 objectForKey:@"VibePattern"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      os_log_type_t v7 = [v3 objectForKey:@"OnDuration"];
      os_log_type_t v8 = [v3 objectForKey:@"OffDuration"];
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        [v7 doubleValue];
        uint64_t v10 = (int)(v9 * 1000.0);
        [v8 doubleValue];
        unsigned int v20 = (int)(v11 * 1000.0);
        uint64_t v12 = (void *)MEMORY[0x263EFF8C0];
        uint64_t v13 = [NSNumber numberWithBool:1];
        uint64_t v14 = [NSNumber numberWithInt:v10];
        os_log_type_t v15 = [NSNumber numberWithBool:0];
        os_log_type_t v16 = [NSNumber numberWithInt:v20];
        uint64_t v17 = objc_msgSend(v12, "arrayWithObjects:", v13, v14, v15, v16, 0);

        char v6 = (void *)v13;
      }
      else
      {
        uint64_t v17 = 0;
      }

      char v6 = (void *)v17;
    }
    char v5 = v3;
    if (v6)
    {
      char v18 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v3];
      [v18 setObject:v6 forKey:@"StrobePattern"];
      [v18 removeObjectForKey:@"VibePattern"];
      [v18 removeObjectForKey:@"OnDuration"];
      [v18 removeObjectForKey:@"OffDuration"];
      char v5 = [NSDictionary dictionaryWithDictionary:v18];
    }
  }

  return v5;
}

- (BOOL)_hasVideoConferenceCameraTorchManager
{
  asyncManagerAdapter = self->_asyncManagerAdapter;
  if (asyncManagerAdapter)
  {
    id v3 = (void *)MEMORY[0x263F086E0];
    char v4 = [(AXCameraTorchManagerBackgroundAdapter *)asyncManagerAdapter synchronousTorchManager];
    char v5 = [v3 bundleForClass:objc_opt_class()];
    char v6 = [v5 bundleIdentifier];
    char v7 = [v6 isEqualToString:@"com.apple.AVConference"];

    LOBYTE(asyncManagerAdapter) = v7;
  }
  return (char)asyncManagerAdapter;
}

- (BOOL)_supportsVisualAlertsForVideoConferenceCalls
{
  if (_supportsVisualAlertsForVideoConferenceCalls__AXVisualAlertManagerHasLegacySOCOnceToken != -1) {
    dispatch_once(&_supportsVisualAlertsForVideoConferenceCalls__AXVisualAlertManagerHasLegacySOCOnceToken, &__block_literal_global_833);
  }
  return (_supportsVisualAlertsForVideoConferenceCalls__AXVisualAlertManagerHasLegacySOC & 1) == 0;
}

uint64_t __68__AXVisualAlertManager__supportsVisualAlertsForVideoConferenceCalls__block_invoke()
{
  mach_port_t v0 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v1 = IOServiceMatching("AppleH3CamIn");
  uint64_t result = IOServiceGetMatchingService(v0, v1);
  if (result)
  {
    _supportsVisualAlertsForVideoConferenceCalls__AXVisualAlertManagerHasLegacySOC = 1;
    return IOObjectRelease(result);
  }
  return result;
}

- (BOOL)_shouldHandleVisualAlertsForVideoConferenceCallsInConferenceFramework
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_isDeviceLocked || !self->_videoConferenceCallRinging)
  {
    return [(AXVisualAlertManager *)self _supportsVisualAlertsForVideoConferenceCalls];
  }
  else
  {
    id v3 = [MEMORY[0x263F22988] sharedInstance];
    char v4 = [v3 ignoreLogging];

    if ((v4 & 1) == 0)
    {
      char v5 = [MEMORY[0x263F22988] identifier];
      char v6 = AXLoggerForFacility();

      os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v6, v7))
      {
        os_log_type_t v8 = AXColorizeFormatLog();
        double v9 = _AXStringForArgs();
        if (os_log_type_enabled(v6, v7))
        {
          int v10 = 138543362;
          double v11 = v9;
          _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
        }
      }
    }
    return 0;
  }
}

- (BOOL)_isTorchEnabledInControlCenter
{
  return self->_isTorchEnabledInControlCenter;
}

- (int)ringerStateNotifyToken
{
  return self->_ringerStateNotifyToken;
}

- (void)setRingerStateNotifyToken:(int)a3
{
  self->_ringerStateNotifyToken = a3;
}

- (NSDictionary)_activePattern
{
  return self->_activePattern;
}

- (void)_setActivePattern:(id)a3
{
}

- (unint64_t)_typeToUseForVisualAlertAfterCaptureSessionStopsRunning
{
  return self->_typeToUseForVisualAlertAfterCaptureSessionStopsRunning;
}

- (void)_setTypeToUseForVisualAlertAfterCaptureSessionStopsRunning:(unint64_t)a3
{
  self->_typeToUseForVisualAlertAfterCaptureSessionStopsRunning = a3;
}

- (BOOL)_isTorchDeviceOpen
{
  return self->_torchDeviceOpen;
}

- (BOOL)_isTorchDeviceOn
{
  return self->_torchDeviceOn;
}

- (AXCameraTorchManagerBackgroundAdapter)_asyncManagerAdapter
{
  return self->_asyncManagerAdapter;
}

- (DNDStateService)disturbanceService
{
  return self->disturbanceService;
}

- (void)setDisturbanceService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->disturbanceService, 0);
  objc_storeStrong((id *)&self->_asyncManagerAdapter, 0);
  objc_storeStrong((id *)&self->_bulletins, 0);
  objc_storeStrong((id *)&self->_torchInControlCenterWasEnabledNotificationHandler, 0);
  objc_storeStrong((id *)&self->_deviceLockStateChangedNotificationHandler, 0);
  objc_storeStrong((id *)&self->_notificationHandlers, 0);
  objc_storeStrong((id *)&self->_patternToUseForVisualAlertAfterCaptureSessionStopsRunning, 0);
  objc_storeStrong((id *)&self->_activePattern, 0);
  objc_storeStrong((id *)&self->_patterns, 0);
  objc_storeStrong((id *)&self->_torchForceShutdownTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)_springBoardLockStateChange:.cold.1()
{
  mach_port_t v0 = [MEMORY[0x263F08690] currentHandler];
  CFDictionaryRef v1 = [NSString stringWithUTF8String:"NSString *getkSBNotificationKeyDeviceLockState(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXVisualAlertManager.m", 86, @"%s", dlerror());

  __break(1u);
}

- (void)_startForAlertTypes:cameraTorchManager:.cold.1()
{
  mach_port_t v0 = [MEMORY[0x263F08690] currentHandler];
  CFDictionaryRef v1 = [NSString stringWithUTF8String:"NSString *getSBLockButtonPressedNotification(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXVisualAlertManager.m", 85, @"%s", dlerror());

  __break(1u);
}

- (void)_startForAlertTypes:cameraTorchManager:.cold.2()
{
  mach_port_t v0 = [MEMORY[0x263F08690] currentHandler];
  CFDictionaryRef v1 = [NSString stringWithUTF8String:"NSString *getSBVolumeButtonPressedNotification(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXVisualAlertManager.m", 82, @"%s", dlerror());

  __break(1u);
}

- (void)_startForAlertTypes:cameraTorchManager:.cold.3()
{
  mach_port_t v0 = [MEMORY[0x263F08690] currentHandler];
  CFDictionaryRef v1 = [NSString stringWithUTF8String:"NSString *getSBDeviceLockStateChangedNotification(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXVisualAlertManager.m", 84, @"%s", dlerror());

  __break(1u);
}

- (void)_startForAlertTypes:cameraTorchManager:.cold.4()
{
  mach_port_t v0 = [MEMORY[0x263F08690] currentHandler];
  CFDictionaryRef v1 = [NSString stringWithUTF8String:"NSString *getSBRingerChangedNotification(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXVisualAlertManager.m", 83, @"%s", dlerror());

  __break(1u);
}

@end