@interface SignpostCAProcessStallAggregation
- (BOOL)isSystemAggregation;
- (NSMutableSet)pids;
- (NSString)processExecutablePath;
- (NSString)processName;
- (SignpostCAIntervalAggregationStats)firstFrameGlitchStats;
- (SignpostCAIntervalAggregationStats)glitchStats;
- (SignpostCAIntervalAggregationStats)longCommitStats;
- (SignpostCAIntervalAggregationStats)longFrameLatencyStats;
- (SignpostCAIntervalAggregationStats)longFrameLifetimeStats;
- (SignpostCAIntervalAggregationStats)longHIDLatencyStats;
- (SignpostCAIntervalAggregationStats)longRenderForTimeStats;
- (SignpostCAIntervalAggregationStats)longResponsibleFrameLifetimeStats;
- (SignpostCAIntervalAggregationStats)longTransactionLifetimeStats;
- (SignpostCAIntervalAggregationStats)responsibleFirstFrameGlitchStats;
- (SignpostCAIntervalAggregationStats)responsibleGlitchStats;
- (SignpostCAIntervalAggregationStats)responsibleNonFirstFrameNonSkipGlitchStats;
- (SignpostCAIntervalAggregationStats)responsibleNonFirstFrameNonSkipPerceivedGlitchStats;
- (id)_initAsSystemAggregation;
- (id)_initWithProcessExecutablePath:(id)a3 pid:(int)a4;
- (id)_statsForType:(unsigned __int8)a3 initIfMissing:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)_totalStallDurationNs;
- (void)_addDuration:(unint64_t)a3 ofType:(unsigned __int8)a4;
- (void)_addOtherProcessStallAggregation:(id)a3;
- (void)_iterateTypeStatsWithBlock:(id)a3;
@end

@implementation SignpostCAProcessStallAggregation

- (void)_iterateTypeStatsWithBlock:(id)a3
{
  unsigned __int8 v4 = 0;
  v7 = (void (**)(id, void, void *))a3;
  do
  {
    unsigned int v5 = v4;
    v6 = [(SignpostCAProcessStallAggregation *)self _statsForType:v4 initIfMissing:0];
    if (v6) {
      v7[2](v7, v4, v6);
    }

    ++v4;
  }
  while (v5 < 0xA);
}

- (unint64_t)_totalStallDurationNs
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SignpostCAProcessStallAggregation__totalStallDurationNs__block_invoke;
  v4[3] = &unk_1E5B40510;
  v4[4] = &v5;
  [(SignpostCAProcessStallAggregation *)self _iterateTypeStatsWithBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __58__SignpostCAProcessStallAggregation__totalStallDurationNs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 totalIntervalDurationNs];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (id)_initAsSystemAggregation
{
  v3.receiver = self;
  v3.super_class = (Class)SignpostCAProcessStallAggregation;
  id result = [(SignpostCAProcessStallAggregation *)&v3 init];
  if (result) {
    *((unsigned char *)result + 8) = 1;
  }
  return result;
}

- (id)_initWithProcessExecutablePath:(id)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SignpostCAProcessStallAggregation;
  uint64_t v8 = [(SignpostCAProcessStallAggregation *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_processExecutablePath, a3);
    uint64_t v10 = [v7 lastPathComponent];
    processName = v9->_processName;
    v9->_processName = (NSString *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    pids = v9->_pids;
    v9->_pids = (NSMutableSet *)v12;

    v14 = v9->_pids;
    v15 = [NSNumber numberWithInt:v4];
    [(NSMutableSet *)v14 addObject:v15];
  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[SignpostCAProcessStallAggregation allocWithZone:a3] init];
  uint64_t v5 = [(SignpostCAProcessStallAggregation *)self processName];
  processName = v4->_processName;
  v4->_processName = (NSString *)v5;

  uint64_t v7 = [(SignpostCAProcessStallAggregation *)self processExecutablePath];
  processExecutablePath = v4->_processExecutablePath;
  v4->_processExecutablePath = (NSString *)v7;

  v9 = [(SignpostCAProcessStallAggregation *)self pids];
  uint64_t v10 = [v9 copy];
  pids = v4->_pids;
  v4->_pids = (NSMutableSet *)v10;

  v4->_isSystemAggregation = [(SignpostCAProcessStallAggregation *)self isSystemAggregation];
  uint64_t v12 = [(SignpostCAProcessStallAggregation *)self longCommitStats];
  uint64_t v13 = [v12 copy];
  longCommitStats = v4->_longCommitStats;
  v4->_longCommitStats = (SignpostCAIntervalAggregationStats *)v13;

  v15 = [(SignpostCAProcessStallAggregation *)self longHIDLatencyStats];
  uint64_t v16 = [v15 copy];
  longHIDLatencyStats = v4->_longHIDLatencyStats;
  v4->_longHIDLatencyStats = (SignpostCAIntervalAggregationStats *)v16;

  v18 = [(SignpostCAProcessStallAggregation *)self longFrameLatencyStats];
  uint64_t v19 = [v18 copy];
  longFrameLatencyStats = v4->_longFrameLatencyStats;
  v4->_longFrameLatencyStats = (SignpostCAIntervalAggregationStats *)v19;

  v21 = [(SignpostCAProcessStallAggregation *)self longRenderForTimeStats];
  uint64_t v22 = [v21 copy];
  longRenderForTimeStats = v4->_longRenderForTimeStats;
  v4->_longRenderForTimeStats = (SignpostCAIntervalAggregationStats *)v22;

  v24 = [(SignpostCAProcessStallAggregation *)self longTransactionLifetimeStats];
  uint64_t v25 = [v24 copy];
  longTransactionLifetimeStats = v4->_longTransactionLifetimeStats;
  v4->_longTransactionLifetimeStats = (SignpostCAIntervalAggregationStats *)v25;

  v27 = [(SignpostCAProcessStallAggregation *)self longFrameLifetimeStats];
  uint64_t v28 = [v27 copy];
  longFrameLifetimeStats = v4->_longFrameLifetimeStats;
  v4->_longFrameLifetimeStats = (SignpostCAIntervalAggregationStats *)v28;

  v30 = [(SignpostCAProcessStallAggregation *)self longResponsibleFrameLifetimeStats];
  uint64_t v31 = [v30 copy];
  longResponsibleFrameLifetimeStats = v4->_longResponsibleFrameLifetimeStats;
  v4->_longResponsibleFrameLifetimeStats = (SignpostCAIntervalAggregationStats *)v31;

  v33 = [(SignpostCAProcessStallAggregation *)self glitchStats];
  uint64_t v34 = [v33 copy];
  glitchStats = v4->_glitchStats;
  v4->_glitchStats = (SignpostCAIntervalAggregationStats *)v34;

  v36 = [(SignpostCAProcessStallAggregation *)self responsibleGlitchStats];
  uint64_t v37 = [v36 copy];
  responsibleGlitchStats = v4->_responsibleGlitchStats;
  v4->_responsibleGlitchStats = (SignpostCAIntervalAggregationStats *)v37;

  uint64_t v39 = [(SignpostCAProcessStallAggregation *)self firstFrameGlitchStats];
  firstFrameGlitchStats = v4->_firstFrameGlitchStats;
  v4->_firstFrameGlitchStats = (SignpostCAIntervalAggregationStats *)v39;

  v41 = [(SignpostCAProcessStallAggregation *)self responsibleFirstFrameGlitchStats];
  uint64_t v42 = [v41 copy];
  responsibleFirstFrameGlitchStats = v4->_responsibleFirstFrameGlitchStats;
  v4->_responsibleFirstFrameGlitchStats = (SignpostCAIntervalAggregationStats *)v42;

  v44 = [(SignpostCAProcessStallAggregation *)self responsibleNonFirstFrameNonSkipGlitchStats];
  uint64_t v45 = [v44 copy];
  responsibleNonFirstFrameNonSkipGlitchStats = v4->_responsibleNonFirstFrameNonSkipGlitchStats;
  v4->_responsibleNonFirstFrameNonSkipGlitchStats = (SignpostCAIntervalAggregationStats *)v45;

  v47 = [(SignpostCAProcessStallAggregation *)self responsibleNonFirstFrameNonSkipPerceivedGlitchStats];
  uint64_t v48 = [v47 copy];
  responsibleNonFirstFrameNonSkipPerceivedGlitchStats = v4->_responsibleNonFirstFrameNonSkipPerceivedGlitchStats;
  v4->_responsibleNonFirstFrameNonSkipPerceivedGlitchStats = (SignpostCAIntervalAggregationStats *)v48;

  return v4;
}

- (id)_statsForType:(unsigned __int8)a3 initIfMissing:(BOOL)a4
{
  uint64_t v49 = v5;
  uint64_t v50 = v4;
  uint64_t v8 = self;
  switch(a3)
  {
    case 0u:
      if (a4)
      {
        v9 = [(SignpostCAProcessStallAggregation *)self longCommitStats];

        if (!v9)
        {
          uint64_t v10 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          longCommitStats = v8->_longCommitStats;
          v8->_longCommitStats = v10;
        }
      }
      self = [(SignpostCAProcessStallAggregation *)v8 longCommitStats];
      goto LABEL_57;
    case 1u:
      if (a4)
      {
        uint64_t v13 = [(SignpostCAProcessStallAggregation *)self longHIDLatencyStats];

        if (!v13)
        {
          v14 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          longHIDLatencyStats = v8->_longHIDLatencyStats;
          v8->_longHIDLatencyStats = v14;
        }
      }
      self = [(SignpostCAProcessStallAggregation *)v8 longHIDLatencyStats];
      goto LABEL_57;
    case 2u:
      if (a4)
      {
        uint64_t v16 = [(SignpostCAProcessStallAggregation *)self longFrameLatencyStats];

        if (!v16)
        {
          objc_super v17 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          longFrameLatencyStats = v8->_longFrameLatencyStats;
          v8->_longFrameLatencyStats = v17;
        }
      }
      self = [(SignpostCAProcessStallAggregation *)v8 longFrameLatencyStats];
      goto LABEL_57;
    case 3u:
      if (a4)
      {
        uint64_t v19 = [(SignpostCAProcessStallAggregation *)self longRenderForTimeStats];

        if (!v19)
        {
          v20 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          longRenderForTimeStats = v8->_longRenderForTimeStats;
          v8->_longRenderForTimeStats = v20;
        }
      }
      self = [(SignpostCAProcessStallAggregation *)v8 longRenderForTimeStats];
      goto LABEL_57;
    case 4u:
      if (a4)
      {
        uint64_t v22 = [(SignpostCAProcessStallAggregation *)self longTransactionLifetimeStats];

        if (!v22)
        {
          v23 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          longTransactionLifetimeStats = v8->_longTransactionLifetimeStats;
          v8->_longTransactionLifetimeStats = v23;
        }
      }
      self = [(SignpostCAProcessStallAggregation *)v8 longTransactionLifetimeStats];
      goto LABEL_57;
    case 5u:
      if (a4)
      {
        uint64_t v25 = [(SignpostCAProcessStallAggregation *)self longFrameLifetimeStats];

        if (!v25)
        {
          v26 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          longFrameLifetimeStats = v8->_longFrameLifetimeStats;
          v8->_longFrameLifetimeStats = v26;
        }
      }
      self = [(SignpostCAProcessStallAggregation *)v8 longFrameLifetimeStats];
      goto LABEL_57;
    case 6u:
      if (a4)
      {
        uint64_t v28 = [(SignpostCAProcessStallAggregation *)self longResponsibleFrameLifetimeStats];

        if (!v28)
        {
          v29 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          longResponsibleFrameLifetimeStats = v8->_longResponsibleFrameLifetimeStats;
          v8->_longResponsibleFrameLifetimeStats = v29;
        }
      }
      self = [(SignpostCAProcessStallAggregation *)v8 longResponsibleFrameLifetimeStats];
      goto LABEL_57;
    case 7u:
      if (a4)
      {
        uint64_t v31 = [(SignpostCAProcessStallAggregation *)self glitchStats];

        if (!v31)
        {
          v32 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          glitchStats = v8->_glitchStats;
          v8->_glitchStats = v32;
        }
      }
      self = [(SignpostCAProcessStallAggregation *)v8 glitchStats];
      goto LABEL_57;
    case 8u:
      if (a4)
      {
        uint64_t v34 = [(SignpostCAProcessStallAggregation *)self responsibleGlitchStats];

        if (!v34)
        {
          v35 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          responsibleGlitchStats = v8->_responsibleGlitchStats;
          v8->_responsibleGlitchStats = v35;
        }
      }
      self = [(SignpostCAProcessStallAggregation *)v8 responsibleGlitchStats];
      goto LABEL_57;
    case 9u:
      if (a4)
      {
        uint64_t v37 = [(SignpostCAProcessStallAggregation *)self firstFrameGlitchStats];

        if (!v37)
        {
          v38 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          firstFrameGlitchStats = v8->_firstFrameGlitchStats;
          v8->_firstFrameGlitchStats = v38;
        }
      }
      self = [(SignpostCAProcessStallAggregation *)v8 firstFrameGlitchStats];
      goto LABEL_57;
    case 0xAu:
      if (a4)
      {
        v40 = [(SignpostCAProcessStallAggregation *)self responsibleFirstFrameGlitchStats];

        if (!v40)
        {
          v41 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          responsibleFirstFrameGlitchStats = v8->_responsibleFirstFrameGlitchStats;
          v8->_responsibleFirstFrameGlitchStats = v41;
        }
      }
      self = [(SignpostCAProcessStallAggregation *)v8 responsibleFirstFrameGlitchStats];
      goto LABEL_57;
    case 0xBu:
      if (a4)
      {
        v43 = [(SignpostCAProcessStallAggregation *)self responsibleNonFirstFrameNonSkipGlitchStats];

        if (!v43)
        {
          v44 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          responsibleNonFirstFrameNonSkipGlitchStats = v8->_responsibleNonFirstFrameNonSkipGlitchStats;
          v8->_responsibleNonFirstFrameNonSkipGlitchStats = v44;
        }
      }
      self = [(SignpostCAProcessStallAggregation *)v8 responsibleNonFirstFrameNonSkipGlitchStats];
      goto LABEL_57;
    case 0xCu:
      if (a4)
      {
        v46 = [(SignpostCAProcessStallAggregation *)self responsibleNonFirstFrameNonSkipPerceivedGlitchStats];

        if (!v46)
        {
          v47 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          responsibleNonFirstFrameNonSkipPerceivedGlitchStats = v8->_responsibleNonFirstFrameNonSkipPerceivedGlitchStats;
          v8->_responsibleNonFirstFrameNonSkipPerceivedGlitchStats = v47;
        }
      }
      self = [(SignpostCAProcessStallAggregation *)v8 responsibleNonFirstFrameNonSkipPerceivedGlitchStats];
LABEL_57:
      break;
    default:
      break;
  }
  return self;
}

- (void)_addDuration:(unint64_t)a3 ofType:(unsigned __int8)a4
{
  id v5 = [(SignpostCAProcessStallAggregation *)self _statsForType:a4 initIfMissing:1];
  [v5 _addDurationNsToAggregation:a3];
}

- (void)_addOtherProcessStallAggregation:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__SignpostCAProcessStallAggregation__addOtherProcessStallAggregation___block_invoke;
  v10[3] = &unk_1E5B40538;
  v10[4] = self;
  [v4 _iterateTypeStatsWithBlock:v10];
  id v5 = [v4 pids];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [(SignpostCAProcessStallAggregation *)self pids];
    uint64_t v8 = [v4 pids];
    v9 = [v8 allObjects];
    [v7 addObjectsFromArray:v9];
  }
}

void __70__SignpostCAProcessStallAggregation__addOtherProcessStallAggregation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 _statsForType:a2 initIfMissing:1];
  [v6 _addAggregationStats:v5];
}

- (id)description
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(SignpostCAProcessStallAggregation *)self isSystemAggregation])
  {
    objc_super v3 = [MEMORY[0x1E4F28E78] stringWithString:@"System Aggregation:\n"];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28E78] string];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = [(SignpostCAProcessStallAggregation *)self pids];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v26;
      char v8 = 1;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v25 + 1) + 8 * i) unsignedIntegerValue];
          if (v8) {
            v11 = @"%lu";
          }
          else {
            v11 = @", %lu";
          }
          objc_msgSend(v4, "appendFormat:", v11, v10);
          char v8 = 0;
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
        char v8 = 0;
      }
      while (v6);
    }

    uint64_t v12 = (void *)MEMORY[0x1E4F28E78];
    uint64_t v13 = [(SignpostCAProcessStallAggregation *)self processName];
    v14 = (void *)v13;
    v15 = @"Unknown Process";
    if (v13) {
      v15 = (__CFString *)v13;
    }
    objc_super v3 = [v12 stringWithFormat:@"%@ [%@]:\n", v15, v4];
  }
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __48__SignpostCAProcessStallAggregation_description__block_invoke;
  v18[3] = &unk_1E5B40560;
  id v16 = v3;
  id v19 = v16;
  v20 = &v21;
  [(SignpostCAProcessStallAggregation *)self _iterateTypeStatsWithBlock:v18];
  if (!*((unsigned char *)v22 + 24)) {
    [v16 appendString:@"\tNo stalls\n"];
  }

  _Block_object_dispose(&v21, 8);

  return v16;
}

void __48__SignpostCAProcessStallAggregation_description__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  if ((a2 - 1) > 0xB) {
    id v5 = @"Long Commits";
  }
  else {
    id v5 = off_1E5B405C8[(char)(a2 - 1)];
  }
  uint64_t v6 = [a3 description];
  [v4 appendFormat:@"\t%@: %@\n", v5, v6];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (BOOL)isSystemAggregation
{
  return self->_isSystemAggregation;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)processExecutablePath
{
  return self->_processExecutablePath;
}

- (NSMutableSet)pids
{
  return self->_pids;
}

- (SignpostCAIntervalAggregationStats)longCommitStats
{
  return self->_longCommitStats;
}

- (SignpostCAIntervalAggregationStats)longTransactionLifetimeStats
{
  return self->_longTransactionLifetimeStats;
}

- (SignpostCAIntervalAggregationStats)longHIDLatencyStats
{
  return self->_longHIDLatencyStats;
}

- (SignpostCAIntervalAggregationStats)longFrameLatencyStats
{
  return self->_longFrameLatencyStats;
}

- (SignpostCAIntervalAggregationStats)longRenderForTimeStats
{
  return self->_longRenderForTimeStats;
}

- (SignpostCAIntervalAggregationStats)longFrameLifetimeStats
{
  return self->_longFrameLifetimeStats;
}

- (SignpostCAIntervalAggregationStats)longResponsibleFrameLifetimeStats
{
  return self->_longResponsibleFrameLifetimeStats;
}

- (SignpostCAIntervalAggregationStats)glitchStats
{
  return self->_glitchStats;
}

- (SignpostCAIntervalAggregationStats)responsibleGlitchStats
{
  return self->_responsibleGlitchStats;
}

- (SignpostCAIntervalAggregationStats)firstFrameGlitchStats
{
  return self->_firstFrameGlitchStats;
}

- (SignpostCAIntervalAggregationStats)responsibleFirstFrameGlitchStats
{
  return self->_responsibleFirstFrameGlitchStats;
}

- (SignpostCAIntervalAggregationStats)responsibleNonFirstFrameNonSkipGlitchStats
{
  return self->_responsibleNonFirstFrameNonSkipGlitchStats;
}

- (SignpostCAIntervalAggregationStats)responsibleNonFirstFrameNonSkipPerceivedGlitchStats
{
  return self->_responsibleNonFirstFrameNonSkipPerceivedGlitchStats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responsibleNonFirstFrameNonSkipPerceivedGlitchStats, 0);
  objc_storeStrong((id *)&self->_responsibleNonFirstFrameNonSkipGlitchStats, 0);
  objc_storeStrong((id *)&self->_responsibleFirstFrameGlitchStats, 0);
  objc_storeStrong((id *)&self->_firstFrameGlitchStats, 0);
  objc_storeStrong((id *)&self->_responsibleGlitchStats, 0);
  objc_storeStrong((id *)&self->_glitchStats, 0);
  objc_storeStrong((id *)&self->_longResponsibleFrameLifetimeStats, 0);
  objc_storeStrong((id *)&self->_longFrameLifetimeStats, 0);
  objc_storeStrong((id *)&self->_longRenderForTimeStats, 0);
  objc_storeStrong((id *)&self->_longFrameLatencyStats, 0);
  objc_storeStrong((id *)&self->_longHIDLatencyStats, 0);
  objc_storeStrong((id *)&self->_longTransactionLifetimeStats, 0);
  objc_storeStrong((id *)&self->_longCommitStats, 0);
  objc_storeStrong((id *)&self->_pids, 0);
  objc_storeStrong((id *)&self->_processExecutablePath, 0);

  objc_storeStrong((id *)&self->_processName, 0);
}

@end