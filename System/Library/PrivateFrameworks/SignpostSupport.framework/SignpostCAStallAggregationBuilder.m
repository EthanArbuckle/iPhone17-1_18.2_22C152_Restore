@interface SignpostCAStallAggregationBuilder
- (BOOL)_isOverThreshold:(id)a3;
- (OS_dispatch_queue)syncQueue;
- (SignpostCAInstrumentationProcessor)caInstrumentationProcessor;
- (SignpostCAStallAggregation)stallAggregation;
- (SignpostCAStallAggregation)stallAggregationSnapshot;
- (SignpostCAStallAggregationBuilder)init;
- (float)maxDurationSec;
- (id)newConfiguredExtractor;
- (void)_handleLongCommit:(id)a3;
- (void)_handleLongFrameLifetime:(id)a3;
- (void)_handleLongTransactionLifetime:(id)a3;
- (void)_initializeCAInstrumentationProcessor;
- (void)_processDurationNs:(unint64_t)a3 type:(unsigned __int8)a4 processExecutablePath:(id)a5 pid:(int)a6 aggregateForSystem:(BOOL)a7;
- (void)addSubsystemCategoriesOfInterestToAllowlist:(id)a3;
- (void)handleDeviceReboot;
- (void)handleSignpostEvent:(id)a3;
- (void)handleSignpostInterval:(id)a3;
- (void)handleSignpostIntervalBegin:(id)a3;
- (void)setMaxDurationSec:(float)a3;
@end

@implementation SignpostCAStallAggregationBuilder

- (void)_initializeCAInstrumentationProcessor
{
  v3 = objc_alloc_init(SignpostCAInstrumentationProcessor);
  caInstrumentationProcessor = self->_caInstrumentationProcessor;
  self->_caInstrumentationProcessor = v3;

  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__SignpostCAStallAggregationBuilder__initializeCAInstrumentationProcessor__block_invoke;
  v12[3] = &unk_1E5B40208;
  objc_copyWeak(&v13, &location);
  v5 = [(SignpostCAStallAggregationBuilder *)self caInstrumentationProcessor];
  [v5 setCommitIntervalBlock:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__SignpostCAStallAggregationBuilder__initializeCAInstrumentationProcessor__block_invoke_2;
  v10[3] = &unk_1E5B40258;
  objc_copyWeak(&v11, &location);
  v6 = [(SignpostCAStallAggregationBuilder *)self caInstrumentationProcessor];
  [v6 setTransactionLifetimeBlock:v10];

  uint64_t v8 = MEMORY[0x1E4F143A8];
  objc_copyWeak(&v9, &location);
  v7 = [(SignpostCAStallAggregationBuilder *)self caInstrumentationProcessor];
  [v7 setFrameLifetimeBlock:&v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __74__SignpostCAStallAggregationBuilder__initializeCAInstrumentationProcessor__block_invoke(uint64_t a1, void *a2, int a3)
{
  if (a3)
  {
    v3 = (id *)(a1 + 32);
    id v4 = a2;
    id WeakRetained = objc_loadWeakRetained(v3);
    [WeakRetained _handleLongCommit:v4];
  }
}

void __74__SignpostCAStallAggregationBuilder__initializeCAInstrumentationProcessor__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  if (a3)
  {
    v3 = (id *)(a1 + 32);
    id v4 = a2;
    id WeakRetained = objc_loadWeakRetained(v3);
    [WeakRetained _handleLongTransactionLifetime:v4];
  }
}

void __74__SignpostCAStallAggregationBuilder__initializeCAInstrumentationProcessor__block_invoke_3(uint64_t a1, void *a2, int a3)
{
  if (a3)
  {
    v3 = (id *)(a1 + 32);
    id v4 = a2;
    id WeakRetained = objc_loadWeakRetained(v3);
    [WeakRetained _handleLongFrameLifetime:v4];
  }
}

- (SignpostCAStallAggregationBuilder)init
{
  v8.receiver = self;
  v8.super_class = (Class)SignpostCAStallAggregationBuilder;
  v2 = [(SignpostCAStallAggregationBuilder *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(SignpostCAStallAggregation);
    stallAggregation = v2->_stallAggregation;
    v2->_stallAggregation = v3;

    dispatch_queue_t v5 = dispatch_queue_create("SignpostCAStallAggregator sync queue", 0);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v5;

    [(SignpostCAStallAggregationBuilder *)v2 _initializeCAInstrumentationProcessor];
  }
  return v2;
}

- (void)handleDeviceReboot
{
  id v2 = [(SignpostCAStallAggregationBuilder *)self caInstrumentationProcessor];
  [v2 handleDeviceReboot];
}

- (void)addSubsystemCategoriesOfInterestToAllowlist:(id)a3
{
}

- (void)_processDurationNs:(unint64_t)a3 type:(unsigned __int8)a4 processExecutablePath:(id)a5 pid:(int)a6 aggregateForSystem:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = a4;
  id v12 = a5;
  if (v12)
  {
    id v13 = [(SignpostCAStallAggregationBuilder *)self stallAggregation];
    [v13 _addDuration:a3 ofType:v9 procExecutablePath:v12 responsiblePID:v8 aggregateForSystem:v7];
  }
  else
  {
    v14 = _signpost_debug_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](v14);
    }
  }
}

- (SignpostCAStallAggregation)stallAggregationSnapshot
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  id v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  v3 = [(SignpostCAStallAggregationBuilder *)self syncQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SignpostCAStallAggregationBuilder_stallAggregationSnapshot__block_invoke;
  v6[3] = &unk_1E5B405A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SignpostCAStallAggregation *)v4;
}

void __61__SignpostCAStallAggregationBuilder_stallAggregationSnapshot__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) stallAggregation];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)_isOverThreshold:(id)a3
{
  id v4 = a3;
  [(SignpostCAStallAggregationBuilder *)self maxDurationSec];
  BOOL v9 = 0;
  if (v5 != 0.0)
  {
    [v4 durationSeconds];
    float v7 = v6;
    [(SignpostCAStallAggregationBuilder *)self maxDurationSec];
    if (v7 > v8) {
      BOOL v9 = 1;
    }
  }

  return v9;
}

- (void)_handleLongCommit:(id)a3
{
  id v6 = a3;
  if (!-[SignpostCAStallAggregationBuilder _isOverThreshold:](self, "_isOverThreshold:"))
  {
    ++self->_commitCount;
    uint64_t v4 = [v6 durationNanoseconds];
    float v5 = [v6 executablePath];
    -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](self, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v4, 0, v5, [v6 pid], 1);
  }
}

- (void)_handleLongTransactionLifetime:(id)a3
{
  id v6 = a3;
  if (!-[SignpostCAStallAggregationBuilder _isOverThreshold:](self, "_isOverThreshold:"))
  {
    ++self->_transactionLifetimeCount;
    uint64_t v4 = [v6 durationNanoseconds];
    float v5 = [v6 executablePath];
    -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](self, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v4, 4, v5, [v6 pid], 1);
  }
}

- (void)_handleLongFrameLifetime:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(SignpostCAStallAggregationBuilder *)self _isOverThreshold:v4])
  {
    ++self->_frameLifetimeCount;
    uint64_t v5 = [v4 hidLatencyInterval];
    if (v5)
    {
      id v6 = (void *)v5;
      int v7 = [v4 hidLatencyIsLong];

      if (v7)
      {
        float v8 = [v4 contextInfoForHIDInput];

        if (v8)
        {
          BOOL v9 = [v4 hidLatencyInterval];
          uint64_t v10 = [v9 durationNanoseconds];
          id v11 = [v4 contextInfoForHIDInput];
          id v12 = [v11 executablePath];
          id v13 = [v4 contextInfoForHIDInput];
          -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](self, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v10, 1, v12, [v13 pid], 1);
        }
        else
        {
          BOOL v9 = [(SignpostCAStallAggregationBuilder *)self stallAggregation];
          id v11 = [v4 hidLatencyInterval];
          objc_msgSend(v9, "_addSystemDuration:ofType:", objc_msgSend(v11, "durationNanoseconds"), 1);
        }
      }
    }
    uint64_t v14 = [v4 renderInterval];
    if (v14)
    {
      v15 = (void *)v14;
      int v16 = [v4 renderIntervalIsLong];

      if (v16)
      {
        v17 = [(SignpostCAStallAggregationBuilder *)self stallAggregation];
        v18 = [v4 renderInterval];
        objc_msgSend(v17, "_addSystemDuration:ofType:", objc_msgSend(v18, "durationNanoseconds"), 3);
      }
    }
    uint64_t v19 = [v4 frameLatencyInterval];
    if (v19)
    {
      v20 = (void *)v19;
      int v21 = [v4 frameLatencyIsLong];

      if (v21)
      {
        v22 = [(SignpostCAStallAggregationBuilder *)self stallAggregation];
        v23 = [v4 frameLatencyInterval];
        objc_msgSend(v22, "_addSystemDuration:ofType:", objc_msgSend(v23, "durationNanoseconds"), 2);
      }
    }
    id v24 = [v4 frameOverrunInactiveDisplayInterval];
    v25 = [v4 discrepancyFrameOverrunInactiveDisplayInterval];
    int v66 = [v4 mayBeFirstFrame];
    int v26 = [v4 frameStallSkipRequest];
    uint64_t v27 = 11;
    if (!v24 && v25)
    {
      id v24 = v25;
      uint64_t v27 = 12;
    }
    v28 = [v4 earliestTimeContextInfo];

    if (v28)
    {
      int obj = v26;
      v29 = NSNumber;
      v30 = [v4 earliestTimeContextInfo];
      v31 = objc_msgSend(v29, "numberWithInt:", objc_msgSend(v30, "pid"));

      uint64_t v32 = [v4 durationNanoseconds];
      v33 = [v4 earliestTimeContextInfo];
      v34 = [v33 executablePath];
      v35 = [v4 earliestTimeContextInfo];
      -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](self, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v32, 6, v34, [v35 pid], 0);

      if (v24)
      {
        uint64_t v36 = [v24 durationNanoseconds];
        v37 = [v4 earliestTimeContextInfo];
        v38 = [v37 executablePath];
        v39 = [v4 earliestTimeContextInfo];
        -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](self, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v36, 8, v38, [v39 pid], 0);

        if (((v66 | obj) & 1) == 0)
        {
          uint64_t v40 = [v24 durationNanoseconds];
          v41 = [v4 earliestTimeContextInfo];
          v42 = [v41 executablePath];
          v43 = [v4 earliestTimeContextInfo];
          -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](self, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v40, v27, v42, [v43 pid], 0);
        }
        if (v66)
        {
          uint64_t v44 = [v24 durationNanoseconds];
          v45 = [v4 earliestTimeContextInfo];
          v46 = [v45 executablePath];
          v47 = [v4 earliestTimeContextInfo];
          -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](self, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v44, 10, v46, [v47 pid], 0);
        }
      }
      v65 = v25;
      v67 = self;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id obja = [v4 contributingPIDs];
      uint64_t v48 = [obja countByEnumeratingWithState:&v70 objects:v74 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v71;
        do
        {
          for (uint64_t i = 0; i != v49; ++i)
          {
            if (*(void *)v71 != v50) {
              objc_enumerationMutation(obja);
            }
            v52 = *(void **)(*((void *)&v70 + 1) + 8 * i);
            if (([v52 isEqualToNumber:v31] & 1) == 0)
            {
              v53 = [v4 pidToContextInfoArrayDict];
              v54 = [v53 objectForKeyedSubscript:v52];
              v55 = [v54 firstObject];

              uint64_t v56 = [v4 durationNanoseconds];
              v57 = [v55 executablePath];
              -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](v67, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v56, 5, v57, [v55 pid], 0);

              if (v24)
              {
                uint64_t v58 = [v24 durationNanoseconds];
                v59 = [v55 executablePath];
                -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](v67, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v58, 7, v59, [v55 pid], 0);

                if (v66)
                {
                  uint64_t v60 = [v24 durationNanoseconds];
                  v61 = [v55 executablePath];
                  -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](v67, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v60, 9, v61, [v55 pid], 0);
                }
              }
            }
          }
          uint64_t v49 = [obja countByEnumeratingWithState:&v70 objects:v74 count:16];
        }
        while (v49);
      }

      self = v67;
      v25 = v65;
    }
    v62 = [(SignpostCAStallAggregationBuilder *)self stallAggregation];
    objc_msgSend(v62, "_addSystemDuration:ofType:", objc_msgSend(v4, "durationNanoseconds"), 5);

    if (v24)
    {
      v63 = [(SignpostCAStallAggregationBuilder *)self stallAggregation];
      objc_msgSend(v63, "_addSystemDuration:ofType:", objc_msgSend(v24, "durationNanoseconds"), 7);

      if (v66)
      {
        v64 = [(SignpostCAStallAggregationBuilder *)self stallAggregation];
        objc_msgSend(v64, "_addSystemDuration:ofType:", objc_msgSend(v24, "durationNanoseconds"), 9);
      }
    }
  }
}

- (void)handleSignpostEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(SignpostCAStallAggregationBuilder *)self caInstrumentationProcessor];
  [v5 handleSignpostEvent:v4];
}

- (void)handleSignpostInterval:(id)a3
{
  id v4 = a3;
  id v5 = [(SignpostCAStallAggregationBuilder *)self caInstrumentationProcessor];
  [v5 handleSignpostInterval:v4];
}

- (void)handleSignpostIntervalBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(SignpostCAStallAggregationBuilder *)self caInstrumentationProcessor];
  [v5 handleSignpostIntervalBegin:v4];
}

- (id)newConfiguredExtractor
{
  uint64_t v3 = objc_alloc_init(SignpostSupportObjectExtractor);
  id v4 = objc_alloc_init(SignpostSupportSubsystemCategoryAllowlist);
  [(SignpostCAStallAggregationBuilder *)self addSubsystemCategoriesOfInterestToAllowlist:v4];
  [(SignpostSupportObjectExtractor *)v3 setSubsystemCategoryFilter:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__SignpostCAStallAggregationBuilder_newConfiguredExtractor__block_invoke;
  v9[3] = &unk_1E5B400C0;
  v9[4] = self;
  [(SignpostSupportObjectExtractor *)v3 setIntervalCompletionProcessingBlock:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__SignpostCAStallAggregationBuilder_newConfiguredExtractor__block_invoke_2;
  v8[3] = &unk_1E5B400E8;
  v8[4] = self;
  [(SignpostSupportObjectExtractor *)v3 setBeginEventProcessingBlock:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SignpostCAStallAggregationBuilder_newConfiguredExtractor__block_invoke_3;
  v7[3] = &unk_1E5B400E8;
  v7[4] = self;
  [(SignpostSupportObjectExtractor *)v3 setEmitEventProcessingBlock:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__SignpostCAStallAggregationBuilder_newConfiguredExtractor__block_invoke_4;
  v6[3] = &unk_1E5B40110;
  v6[4] = self;
  [(SignpostSupportObjectExtractor *)v3 setDeviceRebootProcessingBlock:v6];

  return v3;
}

uint64_t __59__SignpostCAStallAggregationBuilder_newConfiguredExtractor__block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __59__SignpostCAStallAggregationBuilder_newConfiguredExtractor__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __59__SignpostCAStallAggregationBuilder_newConfiguredExtractor__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __59__SignpostCAStallAggregationBuilder_newConfiguredExtractor__block_invoke_4(uint64_t a1)
{
  return 1;
}

- (float)maxDurationSec
{
  return self->_maxDurationSec;
}

- (void)setMaxDurationSec:(float)a3
{
  self->_maxDurationSec = a3;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (SignpostCAStallAggregation)stallAggregation
{
  return self->_stallAggregation;
}

- (SignpostCAInstrumentationProcessor)caInstrumentationProcessor
{
  return self->_caInstrumentationProcessor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caInstrumentationProcessor, 0);
  objc_storeStrong((id *)&self->_stallAggregation, 0);

  objc_storeStrong((id *)&self->_syncQueue, 0);
}

- (void)_processDurationNs:(os_log_t)log type:processExecutablePath:pid:aggregateForSystem:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A4576000, log, OS_LOG_TYPE_DEBUG, "Nil process executable. Ignoring interval", v1, 2u);
}

@end