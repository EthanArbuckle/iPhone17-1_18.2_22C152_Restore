@interface SBApplicationAutoLaunchService
- (BOOL)_autoLaunchSynchronously;
- (BOOL)_shouldAutoLaunchApplication:(id)a3 forReason:(unint64_t)a4;
- (NSArray)_queuedApplicationsThrottledForRelaunch;
- (NSString)description;
- (NSTimer)_queuedApplicationsThrottledForRelaunchTimer;
- (id)_initWithWorkspace:(id)a3 applicationController:(id)a4 restartManager:(id)a5 syncController:(id)a6 keybag:(id)a7;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_applicationProcessStateDidChange:(id)a3;
- (void)_autoLaunchAppsIfNecessaryAfterFirstUnlock;
- (void)_autoLaunchIfNecessary:(id)a3 forReason:(unint64_t)a4;
- (void)_installedApplicationsDidChange:(id)a3;
- (void)_invalidateQueuedApplicationsThrottledForRelaunchTimer;
- (void)_launchNextQueuedApplicationThrottledForRelaunch;
- (void)_memoryPressureRelieved:(id)a3;
- (void)_memoryPressureWarn:(id)a3;
- (void)_noteKeybagDidUnlock;
- (void)_noteTerminationAssertionRemovedForApplication:(id)a3;
- (void)_recalculateVoIPBehaviorForApplication:(id)a3 withExitContext:(id)a4;
- (void)_scheduleAutoLaunchForApplicationExited:(id)a3 withExitContext:(id)a4;
- (void)_scheduleThrottledApplicationRelaunchTimerIfNecessary;
- (void)_setAutoLaunchSynchronously:(BOOL)a3;
- (void)autoLaunchApplicationsIfNecessaryForStartup;
- (void)dealloc;
- (void)invalidate;
- (void)keybagDidUnlockForTheFirstTime:(id)a3;
@end

@implementation SBApplicationAutoLaunchService

- (void)_applicationProcessStateDidChange:(id)a3
{
  id v4 = a3;
  id v21 = [v4 object];
  v5 = [v4 userInfo];

  v6 = [v5 objectForKey:@"previousProcessState"];

  v7 = [v21 processState];
  uint64_t v8 = [v6 taskState];
  if (v7) {
    BOOL v9 = [v7 taskState] != 1;
  }
  else {
    BOOL v9 = 0;
  }
  v10 = v21;
  if (v8 != 1 && !v9)
  {
    v11 = [v21 lastExitContext];
    v12 = [v21 info];
    int v13 = [v12 supportsLegacyVOIPBackgroundMode];

    if (v13) {
      [(SBApplicationAutoLaunchService *)self _recalculateVoIPBehaviorForApplication:v21 withExitContext:v11];
    }
    if ([(SBApplicationAutoLaunchService *)self _shouldAutoLaunchApplication:v21 forReason:3])
    {
      [(SBApplicationAutoLaunchService *)self _scheduleAutoLaunchForApplicationExited:v21 withExitContext:v11];
    }

    v10 = v21;
  }
  v14 = [v10 info];
  int v15 = [v14 supportsLegacyVOIPBackgroundMode];

  if (v15)
  {
    uint64_t v16 = [v6 taskState];
    uint64_t v17 = [v7 taskState];
    if (v16 == 3 && v17 == 3) {
      [v21 setFailedAutoLaunchCountForVOIP:0];
    }
    uint64_t v19 = [v6 visibility];
    uint64_t v20 = [v7 visibility];
    if (v19 != 2 && v20 == 2) {
      [v21 setWantsAutoLaunchForVOIP:1];
    }
  }
}

- (id)_initWithWorkspace:(id)a3 applicationController:(id)a4 restartManager:(id)a5 syncController:(id)a6 keybag:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id obj = a7;
  id v17 = a7;
  v34 = v13;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"SBApplicationAutoLaunchService.m", 78, @"Invalid parameter not satisfying: %@", @"workspace" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"SBApplicationAutoLaunchService.m", 79, @"Invalid parameter not satisfying: %@", @"applicationController" object file lineNumber description];

LABEL_3:
  v18 = v17;
  uint64_t v19 = self;
  if (v15)
  {
    if (v16) {
      goto LABEL_5;
    }
LABEL_19:
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, v19, @"SBApplicationAutoLaunchService.m", 81, @"Invalid parameter not satisfying: %@", @"syncController" object file lineNumber description];

    if (v18) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, v19, @"SBApplicationAutoLaunchService.m", 80, @"Invalid parameter not satisfying: %@", @"restartManager" object file lineNumber description];

  if (!v16) {
    goto LABEL_19;
  }
LABEL_5:
  if (v18) {
    goto LABEL_6;
  }
LABEL_20:
  v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, v19, @"SBApplicationAutoLaunchService.m", 82, @"Invalid parameter not satisfying: %@", @"keybag" object file lineNumber description];

LABEL_6:
  v36.receiver = v19;
  v36.super_class = (Class)SBApplicationAutoLaunchService;
  uint64_t v20 = [(SBApplicationAutoLaunchService *)&v36 init];
  p_isa = (id *)&v20->super.isa;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_mainWorkspace, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, obj);
    v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:p_isa selector:sel__installedApplicationsDidChange_ name:@"SBInstalledApplicationsDidChangeNotification" object:0];
    [v22 addObserver:p_isa selector:sel__applicationProcessStateDidChange_ name:@"SBApplicationProcessStateDidChange" object:0];
    [v22 addObserver:p_isa selector:sel__memoryPressureRelieved_ name:@"SBMemoryPressureReturnedToNormalNotification" object:0];
    [v22 addObserver:p_isa selector:sel__memoryPressureWarn_ name:@"SBMemoryPressureUnderPressureNotification" object:0];
    char v23 = [p_isa[5] hasBeenUnlockedSinceBoot];
    v24 = SBLogAutoLaunching();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "Service initialized: already unlocked.", buf, 2u);
      }
    }
    else
    {
      if (v25)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "Service initialized: waiting for first unlock.", buf, 2u);
      }

      [p_isa[5] addObserver:p_isa];
    }
  }
  return p_isa;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SBApplicationAutoLaunchService.m" lineNumber:108 description:@"SBApplicationAutoLaunchService Must be invalidated before it can dealloc."];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBApplicationAutoLaunchService;
  [(SBApplicationAutoLaunchService *)&v5 dealloc];
}

- (void)autoLaunchApplicationsIfNecessaryForStartup
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = SBLogAutoLaunching();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "AutoLaunch for startup.", buf, 2u);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(SBApplicationController *)self->_applicationController allApplications];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SBApplicationAutoLaunchService *)self _autoLaunchIfNecessary:*(void *)(*((void *)&v9 + 1) + 8 * v8++) forReason:1];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(SBFMobileKeyBag *)self->_keybag removeObserver:self];
    [(NSTimer *)self->_queuedApplicationsThrottledForRelaunchTimer invalidate];
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self];
  }
}

- (NSString)description
{
  return (NSString *)[(SBApplicationAutoLaunchService *)self descriptionWithMultilinePrefix:0];
}

- (void)_noteTerminationAssertionRemovedForApplication:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  uint64_t v5 = [v4 info];
  if ([v5 supportsLegacyVOIPBackgroundMode])
  {
    int v6 = [v4 wantsAutoLaunchForVOIP];

    if (v6)
    {
      uint64_t v7 = SBLogAutoLaunching();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = 138543362;
        id v9 = v4;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "AutoLaunch for termination assertion removed on application: %{public}@", (uint8_t *)&v8, 0xCu);
      }

      [(SBApplicationAutoLaunchService *)self _autoLaunchIfNecessary:v4 forReason:2];
    }
  }
  else
  {
  }
}

- (id)succinctDescription
{
  v2 = [(SBApplicationAutoLaunchService *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBApplicationAutoLaunchService *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBApplicationAutoLaunchService *)self succinctDescriptionBuilder];
  [v4 appendArraySection:self->_queuedApplicationsThrottledForRelaunch withName:@"QueuedApplicationsThrottledForRelaunch" skipIfEmpty:1];
  id v5 = (id)[v4 appendObject:self->_queuedApplicationsThrottledForRelaunchTimer withName:@"QueuedApplicationsThrottledForRelaunchTimer" skipIfNil:1];
  return v4;
}

- (void)_autoLaunchIfNecessary:(id)a3 forReason:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v6 = (__CFString *)a3;
  if ([(SBFMobileKeyBag *)self->_keybag hasBeenUnlockedSinceBoot])
  {
    if ([(SBApplicationAutoLaunchService *)self _shouldAutoLaunchApplication:v6 forReason:a4])
    {
      uint64_t v7 = SBLogAutoLaunching();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        if (a4 > 3) {
          int v8 = 0;
        }
        else {
          int v8 = off_1E6B08CB0[a4];
        }
        *(_DWORD *)buf = 138543618;
        id v17 = v8;
        __int16 v18 = 2114;
        uint64_t v19 = v6;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "AutoLaunching application for %{public}@: %{public}@", buf, 0x16u);
      }

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __67__SBApplicationAutoLaunchService__autoLaunchIfNecessary_forReason___block_invoke;
      v14[3] = &unk_1E6AF5290;
      v14[4] = self;
      uint64_t v15 = v6;
      uint64_t v10 = (void (**)(void))MEMORY[0x1D948C7A0](v14);
      long long v11 = v10;
      if (self->_autoLaunchSynchronously)
      {
        v10[2](v10);
      }
      else
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __67__SBApplicationAutoLaunchService__autoLaunchIfNecessary_forReason___block_invoke_4;
        block[3] = &unk_1E6AF5300;
        id v13 = v10;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
  }
  else
  {
    id v9 = SBLogAutoLaunching();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v6;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "Pre-empting auto launch because we haven't had first unlock yet: %{public}@", buf, 0xCu);
    }
  }
}

void __67__SBApplicationAutoLaunchService__autoLaunchIfNecessary_forReason___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __67__SBApplicationAutoLaunchService__autoLaunchIfNecessary_forReason___block_invoke_2;
  v2[3] = &unk_1E6AF57E8;
  id v3 = *(id *)(a1 + 40);
  [v1 requestTransitionWithBuilder:v2];
}

void __67__SBApplicationAutoLaunchService__autoLaunchIfNecessary_forReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:58];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__SBApplicationAutoLaunchService__autoLaunchIfNecessary_forReason___block_invoke_3;
  v4[3] = &unk_1E6AF57C0;
  id v5 = *(id *)(a1 + 32);
  [v3 modifyApplicationContext:v4];
}

void __67__SBApplicationAutoLaunchService__autoLaunchIfNecessary_forReason___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v6 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 32) wantsAutoLaunchForVOIP])
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F42758]) initWithInfo:0 responder:0];
    id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    [(SBApplicationSceneEntity *)v6 addActions:v5];
  }
  [v3 setBackground:1];
  [v3 setEntity:v6 forLayoutRole:1];
}

uint64_t __67__SBApplicationAutoLaunchService__autoLaunchIfNecessary_forReason___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_shouldAutoLaunchApplication:(id)a3 forReason:(unint64_t)a4
{
  id v6 = a3;
  int v7 = [v6 isSystemApplication];
  int v8 = [v6 lastExitContext];
  if ([v8 exitReason])
  {
    uint64_t v10 = [v8 underlyingContext];
    BOOL v9 = [v10 legacyCode] == 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  long long v11 = [v6 lastExitContext];
  uint64_t v12 = [v11 terminationReason];

  if (v9 || (BOOL v13 = v12 != 1, ([v8 exitReason] & 0x20) != 0)) {
    BOOL v13 = 0;
  }
  if ([v6 isUninstalled]) {
    goto LABEL_31;
  }
  if (v7
    && ([v6 bundleIdentifier],
        id v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 isEqual:@"com.apple.mobiletimer"],
        v14,
        v15))
  {
    id v16 = +[SBDefaults localDefaults];
    id v17 = [v16 notificationDefaults];
    __int16 v18 = [v17 legacyAlarmList];

    if (!v18) {
      goto LABEL_31;
    }
  }
  else
  {
    int v19 = [v6 wantsAutoLaunchForVOIP];
    char v20 = a4 != 3 || v13;
    if (!v19 || (v20 & 1) == 0)
    {
      if (!v13) {
        goto LABEL_31;
      }
      if (![v6 isConnectedToExternalAccessory]) {
        goto LABEL_31;
      }
      v24 = [v6 info];
      int v25 = [v24 supportsBackgroundMode:@"external-accessory"];

      if (!v25) {
        goto LABEL_31;
      }
    }
  }
  unint64_t v21 = [v6 failedLaunchCount];
  unint64_t v22 = 5;
  if (v7) {
    unint64_t v22 = 10;
  }
  if (v21 >= v22)
  {
    v26 = SBLogAutoLaunching();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[SBApplicationAutoLaunchService _shouldAutoLaunchApplication:forReason:](v6, v26);
    }

    goto LABEL_31;
  }
  if (([v6 isAnyTerminationAssertionHeld] & 1) != 0
    || [(SBRestartManager *)self->_restartManager isPendingExit]
    || [(SBSyncController *)self->_syncController restoreState])
  {
LABEL_31:
    LOBYTE(v23) = 0;
    goto LABEL_32;
  }
  BOOL v23 = ![(SBSyncController *)self->_syncController isResetting];
LABEL_32:

  return v23;
}

- (void)_launchNextQueuedApplicationThrottledForRelaunch
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSMutableArray *)self->_queuedApplicationsThrottledForRelaunch objectAtIndex:0];
  [(NSMutableArray *)self->_queuedApplicationsThrottledForRelaunch removeObjectAtIndex:0];
  if (v3)
  {
    id v4 = SBLogAutoLaunching();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 138543362;
      int v7 = v3;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "AutoLaunch throttled application for relaunch: %{public}@.", (uint8_t *)&v6, 0xCu);
    }

    [(SBApplicationAutoLaunchService *)self _autoLaunchIfNecessary:v3 forReason:3];
  }
  if (![(NSMutableArray *)self->_queuedApplicationsThrottledForRelaunch count])
  {
    queuedApplicationsThrottledForRelaunch = self->_queuedApplicationsThrottledForRelaunch;
    self->_queuedApplicationsThrottledForRelaunch = 0;

    [(SBApplicationAutoLaunchService *)self _invalidateQueuedApplicationsThrottledForRelaunchTimer];
  }
}

- (void)_scheduleThrottledApplicationRelaunchTimerIfNecessary
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (([(id)SBApp underMemoryPressure] & 1) == 0
    && self->_queuedApplicationsThrottledForRelaunch
    && !self->_queuedApplicationsThrottledForRelaunchTimer)
  {
    id v3 = SBLogAutoLaunching();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v6[0] = 67109120;
      v6[1] = 15;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Scheduling throttled relaunch of queued applications in %d seconds.", (uint8_t *)v6, 8u);
    }

    id v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__launchNextQueuedApplicationThrottledForRelaunch selector:0 userInfo:1 repeats:15.0];
    queuedApplicationsThrottledForRelaunchTimer = self->_queuedApplicationsThrottledForRelaunchTimer;
    self->_queuedApplicationsThrottledForRelaunchTimer = v4;
  }
}

- (void)_invalidateQueuedApplicationsThrottledForRelaunchTimer
{
  [(NSTimer *)self->_queuedApplicationsThrottledForRelaunchTimer invalidate];
  queuedApplicationsThrottledForRelaunchTimer = self->_queuedApplicationsThrottledForRelaunchTimer;
  self->_queuedApplicationsThrottledForRelaunchTimer = 0;
}

- (void)_scheduleAutoLaunchForApplicationExited:(id)a3 withExitContext:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SBLogAutoLaunching();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 138543362;
    id v14 = v6;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Application exited and wants to be relaunched: %{public}@.", (uint8_t *)&v13, 0xCu);
  }

  if (([(id)SBApp underMemoryPressure] & 1) != 0 || (objc_msgSend(v7, "exitReason") & 0x10) != 0)
  {
    BOOL v9 = SBLogAutoLaunching();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBApplicationAutoLaunchService _scheduleAutoLaunchForApplicationExited:withExitContext:]((uint64_t)v6, v9);
    }

    queuedApplicationsThrottledForRelaunch = self->_queuedApplicationsThrottledForRelaunch;
    if (!queuedApplicationsThrottledForRelaunch)
    {
      long long v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v12 = self->_queuedApplicationsThrottledForRelaunch;
      self->_queuedApplicationsThrottledForRelaunch = v11;

      queuedApplicationsThrottledForRelaunch = self->_queuedApplicationsThrottledForRelaunch;
    }
    if (([(NSMutableArray *)queuedApplicationsThrottledForRelaunch containsObject:v6] & 1) == 0)
    {
      [(NSMutableArray *)self->_queuedApplicationsThrottledForRelaunch addObject:v6];
      [(SBApplicationAutoLaunchService *)self _scheduleThrottledApplicationRelaunchTimerIfNecessary];
    }
  }
  else
  {
    [(SBApplicationAutoLaunchService *)self _autoLaunchIfNecessary:v6 forReason:3];
  }
}

- (void)_autoLaunchAppsIfNecessaryAfterFirstUnlock
{
  if (([(SBFMobileKeyBag *)self->_keybag hasBeenUnlockedSinceBoot] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBApplicationAutoLaunchService.m" lineNumber:328 description:@"Keybag must have been unlocked since boot to enter this function."];
  }
  id v4 = SBLogAutoLaunching();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "First unlock occured; trying auto launch of necessary applications.",
      buf,
      2u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__SBApplicationAutoLaunchService__autoLaunchAppsIfNecessaryAfterFirstUnlock__block_invoke;
  v11[3] = &unk_1E6AF4AC0;
  v11[4] = self;
  uint64_t v5 = MEMORY[0x1D948C7A0](v11);
  id v6 = (void *)v5;
  if (self->_autoLaunchSynchronously)
  {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
  else
  {
    dispatch_time_t v7 = dispatch_time(0, 1000000000);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__SBApplicationAutoLaunchService__autoLaunchAppsIfNecessaryAfterFirstUnlock__block_invoke_2;
    v9[3] = &unk_1E6AF5300;
    id v10 = v6;
    dispatch_after(v7, MEMORY[0x1E4F14428], v9);
  }
}

void __76__SBApplicationAutoLaunchService__autoLaunchAppsIfNecessaryAfterFirstUnlock__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "allApplications", 0);
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
        [*(id *)(a1 + 32) _autoLaunchIfNecessary:*(void *)(*((void *)&v7 + 1) + 8 * v6++) forReason:1];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

uint64_t __76__SBApplicationAutoLaunchService__autoLaunchAppsIfNecessaryAfterFirstUnlock__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_recalculateVoIPBehaviorForApplication:(id)a3 withExitContext:(id)a4
{
  id v18 = a3;
  id v7 = a4;
  long long v8 = [v18 info];
  char v9 = [v8 supportsLegacyVOIPBackgroundMode];

  if ((v9 & 1) == 0)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"SBApplicationAutoLaunchService.m" lineNumber:351 description:@"Application must support legacy VOIP to be here."];
  }
  unint64_t v10 = [v7 terminationReason];
  char v11 = [v7 exitReason];
  char v12 = v11;
  unsigned int v13 = (v10 > 9) | (0x18Du >> v10);
  if (v11)
  {
    id v14 = [v7 underlyingContext];
    int v15 = [v14 legacyCode];

    LOBYTE(v13) = v13 & (v15 != 0);
    if (!(v10 | v12 & 0x10))
    {
      if (!v15)
      {
        uint64_t v16 = 0;
        LOBYTE(v13) = 0;
        goto LABEL_9;
      }
LABEL_8:
      uint64_t v16 = [v18 failedAutoLaunchCountForVOIP] + 1;
LABEL_9:
      [v18 setFailedAutoLaunchCountForVOIP:v16];
    }
  }
  else if (!(v10 | v11 & 0x10))
  {
    goto LABEL_8;
  }
  if (![(SBRestartManager *)self->_restartManager isPendingExit]
    && (v13 & ((unint64_t)[v18 failedAutoLaunchCountForVOIP] < 6)) == 0)
  {
    [v18 setWantsAutoLaunchForVOIP:0];
  }
}

- (void)_noteKeybagDidUnlock
{
  [(SBApplicationAutoLaunchService *)self _autoLaunchAppsIfNecessaryAfterFirstUnlock];
  keybag = self->_keybag;
  [(SBFMobileKeyBag *)keybag removeObserver:self];
}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SBApplicationAutoLaunchService_keybagDidUnlockForTheFirstTime___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __65__SBApplicationAutoLaunchService_keybagDidUnlockForTheFirstTime___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteKeybagDidUnlock];
}

- (void)_installedApplicationsDidChange:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"SBInstalledApplicationsAddedBundleIDs"];

  id v7 = [v4 userInfo];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"SBInstalledApplicationsReplacedBundleIDs"];

  if (v6 | v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    unint64_t v10 = v9;
    if (v6) {
      [v9 unionSet:v6];
    }
    if (v8) {
      [v10 unionSet:v8];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = -[SBApplicationController applicationWithBundleIdentifier:](self->_applicationController, "applicationWithBundleIdentifier:", *(void *)(*((void *)&v17 + 1) + 8 * v15), (void)v17);
          if (v16) {
            [(SBApplicationAutoLaunchService *)self _autoLaunchIfNecessary:v16 forReason:0];
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
}

- (void)_memoryPressureWarn:(id)a3
{
  BSDispatchQueueAssertMain();
  id v4 = SBLogAutoLaunching();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Memory pressure warning; unscheduling queued throttled applications to relaunch.",
      v5,
      2u);
  }

  [(SBApplicationAutoLaunchService *)self _invalidateQueuedApplicationsThrottledForRelaunchTimer];
}

- (void)_memoryPressureRelieved:(id)a3
{
  BSDispatchQueueAssertMain();
  id v4 = SBLogAutoLaunching();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Memory pressure relieved; scheduling relaunch of queued throttled applications to relaunch if necessary.",
      v5,
      2u);
  }

  [(SBApplicationAutoLaunchService *)self _scheduleThrottledApplicationRelaunchTimerIfNecessary];
}

- (BOOL)_autoLaunchSynchronously
{
  return self->_autoLaunchSynchronously;
}

- (void)_setAutoLaunchSynchronously:(BOOL)a3
{
  self->_autoLaunchSynchronously = a3;
}

- (NSTimer)_queuedApplicationsThrottledForRelaunchTimer
{
  return self->_queuedApplicationsThrottledForRelaunchTimer;
}

- (NSArray)_queuedApplicationsThrottledForRelaunch
{
  return &self->_queuedApplicationsThrottledForRelaunch->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedApplicationsThrottledForRelaunchTimer, 0);
  objc_storeStrong((id *)&self->_queuedApplicationsThrottledForRelaunch, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_storeStrong((id *)&self->_restartManager, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_mainWorkspace, 0);
}

- (void)_shouldAutoLaunchApplication:(void *)a1 forReason:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 bundleIdentifier];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Application '%{public}@' has failed to launch too many times. Not relaunching.", (uint8_t *)&v4, 0xCu);
}

- (void)_scheduleAutoLaunchForApplicationExited:(uint64_t)a1 withExitContext:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Queueing application for throttled auto launch due to memory-pressure or jetsam exit: %{public}@.", (uint8_t *)&v2, 0xCu);
}

@end