@interface HVPowerBudget
+ (id)defaultBudget;
+ (void)setCanDoWorkOverrideForTesting:(id)a3;
- (HVPowerBudget)init;
- (HVPowerBudget)initWithThrottleBudget:(id)a3;
- (id)throttlingState;
- (uint64_t)_canDoDiscretionaryWork:(uint64_t)a1;
- (uint64_t)_hasDuetBudgetRemaining;
- (unsigned)canDoDiscretionaryWork;
- (unsigned)canDoExtraDiscretionaryWork;
- (void)dealloc;
- (void)didConsumeAnExtraBudgetedOperation;
- (void)doDiscretionaryWork:(id)a3 orElse:(id)a4;
- (void)refillThrottleBudget;
@end

@implementation HVPowerBudget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_batteryObserver, 0);
  objc_storeStrong((id *)&self->_lastPlugInTime, 0);

  objc_storeStrong((id *)&self->_throttlingState, 0);
}

- (id)throttlingState
{
  v23[9] = *MEMORY[0x263EF8340];
  v3 = [(HVPowerBudgetThrottlingState *)self->_throttlingState state];
  v20 = (void *)[v3 mutableCopy];

  v22[0] = @"isProcessing";
  v4 = NSNumber;
  p_discretionaryWorkInProgress = &self->_discretionaryWorkInProgress;
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_discretionaryWorkInProgress);
  v21 = [v4 numberWithBool:v6 & 1];
  v23[0] = v21;
  v22[1] = @"canDoDiscretionaryWork";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[HVPowerBudget canDoDiscretionaryWork](self, "canDoDiscretionaryWork"));
  v23[1] = v7;
  v22[2] = @"hasDuetBudgetRemaining";
  v8 = [NSNumber numberWithBool:-[HVPowerBudget _hasDuetBudgetRemaining]((uint64_t)self)];
  v23[2] = v8;
  v22[3] = @"lastPluginTime";
  v9 = NSNumber;
  [(NSDate *)self->_lastPlugInTime timeIntervalSince1970];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  v23[3] = v10;
  v22[4] = @"discretionaryWorkInProgress";
  v11 = NSNumber;
  unsigned __int8 v12 = atomic_load((unsigned __int8 *)p_discretionaryWorkInProgress);
  v13 = [v11 numberWithBool:v12 & 1];
  v23[4] = v13;
  v22[5] = @"isConnectedToPower";
  v14 = [NSNumber numberWithBool:HVIsConnectedToPower()];
  v23[5] = v14;
  v22[6] = @"disabled";
  v15 = objc_msgSend(NSNumber, "numberWithBool:", +[HVUserDefaults harvestBudgetDisabled](HVUserDefaults, "harvestBudgetDisabled"));
  v23[6] = v15;
  v22[7] = @"throttleBudgetDisabled";
  v16 = objc_msgSend(NSNumber, "numberWithBool:", +[HVUserDefaults harvestBudgetThrottleBudgetDisabled](HVUserDefaults, "harvestBudgetThrottleBudgetDisabled"));
  v23[7] = v16;
  v22[8] = @"refillDisabled";
  v17 = objc_msgSend(NSNumber, "numberWithBool:", +[HVUserDefaults harvestBudgetRefillDisabled](HVUserDefaults, "harvestBudgetRefillDisabled"));
  v23[8] = v17;
  v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:9];
  [v20 addEntriesFromDictionary:v18];

  return v20;
}

- (uint64_t)_hasDuetBudgetRemaining
{
  v7[1] = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  v1 = [MEMORY[0x263F3AFE0] sharedInstance];
  uint64_t v2 = *MEMORY[0x263F3B070];
  uint64_t v6 = *MEMORY[0x263F3B080];
  v7[0] = MEMORY[0x263EFFA88];
  v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  uint64_t v4 = [v1 allowsDiscretionaryWorkForTask:@"com.apple.proactive.ProactiveHarvesting" withPriority:v2 withParameters:v3];

  return v4;
}

- (void)didConsumeAnExtraBudgetedOperation
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_226C41000, log, OS_LOG_TYPE_DEFAULT, "Did consume one extra budgeted operation", v4, 2u);
  }
  if ((HVIsConnectedToPower() & 1) == 0) {
    [(HVPowerBudgetThrottlingState *)self->_throttlingState didConsumeAnExtraBudgetedOperation];
  }
}

- (unsigned)canDoExtraDiscretionaryWork
{
  if (HVIsConnectedToPower()) {
    return 2;
  }
  if (!self) {
    return 0;
  }
  throttlingState = self->_throttlingState;

  return [(HVPowerBudgetThrottlingState *)throttlingState canDoExtraDiscretionaryWork];
}

- (void)doDiscretionaryWork:(id)a3 orElse:(id)a4
{
  v48[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(void))a3;
  v7 = (void (**)(void))a4;
  unsigned int v40 = 0;
  int v8 = -[HVPowerBudget _canDoDiscretionaryWork:]((uint64_t)self, &v40);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    if (v40 > 7) {
      v10 = @"Unknown reason";
    }
    else {
      v10 = off_2647D4CA8[v40];
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v8 != 0;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v10;
    v11 = log;
    _os_log_impl(&dword_226C41000, v11, OS_LOG_TYPE_DEFAULT, "Can do discretionary work: %i - %@", buf, 0x12u);
  }
  if (!v8) {
    goto LABEL_14;
  }
  unsigned __int8 v12 = atomic_exchange((atomic_uchar *volatile)&self->_discretionaryWorkInProgress, 1u);
  v13 = self->_log;
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226C41000, v13, OS_LOG_TYPE_DEFAULT, "Discretionary work already in progress", buf, 2u);
    }
LABEL_14:
    v7[2](v7);
    goto LABEL_38;
  }
  if (v14)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226C41000, v13, OS_LOG_TYPE_DEFAULT, "Starting discretionary work", buf, 2u);
  }
  BOOL v15 = +[HVUserDefaults harvestBudgetDisabled];
  v16 = (void *)MEMORY[0x263F3B078];
  if (v15)
  {
    self->_isScheduled = 0;
  }
  else
  {
    self->_isScheduled = 1;
    v17 = (void *)MEMORY[0x22A6667F0]();
    scheduler = self->_scheduler;
    v48[0] = *v16;
    v19 = [MEMORY[0x263F08AB0] processInfo];
    v20 = [v19 processName];
    v47 = v20;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
    *(void *)buf = v21;
    v22 = [NSDictionary dictionaryWithObjects:buf forKeys:v48 count:1];
    [(_DASScheduler *)scheduler activityStartedWithParameters:v22];

    v16 = (void *)MEMORY[0x263F3B078];
  }
  [(HVPowerBudgetThrottlingState *)self->_throttlingState startWork];
  v6[2](v6);
  unsigned __int8 v23 = atomic_load((unsigned __int8 *)&self->_discretionaryWorkInProgress);
  if ((v23 & 1) == 0)
  {
    v39 = [MEMORY[0x263F08690] currentHandler];
    [v39 handleFailureInMethod:sel__endWork object:self file:@"HVPowerBudget.m" lineNumber:318 description:@"Not doing discretionary work!"];
  }
  v24 = self->_log;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226C41000, v24, OS_LOG_TYPE_DEFAULT, "Ending discretionary work", buf, 2u);
  }
  uint64_t v25 = [(HVPowerBudgetThrottlingState *)self->_throttlingState endWork];
  if (self->_isScheduled)
  {
    v26 = (void *)MEMORY[0x22A6667F0](v25);
    v27 = self->_scheduler;
    v47 = (void *)*v16;
    v28 = [MEMORY[0x263F08AB0] processInfo];
    v29 = [v28 processName];
    v46 = v29;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
    v48[0] = v30;
    v31 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];
    [(_DASScheduler *)v27 activityStoppedWithParameters:v31];

    self->_isScheduled = 0;
  }
  v32 = self->_log;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = v32;
    v34 = "YES";
    if ((HVIsConnectedToPower() & 1) == 0)
    {
      v34 = "YES";
      if ((-[HVPowerBudget _hasDuetBudgetRemaining]((uint64_t)self) & 1) == 0
        && !+[HVUserDefaults harvestBudgetDisabled])
      {
        v34 = "NO";
      }
    }
    if (HVIsConnectedToPower()) {
      v35 = "YES";
    }
    else {
      v35 = "NO";
    }
    if (+[HVUserDefaults harvestBudgetDisabled]) {
      v36 = "YES";
    }
    else {
      v36 = "NO";
    }
    int hasDuetBudget = -[HVPowerBudget _hasDuetBudgetRemaining]((uint64_t)self);
    *(_DWORD *)buf = 136315906;
    if (hasDuetBudget) {
      v38 = "YES";
    }
    else {
      v38 = "NO";
    }
    *(void *)&buf[4] = v34;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v35;
    __int16 v42 = 2080;
    v43 = v36;
    __int16 v44 = 2080;
    v45 = v38;
    _os_log_impl(&dword_226C41000, v33, OS_LOG_TYPE_DEFAULT, "Ending Duet work; Further duet processing allowed: %s  Connected to power: %s disabled: %s Duet Budget: %s",
      buf,
      0x2Au);
  }
  atomic_store(0, (unsigned __int8 *)&self->_discretionaryWorkInProgress);
LABEL_38:
}

- (uint64_t)_canDoDiscretionaryWork:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  [*(id *)(a1 + 8) checkBatteryStateForRefill];
  unsigned int v8 = 0;
  if (canDoWorkOverrideForTesting)
  {
    uint64_t v4 = 6;
    unsigned int v8 = 6;
    if ([(id)canDoWorkOverrideForTesting BOOLValue]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else if (+[HVUserDefaults harvestBudgetDisabled])
  {
    uint64_t v4 = 6;
    unsigned int v8 = 6;
    uint64_t v5 = 2;
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 8) canDoDiscretionaryWork:&v8];
    uint64_t v4 = v8;
    if (v5)
    {
      if (!v8)
      {
        v7 = [MEMORY[0x263F08690] currentHandler];
        [v7 handleFailureInMethod:sel__checkCanDoDiscretionaryWork_, a1, @"HVPowerBudget.m", 289, @"Invalid parameter not satisfying: %@", @"*state != HVPowerBudgetStateNotSet" object file lineNumber description];
      }
      if (-[HVPowerBudget _hasDuetBudgetRemaining](a1))
      {
        if (v5 >= 2) {
          uint64_t v5 = 2;
        }
        else {
          uint64_t v5 = v5;
        }
        uint64_t v4 = v8;
      }
      else
      {
        uint64_t v5 = 0;
        uint64_t v4 = 5;
        unsigned int v8 = 5;
      }
    }
  }
  [*(id *)(a1 + 8) updateState:v4];
  if (a2) {
    *a2 = v8;
  }
  return v5;
}

- (unsigned)canDoDiscretionaryWork
{
  return -[HVPowerBudget _canDoDiscretionaryWork:]((uint64_t)self, 0);
}

- (void)refillThrottleBudget
{
}

- (void)dealloc
{
  if (self->_batteryObserver)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self->_batteryObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)HVPowerBudget;
  [(HVPowerBudget *)&v4 dealloc];
}

- (HVPowerBudget)init
{
  v3 = +[HVPathsBase filename:@"throttle-state"];
  objc_super v4 = [[HVPowerBudgetThrottlingState alloc] initWithPath:v3 log:self->_log];
  uint64_t v5 = [(HVPowerBudget *)self initWithThrottleBudget:v4];

  return v5;
}

- (HVPowerBudget)initWithThrottleBudget:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HVPowerBudget;
  uint64_t v6 = [(HVPowerBudget *)&v18 init];
  if (v6)
  {
    os_log_t v7 = os_log_create("com.apple.suggestions", "HVPowerBudget");
    log = v6->_log;
    v6->_log = (OS_os_log *)v7;

    uint64_t v9 = [MEMORY[0x263F3AFD8] sharedScheduler];
    scheduler = v6->_scheduler;
    v6->_scheduler = (_DASScheduler *)v9;

    objc_storeStrong((id *)&v6->_throttlingState, a3);
    v11 = [MEMORY[0x263F08A00] defaultCenter];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __40__HVPowerBudget_initWithThrottleBudget___block_invoke;
    v16[3] = &unk_2647D4C00;
    unsigned __int8 v12 = v6;
    v17 = v12;
    uint64_t v13 = [v11 addObserverForName:@"kHVBatteryStateChangedNotification" object:0 queue:0 usingBlock:v16];
    batteryObserver = v12->_batteryObserver;
    v12->_batteryObserver = v13;
  }
  return v6;
}

uint64_t __40__HVPowerBudget_initWithThrottleBudget___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) canDoDiscretionaryWork];
}

+ (void)setCanDoWorkOverrideForTesting:(id)a3
{
}

+ (id)defaultBudget
{
  if (defaultBudget_onceToken != -1) {
    dispatch_once(&defaultBudget_onceToken, &__block_literal_global_133);
  }
  uint64_t v2 = (void *)defaultBudget_instance;

  return v2;
}

uint64_t __30__HVPowerBudget_defaultBudget__block_invoke()
{
  defaultBudget_instance = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

@end