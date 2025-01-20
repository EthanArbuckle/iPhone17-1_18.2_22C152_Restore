@interface PLDTCostElement
+ (id)getCostElementInstance;
- (NSDate)costReturnedTillDate;
- (NSDate)lastOverheadStart;
- (NSDate)startDate;
- (PLDTCostElement)init;
- (PLDTCostElement)initWithTime:(id)a3;
- (double)costAggregated;
- (id)getApplicationCostUptoTime:(id)a3 withPid:(int)a4 withLastActiveStart:(id)a5 withLastSuspendStart:(id)a6 withAppState:(int)a7;
- (id)getCostUptoTime:(id)a3;
- (id)getCpuCostUptoTime:(id)a3 withPid:(int)a4 withLastActiveStart:(id)a5 withLastSuspendStart:(id)a6 withAppState:(int)a7;
- (id)getDisplayCostUptoTime:(id)a3 withPid:(int)a4 withLastActiveStart:(id)a5 withLastSuspendStart:(id)a6 withAppState:(int)a7;
- (id)getGpuCostUptoTime:(id)a3 withPid:(int)a4 withLastActiveStart:(id)a5 withLastSuspendStart:(id)a6 withAppState:(int)a7;
- (id)getLocationCostUptoTime:(id)a3 withPid:(int)a4 withLastActiveStart:(id)a5 withLastSuspendStart:(id)a6 withAppState:(int)a7;
- (id)getNetworkingCostUptoTime:(id)a3 withPid:(int)a4 withLastActiveStart:(id)a5 withLastSuspendStart:(id)a6 withAppState:(int)a7 withQueryCount:(int)a8;
- (void)addCpuEvent:(double)a3 atTime:(id)a4 withPid:(int)a5 withAppState:(int)a6;
- (void)addDisplayEvent:(double)a3 atTime:(id)a4 withPid:(int)a5 withAppState:(int)a6;
- (void)addEvent:(double)a3 atTime:(id)a4;
- (void)addGpuEvent:(double)a3 atTime:(id)a4 withPid:(int)a5 withAppState:(int)a6;
- (void)addLocationEvent:(double)a3 atTime:(id)a4 withPid:(int)a5 withAppState:(int)a6;
- (void)addNetworkingEvent:(double)a3 atTime:(id)a4 withPid:(int)a5 withAppState:(int)a6 withQueryCount:(int)a7;
- (void)setCostAggregated:(double)a3;
- (void)setCostReturnedTillDate:(id)a3;
- (void)setLastOverheadStart:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation PLDTCostElement

+ (id)getCostElementInstance
{
  if (getCostElementInstance_onceCostElement != -1) {
    dispatch_once(&getCostElementInstance_onceCostElement, &__block_literal_global_22);
  }
  v2 = (void *)getCostElementInstance_singletonCostElement;
  return v2;
}

uint64_t __41__PLDTCostElement_getCostElementInstance__block_invoke()
{
  getCostElementInstance_singletonCostElement = objc_alloc_init(PLDTCostElement);
  return MEMORY[0x1F41817F8]();
}

- (PLDTCostElement)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLDTCostElement;
  v2 = [(PLDTCostElement *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)_trackedProcesses;
    _trackedProcesses = v3;
  }
  return v2;
}

- (PLDTCostElement)initWithTime:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLDTCostElement;
  objc_super v6 = [(PLDTCostElement *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_startDate, a3);
    objc_storeStrong((id *)&v7->_costReturnedTillDate, a3);
    v7->_costAggregated = 0.0;
    uint64_t v8 = objc_opt_new();
    v9 = (void *)_trackedProcesses;
    _trackedProcesses = v8;
  }
  return v7;
}

- (void)addEvent:(double)a3 atTime:(id)a4
{
  id v7 = a4;
  objc_sync_enter(@"___Sync___");
  [(PLDTCostElement *)self costAggregated];
  [(PLDTCostElement *)self setCostAggregated:v6 + a3];
  if (a3 > 0.0) {
    [(PLDTCostElement *)self setLastOverheadStart:v7];
  }
  objc_sync_exit(@"___Sync___");
}

- (void)addNetworkingEvent:(double)a3 atTime:(id)a4 withPid:(int)a5 withAppState:(int)a6 withQueryCount:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a5;
  id v44 = a4;
  objc_sync_enter(@"___Sync___");
  objc_super v11 = (void *)_trackedProcesses;
  v12 = [MEMORY[0x1E4F28ED0] numberWithInt:v9];
  v13 = [v11 objectForKey:v12];

  if (!v13)
  {
    v14 = (void *)_trackedProcesses;
    v15 = objc_opt_new();
    v16 = [MEMORY[0x1E4F28ED0] numberWithInt:v9];
    [v14 setObject:v15 forKey:v16];

    v17 = (void *)_trackedProcesses;
    v18 = [MEMORY[0x1E4F28ED0] numberWithInt:v9];
    v19 = [v17 objectForKeyedSubscript:v18];
    v20 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v19 setObject:v20 forKey:@"networkingCostReturnedTillDate"];
  }
  BOOL v22 = a6 == 8 || a6 == 4;
  if (a3 > 0.0 && v22)
  {
    v23 = (void *)_trackedProcesses;
    v24 = [MEMORY[0x1E4F28ED0] numberWithInt:v9];
    v25 = [v23 objectForKeyedSubscript:v24];
    v26 = [v25 objectForKey:@"networkingCostAggregated"];

    v27 = (void *)_trackedProcesses;
    v28 = [MEMORY[0x1E4F28ED0] numberWithInt:v9];
    v29 = [v27 objectForKeyedSubscript:v28];
    if (v26)
    {
      v30 = (void *)MEMORY[0x1E4F28ED0];
      v31 = (void *)_trackedProcesses;
      v32 = [MEMORY[0x1E4F28ED0] numberWithInt:v9];
      v33 = [v31 objectForKeyedSubscript:v32];
      v34 = [v33 objectForKeyedSubscript:@"networkingCostAggregated"];
      [v34 doubleValue];
      v36 = [v30 numberWithDouble:v35 + a3];
      [v29 setObject:v36 forKey:@"networkingCostAggregated"];
    }
    else
    {
      v32 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
      [v29 setObject:v32 forKey:@"networkingCostAggregated"];
    }

    v37 = (void *)_trackedProcesses;
    v38 = [MEMORY[0x1E4F28ED0] numberWithInt:v9];
    v39 = [v37 objectForKeyedSubscript:v38];
    [v39 setObject:v44 forKey:@"lastNetworkingOverheadStart"];

    v40 = (void *)_trackedProcesses;
    v41 = [MEMORY[0x1E4F28ED0] numberWithInt:v9];
    v42 = [v40 objectForKeyedSubscript:v41];
    v43 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
    [v42 setObject:v43 forKey:@"lastNetworkingOverheadStartCount"];
  }
  objc_sync_exit(@"___Sync___");
}

- (void)addLocationEvent:(double)a3 atTime:(id)a4 withPid:(int)a5 withAppState:(int)a6
{
  uint64_t v6 = *(void *)&a5;
  id v31 = a4;
  objc_sync_enter(@"___Sync___");
  uint64_t v8 = (void *)_trackedProcesses;
  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
  v10 = [v8 objectForKey:v9];

  if (!v10)
  {
    objc_super v11 = (void *)_trackedProcesses;
    v12 = objc_opt_new();
    v13 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
    [v11 setObject:v12 forKey:v13];
  }
  if (a3 > 0.0)
  {
    v14 = (void *)_trackedProcesses;
    v15 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
    v16 = [v14 objectForKeyedSubscript:v15];
    v17 = [v16 objectForKey:@"locationCostAggregated"];

    v18 = (void *)_trackedProcesses;
    v19 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
    v20 = [v18 objectForKeyedSubscript:v19];
    if (v17)
    {
      v21 = (void *)MEMORY[0x1E4F28ED0];
      BOOL v22 = (void *)_trackedProcesses;
      v23 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
      v24 = [v22 objectForKeyedSubscript:v23];
      v25 = [v24 objectForKeyedSubscript:@"locationCostAggregated"];
      [v25 doubleValue];
      v27 = [v21 numberWithDouble:v26 + a3];
      [v20 setObject:v27 forKey:@"locationCostAggregated"];
    }
    else
    {
      v23 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
      [v20 setObject:v23 forKey:@"locationCostAggregated"];
    }

    v28 = (void *)_trackedProcesses;
    v29 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
    v30 = [v28 objectForKeyedSubscript:v29];
    [v30 setObject:v31 forKey:@"lastLocationOverheadStart"];
  }
  objc_sync_exit(@"___Sync___");
}

- (void)addCpuEvent:(double)a3 atTime:(id)a4 withPid:(int)a5 withAppState:(int)a6
{
  uint64_t v7 = *(void *)&a5;
  id v34 = a4;
  objc_sync_enter(@"___Sync___");
  uint64_t v9 = (void *)_trackedProcesses;
  v10 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
  objc_super v11 = [v9 objectForKey:v10];

  if (!v11)
  {
    v12 = (void *)_trackedProcesses;
    v13 = objc_opt_new();
    v14 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
    [v12 setObject:v13 forKey:v14];
  }
  BOOL v16 = a6 == 8 || a6 == 4;
  if (a3 > 0.0 && v16)
  {
    v17 = (void *)_trackedProcesses;
    v18 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
    v19 = [v17 objectForKeyedSubscript:v18];
    v20 = [v19 objectForKey:@"cpuCostAggregated"];

    v21 = (void *)_trackedProcesses;
    BOOL v22 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
    v23 = [v21 objectForKeyedSubscript:v22];
    if (v20)
    {
      v24 = (void *)MEMORY[0x1E4F28ED0];
      v25 = (void *)_trackedProcesses;
      double v26 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
      v27 = [v25 objectForKeyedSubscript:v26];
      v28 = [v27 objectForKeyedSubscript:@"cpuCostAggregated"];
      [v28 doubleValue];
      v30 = [v24 numberWithDouble:v29 + a3];
      [v23 setObject:v30 forKey:@"cpuCostAggregated"];
    }
    else
    {
      double v26 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
      [v23 setObject:v26 forKey:@"cpuCostAggregated"];
    }

    id v31 = (void *)_trackedProcesses;
    v32 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
    v33 = [v31 objectForKeyedSubscript:v32];
    [v33 setObject:v34 forKey:@"lastCpuOverheadStart"];
  }
  objc_sync_exit(@"___Sync___");
}

- (void)addGpuEvent:(double)a3 atTime:(id)a4 withPid:(int)a5 withAppState:(int)a6
{
  uint64_t v7 = *(void *)&a5;
  id v32 = a4;
  objc_sync_enter(@"___Sync___");
  uint64_t v9 = (void *)_trackedProcesses;
  v10 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
  objc_super v11 = [v9 objectForKey:v10];

  if (!v11)
  {
    v12 = (void *)_trackedProcesses;
    v13 = objc_opt_new();
    v14 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
    [v12 setObject:v13 forKey:v14];
  }
  if (a3 > 0.0 && a6 == 8)
  {
    v15 = (void *)_trackedProcesses;
    BOOL v16 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
    v17 = [v15 objectForKeyedSubscript:v16];
    v18 = [v17 objectForKey:@"gpuCostAggregated"];

    v19 = (void *)_trackedProcesses;
    v20 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
    v21 = [v19 objectForKeyedSubscript:v20];
    if (v18)
    {
      BOOL v22 = (void *)MEMORY[0x1E4F28ED0];
      v23 = (void *)_trackedProcesses;
      v24 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
      v25 = [v23 objectForKeyedSubscript:v24];
      double v26 = [v25 objectForKeyedSubscript:@"gpuCostAggregated"];
      [v26 doubleValue];
      v28 = [v22 numberWithDouble:v27 + a3];
      [v21 setObject:v28 forKey:@"gpuCostAggregated"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
      [v21 setObject:v24 forKey:@"gpuCostAggregated"];
    }

    double v29 = (void *)_trackedProcesses;
    v30 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
    id v31 = [v29 objectForKeyedSubscript:v30];
    [v31 setObject:v32 forKey:@"lastGpuOverheadStart"];
  }
  objc_sync_exit(@"___Sync___");
}

- (void)addDisplayEvent:(double)a3 atTime:(id)a4 withPid:(int)a5 withAppState:(int)a6
{
  uint64_t v7 = *(void *)&a5;
  id v32 = a4;
  objc_sync_enter(@"___Sync___");
  uint64_t v9 = (void *)_trackedProcesses;
  v10 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
  objc_super v11 = [v9 objectForKey:v10];

  if (!v11)
  {
    v12 = (void *)_trackedProcesses;
    v13 = objc_opt_new();
    v14 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
    [v12 setObject:v13 forKey:v14];
  }
  if (a3 > 0.0 && a6 == 8)
  {
    v15 = (void *)_trackedProcesses;
    BOOL v16 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
    v17 = [v15 objectForKeyedSubscript:v16];
    v18 = [v17 objectForKey:@"displayCostAggregated"];

    v19 = (void *)_trackedProcesses;
    v20 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
    v21 = [v19 objectForKeyedSubscript:v20];
    if (v18)
    {
      BOOL v22 = (void *)MEMORY[0x1E4F28ED0];
      v23 = (void *)_trackedProcesses;
      v24 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
      v25 = [v23 objectForKeyedSubscript:v24];
      double v26 = [v25 objectForKeyedSubscript:@"displayCostAggregated"];
      [v26 doubleValue];
      v28 = [v22 numberWithDouble:v27 + a3];
      [v21 setObject:v28 forKey:@"displayCostAggregated"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
      [v21 setObject:v24 forKey:@"displayCostAggregated"];
    }

    double v29 = (void *)_trackedProcesses;
    v30 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
    id v31 = [v29 objectForKeyedSubscript:v30];
    [v31 setObject:v32 forKey:@"lastDisplayOverheadStart"];
  }
  objc_sync_exit(@"___Sync___");
}

- (id)getCostUptoTime:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [(PLDTCostElement *)self costReturnedTillDate];
  [v4 timeIntervalSinceDate:v6];
  double v8 = v7;

  [v5 setObject:&unk_1F400D1B0 forKeyedSubscript:@"cost"];
  [v5 setObject:&unk_1F400D1B0 forKeyedSubscript:@"overhead"];
  if (v8 >= 0.0)
  {
    objc_sync_enter(@"___Sync___");
    if (v8 > 0.0)
    {
      [(PLDTCostElement *)self costAggregated];
      if (v9 > 0.0)
      {
        [(PLDTCostElement *)self costAggregated];
        objc_super v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", fmin(v10 / v8 * 0.0009765625 * 0.0009765625 * 500.0 + 500.0, 1000.0));
        [v5 setObject:v11 forKeyedSubscript:@"cost"];
      }
    }
    v12 = [(PLDTCostElement *)self lastOverheadStart];
    [v4 timeIntervalSinceDate:v12];
    double v14 = v13;

    if (v14 < 5.0) {
      [v5 setObject:&unk_1F400D1C8 forKeyedSubscript:@"overhead"];
    }
    [(PLDTCostElement *)self setCostAggregated:0.0];
    objc_sync_exit(@"___Sync___");
  }
  [(PLDTCostElement *)self setCostReturnedTillDate:v4];

  return v5;
}

- (id)getNetworkingCostUptoTime:(id)a3 withPid:(int)a4 withLastActiveStart:(id)a5 withLastSuspendStart:(id)a6 withAppState:(int)a7 withQueryCount:(int)a8
{
  uint64_t v11 = *(void *)&a4;
  id v12 = a3;
  id v44 = a5;
  id v42 = a6;
  double v13 = objc_opt_new();
  double v14 = (void *)_trackedProcesses;
  v15 = [MEMORY[0x1E4F28ED0] numberWithInt:v11];
  BOOL v16 = [v14 objectForKeyedSubscript:v15];
  v17 = [v16 objectForKeyedSubscript:@"networkingCostReturnedTillDate"];
  [v12 timeIntervalSinceDate:v17];
  double v19 = v18;

  objc_sync_enter(@"___Sync___");
  [v13 setObject:&unk_1F400D1B0 forKeyedSubscript:@"cost"];
  [v13 setObject:&unk_1F400D1B0 forKeyedSubscript:@"overhead"];
  v20 = (void *)_trackedProcesses;
  v21 = [MEMORY[0x1E4F28ED0] numberWithInt:v11];
  BOOL v22 = [v20 objectForKeyedSubscript:v21];
  v23 = [v22 objectForKeyedSubscript:@"lastNetworkingOverheadStartCount"];

  v24 = (void *)_trackedProcesses;
  v25 = [MEMORY[0x1E4F28ED0] numberWithInt:v11];
  double v26 = [v24 objectForKeyedSubscript:v25];
  double v27 = [v26 objectForKeyedSubscript:@"networkingCostAggregated"];

  if (v19 > 0.0)
  {
    objc_msgSend(v27, "doubleValue", v42, v44);
    if (v28 > 0.0)
    {
      [v27 doubleValue];
      v30 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", fmin(v29 / v19 * 0.0009765625 * 0.0009765625 * 500.0 + 500.0, 1000.0));
      [v13 setObject:v30 forKeyedSubscript:@"cost"];
    }
  }
  if ((int)(a8 - objc_msgSend(v23, "intValue", v42)) <= 11)
  {
    if (v23)
    {
      id v31 = [MEMORY[0x1E4F1CA98] null];

      if (v23 != v31) {
        [v13 setObject:&unk_1F400D1C8 forKeyedSubscript:@"overhead"];
      }
    }
  }
  id v32 = (void *)_trackedProcesses;
  v33 = [MEMORY[0x1E4F28ED0] numberWithInt:v11];
  id v34 = [v32 objectForKeyedSubscript:v33];
  [v34 setObject:&unk_1F400D1B0 forKeyedSubscript:@"networkingCostAggregated"];

  double v35 = (void *)_trackedProcesses;
  v36 = [MEMORY[0x1E4F28ED0] numberWithInt:v11];
  v37 = [v35 objectForKeyedSubscript:v36];
  [v37 setObject:0 forKeyedSubscript:@"lastNetworkingOverheadStartCount"];

  objc_sync_exit(@"___Sync___");
  v38 = (void *)_trackedProcesses;
  v39 = [MEMORY[0x1E4F28ED0] numberWithInt:v11];
  v40 = [v38 objectForKeyedSubscript:v39];
  [v40 setObject:v12 forKeyedSubscript:@"networkingCostReturnedTillDate"];

  return v13;
}

- (id)getLocationCostUptoTime:(id)a3 withPid:(int)a4 withLastActiveStart:(id)a5 withLastSuspendStart:(id)a6 withAppState:(int)a7
{
  uint64_t v9 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  double v13 = objc_opt_new();
  objc_sync_enter(@"___Sync___");
  double v14 = (void *)_trackedProcesses;
  v15 = [MEMORY[0x1E4F28ED0] numberWithInt:v9];
  BOOL v16 = [v14 objectForKeyedSubscript:v15];
  v17 = [v16 objectForKeyedSubscript:@"locationCostAggregated"];
  [v13 setObject:v17 forKeyedSubscript:@"cost"];

  [v13 setObject:&unk_1F400D1B0 forKeyedSubscript:@"overhead"];
  double v18 = (void *)_trackedProcesses;
  double v19 = [MEMORY[0x1E4F28ED0] numberWithInt:v9];
  v20 = [v18 objectForKeyedSubscript:v19];
  [v20 setObject:&unk_1F400D1B0 forKeyedSubscript:@"locationCostAggregated"];

  objc_sync_exit(@"___Sync___");
  return v13;
}

- (id)getCpuCostUptoTime:(id)a3 withPid:(int)a4 withLastActiveStart:(id)a5 withLastSuspendStart:(id)a6 withAppState:(int)a7
{
  uint64_t v10 = *(void *)&a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  double v14 = objc_opt_new();
  objc_sync_enter(@"___Sync___");
  [v14 setObject:&unk_1F400D1B0 forKeyedSubscript:@"cost"];
  [v14 setObject:&unk_1F400D1B0 forKeyedSubscript:@"overhead"];
  if (a7 == 8 || a7 == 4)
  {
    v15 = (void *)_trackedProcesses;
    BOOL v16 = [MEMORY[0x1E4F28ED0] numberWithInt:v10];
    v17 = [v15 objectForKeyedSubscript:v16];
    double v18 = [v17 objectForKeyedSubscript:@"cpuCostAggregated"];
    [v14 setObject:v18 forKeyedSubscript:@"cost"];
  }
  double v19 = (void *)_trackedProcesses;
  v20 = [MEMORY[0x1E4F28ED0] numberWithInt:v10];
  v21 = [v19 objectForKeyedSubscript:v20];
  [v21 setObject:&unk_1F400D1B0 forKeyedSubscript:@"cpuCostAggregated"];

  objc_sync_exit(@"___Sync___");
  return v14;
}

- (id)getGpuCostUptoTime:(id)a3 withPid:(int)a4 withLastActiveStart:(id)a5 withLastSuspendStart:(id)a6 withAppState:(int)a7
{
  uint64_t v10 = *(void *)&a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  double v14 = objc_opt_new();
  objc_sync_enter(@"___Sync___");
  [v14 setObject:&unk_1F400D1B0 forKeyedSubscript:@"cost"];
  [v14 setObject:&unk_1F400D1B0 forKeyedSubscript:@"overhead"];
  if (a7 == 8)
  {
    v15 = (void *)_trackedProcesses;
    BOOL v16 = [MEMORY[0x1E4F28ED0] numberWithInt:v10];
    v17 = [v15 objectForKeyedSubscript:v16];
    double v18 = [v17 objectForKeyedSubscript:@"gpuCostAggregated"];
    [v14 setObject:v18 forKeyedSubscript:@"cost"];
  }
  double v19 = (void *)_trackedProcesses;
  v20 = [MEMORY[0x1E4F28ED0] numberWithInt:v10];
  v21 = [v19 objectForKeyedSubscript:v20];
  [v21 setObject:&unk_1F400D1B0 forKeyedSubscript:@"gpuCostAggregated"];

  objc_sync_exit(@"___Sync___");
  return v14;
}

- (id)getApplicationCostUptoTime:(id)a3 withPid:(int)a4 withLastActiveStart:(id)a5 withLastSuspendStart:(id)a6 withAppState:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_opt_new();
  objc_sync_enter(@"___Sync___");
  double v14 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
  [v13 setObject:v14 forKeyedSubscript:@"cost"];

  [v13 setObject:&unk_1F400D1B0 forKeyedSubscript:@"overhead"];
  if (v7 == 4) {
    [v13 setObject:&unk_1F400D1E0 forKeyedSubscript:@"cost"];
  }
  objc_sync_exit(@"___Sync___");

  return v13;
}

- (id)getDisplayCostUptoTime:(id)a3 withPid:(int)a4 withLastActiveStart:(id)a5 withLastSuspendStart:(id)a6 withAppState:(int)a7
{
  uint64_t v10 = *(void *)&a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  double v14 = objc_opt_new();
  objc_sync_enter(@"___Sync___");
  [v14 setObject:&unk_1F400D1B0 forKeyedSubscript:@"cost"];
  [v14 setObject:&unk_1F400D1B0 forKeyedSubscript:@"overhead"];
  if (a7 == 8)
  {
    v15 = (void *)_trackedProcesses;
    BOOL v16 = [MEMORY[0x1E4F28ED0] numberWithInt:v10];
    v17 = [v15 objectForKeyedSubscript:v16];
    double v18 = [v17 objectForKeyedSubscript:@"displayCostAggregated"];
    [v14 setObject:v18 forKeyedSubscript:@"cost"];
  }
  double v19 = (void *)_trackedProcesses;
  v20 = [MEMORY[0x1E4F28ED0] numberWithInt:v10];
  v21 = [v19 objectForKeyedSubscript:v20];
  [v21 setObject:&unk_1F400D1B0 forKeyedSubscript:@"displayCostAggregated"];

  objc_sync_exit(@"___Sync___");
  return v14;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)costReturnedTillDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCostReturnedTillDate:(id)a3
{
}

- (double)costAggregated
{
  return self->_costAggregated;
}

- (void)setCostAggregated:(double)a3
{
  self->_costAggregated = a3;
}

- (NSDate)lastOverheadStart
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastOverheadStart:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastOverheadStart, 0);
  objc_storeStrong((id *)&self->_costReturnedTillDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end