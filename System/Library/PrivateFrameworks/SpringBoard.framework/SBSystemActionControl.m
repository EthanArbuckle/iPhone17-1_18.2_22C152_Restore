@interface SBSystemActionControl
- (BOOL)_cancelPreviewingSelectedActionFromSource:(uint64_t)a1;
- (BOOL)_shouldPerformAction:(void *)a3 withSuppressionStatus:(void *)a4 reason:(unsigned char *)a5 isSuppressed:;
- (BOOL)systemActionCoachingController:(id)a3 canPresentCoachingForAction:(id)a4;
- (id)_executionHandlerForExecutor:(void *)a1;
- (id)_executorForSystemAction:(uint64_t)a1;
- (id)_feedbackForAction:(uint64_t)a1;
- (id)initWithDataSource:(void *)a3 previewCoordinator:(void *)a4 authenticationStatusProvider:(void *)a5 coachingController:(void *)a6 soundController:;
- (id)performSelectedActionFromSource:(void *)a3 withContext:;
- (id)previewSelectedActionFromSource:(void *)a3 withSuppressionStatus:;
- (uint64_t)isSelectedActionHostedByApplicationWithBundleIdentifier:(uint64_t)result;
- (uint64_t)removeObserver:(uint64_t)result;
- (uint64_t)selectedActionAnalyticsData;
- (void)_activateFeedbackForAction:(uint64_t)a1;
- (void)_cancelCameraPrewarmIfNecessaryForAction:(uint64_t)a1;
- (void)_configureWithSelectedAction;
- (void)_deactivateFeedbackForAction:(uint64_t)a1;
- (void)_executor:(void *)a3 didFinishPerformingAction:(void *)a4 withResult:;
- (void)_noteFailedToPreviewAction:(uint64_t)a1;
- (void)_noteWillPerformAction:(uint64_t)a1;
- (void)_noteWillPreviewAction:(uint64_t)a1;
- (void)_notifyDidUpdateActionInteractionConfiguration;
- (void)_playFeedbackForAction:(uint64_t)a1;
- (void)_prewarmCameraIfNecessaryForAction:(uint64_t)a1;
- (void)addObserver:(uint64_t)a1;
- (void)addSystemActionValidator:(uint64_t)a1;
- (void)systemActionDataSource:(id)a3 didUpdateSelectedAction:(id)a4;
@end

@implementation SBSystemActionControl

- (uint64_t)isSelectedActionHostedByApplicationWithBundleIdentifier:(uint64_t)result
{
  if (result)
  {
    v2 = *(void **)(result + 32);
    id v3 = a2;
    v4 = [v2 selectedSystemAction];
    v5 = [v4 hostBundleIdentifier];

    uint64_t v6 = [v3 isEqualToString:v5];
    return v6;
  }
  return result;
}

- (id)initWithDataSource:(void *)a3 previewCoordinator:(void *)a4 authenticationStatusProvider:(void *)a5 coachingController:(void *)a6 soundController:
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id obj = a6;
  id v16 = a6;
  v17 = v16;
  if (!a1) {
    goto LABEL_9;
  }
  if (!v12)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"dataSource != ((void *)0)", obj];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionControl initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:]();
    }
LABEL_24:
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D88CD010);
  }
  if (!v13)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"previewCoordinator != ((void *)0)", obj];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionControl initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D88CD078);
  }
  if (!v14)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"authenticationStatusProvider != ((void *)0)", obj];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionControl initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D88CD0E0);
  }
  if (!v15)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"coachingController != ((void *)0)", obj];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionControl initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:].cold.4();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D88CD148);
  }
  if (!v16)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"soundController != ((void *)0)", obj];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionControl initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:].cold.5();
    }
    goto LABEL_24;
  }
  v25.receiver = a1;
  v25.super_class = (Class)SBSystemActionControl;
  v18 = (id *)objc_msgSendSuper2(&v25, sel_init);
  a1 = v18;
  if (v18)
  {
    objc_storeStrong(v18 + 4, a2);
    [v12 addObserver:a1];
    objc_storeStrong(a1 + 5, a3);
    objc_storeStrong(a1 + 6, a4);
    objc_storeStrong(a1 + 7, a5);
    -[SBHomeScreenConfigurationServer setDelegate:]((id *)a1[7], a1);
    objc_storeStrong(a1 + 8, obj);
    -[SBSystemActionControl _configureWithSelectedAction]((uint64_t)a1);
  }
LABEL_9:

  return a1;
}

- (void)_configureWithSelectedAction
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (uint64_t)selectedActionAnalyticsData
{
  if (!a1) {
    return 0;
  }
  SEL v1 = [*(id *)(a1 + 32) selectedSystemAction];
  uint64_t v2 = [v1 analyticsData];

  return v2;
}

- (void)addObserver:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 8);
    id v7 = v3;
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v6 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v5;

      uint64_t v4 = *(void **)(a1 + 8);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (uint64_t)removeObserver:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 8) removeObject:a2];
  }
  return result;
}

- (void)addSystemActionValidator:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      uint64_t v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)previewSelectedActionFromSource:(void *)a3 withSuppressionStatus:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (![v5 length])
    {
      v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[source length] > 0"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSystemActionControl previewSelectedActionFromSource:withSuppressionStatus:]();
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D88CDB20);
    }
    id v7 = a1[4];
    uint64_t v8 = [v7 selectedSystemAction];

    unsigned __int8 v28 = 0;
    id v27 = 0;
    BOOL v9 = -[SBSystemActionControl _shouldPerformAction:withSuppressionStatus:reason:isSuppressed:]((uint64_t)a1, v8, v6, &v27, &v28);
    id v10 = v27;
    uint64_t v11 = 2 * v28;
    id v12 = +[SBSystemActionAnalyticsTracker sharedTracker]();
    -[SBSystemActionAnalyticsTracker trackInteractionWithType:forAction:suppressionStatus:]((uint64_t)v12, v11, v8, v6);

    if (v9)
    {
      id v13 = SBLogSystemActionControl();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v30 = a1;
        __int16 v31 = 2114;
        id v32 = v5;
        __int16 v33 = 2114;
        id v34 = v6;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "(%{public}@) requested to preview selected action from source '%{public}@' with suppression status: %{public}@", buf, 0x20u);
      }

      id v14 = a1[9];
      if (v14)
      {
        id v15 = SBLogSystemActionControl();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v30 = a1;
          __int16 v31 = 2114;
          id v32 = v14;
          _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "(%{public}@) cannot preview action; an executor is already previewing: %{public}@",
            buf,
            0x16u);
        }
        a1 = 0;
      }
      else
      {
        id v15 = -[SBSystemActionControl _executorForSystemAction:]((uint64_t)a1, v8);
        -[SBSystemActionControl _noteWillPreviewAction:]((uint64_t)a1, v8);
        id v17 = a1[5];
        objc_storeStrong(a1 + 9, v15);
        v18 = [v15 previewWithCoordinator:v17];
        if (v18)
        {
          -[SBSystemActionControl _cancelCameraPrewarmIfNecessaryForAction:]((uint64_t)a1, v8);
          [a1[10] invalidate];
          id v19 = a1[10];
          a1[10] = 0;

          id v20 = a1[9];
          a1[9] = 0;

          a1 = 0;
        }
        else
        {
          id v22 = objc_alloc(MEMORY[0x1E4F4F838]);
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __79__SBSystemActionControl_previewSelectedActionFromSource_withSuppressionStatus___block_invoke;
          v25[3] = &unk_1E6AFD050;
          v25[4] = a1;
          id v26 = v5;
          a1 = (id *)[v22 initWithIdentifier:@"SBSystemAction-Previewing" forReason:v26 invalidationBlock:v25];
        }
      }
    }
    else
    {
      if (v28)
      {
        id v16 = SBLogSystemActionSuppression();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v30 = a1;
          __int16 v31 = 2114;
          id v32 = v8;
          __int16 v33 = 2114;
          id v34 = v10;
          _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "(%{public}@) Suppressing action: %{public}@; %{public}@",
            buf,
            0x20u);
        }
      }
      else
      {
        v21 = SBLogSystemActionControl();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v30 = a1;
          __int16 v31 = 2114;
          id v32 = v10;
          __int16 v33 = 2114;
          id v34 = v8;
          _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "(%{public}@) Disallowing action (%{public}@); action: %{public}@",
            buf,
            0x20u);
        }

        [a1[5] provideDiscreteNoActionInteractionFeedback];
      }
      a1 = 0;
    }
  }
  return a1;
}

- (BOOL)_shouldPerformAction:(void *)a3 withSuppressionStatus:(void *)a4 reason:(unsigned char *)a5 isSuppressed:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  if (!a1)
  {
    BOOL v34 = 0;
    goto LABEL_42;
  }
  uint64_t v11 = [(id)SBApp lockOutController];
  if ([v11 isBlocked])
  {
    id v12 = @"device is blocked out";
  }
  else if ([v11 isProximityReaderBlocked])
  {
    id v12 = @"device is prox reader locked out";
  }
  else
  {
    id v13 = +[SBSOSEventHandler sharedInstance];
    char v14 = [v13 isSOSActive];

    if (v14)
    {
      id v12 = @"SOS is active";
    }
    else
    {
      id v15 = +[SBWorkspace mainWorkspace];
      char v16 = [v15 isPowerDownTransientOverlayTopmost];

      if (v16)
      {
        id v12 = @"Power down overlay is active";
      }
      else
      {
        if (v10
          && -[SBCameraActivationManager workspace]((uint64_t)v10) == 1
          && ([v9 shouldBePerformedWhenSuppressed] & 1) == 0)
        {
          uint64_t v17 = [NSString stringWithFormat:@"suppression status: %@", v10];
          id v12 = (__CFString *)v17;
          if (a5) {
            *a5 = 1;
          }
          if (v17) {
            goto LABEL_39;
          }
        }
        v18 = [v9 configuredAction];
        id v19 = [v18 sectionIdentifier];
        char v20 = [v19 isEqualToString:@"Nothing"];

        if (v20)
        {
          id v12 = @"don't perform the nothing action";
        }
        else if (([v9 canBePerformedInSetupMode] & 1) != 0 {
               || (+[SBSetupManager sharedInstance],
        }
                   v21 = objc_claimAutoreleasedReturnValue(),
                   char v22 = [v21 isInSetupMode],
                   v21,
                   (v22 & 1) == 0))
        {
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v23 = *(id *)(a1 + 16);
          uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v43 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            v36 = v11;
            id v37 = v10;
            id v12 = 0;
            uint64_t v26 = *(void *)v39;
            do
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v39 != v26) {
                  objc_enumerationMutation(v23);
                }
                if (([*(id *)(*((void *)&v38 + 1) + 8 * i) shouldPreviewSystemAction:v9] & 1) == 0)
                {
                  unsigned __int8 v28 = NSString;
                  v29 = (objc_class *)objc_opt_class();
                  v30 = NSStringFromClass(v29);
                  uint64_t v31 = [v28 stringWithFormat:@"%@ did not validate previewing the action", v30];

                  id v12 = (__CFString *)v31;
                }
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v38 objects:v43 count:16];
            }
            while (v25);

            id v10 = v37;
            uint64_t v11 = v36;
            if (v12) {
              goto LABEL_39;
            }
          }
          else
          {
          }
          if ([v9 hostBundleRequiresValidation])
          {
            id v32 = [v9 hostBundleIdentifier];
            __int16 v33 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v32 allowPlaceholder:0 error:0];
            if (v33) {
              id v12 = 0;
            }
            else {
              id v12 = @"host bundle does not exist";
            }
          }
          else
          {
            id v12 = 0;
          }
        }
        else
        {
          id v12 = @"device is in setup mode";
        }
      }
    }
  }
LABEL_39:
  if (a4) {
    *a4 = v12;
  }
  BOOL v42 = v12 == 0;

  BOOL v34 = v42;
LABEL_42:

  return v34;
}

- (id)_executorForSystemAction:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 24);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __50__SBSystemActionControl__executorForSystemAction___block_invoke;
    char v16 = &unk_1E6AFD0A0;
    id v6 = v3;
    id v17 = v6;
    uint64_t v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", &v13);
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      id v9 = SBLogSystemActionControl();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v19 = a1;
        __int16 v20 = 2114;
        v21 = v8;
        __int16 v22 = 2114;
        id v23 = v6;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) found running executor %{public}@ to use for action: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      id v9 = *(id *)(a1 + 32);
      uint64_t v10 = [v9 executorForSystemAction:v6];
      if (!v10)
      {
        uint64_t v10 = [v6 newExecutor];
        if (!v10)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(%@) cannot preview selected action '%@' without an executor; dataSource: %@",
            a1,
            v6,
            v9,
            v13,
            v14,
            v15,
          id v12 = v16);
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[SBSystemActionControl _executorForSystemAction:]();
          }
          [v12 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1D88CE0B0);
        }
      }
      uint64_t v8 = (void *)v10;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)_noteWillPreviewAction:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[SBSystemActionControl _prewarmCameraIfNecessaryForAction:](a1, v3);
    -[SBSystemActionControl _activateFeedbackForAction:](a1, (uint64_t)v3);
  }
}

- (void)_noteFailedToPreviewAction:(uint64_t)a1
{
  if (a1)
  {
    -[SBSystemActionControl _cancelCameraPrewarmIfNecessaryForAction:](a1, a2);
    [*(id *)(a1 + 80) invalidate];
    id v3 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = 0;
  }
}

BOOL __79__SBSystemActionControl_previewSelectedActionFromSource_withSuppressionStatus___block_invoke(uint64_t a1)
{
  return -[SBSystemActionControl _cancelPreviewingSelectedActionFromSource:](*(void *)(a1 + 32), *(void **)(a1 + 40));
}

- (BOOL)_cancelPreviewingSelectedActionFromSource:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (![v3 length])
    {
      id v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[source length] > 0"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSystemActionControl _cancelPreviewingSelectedActionFromSource:]();
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D88CE320);
    }
    id v5 = *(id *)(a1 + 72);
    BOOL v6 = v5 != 0;
    if (v5)
    {
      uint64_t v7 = SBLogSystemActionControl();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v14 = a1;
        __int16 v15 = 2114;
        char v16 = v4;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) Cancelling previewing selected action from source '%{public}@'", buf, 0x16u);
      }

      uint64_t v8 = [v5 systemAction];
      -[SBSystemActionControl _cancelCameraPrewarmIfNecessaryForAction:](a1, v8);
      [*(id *)(a1 + 80) invalidate];
      id v9 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = 0;

      [v5 cancelPreviewing];
      uint64_t v10 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)performSelectedActionFromSource:(void *)a3 withContext:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (![v5 length])
    {
      v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[source length] > 0"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSystemActionControl performSelectedActionFromSource:withContext:](sel_performSelectedActionFromSource_withContext_);
      }
      [v29 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D88CE890);
    }
    if (!v6)
    {
      v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"context != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSystemActionControl performSelectedActionFromSource:withContext:](sel_performSelectedActionFromSource_withContext_);
      }
      [v30 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D88CE8F4);
    }
    uint64_t v7 = SBLogSystemActionControl();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v36 = a1;
      __int16 v37 = 2114;
      id v38 = v5;
      __int16 v39 = 2114;
      id v40 = v6;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) requested to perform selected action from source '%{public}@' with context: %{public}@", buf, 0x20u);
    }

    id v8 = *(id *)(a1 + 72);
    if (v8)
    {
      id v9 = -[SBHomeScreenConfigurationServer authenticator]((uint64_t)v6);
      if (-[SBCameraActivationManager workspace]((uint64_t)v9) == 1)
      {
        uint64_t v10 = [v8 systemAction];
        char v11 = [v10 shouldBePerformedWhenSuppressed];

        if ((v11 & 1) == 0)
        {
          id v12 = SBLogSystemActionSuppression();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = [v8 systemAction];
            uint64_t v14 = -[SBHomeScreenConfigurationServer authenticator]((uint64_t)v6);
            *(_DWORD *)buf = 138543874;
            uint64_t v36 = a1;
            __int16 v37 = 2114;
            id v38 = v13;
            __int16 v39 = 2114;
            id v40 = v14;
            _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "(%{public}@) Suppressing action: %{public}@, suppression status: %{public}@", buf, 0x20u);
          }
          -[SBSystemActionControl _cancelPreviewingSelectedActionFromSource:](a1, v5);
          __int16 v15 = +[SBSystemActionAnalyticsTracker sharedTracker]();
          char v16 = [v8 systemAction];
          uint64_t v17 = -[SBHomeScreenConfigurationServer authenticator]((uint64_t)v6);
          -[SBSystemActionAnalyticsTracker trackInteractionWithType:forAction:suppressionStatus:]((uint64_t)v15, 2, v16, v17);

LABEL_14:
          a1 = 0;
LABEL_25:

          goto LABEL_26;
        }
      }
      else
      {
      }
      v18 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = 0;

      uint64_t v19 = *(void **)(a1 + 24);
      if (v19)
      {
        [v19 addObject:v8];
      }
      else
      {
        uint64_t v20 = [MEMORY[0x1E4F1CA48] arrayWithObject:v8];
        v21 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v20;
      }
      __int16 v22 = [v8 systemAction];
      if (!v22)
      {
        uint64_t v31 = [NSString stringWithFormat:@"Expected to get a valid action at this point"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[SBSystemActionControl performSelectedActionFromSource:withContext:]();
        }
        [v31 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1D88CE94CLL);
      }
      id v23 = SBLogSystemActionControl();
      if (os_signpost_enabled(v23))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v36 = a1;
        __int16 v37 = 2114;
        id v38 = v22;
        __int16 v39 = 2114;
        id v40 = v8;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v23, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_SYSTEM_ACTION_PERFORM_EXECUTION", "(%{public}@) performing action '%{public}@' with executor '%{public}@'", buf, 0x20u);
      }

      kdebug_trace();
      uint64_t v24 = SBLogSystemActionControl();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v36 = a1;
        __int16 v37 = 2114;
        id v38 = v22;
        __int16 v39 = 2114;
        id v40 = v8;
        _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "(%{public}@) performing action '%{public}@' with executor '%{public}@'", buf, 0x20u);
      }

      uint64_t v25 = +[SBSystemActionAnalyticsTracker sharedTracker]();
      uint64_t v26 = -[SBHomeScreenConfigurationServer authenticator]((uint64_t)v6);
      -[SBSystemActionAnalyticsTracker trackInteractionWithType:forAction:suppressionStatus:]((uint64_t)v25, 1, v22, v26);

      -[SBSystemActionControl _noteWillPerformAction:](a1, v22);
      id v27 = -[SBSystemActionControl _executionHandlerForExecutor:]((void *)a1, v8);
      objc_initWeak((id *)buf, (id)a1);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __69__SBSystemActionControl_performSelectedActionFromSource_withContext___block_invoke;
      v32[3] = &unk_1E6AFD078;
      objc_copyWeak(&v34, (id *)buf);
      __int16 v15 = v22;
      __int16 v33 = v15;
      a1 = [v8 executeWithContext:v6 executionHandler:v27 completion:v32];

      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)buf);

      goto LABEL_25;
    }
    __int16 v15 = SBLogSystemActionControl();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = a1;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "(%{public}@) no action to perform since no action is previewing", buf, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_26:

  return (id)a1;
}

- (void)_noteWillPerformAction:(uint64_t)a1
{
  id v10 = a2;
  if (a1)
  {
    -[SBSystemActionControl _playFeedbackForAction:](a1, (uint64_t)v10);
    [*(id *)(a1 + 80) invalidate];
    id v3 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = 0;

    if ([v10 shouldWakeScreenWhenPerformed])
    {
      uint64_t v4 = [*(id *)(a1 + 40) windowScene];
      id v5 = [v4 lockScreenManager];
      id v6 = NSString;
      uint64_t v7 = [v10 configuredAction];
      id v8 = [v7 identifier];
      id v9 = [v6 stringWithFormat:@"Performing action: %@", v8];

      [v5 requestUserAttentionScreenWakeFromSource:39 reason:v9];
    }
  }
}

- (id)_executionHandlerForExecutor:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __54__SBSystemActionControl__executionHandlerForExecutor___block_invoke;
    id v10 = &unk_1E6AFD0C8;
    char v11 = a1;
    id v12 = v3;
    id v5 = (void *)MEMORY[0x1D948C7A0](&v7);
    a1 = objc_msgSend(v5, "copy", v7, v8, v9, v10, v11);
  }
  return a1;
}

void __69__SBSystemActionControl_performSelectedActionFromSource_withContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  -[SBSystemActionControl _executor:didFinishPerformingAction:withResult:]((uint64_t)WeakRetained, v7, *(void **)(a1 + 32), v6);
}

- (void)_executor:(void *)a3 didFinishPerformingAction:(void *)a4 withResult:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if ([*(id *)(a1 + 24) containsObject:v7])
    {
      [v7 executionStartTime];
      double v11 = v10;
      [v7 executionEndTime];
      double v13 = v12;
      uint64_t v14 = SBLogSystemActionControl();
      if (os_signpost_enabled(v14))
      {
        __int16 v15 = [v7 systemAction];
        int v19 = 138543874;
        uint64_t v20 = a1;
        __int16 v21 = 2114;
        id v22 = v15;
        __int16 v23 = 2114;
        *(void *)uint64_t v24 = v7;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_SYSTEM_ACTION_PERFORM_EXECUTION", "(%{public}@) performing action '%{public}@' with executor '%{public}@'", (uint8_t *)&v19, 0x20u);
      }
      double v16 = v13 - v11;

      kdebug_trace();
      uint64_t v17 = SBLogSystemActionControl();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138544386;
        uint64_t v20 = a1;
        __int16 v21 = 2114;
        id v22 = v7;
        __int16 v23 = 1024;
        *(_DWORD *)uint64_t v24 = v9 == 0;
        *(_WORD *)&v24[4] = 2048;
        *(double *)&v24[6] = v16;
        __int16 v25 = 2114;
        id v26 = v9;
        _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "(%{public}@) executor '%{public}@' did finish successfully: %{BOOL}u\n    executionTime: %fs\n    error: %{public}@", (uint8_t *)&v19, 0x30u);
      }

      [*(id *)(a1 + 24) removeObject:v7];
      v18 = +[SBSystemActionAnalyticsTracker sharedTracker]();
      -[SBSystemActionAnalyticsTracker trackPerformedAction:executionTime:]((uint64_t)v18, v8, v16);
    }
    else
    {
      v18 = SBLogSystemActionControl();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = 138543618;
        uint64_t v20 = a1;
        __int16 v21 = 2114;
        id v22 = v7;
        _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_INFO, "(%{public}@) skipping processing finished result from no-longer-tracked executor '%{public}@'", (uint8_t *)&v19, 0x16u);
      }
    }
  }
}

- (BOOL)systemActionCoachingController:(id)a3 canPresentCoachingForAction:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 configuredAction];
  id v7 = [v6 sectionIdentifier];
  int v8 = [v7 isEqualToString:@"Shortcuts"];

  if (v8)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = self->_runningExecutors;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "systemAction", (void)v18);
          char v15 = [v14 isEqual:v5];

          if (v15)
          {
            BOOL v16 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    BOOL v16 = 1;
LABEL_13:
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (void)systemActionDataSource:(id)a3 didUpdateSelectedAction:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = SBLogSystemActionControl();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = self;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) received updated selected action: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  -[SBSystemActionControl _configureWithSelectedAction]((uint64_t)self);
  id v7 = +[SBSystemActionAnalyticsTracker sharedTracker]();
  -[SBSystemActionAnalyticsTracker trackSelectedActionChanged:](v7, v5);
}

- (void)_prewarmCameraIfNecessaryForAction:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 && [v3 isCameraCaptureAction])
  {
    id v5 = +[SBCaptureApplicationCenter sharedInstance];
    id v6 = [v4 hostBundleIdentifier];
    id v7 = [v5 predictedPrewarmBundleIdentifierForApplicationBundleIdentifier:v6];

    int v8 = SBLogSystemActionControl();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = a1;
      __int16 v18 = 2114;
      long long v19 = v7;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@) prewarming camera for bundleID: '%{public}@' ", buf, 0x16u);
    }

    id v9 = [NSNumber numberWithLongLong:mach_absolute_time()];
    __int16 v10 = [NSNumber numberWithLongLong:mach_continuous_time()];
    uint64_t v11 = *MEMORY[0x1E4F158D8];
    uint64_t v12 = *MEMORY[0x1E4F15928];
    v14[0] = *MEMORY[0x1E4F15918];
    v14[1] = v12;
    v15[0] = v11;
    v15[1] = v9;
    v14[2] = *MEMORY[0x1E4F15938];
    v15[2] = v10;
    double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    AVCapturePrewarmWithOptions();
  }
}

- (void)_activateFeedbackForAction:(uint64_t)a1
{
  if (a1)
  {
    -[SBSystemActionControl _feedbackForAction:](a1, a2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = *(id *)(a1 + 64);
    uint64_t v4 = [v3 activateSound:v6 forReason:@"SBSystemAction-Previewing"];
    id v5 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = v4;
  }
}

- (void)_cancelCameraPrewarmIfNecessaryForAction:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 && [v3 isCameraCaptureAction])
  {
    id v5 = [v4 hostBundleIdentifier];
    id v6 = SBLogSystemActionControl();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = a1;
      __int16 v12 = 2114;
      double v13 = v5;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) cancelling prewarming camera for bundleID: '%{public}@' ", buf, 0x16u);
    }

    uint64_t v8 = *MEMORY[0x1E4F15918];
    uint64_t v9 = *MEMORY[0x1E4F158D8];
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    MEMORY[0x1D9487C80](v5, v7);
  }
}

- (void)_deactivateFeedbackForAction:(uint64_t)a1
{
  if (a1)
  {
    [*(id *)(a1 + 80) invalidate];
    uint64_t v2 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = 0;
  }
}

- (void)_playFeedbackForAction:(uint64_t)a1
{
  if (a1)
  {
    -[SBSystemActionControl _feedbackForAction:](a1, a2);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 64) playSoundWithDefaultEnvironment:v3];
  }
}

uint64_t __50__SBSystemActionControl__executorForSystemAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 canBeExecuted])
  {
    uint64_t v4 = [v3 systemAction];
    uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __54__SBSystemActionControl__executionHandlerForExecutor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4) {
    uint64_t v4 = (void *)v4[6];
  }
  uint64_t v5 = v4;
  if ([*(id *)(a1 + 40) requiresAuthenticationAtLeastOnceSinceBootBeforeExecution]
    && ([v5 hasAuthenticatedAtLeastOnceSinceBoot] & 1) == 0)
  {
    id v6 = SBLogSystemActionControl();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v7;
      __int16 v20 = 2114;
      uint64_t v21 = v8;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) requesting device authentication for executor '%{public}@'", buf, 0x16u);
    }

    uint64_t v9 = objc_alloc_init(SBLockScreenUnlockRequest);
    [(SBLockScreenUnlockRequest *)v9 setSource:39];
    [(SBLockScreenUnlockRequest *)v9 setIntent:2];
    __int16 v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    [(SBLockScreenUnlockRequest *)v9 setName:v11];

    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      double v13 = *(void **)(v12 + 40);
    }
    else {
      double v13 = 0;
    }
    uint64_t v14 = [v13 windowScene];
    char v15 = [v14 lockScreenManager];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__SBSystemActionControl__executionHandlerForExecutor___block_invoke_131;
    v16[3] = &unk_1E6AF5A50;
    id v17 = v3;
    [v15 unlockWithRequest:v9 completion:v16];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v3 + 2))(v3, 1, 0);
  }
}

void __54__SBSystemActionControl__executionHandlerForExecutor___block_invoke_131(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = SBSystemActionExecutionErrorCreate(2, @"Post-boot authentication cancelled or failed");
  }
  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_notifyDidUpdateActionInteractionConfiguration
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 8), "allObjects", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v7 + 1) + 8 * v6++) systemActionControlDidUpdateActionInteractionConfiguration:a1];
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
  }
}

- (id)_feedbackForAction:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 40) customSoundForPerformingAction:a2];
    uint64_t v3 = v2;
    if (v2)
    {
      id v4 = v2;
    }
    else
    {
      id v4 = [MEMORY[0x1E4FA79C8] soundWithFeedbackEventType:1022];
    }
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlHost, 0);
  objc_storeStrong((id *)&self->_feedbackActivationAssertion, 0);
  objc_storeStrong((id *)&self->_previewingExecutor, 0);
  objc_storeStrong((id *)&self->_soundController, 0);
  objc_storeStrong((id *)&self->_coachingController, 0);
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_storeStrong((id *)&self->_previewCoordinator, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_runningExecutors, 0);
  objc_storeStrong((id *)&self->_actionValidators, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)previewSelectedActionFromSource:withSuppressionStatus:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_executorForSystemAction:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_cancelPreviewingSelectedActionFromSource:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)performSelectedActionFromSource:(const char *)a1 withContext:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)performSelectedActionFromSource:(const char *)a1 withContext:.cold.2(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)performSelectedActionFromSource:withContext:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end