@interface PLCLPCAgent
+ (id)entryEventIntervalDefinitionAccumulators;
+ (id)entryEventIntervalDefinitionCPUClusterAccumulators;
+ (id)entryEventIntervalDefinitionLostPerformance;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneAccumulatorsLookup;
+ (id)entryEventNoneCPUClusterAccumulatorsLookup;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventNoneLostPerformanceLookup;
+ (void)load;
- (BOOL)configureAccumulators;
- (BOOL)configureCPUClusterAccumulators;
- (BOOL)configureLostPerformance;
- (BOOL)setupStats;
- (CLPCReportingAccess)provider;
- (CLPCReportingReadResult)readResults;
- (CLPCReportingStatSelection)selection;
- (NSDate)lastEntryDate;
- (PLCLPCAgent)init;
- (PLNSNotificationOperatorComposition)thermalMonitorListener;
- (PLTimer)tenMinuteTimer;
- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4;
- (void)addToLookupTableAndCache:(unint64_t)a3 forEntryKey:(id)a4 andLookupMap:(id)a5;
- (void)constructCache:(id)a3 forEntryKey:(id)a4;
- (void)createLookupCache:(id)a3;
- (void)createLookupMaps;
- (void)initOperatorDependancies;
- (void)logCLPCCPUClusterAccumulators:(id)a3;
- (void)logCLPCLostPerformance:(id)a3;
- (void)logCLPCStatsAccumulators:(id)a3;
- (void)logLookupTable:(id)a3 withEntryKey:(id)a4;
- (void)setEntryKeys;
- (void)setLastEntryDate:(id)a3;
- (void)setProvider:(id)a3;
- (void)setReadResults:(id)a3;
- (void)setSelection:(id)a3;
- (void)setTenMinuteTimer:(id)a3;
- (void)setThermalMonitorListener:(id)a3;
- (void)setupThermalMonitor;
- (void)setupTimer;
@end

@implementation PLCLPCAgent

uint64_t __40__PLCLPCAgent_logCLPCStatsAccumulators___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2 == 1)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F92A20]);
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = [*(id *)(a1 + 40) lastEntryDate];
    v9 = (void *)[v6 initWithEntryKey:v7 withDate:v8];

    uint64_t v41 = a1;
    uint64_t v10 = *(void *)(a1 + 48);
    v11 = v9;
    [v9 setObject:v10 forKeyedSubscript:@"timestampEnd"];
    v12 = [v5 rows];
    v13 = [v12 objectAtIndexedSubscript:0];

    v15 = v5;
    if ([v13 count])
    {
      unint64_t v16 = 0;
      v42 = 0;
      *(void *)&long long v14 = 134217984;
      long long v40 = v14;
      do
      {
        v17 = objc_msgSend(v13, "objectAtIndexedSubscript:", v16, v40);
        uint64_t v18 = [v17 unsignedLongLongValue];

        if (v18)
        {
          v19 = [v15 schema];
          v20 = [v19 columns];
          v21 = [v20 objectAtIndexedSubscript:v16];
          uint64_t v22 = [v21 statID];

          if (v22 == 1)
          {
            v23 = [NSNumber numberWithUnsignedLongLong:v18];
            [v11 setObject:v23 forKeyedSubscript:@"APWakeTime"];
          }
          else
          {
            v24 = v15;
            v25 = v11;
            v26 = [v24 schema];
            v27 = [v26 columns];
            v28 = [v27 objectAtIndexedSubscript:v16];
            v29 = [v28 valueID];
            uint64_t v30 = [v29 unsignedLongLongValue];

            v31 = (void *)qword_1EBD5A1F0;
            v32 = [NSNumber numberWithUnsignedLongLong:v30];
            v33 = [v31 objectForKeyedSubscript:v32];

            if (!v33)
            {
              [*(id *)(v41 + 40) addToLookupTableAndCache:v30 forEntryKey:accumulatorsLookupEntryKey andLookupMap:qword_1EBD5A1F0];
              v34 = PLLogCLPC();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = v40;
                uint64_t v46 = v30;
                _os_log_fault_impl(&dword_1D2690000, v34, OS_LOG_TYPE_FAULT, "Missing Accumulators lookup entry for ID %llu:", buf, 0xCu);
              }
            }
            v43 = @"ObfuscatedID";
            v35 = (void *)qword_1EBD5A1F0;
            v36 = [NSNumber numberWithUnsignedLongLong:v30];
            v37 = [v35 objectForKeyedSubscript:v36];
            v44 = v37;
            uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];

            v23 = [NSNumber numberWithUnsignedLongLong:v18];
            v11 = v25;
            [v25 setObject:v23 forKeyedSubscript:v38];
            v42 = (void *)v38;
            v15 = v5;
          }
        }
        ++v16;
      }
      while ([v13 count] > v16);
    }
    else
    {
      v42 = 0;
    }
    [*(id *)(v41 + 40) logEntry:v11];

    id v5 = v15;
  }

  return 1;
}

uint64_t __45__PLCLPCAgent_logCLPCCPUClusterAccumulators___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (a2 == 3)
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = [v4 rows];
    uint64_t v45 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (!v45) {
      goto LABEL_27;
    }
    uint64_t v44 = *(void *)v51;
    *(void *)&long long v6 = 134217984;
    long long v42 = v6;
    while (1)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v51 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v46 = v7;
        v8 = *(void **)(*((void *)&v50 + 1) + 8 * v7);
        id v9 = objc_alloc(MEMORY[0x1E4F92A20]);
        uint64_t v10 = *(void *)(a1 + 32);
        v11 = [*(id *)(a1 + 40) lastEntryDate];
        v12 = (void *)[v9 initWithEntryKey:v10 withDate:v11];

        v49 = v12;
        [v12 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"timestampEnd"];
        if ([v8 count])
        {
          uint64_t v13 = 0;
          v48 = 0;
          while (1)
          {
            long long v14 = objc_msgSend(v8, "objectAtIndexedSubscript:", v13, v42);
            uint64_t v15 = [v14 unsignedLongLongValue];

            unint64_t v16 = [v5 schema];
            v17 = [v16 columns];
            uint64_t v18 = [v17 objectAtIndexedSubscript:v13];
            uint64_t v19 = [v18 type];

            v20 = [v5 schema];
            v21 = [v20 columns];
            uint64_t v22 = [v21 objectAtIndexedSubscript:v13];
            v23 = [v22 valueID];
            uint64_t v24 = [v23 unsignedLongLongValue];

            if (v19 == 2) {
              break;
            }
            if (v19 == 1)
            {
              v25 = [v5 schema];
              v26 = [v25 columns];
              v27 = [v26 objectAtIndexedSubscript:v13];
              uint64_t v28 = [v27 statID];

              if (v28 == 1)
              {
                v29 = [NSNumber numberWithUnsignedLongLong:v15];
                uint64_t v30 = v49;
                v31 = v29;
                v32 = @"APWakeTime";
                goto LABEL_14;
              }
              if (!v15) {
                goto LABEL_16;
              }
              v33 = (void *)qword_1EBD5A1F8;
              v34 = [NSNumber numberWithUnsignedLongLong:v24];
              v35 = [v33 objectForKeyedSubscript:v34];

              if (!v35)
              {
                [*(id *)(a1 + 40) addToLookupTableAndCache:v24 forEntryKey:cpuClusterAccumulatorsLookupEntryKey andLookupMap:qword_1EBD5A1F8];
                v36 = PLLogCLPC();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = v42;
                  uint64_t v57 = v24;
                  _os_log_fault_impl(&dword_1D2690000, v36, OS_LOG_TYPE_FAULT, "Missing CPU Cluster Accumulators lookup entry for ID %llu:", buf, 0xCu);
                }
              }
              v54 = @"ObfuscatedID";
              v37 = (void *)qword_1EBD5A1F8;
              uint64_t v38 = [NSNumber numberWithUnsignedLongLong:v24];
              v39 = [v37 objectForKeyedSubscript:v38];
              v55 = v39;
              uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];

              v29 = [NSNumber numberWithUnsignedLongLong:v15];
              [v49 setObject:v29 forKeyedSubscript:v40];
              v48 = (void *)v40;
LABEL_15:
            }
LABEL_16:
            if ([v8 count] <= (unint64_t)++v13) {
              goto LABEL_25;
            }
          }
          v29 = [NSNumber numberWithUnsignedLongLong:v15];
          uint64_t v30 = v49;
          v31 = v29;
          v32 = @"ClusterIndex";
LABEL_14:
          [v30 setObject:v31 forKeyedSubscript:v32];
          goto LABEL_15;
        }
        v48 = 0;
LABEL_25:
        objc_msgSend(*(id *)(a1 + 40), "logEntry:", v49, v42);

        uint64_t v7 = v46 + 1;
      }
      while (v46 + 1 != v45);
      uint64_t v45 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (!v45)
      {
LABEL_27:

        break;
      }
    }
  }

  return 1;
}

uint64_t __38__PLCLPCAgent_logCLPCLostPerformance___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (a2 == 4)
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v58 = v4;
    id obj = [v4 rows];
    uint64_t v52 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
    if (v52)
    {
      uint64_t v51 = *(void *)v60;
      unint64_t v6 = 0x1E4F28000uLL;
      *(void *)&long long v5 = 134217984;
      long long v49 = v5;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v60 != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v53 = v7;
          v8 = *(void **)(*((void *)&v59 + 1) + 8 * v7);
          id v9 = objc_alloc(MEMORY[0x1E4F92A20]);
          uint64_t v10 = *(void *)(a1 + 32);
          v11 = [*(id *)(a1 + 40) lastEntryDate];
          v12 = (void *)[v9 initWithEntryKey:v10 withDate:v11];

          v56 = v12;
          [v12 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"timestampEnd"];
          if ([v8 count])
          {
            uint64_t v13 = 0;
            v55 = 0;
            uint64_t v57 = 0;
            while (2)
            {
              unint64_t v14 = v6;
              uint64_t v15 = objc_msgSend(v8, "objectAtIndexedSubscript:", v13, v49);
              uint64_t v16 = [v15 unsignedLongLongValue];

              v17 = [v58 schema];
              uint64_t v18 = [v17 columns];
              uint64_t v19 = [v18 objectAtIndexedSubscript:v13];
              uint64_t v20 = [v19 type];

              v21 = [v58 schema];
              uint64_t v22 = [v21 columns];
              v23 = [v22 objectAtIndexedSubscript:v13];
              uint64_t v24 = [v23 valueID];
              uint64_t v25 = [v24 unsignedLongLongValue];

              unint64_t v6 = v14;
              switch(v20)
              {
                case 1:
                  v26 = [*(id *)(v14 + 3792) numberWithUnsignedLongLong:v16];
                  v27 = v56;
                  uint64_t v28 = v26;
                  v29 = @"APWakeTime";
                  goto LABEL_22;
                case 2:
                  uint64_t v40 = [v58 schema];
                  uint64_t v41 = [v40 columns];
                  long long v42 = [v41 objectAtIndexedSubscript:v13];
                  uint64_t v43 = [v42 metadataType];

                  if (v43 == 2)
                  {
                    v26 = [*(id *)(v14 + 3792) numberWithUnsignedLongLong:v16];
                    v27 = v56;
                    uint64_t v28 = v26;
                    v29 = @"DeviceType";
                  }
                  else
                  {
                    uint64_t v44 = [v58 schema];
                    uint64_t v45 = [v44 columns];
                    uint64_t v46 = [v45 objectAtIndexedSubscript:v13];
                    uint64_t v47 = [v46 metadataType];

                    if (v47 != 1) {
                      goto LABEL_23;
                    }
                    v26 = [*(id *)(v14 + 3792) numberWithUnsignedLongLong:v16];
                    v27 = v56;
                    uint64_t v28 = v26;
                    v29 = @"ClusterIndex";
                  }
LABEL_22:
                  [v27 setObject:v28 forKeyedSubscript:v29];

LABEL_23:
                  if ([v8 count] <= (unint64_t)++v13) {
                    goto LABEL_27;
                  }
                  continue;
                case 3:
                  uint64_t v57 = v16;
                  goto LABEL_23;
                case 4:
                  if (v57)
                  {
                    uint64_t v30 = (void *)qword_1EBD5A1E8;
                    v31 = [*(id *)(v14 + 3792) numberWithUnsignedLongLong:v25];
                    v32 = [v30 objectForKeyedSubscript:v31];

                    if (!v32)
                    {
                      [*(id *)(a1 + 40) addToLookupTableAndCache:v25 forEntryKey:lostPerformanceLookupEntryKey andLookupMap:qword_1EBD5A1E8];
                      v33 = PLLogCLPC();
                      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = v49;
                        uint64_t v66 = v25;
                        _os_log_fault_impl(&dword_1D2690000, v33, OS_LOG_TYPE_FAULT, "Missing Lost Performance lookup entry for ID %llu:", buf, 0xCu);
                      }
                    }
                    v63[0] = @"ObfuscatedID";
                    v34 = (void *)qword_1EBD5A1E8;
                    v35 = [*(id *)(v14 + 3792) numberWithUnsignedLongLong:v25];
                    v36 = [v34 objectForKeyedSubscript:v35];
                    v63[1] = @"Transitions";
                    v64[0] = v36;
                    v37 = [*(id *)(v14 + 3792) numberWithUnsignedLongLong:v16];
                    v64[1] = v37;
                    uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:2];

                    v39 = [*(id *)(v14 + 3792) numberWithUnsignedLongLong:v57];
                    [v56 setObject:v39 forKeyedSubscript:v38];

                    uint64_t v57 = 0;
                    v55 = (void *)v38;
                  }
                  else
                  {
                    uint64_t v57 = 0;
                  }
                  goto LABEL_23;
                default:
                  goto LABEL_23;
              }
            }
          }
          v55 = 0;
LABEL_27:
          objc_msgSend(*(id *)(a1 + 40), "logEntry:", v56, v49);

          uint64_t v7 = v53 + 1;
        }
        while (v53 + 1 != v52);
        uint64_t v52 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
      }
      while (v52);
    }

    id v4 = v58;
  }

  return 1;
}

- (NSDate)lastEntryDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

void __25__PLCLPCAgent_setupTimer__block_invoke(uint64_t a1)
{
  v2 = PLLogCLPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEBUG, "Fired the 10 minute timer for CLPC Stats", buf, 2u);
  }

  v3 = [*(id *)(a1 + 32) provider];
  uint64_t v4 = [v3 readDeltaStats:0];
  uint64_t v5 = *(void *)(a1 + 32);
  unint64_t v6 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v4;

  if (*(void *)(*(void *)(a1 + 32) + 80))
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [*(id *)(a1 + 32) logCLPCLostPerformance:v7];
    [*(id *)(a1 + 32) logCLPCStatsAccumulators:v7];
    [*(id *)(a1 + 32) logCLPCCPUClusterAccumulators:v7];
    [*(id *)(a1 + 32) setLastEntryDate:v7];
  }
  else
  {
    uint64_t v7 = PLLogCLPC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1D2690000, v7, OS_LOG_TYPE_ERROR, "readDeltaStats failed to return results in 10 minute Timer", v8, 2u);
    }
  }
}

void __34__PLCLPCAgent_setupThermalMonitor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PLLogCLPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412290;
    id v15 = v3;
    _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "Notification from ThermalMonitor: %@", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v5 = [v3 objectForKeyedSubscript:@"Source"];
  if (v5)
  {
    unint64_t v6 = (void *)v5;
    uint64_t v7 = [v3 objectForKeyedSubscript:@"Source"];
    int v8 = [v7 isEqual:&unk_1F29E7450];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) provider];
      uint64_t v10 = [v9 readDeltaStats:0];
      uint64_t v11 = *(void *)(a1 + 32);
      v12 = *(void **)(v11 + 80);
      *(void *)(v11 + 80) = v10;

      if (*(void *)(*(void *)(a1 + 32) + 80))
      {
        uint64_t v13 = [MEMORY[0x1E4F1C9C8] monotonicDate];
        [*(id *)(a1 + 32) logCLPCLostPerformance:v13];
        [*(id *)(a1 + 32) logCLPCStatsAccumulators:v13];
        [*(id *)(a1 + 32) logCLPCCPUClusterAccumulators:v13];
        [*(id *)(a1 + 32) setLastEntryDate:v13];
      }
      else
      {
        uint64_t v13 = PLLogCLPC();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v14) = 0;
          _os_log_error_impl(&dword_1D2690000, v13, OS_LOG_TYPE_ERROR, "readDeltaStats failed to return results in ThermalMonitor", (uint8_t *)&v14, 2u);
        }
      }
    }
  }
}

- (void)setLastEntryDate:(id)a3
{
}

- (CLPCReportingAccess)provider
{
  return (CLPCReportingAccess *)objc_getProperty(self, a2, 64, 1);
}

- (void)logCLPCStatsAccumulators:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"Accumulators"];
  readResults = self->_readResults;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__PLCLPCAgent_logCLPCStatsAccumulators___block_invoke;
  v9[3] = &unk_1E6930DA8;
  id v10 = v5;
  uint64_t v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  [(CLPCReportingReadResult *)readResults enumerate:v9];
}

- (void)logCLPCLostPerformance:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"LostPerformance"];
  readResults = self->_readResults;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__PLCLPCAgent_logCLPCLostPerformance___block_invoke;
  v9[3] = &unk_1E6930DA8;
  id v10 = v5;
  uint64_t v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  [(CLPCReportingReadResult *)readResults enumerate:v9];
}

- (void)logCLPCCPUClusterAccumulators:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"CPUClusterAccumulators"];
  readResults = self->_readResults;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__PLCLPCAgent_logCLPCCPUClusterAccumulators___block_invoke;
  v9[3] = &unk_1E6930DA8;
  id v10 = v5;
  uint64_t v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  [(CLPCReportingReadResult *)readResults enumerate:v9];
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLCLPCAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLCLPCAgent)init
{
  if (shouldUseNewCLPCPath())
  {
    v6.receiver = self;
    v6.super_class = (Class)PLCLPCAgent;
    self = [(PLAgent *)&v6 init];
    id v3 = self;
  }
  else
  {
    id v4 = PLLogCLPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEFAULT, "New CLPC path is not available", buf, 2u);
    }

    id v3 = 0;
  }

  return v3;
}

+ (id)entryEventNoneDefinitions
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"LostPerformanceLookup";
  id v3 = [a1 entryEventNoneLostPerformanceLookup];
  v9[0] = v3;
  v8[1] = @"AccumulatorsLookup";
  id v4 = [a1 entryEventNoneAccumulatorsLookup];
  v9[1] = v4;
  v8[2] = @"CPUClusterAccumulatorsLookup";
  uint64_t v5 = [a1 entryEventNoneCPUClusterAccumulatorsLookup];
  v9[2] = v5;
  objc_super v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (id)entryEventNoneLostPerformanceLookup
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CF8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F1000;
  v12[1] = &unk_1F29E7438;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  id v9 = @"ObfuscatedValue";
  id v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  id v10 = v5;
  objc_super v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventNoneAccumulatorsLookup
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CF8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F1000;
  v12[1] = &unk_1F29E7438;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  id v9 = @"ObfuscatedValue";
  id v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  id v10 = v5;
  objc_super v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventNoneCPUClusterAccumulatorsLookup
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CF8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F1010;
  v12[1] = &unk_1F29E7438;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  id v9 = @"ObfuscatedValue";
  id v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  id v10 = v5;
  objc_super v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventIntervalDefinitions
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"LostPerformance";
  id v3 = [a1 entryEventIntervalDefinitionLostPerformance];
  v9[0] = v3;
  v8[1] = @"Accumulators";
  id v4 = [a1 entryEventIntervalDefinitionAccumulators];
  v9[1] = v4;
  v8[2] = @"CPUClusterAccumulators";
  uint64_t v5 = [a1 entryEventIntervalDefinitionCPUClusterAccumulators];
  v9[2] = v5;
  objc_super v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (id)entryEventIntervalDefinitionLostPerformance
{
  v32[3] = *MEMORY[0x1E4F143B8];
  v31[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v29[0] = *MEMORY[0x1E4F92CD0];
  v29[1] = v2;
  v30[0] = &unk_1F29F1010;
  v30[1] = MEMORY[0x1E4F1CC38];
  v29[2] = *MEMORY[0x1E4F92C60];
  v30[2] = MEMORY[0x1E4F1CC38];
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
  v32[0] = v22;
  v31[1] = *MEMORY[0x1E4F92CA8];
  v27[0] = @"timestampEnd";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_DateFormat");
  v28[0] = v20;
  v27[1] = @"DeviceType";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v28[1] = v18;
  v27[2] = @"ClusterIndex";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v28[2] = v16;
  v27[3] = @"APWakeTime";
  id v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v28[3] = v14;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];
  v32[1] = v3;
  v31[2] = *MEMORY[0x1E4F92C68];
  v25[0] = @"key";
  v23[0] = @"ObfuscatedID";
  id v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v23[1] = @"Transitions";
  v24[0] = v5;
  objc_super v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v24[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  v25[1] = @"value";
  v26[0] = v8;
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v26[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  v32[2] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];

  return v12;
}

+ (id)entryEventIntervalDefinitionAccumulators
{
  v26[3] = *MEMORY[0x1E4F143B8];
  v25[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v23[0] = *MEMORY[0x1E4F92CD0];
  v23[1] = v2;
  v24[0] = &unk_1F29F1010;
  v24[1] = MEMORY[0x1E4F1CC38];
  void v23[2] = *MEMORY[0x1E4F92C60];
  void v24[2] = MEMORY[0x1E4F1CC38];
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  v26[0] = v16;
  v25[1] = *MEMORY[0x1E4F92CA8];
  v21[0] = @"timestampEnd";
  id v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v14 = objc_msgSend(v15, "commonTypeDict_DateFormat");
  v21[1] = @"APWakeTime";
  v22[0] = v14;
  id v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v22[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v26[1] = v5;
  void v25[2] = *MEMORY[0x1E4F92C68];
  v19[0] = @"key";
  v17 = @"ObfuscatedID";
  objc_super v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  uint64_t v18 = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v19[1] = @"value";
  v20[0] = v8;
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v20[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  void v26[2] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];

  return v12;
}

+ (id)entryEventIntervalDefinitionCPUClusterAccumulators
{
  v28[3] = *MEMORY[0x1E4F143B8];
  v27[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v25[0] = *MEMORY[0x1E4F92CD0];
  v25[1] = v2;
  v26[0] = &unk_1F29F1010;
  v26[1] = MEMORY[0x1E4F1CC38];
  void v25[2] = *MEMORY[0x1E4F92C60];
  void v26[2] = MEMORY[0x1E4F1CC38];
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  v28[0] = v18;
  v27[1] = *MEMORY[0x1E4F92CA8];
  v23[0] = @"timestampEnd";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_DateFormat");
  v24[0] = v16;
  v23[1] = @"ClusterIndex";
  id v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v24[1] = v14;
  void v23[2] = @"APWakeTime";
  id v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  void v24[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  v28[1] = v5;
  v27[2] = *MEMORY[0x1E4F92C68];
  v21[0] = @"key";
  uint64_t v19 = @"ObfuscatedID";
  objc_super v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  uint64_t v20 = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v21[1] = @"value";
  v22[0] = v8;
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v22[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v28[2] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];

  return v12;
}

- (void)initOperatorDependancies
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  id v3 = [MEMORY[0x1E4F89D18] createClient:&v19];
  id v4 = v19;
  provider = self->_provider;
  self->_provider = v3;

  if (v4)
  {
    objc_super v6 = PLLogCLPC();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
LABEL_3:

      return;
    }
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    uint64_t v11 = "Error creating CLPC client %@";
LABEL_18:
    _os_log_error_impl(&dword_1D2690000, v6, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
    goto LABEL_3;
  }
  id v7 = (CLPCReportingStatSelection *)objc_opt_new();
  selection = self->_selection;
  self->_selection = v7;

  if (!self->_selection)
  {
    id v12 = PLLogCLPC();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v13 = "Error creating selection";
LABEL_21:
    _os_log_error_impl(&dword_1D2690000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_22;
  }
  if (![(PLCLPCAgent *)self configureLostPerformance])
  {
    id v12 = PLLogCLPC();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v13 = "Lost Performance configuration failed";
    goto LABEL_21;
  }
  if (![(PLCLPCAgent *)self configureAccumulators])
  {
    id v12 = PLLogCLPC();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v13 = "Accumulators configuration failed";
    goto LABEL_21;
  }
  if (![(PLCLPCAgent *)self configureCPUClusterAccumulators])
  {
    id v12 = PLLogCLPC();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v13 = "CPU CLuster Accumulators configuration failed";
    goto LABEL_21;
  }
  id v9 = [(PLCLPCAgent *)self provider];
  id v10 = [(PLCLPCAgent *)self selection];
  id v18 = 0;
  [v9 enableStats:v10 error:&v18];
  id v4 = v18;

  if (v4)
  {
    objc_super v6 = PLLogCLPC();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    uint64_t v11 = "enableStats failed with %@";
    goto LABEL_18;
  }
  [(PLCLPCAgent *)self setEntryKeys];
  int v14 = [(PLCLPCAgent *)self provider];
  id v15 = [v14 readDeltaStats:0];
  readResults = self->_readResults;
  self->_readResults = v15;

  if (self->_readResults)
  {
    v17 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [(PLCLPCAgent *)self setLastEntryDate:v17];

    [(PLCLPCAgent *)self createLookupMaps];
    [(PLCLPCAgent *)self setupTimer];
    [(PLCLPCAgent *)self setupThermalMonitor];
    return;
  }
  id v12 = PLLogCLPC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    uint64_t v13 = "readDeltaStats failed to return results";
    goto LABEL_21;
  }
LABEL_22:
}

- (BOOL)configureLostPerformance
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PLCLPCAgent *)self selection];
  id v6 = 0;
  [v2 selectStatsOfSchema:4 error:&v6];
  id v3 = v6;

  if (v3)
  {
    id v4 = PLLogCLPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v3;
      _os_log_error_impl(&dword_1D2690000, v4, OS_LOG_TYPE_ERROR, "selectStat for Lost Perf failed with %@", buf, 0xCu);
    }
  }
  return v3 == 0;
}

- (BOOL)configureAccumulators
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLCLPCAgent *)self selection];
  id v16 = 0;
  [v3 selectStat:0x100000000 error:&v16];
  id v4 = v16;

  if (v4)
  {
    uint64_t v5 = PLLogCLPC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      id v6 = "selectStat failed for Package Power Zone with %@";
LABEL_16:
      _os_log_error_impl(&dword_1D2690000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
    }
  }
  else
  {
    id v7 = [(PLCLPCAgent *)self selection];
    id v15 = 0;
    [v7 selectStat:0x100000002 error:&v15];
    id v4 = v15;

    if (v4)
    {
      uint64_t v5 = PLLogCLPC();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v4;
        id v6 = "selectStat failed for Package Energy Estimate with %@";
        goto LABEL_16;
      }
    }
    else
    {
      id v8 = [(PLCLPCAgent *)self selection];
      id v14 = 0;
      [v8 selectStat:0x100000003 error:&v14];
      id v4 = v14;

      if (v4)
      {
        uint64_t v5 = PLLogCLPC();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v4;
          id v6 = "selectStat failed for CPU Energy Estimate with %@";
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v9 = [(PLCLPCAgent *)self selection];
        id v13 = 0;
        [v9 selectStat:0x100000004 error:&v13];
        id v4 = v13;

        if (v4)
        {
          uint64_t v5 = PLLogCLPC();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v18 = v4;
            id v6 = "selectStat failed for ANE Energy Estimate with %@";
            goto LABEL_16;
          }
        }
        else
        {
          id v10 = [(PLCLPCAgent *)self selection];
          id v12 = 0;
          [v10 selectStat:0x100000005 error:&v12];
          id v4 = v12;

          if (!v4) {
            return 1;
          }
          uint64_t v5 = PLLogCLPC();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v18 = v4;
            id v6 = "selectStat failed for GPU Energy Estimate with %@";
            goto LABEL_16;
          }
        }
      }
    }
  }

  return 0;
}

- (BOOL)configureCPUClusterAccumulators
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PLCLPCAgent *)self selection];
  id v6 = 0;
  [v2 selectStatsOfSchema:3 error:&v6];
  id v3 = v6;

  if (v3)
  {
    id v4 = PLLogCLPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v3;
      _os_log_error_impl(&dword_1D2690000, v4, OS_LOG_TYPE_ERROR, "selectStat failed for CPU Cluster Accumulator with %@", buf, 0xCu);
    }
  }
  return v3 == 0;
}

- (void)setEntryKeys
{
  uint64_t v2 = *MEMORY[0x1E4F92D40];
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"LostPerformanceLookup"];
  id v4 = (void *)lostPerformanceLookupEntryKey;
  lostPerformanceLookupEntryKey = v3;

  uint64_t v5 = +[PLOperator entryKeyForType:v2 andName:@"AccumulatorsLookup"];
  id v6 = (void *)accumulatorsLookupEntryKey;
  accumulatorsLookupEntryKey = v5;

  cpuClusterAccumulatorsLookupEntryKey = +[PLOperator entryKeyForType:v2 andName:@"CPUClusterAccumulatorsLookup"];
  MEMORY[0x1F41817F8]();
}

- (void)createLookupMaps
{
  if (![(PLCLPCAgent *)self setupStats])
  {
    uint64_t v2 = PLLogCLPC();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_error_impl(&dword_1D2690000, v2, OS_LOG_TYPE_ERROR, "setupStats failed", v3, 2u);
    }
  }
}

- (BOOL)setupStats
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__14;
  readResults = self->_readResults;
  v6[4] = __Block_byref_object_dispose__14;
  id v7 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__PLCLPCAgent_setupStats__block_invoke;
  v5[3] = &unk_1E6930D80;
  v5[5] = v6;
  v5[6] = &v8;
  v5[4] = self;
  [(CLPCReportingReadResult *)readResults enumerate:v5];
  BOOL v3 = *((unsigned char *)v9 + 24) == 0;
  _Block_object_dispose(v6, 8);

  _Block_object_dispose(&v8, 8);
  return v3;
}

uint64_t __25__PLCLPCAgent_setupStats__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  switch(a2)
  {
    case 4:
      id v6 = &lostPerformanceLookupEntryKey;
      goto LABEL_7;
    case 3:
      id v6 = &cpuClusterAccumulatorsLookupEntryKey;
      goto LABEL_7;
    case 1:
      id v6 = &accumulatorsLookupEntryKey;
LABEL_7:
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      id v8 = (id)*v6;
      uint64_t v9 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v8;

      uint64_t v10 = [v5 schema];
      char v11 = [v10 columns];

      [*(id *)(a1 + 32) constructCache:v11 forEntryKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      goto LABEL_11;
  }
  id v12 = PLLogCLPC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v14 = 134217984;
    uint64_t v15 = a2;
    _os_log_impl(&dword_1D2690000, v12, OS_LOG_TYPE_INFO, "Enumerating on schema %lu not permitted", (uint8_t *)&v14, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_11:

  return 1;
}

- (void)setupTimer
{
  id v3 = objc_alloc(MEMORY[0x1E4F92A80]);
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:600.0];
  id v5 = [(PLOperator *)self workQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __25__PLCLPCAgent_setupTimer__block_invoke;
  v10[3] = &unk_1E692A200;
  v10[4] = self;
  id v6 = (PLTimer *)[v3 initWithFireDate:v4 withInterval:1 withTolerance:0 repeats:v5 withUserInfo:v10 withQueue:600.0 withBlock:0.0];
  tenMinuteTimer = self->_tenMinuteTimer;
  self->_tenMinuteTimer = v6;

  id v8 = PLLogCLPC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "Initialized a timer for CLPC Stats", v9, 2u);
  }
}

- (void)setupThermalMonitor
{
  id v3 = objc_alloc(MEMORY[0x1E4F92A28]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__PLCLPCAgent_setupThermalMonitor__block_invoke;
  void v8[3] = &unk_1E692A0F0;
  v8[4] = self;
  id v4 = (PLNSNotificationOperatorComposition *)[v3 initWithOperator:self forNotification:@"PLThermalMonitorNotification" withBlock:v8];
  thermalMonitorListener = self->_thermalMonitorListener;
  self->_thermalMonitorListener = v4;

  id v6 = PLLogCLPC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "Initialized thermal monitor notification for CLPC Stats", v7, 2u);
  }
}

- (void)logLookupTable:(id)a3 withEntryKey:(id)a4
{
  v33 = self;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  if ([v6 isEqualToString:lostPerformanceLookupEntryKey])
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v35 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v45 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if (objc_msgSend(v13, "type", v33) == 3)
          {
            int v14 = [v13 valueID];
            uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
            [v15 setObject:v14 forKeyedSubscript:@"ObfuscatedValue"];
            [v7 addObject:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v10);
    }
  }
  else if ([v6 isEqualToString:accumulatorsLookupEntryKey])
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v35 = v5;
    id v16 = v5;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v51 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v41 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v40 + 1) + 8 * j);
          if (objc_msgSend(v21, "type", v33) == 1 && objc_msgSend(v21, "statID") != 1)
          {
            uint64_t v22 = [v21 valueID];
            v23 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
            [v23 setObject:v22 forKeyedSubscript:@"ObfuscatedValue"];
            [v7 addObject:v23];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v51 count:16];
      }
      while (v18);
    }
  }
  else
  {
    if (![v6 isEqualToString:cpuClusterAccumulatorsLookupEntryKey]) {
      goto LABEL_36;
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v35 = v5;
    id v24 = v5;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v50 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v37;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v37 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v36 + 1) + 8 * k);
          if (objc_msgSend(v29, "type", v33) == 1 && objc_msgSend(v29, "statID") != 1)
          {
            uint64_t v30 = [v29 valueID];
            v31 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
            [v31 setObject:v30 forKeyedSubscript:@"ObfuscatedValue"];
            [v7 addObject:v31];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v36 objects:v50 count:16];
      }
      while (v26);
    }
  }
  id v5 = v35;

LABEL_36:
  if (objc_msgSend(v7, "count", v33))
  {
    id v48 = v6;
    long long v49 = v7;
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    [v34 logEntries:v32 withGroupID:v6];
  }
}

- (void)createLookupCache:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F92AD0] sharedCore];
  id v5 = [v4 storage];
  id v6 = [v5 entriesForKey:v3];

  uint64_t v7 = PLLogCLPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v58 = (uint64_t)v3;
    __int16 v59 = 2048;
    uint64_t v60 = [v6 count];
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Entries  in %@ lookup table %lu", buf, 0x16u);
  }

  if ([v3 isEqualToString:lostPerformanceLookupEntryKey])
  {
    id v41 = v3;
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = (void *)qword_1EBD5A1E8;
    qword_1EBD5A1E8 = v8;

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v40 = v6;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v51 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          id v16 = objc_msgSend(v15, "objectForKeyedSubscript:", @"ObfuscatedValue", v40);
          uint64_t v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v15, "entryID"));
          [(id)qword_1EBD5A1E8 setObject:v17 forKeyedSubscript:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v50 objects:v56 count:16];
      }
      while (v12);
    }

    uint64_t v18 = PLLogCLPC();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_34;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v58 = qword_1EBD5A1E8;
    uint64_t v19 = "Lost Perf Lookup map is %@";
LABEL_33:
    _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, v19, buf, 0xCu);
LABEL_34:
    id v6 = v40;
    id v3 = v41;

    goto LABEL_35;
  }
  if ([v3 isEqualToString:accumulatorsLookupEntryKey])
  {
    id v41 = v3;
    uint64_t v20 = objc_opt_new();
    id v21 = (void *)qword_1EBD5A1F0;
    qword_1EBD5A1F0 = v20;

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v40 = v6;
    id v22 = v6;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v47 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void **)(*((void *)&v46 + 1) + 8 * j);
          uint64_t v28 = objc_msgSend(v27, "objectForKeyedSubscript:", @"ObfuscatedValue", v40);
          v29 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v27, "entryID"));
          [(id)qword_1EBD5A1F0 setObject:v29 forKeyedSubscript:v28];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v24);
    }

    uint64_t v18 = PLLogCLPC();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_34;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v58 = qword_1EBD5A1F0;
    uint64_t v19 = "Accumulators Lookup map is %@";
    goto LABEL_33;
  }
  if ([v3 isEqualToString:cpuClusterAccumulatorsLookupEntryKey])
  {
    id v41 = v3;
    uint64_t v30 = objc_opt_new();
    v31 = (void *)qword_1EBD5A1F8;
    qword_1EBD5A1F8 = v30;

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = v6;
    id v32 = v6;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v42 objects:v54 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v43;
      do
      {
        for (uint64_t k = 0; k != v34; ++k)
        {
          if (*(void *)v43 != v35) {
            objc_enumerationMutation(v32);
          }
          long long v37 = *(void **)(*((void *)&v42 + 1) + 8 * k);
          long long v38 = objc_msgSend(v37, "objectForKeyedSubscript:", @"ObfuscatedValue", v40);
          long long v39 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v37, "entryID"));
          [(id)qword_1EBD5A1F8 setObject:v39 forKeyedSubscript:v38];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v42 objects:v54 count:16];
      }
      while (v34);
    }

    uint64_t v18 = PLLogCLPC();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_34;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v58 = qword_1EBD5A1F8;
    uint64_t v19 = "CPU Cluster Stats Accumulators Lookup map is %@";
    goto LABEL_33;
  }
LABEL_35:
}

- (void)constructCache:(id)a3 forEntryKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v8 = [v7 storage];
  uint64_t v9 = [v8 countOfEntriesForKey:v6];

  if (!v9) {
    [(PLCLPCAgent *)self logLookupTable:v10 withEntryKey:v6];
  }
  [(PLCLPCAgent *)self createLookupCache:v6];
}

- (void)addToLookupTableAndCache:(unint64_t)a3 forEntryKey:(id)a4 andLookupMap:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = PLLogCLPC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 138412290;
    unint64_t v21 = (unint64_t)v8;
    _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "adding a new lookup ID in %@", (uint8_t *)&v20, 0xCu);
  }

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8];
  uint64_t v12 = [NSNumber numberWithUnsignedLongLong:a3];
  [v11 setObject:v12 forKeyedSubscript:@"ObfuscatedValue"];

  [(PLOperator *)self logEntry:v11];
  uint64_t v13 = PLLogCLPC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 134218242;
    unint64_t v21 = a3;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "added lookup ID %llu in %@", (uint8_t *)&v20, 0x16u);
  }

  int v14 = PLLogCLPC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 138412290;
    unint64_t v21 = (unint64_t)v9;
    _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "adding a new lookup ID in %@", (uint8_t *)&v20, 0xCu);
  }

  uint64_t v15 = [(PLOperator *)self storage];
  id v16 = [v15 lastEntryForKey:v8];

  uint64_t v17 = [v16 objectForKeyedSubscript:@"ObfuscatedValue"];
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v16, "entryID"));
  [v9 setObject:v18 forKeyedSubscript:v17];

  uint64_t v19 = PLLogCLPC();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 138412290;
    unint64_t v21 = (unint64_t)v9;
    _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "Lookup map is %@", (uint8_t *)&v20, 0xCu);
  }
}

- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4
{
  id v4 = a3;
  if (([v4 isEqualToString:lostPerformanceLookupEntryKey] & 1) != 0
    || ([v4 isEqualToString:accumulatorsLookupEntryKey] & 1) != 0
    || [v4 isEqualToString:cpuClusterAccumulatorsLookupEntryKey])
  {
    id v5 = [NSString stringWithFormat:@"ID < 0"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (PLTimer)tenMinuteTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTenMinuteTimer:(id)a3
{
}

- (void)setProvider:(id)a3
{
}

- (CLPCReportingStatSelection)selection
{
  return (CLPCReportingStatSelection *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSelection:(id)a3
{
}

- (CLPCReportingReadResult)readResults
{
  return (CLPCReportingReadResult *)objc_getProperty(self, a2, 80, 1);
}

- (void)setReadResults:(id)a3
{
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_readResults, 0);
  objc_storeStrong((id *)&self->_selection, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_tenMinuteTimer, 0);
  objc_storeStrong((id *)&self->_lastEntryDate, 0);
}

@end