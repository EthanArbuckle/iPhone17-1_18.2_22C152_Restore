@interface HKSleepHealthStore(HDSPSleep)
- (id)hdsp_persistSessions:()HDSPSleep;
- (uint64_t)hdsp_startSession;
- (uint64_t)hdsp_stopSession;
@end

@implementation HKSleepHealthStore(HDSPSleep)

- (uint64_t)hdsp_startSession
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v3 = v6;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] starting session", (uint8_t *)&v5, 0xCu);
  }
  return [a1 startSleepTrackingSession];
}

- (uint64_t)hdsp_stopSession
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v3 = v6;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] stopping session", (uint8_t *)&v5, 0xCu);
  }
  return [a1 stopSleepTrackingSession];
}

- (id)hdsp_persistSessions:()HDSPSleep
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F58190]);
  id v6 = [a1 scheduler];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__HKSleepHealthStore_HDSPSleep__hdsp_persistSessions___block_invoke;
  v12[3] = &unk_2645D9EE0;
  v12[4] = a1;
  id v7 = v5;
  id v13 = v7;
  id v14 = v4;
  id v8 = v4;
  [v6 performBlock:v12];

  v9 = v14;
  id v10 = v7;

  return v10;
}

@end