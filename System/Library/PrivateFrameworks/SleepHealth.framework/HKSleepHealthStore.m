@interface HKSleepHealthStore
+ (BOOL)_areAllSamples:(id)a3 containedInDateInterval:(id)a4;
+ (BOOL)_areAllSamplesSleepTrackingSamples:(id)a3;
+ (NSString)taskIdentifier;
- (HKHealthStore)healthStore;
- (HKSleepHealthStore)initWithHealthStore:(id)a3;
- (NAScheduler)scheduler;
- (void)saveSleepTrackingSamples:(id)a3 completion:(id)a4;
- (void)saveSleepTrackingSamples:(id)a3 replacingSamplesInDateInterval:(id)a4 completion:(id)a5;
- (void)startSleepTrackingSession;
- (void)stopSleepTrackingSession;
- (void)updateCurrentSleepSchedules:(id)a3 sleepDurationGoal:(id)a4 completion:(id)a5;
@end

@implementation HKSleepHealthStore

- (HKSleepHealthStore)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKSleepHealthStore;
  v6 = [(HKSleepHealthStore *)&v15 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F581B8] serialDispatchQueueSchedulerWithName:@"com.apple.HKSleepHealthStore"];
    scheduler = v6->_scheduler;
    v6->_scheduler = (NAScheduler *)v7;

    objc_storeStrong((id *)&v6->_healthStore, a3);
    id v9 = objc_alloc(MEMORY[0x263F0A818]);
    v10 = [(id)objc_opt_class() taskIdentifier];
    v11 = [MEMORY[0x263F08C38] UUID];
    uint64_t v12 = [v9 initWithHealthStore:v5 taskIdentifier:v10 exportedObject:v6 taskUUID:v11];
    proxyProvider = v6->_proxyProvider;
    v6->_proxyProvider = (HKTaskServerProxyProvider *)v12;
  }
  return v6;
}

+ (NSString)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)updateCurrentSleepSchedules:(id)a3 sleepDurationGoal:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    *(_DWORD *)buf = 138543618;
    id v26 = (id)objc_opt_class();
    __int16 v27 = 2112;
    id v28 = v8;
    id v13 = v26;
    _os_log_impl(&dword_214A6B000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating current sleep schedules: %@", buf, 0x16u);
  }
  v14 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v10];

  proxyProvider = self->_proxyProvider;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __79__HKSleepHealthStore_updateCurrentSleepSchedules_sleepDurationGoal_completion___block_invoke;
  v21[3] = &unk_264227FE0;
  id v22 = v8;
  id v23 = v9;
  id v24 = v14;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __79__HKSleepHealthStore_updateCurrentSleepSchedules_sleepDurationGoal_completion___block_invoke_2;
  v19[3] = &unk_264228008;
  id v20 = v24;
  id v16 = v24;
  id v17 = v9;
  id v18 = v8;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v21 errorHandler:v19];
}

uint64_t __79__HKSleepHealthStore_updateCurrentSleepSchedules_sleepDurationGoal_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateCurrentSleepSchedules:sleepDurationGoal:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __79__HKSleepHealthStore_updateCurrentSleepSchedules_sleepDurationGoal_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startSleepTrackingSession
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class();
    id v5 = v9;
    _os_log_impl(&dword_214A6B000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] starting a sleep tracking session", buf, 0xCu);
  }
  proxyProvider = self->_proxyProvider;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__HKSleepHealthStore_startSleepTrackingSession__block_invoke_2;
  v7[3] = &unk_264228050;
  v7[4] = self;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:&__block_literal_global_0 errorHandler:v7];
}

uint64_t __47__HKSleepHealthStore_startSleepTrackingSession__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startSleepTrackingSession");
}

void __47__HKSleepHealthStore_startSleepTrackingSession__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_ERROR))
  {
    v4 = v3;
    int v6 = 138543618;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2112;
    id v9 = v2;
    id v5 = v7;
    _os_log_error_impl(&dword_214A6B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] failed to start a sleep tracking session with error: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)stopSleepTrackingSession
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class();
    id v5 = v9;
    _os_log_impl(&dword_214A6B000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] stopping a sleep tracking session", buf, 0xCu);
  }
  proxyProvider = self->_proxyProvider;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__HKSleepHealthStore_stopSleepTrackingSession__block_invoke_2;
  v7[3] = &unk_264228050;
  v7[4] = self;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:&__block_literal_global_285 errorHandler:v7];
}

uint64_t __46__HKSleepHealthStore_stopSleepTrackingSession__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stopSleepTrackingSession");
}

void __46__HKSleepHealthStore_stopSleepTrackingSession__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_ERROR))
  {
    v4 = v3;
    int v6 = 138543618;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2112;
    id v9 = v2;
    id v5 = v7;
    _os_log_error_impl(&dword_214A6B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] failed to stop a sleep tracking session with error: %@", (uint8_t *)&v6, 0x16u);
  }
}

+ (BOOL)_areAllSamplesSleepTrackingSamples:(id)a3
{
  v3 = (void *)MEMORY[0x263F0A158];
  uint64_t v4 = *MEMORY[0x263F09410];
  id v5 = a3;
  int v6 = [v3 categoryTypeForIdentifier:v4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__HKSleepHealthStore__areAllSamplesSleepTrackingSamples___block_invoke;
  v9[3] = &unk_264228078;
  id v10 = v6;
  id v7 = v6;
  LOBYTE(v4) = objc_msgSend(v5, "hk_allObjectsPassTest:", v9);

  return v4;
}

uint64_t __57__HKSleepHealthStore__areAllSamplesSleepTrackingSamples___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 sampleType];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

+ (BOOL)_areAllSamples:(id)a3 containedInDateInterval:(id)a4
{
  id v5 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__HKSleepHealthStore__areAllSamples_containedInDateInterval___block_invoke;
  v8[3] = &unk_264228078;
  id v9 = v5;
  id v6 = v5;
  LOBYTE(a3) = objc_msgSend(a3, "hk_allObjectsPassTest:", v8);

  return (char)a3;
}

uint64_t __61__HKSleepHealthStore__areAllSamples_containedInDateInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 startDate];
  if ([v4 containsDate:v5])
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v3 endDate];
    uint64_t v8 = [v6 containsDate:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)saveSleepTrackingSamples:(id)a3 completion:(id)a4
{
}

- (void)saveSleepTrackingSamples:(id)a3 replacingSamplesInDateInterval:(id)a4 completion:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  v11 = (os_log_t *)MEMORY[0x263F09958];
  uint64_t v12 = (void *)*MEMORY[0x263F09958];
  BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (!v13) {
      goto LABEL_7;
    }
    v14 = v12;
    *(_DWORD *)buf = 138543874;
    id v39 = (id)objc_opt_class();
    __int16 v40 = 2112;
    id v41 = v9;
    __int16 v42 = 2112;
    id v43 = v8;
    id v15 = v39;
    id v16 = "[%{public}@] replacing sleep samples in %@ with sleep tracking samples: %@";
    id v17 = v14;
    uint32_t v18 = 32;
  }
  else
  {
    if (!v13) {
      goto LABEL_7;
    }
    v14 = v12;
    *(_DWORD *)buf = 138543618;
    id v39 = (id)objc_opt_class();
    __int16 v40 = 2112;
    id v41 = v8;
    id v15 = v39;
    id v16 = "[%{public}@] saving sleep tracking samples: %@";
    id v17 = v14;
    uint32_t v18 = 22;
  }
  _os_log_impl(&dword_214A6B000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);

LABEL_7:
  if (([(id)objc_opt_class() _areAllSamplesSleepTrackingSamples:v8] & 1) == 0)
  {
    _HKInitializeLogging();
    os_log_t v22 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
    {
      id v26 = v22;
      __int16 v27 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v39 = v27;
      id v28 = v27;
      _os_log_error_impl(&dword_214A6B000, v26, OS_LOG_TYPE_ERROR, "[%{public}@] attempted to save non-sleep samples", buf, 0xCu);
    }
    id v23 = (void *)MEMORY[0x263F087E8];
    id v24 = @"attempted to save non-sleep samples";
    goto LABEL_17;
  }
  if (v9 && ([(id)objc_opt_class() _areAllSamples:v8 containedInDateInterval:v9] & 1) == 0)
  {
    _HKInitializeLogging();
    os_log_t v25 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = v25;
      v30 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v39 = v30;
      id v31 = v30;
      _os_log_error_impl(&dword_214A6B000, v29, OS_LOG_TYPE_ERROR, "[%{public}@] dateInterval does not contain all samples", buf, 0xCu);
    }
    id v23 = (void *)MEMORY[0x263F087E8];
    id v24 = @"dateInterval does not contain all samples";
LABEL_17:
    v21 = objc_msgSend(v23, "hk_error:description:", 3, v24);
    v10[2](v10, 0, v21);
    goto LABEL_18;
  }
  v19 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v10];

  proxyProvider = self->_proxyProvider;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __89__HKSleepHealthStore_saveSleepTrackingSamples_replacingSamplesInDateInterval_completion___block_invoke;
  v34[3] = &unk_264227FE0;
  id v35 = v8;
  id v36 = v9;
  id v37 = v19;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __89__HKSleepHealthStore_saveSleepTrackingSamples_replacingSamplesInDateInterval_completion___block_invoke_2;
  v32[3] = &unk_264228008;
  id v10 = (void (**)(id, void, void *))v37;
  id v33 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v34 errorHandler:v32];

  v21 = v35;
LABEL_18:
}

uint64_t __89__HKSleepHealthStore_saveSleepTrackingSamples_replacingSamplesInDateInterval_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveSleepTrackingSamples:replacingSamplesInDateInterval:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __89__HKSleepHealthStore_saveSleepTrackingSamples_replacingSamplesInDateInterval_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (NAScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end