@interface STYScenarioReport
+ (id)reportFromSignpostEvent:(id)a3 error:(id *)a4;
+ (id)reportFromSignpostInterval:(id)a3 error:(id *)a4;
- (NSMutableDictionary)symptomsSignature;
- (NSString)issueCategory;
- (NSString)metadata;
- (STYScenarioReport)initWithScenario:(id)a3;
- (STYScenarioReport)initWithSignpostEvent:(id)a3 scenario:(id)a4 error:(id *)a5;
- (STYScenarioReport)initWithSignpostInterval:(id)a3 scenario:(id)a4 error:(id *)a5;
- (STYUserScenario)scenario;
- (SignpostInterval)interval;
- (float)observedFps;
- (float)observedLatencyInMs;
- (float)targetFps;
- (float)targetLatencyInMs;
- (id)convertDictionaryToString:(id)a3;
- (unint64_t)scenarioEndTime;
- (unint64_t)scenarioStartTime;
- (void)setInterval:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setSymptomsSignature:(id)a3;
- (void)setTargetLatencyInMs:(float)a3;
@end

@implementation STYScenarioReport

- (STYScenarioReport)initWithScenario:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STYScenarioReport;
  v6 = [(STYScenarioReport *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scenario, a3);
    v8 = v7;
  }

  return v7;
}

- (STYScenarioReport)initWithSignpostInterval:(id)a3 scenario:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v42.receiver = self;
  v42.super_class = (Class)STYScenarioReport;
  objc_super v10 = [(STYScenarioReport *)&v42 init];
  if (v10)
  {
    float v11 = machCtsTimeToMs([v8 durationMachContinuousTime]);
    objc_storeStrong((id *)v10 + 6, a4);
    *((float *)v10 + 2) = v11;
    *((void *)v10 + 3) = [v8 startMachContinuousTime];
    *((void *)v10 + 4) = [v8 endMachContinuousTime];
    mach_get_times();
    *(int64x2_t *)(v10 + 24) = vaddq_s64(vdupq_n_s64(0), *(int64x2_t *)(v10 + 24));
    v12 = +[STYUserScenarioCache sharedCache];
    [v12 latencyGoalsForSignpostInterval:v8];
    *((_DWORD *)v10 + 3) = v13;
    v14 = (float *)(v10 + 12);

    v15 = +[STYUserScenarioCache sharedCache];
    uint64_t v16 = [v15 issueCategoryForSignpostInterval:v8];
    v17 = (void *)*((void *)v10 + 5);
    *((void *)v10 + 5) = v16;

    if (!+[STYDeviceInfo isMemoryConstrained])
    {
      v18 = [v8 subsystem];
      if ([v18 isEqualToString:@"com.apple.SpringBoard"])
      {
      }
      else
      {
        v19 = [v8 subsystem];
        char v20 = [v19 isEqualToString:@"com.apple.app_launch_measurement"];

        if ((v20 & 1) == 0)
        {
          v21 = +[STYFrameworkHelper sharedHelper];
          v22 = [v21 logHandle];

          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
            -[STYScenarioReport initWithSignpostInterval:scenario:error:](v22);
          }

          float v23 = *v14 / 1.6;
          float *v14 = v23;
        }
      }
    }
    v24 = +[STYFrameworkHelper sharedHelper];
    v25 = [v24 logHandle];

    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[STYScenarioReport initWithSignpostInterval:scenario:error:](v9, v25);
    }

    v26 = +[STYFrameworkHelper sharedHelper];
    v27 = [v26 logHandle];

    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[STYScenarioReport initWithSignpostInterval:scenario:error:](v9, (float *)v10 + 3, v27);
    }

    if ([v9 kpi] == -1001)
    {
      id v28 = v8;
      [v28 frameRate];
      *((_DWORD *)v10 + 4) = v29;
      v30 = +[STYUserScenarioCache sharedCache];
      [v30 framerateGoalsForSignpostInterval:v28];
      int v32 = v31;

      *((_DWORD *)v10 + 5) = v32;
    }
    else
    {
      __asm { FMOV            V0.2S, #-1.0 }
      *((void *)v10 + 2) = _D0;
    }
    objc_storeStrong((id *)v10 + 8, a3);
    uint64_t v38 = symptomsSignatureForInterval(v8);
    v39 = (void *)*((void *)v10 + 9);
    *((void *)v10 + 9) = v38;

    v40 = v10;
  }

  return (STYScenarioReport *)v10;
}

- (STYScenarioReport)initWithSignpostEvent:(id)a3 scenario:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)STYScenarioReport;
  id v9 = [(STYScenarioReport *)&v20 init];
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scenario, a4);
    v10->_scenarioStartTime = 0;
    v10->_scenarioEndTime = mach_absolute_time();
    __asm { FMOV            V0.2S, #-1.0 }
    *(void *)&v10->_observedFps = _D0;
    uint64_t v16 = symptomsSignatureForEvent(v7);
    symptomsSignature = v10->_symptomsSignature;
    v10->_symptomsSignature = (NSMutableDictionary *)v16;

    v18 = v10;
  }

  return v10;
}

- (id)convertDictionaryToString:(id)a3
{
  uint64_t v6 = 0;
  v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:0 error:&v6];
  v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];

  return v4;
}

+ (id)reportFromSignpostEvent:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = +[STYUserScenario scenarioFromSignpostEvent:v5 error:a4];
  if (v6) {
    id v7 = [[STYScenarioReport alloc] initWithSignpostEvent:v5 scenario:v6 error:a4];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

+ (id)reportFromSignpostInterval:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = +[STYUserScenario scenarioFromSignpostInterval:v5 error:a4];
  if (v6) {
    id v7 = [[STYScenarioReport alloc] initWithSignpostInterval:v5 scenario:v6 error:a4];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (float)observedLatencyInMs
{
  return self->_observedLatencyInMs;
}

- (float)targetLatencyInMs
{
  return self->_targetLatencyInMs;
}

- (void)setTargetLatencyInMs:(float)a3
{
  self->_targetLatencyInMs = a3;
}

- (float)observedFps
{
  return self->_observedFps;
}

- (float)targetFps
{
  return self->_targetFps;
}

- (unint64_t)scenarioStartTime
{
  return self->_scenarioStartTime;
}

- (unint64_t)scenarioEndTime
{
  return self->_scenarioEndTime;
}

- (NSString)issueCategory
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (STYUserScenario)scenario
{
  return (STYUserScenario *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)metadata
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMetadata:(id)a3
{
}

- (SignpostInterval)interval
{
  return (SignpostInterval *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInterval:(id)a3
{
}

- (NSMutableDictionary)symptomsSignature
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSymptomsSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symptomsSignature, 0);
  objc_storeStrong((id *)&self->_interval, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_scenario, 0);
  objc_storeStrong((id *)&self->_issueCategory, 0);
}

- (void)initWithSignpostInterval:(void *)a1 scenario:(float *)a2 error:(NSObject *)a3 .cold.1(void *a1, float *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 scenarioID];
  double v6 = *a2;
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2048;
  double v10 = v6;
  _os_log_debug_impl(&dword_1D3037000, a3, OS_LOG_TYPE_DEBUG, "[Signpost: %@] The target latency is %.0f ms", (uint8_t *)&v7, 0x16u);
}

- (void)initWithSignpostInterval:(void *)a1 scenario:(NSObject *)a2 error:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 scenarioID];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_1D3037000, a2, OS_LOG_TYPE_DEBUG, "[Signpost: %@] Signpost interval is whitelisted", (uint8_t *)&v4, 0xCu);
}

- (void)initWithSignpostInterval:(os_log_t)log scenario:error:.cold.3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = 0x3FF999999999999ALL;
  _os_log_debug_impl(&dword_1D3037000, log, OS_LOG_TYPE_DEBUG, "Device is not memory constrained reducing the threshold by a fraction of %f", (uint8_t *)&v1, 0xCu);
}

@end