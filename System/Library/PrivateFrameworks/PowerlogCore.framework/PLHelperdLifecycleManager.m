@interface PLHelperdLifecycleManager
+ (id)sharedManager;
- (BOOL)isServiceActive:(int64_t)a3;
- (NSMutableSet)activeServices;
- (PLHelperdLifecycleManager)init;
- (id)serviceNameFor:(int64_t)a3;
- (void)setActiveServices:(id)a3;
- (void)signalServiceActive:(int64_t)a3;
- (void)signalServiceInactive:(int64_t)a3;
- (void)stopPowerlogHelperd;
@end

@implementation PLHelperdLifecycleManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)sharedManager_helperdLifecycleManagerInstance;
  return v2;
}

uint64_t __42__PLHelperdLifecycleManager_sharedManager__block_invoke()
{
  sharedManager_helperdLifecycleManagerInstance = objc_alloc_init(PLHelperdLifecycleManager);
  return MEMORY[0x1F41817F8]();
}

- (PLHelperdLifecycleManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLHelperdLifecycleManager;
  v2 = [(PLHelperdLifecycleManager *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(PLHelperdLifecycleManager *)v2 setActiveServices:v3];
  }
  return v2;
}

- (void)signalServiceActive:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [(PLHelperdLifecycleManager *)self activeServices];
  objc_sync_enter(v5);
  v6 = [(PLHelperdLifecycleManager *)self activeServices];
  v7 = [(PLHelperdLifecycleManager *)self serviceNameFor:a3];
  char v8 = [v6 containsObject:v7];

  if (v8)
  {
    objc_sync_exit(v5);
  }
  else
  {
    v9 = PLLogPowerlogHelperdLifecycleManager();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(PLHelperdLifecycleManager *)self serviceNameFor:a3];
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl(&dword_1BBD2F000, v9, OS_LOG_TYPE_DEFAULT, "%@ became active", buf, 0xCu);
    }
    v11 = [(PLHelperdLifecycleManager *)self activeServices];
    v12 = [(PLHelperdLifecycleManager *)self serviceNameFor:a3];
    [v11 addObject:v12];

    v13 = PLLogPowerlogHelperdLifecycleManager();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = [(PLHelperdLifecycleManager *)self activeServices];
      [(PLHelperdLifecycleManager *)v14 signalServiceActive:v13];
    }

    objc_sync_exit(v5);
    objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v15 = objc_msgSend(NSNumber, "numberWithInteger:", a3, @"service");
    v18 = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    [v5 postNotificationName:@"PLHelperdLifecycleManager.serviceIsActive" object:0 userInfo:v16];
  }
}

- (void)signalServiceInactive:(int64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [(PLHelperdLifecycleManager *)self activeServices];
  objc_sync_enter(v5);
  v6 = [(PLHelperdLifecycleManager *)self activeServices];
  v7 = [(PLHelperdLifecycleManager *)self serviceNameFor:a3];
  char v8 = [v6 containsObject:v7];

  v9 = PLLogPowerlogHelperdLifecycleManager();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(PLHelperdLifecycleManager *)self serviceNameFor:a3];
      *(_DWORD *)buf = 138412290;
      v27 = v11;
      _os_log_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_DEFAULT, "%@ became inactive", buf, 0xCu);
    }
    v12 = [(PLHelperdLifecycleManager *)self activeServices];
    v13 = [(PLHelperdLifecycleManager *)self serviceNameFor:a3];
    [v12 removeObject:v13];

    v14 = [(PLHelperdLifecycleManager *)self activeServices];
    LODWORD(v13) = [v14 count] == 0;

    v15 = PLLogPowerlogHelperdLifecycleManager();
    v16 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = 1;
        _os_log_impl(&dword_1BBD2F000, v16, OS_LOG_TYPE_DEFAULT, "Will attempt to stop powerlogHelperd after %d seconds", buf, 8u);
      }

      dispatch_time_t v19 = dispatch_time(0, 1000000000);
      v20 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__PLHelperdLifecycleManager_signalServiceInactive___block_invoke;
      block[3] = &unk_1E62538C8;
      block[4] = self;
      dispatch_after(v19, v20, block);
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = [(PLHelperdLifecycleManager *)self activeServices];
        [(PLHelperdLifecycleManager *)v17 signalServiceActive:v16];
      }
    }
    objc_sync_exit(v5);

    objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v24 = @"service";
    uint64_t v21 = [NSNumber numberWithInteger:a3];
    v25 = v21;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    [v5 postNotificationName:@"PLHelperdLifecycleManager.serviceIsInactive" object:0 userInfo:v22];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v18 = [(PLHelperdLifecycleManager *)self serviceNameFor:a3];
      [(PLHelperdLifecycleManager *)v18 signalServiceInactive:v10];
    }

    objc_sync_exit(v5);
  }
}

uint64_t __51__PLHelperdLifecycleManager_signalServiceInactive___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopPowerlogHelperd];
}

- (BOOL)isServiceActive:(int64_t)a3
{
  objc_super v5 = [(PLHelperdLifecycleManager *)self activeServices];
  objc_sync_enter(v5);
  v6 = [(PLHelperdLifecycleManager *)self activeServices];
  v7 = [(PLHelperdLifecycleManager *)self serviceNameFor:a3];
  LOBYTE(a3) = [v6 containsObject:v7];

  objc_sync_exit(v5);
  return a3;
}

- (void)stopPowerlogHelperd
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(PLHelperdLifecycleManager *)self activeServices];
  objc_sync_enter(v3);
  v4 = [(PLHelperdLifecycleManager *)self activeServices];
  uint64_t v5 = [v4 count];

  v6 = PLLogPowerlogHelperdLifecycleManager();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      char v8 = [(PLHelperdLifecycleManager *)self activeServices];
      int v9 = 134217984;
      uint64_t v10 = [v8 count];
      _os_log_impl(&dword_1BBD2F000, v6, OS_LOG_TYPE_DEFAULT, "Attempted to stop powerlogHelperd when %lu services are active; keeping powerlogHelperd alive",
        (uint8_t *)&v9,
        0xCu);
    }
  }
  else
  {
    if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1BBD2F000, v6, OS_LOG_TYPE_DEFAULT, "No active services; stopping powerlogHelperd",
        (uint8_t *)&v9,
        2u);
    }

    +[PLUtilities exitWithReason:6];
  }
  objc_sync_exit(v3);
}

- (id)serviceNameFor:(int64_t)a3
{
  v3 = @"PLXPCService";
  if (a3 == 1) {
    v3 = @"PLBatteryGaugeService";
  }
  if (a3 == 2) {
    return @"PLPowerMetricMonitorService";
  }
  else {
    return v3;
  }
}

- (NSMutableSet)activeServices
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setActiveServices:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)signalServiceActive:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_DEBUG, "Currently active services: %@", buf, 0xCu);
}

- (void)signalServiceInactive:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_ERROR, "Signaled service inactive for %@ which is not currently active.", buf, 0xCu);
}

@end