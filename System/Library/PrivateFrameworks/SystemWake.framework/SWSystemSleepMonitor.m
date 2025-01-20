@interface SWSystemSleepMonitor
+ (id)monitorUsingMainQueue;
- (BOOL)hasSleepBeenRequested;
- (BOOL)isAwakeOrAbortingSleep;
- (BOOL)isSleepImminent;
- (NSString)description;
- (SWSystemSleepMonitor)initWithIdentifier:(id)a3 queue:(id)a4;
- (SWSystemSleepMonitor)initWithIdentifier:(id)a3 queue:(id)a4 allowsInvalidation:(BOOL)a5 monitorProvider:(id)a6 sleepAssertionProvider:(id)a7 activeSystemActivityRegistry:(id)a8;
- (SWSystemSleepMonitorAggregateState)aggregateState;
- (id)observersRespondingToSelector:(uint64_t)a1;
- (void)_lock_setSleepSlateAbortingSleepForSystemActivity;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)observersOfSelector:(void *)a3 performObserverBlock:(void *)a4 completion:;
- (void)registerActiveSystemActivity:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setSleepSlate:(uint64_t)a1 forPowerManagementNotificationID:(uint64_t)a2 notificationTimestamp:(__CFString *)a3;
- (void)setSleepSlate:(uint64_t)a3 powerManagementPhase:(uint64_t)a4 notificationID:;
- (void)systemActivityRegistryCountDidDecrementToZero:(id)a3;
- (void)systemActivityRegistryCountDidIncrementToOne:(id)a3;
- (void)systemPowerChanged:(unsigned int)a3 notificationID:(void *)a4;
- (void)unregisterInactiveSystemActivity:(id)a3;
@end

@implementation SWSystemSleepMonitor

+ (id)monitorUsingMainQueue
{
  if (qword_26AB24F78 != -1) {
    dispatch_once(&qword_26AB24F78, &__block_literal_global);
  }
  v2 = (void *)_MergedGlobals;
  return v2;
}

void __45__SWSystemSleepMonitor_monitorUsingMainQueue__block_invoke()
{
  v0 = [SWSystemSleepMonitor alloc];
  id v1 = MEMORY[0x263EF83A0];
  v2 = objc_alloc_init(SWSystemSleepMonitorProvider);
  v3 = +[SWSystemSleepAssertionProvider sharedProvider];
  v4 = +[SWActiveSystemActivityRegistry sharedRegistry];
  uint64_t v5 = [(SWSystemSleepMonitor *)v0 initWithIdentifier:@"SWSystemSleepMonitor-mainQueue" queue:MEMORY[0x263EF83A0] allowsInvalidation:0 monitorProvider:v2 sleepAssertionProvider:v3 activeSystemActivityRegistry:v4];
  v6 = (void *)_MergedGlobals;
  _MergedGlobals = v5;

  v7 = (void *)MEMORY[0x263EF83A0];
}

- (SWSystemSleepMonitor)initWithIdentifier:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(SWSystemSleepMonitorProvider);
  v9 = +[SWSystemSleepAssertionProvider sharedProvider];
  v10 = +[SWActiveSystemActivityRegistry sharedRegistry];
  v11 = [(SWSystemSleepMonitor *)self initWithIdentifier:v6 queue:v7 allowsInvalidation:1 monitorProvider:v8 sleepAssertionProvider:v9 activeSystemActivityRegistry:v10];

  return v11;
}

- (SWSystemSleepMonitor)initWithIdentifier:(id)a3 queue:(id)a4 allowsInvalidation:(BOOL)a5 monitorProvider:(id)a6 sleepAssertionProvider:(id)a7 activeSystemActivityRegistry:(id)a8
{
  id v26 = a3;
  id v15 = a4;
  id v16 = a6;
  id v25 = a7;
  id v24 = a8;
  v29.receiver = self;
  v29.super_class = (Class)SWSystemSleepMonitor;
  v17 = [(SWSystemSleepMonitor *)&v29 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    v18->_allowsInvalidation = a5;
    objc_storeStrong((id *)&v18->_queue, a4);
    v18->_lock._os_unfair_lock_opaque = 0;
    uint64_t v19 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    lock_observers = v18->_lock_observers;
    v18->_lock_observers = (NSHashTable *)v19;

    objc_storeStrong((id *)&v18->_sleepAssertionProvider, a7);
    objc_storeStrong((id *)&v18->_monitorProvider, a6);
    objc_storeStrong((id *)&v18->_activeSystemActivityRegistry, a8);
    [(SWActiveSystemActivityRegistry *)v18->_activeSystemActivityRegistry addObserver:v18];
    [v16 registerForSystemPowerOnQueue:v15 withDelegate:v18];
    objc_initWeak(&location, v18);
    objc_copyWeak(&v27, &location);
    uint64_t v21 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureHandler = v18->_stateCaptureHandler;
    v18->_stateCaptureHandler = (BSInvalidatable *)v21;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v18;
}

id __136__SWSystemSleepMonitor_initWithIdentifier_queue_allowsInvalidation_monitorProvider_sleepAssertionProvider_activeSystemActivityRegistry___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained description];

  return v2;
}

- (void)dealloc
{
  [(SWActiveSystemActivityRegistry *)self->_activeSystemActivityRegistry removeObserver:self];
  [(BSInvalidatable *)self->_stateCaptureHandler invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SWSystemSleepMonitor;
  [(SWSystemSleepMonitor *)&v3 dealloc];
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [MEMORY[0x263F29C40] builderWithObject:self];
  mach_continuous_time();
  unint64_t v5 = self->_lock_state - 1;
  if (v5 > 4) {
    id v6 = @"waking";
  }
  else {
    id v6 = off_264139AD0[v5];
  }
  [v4 appendString:v6 withName:@"state"];
  BSTimeDifferenceFromMachTimeToMachTime();
  id v7 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", @"elapsedState", 1);
  v8 = NSStringForSWSystemSleepPowerManagementPhase(self->_lock_powerManagementPhase);
  [v4 appendString:v8 withName:@"phase"];

  BSTimeDifferenceFromMachTimeToMachTime();
  id v9 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", @"elapsedPhase", 1);
  unint64_t v10 = self->_lock_systemActivityAbortSleepPhase - 1;
  if (v10 > 2) {
    v11 = @"idle";
  }
  else {
    v11 = off_264139A98[v10];
  }
  [v4 appendString:v11 withName:@"systemActivityAborting"];
  id v12 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[NSHashTable count](self->_lock_observers, "count"), @"observerCount");
  os_unfair_lock_unlock(p_lock);
  v13 = [v4 build];

  return (NSString *)v13;
}

- (BOOL)hasSleepBeenRequested
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_state > 2;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isSleepImminent
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_state > 3;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isAwakeOrAbortingSleep
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_state < 3;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)registerActiveSystemActivity:(id)a3
{
}

- (void)unregisterInactiveSystemActivity:(id)a3
{
}

- (void)systemActivityRegistryCountDidIncrementToOne:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_systemActivitiesAreActive = 1;
  if (self->_lock_systemActivityAbortSleepPhase > 1)
  {
    unint64_t v5 = SWLogPower();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v6 = self->_lock_state - 1;
      if (v6 > 4) {
        id v7 = @"waking";
      }
      else {
        id v7 = off_264139AD0[v6];
      }
      mach_continuous_time();
      BSTimeDifferenceFromMachTimeToMachTime();
      uint64_t v20 = v19;
      NSStringForSWSystemSleepPowerManagementPhase(self->_lock_powerManagementPhase);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      int lock_powerManagementPhase = self->_lock_powerManagementPhase;
      mach_continuous_time();
      BSTimeDifferenceFromMachTimeToMachTime();
      unint64_t v24 = self->_lock_systemActivityAbortSleepPhase - 1;
      if (v24 > 2) {
        id v25 = @"idle";
      }
      else {
        id v25 = off_264139A98[v24];
      }
      int v26 = 134219522;
      id v27 = self;
      __int16 v28 = 2114;
      objc_super v29 = v7;
      __int16 v30 = 2048;
      uint64_t v31 = v20;
      __int16 v32 = 2114;
      uint64_t v33 = (uint64_t)v21;
      __int16 v34 = 1024;
      int v35 = lock_powerManagementPhase;
      __int16 v36 = 2048;
      uint64_t v37 = v23;
      __int16 v38 = 2114;
      v39 = v25;
      _os_log_debug_impl(&dword_210809000, v5, OS_LOG_TYPE_DEBUG, "%p state:%{public}@ elapsed:%.3lfs phase:%{public}@(%u) elapsedPhase:%.3lfs systemActivityAborting:%{public}@", (uint8_t *)&v26, 0x44u);
    }
LABEL_15:

    goto LABEL_16;
  }
  self->_lock_systemActivityAbortSleepPhase = 2;
  if (self->_lock_state < 3)
  {
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    uint64_t v9 = v8;
    BSTimeDifferenceFromMachTimeToMachTime();
    uint64_t v11 = v10;
    unint64_t v5 = SWLogPower();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t v12 = self->_lock_state - 1;
      if (v12 > 4) {
        v13 = @"waking";
      }
      else {
        v13 = off_264139AD0[v12];
      }
      uint64_t v14 = NSStringForSWSystemSleepPowerManagementPhase(self->_lock_powerManagementPhase);
      id v15 = (void *)v14;
      int v16 = self->_lock_powerManagementPhase;
      unint64_t v17 = self->_lock_systemActivityAbortSleepPhase - 1;
      if (v17 > 2) {
        v18 = @"idle";
      }
      else {
        v18 = off_264139A98[v17];
      }
      int v26 = 134219522;
      id v27 = self;
      __int16 v28 = 2114;
      objc_super v29 = v13;
      __int16 v30 = 2048;
      uint64_t v31 = v11;
      __int16 v32 = 2114;
      uint64_t v33 = v14;
      __int16 v34 = 1024;
      int v35 = v16;
      __int16 v36 = 2048;
      uint64_t v37 = v9;
      __int16 v38 = 2114;
      v39 = v18;
      _os_log_impl(&dword_210809000, v5, OS_LOG_TYPE_INFO, "%p state:%{public}@ elapsed:%.3lfs phase:%{public}@(%u) elapsedPhase:%.3lfs systemActivityAborting:%{public}@", (uint8_t *)&v26, 0x44u);
    }
    goto LABEL_15;
  }
  -[SWSystemSleepMonitor _lock_setSleepSlateAbortingSleepForSystemActivity](self);
LABEL_16:
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_setSleepSlateAbortingSleepForSystemActivity
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v2 = mach_continuous_time();
    uint64_t v3 = a1[11];
    v4 = SWLogPower();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(v3 - 1) > 4) {
        unint64_t v5 = @"waking";
      }
      else {
        unint64_t v5 = off_264139AD0[v3 - 1];
      }
      BSTimeDifferenceFromMachTimeToMachTime();
      unint64_t v7 = a1[14] - 1;
      if (v7 > 2) {
        uint64_t v8 = @"idle";
      }
      else {
        uint64_t v8 = off_264139A98[v7];
      }
      int v9 = 134219010;
      uint64_t v10 = a1;
      __int16 v11 = 2114;
      unint64_t v12 = v5;
      __int16 v13 = 2114;
      uint64_t v14 = @"abortingSleep";
      __int16 v15 = 2048;
      uint64_t v16 = v6;
      __int16 v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_210809000, v4, OS_LOG_TYPE_DEFAULT, "%p state:%{public}@->%{public}@ elapsed:%.3lfs systemActivityAborting:%{public}@->aborting", (uint8_t *)&v9, 0x34u);
    }

    a1[11] = 2;
    a1[9] = v2;
    a1[14] = 3;
  }
}

- (void)systemActivityRegistryCountDidDecrementToZero:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t lock_systemActivityAbortSleepPhase = self->_lock_systemActivityAbortSleepPhase;
  self->_lock_systemActivitiesAreActive = 0;
  unint64_t v6 = lock_systemActivityAbortSleepPhase - 1;
  if (lock_systemActivityAbortSleepPhase - 1 <= 1) {
    self->_unint64_t lock_systemActivityAbortSleepPhase = 0;
  }
  unint64_t v7 = SWLogPower();
  os_log_type_t v8 = 2 * (lock_systemActivityAbortSleepPhase == 0);
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = self->_lock_state - 1;
    if (v9 > 4) {
      uint64_t v10 = @"waking";
    }
    else {
      uint64_t v10 = off_264139AD0[v9];
    }
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    uint64_t v12 = v11;
    NSStringForSWSystemSleepPowerManagementPhase(self->_lock_powerManagementPhase);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    int lock_powerManagementPhase = self->_lock_powerManagementPhase;
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    if (v6 > 2) {
      uint64_t v16 = @"idle";
    }
    else {
      uint64_t v16 = off_264139A98[v6];
    }
    unint64_t v17 = self->_lock_systemActivityAbortSleepPhase - 1;
    if (v17 > 2) {
      v18 = @"idle";
    }
    else {
      v18 = off_264139A98[v17];
    }
    int v19 = 134219778;
    uint64_t v20 = self;
    __int16 v21 = 2114;
    v22 = v10;
    __int16 v23 = 2048;
    uint64_t v24 = v12;
    __int16 v25 = 2114;
    id v26 = v13;
    __int16 v27 = 1024;
    int v28 = lock_powerManagementPhase;
    __int16 v29 = 2048;
    uint64_t v30 = v15;
    __int16 v31 = 2114;
    __int16 v32 = v16;
    __int16 v33 = 2114;
    __int16 v34 = v18;
    _os_log_impl(&dword_210809000, v7, v8, "%p (zero active system activities) state:%{public}@ elapsed:%.3lfs phase:%{public}@(%u) elapsedPhase:%.3lfs systemActivityAborting:%{public}@->%{public}@", (uint8_t *)&v19, 0x4Eu);
  }
  os_unfair_lock_unlock(p_lock);
}

- (SWSystemSleepMonitorAggregateState)aggregateState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [[SWSystemSleepMonitorAggregateState alloc] initWithSleepMonitorState:self->_lock_state stateTimestamp:self->_lock_stateTimestamp powerManagementPhase:self->_lock_powerManagementPhase phaseTimestamp:self->_powerManagementPhaseTimestamp];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)invalidate
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_allowsInvalidation)
  {
    unint64_t v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_allowsInvalidation"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      unint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      id v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      __int16 v15 = 2048;
      uint64_t v16 = self;
      __int16 v17 = 2114;
      v18 = @"SWSystemSleepMonitor.m";
      __int16 v19 = 1024;
      int v20 = 203;
      __int16 v21 = 2114;
      v22 = v7;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21080B3C0);
  }
  os_unfair_lock_unlock(p_lock);
  [(SWSystemSleepMonitorProviding *)self->_monitorProvider invalidate];
  monitorProvider = self->_monitorProvider;
  self->_monitorProvider = 0;

  [(SWActiveSystemActivityRegistry *)self->_activeSystemActivityRegistry removeObserver:self];
  activeSystemActivityRegistry = self->_activeSystemActivityRegistry;
  self->_activeSystemActivityRegistry = 0;
}

- (void)setSleepSlate:(uint64_t)a3 powerManagementPhase:(uint64_t)a4 notificationID:
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  if (!a1) {
    return;
  }
  id v8 = (os_unfair_lock_s *)(a1 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  uint64_t v9 = mach_continuous_time();
  BSTimeDifferenceFromMachTimeToMachTime();
  uint64_t v11 = v10;
  BSTimeDifferenceFromMachTimeToMachTime();
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)(a1 + 96);
  uint64_t v47 = *(void *)(a1 + 88);
  unint64_t v15 = *(void *)(a1 + 112);
  if (!v15)
  {
    v18 = SWLogPower();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = a4;
      int v20 = NSStringForSWSystemSleepPowerManagementPhase(a3);
      uint64_t v21 = NSStringForSWSystemSleepPowerManagementPhase(v14);
      v22 = (void *)v21;
      if ((unint64_t)(v47 - 1) > 4) {
        uint64_t v23 = @"waking";
      }
      else {
        uint64_t v23 = off_264139AD0[v47 - 1];
      }
      if ((unint64_t)(a2 - 1) > 3) {
        __int16 v27 = @"waking";
      }
      else {
        __int16 v27 = off_264139A78[a2 - 1];
      }
      *(_DWORD *)buf = 134220290;
      id v49 = (id)a1;
      __int16 v50 = 2114;
      uint64_t v51 = (uint64_t)v20;
      __int16 v52 = 1024;
      *(_DWORD *)v53 = a3;
      *(_WORD *)&v53[4] = 2114;
      *(void *)&v53[6] = v21;
      *(_WORD *)&v53[14] = 1024;
      *(_DWORD *)&v53[16] = v14;
      *(_WORD *)v54 = 2048;
      *(void *)&v54[2] = v11;
      *(_WORD *)&v54[10] = 2114;
      *(void *)&v54[12] = v23;
      __int16 v55 = 2114;
      v56 = v27;
      __int16 v57 = 2048;
      uint64_t v58 = v13;
      __int16 v59 = 2048;
      uint64_t v60 = v19;
      _os_log_impl(&dword_210809000, v18, OS_LOG_TYPE_DEFAULT, "%p systemPowerChanged:%{public}@(%u) previous:%{public}@(%u) elapsedPhase:%.3lfs state:%{public}@->%{public}@ elapsedState:%.3lfs notificationID:%ld", buf, 0x5Eu);

      a4 = v19;
    }
    int v16 = 0;
    goto LABEL_55;
  }
  int v16 = 0;
  if (a3 > 3758097039)
  {
    if (a3 != 3758097040 && a3 != 3758097152 && a3 != 3758097184)
    {
LABEL_36:
      v18 = SWLogPower();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v46 = a4;
        __int16 v32 = NSStringForSWSystemSleepPowerManagementPhase(a3);
        uint64_t v33 = NSStringForSWSystemSleepPowerManagementPhase(v14);
        __int16 v34 = (void *)v33;
        if ((unint64_t)(v47 - 1) > 4) {
          uint64_t v35 = @"waking";
        }
        else {
          uint64_t v35 = off_264139AD0[v47 - 1];
        }
        if ((unint64_t)(a2 - 1) > 3) {
          __int16 v36 = @"waking";
        }
        else {
          __int16 v36 = off_264139A78[a2 - 1];
        }
        unint64_t v37 = *(void *)(a1 + 112) - 1;
        if (v37 > 2) {
          __int16 v38 = @"idle";
        }
        else {
          __int16 v38 = off_264139A98[v37];
        }
        *(_DWORD *)buf = 134220546;
        id v49 = (id)a1;
        __int16 v50 = 2114;
        uint64_t v51 = (uint64_t)v32;
        __int16 v52 = 1024;
        *(_DWORD *)v53 = a3;
        *(_WORD *)&v53[4] = 2114;
        *(void *)&v53[6] = v33;
        *(_WORD *)&v53[14] = 1024;
        *(_DWORD *)&v53[16] = v14;
        *(_WORD *)v54 = 2048;
        *(void *)&v54[2] = v11;
        *(_WORD *)&v54[10] = 2114;
        *(void *)&v54[12] = v35;
        __int16 v55 = 2114;
        v56 = v36;
        __int16 v57 = 2048;
        uint64_t v58 = v13;
        __int16 v59 = 2048;
        uint64_t v60 = v46;
        __int16 v61 = 2114;
        v62 = v38;
        _os_log_impl(&dword_210809000, v18, OS_LOG_TYPE_DEFAULT, "%p systemPowerChanged:%{public}@(%u) previous:%{public}@(%u) elapsedPhase:%.3lfs state:%{public}@->%{public}@ elapsedState:%.3lfs notificationID:%ld systemActivityAborting:%{public}@", buf, 0x68u);

        a4 = v46;
      }
      goto LABEL_55;
    }
    if (v15 != 3)
    {
      int v16 = 0;
      goto LABEL_36;
    }
    uint64_t v17 = 1;
    goto LABEL_19;
  }
  if (a3 != 3758097008 && a3 != 3758097024)
  {
    if (!a3)
    {
      int v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"powerManagementPhase != SWSystemSleepPowerManagementPhaseInitialized"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_setSleepSlate_powerManagementPhase_notificationID_);
        id v29 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v30 = (objc_class *)objc_opt_class();
        __int16 v31 = NSStringFromClass(v30);
        *(_DWORD *)buf = 138544642;
        id v49 = v29;
        __int16 v50 = 2114;
        uint64_t v51 = (uint64_t)v31;
        __int16 v52 = 2048;
        *(void *)v53 = a1;
        *(_WORD *)&v53[8] = 2114;
        *(void *)&v53[10] = @"SWSystemSleepMonitor.m";
        *(_WORD *)&v53[18] = 1024;
        *(_DWORD *)v54 = 229;
        *(_WORD *)&v54[4] = 2114;
        *(void *)&v54[6] = v28;
        _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v28 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21080B7B0);
    }
    goto LABEL_36;
  }
  if (v15 < 2)
  {
    uint64_t v17 = 0;
LABEL_19:
    int v16 = 0;
    *(void *)(a1 + 112) = v17;
    goto LABEL_20;
  }
  if (v15 != 2)
  {
    int v16 = 0;
    if (v47 == 2) {
      a2 = 2;
    }
    goto LABEL_36;
  }
  int v16 = 1;
  uint64_t v17 = 2;
LABEL_20:
  if (v17 == v15) {
    goto LABEL_36;
  }
  v18 = SWLogPower();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v45 = a4;
    uint64_t v24 = NSStringForSWSystemSleepPowerManagementPhase(a3);
    uint64_t v25 = NSStringForSWSystemSleepPowerManagementPhase(v14);
    if ((unint64_t)(v47 - 1) > 4) {
      id v26 = @"waking";
    }
    else {
      id v26 = off_264139AD0[v47 - 1];
    }
    if ((unint64_t)(a2 - 1) > 3) {
      v39 = @"waking";
    }
    else {
      v39 = off_264139A78[a2 - 1];
    }
    uint64_t v40 = off_264139A98[v15 - 1];
    v41 = (void *)v24;
    unint64_t v42 = *(void *)(a1 + 112) - 1;
    if (v42 > 2) {
      v43 = @"idle";
    }
    else {
      v43 = off_264139A98[v42];
    }
    *(_DWORD *)buf = 134220802;
    id v49 = (id)a1;
    __int16 v50 = 2114;
    uint64_t v51 = v24;
    __int16 v52 = 1024;
    *(_DWORD *)v53 = a3;
    *(_WORD *)&v53[4] = 2114;
    *(void *)&v53[6] = v25;
    *(_WORD *)&v53[14] = 1024;
    *(_DWORD *)&v53[16] = v14;
    *(_WORD *)v54 = 2048;
    *(void *)&v54[2] = v11;
    *(_WORD *)&v54[10] = 2114;
    *(void *)&v54[12] = v26;
    __int16 v55 = 2114;
    v56 = v39;
    __int16 v57 = 2048;
    uint64_t v58 = v13;
    __int16 v59 = 2048;
    uint64_t v60 = v45;
    __int16 v61 = 2114;
    v62 = v40;
    __int16 v63 = 2114;
    v64 = v43;
    v44 = (void *)v25;
    _os_log_impl(&dword_210809000, v18, OS_LOG_TYPE_DEFAULT, "%p systemPowerChanged:%{public}@(%u) previous:%{public}@(%u) elapsedPhase:%.3lfs state:%{public}@->%{public}@ elapsedState:%.3lfs notificationID:%ld systemActivityAborting:%{public}@->%{public}@", buf, 0x72u);

    a4 = v45;
  }
LABEL_55:

  *(void *)(a1 + 96) = a3;
  *(void *)(a1 + 104) = a4;
  if (a2 != v47)
  {
    *(void *)(a1 + 88) = a2;
    *(void *)(a1 + 72) = v9;
  }
  *(void *)(a1 + 80) = v9;
  if (v16) {
    -[SWSystemSleepMonitor _lock_setSleepSlateAbortingSleepForSystemActivity]((void *)a1);
  }
  os_unfair_lock_unlock(v8);
}

- (void)setSleepSlate:(uint64_t)a1 forPowerManagementNotificationID:(uint64_t)a2 notificationTimestamp:(__CFString *)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (a1)
  {
    unint64_t v6 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    uint64_t v7 = mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    uint64_t v9 = v8;
    BSTimeDifferenceFromMachTimeToMachTime();
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)(a1 + 88);
    uint64_t v14 = *(__CFString **)(a1 + 104);
    uint64_t v13 = *(void *)(a1 + 112);
    if (v14 == a3)
    {
      unint64_t v15 = SWLogPower();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v13 != 3)
      {
        if (v16)
        {
          if ((unint64_t)(v12 - 1) > 4) {
            v18 = @"waking";
          }
          else {
            v18 = off_264139AD0[v12 - 1];
          }
          if ((unint64_t)(a2 - 2) > 3) {
            int v20 = @"waking";
          }
          else {
            int v20 = off_264139AB0[a2 - 2];
          }
          uint64_t v21 = @"idle";
          if (v13 == 1) {
            uint64_t v21 = @"aborted";
          }
          if (v13 == 2) {
            uint64_t v21 = @"pending";
          }
          v22 = v21;
          int v26 = 134219266;
          uint64_t v27 = a1;
          __int16 v28 = 2114;
          id v29 = v18;
          __int16 v30 = 2114;
          __int16 v31 = v20;
          __int16 v32 = 2048;
          uint64_t v33 = v9;
          __int16 v34 = 2048;
          uint64_t v35 = v11;
          __int16 v36 = 2114;
          unint64_t v37 = v22;
          _os_log_impl(&dword_210809000, v15, OS_LOG_TYPE_DEFAULT, "%p state:%{public}@->%{public}@ elapsed:%.3lfs(%.3lfs) systemActivityAborting:%{public}@", (uint8_t *)&v26, 0x3Eu);
        }
        *(void *)(a1 + 88) = a2;
        *(void *)(a1 + 72) = v7;
        goto LABEL_28;
      }
      if (v16)
      {
        if ((unint64_t)(a2 - 2) > 3) {
          uint64_t v17 = @"waking";
        }
        else {
          uint64_t v17 = off_264139AB0[a2 - 2];
        }
        if ((unint64_t)(v12 - 1) > 4) {
          uint64_t v19 = @"waking";
        }
        else {
          uint64_t v19 = off_264139AD0[v12 - 1];
        }
        int v26 = 134219778;
        uint64_t v27 = a1;
        __int16 v28 = 2114;
        id v29 = v17;
        __int16 v30 = 2048;
        __int16 v31 = a3;
        __int16 v32 = 2048;
        uint64_t v33 = v11;
        __int16 v34 = 2114;
        uint64_t v35 = v19;
        __int16 v36 = 2048;
        unint64_t v37 = v9;
        __int16 v38 = 2048;
        v39 = a3;
        __int16 v40 = 2114;
        v41 = @"aborting";
        _os_log_impl(&dword_210809000, v15, OS_LOG_TYPE_DEFAULT, "%p obsolete request to update to state:%{public}@ forID:%ld elapsed:%.3lfs – currentState:%{public}@ elapsed:%.3lfs currentID:%ld systemActivityAborting:%{public}@", (uint8_t *)&v26, 0x52u);
      }
    }
    else
    {
      unint64_t v15 = SWLogPower();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        if ((unint64_t)(a2 - 2) > 3) {
          uint64_t v23 = @"waking";
        }
        else {
          uint64_t v23 = off_264139AB0[a2 - 2];
        }
        if ((unint64_t)(v12 - 1) > 4) {
          uint64_t v24 = @"waking";
        }
        else {
          uint64_t v24 = off_264139AD0[v12 - 1];
        }
        if ((unint64_t)(v13 - 1) > 2) {
          uint64_t v25 = @"idle";
        }
        else {
          uint64_t v25 = off_264139A98[v13 - 1];
        }
        int v26 = 134219778;
        uint64_t v27 = a1;
        __int16 v28 = 2114;
        id v29 = v23;
        __int16 v30 = 2048;
        __int16 v31 = a3;
        __int16 v32 = 2048;
        uint64_t v33 = v11;
        __int16 v34 = 2114;
        uint64_t v35 = v24;
        __int16 v36 = 2048;
        unint64_t v37 = v9;
        __int16 v38 = 2048;
        v39 = v14;
        __int16 v40 = 2114;
        v41 = v25;
        _os_log_error_impl(&dword_210809000, v15, OS_LOG_TYPE_ERROR, "%p stale request to update to state:%{public}@ forID:%ld elapsed:%.3lfs – currentState:%{public}@ elapsed:%.3lfs currentID:%ld systemActivityAborting:%{public}@", (uint8_t *)&v26, 0x52u);
      }
    }

LABEL_28:
    os_unfair_lock_unlock(v6);
  }
}

- (void)systemPowerChanged:(unsigned int)a3 notificationID:(void *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  HIDWORD(v7) = a3;
  LODWORD(v7) = a3 + 536870288;
  switch((v7 >> 4))
  {
    case 0u:
      -[SWSystemSleepMonitor setSleepSlate:powerManagementPhase:notificationID:]((uint64_t)self, 3, a3, (uint64_t)a4);
      if (self)
      {
        id v8 = SWLogPower();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = a4;
          _os_log_debug_impl(&dword_210809000, v8, OS_LOG_TYPE_DEBUG, "%p sleepRequestedWithNotificationID:%ld", buf, 0x16u);
        }

        uint64_t v9 = mach_continuous_time();
        *(void *)&long long v23 = MEMORY[0x263EF8330];
        *((void *)&v23 + 1) = 3221225472;
        *(void *)&long long v24 = __57__SWSystemSleepMonitor_sleepRequestedWithNotificationID___block_invoke;
        *((void *)&v24 + 1) = &unk_264139808;
        *(void *)&long long v25 = self;
        *((void *)&v25 + 1) = a4;
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __57__SWSystemSleepMonitor_sleepRequestedWithNotificationID___block_invoke_55;
        *(void *)&buf[24] = &unk_264139830;
        __int16 v28 = self;
        id v29 = a4;
        uint64_t v30 = v9;
        -[SWSystemSleepMonitor observersOfSelector:performObserverBlock:completion:]((uint64_t)self, sel_systemSleepMonitor_sleepRequestedWithResult_, &v23, buf);
      }
      break;
    case 1u:
      -[SWSystemSleepMonitor setSleepSlate:powerManagementPhase:notificationID:]((uint64_t)self, 4, a3, (uint64_t)a4);
      if (self)
      {
        uint64_t v10 = SWLogPower();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = a4;
          _os_log_debug_impl(&dword_210809000, v10, OS_LOG_TYPE_DEBUG, "%p prepareForSleepWithNotificationID:%ld", buf, 0x16u);
        }

        uint64_t v11 = mach_continuous_time();
        *(void *)&long long v23 = MEMORY[0x263EF8330];
        *((void *)&v23 + 1) = 3221225472;
        *(void *)&long long v24 = __58__SWSystemSleepMonitor_prepareForSleepWithNotificationID___block_invoke;
        *((void *)&v24 + 1) = &unk_264139808;
        *(void *)&long long v25 = self;
        *((void *)&v25 + 1) = a4;
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __58__SWSystemSleepMonitor_prepareForSleepWithNotificationID___block_invoke_60;
        *(void *)&buf[24] = &unk_264139830;
        __int16 v28 = self;
        id v29 = a4;
        uint64_t v30 = v11;
        -[SWSystemSleepMonitor observersOfSelector:performObserverBlock:completion:]((uint64_t)self, sel_systemSleepMonitor_prepareForSleepWithCompletion_, &v23, buf);
      }
      break;
    case 2u:
      -[SWSystemSleepMonitor setSleepSlate:powerManagementPhase:notificationID:]((uint64_t)self, 1, a3, (uint64_t)a4);
      if (self)
      {
        -[SWSystemSleepMonitor observersRespondingToSelector:]((uint64_t)self, (uint64_t)sel_systemSleepMonitorSleepRequestAborted_);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:buf count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v24 != v14) {
                objc_enumerationMutation(v12);
              }
              objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "systemSleepMonitorSleepRequestAborted:", self, (void)v23);
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:buf count:16];
          }
          while (v13);
        }
        goto LABEL_39;
      }
      break;
    case 9u:
      -[SWSystemSleepMonitor setSleepSlate:powerManagementPhase:notificationID:]((uint64_t)self, 1, a3, (uint64_t)a4);
      if (self)
      {
        -[SWSystemSleepMonitor observersRespondingToSelector:]((uint64_t)self, (uint64_t)sel_systemSleepMonitorDidWakeFromSleep_);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = [v12 countByEnumeratingWithState:&v23 objects:buf count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v24 != v18) {
                objc_enumerationMutation(v12);
              }
              objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "systemSleepMonitorDidWakeFromSleep:", self, (void)v23);
            }
            uint64_t v17 = [v12 countByEnumeratingWithState:&v23 objects:buf count:16];
          }
          while (v17);
        }
        goto LABEL_39;
      }
      break;
    case 0xBu:
      -[SWSystemSleepMonitor setSleepSlate:powerManagementPhase:notificationID:]((uint64_t)self, 0, a3, (uint64_t)a4);
      if (self)
      {
        -[SWSystemSleepMonitor observersRespondingToSelector:]((uint64_t)self, (uint64_t)sel_systemSleepMonitorWillWakeFromSleep_);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = [v12 countByEnumeratingWithState:&v23 objects:buf count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v24;
          do
          {
            for (uint64_t k = 0; k != v20; ++k)
            {
              if (*(void *)v24 != v21) {
                objc_enumerationMutation(v12);
              }
              objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * k), "systemSleepMonitorWillWakeFromSleep:", self, (void)v23);
            }
            uint64_t v20 = [v12 countByEnumeratingWithState:&v23 objects:buf count:16];
          }
          while (v20);
        }
LABEL_39:
      }
      break;
    default:
      BOOL v16 = SWLogPower();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = a3;
        *(_WORD *)&buf[18] = 2048;
        *(void *)&buf[20] = a4;
        _os_log_error_impl(&dword_210809000, v16, OS_LOG_TYPE_ERROR, "%p unexpected powerChangedMessage:%u notificationID:%p", buf, 0x1Cu);
      }

      break;
  }
}

void __57__SWSystemSleepMonitor_sleepRequestedWithNotificationID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = SWLogPower();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    id v21 = v5;
    __int16 v22 = 2048;
    uint64_t v23 = v13;
    _os_log_debug_impl(&dword_210809000, v7, OS_LOG_TYPE_DEBUG, "%p sleepRequested observer:%{public}@ notificationID:%ld", buf, 0x20u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__SWSystemSleepMonitor_sleepRequestedWithNotificationID___block_invoke_52;
  v14[3] = &unk_2641397E0;
  v14[4] = v8;
  id v9 = v5;
  uint64_t v10 = *(void *)(a1 + 40);
  id v15 = v9;
  uint64_t v17 = v10;
  id v11 = v6;
  id v16 = v11;
  [v9 systemSleepMonitor:v8 sleepRequestedWithResult:v14];
}

id __57__SWSystemSleepMonitor_sleepRequestedWithNotificationID___block_invoke_52(void *a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = SWLogPower();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = a1[4];
    uint64_t v12 = a1[5];
    uint64_t v13 = a1[7];
    int v17 = 134218754;
    uint64_t v18 = v11;
    __int16 v19 = 1024;
    *(_DWORD *)__int16 v20 = a2;
    *(_WORD *)&v20[4] = 2114;
    *(void *)&v20[6] = v12;
    *(_WORD *)&v20[14] = 2048;
    *(void *)&v20[16] = v13;
    _os_log_debug_impl(&dword_210809000, v6, OS_LOG_TYPE_DEBUG, "%p sleepRequested response allowSystemSleep:%{BOOL}u observer:%{public}@ notificationID:%ld", (uint8_t *)&v17, 0x26u);
  }

  if (a2)
  {
    unint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = [*(id *)(a1[4] + 32) acquirePreventSystemSleepAssertionWithIdentifier:v5];
    id v9 = SWLogPower();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = a1[4];
      uint64_t v15 = a1[5];
      uint64_t v16 = a1[7];
      int v17 = 134218754;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      *(void *)__int16 v20 = v8;
      *(_WORD *)&v20[8] = 2114;
      *(void *)&v20[10] = v15;
      *(_WORD *)&v20[18] = 2048;
      *(void *)&v20[20] = v16;
      _os_log_debug_impl(&dword_210809000, v9, OS_LOG_TYPE_DEBUG, "%p sleepRequested response assertion:%{BOOL}@ observer:%{public}@ notificationID:%ld", (uint8_t *)&v17, 0x2Au);
    }

    unint64_t v7 = (void *)v8;
  }
  (*(void (**)(void))(a1[6] + 16))();

  return v7;
}

uint64_t __57__SWSystemSleepMonitor_sleepRequestedWithNotificationID___block_invoke_55(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = SWLogPower();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 134218496;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 2048;
    uint64_t v14 = v8;
    _os_log_debug_impl(&dword_210809000, v4, OS_LOG_TYPE_DEBUG, "%p sleepRequested preventSystemSleep:%{BOOL}u notificationID:%ld", (uint8_t *)&v9, 0x1Cu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (!a2) {
    return [*(id *)(v5 + 24) allowPowerChange:*(void *)(a1 + 40)];
  }
  -[SWSystemSleepMonitor setSleepSlate:forPowerManagementNotificationID:notificationTimestamp:](v5, 2, *(__CFString **)(a1 + 40));
  return [*(id *)(*(void *)(a1 + 32) + 24) cancelPowerChange:*(void *)(a1 + 40)];
}

- (void)observersOfSelector:(void *)a3 performObserverBlock:(void *)a4 completion:
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  long long v26 = a3;
  id v7 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  uint64_t v8 = *(void *)(a1 + 64) + 1;
  *(void *)(a1 + 64) = v8;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  __int16 v50 = __Block_byref_object_copy_;
  uint64_t v51 = __Block_byref_object_dispose_;
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __76__SWSystemSleepMonitor_observersOfSelector_performObserverBlock_completion___block_invoke;
  v43[3] = &unk_264139880;
  uint64_t v25 = v8;
  v43[4] = a1;
  uint64_t v45 = v8;
  id v20 = v7;
  id v44 = v20;
  uint64_t v46 = a2;
  id v52 = (id)MEMORY[0x216673C60](v43);
  uint64_t v21 = -[SWSystemSleepMonitor observersRespondingToSelector:](a1, (uint64_t)a2);
  if ([v21 count])
  {
    int v9 = (void *)MEMORY[0x263F29BF0];
    uint64_t v10 = *(void *)(a1 + 8);
    uint64_t v11 = [v21 count];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __76__SWSystemSleepMonitor_observersOfSelector_performObserverBlock_completion___block_invoke_64;
    v42[3] = &unk_2641398A8;
    v42[4] = a1;
    v42[5] = &v47;
    v42[6] = v8;
    v42[7] = a2;
    uint64_t v24 = [v9 sentinelWithQueue:v10 signalCount:v11 signalHandler:v42];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = v21;
    uint64_t v12 = [obj countByEnumeratingWithState:&v38 objects:v53 count:16];
    if (v12)
    {
      uint64_t v23 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v39 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          v36[0] = 0;
          v36[1] = v36;
          v36[2] = 0x2020000000;
          char v37 = 0;
          id v15 = objc_alloc(MEMORY[0x263F29CD8]);
          uint64_t v16 = NSStringFromSelector(a2);
          int v17 = [NSString stringWithFormat:@"response from <%@: %p> must be made exactly once", objc_opt_class(), v14];
          uint64_t v18 = (void *)[v15 initWithIdentifier:v16 forReason:v17 invalidationBlock:&__block_literal_global_75];

          v27[0] = MEMORY[0x263EF8330];
          v27[1] = 3221225472;
          v27[2] = __76__SWSystemSleepMonitor_observersOfSelector_performObserverBlock_completion___block_invoke_2;
          v27[3] = &unk_2641398F0;
          id v19 = v18;
          id v28 = v19;
          uint64_t v29 = a1;
          uint64_t v33 = sel_observersOfSelector_performObserverBlock_completion_;
          uint64_t v34 = v25;
          uint64_t v35 = a2;
          __int16 v32 = v36;
          uint64_t v30 = v14;
          id v31 = v24;
          v26[2](v26, v14, v27);

          _Block_object_dispose(v36, 8);
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v38 objects:v53 count:16];
      }
      while (v12);
    }
  }
  else
  {
    (*(void (**)(void))(v48[5] + 16))();
  }

  _Block_object_dispose(&v47, 8);
}

void __58__SWSystemSleepMonitor_prepareForSleepWithNotificationID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = SWLogPower();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    id v21 = v5;
    __int16 v22 = 2048;
    uint64_t v23 = v13;
    _os_log_debug_impl(&dword_210809000, v7, OS_LOG_TYPE_DEBUG, "%p prepareForSleep observer:%{public}@ notificationID:%ld", buf, 0x20u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __58__SWSystemSleepMonitor_prepareForSleepWithNotificationID___block_invoke_59;
  v14[3] = &unk_264139858;
  v14[4] = v8;
  id v9 = v5;
  uint64_t v10 = *(void *)(a1 + 40);
  id v15 = v9;
  uint64_t v17 = v10;
  id v11 = v6;
  id v16 = v11;
  [v9 systemSleepMonitor:v8 prepareForSleepWithCompletion:v14];
}

uint64_t __58__SWSystemSleepMonitor_prepareForSleepWithNotificationID___block_invoke_59(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = SWLogPower();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[7];
    int v7 = 134218498;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    _os_log_debug_impl(&dword_210809000, v2, OS_LOG_TYPE_DEBUG, "%p prepareForSleep response observer:%{public}@ notificationID:%ld", (uint8_t *)&v7, 0x20u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __58__SWSystemSleepMonitor_prepareForSleepWithNotificationID___block_invoke_60(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = SWLogPower();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 134218240;
    uint64_t v7 = v4;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_log_debug_impl(&dword_210809000, v2, OS_LOG_TYPE_DEBUG, "%p prepareForSleep complete notificationID:%ld", (uint8_t *)&v6, 0x16u);
  }

  -[SWSystemSleepMonitor setSleepSlate:forPowerManagementNotificationID:notificationTimestamp:](*(void *)(a1 + 32), 5, *(__CFString **)(a1 + 40));
  return [*(id *)(*(void *)(a1 + 32) + 24) allowPowerChange:*(void *)(a1 + 40)];
}

void __76__SWSystemSleepMonitor_observersOfSelector_performObserverBlock_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 64);
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 40));
  if (v4 == v6)
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v7();
  }
  else
  {
    __int16 v8 = SWLogPower();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 48);
      __int16 v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v12 = 134218754;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      uint64_t v15 = v10;
      __int16 v16 = 1024;
      int v17 = a2 ^ 1;
      __int16 v18 = 2114;
      uint64_t v19 = v11;
      _os_log_impl(&dword_210809000, v8, OS_LOG_TYPE_DEFAULT, "%p (%llu) final response(%{BOOL}u) to %{public}@ came too late", (uint8_t *)&v12, 0x26u);
    }
  }
}

- (id)observersRespondingToSelector:(uint64_t)a1
{
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  uint64_t v5 = [*(id *)(a1 + 48) allObjects];
  os_unfair_lock_unlock(v4);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__SWSystemSleepMonitor_observersRespondingToSelector___block_invoke;
  v9[3] = &__block_descriptor_40_e40_B32__0___SWSystemSleepObserver__8Q16_B24l;
  v9[4] = a2;
  uint64_t v6 = [v5 indexesOfObjectsPassingTest:v9];
  uint64_t v7 = [v5 objectsAtIndexes:v6];

  return v7;
}

void __76__SWSystemSleepMonitor_observersOfSelector_performObserverBlock_completion___block_invoke_64(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 context];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0 && ([v4 BOOLValue] & 1) != 0)
  {
    uint64_t v5 = 1;
  }
  else
  {
    if (![v3 isComplete]) {
      goto LABEL_12;
    }
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v5);
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    __int16 v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
  else
  {
    uint64_t v9 = SWLogPower();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 48);
      int v12 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v13 = 134218754;
      uint64_t v14 = v10;
      __int16 v15 = 2048;
      uint64_t v16 = v11;
      __int16 v17 = 1024;
      int v18 = v5 ^ 1;
      __int16 v19 = 2114;
      uint64_t v20 = v12;
      _os_log_debug_impl(&dword_210809000, v9, OS_LOG_TYPE_DEBUG, "%p (%llu) response(%{BOOL}u) to %{public}@ after early completion", (uint8_t *)&v13, 0x26u);
    }
  }
LABEL_12:
}

uint64_t __76__SWSystemSleepMonitor_observersOfSelector_performObserverBlock_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) invalidate];
  uint64_t v4 = (unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  __swp(v4, v4);
  if (v4)
  {
    __int16 v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!hadBeenCalled"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 72));
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v17 = (objc_class *)objc_opt_class();
      int v18 = NSStringFromClass(v17);
      uint64_t v19 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544642;
      id v21 = v16;
      __int16 v22 = 2114;
      uint64_t v23 = v18;
      __int16 v24 = 2048;
      *(void *)uint64_t v25 = v19;
      *(_WORD *)&v25[8] = 2114;
      *(void *)&v25[10] = @"SWSystemSleepMonitor.m";
      *(_WORD *)&v25[18] = 1024;
      *(_DWORD *)&v25[20] = 468;
      __int16 v26 = 2114;
      uint64_t v27 = v15;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21080D868);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40));
  uint64_t v5 = *(void *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(v6 + 64);
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 40));
  if (v5 != v7)
  {
    __int16 v8 = SWLogPower();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void **)(a1 + 40);
      int v12 = *(void **)(a1 + 80);
      int v13 = NSStringFromSelector(*(SEL *)(a1 + 88));
      uint64_t v14 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134219010;
      id v21 = v11;
      __int16 v22 = 2048;
      uint64_t v23 = v12;
      __int16 v24 = 1024;
      *(_DWORD *)uint64_t v25 = a2 ^ 1;
      *(_WORD *)&v25[4] = 2114;
      *(void *)&v25[6] = v13;
      *(_WORD *)&v25[14] = 2114;
      *(void *)&v25[16] = v14;
      _os_log_error_impl(&dword_210809000, v8, OS_LOG_TYPE_ERROR, "%p (%llu) response(%{BOOL}u to %{public}@ from:%{public}@ came too late", buf, 0x30u);
    }
  }
  uint64_t v9 = *(void **)(a1 + 56);
  if (a2) {
    return [v9 signalWithContext:MEMORY[0x263EFFA88]];
  }
  else {
    return [v9 signal];
  }
}

- (void)addObserver:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (!v9)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"observer != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = (objc_class *)objc_opt_class();
      __int16 v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138544642;
      id v11 = v6;
      __int16 v12 = 2114;
      int v13 = v8;
      __int16 v14 = 2048;
      __int16 v15 = self;
      __int16 v16 = 2114;
      __int16 v17 = @"SWSystemSleepMonitor.m";
      __int16 v18 = 1024;
      int v19 = 509;
      __int16 v20 = 2114;
      id v21 = v5;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21080DA40);
  }
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_lock_observers addObject:v9];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObserver:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (!v9)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"observer != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = (objc_class *)objc_opt_class();
      __int16 v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138544642;
      id v11 = v6;
      __int16 v12 = 2114;
      int v13 = v8;
      __int16 v14 = 2048;
      __int16 v15 = self;
      __int16 v16 = 2114;
      __int16 v17 = @"SWSystemSleepMonitor.m";
      __int16 v18 = 1024;
      int v19 = 516;
      __int16 v20 = 2114;
      id v21 = v5;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21080DC20);
  }
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v9];
  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __54__SWSystemSleepMonitor_observersRespondingToSelector___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureHandler, 0);
  objc_storeStrong((id *)&self->_activeSystemActivityRegistry, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_sleepAssertionProvider, 0);
  objc_storeStrong((id *)&self->_monitorProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end