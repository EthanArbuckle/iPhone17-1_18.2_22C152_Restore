@interface SignpostMetrics
+ (id)_deltaDescription:(id)a3;
+ (id)_newMetricsFromData:(id)a3;
+ (id)newMetricsForSignpostEvent:(id)a3;
- (NSData)binarySnapshot;
- (NSNumber)cpuInstructionsKI;
- (NSNumber)cpuTimeNsec;
- (NSNumber)dirtyMemoryKB;
- (NSNumber)dirtyMemoryLifetimePeakKB;
- (NSNumber)storageDirtiedKB;
- (SignpostMetrics)initWithSnapshotDict:(id)a3 data:(id)a4;
- (id)debugDescription;
@end

@implementation SignpostMetrics

+ (id)newMetricsForSignpostEvent:(id)a3
{
  id v4 = a3;
  if (([v4 _overridesOwnTime] & 1) == 0)
  {
    v6 = [v4 metadataSegments];
    v7 = [v6 lastObject];

    if (v7)
    {
      v8 = [v7 placeholderTokens];
      v9 = [v8 lastObject];
      if (([@"signpost:metrics" isEqual:v9] & 1) == 0)
      {

        v5 = 0;
        goto LABEL_9;
      }
      v10 = [v7 argument];
      int v11 = [v10 type];

      if (v11 == 2)
      {
        v12 = [v7 argument];
        v8 = [v12 argumentObject];

        v5 = (void *)[a1 _newMetricsFromData:v8];
LABEL_9:

        goto LABEL_10;
      }
    }
    v5 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v5 = 0;
LABEL_11:

  return v5;
}

- (SignpostMetrics)initWithSnapshotDict:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SignpostMetrics;
  v8 = [(SignpostMetrics *)&v22 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v8->_binarySnapshot, a4);
  uint64_t v10 = [v6 objectForKeyedSubscript:@"cpu_time"];
  cpuTimeNsec = v9->_cpuTimeNsec;
  v9->_cpuTimeNsec = (NSNumber *)v10;

  v12 = [(SignpostMetrics *)v9 cpuTimeNsec];

  if (v12)
  {
    uint64_t v13 = [v6 objectForKeyedSubscript:@"current_mem"];
    dirtyMemoryKB = v9->_dirtyMemoryKB;
    v9->_dirtyMemoryKB = (NSNumber *)v13;

    v12 = [(SignpostMetrics *)v9 dirtyMemoryKB];

    if (v12)
    {
      uint64_t v15 = [v6 objectForKeyedSubscript:@"lifetime_peak"];
      dirtyMemoryLifetimePeakKB = v9->_dirtyMemoryLifetimePeakKB;
      v9->_dirtyMemoryLifetimePeakKB = (NSNumber *)v15;

      v12 = [(SignpostMetrics *)v9 dirtyMemoryLifetimePeakKB];

      if (v12)
      {
        uint64_t v17 = [v6 objectForKeyedSubscript:@"storage_dirtied"];
        storageDirtiedKB = v9->_storageDirtiedKB;
        v9->_storageDirtiedKB = (NSNumber *)v17;

        v12 = [(SignpostMetrics *)v9 storageDirtiedKB];

        if (v12)
        {
          uint64_t v19 = [v6 objectForKeyedSubscript:@"cpu_instrs"];
          cpuInstructionsKI = v9->_cpuInstructionsKI;
          v9->_cpuInstructionsKI = (NSNumber *)v19;

LABEL_7:
          v12 = v9;
        }
      }
    }
  }

  return v12;
}

+ (id)_newMetricsFromData:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    id v50 = 0;
    v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:&v50];
    id v6 = v50;
    id v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (!v8)
    {
      v9 = _signpost_debug_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        +[SignpostMetrics _newMetricsFromData:v9];
      }
LABEL_18:
      uint64_t v10 = 0;
LABEL_32:

      goto LABEL_33;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = _signpost_debug_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        +[SignpostMetrics _newMetricsFromData:].cold.6(v9, v13, v14, v15, v16, v17, v18, v19);
      }
      goto LABEL_18;
    }
    v9 = v5;
    if ([v9 count] != 1)
    {
      int v11 = _signpost_debug_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        +[SignpostMetrics _newMetricsFromData:].cold.5(v11, v20, v21, v22, v23, v24, v25, v26);
      }
      uint64_t v10 = 0;
      goto LABEL_31;
    }
    int v11 = [v9 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [v11 objectForKeyedSubscript:@"meas"];
      if (v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [[SignpostMetrics alloc] initWithSnapshotDict:v12 data:v4];
LABEL_30:

LABEL_31:
          goto LABEL_32;
        }
        v34 = _signpost_debug_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          +[SignpostMetrics _newMetricsFromData:](v34, v42, v43, v44, v45, v46, v47, v48);
        }
      }
      else
      {
        v34 = _signpost_debug_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          +[SignpostMetrics _newMetricsFromData:](v34, v35, v36, v37, v38, v39, v40, v41);
        }
      }
    }
    else
    {
      v12 = _signpost_debug_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        +[SignpostMetrics _newMetricsFromData:].cold.4(v12, v27, v28, v29, v30, v31, v32, v33);
      }
    }
    uint64_t v10 = 0;
    goto LABEL_30;
  }
  uint64_t v10 = 0;
LABEL_33:

  return v10;
}

- (id)debugDescription
{
  id v3 = NSString;
  id v4 = [(SignpostMetrics *)self cpuTimeNsec];
  v5 = [(SignpostMetrics *)self dirtyMemoryKB];
  id v6 = [(SignpostMetrics *)self dirtyMemoryLifetimePeakKB];
  id v7 = [(SignpostMetrics *)self storageDirtiedKB];
  BOOL v8 = [(SignpostMetrics *)self cpuInstructionsKI];
  if (v8)
  {
    v9 = NSString;
    uint64_t v10 = [(SignpostMetrics *)self cpuInstructionsKI];
    int v11 = [v9 stringWithFormat:@"CPU Instructions:\t%@ kI", v10];
    v12 = [v3 stringWithFormat:@"CPU Time:\t%@ ns\nDirty Memory:\t%@ kB\nDirty Memory (Peak):\t%@ kB\nStorage Dirtied:\t%@ kB\n%@", v4, v5, v6, v7, v11];
  }
  else
  {
    v12 = [v3 stringWithFormat:@"CPU Time:\t%@ ns\nDirty Memory:\t%@ kB\nDirty Memory (Peak):\t%@ kB\nStorage Dirtied:\t%@ kB\n%@", v4, v5, v6, v7, &stru_1EF807BF0];
  }

  return v12;
}

+ (id)_deltaDescription:(id)a3
{
  id v3 = a3;
  id v4 = [v3 beginEvent];
  uint64_t v5 = [v4 metrics];

  id v6 = [v3 endEvent];
  uint64_t v7 = [v6 metrics];

  if (v5 | v7)
  {
    if (!v5 || v7)
    {
      if (v5 || !v7)
      {
        if (!v5) {
          goto LABEL_12;
        }
        if (!v7) {
          goto LABEL_12;
        }
        uint64_t v10 = [v3 beginEvent];
        int v11 = [v10 processID];
        v12 = [v3 endEvent];
        int v13 = [v12 processID];

        if (v11 != v13)
        {
          BOOL v8 = @"Begin and End PID differ";
        }
        else
        {
LABEL_12:
          BOOL v8 = [MEMORY[0x1E4F28E78] string];
          uint64_t v14 = [(id)v7 cpuTimeNsec];
          uint64_t v15 = [v14 unsignedLongLongValue];
          uint64_t v16 = [(id)v5 cpuTimeNsec];
          uint64_t v17 = [v16 unsignedLongLongValue];

          if (v15 != v17)
          {
            uint64_t v18 = NSString;
            uint64_t v19 = [(id)v7 cpuTimeNsec];
            uint64_t v20 = [v19 unsignedLongLongValue];
            uint64_t v21 = [(id)v5 cpuTimeNsec];
            uint64_t v22 = objc_msgSend(v18, "stringWithFormat:", @"%s Delta:\t%lld %s\n", "CPU Time", v20 - objc_msgSend(v21, "unsignedLongLongValue"), "ns");
            [(__CFString *)v8 appendString:v22];
          }
          uint64_t v23 = [(id)v7 cpuInstructionsKI];
          uint64_t v24 = [v23 unsignedLongLongValue];
          uint64_t v25 = [(id)v5 cpuInstructionsKI];
          uint64_t v26 = [v25 unsignedLongLongValue];

          if (v24 != v26)
          {
            uint64_t v27 = NSString;
            uint64_t v28 = [(id)v7 cpuInstructionsKI];
            uint64_t v29 = [v28 unsignedLongLongValue];
            uint64_t v30 = [(id)v5 cpuInstructionsKI];
            uint64_t v31 = objc_msgSend(v27, "stringWithFormat:", @"%s Delta:\t%lld %s\n", "CPU Instructions", v29 - objc_msgSend(v30, "unsignedLongLongValue"), "kI");
            [(__CFString *)v8 appendString:v31];
          }
          uint64_t v32 = [(id)v7 dirtyMemoryKB];
          uint64_t v33 = [v32 unsignedLongLongValue];
          v34 = [(id)v5 dirtyMemoryKB];
          uint64_t v35 = [v34 unsignedLongLongValue];

          if (v33 != v35)
          {
            uint64_t v36 = NSString;
            uint64_t v37 = [(id)v7 dirtyMemoryKB];
            uint64_t v38 = [v37 unsignedLongLongValue];
            uint64_t v39 = [(id)v5 dirtyMemoryKB];
            uint64_t v40 = objc_msgSend(v36, "stringWithFormat:", @"%s Delta:\t%lld %s\n", "Dirty Memory", v38 - objc_msgSend(v39, "unsignedLongLongValue"), "kB");
            [(__CFString *)v8 appendString:v40];
          }
          uint64_t v41 = [(id)v7 dirtyMemoryLifetimePeakKB];
          uint64_t v42 = [v41 unsignedLongLongValue];
          uint64_t v43 = [(id)v5 dirtyMemoryLifetimePeakKB];
          uint64_t v44 = [v43 unsignedLongLongValue];

          if (v42 != v44)
          {
            uint64_t v45 = NSString;
            uint64_t v46 = [(id)v7 dirtyMemoryLifetimePeakKB];
            uint64_t v47 = [v46 unsignedLongLongValue];
            uint64_t v48 = [(id)v5 dirtyMemoryLifetimePeakKB];
            v49 = objc_msgSend(v45, "stringWithFormat:", @"%s Delta:\t%lld %s\n", "Dirty Memory (Peak)", v47 - objc_msgSend(v48, "unsignedLongLongValue"), "kB");
            [(__CFString *)v8 appendString:v49];
          }
          id v50 = [(id)v7 storageDirtiedKB];
          uint64_t v51 = [v50 unsignedLongLongValue];
          v52 = [(id)v5 storageDirtiedKB];
          uint64_t v53 = [v52 unsignedLongLongValue];

          if (v51 != v53)
          {
            v54 = NSString;
            v55 = [(id)v7 storageDirtiedKB];
            uint64_t v56 = [v55 unsignedLongLongValue];
            v57 = [(id)v5 storageDirtiedKB];
            v58 = objc_msgSend(v54, "stringWithFormat:", @"%s Delta:\t%lld %s\n", "Dirtied Storage", v56 - objc_msgSend(v57, "unsignedLongLongValue"), "kB");
            [(__CFString *)v8 appendString:v58];
          }
        }
      }
      else
      {
        BOOL v8 = @"No begin event metrics";
      }
    }
    else
    {
      BOOL v8 = @"No end event metrics";
    }
    v9 = [NSString stringWithFormat:@"\nPerformance Metrics Deltas:\n%@\n\n", v8];
  }
  else
  {
    v9 = &stru_1EF807BF0;
  }

  return v9;
}

- (NSData)binarySnapshot
{
  return self->_binarySnapshot;
}

- (NSNumber)cpuTimeNsec
{
  return self->_cpuTimeNsec;
}

- (NSNumber)dirtyMemoryKB
{
  return self->_dirtyMemoryKB;
}

- (NSNumber)dirtyMemoryLifetimePeakKB
{
  return self->_dirtyMemoryLifetimePeakKB;
}

- (NSNumber)storageDirtiedKB
{
  return self->_storageDirtiedKB;
}

- (NSNumber)cpuInstructionsKI
{
  return self->_cpuInstructionsKI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cpuInstructionsKI, 0);
  objc_storeStrong((id *)&self->_storageDirtiedKB, 0);
  objc_storeStrong((id *)&self->_dirtyMemoryLifetimePeakKB, 0);
  objc_storeStrong((id *)&self->_dirtyMemoryKB, 0);
  objc_storeStrong((id *)&self->_cpuTimeNsec, 0);

  objc_storeStrong((id *)&self->_binarySnapshot, 0);
}

+ (void)_newMetricsFromData:(NSObject *)a3 .cold.1(char a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v5 = [a2 localizedDescription];
  }
  else
  {
    uint64_t v5 = @"Unknown";
  }
  int v6 = 136315394;
  uint64_t v7 = "+[SignpostMetrics _newMetricsFromData:]";
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_1A4576000, a3, OS_LOG_TYPE_DEBUG, "%s: Error deserializing: %@", (uint8_t *)&v6, 0x16u);
  if (a1) {
}
  }

+ (void)_newMetricsFromData:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_newMetricsFromData:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_newMetricsFromData:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_newMetricsFromData:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_newMetricsFromData:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end