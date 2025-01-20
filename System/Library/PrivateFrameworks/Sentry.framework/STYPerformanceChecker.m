@interface STYPerformanceChecker
+ (id)sharedPerfChecker;
- (BOOL)underMemoryPressure;
- (BOOL)underThermalPressure;
- (NSDictionary)perfCheckerErrors;
- (OS_dispatch_queue)serialUtilityQueue;
- (int64_t)triage:(id)a3;
- (void)checkFramerateOfAnimationScenario:(id)a3 completionHandler:(id)a4;
- (void)checkLatencyOfResponsivenessScenario:(id)a3 completionHandler:(id)a4;
- (void)checkPerformanceOfScenarioReport:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)reportError:(int64_t)a3 report:(id)a4 completionHandler:(id)a5;
- (void)setPerfCheckerErrors:(id)a3;
- (void)setSerialUtilityQueue:(id)a3;
- (void)setUnderMemoryPressure:(BOOL)a3;
- (void)setUnderThermalPressure:(BOOL)a3;
@end

@implementation STYPerformanceChecker

+ (id)sharedPerfChecker
{
  if (sharedPerfChecker_onceToken != -1) {
    dispatch_once(&sharedPerfChecker_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedPerfChecker_sharedChecker;

  return v2;
}

void __42__STYPerformanceChecker_sharedPerfChecker__block_invoke()
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v0 = objc_alloc_init(STYPerformanceChecker);
  v1 = (void *)sharedPerfChecker_sharedChecker;
  sharedPerfChecker_sharedChecker = (uint64_t)v0;

  if (sharedPerfChecker_sharedChecker)
  {
    v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -15);
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Sentry.Frameworking.framework.STYPerformanceChecker", v2);
    [(id)sharedPerfChecker_sharedChecker setSerialUtilityQueue:v3];

    v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:8];
    [(id)sharedPerfChecker_sharedChecker setPerfCheckerErrors:v4];

    v14[0] = &unk_1F2A2B188;
    v14[1] = &unk_1F2A2B188;
    v15[0] = @"Encountered unexpected configuration error.";
    v15[1] = @"System is under memory pressure.";
    v14[2] = &unk_1F2A2B1A0;
    v15[2] = @"System is under thermal pressure.";
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    [(id)sharedPerfChecker_sharedChecker setPerfCheckerErrors:v5];

    startMonitoringSystemConditions();
    [(id)sharedPerfChecker_sharedChecker setUnderThermalPressure:0];
    [(id)sharedPerfChecker_sharedChecker setUnderMemoryPressure:0];
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v7 = (id)[v6 addObserverForName:kSTYNoMemoryPressureNotification object:0 queue:0 usingBlock:&__block_literal_global_21];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v9 = (id)[v8 addObserverForName:kSTYHeavyMemoryPressureNotification object:0 queue:0 usingBlock:&__block_literal_global_23];

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v11 = (id)[v10 addObserverForName:kSTYNoThermalPressureNotification object:0 queue:0 usingBlock:&__block_literal_global_25];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v13 = (id)[v12 addObserverForName:kSTYHeavyThermalPressureNotification object:0 queue:0 usingBlock:&__block_literal_global_27];
  }
}

uint64_t __42__STYPerformanceChecker_sharedPerfChecker__block_invoke_18()
{
  return [(id)sharedPerfChecker_sharedChecker setUnderMemoryPressure:0];
}

uint64_t __42__STYPerformanceChecker_sharedPerfChecker__block_invoke_2()
{
  return [(id)sharedPerfChecker_sharedChecker setUnderMemoryPressure:1];
}

uint64_t __42__STYPerformanceChecker_sharedPerfChecker__block_invoke_3()
{
  return [(id)sharedPerfChecker_sharedChecker setUnderThermalPressure:0];
}

uint64_t __42__STYPerformanceChecker_sharedPerfChecker__block_invoke_4()
{
  return [(id)sharedPerfChecker_sharedChecker setUnderThermalPressure:1];
}

- (void)checkPerformanceOfScenarioReport:(id)a3 completionHandler:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v11 scenario];
  uint64_t v8 = [v7 kpi];

  if (v8 == -1001)
  {
    [(STYPerformanceChecker *)self checkFramerateOfAnimationScenario:v11 completionHandler:v6];
  }
  else
  {
    id v9 = [v11 scenario];
    uint64_t v10 = [v9 kpi];

    if (v10 == -1000) {
      [(STYPerformanceChecker *)self checkLatencyOfResponsivenessScenario:v11 completionHandler:v6];
    }
    else {
      [(STYPerformanceChecker *)self reportError:-100001 report:v11 completionHandler:v6];
    }
  }
}

- (void)reportError:(int64_t)a3 report:(id)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = (void (**)(id, void, void *, id))a5;
  uint64_t v10 = +[STYFrameworkHelper sharedHelper];
  id v11 = [v10 logHandle];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v25 = [v8 scenario];
    v20 = [v25 scenarioID];
    perfCheckerErrors = self->_perfCheckerErrors;
    v22 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    v23 = [v22 stringValue];
    v24 = [(NSDictionary *)perfCheckerErrors valueForKey:v23];
    *(_DWORD *)buf = 138412802;
    v29 = v20;
    __int16 v30 = 2048;
    int64_t v31 = a3;
    __int16 v32 = 2112;
    v33 = v24;
    _os_log_error_impl(&dword_1D3037000, v11, OS_LOG_TYPE_ERROR, "Encountered error conditions while checking performance of %@ :  %ld / %@", buf, 0x20u);
  }
  uint64_t v26 = *MEMORY[0x1E4F28568];
  v12 = [MEMORY[0x1E4F28B50] mainBundle];
  id v13 = self->_perfCheckerErrors;
  v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  v15 = [v14 stringValue];
  v16 = [(NSDictionary *)v13 valueForKey:v15];
  v17 = [v12 localizedStringForKey:v16 value:&stru_1F2A289A0 table:0];
  v27 = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];

  v19 = [MEMORY[0x1E4F28C58] errorWithDomain:STYPerformanceCheckerErrorDomain code:a3 userInfo:v18];
  v9[2](v9, 0, v19, v8);
}

- (void)checkLatencyOfResponsivenessScenario:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialUtilityQueue = self->_serialUtilityQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__STYPerformanceChecker_checkLatencyOfResponsivenessScenario_completionHandler___block_invoke;
  block[3] = &unk_1E6971820;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialUtilityQueue, block);
}

uint64_t __80__STYPerformanceChecker_checkLatencyOfResponsivenessScenario_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) triage:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = v2;
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v4 reportError:v3 report:v5 completionHandler:v6];
  }
  else
  {
    [*(id *)(a1 + 40) observedLatencyInMs];
    [*(id *)(a1 + 40) targetLatencyInMs];
    id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v8();
  }
}

- (void)checkFramerateOfAnimationScenario:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialUtilityQueue = self->_serialUtilityQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__STYPerformanceChecker_checkFramerateOfAnimationScenario_completionHandler___block_invoke;
  block[3] = &unk_1E6971820;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialUtilityQueue, block);
}

uint64_t __77__STYPerformanceChecker_checkFramerateOfAnimationScenario_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) triage:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = v2;
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v4 reportError:v3 report:v5 completionHandler:v6];
  }
  else
  {
    [*(id *)(a1 + 40) observedFps];
    float v9 = v8;
    [*(id *)(a1 + 40) targetFps];
    float v11 = v10;
    id v12 = +[STYFrameworkHelper sharedHelper];
    id v13 = [v12 logHandle];

    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v9 <= v11)
    {
      if (v14)
      {
        v20 = [*(id *)(a1 + 40) scenario];
        v21 = [v20 scenarioID];
        [*(id *)(a1 + 40) observedFps];
        double v23 = v22;
        [*(id *)(a1 + 40) targetFps];
        int v25 = 138412802;
        uint64_t v26 = v21;
        __int16 v27 = 2048;
        double v28 = v23;
        __int16 v29 = 2048;
        double v30 = v24;
        _os_log_impl(&dword_1D3037000, v13, OS_LOG_TYPE_DEFAULT, " %@'s observed framerate of %.0f was below threshold of %.0f ", (uint8_t *)&v25, 0x20u);
      }
    }
    else if (v14)
    {
      v15 = [*(id *)(a1 + 40) scenario];
      v16 = [v15 scenarioID];
      [*(id *)(a1 + 40) observedFps];
      double v18 = v17;
      [*(id *)(a1 + 40) targetFps];
      int v25 = 138412802;
      uint64_t v26 = v16;
      __int16 v27 = 2048;
      double v28 = v18;
      __int16 v29 = 2048;
      double v30 = v19;
      _os_log_impl(&dword_1D3037000, v13, OS_LOG_TYPE_DEFAULT, " %@'s observed framerate of %.0f was above threshold of %.0f ", (uint8_t *)&v25, 0x20u);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (int64_t)triage:(id)a3
{
  if (self->_underThermalPressure) {
    return -1003;
  }
  if (self->_underMemoryPressure) {
    return -1002;
  }
  return 0;
}

- (void)dealloc
{
  stopMonitoringSystemConditions();
  v3.receiver = self;
  v3.super_class = (Class)STYPerformanceChecker;
  [(STYPerformanceChecker *)&v3 dealloc];
}

- (NSDictionary)perfCheckerErrors
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPerfCheckerErrors:(id)a3
{
}

- (OS_dispatch_queue)serialUtilityQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSerialUtilityQueue:(id)a3
{
}

- (BOOL)underMemoryPressure
{
  return self->_underMemoryPressure;
}

- (void)setUnderMemoryPressure:(BOOL)a3
{
  self->_underMemoryPressure = a3;
}

- (BOOL)underThermalPressure
{
  return self->_underThermalPressure;
}

- (void)setUnderThermalPressure:(BOOL)a3
{
  self->_underThermalPressure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialUtilityQueue, 0);

  objc_storeStrong((id *)&self->_perfCheckerErrors, 0);
}

@end