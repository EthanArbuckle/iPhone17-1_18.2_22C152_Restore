@interface SBLowPowerAlertItem
+ (BOOL)_shouldIgnoreChangeToBatteryLevel:(unsigned int)a3;
+ (unsigned)_thresholdForLevel:(unsigned int)a3;
+ (void)initialize;
+ (void)setBatteryLevel:(unsigned int)a3;
- (BOOL)_isLowPowerModeEnabled;
- (BOOL)_supportsLowPowerMode;
- (BOOL)hasEnableLowPowerModeAction;
- (BOOL)shouldShowInEmergencyCall;
- (BOOL)shouldShowInLockScreen;
- (BOOL)showFindMyAlert;
- (SBLowPowerAlertItem)init;
- (SBLowPowerAlertItem)initWithLevel:(unsigned int)a3;
- (SPBeaconManager)beaconManager;
- (id)_batteryPercentageString;
- (id)_createSystemApertureElement;
- (id)_enableLowPowerModeActionTitle;
- (id)_lowBatteryTitle;
- (void)_didDeactivateForDismissAction;
- (void)_enableLowPowerMode;
- (void)_enableLowPowerModeActionTriggered;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)didDeactivateForReason:(int)a3;
- (void)setBeaconManager:(id)a3;
- (void)setHasEnableLowPowerModeAction:(BOOL)a3;
- (void)setShowFindMyAlert:(BOOL)a3;
@end

@implementation SBLowPowerAlertItem

+ (void)setBatteryLevel:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ((objc_msgSend(a1, "_shouldIgnoreChangeToBatteryLevel:") & 1) == 0)
  {
    unsigned int v5 = [a1 _thresholdForLevel:v3];
    int v6 = __LastWarnThreshold;
    v7 = +[SBAlertItemsController sharedInstance];
    if (v5 == v6)
    {
      v8 = [v7 alertItemsOfClass:objc_opt_class()];

      if (v8 && [v8 count])
      {
        v9 = [v8 allObjects];
        v10 = [v9 firstObject];
        uint64_t v11 = objc_opt_class();
        id v12 = v10;
        if (v11)
        {
          if (objc_opt_isKindOfClass()) {
            v13 = v12;
          }
          else {
            v13 = 0;
          }
        }
        else
        {
          v13 = 0;
        }
        id v28 = v13;

        v29 = [v28 _existingSystemApertureElement];

        uint64_t v30 = objc_opt_class();
        id v31 = v29;
        if (v30)
        {
          if (objc_opt_isKindOfClass()) {
            v32 = v31;
          }
          else {
            v32 = 0;
          }
        }
        else
        {
          v32 = 0;
        }
        id v33 = v32;

        [v33 setBatteryPercentage:(double)v3 / 100.0];
      }

      goto LABEL_29;
    }
    [v7 deactivateAlertItemsOfClass:objc_opt_class()];

    v14 = +[SBDefaults localDefaults];
    v15 = [v14 powerDefaults];
    int v16 = [v15 hideLowPowerAlerts];

    if (v5 <= 1 && v5 < __LastWarnThreshold)
    {
      if (__LastBatteryLevel == 100)
      {
        v17 = +[SBUIController sharedInstance];
        int v18 = [v17 isBatteryCharging];

        if ((v18 | v16)) {
          goto LABEL_29;
        }
LABEL_15:
        v19 = [[SBLowPowerAlertItem alloc] initWithLevel:__WarnLevelThresholds[v5]];
        id v20 = objc_alloc_init(MEMORY[0x1E4F97C08]);
        [(SBLowPowerAlertItem *)v19 setBeaconManager:v20];
        uint64_t v34 = MEMORY[0x1E4F143A8];
        uint64_t v35 = 3221225472;
        v36 = __39__SBLowPowerAlertItem_setBatteryLevel___block_invoke;
        v37 = &unk_1E6AFAC80;
        BOOL v39 = v5 == 0;
        v21 = v19;
        v38 = v21;
        [v20 userHasAcknowledgeFindMyWithCompletion:&v34];
        v22 = +[SBAlertItemsController sharedInstance];
        [v22 activateAlertItem:v21];

        if (!v5)
        {
          v23 = +[SBTelephonyManager sharedTelephonyManager];
          int v24 = [v23 inCall];

          if (v24) {
            AudioServicesPlaySystemSoundWithCompletion(0x3EEu, 0);
          }
        }
        v25 = +[SBModelessSyncController sharedInstance];
        int v26 = [v25 isSyncing];

        if (v26)
        {
          v27 = +[SBModelessSyncController sharedInstance];
          [v27 gotLowBatteryWarning];
        }
        goto LABEL_29;
      }
      if ((v16 & 1) == 0) {
        goto LABEL_15;
      }
    }
LABEL_29:
    __LastBatteryLevel = v3;
    __LastWarnThreshold = v5;
  }
}

+ (unsigned)_thresholdForLevel:(unsigned int)a3
{
  unsigned int result = 2;
  do
  {
    if (__WarnLevelThresholds[result - 1] < a3) {
      break;
    }
    --result;
  }
  while (result);
  return result;
}

+ (BOOL)_shouldIgnoreChangeToBatteryLevel:(unsigned int)a3
{
  v4 = +[SBUIController sharedInstance];
  int v5 = [v4 isBatteryCharging];
  unsigned int v6 = __LastBatteryLevel;

  if (v5) {
    BOOL v7 = v6 > a3;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    BOOL v11 = __LastBatteryLevel - a3 >= 3;
  }
  else
  {
    v8 = [MEMORY[0x1E4F4F7D0] sharedInstance];
    char v9 = [v8 hasGasGauge];

    if (v9) {
      return 0;
    }
    unsigned int v12 = __LastBatteryLevel - a3;
    if ((int)(__LastBatteryLevel - a3) < 0) {
      unsigned int v12 = a3 - __LastBatteryLevel;
    }
    BOOL v11 = v12 >= 2;
  }
  return !v11;
}

- (SBLowPowerAlertItem)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBLowPowerAlertItem;
  v2 = [(SBAlertItem *)&v5 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(SBAlertItem *)v2 setAllowInSetup:1];
    [(SBAlertItem *)v3 setAllowInCar:1];
    [(SBAlertItem *)v3 setAllowMessageInCar:0];
  }
  return v3;
}

- (SBLowPowerAlertItem)initWithLevel:(unsigned int)a3
{
  v4 = [(SBLowPowerAlertItem *)self init];
  objc_super v5 = v4;
  if (v4)
  {
    v4->_talkLevel = a3;
    [(SBLowPowerAlertItem *)v4 setShowFindMyAlert:0];
  }
  return v5;
}

+ (void)initialize
{
  uint64_t v2 = [MEMORY[0x1E4F42E28] lowBatteryLevel];
  if (v2 >= 0) {
    unint64_t v3 = v2;
  }
  else {
    unint64_t v3 = v2 + 1;
  }
  __WarnLevelThresholds[0] = v3 >> 1;
  *(_DWORD *)algn_1EBE258CC = v2;
}

void __39__SBLowPowerAlertItem_setBatteryLevel___block_invoke(uint64_t a1, char a2)
{
  if (*(unsigned char *)(a1 + 40)) {
    char v2 = a2 ^ 1;
  }
  else {
    char v2 = 0;
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__SBLowPowerAlertItem_setBatteryLevel___block_invoke_2;
  v3[3] = &unk_1E6AF5D38;
  id v4 = *(id *)(a1 + 32);
  char v5 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __39__SBLowPowerAlertItem_setBatteryLevel___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setBeaconManager:0];
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  return [v2 setShowFindMyAlert:v3];
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  unsigned int v6 = [(SBAlertItem *)self alertController];
  BOOL v7 = [(SBLowPowerAlertItem *)self _lowBatteryTitle];
  [v6 setTitle:v7];

  v8 = [(SBLowPowerAlertItem *)self _batteryPercentageString];
  char v9 = NSString;
  v10 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v11 = [v10 localizedStringForKey:@"LOW_BATT_MSG_LEVEL" value:&stru_1F3084718 table:@"SpringBoard"];
  unsigned int v12 = objc_msgSend(v9, "stringWithFormat:", v11, v8);

  v13 = +[SBModelessSyncController sharedInstance];
  if ([v13 isSyncing])
  {
    if ([v13 isWirelessSyncing])
    {
      if ([v13 isAutoSyncing]) {
        v14 = @"AUTO_%@_SYNC_LOW_POWER";
      }
      else {
        v14 = @"%@_SYNC_LOW_POWER";
      }
    }
    else
    {
      v14 = @"SYNC_LOW_POWER";
    }
    int v15 = MGGetBoolAnswer();
    int v16 = @"WIFI";
    if (v15) {
      int v16 = @"WLAN";
    }
    v17 = objc_msgSend(NSString, "stringWithFormat:", v14, v16);
    int v18 = [MEMORY[0x1E4F28B50] mainBundle];
    v19 = [v18 localizedStringForKey:v17 value:&stru_1F3084718 table:@"SpringBoard"];
    uint64_t v20 = [v12 stringByAppendingFormat:@" %@", v19];

    unsigned int v12 = (void *)v20;
  }
  [v6 setMessage:v12];
  if (!a3)
  {
    if ([(SBLowPowerAlertItem *)self _supportsLowPowerMode]
      && ![(SBLowPowerAlertItem *)self _isLowPowerModeEnabled])
    {
      v22 = (void *)MEMORY[0x1E4F42720];
      v23 = [(SBLowPowerAlertItem *)self _enableLowPowerModeActionTitle];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __59__SBLowPowerAlertItem_configure_requirePasscodeForActions___block_invoke;
      v30[3] = &unk_1E6AF4918;
      v30[4] = self;
      int v24 = [v22 actionWithTitle:v23 style:0 handler:v30];
      [v6 addAction:v24];

      uint64_t v21 = 1;
    }
    else
    {
      uint64_t v21 = 0;
    }
    [(SBLowPowerAlertItem *)self setHasEnableLowPowerModeAction:v21];
    v25 = (void *)MEMORY[0x1E4F42720];
    int v26 = [MEMORY[0x1E4F28B50] mainBundle];
    v27 = [v26 localizedStringForKey:@"CLOSE" value:&stru_1F3084718 table:@"SpringBoard"];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __59__SBLowPowerAlertItem_configure_requirePasscodeForActions___block_invoke_2;
    v29[3] = &unk_1E6AF4918;
    v29[4] = self;
    id v28 = [v25 actionWithTitle:v27 style:v21 handler:v29];
    [v6 addAction:v28];
  }
}

uint64_t __59__SBLowPowerAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableLowPowerModeActionTriggered];
}

uint64_t __59__SBLowPowerAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) deactivateForButton];
  char v2 = *(void **)(a1 + 32);
  return [v2 _didDeactivateForDismissAction];
}

- (void)didDeactivateForReason:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBLowPowerAlertItem;
  -[SBAlertItem didDeactivateForReason:](&v5, sel_didDeactivateForReason_);
  if (a3 != 3) {
    [(SBLowPowerAlertItem *)self _didDeactivateForDismissAction];
  }
}

- (id)_createSystemApertureElement
{
  BOOL v3 = [(SBLowPowerAlertItem *)self _isLowPowerModeEnabled];
  uint64_t v4 = [(SBLowPowerAlertItem *)self _supportsLowPowerMode] & !v3;
  if (v4 == 1)
  {
    objc_initWeak(&location, self);
    objc_super v5 = (void *)MEMORY[0x1E4F426E8];
    unsigned int v6 = [(SBLowPowerAlertItem *)self _enableLowPowerModeActionTitle];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __51__SBLowPowerAlertItem__createSystemApertureElement__block_invoke;
    int v15 = &unk_1E6AF9818;
    objc_copyWeak(&v16, &location);
    BOOL v7 = [v5 actionWithTitle:v6 image:0 identifier:0 handler:&v12];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v7 = 0;
  }
  -[SBLowPowerAlertItem setHasEnableLowPowerModeAction:](self, "setHasEnableLowPowerModeAction:", v4, v12, v13, v14, v15);
  v8 = [SBPowerAlertElement alloc];
  LODWORD(v9) = self->_talkLevel;
  v10 = [(SBPowerAlertElement *)v8 initWithIdentifier:self style:1 batteryPercentage:v3 lowPowerModeEnabled:v7 action:(double)v9 / 100.0];

  return v10;
}

void __51__SBLowPowerAlertItem__createSystemApertureElement__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _enableLowPowerModeActionTriggered];
}

- (void)_enableLowPowerModeActionTriggered
{
  ADClientAddValueForScalarKey();
  [(SBLowPowerAlertItem *)self _enableLowPowerMode];
  [(SBAlertItem *)self deactivateForButton];
  if ([(SBLowPowerAlertItem *)self showFindMyAlert])
  {
    +[SBLowPowerFindMyAlertItem showFindMyAlert];
  }
}

- (void)_didDeactivateForDismissAction
{
  if ([(SBLowPowerAlertItem *)self hasEnableLowPowerModeAction]) {
    ADClientAddValueForScalarKey();
  }
  if ([(SBLowPowerAlertItem *)self showFindMyAlert])
  {
    +[SBLowPowerFindMyAlertItem showFindMyAlert];
  }
}

- (void)_enableLowPowerMode
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15;
  BOOL v11 = __Block_byref_object_dispose__15;
  id v12 = [MEMORY[0x1E4F73140] sharedInstance];
  char v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Enabling low power mode", buf, 2u);
  }

  BOOL v3 = (void *)v8[5];
  uint64_t v4 = *MEMORY[0x1E4F73150];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SBLowPowerAlertItem__enableLowPowerMode__block_invoke;
  v5[3] = &unk_1E6AFACA8;
  v5[4] = &v7;
  [v3 setPowerMode:1 fromSource:v4 withCompletion:v5];
  _Block_object_dispose(&v7, 8);
}

void __42__SBLowPowerAlertItem__enableLowPowerMode__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unsigned int v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109378;
    v9[1] = a2;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Switch to LPM complete. Success=%d error: %@", (uint8_t *)v9, 0x12u);
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

- (BOOL)shouldShowInLockScreen
{
  char v2 = [(id)SBApp notificationDispatcher];
  char v3 = [v2 isCarDestinationActive];

  return v3;
}

- (BOOL)shouldShowInEmergencyCall
{
  return 1;
}

- (id)_lowBatteryTitle
{
  char v2 = [(id)SBApp notificationDispatcher];
  int v3 = [v2 isCarDestinationActive];

  uint64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
  id v5 = v4;
  if (v3) {
    unsigned int v6 = @"PHONE_LOW_BATT_TITLE";
  }
  else {
    unsigned int v6 = @"LOW_BATT_TITLE";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_1F3084718 table:@"SpringBoard"];

  return v7;
}

- (id)_batteryPercentageString
{
  int v3 = (void *)SBApp;
  LODWORD(v2) = self->_talkLevel;
  uint64_t v4 = [NSNumber numberWithDouble:(double)v2 / 100.0];
  id v5 = [v3 formattedPercentStringForNumber:v4];

  return v5;
}

- (BOOL)_supportsLowPowerMode
{
  return MGGetBoolAnswer();
}

- (BOOL)_isLowPowerModeEnabled
{
  unint64_t v2 = [MEMORY[0x1E4F73140] sharedInstance];
  BOOL v3 = [v2 getPowerMode] == 1;

  return v3;
}

- (id)_enableLowPowerModeActionTitle
{
  unint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"ENABLE_LOW_POWER" value:&stru_1F3084718 table:@"SpringBoard"];

  return v3;
}

- (BOOL)showFindMyAlert
{
  return self->_showFindMyAlert;
}

- (void)setShowFindMyAlert:(BOOL)a3
{
  self->_showFindMyAlert = a3;
}

- (BOOL)hasEnableLowPowerModeAction
{
  return self->_hasEnableLowPowerModeAction;
}

- (void)setHasEnableLowPowerModeAction:(BOOL)a3
{
  self->_hasEnableLowPowerModeAction = a3;
}

- (SPBeaconManager)beaconManager
{
  return self->_beaconManager;
}

- (void)setBeaconManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end