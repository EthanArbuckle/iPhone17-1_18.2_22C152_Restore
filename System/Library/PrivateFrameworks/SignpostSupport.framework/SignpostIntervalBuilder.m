@interface SignpostIntervalBuilder
+ (BOOL)_filterPassesRequiredSCForFramerate:(id)a3 includeMetal:(BOOL)a4;
+ (id)_framerateCalculationAllowlist:(BOOL)a3;
+ (id)_metalCalculationAllowlist;
- (BOOL)_handleCommonSpecialIntervals:(id)a3;
- (BOOL)_handleMacOsSpecialIntervals:(id)a3;
- (BOOL)_trackBegin:(id)a3;
- (BOOL)buildSkyLightAnimationCompositeIntervalTimelines;
- (BOOL)hasOutstandingAnimations;
- (BOOL)isMetadataSubsystem:(id)a3 category:(id)a4;
- (BOOL)isSkyLightCompositeLoopSubsystem:(id)a3 category:(id)a4;
- (BOOL)processBeginEvent:(id)a3;
- (BOOL)signpostIsAnimationMetadata:(id)a3;
- (BOOL)signpostIsSkyLightCompositeLoop:(id)a3;
- (BOOL)skyLightCompositeIntervalIsInFlight;
- (BOOL)timestampIndicatesDeviceReboot:(unint64_t)a3;
- (NSMapTable)outstandingAnimationState;
- (NSMutableDictionary)processwideDictionary;
- (NSMutableDictionary)systemwideDictionary;
- (NSMutableDictionary)threadwideDictionary;
- (OS_dispatch_queue)syncQueue;
- (SignpostCAInstrumentationProcessor)caInstrumentationProcessor;
- (SignpostIntervalBuilder)init;
- (id)_animationWithBegin:(id)a3 endEvent:(id)a4 firstFrameGraceTimeController:(id)a5;
- (id)_matchingEventForEvent:(id)a3 removeIfFound:(BOOL)a4;
- (id)doneProcessing;
- (id)matchingEventForEvent:(id)a3 removeIfFound:(BOOL)a4;
- (id)processEndEvent:(id)a3 firstFrameGraceTimeController:(id)a4 isAnimation:(BOOL *)a5;
- (unint64_t)previousMCT;
- (unint64_t)totalSkyLightCompositeIntervalCount;
- (void)_cleanupStateForBeginEvent:(id)a3;
- (void)_initializeMapsIfNecessary;
- (void)_processSkyLightCompositeInterval:(id)a3;
- (void)_startTrackingAnimationWithBeginEvent:(id)a3;
- (void)dropAccumulatedState;
- (void)processEmittedEvent:(id)a3;
- (void)setBuildSkyLightAnimationCompositeIntervalTimelines:(BOOL)a3;
- (void)setOutstandingAnimationState:(id)a3;
- (void)setPreviousMCT:(unint64_t)a3;
- (void)setSkyLightCompositeIntervalIsInFlight:(BOOL)a3;
- (void)setTotalSkyLightCompositeIntervalCount:(unint64_t)a3;
@end

@implementation SignpostIntervalBuilder

- (BOOL)_handleCommonSpecialIntervals:(id)a3
{
  id v4 = a3;
  if ([(SignpostIntervalBuilder *)self hasOutstandingAnimations])
  {
    v5 = [(SignpostIntervalBuilder *)self caInstrumentationProcessor];
    char v6 = [v5 handleSignpostInterval:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

void __85__SignpostIntervalBuilder_processEndEvent_firstFrameGraceTimeController_isAnimation___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _resolvedEventType] & 2) == 0) {
    __85__SignpostIntervalBuilder_processEndEvent_firstFrameGraceTimeController_isAnimation___block_invoke_cold_1();
  }
  v2 = [*(id *)(a1 + 40) _matchingEventForEvent:*(void *)(a1 + 32) removeIfFound:1];
  if (v2)
  {
    id v9 = v2;
    if ([v2 isAnimationStart])
    {
      uint64_t v3 = [*(id *)(a1 + 40) _animationWithBegin:v9 endEvent:*(void *)(a1 + 32) firstFrameGraceTimeController:*(void *)(a1 + 48)];
      **(unsigned char **)(a1 + 64) = 1;
      uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
      v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;
    }
    else
    {
      char v6 = [[SignpostInterval alloc] initWithBeginEvent:v9 endEvent:*(void *)(a1 + 32)];
      if (([*(id *)(a1 + 40) _handleCommonSpecialIntervals:v6] & 1) == 0
        && ([*(id *)(a1 + 40) _handleMacOsSpecialIntervals:v6] & 1) == 0)
      {
        v7 = [*(id *)(a1 + 40) caInstrumentationProcessor];
        [v7 handleSignpostInterval:v6];
      }
      **(unsigned char **)(a1 + 64) = 0;
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
      v5 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v6;
    }

    v2 = v9;
  }
}

void __45__SignpostIntervalBuilder_processBeginEvent___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _resolvedEventType] & 1) == 0) {
    __45__SignpostIntervalBuilder_processBeginEvent___block_invoke_cold_1();
  }
  if ([*(id *)(a1 + 40) _trackBegin:*(void *)(a1 + 32)])
  {
    int v2 = [*(id *)(a1 + 32) isAnimationStart];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    if (v2)
    {
      [v3 _startTrackingAnimationWithBeginEvent:v4];
LABEL_9:
      char v5 = 1;
      goto LABEL_10;
    }
    int v6 = [v3 signpostIsSkyLightCompositeLoop:v4];
    v7 = *(void **)(a1 + 40);
    if (!v6)
    {
      uint64_t v8 = [v7 caInstrumentationProcessor];
      [v8 handleSignpostIntervalBegin:*(void *)(a1 + 32)];

      goto LABEL_9;
    }
    char v5 = 1;
    [v7 setSkyLightCompositeIntervalIsInFlight:1];
  }
  else
  {
    char v5 = 0;
  }
LABEL_10:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
}

- (SignpostCAInstrumentationProcessor)caInstrumentationProcessor
{
  return self->_caInstrumentationProcessor;
}

- (BOOL)signpostIsSkyLightCompositeLoop:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 subsystem];
  if ([v4 isEqualToString:@"com.apple.SkyLight"])
  {
    char v5 = [v3 category];
    if ([v5 isEqualToString:@"performance_instrumentation"])
    {
      int v6 = [v3 name];
      char v7 = [v6 isEqualToString:@"CompositeLoop"];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)_matchingEventForEvent:(id)a3 removeIfFound:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = v6;
  if (!v6)
  {
    id v9 = _signpost_debug_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SignpostIntervalBuilder _matchingEventForEvent:removeIfFound:]();
    }
    goto LABEL_29;
  }
  uint64_t v8 = [v6 scope];
  if (v8 == 2)
  {
    v13 = [(SignpostIntervalBuilder *)self threadwideDictionary];
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "threadID"));
    id v9 = [v13 objectForKeyedSubscript:v14];

    if (v9)
    {
      v15 = [v7 _key];
      v16 = [v7 _key];
      v11 = [v9 objectForKeyedSubscript:v16];

      if (v11 && v4) {
        goto LABEL_19;
      }

      if (v11) {
        goto LABEL_30;
      }
    }
    v17 = _signpost_debug_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[SignpostIntervalBuilder _matchingEventForEvent:removeIfFound:].cold.5(v7, v17);
    }
LABEL_28:

LABEL_29:
    v11 = 0;
    goto LABEL_30;
  }
  if (v8 == 1)
  {
    v18 = [(SignpostIntervalBuilder *)self processwideDictionary];
    v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "processID"));
    id v9 = [v18 objectForKeyedSubscript:v19];

    if (v9)
    {
      v15 = [v7 _key];
      uint64_t v20 = [v9 objectForKeyedSubscript:v15];
      v11 = (void *)v20;
      if (v4 && v20)
      {
LABEL_19:
        [v9 removeObjectForKey:v15];

        goto LABEL_30;
      }

      if (v11) {
        goto LABEL_30;
      }
    }
    v17 = _signpost_debug_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[SignpostIntervalBuilder _matchingEventForEvent:removeIfFound:].cold.4(v7);
    }
    goto LABEL_28;
  }
  if (v8)
  {
    id v9 = _signpost_debug_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SignpostIntervalBuilder _matchingEventForEvent:removeIfFound:]();
    }
    goto LABEL_29;
  }
  id v9 = [v7 _key];
  v10 = [(SignpostIntervalBuilder *)self systemwideDictionary];
  v11 = [v10 objectForKeyedSubscript:v9];

  if (v11)
  {
    if (!v4) {
      goto LABEL_30;
    }
    v12 = [(SignpostIntervalBuilder *)self systemwideDictionary];
    [v12 removeObjectForKey:v9];
  }
  else
  {
    v12 = _signpost_debug_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[SignpostIntervalBuilder _matchingEventForEvent:removeIfFound:]((uint64_t)v9, v12);
    }
  }

LABEL_30:

  return v11;
}

- (BOOL)_trackBegin:(id)a3
{
  id v4 = a3;
  if (![v4 scope])
  {
    char v5 = [v4 _key];
    v12 = [(SignpostIntervalBuilder *)self systemwideDictionary];
    v13 = [v12 objectForKeyedSubscript:v5];

    if (v13)
    {
      v14 = _signpost_debug_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[SignpostIntervalBuilder _trackBegin:]((uint64_t)v5, v14);
      }

      goto LABEL_19;
    }
    v21 = [(SignpostIntervalBuilder *)self systemwideDictionary];
    [v21 setObject:v4 forKeyedSubscript:v5];

    goto LABEL_28;
  }
  if ([v4 scope] != 1)
  {
    if ([v4 scope] != 2)
    {
      uint64_t v20 = _signpost_debug_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[SignpostIntervalBuilder _trackBegin:].cold.5();
      }

      goto LABEL_29;
    }
    char v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "threadID"));
    v15 = [(SignpostIntervalBuilder *)self threadwideDictionary];
    char v7 = [v15 objectForKeyedSubscript:v5];

    if (!v7)
    {
      char v7 = [MEMORY[0x1E4F1CA60] dictionary];
      v16 = [(SignpostIntervalBuilder *)self threadwideDictionary];
      [v16 setObject:v7 forKeyedSubscript:v5];
    }
    id v9 = [v4 _key];
    v17 = [v7 objectForKeyedSubscript:v9];

    v11 = _signpost_debug_log();
    BOOL v18 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v17)
    {
      if (v18) {
        [(SignpostIntervalBuilder *)v4 _trackBegin:v11];
      }
      goto LABEL_18;
    }
    if (v18) {
      -[SignpostIntervalBuilder _trackBegin:](v4);
    }

    goto LABEL_27;
  }
  char v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "processID"));
  id v6 = [(SignpostIntervalBuilder *)self processwideDictionary];
  char v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    char v7 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v8 = [(SignpostIntervalBuilder *)self processwideDictionary];
    [v8 setObject:v7 forKeyedSubscript:v5];
  }
  id v9 = [v4 _key];
  v10 = [v7 objectForKeyedSubscript:v9];

  if (!v10)
  {
LABEL_27:
    [v7 setObject:v4 forKeyedSubscript:v9];

LABEL_28:
LABEL_29:
    BOOL v19 = 1;
    goto LABEL_30;
  }
  v11 = _signpost_debug_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[SignpostIntervalBuilder _trackBegin:](v4);
  }
LABEL_18:

LABEL_19:
  BOOL v19 = 0;
LABEL_30:

  return v19;
}

- (NSMutableDictionary)processwideDictionary
{
  return self->_processwideDictionary;
}

- (BOOL)hasOutstandingAnimations
{
  int v2 = [(SignpostIntervalBuilder *)self outstandingAnimationState];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSMapTable)outstandingAnimationState
{
  return self->_outstandingAnimationState;
}

- (BOOL)isMetadataSubsystem:(id)a3 category:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SignpostIntervalBuilder *)self isSkyLightCompositeLoopSubsystem:v6 category:v7])
  {
    char v8 = 1;
  }
  else
  {
    char v8 = SSCAIsCAMetadataSubsystemCategory(v6, v7);
  }

  return v8;
}

- (BOOL)isSkyLightCompositeLoopSubsystem:(id)a3 category:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"com.apple.SkyLight"]) {
    char v6 = [v5 isEqualToString:@"performance_instrumentation"];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (id)processEndEvent:(id)a3 firstFrameGraceTimeController:(id)a4 isAnimation:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  v10 = [(SignpostIntervalBuilder *)self syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__SignpostIntervalBuilder_processEndEvent_firstFrameGraceTimeController_isAnimation___block_invoke;
  block[3] = &unk_1E5B40370;
  id v16 = v8;
  v17 = self;
  BOOL v19 = &v21;
  uint64_t v20 = a5;
  id v18 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, block);

  id v13 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v13;
}

- (BOOL)processBeginEvent:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v5 = [(SignpostIntervalBuilder *)self syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SignpostIntervalBuilder_processBeginEvent___block_invoke;
  block[3] = &unk_1E5B40348;
  id v9 = v4;
  v10 = self;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)processEmittedEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(SignpostIntervalBuilder *)self caInstrumentationProcessor];
  [v5 handleSignpostEvent:v4];
}

- (NSMutableDictionary)systemwideDictionary
{
  return self->_systemwideDictionary;
}

- (BOOL)_handleMacOsSpecialIntervals:(id)a3
{
  id v4 = a3;
  id v5 = [v4 endEvent];
  BOOL v6 = [(SignpostIntervalBuilder *)self signpostIsSkyLightCompositeLoop:v5];

  if (v6) {
    [(SignpostIntervalBuilder *)self _processSkyLightCompositeInterval:v4];
  }

  return v6;
}

- (id)_animationWithBegin:(id)a3 endEvent:(id)a4 firstFrameGraceTimeController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SignpostIntervalBuilder *)self outstandingAnimationState];
  uint64_t v12 = [v11 objectForKey:v8];

  if (([v9 _hasTotalSkyLightCompositeCount] & 1) == 0)
  {
    unint64_t v13 = [(SignpostIntervalBuilder *)self totalSkyLightCompositeIntervalCount];
    if (v13 >= [v8 _totalSkyLightCompositeCount]) {
      uint64_t v14 = [(SignpostIntervalBuilder *)self totalSkyLightCompositeIntervalCount];
    }
    else {
      uint64_t v14 = [v8 _totalSkyLightCompositeCount];
    }
    objc_msgSend(v9, "set_totalSkyLightCompositeCount:", v14);
    objc_msgSend(v9, "set_hasTotalSkyLightCompositeCount:", 1);
  }
  char v15 = [[SignpostAnimationInterval alloc] initWithBeginEvent:v8 endEvent:v9 accumulatedState:v12 firstFrameGraceTimeController:v10];

  [(SignpostIntervalBuilder *)self _cleanupStateForBeginEvent:v8];

  return v15;
}

- (unint64_t)totalSkyLightCompositeIntervalCount
{
  return self->_totalSkyLightCompositeIntervalCount;
}

- (void)_startTrackingAnimationWithBeginEvent:(id)a3
{
  id v6 = a3;
  [(SignpostIntervalBuilder *)self _initializeMapsIfNecessary];
  id v4 = [[SignpostAnimationAccumulatedState alloc] initWithAnimationBeginEvent:v6 shouldTrackComposites:[(SignpostIntervalBuilder *)self buildSkyLightAnimationCompositeIntervalTimelines]];
  id v5 = [(SignpostIntervalBuilder *)self outstandingAnimationState];
  [v5 setObject:v4 forKey:v6];

  if (([v6 _hasTotalSkyLightCompositeCount] & 1) == 0)
  {
    objc_msgSend(v6, "set_totalSkyLightCompositeCount:", -[SignpostIntervalBuilder totalSkyLightCompositeIntervalCount](self, "totalSkyLightCompositeIntervalCount")+ -[SignpostIntervalBuilder skyLightCompositeIntervalIsInFlight](self, "skyLightCompositeIntervalIsInFlight"));
    objc_msgSend(v6, "set_hasTotalSkyLightCompositeCount:", 1);
  }
}

- (BOOL)skyLightCompositeIntervalIsInFlight
{
  return self->_skyLightCompositeIntervalIsInFlight;
}

- (BOOL)buildSkyLightAnimationCompositeIntervalTimelines
{
  return self->_buildSkyLightAnimationCompositeIntervalTimelines;
}

- (void)_initializeMapsIfNecessary
{
  BOOL v3 = [(SignpostIntervalBuilder *)self outstandingAnimationState];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    [(SignpostIntervalBuilder *)self setOutstandingAnimationState:v4];
  }
}

- (void)setOutstandingAnimationState:(id)a3
{
}

- (void)_cleanupStateForBeginEvent:(id)a3
{
  id v8 = a3;
  id v4 = [(SignpostIntervalBuilder *)self outstandingAnimationState];

  if (v4)
  {
    id v5 = [(SignpostIntervalBuilder *)self outstandingAnimationState];
    [v5 removeObjectForKey:v8];

    id v6 = [(SignpostIntervalBuilder *)self outstandingAnimationState];
    uint64_t v7 = [v6 count];

    if (!v7) {
      [(SignpostIntervalBuilder *)self setOutstandingAnimationState:0];
    }
  }
}

void __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = objc_msgSend(WeakRetained, "outstandingAnimationState", 0);
  id v8 = [v7 objectEnumerator];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        uint64_t v14 = [WeakRetained caInstrumentationProcessor];
        objc_msgSend(v13, "_handleRenderServerRender:isLong:isConcise:", v5, a3, objc_msgSend(v14, "isConciseFormat"));

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

void __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = objc_msgSend(WeakRetained, "outstandingAnimationState", 0);
  id v8 = [v7 objectEnumerator];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        uint64_t v14 = [WeakRetained caInstrumentationProcessor];
        objc_msgSend(v13, "_handleFrameLifetime:isLong:isConcise:", v5, a3, objc_msgSend(v14, "isConciseFormat"));

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

void __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = objc_msgSend(WeakRetained, "outstandingAnimationState", 0);
  id v8 = [v7 objectEnumerator];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        uint64_t v14 = [WeakRetained caInstrumentationProcessor];
        objc_msgSend(v13, "_handleFrameLatency:isLong:isConcise:", v5, a3, objc_msgSend(v14, "isConciseFormat"));

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

void __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = objc_msgSend(WeakRetained, "outstandingAnimationState", 0);
  id v8 = [v7 objectEnumerator];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        uint64_t v14 = [WeakRetained caInstrumentationProcessor];
        objc_msgSend(v13, "_handleCommitInterval:isLong:isConcise:", v5, a3, objc_msgSend(v14, "isConciseFormat"));

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

void __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = objc_msgSend(WeakRetained, "outstandingAnimationState", 0);
  id v8 = [v7 objectEnumerator];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        uint64_t v14 = [WeakRetained caInstrumentationProcessor];
        objc_msgSend(v13, "_handleHIDLatency:isLong:isConcise:", v5, a3, objc_msgSend(v14, "isConciseFormat"));

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

+ (id)_framerateCalculationAllowlist:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init(SignpostSupportSubsystemCategoryAllowlist);
  [(SignpostSupportSubsystemCategoryFilter *)v4 addSubsystem:@"com.apple.SkyLight" category:@"performance_instrumentation"];
  +[SignpostCAInstrumentationProcessor addNeededSCToAllowlist:v4];
  if (v3) {
    +[SignpostCAInstrumentationProcessor addNeededMetalSCToAllowlist:v4];
  }

  return v4;
}

+ (BOOL)_filterPassesRequiredSCForFramerate:(id)a3 includeMetal:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 passesSubsystem:@"com.apple.SkyLight" category:@"performance_instrumentation"])
  {
    BOOL v6 = +[SignpostCAInstrumentationProcessor filterPassesRequiredSCForCAInstrumentation:v5];
    if (v6 && v4) {
      LOBYTE(v6) = +[SignpostCAInstrumentationProcessor filterPassesRequiredSCForCAMetalInstrumentation:v5];
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (SignpostIntervalBuilder)init
{
  v7.receiver = self;
  v7.super_class = (Class)SignpostIntervalBuilder;
  int v2 = [(SignpostIntervalBuilder *)&v7 init];
  BOOL v3 = v2;
  if (v2)
  {
    [(SignpostIntervalBuilder *)v2 dropAccumulatedState];
    v3->_buildSkyLightAnimationCompositeIntervalTimelines = 1;
    dispatch_queue_t v4 = dispatch_queue_create("SignpostIntervalBuilder sync queue", 0);
    syncQueue = v3->_syncQueue;
    v3->_syncQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)dropAccumulatedState
{
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  systemwideDictionary = self->_systemwideDictionary;
  self->_systemwideDictionary = v3;

  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  processwideDictionary = self->_processwideDictionary;
  self->_processwideDictionary = v5;

  objc_super v7 = [MEMORY[0x1E4F1CA60] dictionary];
  threadwideDictionary = self->_threadwideDictionary;
  self->_threadwideDictionary = v7;

  uint64_t v9 = objc_alloc_init(SignpostCAInstrumentationProcessor);
  caInstrumentationProcessor = self->_caInstrumentationProcessor;
  self->_caInstrumentationProcessor = v9;

  objc_initWeak(&location, self);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke;
  v31[3] = &unk_1E5B40208;
  objc_copyWeak(&v32, &location);
  uint64_t v11 = [(SignpostIntervalBuilder *)self caInstrumentationProcessor];
  [v11 setCommitIntervalBlock:v31];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_2;
  v29[3] = &unk_1E5B40230;
  objc_copyWeak(&v30, &location);
  uint64_t v12 = [(SignpostIntervalBuilder *)self caInstrumentationProcessor];
  [v12 setClientDrawableIntervalBlock:v29];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_3;
  v27[3] = &unk_1E5B40258;
  objc_copyWeak(&v28, &location);
  unint64_t v13 = [(SignpostIntervalBuilder *)self caInstrumentationProcessor];
  [v13 setTransactionLifetimeBlock:v27];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_4;
  v25[3] = &unk_1E5B40280;
  objc_copyWeak(&v26, &location);
  uint64_t v14 = [(SignpostIntervalBuilder *)self caInstrumentationProcessor];
  [v14 setHidLatencyBlock:v25];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_5;
  v23[3] = &unk_1E5B402A8;
  objc_copyWeak(&v24, &location);
  long long v15 = [(SignpostIntervalBuilder *)self caInstrumentationProcessor];
  [v15 setRenderBlock:v23];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_6;
  v21[3] = &unk_1E5B402D0;
  objc_copyWeak(&v22, &location);
  long long v16 = [(SignpostIntervalBuilder *)self caInstrumentationProcessor];
  [v16 setFrameLatencyBlock:v21];

  uint64_t v19 = MEMORY[0x1E4F143A8];
  objc_copyWeak(&v20, &location);
  long long v17 = [(SignpostIntervalBuilder *)self caInstrumentationProcessor];
  [v17 setFrameLifetimeBlock:&v19];

  outstandingAnimationState = self->_outstandingAnimationState;
  self->_outstandingAnimationState = 0;

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caInstrumentationProcessor, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_outstandingAnimationState, 0);
  objc_storeStrong((id *)&self->_threadwideDictionary, 0);
  objc_storeStrong((id *)&self->_processwideDictionary, 0);

  objc_storeStrong((id *)&self->_systemwideDictionary, 0);
}

void __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v7 = objc_msgSend(WeakRetained, "outstandingAnimationState", 0);
  id v8 = [v7 objectEnumerator];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        uint64_t v14 = [WeakRetained caInstrumentationProcessor];
        objc_msgSend(v13, "_handleClientDrawableInterval:isLong:isConcise:", v5, a3, objc_msgSend(v14, "isConciseFormat"));

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

void __47__SignpostIntervalBuilder_dropAccumulatedState__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v7 = objc_msgSend(WeakRetained, "outstandingAnimationState", 0);
  id v8 = [v7 objectEnumerator];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        uint64_t v14 = [WeakRetained caInstrumentationProcessor];
        objc_msgSend(v13, "_handleTransactionLifetimeInterval:isLong:isConcise:", v5, a3, objc_msgSend(v14, "isConciseFormat"));

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (BOOL)timestampIndicatesDeviceReboot:(unint64_t)a3
{
  unint64_t v5 = [(SignpostIntervalBuilder *)self previousMCT];
  if (v5 > a3)
  {
    BOOL v6 = _signpost_debug_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[SignpostIntervalBuilder timestampIndicatesDeviceReboot:]();
    }

    [(SignpostIntervalBuilder *)self dropAccumulatedState];
  }
  [(SignpostIntervalBuilder *)self setPreviousMCT:a3];
  return v5 > a3;
}

- (id)matchingEventForEvent:(id)a3 removeIfFound:(BOOL)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__0;
  uint64_t v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  objc_super v7 = [(SignpostIntervalBuilder *)self syncQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__SignpostIntervalBuilder_matchingEventForEvent_removeIfFound___block_invoke;
  v11[3] = &unk_1E5B40320;
  id v12 = v6;
  unint64_t v13 = &v15;
  v11[4] = self;
  BOOL v14 = a4;
  id v8 = v6;
  dispatch_sync(v7, v11);

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

uint64_t __63__SignpostIntervalBuilder_matchingEventForEvent_removeIfFound___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _matchingEventForEvent:*(void *)(a1 + 40) removeIfFound:*(unsigned __int8 *)(a1 + 56)];

  return MEMORY[0x1F41817F8]();
}

+ (id)_metalCalculationAllowlist
{
  int v2 = objc_alloc_init(SignpostSupportSubsystemCategoryAllowlist);
  +[SignpostCAInstrumentationProcessor addNeededMetalSCToAllowlist:v2];

  return v2;
}

- (BOOL)signpostIsAnimationMetadata:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SignpostIntervalBuilder *)self signpostIsSkyLightCompositeLoop:v4]
    || SSCAEventTypeForSignpost(v4) != 2
    || SSCAIntervalTypeForSignpostInterval(v4) != 14;

  return v5;
}

- (void)_processSkyLightCompositeInterval:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SignpostIntervalBuilder *)self buildSkyLightAnimationCompositeIntervalTimelines])
  {
    BOOL v5 = [(SignpostIntervalBuilder *)self outstandingAnimationState];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      objc_super v7 = [SignpostSupportCompositorInterval alloc];
      uint64_t v8 = [v4 startMachContinuousTime];
      uint64_t v9 = [v4 endMachContinuousTime];
      [v4 timebaseRatio];
      uint64_t v10 = -[SignpostSupportCompositorInterval initWithStartContinuousTime:endContinuousTime:timebaseRatio:contributingPids:](v7, "initWithStartContinuousTime:endContinuousTime:timebaseRatio:contributingPids:", v8, v9, 0);
      if (v10)
      {
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v11 = [(SignpostIntervalBuilder *)self outstandingAnimationState];
        id v12 = [v11 objectEnumerator];

        uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v18;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v18 != v15) {
                objc_enumerationMutation(v12);
              }
              [*(id *)(*((void *)&v17 + 1) + 8 * v16++) addCompositorInterval:v10];
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v14);
        }
      }
    }
  }
  [(SignpostIntervalBuilder *)self setTotalSkyLightCompositeIntervalCount:[(SignpostIntervalBuilder *)self totalSkyLightCompositeIntervalCount] + 1];
  [(SignpostIntervalBuilder *)self setSkyLightCompositeIntervalIsInFlight:0];
}

- (id)doneProcessing
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  BOOL v3 = [(SignpostIntervalBuilder *)self syncQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__SignpostIntervalBuilder_doneProcessing__block_invoke;
  v6[3] = &unk_1E5B403B8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __41__SignpostIntervalBuilder_doneProcessing__block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) systemwideDictionary];
  BOOL v3 = [v2 allValues];

  id v4 = (void *)MEMORY[0x1E4F1CA48];
  if (v3)
  {
    BOOL v5 = [*(id *)(a1 + 32) systemwideDictionary];
    uint64_t v6 = [v5 allValues];
    uint64_t v7 = [v4 arrayWithArray:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v5 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = [*(id *)(a1 + 32) processwideDictionary];
  uint64_t v13 = [v12 allValues];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ([v18 count])
        {
          long long v19 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          long long v20 = [v18 allValues];
          [v19 addObjectsFromArray:v20];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v15);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v21 = objc_msgSend(*(id *)(a1 + 32), "threadwideDictionary", 0);
  uint64_t v22 = [v21 allValues];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        if ([v27 count])
        {
          id v28 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          v29 = [v27 allValues];
          [v28 addObjectsFromArray:v29];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v24);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) sortUsingComparator:&__block_literal_global_14];
  return [*(id *)(a1 + 32) dropAccumulatedState];
}

uint64_t __41__SignpostIntervalBuilder_doneProcessing__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 startMachContinuousTime];
  if (v6 >= [v5 startMachContinuousTime])
  {
    unint64_t v8 = [v4 startMachContinuousTime];
    uint64_t v7 = v8 > [v5 startMachContinuousTime];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (void)setBuildSkyLightAnimationCompositeIntervalTimelines:(BOOL)a3
{
  self->_buildSkyLightAnimationCompositeIntervalTimelines = a3;
}

- (NSMutableDictionary)threadwideDictionary
{
  return self->_threadwideDictionary;
}

- (void)setTotalSkyLightCompositeIntervalCount:(unint64_t)a3
{
  self->_totalSkyLightCompositeIntervalCount = a3;
}

- (void)setSkyLightCompositeIntervalIsInFlight:(BOOL)a3
{
  self->_skyLightCompositeIntervalIsInFlight = a3;
}

- (unint64_t)previousMCT
{
  return self->_previousMCT;
}

- (void)setPreviousMCT:(unint64_t)a3
{
  self->_previousMCT = a3;
}

- (void)timestampIndicatesDeviceReboot:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1A4576000, v0, v1, "Dropping accumulated state due to out of order timestamp.", v2, v3, v4, v5, v6);
}

- (void)_matchingEventForEvent:removeIfFound:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1A4576000, v0, v1, "Asked to match nil event", v2, v3, v4, v5, v6);
}

- (void)_matchingEventForEvent:removeIfFound:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1A4576000, v0, v1, "Asked to match on unknown scope", v2, v3, v4, v5, v6);
}

- (void)_matchingEventForEvent:(uint64_t)a1 removeIfFound:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A4576000, a2, OS_LOG_TYPE_DEBUG, "Could not find key %@ in systemwide scope", (uint8_t *)&v2, 0xCu);
}

- (void)_matchingEventForEvent:(void *)a1 removeIfFound:.cold.4(void *a1)
{
  int v2 = [a1 _key];
  [a1 processID];
  OUTLINED_FUNCTION_1_1(&dword_1A4576000, v3, v4, "Could not find key %@ in processwide scope for PID %d", v5, v6, v7, v8, 2u);
}

- (void)_matchingEventForEvent:(void *)a1 removeIfFound:(NSObject *)a2 .cold.5(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 _key];
  int v5 = 138412546;
  uint64_t v6 = v4;
  __int16 v7 = 2048;
  uint64_t v8 = [a1 threadID];
  _os_log_debug_impl(&dword_1A4576000, a2, OS_LOG_TYPE_DEBUG, "Could not find key %@ in threadwide scope for thread %#llx", (uint8_t *)&v5, 0x16u);
}

- (void)_trackBegin:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A4576000, a2, OS_LOG_TYPE_DEBUG, "Collision in systemwide scope on %@. Ignoring.", (uint8_t *)&v2, 0xCu);
}

- (void)_trackBegin:(void *)a1 .cold.2(void *a1)
{
  [a1 processID];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1A4576000, v1, v2, "Collision in processwide scope for pid %u on %@. Ignoring.", v3, v4, v5, v6, v7);
}

- (void)_trackBegin:(void *)a1 .cold.3(void *a1)
{
  [a1 processID];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1A4576000, v1, v2, "Adding threadwide event for pid %u on %@.", v3, v4, v5, v6, v7);
}

- (void)_trackBegin:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v6[0] = 67109634;
  v6[1] = [a1 processID];
  __int16 v7 = 2048;
  uint64_t v8 = [a1 threadID];
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl(&dword_1A4576000, a3, OS_LOG_TYPE_DEBUG, "Collision in threadwide scope for pid %u, tid %llu on %@. Ignoring.", (uint8_t *)v6, 0x1Cu);
}

- (void)_trackBegin:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1A4576000, v0, v1, "Unknown scope for event", v2, v3, v4, v5, v6);
}

void __45__SignpostIntervalBuilder_processBeginEvent___block_invoke_cold_1()
{
}

void __85__SignpostIntervalBuilder_processEndEvent_firstFrameGraceTimeController_isAnimation___block_invoke_cold_1()
{
}

@end