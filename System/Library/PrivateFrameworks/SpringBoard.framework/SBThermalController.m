@interface SBThermalController
+ (SBThermalController)sharedInstance;
+ (void)logThermalEvent:(id)a3;
- (BOOL)_isBlocked;
- (BOOL)isInSunlight;
- (NSString)description;
- (SBThermalController)init;
- (int64_t)level;
- (void)_respondToCurrentThermalCondition;
- (void)_setBlocked:(BOOL)a3;
- (void)_updateThermalJetsamCPUSamplingState;
- (void)addThermalObserver:(id)a3;
- (void)dealloc;
- (void)removeThermalObserver:(id)a3;
- (void)startListeningForThermalEvents;
@end

@implementation SBThermalController

- (BOOL)_isBlocked
{
  return [(SBSecurityDefaults *)self->_securityDefaults isBlockedForThermal];
}

- (int64_t)level
{
  return self->_level;
}

+ (SBThermalController)sharedInstance
{
  if (sharedInstance_onceToken_45 != -1) {
    dispatch_once(&sharedInstance_onceToken_45, &__block_literal_global_325);
  }
  v2 = (void *)sharedInstance___sharedInstance_23;
  return (SBThermalController *)v2;
}

uint64_t __37__SBThermalController_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBThermalController);
  v1 = (void *)sharedInstance___sharedInstance_23;
  sharedInstance___sharedInstance_23 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBThermalController)init
{
  v12.receiver = self;
  v12.super_class = (Class)SBThermalController;
  v2 = [(SBThermalController *)&v12 init];
  if (v2)
  {
    v3 = +[SBDefaults localDefaults];
    uint64_t v4 = [v3 thermalDefaults];
    thermalDefaults = v2->_thermalDefaults;
    v2->_thermalDefaults = (SBThermalDefaults *)v4;

    uint64_t v6 = [v3 securityDefaults];
    securityDefaults = v2->_securityDefaults;
    v2->_securityDefaults = (SBSecurityDefaults *)v6;

    v8 = +[SBDefaults externalDefaults];
    uint64_t v9 = [v8 networkDefaults];
    networkDefaults = v2->_networkDefaults;
    v2->_networkDefaults = (SBExternalWifiDefaults *)v9;

    v2->_hotToken = -1;
    v2->_coldToken = -1;
    v2->_sunToken = -1;
  }
  return v2;
}

- (void)dealloc
{
  int hotToken = self->_hotToken;
  if (hotToken != -1) {
    notify_cancel(hotToken);
  }
  int coldToken = self->_coldToken;
  if (coldToken != -1) {
    notify_cancel(coldToken);
  }
  int sunToken = self->_sunToken;
  if (sunToken != -1) {
    notify_cancel(sunToken);
  }
  v6.receiver = self;
  v6.super_class = (Class)SBThermalController;
  [(SBThermalController *)&v6 dealloc];
}

+ (void)logThermalEvent:(id)a3
{
  v3 = (objc_class *)NSString;
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithFormat:v4 arguments:&v8];

  objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v5, 0);
  v7 = GetThermalState();
  [v6 addObjectsFromArray:v7];

  logEventForAppleCare();
}

- (void)startListeningForThermalEvents
{
  OUTLINED_FUNCTION_0_5(&dword_1D85BA000, a2, a3, "notify_register(hot) failed : status=%i", a5, a6, a7, a8, 0);
}

uint64_t __53__SBThermalController_startListeningForThermalEvents__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(v2 + 24);
  uint64_t result = notify_get_state(*(_DWORD *)(v2 + 16), (uint64_t *)(v2 + 24));
  if (v3 != *(void *)(*(void *)(a1 + 32) + 24))
  {
    v5 = SBLogThermal();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 134218240;
      unint64_t v9 = v3;
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "hot condition changed from %llu to %llu", buf, 0x16u);
    }

    v7 = *(void **)(a1 + 32);
    if (v7[3] > 0x28uLL || v3 >= 0x29)
    {
      objc_msgSend((id)objc_opt_class(), "logThermalEvent:", @"ThermalLevel,%llu", *(void *)(*(void *)(a1 + 32) + 24));
      v7 = *(void **)(a1 + 32);
    }
    return [v7 _respondToCurrentThermalCondition];
  }
  return result;
}

uint64_t __53__SBThermalController_startListeningForThermalEvents__block_invoke_20(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 40);
  uint64_t result = notify_get_state(*(_DWORD *)(v2 + 32), (uint64_t *)(v2 + 40));
  if (v3 != *(void *)(*(void *)(a1 + 32) + 40))
  {
    v5 = SBLogThermal();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 40);
      int v7 = 134218240;
      uint64_t v8 = v3;
      __int16 v9 = 2048;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "cold condition changed from %llu to %llu", (uint8_t *)&v7, 0x16u);
    }

    return [*(id *)(a1 + 32) _respondToCurrentThermalCondition];
  }
  return result;
}

uint64_t __53__SBThermalController_startListeningForThermalEvents__block_invoke_22(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 56);
  uint64_t result = notify_get_state(*(_DWORD *)(v2 + 48), (uint64_t *)(v2 + 56));
  if (v3 != *(void *)(*(void *)(a1 + 32) + 56))
  {
    v5 = SBLogThermal();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 56);
      int v7 = 134218240;
      uint64_t v8 = v3;
      __int16 v9 = 2048;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "sunlight condition changed from %llu to %llu", (uint8_t *)&v7, 0x16u);
    }

    return [*(id *)(a1 + 32) _respondToCurrentThermalCondition];
  }
  return result;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_samplingToken withName:@"samplingToken" skipIfNil:1];
  v5 = NSStringFromSBThermalLevel(self->_level);
  [v3 appendString:v5 withName:@"ThermalLevel"];

  id v6 = (id)[v3 appendBool:self->_inSunlight withName:@"inSunlight"];
  id v7 = (id)[v3 appendUInt64:self->_hotLevel withName:@"hotLevel"];
  id v8 = (id)[v3 appendUInt64:self->_coldLevel withName:@"coldLevel"];
  id v9 = (id)[v3 appendUInt64:self->_sunLevel withName:@"sunLevel"];
  uint64_t v10 = [v3 build];

  return (NSString *)v10;
}

- (void)addThermalObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (void)removeThermalObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (void)_respondToCurrentThermalCondition
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = [NSString stringWithUTF8String:"-[SBThermalController _respondToCurrentThermalCondition]"];
    [v14 handleFailureInFunction:v15 file:@"SBThermalController.m" lineNumber:238 description:@"this call must be made on the main thread"];
  }
  int64_t level = self->_level;
  unint64_t hotLevel = self->_hotLevel;
  if (hotLevel <= 0x27)
  {
    if (hotLevel <= 0x1D)
    {
      if (hotLevel <= 0x13)
      {
        unint64_t coldLevel = self->_coldLevel;
        if (coldLevel <= 0x13) {
          uint64_t v7 = 0;
        }
        else {
          uint64_t v7 = -1;
        }
        if (coldLevel <= 0x1D) {
          int64_t v5 = v7;
        }
        else {
          int64_t v5 = -2;
        }
      }
      else
      {
        int64_t v5 = 1;
      }
    }
    else
    {
      int64_t v5 = 2;
    }
  }
  else
  {
    int64_t v5 = 3;
  }
  self->_int64_t level = v5;
  int64_t v8 = level;
  if (level != v5)
  {
    id v9 = SBLogThermal();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = NSStringFromSBThermalLevel(self->_level);
      int64_t v11 = self->_level;
      int v16 = 138543618;
      v17 = v10;
      __int16 v18 = 1026;
      int v19 = v11;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Thermal level changed to %{public}@ (%{public}d)", (uint8_t *)&v16, 0x12u);
    }
    int64_t v8 = self->_level;
  }
  BOOL inSunlight = self->_inSunlight;
  self->_BOOL inSunlight = self->_sunLevel != 0;
  [(SBThermalController *)self _setBlocked:v8 == 3];
  if (level != self->_level || inSunlight != self->_inSunlight)
  {
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:@"SBThermalControllerStateDidChange" object:self];
  }
  [(SBThermalController *)self _updateThermalJetsamCPUSamplingState];
}

- (void)_updateThermalJetsamCPUSamplingState
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    __int16 v18 = [MEMORY[0x1E4F28B00] currentHandler];
    int v19 = [NSString stringWithUTF8String:"-[SBThermalController _updateThermalJetsamCPUSamplingState]"];
    [v18 handleFailureInFunction:v19 file:@"SBThermalController.m" lineNumber:278 description:@"this call must be made on the main thread"];
  }
  samplingToken = self->_samplingToken;
  if (self->_hotLevel > 0x27)
  {
    if (samplingToken) {
      return;
    }
    int64_t v8 = [MEMORY[0x1E4F29128] UUID];
    id v9 = self->_samplingToken;
    self->_samplingToken = v8;

    if (!self->_samplingToken)
    {
      uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:self file:@"SBThermalController.m" lineNumber:293 description:@"failed to create a sampling token"];
    }
    uint64_t v10 = SBLogThermal();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = self->_samplingToken;
      *(_DWORD *)buf = 138412290;
      v28 = v11;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Starting CPU usage sampling with token=%@.", buf, 0xCu);
    }

    uint64_t v12 = self->_samplingToken;
    v13 = __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke();
    BSContinuousMachTimeNow();
    uint64_t v15 = v14;
    dispatch_time_t v16 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_2;
    block[3] = &unk_1E6B0A188;
    v22 = v12;
    v23 = self;
    uint64_t v26 = v15;
    id v24 = v13;
    id v25 = &__block_literal_global_50_3;
    id v17 = v13;
    uint64_t v7 = v12;
    dispatch_after(v16, MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (!samplingToken) {
      return;
    }
    int64_t v5 = SBLogThermal();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = self->_samplingToken;
      *(_DWORD *)buf = 138412290;
      v28 = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Canceling CPU usage sampling with token=%@.", buf, 0xCu);
    }

    uint64_t v7 = self->_samplingToken;
    self->_samplingToken = 0;
  }
}

id __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v1 = objc_msgSend(MEMORY[0x1E4F62448], "sharedInstance", 0);
  uint64_t v2 = [v1 allApplicationProcesses];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v7 isPendingExit] & 1) == 0)
        {
          int64_t v8 = NSNumber;
          [v7 elapsedCPUTime];
          id v9 = objc_msgSend(v8, "numberWithDouble:");
          [v0 setObject:v9 forKey:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  return v0;
}

void __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 8)])
  {
    uint64_t v2 = (*(void (**)(void))(*(void *)(v1 + 56) + 16))();
    BSContinuousMachTimeNow();
    double v4 = v3;
    double v5 = *(double *)(v1 + 64);
    v38 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v6 = v2;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v50 objects:v63 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      double v9 = v4 - v5;
      uint64_t v10 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v51 != v10) {
            objc_enumerationMutation(v6);
          }
          long long v12 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          long long v13 = [v6 objectForKey:v12];
          [v13 doubleValue];
          double v15 = v14;
          uint64_t v16 = [*(id *)(v1 + 48) objectForKey:v12];
          [v16 doubleValue];
          double v18 = v15 - v17;

          double v20 = v18 / v9 * 100.0;
          if (v20 > 30.0
            && __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_3(v19, v12))
          {
            v21 = SBLogThermal();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = [v12 bundleIdentifier];
              int v23 = [v12 pid];
              *(_DWORD *)buf = 138544130;
              v56 = v22;
              __int16 v57 = 1026;
              int v58 = v23;
              __int16 v59 = 2048;
              double v60 = v20;
              __int16 v61 = 2048;
              double v62 = v9;
              _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "Thermal: Killing %{public}@(%{public}i), which used %.2f%% CPU over the past %.1f seconds.", buf, 0x26u);
            }
            id v24 = [NSString stringWithFormat:@"%%CPU:                %.2f%% (sampled for %.1f s)", *(void *)&v20, *(void *)&v9];
            [v38 setObject:v24 forKey:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v50 objects:v63 count:16];
      }
      while (v8);
    }

    id v25 = v38;
    if (![v38 count])
    {
      uint64_t v26 = +[SBSceneManagerCoordinator sharedInstance];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_61;
      v47[3] = &unk_1E6B0A160;
      id v48 = v38;
      id v49 = &__block_literal_global_56_2;
      [v26 enumerateSceneManagersWithBlock:v47];
    }
    if ([v38 count])
    {
      uint64_t v37 = v1;
      long long v46 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v43 = 0u;
      id v27 = v38;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v43 objects:v54 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v44 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = *(void **)(*((void *)&v43 + 1) + 8 * j);
            v33 = [v27 objectForKey:v32];
            v42[0] = MEMORY[0x1E4F143A8];
            v42[1] = 3221225472;
            v42[2] = __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_66;
            v42[3] = &unk_1E6AF5350;
            v42[4] = v32;
            [v32 killForReason:4 andReport:1 withDescription:v33 completion:v42];
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v43 objects:v54 count:16];
        }
        while (v29);
      }

      uint64_t v1 = v37;
      id v25 = v38;
    }
    dispatch_time_t v34 = dispatch_time(0, 30000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_68;
    block[3] = &unk_1E6AF5290;
    id v35 = *(id *)(v1 + 32);
    uint64_t v36 = *(void *)(v1 + 40);
    id v40 = v35;
    uint64_t v41 = v36;
    dispatch_after(v34, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isCurrentProcess])
  {
    double v3 = SBLogThermal();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Keeping ourselves alive since we can't reasonably exit", buf, 2u);
    }
    goto LABEL_12;
  }
  double v3 = [v2 bundleIdentifier];
  if (![v3 isEqualToString:@"com.apple.mobilephone"])
  {
    if (![v3 isEqualToString:@"com.apple.LoginUI"])
    {
      uint64_t v7 = 1;
      goto LABEL_13;
    }
    double v4 = SBLogThermal();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    __int16 v9 = 0;
    double v5 = "Keeping login window app alive since we can't reasonably exit it";
    id v6 = (uint8_t *)&v9;
    goto LABEL_10;
  }
  double v4 = SBLogThermal();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = 0;
    double v5 = "Keeping phone alive since we need them for emergency calls";
    id v6 = (uint8_t *)&v10;
LABEL_10:
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
  }
LABEL_11:

LABEL_12:
  uint64_t v7 = 0;
LABEL_13:

  return v7;
}

void __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_61(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v3 = [a2 externalForegroundApplicationSceneHandles];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v17;
    *(void *)&long long v5 = 138543618;
    long long v15 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        __int16 v9 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v8), "scene", v15);
        __int16 v10 = [v9 clientProcess];

        long long v11 = [*(id *)(a1 + 32) objectForKey:v10];

        if (!v11 && (*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
        {
          long long v12 = SBLogThermal();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            long long v13 = [v10 bundleIdentifier];
            int v14 = [v10 pid];
            *(_DWORD *)buf = v15;
            v21 = v13;
            __int16 v22 = 1026;
            int v23 = v14;
            _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Thermal: Killing %{public}@(%{public}i), which was topmost.", buf, 0x12u);
          }
          [*(id *)(a1 + 32) setObject:@"Topmost application" forKey:v10];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v6);
  }
}

void __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_66(uint64_t a1, char a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    double v3 = SBLogThermal();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [*(id *)(a1 + 32) bundleIdentifier];
      int v5 = [*(id *)(a1 + 32) pid];
      int v6 = 138543618;
      uint64_t v7 = v4;
      __int16 v8 = 1026;
      int v9 = v5;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Thermal: failed to kill %{public}@(%{public}i)", (uint8_t *)&v6, 0x12u);
    }
  }
}

uint64_t __59__SBThermalController__updateThermalJetsamCPUSamplingState__block_invoke_68(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 8)];
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = 0;

    int v5 = *(void **)(a1 + 40);
    return [v5 _updateThermalJetsamCPUSamplingState];
  }
  return result;
}

- (void)_setBlocked:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ([(SBThermalController *)self _isBlocked] != a3)
  {
    int v5 = SBLogThermal();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = NSStringFromBOOL();
      *(_DWORD *)buf = 138543362;
      v32 = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Will toggle bricked state to: %{public}@", buf, 0xCu);
    }
    uint64_t v7 = SBLogStatusBarish();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      __int16 v8 = NSStringFromBOOL();
      *(_DWORD *)buf = 138543362;
      v32 = v8;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Will toggle bricked state to: %{public}@", buf, 0xCu);
    }
    if (v3) {
      int v9 = @"ThermalUIAlertEnter";
    }
    else {
      int v9 = @"ThermalUIAlertExit";
    }
    +[SBThermalController logThermalEvent:v9];
    uint64_t v10 = +[SBTelephonyManager sharedTelephonyManager];
    if ([v10 _serverConnection])
    {
      if (v3) {
        unint64_t v11 = _CTServerConnectionDisableRegistration();
      }
      else {
        unint64_t v11 = _CTServerConnectionEnableRegistration();
      }
      unint64_t v14 = v11;
      if (HIDWORD(v11)) {
        [v10 _serverConnectionDidError:v11];
      }
    }
    else
    {
      long long v12 = SBLogThermal();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SBThermalController _setBlocked:](v12);
      }

      long long v13 = SBLogStatusBarish();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_INFO, "Unable to change CT registration status. _CTServerConnectionCreate() failed.", buf, 2u);
      }
    }
    if (v3)
    {
      long long v15 = +[SBWiFiManager sharedInstance];
      if ([v15 wiFiEnabled])
      {
        [v15 setWiFiEnabled:0];
        [(SBThermalDefaults *)self->_thermalDefaults setWasConnectedToWiFiWhenBrickedForThermalConditions:1];
      }
      [(SBExternalWifiDefaults *)self->_networkDefaults setWifiEnabled:0];
    }
    else if ([(SBThermalDefaults *)self->_thermalDefaults wasConnectedToWiFiWhenBrickedForThermalConditions])
    {
      long long v16 = +[SBWiFiManager sharedInstance];
      [v16 setWiFiEnabled:1];

      [(SBExternalWifiDefaults *)self->_networkDefaults setWifiEnabled:1];
      [(SBThermalDefaults *)self->_thermalDefaults setWasConnectedToWiFiWhenBrickedForThermalConditions:0];
    }
    [(SBSecurityDefaults *)self->_securityDefaults setBlockedForThermal:v3];
    [(SBSecurityDefaults *)self->_securityDefaults synchronizeDefaults];
    long long v17 = SBLogThermal();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      long long v18 = NSStringFromBOOL();
      *(_DWORD *)buf = 138543362;
      v32 = v18;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Did toggle bricked state to: %{public}@", buf, 0xCu);
    }
    long long v19 = SBLogStatusBarish();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      double v20 = NSStringFromBOOL();
      *(_DWORD *)buf = 138543362;
      v32 = v20;
      _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_INFO, "Did toggle bricked state to: %{public}@", buf, 0xCu);
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v21 = self->_observers;
    uint64_t v22 = [(NSHashTable *)v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(v21);
          }
          objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "thermalBlockStatusChanged:", self, (void)v26);
        }
        uint64_t v23 = [(NSHashTable *)v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v23);
    }
  }
}

- (BOOL)isInSunlight
{
  return self->_inSunlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityDefaults, 0);
  objc_storeStrong((id *)&self->_thermalDefaults, 0);
  objc_storeStrong((id *)&self->_networkDefaults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_samplingToken, 0);
}

- (void)_setBlocked:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Unable to change CT registration status. _CTServerConnectionCreate() failed.", v1, 2u);
}

@end