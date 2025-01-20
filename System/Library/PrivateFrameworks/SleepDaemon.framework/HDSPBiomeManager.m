@interface HDSPBiomeManager
+ (id)sleepModePublisher;
+ (int)biomeSleepModeChangeReasonForSleepModeChangeReason:(unint64_t)a3;
+ (int)biomeSleepModeStateForSleepModeState:(int64_t)a3;
+ (int)biomeSleepScheduleStateChangeReasonForSleepScheduleStateChangeReason:(unint64_t)a3;
+ (int)biomeSleepScheduleStateForSleepScheduleState:(unint64_t)a3;
- (BOOL)_shouldWriteToBiome;
- (HDSPBiomeInterface)biomeInterface;
- (HDSPBiomeManager)initWithEnvironment:(id)a3;
- (HDSPBiomeManager)initWithEnvironment:(id)a3 biomeInterface:(id)a4;
- (HDSPEnvironment)environment;
- (id)subscribe:(id)a3 callback:(id)a4;
- (void)_writeSleepModeToBiome:(int64_t)a3 reason:(unint64_t)a4 forceWrite:(BOOL)a5;
- (void)_writeSleepScheduleStateToBiome:(unint64_t)a3 reason:(unint64_t)a4 forceWrite:(BOOL)a5;
- (void)environmentWillBecomeReady:(id)a3;
- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5;
- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4;
- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5;
- (void)unsubscribe:(id)a3;
@end

@implementation HDSPBiomeManager

- (HDSPBiomeManager)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(_HDSPBiomeBridge);
  v6 = [(HDSPBiomeManager *)self initWithEnvironment:v4 biomeInterface:v5];

  return v6;
}

- (HDSPBiomeManager)initWithEnvironment:(id)a3 biomeInterface:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDSPBiomeManager;
  v8 = [(HDSPBiomeManager *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v9->_biomeInterface, a4);
    v10 = v9;
  }

  return v9;
}

- (id)subscribe:(id)a3 callback:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = HKSPLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    objc_super v12 = self;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] subscribing publisher %{public}@", (uint8_t *)&v11, 0x16u);
  }

  v9 = [(HDSPBiomeInterface *)self->_biomeInterface subscribe:v6 callback:v7];

  return v9;
}

- (void)unsubscribe:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2114;
    id v9 = v3;
    id v5 = v7;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] unsubscribing %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [v3 cancel];
}

+ (id)sleepModePublisher
{
  v2 = BiomeLibrary();
  id v3 = [v2 UserFocus];
  id v4 = [v3 ComputedMode];

  id v5 = [v4 DSLPublisher];
  int v6 = [v5 filterWithKeyPath:@"eventBody.semanticModeIdentifier" value:*MEMORY[0x263F75CD0]];

  return v6;
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sleepModeManager];
  [v5 addObserver:self];

  int v6 = [v4 sleepScheduleModelManager];
  [v6 addObserver:self];

  id v7 = [v4 sleepCoordinator];

  [v7 addObserver:self];
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (a4 != a3)
  {
    __int16 v8 = HKSPLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_opt_class();
      id v10 = v9;
      int v11 = NSStringFromHKSPSleepScheduleState();
      objc_super v12 = NSStringFromHKSPSleepScheduleState();
      __int16 v13 = NSStringFromHKSPSleepScheduleStateChangeReason();
      int v19 = 138544130;
      v20 = v9;
      __int16 v21 = 2114;
      v22 = v11;
      __int16 v23 = 2114;
      v24 = v12;
      __int16 v25 = 2114;
      v26 = v13;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep state changed from %{public}@ to %{public}@ (%{public}@)", (uint8_t *)&v19, 0x2Au);
    }
    id v14 = [(HDSPBiomeManager *)self environment];
    uint64_t v15 = [v14 sleepModeManager];

    if ([v15 inUnscheduledSleepMode]
      && [v15 shouldGoIntoSleepModeDuringState:a3])
    {
      v16 = HKSPLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_opt_class();
        int v19 = 138543362;
        v20 = v17;
        id v18 = v17;
        _os_log_impl(&dword_221A52000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] we're in user requested sleep mode before wind down/bedtime, telling Biome", (uint8_t *)&v19, 0xCu);
      }
      [(HDSPBiomeManager *)self _writeSleepModeToBiome:2 reason:2 forceWrite:0];
    }
    [(HDSPBiomeManager *)self _writeSleepScheduleStateToBiome:a3 reason:a5 forceWrite:1];
  }
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2114;
    id v14 = v5;
    id v7 = v12;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] didUpdateSleepScheduleModel: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  __int16 v8 = [(HDSPBiomeManager *)self environment];
  id v9 = [v8 sleepModeManager];
  uint64_t v10 = [v9 sleepMode];

  if (v10) {
    [(HDSPBiomeManager *)self _writeSleepModeToBiome:v10 reason:10 forceWrite:0];
  }
}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = v10;
    id v12 = NSStringFromHKSPSleepMode();
    __int16 v13 = NSStringFromHKSPSleepMode();
    id v14 = NSStringFromHKSPSleepModeChangeReason();
    int v15 = 138544130;
    v16 = v10;
    __int16 v17 = 2114;
    id v18 = v12;
    __int16 v19 = 2114;
    v20 = v13;
    __int16 v21 = 2114;
    v22 = v14;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode changed from %{public}@ to %{public}@ (%{public}@)", (uint8_t *)&v15, 0x2Au);
  }
  [(HDSPBiomeManager *)self _writeSleepModeToBiome:a3 reason:a5 forceWrite:a3 != a4];
}

- (BOOL)_shouldWriteToBiome
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(HDSPBiomeManager *)self environment];
  id v4 = [v3 sleepScheduleModelManager];
  id v5 = [v4 sleepSettings];

  int v6 = [(HDSPBiomeManager *)self environment];
  id v7 = [v6 behavior];
  if (![v7 isAppleWatch])
  {

    goto LABEL_7;
  }
  char v8 = [v5 watchSleepFeaturesEnabled];

  if (v8)
  {
LABEL_7:
    BOOL v11 = 1;
    goto LABEL_8;
  }
  id v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = (id)objc_opt_class();
    id v10 = v14;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] not writing to biome because sleep features are disabled for this watch", (uint8_t *)&v13, 0xCu);
  }
  BOOL v11 = 0;
LABEL_8:

  return v11;
}

- (void)_writeSleepModeToBiome:(int64_t)a3 reason:(unint64_t)a4 forceWrite:(BOOL)a5
{
  if (a5 || [(HDSPBiomeManager *)self _shouldWriteToBiome])
  {
    char v8 = BiomeLibrary();
    id v9 = [v8 UserFocus];
    id v15 = [v9 SleepMode];

    uint64_t v10 = [(id)objc_opt_class() biomeSleepModeStateForSleepModeState:a3];
    uint64_t v11 = [(id)objc_opt_class() biomeSleepModeChangeReasonForSleepModeChangeReason:a4];
    if (a3)
    {
      id v12 = [(HDSPBiomeManager *)self environment];
      int v13 = [v12 sleepModeManager];
      a3 = [v13 computeUserVisibleEndDate];
    }
    id v14 = (void *)[objc_alloc(MEMORY[0x263F2A5A8]) initWithState:v10 changeReason:v11 expectedEndDate:a3];
    [(HDSPBiomeInterface *)self->_biomeInterface publish:v14 stream:v15];
  }
}

- (void)_writeSleepScheduleStateToBiome:(unint64_t)a3 reason:(unint64_t)a4 forceWrite:(BOOL)a5
{
  if (a5 || [(HDSPBiomeManager *)self _shouldWriteToBiome])
  {
    char v8 = BiomeLibrary();
    id v9 = [v8 Sleep];
    id v12 = [v9 ScheduleState];

    uint64_t v10 = [(id)objc_opt_class() biomeSleepScheduleStateForSleepScheduleState:a3];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F2A530]), "initWithState:changeReason:", v10, objc_msgSend((id)objc_opt_class(), "biomeSleepScheduleStateChangeReasonForSleepScheduleStateChangeReason:", a4));
    [(HDSPBiomeInterface *)self->_biomeInterface publish:v11 stream:v12];
  }
}

+ (int)biomeSleepModeStateForSleepModeState:(int64_t)a3
{
  if (a3 == 1) {
    int v3 = 2;
  }
  else {
    int v3 = 1;
  }
  if (a3 == 2) {
    return 3;
  }
  else {
    return v3;
  }
}

+ (int)biomeSleepModeChangeReasonForSleepModeChangeReason:(unint64_t)a3
{
  if (a3 - 2 > 8) {
    return 1;
  }
  else {
    return dword_221AD633C[a3 - 2];
  }
}

+ (int)biomeSleepScheduleStateForSleepScheduleState:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return 1;
  }
  else {
    return dword_221AD6360[a3 - 1];
  }
}

+ (int)biomeSleepScheduleStateChangeReasonForSleepScheduleStateChangeReason:(unint64_t)a3
{
  if (a3 - 3 > 5) {
    return 1;
  }
  else {
    return dword_221AD6378[a3 - 3];
  }
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HDSPBiomeInterface)biomeInterface
{
  return self->_biomeInterface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeInterface, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end