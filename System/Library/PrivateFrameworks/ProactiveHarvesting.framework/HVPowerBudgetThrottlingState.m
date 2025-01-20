@interface HVPowerBudgetThrottlingState
- (HVPowerBudgetThrottlingState)initWithPath:(id)a3 log:(id)a4;
- (id)state;
- (uint64_t)_updateOperationProgress;
- (unsigned)canDoDiscretionaryWork;
- (unsigned)canDoDiscretionaryWork:(unsigned int *)a3;
- (unsigned)canDoExtraDiscretionaryWork;
- (void)_writeThrottleStateLocked;
- (void)checkBatteryStateForRefill;
- (void)dealloc;
- (void)didConsumeAnExtraBudgetedOperation;
- (void)endWork;
- (void)refillState;
- (void)startWork;
- (void)updateState:(unsigned int)a3;
@end

@implementation HVPowerBudgetThrottlingState

- (void).cxx_destruct
{
}

- (void)updateState:(unsigned int)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (!self->_hasClassCUnlock || self->_state.magic == -1804290770 && self->_state.budgetState == a3)
  {
    pthread_mutex_unlock(p_lock);
  }
  else
  {
    v6 = [MEMORY[0x263EFF910] date];
    [v6 timeIntervalSinceReferenceDate];
    int64_t v8 = (unint64_t)v7;

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 > 7) {
        v10 = @"Unknown reason";
      }
      else {
        v10 = off_2647D4CA8[a3];
      }
      uint64_t budgetState = self->_state.budgetState;
      if (budgetState > 7) {
        v12 = @"Unknown reason";
      }
      else {
        v12 = off_2647D4CA8[budgetState];
      }
      int64_t v13 = v8 - self->_state.timeOfLastChange;
      int v15 = 138412802;
      v16 = v10;
      __int16 v17 = 2112;
      v18 = v12;
      __int16 v19 = 2048;
      int64_t v20 = v13;
      v14 = log;
      _os_log_impl(&dword_226C41000, v14, OS_LOG_TYPE_DEFAULT, "Budget Status Changed to \"%@\" from \"%@\" after %llu seconds", (uint8_t *)&v15, 0x20u);
    }
    self->_state.magic = -1804290770;
    self->_state.uint64_t budgetState = a3;
    self->_state.timeOfLastChange = v8;
    -[HVPowerBudgetThrottlingState _writeThrottleStateLocked]((uint64_t)self);
    pthread_mutex_unlock(p_lock);
  }
}

- (void)_writeThrottleStateLocked
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226C41000, v2, OS_LOG_TYPE_INFO, "Writing throttle state", buf, 2u);
    }
    if (!*(unsigned char *)(a1 + 136))
    {
      v9 = [MEMORY[0x263F08690] currentHandler];
      [v9 handleFailureInMethod:sel__writeThrottleStateLocked, a1, @"HVPowerBudget.m", 532, @"Invalid parameter not satisfying: %@", @"_hasClassCUnlock" object file lineNumber description];
    }
    int v3 = *(_DWORD *)(a1 + 128);
    if ((v3 & 0x80000000) == 0 && pwrite(v3, (const void *)(a1 + 80), 0x20uLL, 0) != 32)
    {
      v4 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = v4;
        int v6 = *__error();
        double v7 = __error();
        int64_t v8 = strerror(*v7);
        *(_DWORD *)buf = 67109378;
        int v11 = v6;
        __int16 v12 = 2080;
        int64_t v13 = v8;
        _os_log_error_impl(&dword_226C41000, v5, OS_LOG_TYPE_ERROR, "Throttle state write truncated [%i] %s", buf, 0x12u);
      }
    }
  }
}

- (void)didConsumeAnExtraBudgetedOperation
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_hasClassCUnlock)
  {
    if ((HVIsConnectedToPower() & 1) == 0) {
      self->_wasOnBattery = 1;
    }
    if (!+[HVUserDefaults harvestBudgetDisabled]
      && !+[HVUserDefaults harvestBudgetThrottleBudgetDisabled])
    {
      self->_wasEnabled = 1;
    }
    if (self->_wasOnBattery && self->_wasEnabled)
    {
      int extraOpsLeft = self->_state.extraOpsLeft;
      BOOL v5 = __OFSUB__(extraOpsLeft, 1);
      int v6 = extraOpsLeft - 1;
      if (v6 < 0 == v5)
      {
        self->_state.int extraOpsLeft = v6;
        -[HVPowerBudgetThrottlingState _writeThrottleStateLocked]((uint64_t)self);
      }
    }
  }

  pthread_mutex_unlock(p_lock);
}

- (void)endWork
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_hasClassCUnlock && self->_opInProgress)
  {
    -[HVPowerBudgetThrottlingState _updateOperationProgress]((uint64_t)self);
    if (self->_wasOnBattery && self->_wasEnabled)
    {
      int opsLeft = self->_state.opsLeft;
      BOOL v5 = __OFSUB__(opsLeft, 1);
      int v6 = opsLeft - 1;
      if (v6 < 0 == v5)
      {
        int64_t nsecLeft = self->_state.nsecLeft;
        if (nsecLeft >= 1)
        {
          self->_state.int opsLeft = v6;
          self->_state.int64_t nsecLeft = nsecLeft - self->_timeSinceOpStart;
          -[HVPowerBudgetThrottlingState _writeThrottleStateLocked]((uint64_t)self);
        }
      }
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v9 = self->_state.nsecLeft;
      double v10 = (double)self->_timeSinceOpStart * 0.000001;
      int v11 = "YES";
      if (self->_wasOnBattery) {
        __int16 v12 = "YES";
      }
      else {
        __int16 v12 = "NO";
      }
      if (!self->_wasEnabled) {
        int v11 = "NO";
      }
      int v13 = self->_state.opsLeft;
      int v14 = 134219266;
      double v15 = v10;
      __int16 v16 = 2048;
      double v17 = (double)v9 * 0.000001;
      __int16 v18 = 2080;
      __int16 v19 = v12;
      __int16 v20 = 2080;
      uint64_t v21 = v11;
      __int16 v22 = 1024;
      int v23 = v13;
      __int16 v24 = 2048;
      int64_t v25 = v9;
      _os_log_impl(&dword_226C41000, log, OS_LOG_TYPE_DEFAULT, "Ending throttled work; duration was %f ms (%f ms left), wasOnBattery %s, wasEnabled %s, Throttle Budget: %d ops "
        "left, %lld ns left",
        (uint8_t *)&v14,
        0x3Au);
    }
    self->_opInProgress = 0;
    self->_timeSinceOpStart = 0;
    *(_WORD *)&self->_wasOnBattery = 0;
  }
  pthread_mutex_unlock(p_lock);
}

- (uint64_t)_updateOperationProgress
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*(unsigned char *)(result + 136))
    {
      int v3 = [MEMORY[0x263F08690] currentHandler];
      [v3 handleFailureInMethod:sel__updateOperationProgress, v1, @"HVPowerBudget.m", 543, @"Invalid parameter not satisfying: %@", @"_hasClassCUnlock" object file lineNumber description];
    }
    uint64_t v2 = mach_absolute_time() - *(void *)(v1 + 112);
    if (machTimeToNanoseconds_onceToken != -1) {
      dispatch_once(&machTimeToNanoseconds_onceToken, &__block_literal_global_178);
    }
    *(void *)(v1 + 120) = v2 * machTimeToNanoseconds_machTimebaseInfo / *(unsigned int *)algn_26ABDACAC;
    if ((HVIsConnectedToPower() & 1) == 0) {
      *(unsigned char *)(v1 + 134) = 1;
    }
    result = +[HVUserDefaults harvestBudgetDisabled];
    if ((result & 1) == 0)
    {
      result = +[HVUserDefaults harvestBudgetThrottleBudgetDisabled];
      if ((result & 1) == 0) {
        *(unsigned char *)(v1 + 135) = 1;
      }
    }
  }
  return result;
}

- (void)startWork
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_226C41000, log, OS_LOG_TYPE_DEFAULT, "Starting throttled work", v7, 2u);
  }
  pthread_mutex_lock(&self->_lock);
  if (self->_opInProgress)
  {
    int v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"HVPowerBudget.m" lineNumber:711 description:@"Work already in progress!"];
  }
  if (self->_hasClassCUnlock)
  {
    self->_opInProgress = 1;
    self->_wasOnBattery = HVIsConnectedToPower() ^ 1;
    if (+[HVUserDefaults harvestBudgetDisabled]) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = !+[HVUserDefaults harvestBudgetThrottleBudgetDisabled];
    }
    self->_wasEnabled = v5;
    self->_absTimeAtOpStart = mach_absolute_time();
    self->_timeSinceOpStart = 0;
  }
  pthread_mutex_unlock(&self->_lock);
}

- (void)refillState
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_hasClassCUnlock)
  {
    _refillState((uint64_t)&self->_state);
    -[HVPowerBudgetThrottlingState _writeThrottleStateLocked]((uint64_t)self);
  }

  pthread_mutex_unlock(p_lock);
}

- (void)checkBatteryStateForRefill
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_hasClassCUnlock && self->_state.budgetState == 1)
  {
    v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:(double)self->_state.timeOfLastChange];
    [v4 timeIntervalSinceNow];
    double v6 = v5;

    if (v6 < -300.0)
    {
      _refillState((uint64_t)&self->_state);
      -[HVPowerBudgetThrottlingState _writeThrottleStateLocked]((uint64_t)self);
    }
  }

  pthread_mutex_unlock(p_lock);
}

- (id)state
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_hasClassCUnlock)
  {
    int64_t nsecLeft = self->_state.nsecLeft;
    if (self->_opInProgress)
    {
      -[HVPowerBudgetThrottlingState _updateOperationProgress]((uint64_t)self);
      if (self->_wasOnBattery && self->_wasEnabled) {
        nsecLeft -= self->_timeSinceOpStart;
      }
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int opsLeft = self->_state.opsLeft;
      BOOL wasOnBattery = self->_wasOnBattery;
      BOOL wasEnabled = self->_wasEnabled;
      unint64_t timeSinceOpStart = self->_timeSinceOpStart;
      *(_DWORD *)buf = 67110144;
      int v21 = opsLeft;
      __int16 v22 = 2048;
      int64_t v23 = nsecLeft;
      __int16 v24 = 1024;
      BOOL v25 = wasOnBattery;
      __int16 v26 = 1024;
      BOOL v27 = wasEnabled;
      __int16 v28 = 2048;
      unint64_t v29 = timeSinceOpStart;
      _os_log_impl(&dword_226C41000, log, OS_LOG_TYPE_DEFAULT, "Throttle check: %i ops left, %lli ns left, onBattery %d, disabled %d, timeSinceOpStart %lld", buf, 0x28u);
    }
    v18[0] = @"opsLeft";
    double v10 = [NSNumber numberWithInt:self->_state.opsLeft];
    v19[0] = v10;
    v18[1] = @"nsecLeft";
    int v11 = [NSNumber numberWithLongLong:nsecLeft];
    v19[1] = v11;
    v18[2] = @"extraOpsLeft";
    __int16 v12 = [NSNumber numberWithInt:self->_state.extraOpsLeft];
    v19[2] = v12;
    int v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  }
  else
  {
    int v14 = self->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226C41000, v14, OS_LOG_TYPE_DEFAULT, "Throttle check: disabled due to class C lock, returning all 0's for state", buf, 2u);
    }
    v16[0] = @"opsLeft";
    v16[1] = @"nsecLeft";
    v17[0] = &unk_26DACF368;
    v17[1] = &unk_26DACF398;
    v16[2] = @"extraOpsLeft";
    v17[2] = &unk_26DACF368;
    int v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
  }
  pthread_mutex_unlock(p_lock);

  return v13;
}

- (unsigned)canDoExtraDiscretionaryWork
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_hasClassCUnlock)
  {
    double extraOpsLeft = (double)self->_state.extraOpsLeft;
    +[HVUserDefaults harvestBudgetReserve];
    BOOL v6 = v5 * 200.0 < extraOpsLeft || self->_state.extraOpsLeft > 0;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = self->_state.extraOpsLeft;
      double v10 = @"HVPowerBudgetLevelNone";
      if (v6) {
        double v10 = @"HVPowerBudgetLevelReserve";
      }
      int v11 = v10;
      v14[0] = 67109378;
      v14[1] = v9;
      __int16 v15 = 2114;
      __int16 v16 = v11;
      __int16 v12 = log;
      _os_log_impl(&dword_226C41000, v12, OS_LOG_TYPE_DEFAULT, "Extra budgeted operations check: %i extra ops left (%{public}@)", (uint8_t *)v14, 0x12u);
    }
  }
  else
  {
    double v7 = self->_log;
    LOBYTE(v6) = 0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "Extra budgeted operations check: disabled due to class C lock", (uint8_t *)v14, 2u);
      LOBYTE(v6) = 0;
    }
  }
  pthread_mutex_unlock(p_lock);
  return v6;
}

- (unsigned)canDoDiscretionaryWork:(unsigned int *)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_hasClassCUnlock)
  {
    int64_t nsecLeft = self->_state.nsecLeft;
    v43 = a3;
    v44 = p_lock;
    if (self->_opInProgress)
    {
      -[HVPowerBudgetThrottlingState _updateOperationProgress]((uint64_t)self);
      if (self->_wasOnBattery && self->_wasEnabled) {
        nsecLeft -= self->_timeSinceOpStart;
      }
    }
    double v7 = (double)+[HVUserDefaults harvestBudgetNumberOfOperations];
    +[HVUserDefaults harvestBudgetReserve];
    int v9 = (int)(v8 * v7);
    int opsLeft = self->_state.opsLeft;
    BOOL v11 = opsLeft > v9;
    if (opsLeft > 0) {
      BOOL v11 = 1;
    }
    if (opsLeft <= v9) {
      unsigned int v12 = opsLeft > 0;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11) {
      int v13 = 2;
    }
    else {
      int v13 = 3;
    }
    unsigned int v42 = v13;
    +[HVUserDefaults harvestBudgetCPUTimeSeconds];
    double v15 = v14;
    +[HVUserDefaults harvestBudgetReserve];
    uint64_t v17 = (uint64_t)(v15 * v16 * 1000000000.0);
    BOOL v18 = nsecLeft <= v17;
    if (nsecLeft > v17) {
      unsigned int v19 = 2;
    }
    else {
      unsigned int v19 = nsecLeft > 0;
    }
    if (nsecLeft >= 1) {
      BOOL v18 = 0;
    }
    BOOL v47 = v18;
    int v20 = HVIsConnectedToPower();
    BOOL v45 = +[HVUserDefaults harvestBudgetThrottleBudgetDisabled];
    int v46 = v20;
    if (v12 >= v19) {
      unsigned int v21 = v19;
    }
    else {
      unsigned int v21 = v12;
    }
    if (v45 | v20) {
      int v22 = 2;
    }
    else {
      int v22 = v21;
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v24 = nsecLeft <= v17;
      BOOL v25 = opsLeft > v9 || opsLeft <= 0;
      int v41 = self->_state.opsLeft;
      if (v25) {
        __int16 v26 = @"HVPowerBudgetLevelFull";
      }
      else {
        __int16 v26 = @"HVPowerBudgetLevelReserve";
      }
      if (!v12) {
        __int16 v26 = @"HVPowerBudgetLevelNone";
      }
      BOOL v27 = v26;
      int64_t v28 = self->_state.nsecLeft;
      if (v24 && nsecLeft > 0) {
        unint64_t v29 = @"HVPowerBudgetLevelReserve";
      }
      else {
        unint64_t v29 = @"HVPowerBudgetLevelFull";
      }
      if (v47) {
        unint64_t v29 = @"HVPowerBudgetLevelNone";
      }
      uint64_t v30 = v29;
      if (v22 == 1) {
        v31 = @"HVPowerBudgetLevelReserve";
      }
      else {
        v31 = @"HVPowerBudgetLevelFull";
      }
      if (!v22) {
        v31 = @"HVPowerBudgetLevelNone";
      }
      v32 = v31;
      BOOL opInProgress = self->_opInProgress;
      BOOL wasOnBattery = self->_wasOnBattery;
      BOOL wasEnabled = self->_wasEnabled;
      unint64_t timeSinceOpStart = self->_timeSinceOpStart;
      *(_DWORD *)buf = 67111682;
      int v49 = v41;
      __int16 v50 = 2114;
      v51 = v27;
      __int16 v52 = 2048;
      int64_t v53 = v28;
      __int16 v54 = 2114;
      v55 = v30;
      __int16 v56 = 1024;
      int v57 = v46;
      __int16 v58 = 1024;
      BOOL v59 = v45;
      __int16 v60 = 2114;
      v61 = v32;
      __int16 v62 = 1024;
      BOOL v63 = opInProgress;
      __int16 v64 = 1024;
      BOOL v65 = wasOnBattery;
      __int16 v66 = 1024;
      BOOL v67 = wasEnabled;
      __int16 v68 = 2048;
      unint64_t v69 = timeSinceOpStart;
      v37 = log;
      _os_log_impl(&dword_226C41000, v37, OS_LOG_TYPE_DEFAULT, "Throttle check: %i ops left (%{public}@), %lli ns left (%{public}@), connectedToPower %d, disabled %d, canProcess %{public}@, opInProgress %d :(wasOnBattery %d, wasEnabled %d, timeSinceOpStart %lld)", buf, 0x58u);
    }
    a3 = v43;
    if (!v43)
    {
      p_lock = v44;
      goto LABEL_60;
    }
    if (v47) {
      unsigned int v38 = 4;
    }
    else {
      unsigned int v38 = v42;
    }
    if (v46) {
      unsigned int v38 = 1;
    }
    if (v45) {
      unsigned int v38 = 6;
    }
    p_lock = v44;
    goto LABEL_58;
  }
  v39 = self->_log;
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226C41000, v39, OS_LOG_TYPE_DEFAULT, "Throttle check: disabled due to class C lock", buf, 2u);
  }
  LOBYTE(v22) = 0;
  if (a3)
  {
    unsigned int v38 = 7;
LABEL_58:
    *a3 = v38;
  }
LABEL_60:
  pthread_mutex_unlock(p_lock);
  return v22;
}

- (unsigned)canDoDiscretionaryWork
{
  return [(HVPowerBudgetThrottlingState *)self canDoDiscretionaryWork:0];
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  if (self->_hasClassCUnlock)
  {
    -[HVPowerBudgetThrottlingState _writeThrottleStateLocked]((uint64_t)self);
    int fd = self->_fd;
    if ((fd & 0x80000000) == 0) {
      close(fd);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)HVPowerBudgetThrottlingState;
  [(HVPowerBudgetThrottlingState *)&v4 dealloc];
}

- (HVPowerBudgetThrottlingState)initWithPath:(id)a3 log:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HVPowerBudgetThrottlingState;
  double v8 = [(HVPowerBudgetThrottlingState *)&v25 init];
  int v9 = v8;
  if (v8)
  {
    pthread_mutex_init(&v8->_lock, 0);
    if (v7) {
      double v10 = v7;
    }
    else {
      double v10 = (void *)&_os_log_internal;
    }
    objc_storeStrong((id *)&v9->_log, v10);
    id location = 0;
    objc_initWeak(&location, v9);
    uint64_t v19 = 0;
    int v20 = (atomic_uchar *)&v19;
    uint64_t v21 = 0x2810000000;
    int v22 = &unk_226C901C9;
    char v23 = 0;
    BOOL v11 = (void *)MEMORY[0x263F61E30];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __49__HVPowerBudgetThrottlingState_initWithPath_log___block_invoke;
    v15[3] = &unk_2647D4C88;
    objc_copyWeak(&v18, &location);
    id v12 = v6;
    id v16 = v12;
    uint64_t v17 = &v19;
    [v11 runBlockWhenDeviceIsClassCUnlocked:v15];
    if ((atomic_exchange(v20 + 32, 1u) & 1) == 0)
    {
      log = v9->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v12;
        _os_log_impl(&dword_226C41000, log, OS_LOG_TYPE_DEFAULT, "HVPowerBudgetThrottlingState initializing before class C unlock with path %@. Budget state will be 0 until class C unlock occurs.", buf, 0xCu);
      }
    }

    objc_destroyWeak(&v18);
    _Block_object_dispose(&v19, 8);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __49__HVPowerBudgetThrottlingState_initWithPath_log___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = pthread_mutex_lock((pthread_mutex_t *)(WeakRetained + 8));
    WeakRetained[136] = 1;
    double v5 = (void *)MEMORY[0x22A6667F0](v4);
    id v6 = v3;
    int v7 = open((const char *)[v6 UTF8String], 514, 384);
    *((_DWORD *)WeakRetained + 32) = v7;
    if (v7 < 0)
    {
      double v8 = *((void *)WeakRetained + 9);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v13 = v8;
        int v14 = *__error();
        double v15 = __error();
        id v16 = strerror(*v15);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = v16;
        _os_log_error_impl(&dword_226C41000, v13, OS_LOG_TYPE_ERROR, "Error opening throttle state [%i]: %s", buf, 0x12u);
      }
    }
    int v9 = *((void *)WeakRetained + 9);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226C41000, v9, OS_LOG_TYPE_INFO, "Reading throttle state", buf, 2u);
    }
    if (!WeakRetained[136])
    {
      uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
      [v17 handleFailureInMethod:sel__readThrottleStateLocked, WeakRetained, @"HVPowerBudget.m", 516, @"Invalid parameter not satisfying: %@", @"_hasClassCUnlock" object file lineNumber description];
    }
    int v10 = *((_DWORD *)WeakRetained + 32);
    if ((v10 & 0x80000000) == 0
      && (memset(buf, 0, 32), pread(v10, buf, 0x20uLL, 0) == 32)
      && *(_DWORD *)buf == -1804290770)
    {
      long long v11 = *(_OWORD *)&buf[16];
      *((_OWORD *)WeakRetained + 5) = *(_OWORD *)buf;
      *((_OWORD *)WeakRetained + 6) = v11;
    }
    else
    {
      _refillState((uint64_t)(WeakRetained + 80));
    }
    pthread_mutex_unlock((pthread_mutex_t *)(WeakRetained + 8));

    if (atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 32), 1u))
    {
      id v12 = *((void *)WeakRetained + 9);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226C41000, v12, OS_LOG_TYPE_DEFAULT, "HVPowerBudgetThrottlingState deferred class C unlock completed", buf, 2u);
      }
    }
  }
}

@end