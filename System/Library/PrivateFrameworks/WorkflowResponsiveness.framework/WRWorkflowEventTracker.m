@interface WRWorkflowEventTracker
+ (id)tailspinDirectory;
+ (uint64_t)isReservedSignpostName:(uint64_t)a1;
+ (uint64_t)isReservedWorkflowName:(uint64_t)a1;
+ (void)cleanupDirectory:(void *)a3 ofFilesWithSuffix:(void *)a4 olderThan:;
+ (void)cleanupWorkflowResponsivenessDiagnosticsDirectory;
+ (void)makeTailspinDirectory;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)stats;
- (BOOL)gatherDiagnosticsIfNeeded;
- (BOOL)handleSignpost:(id)a3;
- (BOOL)ignoreEventTimeouts;
- (BOOL)inMiddleOfEvent;
- (NSArray)allSignpostTrackers;
- (NSError)error;
- (NSMutableDictionary)environment;
- (NSMutableDictionary)nonPublicFields;
- (NSString)eventIdentifier;
- (WRSignpost)endSignpost;
- (WRSignpost)startSignpost;
- (WRTimestampAndThread)eventEnd;
- (WRTimestampAndThread)eventStart;
- (WRWorkflow)workflow;
- (WRWorkflowEventTracker)initWithEncodedDict:(id)a3 error:(id *)a4;
- (WRWorkflowEventTracker)initWithEncodedString:(id)a3 error:(id *)a4;
- (WRWorkflowEventTracker)initWithSpindump:(id)a3 error:(id *)a4;
- (WRWorkflowEventTracker)initWithTailspin:(id)a3 error:(id *)a4;
- (WRWorkflowEventTracker)initWithWorkflow:(id)a3 eventCompletionCallback:(id)a4;
- (id)allSignpostTrackersMutable;
- (id)candidateEndSignpostTrackers;
- (id)concurrentEvents;
- (id)debugDescription;
- (id)diagnosticsExceedingThresholds;
- (id)encodedDict;
- (id)encodedStringWithError:(id *)a3;
- (id)eventCompletionCallback;
- (id)eventIdentifierForSignpostObject:(void *)a3 wrSignopst:;
- (id)individuationIdentifierForSignpostEvent:(void *)a3 individuationFieldName:;
- (id)individuationIdentifierForSignpostObject:(void *)a3 individuationFieldName:;
- (id)initForLiveStreamingWithWorkflow:(id)a3 timeoutQueue:(id)a4 eventCompletionCallback:(id)a5;
- (id)initForReadbackWithWorkflow:(id)a3 eventCompletionCallback:(id)a4;
- (id)initWithWorkflow:(id *)a1;
- (id)newConcurrentEventWithIdentifier:(void *)a1;
- (id)openIndividuatedIntervalsWithFieldNameMatchingAnEndSignpostFromBeforeEventStart;
- (id)timeoutQueue;
- (id)timeoutSource;
- (id)trackerForWRSignpost:(void *)a3 individuationIdentifier:;
- (id)valueForFieldName:(void *)a3 inSignpostEvent:;
- (id)valueForFieldName:(void *)a3 inSignpostObject:;
- (uint64_t)gatherDiagnosticsWithTailspin:(int)a3 tailspinIncludeOSLogs:;
- (uint64_t)handleError:(void *)a3 atEndTime:;
- (uint64_t)handleSignpost:(void *)a3 wrsignpost:;
- (uint64_t)haveAnyEndSignpostsWithIndividuationFieldName:(void *)a1;
- (unint64_t)numHandledSignposts;
- (unint64_t)numOutsideSignposts;
- (unint64_t)numUnhandledSignposts;
- (void)applySignpost:(void *)a3 toSignpostTracker:;
- (void)checkForNonPublicField:(void *)a3 fieldName:(void *)a4 messageArgument:;
- (void)doneHandlingSignpostsWithEndTimeMachContNs:(unint64_t)a3;
- (void)encodedDict;
- (void)fillInNonDiagnosticSignpost:(void *)a1;
- (void)gatherDiagnosticsIfNeeded;
- (void)generateTelemetry;
- (void)initWithEncodedData:(void *)a3 error:;
- (void)reportCoreAnalyticsEventForSignpost:(void *)a3 allCount:(void *)a4 allDurationUnionSec:(void *)a5 allDurationSumSec:(void *)a6 allDurationLongestSec:(void *)a7 allDurationUntrackedSec:(void *)a8 allDurationNonNetworkBoundSec:(void *)a9 allTimeUntilFirstSignpost:(void *)a10 allTimeAfterLastSignpost:(void *)a11 incompleteCount:(void *)a12 completeDurationUnionSec:(void *)a13 completeDurationSumSec:(void *)a14 completeDurationLongestSec:(void *)a15 completeTimeUntilFirstSignpost:(void *)a16 environment:;
- (void)reportErrorsAndResetAtMachContNs:(void *)a3 date:;
- (void)reset;
- (void)resetWithoutReportingErrors;
- (void)sawIndividuationFieldName:(void *)a3 withIndividuationIdentifier:;
- (void)setAllSignpostTrackersMutable:(void *)a1;
- (void)setCandidateEndSignpostTrackers:(void *)a1;
- (void)setConcurrentEvents:(void *)a1;
- (void)setError:(void *)a1;
- (void)setEventIdentifier:(void *)a1;
- (void)setIgnoreEventTimeouts:(BOOL)a3;
- (void)setNonPublicFields:(id)a3;
- (void)setOpenIndividuatedIntervalsWithFieldNameMatchingAnEndSignpostFromBeforeEventStart:(void *)a1;
- (void)setTimeoutQueue:(void *)a1;
- (void)setTimeoutSource:(void *)a1;
- (void)submitCAEventName:(void *)a3 dict:(void *)a4 forSignpost:;
@end

@implementation WRWorkflowEventTracker

- (id)initForReadbackWithWorkflow:(id)a3 eventCompletionCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[WRWorkflowEventTracker initWithWorkflow:]((id *)&self->super.isa, v6);
  if (v8)
  {
    uint64_t v9 = MEMORY[0x263E46C40](v7);
    id v10 = v8[18];
    v8[18] = (id)v9;

    id v11 = objc_alloc(MEMORY[0x263EFF980]);
    v12 = [v6 allSignposts];
    uint64_t v13 = objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count"));
    id v14 = v8[13];
    v8[13] = (id)v13;

    id v15 = objc_alloc(MEMORY[0x263EFF980]);
    v16 = [v6 endSignpostGroups];
    uint64_t v17 = objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v16, "count"));
    id v18 = v8[19];
    v8[19] = (id)v17;

    v19 = [v6 endSignpostGroups];
    uint64_t v20 = [v19 count];

    if (v20)
    {
      unint64_t v22 = 0;
      do
      {
        id Property = objc_getProperty(v8, v21, 152, 1);
        v24 = (void *)MEMORY[0x263EFF9D0];
        id v25 = Property;
        v26 = [v24 null];
        [v25 addObject:v26];

        ++v22;
        v27 = [v6 endSignpostGroups];
        unint64_t v28 = [v27 count];
      }
      while (v22 < v28);
    }
  }

  return v8;
}

- (id)initWithWorkflow:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)WRWorkflowEventTracker;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 2, a2);
    }
  }

  return a1;
}

- (id)candidateEndSignpostTrackers
{
  if (result) {
    return objc_getProperty(result, a2, 152, 1);
  }
  return result;
}

- (id)initForLiveStreamingWithWorkflow:(id)a3 timeoutQueue:(id)a4 eventCompletionCallback:(id)a5
{
  id v9 = a4;
  id v10 = [(WRWorkflowEventTracker *)self initForReadbackWithWorkflow:a3 eventCompletionCallback:a5];
  id v11 = v10;
  if (v10) {
    objc_storeStrong(v10 + 15, a4);
  }

  return v11;
}

- (BOOL)inMiddleOfEvent
{
  v2 = [(WRWorkflowEventTracker *)self eventStart];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSArray)allSignpostTrackers
{
  if (self) {
    self = (WRWorkflowEventTracker *)objc_getProperty(self, a2, 104, 1);
  }
  v2 = (void *)[(WRWorkflowEventTracker *)self copy];

  return (NSArray *)v2;
}

- (id)allSignpostTrackersMutable
{
  if (result) {
    return objc_getProperty(result, a2, 104, 1);
  }
  return result;
}

- (void)reset
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  -[WRWorkflowEventTracker reportErrorsAndResetAtMachContNs:date:](self, 0, 0);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  if (self) {
    id Property = objc_getProperty(self, v3, 112, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[WRWorkflowEventTracker reportErrorsAndResetAtMachContNs:date:](*(void **)(*((void *)&v10 + 1) + 8 * v9++), 0, 0);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)reportErrorsAndResetAtMachContNs:(void *)a3 date:
{
  id v5 = a3;
  if (a1)
  {
    if (![a1 inMiddleOfEvent])
    {
LABEL_18:
      [(WRWorkflowEventTracker *)a1 resetWithoutReportingErrors];
      goto LABEL_19;
    }
    uint64_t v7 = [a1 workflow];
    [v7 name];

    [a1 eventIdentifier];
    uint64_t v8 = [a1 eventIdentifier];

    int v9 = *__error();
    long long v10 = _wrlog();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v11) {
        -[WRWorkflowEventTracker reportErrorsAndResetAtMachContNs:date:]();
      }
    }
    else if (v11)
    {
      -[WRWorkflowEventTracker reportErrorsAndResetAtMachContNs:date:](a1);
    }

    *__error() = v9;
    if (!a2 || !v5)
    {
      v29 = WRMakeError(5, @"Workflow event incomplete", v12, v13, v14, v15, v16, v17, v44);
      -[WRWorkflowEventTracker handleError:atEndTime:]((uint64_t)a1, v29, 0);
      goto LABEL_17;
    }
    id v18 = [a1 workflow];
    if ([v18 hasMaximumEventDuration])
    {
      v19 = [a1 eventStart];
      uint64_t v20 = [v19 machContTimeNs];
      v21 = [a1 workflow];
      [v21 maximumEventDuration];
      if (v20 + (unint64_t)(v22 * 1000000000.0) <= (unint64_t)a2)
      {
        char v33 = [a1 ignoreEventTimeouts];

        if ((v33 & 1) == 0)
        {
          v34 = [WRTimestampAndThread alloc];
          v35 = [a1 eventStart];
          uint64_t v36 = [v35 machContTimeNs];
          v37 = [a1 workflow];
          [v37 maximumEventDuration];
          v39 = (void *)(v36 + (unint64_t)(v38 * 1000000000.0));
          v40 = [a1 eventStart];
          v41 = [v40 date];
          v42 = [a1 workflow];
          [v42 maximumEventDuration];
          v43 = objc_msgSend(v41, "dateByAddingTimeInterval:");
          v29 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)&v34->super.isa, -1, 0, v39, v43);

          v30 = @"Workflow event timed out";
          uint64_t v31 = 4;
          goto LABEL_15;
        }
LABEL_14:
        v29 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)[WRTimestampAndThread alloc], -1, 0, a2, v5);
        v30 = @"Workflow event incomplete";
        uint64_t v31 = 5;
LABEL_15:
        v32 = WRMakeError(v31, v30, v23, v24, v25, v26, v27, v28, v44);
        -[WRWorkflowEventTracker handleError:atEndTime:]((uint64_t)a1, v32, v29);

LABEL_17:
        goto LABEL_18;
      }
    }
    goto LABEL_14;
  }
LABEL_19:
}

- (id)concurrentEvents
{
  if (result) {
    return objc_getProperty(result, a2, 112, 1);
  }
  return result;
}

- (uint64_t)handleError:(void *)a3 atEndTime:
{
  if (result)
  {
    id v4 = (void *)result;
    id v5 = a3;
    objc_setProperty_atomic(v4, v6, a2, 64);
    objc_setProperty_atomic(v4, v7, v5, 48);

    int v9 = (uint64_t (*)(void))*(objc_getProperty(v4, v8, 144, 1) + 2);
    return v9();
  }
  return result;
}

- (void)resetWithoutReportingErrors
{
  if (a1)
  {
    if (objc_getProperty(a1, a2, 128, 1))
    {
      id Property = objc_getProperty(a1, v3, 128, 1);
      dispatch_source_cancel(Property);
      objc_setProperty_atomic(a1, v5, 0, 128);
    }
    objc_setProperty_atomic(a1, v3, 0, 32);
    objc_setProperty_atomic(a1, v6, 0, 40);
    objc_setProperty_atomic(a1, v7, 0, 48);
    objc_setProperty_atomic(a1, v8, 0, 56);
    objc_setProperty_atomic(a1, v9, 0, 64);
    objc_msgSend(objc_getProperty(a1, v10, 152, 1), "removeAllObjects");
    BOOL v11 = [a1 workflow];
    uint64_t v12 = [v11 endSignpostGroups];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      unint64_t v15 = 0;
      do
      {
        id v16 = objc_getProperty(a1, v14, 152, 1);
        uint64_t v17 = (void *)MEMORY[0x263EFF9D0];
        id v18 = v16;
        v19 = [v17 null];
        [v18 addObject:v19];

        ++v15;
        uint64_t v20 = [a1 workflow];
        v21 = [v20 endSignpostGroups];
        unint64_t v22 = [v21 count];
      }
      while (v15 < v22);
    }
    id v23 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v24 = [a1 workflow];
    uint64_t v25 = [v24 allSignposts];
    uint64_t v26 = objc_msgSend(v23, "initWithCapacity:", objc_msgSend(v25, "count"));
    objc_setProperty_atomic(a1, v27, v26, 104);

    objc_setProperty_atomic(a1, v28, 0, 136);
  }
}

- (id)timeoutSource
{
  if (result) {
    return objc_getProperty(result, a2, 128, 1);
  }
  return result;
}

- (void)setTimeoutSource:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 128);
  }
}

- (void)setError:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 64);
  }
}

- (void)setAllSignpostTrackersMutable:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 104);
  }
}

- (void)setOpenIndividuatedIntervalsWithFieldNameMatchingAnEndSignpostFromBeforeEventStart:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 136);
  }
}

- (id)valueForFieldName:(void *)a3 inSignpostObject:
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = 0;
  if (a1 && v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
      -[WRWorkflowEventTracker valueForFieldName:inSignpostEvent:](a1, v5, v8);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        [v8 name];

        SEL v9 = [a1 workflow];
        [v9 name];

        [a1 eventIdentifier];
        SEL v10 = [a1 eventIdentifier];

        int v11 = *__error();
        uint64_t v12 = _wrlog();
        BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_FAULT);
        if (v10)
        {
          if (v13)
          {
            uint64_t v14 = [a1 workflow];
            unint64_t v15 = [v14 name];
            id v16 = [a1 eventIdentifier];
            uint64_t v17 = [v8 name];
            *(_DWORD *)buf = 138544386;
            v43 = v15;
            __int16 v44 = 2114;
            v45 = v16;
            __int16 v46 = 2114;
            id v47 = v17;
            __int16 v48 = 2114;
            id v49 = v5;
            __int16 v50 = 2112;
            uint64_t v51 = 0;
            _os_log_fault_impl(&dword_261964000, v12, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: No field value", buf, 0x34u);
          }
        }
        else if (v13)
        {
          v35 = [a1 workflow];
          uint64_t v36 = [v35 name];
          v37 = [v8 name];
          *(_DWORD *)buf = 138544130;
          v43 = v36;
          __int16 v44 = 2114;
          v45 = v37;
          __int16 v46 = 2114;
          id v47 = v5;
          __int16 v48 = 2112;
          id v49 = 0;
          _os_log_fault_impl(&dword_261964000, v12, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: %{public}@->%@: No field value", buf, 0x2Au);
        }
        *__error() = v11;
      }
LABEL_29:

      goto LABEL_30;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v6 beginEvent];
      id v18 = -[WRWorkflowEventTracker valueForFieldName:inSignpostEvent:](a1, v5, v8);
      if (v18)
      {
        id v7 = v18;
      }
      else
      {
        uint64_t v24 = [v6 endEvent];
        uint64_t v25 = -[WRWorkflowEventTracker valueForFieldName:inSignpostEvent:](a1, v5, v24);
        if (!v25)
        {
          [v6 name];

          uint64_t v26 = [a1 workflow];
          [v26 name];

          [a1 eventIdentifier];
          SEL v27 = [a1 eventIdentifier];

          int v28 = *__error();
          v29 = _wrlog();
          BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_FAULT);
          if (v27)
          {
            if (v30)
            {
              v41 = [a1 workflow];
              uint64_t v31 = [v41 name];
              v32 = [a1 eventIdentifier];
              char v33 = [v6 name];
              *(_DWORD *)buf = 138544386;
              v43 = v31;
              __int16 v44 = 2114;
              v45 = v32;
              __int16 v46 = 2114;
              id v47 = v33;
              __int16 v48 = 2114;
              id v49 = v5;
              __int16 v50 = 2112;
              uint64_t v51 = 0;
              _os_log_fault_impl(&dword_261964000, v29, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: No field value", buf, 0x34u);
            }
          }
          else if (v30)
          {
            double v38 = [a1 workflow];
            v39 = [v38 name];
            v40 = [v6 name];
            *(_DWORD *)buf = 138544130;
            v43 = v39;
            __int16 v44 = 2114;
            v45 = v40;
            __int16 v46 = 2114;
            id v47 = v5;
            __int16 v48 = 2112;
            id v49 = 0;
            _os_log_fault_impl(&dword_261964000, v29, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: %{public}@->%@: No field value", buf, 0x2Au);
          }
          *__error() = v28;
        }
        id v7 = v25;
      }
      goto LABEL_29;
    }
    v19 = [a1 workflow];
    [v19 name];

    [a1 eventIdentifier];
    uint64_t v20 = [a1 eventIdentifier];

    int v21 = *__error();
    unint64_t v22 = _wrlog();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_FAULT);
    if (v20)
    {
      if (v23) {
        -[WRWorkflowEventTracker valueForFieldName:inSignpostObject:](a1, v6, v22);
      }
    }
    else if (v23)
    {
      -[WRWorkflowEventTracker valueForFieldName:inSignpostObject:]();
    }

    id v7 = 0;
    *__error() = v21;
  }
LABEL_30:

  return v7;
}

- (id)valueForFieldName:(void *)a3 inSignpostEvent:
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  id v8 = 0;
  if (a1 && v5)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = [v6 metadataSegments];
    uint64_t v9 = [obj countByEnumeratingWithState:&v48 objects:v63 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      v40 = a1;
      v41 = v7;
      v43 = v5;
      uint64_t v11 = *(void *)v49;
      while (1)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v49 != v11) {
            objc_enumerationMutation(obj);
          }
          BOOL v13 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          uint64_t v14 = objc_msgSend(v13, "placeholderTokens", v40);
          uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v62 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v45;
LABEL_10:
            uint64_t v18 = 0;
            while (1)
            {
              if (*(void *)v45 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v44 + 1) + 8 * v18);
              if ([v19 hasPrefix:@"name="]) {
                break;
              }
              if (v16 == ++v18)
              {
                uint64_t v16 = [v14 countByEnumeratingWithState:&v44 objects:v62 count:16];
                if (v16) {
                  goto LABEL_10;
                }
                goto LABEL_16;
              }
            }
            BOOL v20 = PlaceholderNameMatches(v19, v43);

            if (!v20) {
              continue;
            }
            int v21 = [v13 argument];
            id v7 = v41;
            id v5 = v43;
            -[WRWorkflowEventTracker checkForNonPublicField:fieldName:messageArgument:]((uint64_t)v40, v41, v43, v21);
            int v22 = [v21 type];
            switch(v22)
            {
              case 3:
                BOOL v23 = [v21 argumentObject];
                id v8 = [v23 stringValue];

                goto LABEL_38;
              case 2:
                [v41 name];

                uint64_t v24 = [v40 workflow];
                [v24 name];

                [v40 eventIdentifier];
                uint64_t v25 = [v40 eventIdentifier];

                int v26 = *__error();
                SEL v27 = _wrlog();
                BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_FAULT);
                if (v25)
                {
                  if (v28)
                  {
                    v29 = [v40 workflow];
                    BOOL v30 = [v29 name];
                    uint64_t v31 = [v40 eventIdentifier];
                    v32 = [v41 name];
                    *(_DWORD *)buf = 138544386;
                    v53 = v30;
                    __int16 v54 = 2114;
                    v55 = v31;
                    __int16 v56 = 2114;
                    v57 = v32;
                    __int16 v58 = 2114;
                    v59 = v43;
                    __int16 v60 = 2112;
                    uint64_t v61 = 0;
                    _os_log_fault_impl(&dword_261964000, v27, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: metadata is data type", buf, 0x34u);
                    goto LABEL_33;
                  }
LABEL_37:

                  id v8 = 0;
                  *__error() = v26;
                  goto LABEL_38;
                }
                if (!v28) {
                  goto LABEL_37;
                }
                uint64_t v36 = [v40 workflow];
                v37 = [v36 name];
                double v38 = [v41 name];
                *(_DWORD *)buf = 138544130;
                v53 = v37;
                __int16 v54 = 2114;
                v55 = v38;
                __int16 v56 = 2114;
                v57 = v43;
                __int16 v58 = 2112;
                v59 = 0;
                _os_log_fault_impl(&dword_261964000, v27, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: %{public}@->%@: metadata is data type", buf, 0x2Au);
                break;
              case 1:
                id v8 = [v21 argumentObject];
LABEL_38:

                goto LABEL_39;
              default:
                [v41 name];

                char v33 = [v40 workflow];
                [v33 name];

                [v40 eventIdentifier];
                v34 = [v40 eventIdentifier];

                int v26 = *__error();
                SEL v27 = _wrlog();
                BOOL v35 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
                if (v34)
                {
                  if (v35)
                  {
                    v29 = [v40 workflow];
                    BOOL v30 = [v29 name];
                    uint64_t v31 = [v40 eventIdentifier];
                    v32 = [v41 name];
                    *(_DWORD *)buf = 138544386;
                    v53 = v30;
                    __int16 v54 = 2114;
                    v55 = v31;
                    __int16 v56 = 2114;
                    v57 = v32;
                    __int16 v58 = 2114;
                    v59 = v43;
                    __int16 v60 = 2112;
                    uint64_t v61 = 0;
                    _os_log_error_impl(&dword_261964000, v27, OS_LOG_TYPE_ERROR, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: found missing individuation identifier", buf, 0x34u);
LABEL_33:

                    id v5 = v43;
                  }
                  goto LABEL_37;
                }
                if (!v35) {
                  goto LABEL_37;
                }
                uint64_t v36 = [v40 workflow];
                v37 = [v36 name];
                double v38 = [v41 name];
                *(_DWORD *)buf = 138544130;
                v53 = v37;
                __int16 v54 = 2114;
                v55 = v38;
                __int16 v56 = 2114;
                v57 = v43;
                __int16 v58 = 2112;
                v59 = 0;
                _os_log_error_impl(&dword_261964000, v27, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: %{public}@->%@: found missing individuation identifier", buf, 0x2Au);
                break;
            }

            goto LABEL_37;
          }
LABEL_16:
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v48 objects:v63 count:16];
        if (!v10)
        {
          id v8 = 0;
          id v5 = v43;
          id v7 = v41;
          goto LABEL_39;
        }
      }
    }
    id v8 = 0;
LABEL_39:
  }

  return v8;
}

- (id)individuationIdentifierForSignpostObject:(void *)a3 individuationFieldName:
{
  if (a1)
  {
    a1 = -[WRWorkflowEventTracker valueForFieldName:inSignpostObject:](a1, a3, a2);
    uint64_t v3 = vars8;
  }
  return a1;
}

- (id)eventIdentifierForSignpostObject:(void *)a3 wrSignopst:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    if ([v6 eventIdentifierIsSignpostID])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v5;
LABEL_8:
        uint64_t v11 = v8;
        uint64_t v12 = [v8 scope];
        if (v12 == 2)
        {
          uint64_t v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lu-%llu-%llu", objc_msgSend(v11, "scope"), objc_msgSend(v11, "threadID"), objc_msgSend(v11, "signpostId"));
        }
        else if (v12 == 1)
        {
          uint64_t v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lu-%d-%llu", objc_msgSend(v11, "scope"), objc_msgSend(v11, "processID"), objc_msgSend(v11, "signpostId"));
        }
        else
        {
          uint64_t v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lu-%llu", objc_msgSend(v11, "scope"), objc_msgSend(v11, "signpostId"), v20);
        }
        uint64_t v10 = (void *)v13;

        goto LABEL_20;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [v5 endEvent];
        goto LABEL_8;
      }
      uint64_t v14 = [a1 workflow];
      [v14 name];

      [a1 eventIdentifier];
      uint64_t v15 = [a1 eventIdentifier];

      int v16 = *__error();
      uint64_t v17 = _wrlog();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_FAULT);
      if (v15)
      {
        if (v18) {
          -[WRWorkflowEventTracker valueForFieldName:inSignpostObject:](a1, v5, v17);
        }
      }
      else if (v18)
      {
        -[WRWorkflowEventTracker valueForFieldName:inSignpostObject:]();
      }

      uint64_t v10 = 0;
      *__error() = v16;
    }
    else
    {
      uint64_t v9 = [v7 eventIdentifierFieldName];
      uint64_t v10 = -[WRWorkflowEventTracker valueForFieldName:inSignpostObject:](a1, v9, v5);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_20:

  return v10;
}

- (void)checkForNonPublicField:(void *)a3 fieldName:(void *)a4 messageArgument:
{
  id v15 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (a1 && v8 && *(void *)(a1 + 96) && [v8 privacyLevel] != 2)
  {
    uint64_t v10 = *(void **)(a1 + 96);
    uint64_t v11 = [v15 name];
    id v12 = [v10 objectForKeyedSubscript:v11];

    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v13 = *(void **)(a1 + 96);
      uint64_t v14 = [v15 name];
      [v13 setObject:v12 forKeyedSubscript:v14];
    }
    if (([v12 containsObject:v7] & 1) == 0) {
      [v12 addObject:v7];
    }
  }
}

- (id)individuationIdentifierForSignpostEvent:(void *)a3 individuationFieldName:
{
  if (a1)
  {
    a1 = -[WRWorkflowEventTracker valueForFieldName:inSignpostEvent:](a1, a3, a2);
    uint64_t v3 = vars8;
  }
  return a1;
}

- (id)trackerForWRSignpost:(void *)a3 individuationIdentifier:
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = objc_getProperty(a1, v6, 104, 1);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
        objc_msgSend(v13, "signpost", (void)v20);
        id v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14 == v5) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_17;
        }
      }
      uint64_t v15 = [v13 individuationIdentifier];
      int v16 = (void *)v15;
      if (id)v15 == v7 || v7 && v15 && ([v7 isEqualToString:v15])
      {
        uint64_t v17 = v13;

        goto LABEL_18;
      }
    }
LABEL_17:

    uint64_t v17 = -[WRSignpostTracker initWithSignpost:individuationIdentifier:]((id *)[WRSignpostTracker alloc], v5, v7);
    objc_msgSend(objc_getProperty(a1, v18, 104, 1), "addObject:", v17);
  }
  else
  {
    uint64_t v17 = 0;
  }
LABEL_18:

  return v17;
}

- (uint64_t)haveAnyEndSignpostsWithIndividuationFieldName:(void *)a1
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v4 = [a1 workflow];
    id v5 = [v4 endSignpostGroups];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v22;
            while (2)
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v22 != v14) {
                  objc_enumerationMutation(v11);
                }
                int v16 = [*(id *)(*((void *)&v21 + 1) + 8 * j) individuationFieldName];
                int v17 = [v16 isEqualToString:v3];

                if (v17)
                {

                  uint64_t v18 = 1;
                  goto LABEL_20;
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }

          uint64_t v8 = v20;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
        uint64_t v18 = 0;
      }
      while (v7);
    }
    else
    {
      uint64_t v18 = 0;
    }
LABEL_20:
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (void)sawIndividuationFieldName:(void *)a3 withIndividuationIdentifier:
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v59 = a3;
  if (a1)
  {
    uint64_t v6 = [a1 workflow];
    uint64_t v7 = [v6 endSignpostGroups];

    if (![v7 count]) {
      goto LABEL_44;
    }
    unint64_t v8 = 0;
    long long v50 = v7;
    while (1)
    {
      uint64_t v9 = [v7 objectAtIndexedSubscript:v8];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id obj = v9;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v62 objects:v78 count:16];
      if (!v10) {
        goto LABEL_43;
      }
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v63;
      unint64_t v60 = v8;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v63 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v62 + 1) + 8 * v13);
          uint64_t v15 = [v14 individuationFieldName];
          int v16 = [v15 isEqualToString:v5];

          if (v16)
          {
            uint64_t v18 = objc_msgSend(objc_getProperty(a1, v17, 152, 1), "objectAtIndexedSubscript:", v8);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              goto LABEL_37;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v19 = v18;
              goto LABEL_20;
            }
            uint64_t v20 = [MEMORY[0x263EFF9D0] null];

            if (v18 != v20)
            {
              long long v21 = [a1 workflow];
              [v21 name];

              [a1 eventIdentifier];
              long long v22 = [a1 eventIdentifier];

              int v23 = *__error();
              long long v24 = _wrlog();
              BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);
              if (v22)
              {
                if (v25)
                {
                  os_log_t loga = [a1 workflow];
                  __int16 v56 = [loga name];
                  long long v26 = [a1 eventIdentifier];
                  ClassName = object_getClassName(v18);
                  *(_DWORD *)buf = 138543874;
                  os_log_t v67 = v56;
                  __int16 v68 = 2114;
                  v69 = v26;
                  __int16 v70 = 2080;
                  v71 = (__CFString *)ClassName;
                  _os_log_fault_impl(&dword_261964000, v24, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: candidateEndSignpostTracker is bad class %s", buf, 0x20u);

                  os_log_t v28 = loga;
                  goto LABEL_41;
                }
              }
              else if (v25)
              {
                __int16 v58 = [a1 workflow];
                long long v47 = [v58 name];
                long long v48 = object_getClassName(v18);
                *(_DWORD *)buf = 138543618;
                os_log_t v67 = v47;
                __int16 v68 = 2080;
                v69 = (__CFString *)v48;
                _os_log_fault_impl(&dword_261964000, v24, OS_LOG_TYPE_FAULT, "%{public}@: candidateEndSignpostTracker is bad class %s", buf, 0x16u);

                os_log_t v28 = v58;
LABEL_41:
              }
              *__error() = v23;
            }
            id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            objc_msgSend(objc_getProperty(a1, v29, 152, 1), "setObject:atIndexedSubscript:", v19, v60);
LABEL_20:
            BOOL v30 = [v19 objectForKeyedSubscript:v59];

            if (v30) {
              goto LABEL_36;
            }
            uint64_t v31 = [a1 workflow];
            [v31 name];

            [a1 eventIdentifier];
            v32 = [a1 eventIdentifier];

            int v57 = *__error();
            char v33 = _wrlog();
            BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);
            if (v5)
            {
              if (v32)
              {
                if (v34)
                {
                  long long v51 = [a1 workflow];
                  BOOL v35 = [v51 name];
                  [a1 eventIdentifier];
                  logb = v33;
                  uint64_t v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  v37 = [v14 name];
                  *(_DWORD *)buf = 138544642;
                  os_log_t v67 = v35;
                  __int16 v68 = 2114;
                  v69 = v36;
                  __int16 v70 = 2114;
                  v71 = @"<signpost>";
                  __int16 v72 = 2114;
                  v73 = v5;
                  __int16 v74 = 2112;
                  v75 = v59;
                  __int16 v76 = 2112;
                  v77 = v37;
                  _os_log_impl(&dword_261964000, logb, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: Saw new individuation identifier needed for end signpost %@", buf, 0x3Eu);

                  char v33 = logb;
                  goto LABEL_28;
                }
LABEL_35:

                *__error() = v57;
                long long v46 = [MEMORY[0x263EFF9D0] null];
                [v19 setObject:v46 forKeyedSubscript:v59];

LABEL_36:
                unint64_t v8 = v60;
LABEL_37:

                goto LABEL_38;
              }
              if (!v34) {
                goto LABEL_35;
              }
              os_log_t log = [a1 workflow];
              v41 = [log name];
              v42 = [v14 name];
              *(_DWORD *)buf = 138544386;
              os_log_t v67 = v41;
              __int16 v68 = 2114;
              v69 = @"<signpost>";
              __int16 v70 = 2114;
              v71 = v5;
              __int16 v72 = 2112;
              v73 = v59;
              __int16 v74 = 2112;
              v75 = v42;
              v43 = v33;
              long long v44 = "%{public}@: %{public}@: %{public}@->%@: Saw new individuation identifier needed for end signpost %@";
              uint32_t v45 = 52;
LABEL_33:
              _os_log_impl(&dword_261964000, v43, OS_LOG_TYPE_INFO, v44, buf, v45);

              os_log_t v40 = log;
            }
            else
            {
              if (!v32)
              {
                if (!v34) {
                  goto LABEL_35;
                }
                os_log_t log = [a1 workflow];
                v41 = [log name];
                v42 = [v14 name];
                *(_DWORD *)buf = 138543874;
                os_log_t v67 = v41;
                __int16 v68 = 2114;
                v69 = @"<signpost>";
                __int16 v70 = 2112;
                v71 = v42;
                v43 = v33;
                long long v44 = "%{public}@: %{public}@: Saw new individuation identifier needed for end signpost %@";
                uint32_t v45 = 32;
                goto LABEL_33;
              }
              if (!v34) {
                goto LABEL_35;
              }
              long long v51 = [a1 workflow];
              os_log_t logc = [v51 name];
              double v38 = [a1 eventIdentifier];
              v39 = [v14 name];
              *(_DWORD *)buf = 138544130;
              os_log_t v67 = logc;
              __int16 v68 = 2114;
              v69 = v38;
              __int16 v70 = 2114;
              v71 = @"<signpost>";
              __int16 v72 = 2112;
              v73 = v39;
              _os_log_impl(&dword_261964000, v33, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: Saw new individuation identifier needed for end signpost %@", buf, 0x2Au);

LABEL_28:
              os_log_t v40 = v51;
            }

            goto LABEL_35;
          }
LABEL_38:
          ++v13;
        }
        while (v11 != v13);
        uint64_t v49 = [obj countByEnumeratingWithState:&v62 objects:v78 count:16];
        uint64_t v11 = v49;
      }
      while (v49);
LABEL_43:

      ++v8;
      uint64_t v7 = v50;
      if (v8 >= [v50 count])
      {
LABEL_44:

        break;
      }
    }
  }
}

- (void)applySignpost:(void *)a3 toSignpostTracker:
{
  uint64_t v146 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    uint64_t v132 = MEMORY[0x263EF8330];
    uint64_t v133 = 3221225472;
    v134 = __58__WRWorkflowEventTracker_applySignpost_toSignpostTracker___block_invoke;
    v135 = &unk_265589398;
    id v8 = v6;
    id v136 = v8;
    v137 = a1;
    uint64_t v9 = (void (**)(void, void))MEMORY[0x263E46C40](&v132);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v5;
      if ([v10 isSyntheticIntervalEvent])
      {
        uint64_t v11 = [v8 signpost];
        uint64_t v12 = [v11 individuationFieldName];

        if (!v12)
        {
          [v10 name];

          uint64_t v52 = [a1 workflow];
          [v52 name];

          [a1 eventIdentifier];
          v53 = [a1 eventIdentifier];

          int v54 = *__error();
          v55 = _wrlog();
          BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_FAULT);
          if (v53)
          {
            if (v56) {
              -[WRWorkflowEventTracker applySignpost:toSignpostTracker:]((uint64_t)a1, (uint64_t)v10, (uint64_t)v55, v57, v58, v59, v60, v61, v106, v110, (uint64_t)log, v116, v118, v120, v122, v126, v129, v132, v133,
            }
                (uint64_t)v134,
                (uint64_t)v135);
          }
          else if (v56)
          {
            -[WRWorkflowEventTracker applySignpost:toSignpostTracker:]();
          }

          *__error() = v54;
          goto LABEL_66;
        }
        uint64_t v13 = [v8 signpost];
        [v13 individuationFieldName];

        [v8 individuationIdentifier];
        [v10 name];

        uint64_t v14 = [a1 workflow];
        [v14 name];

        [a1 eventIdentifier];
        uint64_t v15 = [a1 eventIdentifier];

        int v16 = *__error();
        int v17 = _wrlog();
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_FAULT);
        if (v15)
        {
          if (v18)
          {
            v130 = [a1 workflow];
            id v19 = [v130 name];
            uint64_t v20 = [a1 eventIdentifier];
            [v10 name];
            long long v21 = v123 = v7;
            v127 = [v8 signpost];
            long long v22 = [v127 individuationFieldName];
            int v23 = [v8 individuationIdentifier];
            *(_DWORD *)buf = 138544386;
            v139 = v19;
            __int16 v140 = 2114;
            v141 = v20;
            __int16 v142 = 2114;
            *(void *)v143 = v21;
            *(_WORD *)&v143[8] = 2114;
            *(void *)&v143[10] = v22;
            *(_WORD *)&v143[18] = 2112;
            *(void *)&v143[20] = v23;
            _os_log_fault_impl(&dword_261964000, v17, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: Handling synthetic event as SignpostEvent, not SignpostInterval", buf, 0x34u);

            uint64_t v7 = v123;
LABEL_85:
          }
        }
        else if (v18)
        {
          v130 = [a1 workflow];
          v101 = [v130 name];
          v102 = [v10 name];
          v103 = [v8 signpost];
          [v103 individuationFieldName];
          v104 = v125 = v7;
          v105 = [v8 individuationIdentifier];
          *(_DWORD *)buf = 138544130;
          v139 = v101;
          __int16 v140 = 2114;
          v141 = v102;
          __int16 v142 = 2114;
          *(void *)v143 = v104;
          *(_WORD *)&v143[8] = 2112;
          *(void *)&v143[10] = v105;
          _os_log_fault_impl(&dword_261964000, v17, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: %{public}@->%@: Handling synthetic event as SignpostEvent, not SignpostInterval", buf, 0x2Au);

          uint64_t v7 = v125;
          goto LABEL_85;
        }

        *__error() = v16;
        goto LABEL_66;
      }
      ((void (**)(void, id))v9)[2](v9, v10);
      BOOL v35 = [WRTimestampAndThread alloc];
      int v36 = [v10 processID];
      v37 = (void *)[v10 threadID];
      double v38 = (void *)[v10 endNanoseconds];
      v39 = [v10 endDate];
      os_log_t v40 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)&v35->super.isa, v36, v37, v38, v39);

      if ([v10 eventType])
      {
        if (v8)
        {
          id v42 = objc_getProperty(v8, v41, 48, 1);
          if (v42) {
            goto LABEL_36;
          }
        }
        id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
        if (!v8) {
          goto LABEL_36;
        }
        long long v44 = v8;
        uint32_t v45 = v42;
        ptrdiff_t v46 = 48;
      }
      else
      {
        if (v8)
        {
          id v42 = objc_getProperty(v8, v41, 48, 1);
          if (v42) {
            goto LABEL_36;
          }
        }
        id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
        if (!v8) {
          goto LABEL_36;
        }
        long long v44 = v8;
        uint32_t v45 = v42;
        ptrdiff_t v46 = 56;
      }
      objc_setProperty_atomic(v44, v43, v45, v46);
LABEL_36:
      -[WRTimestampAndThread insertIntoSortedArray:]((uint64_t)v40, v42);

LABEL_66:
LABEL_80:

      goto LABEL_81;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v47 = [a1 workflow];
      [v47 name];

      [a1 eventIdentifier];
      long long v48 = [a1 eventIdentifier];

      int v49 = *__error();
      long long v50 = _wrlog();
      BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_FAULT);
      if (v48)
      {
        if (v51) {
          -[WRWorkflowEventTracker valueForFieldName:inSignpostObject:](a1, v5, v50);
        }
      }
      else if (v51)
      {
        -[WRWorkflowEventTracker valueForFieldName:inSignpostObject:]();
      }

      *__error() = v49;
      goto LABEL_80;
    }
    long long v24 = [v5 beginEvent];
    long long v26 = [v5 endEvent];
    unint64_t v27 = 0;
    if (!v8) {
      goto LABEL_17;
    }
LABEL_10:
    for (id i = objc_getProperty(v8, v25, 56, 1); ; id i = 0)
    {
      if (v27 >= [i count])
      {
        uint64_t v31 = 0;
        goto LABEL_43;
      }
      id v30 = v8 ? objc_getProperty(v8, v29, 56, 1) : 0;
      uint64_t v31 = [v30 objectAtIndexedSubscript:v27];
      uint64_t v32 = [v31 machContTimeNs];
      if (v32 == [v24 startNanoseconds])
      {
        uint64_t v33 = [v31 threadID];
        if (v33 == [v24 threadID]) {
          break;
        }
      }

      ++v27;
      if (v8) {
        goto LABEL_10;
      }
LABEL_17:
      ;
    }
    if (v8) {
      id Property = objc_getProperty(v8, v34, 56, 1);
    }
    else {
      id Property = 0;
    }
    [Property removeObjectAtIndex:v27];
LABEL_43:
    if (([v24 isSyntheticIntervalEvent] & 1) == 0 && !v31) {
      ((void (**)(void, void *))v9)[2](v9, v24);
    }
    ((void (**)(void, void *))v9)[2](v9, v26);
    int v121 = [v24 processID];
    v119 = (void *)[v24 threadID];
    int v131 = [v26 processID];
    v128 = (void *)[v26 threadID];
    v124 = v7;
    if (([v24 overridesBeginTime] & 1) == 0 && !objc_msgSend(v26, "overridesBeginTime"))
    {
      if (([v24 overridesEndTime] & 1) != 0 || objc_msgSend(v26, "overridesEndTime"))
      {
        v128 = 0;
        int v131 = -1;
      }
      goto LABEL_72;
    }
    if (([v24 overridesEndTime] & 1) == 0 && !objc_msgSend(v26, "overridesEndTime"))
    {
      v119 = 0;
      int v121 = -1;
LABEL_72:
      if (v31)
      {
        v86 = v31;
      }
      else
      {
        v87 = [WRTimestampAndThread alloc];
        v88 = (void *)[v24 startNanoseconds];
        v89 = [v24 beginDate];
        v86 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)&v87->super.isa, v121, v119, v88, v89);
      }
      v90 = [WRTimestampAndThread alloc];
      v91 = (void *)[v5 endNanoseconds];
      v92 = [v5 endDate];
      v93 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)&v90->super.isa, v131, v128, v91, v92);

      v95 = -[WRIntervalAndThreads initWithStart:end:]((id *)[WRIntervalAndThreads alloc], v86, v93);
      if (!v8 || (id v96 = objc_getProperty(v8, v94, 40, 1)) == 0)
      {
        id v96 = objc_alloc_init(MEMORY[0x263EFF980]);
        if (v8) {
          objc_setProperty_atomic(v8, v97, v96, 40);
        }
      }
      -[WRIntervalAndThreads insertIntoSortedArray:]((uint64_t)v95, v96);

      uint64_t v7 = v124;
      goto LABEL_80;
    }
    long long v63 = [v8 signpost];
    long long v64 = [v63 individuationFieldName];

    if (v64)
    {
      long long v65 = [v8 signpost];
      [v65 individuationFieldName];

      [v8 individuationIdentifier];
      [v26 name];

      v66 = [a1 workflow];
      [v66 name];

      [a1 eventIdentifier];
      os_log_t v67 = [a1 eventIdentifier];

      int v117 = *__error();
      __int16 v68 = _wrlog();
      BOOL v69 = os_log_type_enabled(v68, OS_LOG_TYPE_INFO);
      if (v67)
      {
        if (v69)
        {
          v111 = [a1 workflow];
          v107 = [v111 name];
          __int16 v70 = [a1 eventIdentifier];
          v71 = [v26 name];
          v108 = [v8 signpost];
          [v108 individuationFieldName];
          __int16 v72 = logb = v68;
          uint64_t v73 = [v8 individuationIdentifier];
          *(_DWORD *)buf = 138545410;
          v139 = v107;
          __int16 v140 = 2114;
          v141 = v70;
          __int16 v142 = 2114;
          *(void *)v143 = v71;
          *(_WORD *)&v143[8] = 2114;
          *(void *)&v143[10] = v72;
          *(_WORD *)&v143[18] = 2112;
          *(void *)&v143[20] = v73;
          __int16 v74 = (void *)v73;
          *(_WORD *)&v143[28] = 1024;
          *(_DWORD *)&v143[30] = v121;
          *(_WORD *)&v143[34] = 2048;
          *(void *)&v143[36] = v119;
          *(_WORD *)&v143[44] = 1024;
          *(_DWORD *)&v143[46] = v131;
          __int16 v144 = 2048;
          v145 = v128;
          _os_log_impl(&dword_261964000, logb, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: Both begin and end times are overridden - assuming they occurred on [%d] thread 0x%#llx and [%d] thread 0x%#llx", buf, 0x54u);

          __int16 v68 = logb;
          os_log_t v75 = v111;
LABEL_70:
        }
LABEL_71:

        *__error() = v117;
        goto LABEL_72;
      }
      if (!v69) {
        goto LABEL_71;
      }
      os_log_t loga = [a1 workflow];
      v109 = [loga name];
      v82 = [v26 name];
      v112 = [v8 signpost];
      v83 = [v112 individuationFieldName];
      uint64_t v84 = [v8 individuationIdentifier];
      *(_DWORD *)buf = 138545154;
      v139 = v109;
      __int16 v140 = 2114;
      v141 = v82;
      __int16 v142 = 2114;
      *(void *)v143 = v83;
      *(_WORD *)&v143[8] = 2112;
      *(void *)&v143[10] = v84;
      v85 = (void *)v84;
      *(_WORD *)&v143[18] = 1024;
      *(_DWORD *)&v143[20] = v121;
      *(_WORD *)&v143[24] = 2048;
      *(void *)&v143[26] = v119;
      *(_WORD *)&v143[34] = 1024;
      *(_DWORD *)&v143[36] = v131;
      *(_WORD *)&v143[40] = 2048;
      *(void *)&v143[42] = v128;
      _os_log_impl(&dword_261964000, v68, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: %{public}@->%@: Both begin and end times are overridden - assuming they occurred on [%d] thread 0x%#llx and [%d] thread 0x%#llx", buf, 0x4Au);
    }
    else
    {
      [v26 name];

      __int16 v76 = [a1 workflow];
      [v76 name];

      [a1 eventIdentifier];
      v77 = [a1 eventIdentifier];

      int v117 = *__error();
      __int16 v68 = _wrlog();
      BOOL v78 = os_log_type_enabled(v68, OS_LOG_TYPE_INFO);
      if (!v77)
      {
        if (v78)
        {
          v98 = [a1 workflow];
          v99 = [v98 name];
          v100 = [v26 name];
          *(_DWORD *)buf = 138544642;
          v139 = v99;
          __int16 v140 = 2114;
          v141 = v100;
          __int16 v142 = 1024;
          *(_DWORD *)v143 = v121;
          *(_WORD *)&v143[4] = 2048;
          *(void *)&v143[6] = v119;
          *(_WORD *)&v143[14] = 1024;
          *(_DWORD *)&v143[16] = v131;
          *(_WORD *)&v143[20] = 2048;
          *(void *)&v143[22] = v128;
          _os_log_impl(&dword_261964000, v68, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: Both begin and end times are overridden - assuming they occurred on [%d] thread 0x%#llx and [%d] thread 0x%#llx", buf, 0x36u);
        }
        goto LABEL_71;
      }
      if (!v78) {
        goto LABEL_71;
      }
      os_log_t loga = [a1 workflow];
      uint64_t v79 = [loga name];
      v80 = [a1 eventIdentifier];
      v81 = [v26 name];
      *(_DWORD *)buf = 138544898;
      v139 = v79;
      __int16 v140 = 2114;
      v141 = v80;
      __int16 v142 = 2114;
      *(void *)v143 = v81;
      *(_WORD *)&v143[8] = 1024;
      *(_DWORD *)&v143[10] = v121;
      *(_WORD *)&v143[14] = 2048;
      *(void *)&v143[16] = v119;
      *(_WORD *)&v143[24] = 1024;
      *(_DWORD *)&v143[26] = v131;
      *(_WORD *)&v143[30] = 2048;
      *(void *)&v143[32] = v128;
      _os_log_impl(&dword_261964000, v68, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: Both begin and end times are overridden - assuming they occurred on [%d] thread 0x%#llx and [%d] thread 0x%#llx", buf, 0x40u);
    }
    os_log_t v75 = loga;
    goto LABEL_70;
  }
LABEL_81:
}

void __58__WRWorkflowEventTracker_applySignpost_toSignpostTracker___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v164 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) signpost];
  id v5 = [v4 environmentFieldNames];

  if (v5)
  {
    uint64_t v132 = v5;
    uint64_t v129 = v3;
    uint64_t v130 = a1;
    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    id obj = [v3 metadataSegments];
    uint64_t v134 = [obj countByEnumeratingWithState:&v143 objects:v163 count:16];
    if (!v134) {
      goto LABEL_112;
    }
    uint64_t v133 = *(void *)v144;
    *(void *)&long long v6 = 138543874;
    long long v112 = v6;
    while (1)
    {
      for (uint64_t i = 0; i != v134; ++i)
      {
        if (*(void *)v144 != v133) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v143 + 1) + 8 * i);
        long long v139 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        long long v142 = 0u;
        uint64_t v9 = objc_msgSend(v8, "placeholderTokens", v112);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v139 objects:v162 count:16];
        if (!v10) {
          goto LABEL_25;
        }
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v140;
LABEL_9:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v140 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v139 + 1) + 8 * v13);
          if ([v14 hasPrefix:@"name="]) {
            break;
          }
          if (v11 == ++v13)
          {
            uint64_t v11 = [v9 countByEnumeratingWithState:&v139 objects:v162 count:16];
            if (!v11)
            {
LABEL_25:

              goto LABEL_26;
            }
            goto LABEL_9;
          }
        }
        long long v137 = 0u;
        long long v138 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        id v15 = v132;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v135 objects:v161 count:16];
        if (!v16) {
          goto LABEL_24;
        }
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v136;
LABEL_18:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v136 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v135 + 1) + 8 * v19);
          if (PlaceholderNameMatches(v14, v20)) {
            break;
          }
          if (v17 == ++v19)
          {
            uint64_t v17 = [v15 countByEnumeratingWithState:&v135 objects:v161 count:16];
            if (!v17)
            {
LABEL_24:

              goto LABEL_25;
            }
            goto LABEL_18;
          }
        }
        id v30 = v20;

        if (v30) {
          goto LABEL_38;
        }
LABEL_26:
        long long v21 = [v8 stringPrefix];
        if (!v21) {
          continue;
        }
        id v22 = v21;
        uint64_t v23 = [v22 length];
        id v24 = v22;
        uint64_t v25 = [v24 UTF8String];
        if (!v25) {
          goto LABEL_77;
        }
        long long v26 = (char *)v25;
        unint64_t v27 = (char *)(v25 + v23 - 1);
        if (*v27 != 61) {
          goto LABEL_77;
        }
        if (v23 == 1)
        {
          unsigned int v73 = 61;
          long long v26 = v27;
          uint64_t v29 = MEMORY[0x263EF8318];
          goto LABEL_63;
        }
        char v28 = 61;
        uint64_t v29 = MEMORY[0x263EF8318];
        while (2)
        {
          if ((v28 & 0x80) == 0)
          {
            if ((*(_DWORD *)(v29 + 4 * v28 + 60) & 0x4000) != 0) {
              break;
            }
            goto LABEL_35;
          }
          if (!__maskrune(v28, 0x4000uLL))
          {
LABEL_35:
            if (v23 == 2) {
              goto LABEL_62;
            }
            char v28 = v26[v23-- - 2];
            continue;
          }
          break;
        }
        long long v26 = &v26[v23 - 1];
LABEL_62:
        unsigned int v73 = *v26;
        if ((v73 & 0x80000000) != 0) {
          int v74 = __maskrune(v73, 0x4000uLL);
        }
        else {
LABEL_63:
        }
          int v74 = *(_DWORD *)(v29 + 4 * v73 + 60) & 0x4000;
        if (v74) {
          v82 = v26 + 1;
        }
        else {
          v82 = v26;
        }
        BOOL v83 = v27 > v82;
        uint64_t v84 = (unsigned char *)(v27 - v82);
        if (!v83)
        {
LABEL_77:
          uint64_t v31 = 0;
          id v30 = v24;
          goto LABEL_108;
        }
        uint64_t v31 = (void *)[[NSString alloc] initWithBytes:v82 length:v84 encoding:4];

        if (!v31) {
          goto LABEL_109;
        }
        uint64_t v85 = [v132 indexOfObject:v31];
        if (v85 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_109;
        }
        id v30 = [v132 objectAtIndexedSubscript:v85];

        if (v30)
        {
LABEL_38:
          uint64_t v31 = [v8 argument];
          -[WRWorkflowEventTracker checkForNonPublicField:fieldName:messageArgument:](*(void *)(v130 + 40), v129, v30, v31);
          id Property = *(id *)(v130 + 32);
          if (Property) {
            id Property = objc_getProperty(Property, v32, 32, 1);
          }
          if (!Property)
          {
            id v35 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            int v36 = *(void **)(v130 + 32);
            if (v36) {
              objc_setProperty_atomic(v36, v34, v35, 32);
            }
          }
          int v37 = [v31 type];
          if (v37 != 3)
          {
            if (v37 == 2)
            {
              int v54 = [*(id *)(v130 + 32) signpost];
              v55 = [v54 individuationFieldName];

              if (v55)
              {
                BOOL v56 = [*(id *)(v130 + 32) signpost];
                [v56 individuationFieldName];

                [*(id *)(v130 + 32) individuationIdentifier];
                [v129 name];

                uint64_t v57 = [*(id *)(v130 + 40) workflow];
                [v57 name];

                [*(id *)(v130 + 40) eventIdentifier];
                uint64_t v58 = [*(id *)(v130 + 40) eventIdentifier];

                int v59 = *__error();
                uint64_t v60 = _wrlog();
                BOOL v61 = os_log_type_enabled(v60, OS_LOG_TYPE_FAULT);
                if (v58)
                {
                  if (v61)
                  {
                    os_log_t log = [*(id *)(v130 + 40) workflow];
                    v124 = [log name];
                    long long v62 = [*(id *)(v130 + 40) eventIdentifier];
                    long long v63 = [v129 name];
                    uint64_t v116 = [*(id *)(v130 + 32) signpost];
                    long long v64 = [v116 individuationFieldName];
                    long long v65 = [*(id *)(v130 + 32) individuationIdentifier];
                    *(_DWORD *)buf = 138544642;
                    os_log_t v148 = v124;
                    __int16 v149 = 2114;
                    v150 = v62;
                    __int16 v151 = 2114;
                    id v152 = v63;
                    __int16 v153 = 2114;
                    id v154 = v64;
                    __int16 v155 = 2112;
                    id v156 = v65;
                    __int16 v157 = 2114;
                    id v158 = v30;
                    _os_log_fault_impl(&dword_261964000, v60, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: contained environment %{public}@ not a number/string", buf, 0x3Eu);
                    goto LABEL_59;
                  }
                  goto LABEL_105;
                }
                if (!v61) {
                  goto LABEL_105;
                }
                v128 = [*(id *)(v130 + 40) workflow];
                long long v106 = [v128 name];
                v107 = [v129 name];
                os_log_t loga = [*(id *)(v130 + 32) signpost];
                v108 = [loga individuationFieldName];
                v109 = [*(id *)(v130 + 32) individuationIdentifier];
                *(_DWORD *)buf = 138544386;
                os_log_t v148 = v106;
                __int16 v149 = 2114;
                v150 = v107;
                __int16 v151 = 2114;
                id v152 = v108;
                __int16 v153 = 2112;
                id v154 = v109;
                __int16 v155 = 2114;
                id v156 = v30;
                _os_log_fault_impl(&dword_261964000, v60, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: %{public}@->%@: contained environment %{public}@ not a number/string", buf, 0x34u);
                goto LABEL_97;
              }
              [v129 name];

              v90 = [*(id *)(v130 + 40) workflow];
              [v90 name];

              [*(id *)(v130 + 40) eventIdentifier];
              v91 = [*(id *)(v130 + 40) eventIdentifier];

              int v59 = *__error();
              uint64_t v60 = _wrlog();
              BOOL v92 = os_log_type_enabled(v60, OS_LOG_TYPE_FAULT);
              if (v91)
              {
                if (!v92) {
                  goto LABEL_105;
                }
                v93 = [*(id *)(v130 + 40) workflow];
                v94 = [v93 name];
                v95 = [*(id *)(v130 + 40) eventIdentifier];
                id v96 = [v129 name];
                *(_DWORD *)buf = 138544130;
                os_log_t v148 = v94;
                __int16 v149 = 2114;
                v150 = v95;
                __int16 v151 = 2114;
                id v152 = v96;
                __int16 v153 = 2114;
                id v154 = v30;
                _os_log_fault_impl(&dword_261964000, v60, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: contained environment %{public}@ not a number/string", buf, 0x2Au);
                goto LABEL_87;
              }
              if (!v92) {
                goto LABEL_105;
              }
              v93 = [*(id *)(v130 + 40) workflow];
              uint64_t v110 = [v93 name];
              v111 = [v129 name];
              *(_DWORD *)buf = v112;
              os_log_t v148 = v110;
              __int16 v149 = 2114;
              v150 = v111;
              __int16 v151 = 2114;
              id v152 = v30;
              _os_log_fault_impl(&dword_261964000, v60, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: contained environment %{public}@ not a number/string", buf, 0x20u);
            }
            else
            {
              if (v37 == 1) {
                goto LABEL_47;
              }
              v66 = [*(id *)(v130 + 32) signpost];
              os_log_t v67 = [v66 individuationFieldName];

              if (v67)
              {
                __int16 v68 = [*(id *)(v130 + 32) signpost];
                [v68 individuationFieldName];

                [*(id *)(v130 + 32) individuationIdentifier];
                [v129 name];

                BOOL v69 = [*(id *)(v130 + 40) workflow];
                [v69 name];

                [*(id *)(v130 + 40) eventIdentifier];
                __int16 v70 = [*(id *)(v130 + 40) eventIdentifier];

                int v59 = *__error();
                uint64_t v60 = _wrlog();
                BOOL v71 = os_log_type_enabled(v60, OS_LOG_TYPE_ERROR);
                if (v70)
                {
                  if (v71)
                  {
                    os_log_t log = [*(id *)(v130 + 40) workflow];
                    v124 = [log name];
                    long long v62 = [*(id *)(v130 + 40) eventIdentifier];
                    long long v63 = [v129 name];
                    uint64_t v116 = [*(id *)(v130 + 32) signpost];
                    long long v64 = [v116 individuationFieldName];
                    long long v65 = [*(id *)(v130 + 32) individuationIdentifier];
                    *(_DWORD *)buf = 138544642;
                    os_log_t v148 = v124;
                    __int16 v149 = 2114;
                    v150 = v62;
                    __int16 v151 = 2114;
                    id v152 = v63;
                    __int16 v153 = 2114;
                    id v154 = v64;
                    __int16 v155 = 2112;
                    id v156 = v65;
                    __int16 v157 = 2114;
                    id v158 = v30;
                    _os_log_error_impl(&dword_261964000, v60, OS_LOG_TYPE_ERROR, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: missing environment %{public}@", buf, 0x3Eu);
LABEL_59:

                    os_log_t v72 = log;
LABEL_98:
                  }
LABEL_105:

                  *__error() = v59;
                  id v24 = [MEMORY[0x263EFF9D0] null];
                  id v105 = *(id *)(v130 + 32);
                  if (v105) {
LABEL_106:
                  }
                    id v105 = objc_getProperty(v105, v104, 32, 1);
LABEL_107:
                  [v105 setObject:v24 forKeyedSubscript:v30];
LABEL_108:

                  id v24 = v30;
LABEL_109:

                  continue;
                }
                if (!v71) {
                  goto LABEL_105;
                }
                v128 = [*(id *)(v130 + 40) workflow];
                long long v106 = [v128 name];
                v107 = [v129 name];
                os_log_t loga = [*(id *)(v130 + 32) signpost];
                v108 = [loga individuationFieldName];
                v109 = [*(id *)(v130 + 32) individuationIdentifier];
                *(_DWORD *)buf = 138544386;
                os_log_t v148 = v106;
                __int16 v149 = 2114;
                v150 = v107;
                __int16 v151 = 2114;
                id v152 = v108;
                __int16 v153 = 2112;
                id v154 = v109;
                __int16 v155 = 2114;
                id v156 = v30;
                _os_log_error_impl(&dword_261964000, v60, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: %{public}@->%@: missing environment %{public}@", buf, 0x34u);
LABEL_97:

                os_log_t v72 = v128;
                goto LABEL_98;
              }
              [v129 name];

              v97 = [*(id *)(v130 + 40) workflow];
              [v97 name];

              [*(id *)(v130 + 40) eventIdentifier];
              v98 = [*(id *)(v130 + 40) eventIdentifier];

              int v59 = *__error();
              uint64_t v60 = _wrlog();
              BOOL v99 = os_log_type_enabled(v60, OS_LOG_TYPE_ERROR);
              if (v98)
              {
                if (!v99) {
                  goto LABEL_105;
                }
                v93 = [*(id *)(v130 + 40) workflow];
                v94 = [v93 name];
                v95 = [*(id *)(v130 + 40) eventIdentifier];
                id v96 = [v129 name];
                *(_DWORD *)buf = 138544130;
                os_log_t v148 = v94;
                __int16 v149 = 2114;
                v150 = v95;
                __int16 v151 = 2114;
                id v152 = v96;
                __int16 v153 = 2114;
                id v154 = v30;
                _os_log_error_impl(&dword_261964000, v60, OS_LOG_TYPE_ERROR, "%{public}@<%{public}@>: %{public}@: missing environment %{public}@", buf, 0x2Au);
LABEL_87:

LABEL_104:
                goto LABEL_105;
              }
              if (!v99) {
                goto LABEL_105;
              }
              v93 = [*(id *)(v130 + 40) workflow];
              uint64_t v110 = [v93 name];
              v111 = [v129 name];
              *(_DWORD *)buf = v112;
              os_log_t v148 = v110;
              __int16 v149 = 2114;
              v150 = v111;
              __int16 v151 = 2114;
              id v152 = v30;
              _os_log_error_impl(&dword_261964000, v60, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: missing environment %{public}@", buf, 0x20u);
            }

            goto LABEL_104;
          }
LABEL_47:
          double v38 = [*(id *)(v130 + 32) signpost];
          v39 = [v38 individuationFieldName];

          if (v39)
          {
            os_log_t v40 = [*(id *)(v130 + 32) signpost];
            [v40 individuationFieldName];

            [*(id *)(v130 + 32) individuationIdentifier];
            [v129 name];

            v41 = [*(id *)(v130 + 40) workflow];
            [v41 name];

            [*(id *)(v130 + 40) eventIdentifier];
            id v42 = [*(id *)(v130 + 40) eventIdentifier];

            int v43 = *__error();
            long long v44 = _wrlog();
            BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);
            if (v42)
            {
              if (v45)
              {
                v114 = [*(id *)(v130 + 40) workflow];
                ptrdiff_t v46 = [v114 name];
                long long v47 = [*(id *)(v130 + 40) eventIdentifier];
                [v129 name];
                long long v48 = logb = v44;
                v113 = [*(id *)(v130 + 32) signpost];
                int v49 = [v113 individuationFieldName];
                [*(id *)(v130 + 32) individuationIdentifier];
                long long v50 = v123 = v43;
                BOOL v51 = [v31 argumentObject];
                *(_DWORD *)buf = 138544898;
                os_log_t v148 = v46;
                __int16 v149 = 2114;
                v150 = v47;
                __int16 v151 = 2114;
                id v152 = v48;
                __int16 v153 = 2114;
                id v154 = v49;
                __int16 v155 = 2112;
                id v156 = v50;
                __int16 v157 = 2114;
                id v158 = v30;
                __int16 v159 = 2114;
                v160 = v51;
                _os_log_impl(&dword_261964000, logb, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: contained environment %{public}@->%{public}@", buf, 0x48u);

                int v43 = v123;
                uint64_t v52 = v130;

                long long v44 = logb;
                os_log_t v53 = v114;
                goto LABEL_80;
              }
LABEL_90:
              uint64_t v52 = v130;
              goto LABEL_91;
            }
            if (!v45) {
              goto LABEL_90;
            }
            uint64_t v52 = v130;
            int v117 = [*(id *)(v130 + 40) workflow];
            os_log_t logd = [v117 name];
            v86 = [v129 name];
            v115 = [*(id *)(v130 + 32) signpost];
            v87 = [v115 individuationFieldName];
            [*(id *)(v130 + 32) individuationIdentifier];
            v88 = int v126 = v43;
            v89 = [v31 argumentObject];
            *(_DWORD *)buf = 138544642;
            os_log_t v148 = logd;
            __int16 v149 = 2114;
            v150 = v86;
            __int16 v151 = 2114;
            id v152 = v87;
            __int16 v153 = 2112;
            id v154 = v88;
            __int16 v155 = 2114;
            id v156 = v30;
            __int16 v157 = 2114;
            id v158 = v89;
            _os_log_impl(&dword_261964000, v44, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: %{public}@->%@: contained environment %{public}@->%{public}@", buf, 0x3Eu);

            int v43 = v126;
            os_log_t v53 = v117;
          }
          else
          {
            [v129 name];

            os_log_t v75 = [*(id *)(v130 + 40) workflow];
            [v75 name];

            [*(id *)(v130 + 40) eventIdentifier];
            __int16 v76 = [*(id *)(v130 + 40) eventIdentifier];

            int v43 = *__error();
            long long v44 = _wrlog();
            BOOL v77 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);
            if (!v76)
            {
              if (!v77) {
                goto LABEL_90;
              }
              uint64_t v52 = v130;
              v100 = [*(id *)(v130 + 40) workflow];
              v101 = [v100 name];
              [v129 name];
              v102 = int v127 = v43;
              v103 = [v31 argumentObject];
              *(_DWORD *)buf = 138544130;
              os_log_t v148 = v101;
              __int16 v149 = 2114;
              v150 = v102;
              __int16 v151 = 2114;
              id v152 = v30;
              __int16 v153 = 2114;
              id v154 = v103;
              _os_log_impl(&dword_261964000, v44, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: contained environment %{public}@->%{public}@", buf, 0x2Au);

              int v43 = v127;
LABEL_91:

              *__error() = v43;
              id v24 = [v31 argumentObject];
              id v105 = *(id *)(v52 + 32);
              if (v105) {
                goto LABEL_106;
              }
              goto LABEL_107;
            }
            if (!v77) {
              goto LABEL_90;
            }
            uint64_t v52 = v130;
            os_log_t logc = [*(id *)(v130 + 40) workflow];
            BOOL v78 = [logc name];
            [*(id *)(v130 + 40) eventIdentifier];
            uint64_t v79 = v125 = v43;
            v80 = [v129 name];
            v81 = [v31 argumentObject];
            *(_DWORD *)buf = 138544386;
            os_log_t v148 = v78;
            __int16 v149 = 2114;
            v150 = v79;
            __int16 v151 = 2114;
            id v152 = v80;
            __int16 v153 = 2114;
            id v154 = v30;
            __int16 v155 = 2114;
            id v156 = v81;
            _os_log_impl(&dword_261964000, v44, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: contained environment %{public}@->%{public}@", buf, 0x34u);

            int v43 = v125;
            os_log_t v53 = logc;
          }
LABEL_80:

          goto LABEL_91;
        }
      }
      uint64_t v134 = [obj countByEnumeratingWithState:&v143 objects:v163 count:16];
      if (!v134)
      {
LABEL_112:

        id v3 = v129;
        id v5 = v132;
        break;
      }
    }
  }
}

- (id)eventCompletionCallback
{
  if (result) {
    return objc_getProperty(result, a2, 144, 1);
  }
  return result;
}

- (void)doneHandlingSignpostsWithEndTimeMachContNs:(unint64_t)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (![(WRWorkflowEventTracker *)self inMiddleOfEvent]) {
    return;
  }
  id v5 = [(WRWorkflowEventTracker *)self workflow];
  if (![v5 hasMaximumEventDuration]) {
    goto LABEL_9;
  }
  long long v6 = [(WRWorkflowEventTracker *)self workflow];
  [v6 maximumEventDuration];
  double v8 = v7;
  uint64_t v9 = [(WRWorkflowEventTracker *)self eventStart];
  if (v8 >= ((double)a3 + (double)(unint64_t)[v9 machContTimeNs]) / 1000000000.0)
  {

LABEL_9:
    goto LABEL_10;
  }
  BOOL v10 = [(WRWorkflowEventTracker *)self ignoreEventTimeouts];

  if (!v10)
  {
    uint64_t v17 = WRMakeError(4, @"Workflow event timed out", v11, v12, v13, v14, v15, v16, *(uint64_t *)v30);
    uint64_t v18 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)[WRTimestampAndThread alloc], -1, 0, (void *)a3, 0);
    -[WRWorkflowEventTracker handleError:atEndTime:]((uint64_t)self, v17, v18);

    [(WRWorkflowEventTracker *)self resetWithoutReportingErrors];
    return;
  }
LABEL_10:
  uint64_t v20 = [(WRWorkflowEventTracker *)self workflow];
  [v20 name];

  [(WRWorkflowEventTracker *)self eventIdentifier];
  long long v21 = [(WRWorkflowEventTracker *)self eventIdentifier];

  int v22 = *__error();
  uint64_t v23 = _wrlog();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v24)
    {
      uint64_t v25 = [(WRWorkflowEventTracker *)self workflow];
      long long v26 = [v25 name];
      unint64_t v27 = [(WRWorkflowEventTracker *)self eventIdentifier];
      *(_DWORD *)id v30 = 138543618;
      *(void *)&v30[4] = v26;
      __int16 v31 = 2114;
      uint64_t v32 = v27;
      _os_log_impl(&dword_261964000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@<%{public}@>: Incomplete event when done handling signposts, ignoring", v30, 0x16u);
    }
  }
  else if (v24)
  {
    char v28 = [(WRWorkflowEventTracker *)self workflow];
    uint64_t v29 = [v28 name];
    *(_DWORD *)id v30 = 138543362;
    *(void *)&v30[4] = v29;
    _os_log_impl(&dword_261964000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Incomplete event when done handling signposts, ignoring", v30, 0xCu);
  }
  *__error() = v22;
}

- (id)newConcurrentEventWithIdentifier:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    id Property = objc_getProperty(a1, v3, 120, 1);
    long long v6 = [WRWorkflowEventTracker alloc];
    double v8 = [a1 workflow];
    if (Property)
    {
      id v9 = objc_getProperty(a1, v7, 120, 1);
      id v11 = [(WRWorkflowEventTracker *)v6 initForLiveStreamingWithWorkflow:v8 timeoutQueue:v9 eventCompletionCallback:objc_getProperty(a1, v10, 144, 1)];
    }
    else
    {
      id v11 = [(WRWorkflowEventTracker *)v6 initForReadbackWithWorkflow:v8 eventCompletionCallback:objc_getProperty(a1, v7, 144, 1)];
    }

    if (v11) {
      objc_setProperty_atomic(v11, v12, v4, 24);
    }
    if (objc_getProperty(a1, v12, 112, 1))
    {
      objc_msgSend(objc_getProperty(a1, v13, 112, 1), "addObject:", v11);
    }
    else
    {
      uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v11, 0);
      objc_setProperty_atomic(a1, v15, v14, 112);
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)timeoutQueue
{
  if (result) {
    return objc_getProperty(result, a2, 120, 1);
  }
  return result;
}

- (void)setEventIdentifier:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 24);
  }
}

- (void)setConcurrentEvents:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 112);
  }
}

- (BOOL)handleSignpost:(id)a3
{
  uint64_t v186 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  char v6 = [v5 isSyntheticIntervalEvent];
  double v7 = [(WRWorkflowEventTracker *)self workflow];
  double v8 = -[WRWorkflow wrsignpostForSignpostObject:](v7, v4);

  if (v8)
  {
    id v9 = [(WRWorkflowEventTracker *)self workflow];
    char v10 = [v9 workflowSupportsConcurrentEvents];

    if (v10)
    {
      id v156 = v8;
      char v152 = v6;
      if (v5)
      {
        id v11 = [v8 individuationFieldName];
        if (!v11 || [v5 eventType]) {
          goto LABEL_9;
        }
        uint64_t v79 = [(WRWorkflowEventTracker *)self workflow];
        [v79 startSignposts];
        v81 = v80 = v8;
        if ([v81 indexOfObjectIdenticalTo:v80] != 0x7FFFFFFFFFFFFFFFLL)
        {
          v88 = 0;
          goto LABEL_121;
        }
        v82 = [v80 individuationFieldName];
        int v83 = -[WRWorkflowEventTracker haveAnyEndSignpostsWithIndividuationFieldName:](self, v82);

        if (v83)
        {
          uint64_t v84 = [v80 individuationFieldName];
          id v11 = -[WRWorkflowEventTracker individuationIdentifierForSignpostEvent:individuationFieldName:](self, v5, v84);

          double v8 = v80;
          if (!v11)
          {
LABEL_9:
            uint64_t v12 = 0;
LABEL_10:

            goto LABEL_17;
          }
          selfb = [WROpenIndividuatedSignpostInterval alloc];
          __int16 v155 = [WRTimestampAndThread alloc];
          int v85 = [v5 processID];
          v86 = (void *)[v5 threadID];
          v87 = (void *)[v5 startNanoseconds];
          uint64_t v79 = [v5 beginDate];
          v81 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)&v155->super.isa, v85, v86, v87, v79);
          v88 = -[WROpenIndividuatedSignpostInterval initWithSignpost:individuationIdentifier:timestampAndThread:]((id *)&selfb->super.isa, v80, v11, v81);
LABEL_121:

          double v8 = v156;
          uint64_t v12 = v88;
          goto LABEL_10;
        }
        uint64_t v12 = 0;
        double v8 = v80;
      }
      else
      {
        uint64_t v12 = 0;
      }
LABEL_17:
      uint64_t v14 = [v8 eventIdentifierFieldName];
      __int16 v153 = v12;
      id v154 = v4;
      selfa = self;
      if (v14)
      {

        goto LABEL_20;
      }
      if ([v8 eventIdentifierIsSignpostID])
      {
LABEL_20:
        uint64_t v17 = -[WRWorkflowEventTracker eventIdentifierForSignpostObject:wrSignopst:](self, v4, v8);
        if (v17)
        {
          long long v161 = 0u;
          long long v162 = 0u;
          long long v159 = 0u;
          long long v160 = 0u;
          if (self) {
            id Property = objc_getProperty(self, v16, 112, 1);
          }
          else {
            id Property = 0;
          }
          uint64_t v19 = (__CFString *)[Property copy];
          uint64_t v20 = [(__CFString *)v19 countByEnumeratingWithState:&v159 objects:v171 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v160;
            while (2)
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v160 != v22) {
                  objc_enumerationMutation(v19);
                }
                BOOL v24 = *(void **)(*((void *)&v159 + 1) + 8 * i);
                uint64_t v25 = [v24 eventIdentifier];
                int v26 = [v25 isEqualToString:v17];

                if (v26)
                {
                  id v4 = v154;
                  int v33 = -[WRWorkflowEventTracker handleSignpost:wrsignpost:](v24, v154, v156);
                  if (([v24 inMiddleOfEvent] & 1) == 0)
                  {
                    id v35 = v24 ? objc_getProperty(v24, v34, 136, 1) : 0;
                    if (![v35 count])
                    {
                      int v36 = [(WRWorkflowEventTracker *)selfa workflow];
                      [v36 name];

                      [v24 eventIdentifier];
                      int v37 = [v24 eventIdentifier];

                      int v38 = *__error();
                      v39 = _wrlog();
                      BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG);
                      if (v37)
                      {
                        if (v40) {
                          -[WRWorkflowEventTracker handleSignpost:].cold.5();
                        }
                      }
                      else if (v40)
                      {
                        -[WRWorkflowEventTracker handleSignpost:].cold.4(selfa);
                      }

                      *__error() = v38;
                      if (selfa) {
                        id v129 = objc_getProperty(selfa, v128, 112, 1);
                      }
                      else {
                        id v129 = 0;
                      }
                      [v129 removeObjectIdenticalTo:v24];
                    }
                  }
                  if ((v152 & 1) == 0)
                  {
                    uint64_t v130 = 80;
                    if (v33) {
                      uint64_t v130 = 72;
                    }
                    ++*(Class *)((char *)&selfa->super.isa + v130);
                  }
                  goto LABEL_150;
                }
              }
              uint64_t v21 = [(__CFString *)v19 countByEnumeratingWithState:&v159 objects:v171 count:16];
              if (v21) {
                continue;
              }
              break;
            }
          }

          id v4 = v154;
          [v154 name];

          unint64_t v27 = [(WRWorkflowEventTracker *)selfa workflow];
          [v27 name];

          int v28 = *__error();
          uint64_t v29 = _wrlog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            long long v135 = [(WRWorkflowEventTracker *)selfa workflow];
            long long v136 = [v135 name];
            long long v137 = [v154 name];
            *(_DWORD *)buf = 138543874;
            v174 = v136;
            __int16 v175 = 2114;
            uint64_t v176 = (uint64_t)v17;
            __int16 v177 = 2114;
            v178 = v137;
            _os_log_debug_impl(&dword_261964000, v29, OS_LOG_TYPE_DEBUG, "%{public}@<%{public}@>: %{public}@: No concurrent event with event identifier", buf, 0x20u);

            id v4 = v154;
          }

          *__error() = v28;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v30 = [(WRWorkflowEventTracker *)selfa workflow];
            __int16 v31 = [v30 startSignposts];
            double v8 = v156;
            BOOL v32 = [v31 indexOfObjectIdenticalTo:v156] != 0x7FFFFFFFFFFFFFFFLL;

            id v4 = v154;
          }
          else
          {
            BOOL v32 = 0;
            double v8 = v156;
          }
          if (v32 || v153)
          {
            [v4 name];

            v89 = [(WRWorkflowEventTracker *)selfa workflow];
            [v89 name];

            int v90 = *__error();
            v91 = _wrlog();
            if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
            {
              long long v138 = [(WRWorkflowEventTracker *)selfa workflow];
              long long v139 = [v138 name];
              long long v140 = [v154 name];
              *(_DWORD *)buf = 138543874;
              v174 = v139;
              __int16 v175 = 2114;
              uint64_t v176 = (uint64_t)v17;
              __int16 v177 = 2114;
              v178 = v140;
              _os_log_debug_impl(&dword_261964000, v91, OS_LOG_TYPE_DEBUG, "%{public}@<%{public}@>: %{public}@: Allocating new concurrent event", buf, 0x20u);

              double v8 = v156;
              id v4 = v154;
            }
            *__error() = v90;
            id v92 = -[WRWorkflowEventTracker newConcurrentEventWithIdentifier:](selfa, v17);
            int v93 = -[WRWorkflowEventTracker handleSignpost:wrsignpost:](v92, v4, v8);
            if ((v152 & 1) == 0)
            {
              uint64_t v94 = 80;
              if (v93) {
                uint64_t v94 = 72;
              }
              ++*(Class *)((char *)&selfa->super.isa + v94);
            }
          }
          else if ((v152 & 1) == 0)
          {
            ++selfa->_numOutsideSignposts;
          }
          goto LABEL_151;
        }
        if ([v8 eventIdentifierIsSignpostID])
        {
          uint64_t v19 = @"signpost id";
        }
        else
        {
          uint64_t v19 = [v8 eventIdentifierFieldName];
          if (!v19)
          {
            id v66 = v5;
            [v4 name];

            uint64_t v122 = [(WRWorkflowEventTracker *)selfa workflow];
            [v122 name];

            int v68 = *__error();
            BOOL v69 = _wrlog();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
              -[WRWorkflowEventTracker handleSignpost:]();
            }
            uint64_t v19 = 0;
            char v70 = 1;
LABEL_76:

            *__error() = v68;
            BOOL v71 = [(WRWorkflowEventTracker *)selfa workflow];
            os_log_t v72 = [v71 startSignposts];
            uint64_t v73 = [v72 indexOfObjectIdenticalTo:v156];

            id v4 = v154;
            [v154 name];

            int v74 = [(WRWorkflowEventTracker *)selfa workflow];
            [v74 name];

            int v75 = *__error();
            __int16 v76 = _wrlog();
            BOOL v77 = os_log_type_enabled(v76, OS_LOG_TYPE_ERROR);
            if (v73 == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (v70)
              {
                if (v77) {
                  -[WRWorkflowEventTracker handleSignpost:]();
                }
              }
              else if (v77)
              {
                long long v141 = [(WRWorkflowEventTracker *)selfa workflow];
                long long v142 = [v141 name];
                long long v143 = [v154 name];
                *(_DWORD *)buf = 138544130;
                v174 = v142;
                __int16 v175 = 2114;
                uint64_t v176 = (uint64_t)v143;
                __int16 v177 = 2114;
                v178 = v19;
                __int16 v179 = 2112;
                id v180 = 0;
                _os_log_error_impl(&dword_261964000, v76, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: %{public}@->%@: Unable to get event identifier for start signpost, throwing out all current events in case they were incomplete events", buf, 0x2Au);

                id v4 = v154;
              }

              *__error() = v75;
              long long v163 = 0u;
              long long v164 = 0u;
              long long v165 = 0u;
              long long v166 = 0u;
              id v5 = v66;
              id v96 = selfa;
              if (selfa) {
                id v97 = objc_getProperty(selfa, v95, 112, 1);
              }
              else {
                id v97 = 0;
              }
              id v98 = v97;
              uint64_t v99 = [v98 countByEnumeratingWithState:&v163 objects:v172 count:16];
              if (v99)
              {
                uint64_t v101 = v99;
                uint64_t v102 = *(void *)v164;
                do
                {
                  uint64_t v103 = 0;
                  do
                  {
                    if (*(void *)v164 != v102) {
                      objc_enumerationMutation(v98);
                    }
                    v104 = *(void **)(*((void *)&v163 + 1) + 8 * v103);
                    [(WRWorkflowEventTracker *)v104 resetWithoutReportingErrors];
                    if (selfa) {
                      id v106 = objc_getProperty(selfa, v105, 112, 1);
                    }
                    else {
                      id v106 = 0;
                    }
                    [v106 removeObjectIdenticalTo:v104];
                    ++v103;
                  }
                  while (v101 != v103);
                  uint64_t v107 = [v98 countByEnumeratingWithState:&v163 objects:v172 count:16];
                  uint64_t v101 = v107;
                }
                while (v107);
              }

              if (v152) {
                goto LABEL_150;
              }
            }
            else
            {
              char v78 = v152;
              if (v70)
              {
                if (v77) {
                  -[WRWorkflowEventTracker handleSignpost:]();
                }
              }
              else if (v77)
              {
                long long v144 = [(WRWorkflowEventTracker *)selfa workflow];
                long long v145 = [v144 name];
                long long v146 = [v154 name];
                *(_DWORD *)buf = 138544130;
                v174 = v145;
                __int16 v175 = 2114;
                uint64_t v176 = (uint64_t)v146;
                __int16 v177 = 2114;
                v178 = v19;
                __int16 v179 = 2112;
                id v180 = 0;
                _os_log_error_impl(&dword_261964000, v76, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: %{public}@->%@: Unable to get event identifier, ignoring signpost", buf, 0x2Au);

                char v78 = v152;
                id v4 = v154;
              }
              *__error() = v75;
              id v5 = v66;
              id v96 = selfa;
              if (v78) {
                goto LABEL_150;
              }
            }
            ++v96->_numOutsideSignposts;
LABEL_150:

            double v8 = v156;
LABEL_151:

            long long v65 = v153;
LABEL_152:

            goto LABEL_153;
          }
        }
        id v66 = v5;
        [v4 name];

        os_log_t v67 = [(WRWorkflowEventTracker *)selfa workflow];
        [v67 name];

        int v68 = *__error();
        BOOL v69 = _wrlog();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          uint64_t v132 = [(WRWorkflowEventTracker *)selfa workflow];
          uint64_t v133 = [v132 name];
          uint64_t v134 = [v154 name];
          *(_DWORD *)buf = 138544130;
          v174 = v133;
          __int16 v175 = 2114;
          uint64_t v176 = (uint64_t)v134;
          __int16 v177 = 2114;
          v178 = v19;
          __int16 v179 = 2112;
          id v180 = 0;
          _os_log_error_impl(&dword_261964000, v69, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: %{public}@->%@: Unable to get event identifier, ignoring signpost", buf, 0x2Au);
        }
        char v70 = 0;
        goto LABEL_76;
      }
      long long v169 = 0u;
      long long v170 = 0u;
      long long v167 = 0u;
      long long v168 = 0u;
      if (self) {
        id v41 = objc_getProperty(self, v15, 112, 1);
      }
      else {
        id v41 = 0;
      }
      id v42 = (void *)[v41 copy];
      uint64_t v43 = [v42 countByEnumeratingWithState:&v167 objects:v185 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        char v45 = 0;
        uint64_t v46 = *(void *)v168;
        id v149 = v5;
        do
        {
          uint64_t v47 = 0;
          do
          {
            if (*(void *)v168 != v46) {
              objc_enumerationMutation(v42);
            }
            long long v48 = *(void **)(*((void *)&v167 + 1) + 8 * v47);
            char v49 = -[WRWorkflowEventTracker handleSignpost:wrsignpost:](v48, v4, v8);
            if (([v48 inMiddleOfEvent] & 1) == 0)
            {
              id v51 = v48 ? objc_getProperty(v48, v50, 136, 1) : 0;
              if (![v51 count])
              {
                uint64_t v52 = [(WRWorkflowEventTracker *)self workflow];
                [v52 name];

                [v48 eventIdentifier];
                os_log_t v53 = [v48 eventIdentifier];

                int v54 = *__error();
                v55 = _wrlog();
                BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG);
                if (v53)
                {
                  if (v56)
                  {
                    __int16 v151 = [(WRWorkflowEventTracker *)selfa workflow];
                    v150 = [v151 name];
                    uint64_t v57 = [v48 eventIdentifier];
                    *(_DWORD *)buf = 138543618;
                    v174 = v150;
                    __int16 v175 = 2114;
                    uint64_t v176 = v57;
                    uint64_t v58 = (void *)v57;
                    _os_log_debug_impl(&dword_261964000, v55, OS_LOG_TYPE_DEBUG, "%{public}@<%{public}@>: concurrent workflow done", buf, 0x16u);
                  }
                }
                else if (v56)
                {
                  -[WRWorkflowEventTracker handleSignpost:].cold.8(v183, selfa, &v184, v55);
                }

                *__error() = v54;
                self = selfa;
                if (selfa) {
                  id v60 = objc_getProperty(selfa, v59, 112, 1);
                }
                else {
                  id v60 = 0;
                }
                id v4 = v154;
                double v8 = v156;
                [v60 removeObjectIdenticalTo:v48];
              }
            }
            v45 |= v49;
            ++v47;
          }
          while (v44 != v47);
          uint64_t v61 = [v42 countByEnumeratingWithState:&v167 objects:v185 count:16];
          uint64_t v44 = v61;
        }
        while (v61);

        id v5 = v149;
        if (v45)
        {
          int v63 = 1;
          char v64 = v152;
          long long v65 = v153;
          if (!v153)
          {
LABEL_161:
            if (v64) {
              goto LABEL_152;
            }
            if (v63)
            {
              ++self->_numHandledSignposts;
              goto LABEL_152;
            }
LABEL_164:
            ++self->_numOutsideSignposts;
            goto LABEL_152;
          }
LABEL_138:
          if (self && objc_getProperty(self, v62, 136, 1))
          {
            objc_msgSend(objc_getProperty(self, v127, 136, 1), "addObject:", v65);
          }
          else
          {
            os_log_t v148 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v65, 0);
            if (self) {
              objc_setProperty_atomic(self, v147, v148, 136);
            }
          }
          goto LABEL_161;
        }
      }
      else
      {
      }
      char v64 = v152;
      long long v65 = v153;
      if (!v153)
      {
        [v4 name];

        int v123 = [(WRWorkflowEventTracker *)self workflow];
        [v123 name];

        int v124 = *__error();
        int v125 = _wrlog();
        if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG)) {
          [(WRWorkflowEventTracker *)self handleSignpost:v125];
        }

        *__error() = v124;
        if (v152) {
          goto LABEL_152;
        }
        goto LABEL_164;
      }
      v108 = objc_msgSend(objc_getProperty(v153, v62, 8, 1), "individuationFieldName");

      if (v108)
      {
        objc_msgSend(objc_getProperty(v153, v109, 8, 1), "individuationFieldName");

        objc_getProperty(v153, v110, 16, 1);
        [v4 name];

        v111 = [(WRWorkflowEventTracker *)self workflow];
        [v111 name];

        int v112 = *__error();
        v113 = _wrlog();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
        {
          v114 = [(WRWorkflowEventTracker *)self workflow];
          v115 = [v114 name];
          uint64_t v116 = [v4 name];
          objc_msgSend(objc_getProperty(v153, v117, 8, 1), "individuationFieldName");
          uint64_t v118 = (__CFString *)objc_claimAutoreleasedReturnValue();
          id v120 = objc_getProperty(v153, v119, 16, 1);
          uint64_t v121 = [v154 startMachContinuousTime];
          *(_DWORD *)buf = 138544386;
          v174 = v115;
          __int16 v175 = 2114;
          uint64_t v176 = (uint64_t)v116;
          __int16 v177 = 2114;
          v178 = v118;
          __int16 v179 = 2112;
          id v180 = v120;
          id v4 = v154;
          __int16 v181 = 2048;
          uint64_t v182 = v121;
          _os_log_debug_impl(&dword_261964000, v113, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@: %{public}@->%@: outside any workflow event (%llu)", buf, 0x34u);

          char v64 = v152;
          double v8 = v156;
        }
      }
      else
      {
        [v4 name];

        int v126 = [(WRWorkflowEventTracker *)self workflow];
        [v126 name];

        int v112 = *__error();
        v113 = _wrlog();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG)) {
          [(WRWorkflowEventTracker *)self handleSignpost:v113];
        }
      }

      int v63 = 0;
      *__error() = v112;
      goto LABEL_138;
    }
    int v13 = -[WRWorkflowEventTracker handleSignpost:wrsignpost:](self, v4, v8);
    if ((v6 & 1) == 0)
    {
      if (v13) {
        ++self->_numHandledSignposts;
      }
      else {
        ++self->_numOutsideSignposts;
      }
    }
  }
  else if ((v6 & 1) == 0)
  {
    ++self->_numUnhandledSignposts;
  }
LABEL_153:

  return v8 != 0;
}

- (uint64_t)handleSignpost:(void *)a3 wrsignpost:
{
  uint64_t v463 = *MEMORY[0x263EF8340];
  id v423 = a2;
  id newValue = a3;
  if (!a1) {
    goto LABEL_81;
  }
  self = a1;
  id v6 = objc_getProperty(a1, v5, 120, 1);
  if (v6) {
    goto LABEL_3;
  }
  double v7 = self;
  if (![self inMiddleOfEvent]) {
    goto LABEL_12;
  }
  id v6 = [self workflow];
  if (![v6 hasMaximumEventDuration])
  {
LABEL_3:
    double v7 = self;
LABEL_12:

    goto LABEL_13;
  }
  double v7 = self;
  char v8 = [self ignoreEventTimeouts];

  if ((v8 & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = (void *)[v423 timeRecordedNanoseconds];
    }
    else
    {
      char v10 = [v423 beginEvent];
      id v9 = (void *)[v10 timeRecordedNanoseconds];

      double v7 = self;
    }
    id v11 = [v7 eventStart];
    uint64_t v12 = [v11 machContTimeNs];
    int v13 = [self workflow];
    [v13 maximumEventDuration];
    unint64_t v15 = v12 + (unint64_t)(v14 * 1000000000.0);

    double v7 = self;
    if (v15 < (unint64_t)v9)
    {
      id v6 = [v423 beginDate];
      uint64_t v16 = objc_msgSend(v6, "dateByAddingTimeInterval:", ((double)(unint64_t)v9 - (double)(unint64_t)objc_msgSend(v423, "startNanoseconds")) / 1000000000.0);
      double v7 = self;
      -[WRWorkflowEventTracker reportErrorsAndResetAtMachContNs:date:](self, v9, v16);

      goto LABEL_12;
    }
  }
LABEL_13:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_82;
  }
  id v405 = v423;
  uint64_t v17 = [v7 workflow];
  uint64_t v18 = [v17 startSignposts];
  uint64_t v19 = [v18 indexOfObjectIdenticalTo:newValue];

  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v35 = [self inMiddleOfEvent];
    [v405 name];

    int v36 = [self workflow];
    [v36 name];

    [self eventIdentifier];
    int v37 = [self eventIdentifier];

    int v38 = *__error();
    v39 = _wrlog();
    BOOL v40 = v39;
    if (v35)
    {
      BOOL v41 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
      if (v37)
      {
        if (v41) {
          -[WRWorkflowEventTracker handleSignpost:wrsignpost:].cold.4(self, v405, v40);
        }
      }
      else if (v41)
      {
        -[WRWorkflowEventTracker handleSignpost:wrsignpost:](self, v405, v40);
      }
    }
    else
    {
      BOOL v42 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
      if (v37)
      {
        if (v42)
        {
          uint64_t v43 = [self workflow];
          uint64_t v44 = [v43 name];
          char v45 = [self eventIdentifier];
          double v46 = [v405 name];
          double v47 = [v405 beginDate];
          *(_DWORD *)buf = 138544386;
          v443 = v44;
          __int16 v444 = 2114;
          v445 = v45;
          __int16 v446 = 2114;
          double v447 = v46;
          __int16 v448 = 2112;
          double v449 = v47;
          __int16 v450 = 2048;
          double v451 = COERCE_DOUBLE([v405 startMachContinuousTime]);
          _os_log_impl(&dword_261964000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@<%{public}@>: %{public}@: event start @ %@ (%llu)", buf, 0x34u);
        }
      }
      else if (v42)
      {
        long long v48 = [self workflow];
        char v49 = [v48 name];
        long long v50 = [v405 name];
        double v51 = [v405 beginDate];
        *(_DWORD *)buf = 138544130;
        v443 = v49;
        __int16 v444 = 2114;
        v445 = v50;
        __int16 v446 = 2112;
        double v447 = v51;
        __int16 v448 = 2048;
        double v449 = COERCE_DOUBLE([v405 startMachContinuousTime]);
        _os_log_impl(&dword_261964000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: event start @ %@ (%llu)", buf, 0x2Au);
      }
    }

    *__error() = v38;
    id v53 = objc_getProperty(self, v52, 136, 1);
    int v54 = (void *)[v405 timeRecordedNanoseconds];
    v55 = [v405 beginDate];
    BOOL v56 = objc_msgSend(v55, "dateByAddingTimeInterval:", ((double)(unint64_t)objc_msgSend(v405, "timeRecordedNanoseconds")- (double)(unint64_t)objc_msgSend(v405, "startNanoseconds"))/ 1000000000.0);
    -[WRWorkflowEventTracker reportErrorsAndResetAtMachContNs:date:](self, v54, v56);

    long long v440 = 0u;
    long long v441 = 0u;
    long long v438 = 0u;
    long long v439 = 0u;
    id obj = v53;
    uint64_t v58 = [obj countByEnumeratingWithState:&v438 objects:v462 count:16];
    if (v58)
    {
      uint64_t v60 = *(void *)v439;
      *(void *)&long long v59 = 138543874;
      long long v400 = v59;
      do
      {
        uint64_t v61 = 0;
        do
        {
          if (*(void *)v439 != v60) {
            objc_enumerationMutation(obj);
          }
          long long v62 = *(void **)(*((void *)&v438 + 1) + 8 * v61);
          if (v62) {
            id Property = objc_getProperty(*(id *)(*((void *)&v438 + 1) + 8 * v61), v57, 8, 1);
          }
          else {
            id Property = 0;
          }
          id v64 = Property;
          long long v65 = [v64 individuationFieldName];

          if (v65)
          {
            if (v62) {
              id v67 = objc_getProperty(v62, v66, 16, 1);
            }
            else {
              id v67 = 0;
            }
            -[WRWorkflowEventTracker sawIndividuationFieldName:withIndividuationIdentifier:](self, v65, v67);
          }
          else
          {
            if (v62) {
              id v68 = objc_getProperty(v62, v66, 8, 1);
            }
            else {
              id v68 = 0;
            }
            id v69 = v68;
            [v69 name];

            char v70 = [self workflow];
            [v70 name];

            [self eventIdentifier];
            BOOL v71 = [self eventIdentifier];

            BOOL v72 = v71 == 0;
            int v73 = *__error();
            int v74 = _wrlog();
            BOOL v75 = os_log_type_enabled(v74, OS_LOG_TYPE_FAULT);
            if (v72)
            {
              if (v75)
              {
                v421 = [self workflow];
                v418 = [v421 name];
                if (v62) {
                  id v84 = objc_getProperty(v62, v83, 8, 1);
                }
                else {
                  id v84 = 0;
                }
                id v85 = v84;
                v87 = [v85 name];
                if (v62) {
                  id v88 = objc_getProperty(v62, v86, 16, 1);
                }
                else {
                  id v88 = 0;
                }
                double v89 = COERCE_DOUBLE(v88);
                *(_DWORD *)buf = v400;
                v443 = v418;
                __int16 v444 = 2114;
                v445 = v87;
                __int16 v446 = 2112;
                double v447 = v89;
                _os_log_fault_impl(&dword_261964000, v74, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: No indivudation field name for identifier %@", buf, 0x20u);
              }
            }
            else if (v75)
            {
              v420 = [self workflow];
              v417 = [v420 name];
              v411 = [self eventIdentifier];
              if (v62) {
                id v77 = objc_getProperty(v62, v76, 8, 1);
              }
              else {
                id v77 = 0;
              }
              id v78 = v77;
              double v80 = [v78 name];
              if (v62) {
                id v81 = objc_getProperty(v62, v79, 16, 1);
              }
              else {
                id v81 = 0;
              }
              double v82 = COERCE_DOUBLE(v81);
              *(_DWORD *)buf = 138544130;
              v443 = v417;
              __int16 v444 = 2114;
              v445 = v411;
              __int16 v446 = 2114;
              double v447 = v80;
              __int16 v448 = 2112;
              double v449 = v82;
              _os_log_fault_impl(&dword_261964000, v74, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: No indivudation field name for identifier %@", buf, 0x2Au);
            }
            *__error() = v73;
          }

          ++v61;
        }
        while (v58 != v61);
        uint64_t v90 = [obj countByEnumeratingWithState:&v438 objects:v462 count:16];
        uint64_t v58 = v90;
      }
      while (v90);
    }

    objc_setProperty_atomic(self, v91, newValue, 40);
    id v92 = [WRTimestampAndThread alloc];
    int v93 = [v405 processID];
    uint64_t v94 = (void *)[v405 threadID];
    v95 = (void *)[v405 startNanoseconds];
    id v96 = [v405 beginDate];
    id v97 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)&v92->super.isa, v93, v94, v95, v96);
    objc_setProperty_atomic(self, v98, v97, 32);

    v100 = objc_getProperty(self, v99, 120, 1);
    if (!v100) {
      goto LABEL_79;
    }
    uint64_t v101 = [self workflow];
    if ([v101 hasMaximumEventDuration])
    {
      char v102 = [self ignoreEventTimeouts];

      if (v102)
      {
LABEL_79:

        goto LABEL_80;
      }
      uint64_t v103 = [v405 startNanoseconds];
      uint64_t v101 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v100);
      v104 = [self workflow];
      [v104 maximumEventDuration];
      double v106 = v105;

      double v107 = v106 / 100.0;
      BOOL v108 = v107 < 1.0;
      v109 = [self workflow];
      [v109 maximumEventDuration];
      double v110 = v107 * 1000000000.0;
      dispatch_time_t v112 = dispatch_time(0, (unint64_t)(v111 * 1000000000.0));
      if (v108) {
        double v113 = 1000000000.0;
      }
      else {
        double v113 = v110;
      }
      dispatch_source_set_timer(v101, v112, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)v113);

      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __52__WRWorkflowEventTracker_handleSignpost_wrsignpost___block_invoke;
      handler[3] = &unk_2655893C0;
      handler[4] = self;
      handler[5] = v103;
      dispatch_source_set_event_handler(v101, handler);
      dispatch_activate(v101);
      objc_setProperty_atomic(self, v114, v101, 128);
    }

    goto LABEL_79;
  }
  if (![v405 eventType] && (objc_msgSend(self, "inMiddleOfEvent") & 1) == 0)
  {
    uint64_t v20 = [newValue individuationFieldName];

    if (v20)
    {
      uint64_t v21 = [newValue individuationFieldName];
      int v22 = -[WRWorkflowEventTracker haveAnyEndSignpostsWithIndividuationFieldName:](self, v21);

      if (v22)
      {
        uint64_t v23 = [newValue individuationFieldName];
        BOOL v24 = -[WRWorkflowEventTracker individuationIdentifierForSignpostEvent:individuationFieldName:](self, v405, v23);

        if (v24)
        {
          uint64_t v25 = [WROpenIndividuatedSignpostInterval alloc];
          int v26 = [WRTimestampAndThread alloc];
          int v27 = [v405 processID];
          int v28 = (void *)[v405 threadID];
          uint64_t v29 = (void *)[v405 startNanoseconds];
          id v30 = [v405 beginDate];
          __int16 v31 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)&v26->super.isa, v27, v28, v29, v30);
          BOOL v32 = -[WROpenIndividuatedSignpostInterval initWithSignpost:individuationIdentifier:timestampAndThread:]((id *)&v25->super.isa, newValue, v24, v31);

          if (objc_getProperty(self, v33, 136, 1))
          {
            objc_msgSend(objc_getProperty(self, v34, 136, 1), "addObject:", v32);
          }
          else
          {
            *(void *)&long long v394 = 0;
            v371 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithObjects:v32];
            objc_setProperty_atomic(self, v372, v371, 136);
          }
        }
      }
    }
  }
LABEL_80:
  char v115 = [v405 isSyntheticIntervalEvent];

  if ((v115 & 1) == 0)
  {
LABEL_82:
    double obja = [newValue individuationFieldName];
    -[WRWorkflowEventTracker individuationIdentifierForSignpostObject:individuationFieldName:](self, v423, *(void **)&obja);
    double v422 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    v419 = -[WRWorkflowEventTracker trackerForWRSignpost:individuationIdentifier:](self, newValue, *(void **)&v422);
    if (![self inMiddleOfEvent]
      || (unint64_t v117 = [v423 endNanoseconds],
          [self eventStart],
          uint64_t v118 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v117) = v117 < [v118 machContTimeNs],
          v118,
          v117))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v119 = [v423 startNanoseconds];
        id v120 = [v423 beginEvent];
        uint64_t v121 = [v120 threadID];

        if (objc_msgSend(objc_getProperty(self, v122, 136, 1), "count"))
        {
          uint64_t v124 = 0;
          while (1)
          {
            int v125 = objc_msgSend(objc_getProperty(self, v123, 136, 1), "objectAtIndexedSubscript:", v124);
            int v127 = v125;
            id v128 = v125 ? objc_getProperty(v125, v126, 24, 1) : 0;
            if ([v128 machContTimeNs] == v119)
            {
              id v130 = v127 ? objc_getProperty(v127, v129, 24, 1) : 0;
              if ([v130 threadID] == v121) {
                break;
              }
            }

            if (++v124 >= (unint64_t)objc_msgSend(objc_getProperty(self, v132, 136, 1), "count")) {
              goto LABEL_110;
            }
          }
          objc_msgSend(objc_getProperty(self, v131, 136, 1), "removeObjectAtIndex:", v124);
        }
      }
LABEL_110:
      uint64_t v116 = 0;
      goto LABEL_214;
    }
    if (obja != 0.0 && v422 != 0.0) {
      -[WRWorkflowEventTracker sawIndividuationFieldName:withIndividuationIdentifier:](self, *(void **)&obja, *(void **)&v422);
    }
    uint64_t v133 = [v423 startNanoseconds];
    BOOL v134 = v133 == [v423 endNanoseconds];
    [v423 name];

    long long v135 = [self workflow];
    [v135 name];

    [self eventIdentifier];
    long long v136 = [self eventIdentifier];

    int v137 = *__error();
    long long v138 = _wrlog();
    BOOL v139 = os_log_type_enabled(v138, OS_LOG_TYPE_INFO);
    if (v134)
    {
      if (obja == 0.0)
      {
        if (v136)
        {
          if (v139)
          {
            __int16 v157 = [self workflow];
            id v158 = [v157 name];
            long long v159 = [self eventIdentifier];
            double v160 = [v423 name];
            unint64_t v161 = [v423 startNanoseconds];
            long long v162 = [self eventStart];
            unint64_t v163 = [v162 machContTimeNs];
            double v164 = COERCE_DOUBLE([v423 startMachContinuousTime]);
            *(_DWORD *)buf = 138544386;
            v443 = v158;
            __int16 v444 = 2114;
            v445 = v159;
            __int16 v446 = 2114;
            double v447 = v160;
            __int16 v448 = 2048;
            double v449 = ((double)v161 - (double)v163) / 1000000000.0;
            __int16 v450 = 2048;
            double v451 = v164;
            _os_log_impl(&dword_261964000, v138, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: event middle %+.3fs @%llu", buf, 0x34u);
          }
        }
        else if (v139)
        {
          v190 = [self workflow];
          v191 = [v190 name];
          v192 = [v423 name];
          unint64_t v193 = [v423 startNanoseconds];
          v194 = [self eventStart];
          unint64_t v195 = [v194 machContTimeNs];
          double v196 = COERCE_DOUBLE([v423 startMachContinuousTime]);
          *(_DWORD *)buf = 138544130;
          v443 = v191;
          __int16 v444 = 2114;
          v445 = v192;
          __int16 v446 = 2048;
          double v447 = ((double)v193 - (double)v195) / 1000000000.0;
          __int16 v448 = 2048;
          double v449 = v196;
          _os_log_impl(&dword_261964000, v138, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: event middle %+.3fs @%llu", buf, 0x2Au);
        }
      }
      else if (v136)
      {
        if (v139)
        {
          long long v140 = [self workflow];
          long long v141 = [v140 name];
          long long v142 = [self eventIdentifier];
          double v143 = [v423 name];
          unint64_t v144 = [v423 startNanoseconds];
          long long v145 = [self eventStart];
          unint64_t v146 = [v145 machContTimeNs];
          *(double *)&uint64_t v147 = COERCE_DOUBLE([v423 startMachContinuousTime]);
          *(_DWORD *)buf = 138544898;
          v443 = v141;
          __int16 v444 = 2114;
          v445 = v142;
          __int16 v446 = 2114;
          double v447 = v143;
          __int16 v448 = 2114;
          double v449 = obja;
          __int16 v450 = 2112;
          double v451 = v422;
          __int16 v452 = 2048;
          double v453 = ((double)v144 - (double)v146) / 1000000000.0;
          __int16 v454 = 2048;
          double v455 = *(double *)&v147;
          _os_log_impl(&dword_261964000, v138, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: event middle %+.3fs @%llu", buf, 0x48u);
        }
      }
      else if (v139)
      {
        v174 = [self workflow];
        __int16 v175 = [v174 name];
        uint64_t v176 = [v423 name];
        unint64_t v177 = [v423 startNanoseconds];
        v178 = [self eventStart];
        unint64_t v179 = [v178 machContTimeNs];
        double v180 = COERCE_DOUBLE([v423 startMachContinuousTime]);
        *(_DWORD *)buf = 138544642;
        v443 = v175;
        __int16 v444 = 2114;
        v445 = v176;
        __int16 v446 = 2114;
        double v447 = obja;
        __int16 v448 = 2112;
        double v449 = v422;
        __int16 v450 = 2048;
        double v451 = ((double)v177 - (double)v179) / 1000000000.0;
        __int16 v452 = 2048;
        double v453 = v180;
        _os_log_impl(&dword_261964000, v138, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: %{public}@->%@: event middle %+.3fs @%llu", buf, 0x3Eu);
      }
    }
    else if (obja == 0.0)
    {
      if (v136)
      {
        if (v139)
        {
          long long v165 = [self workflow];
          v407 = [v165 name];
          v402 = [self eventIdentifier];
          *(void *)&long long v400 = [v423 name];
          *(void *)&long long v399 = [v423 startNanoseconds];
          v413 = [self eventStart];
          unint64_t v166 = [v413 machContTimeNs];
          unint64_t v167 = [v423 endNanoseconds];
          long long v168 = [self eventStart];
          unint64_t v169 = [v168 machContTimeNs];
          unint64_t v170 = [v423 endNanoseconds];
          unint64_t v171 = [v423 startNanoseconds];
          *(double *)&uint64_t v172 = COERCE_DOUBLE([v423 startMachContinuousTime]);
          double v173 = COERCE_DOUBLE([v423 endMachContinuousTime]);
          *(_DWORD *)buf = 138545154;
          v443 = v407;
          __int16 v444 = 2114;
          v445 = v402;
          __int16 v446 = 2114;
          double v447 = *(double *)&v400;
          __int16 v448 = 2048;
          double v449 = ((double)(unint64_t)v399 - (double)v166) / 1000000000.0;
          __int16 v450 = 2048;
          double v451 = ((double)v167 - (double)v169) / 1000000000.0;
          __int16 v452 = 2048;
          double v453 = ((double)v170 - (double)v171) / 1000000000.0;
          __int16 v454 = 2048;
          double v455 = *(double *)&v172;
          __int16 v456 = 2048;
          double v457 = v173;
          _os_log_impl(&dword_261964000, v138, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: event middle %+.3fs - %+.3fs (%.3fs) @%llu-%llu", buf, 0x52u);
        }
      }
      else if (v139)
      {
        v197 = [self workflow];
        v409 = [v197 name];
        v404 = [v423 name];
        *(void *)&long long v400 = [v423 startNanoseconds];
        v415 = [self eventStart];
        unint64_t v198 = [v415 machContTimeNs];
        unint64_t v199 = [v423 endNanoseconds];
        v200 = [self eventStart];
        unint64_t v201 = [v200 machContTimeNs];
        unint64_t v202 = [v423 endNanoseconds];
        unint64_t v203 = [v423 startNanoseconds];
        double v204 = COERCE_DOUBLE([v423 startMachContinuousTime]);
        *(double *)&uint64_t v205 = COERCE_DOUBLE([v423 endMachContinuousTime]);
        *(_DWORD *)buf = 138544898;
        v443 = v409;
        __int16 v444 = 2114;
        v445 = v404;
        __int16 v446 = 2048;
        double v447 = ((double)(unint64_t)v400 - (double)v198) / 1000000000.0;
        __int16 v448 = 2048;
        double v449 = ((double)v199 - (double)v201) / 1000000000.0;
        __int16 v450 = 2048;
        double v451 = ((double)v202 - (double)v203) / 1000000000.0;
        __int16 v452 = 2048;
        double v453 = v204;
        __int16 v454 = 2048;
        double v455 = *(double *)&v205;
        _os_log_impl(&dword_261964000, v138, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: event middle %+.3fs - %+.3fs (%.3fs) @%llu-%llu", buf, 0x48u);
      }
    }
    else if (v136)
    {
      if (v139)
      {
        os_log_t v148 = [self workflow];
        v406 = [v148 name];
        v401 = [self eventIdentifier];
        *(void *)&long long v400 = [v423 name];
        *(void *)&long long v399 = [v423 startNanoseconds];
        v412 = [self eventStart];
        unint64_t v149 = [v412 machContTimeNs];
        unint64_t v150 = [v423 endNanoseconds];
        __int16 v151 = [self eventStart];
        unint64_t v152 = [v151 machContTimeNs];
        unint64_t v153 = [v423 endNanoseconds];
        unint64_t v154 = [v423 startNanoseconds];
        uint64_t v155 = [v423 startMachContinuousTime];
        uint64_t v156 = [v423 endMachContinuousTime];
        *(_DWORD *)buf = 138545666;
        v443 = v406;
        __int16 v444 = 2114;
        v445 = v401;
        __int16 v446 = 2114;
        double v447 = *(double *)&v400;
        __int16 v448 = 2114;
        double v449 = obja;
        __int16 v450 = 2112;
        double v451 = v422;
        __int16 v452 = 2048;
        double v453 = ((double)(unint64_t)v399 - (double)v149) / 1000000000.0;
        __int16 v454 = 2048;
        double v455 = ((double)v150 - (double)v152) / 1000000000.0;
        __int16 v456 = 2048;
        double v457 = ((double)v153 - (double)v154) / 1000000000.0;
        __int16 v458 = 2048;
        uint64_t v459 = v155;
        __int16 v460 = 2048;
        uint64_t v461 = v156;
        _os_log_impl(&dword_261964000, v138, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: event middle %+.3fs - %+.3fs (%.3fs) @%llu-%llu", buf, 0x66u);
      }
    }
    else if (v139)
    {
      __int16 v181 = [self workflow];
      v408 = [v181 name];
      v403 = [v423 name];
      *(void *)&long long v400 = [v423 startNanoseconds];
      v414 = [self eventStart];
      unint64_t v182 = [v414 machContTimeNs];
      unint64_t v183 = [v423 endNanoseconds];
      uint64_t v184 = [self eventStart];
      unint64_t v185 = [v184 machContTimeNs];
      unint64_t v186 = [v423 endNanoseconds];
      unint64_t v187 = [v423 startNanoseconds];
      double v188 = COERCE_DOUBLE([v423 startMachContinuousTime]);
      uint64_t v189 = [v423 endMachContinuousTime];
      *(_DWORD *)buf = 138545410;
      v443 = v408;
      __int16 v444 = 2114;
      v445 = v403;
      __int16 v446 = 2114;
      double v447 = obja;
      __int16 v448 = 2112;
      double v449 = v422;
      __int16 v450 = 2048;
      double v451 = ((double)(unint64_t)v400 - (double)v182) / 1000000000.0;
      __int16 v452 = 2048;
      double v453 = ((double)v183 - (double)v185) / 1000000000.0;
      __int16 v454 = 2048;
      double v455 = ((double)v186 - (double)v187) / 1000000000.0;
      __int16 v456 = 2048;
      double v457 = v188;
      __int16 v458 = 2048;
      uint64_t v459 = v189;
      _os_log_impl(&dword_261964000, v138, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: %{public}@->%@: event middle %+.3fs - %+.3fs (%.3fs) @%llu-%llu", buf, 0x5Cu);
    }
    *__error() = v137;
    -[WRWorkflowEventTracker applySignpost:toSignpostTracker:](self, v423, v419);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ![v423 eventType])
    {
LABEL_213:
      uint64_t v116 = 1;
LABEL_214:

      goto LABEL_215;
    }
    id v207 = objc_getProperty(self, v206, 152, 1);
    BOOL v208 = [v207 count] == 0;

    if (v208) {
      goto LABEL_200;
    }
    char v416 = 0;
    char v211 = 0;
    uint64_t v212 = 0;
    *(void *)&long long v400 = v428;
    *(void *)&long long v210 = 138544130;
    long long v398 = v210;
    *(void *)&long long v210 = 138544386;
    long long v399 = v210;
    *(void *)&long long v210 = 138543618;
    long long v396 = v210;
    *(void *)&long long v210 = 138543874;
    long long v397 = v210;
    *(void *)&long long v210 = 138544642;
    long long v395 = v210;
    while (1)
    {
      id v213 = objc_getProperty(self, v209, 152, 1);
      v214 = [v213 objectAtIndexedSubscript:v212];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v211) {
          goto LABEL_204;
        }
        v215 = [self workflow];
        v216 = [v215 endSignpostGroups];
        v217 = [v216 objectAtIndexedSubscript:v212];
        BOOL v218 = [v217 indexOfObjectIdenticalTo:newValue] == 0x7FFFFFFFFFFFFFFFLL;

        if (!v218)
        {
          if (v422 == 0.0)
          {
            [newValue name];

            v220 = [self workflow];
            [v220 name];

            [self eventIdentifier];
            v221 = [self eventIdentifier];

            int v222 = *__error();
            v223 = _wrlog();
            BOOL v224 = os_log_type_enabled(v223, OS_LOG_TYPE_INFO);
            if (obja == 0.0)
            {
              if (v221)
              {
                if (v224)
                {
                  v241 = [self workflow];
                  v242 = [v241 name];
                  v243 = [self eventIdentifier];
                  double v244 = [newValue name];
                  *(_DWORD *)buf = v397;
                  v443 = v242;
                  __int16 v444 = 2114;
                  v445 = v243;
                  __int16 v446 = 2114;
                  double v447 = v244;
                  _os_log_impl(&dword_261964000, v223, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: End signpost group candidate", buf, 0x20u);
                }
              }
              else if (v224)
              {
                v253 = [self workflow];
                v254 = [v253 name];
                v255 = [newValue name];
                *(_DWORD *)buf = v396;
                v443 = v254;
                __int16 v444 = 2114;
                v445 = v255;
                _os_log_impl(&dword_261964000, v223, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: End signpost group candidate", buf, 0x16u);
              }
            }
            else if (v221)
            {
              if (v224)
              {
                v225 = [self workflow];
                v226 = [v225 name];
                v227 = [self eventIdentifier];
                double v228 = [newValue name];
                *(_DWORD *)buf = v399;
                v443 = v226;
                __int16 v444 = 2114;
                v445 = v227;
                __int16 v446 = 2114;
                double v447 = v228;
                __int16 v448 = 2114;
                double v449 = obja;
                __int16 v450 = 2112;
                double v451 = 0.0;
                _os_log_impl(&dword_261964000, v223, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: End signpost group candidate", buf, 0x34u);
              }
            }
            else if (v224)
            {
              v245 = [self workflow];
              v246 = [v245 name];
              v247 = [newValue name];
              *(_DWORD *)buf = v398;
              v443 = v246;
              __int16 v444 = 2114;
              v445 = v247;
              __int16 v446 = 2114;
              double v447 = obja;
              __int16 v448 = 2112;
              double v449 = 0.0;
              _os_log_impl(&dword_261964000, v223, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: %{public}@->%@: End signpost group candidate", buf, 0x2Au);
            }
            *__error() = v222;
            objc_msgSend(objc_getProperty(self, v256, 152, 1), "setObject:atIndexedSubscript:", v419, v212);
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v219 = v214;
            }
            else
            {
              v229 = [MEMORY[0x263EFF9D0] null];
              BOOL v230 = v214 == v229;

              if (!v230)
              {
                [newValue name];

                v231 = [self workflow];
                [v231 name];

                [self eventIdentifier];
                v232 = [self eventIdentifier];

                int v233 = *__error();
                v234 = _wrlog();
                BOOL v235 = os_log_type_enabled(v234, OS_LOG_TYPE_FAULT);
                if (obja == 0.0)
                {
                  if (v232)
                  {
                    if (v235)
                    {
                      v248 = [self workflow];
                      v249 = [v248 name];
                      v250 = [self eventIdentifier];
                      double v251 = [newValue name];
                      *(double *)&v252 = COERCE_DOUBLE(object_getClassName(v214));
                      *(_DWORD *)buf = v398;
                      v443 = v249;
                      __int16 v444 = 2114;
                      v445 = v250;
                      __int16 v446 = 2114;
                      double v447 = v251;
                      __int16 v448 = 2080;
                      double v449 = *(double *)&v252;
                      _os_log_fault_impl(&dword_261964000, v234, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: candidateEndSignpostTracker is bad class %s", buf, 0x2Au);
                    }
                  }
                  else if (v235)
                  {
                    v320 = [self workflow];
                    v321 = [v320 name];
                    v322 = [newValue name];
                    *(double *)&v323 = COERCE_DOUBLE(object_getClassName(v214));
                    *(_DWORD *)buf = v397;
                    v443 = v321;
                    __int16 v444 = 2114;
                    v445 = v322;
                    __int16 v446 = 2080;
                    double v447 = *(double *)&v323;
                    _os_log_fault_impl(&dword_261964000, v234, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: candidateEndSignpostTracker is bad class %s", buf, 0x20u);
                  }
                }
                else if (v232)
                {
                  if (v235)
                  {
                    v236 = [self workflow];
                    v237 = [v236 name];
                    v238 = [self eventIdentifier];
                    double v239 = [newValue name];
                    *(double *)&v240 = COERCE_DOUBLE(object_getClassName(v214));
                    *(_DWORD *)buf = v395;
                    v443 = v237;
                    __int16 v444 = 2114;
                    v445 = v238;
                    __int16 v446 = 2114;
                    double v447 = v239;
                    __int16 v448 = 2114;
                    double v449 = obja;
                    __int16 v450 = 2112;
                    double v451 = v422;
                    __int16 v452 = 2080;
                    double v453 = *(double *)&v240;
                    _os_log_fault_impl(&dword_261964000, v234, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: candidateEndSignpostTracker is bad class %s", buf, 0x3Eu);
                  }
                }
                else if (v235)
                {
                  v257 = [self workflow];
                  v258 = [v257 name];
                  v259 = [newValue name];
                  *(double *)&v260 = COERCE_DOUBLE(object_getClassName(v214));
                  *(_DWORD *)buf = v399;
                  v443 = v258;
                  __int16 v444 = 2114;
                  v445 = v259;
                  __int16 v446 = 2114;
                  double v447 = obja;
                  __int16 v448 = 2112;
                  double v449 = v422;
                  __int16 v450 = 2080;
                  double v451 = *(double *)&v260;
                  _os_log_fault_impl(&dword_261964000, v234, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: %{public}@->%@: candidateEndSignpostTracker is bad class %s", buf, 0x34u);
                }
                *__error() = v233;
              }
              id v219 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              id v262 = objc_getProperty(self, v261, 152, 1);
              [v262 setObject:v219 atIndexedSubscript:v212];
            }
            uint64_t v431 = 0;
            v432 = (double *)&v431;
            uint64_t v433 = 0x3032000000;
            v434 = __Block_byref_object_copy_;
            v435 = __Block_byref_object_dispose_;
            id v436 = 0;
            v427[0] = MEMORY[0x263EF8330];
            v427[1] = 3221225472;
            v428[0] = __52__WRWorkflowEventTracker_handleSignpost_wrsignpost___block_invoke_209;
            v428[1] = &unk_2655893E8;
            id v263 = *(id *)&v422;
            id v429 = v263;
            v430 = &v431;
            [v219 enumerateKeysAndObjectsUsingBlock:v427];
            uint64_t v264 = *((void *)v432 + 5);
            if (v264)
            {
              [v219 setObject:v419 forKeyedSubscript:v263];
              if (obja == 0.0)
              {
                [newValue name];

                v277 = [self workflow];
                [v277 name];

                [self eventIdentifier];
                v278 = [self eventIdentifier];

                if (!v278)
                {
                  int v279 = *__error();
                  v280 = _wrlog();
                  if (os_log_type_enabled(v280, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v315 = v264;
                    v316 = [self workflow];
                    v317 = [v316 name];
                    v318 = [newValue name];
                    double v319 = v432[5];
                    *(_DWORD *)buf = v397;
                    v443 = v317;
                    __int16 v444 = 2114;
                    v445 = v318;
                    __int16 v446 = 2112;
                    double v447 = v319;
                    _os_log_debug_impl(&dword_261964000, v280, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@: End signpost with individuation, still needs %@", buf, 0x20u);

                    uint64_t v264 = v315;
                  }
                  goto LABEL_189;
                }
                int v267 = *__error();
                v268 = _wrlog();
                if (os_log_type_enabled(v268, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v304 = v264;
                  v305 = [self workflow];
                  v306 = [v305 name];
                  v307 = [self eventIdentifier];
                  double v308 = [newValue name];
                  double v309 = v432[5];
                  *(_DWORD *)buf = v398;
                  v443 = v306;
                  __int16 v444 = 2114;
                  v445 = v307;
                  __int16 v446 = 2114;
                  double v447 = v308;
                  __int16 v448 = 2112;
                  double v449 = v309;
                  _os_log_debug_impl(&dword_261964000, v268, OS_LOG_TYPE_DEBUG, "%{public}@<%{public}@>: %{public}@: End signpost with individuation, still needs %@", buf, 0x2Au);

                  uint64_t v264 = v304;
                }
LABEL_176:

                *__error() = v267;
              }
              else
              {
                [newValue name];

                v265 = [self workflow];
                [v265 name];

                [self eventIdentifier];
                v266 = [self eventIdentifier];

                if (v266)
                {
                  int v267 = *__error();
                  v268 = _wrlog();
                  if (os_log_type_enabled(v268, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v298 = v264;
                    v299 = [self workflow];
                    v300 = [v299 name];
                    v301 = [self eventIdentifier];
                    double v302 = [newValue name];
                    double v303 = v432[5];
                    *(_DWORD *)buf = v395;
                    v443 = v300;
                    __int16 v444 = 2114;
                    v445 = v301;
                    __int16 v446 = 2114;
                    double v447 = v302;
                    __int16 v448 = 2114;
                    double v449 = obja;
                    __int16 v450 = 2112;
                    double v451 = v422;
                    __int16 v452 = 2112;
                    double v453 = v303;
                    _os_log_debug_impl(&dword_261964000, v268, OS_LOG_TYPE_DEBUG, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: End signpost with individuation, still needs %@", buf, 0x3Eu);

                    uint64_t v264 = v298;
                  }
                  goto LABEL_176;
                }
                int v279 = *__error();
                v280 = _wrlog();
                if (os_log_type_enabled(v280, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v310 = v264;
                  v311 = [self workflow];
                  v312 = [v311 name];
                  v313 = [newValue name];
                  double v314 = v432[5];
                  *(_DWORD *)buf = v399;
                  v443 = v312;
                  __int16 v444 = 2114;
                  v445 = v313;
                  __int16 v446 = 2114;
                  double v447 = obja;
                  __int16 v448 = 2112;
                  double v449 = v422;
                  __int16 v450 = 2112;
                  double v451 = v314;
                  _os_log_debug_impl(&dword_261964000, v280, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@: %{public}@->%@: End signpost with individuation, still needs %@", buf, 0x34u);

                  uint64_t v264 = v310;
                }
LABEL_189:

                *__error() = v279;
              }
              char v416 = 1;
            }
            else
            {
              if (obja == 0.0)
              {
                [newValue name];

                v281 = [self workflow];
                [v281 name];

                [self eventIdentifier];
                v282 = [self eventIdentifier];

                if (v282)
                {
                  int v271 = *__error();
                  v272 = _wrlog();
                  if (os_log_type_enabled(v272, OS_LOG_TYPE_INFO))
                  {
                    v283 = [self workflow];
                    v284 = [v283 name];
                    v285 = [self eventIdentifier];
                    double v286 = [newValue name];
                    *(_DWORD *)buf = v397;
                    v443 = v284;
                    __int16 v444 = 2114;
                    v445 = v285;
                    __int16 v446 = 2114;
                    double v447 = v286;
                    _os_log_impl(&dword_261964000, v272, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: End signpost with individuation, set as candidate for group", buf, 0x20u);

                    uint64_t v264 = 0;
                  }
                }
                else
                {
                  int v271 = *__error();
                  v272 = _wrlog();
                  if (os_log_type_enabled(v272, OS_LOG_TYPE_INFO))
                  {
                    v290 = [self workflow];
                    v291 = [v290 name];
                    v292 = [newValue name];
                    *(_DWORD *)buf = v396;
                    v443 = v291;
                    __int16 v444 = 2114;
                    v445 = v292;
                    _os_log_impl(&dword_261964000, v272, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: End signpost with individuation, set as candidate for group", buf, 0x16u);

                    uint64_t v264 = 0;
                  }
                }
              }
              else
              {
                [newValue name];

                v269 = [self workflow];
                [v269 name];

                [self eventIdentifier];
                v270 = [self eventIdentifier];

                if (v270)
                {
                  int v271 = *__error();
                  v272 = _wrlog();
                  if (os_log_type_enabled(v272, OS_LOG_TYPE_INFO))
                  {
                    v273 = [self workflow];
                    v274 = [v273 name];
                    v275 = [self eventIdentifier];
                    double v276 = [newValue name];
                    *(_DWORD *)buf = v399;
                    v443 = v274;
                    __int16 v444 = 2114;
                    v445 = v275;
                    __int16 v446 = 2114;
                    double v447 = v276;
                    __int16 v448 = 2114;
                    double v449 = obja;
                    __int16 v450 = 2112;
                    double v451 = v422;
                    _os_log_impl(&dword_261964000, v272, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: End signpost with individuation, set as candidate for group", buf, 0x34u);

                    uint64_t v264 = 0;
                  }
                }
                else
                {
                  int v271 = *__error();
                  v272 = _wrlog();
                  if (os_log_type_enabled(v272, OS_LOG_TYPE_INFO))
                  {
                    v287 = [self workflow];
                    v288 = [v287 name];
                    v289 = [newValue name];
                    *(_DWORD *)buf = v398;
                    v443 = v288;
                    __int16 v444 = 2114;
                    v445 = v289;
                    __int16 v446 = 2114;
                    double v447 = obja;
                    __int16 v448 = 2112;
                    double v449 = v422;
                    _os_log_impl(&dword_261964000, v272, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: %{public}@->%@: End signpost with individuation, set as candidate for group", buf, 0x2Au);

                    uint64_t v264 = 0;
                  }
                }
              }

              *__error() = v271;
              id v294 = objc_getProperty(self, v293, 152, 1);
              [v294 setObject:v419 atIndexedSubscript:v212];
            }
            _Block_object_dispose(&v431, 8);

            if (v264)
            {

              if (v416) {
                goto LABEL_213;
              }
              goto LABEL_217;
            }
          }
          if (v416)
          {
LABEL_204:

            goto LABEL_213;
          }
          char v416 = 0;
          char v211 = 1;
          goto LABEL_197;
        }
        char v211 = 0;
        char v416 = 1;
      }
LABEL_197:

      id v296 = objc_getProperty(self, v295, 152, 1);
      unint64_t v297 = [v296 count];

      if (++v212 >= v297)
      {
        if (v416) {
          goto LABEL_213;
        }
        if ((v211 & 1) == 0)
        {
LABEL_200:
          [v423 name];

          v324 = [self workflow];
          [v324 name];

          [self eventIdentifier];
          v325 = [self eventIdentifier];

          int v326 = *__error();
          v327 = _wrlog();
          BOOL v328 = os_log_type_enabled(v327, OS_LOG_TYPE_FAULT);
          if (obja == 0.0)
          {
            if (v325)
            {
              if (v328) {
                -[WRWorkflowEventTracker handleSignpost:wrsignpost:]((uint64_t)self, (uint64_t)v423, (uint64_t)v327, v329, v330, v331, v332, v333, v394, v395, *((uint64_t *)&v395 + 1), v396, *((uint64_t *)&v396 + 1), v397, *((uint64_t *)&v397 + 1), v398, *((uint64_t *)&v398 + 1), v399, *((uint64_t *)&v399 + 1),
              }
                  v400,
                  *((uint64_t *)&v400 + 1));
            }
            else if (v328)
            {
              -[WRWorkflowEventTracker handleSignpost:wrsignpost:](self, v423);
            }
          }
          else if (v325)
          {
            if (v328)
            {
              v334 = [self workflow];
              v335 = [v334 name];
              v336 = [self eventIdentifier];
              double v337 = [v423 name];
              *(_DWORD *)buf = 138544386;
              v443 = v335;
              __int16 v444 = 2114;
              v445 = v336;
              __int16 v446 = 2114;
              double v447 = v337;
              __int16 v448 = 2114;
              double v449 = obja;
              __int16 v450 = 2112;
              double v451 = v422;
              _os_log_fault_impl(&dword_261964000, v327, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: No missing end signposts, but didn't find an end signpost tracker", buf, 0x34u);
            }
          }
          else if (v328)
          {
            v338 = [self workflow];
            v339 = [v338 name];
            v340 = [v423 name];
            *(_DWORD *)buf = 138544130;
            v443 = v339;
            __int16 v444 = 2114;
            v445 = v340;
            __int16 v446 = 2114;
            double v447 = obja;
            __int16 v448 = 2112;
            double v449 = v422;
            _os_log_fault_impl(&dword_261964000, v327, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: %{public}@->%@: No missing end signposts, but didn't find an end signpost tracker", buf, 0x2Au);
          }
          *__error() = v326;
          [(WRWorkflowEventTracker *)self resetWithoutReportingErrors];
          goto LABEL_213;
        }
LABEL_217:
        [v423 name];

        v343 = [self workflow];
        [v343 name];

        [self eventIdentifier];
        v344 = [self eventIdentifier];

        int v345 = *__error();
        v346 = _wrlog();
        BOOL v347 = os_log_type_enabled(v346, OS_LOG_TYPE_DEFAULT);
        if (obja == 0.0)
        {
          if (v344)
          {
            if (v347)
            {
              v356 = [self workflow];
              v357 = [v356 name];
              v358 = [self eventIdentifier];
              double v359 = [v423 name];
              unint64_t v360 = [v423 endNanoseconds];
              v361 = [self eventStart];
              unint64_t v362 = [v361 machContTimeNs];
              double v363 = COERCE_DOUBLE([v423 endMachContinuousTime]);
              *(_DWORD *)buf = v399;
              v443 = v357;
              __int16 v444 = 2114;
              v445 = v358;
              __int16 v446 = 2114;
              double v447 = v359;
              __int16 v448 = 2048;
              double v449 = ((double)v360 - (double)v362) / 1000000000.0;
              __int16 v450 = 2048;
              double v451 = v363;
              _os_log_impl(&dword_261964000, v346, OS_LOG_TYPE_DEFAULT, "%{public}@<%{public}@>: %{public}@: event end %+.3fs @%llu", buf, 0x34u);
            }
          }
          else if (v347)
          {
            v373 = [self workflow];
            v374 = [v373 name];
            v375 = [v423 name];
            unint64_t v376 = [v423 endNanoseconds];
            v377 = [self eventStart];
            unint64_t v378 = [v377 machContTimeNs];
            double v379 = COERCE_DOUBLE([v423 endMachContinuousTime]);
            *(_DWORD *)buf = v398;
            v443 = v374;
            __int16 v444 = 2114;
            v445 = v375;
            __int16 v446 = 2048;
            double v447 = ((double)v376 - (double)v378) / 1000000000.0;
            __int16 v448 = 2048;
            double v449 = v379;
            _os_log_impl(&dword_261964000, v346, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: event end %+.3fs @%llu", buf, 0x2Au);
          }
        }
        else if (v344)
        {
          if (v347)
          {
            v348 = [self workflow];
            v349 = [v348 name];
            v350 = [self eventIdentifier];
            double v351 = [v423 name];
            unint64_t v352 = [v423 endNanoseconds];
            v353 = [self eventStart];
            unint64_t v354 = [v353 machContTimeNs];
            *(double *)&uint64_t v355 = COERCE_DOUBLE([v423 endMachContinuousTime]);
            *(_DWORD *)buf = 138544898;
            v443 = v349;
            __int16 v444 = 2114;
            v445 = v350;
            __int16 v446 = 2114;
            double v447 = v351;
            __int16 v448 = 2114;
            double v449 = obja;
            __int16 v450 = 2112;
            double v451 = v422;
            __int16 v452 = 2048;
            double v453 = ((double)v352 - (double)v354) / 1000000000.0;
            __int16 v454 = 2048;
            double v455 = *(double *)&v355;
            _os_log_impl(&dword_261964000, v346, OS_LOG_TYPE_DEFAULT, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: event end %+.3fs @%llu", buf, 0x48u);
          }
        }
        else if (v347)
        {
          v364 = [self workflow];
          v365 = [v364 name];
          v366 = [v423 name];
          unint64_t v367 = [v423 endNanoseconds];
          v368 = [self eventStart];
          unint64_t v369 = [v368 machContTimeNs];
          double v370 = COERCE_DOUBLE([v423 endMachContinuousTime]);
          *(_DWORD *)buf = v395;
          v443 = v365;
          __int16 v444 = 2114;
          v445 = v366;
          __int16 v446 = 2114;
          double v447 = obja;
          __int16 v448 = 2112;
          double v449 = v422;
          __int16 v450 = 2048;
          double v451 = ((double)v367 - (double)v369) / 1000000000.0;
          __int16 v452 = 2048;
          double v453 = v370;
          _os_log_impl(&dword_261964000, v346, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: %{public}@->%@: event end %+.3fs @%llu", buf, 0x3Eu);
        }
        *__error() = v345;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v380 = [v423 processID];
          v381 = (void *)[v423 threadID];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v382 = [v423 endEvent];
            int v380 = [v382 processID];

            v383 = [v423 endEvent];
            v381 = (void *)[v383 threadID];
          }
          else
          {
            v381 = 0;
            int v380 = -1;
          }
        }
        v384 = [WRTimestampAndThread alloc];
        v385 = (void *)[v423 endNanoseconds];
        v386 = [v423 endDate];
        v387 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)&v384->super.isa, v380, v381, v385, v386);
        objc_setProperty_atomic(self, v388, v387, 48);

        v389 = [v419 signpost];
        objc_setProperty_atomic(self, v390, v389, 56);

        v392 = (void (**)(id, id))objc_getProperty(self, v391, 144, 1);
        v392[2](v392, self);

        [(WRWorkflowEventTracker *)self resetWithoutReportingErrors];
        goto LABEL_213;
      }
    }
  }
LABEL_81:
  uint64_t v116 = 0;
LABEL_215:

  return v116;
}

- (id)openIndividuatedIntervalsWithFieldNameMatchingAnEndSignpostFromBeforeEventStart
{
  if (result) {
    return objc_getProperty(result, a2, 136, 1);
  }
  return result;
}

void __52__WRWorkflowEventTracker_handleSignpost_wrsignpost___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) eventStart];
  uint64_t v3 = [v2 machContTimeNs];
  uint64_t v4 = *(void *)(a1 + 40);

  if (v3 == v4)
  {
    mach_get_times();
    id v5 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSince1970:(double)0];
    if (WRMachTimebaseForLiveMachine_once != -1) {
      dispatch_once(&WRMachTimebaseForLiveMachine_once, &__block_literal_global_541);
    }
    id v6 = 0;
    if (WRMachTimebaseForLiveMachine_timebase && HIDWORD(WRMachTimebaseForLiveMachine_timebase))
    {
      id v6 = 0;
      if (WRMachTimebaseForLiveMachine_timebase != HIDWORD(WRMachTimebaseForLiveMachine_timebase)) {
        id v6 = (void *)__udivti3();
      }
    }
    -[WRWorkflowEventTracker reportErrorsAndResetAtMachContNs:date:](*(void **)(a1 + 32), v6, v5);
  }
}

void __52__WRWorkflowEventTracker_handleSignpost_wrsignpost___block_invoke_209(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v8 = a3;
  id v9 = [MEMORY[0x263EFF9D0] null];
  if (v9 == v8)
  {
    char v10 = [v11 isEqualToString:*(void *)(a1 + 32)];

    if ((v10 & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }
  else
  {
  }
}

- (void)fillInNonDiagnosticSignpost:(void *)a1
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 workflow];
    id v5 = -[WRWorkflow wrsignpostForSignpostObject:](v4, v3);

    if (!v5) {
      goto LABEL_35;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v3 isSyntheticIntervalEvent]) {
      goto LABEL_35;
    }
    id v6 = [v5 individuationFieldName];
    double v7 = -[WRWorkflowEventTracker individuationIdentifierForSignpostObject:individuationFieldName:](a1, v3, v6);
    id v8 = -[WRWorkflowEventTracker trackerForWRSignpost:individuationIdentifier:](a1, v5, v7);
    uint64_t v9 = [v3 startNanoseconds];
    uint64_t v10 = [v3 endNanoseconds];
    [v3 name];

    id v11 = [a1 workflow];
    [v11 name];

    [a1 eventIdentifier];
    uint64_t v12 = [a1 eventIdentifier];

    int v70 = *__error();
    int v13 = _wrlog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v9 == v10)
    {
      if (v6)
      {
        if (v12)
        {
          if (v14)
          {
            id v64 = [a1 workflow];
            unint64_t v15 = [v64 name];
            [a1 eventIdentifier];
            uint64_t v16 = v68 = v7;
            uint64_t v17 = [v3 name];
            double v18 = (double)(unint64_t)[v3 startNanoseconds];
            uint64_t v19 = [a1 eventStart];
            *(_DWORD *)buf = 138544898;
            BOOL v72 = v15;
            __int16 v73 = 2114;
            int v74 = v16;
            __int16 v75 = 2114;
            double v76 = *(double *)&v17;
            __int16 v77 = 2114;
            double v78 = *(double *)&v6;
            __int16 v79 = 2112;
            double v80 = *(double *)&v68;
            __int16 v81 = 2048;
            double v82 = (v18 - (double)(unint64_t)[v19 machContTimeNs]) / 1000000000.0;
            __int16 v83 = 2048;
            double v84 = COERCE_DOUBLE([v3 startMachContinuousTime]);
            _os_log_impl(&dword_261964000, v13, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: fill non-diagnostic signposts: event middle %+.3fs @%llu", buf, 0x48u);

            double v7 = v68;
            uint64_t v20 = v64;
LABEL_33:
          }
LABEL_34:

          *__error() = v70;
          -[WRWorkflowEventTracker applySignpost:toSignpostTracker:](a1, v3, v8);

LABEL_35:
          goto LABEL_36;
        }
        if (!v14) {
          goto LABEL_34;
        }
        id v69 = [a1 workflow];
        uint64_t v21 = [v69 name];
        BOOL v32 = [v3 name];
        double v39 = (double)(unint64_t)[v3 startNanoseconds];
        SEL v33 = [a1 eventStart];
        *(_DWORD *)buf = 138544642;
        BOOL v72 = v21;
        __int16 v73 = 2114;
        int v74 = v32;
        __int16 v75 = 2114;
        double v76 = *(double *)&v6;
        __int16 v77 = 2112;
        double v78 = *(double *)&v7;
        __int16 v79 = 2048;
        double v80 = (v39 - (double)(unint64_t)[v33 machContTimeNs]) / 1000000000.0;
        __int16 v81 = 2048;
        double v82 = COERCE_DOUBLE([v3 startMachContinuousTime]);
        BOOL v40 = "%{public}@: %{public}@: %{public}@->%@: fill non-diagnostic signposts: event middle %+.3fs @%llu";
        BOOL v41 = v13;
        uint32_t v42 = 62;
      }
      else
      {
        if (v12)
        {
          if (!v14) {
            goto LABEL_34;
          }
          id v69 = [a1 workflow];
          int v28 = [v69 name];
          uint64_t v29 = [a1 eventIdentifier];
          id v30 = [v3 name];
          double v31 = (double)(unint64_t)[v3 startNanoseconds];
          long long v65 = [a1 eventStart];
          *(_DWORD *)buf = 138544386;
          BOOL v72 = v28;
          __int16 v73 = 2114;
          int v74 = v29;
          __int16 v75 = 2114;
          double v76 = *(double *)&v30;
          __int16 v77 = 2048;
          double v78 = (v31 - (double)(unint64_t)[v65 machContTimeNs]) / 1000000000.0;
          __int16 v79 = 2048;
          double v80 = COERCE_DOUBLE([v3 startMachContinuousTime]);
          _os_log_impl(&dword_261964000, v13, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: fill non-diagnostic signposts: event middle %+.3fs @%llu", buf, 0x34u);

LABEL_32:
          uint64_t v20 = v69;
          goto LABEL_33;
        }
        if (!v14) {
          goto LABEL_34;
        }
        id v69 = [a1 workflow];
        uint64_t v21 = [v69 name];
        BOOL v32 = [v3 name];
        double v53 = (double)(unint64_t)[v3 startNanoseconds];
        SEL v33 = [a1 eventStart];
        *(_DWORD *)buf = 138544130;
        BOOL v72 = v21;
        __int16 v73 = 2114;
        int v74 = v32;
        __int16 v75 = 2048;
        double v76 = (v53 - (double)(unint64_t)[v33 machContTimeNs]) / 1000000000.0;
        __int16 v77 = 2048;
        double v78 = COERCE_DOUBLE([v3 startMachContinuousTime]);
        BOOL v40 = "%{public}@: %{public}@: fill non-diagnostic signposts: event middle %+.3fs @%llu";
        BOOL v41 = v13;
        uint32_t v42 = 42;
      }
      _os_log_impl(&dword_261964000, v41, OS_LOG_TYPE_INFO, v40, buf, v42);
      goto LABEL_27;
    }
    if (v6)
    {
      if (v12)
      {
        if (!v14) {
          goto LABEL_34;
        }
        id v69 = [a1 workflow];
        uint64_t v21 = [v69 name];
        int v22 = [a1 eventIdentifier];
        uint64_t v60 = [v3 name];
        double v23 = (double)(unint64_t)[v3 startNanoseconds];
        uint64_t v61 = [a1 eventStart];
        double v24 = (v23 - (double)(unint64_t)[v61 machContTimeNs]) / 1000000000.0;
        double v25 = (double)(unint64_t)[v3 endNanoseconds];
        long long v59 = [a1 eventStart];
        double v26 = (v25 - (double)(unint64_t)[v59 machContTimeNs]) / 1000000000.0;
        double v27 = (double)(unint64_t)[v3 endNanoseconds];
        *(_DWORD *)buf = 138545666;
        BOOL v72 = v21;
        __int16 v73 = 2114;
        int v74 = v22;
        __int16 v75 = 2114;
        double v76 = *(double *)&v60;
        __int16 v77 = 2114;
        double v78 = *(double *)&v6;
        __int16 v79 = 2112;
        double v80 = *(double *)&v7;
        __int16 v81 = 2048;
        double v82 = v24;
        __int16 v83 = 2048;
        double v84 = v26;
        __int16 v85 = 2048;
        double v86 = (v27 - (double)(unint64_t)[v3 startNanoseconds]) / 1000000000.0;
        __int16 v87 = 2048;
        uint64_t v88 = [v3 startMachContinuousTime];
        __int16 v89 = 2048;
        uint64_t v90 = [v3 endMachContinuousTime];
        _os_log_impl(&dword_261964000, v13, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: fill non-diagnostic signposts: event middle %+.3fs - %+.3fs (%.3fs) @%llu-%llu", buf, 0x66u);

        goto LABEL_28;
      }
      if (!v14) {
        goto LABEL_34;
      }
      id v69 = [a1 workflow];
      uint64_t v43 = [v69 name];
      uint64_t v44 = [v3 name];
      double v45 = (double)(unint64_t)[v3 startNanoseconds];
      id v67 = [a1 eventStart];
      double v46 = (v45 - (double)(unint64_t)[v67 machContTimeNs]) / 1000000000.0;
      double v47 = (double)(unint64_t)[v3 endNanoseconds];
      int v63 = [a1 eventStart];
      double v48 = (v47 - (double)(unint64_t)[v63 machContTimeNs]) / 1000000000.0;
      double v49 = (double)(unint64_t)[v3 endNanoseconds];
      *(_DWORD *)buf = 138545410;
      BOOL v72 = v43;
      __int16 v73 = 2114;
      int v74 = v44;
      __int16 v75 = 2114;
      double v76 = *(double *)&v6;
      __int16 v77 = 2112;
      double v78 = *(double *)&v7;
      __int16 v79 = 2048;
      double v80 = v46;
      __int16 v81 = 2048;
      double v82 = v48;
      __int16 v83 = 2048;
      double v84 = (v49 - (double)(unint64_t)[v3 startNanoseconds]) / 1000000000.0;
      __int16 v85 = 2048;
      double v86 = COERCE_DOUBLE([v3 startMachContinuousTime]);
      __int16 v87 = 2048;
      uint64_t v88 = [v3 endMachContinuousTime];
      long long v50 = "%{public}@: %{public}@: %{public}@->%@: fill non-diagnostic signposts: event middle %+.3fs - %+.3fs (%.3fs) @%llu-%llu";
      double v51 = v13;
      uint32_t v52 = 92;
    }
    else
    {
      if (v12)
      {
        if (!v14) {
          goto LABEL_34;
        }
        id v69 = [a1 workflow];
        uint64_t v21 = [v69 name];
        BOOL v32 = [a1 eventIdentifier];
        SEL v33 = [v3 name];
        double v34 = (double)(unint64_t)[v3 startNanoseconds];
        id v66 = [a1 eventStart];
        double v35 = (v34 - (double)(unint64_t)[v66 machContTimeNs]) / 1000000000.0;
        double v36 = (double)(unint64_t)[v3 endNanoseconds];
        long long v62 = [a1 eventStart];
        double v37 = (v36 - (double)(unint64_t)[v62 machContTimeNs]) / 1000000000.0;
        double v38 = (double)(unint64_t)[v3 endNanoseconds];
        *(_DWORD *)buf = 138545154;
        BOOL v72 = v21;
        __int16 v73 = 2114;
        int v74 = v32;
        __int16 v75 = 2114;
        double v76 = *(double *)&v33;
        __int16 v77 = 2048;
        double v78 = v35;
        __int16 v79 = 2048;
        double v80 = v37;
        __int16 v81 = 2048;
        double v82 = (v38 - (double)(unint64_t)[v3 startNanoseconds]) / 1000000000.0;
        __int16 v83 = 2048;
        double v84 = COERCE_DOUBLE([v3 startMachContinuousTime]);
        __int16 v85 = 2048;
        double v86 = COERCE_DOUBLE([v3 endMachContinuousTime]);
        _os_log_impl(&dword_261964000, v13, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: fill non-diagnostic signposts: event middle %+.3fs - %+.3fs (%.3fs) @%llu-%llu", buf, 0x52u);

LABEL_27:
LABEL_28:

        goto LABEL_32;
      }
      if (!v14) {
        goto LABEL_34;
      }
      id v69 = [a1 workflow];
      uint64_t v43 = [v69 name];
      uint64_t v44 = [v3 name];
      double v54 = (double)(unint64_t)[v3 startNanoseconds];
      id v67 = [a1 eventStart];
      double v55 = (v54 - (double)(unint64_t)[v67 machContTimeNs]) / 1000000000.0;
      double v56 = (double)(unint64_t)[v3 endNanoseconds];
      int v63 = [a1 eventStart];
      double v57 = (v56 - (double)(unint64_t)[v63 machContTimeNs]) / 1000000000.0;
      double v58 = (double)(unint64_t)[v3 endNanoseconds];
      *(_DWORD *)buf = 138544898;
      BOOL v72 = v43;
      __int16 v73 = 2114;
      int v74 = v44;
      __int16 v75 = 2048;
      double v76 = v55;
      __int16 v77 = 2048;
      double v78 = v57;
      __int16 v79 = 2048;
      double v80 = (v58 - (double)(unint64_t)[v3 startNanoseconds]) / 1000000000.0;
      __int16 v81 = 2048;
      double v82 = COERCE_DOUBLE([v3 startMachContinuousTime]);
      __int16 v83 = 2048;
      double v84 = COERCE_DOUBLE([v3 endMachContinuousTime]);
      long long v50 = "%{public}@: %{public}@: fill non-diagnostic signposts: event middle %+.3fs - %+.3fs (%.3fs) @%llu-%llu";
      double v51 = v13;
      uint32_t v52 = 72;
    }
    _os_log_impl(&dword_261964000, v51, OS_LOG_TYPE_INFO, v50, buf, v52);

    goto LABEL_32;
  }
LABEL_36:
}

- (NSMutableDictionary)environment
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  if (self) {
    id Property = objc_getProperty(self, v3, 104, 1);
  }
  else {
    id Property = 0;
  }
  id v6 = Property;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [v11 environment];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __37__WRWorkflowEventTracker_environment__block_invoke;
        v14[3] = &unk_265589410;
        v14[4] = v11;
        id v15 = v4;
        [v12 enumerateKeysAndObjectsUsingBlock:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return (NSMutableDictionary *)v4;
}

void __37__WRWorkflowEventTracker_environment__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 alloc];
  uint64_t v9 = [*(id *)(a1 + 32) signpost];
  uint64_t v10 = [v9 name];
  id v11 = (id)[v8 initWithFormat:@"%@_%@", v10, v7];

  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v11];
}

- (id)diagnosticsExceedingThresholds
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (a1)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v2 = [a1 workflow];
    id v3 = [v2 workflowDiagnostics];

    uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v27 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v8 hasTriggerThresholdDurationSingle])
          {
            uint64_t v9 = [a1 eventEnd];
            if (v9)
            {
              uint64_t v10 = (void *)v9;
              uint64_t v11 = [a1 eventStart];
              if (v11)
              {
                uint64_t v12 = (void *)v11;
                int v13 = [a1 error];

                if (!v13)
                {
                  if ([v8 reportOmittingNetworkBoundIntervals])
                  {
                    [a1 stats];
                    double v14 = (double)0;
                  }
                  else
                  {
                    id v15 = [a1 eventEnd];
                    double v16 = (double)(unint64_t)[v15 machContTimeNs];
                    long long v17 = [a1 eventStart];
                    double v14 = v16 - (double)(unint64_t)[v17 machContTimeNs];
                  }
                  [v8 triggerThresholdDurationSingle];
                  if (v18 <= v14 / 1000000000.0)
                  {
                    id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
                    [v23 addObject:v8];
                    goto LABEL_27;
                  }
                }
              }
              else
              {
              }
            }
          }
          if ([v8 triggerEventTimeout])
          {
            long long v19 = [a1 error];
            uint64_t v20 = v19;
            if (v19)
            {
              uint64_t v21 = [v19 domain];
              if ([v21 isEqualToString:@"WorkflowResponsivenessError"])
              {
                uint64_t v22 = [v20 code];

                if (v22 == 4)
                {
                  id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
                  [v23 addObject:v8];

                  goto LABEL_27;
                }
              }
              else
              {
              }
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    id v23 = 0;
LABEL_27:

    double v24 = (void *)[v23 copy];
  }
  else
  {
    double v24 = 0;
  }

  return v24;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(WRWorkflowEventTracker *)self workflow];
  uint64_t v5 = [v4 debugDescription];
  uint64_t v6 = (void *)[v3 initWithFormat:@"Tracker for %@", v5];

  return v6;
}

+ (id)tailspinDirectory
{
  self;
  if (tailspinDirectory_onceToken != -1) {
    dispatch_once(&tailspinDirectory_onceToken, &__block_literal_global_215);
  }
  v0 = (void *)tailspinDirectory_url;

  return v0;
}

uint64_t __43__WRWorkflowEventTracker_tailspinDirectory__block_invoke()
{
  tailspinDirectory_url = [objc_alloc(NSURL) initFileURLWithPath:@"/private/var/db/WorkflowResponsiveness/Tailspins" isDirectory:1];

  return MEMORY[0x270F9A758]();
}

+ (void)makeTailspinDirectory
{
  self;
  if (makeTailspinDirectory_onceToken != -1)
  {
    dispatch_once(&makeTailspinDirectory_onceToken, &__block_literal_global_221);
  }
}

void __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke()
{
  v26[1] = *MEMORY[0x263EF8340];
  v0 = +[WRWorkflowEventTracker tailspinDirectory]();
  v1 = [v0 path];
  if (!v1)
  {
    int v7 = *__error();
    id v8 = _wrlog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_1();
    }
    goto LABEL_11;
  }
  id v2 = v0;
  uint64_t v3 = [v2 fileSystemRepresentation];
  if (!v3)
  {
    int v7 = *__error();
    id v8 = _wrlog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_2();
    }
    goto LABEL_11;
  }
  uint64_t v4 = (const char *)v3;
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  char v6 = [v5 fileExistsAtPath:v1];

  if ((v6 & 1) == 0)
  {
    if (geteuid())
    {
      int v7 = *__error();
      id v8 = _wrlog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_7();
      }
LABEL_11:

      *__error() = v7;
      goto LABEL_12;
    }
    uint64_t v25 = *MEMORY[0x263F08078];
    v26[0] = &unk_270D99AA8;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    uint64_t v10 = [MEMORY[0x263F08850] defaultManager];
    id v24 = 0;
    char v11 = [v10 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:v9 error:&v24];
    id v12 = v24;

    if (v11)
    {
      int v13 = open(v4, 0);
      if (v13 == -1)
      {
        int v21 = *__error();
        uint64_t v22 = _wrlog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_3();
        }

        *__error() = v21;
      }
      else
      {
        int v14 = v13;
        uint64_t v23 = 74245;
        int v15 = ffsctl(v13, 0xC0084A44uLL, &v23, 0);
        int v16 = *__error();
        long long v17 = _wrlog();
        double v18 = v17;
        if (v15)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
            __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_5();
          }
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_4();
        }

        *__error() = v16;
        close(v14);
      }
    }
    else
    {
      int v19 = *__error();
      uint64_t v20 = _wrlog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_6();
      }

      *__error() = v19;
    }
  }
LABEL_12:
}

+ (void)cleanupWorkflowResponsivenessDiagnosticsDirectory
{
  +[WRWorkflowEventTracker tailspinDirectory]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  +[WRWorkflowEventTracker cleanupDirectory:ofFilesWithSuffix:olderThan:](259200.0, (uint64_t)a1, v4, @"tailspin");
  uint64_t v3 = (void *)[objc_alloc(NSURL) initFileURLWithPath:@"/private/var/db/WorkflowResponsiveness" isDirectory:1];
  +[WRWorkflowEventTracker cleanupDirectory:ofFilesWithSuffix:olderThan:](259200.0, (uint64_t)a1, v3, @"tailspin");
}

+ (void)cleanupDirectory:(void *)a3 ofFilesWithSuffix:(void *)a4 olderThan:
{
  v72[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v50 = a4;
  self;
  int v7 = [v6 path];
  if (v7)
  {
    id v8 = [MEMORY[0x263F08850] defaultManager];
    if ([v8 fileExistsAtPath:v7])
    {
      uint64_t v53 = *MEMORY[0x263EFF6F0];
      uint64_t v54 = *MEMORY[0x263EFF750];
      v72[0] = *MEMORY[0x263EFF750];
      v72[1] = v53;
      uint64_t v9 = *MEMORY[0x263EFF610];
      v72[2] = *MEMORY[0x263EFF610];
      uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:3];
      char v11 = [v8 enumeratorAtURL:v6 includingPropertiesForKeys:v10 options:5 errorHandler:&__block_literal_global_233];

      if (v11)
      {
        double v49 = v8;
        double v47 = v7;
        id v48 = v6;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        double v46 = v11;
        id obj = v11;
        uint64_t v55 = [obj countByEnumeratingWithState:&v58 objects:v71 count:16];
        if (!v55) {
          goto LABEL_43;
        }
        uint64_t v52 = *(void *)v59;
        double v12 = -a1;
        while (1)
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v59 != v52) {
              objc_enumerationMutation(obj);
            }
            int v14 = *(void **)(*((void *)&v58 + 1) + 8 * v13);
            v70[0] = v54;
            v70[1] = v53;
            v70[2] = v9;
            int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:3];
            id v57 = 0;
            int v16 = [v14 resourceValuesForKeys:v15 error:&v57];
            id v17 = v57;

            double v18 = [v16 objectForKeyedSubscript:v54];
            int v19 = [v16 objectForKeyedSubscript:v53];
            uint64_t v20 = [v16 objectForKeyedSubscript:v9];
            int v21 = (void *)v20;
            if (v18) {
              BOOL v22 = v19 == 0;
            }
            else {
              BOOL v22 = 1;
            }
            if (v22 || v20 == 0)
            {
              int v24 = *__error();
              uint64_t v25 = _wrlog();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138413058;
                int v63 = v14;
                __int16 v64 = 2112;
                id v65 = v18;
                __int16 v66 = 2112;
                id v67 = v19;
                __int16 v68 = 2112;
                id v69 = v21;
                long long v26 = v25;
                long long v27 = "WR cleanup: Unable to get info about %@: filename:%@ isRegularFile:%@ creationDate:%@";
                uint32_t v28 = 42;
LABEL_19:
                _os_log_error_impl(&dword_261964000, v26, OS_LOG_TYPE_ERROR, v27, buf, v28);
              }
            }
            else
            {
              char v29 = [v19 BOOLValue];
              if (v29)
              {
                if ([v18 hasSuffix:v50])
                {
                  [v21 timeIntervalSinceNow];
                  double v31 = v30;
                  int v24 = *__error();
                  uint64_t v25 = _wrlog();
                  BOOL v32 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
                  if (v31 <= v12)
                  {
                    if (v32)
                    {
                      *(_DWORD *)buf = 138543618;
                      int v63 = v14;
                      __int16 v64 = 2114;
                      id v65 = v21;
                      _os_log_impl(&dword_261964000, v25, OS_LOG_TYPE_INFO, "WR cleanup: %{public}@ created at %{public}@, removing", buf, 0x16u);
                    }

                    *__error() = v24;
                    id v56 = 0;
                    char v37 = [v49 removeItemAtURL:v14 error:&v56];
                    id v38 = v56;
                    id v17 = v38;
                    if ((v37 & 1) == 0)
                    {
                      int v24 = *__error();
                      uint64_t v25 = _wrlog();
                      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_38;
                      }
                      *(_DWORD *)buf = 138543618;
                      int v63 = v14;
                      __int16 v64 = 2114;
                      id v65 = v17;
                      long long v26 = v25;
                      long long v27 = "Unable to remove %{public}@: %{public}@";
                      uint32_t v28 = 22;
                      goto LABEL_19;
                    }
                    if (!v38) {
                      goto LABEL_39;
                    }
                    int v24 = *__error();
                    uint64_t v25 = _wrlog();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138543618;
                      int v63 = v14;
                      __int16 v64 = 2114;
                      id v65 = v17;
                      SEL v33 = v25;
                      double v34 = "Removed %{public}@ successfully, but received error: %{public}@";
                      goto LABEL_36;
                    }
                  }
                  else if (v32)
                  {
                    *(_DWORD *)buf = 138543618;
                    int v63 = v14;
                    __int16 v64 = 2114;
                    id v65 = v21;
                    SEL v33 = v25;
                    double v34 = "WR cleanup: %{public}@ created at %{public}@, skipping";
LABEL_36:
                    _os_log_impl(&dword_261964000, v33, OS_LOG_TYPE_INFO, v34, buf, 0x16u);
                  }
                }
                else
                {
                  int v24 = *__error();
                  uint64_t v25 = _wrlog();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    int v63 = v14;
                    double v35 = v25;
                    double v36 = "WR cleanup: %@ is not a tailspin file";
                    goto LABEL_29;
                  }
                }
              }
              else
              {
                int v24 = *__error();
                uint64_t v25 = _wrlog();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  int v63 = v14;
                  double v35 = v25;
                  double v36 = "WR cleanup: %@ is not a regular file";
LABEL_29:
                  _os_log_debug_impl(&dword_261964000, v35, OS_LOG_TYPE_DEBUG, v36, buf, 0xCu);
                }
              }
            }
LABEL_38:

            *__error() = v24;
LABEL_39:

            ++v13;
          }
          while (v55 != v13);
          uint64_t v39 = [obj countByEnumeratingWithState:&v58 objects:v71 count:16];
          uint64_t v55 = v39;
          if (!v39)
          {
LABEL_43:

            int v7 = v47;
            id v6 = v48;
            id v8 = v49;
            char v11 = v46;
            goto LABEL_53;
          }
        }
      }
      int v44 = *__error();
      double v45 = _wrlog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
        +[WRWorkflowEventTracker cleanupDirectory:ofFilesWithSuffix:olderThan:]();
      }

      *__error() = v44;
LABEL_53:
    }
    else
    {
      int v42 = *__error();
      uint64_t v43 = _wrlog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
        +[WRWorkflowEventTracker cleanupDirectory:ofFilesWithSuffix:olderThan:](v43);
      }

      *__error() = v42;
    }
  }
  else
  {
    int v40 = *__error();
    BOOL v41 = _wrlog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
      +[WRWorkflowEventTracker cleanupDirectory:ofFilesWithSuffix:olderThan:]();
    }

    *__error() = v40;
  }
}

uint64_t __71__WRWorkflowEventTracker_cleanupDirectory_ofFilesWithSuffix_olderThan___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = *__error();
  int v7 = _wrlog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __71__WRWorkflowEventTracker_cleanupDirectory_ofFilesWithSuffix_olderThan___block_invoke_cold_1();
  }

  *__error() = v6;
  return 1;
}

- (id)encodedDict
{
  v56[16] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v4 = [(WRWorkflowEventTracker *)self workflow];
  id v5 = [v4 encodedDict];
  *(void *)&long long v51 = @"wt_workflow";
  *((void *)&v51 + 1) = 0;
  int v6 = (void *)[v3 initWithObjectsAndKeys:v5];

  int v7 = [(WRWorkflowEventTracker *)self startSignpost];
  id v8 = [v7 name];
  [v6 setObject:v8 forKeyedSubscript:@"wt_signpost_start"];

  uint64_t v9 = [(WRWorkflowEventTracker *)self endSignpost];
  uint64_t v10 = [v9 name];
  [v6 setObject:v10 forKeyedSubscript:@"wt_signpost_end"];

  char v11 = [(WRWorkflowEventTracker *)self error];

  if (v11)
  {
    double v12 = [(WRWorkflowEventTracker *)self error];
    uint64_t v13 = [v12 domain];
    char v14 = [v13 isEqualToString:@"WorkflowResponsivenessError"];

    if ((v14 & 1) == 0)
    {
      int v15 = [(WRWorkflowEventTracker *)self workflow];
      [v15 name];

      [(WRWorkflowEventTracker *)self eventIdentifier];
      int v16 = [(WRWorkflowEventTracker *)self eventIdentifier];

      int v17 = *__error();
      double v18 = _wrlog();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_FAULT);
      if (v16)
      {
        if (v19) {
          -[WRWorkflowEventTracker encodedDict]((uint64_t)self, (uint64_t)v18, v20, v21, v22, v23, v24, v25, v51, v52, *((uint64_t *)&v52 + 1), v53, *((uint64_t *)&v53 + 1), v54, *((uint64_t *)&v54 + 1), v55, *((uint64_t *)&v55 + 1), v56[0], v56[1],
        }
            v56[2],
            v56[3]);
      }
      else if (v19)
      {
        -[WRWorkflowEventTracker encodedDict]();
      }

      *__error() = v17;
    }
    long long v26 = NSNumber;
    long long v27 = [(WRWorkflowEventTracker *)self error];
    uint32_t v28 = objc_msgSend(v26, "numberWithInteger:", objc_msgSend(v27, "code"));
    [v6 setObject:v28 forKeyedSubscript:@"wt_error_code"];

    char v29 = [(WRWorkflowEventTracker *)self error];
    double v30 = [v29 userInfo];
    double v31 = [v30 objectForKeyedSubscript:*MEMORY[0x263F07F80]];
    [v6 setObject:v31 forKeyedSubscript:@"wt_error_description"];
  }
  BOOL v32 = [(WRWorkflowEventTracker *)self eventStart];
  SEL v33 = -[WRTimestampAndThread encodedDict](v32);
  [v6 setObject:v33 forKeyedSubscript:@"wt_event_start"];

  double v34 = [(WRWorkflowEventTracker *)self eventEnd];
  double v35 = -[WRTimestampAndThread encodedDict](v34);
  [v6 setObject:v35 forKeyedSubscript:@"wt_event_end"];

  double v36 = [(WRWorkflowEventTracker *)self eventIdentifier];
  [v6 setObject:v36 forKeyedSubscript:@"wt_event_identifier"];

  id v37 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v38 = [(WRWorkflowEventTracker *)self allSignpostTrackers];
  uint64_t v39 = [v38 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v53 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v43 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        int v44 = [v43 signpost];
        double v45 = [v44 name];

        id v46 = [v37 objectForKeyedSubscript:v45];
        if (!v46)
        {
          id v46 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v37 setObject:v46 forKeyedSubscript:v45];
        }
        double v47 = -[WRSignpostTracker encodedDict](v43);
        [v46 addObject:v47];
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v40);
  }

  id v48 = (void *)[v37 copy];
  [v6 setObject:v48 forKeyedSubscript:@"wt_signpost_trackers"];

  double v49 = (void *)[v6 copy];

  return v49;
}

- (WRWorkflowEventTracker)initWithEncodedDict:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v94 = 0;
  if (a4) {
    *a4 = 0;
  }
  else {
    a4 = (id *)&v94;
  }
  v93.receiver = self;
  v93.super_class = (Class)WRWorkflowEventTracker;
  uint64_t v13 = [(WRWorkflowEventTracker *)&v93 init];
  if (v13)
  {
    uint64_t v20 = DictGetDict(v6, @"wt_workflow", a4);
    if (!v20)
    {
      if (*a4)
      {
        double v30 = 0;
      }
      else
      {
        WRMakeError(7, @"No workflow in tracker dict %@", v14, v15, v16, v17, v18, v19, (uint64_t)v6);
        double v30 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_55;
    }
    long long v27 = [[WRWorkflow alloc] initWithEncodedDict:v20 error:a4];
    if (!v27)
    {
      if (*a4)
      {
        double v30 = 0;
      }
      else
      {
        WRMakeError(3, @"No such workflow, or workflow disabled", v21, v22, v23, v24, v25, v26, v78);
        double v30 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_54;
    }
    objc_storeStrong((id *)&v13->_workflow, v27);
    uint64_t v28 = DictGetNumber(v6, @"wt_error_code", a4);
    char v29 = (void *)v28;
    if (*a4)
    {
      double v30 = 0;
LABEL_53:

LABEL_54:
LABEL_55:

      goto LABEL_56;
    }
    if (v28)
    {
      double v31 = DictGetString(v6, @"wt_error_description", a4);
      if (*a4)
      {
LABEL_18:
        double v30 = 0;
LABEL_52:

        goto LABEL_53;
      }
      uint64_t v32 = [v29 integerValue];
      uint64_t v39 = WRMakeError(v32, @"%@", v33, v34, v35, v36, v37, v38, (uint64_t)v31);
      error = v13->_error;
      v13->_error = (NSError *)v39;
    }
    uint64_t v41 = DictGetString(v6, @"wt_signpost_start", a4);
    double v31 = v41;
    if (*a4) {
      goto LABEL_18;
    }
    if (v41)
    {
      uint64_t v42 = -[WRWorkflow wrsignpostWithName:](v27, v41);
      startSignpost = v13->_startSignpost;
      v13->_startSignpost = (WRSignpost *)v42;

      if (!v13->_startSignpost)
      {
        double v45 = [(WRWorkflow *)v27 name];
        WRMakeError(7, @"Workflow %@ start signpost %@ doesn't exist", v50, v51, v52, v53, v54, v55, (uint64_t)v45);
        double v30 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_51;
      }
    }
    int v44 = DictGetString(v6, @"wt_signpost_end", a4);
    double v45 = v44;
    if (*a4)
    {
      double v30 = 0;
LABEL_51:

      goto LABEL_52;
    }
    if (v44
      && (-[WRWorkflow wrsignpostWithName:](v27, v44),
          uint64_t v46 = objc_claimAutoreleasedReturnValue(),
          endSignpost = v13->_endSignpost,
          v13->_endSignpost = (WRSignpost *)v46,
          endSignpost,
          !v13->_endSignpost))
    {
      double v49 = [(WRWorkflow *)v27 name];
      WRMakeError(7, @"Workflow %@ end signpost %@ doesn't exist", v59, v60, v61, v62, v63, v64, (uint64_t)v49);
      double v30 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v48 = DictGetDict(v6, @"wt_event_start", a4);
      double v49 = v48;
      if (!*a4)
      {
        if (!v48
          || (id v56 = -[WRTimestampAndThread initWithEncodedDict:error:]((id *)[WRTimestampAndThread alloc], v48, (uint64_t *)a4), eventStart = v13->_eventStart, v13->_eventStart = (WRTimestampAndThread *)v56, eventStart, v13->_eventStart))
        {
          long long v58 = DictGetDict(v6, @"wt_event_end", a4);
          if (!*a4)
          {
            id v65 = v58;
            if (!v58
              || (__int16 v66 = -[WRTimestampAndThread initWithEncodedDict:error:]((id *)[WRTimestampAndThread alloc], v58, (uint64_t *)a4), eventEnd = v13->_eventEnd, v13->_eventEnd = (WRTimestampAndThread *)v66, eventEnd, v13->_eventEnd))
            {
              id v82 = v65;
              uint64_t v68 = DictGetString(v6, @"wt_event_identifier", a4);
              eventIdentifier = v13->_eventIdentifier;
              v13->_eventIdentifier = (NSString *)v68;

              if (*a4)
              {
                double v30 = 0;
              }
              else
              {
                __int16 v81 = DictGetDict(v6, @"wt_signpost_trackers", a4);
                if (v81)
                {
                  uint64_t v87 = 0;
                  uint64_t v88 = &v87;
                  uint64_t v89 = 0x3032000000;
                  uint64_t v90 = __Block_byref_object_copy_;
                  uint64_t v91 = __Block_byref_object_dispose_;
                  id v92 = 0;
                  id obj = objc_alloc_init(MEMORY[0x263EFF980]);
                  v83[0] = MEMORY[0x263EF8330];
                  v83[1] = 3221225472;
                  v83[2] = __52__WRWorkflowEventTracker_initWithEncodedDict_error___block_invoke;
                  v83[3] = &unk_265589478;
                  double v86 = &v87;
                  double v84 = v27;
                  id v79 = obj;
                  id v85 = v79;
                  [v81 enumerateKeysAndObjectsUsingBlock:v83];
                  double v76 = (void *)v88[5];
                  if (v76)
                  {
                    double v30 = 0;
                    *a4 = v76;
                  }
                  else
                  {
                    objc_storeStrong((id *)&v13->_allSignpostTrackersMutable, obj);
                    double v30 = v13;
                  }

                  _Block_object_dispose(&v87, 8);
                }
                else if (*a4)
                {
                  WRMakeError(7, @"WRWorkflowEventTracker: No signpost trackers in dict", v70, v71, v72, v73, v74, v75, v78);
                  double v30 = 0;
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  double v30 = 0;
                }
              }
              long long v58 = v82;
              goto LABEL_49;
            }
            long long v58 = v65;
          }
          double v30 = 0;
LABEL_49:

          goto LABEL_50;
        }
      }
      double v30 = 0;
    }
LABEL_50:

    goto LABEL_51;
  }
  WRMakeError(2, @"Unable to init WRWorkflowEventTracker", v7, v8, v9, v10, v11, v12, v78);
  double v30 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:

  return v30;
}

void __52__WRWorkflowEventTracker_initWithEncodedDict_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v9 = -[WRWorkflow wrsignpostWithName:](*(void **)(a1 + 32), v7);
    if (v9)
    {
      double v49 = a4;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v52;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v52 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              ClassName = object_getClassName(v15);
              uint64_t v46 = WRMakeError(6, @"Invalid type in signpostTrackerDicts (%s)", v40, v41, v42, v43, v44, v45, (uint64_t)ClassName);
              uint64_t v47 = *(void *)(*(void *)(a1 + 48) + 8);
              id v48 = *(void **)(v47 + 40);
              *(void *)(v47 + 40) = v46;

LABEL_17:
              *double v49 = 1;
              goto LABEL_18;
            }
            uint64_t v16 = [WRSignpostTracker alloc];
            uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
            id obj = *(id *)(v17 + 40);
            uint64_t v18 = -[WRSignpostTracker initWithEncodedDict:signpost:error:](v16, v15, v9, (uint64_t *)&obj);
            objc_storeStrong((id *)(v17 + 40), obj);
            if (!v18) {
              goto LABEL_17;
            }
            [*(id *)(a1 + 40) addObject:v18];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v51 objects:v55 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_18:
    }
    else
    {
      char v29 = [*(id *)(a1 + 32) name];
      uint64_t v36 = WRMakeError(7, @"Workflow %@ signpost %@ doesn't exist", v30, v31, v32, v33, v34, v35, (uint64_t)v29);
      uint64_t v37 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v38 = *(void **)(v37 + 40);
      *(void *)(v37 + 40) = v36;

      *a4 = 1;
    }
  }
  else
  {
    uint64_t v19 = object_getClassName(v7);
    object_getClassName(v8);
    uint64_t v26 = WRMakeError(6, @"Invalid type in signpostTrackerDicts (%s -> %s)", v20, v21, v22, v23, v24, v25, (uint64_t)v19);
    uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;

    *a4 = 1;
  }
}

- (WRWorkflowEventTracker)initWithTailspin:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v67 = 0;
  if (a4) {
    *a4 = 0;
  }
  else {
    a4 = (id *)&v67;
  }
  id v7 = v6;
  if ([v7 UTF8String])
  {
    uint64_t v61 = 0;
    uint64_t v62 = &v61;
    uint64_t v63 = 0x3032000000;
    uint64_t v64 = __Block_byref_object_copy_;
    id v65 = __Block_byref_object_dispose_;
    id v66 = 0;
    if (ktrace_file_open())
    {
      v60[1] = (id)MEMORY[0x263EF8330];
      v60[2] = (id)3221225472;
      v60[3] = __49__WRWorkflowEventTracker_initWithTailspin_error___block_invoke;
      v60[4] = &unk_2655894A0;
      v60[5] = &v61;
      int v14 = ktrace_file_iterate();
      ktrace_file_close();
      if (!v14)
      {
        uint64_t v36 = v62[5];
        if (v36)
        {
          v60[0] = 0;
          self = [(WRWorkflowEventTracker *)self initWithEncodedString:v36 error:v60];
          id v42 = v60[0];
          if (self)
          {
            uint64_t v43 = [(WRWorkflowEventTracker *)self workflow];
            uint64_t v44 = [v43 allowListForDiagnostics];
            uint64_t v45 = [(WRWorkflowEventTracker *)self workflow];
            uint64_t v46 = [v45 allowListForAllSignposts];

            if (v44 == v46)
            {
              uint64_t v28 = self;
            }
            else
            {
              id v47 = objc_alloc_init(MEMORY[0x263F6C5A8]);
              id v48 = [(WRWorkflowEventTracker *)self workflow];
              double v49 = [v48 allowListForAllSignposts];
              [v47 setSubsystemCategoryFilter:v49];
              id v57 = v42;

              v58[0] = MEMORY[0x263EF8330];
              v58[1] = 3221225472;
              v58[2] = __49__WRWorkflowEventTracker_initWithTailspin_error___block_invoke_2;
              v58[3] = &unk_2655894C8;
              uint64_t v50 = self;
              uint64_t v59 = v50;
              long long v51 = (void *)MEMORY[0x263E46C40](v58);
              [v47 setBeginEventProcessingBlock:v51];
              [v47 setEmitEventProcessingBlock:v51];
              [v47 setIntervalCompletionProcessingBlock:v51];
              long long v52 = [(WRWorkflowEventTracker *)v50 eventStart];
              long long v53 = [v52 date];
              long long v54 = [(WRWorkflowEventTracker *)v50 eventEnd];
              uint64_t v55 = [v54 date];
              char v56 = [v47 processTraceFileWithPath:v7 startDate:v53 endDate:v55 errorOut:a4];

              if (v56) {
                uint64_t v28 = v50;
              }
              else {
                uint64_t v28 = 0;
              }
              id v42 = v57;
            }
          }
          else
          {
            WRMakeErrorWithUnderlyingError(6, v42, @"Tailspin %@ is not a Workflow Responsiveness tailspin", v37, v38, v39, v40, v41, (uint64_t)v7);
            uint64_t v28 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          WRMakeError(7, @"No reason string in tailspin file %@", 0, v15, v16, v17, v18, v19, (uint64_t)v7);
          uint64_t v28 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_11;
      }
      id v20 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v21 = (void *)[v20 initWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
      uint64_t v27 = WRMakeErrorWithUnderlyingError(2, v21, @"Error iterating over tailspin file %@", v22, v23, v24, v25, v26, (uint64_t)v7);
    }
    else
    {
      id v29 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v21 = (void *)[v29 initWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
      uint64_t v27 = WRMakeErrorWithUnderlyingError(2, v21, @"Could not open tailspin file %@", v30, v31, v32, v33, v34, (uint64_t)v7);
    }
    *a4 = v27;

    uint64_t v28 = 0;
LABEL_11:
    _Block_object_dispose(&v61, 8);

    goto LABEL_12;
  }
  WRMakeError(2, @"Unable to get uft8 string from %@", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
  uint64_t v28 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v28;
}

uint64_t __49__WRWorkflowEventTracker_initWithTailspin_error___block_invoke(uint64_t a1)
{
  int v2 = ktrace_chunk_tag();
  unsigned int v3 = ktrace_chunk_version_major();
  if (ktrace_config_create())
  {
    uint64_t reason = ktrace_config_get_reason();
    if (reason)
    {
      uint64_t v5 = [NSString stringWithUTF8String:reason];
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
LABEL_8:

      return 0;
    }
    ktrace_config_destroy();
  }
  uint64_t result = 1;
  if (v2 == 36867 && v3 <= 1)
  {
    uint64_t v9 = ktrace_chunk_size();
    id v7 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:ktrace_chunk_map_data() length:v9 freeWhenDone:0];
    uint64_t v10 = [MEMORY[0x263F08AC0] propertyListWithData:v7 options:0 format:0 error:0];
    uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F8C838]];
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    ktrace_chunk_unmap_data();
    goto LABEL_8;
  }
  return result;
}

uint64_t __49__WRWorkflowEventTracker_initWithTailspin_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workflow];
  uint64_t v5 = [v4 allowListForDiagnostics];
  uint64_t v6 = [v3 subsystem];
  id v7 = [v3 category];
  char v8 = [v5 passesSubsystem:v6 category:v7];

  if ((v8 & 1) == 0) {
    -[WRWorkflowEventTracker fillInNonDiagnosticSignpost:](*(void **)(a1 + 32), v3);
  }

  return 1;
}

- (WRWorkflowEventTracker)initWithSpindump:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v76 = 0;
  if (a4) {
    *a4 = 0;
  }
  else {
    a4 = (id *)&v76;
  }
  id v7 = v6;
  char v8 = (const char *)[v7 UTF8String];
  if (!v8)
  {
    WRMakeError(2, @"Unable to get uft8 string from %@", v9, v10, v11, v12, v13, v14, (uint64_t)v7);
    uint64_t v28 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  int v15 = open(v8, 0);
  if (v15 == -1)
  {
    id v29 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v30 = (void *)[v29 initWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    WRMakeErrorWithUnderlyingError(7, v30, @"Unable to open %@", v31, v32, v33, v34, v35, (uint64_t)v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_23;
  }
  int v16 = v15;
  uint64_t v17 = fdopen(v15, "r");
  if (!v17)
  {
    id v36 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v37 = (void *)[v36 initWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    WRMakeErrorWithUnderlyingError(7, v37, @"Unable to fdopen %@", v38, v39, v40, v41, v42, (uint64_t)v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    close(v16);
    goto LABEL_23;
  }
  uint64_t v18 = v17;
  uint64_t v19 = malloc_type_malloc(0x800uLL, 0x1FB95B5AuLL);
  do
  {
    if (!fgets((char *)v19, 2048, v18))
    {
      free(v19);
      WRMakeError(7, @"Spindump has no custom output", v43, v44, v45, v46, v47, v48, v74);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
  }
  while (strncmp("Custom Output:", (const char *)v19, 0xEuLL));
  free(v19);
  uint64_t v20 = MEMORY[0x263E468F0](v18);
  memset(&v75, 0, sizeof(v75));
  if (fstat(v16, &v75))
  {
    id v21 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v22 = (void *)[v21 initWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    WRMakeErrorWithUnderlyingError(7, v22, @"Unable to fstat %@", v23, v24, v25, v26, v27, (uint64_t)v7);
    goto LABEL_21;
  }
  size_t v49 = v75.st_size - v20;
  if (v75.st_size <= v20)
  {
    id v60 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v22 = (void *)[v60 initWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    WRMakeErrorWithUnderlyingError(7, v22, @"Spindump custom output is empty", v61, v62, v63, v64, v65, v74);
LABEL_21:
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_22:
    fclose(v18);
    goto LABEL_23;
  }
  uint64_t v50 = malloc_type_malloc(v75.st_size - v20, 0x1C764EAFuLL);
  if (!v50)
  {
    id v67 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v68 = (void *)[v67 initWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    WRMakeErrorWithUnderlyingError(2, v68, @"Unable to malloc %lu buffer", v69, v70, v71, v72, v73, v49);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  long long v51 = v50;
  size_t v52 = fread(v50, v49, 1uLL, v18);
  fclose(v18);
  if (v52 == 1)
  {
    uint64_t v59 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v51 length:v49 freeWhenDone:1];
    self = -[WRWorkflowEventTracker initWithEncodedData:error:](self, (uint64_t)v59, a4);

    uint64_t v28 = self;
    goto LABEL_24;
  }
  WRMakeError(2, @"Unable to fread custom output from %@", v53, v54, v55, v56, v57, v58, (uint64_t)v7);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  free(v51);
LABEL_23:
  uint64_t v28 = 0;
LABEL_24:

  return v28;
}

- (void)initWithEncodedData:(void *)a3 error:
{
  if (!a1) {
    return 0;
  }
  id v4 = a1;
  uint64_t v11 = [MEMORY[0x263F08900] JSONObjectWithData:a2 options:0 error:0];
  if (v11)
  {
    id v22 = 0;
    id v4 = (void *)[v4 initWithEncodedDict:v11 error:&v22];
    id v17 = v22;
    if (v4)
    {
      id v18 = v4;
    }
    else if (a3)
    {
      WRMakeErrorWithUnderlyingError(6, v17, @"Encoded string does not contain a workflow event", v12, v13, v14, v15, v16, v21);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v19 = v4;
  }
  else if (a3)
  {
    WRMakeError(6, @"String is not an encoded dictionary", v5, v6, v7, v8, v9, v10, v21);
    uint64_t v19 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (id)encodedStringWithError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  id v4 = [(WRWorkflowEventTracker *)self encodedDict];
  uint64_t v11 = [MEMORY[0x263F08900] dataWithJSONObject:v4 options:3 error:a3];
  if (v11)
  {
    uint64_t v12 = (void *)[[NSString alloc] initWithData:v11 encoding:4];
    uint64_t v19 = v12;
    if (v12)
    {
      id v20 = v12;
    }
    else if (a3)
    {
      WRMakeError(2, @"Failed to create encoded string, unable to create UTF8 string from JSON data (%@)\n", v13, v14, v15, v16, v17, v18, (uint64_t)v4);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a3 && !*a3)
  {
    WRMakeError(2, @"Failed to create encoded string, unable to serialize into JSON (%@)\n", v5, v6, v7, v8, v9, v10, (uint64_t)v4);
    uint64_t v19 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (WRWorkflowEventTracker)initWithEncodedString:(id)a3 error:(id *)a4
{
  uint64_t v12 = [a3 dataUsingEncoding:4];
  if (v12)
  {
    self = -[WRWorkflowEventTracker initWithEncodedData:error:](self, (uint64_t)v12, a4);
    uint64_t v13 = self;
  }
  else if (a4)
  {
    WRMakeError(2, @"Unable to create data with encoded string", v6, v7, v8, v9, v10, v11, v15);
    uint64_t v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (BOOL)gatherDiagnosticsIfNeeded
{
  uint64_t v202 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(WRWorkflowEventTracker *)self eventStart];
  if (!v3) {
    goto LABEL_8;
  }
  id v4 = (void *)v3;
  uint64_t v5 = [(WRWorkflowEventTracker *)self startSignpost];
  if (!v5)
  {
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = [(WRWorkflowEventTracker *)self eventEnd];
  if (!v7)
  {

    goto LABEL_7;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = [(WRWorkflowEventTracker *)self error];
  if (v9)
  {

    goto LABEL_16;
  }
  uint64_t v17 = [(WRWorkflowEventTracker *)self endSignpost];

  if (!v17)
  {
LABEL_8:
    uint64_t v10 = [(WRWorkflowEventTracker *)self workflow];
    [v10 name];

    [(WRWorkflowEventTracker *)self eventIdentifier];
    uint64_t v11 = [(WRWorkflowEventTracker *)self eventIdentifier];

    int v12 = *__error();
    uint64_t v13 = _wrlog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_FAULT);
    if (v11)
    {
      if (v14) {
        -[WRWorkflowEventTracker gatherDiagnosticsIfNeeded]();
      }
    }
    else if (v14)
    {
      [(WRWorkflowEventTracker *)self gatherDiagnosticsIfNeeded];
    }
    goto LABEL_13;
  }
LABEL_16:
  uint64_t v18 = [(WRWorkflowEventTracker *)self workflow];
  uint64_t v19 = [v18 workflowDiagnostics];
  uint64_t v20 = [v19 count];

  if (v20) {
    goto LABEL_29;
  }
  long long v186 = 0u;
  long long v187 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  uint64_t v21 = [(WRWorkflowEventTracker *)self workflow];
  id v22 = [v21 allSignposts];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v184 objects:v201 count:16];
  if (!v23)
  {
LABEL_25:

    id v29 = [(WRWorkflowEventTracker *)self workflow];
    [v29 name];

    [(WRWorkflowEventTracker *)self eventIdentifier];
    uint64_t v30 = [(WRWorkflowEventTracker *)self eventIdentifier];

    int v12 = *__error();
    uint64_t v13 = _wrlog();
    BOOL v31 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v30)
    {
      if (v31) {
        -[WRWorkflowEventTracker gatherDiagnosticsIfNeeded].cold.4();
      }
    }
    else if (v31)
    {
      -[WRWorkflowEventTracker gatherDiagnosticsIfNeeded](self);
    }
LABEL_13:

    char v15 = 0;
    *__error() = v12;
    return v15;
  }
  uint64_t v24 = v23;
  uint64_t v25 = *(void *)v185;
LABEL_19:
  uint64_t v26 = 0;
  while (1)
  {
    if (*(void *)v185 != v25) {
      objc_enumerationMutation(v22);
    }
    uint64_t v27 = [*(id *)(*((void *)&v184 + 1) + 8 * v26) diagnostics];
    uint64_t v28 = [v27 count];

    if (v28) {
      break;
    }
    if (v24 == ++v26)
    {
      uint64_t v24 = [v22 countByEnumeratingWithState:&v184 objects:v201 count:16];
      if (!v24) {
        goto LABEL_25;
      }
      goto LABEL_19;
    }
  }

LABEL_29:
  id v32 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v180 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  long long v183 = 0u;
  uint64_t v33 = [(WRWorkflowEventTracker *)self allSignpostTrackers];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v180 objects:v200 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v181;
    uint64_t v147 = *(void *)v181;
    do
    {
      uint64_t v36 = 0;
      id obj = (id)v34;
      do
      {
        if (*(void *)v181 != v35) {
          objc_enumerationMutation(v33);
        }
        uint64_t v37 = *(void **)(*((void *)&v180 + 1) + 8 * v36);
        long long v176 = 0u;
        long long v177 = 0u;
        long long v178 = 0u;
        long long v179 = 0u;
        uint64_t v150 = v36;
        unint64_t v152 = v37;
        uint64_t v38 = objc_msgSend(v37, "emits", v146);
        uint64_t v39 = [v38 countByEnumeratingWithState:&v176 objects:v199 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v177;
          do
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v177 != v41) {
                objc_enumerationMutation(v38);
              }
              uint64_t v43 = *(void **)(*((void *)&v176 + 1) + 8 * i);
              uint64_t v44 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v43, "pid"));
              if (([v32 containsObject:v44] & 1) == 0)
              {
                if (WRProcessIsBeingDebugged([v43 pid]))
                {
                  unint64_t v154 = v38;
                  __int16 v77 = v33;
                  uint64_t v78 = [(WRWorkflowEventTracker *)self workflow];
                  [v78 name];

                  [(WRWorkflowEventTracker *)self eventIdentifier];
                  id v79 = [(WRWorkflowEventTracker *)self eventIdentifier];

                  int v80 = *__error();
                  __int16 v81 = _wrlog();
                  BOOL v82 = os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
                  if (v79)
                  {
                    if (v82)
                    {
                      __int16 v83 = [(WRWorkflowEventTracker *)self workflow];
                      double v84 = [v83 name];
                      id v85 = [(WRWorkflowEventTracker *)self eventIdentifier];
                      int v86 = [v43 pid];
                      *(_DWORD *)buf = 138543874;
                      v194 = v84;
                      __int16 v195 = 2114;
                      double v196 = v85;
                      __int16 v197 = 1024;
                      int v198 = v86;
                      _os_log_impl(&dword_261964000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@<%{public}@>: Process [%d] is being debugged, not saving diagnostics", buf, 0x1Cu);
                    }
                  }
                  else if (v82)
                  {
                    uint64_t v87 = [(WRWorkflowEventTracker *)self workflow];
                    uint64_t v88 = [v87 name];
                    int v89 = [v43 pid];
                    *(_DWORD *)buf = 138543618;
                    v194 = v88;
                    __int16 v195 = 1024;
                    LODWORD(v196) = v89;
                    _os_log_impl(&dword_261964000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@: Process [%d] is being debugged, not saving diagnostics", buf, 0x12u);
                  }
                  goto LABEL_151;
                }
                [v32 addObject:v44];
              }
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v176 objects:v199 count:16];
          }
          while (v40);
        }
        unint64_t v146 = v33;

        long long v174 = 0u;
        long long v175 = 0u;
        long long v172 = 0u;
        long long v173 = 0u;
        uint64_t v45 = [v152 intervals];
        uint64_t v46 = [v45 countByEnumeratingWithState:&v172 objects:v192 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v173;
          unint64_t v154 = v45;
          do
          {
            for (uint64_t j = 0; j != v47; ++j)
            {
              if (*(void *)v173 != v48) {
                objc_enumerationMutation(v45);
              }
              uint64_t v50 = *(void **)(*((void *)&v172 + 1) + 8 * j);
              long long v51 = NSNumber;
              size_t v52 = objc_msgSend(v50, "start", v146);
              uint64_t v44 = objc_msgSend(v51, "numberWithInt:", objc_msgSend(v52, "pid"));

              if (([v32 containsObject:v44] & 1) == 0)
              {
                uint64_t v53 = [v50 start];
                int IsBeingDebugged = WRProcessIsBeingDebugged([v53 pid]);

                if (IsBeingDebugged)
                {
                  v95 = [(WRWorkflowEventTracker *)self workflow];
                  [v95 name];

                  [(WRWorkflowEventTracker *)self eventIdentifier];
                  id v96 = [(WRWorkflowEventTracker *)self eventIdentifier];

                  int v80 = *__error();
                  __int16 v81 = _wrlog();
                  BOOL v97 = os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
                  if (v96)
                  {
                    if (!v97) {
                      goto LABEL_150;
                    }
                    SEL v98 = [(WRWorkflowEventTracker *)self workflow];
                    SEL v99 = [v98 name];
                    v100 = [(WRWorkflowEventTracker *)self eventIdentifier];
                    uint64_t v101 = [v50 start];
                    int v102 = [v101 pid];
                    *(_DWORD *)buf = 138543874;
                    v194 = v99;
                    __int16 v195 = 2114;
                    double v196 = v100;
                    __int16 v197 = 1024;
                    int v198 = v102;
LABEL_99:
                    _os_log_impl(&dword_261964000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@<%{public}@>: Process [%d] is being debugged, not saving diagnostics", buf, 0x1Cu);

                    goto LABEL_150;
                  }
                  if (!v97) {
                    goto LABEL_150;
                  }
                  long long v138 = [(WRWorkflowEventTracker *)self workflow];
                  BOOL v139 = [v138 name];
                  long long v140 = [v50 start];
                  int v141 = [v140 pid];
                  *(_DWORD *)buf = 138543618;
                  v194 = v139;
                  __int16 v195 = 1024;
                  LODWORD(v196) = v141;
LABEL_143:
                  _os_log_impl(&dword_261964000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@: Process [%d] is being debugged, not saving diagnostics", buf, 0x12u);

                  goto LABEL_149;
                }
                [v32 addObject:v44];
              }

              uint64_t v55 = NSNumber;
              uint64_t v56 = [v50 end];
              uint64_t v44 = objc_msgSend(v55, "numberWithInt:", objc_msgSend(v56, "pid"));

              if (([v32 containsObject:v44] & 1) == 0)
              {
                uint64_t v57 = [v50 end];
                int v58 = WRProcessIsBeingDebugged([v57 pid]);

                if (v58)
                {
                  uint64_t v103 = [(WRWorkflowEventTracker *)self workflow];
                  [v103 name];

                  [(WRWorkflowEventTracker *)self eventIdentifier];
                  v104 = [(WRWorkflowEventTracker *)self eventIdentifier];

                  int v80 = *__error();
                  __int16 v81 = _wrlog();
                  BOOL v105 = os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
                  if (v104)
                  {
                    if (!v105) {
                      goto LABEL_150;
                    }
                    SEL v98 = [(WRWorkflowEventTracker *)self workflow];
                    SEL v99 = [v98 name];
                    v100 = [(WRWorkflowEventTracker *)self eventIdentifier];
                    uint64_t v101 = [v50 end];
                    int v106 = [v101 pid];
                    *(_DWORD *)buf = 138543874;
                    v194 = v99;
                    __int16 v195 = 2114;
                    double v196 = v100;
                    __int16 v197 = 1024;
                    int v198 = v106;
                    goto LABEL_99;
                  }
                  if (!v105) {
                    goto LABEL_150;
                  }
                  long long v138 = [(WRWorkflowEventTracker *)self workflow];
                  BOOL v139 = [v138 name];
                  long long v140 = [v50 end];
                  int v142 = [v140 pid];
                  *(_DWORD *)buf = 138543618;
                  v194 = v139;
                  __int16 v195 = 1024;
                  LODWORD(v196) = v142;
                  goto LABEL_143;
                }
                [v32 addObject:v44];
              }

              uint64_t v45 = v154;
            }
            uint64_t v47 = [v154 countByEnumeratingWithState:&v172 objects:v192 count:16];
          }
          while (v47);
        }

        long long v170 = 0u;
        long long v171 = 0u;
        long long v168 = 0u;
        long long v169 = 0u;
        uint64_t v59 = [v152 incompleteIntervalStarts];
        uint64_t v60 = [v59 countByEnumeratingWithState:&v168 objects:v191 count:16];
        if (v60)
        {
          uint64_t v61 = v60;
          uint64_t v62 = *(void *)v169;
LABEL_59:
          uint64_t v63 = 0;
          while (1)
          {
            if (*(void *)v169 != v62) {
              objc_enumerationMutation(v59);
            }
            uint64_t v64 = *(void **)(*((void *)&v168 + 1) + 8 * v63);
            uint64_t v44 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v64, "pid", v146));
            if (([v32 containsObject:v44] & 1) == 0)
            {
              if (WRProcessIsBeingDebugged([v64 pid]))
              {
                unint64_t v154 = v59;
                double v107 = [(WRWorkflowEventTracker *)self workflow];
                [v107 name];

                [(WRWorkflowEventTracker *)self eventIdentifier];
                BOOL v108 = [(WRWorkflowEventTracker *)self eventIdentifier];

                int v80 = *__error();
                __int16 v81 = _wrlog();
                BOOL v109 = os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
                if (v108)
                {
                  if (v109)
                  {
                    double v110 = [(WRWorkflowEventTracker *)self workflow];
                    double v111 = [v110 name];
                    dispatch_time_t v112 = [(WRWorkflowEventTracker *)self eventIdentifier];
                    int v113 = [v64 pid];
                    *(_DWORD *)buf = 138543874;
                    v194 = v111;
                    __int16 v195 = 2114;
                    double v196 = v112;
                    __int16 v197 = 1024;
                    int v198 = v113;
                    _os_log_impl(&dword_261964000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@<%{public}@>: Process [%d] is being debugged, not saving diagnostics", buf, 0x1Cu);
                  }
                  goto LABEL_150;
                }
                if (!v109) {
                  goto LABEL_150;
                }
                long long v138 = [(WRWorkflowEventTracker *)self workflow];
                BOOL v139 = [v138 name];
                int v145 = [v64 pid];
                *(_DWORD *)buf = 138543618;
                v194 = v139;
                __int16 v195 = 1024;
                LODWORD(v196) = v145;
                _os_log_impl(&dword_261964000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@: Process [%d] is being debugged, not saving diagnostics", buf, 0x12u);
LABEL_149:

LABEL_150:
                __int16 v77 = v146;
LABEL_151:

                *__error() = v80;
                char v15 = 0;
                goto LABEL_155;
              }
              [v32 addObject:v44];
            }

            if (v61 == ++v63)
            {
              uint64_t v61 = [v59 countByEnumeratingWithState:&v168 objects:v191 count:16];
              if (v61) {
                goto LABEL_59;
              }
              break;
            }
          }
        }

        uint64_t v36 = v150 + 1;
        uint64_t v33 = v146;
        uint64_t v35 = v147;
      }
      while ((id)(v150 + 1) != obj);
      uint64_t v34 = [v146 countByEnumeratingWithState:&v180 objects:v200 count:16];
    }
    while (v34);
  }

  long long v166 = 0u;
  long long v167 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  uint64_t v65 = -[WRWorkflowEventTracker diagnosticsExceedingThresholds](self);
  uint64_t v66 = [v65 countByEnumeratingWithState:&v164 objects:v190 count:16];
  uint64_t v67 = v66;
  BOOL v68 = v66 != 0;
  char v69 = 0;
  if (v66)
  {
    uint64_t v70 = *(void *)v165;
    uint64_t v71 = v66;
    while (2)
    {
      for (uint64_t k = 0; k != v71; ++k)
      {
        if (*(void *)v165 != v70) {
          objc_enumerationMutation(v65);
        }
        uint64_t v73 = *(void **)(*((void *)&v164 + 1) + 8 * k);
        if (objc_msgSend(v73, "gatherTailspin", v146))
        {
          if ([v73 tailspinIncludeOSLogs])
          {

            LOBYTE(v76) = 1;
            goto LABEL_86;
          }
          char v69 = 1;
        }
      }
      uint64_t v71 = [v65 countByEnumeratingWithState:&v164 objects:v190 count:16];
      if (v71) {
        continue;
      }
      break;
    }
  }

  uint64_t v74 = [(WRWorkflowEventTracker *)self error];

  if (v74)
  {
    if (v67)
    {
      LOBYTE(v76) = 0;
      goto LABEL_132;
    }
LABEL_136:
    id v130 = [(WRWorkflowEventTracker *)self workflow];
    [v130 name];

    [(WRWorkflowEventTracker *)self eventIdentifier];
    int v131 = [(WRWorkflowEventTracker *)self eventIdentifier];

    int v132 = *__error();
    uint64_t v133 = _wrlog();
    BOOL v134 = os_log_type_enabled(v133, OS_LOG_TYPE_INFO);
    if (v131)
    {
      if (v134)
      {
        long long v135 = [(WRWorkflowEventTracker *)self workflow];
        long long v136 = [v135 name];
        int v137 = [(WRWorkflowEventTracker *)self eventIdentifier];
        *(_DWORD *)buf = 138543618;
        v194 = v136;
        __int16 v195 = 2114;
        double v196 = v137;
        _os_log_impl(&dword_261964000, v133, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: No diagnostic thresholds were exceeded", buf, 0x16u);
      }
    }
    else if (v134)
    {
      double v143 = [(WRWorkflowEventTracker *)self workflow];
      unint64_t v144 = [v143 name];
      *(_DWORD *)buf = 138543362;
      v194 = v144;
      _os_log_impl(&dword_261964000, v133, OS_LOG_TYPE_INFO, "%{public}@: No diagnostic thresholds were exceeded", buf, 0xCu);
    }
    char v15 = 0;
    *__error() = v132;
    goto LABEL_155;
  }
  long long v162 = 0u;
  long long v163 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  if (self) {
    id Property = objc_getProperty(self, v75, 104, 1);
  }
  else {
    id Property = 0;
  }
  id obja = Property;
  uint64_t v155 = [obja countByEnumeratingWithState:&v160 objects:v189 count:16];
  uint64_t v76 = 0;
  if (v155)
  {
    uint64_t v153 = *(void *)v161;
    while (2)
    {
      uint64_t v115 = 0;
      uint64_t v116 = v76;
      do
      {
        if (*(void *)v161 != v153) {
          objc_enumerationMutation(obja);
        }
        unint64_t v117 = *(void **)(*((void *)&v160 + 1) + 8 * v115);
        long long v156 = 0u;
        long long v157 = 0u;
        long long v158 = 0u;
        long long v159 = 0u;
        uint64_t v118 = [(WRWorkflowEventTracker *)self eventStart];
        [v118 machContTimeNs];
        uint64_t v119 = [(WRWorkflowEventTracker *)self eventEnd];
        [v119 machContTimeNs];
        id v120 = -[WRSignpostTracker diagnosticsExceedingThresholdsWithEventStartNs:eventEndNs:](v117);

        uint64_t v121 = [v120 countByEnumeratingWithState:&v156 objects:v188 count:16];
        if (v121)
        {
          uint64_t v122 = v121;
          unsigned int v151 = v116;
          uint64_t v123 = *(void *)v157;
LABEL_114:
          uint64_t v124 = 0;
          while (1)
          {
            if (*(void *)v157 != v123) {
              objc_enumerationMutation(v120);
            }
            int v125 = *(void **)(*((void *)&v156 + 1) + 8 * v124);
            if ([v125 gatherTailspin])
            {
              char v126 = [v125 tailspinIncludeOSLogs];
              char v69 = 1;
              BOOL v68 = 1;
              uint64_t v76 = 1;
              if (v126) {
                break;
              }
            }
            if (v122 == ++v124)
            {
              uint64_t v122 = [v120 countByEnumeratingWithState:&v156 objects:v188 count:16];
              if (v122) {
                goto LABEL_114;
              }
              BOOL v68 = 1;
              uint64_t v76 = v151;
              break;
            }
          }
        }
        else
        {
          uint64_t v76 = v116;
        }

        if (v69 & 1) != 0 && (v76)
        {
          char v69 = 1;
          LOBYTE(v76) = 1;
          goto LABEL_131;
        }
        ++v115;
        uint64_t v116 = v76;
      }
      while (v115 != v155);
      uint64_t v155 = [obja countByEnumeratingWithState:&v160 objects:v189 count:16];
      if (v155) {
        continue;
      }
      break;
    }
  }
LABEL_131:

  if (!v68) {
    goto LABEL_136;
  }
LABEL_132:
  if (v69)
  {
LABEL_86:
    if (MEMORY[0x263F8C868])
    {
      char v15 = -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:](self, 0, v76 & 1);
      goto LABEL_155;
    }
    uint64_t v90 = [(WRWorkflowEventTracker *)self workflow];
    [v90 name];

    [(WRWorkflowEventTracker *)self eventIdentifier];
    uint64_t v91 = [(WRWorkflowEventTracker *)self eventIdentifier];

    int v92 = *__error();
    objc_super v93 = _wrlog();
    BOOL v94 = os_log_type_enabled(v93, OS_LOG_TYPE_ERROR);
    if (v91)
    {
      if (v94) {
        -[WRWorkflowEventTracker gatherDiagnosticsIfNeeded].cold.6();
      }
    }
    else if (v94)
    {
      -[WRWorkflowEventTracker gatherDiagnosticsIfNeeded].cold.5(self);
    }
  }
  else
  {
    int v127 = [(WRWorkflowEventTracker *)self workflow];
    [v127 name];

    [(WRWorkflowEventTracker *)self eventIdentifier];
    id v128 = [(WRWorkflowEventTracker *)self eventIdentifier];

    int v92 = *__error();
    objc_super v93 = _wrlog();
    BOOL v129 = os_log_type_enabled(v93, OS_LOG_TYPE_ERROR);
    if (v128)
    {
      if (v129) {
        -[WRWorkflowEventTracker gatherDiagnosticsIfNeeded].cold.8();
      }
    }
    else if (v129)
    {
      -[WRWorkflowEventTracker gatherDiagnosticsIfNeeded].cold.7(self);
    }
  }

  char v15 = 0;
  *__error() = v92;
LABEL_155:

  return v15;
}

- (uint64_t)gatherDiagnosticsWithTailspin:(int)a3 tailspinIncludeOSLogs:
{
  uint64_t v3 = (uint64_t)a1;
  uint64_t v78 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v4 = [a1 workflow];
    [v4 name];

    [(id)v3 eventIdentifier];
    uint64_t v5 = [(id)v3 eventIdentifier];

    int v6 = *__error();
    uint64_t v7 = _wrlog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v8) {
        goto LABEL_8;
      }
      uint64_t v9 = [(id)v3 workflow];
      uint64_t v10 = [v9 name];
      uint64_t v11 = [(id)v3 eventIdentifier];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v10;
      __int16 v76 = 2114;
      __int16 v77 = v11;
      _os_log_impl(&dword_261964000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@<%{public}@>: Generating diagnostics", buf, 0x16u);
    }
    else
    {
      if (!v8) {
        goto LABEL_8;
      }
      uint64_t v9 = [(id)v3 workflow];
      uint64_t v10 = [v9 name];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl(&dword_261964000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Generating diagnostics", buf, 0xCu);
    }

LABEL_8:
    *__error() = v6;
    +[WRWorkflowEventTracker makeTailspinDirectory]();
    int v12 = NSString;
    uint64_t v13 = [(id)v3 workflow];
    BOOL v14 = [v13 name];
    char v15 = [(id)v3 eventStart];
    uint64_t v16 = [v15 date];
    uint64_t v17 = v16;
    if (!v16)
    {
      uint64_t v17 = [MEMORY[0x263EFF910] date];
    }
    uint64_t v18 = WRStringForDate_onceToken;
    id v19 = v17;
    if (v18 != -1) {
      dispatch_once(&WRStringForDate_onceToken, &__block_literal_global_535);
    }
    uint64_t v20 = [(id)WRStringForDate_dateFormatter stringFromDate:v19];

    uint64_t v21 = [v12 stringWithFormat:@"%@-%@.%@", v14, v20, @"tailspin"];

    if (!v16) {
    id v22 = +[WRWorkflowEventTracker tailspinDirectory]();
    }
    uint64_t v23 = [v22 URLByAppendingPathComponent:v21];

    id v72 = 0;
    uint64_t v24 = [(id)v3 encodedStringWithError:&v72];
    id v25 = v72;
    if (!v24)
    {
      uint64_t v26 = [(id)v3 workflow];
      [v26 name];

      [(id)v3 eventIdentifier];
      uint64_t v27 = [(id)v3 eventIdentifier];

      int v28 = *__error();
      id v29 = _wrlog();
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_FAULT);
      if (v27)
      {
        unint64_t v31 = 0x263F08000;
        if (v30) {
          -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:]0(v3, v25, v29);
        }
      }
      else
      {
        unint64_t v31 = 0x263F08000uLL;
        if (v30) {
          -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:].cold.9();
        }
      }

      *__error() = v28;
      id v32 = objc_alloc(*(Class *)(v31 + 2880));
      uint64_t v33 = [(id)v3 workflow];
      uint64_t v34 = [v33 name];
      uint64_t v24 = (void *)[v32 initWithFormat:@"Workflow responsiveness delay detected in %@", v34];
    }
    uint64_t v35 = [v23 URLByAppendingPathExtension:@"temp"];
    uint64_t v36 = v35;
    if (v35)
    {
      id v37 = v35;
      uint64_t v38 = (const char *)[v37 fileSystemRepresentation];
      if (v38)
      {
        uint64_t v39 = v38;
        int v40 = open(v38, 3586, 420);
        if (v40 != -1)
        {
          int v41 = v40;
          id v68 = v25;
          if (unlink(v39))
          {
            uint64_t v42 = [(id)v3 workflow];
            [v42 name];

            [(id)v3 eventIdentifier];
            uint64_t v43 = [(id)v3 eventIdentifier];

            int v44 = *__error();
            uint64_t v45 = _wrlog();
            BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
            if (v43)
            {
              if (v46) {
                -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:].cold.8(v3, v39, v45);
              }
            }
            else if (v46)
            {
              -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:].cold.7();
            }

            *__error() = v44;
            close(v41);
            uint64_t v3 = 0;
          }
          else
          {
            *(void *)buf = 0;
            mach_get_times();
            uint64_t v58 = *MEMORY[0x263F8C850];
            v73[0] = *MEMORY[0x263F8C808];
            v73[1] = v58;
            v74[0] = MEMORY[0x263EFFA88];
            v74[1] = MEMORY[0x263EFFA80];
            v73[2] = *MEMORY[0x263F8C840];
            uint64_t v59 = [NSNumber numberWithInt:WRIsAppleInternal() ^ 1];
            v73[3] = *MEMORY[0x263F8C838];
            v74[2] = v59;
            v74[3] = v24;
            uint64_t v60 = [NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:4];
            uint64_t v61 = (void *)[v60 mutableCopy];

            if (a3) {
              [v61 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F8C800]];
            }
            uint64_t v70 = dispatch_get_global_queue(0, 0);
            uint64_t v62 = [(id)v3 workflow];
            id v63 = [v62 name];
            WRCreateOSTransaction("Gathering tailspin for workflow %s", (const char *)[v63 UTF8String]);
            v65 = uint64_t v64 = v61;

            id v71 = v23;
            id v66 = v65;
            tailspin_dump_output_with_options();

            uint64_t v3 = 1;
          }
          id v25 = v68;
          goto LABEL_51;
        }
        uint64_t v55 = [(id)v3 workflow];
        [v55 name];

        [(id)v3 eventIdentifier];
        uint64_t v56 = [(id)v3 eventIdentifier];

        int v49 = *__error();
        uint64_t v50 = _wrlog();
        BOOL v57 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
        if (v56)
        {
          if (v57) {
            -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:].cold.6(v3, v39, v50);
          }
        }
        else if (v57)
        {
          -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:].cold.5();
        }
      }
      else
      {
        size_t v52 = [(id)v3 workflow];
        [v52 name];

        [(id)v3 eventIdentifier];
        uint64_t v53 = [(id)v3 eventIdentifier];

        int v49 = *__error();
        uint64_t v50 = _wrlog();
        BOOL v54 = os_log_type_enabled(v50, OS_LOG_TYPE_FAULT);
        if (v53)
        {
          if (v54) {
            -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:].cold.4(v3, v37, v50);
          }
        }
        else if (v54)
        {
          -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:]();
        }
      }
    }
    else
    {
      uint64_t v47 = [(id)v3 workflow];
      [v47 name];

      [(id)v3 eventIdentifier];
      uint64_t v48 = [(id)v3 eventIdentifier];

      int v49 = *__error();
      uint64_t v50 = _wrlog();
      BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
      if (v48)
      {
        if (v51) {
          -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:](v3, v23, v50);
        }
      }
      else if (v51)
      {
        -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:]();
      }
    }

    uint64_t v3 = 0;
    *__error() = v49;
LABEL_51:
  }
  return v3;
}

uint64_t __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke(uint64_t a1, char a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if ((a2 & 1) == 0)
  {
    uint64_t v10 = (id *)(a1 + 32);
    uint64_t v11 = [*(id *)(a1 + 32) workflow];
    [v11 name];

    [*v10 eventIdentifier];
    int v12 = [*v10 eventIdentifier];

    int v13 = *__error();
    BOOL v14 = _wrlog();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (v15) {
        __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_6(a1 + 32, a1, v14);
      }
    }
    else if (v15)
    {
      __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_5();
    }

    *__error() = v13;
    return close(*(_DWORD *)(a1 + 56));
  }
  uint64_t v3 = (const char *)[*(id *)(a1 + 40) fileSystemRepresentation];
  if (!v3)
  {
    uint64_t v16 = [*(id *)(a1 + 32) workflow];
    [v16 name];

    [*(id *)(a1 + 32) eventIdentifier];
    uint64_t v17 = [*(id *)(a1 + 32) eventIdentifier];

    int v7 = *__error();
    BOOL v8 = _wrlog();
    BOOL v18 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v17)
    {
      if (v18) {
        __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_2(a1 + 32, a1 + 40, (uint64_t)v8, v19, v20, v21, v22, v23, *(long long *)v35, *(int *)&v35[16], *(__int16 *)&v35[20], v36, v37, v38, v39, v40, v41, v42, v43,
      }
          v44,
          v45,
          vars0,
          vars8);
    }
    else if (v18)
    {
      __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_1();
    }
    goto LABEL_23;
  }
  uint64_t v4 = (uint64_t)v3;
  if (fclonefileat(*(_DWORD *)(a1 + 56), -1, v3, 0))
  {
    uint64_t v5 = [*(id *)(a1 + 32) workflow];
    [v5 name];

    [*(id *)(a1 + 32) eventIdentifier];
    int v6 = [*(id *)(a1 + 32) eventIdentifier];

    int v7 = *__error();
    BOOL v8 = _wrlog();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v9) {
        __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_4(a1 + 32, v4, v8);
      }
    }
    else if (v9)
    {
      __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_3();
    }
LABEL_23:

    *__error() = v7;
    return close(*(_DWORD *)(a1 + 56));
  }
  close(*(_DWORD *)(a1 + 56));
  uint64_t v24 = [*(id *)(a1 + 32) workflow];
  [v24 name];

  [*(id *)(a1 + 32) eventIdentifier];
  id v25 = [*(id *)(a1 + 32) eventIdentifier];

  int v26 = *__error();
  uint64_t v27 = _wrlog();
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v28)
    {
      id v29 = [*(id *)(a1 + 32) workflow];
      BOOL v30 = [v29 name];
      unint64_t v31 = [*(id *)(a1 + 32) eventIdentifier];
      *(_DWORD *)uint64_t v35 = 138543874;
      *(void *)&v35[4] = v30;
      *(_WORD *)&v35[12] = 2114;
      *(void *)&v35[14] = v31;
      __int16 v36 = 2082;
      uint64_t v37 = v4;
      _os_log_impl(&dword_261964000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@<%{public}@>: saved tailspin file %{public}s for slow workflow, notifying spindump", v35, 0x20u);
    }
  }
  else if (v28)
  {
    uint64_t v33 = [*(id *)(a1 + 32) workflow];
    uint64_t v34 = [v33 name];
    *(_DWORD *)uint64_t v35 = 138543618;
    *(void *)&v35[4] = v34;
    *(_WORD *)&v35[12] = 2082;
    *(void *)&v35[14] = v4;
    _os_log_impl(&dword_261964000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: saved tailspin file %{public}s for slow workflow, notifying spindump", v35, 0x16u);
  }
  *__error() = v26;
  SPReportWorkflowResponsivenessDelay();
  return +[WRWorkflowEventTracker cleanupWorkflowResponsivenessDiagnosticsDirectory];
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)stats
{
  uint64_t v163 = *MEMORY[0x263EF8340];
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->unint64_t var2 = 0;
  uint64_t v148 = 0;
  unint64_t v149 = 0;
  uint64_t v146 = 0;
  uint64_t v147 = 0;
  uint64_t v144 = 0;
  int v145 = 0;
  uint64_t v4 = [(WRWorkflowEventTracker *)self eventStart];
  unint64_t v5 = [v4 machContTimeNs];

  BOOL v129 = self;
  int v6 = [(WRWorkflowEventTracker *)self eventEnd];
  unint64_t v7 = [v6 machContTimeNs];

  if (!v5 || !v7 || v7 <= v5) {
    return result;
  }
  unint64_t v111 = v7 - v5;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  id obj = [(WRWorkflowEventTracker *)self allSignpostTrackers];
  uint64_t v124 = [obj countByEnumeratingWithState:&v140 objects:v162 count:16];
  if (!v124)
  {
    LOBYTE(v11) = 0;
    goto LABEL_56;
  }
  uint64_t v133 = 0;
  BOOL v134 = 0;
  BOOL v9 = 0;
  uint64_t v136 = 0;
  int v10 = 0;
  int v11 = 0;
  uint64_t v123 = *(void *)v141;
  do
  {
    for (uint64_t i = 0; i != v124; ++i)
    {
      if (*(void *)v141 != v123) {
        objc_enumerationMutation(obj);
      }
      int v13 = *(void **)(*((void *)&v140 + 1) + 8 * i);
      BOOL v14 = [v13 signpost];
      int v15 = [v14 networkBound];

      BOOL v139 = [v13 intervals];
      uint64_t v16 = [v139 count];
      long long v135 = v13;
      long long v138 = [v13 incompleteIntervalStarts];
      uint64_t v137 = [v138 count];
      if (!(v16 + v137)) {
        goto LABEL_52;
      }
      int v127 = v11;
      uint64_t v126 = i;
      int v125 = v15;
      if (v16)
      {
        __ptr = v9;
        uint64_t v17 = 0;
        while (1)
        {
          uint64_t v18 = v16;
          uint64_t v19 = [v139 objectAtIndexedSubscript:v17];
          uint64_t v20 = [v19 start];
          unint64_t v21 = [v20 machContTimeNs];

          if (v21 <= v5) {
            unint64_t v22 = v5;
          }
          else {
            unint64_t v22 = v21;
          }
          uint64_t v23 = [v139 objectAtIndexedSubscript:v17];
          uint64_t v24 = [v23 end];
          unint64_t v25 = [v24 machContTimeNs];

          if (v25 >= v7) {
            unint64_t v26 = v7;
          }
          else {
            unint64_t v26 = v25;
          }
          if (v26 >= v22)
          {
            __ptr = (char *)reallocf(__ptr, 16 * (v10 + 1));
            uint64_t v35 = (unint64_t *)&__ptr[16 * v10];
            unint64_t *v35 = v22;
            v35[1] = v26;
            __int16 v36 = [v135 signpost];
            int v37 = [v36 networkBound];

            if (v37)
            {
              BOOL v134 = (char *)reallocf(v134, 16 * (HIDWORD(v136) + 1));
              uint64_t v38 = (unint64_t *)&v134[16 * HIDWORD(v136)];
              *uint64_t v38 = v22;
              v38[1] = v26;
              ++HIDWORD(v136);
            }
            else
            {
              uint64_t v133 = (char *)reallocf(v133, 16 * (v136 + 1));
              uint64_t v39 = (unint64_t *)&v133[16 * v136];
              unint64_t *v39 = v22;
              v39[1] = v26;
              LODWORD(v136) = v136 + 1;
            }
            ++v10;
            goto LABEL_28;
          }
          uint64_t v27 = [(WRWorkflowEventTracker *)v129 workflow];
          [v27 name];

          [(WRWorkflowEventTracker *)v129 eventIdentifier];
          BOOL v28 = [(WRWorkflowEventTracker *)v129 eventIdentifier];

          int v29 = *__error();
          BOOL v30 = _wrlog();
          BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_FAULT);
          if (v28)
          {
            if (v31)
            {
              id v120 = [(WRWorkflowEventTracker *)v129 workflow];
              id v32 = [v120 name];
              SEL v114 = [(WRWorkflowEventTracker *)v129 eventIdentifier];
              uint64_t v118 = [v139 objectAtIndexedSubscript:v17];
              uint64_t v116 = [v118 start];
              uint64_t v112 = [v116 machContTimeNs];
              int v113 = [v139 objectAtIndexedSubscript:v17];
              uint64_t v33 = [v113 end];
              uint64_t v34 = [v33 machContTimeNs];
              *(_DWORD *)buf = 138544642;
              unsigned int v151 = v32;
              __int16 v152 = 2114;
              uint64_t v153 = (uint64_t)v114;
              __int16 v154 = 2048;
              unint64_t v155 = v112;
              __int16 v156 = 2048;
              unint64_t v157 = v34;
              __int16 v158 = 2048;
              unint64_t v159 = v5;
              __int16 v160 = 2048;
              unint64_t v161 = v7;
              _os_log_fault_impl(&dword_261964000, v30, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: signpost interval %llu-%llu outside event time range %llu-%llu", buf, 0x3Eu);

LABEL_31:
            }
          }
          else if (v31)
          {
            id v120 = [(WRWorkflowEventTracker *)v129 workflow];
            id v32 = [v120 name];
            uint64_t v119 = [v139 objectAtIndexedSubscript:v17];
            unint64_t v117 = [v119 start];
            uint64_t v115 = [v117 machContTimeNs];
            uint64_t v40 = [v139 objectAtIndexedSubscript:v17];
            uint64_t v41 = [v40 end];
            uint64_t v42 = [v41 machContTimeNs];
            *(_DWORD *)buf = 138544386;
            unsigned int v151 = v32;
            __int16 v152 = 2048;
            uint64_t v153 = v115;
            __int16 v154 = 2048;
            unint64_t v155 = v42;
            __int16 v156 = 2048;
            unint64_t v157 = v5;
            __int16 v158 = 2048;
            unint64_t v159 = v7;
            _os_log_fault_impl(&dword_261964000, v30, OS_LOG_TYPE_FAULT, "%{public}@: signpost interval %llu-%llu outside event time range %llu-%llu", buf, 0x34u);

            goto LABEL_31;
          }

          *__error() = v29;
LABEL_28:
          ++v17;
          uint64_t v16 = v18;
          if (v18 == v17)
          {
            BOOL v9 = __ptr;
            unint64_t v149 = __ptr;
            int v145 = v133;
            uint64_t v147 = v134;
            int v11 = v127;
            uint64_t i = v126;
            int v15 = v125;
            break;
          }
        }
      }
      LODWORD(v148) = v10;
      LODWORD(v146) = HIDWORD(v136);
      LODWORD(v144) = v136;
      if (!v137) {
        goto LABEL_51;
      }
      uint64_t v43 = 0;
      unint64_t var2 = retstr->var2;
      do
      {
        uint64_t v45 = [v138 objectAtIndexedSubscript:v43];
        unint64_t v46 = [v45 machContTimeNs];

        if (v46 <= v5) {
          unint64_t v47 = v5;
        }
        else {
          unint64_t v47 = v46;
        }
        if (v7 < v47)
        {
          uint64_t v48 = [(WRWorkflowEventTracker *)v129 workflow];
          [v48 name];

          [(WRWorkflowEventTracker *)v129 eventIdentifier];
          int v49 = [(WRWorkflowEventTracker *)v129 eventIdentifier];

          int v50 = *__error();
          BOOL v51 = _wrlog();
          BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_FAULT);
          if (v49)
          {
            if (v52)
            {
              uint64_t v121 = [(WRWorkflowEventTracker *)v129 workflow];
              __ptra = [v121 name];
              uint64_t v53 = [(WRWorkflowEventTracker *)v129 eventIdentifier];
              BOOL v54 = [v138 objectAtIndexedSubscript:v43];
              uint64_t v55 = [v54 machContTimeNs];
              *(_DWORD *)buf = 138544130;
              unsigned int v151 = __ptra;
              __int16 v152 = 2114;
              uint64_t v153 = (uint64_t)v53;
              __int16 v154 = 2048;
              unint64_t v155 = v55;
              __int16 v156 = 2048;
              unint64_t v157 = v7;
              _os_log_fault_impl(&dword_261964000, v51, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: incomplete interval %llu after event end %llu", buf, 0x2Au);

              uint64_t v56 = v121;
              goto LABEL_50;
            }
          }
          else if (v52)
          {
            __ptrb = [(WRWorkflowEventTracker *)v129 workflow];
            uint64_t v62 = [__ptrb name];
            id v63 = [v138 objectAtIndexedSubscript:v43];
            uint64_t v64 = [v63 machContTimeNs];
            *(_DWORD *)buf = 138543874;
            unsigned int v151 = v62;
            __int16 v152 = 2048;
            uint64_t v153 = v64;
            __int16 v154 = 2048;
            unint64_t v155 = v7;
            _os_log_fault_impl(&dword_261964000, v51, OS_LOG_TYPE_FAULT, "%{public}@: incomplete interval %llu after event end %llu", buf, 0x20u);

            uint64_t v56 = __ptrb;
LABEL_50:
          }
          *__error() = v50;
          goto LABEL_47;
        }
        retstr->unint64_t var2 = ++var2;
        BOOL v9 = (char *)reallocf(v9, 16 * (v10 + 1));
        BOOL v57 = (unint64_t *)&v9[16 * v10];
        unint64_t *v57 = v47;
        v57[1] = v7;
        uint64_t v58 = [v135 signpost];
        int v59 = [v58 networkBound];

        if (v59)
        {
          BOOL v134 = (char *)reallocf(v134, 16 * (HIDWORD(v136) + 1));
          uint64_t v60 = (unint64_t *)&v134[16 * HIDWORD(v136)];
          *uint64_t v60 = v47;
          v60[1] = v7;
          ++HIDWORD(v136);
        }
        else
        {
          uint64_t v133 = (char *)reallocf(v133, 16 * (v136 + 1));
          uint64_t v61 = (unint64_t *)&v133[16 * v136];
          *uint64_t v61 = v47;
          v61[1] = v7;
          LODWORD(v136) = v136 + 1;
        }
        ++v10;
LABEL_47:
        ++v43;
      }
      while (v137 != v43);
      unint64_t v149 = v9;
      int v145 = v133;
      uint64_t v147 = v134;
      int v11 = v127;
      uint64_t i = v126;
      int v15 = v125;
LABEL_51:
      LODWORD(v148) = v10;
      LODWORD(v146) = HIDWORD(v136);
      LODWORD(v144) = v136;
LABEL_52:
      v11 |= v15;
    }
    uint64_t v124 = [obj countByEnumeratingWithState:&v140 objects:v162 count:16];
  }
  while (v124);
LABEL_56:

  WRRangesSortAndCoalesce((unsigned int *)&v148);
  uint64_t v65 = v148;
  id v66 = 0;
  if (!v148)
  {
    id v68 = retstr;
LABEL_64:
    unint64_t v77 = v111 - (void)v66;
    goto LABEL_67;
  }
  uint64_t v67 = (char *)v149 + 8;
  id v68 = retstr;
  do
  {
    id v66 = &v66[*v67 - *(v67 - 1)];
    v67 += 2;
    --v65;
  }
  while (v65);
  if ((unint64_t)v66 <= v111) {
    goto LABEL_64;
  }
  char v69 = [(WRWorkflowEventTracker *)v129 workflow];
  [v69 name];

  [(WRWorkflowEventTracker *)v129 eventIdentifier];
  uint64_t v70 = [(WRWorkflowEventTracker *)v129 eventIdentifier];

  int v71 = *__error();
  id v72 = _wrlog();
  BOOL v73 = os_log_type_enabled(v72, OS_LOG_TYPE_FAULT);
  if (v70)
  {
    if (v73)
    {
      uint64_t v74 = [(WRWorkflowEventTracker *)v129 workflow];
      stat v75 = [v74 name];
      __int16 v76 = [(WRWorkflowEventTracker *)v129 eventIdentifier];
      *(_DWORD *)buf = 138544130;
      unsigned int v151 = v75;
      __int16 v152 = 2114;
      uint64_t v153 = (uint64_t)v76;
      __int16 v154 = 2048;
      unint64_t v155 = (unint64_t)v66;
      __int16 v156 = 2048;
      unint64_t v157 = v111;
      _os_log_fault_impl(&dword_261964000, v72, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: union of all signposts duration %llu > workflow event duration %llu", buf, 0x2Au);

      goto LABEL_103;
    }
  }
  else if (v73)
  {
    uint64_t v74 = [(WRWorkflowEventTracker *)v129 workflow];
    stat v75 = [v74 name];
    *(_DWORD *)buf = 138543874;
    unsigned int v151 = v75;
    __int16 v152 = 2048;
    uint64_t v153 = (uint64_t)v66;
    __int16 v154 = 2048;
    unint64_t v155 = v111;
    _os_log_fault_impl(&dword_261964000, v72, OS_LOG_TYPE_FAULT, "%{public}@: union of all signposts duration %llu > workflow event duration %llu", buf, 0x20u);
LABEL_103:

    id v68 = retstr;
  }

  uint64_t v78 = __error();
  unint64_t v77 = 0;
  *uint64_t v78 = v71;
LABEL_67:
  v68->var0 = v77;
  LODWORD(v148) = 0;
  free(v149);
  unint64_t v149 = 0;
  if (v11)
  {
    WRRangesSortAndCoalesce((unsigned int *)&v146);
    WRRangesSortAndCoalesce((unsigned int *)&v144);
    unsigned int v79 = v146;
    if (!v146) {
      goto LABEL_91;
    }
    unint64_t v80 = v144;
    if (!v144) {
      goto LABEL_87;
    }
    unint64_t v81 = 0;
    unsigned int v82 = 0;
    do
    {
      if (v81 < v80)
      {
        __int16 v83 = (char *)v147;
        uint64_t v84 = 16 * v81;
        do
        {
          unint64_t v85 = *(void *)((char *)v145 + v84 + 8);
          int v86 = &v83[16 * v82];
          if (v85 > *(void *)v86)
          {
            unint64_t v87 = *(void *)((char *)v145 + v84);
            uint64_t v88 = &v83[16 * v82];
            unint64_t v91 = *((void *)v88 + 1);
            int v89 = (unint64_t *)(v88 + 8);
            unint64_t v90 = v91;
            if (v87 >= v91) {
              break;
            }
            if (*(void *)v86 >= v87)
            {
              if (v85 >= v90) {
                *(void *)int v86 = v90;
              }
              else {
                *(void *)int v86 = v85;
              }
            }
            else
            {
              unint64_t *v89 = v87;
              if (v85 < v90)
              {
                size_t v92 = v146 + ~v82;
                LODWORD(v146) = v146 + 1;
                objc_super v93 = (char *)reallocf(v83, 16 * v146);
                __int16 v83 = v93;
                uint64_t v147 = v93;
                if (v92) {
                  memmove(&v93[16 * v82 + 32], &v93[16 * v82 + 16], v92);
                }
                BOOL v94 = &v83[16 * ++v82];
                *(void *)BOOL v94 = v85;
                *((void *)v94 + 1) = v90;
                unint64_t v80 = v144;
              }
            }
          }
          ++v81;
          v84 += 16;
        }
        while (v81 < v80);
        unint64_t v81 = v81;
        unsigned int v79 = v146;
      }
      ++v82;
    }
    while (v82 < v79);
    WRRangesSortAndCoalesce((unsigned int *)&v146);
    unsigned int v79 = v146;
    id v68 = retstr;
    if (v146)
    {
LABEL_87:
      v95 = 0;
      uint64_t v96 = v79;
      BOOL v97 = (char *)v147 + 8;
      do
      {
        v95 = &v95[*v97 - *(v97 - 1)];
        v97 += 2;
        --v96;
      }
      while (v96);
    }
    else
    {
LABEL_91:
      v95 = 0;
    }
    if (v111 <= (unint64_t)v95)
    {
      uint64_t v101 = [(WRWorkflowEventTracker *)v129 workflow];
      [v101 name];

      [(WRWorkflowEventTracker *)v129 eventIdentifier];
      int v102 = [(WRWorkflowEventTracker *)v129 eventIdentifier];

      int v103 = *__error();
      v104 = _wrlog();
      BOOL v105 = os_log_type_enabled(v104, OS_LOG_TYPE_FAULT);
      if (v102)
      {
        if (v105)
        {
          int v106 = [(WRWorkflowEventTracker *)v129 workflow];
          double v107 = [v106 name];
          BOOL v108 = [(WRWorkflowEventTracker *)v129 eventIdentifier];
          *(_DWORD *)buf = 138544130;
          unsigned int v151 = v107;
          __int16 v152 = 2114;
          uint64_t v153 = (uint64_t)v108;
          __int16 v154 = 2048;
          unint64_t v155 = (unint64_t)v95;
          __int16 v156 = 2048;
          unint64_t v157 = v111;
          _os_log_fault_impl(&dword_261964000, v104, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: network-bound duration %llu > workflow event duration %llu", buf, 0x2Au);
        }
      }
      else if (v105)
      {
        BOOL v109 = [(WRWorkflowEventTracker *)v129 workflow];
        double v110 = [v109 name];
        *(_DWORD *)buf = 138543874;
        unsigned int v151 = v110;
        __int16 v152 = 2048;
        uint64_t v153 = (uint64_t)v95;
        __int16 v154 = 2048;
        unint64_t v155 = v111;
        _os_log_fault_impl(&dword_261964000, v104, OS_LOG_TYPE_FAULT, "%{public}@: network-bound duration %llu > workflow event duration %llu", buf, 0x20u);
      }
      *__error() = v103;
    }
    else
    {
      v68->var1 = v111 - (void)v95;
    }
  }
  else
  {
    SEL v98 = [(WRWorkflowEventTracker *)v129 eventEnd];
    uint64_t v99 = [v98 machContTimeNs];
    v100 = [(WRWorkflowEventTracker *)v129 eventStart];
    v68->var1 = v99 - [v100 machContTimeNs];
  }
  free(v145);
  free(v147);
  return result;
}

- (void)generateTelemetry
{
  OUTLINED_FUNCTION_17();
  int v2 = [v1 workflow];
  [v2 name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_7() eventIdentifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_261964000, v4, v5, "%{public}@<%{public}@>: Trying to report workflow without an end time", v6, v7, v8, v9, v10);
}

- (void)reportCoreAnalyticsEventForSignpost:(void *)a3 allCount:(void *)a4 allDurationUnionSec:(void *)a5 allDurationSumSec:(void *)a6 allDurationLongestSec:(void *)a7 allDurationUntrackedSec:(void *)a8 allDurationNonNetworkBoundSec:(void *)a9 allTimeUntilFirstSignpost:(void *)a10 allTimeAfterLastSignpost:(void *)a11 incompleteCount:(void *)a12 completeDurationUnionSec:(void *)a13 completeDurationSumSec:(void *)a14 completeDurationLongestSec:(void *)a15 completeTimeUntilFirstSignpost:(void *)a16 environment:
{
  id v68 = a2;
  id v23 = a3;
  id v66 = a4;
  id v65 = a5;
  id v64 = a6;
  id v63 = a7;
  id v62 = a8;
  id v61 = a9;
  uint64_t v24 = v23;
  id v60 = a10;
  id v59 = a11;
  id v58 = a12;
  id v57 = a13;
  id v56 = a14;
  id v55 = a15;
  id v67 = a16;
  if (a1)
  {
    id v25 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    unint64_t v26 = [a1 workflow];
    uint64_t v27 = [v26 name];
    BOOL v28 = WRSanitizeForCA(v27);

    if (v68)
    {
      uint64_t v29 = WRSanitizeForCA(v68);
    }
    else
    {
      uint64_t v29 = 0;
    }
    BOOL v30 = [a1 error];
    [v25 setObject:v28 forKeyedSubscript:@"workflowName"];
    if (v30)
    {
      BOOL v31 = [v30 domain];
      int v32 = [v31 isEqualToString:@"WorkflowResponsivenessError"];

      if (v32)
      {
        uint64_t v33 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v30, "code"));
        [v25 setObject:v33 forKeyedSubscript:@"error"];
      }
      else
      {
        uint64_t v34 = [a1 workflow];
        [v34 name];

        [a1 eventIdentifier];
        uint64_t v35 = [a1 eventIdentifier];

        int v36 = *__error();
        int v37 = _wrlog();
        BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_FAULT);
        if (v35)
        {
          if (v38) {
            -[WRWorkflowEventTracker reportCoreAnalyticsEventForSignpost:allCount:allDurationUnionSec:allDurationSumSec:allDurationLongestSec:allDurationUntrackedSec:allDurationNonNetworkBoundSec:allTimeUntilFirstSignpost:allTimeAfterLastSignpost:incompleteCount:completeDurationUnionSec:completeDurationSumSec:completeDurationLongestSec:completeTimeUntilFirstSignpost:environment:]((uint64_t)a1, (uint64_t)v30, (uint64_t)v37, v39, v40, v41, v42, v43, v51, v52, v53, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v61, (uint64_t)v62,
          }
              (uint64_t)v63,
              (uint64_t)v64,
              (uint64_t)v65);
        }
        else if (v38)
        {
          -[WRWorkflowEventTracker reportCoreAnalyticsEventForSignpost:allCount:allDurationUnionSec:allDurationSumSec:allDurationLongestSec:allDurationUntrackedSec:allDurationNonNetworkBoundSec:allTimeUntilFirstSignpost:allTimeAfterLastSignpost:incompleteCount:completeDurationUnionSec:completeDurationSumSec:completeDurationLongestSec:completeTimeUntilFirstSignpost:environment:](a1, v30);
        }

        *__error() = v36;
        [v25 setObject:&unk_270D99AC0 forKeyedSubscript:@"error"];
      }
    }
    BOOL v54 = (void *)v29;
    [v25 setObject:v29 forKeyedSubscript:@"signpostName"];
    [v25 setObject:v24 forKeyedSubscript:@"occurrencesCount"];
    [v25 setObject:v61 forKeyedSubscript:@"delaySec"];
    [v25 setObject:v60 forKeyedSubscript:@"delayAfterSec"];
    [v25 setObject:v65 forKeyedSubscript:@"durationSec"];
    [v25 setObject:v66 forKeyedSubscript:@"durationUnionSec"];
    [v25 setObject:v64 forKeyedSubscript:@"durationLongestSec"];
    [v25 setObject:v63 forKeyedSubscript:@"durationUntrackedSec"];
    [v25 setObject:v62 forKeyedSubscript:@"durationNonNetworkBoundSec"];
    [v25 setObject:v59 forKeyedSubscript:@"incompleteOccurrencesCount"];
    [v25 setObject:v55 forKeyedSubscript:@"completeDelaySec"];
    [v25 setObject:v57 forKeyedSubscript:@"completeDurationSec"];
    [v25 setObject:v58 forKeyedSubscript:@"completeDurationUnionSec"];
    [v25 setObject:v56 forKeyedSubscript:@"completeDurationLongestSec"];
    if (v30)
    {
      uint64_t v44 = [@"com.apple.workflow-responsiveness" stringByAppendingString:@"-error"];
    }
    else
    {
      uint64_t v44 = @"com.apple.workflow-responsiveness";
    }
    uint64_t v45 = [(__CFString *)v44 stringByAppendingString:@"-generic"];
    unint64_t v46 = a1;
    -[WRWorkflowEventTracker submitCAEventName:dict:forSignpost:](a1, v45, v25, v68);
    uint64_t v74 = 0;
    stat v75 = &v74;
    uint64_t v76 = 0x2020000000;
    char v77 = 0;
    if (v67)
    {
      v69[0] = MEMORY[0x263EF8330];
      v69[1] = 3221225472;
      v69[2] = __370__WRWorkflowEventTracker_reportCoreAnalyticsEventForSignpost_allCount_allDurationUnionSec_allDurationSumSec_allDurationLongestSec_allDurationUntrackedSec_allDurationNonNetworkBoundSec_allTimeUntilFirstSignpost_allTimeAfterLastSignpost_incompleteCount_completeDurationUnionSec_completeDurationSumSec_completeDurationLongestSec_completeTimeUntilFirstSignpost_environment___block_invoke;
      v69[3] = &unk_265589540;
      BOOL v73 = &v74;
      id v47 = v25;
      id v70 = v47;
      id v48 = v68;
      id v71 = v48;
      id v72 = v46;
      [v67 enumerateKeysAndObjectsUsingBlock:v69];

      if (*((unsigned char *)v75 + 24))
      {
        if (v29)
        {
          int v49 = v28;
          [(__CFString *)v44 stringByAppendingFormat:@"-%@-%@", v28, v54];
        }
        else
        {
          int v49 = v28;
          [(__CFString *)v44 stringByAppendingFormat:@"-%@", v28];
        int v50 = };
        -[WRWorkflowEventTracker submitCAEventName:dict:forSignpost:](v46, v50, v47, v48);

        BOOL v28 = v49;
      }
    }
    _Block_object_dispose(&v74, 8);
  }
}

void __43__WRWorkflowEventTracker_generateTelemetry__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3) {
    [v3 statsWithEventEndNs:*(void *)(a1 + 40)];
  }
  uint64_t v5 = [v4 signpost];
  [v5 name];

  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v6 = (id *)(a1 + 32);
  uint64_t v8 = [v7 workflow];
  [v8 name];

  [*v6 eventIdentifier];
  uint64_t v9 = [*v6 eventIdentifier];

  int v10 = *__error();
  int v11 = _wrlog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v12) {
      __43__WRWorkflowEventTracker_generateTelemetry__block_invoke_cold_2((uint64_t)v6, (uint64_t)v4, (uint64_t)v11, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28,
    }
        v29,
        v30);
  }
  else if (v12)
  {
    __43__WRWorkflowEventTracker_generateTelemetry__block_invoke_cold_1(v6, (uint64_t)v4, v11);
  }

  *__error() = v10;
}

- (void)submitCAEventName:(void *)a3 dict:(void *)a4 forSignpost:
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    int v10 = [a1 workflow];
    [v10 name];

    [a1 eventIdentifier];
    int v11 = [a1 eventIdentifier];

    int v12 = *__error();
    uint64_t v13 = _wrlog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (v11)
      {
        if (v14)
        {
          uint64_t v15 = [a1 workflow];
          uint64_t v16 = [v15 name];
          uint64_t v17 = [a1 eventIdentifier];
          int v26 = 138544386;
          uint64_t v27 = v16;
          __int16 v28 = 2114;
          id v29 = v17;
          __int16 v30 = 2114;
          id v31 = v9;
          __int16 v32 = 2112;
          id v33 = v7;
          __int16 v34 = 2112;
          id v35 = v8;
          long long v18 = "%{public}@<%{public}@>: %{public}@: Logging %@ to CA: %@";
          uint64_t v19 = v13;
          uint32_t v20 = 52;
LABEL_9:
          _os_log_debug_impl(&dword_261964000, v19, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&v26, v20);

          goto LABEL_13;
        }
        goto LABEL_13;
      }
      if (!v14) {
        goto LABEL_13;
      }
      uint64_t v21 = [a1 workflow];
      uint64_t v22 = [v21 name];
      int v26 = 138544130;
      uint64_t v27 = v22;
      __int16 v28 = 2114;
      id v29 = v9;
      __int16 v30 = 2112;
      id v31 = v7;
      __int16 v32 = 2112;
      id v33 = v8;
      uint64_t v23 = "%{public}@: %{public}@: Logging %@ to CA: %@";
      uint64_t v24 = v13;
      uint32_t v25 = 42;
    }
    else
    {
      if (v11)
      {
        if (v14)
        {
          uint64_t v15 = [a1 workflow];
          uint64_t v16 = [v15 name];
          uint64_t v17 = [a1 eventIdentifier];
          int v26 = 138544130;
          uint64_t v27 = v16;
          __int16 v28 = 2114;
          id v29 = v17;
          __int16 v30 = 2112;
          id v31 = v7;
          __int16 v32 = 2112;
          id v33 = v8;
          long long v18 = "%{public}@<%{public}@>: Logging %@ to CA: %@";
          uint64_t v19 = v13;
          uint32_t v20 = 42;
          goto LABEL_9;
        }
LABEL_13:

        *__error() = v12;
        AnalyticsSendEvent();
        goto LABEL_14;
      }
      if (!v14) {
        goto LABEL_13;
      }
      uint64_t v21 = [a1 workflow];
      uint64_t v22 = [v21 name];
      int v26 = 138543874;
      uint64_t v27 = v22;
      __int16 v28 = 2112;
      id v29 = v7;
      __int16 v30 = 2112;
      id v31 = v8;
      uint64_t v23 = "%{public}@: Logging %@ to CA: %@";
      uint64_t v24 = v13;
      uint32_t v25 = 32;
    }
    _os_log_debug_impl(&dword_261964000, v24, OS_LOG_TYPE_DEBUG, v23, (uint8_t *)&v26, v25);

    goto LABEL_13;
  }
LABEL_14:
}

void __370__WRWorkflowEventTracker_reportCoreAnalyticsEventForSignpost_allCount_allDurationUnionSec_allDurationSumSec_allDurationLongestSec_allDurationUntrackedSec_allDurationNonNetworkBoundSec_allTimeUntilFirstSignpost_allTimeAfterLastSignpost_incompleteCount_completeDurationUnionSec_completeDurationSumSec_completeDurationLongestSec_completeTimeUntilFirstSignpost_environment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    id v7 = [NSString alloc];
    id v8 = WRSanitizeForCA(v5);
    id v9 = (void *)[v7 initWithFormat:@"env_%@", v8];

    int v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];

    if (!v10)
    {
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v9];
LABEL_9:

      goto LABEL_10;
    }
    int v11 = [*(id *)(a1 + 48) workflow];
    [v11 name];

    [*(id *)(a1 + 48) eventIdentifier];
    int v12 = [*(id *)(a1 + 48) eventIdentifier];

    int v13 = *__error();
    BOOL v14 = _wrlog();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (v15)
      {
        uint64_t v16 = [*(id *)(a1 + 48) workflow];
        uint64_t v17 = [v16 name];
        long long v18 = [*(id *)(a1 + 48) eventIdentifier];
        uint64_t v19 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138544386;
        uint64_t v22 = v17;
        __int16 v23 = 2114;
        uint64_t v24 = v18;
        __int16 v25 = 2114;
        id v26 = v19;
        __int16 v27 = 2114;
        id v28 = v5;
        __int16 v29 = 2112;
        id v30 = v6;
        _os_log_error_impl(&dword_261964000, v14, OS_LOG_TYPE_ERROR, "%{public}@<%{public}@>: %{public}@: Cannot log telemetry for %{public}@ -> %@, conflicts with existing entry", buf, 0x34u);

LABEL_12:
      }
    }
    else if (v15)
    {
      uint64_t v16 = [*(id *)(a1 + 48) workflow];
      uint64_t v17 = [v16 name];
      uint32_t v20 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      uint64_t v22 = v17;
      __int16 v23 = 2114;
      uint64_t v24 = v20;
      __int16 v25 = 2114;
      id v26 = v5;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_error_impl(&dword_261964000, v14, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: Cannot log telemetry for %{public}@ -> %@, conflicts with existing entry", buf, 0x2Au);
      goto LABEL_12;
    }

    *__error() = v13;
    goto LABEL_9;
  }
LABEL_10:
}

+ (uint64_t)isReservedWorkflowName:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = [&unk_270D99A78 containsObject:v2];

  return v3;
}

+ (uint64_t)isReservedSignpostName:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = [&unk_270D99A90 containsObject:v2];

  return v3;
}

- (WRWorkflowEventTracker)initWithWorkflow:(id)a3 eventCompletionCallback:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__WRWorkflowEventTracker_initWithWorkflow_eventCompletionCallback___block_invoke;
  v10[3] = &unk_265589568;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(WRWorkflowEventTracker *)self initForReadbackWithWorkflow:a3 eventCompletionCallback:v10];

  return v8;
}

void __67__WRWorkflowEventTracker_initWithWorkflow_eventCompletionCallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v7 = [v3 eventStart];
  uint64_t v4 = [v3 eventEnd];
  id v5 = [v3 startSignpost];
  id v6 = [v3 endSignpost];
  (*(void (**)(uint64_t, id, id, void *, void *, void *))(v2 + 16))(v2, v3, v7, v4, v5, v6);
}

- (WRWorkflow)workflow
{
  return (WRWorkflow *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)eventIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (WRTimestampAndThread)eventStart
{
  return (WRTimestampAndThread *)objc_getProperty(self, a2, 32, 1);
}

- (WRSignpost)startSignpost
{
  return (WRSignpost *)objc_getProperty(self, a2, 40, 1);
}

- (WRTimestampAndThread)eventEnd
{
  return (WRTimestampAndThread *)objc_getProperty(self, a2, 48, 1);
}

- (WRSignpost)endSignpost
{
  return (WRSignpost *)objc_getProperty(self, a2, 56, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (unint64_t)numHandledSignposts
{
  return self->_numHandledSignposts;
}

- (unint64_t)numOutsideSignposts
{
  return self->_numOutsideSignposts;
}

- (unint64_t)numUnhandledSignposts
{
  return self->_numUnhandledSignposts;
}

- (BOOL)ignoreEventTimeouts
{
  return self->_ignoreEventTimeouts;
}

- (void)setIgnoreEventTimeouts:(BOOL)a3
{
  self->_ignoreEventTimeouts = a3;
}

- (NSMutableDictionary)nonPublicFields
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setNonPublicFields:(id)a3
{
}

- (void)setTimeoutQueue:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 120);
  }
}

- (void)setCandidateEndSignpostTrackers:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 152);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateEndSignpostTrackers, 0);
  objc_storeStrong(&self->_eventCompletionCallback, 0);
  objc_storeStrong((id *)&self->_openIndividuatedIntervalsWithFieldNameMatchingAnEndSignpostFromBeforeEventStart, 0);
  objc_storeStrong((id *)&self->_timeoutSource, 0);
  objc_storeStrong((id *)&self->_timeoutQueue, 0);
  objc_storeStrong((id *)&self->_concurrentEvents, 0);
  objc_storeStrong((id *)&self->_allSignpostTrackersMutable, 0);
  objc_storeStrong((id *)&self->_nonPublicFields, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_endSignpost, 0);
  objc_storeStrong((id *)&self->_eventEnd, 0);
  objc_storeStrong((id *)&self->_startSignpost, 0);
  objc_storeStrong((id *)&self->_eventStart, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);

  objc_storeStrong((id *)&self->_workflow, 0);
}

- (void)reportErrorsAndResetAtMachContNs:(void *)a1 date:.cold.1(void *a1)
{
  id v1 = [a1 workflow];
  uint64_t v2 = [v1 name];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_21(&dword_261964000, v3, v4, "%{public}@: reset in middle of event, reporting error", v5, v6, v7, v8, v9);
}

- (void)reportErrorsAndResetAtMachContNs:date:.cold.2()
{
  OUTLINED_FUNCTION_17();
  uint64_t v2 = [v1 workflow];
  [v2 name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_7() eventIdentifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_261964000, v4, v5, "%{public}@<%{public}@>: reset in middle of event, reporting error", v6, v7, v8, v9, v10);
}

- (void)valueForFieldName:inSignpostObject:.cold.1()
{
  OUTLINED_FUNCTION_5();
  uint64_t v2 = [v1 workflow];
  uint64_t v3 = [v2 name];
  object_getClassName(v0);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_261964000, v4, v5, "%{public}@: Unknown signpost object type %{public}s", v6, v7, v8, v9, 2u);
}

- (void)applySignpost:toSignpostTracker:.cold.1()
{
  OUTLINED_FUNCTION_5();
  uint64_t v2 = [v1 workflow];
  [v2 name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_7() name];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_261964000, v4, v5, "%{public}@: %{public}@: Handling synthetic event as SignpostEvent, not SignpostInterval", v6, v7, v8, v9, v10);
}

- (void)applySignpost:(uint64_t)a3 toSignpostTracker:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_6();
  a20 = v24;
  a21 = v25;
  OUTLINED_FUNCTION_16();
  a13 = *MEMORY[0x263EF8340];
  __int16 v27 = [v26 workflow];
  [v27 name];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_25() eventIdentifier];
  objc_claimAutoreleasedReturnValue();
  id v28 = [(id)OUTLINED_FUNCTION_29() name];
  LODWORD(a9) = 138543874;
  *(void *)((char *)&a9 + 4) = v23;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_18(&dword_261964000, v21, v29, "%{public}@<%{public}@>: %{public}@: Handling synthetic event as SignpostEvent, not SignpostInterval", (uint8_t *)&a9);

  OUTLINED_FUNCTION_9();
}

- (void)handleSignpost:.cold.1()
{
  OUTLINED_FUNCTION_5();
  uint64_t v2 = [v1 workflow];
  [v2 name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_7() name];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_261964000, v4, v5, "%{public}@: %{public}@: Unable to get event identifier for start signpost, throwing out all current events in case they were incomplete events", v6, v7, v8, v9, v10);
}

- (void)handleSignpost:.cold.2()
{
  OUTLINED_FUNCTION_5();
  uint64_t v2 = [v1 workflow];
  [v2 name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_7() name];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_261964000, v4, v5, "%{public}@: %{public}@: Unable to get event identifier, ignoring signpost", v6, v7, v8, v9, v10);
}

- (void)handleSignpost:(void *)a1 .cold.4(void *a1)
{
  id v1 = [a1 workflow];
  uint64_t v2 = [v1 name];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_33(&dword_261964000, v3, v4, "%{public}@: concurrent workflow done", v5, v6, v7, v8, v9);
}

- (void)handleSignpost:.cold.5()
{
  OUTLINED_FUNCTION_5();
  uint64_t v2 = [v1 workflow];
  [v2 name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_7() eventIdentifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_32(&dword_261964000, v4, v5, "%{public}@<%{public}@>: concurrent workflow done", v6, v7, v8, v9, v10);
}

- (void)handleSignpost:(void *)a3 .cold.8(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 workflow];
  uint64_t v8 = [v7 name];
  *(_DWORD *)a1 = 138543362;
  *a3 = v8;
  _os_log_debug_impl(&dword_261964000, a4, OS_LOG_TYPE_DEBUG, "%{public}@: concurrent workflow done", a1, 0xCu);
}

- (void)handleSignpost:(void *)a1 wrsignpost:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = [a1 workflow];
  uint64_t v4 = [v3 name];
  uint64_t v5 = [a2 name];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_31(&dword_261964000, v6, v7, "%{public}@: %{public}@: No missing end signposts, but didn't find an end signpost tracker", v8, v9, v10, v11, 2u);
}

- (void)handleSignpost:(uint64_t)a3 wrsignpost:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_6();
  a20 = v21;
  a21 = v22;
  uint64_t v24 = v23;
  id v26 = v25;
  id v28 = v27;
  a13 = *MEMORY[0x263EF8340];
  uint64_t v29 = [v27 workflow];
  id v30 = [v29 name];
  uint64_t v31 = [v28 eventIdentifier];
  __int16 v32 = [v26 name];
  LODWORD(a9) = 138543874;
  *(void *)((char *)&a9 + 4) = v30;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_18(&dword_261964000, v24, v33, "%{public}@<%{public}@>: %{public}@: No missing end signposts, but didn't find an end signpost tracker", (uint8_t *)&a9);

  OUTLINED_FUNCTION_9();
}

- (void)handleSignpost:(NSObject *)a3 wrsignpost:.cold.3(void *a1, void *a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 workflow];
  uint64_t v7 = [v6 name];
  uint64_t v8 = [a2 name];
  uint64_t v9 = [a2 startMachContinuousTime];
  [a2 startNanoseconds];
  uint64_t v10 = [a1 eventStart];
  [v10 machContTimeNs];
  v13[0] = 138544130;
  OUTLINED_FUNCTION_28();
  __int16 v14 = 2048;
  uint64_t v15 = v9;
  __int16 v16 = 2048;
  double v17 = v11 / v12;
  _os_log_error_impl(&dword_261964000, a3, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: event start @%llu (%+.3fs in previous event)", (uint8_t *)v13, 0x2Au);
}

- (void)handleSignpost:(NSObject *)a3 wrsignpost:.cold.4(void *a1, void *a2, NSObject *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 workflow];
  uint64_t v7 = [v6 name];
  uint64_t v8 = [a1 eventIdentifier];
  uint64_t v9 = [a2 name];
  uint64_t v10 = [a2 startMachContinuousTime];
  unint64_t v11 = [a2 startNanoseconds];
  double v12 = [a1 eventStart];
  int v13 = 138544386;
  __int16 v14 = v7;
  __int16 v15 = 2114;
  __int16 v16 = v8;
  __int16 v17 = 2114;
  uint64_t v18 = v9;
  __int16 v19 = 2048;
  uint64_t v20 = v10;
  __int16 v21 = 2048;
  double v22 = ((double)v11 - (double)(unint64_t)[v12 machContTimeNs]) / 1000000000.0;
  _os_log_error_impl(&dword_261964000, a3, OS_LOG_TYPE_ERROR, "%{public}@<%{public}@>: %{public}@: event start @%llu (%+.3fs in previous event)", (uint8_t *)&v13, 0x34u);
}

void __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_19(&dword_261964000, v0, v1, "WR mkdir: Unable to get path from %{public}@", v2);
}

void __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_19(&dword_261964000, v0, v1, "WR mkdir: Unable to get path cstr from %{public}@", v2);
}

void __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_17();
  __error();
  OUTLINED_FUNCTION_35(&dword_261964000, v0, v1, "Unable to open dir at %{public}s: %{errno}d", v2, v3, v4, v5, 2u);
}

void __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_261964000, v0, OS_LOG_TYPE_DEBUG, "Marked %{public}@ with purgeable children", v1, 0xCu);
}

void __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_5()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_fault_impl(&dword_261964000, v1, OS_LOG_TYPE_FAULT, "Failed to mark %{public}@ with purgeable children: %{errno}d", v2, 0x12u);
}

void __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_6()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_261964000, v1, OS_LOG_TYPE_FAULT, "Unable to create folder at %{public}@: %@", v2, 0x16u);
}

void __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_7()
{
  OUTLINED_FUNCTION_17();
  geteuid();
  OUTLINED_FUNCTION_35(&dword_261964000, v0, v1, "must run as root to create directory %{public}@ (running as %d)", v2, v3, v4, v5, 2u);
}

+ (void)cleanupDirectory:ofFilesWithSuffix:olderThan:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_19(&dword_261964000, v0, v1, "WR cleanup: Unable to get path from %{public}@", v2);
}

+ (void)cleanupDirectory:ofFilesWithSuffix:olderThan:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_19(&dword_261964000, v0, v1, "WR cleanup: Unable to create enumerator for %{public}@ to clean up workflow responsiveness directory", v2);
}

+ (void)cleanupDirectory:(os_log_t)log ofFilesWithSuffix:olderThan:.cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_261964000, log, OS_LOG_TYPE_DEBUG, "WR cleanup: No workflow responsiveness directory, no cleanup required", v1, 2u);
}

void __71__WRWorkflowEventTracker_cleanupDirectory_ofFilesWithSuffix_olderThan___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  uint64_t v2 = [v1 path];
  uint64_t v3 = [v0 debugDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_261964000, v4, v5, "WR cleanup: Error cleaning up workflow responsiveness directory file %{public}@: %{public}@", v6, v7, v8, v9, 2u);
}

- (void)encodedDict
{
  OUTLINED_FUNCTION_6();
  a20 = v23;
  a21 = v24;
  id v26 = v25;
  a13 = *MEMORY[0x263EF8340];
  id v28 = [v27 workflow];
  [v28 name];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_29() eventIdentifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v29 = [(id)OUTLINED_FUNCTION_24() error];
  LODWORD(a9) = 138543874;
  *(void *)((char *)&a9 + 4) = v21;
  WORD6(a9) = 2114;
  *(void *)((char *)&a9 + 14) = v22;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_18(&dword_261964000, v26, v30, "%{public}@<%{public}@>: Have error with bad domain %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_9();
}

- (void)gatherDiagnosticsIfNeeded
{
  OUTLINED_FUNCTION_17();
  uint64_t v2 = [v1 workflow];
  [v2 name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_7() eventIdentifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_261964000, v4, v5, "%{public}@<%{public}@>: Have exceeded diagnostic thresholds, but none use tailspin", v6, v7, v8, v9, v10);
}

- (void)gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:.cold.1()
{
  OUTLINED_FUNCTION_5();
  uint64_t v2 = [v1 workflow];
  [v2 name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_7() path];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_261964000, v4, v5, "%{public}@: Failed to generate tailspin, could not create open-unlinked file URL from %{public}@", v6, v7, v8, v9, v10);
}

- (void)gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:.cold.3()
{
  OUTLINED_FUNCTION_5();
  id v1 = [v0 workflow];
  uint64_t v2 = [v1 name];
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_2(&dword_261964000, v3, v4, "%{public}@: Unable to get fileSystemRepresentation for %{public}@", v5, v6, v7, v8, v9);
}

- (void)gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:.cold.5()
{
  OUTLINED_FUNCTION_5();
  id v1 = [v0 workflow];
  uint64_t v2 = [v1 name];
  __error();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_22(&dword_261964000, v3, v4, "%{public}@: Failed to generate tailspin, could not open file %{public}s: %{errno}d", v5, v6, v7, v8, v9);
}

- (void)gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:.cold.7()
{
  OUTLINED_FUNCTION_5();
  id v1 = [v0 workflow];
  uint64_t v2 = [v1 name];
  __error();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_22(&dword_261964000, v3, v4, "%{public}@: Failed to generate tailspin, could not open-unlink file %{public}s: %{errno}d", v5, v6, v7, v8, v9);
}

- (void)gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:.cold.9()
{
  OUTLINED_FUNCTION_5();
  id v1 = [v0 workflow];
  uint64_t v2 = [v1 name];
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_2(&dword_261964000, v3, v4, "%{public}@: Failed to create encoded string: %{public}@", v5, v6, v7, v8, v9);
}

void __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  id v1 = [*v0 workflow];
  uint64_t v2 = [v1 name];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_261964000, v3, v4, "%{public}@: Failed after saving tailspin file: unable to get fileSystemRepresentation for %{public}@", v5, v6, v7, v8, v9);
}

void __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, int a10, __int16 a11, __int16 a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  OUTLINED_FUNCTION_6();
  a22 = v26;
  a23 = v27;
  OUTLINED_FUNCTION_15();
  uint64_t v29 = [(id)OUTLINED_FUNCTION_26(v28) workflow];
  uint64_t v30 = [v29 name];
  uint64_t v31 = [*v25 eventIdentifier];
  uint64_t v32 = *v24;
  LODWORD(a9) = 138543874;
  *(void *)((char *)&a9 + 4) = v30;
  WORD6(a9) = 2114;
  *(void *)((char *)&a9 + 14) = v31;
  a12 = 2114;
  a13 = v32;
  _os_log_error_impl(&dword_261964000, v23, OS_LOG_TYPE_ERROR, "%{public}@<%{public}@>: Failed after saving tailspin file: unable to get fileSystemRepresentation for %{public}@", (uint8_t *)&a9, 0x20u);

  OUTLINED_FUNCTION_9();
}

void __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5();
  id v1 = [(id)OUTLINED_FUNCTION_26(v0) workflow];
  uint64_t v2 = [v1 name];
  __error();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_22(&dword_261964000, v3, v4, "%{public}@: Failed after saving tailspin file: could not clonefile to %{public}s: %{errno}d", v5, v6, v7, v8, v9);
}

void __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_5();
  uint64_t v2 = [*v1 workflow];
  uint64_t v3 = [v2 name];
  uint64_t v4 = [*(id *)(v0 + 40) path];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_261964000, v5, v6, "%{public}@: Failed to save tailspin to file to %{public}@", v7, v8, v9, v10, v11);
}

- (void)reportCoreAnalyticsEventForSignpost:(void *)a1 allCount:(void *)a2 allDurationUnionSec:allDurationSumSec:allDurationLongestSec:allDurationUntrackedSec:allDurationNonNetworkBoundSec:allTimeUntilFirstSignpost:allTimeAfterLastSignpost:incompleteCount:completeDurationUnionSec:completeDurationSumSec:completeDurationLongestSec:completeTimeUntilFirstSignpost:environment:.cold.1(void *a1, void *a2)
{
  uint64_t v3 = [a1 workflow];
  uint64_t v4 = [v3 name];
  uint64_t v5 = [a2 domain];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_31(&dword_261964000, v6, v7, "%{public}@: Bad error domain %@", v8, v9, v10, v11, 2u);
}

- (void)reportCoreAnalyticsEventForSignpost:(uint64_t)a3 allCount:(uint64_t)a4 allDurationUnionSec:(uint64_t)a5 allDurationSumSec:(uint64_t)a6 allDurationLongestSec:(uint64_t)a7 allDurationUntrackedSec:(uint64_t)a8 allDurationNonNetworkBoundSec:(int)a9 allTimeUntilFirstSignpost:(uint64_t)a10 allTimeAfterLastSignpost:(uint64_t)a11 incompleteCount:(uint64_t)a12 completeDurationUnionSec:(uint64_t)a13 completeDurationSumSec:(uint64_t)a14 completeDurationLongestSec:(uint64_t)a15 completeTimeUntilFirstSignpost:(uint64_t)a16 environment:(uint64_t)a17 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_6();
  a21 = v22;
  a22 = v23;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  a14 = *MEMORY[0x263EF8340];
  uint64_t v30 = [v28 workflow];
  uint64_t v31 = [v30 name];
  uint64_t v32 = [v29 eventIdentifier];
  uint64_t v33 = [v27 domain];
  a9 = 138543874;
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_18(&dword_261964000, v25, v34, "%{public}@<%{public}@>: Bad error domain %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_9();
}

void __43__WRWorkflowEventTracker_generateTelemetry__block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*a1 workflow];
  [v5 name];
  objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [(id)OUTLINED_FUNCTION_29() signpost];
  uint64_t v7 = [v6 name];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_261964000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@: no signposts for telemetry", v8, 0x16u);
}

void __43__WRWorkflowEventTracker_generateTelemetry__block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_6();
  a20 = v21;
  a21 = v22;
  uint64_t v24 = v23;
  uint64_t v26 = (id *)v25;
  uint64_t v27 = [(id)OUTLINED_FUNCTION_26(v25) workflow];
  uint64_t v28 = [v27 name];
  [*v26 eventIdentifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v29 = [(id)OUTLINED_FUNCTION_25() signpost];
  uint64_t v30 = [v29 name];
  LODWORD(a9) = 138543874;
  *(void *)((char *)&a9 + 4) = v28;
  WORD6(a9) = 2114;
  *(void *)((char *)&a9 + 14) = v26;
  OUTLINED_FUNCTION_14();
  _os_log_debug_impl(&dword_261964000, v24, OS_LOG_TYPE_DEBUG, "%{public}@<%{public}@>: %{public}@: no signposts for telemetry", (uint8_t *)&a9, 0x20u);

  OUTLINED_FUNCTION_9();
}

@end