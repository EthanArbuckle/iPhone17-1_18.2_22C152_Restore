@interface SignpostSupportObjectExtractor
- (BOOL)_eventPassesFilters:(id)a3;
- (BOOL)_eventPassesWithPid:(int)a3 uniquePid:(unint64_t)a4 processName:(id)a5 subsystem:(id)a6 category:(id)a7;
- (BOOL)_generateIntervalFromEnd:(id)a3 shouldReport:(BOOL)a4;
- (BOOL)_hasNonObjectFilters;
- (BOOL)_hasProcessingBlock;
- (BOOL)_hasSignpostProcessingBlock;
- (BOOL)_isTrackingIntervals;
- (BOOL)_processInternalSignpostEvent:(id)a3 shouldReport:(BOOL)a4;
- (BOOL)_processSignpostEvent:(id)a3 shouldReport:(BOOL)a4;
- (BOOL)_processSignpostSupportLogMessage:(id)a3;
- (BOOL)_shouldBuildEventWithPid:(int)a3 uniquePid:(unint64_t)a4 processName:(id)a5 subsystem:(id)a6 category:(id)a7 shouldReport:(BOOL *)a8;
- (BOOL)_shouldProcessEvent:(id)a3 shouldReport:(BOOL *)a4;
- (BOOL)_shouldStopProcessing;
- (BOOL)buildSkyLightAnimationCompositeIntervalTimelines;
- (BOOL)disableGeneratorProcessing;
- (BOOL)includeMetalAnalysis;
- (BOOL)processSerializedObjectsFromData:(id)a3 errorOut:(id *)a4;
- (BOOL)processSerializedObjectsFromSignpostFile:(id)a3 errorOut:(id *)a4;
- (BOOL)shouldComposeMetadataString;
- (BOOL)skipAnimationStateTrackingOptimization;
- (NSUUID)currentBootUUID;
- (OSLogEventLiveStream)_liveStream;
- (OS_dispatch_queue)notificationProcessingQueue;
- (OS_dispatch_semaphore)completionSemaphore;
- (OS_dispatch_semaphore)syncSem;
- (SignpostIntervalBuilder)intervalBuilder;
- (SignpostSupportAnimationGraceTimeController)animationFirstFrameGraceTimeController;
- (SignpostSupportExactProcessNameFilter)processNameFilter;
- (SignpostSupportObjectExtractor)init;
- (SignpostSupportObjectFilter)objectFilter;
- (SignpostSupportPIDFilter)pidFilter;
- (SignpostSupportSubsystemCategoryFilter)subsystemCategoryFilter;
- (SignpostSupportUniquePIDFilter)uniquePidFilter;
- (double)cachedTimebaseRatio;
- (id)_intervalEndHandler;
- (id)_loggingSupportStreamPredicateFromFiltersWithForLiveStreaming:(BOOL)a3;
- (id)_stopProcessingBlock;
- (id)animationIntervalCompletionProcessingBlock;
- (id)beginEventProcessingBlock;
- (id)deviceRebootProcessingBlock;
- (id)emitEventProcessingBlock;
- (id)endEventProcessingBlock;
- (id)intervalCompletionProcessingBlock;
- (id)logMessageProcessingBlock;
- (id)processingCompletionBlock;
- (id)repeatedBeginEventProcessingBlock;
- (id)timedOutBeginEventProcessingBlock;
- (id)unmatchedEndEventProcessingBlock;
- (unint64_t)_notificationTimeout;
- (unint64_t)processedEventCount;
- (void)_processingCompleted:(id)a3;
- (void)_processingStarting;
- (void)dealloc;
- (void)finishProcessingSerializedData;
- (void)setAnimationIntervalCompletionProcessingBlock:(id)a3;
- (void)setBeginEventProcessingBlock:(id)a3;
- (void)setBuildSkyLightAnimationCompositeIntervalTimelines:(BOOL)a3;
- (void)setCachedTimebaseRatio:(double)a3;
- (void)setCurrentBootUUID:(id)a3;
- (void)setDeviceRebootProcessingBlock:(id)a3;
- (void)setDisableGeneratorProcessing:(BOOL)a3;
- (void)setEmitEventProcessingBlock:(id)a3;
- (void)setEndEventProcessingBlock:(id)a3;
- (void)setIncludeMetalAnalysis:(BOOL)a3;
- (void)setIntervalCompletionProcessingBlock:(id)a3;
- (void)setLogMessageProcessingBlock:(id)a3;
- (void)setNotificationProcessingQueue:(id)a3;
- (void)setObjectFilter:(id)a3;
- (void)setPidFilter:(id)a3;
- (void)setProcessNameFilter:(id)a3;
- (void)setProcessedEventCount:(unint64_t)a3;
- (void)setProcessingCompletionBlock:(id)a3;
- (void)setRepeatedBeginEventProcessingBlock:(id)a3;
- (void)setShouldComposeMetadataString:(BOOL)a3;
- (void)setSkipAnimationStateTrackingOptimization:(BOOL)a3;
- (void)setSubsystemCategoryFilter:(id)a3;
- (void)setTimedOutBeginEventProcessingBlock:(id)a3;
- (void)setUniquePidFilter:(id)a3;
- (void)setUnmatchedEndEventProcessingBlock:(id)a3;
- (void)set_intervalEndHandler:(id)a3;
- (void)set_liveStream:(id)a3;
- (void)set_notificationTimeout:(unint64_t)a3;
- (void)set_shouldStopProcessing:(BOOL)a3;
- (void)set_stopProcessingBlock:(id)a3;
- (void)stopProcessing;
@end

@implementation SignpostSupportObjectExtractor

- (NSUUID)currentBootUUID
{
  return self->_currentBootUUID;
}

- (double)cachedTimebaseRatio
{
  return self->_cachedTimebaseRatio;
}

- (void)setProcessedEventCount:(unint64_t)a3
{
  self->_processedEventCount = a3;
}

- (unint64_t)processedEventCount
{
  return self->_processedEventCount;
}

- (BOOL)_shouldStopProcessing
{
  return self->__shouldStopProcessing;
}

- (BOOL)_processInternalSignpostEvent:(id)a3 shouldReport:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(SignpostSupportObjectExtractor *)self shouldComposeMetadataString]) {
    [v6 setMetadata:0];
  }
  if (([v6 _resolvedEventType] & 4) != 0)
  {
    v8 = [(SignpostSupportObjectExtractor *)self emitEventProcessingBlock];

    if (!v8) {
      goto LABEL_42;
    }
    v9 = [(SignpostSupportObjectExtractor *)self objectFilter];

    if (v9)
    {
      v10 = [(SignpostSupportObjectExtractor *)self objectFilter];
      int v11 = [v10 passesObject:v6];

      if (!v11) {
        goto LABEL_37;
      }
    }
    if (!v4
      || ([(SignpostSupportObjectExtractor *)self emitEventProcessingBlock],
          v12 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(),
          int v13 = ((uint64_t (**)(void, id))v12)[2](v12, v6),
          v12,
          v13))
    {
LABEL_42:
      if ([(SignpostSupportObjectExtractor *)self _isTrackingIntervals])
      {
        v14 = [(SignpostSupportObjectExtractor *)self intervalBuilder];
        [v14 processEmittedEvent:v6];
      }
      goto LABEL_37;
    }
    goto LABEL_39;
  }
  if (([v6 _resolvedEventType] & 1) == 0)
  {
    uint64_t v7 = v4;
    goto LABEL_27;
  }
  v15 = [(SignpostSupportObjectExtractor *)self beginEventProcessingBlock];

  if (!v15)
  {
    uint64_t v7 = v4;
    goto LABEL_23;
  }
  v16 = [(SignpostSupportObjectExtractor *)self objectFilter];

  if (!v16)
  {
    if (!v4)
    {
      uint64_t v7 = 0;
      goto LABEL_23;
    }
LABEL_20:
    v19 = [(SignpostSupportObjectExtractor *)self beginEventProcessingBlock];
    int v20 = ((uint64_t (**)(void, id))v19)[2](v19, v6);

    if (!v20) {
      goto LABEL_39;
    }
    uint64_t v7 = 1;
    goto LABEL_23;
  }
  v17 = [(SignpostSupportObjectExtractor *)self objectFilter];
  int v18 = [v17 passesObject:v6];

  uint64_t v7 = 0;
  if (v18 && v4) {
    goto LABEL_20;
  }
LABEL_23:
  if ([(SignpostSupportObjectExtractor *)self _isTrackingIntervals])
  {
    v21 = [(SignpostSupportObjectExtractor *)self intervalBuilder];
    char v22 = [v21 processBeginEvent:v6];

    if ((v22 & 1) == 0)
    {
      v23 = [(SignpostSupportObjectExtractor *)self repeatedBeginEventProcessingBlock];

      if (v23)
      {
        v24 = [(SignpostSupportObjectExtractor *)self repeatedBeginEventProcessingBlock];
        int v25 = ((uint64_t (**)(void, id))v24)[2](v24, v6);

        if (!v25) {
          goto LABEL_39;
        }
      }
    }
  }
LABEL_27:
  if (([v6 _resolvedEventType] & 2) != 0)
  {
    v26 = [(SignpostSupportObjectExtractor *)self endEventProcessingBlock];

    if (v26)
    {
      v27 = [(SignpostSupportObjectExtractor *)self objectFilter];

      if (v27)
      {
        v28 = [(SignpostSupportObjectExtractor *)self objectFilter];
        int v29 = [v28 passesObject:v6];

        if ((v7 & v29 & 1) == 0)
        {
          uint64_t v7 = 0;
          goto LABEL_35;
        }
      }
      else if (!v7)
      {
        goto LABEL_35;
      }
      v30 = [(SignpostSupportObjectExtractor *)self endEventProcessingBlock];
      int v31 = ((uint64_t (**)(void, id))v30)[2](v30, v6);

      if (!v31) {
        goto LABEL_39;
      }
      uint64_t v7 = 1;
    }
LABEL_35:
    if (![(SignpostSupportObjectExtractor *)self _isTrackingIntervals]
      || [(SignpostSupportObjectExtractor *)self _generateIntervalFromEnd:v6 shouldReport:v7])
    {
      goto LABEL_37;
    }
LABEL_39:
    BOOL v32 = 0;
    goto LABEL_38;
  }
LABEL_37:
  BOOL v32 = 1;
LABEL_38:

  return v32;
}

- (BOOL)shouldComposeMetadataString
{
  return self->_shouldComposeMetadataString;
}

- (BOOL)_hasSignpostProcessingBlock
{
  v3 = [(SignpostSupportObjectExtractor *)self beginEventProcessingBlock];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(SignpostSupportObjectExtractor *)self endEventProcessingBlock];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [(SignpostSupportObjectExtractor *)self unmatchedEndEventProcessingBlock];
      if (v6)
      {
        BOOL v4 = 1;
      }
      else
      {
        uint64_t v7 = [(SignpostSupportObjectExtractor *)self repeatedBeginEventProcessingBlock];
        if (v7)
        {
          BOOL v4 = 1;
        }
        else
        {
          v8 = [(SignpostSupportObjectExtractor *)self emitEventProcessingBlock];
          if (v8)
          {
            BOOL v4 = 1;
          }
          else
          {
            v9 = [(SignpostSupportObjectExtractor *)self intervalCompletionProcessingBlock];
            if (v9)
            {
              BOOL v4 = 1;
            }
            else
            {
              v10 = [(SignpostSupportObjectExtractor *)self animationIntervalCompletionProcessingBlock];
              BOOL v4 = v10 != 0;
            }
          }
        }
      }
    }
  }

  return v4;
}

- (id)beginEventProcessingBlock
{
  return self->_beginEventProcessingBlock;
}

- (id)endEventProcessingBlock
{
  return self->_endEventProcessingBlock;
}

- (BOOL)_isTrackingIntervals
{
  v3 = [(SignpostSupportObjectExtractor *)self unmatchedEndEventProcessingBlock];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(SignpostSupportObjectExtractor *)self repeatedBeginEventProcessingBlock];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [(SignpostSupportObjectExtractor *)self intervalCompletionProcessingBlock];
      if (v6)
      {
        BOOL v4 = 1;
      }
      else
      {
        uint64_t v7 = [(SignpostSupportObjectExtractor *)self animationIntervalCompletionProcessingBlock];
        BOOL v4 = v7 != 0;
      }
    }
  }
  return v4;
}

- (id)unmatchedEndEventProcessingBlock
{
  return self->_unmatchedEndEventProcessingBlock;
}

- (id)repeatedBeginEventProcessingBlock
{
  return self->_repeatedBeginEventProcessingBlock;
}

- (id)intervalCompletionProcessingBlock
{
  return self->_intervalCompletionProcessingBlock;
}

- (id)emitEventProcessingBlock
{
  return self->_emitEventProcessingBlock;
}

- (BOOL)_shouldBuildEventWithPid:(int)a3 uniquePid:(unint64_t)a4 processName:(id)a5 subsystem:(id)a6 category:(id)a7 shouldReport:(BOOL *)a8
{
  uint64_t v12 = *(void *)&a3;
  id v14 = a6;
  id v15 = a7;
  *a8 = 1;
  id v16 = a5;
  v17 = [(SignpostSupportObjectExtractor *)self animationIntervalCompletionProcessingBlock];

  BOOL v18 = [(SignpostSupportObjectExtractor *)self _eventPassesWithPid:v12 uniquePid:a4 processName:v16 subsystem:v14 category:v15];
  if (v17) {
    LOBYTE(v19) = 1;
  }
  else {
    LOBYTE(v19) = v18;
  }
  if (v17 && !v18)
  {
    if (-[SignpostSupportObjectExtractor skipAnimationStateTrackingOptimization](self, "skipAnimationStateTrackingOptimization")|| (-[SignpostSupportObjectExtractor intervalBuilder](self, "intervalBuilder"), int v20 = objc_claimAutoreleasedReturnValue(), v21 = [v20 hasOutstandingAnimations], v20, v21))
    {
      char v22 = [(SignpostSupportObjectExtractor *)self intervalBuilder];
      int v19 = [v22 isMetadataSubsystem:v14 category:v15];

      if (v19)
      {
        *a8 = 0;
        LOBYTE(v19) = 1;
      }
    }
    else
    {
      LOBYTE(v19) = 0;
    }
  }

  return v19;
}

- (SignpostIntervalBuilder)intervalBuilder
{
  return self->_intervalBuilder;
}

- (id)animationIntervalCompletionProcessingBlock
{
  return self->_animationIntervalCompletionProcessingBlock;
}

- (BOOL)_eventPassesWithPid:(int)a3 uniquePid:(unint64_t)a4 processName:(id)a5 subsystem:(id)a6 category:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = [(SignpostSupportObjectExtractor *)self subsystemCategoryFilter];
  if (v15)
  {
    id v16 = (void *)v15;
    v17 = [(SignpostSupportObjectExtractor *)self subsystemCategoryFilter];
    int v18 = [v17 passesSubsystem:v13 category:v14];

    if (!v18) {
      goto LABEL_9;
    }
  }
  uint64_t v19 = [(SignpostSupportObjectExtractor *)self pidFilter];
  if (v19)
  {
    int v20 = (void *)v19;
    int v21 = [(SignpostSupportObjectExtractor *)self pidFilter];
    char v22 = [NSNumber numberWithInt:v10];
    int v23 = [v21 passesPIDNumber:v22];

    if (!v23) {
      goto LABEL_9;
    }
  }
  uint64_t v24 = [(SignpostSupportObjectExtractor *)self uniquePidFilter];
  if (!v24) {
    goto LABEL_7;
  }
  int v25 = (void *)v24;
  v26 = [(SignpostSupportObjectExtractor *)self uniquePidFilter];
  v27 = [NSNumber numberWithUnsignedLongLong:a4];
  int v28 = [v26 passesUniquePIDNumber:v27];

  if (!v28)
  {
LABEL_9:
    char v32 = 0;
  }
  else
  {
LABEL_7:
    uint64_t v29 = [(SignpostSupportObjectExtractor *)self processNameFilter];
    if (v29)
    {
      v30 = (void *)v29;
      int v31 = [(SignpostSupportObjectExtractor *)self processNameFilter];
      char v32 = [v31 passesProcessName:v12];
    }
    else
    {
      char v32 = 1;
    }
  }

  return v32;
}

- (SignpostSupportSubsystemCategoryFilter)subsystemCategoryFilter
{
  return self->_subsystemCategoryFilter;
}

- (BOOL)skipAnimationStateTrackingOptimization
{
  return self->_skipAnimationStateTrackingOptimization;
}

- (BOOL)_generateIntervalFromEnd:(id)a3 shouldReport:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v25 = 0;
  uint64_t v7 = [(SignpostSupportObjectExtractor *)self intervalBuilder];
  v8 = [(SignpostSupportObjectExtractor *)self animationFirstFrameGraceTimeController];
  v9 = [v7 processEndEvent:v6 firstFrameGraceTimeController:v8 isAnimation:&v25];

  if (!v4) {
    goto LABEL_19;
  }
  if (!v9)
  {
    id v14 = [(SignpostSupportObjectExtractor *)self unmatchedEndEventProcessingBlock];

    if (v14)
    {
      uint64_t v15 = [(SignpostSupportObjectExtractor *)self unmatchedEndEventProcessingBlock];
      id v16 = (uint64_t (*)(void))v15[2];
LABEL_17:
      char v22 = v16();
      goto LABEL_18;
    }
LABEL_19:
    char v22 = 1;
    goto LABEL_20;
  }
  uint64_t v10 = [(SignpostSupportObjectExtractor *)self objectFilter];

  if (v10)
  {
    int v11 = [(SignpostSupportObjectExtractor *)self objectFilter];
    int v12 = [v11 passesObject:v9];

    if (!v12) {
      goto LABEL_19;
    }
  }
  id v13 = [(SignpostSupportObjectExtractor *)self intervalCompletionProcessingBlock];
  if (v13)
  {
  }
  else
  {
    v17 = [(SignpostSupportObjectExtractor *)self animationIntervalCompletionProcessingBlock];

    if (!v17) {
      goto LABEL_12;
    }
  }
  int v18 = [(SignpostSupportObjectExtractor *)self _intervalEndHandler];

  if (v18)
  {
    uint64_t v19 = [(SignpostSupportObjectExtractor *)self _intervalEndHandler];
    ((void (**)(void, void *))v19)[2](v19, v9);
  }
LABEL_12:
  if (!v25
    || ([(SignpostSupportObjectExtractor *)self animationIntervalCompletionProcessingBlock], int v20 = objc_claimAutoreleasedReturnValue(), v20, !v20))
  {
    int v23 = [(SignpostSupportObjectExtractor *)self intervalCompletionProcessingBlock];

    if (v23)
    {
      uint64_t v15 = [(SignpostSupportObjectExtractor *)self intervalCompletionProcessingBlock];
      id v16 = (uint64_t (*)(void))v15[2];
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  id v21 = v9;
  uint64_t v15 = [(SignpostSupportObjectExtractor *)self animationIntervalCompletionProcessingBlock];
  char v22 = ((uint64_t (*)(void *, id))v15[2])(v15, v21);

LABEL_18:
LABEL_20:

  return v22;
}

- (SignpostSupportAnimationGraceTimeController)animationFirstFrameGraceTimeController
{
  return self->_animationFirstFrameGraceTimeController;
}

- (SignpostSupportObjectFilter)objectFilter
{
  return self->_objectFilter;
}

- (SignpostSupportUniquePIDFilter)uniquePidFilter
{
  return self->_uniquePidFilter;
}

- (SignpostSupportExactProcessNameFilter)processNameFilter
{
  return self->_processNameFilter;
}

- (id)_intervalEndHandler
{
  return self->__intervalEndHandler;
}

- (BOOL)_processSignpostEvent:(id)a3 shouldReport:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    if ([(SignpostSupportObjectExtractor *)self disableGeneratorProcessing]
      || ![v6 isGenerator])
    {
      if (![(SignpostSupportObjectExtractor *)self _processInternalSignpostEvent:v6 shouldReport:v4])
      {
LABEL_16:
        BOOL v12 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      +[SignpostEvent _generatedEventArrayForEvent:v6];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            if (!-[SignpostSupportObjectExtractor _processInternalSignpostEvent:shouldReport:](self, "_processInternalSignpostEvent:shouldReport:", *(void *)(*((void *)&v14 + 1) + 8 * i), v4, (void)v14))
            {

              goto LABEL_16;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
  }
  BOOL v12 = 1;
LABEL_17:

  return v12;
}

- (BOOL)disableGeneratorProcessing
{
  return self->_disableGeneratorProcessing;
}

- (void)setSubsystemCategoryFilter:(id)a3
{
}

- (id)_loggingSupportStreamPredicateFromFiltersWithForLiveStreaming:(BOOL)a3
{
  BOOL v3 = a3;
  v28[2] = *MEMORY[0x1E4F143B8];
  if (![(SignpostSupportObjectExtractor *)self _hasProcessingBlock])
  {
    int v18 = 0;
    goto LABEL_24;
  }
  v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(SignpostSupportObjectExtractor *)self pidFilter];

  if (v6)
  {
    id v7 = [(SignpostSupportObjectExtractor *)self pidFilter];
    uint64_t v8 = [v7 predicateEquivalent];
    [v5 addObject:v8];
  }
  uint64_t v9 = [(SignpostSupportObjectExtractor *)self uniquePidFilter];

  if (v9)
  {
    uint64_t v10 = [(SignpostSupportObjectExtractor *)self uniquePidFilter];
    int v11 = [v10 predicateEquivalent];
    [v5 addObject:v11];
  }
  BOOL v12 = [(SignpostSupportObjectExtractor *)self processNameFilter];

  if (v12)
  {
    id v13 = [(SignpostSupportObjectExtractor *)self processNameFilter];
    long long v14 = [v13 predicateEquivalent];
    [v5 addObject:v14];
  }
  long long v15 = [(SignpostSupportObjectExtractor *)self subsystemCategoryFilter];

  if (v15)
  {
    long long v16 = [(SignpostSupportObjectExtractor *)self subsystemCategoryFilter];
    long long v17 = v16;
    if (v3) {
      [v16 liveStreamingPredicate];
    }
    else {
    uint64_t v19 = [v16 predicateEquivalent];
    }
    [v5 addObject:v19];
  }
  if ([v5 count])
  {
    int v20 = [(SignpostSupportObjectExtractor *)self subsystemCategoryFilter];

    if (!v20 || v3) {
      goto LABEL_22;
    }
    id v21 = [(SignpostSupportObjectExtractor *)self subsystemCategoryFilter];
    if (+[SignpostIntervalBuilder _filterPassesRequiredSCForFramerate:v21 includeMetal:[(SignpostSupportObjectExtractor *)self includeMetalAnalysis]])
    {

LABEL_22:
      int v18 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v5];
      goto LABEL_23;
    }
    char v22 = [(SignpostSupportObjectExtractor *)self animationIntervalCompletionProcessingBlock];

    if (!v22) {
      goto LABEL_22;
    }
    int v23 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v5];
    uint64_t v24 = +[SignpostIntervalBuilder _framerateCalculationAllowlist:[(SignpostSupportObjectExtractor *)self includeMetalAnalysis]];
    char v25 = [v24 predicateEquivalent];
    v28[0] = v23;
    v28[1] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    int v18 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v26];
  }
  else
  {
    int v18 = 0;
  }
LABEL_23:

LABEL_24:

  return v18;
}

- (SignpostSupportPIDFilter)pidFilter
{
  return self->_pidFilter;
}

- (BOOL)includeMetalAnalysis
{
  return self->_includeMetalAnalysis;
}

- (BOOL)_hasProcessingBlock
{
  if ([(SignpostSupportObjectExtractor *)self _hasSignpostProcessingBlock]) {
    return 1;
  }
  BOOL v4 = [(SignpostSupportObjectExtractor *)self logMessageProcessingBlock];
  if (v4)
  {
    BOOL v3 = 1;
  }
  else
  {
    v5 = [(SignpostSupportObjectExtractor *)self deviceRebootProcessingBlock];
    if (v5)
    {
      BOOL v3 = 1;
    }
    else
    {
      id v6 = [(SignpostSupportObjectExtractor *)self processingCompletionBlock];
      if (v6)
      {
        BOOL v3 = 1;
      }
      else
      {
        id v7 = [(SignpostSupportObjectExtractor *)self timedOutBeginEventProcessingBlock];
        BOOL v3 = v7 != 0;
      }
    }
  }
  return v3;
}

- (void)setCachedTimebaseRatio:(double)a3
{
  self->_cachedTimebaseRatio = a3;
}

- (id)logMessageProcessingBlock
{
  return self->_logMessageProcessingBlock;
}

- (SignpostSupportObjectExtractor)init
{
  v12.receiver = self;
  v12.super_class = (Class)SignpostSupportObjectExtractor;
  v2 = [(SignpostSupportObjectExtractor *)&v12 init];
  if (v2)
  {
    BOOL v3 = objc_alloc_init(SignpostIntervalBuilder);
    intervalBuilder = v2->_intervalBuilder;
    v2->_intervalBuilder = v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    completionSemaphore = v2->_completionSemaphore;
    v2->_completionSemaphore = (OS_dispatch_semaphore *)v5;

    dispatch_semaphore_t v7 = dispatch_semaphore_create(1);
    syncSem = v2->_syncSem;
    v2->_syncSem = (OS_dispatch_semaphore *)v7;

    uint64_t v9 = objc_alloc_init(SignpostSupportAnimationGraceTimeController);
    animationFirstFrameGraceTimeController = v2->_animationFirstFrameGraceTimeController;
    v2->_animationFirstFrameGraceTimeController = v9;

    v2->_shouldComposeMetadataString = 1;
  }
  return v2;
}

- (void)set_stopProcessingBlock:(id)a3
{
}

- (void)setIntervalCompletionProcessingBlock:(id)a3
{
}

- (void)setEmitEventProcessingBlock:(id)a3
{
}

- (void)setAnimationIntervalCompletionProcessingBlock:(id)a3
{
}

- (void)_processingStarting
{
}

- (void)dealloc
{
  [(SignpostSupportObjectExtractor *)self _processingCompleted:0];
  v3.receiver = self;
  v3.super_class = (Class)SignpostSupportObjectExtractor;
  [(SignpostSupportObjectExtractor *)&v3 dealloc];
}

- (void)_processingCompleted:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_semaphore_t v5 = [(SignpostSupportObjectExtractor *)self syncSem];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  id v6 = [(SignpostSupportObjectExtractor *)self processingCompletionBlock];

  if (v6)
  {
    dispatch_semaphore_t v7 = [(SignpostSupportObjectExtractor *)self intervalBuilder];
    uint64_t v8 = [v7 doneProcessing];

    if ([(SignpostSupportObjectExtractor *)self _hasNonObjectFilters])
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v34 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            if ([(SignpostSupportObjectExtractor *)self _eventPassesFilters:v15]) {
              [v9 addObject:v15];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v12);
      }
    }
    else
    {
      uint64_t v9 = v8;
    }
    long long v16 = [(SignpostSupportObjectExtractor *)self objectFilter];

    if (v16)
    {
      long long v17 = [MEMORY[0x1E4F1CA48] array];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v18 = v9;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v30;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * j);
            uint64_t v24 = [(SignpostSupportObjectExtractor *)self objectFilter];
            int v25 = [v24 passesObject:v23];

            if (v25) {
              [v17 addObject:v23];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v20);
      }
    }
    else
    {
      long long v17 = v9;
    }
    v26 = [(SignpostSupportObjectExtractor *)self processingCompletionBlock];
    ((void (**)(void, id, void *))v26)[2](v26, v4, v17);

    [(SignpostSupportObjectExtractor *)self setProcessingCompletionBlock:0];
  }
  [(SignpostSupportObjectExtractor *)self stopProcessing];
  v27 = [(SignpostSupportObjectExtractor *)self completionSemaphore];
  dispatch_semaphore_signal(v27);

  [(SignpostSupportObjectExtractor *)self setNotificationProcessingQueue:0];
  int v28 = [(SignpostSupportObjectExtractor *)self syncSem];
  dispatch_semaphore_signal(v28);
}

- (OS_dispatch_semaphore)syncSem
{
  return self->_syncSem;
}

- (OS_dispatch_semaphore)completionSemaphore
{
  return self->_completionSemaphore;
}

- (void)stopProcessing
{
  [(SignpostSupportObjectExtractor *)self set_shouldStopProcessing:1];
  objc_super v3 = [(SignpostSupportObjectExtractor *)self _stopProcessingBlock];

  if (v3)
  {
    id v4 = [(SignpostSupportObjectExtractor *)self _stopProcessingBlock];
    v4[2]();
  }
}

- (id)_stopProcessingBlock
{
  return self->__stopProcessingBlock;
}

- (void)set_shouldStopProcessing:(BOOL)a3
{
  self->__shouldStopProcessing = a3;
}

- (void)setNotificationProcessingQueue:(id)a3
{
}

- (id)processingCompletionBlock
{
  return self->_processingCompletionBlock;
}

- (void)setCurrentBootUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__intervalEndHandler, 0);
  objc_storeStrong(&self->__stopProcessingBlock, 0);
  objc_storeStrong((id *)&self->__liveStream, 0);
  objc_storeStrong((id *)&self->_notificationProcessingQueue, 0);
  objc_storeStrong((id *)&self->_currentBootUUID, 0);
  objc_storeStrong((id *)&self->_syncSem, 0);
  objc_storeStrong((id *)&self->_completionSemaphore, 0);
  objc_storeStrong(&self->_timedOutBeginEventProcessingBlock, 0);
  objc_storeStrong((id *)&self->_intervalBuilder, 0);
  objc_storeStrong((id *)&self->_animationFirstFrameGraceTimeController, 0);
  objc_storeStrong(&self->_processingCompletionBlock, 0);
  objc_storeStrong(&self->_deviceRebootProcessingBlock, 0);
  objc_storeStrong(&self->_logMessageProcessingBlock, 0);
  objc_storeStrong(&self->_animationIntervalCompletionProcessingBlock, 0);
  objc_storeStrong(&self->_intervalCompletionProcessingBlock, 0);
  objc_storeStrong(&self->_emitEventProcessingBlock, 0);
  objc_storeStrong(&self->_unmatchedEndEventProcessingBlock, 0);
  objc_storeStrong(&self->_repeatedBeginEventProcessingBlock, 0);
  objc_storeStrong(&self->_endEventProcessingBlock, 0);
  objc_storeStrong(&self->_beginEventProcessingBlock, 0);
  objc_storeStrong((id *)&self->_objectFilter, 0);
  objc_storeStrong((id *)&self->_uniquePidFilter, 0);
  objc_storeStrong((id *)&self->_pidFilter, 0);
  objc_storeStrong((id *)&self->_processNameFilter, 0);

  objc_storeStrong((id *)&self->_subsystemCategoryFilter, 0);
}

- (BOOL)processSerializedObjectsFromData:(id)a3 errorOut:(id *)a4
{
  id v6 = a3;
  [(SignpostSupportObjectExtractor *)self _processingStarting];
  if (![(SignpostSupportObjectExtractor *)self _hasProcessingBlock])
  {
    if (a4)
    {
      dispatch_semaphore_t v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = @"No processing blocks specified";
      uint64_t v9 = 8;
      goto LABEL_7;
    }
LABEL_8:
    BOOL v10 = 0;
    goto LABEL_15;
  }
  if (![(SignpostSupportObjectExtractor *)self _shouldStopProcessing])
  {
    uint64_t v16 = 0;
    long long v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 1;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = __Block_byref_object_copy_;
    v14[4] = __Block_byref_object_dispose_;
    id v15 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __93__SignpostSupportObjectExtractor_Deserialization__processSerializedObjectsFromData_errorOut___block_invoke;
    v13[3] = &unk_1E5B3FF08;
    v13[4] = self;
    v13[5] = &v16;
    v13[6] = v14;
    BOOL v10 = SignpostSupportDeserializationEnumerateObjectArrayFromData((uint64_t)v6, a4, (uint64_t)v13);
    if (v10)
    {
      if (*((unsigned char *)v17 + 24))
      {
LABEL_14:
        _Block_object_dispose(v14, 8);

        _Block_object_dispose(&v16, 8);
        goto LABEL_15;
      }
      id v11 = 0;
    }
    else
    {
      id v11 = *a4;
    }
    [(SignpostSupportObjectExtractor *)self _processingCompleted:v11];
    goto LABEL_14;
  }
  if (!a4) {
    goto LABEL_8;
  }
  dispatch_semaphore_t v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = @"Processing requested after processing already completed.";
  uint64_t v9 = 3;
LABEL_7:
  [v7 errorWithCode:v9 description:v8];
  BOOL v10 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v10;
}

void __93__SignpostSupportObjectExtractor_Deserialization__processSerializedObjectsFromData_errorOut___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [*(id *)(a1 + 32) subsystemCategoryFilter];
    if (!v6) {
      goto LABEL_4;
    }
    dispatch_semaphore_t v7 = (void *)v6;
    uint64_t v8 = [*(id *)(a1 + 32) subsystemCategoryFilter];
    uint64_t v9 = [v5 subsystem];
    BOOL v10 = [v5 category];
    int v11 = [v8 passesSubsystem:v9 category:v10];

    if (v11)
    {
LABEL_4:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _processSignpostSupportLogMessage:v5];
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        *a3 = 1;
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v5;
      uint64_t v13 = [*(id *)(a1 + 32) intervalBuilder];
      int v14 = objc_msgSend(v13, "timestampIndicatesDeviceReboot:", objc_msgSend(v12, "timeRecordedMachContinuousTime"));

      if (v14)
      {
        id v15 = [*(id *)(a1 + 32) deviceRebootProcessingBlock];

        if (v15)
        {
          uint64_t v16 = [*(id *)(a1 + 32) deviceRebootProcessingBlock];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v16[2]();

          if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
            *a3 = 1;
          }
        }
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        unsigned __int8 v21 = 0;
        if ([*(id *)(a1 + 32) _shouldProcessEvent:v12 shouldReport:&v21])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _processSignpostEvent:v12 shouldReport:v21];
          if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
            *a3 = 1;
          }
        }
      }
    }
    else
    {
      long long v17 = _signpost_debug_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        __93__SignpostSupportObjectExtractor_Deserialization__processSerializedObjectsFromData_errorOut___block_invoke_cold_1(v17);
      }

      *a3 = 1;
      uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithCode:3 description:@"Unexpected serialized class instance found"];
      uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
  }
}

- (void)finishProcessingSerializedData
{
  if ([(SignpostSupportObjectExtractor *)self _shouldStopProcessing])
  {
    objc_super v3 = _signpost_debug_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[SignpostSupportObjectExtractor(Deserialization) finishProcessingSerializedData](v3);
    }
  }
  else
  {
    [(SignpostSupportObjectExtractor *)self _processingCompleted:0];
  }
}

- (BOOL)processSerializedObjectsFromSignpostFile:(id)a3 errorOut:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(SignpostSupportObjectExtractor *)self _processingStarting];
  if ([(SignpostSupportObjectExtractor *)self _hasProcessingBlock])
  {
    id v41 = 0;
    dispatch_semaphore_t v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v6 options:1 error:&v41];
    id v8 = v41;
    uint64_t v9 = v8;
    if (v7) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      id v12 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v13 = objc_opt_class();
      int v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
      id v40 = 0;
      id v15 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v7 error:&v40];
      id v16 = v40;
      long long v17 = v16;
      if (!v15 || v16)
      {
        BOOL v11 = 0;
        if (a4) {
          *a4 = (id)[v16 copy];
        }
      }
      else
      {
        uint64_t v18 = [v15 decodeObjectOfClasses:v14 forKey:*MEMORY[0x1E4F284E8]];
        uint64_t v19 = v18;
        if (v18)
        {
          long long v31 = v15;
          long long v32 = v14;
          long long v33 = v9;
          long long v34 = v7;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v30 = v18;
          id v20 = v18;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v42 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            id v23 = 0;
            uint64_t v24 = *(void *)v37;
            while (2)
            {
              uint64_t v25 = 0;
              v26 = v23;
              do
              {
                if (*(void *)v37 != v24) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v27 = *(void *)(*((void *)&v36 + 1) + 8 * v25);
                id v35 = v26;
                BOOL v28 = [(SignpostSupportObjectExtractor *)self processSerializedObjectsFromData:v27 errorOut:&v35];
                id v23 = v35;

                if (!v28)
                {
                  if (a4) {
                    *a4 = (id)[v23 copy];
                  }

                  BOOL v11 = 0;
                  goto LABEL_34;
                }
                ++v25;
                v26 = v23;
              }
              while (v22 != v25);
              uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v42 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }
          else
          {
            id v23 = 0;
          }

          [(SignpostSupportObjectExtractor *)self finishProcessingSerializedData];
          BOOL v11 = 1;
LABEL_34:
          uint64_t v9 = v33;
          dispatch_semaphore_t v7 = v34;
          id v15 = v31;
          long long v17 = 0;
          uint64_t v19 = v30;

          int v14 = v32;
        }
        else
        {
          BOOL v11 = 0;
          if (a4) {
            *a4 = (id)[0 copy];
          }
        }
      }
    }
    else
    {
      BOOL v11 = 0;
      if (a4) {
        *a4 = (id)[v8 copy];
      }
    }
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithCode:8 description:@"No processing blocks specified"];
    BOOL v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_hasNonObjectFilters
{
  objc_super v3 = [(SignpostSupportObjectExtractor *)self subsystemCategoryFilter];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(SignpostSupportObjectExtractor *)self pidFilter];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [(SignpostSupportObjectExtractor *)self uniquePidFilter];
      if (v6)
      {
        BOOL v4 = 1;
      }
      else
      {
        dispatch_semaphore_t v7 = [(SignpostSupportObjectExtractor *)self processNameFilter];
        BOOL v4 = v7 != 0;
      }
    }
  }
  return v4;
}

- (BOOL)_eventPassesFilters:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 processID];
  uint64_t v6 = [v4 processUniqueID];
  dispatch_semaphore_t v7 = [v4 processName];
  id v8 = [v4 subsystem];
  uint64_t v9 = [v4 category];

  LOBYTE(self) = [(SignpostSupportObjectExtractor *)self _eventPassesWithPid:v5 uniquePid:v6 processName:v7 subsystem:v8 category:v9];
  return (char)self;
}

- (BOOL)_shouldProcessEvent:(id)a3 shouldReport:(BOOL *)a4
{
  id v6 = a3;
  *a4 = 1;
  dispatch_semaphore_t v7 = [(SignpostSupportObjectExtractor *)self animationIntervalCompletionProcessingBlock];

  if (v7)
  {
    id v8 = [(SignpostSupportObjectExtractor *)self subsystemCategoryFilter];

    if (v8 && ![(SignpostSupportObjectExtractor *)self _eventPassesFilters:v6])
    {
      uint64_t v9 = [(SignpostSupportObjectExtractor *)self intervalBuilder];
      int v10 = [v9 signpostIsAnimationMetadata:v6];

      if (!v10)
      {
        BOOL v11 = 0;
        goto LABEL_9;
      }
      *a4 = 0;
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = [(SignpostSupportObjectExtractor *)self _eventPassesFilters:v6];
  }
LABEL_9:

  return v11;
}

- (BOOL)_processSignpostSupportLogMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SignpostSupportObjectExtractor *)self logMessageProcessingBlock];

  if (v5
    && (([(SignpostSupportObjectExtractor *)self objectFilter],
         id v6 = objc_claimAutoreleasedReturnValue(),
         v6,
         !v6)
     || ([(SignpostSupportObjectExtractor *)self objectFilter],
         dispatch_semaphore_t v7 = objc_claimAutoreleasedReturnValue(),
         int v8 = [v7 passesObject:v4],
         v7,
         v8)))
  {
    uint64_t v9 = [(SignpostSupportObjectExtractor *)self logMessageProcessingBlock];
    char v10 = ((uint64_t (**)(void, id))v9)[2](v9, v4);
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (BOOL)buildSkyLightAnimationCompositeIntervalTimelines
{
  v2 = [(SignpostSupportObjectExtractor *)self intervalBuilder];
  char v3 = [v2 buildSkyLightAnimationCompositeIntervalTimelines];

  return v3;
}

- (void)setBuildSkyLightAnimationCompositeIntervalTimelines:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SignpostSupportObjectExtractor *)self intervalBuilder];
  [v4 setBuildSkyLightAnimationCompositeIntervalTimelines:v3];
}

- (void)setProcessNameFilter:(id)a3
{
}

- (void)setPidFilter:(id)a3
{
}

- (void)setUniquePidFilter:(id)a3
{
}

- (void)setObjectFilter:(id)a3
{
}

- (void)setShouldComposeMetadataString:(BOOL)a3
{
  self->_shouldComposeMetadataString = a3;
}

- (void)setIncludeMetalAnalysis:(BOOL)a3
{
  self->_includeMetalAnalysis = a3;
}

- (void)setBeginEventProcessingBlock:(id)a3
{
}

- (void)setEndEventProcessingBlock:(id)a3
{
}

- (void)setRepeatedBeginEventProcessingBlock:(id)a3
{
}

- (void)setUnmatchedEndEventProcessingBlock:(id)a3
{
}

- (void)setLogMessageProcessingBlock:(id)a3
{
}

- (id)deviceRebootProcessingBlock
{
  return self->_deviceRebootProcessingBlock;
}

- (void)setDeviceRebootProcessingBlock:(id)a3
{
}

- (void)setProcessingCompletionBlock:(id)a3
{
}

- (id)timedOutBeginEventProcessingBlock
{
  return self->_timedOutBeginEventProcessingBlock;
}

- (void)setTimedOutBeginEventProcessingBlock:(id)a3
{
}

- (unint64_t)_notificationTimeout
{
  return self->__notificationTimeout;
}

- (void)set_notificationTimeout:(unint64_t)a3
{
  self->__notificationTimeout = a3;
}

- (OS_dispatch_queue)notificationProcessingQueue
{
  return self->_notificationProcessingQueue;
}

- (OSLogEventLiveStream)_liveStream
{
  return self->__liveStream;
}

- (void)set_liveStream:(id)a3
{
}

- (void)set_intervalEndHandler:(id)a3
{
}

- (void)setSkipAnimationStateTrackingOptimization:(BOOL)a3
{
  self->_skipAnimationStateTrackingOptimization = a3;
}

- (void)setDisableGeneratorProcessing:(BOOL)a3
{
  self->_disableGeneratorProcessing = a3;
}

void __93__SignpostSupportObjectExtractor_Deserialization__processSerializedObjectsFromData_errorOut___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A4576000, log, OS_LOG_TYPE_DEBUG, "Unexpected serialized class instance", v1, 2u);
}

@end