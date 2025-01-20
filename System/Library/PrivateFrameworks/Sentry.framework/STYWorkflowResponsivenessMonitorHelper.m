@interface STYWorkflowResponsivenessMonitorHelper
- (BOOL)workflowIsUnderLimits:(id)a3;
- (NSArray)workflowEventTrackers;
- (OS_dispatch_queue)settingsChangedCallbackQueue;
- (OS_dispatch_source)perDayTimer;
- (OS_dispatch_source)perPeriodTimer;
- (STYWorkflowResponsivenessMonitorHelper)init;
- (WRWorkflowProvider)workflowProvider;
- (id)allowList;
- (id)name;
- (id)settingsChangedCallback;
- (int)perDayLogLimit;
- (int)perPeriodLogLimit;
- (int)periodLengthSec;
- (void)handleSignpost:(id)a3;
- (void)notifyWhenSettingsChanged:(id)a3 block:(id)a4;
- (void)resetCounts;
- (void)resetPerDayCounts;
- (void)resetPerPeriodCounts;
- (void)resetState;
- (void)setPerDayLogLimit:(int)a3;
- (void)setPerDayTimer:(id)a3;
- (void)setPerPeriodLogLimit:(int)a3;
- (void)setPerPeriodTimer:(id)a3;
- (void)setPeriodLengthSec:(int)a3;
- (void)setSettingsChangedCallback:(id)a3;
- (void)setSettingsChangedCallbackQueue:(id)a3;
- (void)setWorkflowEventTrackers:(id)a3;
- (void)setWorkflowProvider:(id)a3;
- (void)updateAllowList;
- (void)workflowEventCompleted:(id)a3 completedWRTracker:(id)a4;
@end

@implementation STYWorkflowResponsivenessMonitorHelper

- (id)name
{
  return @"Workflow Responsiveness";
}

- (STYWorkflowResponsivenessMonitorHelper)init
{
  v29.receiver = self;
  v29.super_class = (Class)STYWorkflowResponsivenessMonitorHelper;
  v2 = [(STYSignpostsMonitorHelper *)&v29 init];
  if (v2)
  {
    v3 = (SignpostSupportSubsystemCategoryAllowlist *)objc_alloc_init(MEMORY[0x1E4F9F7C0]);
    allowList = v2->_allowList;
    v2->_allowList = v3;

    v5 = dispatch_get_global_queue(5, 0);
    dispatch_async(v5, &__block_literal_global_411);

    objc_initWeak(&location, v2);
    v6 = (void *)MEMORY[0x1E4FB74C0];
    v7 = [(STYSignpostsMonitorHelper *)v2 processingQueue];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __46__STYWorkflowResponsivenessMonitorHelper_init__block_invoke_2;
    v26[3] = &unk_1E6971B00;
    objc_copyWeak(&v27, &location);
    uint64_t v8 = [v6 providerForAllWorkflowsWithQueue:v7 callback:v26];
    workflowProvider = v2->_workflowProvider;
    v2->_workflowProvider = (WRWorkflowProvider *)v8;

    v10 = [(STYSignpostsMonitorHelper *)v2 processingQueue];
    v11 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v10);

    dispatch_time_t v12 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 86400000000000);
    dispatch_source_set_timer(v11, v12, 0x4E94914F0000uLL, 0x34630B8A000uLL);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __46__STYWorkflowResponsivenessMonitorHelper_init__block_invoke_419;
    handler[3] = &unk_1E6971868;
    v13 = v2;
    v25 = v13;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_activate(v11);
    objc_storeStrong(v13 + 11, v11);
    v14 = [v13 processingQueue];
    v15 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v14);

    if ((int)[v13 periodLengthSec] >= 1)
    {
      if ((int)[v13 periodLengthSec] < 1) {
        int64_t v16 = -1;
      }
      else {
        int64_t v16 = 1000000000 * (int)[v13 periodLengthSec];
      }
      dispatch_time_t v17 = dispatch_time(0xFFFFFFFFFFFFFFFELL, v16);
      dispatch_source_set_timer(v15, v17, 1000000000 * (int)[v13 periodLengthSec], 1000000000 * (int)objc_msgSend(v13, "periodLengthSec") / 0xAuLL);
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __46__STYWorkflowResponsivenessMonitorHelper_init__block_invoke_420;
    v22[3] = &unk_1E6971868;
    v18 = v13;
    v23 = v18;
    dispatch_source_set_event_handler(v15, v22);
    dispatch_resume(v15);
    id v19 = v18[12];
    v18[12] = v15;
    v20 = v15;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v2;
}

uint64_t __46__STYWorkflowResponsivenessMonitorHelper_init__block_invoke()
{
  return [MEMORY[0x1E4FB74B8] cleanupWorkflowResponsivenessDiagnosticsDirectory];
}

void __46__STYWorkflowResponsivenessMonitorHelper_init__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v24 = a2;
  from = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v24, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v24;
    id v3 = 0;
    uint64_t v4 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v4)
    {
      uint64_t v29 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(obj);
          }
          v6 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v7 = [v6 allowListForDiagnostics];
          uint64_t v8 = +[STYFrameworkHelper sharedHelper];
          v9 = [v8 logHandle];

          BOOL v10 = os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEFAULT);
          if (v7)
          {
            if (v10)
            {
              v11 = [v6 name];
              *(_DWORD *)buf = 138543362;
              v38 = v11;
              _os_log_impl(&dword_1D3037000, &v9->super, OS_LOG_TYPE_DEFAULT, "Workflow %{public}@ starting monitoring", buf, 0xCu);
            }
            if (!v3) {
              id v3 = objc_alloc_init(MEMORY[0x1E4F9F7C0]);
            }
            [v3 addAllowlist:v7];
            v9 = objc_alloc_init(STYWorkflowEventTracker);
            objc_initWeak((id *)buf, v9);
            id v12 = objc_alloc(MEMORY[0x1E4FB74B8]);
            v13 = [WeakRetained processingQueue];
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = __46__STYWorkflowResponsivenessMonitorHelper_init__block_invoke_416;
            v30[3] = &unk_1E6971AD8;
            objc_copyWeak(&v31, (id *)buf);
            objc_copyWeak(&v32, from);
            v14 = (void *)[v12 initForLiveStreamingWithWorkflow:v6 timeoutQueue:v13 eventCompletionCallback:v30];

            [(STYWorkflowEventTracker *)v9 setWrTracker:v14];
            [v27 addObject:v9];

            objc_destroyWeak(&v32);
            objc_destroyWeak(&v31);
            objc_destroyWeak((id *)buf);
          }
          else if (v10)
          {
            v15 = [v6 name];
            *(_DWORD *)buf = 138543362;
            v38 = v15;
            _os_log_impl(&dword_1D3037000, &v9->super, OS_LOG_TYPE_DEFAULT, "Workflow %{public}@ has no diagnostics enabled, not monitoring", buf, 0xCu);
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v4);
    }

    [WeakRetained setWorkflowEventTrackers:0];
    if ([v27 count])
    {
      int64_t v16 = (void *)[v27 copy];
      [WeakRetained setWorkflowEventTrackers:v16];

      [WeakRetained takeTransaction];
    }
    else
    {
      dispatch_time_t v17 = +[STYFrameworkHelper sharedHelper];
      v18 = [v17 logHandle];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3037000, v18, OS_LOG_TYPE_DEFAULT, "No workflows have diagnostics enabled", buf, 2u);
      }

      [WeakRetained setOsTransaction:0];
    }
    objc_storeStrong(WeakRetained + 4, v3);
    id v19 = [WeakRetained settingsChangedCallbackQueue];
    if (v19)
    {
      v20 = [WeakRetained settingsChangedCallback];
      BOOL v21 = v20 == 0;

      if (!v21)
      {
        v22 = [WeakRetained settingsChangedCallbackQueue];
        v23 = [WeakRetained settingsChangedCallback];
        dispatch_async(v22, v23);
      }
    }
  }
}

void __46__STYWorkflowResponsivenessMonitorHelper_init__block_invoke_416(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (v4 && WeakRetained) {
    [v4 workflowEventCompleted:WeakRetained completedWRTracker:v6];
  }
}

uint64_t __46__STYWorkflowResponsivenessMonitorHelper_init__block_invoke_419(uint64_t a1)
{
  v2 = +[STYFrameworkHelper sharedHelper];
  id v3 = [v2 logHandle];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D3037000, v3, OS_LOG_TYPE_DEFAULT, "Daily timer fired, resetting per-day counts", v5, 2u);
  }

  return [*(id *)(a1 + 32) resetPerDayCounts];
}

uint64_t __46__STYWorkflowResponsivenessMonitorHelper_init__block_invoke_420(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = +[STYFrameworkHelper sharedHelper];
  id v3 = [v2 logHandle];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [*(id *)(a1 + 32) periodLengthSec];
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1D3037000, v3, OS_LOG_TYPE_DEFAULT, "per-period (%ds) timer fired, resetting per-day counts", (uint8_t *)v6, 8u);
  }

  return [*(id *)(a1 + 32) resetPerPeriodCounts];
}

- (id)allowList
{
  return self->_allowList;
}

- (void)notifyWhenSettingsChanged:(id)a3 block:(id)a4
{
  id v6 = a4;
  [(STYWorkflowResponsivenessMonitorHelper *)self setSettingsChangedCallbackQueue:a3];
  [(STYWorkflowResponsivenessMonitorHelper *)self setSettingsChangedCallback:v6];
}

- (void)handleSignpost:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(STYWorkflowResponsivenessMonitorHelper *)self workflowEventTrackers];
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      uint64_t v18 = v5;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
        if ([(STYWorkflowResponsivenessMonitorHelper *)self workflowIsUnderLimits:v8])
        {
          [v8 wrTracker];
          uint64_t v9 = v6;
          v11 = BOOL v10 = self;
          id v12 = [v11 workflow];
          v13 = [v12 allowListForDiagnostics];
          v14 = [v20 subsystem];
          v15 = [v20 category];
          int v16 = [v13 passesSubsystem:v14 category:v15];

          self = v10;
          uint64_t v6 = v9;
          uint64_t v5 = v18;
          if (v16)
          {
            dispatch_time_t v17 = [v8 wrTracker];
            [v17 handleSignpost:v20];
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }
}

- (void)resetState
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(STYWorkflowResponsivenessMonitorHelper *)self workflowEventTrackers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) wrTracker];
        [v7 reset];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (BOOL)workflowIsUnderLimits:(id)a3
{
  id v4 = a3;
  int v5 = [v4 perPeriodEventCount];
  if (v5 >= [(STYWorkflowResponsivenessMonitorHelper *)self perPeriodLogLimit])
  {
    BOOL v7 = 0;
  }
  else
  {
    int v6 = [v4 perDayEventCount];
    BOOL v7 = v6 < [(STYWorkflowResponsivenessMonitorHelper *)self perDayLogLimit];
  }

  return v7;
}

- (void)resetCounts
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [(STYWorkflowResponsivenessMonitorHelper *)self workflowEventTrackers];
  uint64_t v3 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
  if (!v3)
  {
LABEL_27:

    return;
  }
  uint64_t v5 = v3;
  char v38 = 0;
  uint64_t v40 = *(void *)v42;
  *(void *)&long long v4 = 138544386;
  long long v37 = v4;
  do
  {
    uint64_t v6 = 0;
    do
    {
      if (*(void *)v42 != v40) {
        objc_enumerationMutation(obj);
      }
      BOOL v7 = *(void **)(*((void *)&v41 + 1) + 8 * v6);
      int v8 = objc_msgSend(v7, "perDayEventCount", v37);
      int v9 = [v7 perPeriodEventCount];
      BOOL v10 = [(STYWorkflowResponsivenessMonitorHelper *)self workflowIsUnderLimits:v7];
      [v7 setPerDayEventCount:0];
      [v7 setPerPeriodEventCount:0];
      BOOL v11 = [(STYWorkflowResponsivenessMonitorHelper *)self workflowIsUnderLimits:v7];
      id v12 = +[STYFrameworkHelper sharedHelper];
      uint64_t v13 = [v12 logHandle];

      if (v10)
      {
        if (v11)
        {
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_19;
          }
          v14 = [v7 wrTracker];
          v15 = [v14 workflow];
          int v16 = [v15 name];
          int v17 = [(STYWorkflowResponsivenessMonitorHelper *)self perDayLogLimit];
          int v18 = [(STYWorkflowResponsivenessMonitorHelper *)self perPeriodLogLimit];
          *(_DWORD *)buf = v37;
          v46 = v16;
          __int16 v47 = 1024;
          int v48 = v8;
          __int16 v49 = 1024;
          int v50 = v17;
          __int16 v51 = 1024;
          int v52 = v9;
          __int16 v53 = 1024;
          int v54 = v18;
          id v19 = v13;
          id v20 = "Workflow %{public}@ resetting all counts (was %d/%d per day, %d/%d per period), was already under limits";
          goto LABEL_18;
        }
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
LABEL_15:
          char v38 = 1;
          goto LABEL_19;
        }
        long long v22 = [v7 wrTracker];
        long long v23 = [v22 workflow];
        long long v24 = [v23 name];
        int v29 = [(STYWorkflowResponsivenessMonitorHelper *)self perDayLogLimit];
        int v30 = [(STYWorkflowResponsivenessMonitorHelper *)self perPeriodLogLimit];
        *(_DWORD *)buf = v37;
        v46 = v24;
        __int16 v47 = 1024;
        int v48 = v8;
        __int16 v49 = 1024;
        int v50 = v29;
        __int16 v51 = 1024;
        int v52 = v9;
        __int16 v53 = 1024;
        int v54 = v30;
        _os_log_fault_impl(&dword_1D3037000, v13, OS_LOG_TYPE_FAULT, "Workflow %{public}@ resetting all counts (was %d/%d per day, %d/%d per period), was already under limits, and is now above limit!", buf, 0x24u);
LABEL_13:

        goto LABEL_15;
      }
      BOOL v21 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (!v21) {
          goto LABEL_15;
        }
        long long v22 = [v7 wrTracker];
        long long v23 = [v22 workflow];
        long long v24 = [v23 name];
        int v25 = [(STYWorkflowResponsivenessMonitorHelper *)self perDayLogLimit];
        int v26 = [(STYWorkflowResponsivenessMonitorHelper *)self perPeriodLogLimit];
        *(_DWORD *)buf = v37;
        v46 = v24;
        __int16 v47 = 1024;
        int v48 = v8;
        __int16 v49 = 1024;
        int v50 = v25;
        __int16 v51 = 1024;
        int v52 = v9;
        __int16 v53 = 1024;
        int v54 = v26;
        _os_log_impl(&dword_1D3037000, v13, OS_LOG_TYPE_DEFAULT, "Workflow %{public}@ resetting all counts (was %d/%d per day, %d/%d per period), turning on signpost streaming", buf, 0x24u);
        goto LABEL_13;
      }
      if (!v21) {
        goto LABEL_19;
      }
      v14 = [v7 wrTracker];
      v15 = [v14 workflow];
      int v16 = [v15 name];
      int v27 = [(STYWorkflowResponsivenessMonitorHelper *)self perDayLogLimit];
      int v28 = [(STYWorkflowResponsivenessMonitorHelper *)self perPeriodLogLimit];
      *(_DWORD *)buf = v37;
      v46 = v16;
      __int16 v47 = 1024;
      int v48 = v8;
      __int16 v49 = 1024;
      int v50 = v27;
      __int16 v51 = 1024;
      int v52 = v9;
      __int16 v53 = 1024;
      int v54 = v28;
      id v19 = v13;
      id v20 = "Workflow %{public}@ resetting all counts (was %d/%d per day, %d/%d per period), still above limits";
LABEL_18:
      _os_log_impl(&dword_1D3037000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x24u);

LABEL_19:
      ++v6;
    }
    while (v5 != v6);
    uint64_t v31 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
    uint64_t v5 = v31;
  }
  while (v31);

  if (v38)
  {
    [(STYWorkflowResponsivenessMonitorHelper *)self updateAllowList];
    uint64_t v32 = [(STYWorkflowResponsivenessMonitorHelper *)self settingsChangedCallbackQueue];
    if (v32)
    {
      long long v33 = (void *)v32;
      long long v34 = [(STYWorkflowResponsivenessMonitorHelper *)self settingsChangedCallback];

      if (v34)
      {
        long long v35 = [(STYWorkflowResponsivenessMonitorHelper *)self settingsChangedCallbackQueue];
        long long v36 = [(STYWorkflowResponsivenessMonitorHelper *)self settingsChangedCallback];
        id obj = v35;
        dispatch_async(v35, v36);

        goto LABEL_27;
      }
    }
  }
}

- (void)resetPerDayCounts
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [(STYWorkflowResponsivenessMonitorHelper *)self workflowEventTrackers];
  uint64_t v3 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
  if (!v3)
  {
LABEL_27:

    return;
  }
  uint64_t v5 = v3;
  char v38 = 0;
  uint64_t v40 = *(void *)v42;
  *(void *)&long long v4 = 138544386;
  long long v37 = v4;
  do
  {
    uint64_t v6 = 0;
    do
    {
      if (*(void *)v42 != v40) {
        objc_enumerationMutation(obj);
      }
      BOOL v7 = *(void **)(*((void *)&v41 + 1) + 8 * v6);
      int v8 = objc_msgSend(v7, "perDayEventCount", v37);
      int v9 = [v7 perPeriodEventCount];
      BOOL v10 = [(STYWorkflowResponsivenessMonitorHelper *)self workflowIsUnderLimits:v7];
      [v7 setPerDayEventCount:0];
      BOOL v11 = [(STYWorkflowResponsivenessMonitorHelper *)self workflowIsUnderLimits:v7];
      id v12 = +[STYFrameworkHelper sharedHelper];
      uint64_t v13 = [v12 logHandle];

      if (v10)
      {
        if (v11)
        {
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_19;
          }
          v14 = [v7 wrTracker];
          v15 = [v14 workflow];
          int v16 = [v15 name];
          int v17 = [(STYWorkflowResponsivenessMonitorHelper *)self perDayLogLimit];
          int v18 = [(STYWorkflowResponsivenessMonitorHelper *)self perPeriodLogLimit];
          *(_DWORD *)buf = v37;
          v46 = v16;
          __int16 v47 = 1024;
          int v48 = v8;
          __int16 v49 = 1024;
          int v50 = v17;
          __int16 v51 = 1024;
          int v52 = v9;
          __int16 v53 = 1024;
          int v54 = v18;
          id v19 = v13;
          id v20 = "Workflow %{public}@ resetting per day counts (was %d/%d per day, %d/%d per period), was already under limits";
          goto LABEL_18;
        }
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
LABEL_15:
          char v38 = 1;
          goto LABEL_19;
        }
        long long v22 = [v7 wrTracker];
        long long v23 = [v22 workflow];
        long long v24 = [v23 name];
        int v29 = [(STYWorkflowResponsivenessMonitorHelper *)self perDayLogLimit];
        int v30 = [(STYWorkflowResponsivenessMonitorHelper *)self perPeriodLogLimit];
        *(_DWORD *)buf = v37;
        v46 = v24;
        __int16 v47 = 1024;
        int v48 = v8;
        __int16 v49 = 1024;
        int v50 = v29;
        __int16 v51 = 1024;
        int v52 = v9;
        __int16 v53 = 1024;
        int v54 = v30;
        _os_log_fault_impl(&dword_1D3037000, v13, OS_LOG_TYPE_FAULT, "Workflow %{public}@ resetting per day counts (was %d/%d per day, %d/%d per period), was already under limits, and is now above limit!", buf, 0x24u);
LABEL_13:

        goto LABEL_15;
      }
      BOOL v21 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (!v21) {
          goto LABEL_15;
        }
        long long v22 = [v7 wrTracker];
        long long v23 = [v22 workflow];
        long long v24 = [v23 name];
        int v25 = [(STYWorkflowResponsivenessMonitorHelper *)self perDayLogLimit];
        int v26 = [(STYWorkflowResponsivenessMonitorHelper *)self perPeriodLogLimit];
        *(_DWORD *)buf = v37;
        v46 = v24;
        __int16 v47 = 1024;
        int v48 = v8;
        __int16 v49 = 1024;
        int v50 = v25;
        __int16 v51 = 1024;
        int v52 = v9;
        __int16 v53 = 1024;
        int v54 = v26;
        _os_log_impl(&dword_1D3037000, v13, OS_LOG_TYPE_DEFAULT, "Workflow %{public}@ resetting per day counts (was %d/%d per day, %d/%d per period), turning on signpost streaming", buf, 0x24u);
        goto LABEL_13;
      }
      if (!v21) {
        goto LABEL_19;
      }
      v14 = [v7 wrTracker];
      v15 = [v14 workflow];
      int v16 = [v15 name];
      int v27 = [(STYWorkflowResponsivenessMonitorHelper *)self perDayLogLimit];
      int v28 = [(STYWorkflowResponsivenessMonitorHelper *)self perPeriodLogLimit];
      *(_DWORD *)buf = v37;
      v46 = v16;
      __int16 v47 = 1024;
      int v48 = v8;
      __int16 v49 = 1024;
      int v50 = v27;
      __int16 v51 = 1024;
      int v52 = v9;
      __int16 v53 = 1024;
      int v54 = v28;
      id v19 = v13;
      id v20 = "Workflow %{public}@ resetting per day counts (was %d/%d per day, %d/%d per period), still above limits";
LABEL_18:
      _os_log_impl(&dword_1D3037000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x24u);

LABEL_19:
      ++v6;
    }
    while (v5 != v6);
    uint64_t v31 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
    uint64_t v5 = v31;
  }
  while (v31);

  if (v38)
  {
    [(STYWorkflowResponsivenessMonitorHelper *)self updateAllowList];
    uint64_t v32 = [(STYWorkflowResponsivenessMonitorHelper *)self settingsChangedCallbackQueue];
    if (v32)
    {
      long long v33 = (void *)v32;
      long long v34 = [(STYWorkflowResponsivenessMonitorHelper *)self settingsChangedCallback];

      if (v34)
      {
        long long v35 = [(STYWorkflowResponsivenessMonitorHelper *)self settingsChangedCallbackQueue];
        long long v36 = [(STYWorkflowResponsivenessMonitorHelper *)self settingsChangedCallback];
        id obj = v35;
        dispatch_async(v35, v36);

        goto LABEL_27;
      }
    }
  }
}

- (void)resetPerPeriodCounts
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [(STYWorkflowResponsivenessMonitorHelper *)self workflowEventTrackers];
  uint64_t v3 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
  if (!v3)
  {
LABEL_27:

    return;
  }
  uint64_t v5 = v3;
  char v38 = 0;
  uint64_t v40 = *(void *)v42;
  *(void *)&long long v4 = 138544386;
  long long v37 = v4;
  do
  {
    uint64_t v6 = 0;
    do
    {
      if (*(void *)v42 != v40) {
        objc_enumerationMutation(obj);
      }
      BOOL v7 = *(void **)(*((void *)&v41 + 1) + 8 * v6);
      int v8 = objc_msgSend(v7, "perDayEventCount", v37);
      int v9 = [v7 perPeriodEventCount];
      BOOL v10 = [(STYWorkflowResponsivenessMonitorHelper *)self workflowIsUnderLimits:v7];
      [v7 setPerPeriodEventCount:0];
      BOOL v11 = [(STYWorkflowResponsivenessMonitorHelper *)self workflowIsUnderLimits:v7];
      id v12 = +[STYFrameworkHelper sharedHelper];
      uint64_t v13 = [v12 logHandle];

      if (v10)
      {
        if (v11)
        {
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_19;
          }
          v14 = [v7 wrTracker];
          v15 = [v14 workflow];
          int v16 = [v15 name];
          int v17 = [(STYWorkflowResponsivenessMonitorHelper *)self perDayLogLimit];
          int v18 = [(STYWorkflowResponsivenessMonitorHelper *)self perPeriodLogLimit];
          *(_DWORD *)buf = v37;
          v46 = v16;
          __int16 v47 = 1024;
          int v48 = v8;
          __int16 v49 = 1024;
          int v50 = v17;
          __int16 v51 = 1024;
          int v52 = v9;
          __int16 v53 = 1024;
          int v54 = v18;
          id v19 = v13;
          id v20 = "Workflow %{public}@ resetting per period counts (was %d/%d per day, %d/%d per period), was already under limits";
          goto LABEL_18;
        }
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
LABEL_15:
          char v38 = 1;
          goto LABEL_19;
        }
        long long v22 = [v7 wrTracker];
        long long v23 = [v22 workflow];
        long long v24 = [v23 name];
        int v29 = [(STYWorkflowResponsivenessMonitorHelper *)self perDayLogLimit];
        int v30 = [(STYWorkflowResponsivenessMonitorHelper *)self perPeriodLogLimit];
        *(_DWORD *)buf = v37;
        v46 = v24;
        __int16 v47 = 1024;
        int v48 = v8;
        __int16 v49 = 1024;
        int v50 = v29;
        __int16 v51 = 1024;
        int v52 = v9;
        __int16 v53 = 1024;
        int v54 = v30;
        _os_log_fault_impl(&dword_1D3037000, v13, OS_LOG_TYPE_FAULT, "Workflow %{public}@ resetting per period counts (was %d/%d per day, %d/%d per period), was already under limits, and is now above limit!", buf, 0x24u);
LABEL_13:

        goto LABEL_15;
      }
      BOOL v21 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (!v21) {
          goto LABEL_15;
        }
        long long v22 = [v7 wrTracker];
        long long v23 = [v22 workflow];
        long long v24 = [v23 name];
        int v25 = [(STYWorkflowResponsivenessMonitorHelper *)self perDayLogLimit];
        int v26 = [(STYWorkflowResponsivenessMonitorHelper *)self perPeriodLogLimit];
        *(_DWORD *)buf = v37;
        v46 = v24;
        __int16 v47 = 1024;
        int v48 = v8;
        __int16 v49 = 1024;
        int v50 = v25;
        __int16 v51 = 1024;
        int v52 = v9;
        __int16 v53 = 1024;
        int v54 = v26;
        _os_log_impl(&dword_1D3037000, v13, OS_LOG_TYPE_DEFAULT, "Workflow %{public}@ resetting per period counts (was %d/%d per day, %d/%d per period), turning on signpost streaming", buf, 0x24u);
        goto LABEL_13;
      }
      if (!v21) {
        goto LABEL_19;
      }
      v14 = [v7 wrTracker];
      v15 = [v14 workflow];
      int v16 = [v15 name];
      int v27 = [(STYWorkflowResponsivenessMonitorHelper *)self perDayLogLimit];
      int v28 = [(STYWorkflowResponsivenessMonitorHelper *)self perPeriodLogLimit];
      *(_DWORD *)buf = v37;
      v46 = v16;
      __int16 v47 = 1024;
      int v48 = v8;
      __int16 v49 = 1024;
      int v50 = v27;
      __int16 v51 = 1024;
      int v52 = v9;
      __int16 v53 = 1024;
      int v54 = v28;
      id v19 = v13;
      id v20 = "Workflow %{public}@ resetting per period counts (was %d/%d per day, %d/%d per period), still above limits";
LABEL_18:
      _os_log_impl(&dword_1D3037000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x24u);

LABEL_19:
      ++v6;
    }
    while (v5 != v6);
    uint64_t v31 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
    uint64_t v5 = v31;
  }
  while (v31);

  if (v38)
  {
    [(STYWorkflowResponsivenessMonitorHelper *)self updateAllowList];
    uint64_t v32 = [(STYWorkflowResponsivenessMonitorHelper *)self settingsChangedCallbackQueue];
    if (v32)
    {
      long long v33 = (void *)v32;
      long long v34 = [(STYWorkflowResponsivenessMonitorHelper *)self settingsChangedCallback];

      if (v34)
      {
        long long v35 = [(STYWorkflowResponsivenessMonitorHelper *)self settingsChangedCallbackQueue];
        long long v36 = [(STYWorkflowResponsivenessMonitorHelper *)self settingsChangedCallback];
        id obj = v35;
        dispatch_async(v35, v36);

        goto LABEL_27;
      }
    }
  }
}

- (void)workflowEventCompleted:(id)a3 completedWRTracker:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(STYWorkflowResponsivenessMonitorHelper *)self workflowIsUnderLimits:v6];
  int v9 = +[STYFrameworkHelper sharedHelper];
  BOOL v10 = [v9 logHandle];

  if (!v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = [v7 workflow];
      long long v33 = [v32 name];
      int v37 = 138544386;
      char v38 = v33;
      __int16 v39 = 1024;
      int v40 = [v6 perDayEventCount];
      __int16 v41 = 1024;
      int v42 = [(STYWorkflowResponsivenessMonitorHelper *)self perDayLogLimit];
      __int16 v43 = 1024;
      int v44 = [v6 perPeriodEventCount];
      __int16 v45 = 1024;
      int v46 = [(STYWorkflowResponsivenessMonitorHelper *)self perPeriodLogLimit];
      _os_log_impl(&dword_1D3037000, v10, OS_LOG_TYPE_DEFAULT, "Workflow %{public}@ already exceeded limits (%d/%d per day, %d/%d per period), not reporting completed event", (uint8_t *)&v37, 0x24u);
    }
    goto LABEL_20;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    long long v35 = [v7 workflow];
    long long v36 = [v35 name];
    int v37 = 138544386;
    char v38 = v36;
    __int16 v39 = 1024;
    int v40 = [v6 perDayEventCount];
    __int16 v41 = 1024;
    int v42 = [(STYWorkflowResponsivenessMonitorHelper *)self perDayLogLimit];
    __int16 v43 = 1024;
    int v44 = [v6 perPeriodEventCount];
    __int16 v45 = 1024;
    int v46 = [(STYWorkflowResponsivenessMonitorHelper *)self perPeriodLogLimit];
    _os_log_debug_impl(&dword_1D3037000, v10, OS_LOG_TYPE_DEBUG, "Workflow %{public}@ below limits (%d/%d per day, %d/%d per period)", (uint8_t *)&v37, 0x24u);
  }
  BOOL v11 = +[STYFrameworkHelper sharedHelper];
  id v12 = [v11 logHandle];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [v7 workflow];
    v14 = [v13 name];
    int v37 = 138543362;
    char v38 = v14;
    _os_log_impl(&dword_1D3037000, v12, OS_LOG_TYPE_INFO, "Workflow %{public}@ event completed, gathering diagnostics if needed", (uint8_t *)&v37, 0xCu);
  }
  char v15 = [v7 gatherDiagnosticsIfNeeded];
  int v16 = +[STYFrameworkHelper sharedHelper];
  BOOL v10 = [v16 logHandle];

  BOOL v17 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v15 & 1) == 0)
  {
    if (!v17)
    {
LABEL_20:

      goto LABEL_21;
    }
    uint64_t v31 = [v7 workflow];
    long long v34 = [v31 name];
    int v37 = 138543362;
    char v38 = v34;
    _os_log_impl(&dword_1D3037000, v10, OS_LOG_TYPE_DEFAULT, "Workflow %{public}@ event completed, no diagnostics were needed", (uint8_t *)&v37, 0xCu);

LABEL_19:
    goto LABEL_20;
  }
  if (v17)
  {
    int v18 = [v7 workflow];
    id v19 = [v18 name];
    int v37 = 138543362;
    char v38 = v19;
    _os_log_impl(&dword_1D3037000, v10, OS_LOG_TYPE_DEFAULT, "Workflow %{public}@ event completed, diagnostics were kicked off", (uint8_t *)&v37, 0xCu);
  }
  objc_msgSend(v6, "setPerPeriodEventCount:", objc_msgSend(v6, "perPeriodEventCount") + 1);
  objc_msgSend(v6, "setPerDayEventCount:", objc_msgSend(v6, "perDayEventCount") + 1);
  if (![(STYWorkflowResponsivenessMonitorHelper *)self workflowIsUnderLimits:v6])
  {
    id v20 = +[STYFrameworkHelper sharedHelper];
    BOOL v21 = [v20 logHandle];

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      long long v22 = [v7 workflow];
      long long v23 = [v22 name];
      int v24 = [v6 perDayEventCount];
      int v25 = [(STYWorkflowResponsivenessMonitorHelper *)self perDayLogLimit];
      int v26 = [v6 perPeriodEventCount];
      int v27 = [(STYWorkflowResponsivenessMonitorHelper *)self perPeriodLogLimit];
      int v37 = 138544386;
      char v38 = v23;
      __int16 v39 = 1024;
      int v40 = v24;
      __int16 v41 = 1024;
      int v42 = v25;
      __int16 v43 = 1024;
      int v44 = v26;
      __int16 v45 = 1024;
      int v46 = v27;
      _os_log_impl(&dword_1D3037000, v21, OS_LOG_TYPE_DEFAULT, "Workflow %{public}@ hit report limit (%d/%d per day, %d/%d per period), turning off signpost streaming", (uint8_t *)&v37, 0x24u);
    }
    [(STYWorkflowResponsivenessMonitorHelper *)self updateAllowList];
    uint64_t v28 = [(STYWorkflowResponsivenessMonitorHelper *)self settingsChangedCallbackQueue];
    if (v28)
    {
      int v29 = (void *)v28;
      int v30 = [(STYWorkflowResponsivenessMonitorHelper *)self settingsChangedCallback];

      if (v30)
      {
        BOOL v10 = [(STYWorkflowResponsivenessMonitorHelper *)self settingsChangedCallbackQueue];
        uint64_t v31 = [(STYWorkflowResponsivenessMonitorHelper *)self settingsChangedCallback];
        dispatch_async(v10, v31);
        goto LABEL_19;
      }
    }
  }
LABEL_21:
}

- (void)updateAllowList
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [(STYWorkflowResponsivenessMonitorHelper *)self workflowEventTrackers];
  uint64_t v3 = [obj countByEnumeratingWithState:&v31 objects:v45 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(obj);
        }
        BOOL v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        BOOL v9 = [(STYWorkflowResponsivenessMonitorHelper *)self workflowIsUnderLimits:v8];
        BOOL v10 = +[STYFrameworkHelper sharedHelper];
        BOOL v11 = [v10 logHandle];

        BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
        if (v9)
        {
          if (v12)
          {
            uint64_t v28 = [v8 wrTracker];
            int v26 = [v28 workflow];
            char v15 = [v26 name];
            int v25 = [v8 perDayEventCount];
            int v16 = [(STYWorkflowResponsivenessMonitorHelper *)self perDayLogLimit];
            int v17 = [v8 perPeriodEventCount];
            int v18 = [(STYWorkflowResponsivenessMonitorHelper *)self perPeriodLogLimit];
            *(_DWORD *)buf = 138544386;
            long long v36 = v15;
            __int16 v37 = 1024;
            int v38 = v25;
            __int16 v39 = 1024;
            int v40 = v16;
            __int16 v41 = 1024;
            int v42 = v17;
            __int16 v43 = 1024;
            int v44 = v18;
            _os_log_debug_impl(&dword_1D3037000, v11, OS_LOG_TYPE_DEBUG, "Workflow %{public}@ is below limit (%d/%d per day, %d/%d per period), including in allowlist", buf, 0x24u);
          }
          if (!v5) {
            id v5 = objc_alloc_init(MEMORY[0x1E4F9F7C0]);
          }
          BOOL v11 = [v8 wrTracker];
          uint64_t v13 = [v11 workflow];
          v14 = [v13 allowListForDiagnostics];
          [v5 addAllowlist:v14];
        }
        else if (v12)
        {
          int v29 = [v8 wrTracker];
          int v27 = [v29 workflow];
          id v19 = [v27 name];
          int v20 = [v8 perDayEventCount];
          int v21 = [(STYWorkflowResponsivenessMonitorHelper *)self perDayLogLimit];
          int v22 = [v8 perPeriodEventCount];
          int v23 = [(STYWorkflowResponsivenessMonitorHelper *)self perPeriodLogLimit];
          *(_DWORD *)buf = 138544386;
          long long v36 = v19;
          __int16 v37 = 1024;
          int v38 = v20;
          __int16 v39 = 1024;
          int v40 = v21;
          __int16 v41 = 1024;
          int v42 = v22;
          __int16 v43 = 1024;
          int v44 = v23;
          _os_log_debug_impl(&dword_1D3037000, v11, OS_LOG_TYPE_DEBUG, "Workflow %{public}@ is above limit (%d/%d per day, %d/%d per period), not including in allowlist", buf, 0x24u);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v45 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  allowList = self->_allowList;
  self->_allowList = (SignpostSupportSubsystemCategoryAllowlist *)v5;
}

- (int)periodLengthSec
{
  return self->_periodLengthSec;
}

- (void)setPeriodLengthSec:(int)a3
{
  int periodLengthSec = self->_periodLengthSec;
  self->_int periodLengthSec = a3;
  if (periodLengthSec != a3)
  {
    uint64_t v6 = [(STYSignpostsMonitorHelper *)self processingQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__STYWorkflowResponsivenessMonitorHelper_setPeriodLengthSec___block_invoke;
    v7[3] = &unk_1E6971B28;
    v7[4] = self;
    int v8 = periodLengthSec;
    int v9 = a3;
    dispatch_async(v6, v7);
  }
}

void __61__STYWorkflowResponsivenessMonitorHelper_setPeriodLengthSec___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) perPeriodTimer];

  if (v2)
  {
    uint64_t v3 = +[STYFrameworkHelper sharedHelper];
    uint64_t v4 = [v3 logHandle];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(_DWORD *)(a1 + 40);
      int v6 = *(_DWORD *)(a1 + 44);
      v8[0] = 67109376;
      v8[1] = v5;
      __int16 v9 = 1024;
      int v10 = v6;
      _os_log_impl(&dword_1D3037000, v4, OS_LOG_TYPE_DEFAULT, "Workflow Responsiveness logging period changed from %ds to %ds while actively monitoring", (uint8_t *)v8, 0xEu);
    }

    [*(id *)(a1 + 32) resetPerPeriodCounts];
    id v7 = [*(id *)(a1 + 32) perPeriodTimer];
    dispatch_source_set_timer(v7, 0xFFFFFFFFFFFFFFFELL, 1000000000 * (int)[*(id *)(a1 + 32) periodLengthSec], 1000000000 * (int)objc_msgSend(*(id *)(a1 + 32), "periodLengthSec") / 0xAuLL);
  }
}

- (int)perDayLogLimit
{
  return self->_perDayLogLimit;
}

- (void)setPerDayLogLimit:(int)a3
{
  self->_perDayLogLimit = a3;
}

- (int)perPeriodLogLimit
{
  return self->_perPeriodLogLimit;
}

- (void)setPerPeriodLogLimit:(int)a3
{
  self->_perPeriodLogLimit = a3;
}

- (WRWorkflowProvider)workflowProvider
{
  return (WRWorkflowProvider *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWorkflowProvider:(id)a3
{
}

- (NSArray)workflowEventTrackers
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setWorkflowEventTrackers:(id)a3
{
}

- (OS_dispatch_queue)settingsChangedCallbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSettingsChangedCallbackQueue:(id)a3
{
}

- (id)settingsChangedCallback
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setSettingsChangedCallback:(id)a3
{
}

- (OS_dispatch_source)perDayTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPerDayTimer:(id)a3
{
}

- (OS_dispatch_source)perPeriodTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPerPeriodTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perPeriodTimer, 0);
  objc_storeStrong((id *)&self->_perDayTimer, 0);
  objc_storeStrong(&self->_settingsChangedCallback, 0);
  objc_storeStrong((id *)&self->_settingsChangedCallbackQueue, 0);
  objc_storeStrong((id *)&self->_workflowEventTrackers, 0);
  objc_storeStrong((id *)&self->_workflowProvider, 0);
  objc_storeStrong((id *)&self->_allowList, 0);
}

@end