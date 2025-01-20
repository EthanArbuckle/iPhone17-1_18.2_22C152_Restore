@interface PLAccountingEnergyEstimateEventEntry
+ (id)entryKey;
+ (void)load;
- (BOOL)isRootNodeEnergyAggregated;
- (NSDate)correctionDate;
- (NSDate)distributionDate;
- (NSDate)qualificationDate;
- (NSNumber)distributionRuleID;
- (NSNumber)qualificationRuleIDSum;
- (NSNumber)rootNodeID;
- (PLAccountingEnergyEstimateEventEntry)initWithNodeID:(id)a3 withRootNodeID:(id)a4 withParentEntryID:(int)a5 withNumAncestors:(int)a6 withEnergy:(double)a7 withRange:(id)a8 withEntryDate:(id)a9;
- (double)correctionEnergy;
- (double)terminationRatio;
- (int)numAncestors;
- (int)parentEntryID;
- (void)setCorrectionDate:(id)a3;
- (void)setCorrectionEnergy:(double)a3;
- (void)setDistributionDate:(id)a3;
- (void)setIsRootNodeEnergyAggregated:(BOOL)a3;
- (void)setQualificationDate:(id)a3;
- (void)setTerminationRatio:(double)a3;
@end

@implementation PLAccountingEnergyEstimateEventEntry

- (NSNumber)distributionRuleID
{
  return (NSNumber *)[(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F708]];
}

void __60__PLAccountingEnergyEstimateEventEntry_setTerminationRatio___block_invoke(uint64_t a1)
{
  id v2 = [NSNumber numberWithLong:llround(*(double *)(a1 + 40) * 100.0)];
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:*MEMORY[0x263F5F758]];
}

- (PLAccountingEnergyEstimateEventEntry)initWithNodeID:(id)a3 withRootNodeID:(id)a4 withParentEntryID:(int)a5 withNumAncestors:(int)a6 withEnergy:(double)a7 withRange:(id)a8 withEntryDate:(id)a9
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  id v19 = a9;
  int v20 = [v17 intValue];
  v21 = 0;
  if ((a5 & 0x80000000) == 0 && v20 >= 1)
  {
    v73.receiver = self;
    v73.super_class = (Class)PLAccountingEnergyEstimateEventEntry;
    v22 = [(PLAccountingEnergyEventEntry *)&v73 initWithNodeID:v16 withEnergy:v18 withRange:v19 withEntryDate:a7];
    if (v22)
    {
      v23 = +[PLAccountingDistributionRuleManager sharedInstance];
      v24 = [v23 distributionRuleForRootNodeID:v17 andNodeID:v16];

      if (v24) {
        uint64_t v61 = [v24 entryID];
      }
      else {
        uint64_t v61 = 0;
      }
      v25 = +[PLAccountingQualificationRuleManager sharedInstance];
      v26 = [v25 qualificationRulesForRootNodeID:v17];

      unsigned int v63 = a5;
      unsigned int v64 = a6;
      v62 = v26;
      if (v26 && [v26 count])
      {
        v56 = v24;
        id v57 = v19;
        id v58 = v18;
        id v59 = v17;
        id v60 = v16;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id obj = v26;
        uint64_t v27 = [obj countByEnumeratingWithState:&v69 objects:v76 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = 0;
          uint64_t v30 = *(void *)v70;
          unint64_t v31 = 0x263F5F000uLL;
          do
          {
            uint64_t v32 = 0;
            do
            {
              if (*(void *)v70 != v30) {
                objc_enumerationMutation(obj);
              }
              v33 = *(void **)(*((void *)&v69 + 1) + 8 * v32);
              if ([*(id *)(v31 + 1600) debugEnabled])
              {
                uint64_t v34 = objc_opt_class();
                block[0] = MEMORY[0x263EF8330];
                block[1] = 3221225472;
                block[2] = __140__PLAccountingEnergyEstimateEventEntry_initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate___block_invoke;
                block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                block[4] = v34;
                if (initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate__defaultOnce != -1) {
                  dispatch_once(&initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate__defaultOnce, block);
                }
                if (initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate__classDebugEnabled)
                {
                  uint64_t v66 = v29;
                  uint64_t v35 = v28;
                  uint64_t v36 = v30;
                  v37 = v22;
                  v38 = [NSString stringWithFormat:@"qualificationRule=%@", v33];
                  v39 = (void *)MEMORY[0x263F5F638];
                  v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/Energy/PLAccountingEnergyEstimateEventEntry.m"];
                  v41 = [v40 lastPathComponent];
                  v42 = [NSString stringWithUTF8String:"-[PLAccountingEnergyEstimateEventEntry initWithNodeID:withRootNodeID:withParentEntryID:withNumAncestors:withEnergy:withRange:withEntryDate:]"];
                  [v39 logMessage:v38 fromFile:v41 fromFunction:v42 fromLineNumber:60];

                  v43 = PLLogCommon();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v75 = v38;
                    _os_log_debug_impl(&dword_2267F1000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  v22 = v37;
                  uint64_t v30 = v36;
                  uint64_t v28 = v35;
                  uint64_t v29 = v66;
                  unint64_t v31 = 0x263F5F000uLL;
                }
              }
              v29 += 1 << ([v33 entryID] - 1);
              if ([*(id *)(v31 + 1600) debugEnabled])
              {
                uint64_t v44 = objc_opt_class();
                v67[0] = MEMORY[0x263EF8330];
                v67[1] = 3221225472;
                v67[2] = __140__PLAccountingEnergyEstimateEventEntry_initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate___block_invoke_22;
                v67[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v67[4] = v44;
                if (initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate__defaultOnce_20 != -1) {
                  dispatch_once(&initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate__defaultOnce_20, v67);
                }
                if (initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate__classDebugEnabled_21)
                {
                  v45 = objc_msgSend(NSString, "stringWithFormat:", @"qualificationRuleIDSum=%llu", v29);
                  v46 = (void *)MEMORY[0x263F5F638];
                  v47 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/Energy/PLAccountingEnergyEstimateEventEntry.m"];
                  v48 = [v47 lastPathComponent];
                  v49 = [NSString stringWithUTF8String:"-[PLAccountingEnergyEstimateEventEntry initWithNodeID:withRootNodeID:withParentEntryID:withNumAncestors:withEnergy:withRange:withEntryDate:]"];
                  [v46 logMessage:v45 fromFile:v48 fromFunction:v49 fromLineNumber:64];

                  v50 = PLLogCommon();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v75 = v45;
                    _os_log_debug_impl(&dword_2267F1000, v50, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  unint64_t v31 = 0x263F5F000;
                }
              }
              ++v32;
            }
            while (v28 != v32);
            uint64_t v28 = [obj countByEnumeratingWithState:&v69 objects:v76 count:16];
          }
          while (v28);
        }
        else
        {
          uint64_t v29 = 0;
        }

        id v17 = v59;
        id v16 = v60;
        id v19 = v57;
        id v18 = v58;
        v24 = v56;
      }
      else
      {
        uint64_t v29 = 0;
      }
      [(PLEntry *)v22 setObject:v17 forKeyedSubscript:*MEMORY[0x263F5F748]];
      v51 = [NSNumber numberWithInt:v63];
      [(PLEntry *)v22 setObject:v51 forKeyedSubscript:*MEMORY[0x263F5F730]];

      v52 = [NSNumber numberWithInt:v64];
      [(PLEntry *)v22 setObject:v52 forKeyedSubscript:*MEMORY[0x263F5F728]];

      v53 = [NSNumber numberWithInt:v61];
      [(PLEntry *)v22 setObject:v53 forKeyedSubscript:*MEMORY[0x263F5F708]];

      v54 = [NSNumber numberWithLongLong:v29];
      [(PLEntry *)v22 setObject:v54 forKeyedSubscript:*MEMORY[0x263F5F740]];

      [(PLEntry *)v22 setObject:&unk_26DA69CD0 forKeyedSubscript:*MEMORY[0x263F5F6F8]];
      [(PLEntry *)v22 setObject:&unk_26DA69CE8 forKeyedSubscript:*MEMORY[0x263F5F758]];
      v22->_isRootNodeEnergyAggregated = 0;
    }
    self = v22;
    v21 = self;
  }

  return v21;
}

+ (id)entryKey
{
  if (entryKey_onceToken_1 != -1) {
    dispatch_once(&entryKey_onceToken_1, &__block_literal_global_3);
  }
  id v2 = (void *)entryKey_entryKey_1;
  return v2;
}

- (int)numAncestors
{
  id v2 = [(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F728]];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setDistributionDate:(id)a3
{
}

- (void)setTerminationRatio:(double)a3
{
  v5 = [MEMORY[0x263F5F698] sharedCore];
  v6 = [v5 storage];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__PLAccountingEnergyEstimateEventEntry_setTerminationRatio___block_invoke;
  v7[3] = &unk_2647B4F40;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  [v6 blockingUpdateEntry:self withBlock:v7];
}

- (NSNumber)rootNodeID
{
  return (NSNumber *)[(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F748]];
}

- (void)setCorrectionDate:(id)a3
{
}

- (void)setCorrectionEnergy:(double)a3
{
  v5 = [MEMORY[0x263F5F698] sharedCore];
  v6 = [v5 storage];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__PLAccountingEnergyEstimateEventEntry_setCorrectionEnergy___block_invoke;
  v7[3] = &unk_2647B4F40;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  [v6 blockingUpdateEntry:self withBlock:v7];
}

- (NSDate)correctionDate
{
  return (NSDate *)[(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F6F0]];
}

- (NSDate)distributionDate
{
  return (NSDate *)[(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F700]];
}

- (void)setQualificationDate:(id)a3
{
}

- (NSNumber)qualificationRuleIDSum
{
  return (NSNumber *)[(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F740]];
}

- (double)terminationRatio
{
  id v2 = [(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F758]];
  [v2 doubleValue];
  double v4 = v3 / 100.0;

  return v4;
}

- (double)correctionEnergy
{
  id v2 = [(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F6F8]];
  [v2 doubleValue];
  double v4 = v3 / 1000.0;

  return v4;
}

- (BOOL)isRootNodeEnergyAggregated
{
  return self->_isRootNodeEnergyAggregated;
}

void __60__PLAccountingEnergyEstimateEventEntry_setCorrectionEnergy___block_invoke(uint64_t a1)
{
  id v2 = [NSNumber numberWithLong:llround(*(double *)(a1 + 40) * 1000.0)];
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:*MEMORY[0x263F5F6F8]];
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingEnergyEstimateEventEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

uint64_t __48__PLAccountingEnergyEstimateEventEntry_entryKey__block_invoke()
{
  entryKey_entryKey_1 = [MEMORY[0x263F5F618] entryKeyForType:*MEMORY[0x263F5F8A8] andName:*MEMORY[0x263F5F6E8]];
  return MEMORY[0x270F9A758]();
}

uint64_t __140__PLAccountingEnergyEstimateEventEntry_initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate__classDebugEnabled = result;
  return result;
}

uint64_t __140__PLAccountingEnergyEstimateEventEntry_initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate___block_invoke_22(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate__classDebugEnabled_21 = result;
  return result;
}

- (int)parentEntryID
{
  objc_super v2 = [(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F730]];
  int v3 = [v2 intValue];

  return v3;
}

- (NSDate)qualificationDate
{
  return (NSDate *)[(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F738]];
}

- (void)setIsRootNodeEnergyAggregated:(BOOL)a3
{
  self->_isRootNodeEnergyAggregated = a3;
}

@end