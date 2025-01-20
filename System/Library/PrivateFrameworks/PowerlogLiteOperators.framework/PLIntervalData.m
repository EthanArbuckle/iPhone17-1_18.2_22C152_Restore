@interface PLIntervalData
- (NSDate)currentInterval;
- (NSDateFormatter)dateFormat;
- (NSMutableDictionary)metrics;
- (PLIntervalData)init;
- (int)intervalDuration;
- (unint64_t)aggdValue;
- (void)addMetric:(id)a3;
- (void)resetMetrics;
- (void)setAggdValue:(unint64_t)a3;
- (void)setCurrentInterval:(id)a3;
- (void)setDateFormat:(id)a3;
- (void)setIntervalDuration:(int)a3;
- (void)setMetrics:(id)a3;
- (void)submitIntervalData;
- (void)submitToCA:(id)a3;
- (void)updateMetric:(id)a3 withTimestamp:(id)a4 forEvent:(signed __int16)a5 withValue:(int)a6;
@end

@implementation PLIntervalData

- (void)updateMetric:(id)a3 withTimestamp:(id)a4 forEvent:(signed __int16)a5 withValue:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(PLIntervalData *)self metrics];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(PLIntervalData *)self metrics];
    v15 = [v14 objectForKeyedSubscript:v10];

    if (v15)
    {
      v16 = [(PLIntervalData *)self metrics];
      v17 = [v16 objectForKeyedSubscript:v10];

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v18 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __64__PLIntervalData_updateMetric_withTimestamp_forEvent_withValue___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v18;
        if (qword_1EBD58BF0 != -1) {
          dispatch_once(&qword_1EBD58BF0, block);
        }
        if (byte_1EBD58BCB)
        {
          v19 = NSString;
          v20 = [v17 metricKey];
          v21 = [v19 stringWithFormat:@"Updating Metric : %@ Time : %@ Event : %d Value : %d", v20, v11, (int)v7, v6];

          v22 = (void *)MEMORY[0x1E4F929B8];
          v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m"];
          v24 = [v23 lastPathComponent];
          v25 = [NSString stringWithUTF8String:"-[PLIntervalData updateMetric:withTimestamp:forEvent:withValue:]"];
          [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:326];

          v26 = PLLogCommon();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v21;
            _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      [v17 updateMetricWithTimestamp:v11 forEvent:v7 withValue:v6];
    }
  }
}

- (NSMutableDictionary)metrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)currentInterval
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (PLIntervalData)init
{
  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    v3 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PLIntervalData;
    v4 = [(PLIntervalData *)&v11 init];
    if (v4)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      metrics = v4->_metrics;
      v4->_metrics = v5;

      v4->_aggdValue = 0;
      uint64_t v7 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
      dateFormat = v4->_dateFormat;
      v4->_dateFormat = v7;

      [(NSDateFormatter *)v4->_dateFormat setDateFormat:@"HHmm"];
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
      [(NSDateFormatter *)v4->_dateFormat setLocale:v9];
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)addMetric:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    v5 = [v4 metricKey];

    id v4 = v8;
    if (v5)
    {
      metrics = self->_metrics;
      uint64_t v7 = [v8 metricKey];
      [(NSMutableDictionary *)metrics setObject:v8 forKey:v7];

      id v4 = v8;
    }
  }
}

uint64_t __64__PLIntervalData_updateMetric_withTimestamp_forEvent_withValue___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58BCB = result;
  return result;
}

- (void)resetMetrics
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(PLIntervalData *)self metrics];

  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [(PLIntervalData *)self metrics];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
          id v10 = [(PLIntervalData *)self metrics];
          objc_super v11 = [v10 objectForKeyedSubscript:v9];

          [v11 resetMetric];
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

- (void)submitIntervalData
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v3 = [(PLIntervalData *)self metrics];

  if (v3)
  {
    id v4 = objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v5 = [(PLIntervalData *)self metrics];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          objc_super v11 = [(PLIntervalData *)self metrics];
          long long v12 = [v11 objectForKeyedSubscript:v10];

          [v12 constructMetricValueForInterval:self->_currentInterval];
          long long v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "metricValue"));
          long long v14 = [v12 metricKey];
          [v4 setObject:v13 forKeyedSubscript:v14];

          uint64_t v15 = [v12 getBinnedMetricValue];
          char v16 = [v12 bitPosition];
          currentInterval = self->_currentInterval;
          self->_aggdValue |= v15 << v16;
          [v12 updateMetricWithTimestamp:currentInterval forEvent:2 withValue:0];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v7);
    }

    uint64_t v18 = [(NSDateFormatter *)self->_dateFormat stringFromDate:self->_currentInterval];
    v19 = [NSString stringWithFormat:@"%@%@", @"com.apple.power.usagebitmap.interval", v18];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v20 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__PLIntervalData_submitIntervalData__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v20;
      if (qword_1EBD58BF8 != -1) {
        dispatch_once(&qword_1EBD58BF8, block);
      }
      if (byte_1EBD58BCC)
      {
        v21 = [NSString stringWithFormat:@"%@ : %llu", v19, self->_aggdValue];
        v22 = (void *)MEMORY[0x1E4F929B8];
        v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m"];
        v24 = [v23 lastPathComponent];
        v25 = [NSString stringWithUTF8String:"-[PLIntervalData submitIntervalData]"];
        [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:360];

        v26 = PLLogCommon();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v21;
          _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    ADClientSetValueForScalarKey();
    v27 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v18, "intValue"));
    [v4 setObject:v27 forKeyedSubscript:@"TimeInterval"];

    [(PLIntervalData *)self submitToCA:v4];
    v28 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:self->_currentInterval sinceDate:(double)self->_intervalDuration];
    v29 = self->_currentInterval;
    self->_currentInterval = v28;

    self->_aggdValue = 0;
  }
}

uint64_t __36__PLIntervalData_submitIntervalData__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58BCC = result;
  return result;
}

- (void)submitToCA:(id)a3
{
  id v5 = a3;
  AnalyticsSendEventLazy();
  id v4 = v5;
  AnalyticsSendEventLazy();
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __29__PLIntervalData_submitToCA___block_invoke(uint64_t a1)
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"TimeInterval";
  v2 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v9[0] = v2;
  v8[1] = @"ScreenOnDuration";
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v9[1] = v3;
  v8[2] = @"WakeDuration";
  id v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v9[2] = v4;
  v8[3] = @"AudioOnDuration";
  id v5 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v9[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

id __29__PLIntervalData_submitToCA___block_invoke_2(uint64_t a1)
{
  v13[8] = *MEMORY[0x1E4F143B8];
  v12[0] = @"TimeInterval";
  v2 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v13[0] = v2;
  v12[1] = @"BatteryLevel";
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v13[1] = v3;
  v12[2] = @"ConnectedState";
  id v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v13[2] = v4;
  v12[3] = @"ChargingState";
  id v5 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v13[3] = v5;
  v12[4] = @"AdapterType";
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v13[4] = v6;
  v12[5] = @"BatteryTemperature";
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v13[5] = v7;
  v12[6] = @"ChargerCurrent";
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v13[6] = v8;
  v12[7] = @"ChargerVoltage";
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v13[7] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:8];

  return v10;
}

id __29__PLIntervalData_submitToCA___block_invoke_3(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"TimeInterval";
  v2 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v8[0] = v2;
  v7[1] = @"PowerlogInit";
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v8[1] = v3;
  v7[2] = @"LockState";
  id v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v8[2] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (void)setMetrics:(id)a3
{
}

- (void)setCurrentInterval:(id)a3
{
}

- (unint64_t)aggdValue
{
  return self->_aggdValue;
}

- (void)setAggdValue:(unint64_t)a3
{
  self->_aggdValue = a3;
}

- (NSDateFormatter)dateFormat
{
  return (NSDateFormatter *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDateFormat:(id)a3
{
}

- (int)intervalDuration
{
  return self->_intervalDuration;
}

- (void)setIntervalDuration:(int)a3
{
  self->_intervalDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormat, 0);
  objc_storeStrong((id *)&self->_currentInterval, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end