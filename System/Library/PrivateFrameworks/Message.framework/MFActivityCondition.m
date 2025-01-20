@interface MFActivityCondition
+ (MFActivityCondition)alwaysSatisfiedCondition;
- (BOOL)_isValidConfiguration;
- (BOOL)isSatisfied;
- (BOOL)requireExternalPower;
- (BOOL)requireLowPowerModeDisabled;
- (BOOL)requireScreenLocked;
- (BOOL)requireWiFi;
- (EFCancelationToken)cancellationToken;
- (EFObservable)conditionsObservable;
- (EFScheduler)scheduler;
- (MFActivityCondition)init;
- (MFActivityCondition)initWithBuilder:(id)a3;
- (float)minBatteryLevel;
- (int64_t)maxThermalPressureLevel;
- (void)dealloc;
- (void)setCancellationToken:(id)a3;
- (void)setMaxThermalPressureLevel:(int64_t)a3;
- (void)setMinBatteryLevel:(float)a3;
- (void)setRequireExternalPower:(BOOL)a3;
- (void)setRequireLowPowerModeDisabled:(BOOL)a3;
- (void)setRequireScreenLocked:(BOOL)a3;
- (void)setRequireWiFi:(BOOL)a3;
- (void)setSatisfied:(BOOL)a3;
- (void)setScheduler:(id)a3;
@end

@implementation MFActivityCondition

+ (MFActivityCondition)alwaysSatisfiedCondition
{
  v2 = objc_alloc_init(_MFSatisfiedActivityCondition);
  return (MFActivityCondition *)v2;
}

- (void)dealloc
{
  [(EFCancelationToken *)self->_cancellationToken cancel];
  v3.receiver = self;
  v3.super_class = (Class)MFActivityCondition;
  [(MFActivityCondition *)&v3 dealloc];
}

- (MFActivityCondition)init
{
  return [(MFActivityCondition *)self initWithBuilder:&__block_literal_global_21];
}

- (MFActivityCondition)initWithBuilder:(id)a3
{
  v5 = (void (**)(id, MFActivityCondition *))a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"MFActivityCondition.m", 65, @"Invalid parameter not satisfying: %@", @"builderBlock" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)MFActivityCondition;
  v6 = [(MFActivityCondition *)&v20 init];
  v7 = v6;
  if (v6)
  {
    v6->_requireLowPowerModeDisabled = 1;
    v6->_maxThermalPressureLevel = 3;
    v5[2](v5, v6);
    if ([(MFActivityCondition *)v7 _isValidConfiguration])
    {
      uint64_t v8 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.mail.MFActivityCondition" qualityOfService:17];
      scheduler = v7->_scheduler;
      v7->_scheduler = (EFScheduler *)v8;

      v10 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E4F60D40]);
      cancellationToken = v7->_cancellationToken;
      v7->_cancellationToken = v10;

      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v7);
      v12 = v7->_cancellationToken;
      v13 = [(MFActivityCondition *)v7 conditionsObservable];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __39__MFActivityCondition_initWithBuilder___block_invoke;
      v17[3] = &unk_1E5D3DAC0;
      objc_copyWeak(&v18, &location);
      v14 = [v13 subscribeWithResultBlock:v17];
      [(EFCancelationToken *)v12 addCancelable:v14];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

void __39__MFActivityCondition_initWithBuilder___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSatisfied:", objc_msgSend(v4, "BOOLValue"));
}

- (BOOL)isSatisfied
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = -86;
  objc_super v3 = [(MFActivityCondition *)self scheduler];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__MFActivityCondition_isSatisfied__block_invoke;
  v5[3] = &unk_1E5D3DAE8;
  v5[4] = self;
  v5[5] = &v6;
  [v3 performSyncBlock:v5];

  LOBYTE(v3) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v3;
}

uint64_t __34__MFActivityCondition_isSatisfied__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 12);
  return result;
}

- (EFObservable)conditionsObservable
{
  v24[6] = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[MFPowerController sharedInstance];
  v19 = [v3 lowPowerModeObservable];
  objc_super v20 = [v3 pluggedInObservable];
  id v4 = [v3 batteryLevelObservable];
  v5 = +[MFNetworkController sharedInstance];
  uint64_t v6 = [v5 wifiObservable];

  v7 = +[MFLockStateMonitor sharedInstance];
  uint64_t v8 = [v7 lockStateObservable];

  char v9 = [MEMORY[0x1E4F28F80] processInfo];
  v10 = objc_msgSend(v9, "mf_thermalStateObservable");

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v11 = (void *)MEMORY[0x1E4F60DD8];
  v24[0] = v19;
  v24[1] = v8;
  v24[2] = v6;
  v24[3] = v20;
  v24[4] = v10;
  v24[5] = v4;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:6];
  v13 = [v11 combineLatest:v12];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __43__MFActivityCondition_conditionsObservable__block_invoke;
  v21[3] = &unk_1E5D3DB10;
  objc_copyWeak(&v22, &location);
  v14 = [v13 map:v21];

  v15 = [v14 distinctUntilChanged];
  v16 = [v15 doOnError:&__block_literal_global_78];
  v17 = [v16 observeOn:self->_scheduler];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return (EFObservable *)v17;
}

uint64_t __43__MFActivityCondition_conditionsObservable__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [v3 objectAtIndexedSubscript:0];
  int v6 = [v5 BOOLValue];

  v7 = [v3 objectAtIndexedSubscript:1];
  int v8 = [v7 BOOLValue];

  char v9 = [v3 objectAtIndexedSubscript:2];
  int v10 = [v9 BOOLValue];

  v11 = [v3 objectAtIndexedSubscript:3];
  int v12 = [v11 BOOLValue];

  v13 = [v3 objectAtIndexedSubscript:4];
  uint64_t v14 = [v13 integerValue];

  v15 = [v3 objectAtIndexedSubscript:5];
  [v15 floatValue];
  float v17 = v16;

  id v18 = MFLogGeneral();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v24[0] = 67110400;
    v24[1] = v6;
    __int16 v25 = 1024;
    int v26 = v8;
    __int16 v27 = 1024;
    int v28 = v10;
    __int16 v29 = 1024;
    int v30 = v12;
    __int16 v31 = 2048;
    uint64_t v32 = v14;
    __int16 v33 = 2048;
    double v34 = v17;
    _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_DEFAULT, "lpm:%d locked:%d wifi:%d onpower:%d thermals:%lu battery:%.2f", (uint8_t *)v24, 0x2Eu);
  }

  if (([WeakRetained requireExternalPower] ^ 1 | v12) == 1
    && (([WeakRetained minBatteryLevel], v19 <= 0.0)
     || ([WeakRetained minBatteryLevel], v17 >= v20))
    && ([WeakRetained requireLowPowerModeDisabled] & v6 & 1) == 0
    && ([WeakRetained requireWiFi] ^ 1 | v10) == 1)
  {
    int v21 = [WeakRetained requireScreenLocked] ^ 1 | v8;
    uint64_t v22 = MEMORY[0x1E4F1CC28];
    if (v21 == 1 && v14 <= [WeakRetained maxThermalPressureLevel]) {
      uint64_t v22 = MEMORY[0x1E4F1CC38];
    }
  }
  else
  {
    uint64_t v22 = MEMORY[0x1E4F1CC28];
  }

  return v22;
}

void __43__MFActivityCondition_conditionsObservable__block_invoke_75(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = objc_msgSend(v2, "ef_publicDescription");
    __43__MFActivityCondition_conditionsObservable__block_invoke_75_cold_1(v4, v5, v3);
  }
}

- (BOOL)_isValidConfiguration
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(MFActivityCondition *)self minBatteryLevel];
  if (v3 >= 0.0)
  {
    [(MFActivityCondition *)self minBatteryLevel];
    if (v4 <= 1.0) {
      return 1;
    }
  }
  v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [(MFActivityCondition *)self minBatteryLevel];
    int v8 = 134217984;
    double v9 = v6;
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "invalid battery-level value (%f)", (uint8_t *)&v8, 0xCu);
  }

  return 0;
}

- (BOOL)requireExternalPower
{
  return self->_requireExternalPower;
}

- (void)setRequireExternalPower:(BOOL)a3
{
  self->_requireExternalPower = a3;
}

- (BOOL)requireWiFi
{
  return self->_requireWiFi;
}

- (void)setRequireWiFi:(BOOL)a3
{
  self->_requireWiFi = a3;
}

- (BOOL)requireScreenLocked
{
  return self->_requireScreenLocked;
}

- (void)setRequireScreenLocked:(BOOL)a3
{
  self->_requireScreenLocked = a3;
}

- (float)minBatteryLevel
{
  return self->_minBatteryLevel;
}

- (void)setMinBatteryLevel:(float)a3
{
  self->_minBatteryLevel = a3;
}

- (BOOL)requireLowPowerModeDisabled
{
  return self->_requireLowPowerModeDisabled;
}

- (void)setRequireLowPowerModeDisabled:(BOOL)a3
{
  self->_requireLowPowerModeDisabled = a3;
}

- (int64_t)maxThermalPressureLevel
{
  return self->_maxThermalPressureLevel;
}

- (void)setMaxThermalPressureLevel:(int64_t)a3
{
  self->_maxThermalPressureLevel = a3;
}

- (void)setSatisfied:(BOOL)a3
{
  self->_satisfied = a3;
}

- (EFCancelationToken)cancellationToken
{
  return self->_cancellationToken;
}

- (void)setCancellationToken:(id)a3
{
}

- (EFScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_cancellationToken, 0);
}

void __43__MFActivityCondition_conditionsObservable__block_invoke_75_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "error occurred while observing conditions: %{public}@", buf, 0xCu);
}

@end