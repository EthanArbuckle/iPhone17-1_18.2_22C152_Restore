@interface SBSwitcherCaptureApplicationActivationWatchdog
- (SBSwitcherCaptureApplicationActivationWatchdog)initWithDelegate:(id)a3;
- (id)_addEntryForEntity:(id)a3;
- (id)_entryForEntity:(id)a3;
- (id)_entryForMonitor:(id)a3;
- (id)_entryForSceneHandle:(id)a3;
- (void)_beginMonitoringAppRepresentedByEntity:(id)a3;
- (void)_endMonitoringAppRepresentedByEntity:(id)a3;
- (void)_removeEntryForEntity:(id)a3;
- (void)captureApplicationMonitor:(id)a3 hasMetLaunchRequirements:(BOOL)a4 unmetReason:(id)a5;
- (void)foregroundWorkspaceEntitiesUpdatedTo:(id)a3;
- (void)sceneHandle:(id)a3 didCreateScene:(id)a4;
- (void)sceneHandle:(id)a3 replacedWithSceneHandle:(id)a4;
@end

@implementation SBSwitcherCaptureApplicationActivationWatchdog

- (void)foregroundWorkspaceEntitiesUpdatedTo:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32 = (void *)[v4 mutableCopy];
  v5 = (void *)[(NSSet *)self->_lastEntitiesUpdate mutableCopy];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v50 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        lastEntitiesUpdate = self->_lastEntitiesUpdate;
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __87__SBSwitcherCaptureApplicationActivationWatchdog_foregroundWorkspaceEntitiesUpdatedTo___block_invoke;
        v47[3] = &unk_1E6B077B8;
        v47[4] = v11;
        id v48 = v32;
        [(NSSet *)lastEntitiesUpdate enumerateObjectsUsingBlock:v47];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v8);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v13 = self->_lastEntitiesUpdate;
  uint64_t v14 = [(NSSet *)v13 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v43 + 1) + 8 * j);
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __87__SBSwitcherCaptureApplicationActivationWatchdog_foregroundWorkspaceEntitiesUpdatedTo___block_invoke_2;
        v41[3] = &unk_1E6B077B8;
        v41[4] = v18;
        id v42 = v5;
        [v6 enumerateObjectsUsingBlock:v41];
      }
      uint64_t v15 = [(NSSet *)v13 countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v15);
  }

  v19 = (NSSet *)[v6 copy];
  v20 = self->_lastEntitiesUpdate;
  self->_lastEntitiesUpdate = v19;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v21 = v5;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v54 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v38 != v24) {
          objc_enumerationMutation(v21);
        }
        [(SBSwitcherCaptureApplicationActivationWatchdog *)self _endMonitoringAppRepresentedByEntity:*(void *)(*((void *)&v37 + 1) + 8 * k)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v54 count:16];
    }
    while (v23);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v26 = v32;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v53 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v34;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v33 + 1) + 8 * m);
        if ([v31 flagForActivationSetting:36] == 1
          && [v31 flagForActivationSetting:38] != 1)
        {
          [(SBSwitcherCaptureApplicationActivationWatchdog *)self _beginMonitoringAppRepresentedByEntity:v31];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v53 count:16];
    }
    while (v28);
  }
}

- (SBSwitcherCaptureApplicationActivationWatchdog)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSwitcherCaptureApplicationActivationWatchdog;
  v5 = [(SBSwitcherCaptureApplicationActivationWatchdog *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] hashTableWithOptions:512];
    watchdogEntries = v5->_watchdogEntries;
    v5->_watchdogEntries = (NSHashTable *)v6;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

uint64_t __87__SBSwitcherCaptureApplicationActivationWatchdog_foregroundWorkspaceEntitiesUpdatedTo___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) isAnalogousToEntity:a2];
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    return [v4 removeObject:v5];
  }
  return result;
}

uint64_t __87__SBSwitcherCaptureApplicationActivationWatchdog_foregroundWorkspaceEntitiesUpdatedTo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) isAnalogousToEntity:a2];
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    return [v4 removeObject:v5];
  }
  return result;
}

- (void)_beginMonitoringAppRepresentedByEntity:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 applicationSceneEntity];
  uint64_t v6 = [v5 sceneHandle];

  uint64_t v7 = [v6 sceneIfExists];
  uint64_t v8 = SBLogCaptureApplication();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = [v4 applicationSceneEntity];
      uint64_t v11 = [v10 application];
      v12 = [v11 bundleIdentifier];
      int v18 = 138543362;
      v19 = v12;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Unlocked: Capture watchdog monitoring BEGINNING for \"%{public}@\"", (uint8_t *)&v18, 0xCu);
    }
    v13 = [(SBSwitcherCaptureApplicationActivationWatchdog *)self _addEntryForEntity:v4];
    uint64_t v14 = [[SBCaptureApplicationLaunchMonitor alloc] initWithScene:v7 delegate:self];
    [v13 setCaptureAppLaunchMonitor:v14];
    [(SBCaptureApplicationLaunchMonitor *)v14 start];
  }
  else
  {
    if (v9)
    {
      uint64_t v15 = [v4 applicationSceneEntity];
      uint64_t v16 = [v15 application];
      v17 = [v16 bundleIdentifier];
      int v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Unlocked: Capture watchdog monitoring PENDING for \"%{public}@\"", (uint8_t *)&v18, 0xCu);
    }
    v13 = [(SBSwitcherCaptureApplicationActivationWatchdog *)self _addEntryForEntity:v4];
    [v13 setSceneHandle:v6];
    [v6 addObserver:self];
  }
}

- (void)_endMonitoringAppRepresentedByEntity:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBSwitcherCaptureApplicationActivationWatchdog *)self _entryForEntity:v4];
  if (v5)
  {
    uint64_t v6 = SBLogCaptureApplication();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v4 applicationSceneEntity];
      uint64_t v8 = [v7 application];
      BOOL v9 = [v8 bundleIdentifier];
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Unlocked: Capture watchdog ENDED for \"%{public}@\"", (uint8_t *)&v11, 0xCu);
    }
    v10 = [v5 captureAppLaunchMonitor];
    [v10 invalidate];

    [(SBSwitcherCaptureApplicationActivationWatchdog *)self _removeEntryForEntity:v4];
  }
}

- (void)captureApplicationMonitor:(id)a3 hasMetLaunchRequirements:(BOOL)a4 unmetReason:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [(SBSwitcherCaptureApplicationActivationWatchdog *)self _entryForMonitor:v9];
  if (!v11)
  {
    id v21 = [NSString stringWithFormat:@"Unknown state"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSwitcherCaptureApplicationActivationWatchdog captureApplicationMonitor:hasMetLaunchRequirements:unmetReason:](a2);
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8BF1B10);
  }
  v12 = (void *)v11;
  uint64_t v13 = SBLogCaptureApplication();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v12 entity];
    uint64_t v15 = [v14 applicationSceneEntity];
    uint64_t v16 = [v15 application];
    v17 = [v16 bundleIdentifier];
    v22[0] = 67109378;
    v22[1] = v6;
    __int16 v23 = 2114;
    uint64_t v24 = v17;
    _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Unlocked: Capture watchdog met requirements? (%{BOOL}u) for \"%{public}@\"", (uint8_t *)v22, 0x12u);
  }
  if (!v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v19 = [v12 entity];
    [WeakRetained watchdog:self requestsTerminationOf:v19 forReason:v10];
  }
  uint64_t v20 = [v12 entity];
  [(SBSwitcherCaptureApplicationActivationWatchdog *)self _endMonitoringAppRepresentedByEntity:v20];
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBSwitcherCaptureApplicationActivationWatchdog *)self _entryForSceneHandle:v13];
  if (v8)
  {
    id v9 = v8;
    id v10 = [v8 entity];
    [(SBSwitcherCaptureApplicationActivationWatchdog *)self _removeEntryForEntity:v10];

    uint64_t v11 = [v9 entity];
    [(SBSwitcherCaptureApplicationActivationWatchdog *)self _beginMonitoringAppRepresentedByEntity:v11];
  }
  else
  {
    v12 = [NSString stringWithFormat:@"Observed change for unmonitored entity"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSwitcherCaptureApplicationActivationWatchdog sceneHandle:didCreateScene:](a2);
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)sceneHandle:(id)a3 replacedWithSceneHandle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [NSString stringWithFormat:@"Unhandled"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = NSStringFromSelector(a2);
    uint64_t v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    int v13 = 138544642;
    uint64_t v14 = v10;
    __int16 v15 = 2114;
    uint64_t v16 = v12;
    __int16 v17 = 2048;
    int v18 = self;
    __int16 v19 = 2114;
    uint64_t v20 = @"SBSwitcherCaptureApplicationActivationWatchdog.m";
    __int16 v21 = 1024;
    int v22 = 135;
    __int16 v23 = 2114;
    uint64_t v24 = v9;
    _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);
  }
  [v9 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (id)_entryForEntity:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_watchdogEntries;
  id v6 = (id)[(NSHashTable *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "entity", (void)v13);
        int v11 = [v10 isAnalogousToEntity:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSHashTable *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_entryForMonitor:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_watchdogEntries;
  id v6 = (id)[(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "captureAppLaunchMonitor", (void)v12);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_entryForSceneHandle:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_watchdogEntries;
  id v6 = (id)[(NSHashTable *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "sceneHandle", (void)v13);
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSHashTable *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_addEntryForEntity:(id)a3
{
  id v5 = a3;
  id v6 = [(SBSwitcherCaptureApplicationActivationWatchdog *)self _entryForEntity:v5];

  if (v6)
  {
    id v9 = [NSString stringWithFormat:@"Can't add duplicate entry"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSwitcherCaptureApplicationActivationWatchdog _addEntryForEntity:](a2);
    }
    [v9 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    uint64_t v7 = objc_alloc_init(_SBWatchdogEntry);
    [(_SBWatchdogEntry *)v7 setEntity:v5];
    [(NSHashTable *)self->_watchdogEntries addObject:v7];

    return v7;
  }
  return result;
}

- (void)_removeEntryForEntity:(id)a3
{
  id v6 = [(SBSwitcherCaptureApplicationActivationWatchdog *)self _entryForEntity:a3];
  id v4 = [v6 sceneHandle];
  id v5 = v4;
  if (v4)
  {
    [v4 removeObserver:self];
    [v6 setSceneHandle:0];
  }
  [(NSHashTable *)self->_watchdogEntries removeObject:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEntitiesUpdate, 0);
  objc_storeStrong((id *)&self->_watchdogEntries, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)captureApplicationMonitor:(const char *)a1 hasMetLaunchRequirements:unmetReason:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)sceneHandle:(const char *)a1 didCreateScene:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_addEntryForEntity:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end