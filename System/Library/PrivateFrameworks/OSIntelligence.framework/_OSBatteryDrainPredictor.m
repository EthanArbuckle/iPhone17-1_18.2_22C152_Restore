@interface _OSBatteryDrainPredictor
+ (id)behaviorDescription:(int64_t)a3;
+ (id)predictor;
- (OS_os_log)log;
- (_OSBatteryDrainPredictor)init;
- (id)drainPerDayFromDate:(id)a3 forNumberOfDays:(int)a4;
- (int64_t)historicalClassification;
- (void)logCompletion:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation _OSBatteryDrainPredictor

- (void)logCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  log = self->_log;
  BOOL v7 = os_log_type_enabled(log, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      -[_OSBatteryDrainPredictor logCompletion:](log, v4);
    }
  }
  else if (v7)
  {
    -[_OSBatteryDrainPredictor logCompletion:](log);
  }
}

- (void).cxx_destruct
{
}

- (id)drainPerDayFromDate:(id)a3 forNumberOfDays:(int)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  v28 = self;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    -[_OSBatteryDrainPredictor drainPerDayFromDate:forNumberOfDays:](log);
  }
  v24 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = [v24 components:28 fromDate:v23];
  v26 = [v24 dateFromComponents:v6];

  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (a4 >= 1)
  {
    int v8 = 0;
    *(void *)&long long v7 = 138412546;
    long long v22 = v7;
    do
    {
      v9 = objc_msgSend(v26, "dateByAddingTimeInterval:", (double)v8 * 86400.0, v22);
      v10 = [v9 dateByAddingTimeInterval:86399.0];
      v11 = v28->_log;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v22;
        *(void *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        _os_log_debug_impl(&dword_1CA50C000, v11, OS_LOG_TYPE_DEBUG, "Processing events from %@ to %@", buf, 0x16u);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v32 = __Block_byref_object_copy__2;
      v33 = __Block_byref_object_dispose__2;
      v34 = objc_alloc_init(_dayDrainInfo);
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:v9 endDate:v10 maxEvents:0 lastN:0 reversed:0];
      v13 = BiomeLibrary();
      v14 = [v13 Device];
      v15 = [v14 Power];
      v16 = [v15 BatteryLevel];
      v17 = [v16 publisherWithOptions:v12];
      v18 = [v17 filterWithIsIncluded:&__block_literal_global_1];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __64___OSBatteryDrainPredictor_drainPerDayFromDate_forNumberOfDays___block_invoke_2;
      v30[3] = &unk_1E65AAEC8;
      v30[4] = v28;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __64___OSBatteryDrainPredictor_drainPerDayFromDate_forNumberOfDays___block_invoke_3;
      v29[3] = &unk_1E65AAEF0;
      v29[4] = buf;
      id v19 = (id)[v18 sinkWithCompletion:v30 receiveInput:v29];

      v20 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "drainSoFar"));
      [v25 setObject:v20 forKeyedSubscript:v9];

      _Block_object_dispose(buf, 8);
      ++v8;
    }
    while (a4 != v8);
  }

  return v25;
}

- (int64_t)historicalClassification
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v5 = [v3 components:28 fromDate:v4];
  v6 = [v3 dateFromComponents:v5];

  long long v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v6 sinceDate:-604800.0];
  int v8 = [(_OSBatteryDrainPredictor *)self drainPerDayFromDate:v7 forNumberOfDays:7];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v8;
    _os_log_impl(&dword_1CA50C000, log, OS_LOG_TYPE_DEFAULT, "Drain per day: %@", buf, 0xCu);
  }
  v10 = [v8 allValues];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    int v13 = 0;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v10);
        }
        if ((int)[*(id *)(*((void *)&v21 + 1) + 8 * i) intValue] > 90) {
          ++v13;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
  else
  {
    int v13 = 0;
  }
  v16 = self->_log;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = v13;
    _os_log_impl(&dword_1CA50C000, v16, OS_LOG_TYPE_DEFAULT, "Number of days that cross the threshold %d", buf, 8u);
  }
  uint64_t v17 = 2;
  uint64_t v18 = 3;
  if (v13 >= 8) {
    uint64_t v18 = 0;
  }
  if (v13 >= 5) {
    uint64_t v17 = v18;
  }
  if (v13 >= 2) {
    int64_t v19 = v17;
  }
  else {
    int64_t v19 = 1;
  }

  return v19;
}

+ (id)predictor
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (_OSBatteryDrainPredictor)init
{
  v6.receiver = self;
  v6.super_class = (Class)_OSBatteryDrainPredictor;
  id v2 = [(_OSBatteryDrainPredictor *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.osintelligence", "batteryDrainPrediction");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;
  }
  return v2;
}

+ (id)behaviorDescription:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_1E65AAF10[a3 - 1];
  }
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void)logCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CA50C000, log, OS_LOG_TYPE_DEBUG, "Completed processing stream \n", v1, 2u);
}

- (void)logCompletion:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  os_log_t v3 = a1;
  id v4 = [a2 error];
  id v5 = [v4 description];
  int v6 = 136315138;
  uint64_t v7 = [v5 UTF8String];
  _os_log_debug_impl(&dword_1CA50C000, v3, OS_LOG_TYPE_DEBUG, "Error: %s\n", (uint8_t *)&v6, 0xCu);
}

- (void)drainPerDayFromDate:(os_log_t)log forNumberOfDays:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CA50C000, log, OS_LOG_TYPE_DEBUG, "\n\nOperators\n", v1, 2u);
}

@end