@interface SSCAMetalLayerClientSessionAccumulator
+ (BOOL)filterSupportsCAMetalLayerClientSessionAccumulation:(id)a3;
+ (id)coreAnalyticsEventName;
+ (id)coreAnalyticsProcessingMetadataName;
+ (void)addNeededSCToAllowlist:(id)a3;
- (BOOL)includeTimelines;
- (NSDate)earliestDateProcessed;
- (NSDate)latestDateProcessed;
- (NSDictionary)processNameToClientSessions;
- (NSMutableArray)mutableBootSessions;
- (NSMutableArray)mutableProcessingErrors;
- (NSString)debugDescription;
- (OS_dispatch_queue)processingBlockTargetQueue;
- (SSCAMetalLayerClientSessionAccumulator)initWithIncludeTimelines:(BOOL)a3;
- (id)configuredExtractor;
- (id)coreAnalyticsEvents;
- (id)dictionaryRepresentation;
- (id)jsonDescription:(unint64_t)a3;
- (id)layerStatsProcessingBlock;
- (id)resourceUsageStatsProcessingBlock;
- (void)_processFPEvent:(id)a3;
- (void)_processFPInterval:(id)a3;
- (void)_processLayerMetadata:(id)a3;
- (void)_processOnGlassDrawableInterval:(id)a3;
- (void)processDeviceReboot;
- (void)processEvent:(id)a3;
- (void)processInterval:(id)a3;
- (void)setLayerStatsProcessingBlock:(id)a3;
- (void)setResourceUsageStatsProcessingBlock:(id)a3;
@end

@implementation SSCAMetalLayerClientSessionAccumulator

+ (BOOL)filterSupportsCAMetalLayerClientSessionAccumulation:(id)a3
{
  return [a3 passesSubsystem:kSSCAMLFramePacingSubsystem category:kSSCAMLFramePacingCategory];
}

+ (void)addNeededSCToAllowlist:(id)a3
{
}

- (id)configuredExtractor
{
  v3 = objc_alloc_init(SignpostSupportObjectExtractor);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__SSCAMetalLayerClientSessionAccumulator_configuredExtractor__block_invoke;
  v8[3] = &unk_1E5B400C0;
  v8[4] = self;
  [(SignpostSupportObjectExtractor *)v3 setIntervalCompletionProcessingBlock:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__SSCAMetalLayerClientSessionAccumulator_configuredExtractor__block_invoke_2;
  v7[3] = &unk_1E5B400E8;
  v7[4] = self;
  [(SignpostSupportObjectExtractor *)v3 setEmitEventProcessingBlock:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SSCAMetalLayerClientSessionAccumulator_configuredExtractor__block_invoke_3;
  v6[3] = &unk_1E5B40110;
  v6[4] = self;
  [(SignpostSupportObjectExtractor *)v3 setDeviceRebootProcessingBlock:v6];
  v4 = objc_alloc_init(SignpostSupportSubsystemCategoryAllowlist);
  [(id)objc_opt_class() addNeededSCToAllowlist:v4];
  [(SignpostSupportObjectExtractor *)v3 setSubsystemCategoryFilter:v4];

  return v3;
}

uint64_t __61__SSCAMetalLayerClientSessionAccumulator_configuredExtractor__block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __61__SSCAMetalLayerClientSessionAccumulator_configuredExtractor__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __61__SSCAMetalLayerClientSessionAccumulator_configuredExtractor__block_invoke_3(uint64_t a1)
{
  return 1;
}

- (void)processDeviceReboot
{
  id v4 = [(SSCAMetalLayerClientSessionAccumulator *)self mutableBootSessions];
  v3 = [[SSDeviceBootSession alloc] initWithIncludeTimelines:[(SSCAMetalLayerClientSessionAccumulator *)self includeTimelines]];
  [v4 addObject:v3];
}

- (void)_processLayerMetadata:(id)a3
{
  id v16 = a3;
  id v4 = [(SSCAMetalLayerClientSessionAccumulator *)self bootSessions];
  v5 = [v4 lastObject];
  v6 = [v16 beginEvent];
  uint64_t v7 = [v6 processID];
  [v16 timebaseRatio];
  v8 = objc_msgSend(v5, "_clientSessionForPID:timebaseRatio:", v7);

  v9 = [v8 processName];

  if (!v9)
  {
    v10 = [v16 beginEvent];
    v11 = [v10 processName];
    [v8 setProcessName:v11];
  }
  uint64_t v12 = [v16 signpostId];
  [v16 timebaseRatio];
  v13 = objc_msgSend(v8, "_metalLayerSessionForID:timebaseRatio:", v12);
  v14 = [v13 _ingestConfigurationInterval:v16];
  if (v14)
  {
    v15 = [(SSCAMetalLayerClientSessionAccumulator *)self mutableProcessingErrors];
    [v15 addObjectsFromArray:v14];
  }
}

- (void)_processOnGlassDrawableInterval:(id)a3
{
  id v16 = a3;
  if ([(SSCAMetalLayerClientSessionAccumulator *)self includeTimelines])
  {
    id v4 = [(SSCAMetalLayerClientSessionAccumulator *)self bootSessions];
    v5 = [v4 lastObject];
    v6 = [v16 beginEvent];
    uint64_t v7 = [v6 processID];
    [v16 timebaseRatio];
    v8 = objc_msgSend(v5, "_clientSessionForPID:timebaseRatio:", v7);

    v9 = [v8 processName];

    if (!v9)
    {
      v10 = [v16 beginEvent];
      v11 = [v10 processName];
      [v8 setProcessName:v11];
    }
    uint64_t v12 = [v16 signpostId];
    [v16 timebaseRatio];
    v13 = objc_msgSend(v8, "_metalLayerSessionForID:timebaseRatio:", v12);
    v14 = [v13 _ingestOnGlassDrawableInterval:v16];
    if (v14)
    {
      v15 = [(SSCAMetalLayerClientSessionAccumulator *)self mutableProcessingErrors];
      [v15 addObject:v14];
    }
  }
}

- (void)_processFPInterval:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  int v6 = [v5 isEqualToString:kSSCAMLFramePacingLayerMetadataName];

  if (v6)
  {
    [(SSCAMetalLayerClientSessionAccumulator *)self _processLayerMetadata:v4];
  }
  else
  {
    uint64_t v7 = [v4 name];
    int v8 = [v7 isEqualToString:kSSCAMLFramePacingOnGlassDrawableIntervalName];

    if (v8)
    {
      [(SSCAMetalLayerClientSessionAccumulator *)self _processOnGlassDrawableInterval:v4];
    }
    else
    {
      v9 = [v4 subsystem];
      v10 = [v4 category];
      v11 = [v4 name];
      BOOL v12 = +[SSInflightCAMetalLayerIntervalStats isInterestingAggregationSubsystem:v9 category:v10 name:v11];

      if (v12)
      {
        id v27 = 0;
        v13 = [[SignpostAggregation alloc] initWithInterval:v4 errorsOut:&v27];
        id v14 = v27;
        if ([v14 count])
        {
          v15 = [(SSCAMetalLayerClientSessionAccumulator *)self mutableProcessingErrors];
          [v15 addObjectsFromArray:v14];
        }
        else
        {
          id v16 = [(SSCAMetalLayerClientSessionAccumulator *)self bootSessions];
          v17 = [v16 lastObject];
          v18 = [v4 beginEvent];
          uint64_t v19 = [v18 processID];
          [v4 timebaseRatio];
          v15 = objc_msgSend(v17, "_clientSessionForPID:timebaseRatio:", v19);

          v20 = [v15 processName];

          if (!v20)
          {
            v21 = [v4 beginEvent];
            v22 = [v21 processName];
            [v15 setProcessName:v22];
          }
          uint64_t v23 = [v4 signpostId];
          [v4 timebaseRatio];
          v24 = objc_msgSend(v15, "_metalLayerSessionForID:timebaseRatio:", v23);
          [v4 timebaseRatio];
          v25 = objc_msgSend(v24, "_ingestAggregation:timebaseRatio:parentClientSession:parentAccumulator:", v13, v15, self);
          if (v25)
          {
            v26 = [(SSCAMetalLayerClientSessionAccumulator *)self mutableProcessingErrors];
            [v26 addObjectsFromArray:v25];
          }
        }
      }
    }
  }
}

- (void)processInterval:(id)a3
{
  id v9 = a3;
  id v4 = [(SSCAMetalLayerClientSessionAccumulator *)self mutableBootSessions];
  v5 = [v4 lastObject];

  [v5 _updateDates:v9];
  int v6 = [v9 subsystem];
  if ([v6 isEqualToString:kSSCAMLFramePacingSubsystem])
  {
    uint64_t v7 = [v9 category];
    int v8 = [v7 isEqualToString:kSSCAMLFramePacingCategory];

    if (v8) {
      [(SSCAMetalLayerClientSessionAccumulator *)self _processFPInterval:v9];
    }
  }
  else
  {
  }
}

- (void)_processFPEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  int v6 = [v5 isEqualToString:kSSCAMLFramePacingClientBundleInfo];

  if (v6)
  {
    uint64_t v7 = [(SSCAMetalLayerClientSessionAccumulator *)self mutableBootSessions];
    int v8 = [v7 lastObject];
    uint64_t v9 = [v4 processID];
    [v4 timebaseRatio];
    v10 = objc_msgSend(v8, "_clientSessionForPID:timebaseRatio:", v9);

    uint64_t v11 = [v10 bundleID];
    if (v11)
    {
      BOOL v12 = (void *)v11;
      uint64_t v13 = [v10 bundleVersion];
      if (v13)
      {
        id v14 = (void *)v13;
        v15 = [v10 bundleShortVersion];

        if (!v15) {
          goto LABEL_13;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
LABEL_13:
    v25 = [v4 placeholderTokenValueDictForTokenKey:@"name"];
    objc_opt_class();
    uint64_t v26 = _objectValueForKey(@"BundleID", v25, 1);
    id v27 = (void *)v26;
    if (v26) {
      v28 = (__CFString *)v26;
    }
    else {
      v28 = @"Unknown";
    }
    [v10 setBundleID:v28];

    id v29 = v25;
    objc_opt_class();
    _objectValueForKey(@"BundleVersion", v29, 1);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v30) {
      v31 = v30;
    }
    else {
      v31 = @"Unknown";
    }
    [v10 setBundleVersion:v31];

    id v32 = v29;
    objc_opt_class();
    _objectValueForKey(@"BundleShortVersion", v32, 1);
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v33) {
      v34 = v33;
    }
    else {
      v34 = @"Unknown";
    }
    [v10 setBundleShortVersion:v34];

    v35 = [v10 processName];

    if (!v35)
    {
      v36 = [v4 processName];
      [v10 setProcessName:v36];
    }
    goto LABEL_29;
  }
  id v16 = [v4 name];
  int v17 = [v16 isEqualToString:kSSCAMLFramePacingClientSystemResourceUsage];

  if (v17)
  {
    v10 = +[SSCAMetalLayerClientResourceUsageSnapshot snapshotFromSignpostEvent:v4];
    if (v10)
    {
      v18 = [(SSCAMetalLayerClientSessionAccumulator *)self mutableBootSessions];
      uint64_t v19 = [v18 lastObject];
      uint64_t v20 = [v4 processID];
      [v4 timebaseRatio];
      v21 = objc_msgSend(v19, "_clientSessionForPID:timebaseRatio:", v20);

      [v21 _handleResourceSnapshot:v10];
      v22 = [(SSCAMetalLayerClientSessionAccumulator *)self resourceUsageStatsProcessingBlock];

      if (!v22 || !v21) {
        goto LABEL_28;
      }
      uint64_t v23 = [(SSCAMetalLayerClientSessionAccumulator *)self processingBlockTargetQueue];

      if (v23)
      {
        v24 = [(SSCAMetalLayerClientSessionAccumulator *)self processingBlockTargetQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __58__SSCAMetalLayerClientSessionAccumulator__processFPEvent___block_invoke;
        block[3] = &unk_1E5B406A8;
        block[4] = self;
        id v44 = v21;
        id v45 = v10;
        dispatch_async(v24, block);

LABEL_28:
        goto LABEL_29;
      }
      v37 = [(SSCAMetalLayerClientSessionAccumulator *)self resourceUsageStatsProcessingBlock];
      uint64_t v38 = [v21 processID];
      v39 = [v21 processName];
      v40 = [v21 bundleID];
      v41 = [v21 bundleVersion];
      v42 = [v21 bundleShortVersion];
      ((void (**)(void, uint64_t, void *, void *, void *, void *, void *))v37)[2](v37, v38, v39, v40, v41, v42, v10);
    }
    else
    {
      v21 = [MEMORY[0x1E4F28C58] errorWithCode:11 description:@"Malformed resource usage snapshot event"];
      v37 = [(SSCAMetalLayerClientSessionAccumulator *)self mutableProcessingErrors];
      [v37 addObject:v21];
    }

    goto LABEL_28;
  }
LABEL_30:
}

void __58__SSCAMetalLayerClientSessionAccumulator__processFPEvent___block_invoke(uint64_t a1)
{
  uint64_t v7 = [*(id *)(a1 + 32) resourceUsageStatsProcessingBlock];
  uint64_t v2 = [*(id *)(a1 + 40) processID];
  v3 = [*(id *)(a1 + 40) processName];
  id v4 = [*(id *)(a1 + 40) bundleID];
  v5 = [*(id *)(a1 + 40) bundleVersion];
  int v6 = [*(id *)(a1 + 40) bundleShortVersion];
  v7[2](v7, v2, v3, v4, v5, v6, *(void *)(a1 + 48));
}

- (void)processEvent:(id)a3
{
  id v9 = a3;
  id v4 = [(SSCAMetalLayerClientSessionAccumulator *)self mutableBootSessions];
  v5 = [v4 lastObject];

  [v5 _updateDates:v9];
  int v6 = [v9 subsystem];
  if ([v6 isEqualToString:kSSCAMLFramePacingSubsystem])
  {
    uint64_t v7 = [v9 category];
    int v8 = [v7 isEqualToString:kSSCAMLFramePacingCategory];

    if (v8) {
      [(SSCAMetalLayerClientSessionAccumulator *)self _processFPEvent:v9];
    }
  }
  else
  {
  }
}

- (SSCAMetalLayerClientSessionAccumulator)initWithIncludeTimelines:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SSCAMetalLayerClientSessionAccumulator;
  id v4 = [(SSCAMetalLayerClientSessionAccumulator *)&v13 init];
  v5 = v4;
  if (v4)
  {
    v4->_includeTimelines = a3;
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableBootSessions = v5->_mutableBootSessions;
    v5->_mutableBootSessions = v6;

    int v8 = [(SSCAMetalLayerClientSessionAccumulator *)v5 mutableBootSessions];
    id v9 = [[SSDeviceBootSession alloc] initWithIncludeTimelines:[(SSCAMetalLayerClientSessionAccumulator *)v5 includeTimelines]];
    [v8 addObject:v9];

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableProcessingErrors = v5->_mutableProcessingErrors;
    v5->_mutableProcessingErrors = v10;
  }
  return v5;
}

- (NSDate)earliestDateProcessed
{
  uint64_t v2 = [(SSCAMetalLayerClientSessionAccumulator *)self bootSessions];
  v3 = [v2 firstObject];
  id v4 = [v3 earliestDate];

  return (NSDate *)v4;
}

- (NSDate)latestDateProcessed
{
  uint64_t v2 = [(SSCAMetalLayerClientSessionAccumulator *)self bootSessions];
  v3 = [v2 lastObject];
  id v4 = [v3 latestDate];

  return (NSDate *)v4;
}

- (id)dictionaryRepresentation
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(SSCAMetalLayerClientSessionAccumulator *)self earliestDateProcessed];
  v5 = _stringForDate(v4);
  [v3 setObject:v5 forKeyedSubscript:kSSCAMetalLayerClientSessionAccumulatorKey_EarliestDate];

  int v6 = [(SSCAMetalLayerClientSessionAccumulator *)self latestDateProcessed];
  uint64_t v7 = _stringForDate(v6);
  [v3 setObject:v7 forKeyedSubscript:kSSCAMetalLayerClientSessionAccumulatorKey_LatestDate];

  int v8 = objc_msgSend(NSNumber, "numberWithBool:", -[SSCAMetalLayerClientSessionAccumulator includeTimelines](self, "includeTimelines"));
  [v3 setObject:v8 forKeyedSubscript:kSSCAMetalLayerClientSessionAccumulatorKey_IncludeTimelines];

  id v9 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v10 = [(SSCAMetalLayerClientSessionAccumulator *)self bootSessions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [*(id *)(*((void *)&v30 + 1) + 8 * i) dictionaryRepresentation];
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v12);
  }

  [v3 setObject:v9 forKeyedSubscript:kSSCAMetalLayerClientSessionAccumulatorKey_BootSessions];
  id v16 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  int v17 = [(SSCAMetalLayerClientSessionAccumulator *)self processingErrors];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = [*(id *)(*((void *)&v26 + 1) + 8 * j) localizedDescription];
        uint64_t v23 = (void *)v22;
        if (v22) {
          v24 = (__CFString *)v22;
        }
        else {
          v24 = @"Unknown error";
        }
        [v16 addObject:v24];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v19);
  }

  [v3 setObject:v16 forKeyedSubscript:kSSCAMetalLayerClientSessionAccumulatorKey_ProcessingErrors];

  return v3;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)[(SSCAMetalLayerClientSessionAccumulator *)self jsonDescription:3];
}

- (id)coreAnalyticsEvents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(SSCAMetalLayerClientSessionAccumulator *)self bootSessions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) coreAnalyticsEvents];
        if ([v9 count]) {
          [v3 addObjectsFromArray:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  if ([v3 count]) {
    id v10 = v3;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

+ (id)coreAnalyticsEventName
{
  return @"com.apple.SignpostSupport.CAMetalLayerClientSession";
}

+ (id)coreAnalyticsProcessingMetadataName
{
  return @"com.apple.SignpostSupport.CAMetalLayerClientSessionProcessingMetadata";
}

- (NSDictionary)processNameToClientSessions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(SSCAMetalLayerClientSessionAccumulator *)self bootSessions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) processNameToClientSessions];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __69__SSCAMetalLayerClientSessionAccumulator_processNameToClientSessions__block_invoke;
        v11[3] = &unk_1E5B406D0;
        id v12 = v3;
        [v9 enumerateKeysAndObjectsUsingBlock:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

void __69__SSCAMetalLayerClientSessionAccumulator_processNameToClientSessions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:v9];
  int v8 = v7;
  if (v7) {
    [v7 addObjectsFromArray:v6];
  }
  else {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v9];
  }
}

- (id)layerStatsProcessingBlock
{
  return self->_layerStatsProcessingBlock;
}

- (void)setLayerStatsProcessingBlock:(id)a3
{
}

- (id)resourceUsageStatsProcessingBlock
{
  return self->_resourceUsageStatsProcessingBlock;
}

- (void)setResourceUsageStatsProcessingBlock:(id)a3
{
}

- (OS_dispatch_queue)processingBlockTargetQueue
{
  return self->_processingBlockTargetQueue;
}

- (BOOL)includeTimelines
{
  return self->_includeTimelines;
}

- (NSMutableArray)mutableBootSessions
{
  return self->_mutableBootSessions;
}

- (NSMutableArray)mutableProcessingErrors
{
  return self->_mutableProcessingErrors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableProcessingErrors, 0);
  objc_storeStrong((id *)&self->_mutableBootSessions, 0);
  objc_storeStrong((id *)&self->_processingBlockTargetQueue, 0);
  objc_storeStrong(&self->_resourceUsageStatsProcessingBlock, 0);

  objc_storeStrong(&self->_layerStatsProcessingBlock, 0);
}

@end