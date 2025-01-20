@interface SBIdleTimerGlobalStateMonitor
+ (SBIdleTimerGlobalStateMonitor)sharedInstance;
- (BOOL)disableAttentionAwareness;
- (BOOL)dontDimOrLockOnAC;
- (BOOL)dontLockEver;
- (BOOL)isAutoDimDisabled;
- (BOOL)isBatterySaverModeActive;
- (BOOL)isFaceDownOnTable;
- (BOOL)isOnACPower;
- (BOOL)isThermalBlocked;
- (NSNumber)autoLockTimeout;
- (SBIdleTimerAggregateClientConfiguration)aggregateClientConfiguration;
- (double)minimumLockscreenIdleTime;
- (id)_BOOLMonitorForProperty:(id)a3 inDefaults:(id)a4 fetchingWith:(id)a5;
- (id)_init;
- (id)_initWithLocalDefaults:(id)a3 profileConnection:(id)a4 pocketStateMonitor:(id)a5 uiController:(id)a6 idleTimerService:(id)a7 thermalBlockProvider:(id)a8 backlightController:(id)a9;
- (id)_stateCaptureDescription;
- (id)_timeIntervalMonitorForProperty:(id)a3 inDefaults:(id)a4 fetchingWith:(id)a5;
- (int64_t)pocketState;
- (void)_addStateCaptureHandlers;
- (void)_updateAutoDimDisabled;
- (void)_updateFaceDownOnTable;
- (void)_updateObserversForReason:(id)a3;
- (void)addObserver:(id)a3;
- (void)backlightController:(id)a3 didTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5;
- (void)dealloc;
- (void)idleTimerGlobalSettingMonitor:(id)a3 changedForReason:(id)a4;
- (void)idleTimerServiceTimeoutAssertionsDidChange:(id)a3 fromClient:(id)a4;
- (void)pocketStateMonitor:(id)a3 pocketStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5;
- (void)removeObserver:(id)a3;
- (void)thermalBlockStatusChanged:(id)a3;
@end

@implementation SBIdleTimerGlobalStateMonitor

- (BOOL)isThermalBlocked
{
  return self->_thermalBlocked;
}

- (BOOL)dontLockEver
{
  return (*((uint64_t (**)(void))self->_dontLockEver + 2))();
}

- (BOOL)dontDimOrLockOnAC
{
  return (*((uint64_t (**)(void))self->_dontDimOrLockOnAC + 2))();
}

- (BOOL)isFaceDownOnTable
{
  return self->_faceDownOnTable;
}

- (BOOL)isBatterySaverModeActive
{
  return [(_SBIdleTimerGlobalBoolSettingMonitor *)self->_batterySaverModeMonitor BOOLValue];
}

- (NSNumber)autoLockTimeout
{
  return [(_SBIdleTimerGlobalNumericSettingMonitor *)self->_autoLockTimeoutMonitor numericValue];
}

- (SBIdleTimerAggregateClientConfiguration)aggregateClientConfiguration
{
  return self->_aggregateClientConfiguration;
}

uint64_t __81__SBIdleTimerGlobalStateMonitor__BOOLMonitorForProperty_inDefaults_fetchingWith___block_invoke_64(void *a1)
{
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = (*(uint64_t (**)(void))(a1[5] + 16))();
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  return *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
}

- (BOOL)disableAttentionAwareness
{
  return (*((uint64_t (**)(void))self->_disableAttentionAwareness + 2))();
}

- (BOOL)isAutoDimDisabled
{
  return self->_autoDimDisabled;
}

+ (SBIdleTimerGlobalStateMonitor)sharedInstance
{
  if (sharedInstance_onceToken_53 != -1) {
    dispatch_once(&sharedInstance_onceToken_53, &__block_literal_global_361);
  }
  v2 = (void *)sharedInstance_monitor_1;
  return (SBIdleTimerGlobalStateMonitor *)v2;
}

void __47__SBIdleTimerGlobalStateMonitor_sharedInstance__block_invoke()
{
  id v0 = [[SBIdleTimerGlobalStateMonitor alloc] _init];
  v1 = (void *)sharedInstance_monitor_1;
  sharedInstance_monitor_1 = (uint64_t)v0;
}

- (id)_initWithLocalDefaults:(id)a3 profileConnection:(id)a4 pocketStateMonitor:(id)a5 uiController:(id)a6 idleTimerService:(id)a7 thermalBlockProvider:(id)a8 backlightController:(id)a9
{
  v78[1] = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v59 = a4;
  id v16 = a5;
  id v60 = a6;
  id v17 = a7;
  id v18 = a8;
  id v58 = a9;
  v77.receiver = self;
  v77.super_class = (Class)SBIdleTimerGlobalStateMonitor;
  v19 = [(SBIdleTimerGlobalStateMonitor *)&v77 init];
  v20 = v19;
  if (v19)
  {
    v19->_observerLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v19->_backlightController, a9);
    [(SBBacklightController *)v20->_backlightController addObserver:v20];
    objc_storeStrong((id *)&v20->_idleTimerService, a7);
    [v17 setDelegate:v20];
    uint64_t v21 = [v17 aggregateClientConfiguration];
    aggregateClientConfiguration = v20->_aggregateClientConfiguration;
    v20->_aggregateClientConfiguration = (SBIdleTimerAggregateClientConfiguration *)v21;

    objc_storeStrong((id *)&v20->_thermalBlockProvider, a8);
    [v18 addThermalObserver:v20];
    v20->_thermalBlocked = [v18 isThermalBlocked];
    objc_storeStrong((id *)&v20->_localDefaults, a3);
    v23 = [NSString stringWithUTF8String:"dontLockEver"];
    v24 = [v61 securityDefaults];
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke;
    v75[3] = &unk_1E6B0BC48;
    id v25 = v61;
    id v76 = v25;
    uint64_t v26 = [(SBIdleTimerGlobalStateMonitor *)v20 _BOOLMonitorForProperty:v23 inDefaults:v24 fetchingWith:v75];
    id dontLockEver = v20->_dontLockEver;
    v20->_id dontLockEver = (id)v26;

    v28 = [NSString stringWithUTF8String:"dontDimOrLockWhileConnectedToPower"];
    v29 = [v25 idleTimerDefaults];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_2;
    v73[3] = &unk_1E6B0BC70;
    id v30 = v25;
    id v74 = v30;
    uint64_t v31 = [(SBIdleTimerGlobalStateMonitor *)v20 _BOOLMonitorForProperty:v28 inDefaults:v29 fetchingWith:v73];
    id dontDimOrLockOnAC = v20->_dontDimOrLockOnAC;
    v20->_id dontDimOrLockOnAC = (id)v31;

    v33 = [NSString stringWithUTF8String:"disableAttentionAwareness"];
    v34 = [v30 idleTimerDefaults];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_3;
    v71[3] = &unk_1E6B0BC70;
    id v35 = v30;
    id v72 = v35;
    uint64_t v36 = [(SBIdleTimerGlobalStateMonitor *)v20 _BOOLMonitorForProperty:v33 inDefaults:v34 fetchingWith:v71];
    id disableAttentionAwareness = v20->_disableAttentionAwareness;
    v20->_id disableAttentionAwareness = (id)v36;

    v38 = [NSString stringWithUTF8String:"minimumLockscreenIdleTime"];
    v39 = [v35 idleTimerDefaults];
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_4;
    v69[3] = &unk_1E6B0BC98;
    id v40 = v35;
    id v70 = v40;
    uint64_t v41 = [(SBIdleTimerGlobalStateMonitor *)v20 _timeIntervalMonitorForProperty:v38 inDefaults:v39 fetchingWith:v69];
    id minimumLockscreenIdleTime = v20->_minimumLockscreenIdleTime;
    v20->_id minimumLockscreenIdleTime = (id)v41;

    objc_initWeak(&location, v20);
    v43 = [v40 idleTimerDefaults];
    v44 = [NSString stringWithUTF8String:"disableAutoDim"];
    v78[0] = v44;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:1];
    id v46 = MEMORY[0x1E4F14428];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_5;
    v66[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v67, &location);
    id v47 = (id)[v43 observeDefaults:v45 onQueue:MEMORY[0x1E4F14428] withBlock:v66];

    [(SBIdleTimerGlobalStateMonitor *)v20 _updateAutoDimDisabled];
    v48 = [[_SBIdleTimerGlobalBoolSettingMonitor alloc] initWithLabel:@"BatterySaverMode" delegate:v20 updatingForNotification:@"SBBatterySaverModeDidChangeNotification" fetchingWith:&__block_literal_global_24_4];
    batterySaverModeMonitor = v20->_batterySaverModeMonitor;
    v20->_batterySaverModeMonitor = v48;

    v50 = [_SBIdleTimerGlobalBoolSettingMonitor alloc];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_7;
    v64[3] = &unk_1E6AF99E8;
    id v65 = v60;
    uint64_t v51 = [(_SBIdleTimerGlobalBoolSettingMonitor *)v50 initWithLabel:@"OnACPower" delegate:v20 updatingForNotification:@"SBUIACStatusChangedNotification" fetchingWith:v64];
    onACPowerMonitor = v20->_onACPowerMonitor;
    v20->_onACPowerMonitor = (_SBIdleTimerGlobalBoolSettingMonitor *)v51;

    v53 = [_SBIdleTimerGlobalNumericSettingMonitor alloc];
    uint64_t v54 = *MEMORY[0x1E4F73EC0];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_8;
    v62[3] = &unk_1E6B0BCC0;
    id v63 = v59;
    uint64_t v55 = [(_SBIdleTimerGlobalNumericSettingMonitor *)v53 initWithLabel:@"AutoLockTimeout" delegate:v20 updatingForNotification:v54 fetchingWith:v62];
    autoLockTimeoutMonitor = v20->_autoLockTimeoutMonitor;
    v20->_autoLockTimeoutMonitor = (_SBIdleTimerGlobalNumericSettingMonitor *)v55;

    [v16 addObserver:v20];
    v20->_pocketState = [v16 pocketState];
    [(SBIdleTimerGlobalStateMonitor *)v20 _updateFaceDownOnTable];
    [(SBIdleTimerGlobalStateMonitor *)v20 _addStateCaptureHandlers];

    objc_destroyWeak(&v67);
    objc_destroyWeak(&location);
  }
  return v20;
}

uint64_t __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) securityDefaults];
  uint64_t v2 = [v1 dontLockEver];

  return v2;
}

uint64_t __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) idleTimerDefaults];
  uint64_t v2 = [v1 dontDimOrLockWhileConnectedToPower];

  return v2;
}

uint64_t __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) idleTimerDefaults];
  uint64_t v2 = [v1 disableAttentionAwareness];

  return v2;
}

double __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_4(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) idleTimerDefaults];
  [v1 minimumLockscreenIdleTime];
  double v3 = v2;

  return v3;
}

void __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateAutoDimDisabled];
}

uint64_t __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_6()
{
  return [(id)SBApp isBatterySaverModeActive];
}

uint64_t __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) isOnAC];
}

uint64_t __164__SBIdleTimerGlobalStateMonitor__initWithLocalDefaults_profileConnection_pocketStateMonitor_uiController_idleTimerService_thermalBlockProvider_backlightController___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) effectiveValueForSetting:*MEMORY[0x1E4F73F60]];
}

- (id)_init
{
  double v3 = +[SBDefaults localDefaults];
  v4 = [MEMORY[0x1E4F74230] sharedConnection];
  v5 = +[SBPocketStateMonitor sharedInstance];
  v6 = +[SBUIController sharedInstance];
  v7 = +[SBIdleTimerService sharedInstance];
  v8 = +[SBThermalController sharedInstance];
  v9 = +[SBBacklightController sharedInstance];
  id v10 = [(SBIdleTimerGlobalStateMonitor *)self _initWithLocalDefaults:v3 profileConnection:v4 pocketStateMonitor:v5 uiController:v6 idleTimerService:v7 thermalBlockProvider:v8 backlightController:v9];

  return v10;
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  stateCaptureAssertion = self->_stateCaptureAssertion;
  if (stateCaptureAssertion)
  {
    [(BSInvalidatable *)stateCaptureAssertion invalidate];
    v5 = self->_stateCaptureAssertion;
    self->_stateCaptureAssertion = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBIdleTimerGlobalStateMonitor;
  [(SBIdleTimerGlobalStateMonitor *)&v6 dealloc];
}

- (void)addObserver:(id)a3
{
  id v7 = a3;
  os_unfair_lock_assert_not_owner(&self->_observerLock);
  os_unfair_lock_lock(&self->_observerLock);
  observers = self->_observers;
  if (!observers)
  {
    v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    objc_super v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v7];
  os_unfair_lock_unlock(&self->_observerLock);
}

- (void)removeObserver:(id)a3
{
  p_observerLock = &self->_observerLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_observerLock);
  os_unfair_lock_lock(p_observerLock);
  [(NSHashTable *)self->_observers removeObject:v5];

  if (![(NSHashTable *)self->_observers count])
  {
    observers = self->_observers;
    self->_observers = 0;
  }
  os_unfair_lock_unlock(p_observerLock);
}

- (double)minimumLockscreenIdleTime
{
  (*((void (**)(void))self->_minimumLockscreenIdleTime + 2))();
  return result;
}

- (BOOL)isOnACPower
{
  return [(_SBIdleTimerGlobalBoolSettingMonitor *)self->_onACPowerMonitor BOOLValue];
}

- (void)idleTimerGlobalSettingMonitor:(id)a3 changedForReason:(id)a4
{
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v6 = [NSString stringWithUTF8String:"-[SBIdleTimerGlobalStateMonitor idleTimerGlobalSettingMonitor:changedForReason:]"];
    [v5 handleFailureInFunction:v6 file:@"SBIdleTimerGlobalStateMonitor.m" lineNumber:213 description:@"this call must be made on the main thread"];
  }
  [(SBIdleTimerGlobalStateMonitor *)self _updateObserversForReason:v7];
}

- (void)backlightController:(id)a3 didTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
}

uint64_t __90__SBIdleTimerGlobalStateMonitor_backlightController_didTransitionToBacklightState_source___block_invoke(uint64_t a1)
{
  uint64_t result = SBBacklightStateIsActive(*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v3 + 137) != result)
  {
    *(unsigned char *)(v3 + 137) = result;
    v4 = *(void **)(a1 + 32);
    return [v4 _updateObserversForReason:@"ScreenIsOnDidChange"];
  }
  return result;
}

- (void)pocketStateMonitor:(id)a3 pocketStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
}

uint64_t __80__SBIdleTimerGlobalStateMonitor_pocketStateMonitor_pocketStateDidChangeFrom_to___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(result + 40);
  uint64_t v3 = (id *)(result + 32);
  if (*(void *)(v1 + 112) != v2)
  {
    *(void *)(v1 + 112) = v2;
    v4 = SBLogIdleTimer();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __80__SBIdleTimerGlobalStateMonitor_pocketStateMonitor_pocketStateDidChangeFrom_to___block_invoke_cold_1((uint64_t)v3, v4);
    }

    return [*v3 _updateFaceDownOnTable];
  }
  return result;
}

- (void)idleTimerServiceTimeoutAssertionsDidChange:(id)a3 fromClient:(id)a4
{
  id v5 = a4;
  v8 = [a3 aggregateClientConfiguration];
  id v6 = v5;
  id v7 = v8;
  BSDispatchMain();
}

void __87__SBIdleTimerGlobalStateMonitor_idleTimerServiceTimeoutAssertionsDidChange_fromClient___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSString stringWithFormat:@"%@%@", @"IdleTimerServiceTimeoutAssertionsDidChange - client:", *(void *)(a1 + 48)];
  [v2 _updateObserversForReason:v3];
}

- (void)thermalBlockStatusChanged:(id)a3
{
}

uint64_t __59__SBIdleTimerGlobalStateMonitor_thermalBlockStatusChanged___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 136) != v2)
  {
    *(unsigned char *)(v1 + 136) = v2;
    return [*(id *)(result + 32) _updateObserversForReason:@"ThermalBlockedDidChange"];
  }
  return result;
}

- (void)_updateFaceDownOnTable
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  BOOL v3 = self->_pocketState == 3;
  if (self->_faceDownOnTable != v3)
  {
    self->_faceDownOnTable = v3;
    v4 = SBLogIdleTimer();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[SBIdleTimerGlobalStateMonitor _updateFaceDownOnTable] - faceDownOnTable: %d", (uint8_t *)v5, 8u);
    }

    [(SBIdleTimerGlobalStateMonitor *)self _updateObserversForReason:@"FaceDownOnTableChanged"];
  }
}

- (void)_updateObserversForReason:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_observerLock);
  os_unfair_lock_lock(&self->_observerLock);
  id v5 = (void *)[(NSHashTable *)self->_observers copy];
  os_unfair_lock_unlock(&self->_observerLock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "idleTimerGlobalStateMonitor:changedForReason:", self, v4, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_updateAutoDimDisabled
{
  BOOL v3 = [(SBLocalDefaults *)self->_localDefaults idleTimerDefaults];
  int v4 = [v3 disableAutoDim];

  if (self->_autoDimDisabled != v4)
  {
    self->_autoDimDisabled = v4;
    [(SBIdleTimerGlobalStateMonitor *)self _updateObserversForReason:@"AutoDimDisable"];
  }
}

- (id)_BOOLMonitorForProperty:(id)a3 inDefaults:(id)a4 fetchingWith:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 0;
  objc_initWeak(&location, self);
  uint64_t v11 = MEMORY[0x1E4F14428];
  id v12 = MEMORY[0x1E4F14428];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __81__SBIdleTimerGlobalStateMonitor__BOOLMonitorForProperty_inDefaults_fetchingWith___block_invoke;
  v26[3] = &unk_1E6B0BCE8;
  id v13 = v10;
  id v29 = v13;
  id v14 = v9;
  id v27 = v14;
  id v30 = v34;
  uint64_t v31 = v36;
  id v15 = v8;
  id v28 = v15;
  objc_copyWeak(&v32, &location);
  id v16 = (id)[v14 observeDefault:v15 onQueue:v11 withBlock:v26];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __81__SBIdleTimerGlobalStateMonitor__BOOLMonitorForProperty_inDefaults_fetchingWith___block_invoke_64;
  v21[3] = &unk_1E6B0BD10;
  v24 = v34;
  id v25 = v36;
  id v22 = v14;
  id v23 = v13;
  id v17 = v14;
  id v18 = v13;
  v19 = (void *)MEMORY[0x1D948C7A0](v21);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

  return v19;
}

void __81__SBIdleTimerGlobalStateMonitor__BOOLMonitorForProperty_inDefaults_fetchingWith___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) || *(unsigned __int8 *)(v3 + 24) != v2)
  {
    *(unsigned char *)(v3 + 24) = v2;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    int v4 = SBLogIdleTimer();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      int v10 = 134218498;
      uint64_t v11 = v5;
      __int16 v12 = 2114;
      uint64_t v13 = v6;
      __int16 v14 = 1024;
      int v15 = v7;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "SBIdleTimerGlobalStateMonitor - setting changed - defaults: %p, property: %{public}@, setting: %{BOOL}u", (uint8_t *)&v10, 0x1Cu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    id v9 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained _updateObserversForReason:*(void *)(a1 + 40)];
    }
  }
}

- (id)_timeIntervalMonitorForProperty:(id)a3 inDefaults:(id)a4 fetchingWith:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  void v36[3] = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 0;
  objc_initWeak(&location, self);
  uint64_t v11 = MEMORY[0x1E4F14428];
  id v12 = MEMORY[0x1E4F14428];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __89__SBIdleTimerGlobalStateMonitor__timeIntervalMonitorForProperty_inDefaults_fetchingWith___block_invoke;
  v26[3] = &unk_1E6B0BCE8;
  id v13 = v10;
  id v29 = v13;
  id v14 = v9;
  id v27 = v14;
  id v30 = v34;
  uint64_t v31 = v36;
  id v15 = v8;
  id v28 = v15;
  objc_copyWeak(&v32, &location);
  id v16 = (id)[v14 observeDefault:v15 onQueue:v11 withBlock:v26];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __89__SBIdleTimerGlobalStateMonitor__timeIntervalMonitorForProperty_inDefaults_fetchingWith___block_invoke_65;
  v21[3] = &unk_1E6B0BD38;
  v24 = v34;
  id v25 = v36;
  id v22 = v14;
  id v23 = v13;
  id v17 = v14;
  id v18 = v13;
  v19 = (void *)MEMORY[0x1D948C7A0](v21);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

  return v19;
}

void __89__SBIdleTimerGlobalStateMonitor__timeIntervalMonitorForProperty_inDefaults_fetchingWith___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    BOOL v3 = v2 == 0.0;
    double v4 = 0.0;
    if (!v3) {
      double v4 = 1.0;
    }
    goto LABEL_8;
  }
  BOOL v3 = v2 == 0.0;
  double v4 = 0.0;
  if (!v3) {
    double v4 = 1.0;
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  if (*(double *)(v5 + 24) != v4)
  {
LABEL_8:
    *(double *)(v5 + 24) = v4;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v6 = SBLogIdleTimer();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      int v12 = 134218498;
      uint64_t v13 = v7;
      __int16 v14 = 2114;
      uint64_t v15 = v8;
      __int16 v16 = 2048;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "SBIdleTimerGlobalStateMonitor - setting changed - defaults: %p, property: %{public}@, setting: %g", (uint8_t *)&v12, 0x20u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    uint64_t v11 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained _updateObserversForReason:*(void *)(a1 + 40)];
    }
  }
}

double __89__SBIdleTimerGlobalStateMonitor__timeIntervalMonitorForProperty_inDefaults_fetchingWith___block_invoke_65(void *a1)
{
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    *(double *)(*(void *)(a1[7] + 8) + 24) = (*(double (**)(void))(a1[5] + 16))();
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  return *(double *)(*(void *)(a1[7] + 8) + 24);
}

- (void)_addStateCaptureHandlers
{
  objc_initWeak(&location, self);
  id v3 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v6, &location);
  BSLogAddStateCaptureBlockWithTitle();
  double v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  stateCaptureAssertion = self->_stateCaptureAssertion;
  self->_stateCaptureAssertion = v4;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

__CFString *__57__SBIdleTimerGlobalStateMonitor__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained _stateCaptureDescription];
  }
  else
  {
    id v3 = &stru_1F3084718;
  }

  return v3;
}

- (id)_stateCaptureDescription
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __57__SBIdleTimerGlobalStateMonitor__stateCaptureDescription__block_invoke;
  id v10 = &unk_1E6AF5290;
  id v11 = v3;
  int v12 = self;
  id v4 = v3;
  [v4 appendBodySectionWithName:0 multilinePrefix:0 block:&v7];
  uint64_t v5 = objc_msgSend(v4, "build", v7, v8, v9, v10);

  return v5;
}

id __57__SBIdleTimerGlobalStateMonitor__stateCaptureDescription__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isAutoDimDisabled"), @"DisableAutoDim");
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "dontLockEver"), @"DontLockEver");
  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "dontDimOrLockOnAC"), @"DontDimOrLockOnAC");
  id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "disableAttentionAwareness"), @"DisableAttentionAwareness");
  id v6 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) minimumLockscreenIdleTime];
  id v7 = (id)objc_msgSend(v6, "appendTimeInterval:withName:decomposeUnits:", @"MinimumLockscreenIdleTime", 0);
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 40) autoLockTimeout];
  [v9 doubleValue];
  id v10 = (id)objc_msgSend(v8, "appendTimeInterval:withName:decomposeUnits:", @"AutoLockTimeout", 0);

  id v11 = *(void **)(a1 + 32);
  int v12 = [*(id *)(a1 + 40) aggregateClientConfiguration];
  id v13 = (id)[v11 appendObject:v12 withName:@"ActiveClientConfiguration" skipIfNil:1];

  id v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isBatterySaverModeActive"), @"BatterySaverModeActive");
  id v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isOnACPower"), @"OnACPower");
  id v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "pocketState"), @"PocketState");
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isFaceDownOnTable"), @"FaceDownOnTable");
}

- (int64_t)pocketState
{
  return self->_pocketState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_aggregateClientConfiguration, 0);
  objc_storeStrong((id *)&self->_onACPowerMonitor, 0);
  objc_storeStrong((id *)&self->_batterySaverModeMonitor, 0);
  objc_storeStrong((id *)&self->_autoLockTimeoutMonitor, 0);
  objc_storeStrong(&self->_minimumLockscreenIdleTime, 0);
  objc_storeStrong(&self->_disableAttentionAwareness, 0);
  objc_storeStrong(&self->_dontDimOrLockOnAC, 0);
  objc_storeStrong(&self->_dontLockEver, 0);
  objc_storeStrong((id *)&self->_thermalBlockProvider, 0);
  objc_storeStrong((id *)&self->_localDefaults, 0);
  objc_storeStrong((id *)&self->_idleTimerService, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __80__SBIdleTimerGlobalStateMonitor_pocketStateMonitor_pocketStateDidChangeFrom_to___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 112);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "[SBIdleTimerGlobalStateMonitor pocketStateChanged] - _pocketState: %ld", (uint8_t *)&v3, 0xCu);
}

@end