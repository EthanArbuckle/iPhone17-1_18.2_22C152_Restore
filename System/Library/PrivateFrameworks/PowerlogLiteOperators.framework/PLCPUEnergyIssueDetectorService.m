@interface PLCPUEnergyIssueDetectorService
+ (id)defaults;
+ (id)entryAggregateDefinitionAppRunTime;
+ (id)entryAggregateDefinitions;
+ (void)load;
- (BOOL)deviceIsPluggedIn;
- (BOOL)pluggedInBetweenCoalitionSBC;
- (NSArray)cpuAllowList;
- (NSDate)detectionStartTime;
- (NSDictionary)cpuThresholds;
- (NSMutableDictionary)cpuUsage;
- (NSString)entryKeyPLCoalitionAgentEventIntervalCoalition;
- (PLCPUEnergyIssueDetectorService)init;
- (PLEntryNotificationOperatorComposition)batteryCallback;
- (PLEntryNotificationOperatorComposition)coalitionCallback;
- (PLXPCListenerOperatorComposition)detectorListener;
- (double)getCPUTime:(id)a3;
- (id)buildCallBack:(id)a3 withGroup:(BOOL)a4 withHandler:(id)a5;
- (id)loadCPUAllowlist;
- (id)loadCpuThresholds;
- (int)customLongTermCPUThreshold;
- (int)matchingPidWithProcessName:(id)a3 withBundleID:(id)a4;
- (void)checkCpuUsage:(id)a3 withNewCoaltionArray:(id)a4;
- (void)handleBatteryCallback:(id)a3;
- (void)handleCoalitionCallback:(id)a3;
- (void)initOperatorDependancies;
- (void)listAllRunningPidsWithBuffer:(int *)a3 withSizeOfBuffer:(int)a4;
- (void)sendEnergyIssueSignatureNotification:(id)a3 withThreshold:(double)a4;
- (void)setBatteryCallback:(id)a3;
- (void)setCoalitionCallback:(id)a3;
- (void)setCpuAllowList:(id)a3;
- (void)setCpuThresholds:(id)a3;
- (void)setCpuUsage:(id)a3;
- (void)setDetectionStartTime:(id)a3;
- (void)setDetectorListener:(id)a3;
- (void)setDeviceIsPluggedIn:(BOOL)a3;
- (void)setPluggedInBetweenCoalitionSBC:(BOOL)a3;
@end

@implementation PLCPUEnergyIssueDetectorService

+ (id)defaults
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLCPUEnergyIssueDetectorService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitionAppRunTime
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLCPUEnergyIssueDetectorService)init
{
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) != 0
    || ([MEMORY[0x1E4F92A88] isPowerlogHelperd] & 1) != 0
    || ([MEMORY[0x1E4F92A38] seedBuild] & 1) == 0
    && ![MEMORY[0x1E4F92A38] internalBuild])
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLCPUEnergyIssueDetectorService;
    self = [(PLOperator *)&v5 init];
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  if (([MEMORY[0x1E4F92A88] isPowerlogHelperd] & 1) == 0
    && (([MEMORY[0x1E4F92A38] seedBuild] & 1) != 0
     || [MEMORY[0x1E4F92A38] internalBuild]))
  {
    id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__PLCPUEnergyIssueDetectorService_initOperatorDependancies__block_invoke;
    v19[3] = &unk_1E692A6F8;
    v19[4] = self;
    v4 = (void *)[v3 initWithOperator:self withRegistration:&unk_1F29EA788 withBlock:v19];
    [(PLCPUEnergyIssueDetectorService *)self setDetectorListener:v4];

    self->_pluggedInBetweenCoalitionSBC = 0;
    self->_deviceIsPluggedIn = 0;
    objc_super v5 = (NSMutableDictionary *)objc_opt_new();
    cpuUsage = self->_cpuUsage;
    self->_cpuUsage = v5;

    v7 = [(PLCPUEnergyIssueDetectorService *)self loadCpuThresholds];
    cpuThresholds = self->_cpuThresholds;
    self->_cpuThresholds = v7;

    v9 = [(PLCPUEnergyIssueDetectorService *)self loadCPUAllowlist];
    cpuAllowList = self->_cpuAllowList;
    self->_cpuAllowList = v9;

    v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"CoalitionInterval"];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__PLCPUEnergyIssueDetectorService_initOperatorDependancies__block_invoke_2;
    v18[3] = &unk_1E692A808;
    v18[4] = self;
    v12 = [(PLCPUEnergyIssueDetectorService *)self buildCallBack:v11 withGroup:1 withHandler:v18];
    [(PLCPUEnergyIssueDetectorService *)self setCoalitionCallback:v12];

    entryKeyPLCoalitionAgentEventIntervalCoalition = self->_entryKeyPLCoalitionAgentEventIntervalCoalition;
    self->_entryKeyPLCoalitionAgentEventIntervalCoalition = v11;
    v14 = v11;

    v15 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"Battery"];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__PLCPUEnergyIssueDetectorService_initOperatorDependancies__block_invoke_3;
    v17[3] = &unk_1E692A808;
    v17[4] = self;
    v16 = [(PLCPUEnergyIssueDetectorService *)self buildCallBack:v15 withGroup:0 withHandler:v17];
    [(PLCPUEnergyIssueDetectorService *)self setBatteryCallback:v16];
  }
}

uint64_t __59__PLCPUEnergyIssueDetectorService_initOperatorDependancies__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendEnergyIssueSignatureNotification:@"testApp" withThreshold:50.0];
}

uint64_t __59__PLCPUEnergyIssueDetectorService_initOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleCoalitionCallback:a2];
}

uint64_t __59__PLCPUEnergyIssueDetectorService_initOperatorDependancies__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleBatteryCallback:a2];
}

- (id)buildCallBack:(id)a3 withGroup:(BOOL)a4 withHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    id v10 = [NSString stringWithFormat:@"GroupID_%@", v8];
  }
  else
  {
    id v10 = v8;
  }
  v11 = v10;
  id v12 = objc_alloc(MEMORY[0x1E4F929E8]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__PLCPUEnergyIssueDetectorService_buildCallBack_withGroup_withHandler___block_invoke;
  v16[3] = &unk_1E692A858;
  id v17 = v9;
  id v13 = v9;
  v14 = (void *)[v12 initWithOperator:self forEntryKey:v11 withBlock:v16];

  return v14;
}

uint64_t __71__PLCPUEnergyIssueDetectorService_buildCallBack_withGroup_withHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)handleCoalitionCallback:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v9 = [v4 monotonicDate];
  BOOL v6 = [v5 objectForKey:@"group"];

  v7 = [(PLCPUEnergyIssueDetectorService *)self entryKeyPLCoalitionAgentEventIntervalCoalition];
  id v8 = [v6 objectForKeyedSubscript:v7];

  [(PLCPUEnergyIssueDetectorService *)self checkCpuUsage:v9 withNewCoaltionArray:v8];
}

- (void)handleBatteryCallback:(id)a3
{
  id v20 = a3;
  v4 = [v20 objectForKeyedSubscript:@"entry"];
  id v5 = [v4 objectForKeyedSubscript:@"ExternalConnected"];
  uint64_t v6 = [v5 BOOLValue];

  v7 = [v20 objectForKeyedSubscript:@"entry"];
  id v8 = [v7 objectForKeyedSubscript:@"CurrentCapacity"];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [v20 objectForKeyedSubscript:@"entry"];
  id v12 = [v11 objectForKeyedSubscript:@"MaxCapacity"];
  [v12 doubleValue];
  double v14 = v13;

  double v15 = 0.0;
  if (v14 > 0.0) {
    double v15 = v10 * 100.0 / v14;
  }
  int v16 = [MEMORY[0x1E4F92A88] isPingPongChargingWith:v6 andBatteryLevelPercent:v15];
  id v17 = [v20 objectForKeyedSubscript:@"entry"];
  v18 = [v17 objectForKeyedSubscript:@"IsCharging"];
  uint64_t v19 = [v18 BOOLValue] | v16;

  [(PLCPUEnergyIssueDetectorService *)self setDeviceIsPluggedIn:v19];
  if ([(PLCPUEnergyIssueDetectorService *)self deviceIsPluggedIn]) {
    [(PLCPUEnergyIssueDetectorService *)self setPluggedInBetweenCoalitionSBC:1];
  }
}

- (double)getCPUTime:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"cpu_time"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)checkCpuUsage:(id)a3 withNewCoaltionArray:(id)a4
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (self->_detectionStartTime)
  {
    objc_msgSend(v7, "timeIntervalSinceDate:");
    if (v9 > 3600.0) {
      [(NSMutableDictionary *)self->_cpuUsage removeAllObjects];
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_detectionStartTime, a3);
  }
  unint64_t v10 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = 3221225472;
    v99[2] = __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke;
    v99[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v99[4] = v11;
    if (qword_1EBD59E60 != -1) {
      dispatch_once(&qword_1EBD59E60, v99);
    }
    if (_MergedGlobals_1_44)
    {
      id v12 = v8;
      double v13 = [NSString stringWithFormat:@"CPUEnergyIssueDetectorService: checkCpuUsage"];
      double v14 = (void *)MEMORY[0x1E4F929B8];
      double v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLCPUEnergyIssueDetectorService.m"];
      int v16 = [v15 lastPathComponent];
      id v17 = [NSString stringWithUTF8String:"-[PLCPUEnergyIssueDetectorService checkCpuUsage:withNewCoaltionArray:]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:223];

      v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v102 = v13;
        _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      id v8 = v12;
      unint64_t v10 = 0x1E4F92000uLL;
    }
  }
  if (![(PLCPUEnergyIssueDetectorService *)self pluggedInBetweenCoalitionSBC]
    && [v8 count])
  {
    id v86 = v8;
    id v87 = v7;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id obj = v8;
    uint64_t v19 = [obj countByEnumeratingWithState:&v95 objects:v100 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v90 = *(void *)v96;
      do
      {
        uint64_t v21 = 0;
        uint64_t v88 = v20;
        do
        {
          if (*(void *)v96 != v90) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v95 + 1) + 8 * v21);
          if ([*(id *)(v10 + 2496) debugEnabled])
          {
            uint64_t v23 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke_68;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v23;
            if (qword_1EBD59E68 != -1) {
              dispatch_once(&qword_1EBD59E68, block);
            }
            if (byte_1EBD59E59)
            {
              v24 = NSString;
              v25 = [v22 objectForKeyedSubscript:@"LaunchdName"];
              v26 = [v22 objectForKeyedSubscript:@"BundleId"];
              v27 = [v24 stringWithFormat:@"CPUEnergyIssueDetectorService: entry[LaunchdName] = %@, entry[bunldeId]=%@", v25, v26];

              v28 = (void *)MEMORY[0x1E4F929B8];
              v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLCPUEnergyIssueDetectorService.m"];
              v30 = [v29 lastPathComponent];
              v31 = [NSString stringWithUTF8String:"-[PLCPUEnergyIssueDetectorService checkCpuUsage:withNewCoaltionArray:]"];
              [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:229];

              v32 = PLLogCommon();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v102 = v27;
                _os_log_debug_impl(&dword_1D2690000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              unint64_t v10 = 0x1E4F92000uLL;
            }
          }
          v33 = [MEMORY[0x1E4F92A88] getIdentifierFromEntry:v22];
          if ([*(id *)(v10 + 2496) debugEnabled])
          {
            uint64_t v34 = objc_opt_class();
            v93[0] = MEMORY[0x1E4F143A8];
            v93[1] = 3221225472;
            v93[2] = __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke_80;
            v93[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v93[4] = v34;
            if (qword_1EBD59E70 != -1) {
              dispatch_once(&qword_1EBD59E70, v93);
            }
            if (byte_1EBD59E5A)
            {
              v35 = NSString;
              v36 = [(NSDictionary *)self->_cpuThresholds objectForKeyedSubscript:v33];
              [v36 doubleValue];
              v38 = [v35 stringWithFormat:@"CPUEnergyIssueDetectorService: bundleId=%@, _cpuThreshold[bundleID]=%f", v33, v37];

              v39 = (void *)MEMORY[0x1E4F929B8];
              v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLCPUEnergyIssueDetectorService.m"];
              v41 = [v40 lastPathComponent];
              v42 = [NSString stringWithUTF8String:"-[PLCPUEnergyIssueDetectorService checkCpuUsage:withNewCoaltionArray:]"];
              [v39 logMessage:v38 fromFile:v41 fromFunction:v42 fromLineNumber:234];

              v43 = PLLogCommon();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v102 = v38;
                _os_log_debug_impl(&dword_1D2690000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              unint64_t v10 = 0x1E4F92000uLL;
            }
          }
          if (v33)
          {
            v44 = [v22 objectForKeyedSubscript:@"BundleId"];
            uint64_t v45 = [v44 length];

            if (!v45 && ![(NSArray *)self->_cpuAllowList containsObject:v33])
            {
              if ([*(id *)(v10 + 2496) debugEnabled])
              {
                uint64_t v46 = objc_opt_class();
                v92[0] = MEMORY[0x1E4F143A8];
                v92[1] = 3221225472;
                v92[2] = __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke_86;
                v92[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v92[4] = v46;
                if (qword_1EBD59E78 != -1) {
                  dispatch_once(&qword_1EBD59E78, v92);
                }
                if (byte_1EBD59E5B)
                {
                  v47 = NSString;
                  v48 = [(NSMutableDictionary *)self->_cpuUsage objectForKeyedSubscript:v33];
                  [v48 doubleValue];
                  uint64_t v50 = v49;
                  v51 = [(NSDictionary *)self->_cpuThresholds objectForKeyedSubscript:v33];
                  [v51 doubleValue];
                  v53 = [v47 stringWithFormat:@"CPUEnergyIssueDetectorService: bundleID=%@, cpuUsage=%f, threshold=%f", v33, v50, v52];

                  v54 = (void *)MEMORY[0x1E4F929B8];
                  v55 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLCPUEnergyIssueDetectorService.m"];
                  v56 = [v55 lastPathComponent];
                  v57 = [NSString stringWithUTF8String:"-[PLCPUEnergyIssueDetectorService checkCpuUsage:withNewCoaltionArray:]"];
                  [v54 logMessage:v53 fromFile:v56 fromFunction:v57 fromLineNumber:255];

                  v58 = PLLogCommon();
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v102 = v53;
                    _os_log_debug_impl(&dword_1D2690000, v58, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  unint64_t v10 = 0x1E4F92000;
                  uint64_t v20 = v88;
                }
              }
              v59 = [(NSMutableDictionary *)self->_cpuUsage objectForKey:v33];

              v60 = NSNumber;
              if (v59)
              {
                v61 = [(NSMutableDictionary *)self->_cpuUsage objectForKeyedSubscript:v33];
                [v61 doubleValue];
                double v63 = v62;
                [(PLCPUEnergyIssueDetectorService *)self getCPUTime:v22];
                v65 = [v60 numberWithDouble:v63 + v64];
                [(NSMutableDictionary *)self->_cpuUsage setObject:v65 forKeyedSubscript:v33];
              }
              else
              {
                [(PLCPUEnergyIssueDetectorService *)self getCPUTime:v22];
                v61 = objc_msgSend(v60, "numberWithDouble:");
                [(NSMutableDictionary *)self->_cpuUsage setObject:v61 forKeyedSubscript:v33];
              }

              v66 = [(NSDictionary *)self->_cpuThresholds objectForKey:v33];

              double v67 = 2000.0;
              if (v66)
              {
                v68 = [(NSDictionary *)self->_cpuThresholds objectForKeyedSubscript:v33];
                [v68 doubleValue];
                double v67 = v69;
              }
              if ([(PLCPUEnergyIssueDetectorService *)self customLongTermCPUThreshold] >= 1) {
                double v67 = (double)[(PLCPUEnergyIssueDetectorService *)self customLongTermCPUThreshold];
              }
              v70 = [(NSMutableDictionary *)self->_cpuUsage objectForKeyedSubscript:v33];
              [v70 doubleValue];
              double v72 = v71;

              if (v72 > v67)
              {
                if ([*(id *)(v10 + 2496) debugEnabled])
                {
                  uint64_t v73 = objc_opt_class();
                  v91[0] = MEMORY[0x1E4F143A8];
                  v91[1] = 3221225472;
                  v91[2] = __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke_93;
                  v91[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                  v91[4] = v73;
                  if (qword_1EBD59E80 != -1) {
                    dispatch_once(&qword_1EBD59E80, v91);
                  }
                  if (byte_1EBD59E5C)
                  {
                    v74 = NSString;
                    v75 = [(NSMutableDictionary *)self->_cpuUsage objectForKeyedSubscript:v33];
                    [v75 doubleValue];
                    uint64_t v77 = v76;
                    v78 = [(NSDictionary *)self->_cpuThresholds objectForKeyedSubscript:v33];
                    [v78 doubleValue];
                    v80 = [v74 stringWithFormat:@"CPUEnergyIssueDetectorService: CPU threshold crossed: %@ CPU usage of %f crossed threshold %f", v33, v77, v79];

                    v81 = (void *)MEMORY[0x1E4F929B8];
                    v82 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLCPUEnergyIssueDetectorService.m"];
                    v83 = [v82 lastPathComponent];
                    v84 = [NSString stringWithUTF8String:"-[PLCPUEnergyIssueDetectorService checkCpuUsage:withNewCoaltionArray:]"];
                    [v81 logMessage:v80 fromFile:v83 fromFunction:v84 fromLineNumber:275];

                    v85 = PLLogCommon();
                    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v102 = v80;
                      _os_log_debug_impl(&dword_1D2690000, v85, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }

                    unint64_t v10 = 0x1E4F92000;
                  }
                }
                [(PLCPUEnergyIssueDetectorService *)self sendEnergyIssueSignatureNotification:v33 withThreshold:v67];
                [(NSMutableDictionary *)self->_cpuUsage setObject:&unk_1F29E67D8 forKeyedSubscript:v33];
              }
            }
          }

          ++v21;
        }
        while (v20 != v21);
        uint64_t v20 = [obj countByEnumeratingWithState:&v95 objects:v100 count:16];
      }
      while (v20);
    }

    id v8 = v86;
    id v7 = v87;
  }
  [(PLCPUEnergyIssueDetectorService *)self setPluggedInBetweenCoalitionSBC:[(PLCPUEnergyIssueDetectorService *)self deviceIsPluggedIn]];
}

uint64_t __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_44 = result;
  return result;
}

uint64_t __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke_68(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59E59 = result;
  return result;
}

uint64_t __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke_80(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59E5A = result;
  return result;
}

uint64_t __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke_86(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59E5B = result;
  return result;
}

uint64_t __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke_93(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59E5C = result;
  return result;
}

- (void)listAllRunningPidsWithBuffer:(int *)a3 withSizeOfBuffer:(int)a4
{
  if (a4 >= 1) {
    memset(a3, 255, 4 * a4);
  }
  proc_listpids(1u, 0, a3, 4 * a4);
}

- (int)matchingPidWithProcessName:(id)a3 withBundleID:(id)a4
{
  uint64_t v4 = MEMORY[0x1F4188790](self);
  uint64_t v6 = v5;
  id v7 = (void *)v4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = v8;
  id v10 = v6;
  context = (void *)MEMORY[0x1D942A350]();
  [v7 listAllRunningPidsWithBuffer:v31 withSizeOfBuffer:1024];
  int v11 = proc_listpids(1u, 0, 0, 0);
  int v12 = 0;
  if (v11 >= 4)
  {
    unint64_t v13 = 0;
    unint64_t v14 = (unint64_t)v11 >> 2;
    double v15 = (unsigned int *)v31;
    unint64_t v16 = 0x1E4F92000uLL;
    unint64_t v26 = v14;
    while (1)
    {
      if (v9)
      {
        id v17 = [MEMORY[0x1E4F92A88] processNameForPid:*v15];
        if ([*(id *)(v16 + 2496) debugEnabled])
        {
          uint64_t v18 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __75__PLCPUEnergyIssueDetectorService_matchingPidWithProcessName_withBundleID___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v18;
          if (qword_1EBD59E88 != -1) {
            dispatch_once(&qword_1EBD59E88, block);
          }
          if (byte_1EBD59E5D)
          {
            uint64_t v19 = [NSString stringWithFormat:@"pid[%d]=%@", *v15, v17];
            uint64_t v20 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLCPUEnergyIssueDetectorService.m"];
            v22 = [v21 lastPathComponent];
            uint64_t v23 = [NSString stringWithUTF8String:"-[PLCPUEnergyIssueDetectorService matchingPidWithProcessName:withBundleID:]"];
            [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:319];

            v24 = PLLogCommon();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v30 = v19;
              _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            unint64_t v14 = v26;
            unint64_t v16 = 0x1E4F92000;
          }
        }
        if ([v17 isEqualToString:v9])
        {
LABEL_19:
          int v12 = *v15;

          break;
        }
      }
      if (v10)
      {
        id v17 = [MEMORY[0x1E4F92A88] bundleIDFromPid:*v15];
        if ([v10 isEqualToString:v17]) {
          goto LABEL_19;
        }
      }
      int v12 = 0;
      if (v13 <= 0x3FE)
      {
        ++v13;
        ++v15;
        if (v14 > v13) {
          continue;
        }
      }
      break;
    }
  }

  return v12;
}

uint64_t __75__PLCPUEnergyIssueDetectorService_matchingPidWithProcessName_withBundleID___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59E5D = result;
  return result;
}

- (void)sendEnergyIssueSignatureNotification:(id)a3 withThreshold:(double)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4FA8AF0]);
  if (v7)
  {
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&a4);
    id v9 = [v7 signatureWithDomain:@"Energy" type:@"CPU" subType:@"LongTerm" subtypeContext:&stru_1F294E108 detectedProcess:v6 triggerThresholdValues:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __86__PLCPUEnergyIssueDetectorService_sendEnergyIssueSignatureNotification_withThreshold___block_invoke;
    v10[3] = &unk_1E692A808;
    v10[4] = self;
    [v7 snapshotWithSignature:v9 duration:0 events:0 payload:0 actions:v10 reply:120.0];
  }
}

void __86__PLCPUEnergyIssueDetectorService_sendEnergyIssueSignatureNotification_withThreshold___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4FA8C70]];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    double v5 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4FA8C68]];
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_16;
    }
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__PLCPUEnergyIssueDetectorService_sendEnergyIssueSignatureNotification_withThreshold___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1EBD59E90 != -1) {
      dispatch_once(&qword_1EBD59E90, block);
    }
    if (!byte_1EBD59E5E) {
      goto LABEL_16;
    }
    id v7 = [NSString stringWithFormat:@"SDRDiagnosticReporter response = %@, sessionID = %@", v2, v5];
    id v8 = (void *)MEMORY[0x1E4F929B8];
    id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLCPUEnergyIssueDetectorService.m"];
    id v10 = [v9 lastPathComponent];
    int v11 = [NSString stringWithUTF8String:"-[PLCPUEnergyIssueDetectorService sendEnergyIssueSignatureNotification:withThreshold:]_block_invoke"];
    [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:359];

    int v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v7;
      _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

LABEL_15:
LABEL_16:

    goto LABEL_17;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v13 = objc_opt_class();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __86__PLCPUEnergyIssueDetectorService_sendEnergyIssueSignatureNotification_withThreshold___block_invoke_124;
    v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v18[4] = v13;
    if (qword_1EBD59E98 != -1) {
      dispatch_once(&qword_1EBD59E98, v18);
    }
    if (byte_1EBD59E5F)
    {
      double v5 = [NSString stringWithFormat:@"SDRDiagnosticReporter dampened"];
      unint64_t v14 = (void *)MEMORY[0x1E4F929B8];
      double v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLCPUEnergyIssueDetectorService.m"];
      unint64_t v16 = [v15 lastPathComponent];
      id v17 = [NSString stringWithUTF8String:"-[PLCPUEnergyIssueDetectorService sendEnergyIssueSignatureNotification:withThreshold:]_block_invoke_2"];
      [v14 logMessage:v5 fromFile:v16 fromFunction:v17 fromLineNumber:362];

      id v7 = PLLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v5;
        _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_15;
    }
  }
LABEL_17:
}

uint64_t __86__PLCPUEnergyIssueDetectorService_sendEnergyIssueSignatureNotification_withThreshold___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59E5E = result;
  return result;
}

uint64_t __86__PLCPUEnergyIssueDetectorService_sendEnergyIssueSignatureNotification_withThreshold___block_invoke_124(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59E5F = result;
  return result;
}

- (id)loadCPUAllowlist
{
  cpuAllowList = self->_cpuAllowList;
  if (!cpuAllowList)
  {
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"Maps_mapspushd", @"NPKCompanionAgent", @"OTACrashCopier", @"Springboard", @"askpermissiond", @"familynotification", @"fileprovider_fileproviderd", @"homed", @"mobile_lockdown", @"mobile_softwareupdated", @"mobile.softwareupdated", @"abm-helper", @"pairedsyncd", @"passd", @"pipelined", @"prdaily", @"seld",
      @"tipsd",
      @"wcd",
      @"kernel_task",
      @"ReportCrash",
      0);
    int v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    double v5 = self->_cpuAllowList;
    self->_cpuAllowList = v4;

    cpuAllowList = self->_cpuAllowList;
  }
  return cpuAllowList;
}

- (id)loadCpuThresholds
{
  cpuThresholds = self->_cpuThresholds;
  if (!cpuThresholds)
  {
    self->_cpuThresholds = (NSDictionary *)&unk_1F29EA7B0;
    cpuThresholds = self->_cpuThresholds;
  }
  return cpuThresholds;
}

- (int)customLongTermCPUThreshold
{
  if (qword_1EBD59EA0 != -1) {
    dispatch_once(&qword_1EBD59EA0, &__block_literal_global_37);
  }
  id v2 = (void *)qword_1EBD59EA8;
  if (!qword_1EBD59EA8) {
    return -1;
  }
  return [v2 intValue];
}

uint64_t __61__PLCPUEnergyIssueDetectorService_customLongTermCPUThreshold__block_invoke()
{
  [MEMORY[0x1E4F92A88] containerPath];
  qword_1EBD59EA8 = _CFPreferencesCopyValueWithContainer();
  return MEMORY[0x1F41817F8]();
}

- (PLEntryNotificationOperatorComposition)coalitionCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCoalitionCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)batteryCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBatteryCallback:(id)a3
{
}

- (NSString)entryKeyPLCoalitionAgentEventIntervalCoalition
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)deviceIsPluggedIn
{
  return self->_deviceIsPluggedIn;
}

- (void)setDeviceIsPluggedIn:(BOOL)a3
{
  self->_deviceIsPluggedIn = a3;
}

- (BOOL)pluggedInBetweenCoalitionSBC
{
  return self->_pluggedInBetweenCoalitionSBC;
}

- (void)setPluggedInBetweenCoalitionSBC:(BOOL)a3
{
  self->_pluggedInBetweenCoalitionSBC = a3;
}

- (NSMutableDictionary)cpuUsage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCpuUsage:(id)a3
{
}

- (NSArray)cpuAllowList
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCpuAllowList:(id)a3
{
}

- (NSDictionary)cpuThresholds
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCpuThresholds:(id)a3
{
}

- (NSDate)detectionStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDetectionStartTime:(id)a3
{
}

- (PLXPCListenerOperatorComposition)detectorListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDetectorListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorListener, 0);
  objc_storeStrong((id *)&self->_detectionStartTime, 0);
  objc_storeStrong((id *)&self->_cpuThresholds, 0);
  objc_storeStrong((id *)&self->_cpuAllowList, 0);
  objc_storeStrong((id *)&self->_cpuUsage, 0);
  objc_storeStrong((id *)&self->_entryKeyPLCoalitionAgentEventIntervalCoalition, 0);
  objc_storeStrong((id *)&self->_batteryCallback, 0);
  objc_storeStrong((id *)&self->_coalitionCallback, 0);
}

@end