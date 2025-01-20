@interface SBPencilSqueezeActionControl
- (BOOL)_shouldPerformAction:(__CFString *)a3 withReason:;
- (BOOL)performSqueezeActionWithTimestamp:(uint64_t)a1;
- (id)_runnerClientForAction:(void *)a3 timestamp:;
- (id)initWithDefaults:(void *)a1;
- (void)_runnerClientDidFinish:(void *)a3 withResult:(int)a4 cancelled:;
- (void)_updateSelectedAction;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
@end

@implementation SBPencilSqueezeActionControl

- (id)initWithDefaults:(void *)a1
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = v4;
  if (a1)
  {
    if (!v4)
    {
      v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"defaults != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        [(SBPencilSqueezeActionControl *)sel_initWithDefaults_ initWithDefaults:(uint64_t)v17];
      }
      [v17 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8C8F7B0);
    }
    v21.receiver = a1;
    v21.super_class = (Class)SBPencilSqueezeActionControl;
    v6 = (id *)objc_msgSendSuper2(&v21, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong(v6 + 1, a2);
      objc_initWeak(&location, v7);
      v8 = [NSString stringWithUTF8String:"squeezeConfiguredActionArchive"];
      v22[0] = v8;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      id v10 = MEMORY[0x1E4F14428];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __49__SBPencilSqueezeActionControl_initWithDefaults___block_invoke;
      v18[3] = &unk_1E6AF4B10;
      objc_copyWeak(&v19, &location);
      id v11 = (id)[v5 observeDefaults:v9 onQueue:MEMORY[0x1E4F14428] withBlock:v18];

      -[SBPencilSqueezeActionControl _updateSelectedAction]((uint64_t)v7);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    v12 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      v14 = v7;
    }
    else {
      v14 = 0;
    }
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __49__SBPencilSqueezeActionControl_initWithDefaults___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBPencilSqueezeActionControl _updateSelectedAction]((uint64_t)WeakRetained);
}

- (void)_updateSelectedAction
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "(%{public}@) Error unarchiving squeeze action: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (BOOL)performSqueezeActionWithTimestamp:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"timestamp != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        [(SBPencilSqueezeActionControl *)sel_performSqueezeActionWithTimestamp_ performSqueezeActionWithTimestamp:(uint64_t)v16];
      }
      [v16 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8C8FCE8);
    }
    __int16 v5 = SBLogPencilSqueeze();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = a1;
      __int16 v20 = 2114;
      objc_super v21 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) requested to perform action with timestamp: %{public}@", buf, 0x16u);
    }

    uint64_t v6 = (__CFString *)*(id *)(a1 + 16);
    v17 = 0;
    BOOL v7 = -[SBPencilSqueezeActionControl _shouldPerformAction:withReason:](a1, (uint64_t)v6, &v17);
    v8 = v17;
    if (v7)
    {
      v9 = -[SBPencilSqueezeActionControl _runnerClientForAction:timestamp:](a1, v6, v4);
      id v10 = *(void **)(a1 + 24);
      if (v10)
      {
        if (([v10 containsObject:v9] & 1) == 0) {
          [*(id *)(a1 + 24) addObject:v9];
        }
      }
      else
      {
        uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithObject:v9];
        v12 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v11;
      }
      uint64_t v13 = SBLogPencilSqueeze();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543875;
        uint64_t v19 = a1;
        __int16 v20 = 2113;
        objc_super v21 = v6;
        __int16 v22 = 2114;
        v23 = v9;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "(%{public}@) performing action '%{private}@' with runner client '%{public}@'", buf, 0x20u);
      }

      [v9 startWithPreciseTimeStamp:v4];
      if ((AnalyticsSendEventLazy() & 1) == 0)
      {
        v14 = SBLogPencilSqueeze();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[SBPencilSqueezeActionControl performSqueezeActionWithTimestamp:](v14);
        }
      }
    }
    else
    {
      v9 = SBLogPencilSqueeze();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543875;
        uint64_t v19 = a1;
        __int16 v20 = 2114;
        objc_super v21 = v8;
        __int16 v22 = 2113;
        v23 = v6;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) Disallowing action (%{public}@); action: %{private}@",
          buf,
          0x20u);
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldPerformAction:(__CFString *)a3 withReason:
{
  if (!a1) {
    return 0;
  }
  if (a2) {
    __int16 v5 = 0;
  }
  else {
    __int16 v5 = @"no action to perform";
  }
  uint64_t v6 = [(id)SBApp lockOutController];
  BOOL v7 = v6;
  if (a2)
  {
    if ([v6 isBlocked])
    {
      __int16 v5 = @"device is blocked out";
      if (!a3) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    if (([v7 isProximityReaderBlocked] & 1) == 0)
    {
      id v10 = +[SBSetupManager sharedInstance];
      if ([v10 isInSetupMode]) {
        __int16 v5 = @"device is in setup mode";
      }
      else {
        __int16 v5 = 0;
      }

      if (!a3) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    __int16 v5 = @"device is proximity reader blocked out";
  }
  if (a3) {
LABEL_12:
  }
    *a3 = v5;
LABEL_13:
  BOOL v8 = v5 == 0;

  return v8;
}

- (id)_runnerClientForAction:(void *)a3 timestamp:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    BOOL v7 = *(void **)(a1 + 24);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__SBPencilSqueezeActionControl__runnerClientForAction_timestamp___block_invoke;
    v13[3] = &unk_1E6B09058;
    id v8 = v5;
    id v14 = v8;
    uint64_t v9 = objc_msgSend(v7, "bs_firstObjectPassingTest:", v13);
    if (v9)
    {
      id v10 = (void *)v9;
      uint64_t v11 = SBLogPencilSqueeze();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543875;
        uint64_t v16 = a1;
        __int16 v17 = 2114;
        v18 = v10;
        __int16 v19 = 2113;
        id v20 = v8;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "(%{public}@) found active runner %{public}@ to use for action: %{private}@", buf, 0x20u);
      }
    }
    else
    {
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB4830]) initWithSystemAction:v8 preciseTimeStamp:v6];
      [v10 setDelegate:a1];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

id __66__SBPencilSqueezeActionControl_performSqueezeActionWithTimestamp___block_invoke()
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v5[0] = &unk_1F334ACE8;
  v4[0] = @"action";
  v4[1] = @"bundleId_category";
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 bundleIdentifier];
  v5[1] = v1;
  v5[2] = &unk_1F334AD00;
  v4[2] = @"pencilVersion";
  v4[3] = @"trigger";
  v5[3] = &unk_1F334AD18;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];

  return v2;
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
}

- (void)_runnerClientDidFinish:(void *)a3 withResult:(int)a4 cancelled:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    int v9 = [*(id *)(a1 + 24) containsObject:v7];
    id v10 = SBLogPencilSqueeze();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        int v12 = 138544386;
        uint64_t v13 = a1;
        __int16 v14 = 2114;
        id v15 = v7;
        __int16 v16 = 1024;
        BOOL v17 = v8 == 0;
        __int16 v18 = 1024;
        int v19 = a4;
        __int16 v20 = 2114;
        id v21 = v8;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "(%{public}@) runner '%{public}@' did finish successfully: %{BOOL}u\n    cancelled: %{BOOL}u\n    error: %{public}@", (uint8_t *)&v12, 0x2Cu);
      }

      [*(id *)(a1 + 24) removeObject:v7];
    }
    else
    {
      if (v11)
      {
        int v12 = 138543618;
        uint64_t v13 = a1;
        __int16 v14 = 2114;
        id v15 = v7;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "(%{public}@) skipping finished result from no-longer-tracked runner client '%{public}@'", (uint8_t *)&v12, 0x16u);
      }
    }
  }
}

uint64_t __65__SBPencilSqueezeActionControl__runnerClientForAction_timestamp___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasCompletedRun])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [v3 action];
    uint64_t v4 = [v5 isEqual:*(void *)(a1 + 32)];
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningRunnerClients, 0);
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

- (void)initWithDefaults:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  OUTLINED_FUNCTION_0_19();
  uint64_t v10 = a2;
  __int16 v11 = v8;
  int v12 = @"SBPencilSqueezeActionControl.m";
  __int16 v13 = 1024;
  int v14 = 66;
  __int16 v15 = v8;
  uint64_t v16 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v9, 0x3Au);
}

- (void)performSqueezeActionWithTimestamp:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  OUTLINED_FUNCTION_0_19();
  uint64_t v10 = a2;
  __int16 v11 = v8;
  int v12 = @"SBPencilSqueezeActionControl.m";
  __int16 v13 = 1024;
  int v14 = 84;
  __int16 v15 = v8;
  uint64_t v16 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v9, 0x3Au);
}

- (void)performSqueezeActionWithTimestamp:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Failed to send CA event", v1, 2u);
}

@end