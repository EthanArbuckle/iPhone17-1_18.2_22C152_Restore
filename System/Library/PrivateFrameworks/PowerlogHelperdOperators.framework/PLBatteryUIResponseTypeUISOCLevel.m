@interface PLBatteryUIResponseTypeUISOCLevel
- (BOOL)dateIntervals:(id)a3 containDate:(id)a4;
- (NSArray)battEntries;
- (NSArray)lpmEntries;
- (NSArray)resultArray;
- (NSDate)end;
- (NSDate)start;
- (PLBatteryUIResponderService)responderService;
- (PLEntry)lastBattEntry;
- (PLEntry)lastLPMEntry;
- (double)bucketSize;
- (id)dependencies;
- (id)entriesInRange:(_PLTimeIntervalRange)a3 fromEntries:(id)a4;
- (id)getLPMIntervalsSpanningRange:(_PLTimeIntervalRange)a3;
- (id)result;
- (int)criticalLevel;
- (void)configure:(id)a3;
- (void)run;
- (void)setBattEntries:(id)a3;
- (void)setBucketSize:(double)a3;
- (void)setEnd:(id)a3;
- (void)setLastBattEntry:(id)a3;
- (void)setLastLPMEntry:(id)a3;
- (void)setLpmEntries:(id)a3;
- (void)setResponderService:(id)a3;
- (void)setResultArray:(id)a3;
- (void)setStart:(id)a3;
@end

@implementation PLBatteryUIResponseTypeUISOCLevel

- (id)dependencies
{
  return 0;
}

- (void)configure:(id)a3
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"start"];
  [v5 doubleValue];
  double v7 = v6;

  v8 = [v4 objectForKeyedSubscript:@"end"];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v7];
  [(PLBatteryUIResponseTypeUISOCLevel *)self setStart:v11];

  v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v10];
  [(PLBatteryUIResponseTypeUISOCLevel *)self setEnd:v12];

  v13 = [(PLBatteryUIResponseTypeUISOCLevel *)self start];
  v14 = [(PLBatteryUIResponseTypeUISOCLevel *)self end];
  [v13 timeIntervalSince1970];
  double v16 = v15;
  [v14 timeIntervalSince1970];
  double v18 = v17 - v16;

  v19 = [v4 objectForKeyedSubscript:@"bucket"];

  [v19 doubleValue];
  -[PLBatteryUIResponseTypeUISOCLevel setBucketSize:](self, "setBucketSize:");

  id v20 = objc_alloc(MEMORY[0x1E4F92A90]);
  v21 = [MEMORY[0x1E4F28ED0] numberWithDouble:v16];
  v22 = (void *)[v20 initWithKey:@"timestamp" withValue:v21 withComparisonOperation:5];

  v23 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"Level" withValue:&unk_1F400C988 withComparisonOperation:3];
  v24 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BatteryUI"];
  v25 = [(PLBatteryUIResponseTypeUISOCLevel *)self responderService];
  v26 = [v25 storage];
  v40[0] = v22;
  v40[1] = v23;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  v28 = [v26 lastEntryForKey:v24 withComparisons:v27 isSingleton:0];
  [(PLBatteryUIResponseTypeUISOCLevel *)self setLastBattEntry:v28];

  v29 = [(PLBatteryUIResponseTypeUISOCLevel *)self responderService];
  v30 = [v29 storage];
  v31 = objc_msgSend(v30, "entriesForKey:inTimeRange:withFilters:", v24, 0, v16, v18);
  [(PLBatteryUIResponseTypeUISOCLevel *)self setBattEntries:v31];

  v32 = [(PLBatteryUIResponseTypeUISOCLevel *)self responderService];
  v33 = [v32 storage];
  v39 = v22;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  v35 = [v33 lastEntryForKey:@"PLDuetService_EventForward_BatterySaverMode" withComparisons:v34 isSingleton:0];
  [(PLBatteryUIResponseTypeUISOCLevel *)self setLastLPMEntry:v35];

  v36 = [(PLBatteryUIResponseTypeUISOCLevel *)self responderService];
  v37 = [v36 storage];
  v38 = objc_msgSend(v37, "entriesForKey:inTimeRange:withFilters:", @"PLDuetService_EventForward_BatterySaverMode", 0, v16, v18);
  [(PLBatteryUIResponseTypeUISOCLevel *)self setLpmEntries:v38];
}

- (void)run
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "Calculating %d battery level buckets", (uint8_t *)v2, 8u);
}

- (id)result
{
  [(PLBatteryUIResponseTypeUISOCLevel *)self setBattEntries:0];
  [(PLBatteryUIResponseTypeUISOCLevel *)self setLpmEntries:0];
  [(PLBatteryUIResponseTypeUISOCLevel *)self setLastLPMEntry:0];
  [(PLBatteryUIResponseTypeUISOCLevel *)self setLastBattEntry:0];
  return [(PLBatteryUIResponseTypeUISOCLevel *)self resultArray];
}

- (id)entriesInRange:(_PLTimeIntervalRange)a3 fromEntries:(id)a4
{
  double length = a3.length;
  double location = a3.location;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    double v12 = location + length;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "entryDate", (void)v21);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          double v16 = v15;
          [v15 timeIntervalSince1970];
          double v18 = v17;

          if (location <= v18 && v18 < v12) {
            [v7 addObject:v14];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v7;
}

- (BOOL)dateIntervals:(id)a3 containDate:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v7 = v6;
  LOBYTE(v8) = 0;
  if (v5 && v6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v9 = v5;
    uint64_t v8 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v9);
          }
          if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "containsDate:", v7, (void)v13))
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v8 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v8;
}

- (id)getLPMIntervalsSpanningRange:(_PLTimeIntervalRange)a3
{
  double length = a3.length;
  double location = a3.location;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeUISOCLevel getLPMIntervalsSpanningRange:].cold.6(v6);
  }

  id v53 = (id)objc_opt_new();
  double v7 = [(PLBatteryUIResponseTypeUISOCLevel *)self lastLPMEntry];

  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v8 = [(PLBatteryUIResponseTypeUISOCLevel *)self lastLPMEntry];
  id v9 = [v8 objectForKeyedSubscript:@"Value"];
  int v10 = [v9 BOOLValue];

  uint64_t v11 = PLLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeUISOCLevel getLPMIntervalsSpanningRange:].cold.5(v10, v11);
  }

  if (v10)
  {
    double v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:location];
    char v13 = 1;
  }
  else
  {
LABEL_8:
    double v12 = 0;
    char v13 = 0;
  }
  long long v14 = PLLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    long long v15 = [(PLBatteryUIResponseTypeUISOCLevel *)self lastLPMEntry];
    *(_DWORD *)buf = 138413058;
    *(void *)v61 = v15;
    *(_WORD *)&v61[8] = 2112;
    *(void *)&v61[10] = v12;
    __int16 v62 = 2048;
    double v63 = location;
    __int16 v64 = 2048;
    double v65 = length;
    _os_log_impl(&dword_1E4220000, v14, OS_LOG_TYPE_INFO, "lastLPMEntry=%@, startOfInterval=%@, range.location=%f, range.length=%f", buf, 0x2Au);
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v50 = self;
  long long v16 = [(PLBatteryUIResponseTypeUISOCLevel *)self lpmEntries];
  double v17 = [v16 reverseObjectEnumerator];

  uint64_t v18 = v17;
  uint64_t v19 = [v17 countByEnumeratingWithState:&v56 objects:v72 count:16];
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v57;
    *(void *)&long long v20 = 138412290;
    long long v49 = v20;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v57 != v22) {
          objc_enumerationMutation(v18);
        }
        long long v24 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        v25 = objc_msgSend(v24, "objectForKeyedSubscript:", @"Value", v49);
        int v26 = [v25 BOOLValue];

        v27 = PLLogCommon();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v61 = v26;
          *(_WORD *)&v61[4] = 2112;
          *(void *)&v61[6] = v24;
          _os_log_impl(&dword_1E4220000, v27, OS_LOG_TYPE_INFO, "LPM Entry: %d %@", buf, 0x12u);
        }

        if ((v13 & 1) == v26)
        {
          v30 = PLLogCommon();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
            [(PLBatteryUIService *)&v54 getLPMIntervalsSpanningRange:v30];
          }
        }
        else
        {
          uint64_t v28 = [v24 entryDate];
          v29 = (void *)v28;
          if (v26)
          {
            char v13 = 1;
            v30 = v12;
            double v12 = v28;
          }
          else
          {
            uint64_t v31 = [v12 compare:v28];

            if (v31 == 1)
            {
              v30 = PLLogCommon();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
              {
                v52 = [v24 entryDate];
                v51 = [(PLBatteryUIResponseTypeUISOCLevel *)v50 lastLPMEntry];
                uint64_t v32 = [(PLBatteryUIResponseTypeUISOCLevel *)v50 lpmEntries];
                *(_DWORD *)buf = 138413826;
                *(void *)v61 = v12;
                *(_WORD *)&v61[8] = 2112;
                *(void *)&v61[10] = v52;
                __int16 v62 = 2048;
                double v63 = location;
                __int16 v64 = 2048;
                double v65 = length;
                __int16 v66 = 2112;
                v67 = v51;
                __int16 v68 = 2112;
                v69 = v24;
                __int16 v70 = 2112;
                v33 = (void *)v32;
                uint64_t v71 = v32;
                _os_log_fault_impl(&dword_1E4220000, v30, OS_LOG_TYPE_FAULT, "LOOP CASE: startOfInterval=%@ greater than lpmEntry.entryDate=%@, range.location=%f, range.length=%f, lastLPMEntry=%@, lpmEntry=%@, lpmEntries=%@", buf, 0x48u);
              }
            }
            else
            {
              id v34 = objc_alloc(MEMORY[0x1E4F28C18]);
              v35 = [v24 entryDate];
              v30 = [v34 initWithStartDate:v12 endDate:v35];

              [v53 addObject:v30];
              v36 = PLLogCommon();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v49;
                *(void *)v61 = v30;
                _os_log_debug_impl(&dword_1E4220000, v36, OS_LOG_TYPE_DEBUG, "Created LPM interval %@", buf, 0xCu);
              }

              double v12 = 0;
              char v13 = 0;
            }
          }
        }
      }
      uint64_t v21 = [v18 countByEnumeratingWithState:&v56 objects:v72 count:16];
    }
    while (v21);
  }

  if (v13)
  {
    v37 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:location + length];
    uint64_t v38 = [v12 compare:v37];

    v39 = PLLogCommon();
    v40 = v39;
    if (v38 == 1)
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      {
        v41 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:location + length];
        v42 = [(PLBatteryUIResponseTypeUISOCLevel *)v50 lastLPMEntry];
        v43 = [(PLBatteryUIResponseTypeUISOCLevel *)v50 lpmEntries];
        *(_DWORD *)buf = 138413570;
        *(void *)v61 = v12;
        *(_WORD *)&v61[8] = 2112;
        *(void *)&v61[10] = v41;
        __int16 v62 = 2048;
        double v63 = location;
        __int16 v64 = 2048;
        double v65 = length;
        __int16 v66 = 2112;
        v67 = v42;
        __int16 v68 = 2112;
        v69 = v43;
        _os_log_fault_impl(&dword_1E4220000, v40, OS_LOG_TYPE_FAULT, "TAIL CASE: startOfInterval=%@ greater than endDate=%@, range.location=%f, range.length=%f, lastLPMEntry=%@, lpmEntries=%@", buf, 0x3Eu);
      }
      goto LABEL_42;
    }
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypeUISOCLevel getLPMIntervalsSpanningRange:](v40);
    }

    id v44 = objc_alloc(MEMORY[0x1E4F28C18]);
    v45 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:location + length];
    v46 = (void *)[v44 initWithStartDate:v12 endDate:v45];

    [v53 addObject:v46];
    v47 = PLLogCommon();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypeUISOCLevel getLPMIntervalsSpanningRange:]((uint64_t)v46, v47);
    }
  }
  v40 = PLLogCommon();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypeUISOCLevel getLPMIntervalsSpanningRange:]((uint64_t)v53, v40);
  }
LABEL_42:

  return v53;
}

- (int)criticalLevel
{
  if ([MEMORY[0x1E4F92A38] isiPad]) {
    return 10;
  }
  else {
    return 20;
  }
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponderService:(id)a3
{
}

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStart:(id)a3
{
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEnd:(id)a3
{
}

- (double)bucketSize
{
  return self->_bucketSize;
}

- (void)setBucketSize:(double)a3
{
  self->_bucketSize = a3;
}

- (NSArray)battEntries
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBattEntries:(id)a3
{
}

- (PLEntry)lastBattEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastBattEntry:(id)a3
{
}

- (NSArray)lpmEntries
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLpmEntries:(id)a3
{
}

- (PLEntry)lastLPMEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastLPMEntry:(id)a3
{
}

- (NSArray)resultArray
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setResultArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultArray, 0);
  objc_storeStrong((id *)&self->_lastLPMEntry, 0);
  objc_storeStrong((id *)&self->_lpmEntries, 0);
  objc_storeStrong((id *)&self->_lastBattEntry, 0);
  objc_storeStrong((id *)&self->_battEntries, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

- (void)getLPMIntervalsSpanningRange:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "LPM intervals: %@", (uint8_t *)&v2, 0xCu);
}

- (void)getLPMIntervalsSpanningRange:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "Created LPM interval %@", (uint8_t *)&v2, 0xCu);
}

- (void)getLPMIntervalsSpanningRange:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "Closing open LPM interval", v1, 2u);
}

- (void)getLPMIntervalsSpanningRange:(char)a1 .cold.5(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "Last Entry LpmEnabled: %d", (uint8_t *)v2, 8u);
}

- (void)getLPMIntervalsSpanningRange:(os_log_t)log .cold.6(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "Creating LPM intervals", v1, 2u);
}

@end