@interface VUIPerfMetricsAppLaunchController
+ (id)sharedInstance;
- (NSDictionary)appLaunchData;
- (VUIPerfMetricsAppLaunchController)init;
- (void)_setAppLaunchFieldWithData:(id)a3;
- (void)recordAppLaunchEventWithEventType:(id)a3;
- (void)setAppLaunchData:(id)a3;
@end

@implementation VUIPerfMetricsAppLaunchController

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VUIPerfMetricsAppLaunchController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_1 != -1) {
    dispatch_once(&sharedInstance_once_1, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_9;
  return v2;
}

- (void)recordAppLaunchEventWithEventType:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  v6 = [v4 date];
  [v6 timeIntervalSince1970];
  double v8 = v7 * 1000.0;

  v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:vcvtad_u64_f64(v8)];
  id v11 = v5;
  v12[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  [(VUIPerfMetricsAppLaunchController *)self _setAppLaunchFieldWithData:v10];
}

- (void)_setAppLaunchFieldWithData:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v6 = [(VUIPerfMetricsAppLaunchController *)v5 appLaunchData];

  if (!v6)
  {
    v12 = @"isAppLaunch";
    double v7 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    v13[0] = v7;
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    [(VUIPerfMetricsAppLaunchController *)v5 setAppLaunchData:v8];
  }
  v9 = [(VUIPerfMetricsAppLaunchController *)v5 appLaunchData];
  v10 = (void *)[v9 mutableCopy];

  [v10 addEntriesFromDictionary:v4];
  id v11 = (void *)[v10 copy];
  [(VUIPerfMetricsAppLaunchController *)v5 setAppLaunchData:v11];

  objc_sync_exit(v5);
}

- (NSDictionary)appLaunchData
{
  return self->_appLaunchData;
}

- (void)setAppLaunchData:(id)a3
{
}

void __51__VUIPerfMetricsAppLaunchController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_9;
  sharedInstance_sharedInstance_9 = (uint64_t)v1;
}

- (VUIPerfMetricsAppLaunchController)init
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)VUIPerfMetricsAppLaunchController;
  v2 = [(VUIPerfMetricsAppLaunchController *)&v10 init];
  if (v2)
  {
    *(void *)v14 = 0xE00000001;
    int v15 = 1;
    pid_t v16 = getpid();
    memset(v13, 0, 512);
    size_t v9 = 648;
    if (sysctl(v14, 4u, v13, &v9, 0, 0))
    {
      v3 = VUIDefaultLogObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v8 = 0;
        _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "Could not read processStartTime", v8, 2u);
      }

      unint64_t v4 = 0;
    }
    else
    {
      unint64_t v4 = (unint64_t)(((double)SDWORD2(v13[0]) / 1000000.0 + (double)*(uint64_t *)&v13[0]) * 1000.0);
    }
    id v11 = @"processStartTime";
    id v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v4];
    v12 = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    [(VUIPerfMetricsAppLaunchController *)v2 _setAppLaunchFieldWithData:v6];
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end