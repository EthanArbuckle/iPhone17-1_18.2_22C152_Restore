@interface PLCoalitionAgent
+ (id)entryAggregateDefinitionNANDStats;
+ (id)entryAggregateDefinitions;
+ (id)entryEventIntervalDefinitionCoalitionUsage;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventPointDefinitionCoalitionDrop;
+ (id)entryEventPointDefinitionCoalitionMemory;
+ (id)entryEventPointDefinitionTotalFootprintSum;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (BOOL)shouldLogCoalitionObject:(id)a3 withEndObject:(id)a4;
- (NSDate)currentDate;
- (NSDate)lastDate;
- (NSDate)reportHighFrequencyMemoryStatsAfterTime;
- (NSDate)reportMemoryStatsAfterTime;
- (NSDictionary)lastCoalitionObjectDictionary;
- (NSString)driveCapacity;
- (PLCoalitionAgent)init;
- (PLEntryNotificationOperatorComposition)batteryEntryLogged;
- (PLEntryNotificationOperatorComposition)batteryLevelChanged;
- (PLNSNotificationOperatorComposition)thermalMonitorListener;
- (PLStateTrackingComposition)stateTracker;
- (PLXPCResponderOperatorComposition)logicalWritesResponder;
- (double)getANEEnergyFromEntry:(id)a3;
- (double)getCPUEnergyFromEntry:(id)a3;
- (double)getCPUVoucherTimeFromEntry:(id)a3;
- (double)getCPUWeightFromEntry:(id)a3;
- (double)getGPUEnergyFromEntry:(id)a3;
- (double)getGPUTimeFromEntry:(id)a3;
- (double)getGPUWeightFromEntry:(id)a3;
- (id)buildPLCoalitionDataObject:(coalition_resource_usage *)a3 withBundleId:(id)a4 withLaunchdName:(id)a5 withDate:(id)a6 withCoalitionId:(unint64_t)a7 isApp:(BOOL)a8;
- (id)buildPLEntryDiffWithStartObject:(id)a3 withEndObject:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6;
- (id)processMemoryUsageWithPid:(int)a3 withLaunchdName:(id)a4 withRusage:(void *)a5 withJetsamInfo:(void *)a6 withLimitInfo:(process_memory_limit_info *)a7;
- (id)processPerAppLogicalWritesWithInfo:(id)a3;
- (unint64_t)readPropertyFromRegistry:(__CFString *)a3;
- (void)addAccountingEventsFromCoalitions:(id)a3;
- (void)getCoalitionInfoWithHFLFlag:(BOOL)a3;
- (void)getStorageCapacity;
- (void)handleStateChangeForCoalitions;
- (void)initOperatorDependancies;
- (void)log;
- (void)logAggregateNANDStatsWithInfo:(id)a3;
- (void)logCoalitionObjectDifference:(id)a3;
- (void)logCoalitionObjectMemory:(id)a3 shouldLogBatteryTableCadence:(BOOL)a4;
- (void)logEventIntervalCoalitionIntervalWithoutHighFreqLogging;
- (void)logPerJetsamPriorityTotalMemory:(id)a3;
- (void)logToAggd:(id)a3;
- (void)logToCAProcessMemory:(id)a3 andAccumulatedMemory:(id)a4 dailyReport:(BOOL)a5 systemUptime:(unint64_t)a6;
- (void)setBatteryEntryLogged:(id)a3;
- (void)setBatteryLevelChanged:(id)a3;
- (void)setCurrentDate:(id)a3;
- (void)setDriveCapacity:(id)a3;
- (void)setLastCoalitionObjectDictionary:(id)a3;
- (void)setLastDate:(id)a3;
- (void)setLogicalWritesResponder:(id)a3;
- (void)setReportHighFrequencyMemoryStatsAfterTime:(id)a3;
- (void)setReportMemoryStatsAfterTime:(id)a3;
- (void)setStateTracker:(id)a3;
- (void)setThermalMonitorListener:(id)a3;
@end

@implementation PLCoalitionAgent

- (void)getCoalitionInfoWithHFLFlag:(BOOL)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v4 = objc_opt_new();
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [(PLCoalitionAgent *)self setCurrentDate:v5];

  LODWORD(v5) = proc_listcoalitions();
  uint64_t v6 = (2 * v5);
  v7 = malloc_type_malloc((int)v6, 0xCB4C88A0uLL);
  uint64_t v8 = proc_listcoalitions();
  uint64_t v9 = v8;
  if ((int)v8 > 2 * (int)v5)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F929D0]);
    v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"CoalitionDrops"];
    [(PLCoalitionAgent *)self currentDate];
    v12 = v7;
    v14 = v13 = self;
    v15 = (void *)[v10 initWithEntryKey:v11 withDate:v14];

    v16 = [NSNumber numberWithInt:v9];
    [v15 setObject:v16 forKeyedSubscript:@"finalSize"];

    v17 = [NSNumber numberWithInt:v6];
    [v15 setObject:v17 forKeyedSubscript:@"bufferSize"];

    [(PLOperator *)v13 logEntry:v15];
    [(PLCoalitionAgent *)v13 logToAggd:v15];
    if (v12) {
      free(v12);
    }

    goto LABEL_41;
  }
  v52 = v4;
  v50 = v7;
  if ((int)v8 >= 16)
  {
    uint64_t v18 = v8 >> 4;
    v48 = (char *)*MEMORY[0x1E4F14380];
    key = (char *)*MEMORY[0x1E4F14378];
    v51 = self;
    while (1)
    {
      v19 = (void *)MEMORY[0x1D942A350]();
      v20 = malloc_type_malloc(0x160uLL, 0x1000040AF73A19AuLL);
      uint64_t v21 = coalition_info_resource_usage();
      if (!v21) {
        break;
      }
      uint64_t v22 = v21;
      if (v20) {
        free(v20);
      }
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_26;
      }
      uint64_t v23 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__PLCoalitionAgent_getCoalitionInfoWithHFLFlag___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v23;
      if (qword_1EBD58CE0 != -1) {
        dispatch_once(&qword_1EBD58CE0, block);
      }
      if (!byte_1EBD58CAC) {
        goto LABEL_26;
      }
      objc_msgSend(NSString, "stringWithFormat:", @"Cannot retrieve coalition information; returnVal=%d",
        v22);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E4F929B8];
      v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLCoalitionAgent.m"];
      v27 = [v26 lastPathComponent];
      v28 = [NSString stringWithUTF8String:"-[PLCoalitionAgent getCoalitionInfoWithHFLFlag:]"];
      [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:1613];

      v29 = PLLogCommon();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v24;
        _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
LABEL_25:

LABEL_26:
      v7 += 2;
      if (!--v18) {
        goto LABEL_39;
      }
    }
    v30 = [(PLCoalitionAgent *)self lastCoalitionObjectDictionary];
    v31 = [NSNumber numberWithUnsignedLongLong:*v7];
    v32 = [v30 objectForKeyedSubscript:v31];

    v53 = v19;
    if (v32)
    {
      v29 = [v32 bundleID];
      v24 = [v32 launchdName];
      uint64_t v33 = [v32 isUIKitApp];
      v34 = v52;
LABEL_24:
      v37 = [(PLCoalitionAgent *)v51 currentDate];
      v38 = [(PLCoalitionAgent *)v51 buildPLCoalitionDataObject:v20 withBundleId:v29 withLaunchdName:v24 withDate:v37 withCoalitionId:*v7 isApp:v33];
      v39 = [NSNumber numberWithUnsignedLongLong:*v7];
      [v34 setObject:v38 forKeyedSubscript:v39];

      self = v51;
      v19 = v53;
      goto LABEL_25;
    }
    v34 = v52;
    uint64_t v35 = xpc_coalition_copy_info();
    v36 = (void *)v35;
    if (!v35 || MEMORY[0x1D942AE70](v35) != MEMORY[0x1E4F14590])
    {
      uint64_t v33 = 0;
      v29 = &stru_1F294E108;
      if (*v7 == 1) {
        v24 = @"com.apple.kernel_task";
      }
      else {
        v24 = &stru_1F294E108;
      }
      goto LABEL_23;
    }
    string = xpc_dictionary_get_string(v36, key);
    v41 = string;
    if (*v7 == 1)
    {
      uint64_t v33 = 0;
      v24 = @"com.apple.kernel_task";
      if (string)
      {
LABEL_30:
        v29 = [NSString stringWithUTF8String:v41];
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
      v47 = string;
      v42 = xpc_dictionary_get_string(v36, v48);
      if (v42)
      {
        v43 = [NSString stringWithUTF8String:v42];
      }
      else
      {
        v43 = @"Unnamed_launchdName";
      }
      uint64_t v33 = [(__CFString *)v43 hasPrefix:@"UIKitApplication:"];
      v24 = [(__CFString *)v43 stringByReplacingOccurrencesOfString:@"UIKitApplication:" withString:&stru_1F294E108];

      uint64_t v44 = [(__CFString *)v24 rangeOfString:@"["];
      if (v44 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v45 = [(__CFString *)v24 substringToIndex:v44];

        v24 = (__CFString *)v45;
      }
      v41 = v47;
      if (v47) {
        goto LABEL_30;
      }
    }
    v29 = &stru_1F294E108;
    goto LABEL_23;
  }
  if (v7) {
LABEL_39:
  }
    free(v50);
  v4 = v52;
  [(PLCoalitionAgent *)self logCoalitionObjectDifference:v52];
  [(PLCoalitionAgent *)self setLastCoalitionObjectDictionary:v52];
  v46 = [(PLCoalitionAgent *)self currentDate];
  [(PLCoalitionAgent *)self setLastDate:v46];

LABEL_41:
}

- (NSDate)currentDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (id)buildPLCoalitionDataObject:(coalition_resource_usage *)a3 withBundleId:(id)a4 withLaunchdName:(id)a5 withDate:(id)a6 withCoalitionId:(unint64_t)a7 isApp:(BOOL)a8
{
  BOOL v8 = a8;
  id v12 = a5;
  id v13 = a4;
  v14 = objc_opt_new();
  v15 = [MEMORY[0x1E4F29238] valueWithPointer:a3];
  [v14 setCoalStruct:v15];

  [v14 setBundleID:v13];
  [v14 setLaunchdName:v12];

  [v14 setCoalitionID:a7];
  [v14 setIsUIKitApp:v8];
  return v14;
}

- (void)setLastDate:(id)a3
{
}

- (void)setLastCoalitionObjectDictionary:(id)a3
{
}

- (void)setCurrentDate:(id)a3
{
}

- (void)logCoalitionObjectDifference:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLCoalitionAgent *)self lastCoalitionObjectDictionary];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    v7 = [(PLCoalitionAgent *)self lastCoalitionObjectDictionary];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v10 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__PLCoalitionAgent_logCoalitionObjectDifference___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v10;
        if (qword_1EBD58CC0 != -1) {
          dispatch_once(&qword_1EBD58CC0, block);
        }
        if (_MergedGlobals_1_40)
        {
          v11 = NSString;
          id v12 = [(PLCoalitionAgent *)self lastCoalitionObjectDictionary];
          id v13 = [v11 stringWithFormat:@"newCoalitionObjectDictionary=%@\nself.lastCoalitionObjectDictionary=%@", v4, v12];

          v14 = (void *)MEMORY[0x1E4F929B8];
          v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLCoalitionAgent.m"];
          v16 = [v15 lastPathComponent];
          v17 = [NSString stringWithUTF8String:"-[PLCoalitionAgent logCoalitionObjectDifference:]"];
          [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:1393];

          uint64_t v18 = PLLogCommon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v13;
            _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      v49 = (void *)v9;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v47 = v4;
      id v19 = v4;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v51 objects:v58 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v52;
        id v48 = v19;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v52 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v51 + 1) + 8 * i);
            v25 = [(PLCoalitionAgent *)self lastCoalitionObjectDictionary];
            v26 = [v25 objectForKeyedSubscript:v24];
            v27 = [v19 objectForKeyedSubscript:v24];
            BOOL v28 = [(PLCoalitionAgent *)self shouldLogCoalitionObject:v26 withEndObject:v27];

            if (v28)
            {
              v29 = [(PLCoalitionAgent *)self lastCoalitionObjectDictionary];
              v30 = [v29 objectForKeyedSubscript:v24];
              v31 = [v19 objectForKeyedSubscript:v24];
              v32 = [(PLCoalitionAgent *)self lastDate];
              uint64_t v33 = [(PLCoalitionAgent *)self currentDate];
              [(PLCoalitionAgent *)self buildPLEntryDiffWithStartObject:v30 withEndObject:v31 withStartDate:v32 withEndDate:v33];
              v34 = self;
              uint64_t v35 = v21;
              v37 = uint64_t v36 = v22;

              [v49 addObject:v37];
              uint64_t v22 = v36;
              uint64_t v21 = v35;
              self = v34;
              id v19 = v48;
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v51 objects:v58 count:16];
        }
        while (v21);
      }

      if ([v49 count])
      {
        v38 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"CoalitionInterval"];
        v56 = v38;
        uint64_t v57 = v49;
        v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        [(PLOperator *)self logEntries:v39 withGroupID:v38];
      }
      [(PLCoalitionAgent *)self addAccountingEventsFromCoalitions:v49];
      id v4 = v47;
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v40 = objc_opt_class();
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __49__PLCoalitionAgent_logCoalitionObjectDifference___block_invoke_763;
        v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v50[4] = v40;
        if (qword_1EBD58CC8 != -1) {
          dispatch_once(&qword_1EBD58CC8, v50);
        }
        if (byte_1EBD58CA9)
        {
          v41 = [NSString stringWithFormat:@"New way %@", v49];
          v42 = (void *)MEMORY[0x1E4F929B8];
          v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLCoalitionAgent.m"];
          uint64_t v44 = [v43 lastPathComponent];
          uint64_t v45 = [NSString stringWithUTF8String:"-[PLCoalitionAgent logCoalitionObjectDifference:]"];
          [v42 logMessage:v41 fromFile:v44 fromFunction:v45 fromLineNumber:1410];

          v46 = PLLogCommon();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v41;
            _os_log_debug_impl(&dword_1D2690000, v46, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
    }
  }
}

- (NSDictionary)lastCoalitionObjectDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)shouldLogCoalitionObject:(id)a3 withEndObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v8 = [v6 coalStruct];
  uint64_t v9 = (void *)[v8 pointerValue];

  uint64_t v10 = [v5 coalStruct];
  v11 = (void *)[v10 pointerValue];

  [MEMORY[0x1E4F92A88] secondsFromMachTime:v9[3] - v11[3]];
  if (v12 > 1.0) {
    goto LABEL_6;
  }
  [MEMORY[0x1E4F92A88] secondsFromMachTime:v9[9] - v11[9]];
  if (v13 <= 1.0
    && ([MEMORY[0x1E4F92A88] secondsFromMachTime:v9[10] - v11[10]], v14 <= 1.0)
    && ([MEMORY[0x1E4F92A88] secondsFromMachTime:v9[8] - v11[8]], v15 <= 1.0))
  {
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v9[38] - v11[38]];
    BOOL v16 = v18 > 1.0;
  }
  else
  {
LABEL_6:
    BOOL v16 = 1;
  }

  return v16;
}

- (NSDate)lastDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (id)buildPLEntryDiffWithStartObject:(id)a3 withEndObject:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc(MEMORY[0x1E4F929D0]);
  double v14 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"CoalitionInterval"];
  double v15 = (void *)[v13 initWithEntryKey:v14 withDate:v11];

  v126 = v12;
  [v15 setObject:v12 forKeyedSubscript:@"timestampEnd"];
  BOOL v16 = [v10 launchdName];
  [v15 setObject:v16 forKeyedSubscript:@"LaunchdName"];

  v17 = [v10 bundleID];
  [v15 setObject:v17 forKeyedSubscript:@"BundleId"];

  double v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v10, "coalitionID"));
  [v15 setObject:v18 forKeyedSubscript:@"LaunchdCoalitionId"];

  v128 = v10;
  id v19 = [v10 coalStruct];
  uint64_t v20 = (void *)[v19 pointerValue];

  uint64_t v21 = [NSNumber numberWithUnsignedLongLong:*v20];
  [v15 setObject:v21 forKeyedSubscript:@"tasks_started"];

  uint64_t v22 = [NSNumber numberWithUnsignedLongLong:v20[1]];
  [v15 setObject:v22 forKeyedSubscript:@"tasks_exited"];

  if (v9)
  {
    id v125 = v9;
    uint64_t v23 = [v9 coalStruct];
    uint64_t v24 = (void *)[v23 pointerValue];

    v25 = NSNumber;
    unint64_t v26 = v20[2];
    unint64_t v27 = v24[2];
    if (v26 < v27) {
      unint64_t v27 = 0;
    }
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v26 - v27];
    BOOL v28 = objc_msgSend(v25, "numberWithDouble:");
    [v15 setObject:v28 forKeyedSubscript:@"time_nonempty"];

    v29 = NSNumber;
    unint64_t v30 = v20[3];
    unint64_t v31 = v24[3];
    if (v30 < v31) {
      unint64_t v31 = 0;
    }
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v30 - v31];
    v32 = objc_msgSend(v29, "numberWithDouble:");
    [v15 setObject:v32 forKeyedSubscript:@"cpu_time"];

    unint64_t v33 = v20[31];
    unint64_t v34 = v24[31];
    if (v33 < v34) {
      unint64_t v34 = 0;
    }
    uint64_t v35 = [NSNumber numberWithUnsignedLongLong:v33 - v34];
    [v15 setObject:v35 forKeyedSubscript:@"cpu_instructions"];

    unint64_t v36 = v20[32];
    unint64_t v37 = v24[32];
    if (v36 < v37) {
      unint64_t v37 = 0;
    }
    v38 = [NSNumber numberWithUnsignedLongLong:v36 - v37];
    [v15 setObject:v38 forKeyedSubscript:@"cpu_cycles"];

    v39 = NSNumber;
    unint64_t v40 = v20[8];
    unint64_t v41 = v24[8];
    if (v40 < v41) {
      unint64_t v41 = 0;
    }
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v40 - v41];
    v42 = objc_msgSend(v39, "numberWithDouble:");
    [v15 setObject:v42 forKeyedSubscript:@"gpu_time"];

    unint64_t v43 = v20[41];
    unint64_t v44 = v24[41];
    if (v43 < v44) {
      unint64_t v44 = 0;
    }
    uint64_t v45 = [NSNumber numberWithUnsignedLongLong:v43 - v44];
    [v15 setObject:v45 forKeyedSubscript:@"gpu_energy_nj"];

    unint64_t v46 = v20[42];
    unint64_t v47 = v24[42];
    if (v46 < v47) {
      unint64_t v47 = 0;
    }
    id v48 = [NSNumber numberWithUnsignedLongLong:v46 - v47];
    [v15 setObject:v48 forKeyedSubscript:@"gpu_energy_nj_billed_to_me"];

    unint64_t v49 = v20[43];
    unint64_t v50 = v24[43];
    if (v49 < v50) {
      unint64_t v50 = 0;
    }
    long long v51 = [NSNumber numberWithUnsignedLongLong:v49 - v50];
    [v15 setObject:v51 forKeyedSubscript:@"gpu_energy_nj_billed_to_others"];

    long long v52 = NSNumber;
    unint64_t v53 = v20[9];
    unint64_t v54 = v24[9];
    if (v53 < v54) {
      unint64_t v54 = 0;
    }
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v53 - v54];
    v55 = objc_msgSend(v52, "numberWithDouble:");
    [v15 setObject:v55 forKeyedSubscript:@"cpu_time_billed_to_me"];

    v56 = NSNumber;
    unint64_t v57 = v20[10];
    unint64_t v58 = v24[10];
    if (v57 < v58) {
      unint64_t v58 = 0;
    }
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v57 - v58];
    v59 = objc_msgSend(v56, "numberWithDouble:");
    [v15 setObject:v59 forKeyedSubscript:@"cpu_time_billed_to_others"];

    v60 = [NSNumber numberWithUnsignedLongLong:v20[39] - v24[39]];
    [v15 setObject:v60 forKeyedSubscript:@"ane_energy_nj"];

    uint64_t v61 = NSNumber;
    unint64_t v62 = v20[38];
    unint64_t v63 = v24[38];
    if (v62 < v63) {
      unint64_t v63 = 0;
    }
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v62 - v63];
    v64 = objc_msgSend(v61, "numberWithDouble:");
    [v15 setObject:v64 forKeyedSubscript:@"ane_time"];

    v65 = [NSNumber numberWithUnsignedLongLong:v20[4] - v24[4]];
    [v15 setObject:v65 forKeyedSubscript:@"interrupt_wakeups"];

    v66 = [NSNumber numberWithUnsignedLongLong:v20[5] - v24[5]];
    [v15 setObject:v66 forKeyedSubscript:@"platform_idle_wakeups"];

    v67 = [NSNumber numberWithUnsignedLongLong:v20[6] - v24[6]];
    [v15 setObject:v67 forKeyedSubscript:@"bytesread"];

    v68 = [NSNumber numberWithUnsignedLongLong:v20[7] - v24[7]];
    [v15 setObject:v68 forKeyedSubscript:@"byteswritten"];

    v69 = [NSNumber numberWithUnsignedLongLong:v20[12] - v24[12]];
    [v15 setObject:v69 forKeyedSubscript:@"logical_immediate_writes"];

    v70 = [NSNumber numberWithUnsignedLongLong:v20[13] - v24[13]];
    [v15 setObject:v70 forKeyedSubscript:@"logical_deferred_writes"];

    v71 = [NSNumber numberWithUnsignedLongLong:v20[14] - v24[14]];
    [v15 setObject:v71 forKeyedSubscript:@"logical_invalidated_writes"];

    v72 = [NSNumber numberWithUnsignedLongLong:v20[15] - v24[15]];
    [v15 setObject:v72 forKeyedSubscript:@"logical_metadata_writes"];

    v73 = [NSNumber numberWithUnsignedLongLong:v20[33] - v24[33]];
    [v15 setObject:v73 forKeyedSubscript:@"fs_metadata_writes"];

    v74 = [NSNumber numberWithUnsignedLongLong:v20[34] - v24[34]];
    [v15 setObject:v74 forKeyedSubscript:@"pm_writes"];

    v75 = [NSNumber numberWithUnsignedLongLong:v20[11] - v24[11]];
    [v15 setObject:v75 forKeyedSubscript:@"energy"];

    v76 = [NSNumber numberWithUnsignedLongLong:v20[20] - v24[20]];
    [v15 setObject:v76 forKeyedSubscript:@"energy_billed_to_me"];

    v77 = [NSNumber numberWithUnsignedLongLong:v20[21] - v24[21]];
    [v15 setObject:v77 forKeyedSubscript:@"energy_billed_to_others"];

    for (uint64_t i = 0; i != 7; ++i)
    {
      v79 = objc_msgSend(NSString, "stringWithFormat:", @"cpu_time_eqos_%d", i);
      v80 = NSNumber;
      [MEMORY[0x1E4F92A88] secondsFromMachTime:v20[i + 24] - v24[i + 24]];
      v81 = objc_msgSend(v80, "numberWithDouble:");
      [v15 setObject:v81 forKeyedSubscript:v79];
    }
    v82 = NSNumber;
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v20[22] - v24[22]];
    v83 = objc_msgSend(v82, "numberWithDouble:");
    [v15 setObject:v83 forKeyedSubscript:@"cpu_ptime"];

    v84 = [NSNumber numberWithUnsignedLongLong:v20[36] - v24[36]];
    [v15 setObject:v84 forKeyedSubscript:@"cpu_pcycles"];

    v85 = [NSNumber numberWithUnsignedLongLong:v20[35] - v24[35]];
    id v9 = v125;
  }
  else
  {
    v86 = NSNumber;
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v20[2]];
    v87 = objc_msgSend(v86, "numberWithDouble:");
    [v15 setObject:v87 forKeyedSubscript:@"time_nonempty"];

    v88 = NSNumber;
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v20[3]];
    v89 = objc_msgSend(v88, "numberWithDouble:");
    [v15 setObject:v89 forKeyedSubscript:@"cpu_time"];

    v90 = [NSNumber numberWithUnsignedLongLong:v20[31]];
    [v15 setObject:v90 forKeyedSubscript:@"cpu_instructions"];

    v91 = [NSNumber numberWithUnsignedLongLong:v20[32]];
    [v15 setObject:v91 forKeyedSubscript:@"cpu_cycles"];

    v92 = NSNumber;
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v20[8]];
    v93 = objc_msgSend(v92, "numberWithDouble:");
    [v15 setObject:v93 forKeyedSubscript:@"gpu_time"];

    v94 = [NSNumber numberWithUnsignedLongLong:v20[41]];
    [v15 setObject:v94 forKeyedSubscript:@"gpu_energy_nj"];

    v95 = [NSNumber numberWithUnsignedLongLong:v20[42]];
    [v15 setObject:v95 forKeyedSubscript:@"gpu_energy_nj_billed_to_me"];

    v96 = [NSNumber numberWithUnsignedLongLong:v20[43]];
    [v15 setObject:v96 forKeyedSubscript:@"gpu_energy_nj_billed_to_others"];

    v97 = NSNumber;
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v20[9]];
    v98 = objc_msgSend(v97, "numberWithDouble:");
    [v15 setObject:v98 forKeyedSubscript:@"cpu_time_billed_to_me"];

    v99 = NSNumber;
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v20[10]];
    v100 = objc_msgSend(v99, "numberWithDouble:");
    [v15 setObject:v100 forKeyedSubscript:@"cpu_time_billed_to_others"];

    v101 = [NSNumber numberWithUnsignedLongLong:v20[39]];
    [v15 setObject:v101 forKeyedSubscript:@"ane_energy_nj"];

    v102 = NSNumber;
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v20[38]];
    v103 = objc_msgSend(v102, "numberWithDouble:");
    [v15 setObject:v103 forKeyedSubscript:@"ane_time"];

    v104 = [NSNumber numberWithUnsignedLongLong:v20[4]];
    [v15 setObject:v104 forKeyedSubscript:@"interrupt_wakeups"];

    v105 = [NSNumber numberWithUnsignedLongLong:v20[5]];
    [v15 setObject:v105 forKeyedSubscript:@"platform_idle_wakeups"];

    v106 = [NSNumber numberWithUnsignedLongLong:v20[6]];
    [v15 setObject:v106 forKeyedSubscript:@"bytesread"];

    v107 = [NSNumber numberWithUnsignedLongLong:v20[7]];
    [v15 setObject:v107 forKeyedSubscript:@"byteswritten"];

    v108 = [NSNumber numberWithUnsignedLongLong:v20[12]];
    [v15 setObject:v108 forKeyedSubscript:@"logical_immediate_writes"];

    v109 = [NSNumber numberWithUnsignedLongLong:v20[13]];
    [v15 setObject:v109 forKeyedSubscript:@"logical_deferred_writes"];

    v110 = [NSNumber numberWithUnsignedLongLong:v20[14]];
    [v15 setObject:v110 forKeyedSubscript:@"logical_invalidated_writes"];

    v111 = [NSNumber numberWithUnsignedLongLong:v20[15]];
    [v15 setObject:v111 forKeyedSubscript:@"logical_metadata_writes"];

    v112 = [NSNumber numberWithUnsignedLongLong:v20[33]];
    [v15 setObject:v112 forKeyedSubscript:@"fs_metadata_writes"];

    v113 = [NSNumber numberWithUnsignedLongLong:v20[34]];
    [v15 setObject:v113 forKeyedSubscript:@"pm_writes"];

    v114 = [NSNumber numberWithUnsignedLongLong:v20[11]];
    [v15 setObject:v114 forKeyedSubscript:@"energy"];

    v115 = [NSNumber numberWithUnsignedLongLong:v20[20]];
    [v15 setObject:v115 forKeyedSubscript:@"energy_billed_to_me"];

    v116 = [NSNumber numberWithUnsignedLongLong:v20[21]];
    [v15 setObject:v116 forKeyedSubscript:@"energy_billed_to_others"];

    for (uint64_t j = 0; j != 7; ++j)
    {
      v118 = objc_msgSend(NSString, "stringWithFormat:", @"cpu_time_eqos_%d", j);
      v119 = NSNumber;
      [MEMORY[0x1E4F92A88] secondsFromMachTime:v20[j + 24]];
      v120 = objc_msgSend(v119, "numberWithDouble:");
      [v15 setObject:v120 forKeyedSubscript:v118];
    }
    v121 = NSNumber;
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v20[22]];
    v122 = objc_msgSend(v121, "numberWithDouble:");
    [v15 setObject:v122 forKeyedSubscript:@"cpu_ptime"];

    v123 = [NSNumber numberWithUnsignedLongLong:v20[36]];
    [v15 setObject:v123 forKeyedSubscript:@"cpu_pcycles"];

    v85 = [NSNumber numberWithUnsignedLongLong:v20[35]];
  }
  [v15 setObject:v85 forKeyedSubscript:@"cpu_pinstructions"];

  [(PLCoalitionAgent *)self logToAggd:v15];
  if ([v128 isUIKitApp]) {
    [(PLCoalitionAgent *)self logAggregateNANDStatsWithInfo:v15];
  }

  return v15;
}

- (void)logToAggd:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [v4 objectForKeyedSubscript:@"BundleId"];
  v7 = v6;
  if (v6 && ![v6 isEqualToString:&stru_1F294E108])
  {
    uint64_t v8 = +[PLApplicationAgent appVersionForBundle:v7];
    if ([v8 length])
    {
      [v5 setObject:v7 forKeyedSubscript:@"process_name"];
      [v5 setObject:v8 forKeyedSubscript:@"version"];
      uint64_t v9 = [v7 stringByAppendingFormat:@".ver.%@", v8];

      v7 = (void *)v9;
    }
  }
  else
  {
    [v4 objectForKeyedSubscript:@"LaunchdName"];
    v7 = uint64_t v8 = v7;
  }

  if (![v5 count])
  {
    [v5 setObject:v7 forKeyedSubscript:@"process_name"];
    [v5 setObject:@"unknown" forKeyedSubscript:@"version"];
  }
  id v10 = [(PLCoalitionAgent *)self driveCapacity];
  v38 = v5;
  [v5 setObject:v10 forKeyedSubscript:@"capacity"];

  id v11 = [v4 objectForKeyedSubscript:@"bytesread"];
  unint64_t v37 = [v11 unsignedLongLongValue];

  id v12 = [v4 objectForKeyedSubscript:@"byteswritten"];
  unint64_t v13 = [v12 unsignedLongLongValue];

  double v14 = [v4 objectForKeyedSubscript:@"fs_metadata_writes"];
  unint64_t v15 = [v14 unsignedLongLongValue];

  BOOL v16 = [v4 objectForKeyedSubscript:@"pm_writes"];
  unint64_t v17 = [v16 unsignedLongLongValue];

  double v18 = [v4 objectForKeyedSubscript:@"logical_deferred_writes"];
  uint64_t v19 = [v18 unsignedLongLongValue];
  uint64_t v20 = [v4 objectForKeyedSubscript:@"logical_immediate_writes"];
  uint64_t v21 = [v20 unsignedLongLongValue] + v19;
  uint64_t v22 = [v4 objectForKeyedSubscript:@"logical_metadata_writes"];
  uint64_t v23 = v21 + [v22 unsignedLongLongValue];
  uint64_t v24 = [v4 objectForKeyedSubscript:@"logical_invalidated_writes"];
  unint64_t v25 = v23 - [v24 unsignedLongLongValue];

  MEMORY[0x1D94294C0]([@"com.apple.power.coalition.logical_bytes_written" stringByAppendingFormat:@".%@", v7], v25);
  MEMORY[0x1D94294C0]([@"com.apple.power.coalition.bytesread" stringByAppendingFormat:@".%@", v7], v37);
  MEMORY[0x1D94294C0]([@"com.apple.power.coalition.byteswritten" stringByAppendingFormat:@".%@", v7], v13);
  if (v25 > 0x4C4B40 || v13 > 0x4C4B40 || v15 > 0x4C4B40 || v17 > 0x4C4B40 || v37 >= 0x1312D01)
  {
    id v40 = v38;
    AnalyticsSendEventLazy();
  }
  unint64_t v26 = [v4 objectForKeyedSubscript:@"cpu_time"];
  unint64_t v27 = [v26 unsignedLongLongValue];

  BOOL v28 = [v4 objectForKeyedSubscript:@"platform_idle_wakeups"];
  [v28 unsignedLongLongValue];

  v29 = [v4 objectForKeyedSubscript:@"interrupt_wakeups"];
  [v29 unsignedLongLongValue];

  unint64_t v30 = [v4 objectForKeyedSubscript:@"bytesread"];
  [v30 unsignedLongLongValue];

  unint64_t v31 = [v4 objectForKeyedSubscript:@"logical_immediate_writes"];
  [v31 unsignedLongLongValue];

  v32 = [v4 objectForKeyedSubscript:@"logical_deferred_writes"];
  [v32 unsignedLongLongValue];

  unint64_t v33 = [v4 objectForKeyedSubscript:@"logical_metadata_writes"];
  [v33 unsignedLongLongValue];

  unint64_t v34 = [v4 objectForKeyedSubscript:@"logical_invalidated_writes"];
  [v34 unsignedLongLongValue];

  uint64_t v35 = [v4 objectForKeyedSubscript:@"gpu_time"];
  uint64_t v36 = [v35 unsignedLongLongValue];

  if (v25 > 0x4C4B40 || v27 > 5 || v36)
  {
    id v39 = v7;
    AnalyticsSendEventLazy();
  }
}

- (NSString)driveCapacity
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)addAccountingEventsFromCoalitions:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    unint64_t v58 = objc_opt_new();
    uint64_t v57 = objc_opt_new();
    id v5 = objc_opt_new();
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v56 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v64 objects:v69 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v65;
      double v10 = 0.0;
      double v11 = 0.0;
      double v12 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v65 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v14 = *(void *)(*((void *)&v64 + 1) + 8 * i);
          -[PLCoalitionAgent getCPUWeightFromEntry:](self, "getCPUWeightFromEntry:", v14, v56);
          double v12 = v12 + v15;
          [(PLCoalitionAgent *)self getGPUWeightFromEntry:v14];
          double v11 = v11 + v16;
          [(PLCoalitionAgent *)self getANEEnergyFromEntry:v14];
          double v10 = v10 + v17;
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v64 objects:v69 count:16];
      }
      while (v8);
    }
    else
    {
      double v10 = 0.0;
      double v11 = 0.0;
      double v12 = 0.0;
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v18 = v6;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v60 objects:v68 count:16];
    uint64_t v20 = (void *)v57;
    if (v19)
    {
      uint64_t v21 = v19;
      uint64_t v22 = *(void *)v61;
      v59 = v5;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v61 != v22) {
            objc_enumerationMutation(v18);
          }
          uint64_t v24 = *(void *)(*((void *)&v60 + 1) + 8 * j);
          unint64_t v25 = objc_msgSend(MEMORY[0x1E4F92A88], "getIdentifierFromEntry:", v24, v56);
          if (v12 > 0.0)
          {
            [(PLCoalitionAgent *)self getCPUWeightFromEntry:v24];
            if (v26 > 0.0)
            {
              double v27 = v26 / v12;
              BOOL v28 = [v58 objectForKey:v25];

              v29 = NSNumber;
              if (v28)
              {
                unint64_t v30 = [v58 objectForKeyedSubscript:v25];
                [v30 doubleValue];
                v32 = [v29 numberWithDouble:v27 + v31];
                [v58 setObject:v32 forKeyedSubscript:v25];
              }
              else
              {
                unint64_t v30 = [NSNumber numberWithDouble:v27];
                [v58 setObject:v30 forKeyedSubscript:v25];
              }

              uint64_t v20 = (void *)v57;
              id v5 = v59;
            }
          }
          if (v11 > 0.0)
          {
            [(PLCoalitionAgent *)self getGPUWeightFromEntry:v24];
            if (v33 > 0.0)
            {
              double v34 = v33 / v11;
              uint64_t v35 = [v20 objectForKey:v25];

              uint64_t v36 = NSNumber;
              if (v35)
              {
                unint64_t v37 = [v20 objectForKeyedSubscript:v25];
                [v37 doubleValue];
                id v39 = [v36 numberWithDouble:v34 + v38];
                [v20 setObject:v39 forKeyedSubscript:v25];
              }
              else
              {
                unint64_t v37 = [NSNumber numberWithDouble:v34];
                [v20 setObject:v37 forKeyedSubscript:v25];
              }

              id v5 = v59;
            }
          }
          if (v10 > 0.0)
          {
            [(PLCoalitionAgent *)self getANEEnergyFromEntry:v24];
            if (v40 > 0.0)
            {
              double v41 = v40 / v10;
              v42 = [v5 objectForKey:v25];

              unint64_t v43 = NSNumber;
              if (v42)
              {
                unint64_t v44 = [v5 objectForKeyedSubscript:v25];
                [v44 doubleValue];
                unint64_t v46 = [v43 numberWithDouble:v41 + v45];
                [v5 setObject:v46 forKeyedSubscript:v25];
              }
              else
              {
                unint64_t v44 = [NSNumber numberWithDouble:v41];
                [v5 setObject:v44 forKeyedSubscript:v25];
              }
            }
          }
        }
        uint64_t v21 = [v18 countByEnumeratingWithState:&v60 objects:v68 count:16];
      }
      while (v21);
    }

    unint64_t v47 = [MEMORY[0x1E4F92900] sharedInstance];
    id v48 = [(PLCoalitionAgent *)self currentDate];
    [v47 createDistributionEventBackwardWithDistributionID:33 withChildNodeNameToWeight:v58 withEndDate:v48];

    unint64_t v49 = [MEMORY[0x1E4F92900] sharedInstance];
    unint64_t v50 = [(PLCoalitionAgent *)self currentDate];
    [v49 createDistributionEventBackwardWithDistributionID:34 withChildNodeNameToWeight:v20 withEndDate:v50];

    long long v51 = [(PLCoalitionAgent *)self currentDate];
    long long v52 = [v51 dateByAddingTimeInterval:-5.0];

    unint64_t v53 = [MEMORY[0x1E4F92900] sharedInstance];
    [v53 createDistributionEventBackwardWithDistributionID:52 withChildNodeNameToWeight:v5 withEndDate:v52];

    unint64_t v54 = [MEMORY[0x1E4F92900] sharedInstance];
    v55 = [(PLCoalitionAgent *)self currentDate];
    [v54 createDistributionEventBackwardWithDistributionID:52 withChildNodeNameToWeight:MEMORY[0x1E4F1CC08] withEndDate:v55];

    id v4 = v56;
  }
}

- (double)getGPUWeightFromEntry:(id)a3
{
  id v4 = a3;
  if (qword_1EBD58CD8 != -1) {
    dispatch_once(&qword_1EBD58CD8, &__block_literal_global_771);
  }
  if (byte_1EBD58CAB == 1) {
    [(PLCoalitionAgent *)self getGPUEnergyFromEntry:v4];
  }
  else {
    [(PLCoalitionAgent *)self getGPUTimeFromEntry:v4];
  }
  double v6 = v5;

  return v6;
}

- (double)getGPUTimeFromEntry:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"gpu_time"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)getCPUWeightFromEntry:(id)a3
{
  id v4 = a3;
  if (qword_1EBD58CD0 != -1) {
    dispatch_once(&qword_1EBD58CD0, &__block_literal_global_769);
  }
  if (byte_1EBD58CAA) {
    [(PLCoalitionAgent *)self getCPUVoucherTimeFromEntry:v4];
  }
  else {
    [(PLCoalitionAgent *)self getCPUEnergyFromEntry:v4];
  }
  double v6 = v5;

  return v6;
}

- (double)getCPUEnergyFromEntry:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"energy"];
  [v4 doubleValue];
  double v6 = v5;
  uint64_t v7 = [v3 objectForKeyedSubscript:@"energy_billed_to_me"];
  [v7 doubleValue];
  double v9 = v6 + v8;
  double v10 = [v3 objectForKeyedSubscript:@"energy_billed_to_others"];

  [v10 doubleValue];
  double v12 = v9 - v11;

  double result = 0.0;
  if (v12 >= 0.0) {
    return v12;
  }
  return result;
}

- (double)getANEEnergyFromEntry:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"ane_energy_nj"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

void __44__PLCoalitionAgent_initOperatorDependancies__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = PLLogCoalition();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "Notification from ThermalMonitor: %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v5 = [v3 objectForKeyedSubscript:@"Source"];
  if (v5)
  {
    double v6 = (void *)v5;
    uint64_t v7 = [v3 objectForKeyedSubscript:@"Source"];
    int v8 = [v7 isEqual:&unk_1F29E6628];

    if (v8) {
      [*(id *)(a1 + 32) logEventIntervalCoalitionIntervalWithHFLFlag:0];
    }
  }
}

id __30__PLCoalitionAgent_logToAggd___block_invoke_2(void *a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  [v2 setObject:a1[4] forKeyedSubscript:@"label"];
  id v3 = [NSNumber numberWithUnsignedLongLong:a1[5]];
  [v2 setObject:v3 forKeyedSubscript:@"cpu_time"];

  double v4 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  [v2 setObject:v4 forKeyedSubscript:@"wakeups"];

  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:a1[7]];
  [v2 setObject:v5 forKeyedSubscript:@"interrupts"];

  double v6 = [NSNumber numberWithUnsignedLongLong:a1[8]];
  [v2 setObject:v6 forKeyedSubscript:@"disk_bytes_read"];

  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:a1[9]];
  [v2 setObject:v7 forKeyedSubscript:@"bytes_written_immediate"];

  int v8 = [NSNumber numberWithUnsignedLongLong:a1[10]];
  [v2 setObject:v8 forKeyedSubscript:@"bytes_written_deferred"];

  int v9 = [NSNumber numberWithUnsignedLongLong:a1[11]];
  [v2 setObject:v9 forKeyedSubscript:@"bytes_written_meta"];

  id v10 = [NSNumber numberWithUnsignedLongLong:a1[12]];
  [v2 setObject:v10 forKeyedSubscript:@"bytes_written_inv"];

  uint64_t v11 = [NSNumber numberWithUnsignedLongLong:a1[13]];
  [v2 setObject:v11 forKeyedSubscript:@"gpu_time"];

  return v2;
}

id __30__PLCoalitionAgent_logToAggd___block_invoke(void *a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a1[4]];
  id v3 = [NSNumber numberWithUnsignedLongLong:a1[5]];
  [v2 setObject:v3 forKeyedSubscript:@"bytes_read"];

  double v4 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  [v2 setObject:v4 forKeyedSubscript:@"bytes_written"];

  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:a1[7]];
  [v2 setObject:v5 forKeyedSubscript:@"logical_writes"];

  double v6 = [NSNumber numberWithUnsignedLongLong:a1[8]];
  [v2 setObject:v6 forKeyedSubscript:@"fs_metadata_writes"];

  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:a1[9]];
  [v2 setObject:v7 forKeyedSubscript:@"pm_writes"];

  return v2;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLCoalitionAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryAggregateDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"NANDStats";
  objc_super v2 = +[PLCoalitionAgent entryAggregateDefinitionNANDStats];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryAggregateDefinitionNANDStats
{
  v22[4] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92BF8];
  v19[0] = *MEMORY[0x1E4F92CD0];
  v19[1] = v2;
  v20[0] = &unk_1F29F0CD0;
  v20[1] = MEMORY[0x1E4F1CC38];
  v19[2] = *MEMORY[0x1E4F92C08];
  v20[2] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  v22[0] = v3;
  v21[1] = *MEMORY[0x1E4F92CA8];
  v17[0] = @"BundleId";
  double v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v17[1] = @"LogicalWrites";
  v18[0] = v5;
  double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v18[1] = v7;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v22[1] = v8;
  v21[2] = *MEMORY[0x1E4F92BE0];
  double v15 = &unk_1F29F0CE0;
  uint64_t v13 = *MEMORY[0x1E4F92BD8];
  uint64_t v14 = &unk_1F29F0CF0;
  int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  double v16 = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v21[3] = *MEMORY[0x1E4F92BF0];
  v22[2] = v10;
  v22[3] = &unk_1F29EE378;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];

  return v11;
}

+ (id)entryEventPointDefinitions
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"CoalitionDrops";
  uint64_t v2 = +[PLCoalitionAgent entryEventPointDefinitionCoalitionDrop];
  v8[0] = v2;
  v7[1] = @"CoalitionMemory";
  id v3 = +[PLCoalitionAgent entryEventPointDefinitionCoalitionMemory];
  v8[1] = v3;
  v7[2] = @"totalMemoryPerJetsamPriority";
  double v4 = +[PLCoalitionAgent entryEventPointDefinitionTotalFootprintSum];
  v8[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

+ (id)entryEventPointDefinitionCoalitionDrop
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  uint64_t v13 = &unk_1F29F0CD0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"bufferSize";
  id v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"finalSize";
  v11[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventPointDefinitionCoalitionMemory
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v29[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v27[0] = *MEMORY[0x1E4F92CD0];
  v27[1] = v2;
  v28[0] = &unk_1F29F0D00;
  v28[1] = MEMORY[0x1E4F1CC38];
  v27[2] = *MEMORY[0x1E4F92C08];
  v28[2] = MEMORY[0x1E4F1CC38];
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
  v30[0] = v24;
  v29[1] = *MEMORY[0x1E4F92CA8];
  v25[0] = @"LaunchdCoalitionId";
  uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v26[0] = v22;
  v25[1] = @"LaunchdName";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_StringFormat_withBundleID");
  v26[1] = v20;
  v25[2] = @"memory_wired_size";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v26[2] = v18;
  v25[3] = @"memory_purgeable_size";
  double v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v26[3] = v16;
  v25[4] = @"memory_anonmem_size";
  double v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v26[4] = v14;
  v25[5] = @"memory_compressed_size";
  id v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v26[5] = v4;
  v25[6] = @"process_count";
  uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v26[6] = v6;
  v25[7] = @"CompressedLifetime";
  uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v26[7] = v8;
  v25[8] = @"Swapins";
  int v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v26[8] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:9];
  v30[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionTotalFootprintSum
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  uint64_t v11 = &unk_1F29F0CD0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  int v8 = @"footprintSum";
  id v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  int v9 = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventIntervalDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"CoalitionInterval";
  uint64_t v2 = +[PLCoalitionAgent entryEventIntervalDefinitionCoalitionUsage];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventIntervalDefinitionCoalitionUsage
{
  v91[2] = *MEMORY[0x1E4F143B8];
  v90[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v88[0] = *MEMORY[0x1E4F92CD0];
  v88[1] = v2;
  v89[0] = &unk_1F29F0D10;
  v89[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = *MEMORY[0x1E4F92CB0];
  v88[2] = *MEMORY[0x1E4F92C08];
  v88[3] = v3;
  v89[2] = MEMORY[0x1E4F1CC38];
  v89[3] = @"logEventIntervalCoalitionIntervalWithoutHighFreqLogging";
  v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:4];
  v91[0] = v85;
  v90[1] = *MEMORY[0x1E4F92CA8];
  v86[0] = @"LaunchdCoalitionId";
  v84 = [MEMORY[0x1E4F929D8] sharedInstance];
  v83 = objc_msgSend(v84, "commonTypeDict_IntegerFormat");
  v87[0] = v83;
  v86[1] = @"LaunchdName";
  v82 = [MEMORY[0x1E4F929D8] sharedInstance];
  v81 = objc_msgSend(v82, "commonTypeDict_StringFormat_withBundleID");
  v87[1] = v81;
  v86[2] = @"BundleId";
  v80 = [MEMORY[0x1E4F929D8] sharedInstance];
  v79 = objc_msgSend(v80, "commonTypeDict_StringFormat_withBundleID");
  v87[2] = v79;
  v86[3] = @"tasks_started";
  v78 = [MEMORY[0x1E4F929D8] sharedInstance];
  v77 = objc_msgSend(v78, "commonTypeDict_RealFormat");
  v87[3] = v77;
  v86[4] = @"tasks_exited";
  v76 = [MEMORY[0x1E4F929D8] sharedInstance];
  v75 = objc_msgSend(v76, "commonTypeDict_RealFormat");
  v87[4] = v75;
  v86[5] = @"time_nonempty";
  v74 = [MEMORY[0x1E4F929D8] sharedInstance];
  v73 = objc_msgSend(v74, "commonTypeDict_RealFormat");
  v87[5] = v73;
  v86[6] = @"cpu_time";
  v72 = [MEMORY[0x1E4F929D8] sharedInstance];
  v71 = objc_msgSend(v72, "commonTypeDict_RealFormat");
  v87[6] = v71;
  v86[7] = @"cpu_instructions";
  uint64_t v70 = [MEMORY[0x1E4F929D8] sharedInstance];
  v69 = objc_msgSend(v70, "commonTypeDict_IntegerFormat");
  v87[7] = v69;
  v86[8] = @"interrupt_wakeups";
  v68 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v67 = objc_msgSend(v68, "commonTypeDict_RealFormat");
  v87[8] = v67;
  v86[9] = @"platform_idle_wakeups";
  long long v66 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v65 = objc_msgSend(v66, "commonTypeDict_RealFormat");
  v87[9] = v65;
  v86[10] = @"bytesread";
  long long v64 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v63 = objc_msgSend(v64, "commonTypeDict_RealFormat");
  v87[10] = v63;
  v86[11] = @"byteswritten";
  long long v62 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v61 = objc_msgSend(v62, "commonTypeDict_RealFormat");
  v87[11] = v61;
  v86[12] = @"logical_immediate_writes";
  long long v60 = [MEMORY[0x1E4F929D8] sharedInstance];
  v59 = objc_msgSend(v60, "commonTypeDict_RealFormat");
  v87[12] = v59;
  v86[13] = @"logical_deferred_writes";
  unint64_t v58 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v57 = objc_msgSend(v58, "commonTypeDict_RealFormat");
  v87[13] = v57;
  v86[14] = @"logical_invalidated_writes";
  id v56 = [MEMORY[0x1E4F929D8] sharedInstance];
  v55 = objc_msgSend(v56, "commonTypeDict_RealFormat");
  v87[14] = v55;
  v86[15] = @"logical_metadata_writes";
  unint64_t v54 = [MEMORY[0x1E4F929D8] sharedInstance];
  unint64_t v53 = objc_msgSend(v54, "commonTypeDict_RealFormat");
  v87[15] = v53;
  v86[16] = @"gpu_time";
  long long v52 = [MEMORY[0x1E4F929D8] sharedInstance];
  long long v51 = objc_msgSend(v52, "commonTypeDict_RealFormat");
  v87[16] = v51;
  v86[17] = @"gpu_energy_nj";
  unint64_t v50 = [MEMORY[0x1E4F929D8] sharedInstance];
  unint64_t v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v87[17] = v49;
  v86[18] = @"gpu_energy_nj_billed_to_me";
  id v48 = [MEMORY[0x1E4F929D8] sharedInstance];
  unint64_t v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
  v87[18] = v47;
  v86[19] = @"gpu_energy_nj_billed_to_others";
  unint64_t v46 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v45 = objc_msgSend(v46, "commonTypeDict_IntegerFormat");
  v87[19] = v45;
  v86[20] = @"cpu_time_billed_to_me";
  unint64_t v44 = [MEMORY[0x1E4F929D8] sharedInstance];
  unint64_t v43 = objc_msgSend(v44, "commonTypeDict_RealFormat");
  v87[20] = v43;
  v86[21] = @"cpu_time_billed_to_others";
  v42 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v41 = objc_msgSend(v42, "commonTypeDict_RealFormat");
  v87[21] = v41;
  v86[22] = @"timestampEnd";
  double v40 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v39 = objc_msgSend(v40, "commonTypeDict_DateFormat");
  v87[22] = v39;
  v86[23] = @"energy";
  double v38 = [MEMORY[0x1E4F929D8] sharedInstance];
  unint64_t v37 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
  v87[23] = v37;
  v86[24] = @"energy_billed_to_me";
  uint64_t v36 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v87[24] = v35;
  v86[25] = @"energy_billed_to_others";
  double v34 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v87[25] = v33;
  v86[26] = @"cpu_time_eqos_0";
  v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v31 = objc_msgSend(v32, "commonTypeDict_RealFormat");
  v87[26] = v31;
  v86[27] = @"cpu_time_eqos_1";
  unint64_t v30 = [MEMORY[0x1E4F929D8] sharedInstance];
  v29 = objc_msgSend(v30, "commonTypeDict_RealFormat");
  v87[27] = v29;
  v86[28] = @"cpu_time_eqos_2";
  BOOL v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v27 = objc_msgSend(v28, "commonTypeDict_RealFormat");
  v87[28] = v27;
  v86[29] = @"cpu_time_eqos_3";
  double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  unint64_t v25 = objc_msgSend(v26, "commonTypeDict_RealFormat");
  v87[29] = v25;
  v86[30] = @"cpu_time_eqos_4";
  uint64_t v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v23 = objc_msgSend(v24, "commonTypeDict_RealFormat");
  v87[30] = v23;
  v86[31] = @"cpu_time_eqos_5";
  uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
  v87[31] = v21;
  v86[32] = @"cpu_time_eqos_6";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v19 = objc_msgSend(v20, "commonTypeDict_RealFormat");
  v87[32] = v19;
  v86[33] = @"ane_time";
  id v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
  v87[33] = v17;
  v86[34] = @"ane_energy_nj";
  double v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v87[34] = v15;
  v86[35] = @"cpu_ptime";
  double v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
  v87[35] = v5;
  v86[36] = @"cpu_pinstructions";
  double v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v87[36] = v7;
  v86[37] = @"cpu_pcycles";
  int v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v87[37] = v9;
  v86[38] = @"cpu_cycles";
  uint64_t v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v87[38] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:39];
  v91[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:2];

  return v13;
}

- (PLCoalitionAgent)init
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PLCoalitionAgent;
  uint64_t v2 = [(PLAgent *)&v16 init];
  uint64_t v3 = v2;
  if (v2)
  {
    driveCapacity = v2->_driveCapacity;
    v2->_driveCapacity = (NSString *)@"Unknown";

    uint64_t v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    uint64_t v6 = [v5 dateByAddingTimeInterval:(double)arc4random_uniform(0x15180u)];
    reportMemoryStatsAfterTime = v3->_reportMemoryStatsAfterTime;
    v3->_reportMemoryStatsAfterTime = (NSDate *)v6;

    int v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = v3->_reportMemoryStatsAfterTime;
      *(_DWORD *)buf = 138412290;
      id v18 = v14;
      _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "Picked random time in next 24 hours for sending stats to CA: %@", buf, 0xCu);
    }

    int v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    uint64_t v10 = [v9 dateByAddingTimeInterval:(double)arc4random_uniform(0xE10u)];
    reportHighFrequencyMemoryStatsAfterTime = v3->_reportHighFrequencyMemoryStatsAfterTime;
    v3->_reportHighFrequencyMemoryStatsAfterTime = (NSDate *)v10;

    uint64_t v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      double v15 = v3->_reportHighFrequencyMemoryStatsAfterTime;
      *(_DWORD *)buf = 138412290;
      id v18 = v15;
      _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "Picked random time in next hour for sending high frequency stats to CA: %@", buf, 0xCu);
    }
  }
  return v3;
}

- (void)initOperatorDependancies
{
  int v3 = [MEMORY[0x1E4F929C0] BOOLForKey:@"fasterMemoryPolling" ifNotSet:1];
  if (([MEMORY[0x1E4F92A38] internalBuild] & 1) != 0
    || [MEMORY[0x1E4F929C0] taskMode])
  {
    int v4 = [MEMORY[0x1E4F92A38] isiOS] & v3;
  }
  else
  {
    int v4 = 0;
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __44__PLCoalitionAgent_initOperatorDependancies__block_invoke;
  v25[3] = &unk_1E692A0F0;
  v25[4] = self;
  uint64_t v5 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withBlock:v25];
  batteryLevelChanged = self->_batteryLevelChanged;
  self->_batteryLevelChanged = v5;

  if (v4)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F929E8]);
    int v8 = [(PLOperator *)self workQueue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __44__PLCoalitionAgent_initOperatorDependancies__block_invoke_442;
    v24[3] = &unk_1E692A0F0;
    v24[4] = self;
    int v9 = (PLEntryNotificationOperatorComposition *)[v7 initWithWorkQueue:v8 forEntryKey:@"PLBatteryAgent_EventBackward_Battery" withBlock:v24];
    batteryEntryLogged = self->_batteryEntryLogged;
    self->_batteryEntryLogged = v9;
  }
  objc_initWeak(&location, self);
  uint64_t v11 = [MEMORY[0x1E4F92A50] sharedInstance];
  [(PLCoalitionAgent *)self setStateTracker:v11];

  uint64_t v12 = [(PLCoalitionAgent *)self stateTracker];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __44__PLCoalitionAgent_initOperatorDependancies__block_invoke_444;
  v21[3] = &unk_1E692B480;
  objc_copyWeak(&v22, &location);
  [v12 registerForStates:1 withOperator:self withBlock:v21];

  [(PLCoalitionAgent *)self getStorageCapacity];
  id v13 = objc_alloc(MEMORY[0x1E4F92A28]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __44__PLCoalitionAgent_initOperatorDependancies__block_invoke_2;
  void v20[3] = &unk_1E692A0F0;
  v20[4] = self;
  uint64_t v14 = (PLNSNotificationOperatorComposition *)[v13 initWithOperator:self forNotification:@"PLThermalMonitorNotification" withBlock:v20];
  thermalMonitorListener = self->_thermalMonitorListener;
  self->_thermalMonitorListener = v14;

  id v16 = objc_alloc(MEMORY[0x1E4F92AA8]);
  double v17 = [(PLOperator *)self workQueue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __44__PLCoalitionAgent_initOperatorDependancies__block_invoke_469;
  void v19[3] = &unk_1E692A118;
  v19[4] = self;
  id v18 = (void *)[v16 initWithWorkQueue:v17 withRegistration:&unk_1F29EA670 withBlock:v19];
  [(PLCoalitionAgent *)self setLogicalWritesResponder:v18];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __44__PLCoalitionAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  uint64_t v2 = PLLogCoalition();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEFAULT, "Coalitions: Received SBC notification!", v5, 2u);
  }

  [*(id *)(a1 + 32) logEventIntervalCoalitionIntervalWithHFLFlag:0];
  int v3 = *(void **)(a1 + 32);
  int v4 = [v3 lastCoalitionObjectDictionary];
  [v3 logCoalitionObjectMemory:v4 shouldLogBatteryTableCadence:0];
}

void __44__PLCoalitionAgent_initOperatorDependancies__block_invoke_442(uint64_t a1)
{
  uint64_t v2 = PLLogCoalition();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_debug_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEBUG, "Logging logCoalitionObjectMemory stats for new EventBackward_Battery entry logged", v5, 2u);
  }

  int v3 = *(void **)(a1 + 32);
  int v4 = [v3 lastCoalitionObjectDictionary];
  [v3 logCoalitionObjectMemory:v4 shouldLogBatteryTableCadence:1];
}

void __44__PLCoalitionAgent_initOperatorDependancies__block_invoke_444(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleStateChangeForCoalitions];
}

id __44__PLCoalitionAgent_initOperatorDependancies__block_invoke_469(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_1D2690000, v7, OS_LOG_TYPE_INFO, "LogicalWritesPerApp query received with info: %@", (uint8_t *)&v13, 0xCu);
  }

  int v8 = [*(id *)(a1 + 32) processPerAppLogicalWritesWithInfo:v6];
  int v9 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v8];
  uint64_t v10 = NSNumber;
  [MEMORY[0x1E4F929C0] doubleForKey:@"LastUpgradeSystemTimestamp"];
  uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
  [v9 setObject:v11 forKeyedSubscript:@"lastUpgradeTimestamp"];

  return v9;
}

- (void)handleStateChangeForCoalitions
{
  int v3 = [(PLCoalitionAgent *)self lastDate];
  int v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = fabs(v5);

  if (v6 <= 300.0)
  {
    id v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_1D2690000, v7, OS_LOG_TYPE_INFO, "Frequent Plugged / Unplugged events, not logging to Coalitions", v8, 2u);
    }
  }
  else
  {
    [(PLCoalitionAgent *)self logEventIntervalCoalitionIntervalWithHFLFlag:0];
  }
}

- (void)getStorageCapacity
{
  unint64_t v3 = [(PLCoalitionAgent *)self readPropertyFromRegistry:@"Device Characteristics"];
  if (v3
    || (unint64_t v3 = [(PLCoalitionAgent *)self readPropertyFromRegistry:@"Controller Characteristics"]) != 0)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%llu", (unint64_t)((double)v3 / 1000000000.0));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(PLCoalitionAgent *)self setDriveCapacity:v4];
  }
  else
  {
    [(PLCoalitionAgent *)self setDriveCapacity:@"Unknown"];
  }
}

- (unint64_t)readPropertyFromRegistry:(__CFString *)a3
{
  kern_return_t MatchingServices;
  kern_return_t v7;
  NSObject *v8;
  io_object_t v10;
  io_registry_entry_t v11;
  CFAllocatorRef v12;
  CFTypeRef v13;
  CFTypeID v14;
  CFTypeID TypeID;
  CFDictionaryRef ValueAtIndex;
  CFTypeID v17;
  CFNumberRef Value;
  CFNumberRef v19;
  CFTypeID v20;
  NSObject *v21;
  unint64_t valuePtr;
  io_iterator_t existing;
  uint8_t buf[4];
  __CFString *v25;
  __int16 v26;
  CFTypeRef v27;
  uint64_t v28;

  BOOL v28 = *MEMORY[0x1E4F143B8];
  existing = 0;
  valuePtr = 0;
  mach_port_t v4 = *MEMORY[0x1E4F2EF00];
  CFDictionaryRef v5 = IOServiceMatching("IOMedia");
  MatchingServices = IOServiceGetMatchingServices(v4, v5, &existing);
  if (MatchingServices)
  {
    id v7 = MatchingServices;
    int v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v7;
      _os_log_error_impl(&dword_1D2690000, v8, OS_LOG_TYPE_ERROR, "IOServiceGetMatchingServices kernResult %x\n", buf, 8u);
    }

    return 0;
  }
  uint64_t v10 = IOIteratorNext(existing);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      int v13 = IORegistryEntrySearchCFProperty(v11, "IOService", a3, v12, 3u);
      IOObjectRelease(v11);
      if (!v13) {
        break;
      }
      id v14 = CFGetTypeID(v13);
      TypeID = CFDictionaryGetTypeID();
      ValueAtIndex = (const __CFDictionary *)v13;
      if (v14 != TypeID)
      {
        double v17 = CFGetTypeID(v13);
        if (v17 != CFArrayGetTypeID())
        {
          uint64_t v21 = PLLogCommon();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            unint64_t v25 = a3;
            double v26 = 2112;
            double v27 = v13;
            _os_log_error_impl(&dword_1D2690000, v21, OS_LOG_TYPE_ERROR, "Unknown datatype for property: %@ data : %@", buf, 0x16u);
          }

          goto LABEL_17;
        }
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v13, 0);
      }
      Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"capacity");
      if (Value)
      {
        uint64_t v19 = Value;
        uint64_t v20 = CFGetTypeID(Value);
        if (v20 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v19, kCFNumberSInt64Type, &valuePtr);
          CFRelease(v13);
          break;
        }
      }
      CFRelease(v13);
LABEL_17:
      uint64_t v11 = IOIteratorNext(existing);
    }
    while (v11);
  }
  if (existing) {
    IOObjectRelease(existing);
  }
  return valuePtr;
}

- (void)logToCAProcessMemory:(id)a3 andAccumulatedMemory:(id)a4 dailyReport:(BOOL)a5 systemUptime:(unint64_t)a6
{
  BOOL v7 = a5;
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v56 = a4;
  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
  [v10 timeIntervalSinceReferenceDate];
  unint64_t v12 = (unint64_t)(v11 / 86400.0);

  if ([MEMORY[0x1E4F929C0] objectExistsForKey:@"MemoryCoreAnalyticsLastReportedDayNumber"])
  {
    int v13 = [MEMORY[0x1E4F929C0] objectForKey:@"MemoryCoreAnalyticsLastReportedDayNumber" synchronize:1];
    unint64_t v14 = [v13 unsignedLongLongValue];
  }
  else
  {
    unint64_t v14 = 0;
  }
  if (v14 < v12)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F929C0];
    id v16 = [NSNumber numberWithUnsignedLongLong:v12];
    [v15 setObject:v16 forKey:@"MemoryCoreAnalyticsLastReportedDayNumber" saveToDisk:1];

    AnalyticsSendEventLazy();
LABEL_7:
    unint64_t v55 = a6;
    double v17 = PLLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v141 = [v9 count];
      _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "Log Process Memory Stats to CA  count %lu", buf, 0xCu);
    }

    signed int v18 = arc4random_uniform([v9 count]);
    unint64_t v58 = v9;
    if ([v9 count])
    {
      uint64_t v19 = v18;
      uint64_t v20 = 1;
      do
      {
        uint64_t v21 = objc_msgSend(v9, "objectAtIndexedSubscript:", (int)((v19 + v20 - 1) % (unint64_t)objc_msgSend(v9, "count", v55)));
        unint64_t v22 = objc_msgSend(v21, "phys_footprint_size");
        BOOL v23 = v22 > (int)([v21 memoryLimitMB] << 20);
        if (v7)
        {
          uint64_t v130 = MEMORY[0x1E4F143A8];
          uint64_t v131 = 3221225472;
          v132 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_506;
          v133 = &unk_1E692E788;
          id v134 = v21;
          BOOL v135 = v23;
          AnalyticsSendEventLazy();
          uint64_t v125 = MEMORY[0x1E4F143A8];
          uint64_t v126 = 3221225472;
          v127 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_2;
          v128 = &unk_1E692A2A0;
          id v129 = v134;
          AnalyticsSendEventLazy();
          uint64_t v120 = MEMORY[0x1E4F143A8];
          uint64_t v121 = 3221225472;
          v122 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_3;
          v123 = &unk_1E692A2A0;
          id v124 = v129;
          AnalyticsSendEventLazy();
        }
        uint64_t v114 = MEMORY[0x1E4F143A8];
        uint64_t v115 = 3221225472;
        v116 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_4;
        v117 = &unk_1E692E788;
        id v24 = v21;
        id v118 = v24;
        BOOL v119 = v23;
        AnalyticsSendEventLazy();
        if ((unint64_t)objc_msgSend(v24, "neural_footprint") >= 0x401)
        {
          uint64_t v109 = MEMORY[0x1E4F143A8];
          uint64_t v110 = 3221225472;
          v111 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_5;
          v112 = &unk_1E692A2A0;
          id v113 = v24;
          AnalyticsSendEventLazy();
        }
        id v9 = v58;
      }
      while ([v58 count] > (unint64_t)v20++);
    }
    objc_msgSend(MEMORY[0x1E4F92A88], "roundToSigFigDouble:withSigFig:", 2, (double)v55 / 3.6e12, v55);
    int v27 = (int)v26;
    [v56 memoryUsageAtEachPriority];
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [obj countByEnumeratingWithState:&v105 objects:v139 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v106;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v106 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void *)(*((void *)&v105 + 1) + 8 * i);
          uint64_t v98 = MEMORY[0x1E4F143A8];
          uint64_t v99 = 3221225472;
          v100 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_6;
          v101 = &unk_1E692CD88;
          v102 = obj;
          uint64_t v103 = v32;
          int v104 = v27;
          AnalyticsSendEventLazy();
          uint64_t v91 = MEMORY[0x1E4F143A8];
          uint64_t v92 = 3221225472;
          v93 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_7;
          v94 = &unk_1E692CD88;
          double v33 = v102;
          v95 = v33;
          uint64_t v96 = v32;
          int v97 = v27;
          AnalyticsSendEventLazy();
        }
        uint64_t v29 = [v33 countByEnumeratingWithState:&v105 objects:v139 count:16];
      }
      while (v29);
    }

    [v56 memoryUsedAtOrAboveEachPriority];
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v35 = [v34 countByEnumeratingWithState:&v87 objects:v138 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v88;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v88 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void *)(*((void *)&v87 + 1) + 8 * j);
          uint64_t v80 = MEMORY[0x1E4F143A8];
          uint64_t v81 = 3221225472;
          v82 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_8;
          v83 = &unk_1E692CD88;
          id v40 = v34;
          id v84 = v40;
          uint64_t v85 = v39;
          int v86 = v27;
          AnalyticsSendEventLazy();
        }
        uint64_t v36 = [v40 countByEnumeratingWithState:&v87 objects:v138 count:16];
      }
      while (v36);
    }
    uint64_t v57 = v34;

    [v56 memoryAvailableAtOrBelowEachPriority];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v42 = [v41 countByEnumeratingWithState:&v76 objects:v137 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v77;
      do
      {
        for (uint64_t k = 0; k != v43; ++k)
        {
          if (*(void *)v77 != v44) {
            objc_enumerationMutation(v41);
          }
          uint64_t v46 = *(void *)(*((void *)&v76 + 1) + 8 * k);
          uint64_t v69 = MEMORY[0x1E4F143A8];
          uint64_t v70 = 3221225472;
          v71 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_9;
          v72 = &unk_1E692CD88;
          id v47 = v41;
          id v73 = v47;
          uint64_t v74 = v46;
          int v75 = v27;
          AnalyticsSendEventLazy();
        }
        uint64_t v43 = [v47 countByEnumeratingWithState:&v76 objects:v137 count:16];
      }
      while (v43);
    }

    id v48 = [v56 systemMemoryStatsDictionary];
    uint64_t v64 = MEMORY[0x1E4F143A8];
    uint64_t v65 = 3221225472;
    long long v66 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_10;
    long long v67 = &unk_1E692A2A0;
    id v68 = v48;
    AnalyticsSendEventLazy();
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v49 = v68;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v60 objects:v136 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v61;
      do
      {
        for (uint64_t m = 0; m != v51; ++m)
        {
          if (*(void *)v61 != v52) {
            objc_enumerationMutation(v49);
          }
          id v54 = v49;
          AnalyticsSendEventLazy();
        }
        uint64_t v51 = [v54 countByEnumeratingWithState:&v60 objects:v136 count:16];
      }
      while (v51);
    }

    id v9 = v58;
    goto LABEL_47;
  }
  obuint64_t j = PLLogCommon();
  if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v141 = v12;
    __int16 v142 = 2048;
    unint64_t v143 = v14;
    _os_log_debug_impl(&dword_1D2690000, obj, OS_LOG_TYPE_DEBUG, "Don't Log Coalition Memory Stats to CA, since same day as most recent logging (current_day=%llu is less then or equal to most_recent_day=%llu)", buf, 0x16u);
  }
LABEL_47:
}

void *__87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke()
{
  return &unk_1F29EA698;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_506(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v3 = [*(id *)(a1 + 32) isDaemonXPCService];
  mach_port_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    CFDictionaryRef v5 = [v4 processName];
    if (v5)
    {
      double v6 = [*(id *)(a1 + 32) processName];
      [v2 setObject:v6 forKeyedSubscript:@"daemon_procname"];
    }
    else
    {
      [v2 setObject:@"UNKNOWN" forKeyedSubscript:@"daemon_procname"];
    }

    id v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "jetsam_priority"));
    [v2 setObject:v9 forKeyedSubscript:@"daemon_jetsam_priority"];

    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "process_active"));
    [v2 setObject:v10 forKeyedSubscript:@"daemon_active"];

    double v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "phys_footprint_size") >> 10);
    [v2 setObject:v11 forKeyedSubscript:@"daemon_footprint"];

    unint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "peak_phys_footprint") >> 10);
    [v2 setObject:v12 forKeyedSubscript:@"daemon_peak_footprint"];

    int v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "interval_peak_phys_footprint") >> 10);
    [v2 setObject:v13 forKeyedSubscript:@"daemon_interval_peak_footprint"];

    unint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "neural_footprint") >> 10);
    [v2 setObject:v14 forKeyedSubscript:@"daemon_neural_footprint_kb"];

    uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "interval_peak_neural_footprint") >> 10);
    [v2 setObject:v15 forKeyedSubscript:@"daemon_interval_peak_neural_footprint_kb"];

    id v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "memoryLimitMB"));
    [v2 setObject:v16 forKeyedSubscript:@"daemon_memory_limit_mb"];

    double v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isLimitHard"));
    [v2 setObject:v17 forKeyedSubscript:@"daemon_memory_limit_hard"];

    signed int v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isActiveLimit"));
    [v2 setObject:v18 forKeyedSubscript:@"daemon_memory_limit_active"];

    uint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isLimitIncreased"));
    [v2 setObject:v19 forKeyedSubscript:@"daemon_memory_limit_increased"];

    uint64_t v20 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    uint64_t v21 = @"daemon_footprint_over_limit";
  }
  else
  {
    BOOL v7 = [v4 bundleId];
    if (v7)
    {
      int v8 = [*(id *)(a1 + 32) bundleId];
      [v2 setObject:v8 forKeyedSubscript:@"app_bundleid"];
    }
    else
    {
      [v2 setObject:@"UNKNOWN" forKeyedSubscript:@"app_bundleid"];
    }

    unint64_t v22 = [*(id *)(a1 + 32) bundleVersion];
    if (v22)
    {
      BOOL v23 = [*(id *)(a1 + 32) bundleVersion];
      [v2 setObject:v23 forKeyedSubscript:@"app_bundleversion"];
    }
    else
    {
      [v2 setObject:@"UNKNOWN" forKeyedSubscript:@"app_bundleversion"];
    }

    id v24 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "jetsam_priority"));
    [v2 setObject:v24 forKeyedSubscript:@"app_jetsam_priority"];

    unint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "phys_footprint_size") >> 10);
    [v2 setObject:v25 forKeyedSubscript:@"app_footprint"];

    double v26 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "peak_phys_footprint") >> 10);
    [v2 setObject:v26 forKeyedSubscript:@"app_peak_footprint"];

    int v27 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "interval_peak_phys_footprint") >> 10);
    [v2 setObject:v27 forKeyedSubscript:@"app_interval_peak_footprint"];

    uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "neural_footprint") >> 10);
    [v2 setObject:v28 forKeyedSubscript:@"app_neural_footprint_kb"];

    uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "interval_peak_neural_footprint") >> 10);
    [v2 setObject:v29 forKeyedSubscript:@"app_interval_peak_neural_footprint_kb"];

    uint64_t v30 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "memoryLimitMB"));
    [v2 setObject:v30 forKeyedSubscript:@"app_memory_limit_mb"];

    double v31 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isLimitHard"));
    [v2 setObject:v31 forKeyedSubscript:@"app_memory_limit_hard"];

    uint64_t v32 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isActiveLimit"));
    [v2 setObject:v32 forKeyedSubscript:@"app_memory_limit_active"];

    double v33 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isLimitIncreased"));
    [v2 setObject:v33 forKeyedSubscript:@"app_memory_limit_increased"];

    uint64_t v20 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    uint64_t v21 = @"app_footprint_over_limit";
  }
  [v2 setObject:v20 forKeyedSubscript:v21];

  return v2;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F92A88];
  int v3 = [*(id *)(a1 + 32) processLaunchdName];
  mach_port_t v4 = objc_msgSend(v2, "intervalPeakCADictionaryForLaunchdName:intervalMaxKB:", v3, (unint64_t)objc_msgSend(*(id *)(a1 + 32), "interval_peak_phys_footprint") >> 10);

  return v4;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_3(uint64_t a1)
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v14[0] = @"launchd_name";
  uint64_t v2 = [*(id *)(a1 + 32) processLaunchdName];
  int v3 = (void *)v2;
  if (v2) {
    mach_port_t v4 = (__CFString *)v2;
  }
  else {
    mach_port_t v4 = @"UNKNOWN";
  }
  v15[0] = v4;
  v14[1] = @"procname";
  uint64_t v5 = [*(id *)(a1 + 32) processName];
  double v6 = (void *)v5;
  if (v5) {
    BOOL v7 = (__CFString *)v5;
  }
  else {
    BOOL v7 = @"UNKNOWN";
  }
  v15[1] = v7;
  void v14[2] = @"bundleid";
  uint64_t v8 = [*(id *)(a1 + 32) bundleId];
  id v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  else {
    uint64_t v10 = @"UNKNOWN";
  }
  v15[2] = v10;
  v14[3] = @"is_daemon_or_xpc_service";
  double v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isDaemonXPCService"));
  void v15[3] = v11;
  unint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];

  return v12;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_4(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v3 = [*(id *)(a1 + 32) isDaemonXPCService];
  mach_port_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [v4 processName];
    if (v5)
    {
      double v6 = [*(id *)(a1 + 32) processName];
      [v2 setObject:v6 forKeyedSubscript:@"daemon_procname"];
    }
    else
    {
      [v2 setObject:@"UNKNOWN" forKeyedSubscript:@"daemon_procname"];
    }

    id v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "jetsam_priority"));
    [v2 setObject:v9 forKeyedSubscript:@"daemon_jetsam_priority"];

    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "process_active"));
    [v2 setObject:v10 forKeyedSubscript:@"daemon_active"];

    double v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "phys_footprint_size") >> 10);
    [v2 setObject:v11 forKeyedSubscript:@"daemon_footprint_kb"];

    unint64_t v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    int v13 = @"daemon_footprint_over_limit";
  }
  else
  {
    BOOL v7 = [v4 bundleId];
    if (v7)
    {
      uint64_t v8 = [*(id *)(a1 + 32) bundleId];
      [v2 setObject:v8 forKeyedSubscript:@"app_bundleid"];
    }
    else
    {
      [v2 setObject:@"UNKNOWN" forKeyedSubscript:@"app_bundleid"];
    }

    unint64_t v14 = [*(id *)(a1 + 32) bundleVersion];
    if (v14)
    {
      uint64_t v15 = [*(id *)(a1 + 32) bundleVersion];
      [v2 setObject:v15 forKeyedSubscript:@"app_bundleversion"];
    }
    else
    {
      [v2 setObject:@"UNKNOWN" forKeyedSubscript:@"app_bundleversion"];
    }

    id v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "jetsam_priority"));
    [v2 setObject:v16 forKeyedSubscript:@"app_jetsam_priority"];

    double v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "phys_footprint_size") >> 10);
    [v2 setObject:v17 forKeyedSubscript:@"app_footprint_kb"];

    unint64_t v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    int v13 = @"app_footprint_over_limit";
  }
  [v2 setObject:v12 forKeyedSubscript:v13];

  return v2;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_5(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v3 = [*(id *)(a1 + 32) isDaemonXPCService];
  mach_port_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [v4 processName];
    if (v5)
    {
      double v6 = [*(id *)(a1 + 32) processName];
      [v2 setObject:v6 forKeyedSubscript:@"daemon_procname"];
    }
    else
    {
      [v2 setObject:@"UNKNOWN" forKeyedSubscript:@"daemon_procname"];
    }

    id v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "jetsam_priority"));
    [v2 setObject:v9 forKeyedSubscript:@"daemon_jetsam_priority"];

    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "process_active"));
    [v2 setObject:v10 forKeyedSubscript:@"daemon_active"];

    double v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "neural_footprint") >> 10);
    unint64_t v12 = @"daemon_neural_footprint_kb";
  }
  else
  {
    BOOL v7 = [v4 bundleId];
    if (v7)
    {
      uint64_t v8 = [*(id *)(a1 + 32) bundleId];
      [v2 setObject:v8 forKeyedSubscript:@"app_bundleid"];
    }
    else
    {
      [v2 setObject:@"UNKNOWN" forKeyedSubscript:@"app_bundleid"];
    }

    int v13 = [*(id *)(a1 + 32) bundleVersion];
    if (v13)
    {
      unint64_t v14 = [*(id *)(a1 + 32) bundleVersion];
      [v2 setObject:v14 forKeyedSubscript:@"app_bundleversion"];
    }
    else
    {
      [v2 setObject:@"UNKNOWN" forKeyedSubscript:@"app_bundleversion"];
    }

    uint64_t v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "jetsam_priority"));
    [v2 setObject:v15 forKeyedSubscript:@"app_jetsam_priority"];

    double v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "neural_footprint") >> 10);
    unint64_t v12 = @"app_neural_footprint_kb";
  }
  [v2 setObject:v11 forKeyedSubscript:v12];

  return v2;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_6(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  unint64_t v3 = [v2 unsignedLongValue];

  v9[0] = *(void *)(a1 + 40);
  v8[0] = @"at_priority";
  v8[1] = @"footprint_sum_kb";
  mach_port_t v4 = [NSNumber numberWithUnsignedLongLong:v3 >> 10];
  v9[1] = v4;
  v8[2] = @"system_uptime_hours";
  uint64_t v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v9[2] = v5;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_7(uint64_t a1)
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  unint64_t v3 = [v2 unsignedLongValue];

  mach_port_t v4 = [NSString stringWithFormat:@"priority%@", *(void *)(a1 + 40), @"memory_type"];
  v10[0] = v4;
  v9[1] = @"memory_kb";
  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:v3 >> 10];
  v10[1] = v5;
  v9[2] = @"system_uptime_hours";
  double v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  void v10[2] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_8(uint64_t a1)
{
  void v9[3] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  unint64_t v3 = [v2 unsignedLongValue];

  v9[0] = *(void *)(a1 + 40);
  v8[0] = @"at_or_above_priority";
  v8[1] = @"footprint_sum_kb";
  mach_port_t v4 = [NSNumber numberWithUnsignedLongLong:v3 >> 10];
  v9[1] = v4;
  v8[2] = @"system_uptime_hours";
  uint64_t v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v9[2] = v5;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_9(uint64_t a1)
{
  void v9[3] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  unint64_t v3 = [v2 unsignedLongValue];

  v9[0] = *(void *)(a1 + 40);
  v8[0] = @"at_or_below_priority";
  v8[1] = @"footprint_sum_kb";
  mach_port_t v4 = [NSNumber numberWithUnsignedLongLong:v3 >> 10];
  v9[1] = v4;
  v8[2] = @"system_uptime_hours";
  uint64_t v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v9[2] = v5;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_10(uint64_t a1)
{
  v1 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(a1 + 32)];
  [v1 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"footprints_report"];
  return v1;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_11(uint64_t a1)
{
  void v9[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  v9[0] = v3;
  v8[0] = @"memory_type";
  v8[1] = @"memory_kb";
  mach_port_t v4 = objc_msgSend(v2, "objectForKeyedSubscript:");
  v9[1] = v4;
  v8[2] = @"system_uptime_hours";
  uint64_t v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v9[2] = v5;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (id)processMemoryUsageWithPid:(int)a3 withLaunchdName:(id)a4 withRusage:(void *)a5 withJetsamInfo:(void *)a6 withLimitInfo:(process_memory_limit_info *)a7
{
  uint64_t v10 = *(void *)&a3;
  id v11 = a4;
  unint64_t v12 = objc_alloc_init(ProcessMemoryUsage);
  [(ProcessMemoryUsage *)v12 setPhys_footprint_size:*((void *)a5 + 9)];
  [(ProcessMemoryUsage *)v12 setPeak_phys_footprint:*((void *)a5 + 30)];
  [(ProcessMemoryUsage *)v12 setInterval_peak_phys_footprint:*((void *)a5 + 35)];
  [(ProcessMemoryUsage *)v12 setNeural_footprint:*((void *)a5 + 46)];
  [(ProcessMemoryUsage *)v12 setInterval_peak_neural_footprint:*((void *)a5 + 48)];
  [(ProcessMemoryUsage *)v12 setJetsam_priority:*(unsigned int *)a6];
  [(ProcessMemoryUsage *)v12 setProcess_active:*((unsigned __int8 *)a6 + 4)];
  [(ProcessMemoryUsage *)v12 setMemoryLimitMB:a7->var0];
  [(ProcessMemoryUsage *)v12 setIsLimitHard:a7->var1];
  [(ProcessMemoryUsage *)v12 setIsActiveLimit:a7->var2];
  [(ProcessMemoryUsage *)v12 setIsLimitIncreased:a7->var3];
  -[ProcessMemoryUsage setIsDaemonXPCService:](v12, "setIsDaemonXPCService:", [MEMORY[0x1E4F92A88] isDaemonOrAppleXPCService:v10]);
  if ([(ProcessMemoryUsage *)v12 isDaemonXPCService])
  {
    int v13 = [MEMORY[0x1E4F92A88] binaryPathForPid:v10];
    unint64_t v14 = [v13 lastPathComponent];
    [(ProcessMemoryUsage *)v12 setProcessName:v14];
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F92A88] bundleIDFromPid:v10];
    [(ProcessMemoryUsage *)v12 setBundleId:v15];

    id v16 = [(ProcessMemoryUsage *)v12 bundleId];

    if (v16)
    {
      [(ProcessMemoryUsage *)v12 setBundleVersion:0];
      double v17 = [(ProcessMemoryUsage *)v12 bundleId];
      signed int v18 = +[PLApplicationAgent appVersionForBundle:v17];
      [(ProcessMemoryUsage *)v12 setBundleVersion:v18];

      uint64_t v19 = [(ProcessMemoryUsage *)v12 bundleVersion];

      if (v19) {
        goto LABEL_8;
      }
      uint64_t v20 = (void *)MEMORY[0x1E4F92A88];
      int v13 = [MEMORY[0x1E4F92A88] binaryPathForPid:v10];
      unint64_t v14 = [v20 bundleVersionFromURL:v13];
      [(ProcessMemoryUsage *)v12 setBundleVersion:v14];
    }
    else
    {
      int v13 = [MEMORY[0x1E4F92A88] binaryPathForPid:v10];
      unint64_t v14 = [v13 lastPathComponent];
      [(ProcessMemoryUsage *)v12 setBundleId:v14];
    }
  }

LABEL_8:
  [(ProcessMemoryUsage *)v12 setProcessLaunchdName:v11];

  return v12;
}

- (void)logCoalitionObjectMemory:(id)a3 shouldLogBatteryTableCadence:(BOOL)a4
{
  kern_return_t v70;
  kern_return_t v71;
  NSObject *v72;
  kern_return_t v73;
  kern_return_t v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  __CFString *v83;
  NSDate *reportMemoryStatsAfterTime;
  __CFString *v85;
  NSDate *reportHighFrequencyMemoryStatsAfterTime;
  __uint64_t v87;
  NSComparisonResult v88;
  BOOL v89;
  void *v90;
  void *v91;
  OverallMemoryUsage *v92;
  NSComparisonResult v93;
  id v94;
  uint64_t v95;
  void *v96;
  PLCoalitionAgent *v97;
  id v98;
  uint64_t v99;
  void *obj;
  long long v101;
  long long v102;
  long long v103;
  long long v104;
  mach_port_name_t tn[2];
  uint64_t v106;
  _OWORD v107[2];
  uint64_t v108;
  void *v109;
  void *v110;
  uint8_t v111[128];
  uint8_t v112[8];
  __int16 v113;
  int v114;
  uint8_t buf[16];
  long long v116;
  long long v117;
  long long v118;
  long long v119;
  long long v120;
  long long v121;
  long long v122;
  long long v123;
  long long v124;
  long long v125;
  long long v126;
  long long v127;
  long long v128;
  long long v129;
  long long v130;
  long long v131;
  long long v132;
  long long v133;
  long long v134;
  long long v135;
  _OWORD v136[2];
  int v137;
  rusage_info_t v138[4];
  long long v139;
  long long v140;
  long long v141;
  long long v142;
  long long v143;
  long long v144;
  long long v145;
  long long v146;
  long long v147;
  long long v148;
  long long v149;
  long long v150;
  long long v151;
  long long v152;
  long long v153;
  long long v154;
  long long v155;
  long long v156;
  long long v157;
  long long v158;
  long long v159;
  long long v160;
  long long v161;
  long long v162;
  long long v163;
  long long v164;
  long long v165;
  _OWORD buffer[12];
  uint64_t v167;

  BOOL v4 = a4;
  v167 = *MEMORY[0x1E4F143B8];
  uint64_t v98 = a3;
  double v6 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  NSComparisonResult v7 = [(NSDate *)self->_reportMemoryStatsAfterTime compare:v6];
  int v97 = self;
  NSComparisonResult v8 = [(NSDate *)self->_reportHighFrequencyMemoryStatsAfterTime compare:v6];
  id v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v83 = @"Not";
    reportMemoryStatsAfterTime = v97->_reportMemoryStatsAfterTime;
    LODWORD(v138[0]) = 138412802;
    if (v7 == NSOrderedAscending) {
      v83 = &stru_1F294E108;
    }
    *(rusage_info_t *)((char *)v138 + 4) = v83;
    WORD2(v138[1]) = 2112;
    *(rusage_info_t *)((char *)&v138[1] + 6) = v6;
    HIWORD(v138[2]) = 2112;
    v138[3] = reportMemoryStatsAfterTime;
    _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "Should %@ Log to CoreAnalytics (current_time=%@ is greater than report_stats_time=%@)", (uint8_t *)v138, 0x20u);
  }

  uint64_t v10 = PLLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v85 = @"Not";
    reportHighFrequencyMemoryStatsAfterTime = v97->_reportHighFrequencyMemoryStatsAfterTime;
    LODWORD(v138[0]) = 138412802;
    if (v8 == NSOrderedAscending) {
      uint64_t v85 = &stru_1F294E108;
    }
    *(rusage_info_t *)((char *)v138 + 4) = v85;
    WORD2(v138[1]) = 2112;
    *(rusage_info_t *)((char *)&v138[1] + 6) = v6;
    HIWORD(v138[2]) = 2112;
    v138[3] = reportHighFrequencyMemoryStatsAfterTime;
    _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "Should %@ Log to High Frequency CoreAnalytics (current_time=%@ is greater than high_freq_report_stats_time=%@)", (uint8_t *)v138, 0x20u);
  }

  if (([MEMORY[0x1E4F929C0] isTaskFullEPLMode] & 1) != 0
    || ([MEMORY[0x1E4F92A38] hasGenerativeModelSystems] & 1) != 0
    || (v7 != NSOrderedAscending ? (BOOL v11 = v8 == NSOrderedAscending) : (BOOL v11 = 1), v11))
  {
    unsigned int v12 = proc_listpids(1u, 0, 0, 0);
    if ((v12 & 0x80000000) == 0)
    {
      int v13 = v12;
      size_t v14 = v12;
      uint64_t v15 = malloc_type_malloc(v12, 0x3E96A3EDuLL);
      if (v15)
      {
        id v16 = v15;
        v93 = v8;
        long long v89 = v4;
        long long v90 = v6;
        memset(v15, 255, v14);
        id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v94 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v87 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
        uint64_t v91 = v16;
        uint64_t v92 = objc_alloc_init(OverallMemoryUsage);
        int v18 = proc_listpids(1u, 0, v16, v13);
        uint64_t v96 = v17;
        if (v18 >= 4)
        {
          BOOL v51 = v7 == NSOrderedAscending || v8 == NSOrderedAscending;
          if ((unint64_t)v18 >> 2 <= 1) {
            unint64_t v52 = 1;
          }
          else {
            unint64_t v52 = (unint64_t)v18 >> 2;
          }
          unint64_t v53 = (int *)v16;
          do
          {
            int v55 = *v53++;
            uint64_t v54 = v55;
            if (v55 >= 1)
            {
              memset(buffer, 0, sizeof(buffer));
              if (proc_pidinfo(v54, 18, 0, buffer, 192) == 192 && DWORD1(buffer[0]) != 5)
              {
                long long v108 = 0;
                memset(v107, 0, sizeof(v107));
                if (proc_pidinfo(v54, 20, 1uLL, v107, 40) == 40)
                {
                  uint64_t v56 = *(void *)&v107[0];
                  uint64_t v57 = [NSNumber numberWithUnsignedLongLong:*(void *)&v107[0]];
                  unint64_t v58 = [v17 objectForKeyedSubscript:v57];

                  if (!v58)
                  {
                    unint64_t v58 = objc_alloc_init(CoalitionMemoryUsage);
                    v59 = [NSNumber numberWithUnsignedLongLong:v56];
                    [v17 setObject:v58 forKeyedSubscript:v59];
                  }
                  long long v106 = 0;
                  if (v51) {
                    long long v106 = [MEMORY[0x1E4F92A88] getProcessMemoryLimit:v54];
                  }
                  v165 = 0u;
                  v164 = 0u;
                  v163 = 0u;
                  v162 = 0u;
                  v161 = 0u;
                  v160 = 0u;
                  v159 = 0u;
                  v158 = 0u;
                  v157 = 0u;
                  v156 = 0u;
                  v155 = 0u;
                  v154 = 0u;
                  v153 = 0u;
                  v152 = 0u;
                  v151 = 0u;
                  v149 = 0u;
                  v150 = 0u;
                  v147 = 0u;
                  v148 = 0u;
                  v145 = 0u;
                  v146 = 0u;
                  unint64_t v143 = 0u;
                  uint64_t v144 = 0u;
                  uint64_t v141 = 0u;
                  __int16 v142 = 0u;
                  v139 = 0u;
                  v140 = 0u;
                  memset(v138, 0, sizeof(v138));
                  int v60 = proc_pid_rusage(v54, 6, v138);
                  if (v60)
                  {
                    int v61 = v60;
                    long long v62 = PLLogCommon();
                    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)&uint8_t buf[4] = v61;
                      *(_WORD *)&buf[8] = 1024;
                      *(_DWORD *)&buf[10] = v54;
                      _os_log_error_impl(&dword_1D2690000, v62, OS_LOG_TYPE_ERROR, "rusage failed with %d for pid %d", buf, 0xEu);
                    }
                  }
                  else
                  {
                    if (v7 == NSOrderedAscending)
                    {
                      uint64_t service_name_from_pid = xpc_get_service_name_from_pid();
                      if (service_name_from_pid)
                      {
                        uint64_t v64 = (void *)service_name_from_pid;
                        long long v62 = [NSString stringWithUTF8String:service_name_from_pid];
                        free(v64);
                      }
                      else
                      {
                        long long v62 = 0;
                      }
                      int v65 = proc_reset_footprint_interval();
                      if (v65)
                      {
                        int v66 = v65;
                        long long v67 = PLLogCommon();
                        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 67109376;
                          *(_DWORD *)&uint8_t buf[4] = v66;
                          *(_WORD *)&buf[8] = 1024;
                          *(_DWORD *)&buf[10] = v54;
                          _os_log_debug_impl(&dword_1D2690000, v67, OS_LOG_TYPE_DEBUG, "proc_reset_footprint_interval failed with %d for pid %d", buf, 0xEu);
                        }
                      }
                    }
                    else
                    {
                      long long v62 = 0;
                    }
                    uint64_t v68 = [(CoalitionMemoryUsage *)v58 wired_size];
                    [(CoalitionMemoryUsage *)v58 setWired_size:*((void *)&v140 + 1) + v68];
                    uint64_t v69 = [(CoalitionMemoryUsage *)v58 phys_footprint_size];
                    [(CoalitionMemoryUsage *)v58 setPhys_footprint_size:*((void *)&v141 + 1) + v69];
                    [(CoalitionMemoryUsage *)v58 setProcess_phys_footprint_size:*((void *)&v141 + 1)];
                    [(CoalitionMemoryUsage *)v58 setProcess_peak_phys_footprint:(void)v152];
                    [(CoalitionMemoryUsage *)v58 setProcess_count:[(CoalitionMemoryUsage *)v58 process_count] + 1];
                    *(void *)tn = 0;
                    v137 = 0;
                    memset(v136, 0, sizeof(v136));
                    id v134 = 0u;
                    BOOL v135 = 0u;
                    v132 = 0u;
                    v133 = 0u;
                    uint64_t v130 = 0u;
                    uint64_t v131 = 0u;
                    v128 = 0u;
                    id v129 = 0u;
                    uint64_t v126 = 0u;
                    v127 = 0u;
                    id v124 = 0u;
                    uint64_t v125 = 0u;
                    v122 = 0u;
                    v123 = 0u;
                    uint64_t v120 = 0u;
                    uint64_t v121 = 0u;
                    id v118 = 0u;
                    BOOL v119 = 0u;
                    v116 = 0u;
                    v117 = 0u;
                    *(_OWORD *)buf = 0u;
                    uint64_t v70 = task_name_for_pid(*MEMORY[0x1E4F14960], v54, &tn[1]);
                    if (v70)
                    {
                      v71 = v70;
                      v72 = PLLogCommon();
                      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v112 = 67109376;
                        *(_DWORD *)&v112[4] = v71;
                        id v113 = 1024;
                        uint64_t v114 = v54;
                        _os_log_error_impl(&dword_1D2690000, v72, OS_LOG_TYPE_ERROR, "task_name_for_pid failed with %d for pid %d", v112, 0xEu);
                      }
                    }
                    else
                    {
                      tn[0] = 93;
                      id v73 = task_info(tn[1], 0x17u, (task_info_t)buf, tn);
                      if (v73)
                      {
                        uint64_t v74 = v73;
                        int v75 = PLLogCommon();
                        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)v112 = 67109376;
                          *(_DWORD *)&v112[4] = v74;
                          id v113 = 1024;
                          uint64_t v114 = v54;
                          _os_log_error_impl(&dword_1D2690000, v75, OS_LOG_TYPE_ERROR, "task_info failed with %d for pid %d", v112, 0xEu);
                        }
                      }
                      else
                      {
                        long long v76 = [(CoalitionMemoryUsage *)v58 purgeable_size];
                        [(CoalitionMemoryUsage *)v58 setPurgeable_size:*((void *)&v121 + 1) + v76];
                        long long v77 = [(CoalitionMemoryUsage *)v58 compressed_size];
                        [(CoalitionMemoryUsage *)v58 setCompressed_size:*((void *)&v122 + 1) + v77];
                        long long v78 = [(CoalitionMemoryUsage *)v58 compressed_lifetime];
                        [(CoalitionMemoryUsage *)v58 setCompressed_lifetime:*((void *)&v123 + 1) + v78];
                        [(CoalitionMemoryUsage *)v58 setLedger_swapins:*(void *)((char *)v136 + 12) + [(CoalitionMemoryUsage *)v58 ledger_swapins]];
                      }
                      mach_port_deallocate(*MEMORY[0x1E4F14960], tn[1]);
                    }
                    id v17 = v96;
                    *(void *)v112 = 0;
                    *(void *)v112 = [MEMORY[0x1E4F92A88] getJetamPriority:v54];
                    [(CoalitionMemoryUsage *)v58 setProcess_jetsam_priority:*(void *)v112];
                    if (v7 == NSOrderedAscending || v93 == NSOrderedAscending || !*(_DWORD *)v112)
                    {
                      long long v79 = [MEMORY[0x1E4F92A88] cleanLaunchdName:v62];
                      uint64_t v80 = [(PLCoalitionAgent *)v97 processMemoryUsageWithPid:v54 withLaunchdName:v79 withRusage:v138 withJetsamInfo:v112 withLimitInfo:&v106];

                      [v94 addObject:v80];
                      -[OverallMemoryUsage addProcessFootprint:withPriority:](v92, "addProcessFootprint:withPriority:", objc_msgSend(v80, "phys_footprint_size"), objc_msgSend(v80, "jetsam_priority"));

                      id v17 = v96;
                    }
                  }
                }
              }
            }
            --v52;
          }
          while (v52);
        }
        long long v88 = v7;
        uint64_t v19 = objc_opt_new();
        v101 = 0u;
        v102 = 0u;
        uint64_t v103 = 0u;
        int v104 = 0u;
        obuint64_t j = [v17 allKeys];
        uint64_t v20 = [obj countByEnumeratingWithState:&v101 objects:v111 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v102;
          v95 = *MEMORY[0x1E4F92D48];
          do
          {
            uint64_t v23 = 0;
            uint64_t v99 = v21;
            do
            {
              if (*(void *)v102 != v22) {
                objc_enumerationMutation(obj);
              }
              uint64_t v24 = *(void *)(*((void *)&v101 + 1) + 8 * v23);
              unint64_t v25 = [v17 objectForKeyedSubscript:v24];
              if ((unint64_t)objc_msgSend(v25, "phys_footprint_size") >= 0xE4E1C0)
              {
                double v26 = v19;
                int v27 = [v98 objectForKeyedSubscript:v24];
                id v28 = objc_alloc(MEMORY[0x1E4F929D0]);
                uint64_t v29 = +[PLOperator entryKeyForType:v95 andName:@"CoalitionMemory"];
                uint64_t v30 = [(PLCoalitionAgent *)v97 currentDate];
                double v31 = (void *)[v28 initWithEntryKey:v29 withDate:v30];

                uint64_t v32 = [v27 bundleID];
                LODWORD(v29) = [v32 isEqualToString:&stru_1F294E108];

                if (v29)
                {
                  double v33 = [v27 launchdName];
                  if (v33)
                  {
                    id v34 = [v27 launchdName];
                    [v31 setObject:v34 forKeyedSubscript:@"LaunchdName"];

LABEL_25:
                    [v31 setObject:v24 forKeyedSubscript:@"LaunchdCoalitionId"];
                    uint64_t v37 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v25, "wired_size"));
                    [v31 setObject:v37 forKeyedSubscript:@"memory_wired_size"];

                    double v38 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v25, "purgeable_size"));
                    [v31 setObject:v38 forKeyedSubscript:@"memory_purgeable_size"];

                    uint64_t v39 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v25, "phys_footprint_size"));
                    [v31 setObject:v39 forKeyedSubscript:@"memory_anonmem_size"];

                    id v40 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v25, "compressed_size"));
                    [v31 setObject:v40 forKeyedSubscript:@"memory_compressed_size"];

                    id v41 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v25, "process_count"));
                    [v31 setObject:v41 forKeyedSubscript:@"process_count"];

                    uint64_t v42 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v25, "process_phys_footprint_size"));
                    [v31 setObject:v42 forKeyedSubscript:@"process_phys_footprint"];

                    uint64_t v43 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v25, "process_peak_phys_footprint"));
                    [v31 setObject:v43 forKeyedSubscript:@"peak_phys_footprint"];

                    uint64_t v44 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v25, "compressed_lifetime"));
                    [v31 setObject:v44 forKeyedSubscript:@"CompressedLifetime"];

                    double v45 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v25, "ledger_swapins"));
                    [v31 setObject:v45 forKeyedSubscript:@"Swapins"];

                    uint64_t v19 = v26;
                    [v26 addObject:v31];

                    id v17 = v96;
                    uint64_t v21 = v99;
                    goto LABEL_26;
                  }
                  uint64_t v35 = v31;
                  uint64_t v36 = @"Unnamed_launchdName";
                }
                else
                {
                  double v33 = [v27 bundleID];
                  uint64_t v35 = v31;
                  uint64_t v36 = v33;
                }
                [v35 setObject:v36 forKeyedSubscript:@"LaunchdName"];
                goto LABEL_25;
              }
LABEL_26:

              ++v23;
            }
            while (v21 != v23);
            uint64_t v21 = [obj countByEnumeratingWithState:&v101 objects:v111 count:16];
          }
          while (v21);
        }

        double v6 = v90;
        if (v88 == NSOrderedAscending || v93 == NSOrderedAscending)
        {
          if (v88 == NSOrderedAscending)
          {
            uint64_t v46 = [MEMORY[0x1E4F1C9C8] distantFuture];
            id v47 = v97->_reportMemoryStatsAfterTime;
            v97->_reportMemoryStatsAfterTime = (NSDate *)v46;
          }
          uint64_t v48 = [v90 dateByAddingTimeInterval:(double)arc4random_uniform(0xE10u) + 1800.0];
          id v49 = v97->_reportHighFrequencyMemoryStatsAfterTime;
          v97->_reportHighFrequencyMemoryStatsAfterTime = (NSDate *)v48;

          [(PLCoalitionAgent *)v97 logToCAProcessMemory:v94 andAccumulatedMemory:v92 dailyReport:v88 == NSOrderedAscending systemUptime:v87];
        }
        if (v89)
        {
          [(PLCoalitionAgent *)v97 logPerJetsamPriorityTotalMemory:v92];
        }
        else
        {
          uint64_t v81 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"CoalitionMemory"];
          if ([v19 count])
          {
            uint64_t v109 = v81;
            uint64_t v110 = v19;
            v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
            [(PLOperator *)v97 logEntries:v82 withGroupID:v81];
          }
        }
        free(v91);
      }
    }
  }
}

- (void)logPerJetsamPriorityTotalMemory:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  double v6 = +[PLOperator entryKeyForType:v4 andName:@"totalMemoryPerJetsamPriority"];
  NSComparisonResult v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
  NSComparisonResult v8 = [v5 memoryUsageAtEachPriority];

  id v9 = PLLogCoalition();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138412290;
    unint64_t v18 = (unint64_t)v8;
    _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "memory reporting totalMemoryByPriority: %@", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v10 = PLLogCoalition();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = [v8 objectForKeyedSubscript:&unk_1F29E6628];
    uint64_t v16 = [v15 unsignedLongValue];
    int v17 = 134217984;
    unint64_t v18 = v16;
    _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "memory reporting for priority 0 before KB conversion: %ld", (uint8_t *)&v17, 0xCu);
  }
  BOOL v11 = [v8 objectForKeyedSubscript:&unk_1F29E6628];
  unint64_t v12 = (unint64_t)[v11 unsignedLongValue] >> 10;

  int v13 = PLLogCoalition();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 134217984;
    unint64_t v18 = v12;
    _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "memory reporting for priority 0 : %lld", (uint8_t *)&v17, 0xCu);
  }

  size_t v14 = [NSNumber numberWithUnsignedLongLong:v12];
  [v7 setObject:v14 forKeyedSubscript:@"footprintSum"];

  [(PLOperator *)self logEntry:v7];
}

uint64_t __49__PLCoalitionAgent_logCoalitionObjectDifference___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_40 = result;
  return result;
}

uint64_t __49__PLCoalitionAgent_logCoalitionObjectDifference___block_invoke_763(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CA9 = result;
  return result;
}

- (double)getCPUVoucherTimeFromEntry:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"cpu_time"];
  [v4 doubleValue];
  double v6 = v5;
  NSComparisonResult v7 = [v3 objectForKeyedSubscript:@"cpu_time_billed_to_me"];
  [v7 doubleValue];
  double v9 = v6 + v8;
  uint64_t v10 = [v3 objectForKeyedSubscript:@"cpu_time_billed_to_others"];

  [v10 doubleValue];
  double v12 = v9 - v11;

  double result = 0.0;
  if (v12 >= 0.0) {
    return v12;
  }
  return result;
}

- (double)getGPUEnergyFromEntry:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"gpu_energy_nj"];
  [v4 doubleValue];
  double v6 = v5;
  NSComparisonResult v7 = [v3 objectForKeyedSubscript:@"gpu_energy_nj_billed_to_me"];
  [v7 doubleValue];
  double v9 = v6 + v8;
  uint64_t v10 = [v3 objectForKeyedSubscript:@"gpu_energy_nj_billed_to_others"];

  [v10 doubleValue];
  double v12 = v9 - v11;

  double result = 0.0;
  if (v12 >= 0.0) {
    return v12;
  }
  return result;
}

uint64_t __42__PLCoalitionAgent_getCPUWeightFromEntry___block_invoke()
{
  uint64_t result = objc_msgSend(MEMORY[0x1E4F92A38], "kPLSoCClassIsOneOf:", 1001003, 1001004, 1001005, 1001006, 1001007, 1001008, 1001009, 0);
  if (result) {
    byte_1EBD58CAA = 1;
  }
  return result;
}

uint64_t __42__PLCoalitionAgent_getGPUWeightFromEntry___block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] kPLSoCClassOfDevice];
  if ((int)result >= 1001021) {
    byte_1EBD58CAB = 1;
  }
  return result;
}

uint64_t __48__PLCoalitionAgent_getCoalitionInfoWithHFLFlag___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58CAC = result;
  return result;
}

- (id)processPerAppLogicalWritesWithInfo:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  double v5 = [MEMORY[0x1E4F1C9C8] nearestMidnightAfterDate:v4];
  double v6 = [v5 dateByAddingTimeInterval:-1209600.0];
  id v7 = v5;
  [v6 timeIntervalSince1970];
  double v9 = v8;
  [v7 timeIntervalSince1970];
  double v11 = v10;

  double v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"NANDStats"];
  int v13 = [(PLOperator *)self storage];
  size_t v14 = objc_msgSend(v13, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v12, 86400.0, v9, v11 - v9);

  uint64_t v15 = [v31 objectForKeyedSubscript:@"LogicalWriteThresholdPerDay"];
  uint64_t v16 = [v15 unsignedIntegerValue];
  if (v16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 104857600;
  }

  unint64_t v18 = PLLogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "LogicalWriteThresholdPerDay: %lu", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v19 = [MEMORY[0x1E4F1CA80] set];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __55__PLCoalitionAgent_processPerAppLogicalWritesWithInfo___block_invoke;
  v40[3] = &unk_1E692E800;
  uint64_t v42 = v17;
  id v20 = v19;
  id v41 = v20;
  [v14 enumerateObjectsUsingBlock:v40];
  uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
  int v22 = 14;
  do
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
    [v21 addObject:v23];

    --v22;
  }
  while (v22);
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  int v39 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v46 = 0x3032000000;
  id v47 = __Block_byref_object_copy__9;
  uint64_t v48 = __Block_byref_object_dispose__9;
  id v49 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __55__PLCoalitionAgent_processPerAppLogicalWritesWithInfo___block_invoke_792;
  v32[3] = &unk_1E692E828;
  id v24 = v20;
  id v33 = v24;
  p_long long buf = &buf;
  uint64_t v37 = v38;
  id v25 = v6;
  id v34 = v25;
  id v26 = v21;
  id v35 = v26;
  [v14 enumerateObjectsUsingBlock:v32];
  v43[0] = @"responseStartTimestamp";
  int v27 = NSNumber;
  [v25 timeIntervalSince1970];
  id v28 = objc_msgSend(v27, "numberWithDouble:");
  v43[1] = @"queryResultsPerDay";
  v44[0] = v28;
  v44[1] = v26;
  uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(v38, 8);

  return v29;
}

void __55__PLCoalitionAgent_processPerAppLogicalWritesWithInfo___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 objectForKeyedSubscript:@"BundleId"];
  char v4 = [v3 hasPrefix:@"Unspecified"];

  if ((v4 & 1) == 0)
  {
    double v5 = [v10 objectForKeyedSubscript:@"LogicalWrites"];
    unint64_t v6 = [v5 unsignedIntegerValue];
    unint64_t v7 = *(void *)(a1 + 40);

    if (v6 > v7)
    {
      double v8 = *(void **)(a1 + 32);
      double v9 = [v10 objectForKeyedSubscript:@"BundleId"];
      [v8 addObject:v9];
    }
  }
}

void __55__PLCoalitionAgent_processPerAppLogicalWritesWithInfo___block_invoke_792(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = *(void **)(a1 + 32);
  id v16 = v3;
  double v5 = [v3 objectForKeyedSubscript:@"BundleId"];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    unint64_t v6 = [v16 entryDate];
    char v7 = [v6 isEqualToDate:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

    if ((v7 & 1) == 0)
    {
      double v8 = [v16 entryDate];
      double v9 = [v8 convertFromMonotonicToSystem];

      [v9 timeIntervalSinceDate:*(void *)(a1 + 40)];
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (int)((double)(int)v10 / 86400.0);
      if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) & 0x80000000) != 0)
      {
LABEL_6:

        goto LABEL_7;
      }
      uint64_t v11 = [v16 entryDate];
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
      int v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
    double v9 = [v16 objectForKeyedSubscript:@"LogicalWrites"];
    size_t v14 = [*(id *)(a1 + 48) objectAtIndexedSubscript:*(int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
    uint64_t v15 = [v16 objectForKeyedSubscript:@"BundleId"];
    [v14 setObject:v9 forKeyedSubscript:v15];

    goto LABEL_6;
  }
LABEL_7:
}

- (void)log
{
  [(PLCoalitionAgent *)self logEventIntervalCoalitionIntervalWithHFLFlag:0];
  id v3 = [(PLCoalitionAgent *)self lastCoalitionObjectDictionary];
  [(PLCoalitionAgent *)self logCoalitionObjectMemory:v3 shouldLogBatteryTableCadence:0];
}

- (void)logEventIntervalCoalitionIntervalWithoutHighFreqLogging
{
}

- (void)logAggregateNANDStatsWithInfo:(id)a3
{
  id v18 = a3;
  char v4 = [v18 objectForKeyedSubscript:@"logical_deferred_writes"];
  int v5 = [v4 intValue];
  unint64_t v6 = [v18 objectForKeyedSubscript:@"logical_immediate_writes"];
  int v7 = [v6 intValue] + v5;
  double v8 = [v18 objectForKeyedSubscript:@"logical_metadata_writes"];
  int v9 = v7 + [v8 intValue];
  double v10 = [v18 objectForKeyedSubscript:@"logical_invalidated_writes"];
  uint64_t v11 = v9 - [v10 intValue];

  if ((int)v11 >= 102400)
  {
    uint64_t v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"NANDStats"];
    id v13 = objc_alloc(MEMORY[0x1E4F929D0]);
    size_t v14 = [v18 entryDate];
    uint64_t v15 = (void *)[v13 initWithEntryKey:v12 withDate:v14];

    id v16 = [v18 objectForKeyedSubscript:@"LaunchdName"];
    [v15 setObject:v16 forKeyedSubscript:@"BundleId"];

    uint64_t v17 = [NSNumber numberWithInt:v11];
    [v15 setObject:v17 forKeyedSubscript:@"LogicalWrites"];

    [(PLOperator *)self logEntry:v15];
  }
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)batteryEntryLogged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBatteryEntryLogged:(id)a3
{
}

- (void)setDriveCapacity:(id)a3
{
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
}

- (PLXPCResponderOperatorComposition)logicalWritesResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLogicalWritesResponder:(id)a3
{
}

- (NSDate)reportMemoryStatsAfterTime
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setReportMemoryStatsAfterTime:(id)a3
{
}

- (NSDate)reportHighFrequencyMemoryStatsAfterTime
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setReportHighFrequencyMemoryStatsAfterTime:(id)a3
{
}

- (PLStateTrackingComposition)stateTracker
{
  return (PLStateTrackingComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setStateTracker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateTracker, 0);
  objc_storeStrong((id *)&self->_reportHighFrequencyMemoryStatsAfterTime, 0);
  objc_storeStrong((id *)&self->_reportMemoryStatsAfterTime, 0);
  objc_storeStrong((id *)&self->_logicalWritesResponder, 0);
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_driveCapacity, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_lastDate, 0);
  objc_storeStrong((id *)&self->_lastCoalitionObjectDictionary, 0);
  objc_storeStrong((id *)&self->_batteryEntryLogged, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
}

@end