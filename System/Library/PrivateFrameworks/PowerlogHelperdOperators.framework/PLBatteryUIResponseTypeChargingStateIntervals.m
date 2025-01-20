@interface PLBatteryUIResponseTypeChargingStateIntervals
- (BOOL)isChargingSpeedIntervalType:(signed __int16)a3;
- (BOOL)isPausedChargingIntervalType:(signed __int16)a3;
- (BOOL)isStoppedChargingIntervalType:(signed __int16)a3;
- (BOOL)useBattUIforEC;
- (NSDate)end;
- (NSDate)start;
- (NSDictionary)resultDict;
- (NSMutableDictionary)chargingStateIntervalsDict;
- (PLBatteryUIResponderService)responderService;
- (PLEntry)lastBattEntry;
- (_PLTimeIntervalRange)range;
- (id)constructIntervalTuplesFromBattEntries:(id)a3 lastBattEntry:(id)a4 startOfRange:(id)a5 endOfRange:(id)a6;
- (id)constructIntervalTuplesFromEntries:(id)a3 startOfRange:(id)a4 endOfRange:(id)a5;
- (id)constructIntervalTuplesFromEntries:(id)a3 startOfRange:(id)a4 endOfRange:(id)a5 allowOverflow:(BOOL)a6;
- (id)constructSlowChargingIntervals:(id)a3;
- (id)dependencies;
- (id)differenceBetweenSetAndIntersectingSet:(id)a3 intervalSetB:(id)a4;
- (id)enforceGraphIntervalPrecedence:(id)a3;
- (id)filterIntervals:(id)a3 withThreshold:(double)a4;
- (id)getApplicableSlowChargingIntervalsGivenECIntervals:(id)a3 slowChargingIntervals:(id)a4;
- (id)getBattUIEntriesWithKey:(id)a3;
- (id)getChargingStateIntervals:(id)a3 forGraphIntervalType:(signed __int16)a4;
- (id)intersectionOfTwoSets:(id)a3 intervalSetB:(id)a4;
- (id)intersectionOfTwoSetsWithMergeThreshold:(int)a3 intervalSetA:(id)a4 intervalSetB:(id)a5;
- (id)mapChargingStateIntervalsToGraphIntervals:(id)a3;
- (id)mergeAllChargingIntervals:(id)a3;
- (id)mergeIntervals:(id)a3 withTolerance:(double)a4;
- (id)sortIntervals:(id)a3;
- (id)unionBetweenSetAndIntersectingSet:(id)a3 intervalSetB:(id)a4;
- (int)filterThreshold:(signed __int16)a3;
- (void)configure:(id)a3;
- (void)run;
- (void)setChargingStateIntervalsDict:(id)a3;
- (void)setEnd:(id)a3;
- (void)setLastBattEntry:(id)a3;
- (void)setRange:(_PLTimeIntervalRange)a3;
- (void)setResponderService:(id)a3;
- (void)setResultDict:(id)a3;
- (void)setStart:(id)a3;
- (void)setUseBattUIforEC:(BOOL)a3;
@end

@implementation PLBatteryUIResponseTypeChargingStateIntervals

- (id)dependencies
{
  return 0;
}

- (void)configure:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"start"];
  [v5 doubleValue];
  double v7 = v6;

  v64 = v4;
  v8 = [v4 objectForKeyedSubscript:@"end"];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v7];
  [(PLBatteryUIResponseTypeChargingStateIntervals *)self setStart:v11];

  v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v10];
  [(PLBatteryUIResponseTypeChargingStateIntervals *)self setEnd:v12];

  v13 = PLLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self start];
    v15 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self end];
    *(_DWORD *)buf = 138412546;
    v72 = v14;
    __int16 v73 = 2112;
    v74 = v15;
    _os_log_impl(&dword_1E4220000, v13, OS_LOG_TYPE_INFO, "start=%@, end=%@", buf, 0x16u);
  }
  v16 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self start];
  v17 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self end];
  [v16 timeIntervalSince1970];
  double v19 = v18;
  [v17 timeIntervalSince1970];
  -[PLBatteryUIResponseTypeChargingStateIntervals setRange:](self, "setRange:", v19, v20 - v19);

  [(PLBatteryUIResponseTypeChargingStateIntervals *)self setUseBattUIforEC:1];
  v21 = PLLogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self start];
    v23 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self end];
    *(_DWORD *)buf = 138412546;
    v72 = v22;
    __int16 v73 = 2112;
    v74 = v23;
    _os_log_impl(&dword_1E4220000, v21, OS_LOG_TYPE_INFO, "after system to monotonic conversion: start=%@, end=%@", buf, 0x16u);
  }
  v66 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BatteryUI"];
  unint64_t v24 = 0x1E4F28000uLL;
  if ([(PLBatteryUIResponseTypeChargingStateIntervals *)self useBattUIforEC])
  {
    id v25 = objc_alloc(MEMORY[0x1E4F92A90]);
    v26 = (void *)MEMORY[0x1E4F28ED0];
    [(PLBatteryUIResponseTypeChargingStateIntervals *)self range];
    v27 = objc_msgSend(v26, "numberWithDouble:");
    v28 = (void *)[v25 initWithKey:@"timestamp" withValue:v27 withComparisonOperation:5];

    v29 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"Level" withValue:&unk_1F400BEF0 withComparisonOperation:3];
    v30 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self responderService];
    v31 = [v30 storage];
    v70[0] = v28;
    v70[1] = v29;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
    v33 = [v31 lastEntryForKey:v66 withComparisons:v32 isSingleton:0];
    [(PLBatteryUIResponseTypeChargingStateIntervals *)self setLastBattEntry:v33];
  }
  v65 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"Charging"];
  v34 = objc_opt_new();
  [(PLBatteryUIResponseTypeChargingStateIntervals *)self setChargingStateIntervalsDict:v34];

  __int16 v35 = 1;
  do
  {
    BOOL v36 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self useBattUIforEC];
    if (v35 == 1 && v36)
    {
      v37 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self getBattUIEntriesWithKey:v66];
      v38 = PLLogCommon();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v37;
        _os_log_impl(&dword_1E4220000, v38, OS_LOG_TYPE_INFO, "getBattUIEntriesWithKey=%@", buf, 0xCu);
      }

      v39 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self chargingStateIntervalsDict];
      v40 = [*(id *)(v24 + 3792) numberWithShort:1];
      [v39 setObject:v37 forKeyedSubscript:v40];
LABEL_20:

      goto LABEL_22;
    }
    v41 = NSString;
    [(PLBatteryUIResponseTypeChargingStateIntervals *)self range];
    uint64_t v43 = v42;
    [(PLBatteryUIResponseTypeChargingStateIntervals *)self range];
    double v46 = v44 + v45;
    [(PLBatteryUIResponseTypeChargingStateIntervals *)self range];
    uint64_t v48 = v47;
    [(PLBatteryUIResponseTypeChargingStateIntervals *)self range];
    double v51 = v49 + v50;
    unint64_t v52 = v24;
    v53 = [*(id *)(v24 + 3792) numberWithShort:v35];
    v37 = [v41 stringWithFormat:@"((timestamp BETWEEN %f AND %f) OR (%@ BETWEEN %f AND %f)) AND %@=\"%@\", v43, *(void *)&v46, @"timestampEnd", v48, *(void *)&v51, @"intervalType"", v53];

    v54 = PLLogCommon();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v37;
      _os_log_impl(&dword_1E4220000, v54, OS_LOG_TYPE_INFO, "where=%@", buf, 0xCu);
    }

    v55 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self responderService];
    v56 = [v55 storage];
    v67 = v37;
    v68[0] = @"where";
    v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
    v68[1] = @"order by";
    v69[0] = v57;
    v69[1] = &unk_1F400E728;
    v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:2];
    v39 = [v56 entriesForKey:v65 withProperties:v58];

    v59 = PLLogCommon();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v39;
      _os_log_impl(&dword_1E4220000, v59, OS_LOG_TYPE_INFO, "chargingStateEntries: %@", buf, 0xCu);
    }

    if (v39)
    {
      unint64_t v24 = v52;
      if (![v39 count]) {
        goto LABEL_22;
      }
      v40 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self chargingStateIntervalsDict];
      v60 = [*(id *)(v52 + 3792) numberWithShort:v35];
      [v40 setObject:v39 forKeyedSubscript:v60];

      goto LABEL_20;
    }
    unint64_t v24 = v52;
LABEL_22:

    unsigned int v61 = (unsigned __int16)v35++;
  }
  while (v61 < 9);
  v62 = PLLogCommon();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    v63 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self chargingStateIntervalsDict];
    *(_DWORD *)buf = 138412290;
    v72 = v63;
    _os_log_impl(&dword_1E4220000, v62, OS_LOG_TYPE_INFO, "charging state intervals dict: %@", buf, 0xCu);
  }
}

- (id)getBattUIEntriesWithKey:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self responderService];
  double v6 = [v5 storage];
  [(PLBatteryUIResponseTypeChargingStateIntervals *)self range];
  double v7 = objc_msgSend(v6, "entriesForKey:inTimeRange:withFilters:", v4, 0);

  v8 = [v7 lastObject];
  double v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v8;
    _os_log_impl(&dword_1E4220000, v9, OS_LOG_TYPE_INFO, "earliestEntry=%@", buf, 0xCu);
  }

  if (v8)
  {
    double v10 = [v8 objectForKeyedSubscript:@"IsCharging"];
    int v11 = [v10 BOOLValue];

    if (v11)
    {
      v12 = NSString;
      [(PLBatteryUIResponseTypeChargingStateIntervals *)self range];
      v14 = [v12 stringWithFormat:@"timestamp < %f AND %@ = %d", v13, @"IsCharging", 0];
      v15 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self responderService];
      v16 = [v15 storage];
      v34 = v14;
      v35[0] = @"where";
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
      v36[0] = v17;
      v36[1] = &unk_1F400E750;
      v35[1] = @"order by";
      v35[2] = @"limit";
      v36[2] = &unk_1F400BF08;
      double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
      double v19 = [v16 entriesForKey:v4 withProperties:v18];

      double v20 = [v19 firstObject];
      v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v20;
        _os_log_impl(&dword_1E4220000, v21, OS_LOG_TYPE_INFO, "latestNonConnectedEntryBeforeRange=%@", buf, 0xCu);
      }

      if (v20)
      {
        v22 = [v20 objectForKeyedSubscript:@"timestamp"];
        [v22 doubleValue];
        double v24 = v23;

        id v25 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v24];
        v26 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self end];
        [v25 timeIntervalSince1970];
        double v28 = v27;
        [v26 timeIntervalSince1970];
        -[PLBatteryUIResponseTypeChargingStateIntervals setRange:](self, "setRange:", v28, v29 - v28);

        v30 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self responderService];
        v31 = [v30 storage];
        [(PLBatteryUIResponseTypeChargingStateIntervals *)self range];
        uint64_t v32 = objc_msgSend(v31, "entriesForKey:inTimeRange:withFilters:", v4, 0);

        double v7 = (void *)v32;
      }
    }
  }

  return v7;
}

- (void)run
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self chargingStateIntervalsDict];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__PLBatteryUIResponseTypeChargingStateIntervals_run__block_invoke;
  v7[3] = &unk_1E6E47580;
  v7[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  id v4 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self chargingStateIntervalsDict];
  v5 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self mapChargingStateIntervalsToGraphIntervals:v4];

  double v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    double v9 = v5;
    _os_log_impl(&dword_1E4220000, v6, OS_LOG_TYPE_INFO, "graph charging state intervals: %@", buf, 0xCu);
  }

  [(PLBatteryUIResponseTypeChargingStateIntervals *)self setResultDict:v5];
}

void __52__PLBatteryUIResponseTypeChargingStateIntervals_run__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) useBattUIforEC] && objc_msgSend(v5, "intValue") == 1)
  {
    double v7 = *(void **)(a1 + 32);
    v8 = [v7 lastBattEntry];
    double v9 = [*(id *)(a1 + 32) start];
    uint64_t v10 = [*(id *)(a1 + 32) end];
    int v11 = [v7 constructIntervalTuplesFromBattEntries:v6 lastBattEntry:v8 startOfRange:v9 endOfRange:v10];
    v12 = [*(id *)(a1 + 32) chargingStateIntervalsDict];
    [v12 setObject:v11 forKeyedSubscript:v5];
  }
  else
  {
    int v13 = [v5 intValue];
    v14 = *(void **)(a1 + 32);
    v8 = [v14 start];
    double v9 = [*(id *)(a1 + 32) end];
    if (v13 == 9) {
      [v14 constructIntervalTuplesFromEntries:v6 startOfRange:v8 endOfRange:v9 allowOverflow:1];
    }
    else {
    uint64_t v10 = [v14 constructIntervalTuplesFromEntries:v6 startOfRange:v8 endOfRange:v9];
    }
    int v11 = [*(id *)(a1 + 32) chargingStateIntervalsDict];
    [v11 setObject:v10 forKeyedSubscript:v5];
  }

  v15 = PLLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = [*(id *)(a1 + 32) chargingStateIntervalsDict];
    v17 = [v16 objectForKeyedSubscript:v5];
    int v18 = 138412546;
    id v19 = v5;
    __int16 v20 = 2112;
    v21 = v17;
    _os_log_impl(&dword_1E4220000, v15, OS_LOG_TYPE_INFO, "after converting PLEntry to interval tuples for chargingIntervalType=%@, intervals=%@", (uint8_t *)&v18, 0x16u);
  }
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResponderService:(id)a3
{
}

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStart:(id)a3
{
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEnd:(id)a3
{
}

- (_PLTimeIntervalRange)range
{
  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setRange:(_PLTimeIntervalRange)a3
{
  _PLTimeIntervalRange v3 = a3;
  objc_copyStruct(&self->_range, &v3, 16, 1, 0);
}

- (PLEntry)lastBattEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastBattEntry:(id)a3
{
}

- (NSMutableDictionary)chargingStateIntervalsDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setChargingStateIntervalsDict:(id)a3
{
}

- (NSDictionary)resultDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setResultDict:(id)a3
{
}

- (BOOL)useBattUIforEC
{
  return self->_useBattUIforEC;
}

- (void)setUseBattUIforEC:(BOOL)a3
{
  self->_useBattUIforEC = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultDict, 0);
  objc_storeStrong((id *)&self->_chargingStateIntervalsDict, 0);
  objc_storeStrong((id *)&self->_lastBattEntry, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

- (id)sortIntervals:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_1];
}

uint64_t __82__PLBatteryUIResponseTypeChargingStateIntervals_IntervalOperation__sortIntervals___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objectAtIndex:0];
  id v6 = [v4 objectAtIndex:0];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)mergeIntervals:(id)a3 withTolerance:(double)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v7 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self sortIntervals:v6];
    v8 = objc_opt_new();
    double v9 = [v7 firstObject];
    [v8 addObject:v9];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __97__PLBatteryUIResponseTypeChargingStateIntervals_IntervalOperation__mergeIntervals_withTolerance___block_invoke;
    v12[3] = &unk_1E6E47AB8;
    id v10 = v8;
    id v13 = v10;
    double v14 = a4;
    [v7 enumerateObjectsUsingBlock:v12];
  }
  else
  {
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

void __97__PLBatteryUIResponseTypeChargingStateIntervals_IntervalOperation__mergeIntervals_withTolerance___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    id v17 = v5;
    id v6 = [*(id *)(a1 + 32) lastObject];
    uint64_t v7 = [v17 objectAtIndexedSubscript:0];
    double v8 = (double)(int)[v7 intValue] - *(double *)(a1 + 40);
    double v9 = [v6 objectAtIndexedSubscript:1];
    double v10 = (double)(int)[v9 intValue];

    if (v8 <= v10)
    {
      int v11 = [v17 objectAtIndexedSubscript:1];
      int v12 = [v11 intValue];
      id v13 = [v6 objectAtIndexedSubscript:1];
      int v14 = [v13 intValue];

      if (v12 > v14)
      {
        v15 = (void *)[v6 mutableCopy];
        v16 = [v17 objectAtIndexedSubscript:1];
        [v15 setObject:v16 atIndexedSubscript:1];

        [*(id *)(a1 + 32) removeLastObject];
        [*(id *)(a1 + 32) addObject:v15];
      }
    }
    else
    {
      [*(id *)(a1 + 32) addObject:v17];
    }

    id v5 = v17;
  }
}

- (id)filterIntervals:(id)a3 withThreshold:(double)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __98__PLBatteryUIResponseTypeChargingStateIntervals_IntervalOperation__filterIntervals_withThreshold___block_invoke;
  v9[3] = &unk_1E6E47AE0;
  double v11 = a4;
  id v7 = v6;
  id v10 = v7;
  [v5 enumerateObjectsUsingBlock:v9];

  return v7;
}

void __98__PLBatteryUIResponseTypeChargingStateIntervals_IntervalOperation__filterIntervals_withThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  _PLTimeIntervalRange v3 = [v7 objectAtIndexedSubscript:1];
  int v4 = [v3 intValue];
  id v5 = [v7 objectAtIndexedSubscript:0];
  double v6 = (double)(int)(v4 - [v5 intValue]);

  if (*(double *)(a1 + 40) <= v6) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

- (id)intersectionOfTwoSets:(id)a3 intervalSetB:(id)a4
{
  return [(PLBatteryUIResponseTypeChargingStateIntervals *)self intersectionOfTwoSetsWithMergeThreshold:0 intervalSetA:a3 intervalSetB:a4];
}

- (id)intersectionOfTwoSetsWithMergeThreshold:(int)a3 intervalSetA:(id)a4 intervalSetB:(id)a5
{
  v58[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a5;
  id v52 = (id)objc_opt_new();
  unint64_t v54 = [v6 count];
  unint64_t v55 = [v7 count];
  if (v54 && v55)
  {
    unint64_t v8 = 0;
    unint64_t v9 = 0;
    unsigned int v10 = 0;
    unsigned int v11 = 0;
    do
    {
      unsigned int v56 = v11;
      unsigned int v57 = v10;
      int v12 = [v6 objectAtIndexedSubscript:v9];
      id v13 = [v12 objectAtIndexedSubscript:0];
      int v14 = [v13 intValue];

      v15 = [v7 objectAtIndexedSubscript:v8];
      v16 = [v15 objectAtIndexedSubscript:0];
      int v17 = [v16 intValue];

      if (v14 <= v17) {
        int v18 = v17;
      }
      else {
        int v18 = v14;
      }
      id v19 = [v6 objectAtIndexedSubscript:v9];
      __int16 v20 = [v19 objectAtIndexedSubscript:1];
      int v21 = [v20 intValue];

      uint64_t v22 = [v7 objectAtIndexedSubscript:v8];
      double v23 = [v22 objectAtIndexedSubscript:1];
      int v24 = [v23 intValue];

      if (v21 >= v24) {
        unsigned int v25 = v24;
      }
      else {
        unsigned int v25 = v21;
      }
      if (v18 < (int)v25)
      {
        v26 = [v6 objectAtIndexedSubscript:v9];
        double v27 = [v26 objectAtIndexedSubscript:0];
        int v28 = [v27 intValue];

        double v29 = [v7 objectAtIndexedSubscript:v8];
        v30 = [v29 objectAtIndexedSubscript:0];
        int v31 = [v30 intValue];

        if (v28 >= v31) {
          int v32 = v31;
        }
        else {
          int v32 = v28;
        }
        if (v18 - a3 >= v32) {
          int v32 = v18;
        }
        unsigned int v53 = v32;
        v33 = [v6 objectAtIndexedSubscript:v9];
        v34 = [v33 objectAtIndexedSubscript:1];
        int v35 = [v34 intValue];

        BOOL v36 = [v7 objectAtIndexedSubscript:v8];
        v37 = [v36 objectAtIndexedSubscript:1];
        int v38 = [v37 intValue];

        if (v35 <= v38) {
          unsigned int v39 = v38;
        }
        else {
          unsigned int v39 = v35;
        }
        if ((int)(v25 + a3) <= (int)v39) {
          uint64_t v40 = v25;
        }
        else {
          uint64_t v40 = v39;
        }
        v41 = [MEMORY[0x1E4F28ED0] numberWithInt:v53];
        v58[0] = v41;
        uint64_t v42 = [MEMORY[0x1E4F28ED0] numberWithInt:v40];
        v58[1] = v42;
        uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
        [v52 addObject:v43];
      }
      double v44 = [v6 objectAtIndexedSubscript:v9];
      double v45 = [v44 objectAtIndexedSubscript:1];
      int v46 = [v45 intValue];
      uint64_t v47 = [v7 objectAtIndexedSubscript:v8];
      uint64_t v48 = [v47 objectAtIndexedSubscript:1];
      int v49 = [v48 intValue];

      if (v46 < v49) {
        unint64_t v8 = v56;
      }
      else {
        unint64_t v8 = v56 + 1;
      }
      if (v46 >= v49) {
        unint64_t v9 = v57;
      }
      else {
        unint64_t v9 = v57 + 1;
      }
      if (v54 <= v9) {
        break;
      }
      unsigned int v10 = v9;
      unsigned int v11 = v8;
    }
    while (v55 > v8);
  }

  return v52;
}

- (id)differenceBetweenSetAndIntersectingSet:(id)a3 intervalSetB:(id)a4
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] && objc_msgSend(v7, "count"))
  {
    unint64_t v8 = [v6 firstObject];
    unint64_t v9 = [v8 objectAtIndexedSubscript:0];

    unsigned int v10 = [v6 lastObject];
    unsigned int v11 = [v10 objectAtIndexedSubscript:1];

    int v12 = objc_opt_new();
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    int v24 = __Block_byref_object_copy__1;
    unsigned int v25 = __Block_byref_object_dispose__1;
    id v13 = v9;
    id v26 = v13;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __120__PLBatteryUIResponseTypeChargingStateIntervals_IntervalOperation__differenceBetweenSetAndIntersectingSet_intervalSetB___block_invoke;
    v18[3] = &unk_1E6E47B08;
    __int16 v20 = &v21;
    id v14 = v12;
    id v19 = v14;
    [v7 enumerateObjectsUsingBlock:v18];
    if (([(id)v22[5] isEqualToNumber:v11] & 1) == 0)
    {
      v27[0] = v22[5];
      v27[1] = v11;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
      [v14 addObject:v15];
    }
    id v16 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self intersectionOfTwoSets:v6 intervalSetB:v14];

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    id v16 = v6;
  }

  return v16;
}

void __120__PLBatteryUIResponseTypeChargingStateIntervals_IntervalOperation__differenceBetweenSetAndIntersectingSet_intervalSetB___block_invoke(uint64_t a1, void *a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v5 = [v3 objectAtIndexedSubscript:0];
  LOBYTE(v4) = [v4 isEqualToNumber:v5];

  if ((v4 & 1) == 0)
  {
    id v6 = *(void **)(a1 + 32);
    v12[0] = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = [v3 objectAtIndexedSubscript:0];
    v12[1] = v7;
    unint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    [v6 addObject:v8];
  }
  uint64_t v9 = [v3 objectAtIndexedSubscript:1];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned int v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

- (id)unionBetweenSetAndIntersectingSet:(id)a3 intervalSetB:(id)a4
{
  v44[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 count];
  unint64_t v8 = v5;
  if (v7 && (uint64_t v9 = [v5 count], v8 = v6, v9))
  {
    id v10 = (id)objc_opt_new();
    unint64_t v11 = [v5 count];
    unint64_t v41 = [v6 count];
    if (v11 | v41)
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      int v42 = 0;
      int v43 = 0;
      unint64_t v39 = v11;
      uint64_t v40 = v5;
      do
      {
        if (v11 == v13)
        {
          id v14 = [v6 objectAtIndexedSubscript:v12];
          ++v43;
        }
        else
        {
          v15 = [v5 objectAtIndexedSubscript:v13];
          id v14 = v15;
          if (v41 == v12)
          {
            ++v42;
          }
          else
          {
            id v16 = [v15 objectAtIndexedSubscript:0];
            int v17 = [v16 intValue];
            int v18 = [v6 objectAtIndexedSubscript:v12];
            id v19 = [v18 objectAtIndexedSubscript:0];
            int v20 = [v19 intValue];

            if (v17 >= v20)
            {
              id v14 = [v6 objectAtIndexedSubscript:v12];
              ++v43;
              id v5 = v40;
            }
            else
            {
              id v5 = v40;
              id v14 = [v40 objectAtIndexedSubscript:v13];
              ++v42;
            }
            unint64_t v11 = v39;
          }
        }
        if (!objc_msgSend(v10, "count", v39)) {
          goto LABEL_15;
        }
        uint64_t v21 = [v10 lastObject];
        uint64_t v22 = [v21 objectAtIndexedSubscript:1];
        int v23 = [v22 intValue];
        int v24 = [v14 objectAtIndexedSubscript:0];
        int v25 = [v24 intValue];

        if (v23 >= v25)
        {
          id v26 = [v14 objectAtIndexedSubscript:1];
          unsigned int v27 = [v26 intValue];

          int v28 = [v10 lastObject];
          double v29 = [v28 objectAtIndexedSubscript:1];
          unsigned int v30 = [v29 intValue];

          if ((int)v27 <= (int)v30) {
            uint64_t v31 = v30;
          }
          else {
            uint64_t v31 = v27;
          }
          int v32 = [v10 lastObject];
          v33 = [v32 objectAtIndexedSubscript:0];
          uint64_t v34 = [v33 intValue];

          [v10 removeLastObject];
          int v35 = [MEMORY[0x1E4F28ED0] numberWithInt:v34];
          v44[0] = v35;
          BOOL v36 = [MEMORY[0x1E4F28ED0] numberWithInt:v31];
          v44[1] = v36;
          v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
          [v10 addObject:v37];
        }
        else
        {
LABEL_15:
          [v10 addObject:v14];
        }

        uint64_t v13 = v42;
        uint64_t v12 = v43;
      }
      while (v11 > v42 || v41 > v43);
    }
  }
  else
  {
    id v10 = v8;
  }

  return v10;
}

- (id)constructIntervalTuplesFromEntries:(id)a3 startOfRange:(id)a4 endOfRange:(id)a5
{
  return [(PLBatteryUIResponseTypeChargingStateIntervals *)self constructIntervalTuplesFromEntries:a3 startOfRange:a4 endOfRange:a5 allowOverflow:0];
}

- (id)constructIntervalTuplesFromEntries:(id)a3 startOfRange:(id)a4 endOfRange:(id)a5 allowOverflow:(BOOL)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = objc_opt_new();
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __133__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__constructIntervalTuplesFromEntries_startOfRange_endOfRange_allowOverflow___block_invoke;
  v21[3] = &unk_1E6E4A370;
  id v22 = v9;
  id v23 = v13;
  BOOL v26 = a6;
  id v24 = v10;
  id v14 = v12;
  id v25 = v14;
  id v15 = v10;
  id v16 = v13;
  id v17 = v9;
  [v11 enumerateObjectsUsingBlock:v21];

  int v18 = v25;
  id v19 = v14;

  return v19;
}

void __133__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__constructIntervalTuplesFromEntries_startOfRange_endOfRange_allowOverflow___block_invoke(uint64_t a1, void *a2)
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = (void *)MEMORY[0x1E4F28ED0];
  id v5 = [v3 entryDate];
  [v5 timeIntervalSinceDate:*(void *)(a1 + 32)];
  id v6 = objc_msgSend(v4, "numberWithDouble:");

  uint64_t v7 = [v3 objectForKeyedSubscript:@"timestampEnd"];

  if (v7)
  {
    unint64_t v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __133__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__constructIntervalTuplesFromEntries_startOfRange_endOfRange_allowOverflow___block_invoke_cold_2(v3);
    }

    id v9 = [v3 objectForKeyedSubscript:@"timestampEnd"];
    id v10 = (void *)MEMORY[0x1E4F28ED0];
    [v9 timeIntervalSinceDate:*(void *)(a1 + 32)];
    id v11 = objc_msgSend(v10, "numberWithDouble:");
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28ED0];
    [*(id *)(a1 + 40) timeIntervalSinceDate:*(void *)(a1 + 32)];
    id v11 = objc_msgSend(v12, "numberWithDouble:");
  }
  if (!*(unsigned char *)(a1 + 64))
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28ED0];
    int v14 = [v6 intValue];
    [*(id *)(a1 + 32) timeIntervalSinceDate:*(void *)(a1 + 32)];
    if (v15 <= (double)v14) {
      double v15 = (double)v14;
    }
    uint64_t v16 = [v13 numberWithDouble:v15];

    id v6 = (void *)v16;
  }
  id v17 = (void *)MEMORY[0x1E4F28ED0];
  int v18 = [v6 intValue];
  int v19 = [v11 intValue];
  if (v18 <= v19) {
    int v18 = v19;
  }
  [*(id *)(a1 + 48) timeIntervalSinceDate:*(void *)(a1 + 32)];
  if (v20 > (double)v18) {
    double v20 = (double)v18;
  }
  uint64_t v21 = [v17 numberWithDouble:v20];

  v24[0] = v6;
  v24[1] = v21;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  id v23 = PLLogCommon();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    __133__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__constructIntervalTuplesFromEntries_startOfRange_endOfRange_allowOverflow___block_invoke_cold_1((uint64_t)v22, (uint64_t)v3, v23);
  }

  [*(id *)(a1 + 56) addObject:v22];
}

- (id)constructIntervalTuplesFromBattEntries:(id)a3 lastBattEntry:(id)a4 startOfRange:(id)a5 endOfRange:(id)a6
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v49 = a5;
  id v10 = PLLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v10, OS_LOG_TYPE_INFO, "Creating charging intervals", buf, 2u);
  }

  id v48 = (id)objc_opt_new();
  if (v9)
  {
    id v11 = [v9 objectForKeyedSubscript:@"IsCharging"];
    char v12 = [v11 BOOLValue];

    uint64_t v13 = PLLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      [(PLBatteryUIResponseTypeChargingIntervals *)v12 run];
    }
  }
  else
  {
    char v12 = 0;
  }
  int v14 = PLLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeChargingStateIntervals(Utilities) constructIntervalTuplesFromBattEntries:lastBattEntry:startOfRange:endOfRange:].cold.4(v8, v12, v14);
  }
  int v46 = v9;

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v47 = v8;
  double v15 = [v8 reverseObjectEnumerator];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (!v16)
  {
    double v19 = 0.0;
    goto LABEL_29;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v51;
  double v19 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v51 != v18) {
        objc_enumerationMutation(v15);
      }
      uint64_t v21 = *(void **)(*((void *)&v50 + 1) + 8 * i);
      id v22 = objc_msgSend(v21, "objectForKeyedSubscript:", @"Level", v46);
      int v23 = [v22 intValue];

      if (v23 < 0)
      {
        double v29 = PLLogCommon();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          [(PLBatteryUIResponseTypeChargingIntervals *)v60 run];
        }
      }
      else
      {
        id v24 = [v21 objectForKeyedSubscript:@"IsCharging"];
        int v25 = [v24 BOOLValue];

        if ((v12 & 1) == v25) {
          continue;
        }
        BOOL v26 = [v21 entryDate];
        [v26 timeIntervalSinceDate:v49];
        double v28 = v27;

        if (v25)
        {
          char v12 = 1;
          double v19 = v28;
          continue;
        }
        unsigned int v30 = [MEMORY[0x1E4F28ED0] numberWithInt:(int)v19];
        v59[0] = v30;
        uint64_t v31 = [MEMORY[0x1E4F28ED0] numberWithInt:(int)v28];
        v59[1] = v31;
        double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];

        [v48 addObject:v29];
        int v32 = PLLogCommon();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v33 = [v29 objectAtIndexedSubscript:0];
          uint64_t v34 = [v29 objectAtIndexedSubscript:1];
          *(_DWORD *)buf = 138412546;
          id v56 = v33;
          __int16 v57 = 2112;
          v58 = v34;
          _os_log_debug_impl(&dword_1E4220000, v32, OS_LOG_TYPE_DEBUG, "Created charging interval: [%@ %@]", buf, 0x16u);
        }
        char v12 = 0;
      }
    }
    uint64_t v17 = [v15 countByEnumeratingWithState:&v50 objects:v62 count:16];
  }
  while (v17);
LABEL_29:

  if (v12)
  {
    int v35 = [v47 firstObject];
    if (v35)
    {
      BOOL v36 = PLLogCommon();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIResponseTypeChargingIntervals run](v36);
      }

      v37 = [v35 entryDate];
      [v37 timeIntervalSinceDate:v49];
      double v39 = v38;

      uint64_t v40 = [MEMORY[0x1E4F28ED0] numberWithInt:(int)v19];
      v54[0] = v40;
      unint64_t v41 = [MEMORY[0x1E4F28ED0] numberWithInt:(int)v39];
      v54[1] = v41;
      int v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];

      [v48 addObject:v42];
      int v43 = PLLogCommon();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIService batteryLevelsAndChargingIntervalsInRange:withDataRange:](v42);
      }
    }
  }
  double v44 = PLLogCommon();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v56 = v48;
    _os_log_impl(&dword_1E4220000, v44, OS_LOG_TYPE_INFO, "Charging intervals: %@", buf, 0xCu);
  }

  return v48;
}

- (id)getApplicableSlowChargingIntervalsGivenECIntervals:(id)a3 slowChargingIntervals:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v36 = v6;
  if ([v5 count] && objc_msgSend(v6, "count"))
  {
    uint64_t v38 = 0;
    double v39 = &v38;
    uint64_t v40 = 0x3032000000;
    unint64_t v41 = __Block_byref_object_copy__15;
    int v42 = __Block_byref_object_dispose__15;
    id v43 = (id)objc_opt_new();
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __133__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__getApplicableSlowChargingIntervalsGivenECIntervals_slowChargingIntervals___block_invoke;
    v37[3] = &unk_1E6E4A398;
    v37[4] = &v38;
    [v5 enumerateObjectsUsingBlock:v37];
    unint64_t v7 = [v5 count];
    unint64_t v35 = [v6 count];
    uint64_t v34 = objc_opt_new();
    if (v7 && v35)
    {
      unint64_t v8 = 0;
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      LODWORD(v9) = 0;
      do
      {
        unint64_t v9 = (int)v9;
        while (1)
        {
          id v10 = objc_msgSend(v5, "objectAtIndexedSubscript:", v8, v32);
          id v11 = [v10 objectAtIndexedSubscript:0];
          int v12 = [v11 intValue];
          uint64_t v13 = [v5 objectAtIndexedSubscript:v8];
          int v14 = [v13 objectAtIndexedSubscript:1];
          int v15 = v12 - [v14 intValue];

          unsigned int v16 = v15 >= 0 ? v15 : -v15;
          if (v16 > 0x12B) {
            break;
          }
          unint64_t v8 = ++v9;
          if (v7 <= v9) {
            goto LABEL_20;
          }
        }
        uint64_t v17 = [(id)v39[5] objectAtIndexedSubscript:v8];
        uint64_t v18 = [v17 objectAtIndexedSubscript:0];
        int v19 = [v18 intValue];
        double v20 = [v36 objectAtIndexedSubscript:v33];
        uint64_t v21 = [v20 objectAtIndexedSubscript:1];
        int v22 = [v21 intValue];

        if (v19 >= v22)
        {
          uint64_t v32 = (v32 + 1);
        }
        else
        {
          int v23 = [(id)v39[5] objectAtIndexedSubscript:v8];
          id v24 = [v23 objectAtIndexedSubscript:1];
          int v25 = [v24 intValue];
          BOOL v26 = [v36 objectAtIndexedSubscript:v33];
          double v27 = [v26 objectAtIndexedSubscript:0];
          int v28 = [v27 intValue];

          if (v25 > v28)
          {
            double v29 = [v5 objectAtIndexedSubscript:v8];
            [v34 addObject:v29];
          }
          LODWORD(v9) = v9 + 1;
        }
        if (v7 <= (int)v9) {
          break;
        }
        unint64_t v8 = (int)v9;
        uint64_t v33 = (int)v32;
      }
      while (v35 > (int)v32);
    }
LABEL_20:
    _Block_object_dispose(&v38, 8);

    unsigned int v30 = v34;
  }
  else
  {
    unsigned int v30 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v30;
}

void __133__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__getApplicableSlowChargingIntervalsGivenECIntervals_slowChargingIntervals___block_invoke(uint64_t a1, void *a2)
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 objectAtIndexedSubscript:1];
  int v5 = [v4 intValue];

  id v6 = [v3 objectAtIndexedSubscript:0];
  double v7 = (double)(int)[v6 intValue] + 60.0;

  double v8 = (double)v5;
  if (v7 <= (double)v5) {
    double v8 = v7;
  }
  uint64_t v9 = (int)v8;
  id v10 = [v3 objectAtIndexedSubscript:1];
  int v11 = [v10 intValue];

  int v12 = [v3 objectAtIndexedSubscript:0];

  double v13 = (double)(int)[v12 intValue] + 300.0;
  double v14 = (double)v11;
  if (v13 <= (double)v11) {
    double v14 = v13;
  }
  uint64_t v15 = (int)v14;
  unsigned int v16 = [MEMORY[0x1E4F28ED0] numberWithInt:v9];
  v19[0] = v16;
  uint64_t v17 = [MEMORY[0x1E4F28ED0] numberWithInt:v15];
  v19[1] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v18];
}

- (id)constructSlowChargingIntervals:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v4;
    _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_INFO, "chargingStateIntervals=%@", buf, 0xCu);
  }

  id v6 = [v4 objectForKeyedSubscript:&unk_1F400DB28];
  double v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v6;
    _os_log_impl(&dword_1E4220000, v7, OS_LOG_TYPE_INFO, "externalConnectedIntervals=%@", buf, 0xCu);
  }

  double v8 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self getChargingStateIntervals:v4 forGraphIntervalType:2];
  uint64_t v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v8;
    _os_log_impl(&dword_1E4220000, v9, OS_LOG_TYPE_INFO, "allSlowChargingIntervals=%@", buf, 0xCu);
  }

  id v10 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self mergeIntervals:v8 withTolerance:60.0];
  int v11 = PLLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v10;
    _os_log_impl(&dword_1E4220000, v11, OS_LOG_TYPE_INFO, "allSlowChargingIntervalsMerged=%@", buf, 0xCu);
  }

  int v12 = [MEMORY[0x1E4F1C978] array];
  if ([v10 count])
  {
    double v13 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self getApplicableSlowChargingIntervalsGivenECIntervals:v6 slowChargingIntervals:v10];

    double v14 = PLLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v13;
      _os_log_impl(&dword_1E4220000, v14, OS_LOG_TYPE_INFO, "sortedAndFilteredSlowChargingIntervals=%@", buf, 0xCu);
    }
  }
  else
  {
    double v13 = v12;
  }
  uint64_t v15 = objc_opt_new();
  if ([v13 count])
  {
    double v29 = v6;
    unsigned int v16 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v17 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self start];
    uint64_t v18 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self start];
    [v17 timeIntervalSinceDate:v18];
    int v19 = objc_msgSend(v16, "numberWithDouble:");

    double v20 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v21 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self end];
    int v22 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self start];
    [v21 timeIntervalSinceDate:v22];
    int v23 = objc_msgSend(v20, "numberWithDouble:");

    v30[0] = v19;
    v30[1] = v23;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    uint64_t v31 = v24;
    int v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];

    BOOL v26 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self intersectionOfTwoSets:v25 intervalSetB:v13];

    double v27 = PLLogCommon();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v26;
      _os_log_impl(&dword_1E4220000, v27, OS_LOG_TYPE_INFO, "Found slow charging intervals=%@", buf, 0xCu);
    }

    [v15 setObject:v26 forKeyedSubscript:&unk_1F400DB40];
    id v6 = v29;
  }
  else
  {
    BOOL v26 = v13;
  }

  return v15;
}

- (id)mergeAllChargingIntervals:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  int v5 = [v3 objectForKeyedSubscript:&unk_1F400DB28];
  id v6 = [v3 objectForKeyedSubscript:&unk_1F400DB58];
  if ([v6 count])
  {
    double v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      double v20 = v6;
      _os_log_impl(&dword_1E4220000, v7, OS_LOG_TYPE_INFO, "adding paused charging intervals =%@", (uint8_t *)&v19, 0xCu);
    }

    [v4 setObject:v6 forKeyedSubscript:@"PLBatteryUIPausedChargingIntervalsKey"];
  }
  double v8 = [v3 objectForKeyedSubscript:&unk_1F400DB40];
  if ([v8 count])
  {
    uint64_t v9 = PLLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      double v20 = v8;
      _os_log_impl(&dword_1E4220000, v9, OS_LOG_TYPE_INFO, "adding slow charging intervals =%@", (uint8_t *)&v19, 0xCu);
    }

    [v4 setObject:v8 forKeyedSubscript:@"PLBatteryUIChargingSpeedIntervalsKey"];
  }
  id v10 = [v3 objectForKeyedSubscript:&unk_1F400DB70];
  if ([v10 count])
  {
    int v11 = PLLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      double v20 = v10;
      _os_log_impl(&dword_1E4220000, v11, OS_LOG_TYPE_INFO, "adding paused slow charging intervals =%@", (uint8_t *)&v19, 0xCu);
    }

    [v4 setObject:v10 forKeyedSubscript:@"PLBatteryUIPausedSlowChargingIntervalsKey"];
  }
  int v12 = [v3 objectForKeyedSubscript:&unk_1F400DB88];
  if ([v12 count])
  {
    double v13 = PLLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      double v20 = v12;
      _os_log_impl(&dword_1E4220000, v13, OS_LOG_TYPE_INFO, "adding stopped charging intervals =%@", (uint8_t *)&v19, 0xCu);
    }

    [v4 setObject:v12 forKeyedSubscript:@"PLBatteryUIStoppedChargingIntervalsKey"];
  }
  double v14 = [v3 objectForKeyedSubscript:&unk_1F400DBA0];
  if ([v14 count])
  {
    uint64_t v15 = PLLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      double v20 = v14;
      _os_log_impl(&dword_1E4220000, v15, OS_LOG_TYPE_INFO, "adding stopped slow charging intervals =%@", (uint8_t *)&v19, 0xCu);
    }

    [v4 setObject:v14 forKeyedSubscript:@"PLBatteryUIStoppedSlowChargingIntervalsKey"];
  }
  if ([v5 count])
  {
    unsigned int v16 = PLLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      double v20 = v5;
      _os_log_impl(&dword_1E4220000, v16, OS_LOG_TYPE_INFO, "adding edited charging intervals =%@", (uint8_t *)&v19, 0xCu);
    }

    [v4 setObject:v5 forKeyedSubscript:@"PLBatteryUIChargingIntervalsKey"];
  }
  uint64_t v17 = PLLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412290;
    double v20 = v4;
    _os_log_impl(&dword_1E4220000, v17, OS_LOG_TYPE_INFO, "charging intervals result =%@", (uint8_t *)&v19, 0xCu);
  }

  return v4;
}

- (id)enforceGraphIntervalPrecedence:(id)a3
{
  *(void *)&v48[5] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a3 mutableCopy];
  uint64_t v4 = 1;
  unint64_t v5 = 0x1E4F28000uLL;
  do
  {
    unint64_t v6 = (v4 + 1);
    unsigned int v43 = v4 + 1;
    do
    {
      double v7 = PLLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        v48[0] = v4;
        LOWORD(v48[1]) = 1024;
        *(_DWORD *)((char *)&v48[1] + 2) = v6;
        _os_log_impl(&dword_1E4220000, v7, OS_LOG_TYPE_INFO, "precedence lower=%d higher=%d", buf, 0xEu);
      }

      double v8 = [*(id *)(v5 + 3792) numberWithInt:v4];
      uint64_t v9 = [v3 objectForKeyedSubscript:v8];

      id v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)id v48 = v9;
        _os_log_impl(&dword_1E4220000, v10, OS_LOG_TYPE_INFO, "lowerPrecedenceIntervals from constructGraphIntervalsWithPrecedence %@=", buf, 0xCu);
      }

      int v11 = [*(id *)(v5 + 3792) numberWithInt:v6];
      int v12 = [v3 objectForKeyedSubscript:v11];

      double v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)id v48 = v12;
        _os_log_impl(&dword_1E4220000, v13, OS_LOG_TYPE_INFO, "higherPrecedenceIntervals from constructGraphIntervalsWithPrecedence %@=", buf, 0xCu);
      }

      double v14 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self intersectionOfTwoSetsWithMergeThreshold:[(PLBatteryUIResponseTypeChargingStateIntervals *)self filterThreshold:(__int16)v4] intervalSetA:v9 intervalSetB:v12];
      if ([v14 count])
      {
        uint64_t v15 = v14;
        unsigned int v16 = v14;
        uint64_t v17 = v12;
        uint64_t v18 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self unionBetweenSetAndIntersectingSet:v16 intervalSetB:v12];
        int v19 = [*(id *)(v5 + 3792) numberWithInt:v6];
        [v3 setObject:v18 forKeyedSubscript:v19];

        double v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = [*(id *)(v5 + 3792) numberWithInt:v6];
          int v22 = [v3 objectForKeyedSubscript:v21];
          *(_DWORD *)buf = 138412290;
          *(void *)id v48 = v22;
          _os_log_impl(&dword_1E4220000, v20, OS_LOG_TYPE_INFO, "higher precedence after merging=%@", buf, 0xCu);
        }
        int v12 = v17;
        double v14 = v15;
      }
      int v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)id v48 = v14;
        _os_log_impl(&dword_1E4220000, v23, OS_LOG_TYPE_INFO, "lowerIntersectsHigher from constructGraphIntervalsWithPrecedence %@=", buf, 0xCu);
      }

      id v24 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self differenceBetweenSetAndIntersectingSet:v9 intervalSetB:v14];
      int v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)id v48 = v24;
        _os_log_impl(&dword_1E4220000, v25, OS_LOG_TYPE_INFO, "lowerWithoutHigher from constructGraphIntervalsWithPrecedence %@=", buf, 0xCu);
      }

      if ([v24 count])
      {
        BOOL v26 = [*(id *)(v5 + 3792) numberWithInt:v4];
        [v3 objectForKeyedSubscript:v26];
        double v45 = v9;
        v28 = unint64_t v27 = v5;
        double v29 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self intersectionOfTwoSets:v28 intervalSetB:v24];

        unsigned int v30 = [*(id *)(v27 + 3792) numberWithInt:v4];
        [v3 objectForKeyedSubscript:v30];
        double v44 = v24;
        uint64_t v31 = v12;
        int v32 = v6;
        v33 = unint64_t v6 = (unint64_t)v3;

        unint64_t v5 = v27;
        uint64_t v9 = v45;
        uint64_t v34 = [*(id *)(v5 + 3792) numberWithInt:v4];
        BOOL v35 = v33 == 0;
        id v3 = (void *)v6;
        LODWORD(v6) = v32;
        int v12 = v31;
        id v24 = v44;
        if (v35) {
          BOOL v36 = v44;
        }
        else {
          BOOL v36 = v29;
        }
        v37 = v3;
      }
      else
      {
        double v29 = objc_opt_new();
        uint64_t v34 = [*(id *)(v5 + 3792) numberWithInt:v4];
        v37 = v3;
        BOOL v36 = v29;
      }
      [v37 setObject:v36 forKeyedSubscript:v34];

      unint64_t v6 = (v6 + 1);
    }
    while (v6 != 7);
    uint64_t v4 = v43;
  }
  while (v43 != 6);
  [*(id *)(v5 + 3792) numberWithInt:6];
  double v39 = v38 = v5;
  uint64_t v40 = [v3 objectForKeyedSubscript:v39];

  unint64_t v41 = [*(id *)(v38 + 3792) numberWithInt:6];
  [v3 setObject:v40 forKeyedSubscript:v41];

  return v3;
}

- (id)mapChargingStateIntervalsToGraphIntervals:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v54 = (uint64_t)v4;
    _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_INFO, "chargingStateIntervals=%@", buf, 0xCu);
  }

  uint64_t v6 = [v4 objectForKeyedSubscript:&unk_1F400DB28];
  double v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v54 = v6;
    _os_log_impl(&dword_1E4220000, v7, OS_LOG_TYPE_INFO, "externalConnectedIntervals=%@", buf, 0xCu);
  }

  id v49 = (void *)v6;
  uint64_t v8 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self mergeIntervals:v6 withTolerance:60.0];
  uint64_t v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v54 = v8;
    _os_log_impl(&dword_1E4220000, v9, OS_LOG_TYPE_INFO, "allExternalConnectedIntervalsMerged=%@", buf, 0xCu);
  }

  id v48 = (void *)v8;
  id v10 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self filterIntervals:v8 withThreshold:60.0];
  [v4 setObject:v10 forKeyedSubscript:&unk_1F400DB28];
  int v11 = objc_opt_new();
  if ([MEMORY[0x1E4F92A10] supportsSlowCharging])
  {
    uint64_t v12 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self constructSlowChargingIntervals:v4];

    int v11 = (void *)v12;
  }
  double v13 = (void *)MEMORY[0x1E4F28ED0];
  double v14 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self start];
  uint64_t v15 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self start];
  [v14 timeIntervalSinceDate:v15];
  uint64_t v16 = objc_msgSend(v13, "numberWithDouble:");

  uint64_t v17 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v18 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self end];
  int v19 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self start];
  [v18 timeIntervalSinceDate:v19];
  uint64_t v20 = objc_msgSend(v17, "numberWithDouble:");

  int v46 = (void *)v20;
  uint64_t v47 = (void *)v16;
  v51[0] = v16;
  v51[1] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  long long v52 = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];

  double v45 = (void *)v22;
  int v23 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self intersectionOfTwoSets:v22 intervalSetB:v10];

  [v11 setObject:v23 forKeyedSubscript:&unk_1F400DB28];
  id v24 = PLLogCommon();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v54 = (uint64_t)v11;
    _os_log_impl(&dword_1E4220000, v24, OS_LOG_TYPE_INFO, "chargingEntries after slow charging determination is %@=", buf, 0xCu);
  }

  id v25 = v23;
  uint64_t v26 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self getChargingStateIntervals:v4 forGraphIntervalType:3];
  long long v50 = v4;
  uint64_t v27 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self getChargingStateIntervals:v4 forGraphIntervalType:4];
  double v44 = (void *)v26;
  uint64_t v28 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self filterIntervals:v26 withThreshold:900.0];
  unsigned int v43 = (void *)v27;
  uint64_t v29 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self filterIntervals:v27 withThreshold:900.0];
  int v42 = (void *)v28;
  uint64_t v30 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self mergeIntervals:v28 withTolerance:60.0];
  unint64_t v41 = (void *)v29;
  uint64_t v31 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self mergeIntervals:v29 withTolerance:60.0];
  uint64_t v40 = (void *)v30;
  int v32 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self intersectionOfTwoSets:v25 intervalSetB:v30];
  [v11 setObject:v32 forKeyedSubscript:&unk_1F400DB58];
  id v33 = [v11 objectForKeyedSubscript:&unk_1F400DB40];
  uint64_t v34 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self intersectionOfTwoSets:v33 intervalSetB:v32];
  if ([v34 count]) {
    [v11 setObject:v34 forKeyedSubscript:&unk_1F400DB70];
  }
  BOOL v35 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self intersectionOfTwoSets:v25 intervalSetB:v31];
  [v11 setObject:v35 forKeyedSubscript:&unk_1F400DB88];
  BOOL v36 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self intersectionOfTwoSets:v33 intervalSetB:v35];
  if ([v36 count]) {
    [v11 setObject:v36 forKeyedSubscript:&unk_1F400DBA0];
  }
  v37 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self enforceGraphIntervalPrecedence:v11];

  unint64_t v38 = [(PLBatteryUIResponseTypeChargingStateIntervals *)self mergeAllChargingIntervals:v37];

  return v38;
}

- (id)getChargingStateIntervals:(id)a3 forGraphIntervalType:(signed __int16)a4
{
  id v6 = a3;
  double v7 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__getChargingStateIntervals_forGraphIntervalType___block_invoke;
  void v12[3] = &unk_1E6E4A3C0;
  signed __int16 v14 = a4;
  void v12[4] = self;
  id v8 = v7;
  id v13 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];

  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

void __107__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__getChargingStateIntervals_forGraphIntervalType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = (__int16 *)(a1 + 48);
  switch(*(_WORD *)(a1 + 48))
  {
    case 1:
      if ([v5 intValue] == 1) {
        goto LABEL_11;
      }
      break;
    case 2:
      if ([MEMORY[0x1E4F92A10] supportsSlowCharging]
        && objc_msgSend(*(id *)(a1 + 32), "isChargingSpeedIntervalType:", (__int16)objc_msgSend(v5, "intValue")))
      {
        goto LABEL_11;
      }
      break;
    case 3:
      if (objc_msgSend(*(id *)(a1 + 32), "isPausedChargingIntervalType:", (__int16)objc_msgSend(v5, "intValue")))goto LABEL_11; {
      break;
      }
    case 4:
      if (objc_msgSend(*(id *)(a1 + 32), "isStoppedChargingIntervalType:", (__int16)objc_msgSend(v5, "intValue")))LABEL_11:objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v6); {
      break;
      }
    default:
      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __107__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__getChargingStateIntervals_forGraphIntervalType___block_invoke_cold_1(v7, v8);
      }

      break;
  }
}

- (int)filterThreshold:(signed __int16)a3
{
  if ((a3 - 3) >= 4) {
    return 60;
  }
  else {
    return 900;
  }
}

- (BOOL)isPausedChargingIntervalType:(signed __int16)a3
{
  return (a3 < 8) & (0xDCu >> a3);
}

- (BOOL)isStoppedChargingIntervalType:(signed __int16)a3
{
  return a3 == 5 || a3 == 8;
}

- (BOOL)isChargingSpeedIntervalType:(signed __int16)a3
{
  return a3 == 9;
}

void __133__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__constructIntervalTuplesFromEntries_startOfRange_endOfRange_allowOverflow___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "adding interval=%@ for entry=%@", (uint8_t *)&v3, 0x16u);
}

void __133__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__constructIntervalTuplesFromEntries_startOfRange_endOfRange_allowOverflow___block_invoke_cold_2(void *a1)
{
  uint64_t v7 = [a1 objectForKeyedSubscript:@"timestampEnd"];
  OUTLINED_FUNCTION_10(&dword_1E4220000, v1, v2, "entry=%@, entry[timestampEnd]=%@", v3, v4, v5, v6, 2u);
}

void __107__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__getChargingStateIntervals_forGraphIntervalType___block_invoke_cold_1(__int16 *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1E4220000, a2, OS_LOG_TYPE_ERROR, "Unrecognized graphIntervalType=%d", (uint8_t *)v3, 8u);
}

@end