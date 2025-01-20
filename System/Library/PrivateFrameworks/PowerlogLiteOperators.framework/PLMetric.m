@interface PLMetric
+ (unint64_t)binBatteryTemperature:(int)a3;
+ (unint64_t)binDurationValue:(int)a3;
- (NSDate)lastOnTimestamp;
- (NSString)metricKey;
- (PLMetric)initWithKey:(id)a3 withPosition:(unint64_t)a4 withNumBits:(int)a5 withDefault:(int)a6 andType:(signed __int16)a7;
- (int)defaultValue;
- (int)metricValue;
- (int)numBits;
- (signed)metricType;
- (unint64_t)bitPosition;
- (unint64_t)getBinnedMetricValue;
- (void)constructMetricValueForInterval:(id)a3;
- (void)resetMetric;
- (void)setBitPosition:(unint64_t)a3;
- (void)setDefaultValue:(int)a3;
- (void)setLastOnTimestamp:(id)a3;
- (void)setMetricKey:(id)a3;
- (void)setMetricType:(signed __int16)a3;
- (void)setMetricValue:(int)a3;
- (void)setNumBits:(int)a3;
- (void)updateMetricWithTimestamp:(id)a3 forEvent:(signed __int16)a4 withValue:(int)a5;
@end

@implementation PLMetric

- (void)updateMetricWithTimestamp:(id)a3 forEvent:(signed __int16)a4 withValue:(int)a5
{
  int v6 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  int v10 = [(PLMetric *)self metricType];
  switch(v10)
  {
    case 2:
      if (v6 == 2) {
        goto LABEL_26;
      }
      goto LABEL_15;
    case 1:
      if (!v6) {
        goto LABEL_29;
      }
      if (v6 == 2)
      {
        if (self->_lastOnTimestamp) {
          goto LABEL_30;
        }
        goto LABEL_26;
      }
      if (v6 != 1) {
        goto LABEL_30;
      }
      objc_storeStrong((id *)&self->_lastOnTimestamp, a3);
LABEL_15:
      self->_metricValue = a5;
      goto LABEL_30;
    case 0:
      if (v6)
      {
        if (v6 != 2)
        {
          if (v6 == 1)
          {
            lastOnTimestamp = self->_lastOnTimestamp;
            p_lastOnTimestamp = &self->_lastOnTimestamp;
            if (!lastOnTimestamp) {
              objc_storeStrong((id *)p_lastOnTimestamp, a3);
            }
          }
          goto LABEL_30;
        }
        if (self->_lastOnTimestamp) {
          objc_storeStrong((id *)&self->_lastOnTimestamp, a3);
        }
LABEL_26:
        self->_metricValue = self->_defaultValue;
        goto LABEL_30;
      }
      if (!self->_lastOnTimestamp) {
        goto LABEL_30;
      }
      objc_msgSend(v9, "timeIntervalSinceDate:");
      self->_metricValue = (int)(v20 + (double)self->_metricValue);
LABEL_29:
      v21 = self->_lastOnTimestamp;
      self->_lastOnTimestamp = 0;

      goto LABEL_30;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v13 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __57__PLMetric_updateMetricWithTimestamp_forEvent_withValue___block_invoke;
    v25 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v26 = v13;
    if (qword_1EBD58BD8 != -1) {
      dispatch_once(&qword_1EBD58BD8, &block);
    }
    if (_MergedGlobals_1_39)
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Error: Unrecognized metric type %d!", self->_metricType, block, v23, v24, v25, v26);
      v15 = (void *)MEMORY[0x1E4F929B8];
      v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m"];
      v17 = [v16 lastPathComponent];
      v18 = [NSString stringWithUTF8String:"-[PLMetric updateMetricWithTimestamp:forEvent:withValue:]"];
      [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:205];

      v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v14;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
LABEL_30:
}

- (signed)metricType
{
  return self->_metricType;
}

- (PLMetric)initWithKey:(id)a3 withPosition:(unint64_t)a4 withNumBits:(int)a5 withDefault:(int)a6 andType:(signed __int16)a7
{
  id v13 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PLMetric;
  v14 = [(PLMetric *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_metricKey, a3);
    v15->_metricType = a7;
    lastOnTimestamp = v15->_lastOnTimestamp;
    v15->_lastOnTimestamp = 0;

    v15->_bitPosition = a4;
    v15->_metricValue = a6;
    v15->_numBits = a5;
    v15->_defaultValue = a6;
  }

  return v15;
}

- (void)resetMetric
{
  lastOnTimestamp = self->_lastOnTimestamp;
  self->_lastOnTimestamp = 0;

  self->_metricValue = self->_defaultValue;
}

uint64_t __57__PLMetric_updateMetricWithTimestamp_forEvent_withValue___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_39 = result;
  return result;
}

- (void)constructMetricValueForInterval:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_metricType && self->_lastOnTimestamp)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:");
    if ((int)v6 < 0)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v7 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __44__PLMetric_constructMetricValueForInterval___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v7;
        if (qword_1EBD58BE0 != -1) {
          dispatch_once(&qword_1EBD58BE0, block);
        }
        if (byte_1EBD58BC9)
        {
          v8 = [NSString stringWithFormat:@"Error: Event starting at %@ does not belong to interval %@", self->_lastOnTimestamp, v5];
          id v9 = (void *)MEMORY[0x1E4F929B8];
          int v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m"];
          v11 = [v10 lastPathComponent];
          v12 = [NSString stringWithUTF8String:"-[PLMetric constructMetricValueForInterval:]"];
          [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:216];

          id v13 = PLLogCommon();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v16 = v8;
            _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
    }
    else
    {
      self->_metricValue += (int)v6;
    }
  }
}

uint64_t __44__PLMetric_constructMetricValueForInterval___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58BC9 = result;
  return result;
}

- (unint64_t)getBinnedMetricValue
{
  double v3 = ldexp(1.0, self->_numBits);
  if (self->_metricType)
  {
    unint64_t v4 = (unint64_t)(v3 + -1.0);
    if ([(NSString *)self->_metricKey isEqualToString:@"ChargerCurrent"])
    {
      int metricValue = self->_metricValue;
      if (metricValue)
      {
        if (metricValue <= 2999)
        {
          uint64_t v6 = 1374389535 * metricValue;
          unint64_t v7 = (unint64_t)v6 >> 63;
          uint64_t v8 = v6 >> 37;
          return (int)v8 + (int)v7 + 1;
        }
        return v4;
      }
      return 0;
    }
    if ([(NSString *)self->_metricKey isEqualToString:@"ChargerVoltage"])
    {
      int v11 = self->_metricValue;
      if (v11)
      {
        if (v11 <= 19999)
        {
          uint64_t v12 = 274877907 * v11;
          unint64_t v7 = (unint64_t)v12 >> 63;
          uint64_t v8 = v12 >> 38;
          return (int)v8 + (int)v7 + 1;
        }
        return v4;
      }
      return 0;
    }
    if ([(NSString *)self->_metricKey isEqualToString:@"BatteryTemperature"])
    {
      uint64_t v13 = self->_metricValue;
      return +[PLMetric binBatteryTemperature:v13];
    }
    else if (self->_metricValue >= v4)
    {
      return v4;
    }
    else
    {
      return self->_metricValue;
    }
  }
  else
  {
    uint64_t v9 = self->_metricValue;
    return +[PLMetric binDurationValue:](PLMetric, "binDurationValue:", v9, v3);
  }
}

+ (unint64_t)binBatteryTemperature:(int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3 == 1000) {
    return 15;
  }
  if (a3 < -10) {
    return 0;
  }
  if (a3 < 0) {
    return 1;
  }
  if (a3 < 0xA) {
    return 2;
  }
  if (a3 < 0xF) {
    return 3;
  }
  if (a3 < 0x14) {
    return 4;
  }
  if (a3 < 0x19) {
    return 5;
  }
  if (a3 < 0x1E) {
    return 6;
  }
  if (a3 < 0x23) {
    return 7;
  }
  if (a3 < 0x28) {
    return 8;
  }
  if (a3 < 0x2D) {
    return 9;
  }
  if (a3 < 0x32) {
    return 10;
  }
  if (a3 < 0x3C) {
    return 11;
  }
  if (a3 >= 0x46)
  {
    uint64_t v4 = *(void *)&a3;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __34__PLMetric_binBatteryTemperature___block_invoke;
      v15 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v16 = v5;
      if (qword_1EBD58BE8 != -1) {
        dispatch_once(&qword_1EBD58BE8, &block);
      }
      if (byte_1EBD58BCA)
      {
        uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid temperature value : %d", v4, block, v13, v14, v15, v16);
        unint64_t v7 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m"];
        uint64_t v9 = [v8 lastPathComponent];
        int v10 = [NSString stringWithUTF8String:"+[PLMetric binBatteryTemperature:]"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:267];

        int v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          objc_super v18 = v6;
          _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    return 15;
  }
  return 12;
}

uint64_t __34__PLMetric_binBatteryTemperature___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58BCA = result;
  return result;
}

+ (unint64_t)binDurationValue:(int)a3
{
  unint64_t v3 = 1;
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  uint64_t v7 = 5;
  uint64_t v8 = 6;
  if (a3 >= 0x384) {
    uint64_t v8 = 7;
  }
  if (a3 >= 0x258) {
    uint64_t v7 = v8;
  }
  if (a3 >= 0x12C) {
    uint64_t v6 = v7;
  }
  if (a3 >= 0x78) {
    uint64_t v5 = v6;
  }
  if (a3 >= 0x3C) {
    uint64_t v4 = v5;
  }
  if (a3 >= 10) {
    unint64_t v3 = v4;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

- (NSString)metricKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMetricKey:(id)a3
{
}

- (void)setMetricType:(signed __int16)a3
{
  self->_metricType = a3;
}

- (NSDate)lastOnTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastOnTimestamp:(id)a3
{
}

- (int)metricValue
{
  return self->_metricValue;
}

- (void)setMetricValue:(int)a3
{
  self->_int metricValue = a3;
}

- (unint64_t)bitPosition
{
  return self->_bitPosition;
}

- (void)setBitPosition:(unint64_t)a3
{
  self->_bitPosition = a3;
}

- (int)numBits
{
  return self->_numBits;
}

- (void)setNumBits:(int)a3
{
  self->_numBits = a3;
}

- (int)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(int)a3
{
  self->_defaultValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastOnTimestamp, 0);
  objc_storeStrong((id *)&self->_metricKey, 0);
}

@end