@interface PLSMCMetricsAgent
+ (BOOL)supportsSMC;
+ (void)load;
- ($9CEE2F78D9152958F56DF80F82CC2BF0)smcConnection;
- (BOOL)anyVirtualTemperatureAboveThreshold;
- (BOOL)isThermalMitigationAboveThreshold;
- (BOOL)isThermalPressureFanNoiseAboveThreshold;
- (NSSet)availableKeys;
- (NSSet)loggedKeys;
- (PLEntryNotificationOperatorComposition)sbc;
- (PLSMCMetricsAgent)init;
- (PLTimer)monitorTimer;
- (double)monitorCadence;
- (id)getAllKeys;
- (id)getAllowedKeys;
- (id)getTVKeys;
- (id)handleNonNumericKeys:(unsigned int)a3 keyInfo:(id *)a4;
- (id)handleNumericKeys:(unsigned int)a3 keyInfo:(id *)a4 keyName:(id)a5 ret:(char)a6;
- (id)readSMCKey:(id)a3;
- (unsigned)loggingCounter;
- (unsigned)loggingThreshold;
- (void)dealloc;
- (void)initOperatorDependancies;
- (void)logEventPointInstantKeys;
- (void)logThermalKeysToCoreAnalytics;
- (void)setAvailableKeys:(id)a3;
- (void)setLoggedKeys:(id)a3;
- (void)setLoggingCounter:(unsigned int)a3;
- (void)setLoggingThreshold:(unsigned int)a3;
- (void)setMonitorCadence:(double)a3;
- (void)setMonitorTimer:(id)a3;
- (void)setSbc:(id)a3;
- (void)setSmcConnection:(id *)a3;
- (void)thermalMonitorCallback;
@end

@implementation PLSMCMetricsAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSMCMetricsAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLSMCMetricsAgent)init
{
  if (+[PLSMCMetricsAgent supportsSMC]
    && [MEMORY[0x1E4F929C0] longForKey:@"SMCMonitorCadence" ifNotSet:0])
  {
    v13.receiver = self;
    v13.super_class = (Class)PLSMCMetricsAgent;
    v3 = [(PLAgent *)&v13 init];
    v4 = v3;
    if (v3)
    {
      monitorTimer = v3->_monitorTimer;
      v3->_monitorTimer = 0;

      v4->_loggingCounter = 0;
      uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
      loggedKeys = v4->_loggedKeys;
      v4->_loggedKeys = (NSSet *)v6;

      uint64_t v8 = [MEMORY[0x1E4F1CAD0] set];
      availableKeys = v4->_availableKeys;
      v4->_availableKeys = (NSSet *)v8;
    }
    self = v4;
    v10 = self;
  }
  else
  {
    v11 = PLLogSMCMetrics();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D2690000, v11, OS_LOG_TYPE_ERROR, "SMC Metrics: SMC telemetry disabled", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (void)initOperatorDependancies
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  self->_smcConnection = ($9CEE2F78D9152958F56DF80F82CC2BF0 *)SMCOpenConnectionWithDefaultService();
  v3 = PLLogSMCMetrics();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v20 = [(PLSMCMetricsAgent *)self getAllowedKeys];
    int v21 = [v20 count];
    v22 = [(PLSMCMetricsAgent *)self getAllowedKeys];
    *(_DWORD *)buf = 67109378;
    int v30 = v21;
    __int16 v31 = 2112;
    v32 = v22;
    _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "SMC Metrics: List of allowed SMC Keys (count %d): %@", buf, 0x12u);
  }
  v4 = [(PLSMCMetricsAgent *)self getAllKeys];
  availableKeys = self->_availableKeys;
  self->_availableKeys = v4;

  uint64_t v6 = PLLogSMCMetrics();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v23 = [(NSSet *)self->_availableKeys count];
    v24 = self->_availableKeys;
    *(_DWORD *)buf = 67109378;
    int v30 = v23;
    __int16 v31 = 2112;
    v32 = v24;
    _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "SMC Metrics: List of all SMC Keys (count %d): %@", buf, 0x12u);
  }

  v7 = [(PLSMCMetricsAgent *)self getAllowedKeys];
  [v7 intersectSet:self->_availableKeys];

  uint64_t v8 = [(PLSMCMetricsAgent *)self getAllowedKeys];
  loggedKeys = self->_loggedKeys;
  self->_loggedKeys = v8;

  v10 = PLLogSMCMetrics();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v25 = [(NSSet *)self->_loggedKeys count];
    v26 = self->_loggedKeys;
    *(_DWORD *)buf = 67109378;
    int v30 = v25;
    __int16 v31 = 2112;
    v32 = v26;
    _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "SMC Metrics: List of metrics to be logged (count %d): %@", buf, 0x12u);
  }

  uint64_t v11 = [MEMORY[0x1E4F929C0] longForKey:@"SMCMonitorCadence" ifNotSet:0];
  self->_double monitorCadence = (double)v11;
  if (v11)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __45__PLSMCMetricsAgent_initOperatorDependancies__block_invoke;
    v28[3] = &unk_1E692A0F0;
    v28[4] = self;
    v12 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withBlock:v28];
    sbc = self->_sbc;
    self->_sbc = v12;

    id v14 = objc_alloc(MEMORY[0x1E4F92A80]);
    v15 = [MEMORY[0x1E4F1C9C8] date];
    double monitorCadence = self->_monitorCadence;
    v17 = [(PLOperator *)self workQueue];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __45__PLSMCMetricsAgent_initOperatorDependancies__block_invoke_2;
    v27[3] = &unk_1E692A200;
    v27[4] = self;
    v18 = (void *)[v14 initWithFireDate:v15 withInterval:1 withTolerance:0 repeats:v17 withUserInfo:v27 withQueue:monitorCadence withBlock:0.0];
    [(PLSMCMetricsAgent *)self setMonitorTimer:v18];
  }
  else
  {
    v19 = PLLogSMCMetrics();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "SMC Metrics: SMC monitor disabled", buf, 2u);
    }
  }
}

uint64_t __45__PLSMCMetricsAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) log];
}

uint64_t __45__PLSMCMetricsAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) thermalMonitorCallback];
}

- (void)logThermalKeysToCoreAnalytics
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_loggedKeys;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [(PLSMCMetricsAgent *)self readSMCKey:v9];
        if (v10) {
          [v3 setObject:v10 forKey:v9];
        }
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  uint64_t v11 = PLLogSMCMetrics();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "SMC Metrics: Log instant Keys to CA: %@", buf, 0xCu);
  }

  objc_super v13 = v3;
  id v12 = v3;
  AnalyticsSendEventLazy();
}

id __50__PLSMCMetricsAgent_logThermalKeysToCoreAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logEventPointInstantKeys
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v14 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = self->_loggedKeys;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [(PLSMCMetricsAgent *)self readSMCKey:v9];
        uint64_t v11 = (void *)v10;
        if (v10)
        {
          v21[0] = @"Key";
          v21[1] = @"Value";
          v22[0] = v9;
          v22[1] = v10;
          id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
          [v3 addObject:v12];
        }
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v6);
  }

  [v14 setObject:v3 forKeyedSubscript:@"__PPSKVPairs__"];
  objc_super v13 = PLLogSMCMetrics();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v14;
    _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "SMC Metrics: logging SMC Payload: %@", buf, 0xCu);
  }

  [(PLOperator *)self logForSubsystem:@"SMC" category:@"InstantKeys" data:v14];
}

- (void)thermalMonitorCallback
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(PLSMCMetricsAgent *)self setLoggingCounter:[(PLSMCMetricsAgent *)self loggingCounter] + 1];
  v3 = PLLogSMCMetrics();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    [(PLSMCMetricsAgent *)self monitorCadence];
    v5[0] = 67109632;
    v5[1] = v4;
    __int16 v6 = 1024;
    unsigned int v7 = [(PLSMCMetricsAgent *)self loggingThreshold];
    __int16 v8 = 1024;
    unsigned int v9 = [(PLSMCMetricsAgent *)self loggingCounter];
    _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "SMC Metrics:Monitoring timer callback (interval %ds, threshold %d, count %d)", (uint8_t *)v5, 0x14u);
  }

  if (+[PLSMCMetricsAgent supportsSMC]
    && [(PLSMCMetricsAgent *)self anyVirtualTemperatureAboveThreshold])
  {
    [(PLSMCMetricsAgent *)self logEventPointInstantKeys];
  }
  if ([(PLSMCMetricsAgent *)self loggingCounter] >= 0x1E)
  {
    [(PLSMCMetricsAgent *)self logThermalKeysToCoreAnalytics];
    [(PLSMCMetricsAgent *)self setLoggingCounter:0];
  }
}

- (void)dealloc
{
  if ([(PLSMCMetricsAgent *)self smcConnection])
  {
    [(PLSMCMetricsAgent *)self smcConnection];
    SMCCloseConnection();
  }
  v3.receiver = self;
  v3.super_class = (Class)PLSMCMetricsAgent;
  [(PLAgent *)&v3 dealloc];
}

- (id)handleNumericKeys:(unsigned int)a3 keyInfo:(id *)a4 keyName:(id)a5 ret:(char)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  [(PLSMCMetricsAgent *)self smcConnection];
  unsigned int v9 = SMCReadKeyAsNumericWithKnownKeyInfo();
  if (v9)
  {
    unsigned int v10 = v9;
    uint64_t v11 = PLLogSMCMetrics();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_3:

LABEL_4:
      id v12 = 0;
      goto LABEL_10;
    }
    *(_DWORD *)buf = 67109120;
    unsigned int v31 = v10;
    v19 = "SMC Metrics:SMCReadKeyAsNumeric error: %d";
LABEL_20:
    _os_log_error_impl(&dword_1D2690000, v11, OS_LOG_TYPE_ERROR, v19, buf, 8u);
    goto LABEL_3;
  }
  int var0 = a4->var2.var0.var0;
  if (var0)
  {
    if (var0 == 2 || var0 == 1)
    {
      HIDWORD(v14) = 0;
      *(float *)&double v14 = 0.0;
      uint64_t v15 = [NSNumber numberWithFloat:v14];
      goto LABEL_9;
    }
    v20 = PLLogSMCMetrics();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
LABEL_18:

      goto LABEL_4;
    }
    int v24 = a4->var2.var0.var0;
    *(_DWORD *)buf = 67109120;
    unsigned int v31 = v24;
    int v25 = "SMC Metrics: Unknown numeric SMC type: %d";
    v26 = v20;
    uint32_t v27 = 8;
LABEL_31:
    _os_log_error_impl(&dword_1D2690000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
    goto LABEL_18;
  }
  if (!a4->var2.var0.var1)
  {
    int var1 = a4->var1;
    if ((var1 & 0x80) != 0)
    {
      switch(a4->var3)
      {
        case 1u:
          int v23 = NSNumber;
          break;
        case 2u:
          int v23 = NSNumber;
          break;
        case 4u:
          int v23 = NSNumber;
          break;
        case 8u:
          int v23 = NSNumber;
          break;
        default:
          v20 = PLLogSMCMetrics();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            goto LABEL_18;
          }
          unsigned int var3 = a4->var3;
          *(_DWORD *)buf = 67109378;
          unsigned int v31 = var3;
          __int16 v32 = 2112;
          id v33 = v8;
          int v25 = "SMC Metrics: Unsupported key size %d for SMC key %@.";
          goto LABEL_42;
      }
      uint64_t v15 = [v23 numberWithUnsignedLong:0];
      goto LABEL_9;
    }
    if ((var1 & 4) == 0) {
      goto LABEL_4;
    }
    unsigned int v22 = a4->var3;
    switch(v22)
    {
      case 8u:
        uint64_t v15 = [NSNumber numberWithUnsignedLongLong:bswap64(0)];
        goto LABEL_9;
      case 4u:
        uint64_t v15 = [NSNumber numberWithUnsignedInt:bswap32(0)];
        goto LABEL_9;
      case 2u:
        uint64_t v15 = [NSNumber numberWithUnsignedShort:bswap32(0) >> 16];
        goto LABEL_9;
    }
    v20 = PLLogSMCMetrics();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    unsigned int v29 = a4->var3;
    *(_DWORD *)buf = 67109378;
    unsigned int v31 = v29;
    __int16 v32 = 2112;
    id v33 = v8;
    int v25 = "SMC Metrics:Unsupported key size %d for SMC key %@.";
LABEL_42:
    v26 = v20;
    uint32_t v27 = 18;
    goto LABEL_31;
  }
  [(PLSMCMetricsAgent *)self smcConnection];
  unsigned int v17 = SMCReadKey();
  if (v17)
  {
    unsigned int v18 = v17;
    uint64_t v11 = PLLogSMCMetrics();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    *(_DWORD *)buf = 67109120;
    unsigned int v31 = v18;
    v19 = "SMC Metrics: SMCReadKey error: %d";
    goto LABEL_20;
  }
  uint64_t v15 = [NSNumber numberWithInt:0];
LABEL_9:
  id v12 = (void *)v15;
LABEL_10:

  return v12;
}

- (id)handleNonNumericKeys:(unsigned int)a3 keyInfo:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_var2 = &a4->var2;
  if (!strcmp((const char *)&a4->var2, "ioft"))
  {
    *(void *)buf = 0;
    [(PLSMCMetricsAgent *)self smcConnection];
    int v7 = SMCReadKey();
    if (v7)
    {
      int v8 = v7;
      unsigned int v9 = PLLogSMCMetrics();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

LABEL_12:
        __int16 v6 = 0;
        goto LABEL_13;
      }
      v16[0] = 67109120;
      v16[1] = v8;
      unsigned int v10 = "SMC Metrics: SMCReadKey error: %d";
      uint64_t v11 = (uint8_t *)v16;
LABEL_19:
      _os_log_error_impl(&dword_1D2690000, v9, OS_LOG_TYPE_ERROR, v10, v11, 8u);
      goto LABEL_11;
    }
    double v15 = (double)*(uint64_t *)buf * 0.0000152587891;
    *(float *)&double v15 = v15;
    __int16 v6 = [NSNumber numberWithFloat:v15];
  }
  else
  {
    if (strcmp((const char *)p_var2, "flag"))
    {
      if (!strcmp((const char *)p_var2, "hex_"))
      {
        *(void *)buf = 0;
        [(PLSMCMetricsAgent *)self smcConnection];
        if (!SMCReadKey())
        {
          __int16 v6 = [NSNumber numberWithUnsignedLongLong:*(void *)buf];
          goto LABEL_13;
        }
      }
      goto LABEL_12;
    }
    v16[0] = 0;
    [(PLSMCMetricsAgent *)self smcConnection];
    int v12 = SMCReadKey();
    if (v12)
    {
      int v13 = v12;
      unsigned int v9 = PLLogSMCMetrics();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v13;
      unsigned int v10 = "SMC Metrics:SMCReadKey error: %d";
      uint64_t v11 = buf;
      goto LABEL_19;
    }
    __int16 v6 = [NSNumber numberWithUnsignedInt:v16[0]];
  }
LABEL_13:
  return v6;
}

- (id)readSMCKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    int v13 = PLLogSMCMetrics();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      int v12 = 0;
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    double v14 = "SMC Metrics: invalid key name";
    double v15 = v13;
    uint32_t v16 = 2;
LABEL_18:
    _os_log_error_impl(&dword_1D2690000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
    goto LABEL_10;
  }
  id v6 = v4;
  [v6 UTF8String];
  uint64_t v7 = SMCMakeUInt32Key();
  if (!v7)
  {
    int v13 = PLLogSMCMetrics();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = 0;
    double v14 = "SMC Metrics: SMCMakeUInt32Key error: %d";
    double v15 = v13;
    uint32_t v16 = 8;
    goto LABEL_18;
  }
  uint64_t v8 = v7;
  memset(buf, 0, sizeof(buf));
  uint64_t v20 = 0;
  [(PLSMCMetricsAgent *)self smcConnection];
  int v9 = SMCGetKeyInfo();
  if (v9)
  {
    int v10 = v9;
    uint64_t v11 = PLLogSMCMetrics();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v18 = 67109120;
      *(_DWORD *)&v18[4] = v10;
      _os_log_error_impl(&dword_1D2690000, v11, OS_LOG_TYPE_ERROR, "SMC Metrics:SMCGetKeyInfo error: %d", v18, 8u);
    }
    int v12 = 0;
  }
  else
  {
    *(_OWORD *)uint64_t v18 = *(_OWORD *)buf;
    *(void *)&v18[16] = v20;
    int v12 = [(PLSMCMetricsAgent *)self handleNumericKeys:v8 keyInfo:v18 keyName:v6 ret:0];
    uint64_t v11 = PLLogSMCMetrics();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t v18 = 138412546;
      *(void *)&v18[4] = v6;
      *(_WORD *)&v18[12] = 2112;
      *(void *)&v18[14] = v12;
      _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "SMC Metrics: read keys %@: %@", v18, 0x16u);
    }
  }

LABEL_14:
  return v12;
}

- (id)getAllKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PLSMCMetricsAgent_getAllKeys__block_invoke;
  block[3] = &unk_1E692A250;
  block[4] = self;
  if (qword_1EBD577B0 != -1) {
    dispatch_once(&qword_1EBD577B0, block);
  }
  return (id)qword_1EBD577A8;
}

void __31__PLSMCMetricsAgent_getAllKeys__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  objc_super v3 = (void *)qword_1EBD577A8;
  qword_1EBD577A8 = v2;

  int v4 = 0;
  do
  {
    int v9 = 0;
    [*(id *)(a1 + 32) smcConnection];
    int v5 = SMCGetKeyFromIndex();
    if (!v5)
    {
      SMCUInt32ToString();
      id v6 = (void *)qword_1EBD577A8;
      uint64_t v7 = [NSString stringWithUTF8String:v8];
      [v6 addObject:v7];
    }
    ++v4;
  }
  while (v5 != -4);
}

- (id)getAllowedKeys
{
  if (qword_1EBD577C0 != -1) {
    dispatch_once(&qword_1EBD577C0, &__block_literal_global_51);
  }
  uint64_t v2 = (void *)qword_1EBD577B8;
  return v2;
}

void __35__PLSMCMetricsAgent_getAllowedKeys__block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  v1 = (void *)qword_1EBD577B8;
  qword_1EBD577B8 = v0;

  uint64_t v2 = [MEMORY[0x1E4F92A88] getAllowblocklist];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = objc_msgSend(v2, "objectForKeyedSubscript:", @"PLSMCAgent_EventPoint_ThermalInstantKeys", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if (*(void *)(*((void *)&v8 + 1) + 8 * v7)) {
          objc_msgSend((id)qword_1EBD577B8, "addObject:");
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)getTVKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__PLSMCMetricsAgent_getTVKeys__block_invoke;
  block[3] = &unk_1E692A250;
  block[4] = self;
  if (qword_1EBD577D0 != -1) {
    dispatch_once(&qword_1EBD577D0, block);
  }
  return (id)qword_1EBD577C8;
}

void __30__PLSMCMetricsAgent_getTVKeys__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  objc_super v3 = (void *)qword_1EBD577C8;
  qword_1EBD577C8 = v2;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 88);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasPrefix:", @"TV", (void)v10)) {
          [(id)qword_1EBD577C8 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BOOL)isThermalPressureFanNoiseAboveThreshold
{
  objc_super v3 = [(PLSMCMetricsAgent *)self readSMCKey:@"mTPL"];
  id v4 = [(PLSMCMetricsAgent *)self readSMCKey:@"fdBA"];
  BOOL v5 = v3 && [v3 integerValue] > 0 || v4 && objc_msgSend(v4, "integerValue") > 22;

  return v5;
}

- (BOOL)isThermalMitigationAboveThreshold
{
  uint64_t v2 = [(PLSMCMetricsAgent *)self readSMCKey:@"mxTM"];
  objc_super v3 = v2;
  BOOL v4 = v2 && [v2 integerValue] > 7;

  return v4;
}

- (BOOL)anyVirtualTemperatureAboveThreshold
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v3 = [(PLSMCMetricsAgent *)self getTVKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v8 isEqualToString:@"TVD0"] & 1) == 0)
        {
          long long v9 = [(PLSMCMetricsAgent *)self readSMCKey:v8];
          long long v10 = v9;
          if (v9)
          {
            [v9 floatValue];
            if (v11 > 35.0)
            {

              BOOL v12 = 1;
              goto LABEL_14;
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_14:

  return v12;
}

+ (BOOL)supportsSMC
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isVirtualDevice])
  {
    uint64_t v2 = PLLogSMCMetrics();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v5[0]) = 0;
      _os_log_error_impl(&dword_1D2690000, v2, OS_LOG_TYPE_ERROR, "not supported on virtual device", (uint8_t *)v5, 2u);
    }

    return 0;
  }
  else
  {
    if (qword_1EBD577D8 != -1) {
      dispatch_once(&qword_1EBD577D8, &__block_literal_global_73);
    }
    uint64_t v4 = PLLogSMCMetrics();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5[0] = 67109120;
      v5[1] = _MergedGlobals_1_0;
      _os_log_impl(&dword_1D2690000, v4, OS_LOG_TYPE_INFO, "SMC Metrics: ret value is %d", (uint8_t *)v5, 8u);
    }

    return _MergedGlobals_1_0 != 0;
  }
}

uint64_t __32__PLSMCMetricsAgent_supportsSMC__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] kPLSoCClassOfDevice];
  _MergedGlobals_1_0 = (int)result > 1001014;
  return result;
}

- ($9CEE2F78D9152958F56DF80F82CC2BF0)smcConnection
{
  return self->_smcConnection;
}

- (void)setSmcConnection:(id *)a3
{
  self->_smcConnection = a3;
}

- (double)monitorCadence
{
  return self->_monitorCadence;
}

- (void)setMonitorCadence:(double)a3
{
  self->_double monitorCadence = a3;
}

- (unsigned)loggingThreshold
{
  return self->_loggingThreshold;
}

- (void)setLoggingThreshold:(unsigned int)a3
{
  self->_loggingThreshold = a3;
}

- (unsigned)loggingCounter
{
  return self->_loggingCounter;
}

- (void)setLoggingCounter:(unsigned int)a3
{
  self->_loggingCounter = a3;
}

- (PLTimer)monitorTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMonitorTimer:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)sbc
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSbc:(id)a3
{
}

- (NSSet)loggedKeys
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLoggedKeys:(id)a3
{
}

- (NSSet)availableKeys
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAvailableKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableKeys, 0);
  objc_storeStrong((id *)&self->_loggedKeys, 0);
  objc_storeStrong((id *)&self->_sbc, 0);
  objc_storeStrong((id *)&self->_monitorTimer, 0);
}

@end