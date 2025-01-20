@interface SBNCScreenController
- (BOOL)_isDeviceUILocked;
- (BOOL)canTurnOnScreenForNotificationRequest:(id)a3;
- (BOOL)turnOnScreenForOutOfPocketEvent;
- (CMPocketStateManager)pocketStateManager;
- (NSString)powerAssertionName;
- (SBBacklightController)backlightController;
- (SBLockScreenManager)lockScreenManager;
- (SBLockStateAggregator)lockStateAggregator;
- (SBNCScreenController)init;
- (SBNCScreenController)initWithBackLightController:(id)a3 lockScreenManager:(id)a4 lockStateAggregator:(id)a5;
- (unsigned)powerAssertionID;
- (void)_cancelTurnOnScreenForOutOfPocketEvents;
- (void)_createOrResetPowerAssertionWithTimeout:(double)a3;
- (void)_releasePowerAssertion;
- (void)_turnOnScreen;
- (void)_turnOnScreenForOutOfPocketEventBeforeTimeInterval:(double)a3;
- (void)_turnOnScreenForOutOfPocketEventIfNecessary;
- (void)_turnOnScreenForPocketMode;
- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4;
- (void)resetAutomaticLockStateForNotificationRequest:(id)a3;
- (void)setBacklightController:(id)a3;
- (void)setLockScreenManager:(id)a3;
- (void)setLockStateAggregator:(id)a3;
- (void)setPocketStateManager:(id)a3;
- (void)setPowerAssertionID:(unsigned int)a3;
- (void)setPowerAssertionName:(id)a3;
- (void)setTurnOnScreenForOutOfPocketEvent:(BOOL)a3;
- (void)turnOnScreenForNotificationRequest:(id)a3;
- (void)turnOnScreenIfPossibleForNotificationRequest:(id)a3;
@end

@implementation SBNCScreenController

- (SBNCScreenController)init
{
  return 0;
}

- (SBNCScreenController)initWithBackLightController:(id)a3 lockScreenManager:(id)a4 lockStateAggregator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBNCScreenController;
  v12 = [(SBNCScreenController *)&v16 init];
  if (v12)
  {
    v13 = (CMPocketStateManager *)objc_alloc_init(MEMORY[0x1E4F22268]);
    pocketStateManager = v12->_pocketStateManager;
    v12->_pocketStateManager = v13;

    [(CMPocketStateManager *)v12->_pocketStateManager setDelegate:v12];
    v12->_powerAssertionID = 0;
    objc_storeStrong((id *)&v12->_backlightController, a3);
    objc_storeStrong((id *)&v12->_lockScreenManager, a4);
    objc_storeStrong((id *)&v12->_lockStateAggregator, a5);
  }

  return v12;
}

- (BOOL)canTurnOnScreenForNotificationRequest:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 options];
  int v6 = [(id)v5 canTurnOnDisplay];

  LODWORD(v5) = [(id)SBApp caseIsEnabledAndLatched];
  v7 = [(SBNCScreenController *)self lockScreenManager];
  int v8 = v6 & ((v5 | [v7 isInLostMode]) ^ 1);

  BOOL v9 = [(SBNCScreenController *)self _isDeviceUILocked];
  id v10 = (void *)MEMORY[0x1E4FB3848];
  id v11 = (void *)MEMORY[0x1E4FB3860];
  if (v9)
  {
    v12 = [v4 options];
    int v13 = [v12 alertsWhenLocked];

    v14 = [v4 requestDestinations];
    int v15 = v13 & [v14 containsObject:*v11];
  }
  else
  {
    v14 = [v4 requestDestinations];
    int v15 = [v14 containsObject:*v10];
  }

  int v16 = v8 & v15;
  v17 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    log = v17;
    v33 = [v4 notificationIdentifier];
    v18 = objc_msgSend(v33, "un_logDigest");
    v32 = [v4 options];
    int v29 = [v32 canTurnOnDisplay];
    int v28 = [(id)SBApp caseIsEnabledAndLatched];
    v30 = [(SBNCScreenController *)self lockScreenManager];
    int v19 = [v30 isInLostMode];
    BOOL v20 = [(SBNCScreenController *)self _isDeviceUILocked];
    v21 = [v4 options];
    int v22 = [v21 alertsWhenLocked];
    v23 = [v4 requestDestinations];
    int v24 = [v23 containsObject:*v11];
    v25 = [v4 requestDestinations];
    int v26 = [v25 containsObject:*MEMORY[0x1E4FB3848]];
    *(_DWORD *)buf = 138545666;
    v35 = v18;
    __int16 v36 = 1024;
    int v37 = v16;
    __int16 v38 = 1024;
    BOOL v39 = v4 != 0;
    __int16 v40 = 1024;
    int v41 = v29;
    __int16 v42 = 1024;
    int v43 = v28;
    __int16 v44 = 1024;
    int v45 = v19;
    __int16 v46 = 1024;
    BOOL v47 = v20;
    __int16 v48 = 1024;
    int v49 = v22;
    __int16 v50 = 1024;
    int v51 = v24;
    __int16 v52 = 1024;
    int v53 = v26;
    _os_log_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEFAULT, "Screen can be turned on for notification %{public}@: %d [ hasRequest: %d canTurnOnDisplay: %d caseIsEnabledAndLatched: %d isInLostMode: %d isDeviceUILocked: %d alertsWhenLocked: %d sentToLockScreenDestination: %d sentToBannerDestination: %d ]", buf, 0x42u);
  }
  return v16;
}

- (void)turnOnScreenForNotificationRequest:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = v5;
    v7 = [v4 notificationIdentifier];
    int v8 = objc_msgSend(v7, "un_logDigest");
    BOOL v9 = [v4 options];
    int v10 = [v9 overridesPocketMode];
    id v11 = [(SBNCScreenController *)self backlightController];
    int v15 = 138543874;
    int v16 = v8;
    __int16 v17 = 1024;
    int v18 = v10;
    __int16 v19 = 1024;
    int v20 = [v11 screenIsOn];
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Turn on screen for notification %{public}@ [ overridesPocketMode: %d screenIsOn: %d ]", (uint8_t *)&v15, 0x18u);
  }
  v12 = [v4 options];
  if ([v12 overridesPocketMode])
  {
  }
  else
  {
    int v13 = [(SBNCScreenController *)self backlightController];
    char v14 = [v13 screenIsOn];

    if ((v14 & 1) == 0)
    {
      [(SBNCScreenController *)self _turnOnScreenForPocketMode];
      goto LABEL_8;
    }
  }
  [(SBNCScreenController *)self _turnOnScreen];
LABEL_8:
}

- (void)turnOnScreenIfPossibleForNotificationRequest:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBNCScreenController *)self canTurnOnScreenForNotificationRequest:v4])
  {
    uint64_t v5 = [v4 alertOptions];
    int v6 = [v5 shouldSuppress];

    if (v6)
    {
      v7 = (void *)*MEMORY[0x1E4FB3750];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = v7;
        BOOL v9 = [v4 notificationIdentifier];
        int v10 = objc_msgSend(v9, "un_logDigest");
        int v11 = 138543362;
        v12 = v10;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Screen cannot be turned on for notification %{public}@ because DND suppressed it", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      [(SBNCScreenController *)self turnOnScreenForNotificationRequest:v4];
    }
  }
}

- (void)resetAutomaticLockStateForNotificationRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 options];
  int v6 = [v5 preventsAutomaticLock];

  if (v6)
  {
    v7 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = v7;
      BOOL v9 = [v4 notificationIdentifier];
      int v10 = objc_msgSend(v9, "un_logDigest");
      int v12 = 138543362;
      uint64_t v13 = v10;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Reset idle timer for notification %{public}@", (uint8_t *)&v12, 0xCu);
    }
    int v11 = +[SBIdleTimerGlobalCoordinator sharedInstance];
    [v11 resetIdleTimerIfNonConsecutiveSource:self forReason:@"NCNotificationRequest"];
  }
}

- (void)_turnOnScreen
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(SBNCScreenController *)self _isDeviceUILocked])
  {
    v3 = [(SBNCScreenController *)self backlightController];
    uint64_t v4 = [v3 screenIsOn] ^ 1;

    uint64_t v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Reset idle timer [ doFadeIn: %d ]", buf, 8u);
    }

    int v6 = [(SBNCScreenController *)self lockScreenManager];
    v7 = objc_msgSend(NSNumber, "numberWithBool:", 1, @"SBUIUnlockOptionsTurnOnScreenFirstKey");
    v12[0] = v7;
    v11[1] = @"SBUIUnlockOptionsStartFadeInAnimation";
    int v8 = [NSNumber numberWithBool:v4];
    v12[1] = v8;
    BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    [v6 unlockUIFromSource:10 withOptions:v9];
  }
  else
  {
    int v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Reset idle timer", buf, 2u);
    }
  }

  int v10 = +[SBIdleTimerGlobalCoordinator sharedInstance];
  [v10 resetIdleTimerIfNonConsecutiveSource:self forReason:@"NCNotificationTurnOnScreen"];
}

- (void)_turnOnScreenForPocketMode
{
  v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "PocketStateManager: query state", buf, 2u);
  }

  uint64_t v4 = [(SBNCScreenController *)self pocketStateManager];
  uint64_t v5 = [(SBNCScreenController *)self backlightController];
  [v5 defaultLockScreenDimIntervalWhenNotificationsPresent];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__SBNCScreenController__turnOnScreenForPocketMode__block_invoke;
  v6[3] = &unk_1E6AF90C8;
  v6[4] = self;
  objc_msgSend(v4, "queryStateOntoQueue:andMonitorFor:withTimeout:andHandler:", MEMORY[0x1E4F14428], v6);
}

void __50__SBNCScreenController__turnOnScreenForPocketMode__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    uint64_t v8 = a2;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "PocketStateManager: query responded with state: %ld", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = *(void **)(a1 + 32);
  if ((a2 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    int v6 = [v5 backlightController];
    [v6 defaultLockScreenDimIntervalWhenNotificationsPresent];
    objc_msgSend(v5, "_turnOnScreenForOutOfPocketEventBeforeTimeInterval:");
  }
  else
  {
    [v5 _turnOnScreen];
  }
}

- (BOOL)_isDeviceUILocked
{
  v2 = [(SBNCScreenController *)self lockStateAggregator];
  char v3 = [v2 hasAnyLockState];

  return v3;
}

- (void)_turnOnScreenForOutOfPocketEventBeforeTimeInterval:(double)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    double v7 = a3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "PocketStateManager: turn on screen for out of pocket event before %lf", (uint8_t *)&v6, 0xCu);
  }

  self->_turnOnScreenForOutOfPocketEvent = 1;
  [(SBNCScreenController *)self _createOrResetPowerAssertionWithTimeout:a3];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__cancelTurnOnScreenForOutOfPocketEvents object:0];
  [(SBNCScreenController *)self performSelector:sel__cancelTurnOnScreenForOutOfPocketEvents withObject:0 afterDelay:a3];
}

- (void)_cancelTurnOnScreenForOutOfPocketEvents
{
  self->_turnOnScreenForOutOfPocketEvent = 0;
}

- (void)_turnOnScreenForOutOfPocketEventIfNecessary
{
  if (self->_turnOnScreenForOutOfPocketEvent)
  {
    char v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "PocketStateManager: turn on screen for out of pocket event", v4, 2u);
    }

    [(SBNCScreenController *)self _turnOnScreen];
    [(SBNCScreenController *)self _cancelTurnOnScreenForOutOfPocketEvents];
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__cancelTurnOnScreenForOutOfPocketEvents object:0];
  }
}

- (void)_createOrResetPowerAssertionWithTimeout:(double)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_powerAssertionID)
  {
    uint64_t v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      powerAssertionName = self->_powerAssertionName;
      *(_DWORD *)buf = 138543618;
      int v18 = powerAssertionName;
      __int16 v19 = 2048;
      double v20 = a3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Extending an existing power assertion with name %{public}@ and timeout: %f - so we keep the device awake while we wait to see if it is removed from the pocket", buf, 0x16u);
    }

    IOPMAssertionSetProperty(self->_powerAssertionID, @"TimeoutSeconds", (CFTypeRef)[NSNumber numberWithDouble:a3]);
  }
  else
  {
    id v7 = [NSString alloc];
    uint64_t v8 = (NSString *)objc_msgSend(v7, "initWithFormat:", @"com.apple.springboard.pocketNotification.%d", ++_createOrResetPowerAssertionWithTimeout__count);
    uint64_t v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      int v18 = v8;
      __int16 v19 = 2048;
      double v20 = a3;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "About to take out a power assertion with name %{public}@ and timeout: %f - so we keep the device awake while we wait to see if it is removed from the pocket", buf, 0x16u);
    }

    v15[0] = @"AssertType";
    v15[1] = @"AssertLevel";
    *(_DWORD *)buf = 0;
    v16[0] = @"NoIdleSleepAssertion";
    v16[1] = &unk_1F3349E60;
    v16[2] = v8;
    v15[2] = @"AssertName";
    v15[3] = @"TimeoutSeconds";
    int v10 = [NSNumber numberWithDouble:a3];
    v16[3] = v10;
    CFDictionaryRef v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];

    IOReturn v12 = IOPMAssertionCreateWithProperties(v11, (IOPMAssertionID *)buf);
    [(SBNCScreenController *)self _releasePowerAssertion];
    p_powerAssertionName = (uint64_t *)&self->_powerAssertionName;
    objc_storeStrong((id *)&self->_powerAssertionName, v8);
    self->_powerAssertionID = *(_DWORD *)buf;
    if (v12)
    {
      int v14 = SBLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        [(SBNCScreenController *)p_powerAssertionName _createOrResetPowerAssertionWithTimeout:v14];
      }
    }
  }
}

- (void)_releasePowerAssertion
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_powerAssertionID)
  {
    char v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      powerAssertionName = self->_powerAssertionName;
      int v6 = 138412290;
      id v7 = powerAssertionName;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Releasing power assertion: %@", (uint8_t *)&v6, 0xCu);
    }

    IOPMAssertionRelease(self->_powerAssertionID);
    self->_powerAssertionID = 0;
    uint64_t v5 = self->_powerAssertionName;
    self->_powerAssertionName = 0;
  }
}

- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v7 = a4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "pocketStateManager:didUpdateState:%ld", buf, 0xCu);
  }

  if ((objc_msgSend(MEMORY[0x1E4F22268], "_sb_isScreenObscuredInPocketState:", a4) & 1) == 0) {
    BSDispatchMain();
  }
}

uint64_t __58__SBNCScreenController_pocketStateManager_didUpdateState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _turnOnScreenForOutOfPocketEventIfNecessary];
}

- (SBBacklightController)backlightController
{
  return self->_backlightController;
}

- (void)setBacklightController:(id)a3
{
}

- (SBLockScreenManager)lockScreenManager
{
  return self->_lockScreenManager;
}

- (void)setLockScreenManager:(id)a3
{
}

- (SBLockStateAggregator)lockStateAggregator
{
  return self->_lockStateAggregator;
}

- (void)setLockStateAggregator:(id)a3
{
}

- (CMPocketStateManager)pocketStateManager
{
  return self->_pocketStateManager;
}

- (void)setPocketStateManager:(id)a3
{
}

- (BOOL)turnOnScreenForOutOfPocketEvent
{
  return self->_turnOnScreenForOutOfPocketEvent;
}

- (void)setTurnOnScreenForOutOfPocketEvent:(BOOL)a3
{
  self->_turnOnScreenForOutOfPocketEvent = a3;
}

- (NSString)powerAssertionName
{
  return self->_powerAssertionName;
}

- (void)setPowerAssertionName:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerAssertionName, 0);
  objc_storeStrong((id *)&self->_pocketStateManager, 0);
  objc_storeStrong((id *)&self->_lockStateAggregator, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
}

- (void)_createOrResetPowerAssertionWithTimeout:(os_log_t)log .cold.1(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Unable to take power assertion with name %{public}@ - returned %#x", (uint8_t *)&v4, 0x12u);
}

@end