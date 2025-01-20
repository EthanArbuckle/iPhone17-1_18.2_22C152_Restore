@interface SBRestartManager
- (BOOL)_isPendingExitIncludingExternallyControlledReasons:(BOOL)a3;
- (BOOL)isPendingExit;
- (SBRestartManager)init;
- (SBRestartManager)initWithWorkspaceDataSource:(id)a3 initialRestartState:(id)a4;
- (SBRestartManagerDelegate)delegate;
- (SBRestartTransitionRequest)pendingRestartTransitionRequest;
- (SBStartupTransition)startupTransition;
- (id)_initWithWorkspaceDataSource:(id)a3 initialRestartState:(id)a4 startupController:(id)a5 systemService:(id)a6;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)___waitForeverForRunningBoardKill;
- (void)_addPendingExternallyControlledRestartReason:(id)a3;
- (void)_doRestartForTransition:(int)a3;
- (void)_exitIsImminent;
- (void)_killAllAppsForPendingExitWithReason:(int64_t)a3 description:(id)a4 expiration:(double)a5 completion:(id)a6;
- (void)_persistStartupTransitionContextFromRebootContext:(id)a3;
- (void)_persistStartupTransitionContextFromRestartRequest:(id)a3;
- (void)_persistStartupTransitionContextFromShutdownContext:(id)a3;
- (void)_playShutdownSound:(id)a3;
- (void)_postShutdownNotification;
- (void)_reallyRestartWithTransitionRequest:(id)a3;
- (void)_removePendingExternallyControlledRestartReason:(id)a3;
- (void)_restartWithTransitionRequest:(id)a3;
- (void)_shutdownSoundDidComplete:(id)a3 completion:(id)a4;
- (void)_shutdownUsingOptions:(id)a3;
- (void)initializeAndRunStartupTransition:(id)a3;
- (void)rebootForReason:(id)a3;
- (void)rebootWithContext:(id)a3;
- (void)restartWithTransitionRequest:(id)a3;
- (void)setDelegate:(id)a3;
- (void)shutdownForReason:(id)a3;
- (void)shutdownWithContext:(id)a3;
@end

@implementation SBRestartManager

- (BOOL)isPendingExit
{
  BSDispatchQueueAssertMain();
  return [(SBRestartManager *)self _isPendingExitIncludingExternallyControlledReasons:1];
}

- (BOOL)_isPendingExitIncludingExternallyControlledReasons:(BOOL)a3
{
  if (self->_isShuttingDown || self->_isRestartImminent) {
    return 1;
  }
  pendingRestartTransitionRequest = self->_pendingRestartTransitionRequest;
  BOOL result = pendingRestartTransitionRequest != 0;
  if (pendingRestartTransitionRequest) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !a3;
  }
  if (!v6) {
    return [(NSMutableSet *)self->_pendingExternallyControlledRestartReasons count] != 0;
  }
  return result;
}

- (SBStartupTransition)startupTransition
{
  BSDispatchQueueAssertMain();
  startupController = self->_startupController;
  return [(SBStartupTransitionController *)startupController startupTransition];
}

- (SBRestartManager)init
{
  return 0;
}

- (id)_initWithWorkspaceDataSource:(id)a3 initialRestartState:(id)a4 startupController:(id)a5 systemService:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBRestartManager;
  v15 = [(SBRestartManager *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workspaceDataSource, a3);
    objc_storeStrong((id *)&v16->_initialRestartState, a4);
    objc_storeStrong((id *)&v16->_startupController, a5);
    objc_storeStrong((id *)&v16->_systemService, a6);
    uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
    pendingExternallyControlledRestartReasons = v16->_pendingExternallyControlledRestartReasons;
    v16->_pendingExternallyControlledRestartReasons = (NSMutableSet *)v17;
  }
  return v16;
}

- (SBRestartManager)initWithWorkspaceDataSource:(id)a3 initialRestartState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[SBStartupTransitionController alloc] initWithInitialRestartState:v6];
  v9 = [MEMORY[0x1E4F624C8] sharedInstance];
  v10 = [(SBRestartManager *)self _initWithWorkspaceDataSource:v7 initialRestartState:v6 startupController:v8 systemService:v9];

  return v10;
}

- (void)initializeAndRunStartupTransition:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  [(SBStartupTransitionController *)self->_startupController initializeAndRunStartupTransition:v4];

  v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Posting startup notification.", v7, 2u);
  }

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"SBRestartManagerDidBeginStartupTransitionNotification" object:self];
}

- (void)shutdownForReason:(id)a3
{
  id v4 = a3;
  v5 = [[SBShutdownContext alloc] initWithReason:v4];

  [(SBRestartManager *)self shutdownWithContext:v5];
}

- (void)shutdownWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (![(SBRestartManager *)self isPendingExit])
  {
    v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Shutdown requested for with context: %{public}@", buf, 0xCu);
    }

    [(SBRestartManager *)self _persistStartupTransitionContextFromShutdownContext:v4];
    id v6 = objc_alloc(MEMORY[0x1E4F62AF0]);
    id v7 = [NSString stringWithFormat:@"Shutdown (%@)", v4];
    v8 = (void *)[v6 initWithReason:v7];

    [v8 setRebootType:0];
    if ([v4 fromUserPowerDown]) {
      [v8 setSource:1];
    }
    [(SBRestartManager *)self _shutdownUsingOptions:v8];
  }
}

- (void)rebootForReason:(id)a3
{
  id v4 = a3;
  v5 = [[SBRebootContext alloc] initWithReason:v4];

  [(SBRestartManager *)self rebootWithContext:v5];
}

- (void)rebootWithContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (![(SBRestartManager *)self isPendingExit])
  {
    v5 = (void *)[v4 copy];
    id v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v5;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Reboot requested with context: %{public}@", buf, 0xCu);
    }

    [(SBRestartManager *)self _persistStartupTransitionContextFromRebootContext:v5];
    id v7 = objc_alloc(MEMORY[0x1E4F62AF0]);
    v8 = [NSString stringWithFormat:@"Reboot (%@)", v5];
    v9 = (void *)[v7 initWithReason:v8];

    if ([v5 isDark]) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
    [v9 setRebootType:v10];
    [(SBRestartManager *)self _shutdownUsingOptions:v9];
  }
}

- (void)restartWithTransitionRequest:(id)a3
{
  id v6 = a3;
  BSDispatchQueueAssertMain();
  if (!v6)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"SBRestartManager.m", 152, @"Invalid parameter not satisfying: %@", @"transitionRequest" object file lineNumber description];
  }
  if (![(SBRestartManager *)self _isPendingExitIncludingExternallyControlledReasons:0])[(SBRestartManager *)self _restartWithTransitionRequest:v6]; {
}
  }

- (id)description
{
  return [(SBRestartManager *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBRestartManager *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBRestartManager *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBRestartManager *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__SBRestartManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v5 = v4;
  id v10 = v5;
  uint64_t v11 = self;
  id v6 = (id)[v5 modifyBody:v9];
  id v7 = v5;

  return v7;
}

id __58__SBRestartManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 49) withName:@"isRestartImminent"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"pendingRestartTransitionRequest"];
  id v4 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"initialResetState"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"startupController"];
}

- (void)_addPendingExternallyControlledRestartReason:(id)a3
{
  id v7 = a3;
  BSDispatchQueueAssertMain();
  id v5 = v7;
  if (!v7)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBRestartManager.m", 196, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableSet *)self->_pendingExternallyControlledRestartReasons addObject:v5];
}

- (void)_removePendingExternallyControlledRestartReason:(id)a3
{
  id v7 = a3;
  BSDispatchQueueAssertMain();
  id v5 = v7;
  if (!v7)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBRestartManager.m", 202, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableSet *)self->_pendingExternallyControlledRestartReasons removeObject:v5];
}

- (void)_exitIsImminent
{
  if ([(SBRestartTransitionRequest *)self->_pendingRestartTransitionRequest restartType] == 3) {
    [(SBRestartManager *)self _postShutdownNotification];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (objc_opt_respondsToSelector()) {
      [v4 restartManagerExitImminent:self];
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)_killAllAppsForPendingExitWithReason:(int64_t)a3 description:(id)a4 expiration:(double)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = objc_opt_new();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __91__SBRestartManager__killAllAppsForPendingExitWithReason_description_expiration_completion___block_invoke;
  v23[3] = &unk_1E6AF6828;
  id v13 = v12;
  id v24 = v13;
  id v14 = v10;
  id v25 = v14;
  v15 = (void *)MEMORY[0x1D948C7A0](v23);
  workspaceDataSource = self->_workspaceDataSource;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __91__SBRestartManager__killAllAppsForPendingExitWithReason_description_expiration_completion___block_invoke_2;
  v21[3] = &unk_1E6AF5A50;
  id v17 = v15;
  id v22 = v17;
  [(SBRestartManagerWorkspaceDataSource *)workspaceDataSource terminateAllApplicationsForReason:a3 description:v11 completion:v21];

  if (a5 > 2.22044605e-16)
  {
    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __91__SBRestartManager__killAllAppsForPendingExitWithReason_description_expiration_completion___block_invoke_3;
    v19[3] = &unk_1E6AF5300;
    id v20 = v17;
    dispatch_after(v18, MEMORY[0x1E4F14428], v19);
  }
}

uint64_t __91__SBRestartManager__killAllAppsForPendingExitWithReason_description_expiration_completion___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) signal];
  if (result)
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      id v3 = *(uint64_t (**)(void))(result + 16);
      return v3();
    }
  }
  return result;
}

uint64_t __91__SBRestartManager__killAllAppsForPendingExitWithReason_description_expiration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __91__SBRestartManager__killAllAppsForPendingExitWithReason_description_expiration_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_shutdownUsingOptions:(id)a3
{
  id v4 = a3;
  if (!self->_isShuttingDown)
  {
    self->_isShuttingDown = 1;
    [(SBRestartManager *)self _postShutdownNotification];
    int v5 = [v4 isReboot];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v7 = WeakRetained;
    if (v5)
    {
      if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
        [v7 restartManagerWillReboot:self];
      }
    }
    else if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v7 restartManagerWillShutdown:self];
    }

    v8 = [v4 reason];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__SBRestartManager__shutdownUsingOptions___block_invoke;
    v9[3] = &unk_1E6AF4A98;
    void v9[4] = self;
    id v10 = v4;
    [(SBRestartManager *)self _killAllAppsForPendingExitWithReason:6 description:v8 expiration:v9 completion:4.0];
  }
}

uint64_t __42__SBRestartManager__shutdownUsingOptions___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) prepareForExitAndRelaunch:1];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 64);
  return [v3 shutdownUsingOptions:v2];
}

- (void)_postShutdownNotification
{
  id v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Posting shutdown notification.", v6, 2u);
  }

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"SBRestartManagerWillRebootNotification" object:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.springboard.deviceWillShutDown", 0, 0, 1u);
}

- (void)_playShutdownSound:(id)a3
{
  id v4 = (void (**)(void))a3;
  int v5 = [MEMORY[0x1E4F49458] sharedInstance];
  char v6 = [v5 startupSoundEnabled];

  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F4F688]);
    dispatch_time_t v8 = dispatch_time(0, 3000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__SBRestartManager__playShutdownSound___block_invoke;
    block[3] = &unk_1E6AF5FC8;
    block[4] = self;
    id v9 = v7;
    id v16 = v9;
    id v10 = v4;
    id v17 = v10;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39__SBRestartManager__playShutdownSound___block_invoke_2;
    v12[3] = &unk_1E6AF5FC8;
    v12[4] = self;
    id v13 = v9;
    id v14 = v10;
    id v11 = v9;
    AudioServicesPlaySystemSoundWithCompletion(0x4E5u, v12);
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t __39__SBRestartManager__playShutdownSound___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shutdownSoundDidComplete:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __39__SBRestartManager__playShutdownSound___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shutdownSoundDidComplete:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_shutdownSoundDidComplete:(id)a3 completion:(id)a4
{
  int v5 = (void (**)(void))a4;
  if ([a3 setFlag:1]) {
    v5[2]();
  }
}

- (void)_restartWithTransitionRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBRestartManager.m", 321, @"Invalid parameter not satisfying: %@", @"transitionRequest" object file lineNumber description];
  }
  char v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Restart with transition request: %{public}@", buf, 0xCu);
  }

  id v7 = (SBRestartTransitionRequest *)[v5 copy];
  pendingRestartTransitionRequest = self->_pendingRestartTransitionRequest;
  self->_pendingRestartTransitionRequest = v7;

  [v5 delay];
  double v10 = v9;
  if (BSFloatGreaterThanFloat())
  {
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__SBRestartManager__restartWithTransitionRequest___block_invoke;
    block[3] = &unk_1E6AF5290;
    block[4] = self;
    id v14 = v5;
    dispatch_after(v11, MEMORY[0x1E4F14428], block);
  }
  else
  {
    [(SBRestartManager *)self _reallyRestartWithTransitionRequest:v5];
  }
}

uint64_t __50__SBRestartManager__restartWithTransitionRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reallyRestartWithTransitionRequest:*(void *)(a1 + 40)];
}

- (void)_reallyRestartWithTransitionRequest:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SBRestartManager.m", 340, @"Invalid parameter not satisfying: %@", @"transitionRequest" object file lineNumber description];
  }
  char v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 reason];
    dispatch_time_t v8 = [v5 requester];
    *(_DWORD *)buf = 138543618;
    id v22 = v7;
    __int16 v23 = 2114;
    id v24 = v8;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Really restarting for reason \"%{public}@\" on behalf of %{public}@", buf, 0x16u);
  }
  self->_isRestartImminent = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained restartManager:self willRestartWithTransitionRequest:v5];
  }
  uint64_t v10 = [v5 restartType];
  dispatch_time_t v11 = [v5 customOverlayDescriptor];
  if ([v5 wantsPersistentSnapshot])
  {
    id v12 = NSString;
    id v13 = [v5 reason];
    id v14 = [v5 requester];
    v15 = [v12 stringWithFormat:@"RelaunchingSpringBoard-reason:%@-requester:%@", v13, v14];

    id v16 = (void *)MEMORY[0x1E4F4F260];
    uint64_t v17 = [MEMORY[0x1E4F39B60] mainDisplay];
    dispatch_time_t v18 = [v16 descriptorWithName:v15 display:v17];

    objc_msgSend(v18, "setInterfaceOrientation:", objc_msgSend((id)*MEMORY[0x1E4F43630], "activeInterfaceOrientation"));
    [v18 setLockBacklight:1];

    dispatch_time_t v11 = v18;
  }
  if (v11)
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F4F258]) initWithDescriptor:v11];
    [v19 present];
    if (v10 == 2) {
      [v19 freeze];
    }
  }
  [(SBRestartManager *)self _persistStartupTransitionContextFromRestartRequest:v5];
  [(SBRestartManager *)self _doRestartForTransition:v10];
}

- (void)_persistStartupTransitionContextFromRestartRequest:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBRestartManager.m", 390, @"Invalid parameter not satisfying: %@", @"transitionRequest" object file lineNumber description];
  }
  id v8 = [(SBRestartManagerWorkspaceDataSource *)self->_workspaceDataSource activePrimaryApplicationBundleID];
  id v6 = [[SBStartupTransitionContext alloc] _initWithRestartRequest:v5 fromLocked:[(SBRestartManagerWorkspaceDataSource *)self->_workspaceDataSource isUILocked] fromApplication:v8];

  [(SBStartupTransitionController *)self->_startupController _saveContextFromTransitionContext:v6];
}

- (void)_persistStartupTransitionContextFromRebootContext:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBRestartManager.m", 402, @"Invalid parameter not satisfying: %@", @"rebootContext" object file lineNumber description];
  }
  id v7 = [[SBStartupTransitionContext alloc] _initWithRebootContext:v5];

  [(SBStartupTransitionController *)self->_startupController _saveContextFromTransitionContext:v7];
}

- (void)_persistStartupTransitionContextFromShutdownContext:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBRestartManager.m", 410, @"Invalid parameter not satisfying: %@", @"shutdownContext" object file lineNumber description];
  }
  id v7 = [[SBStartupTransitionContext alloc] _initWithShutdownContext:v5];

  [(SBStartupTransitionController *)self->_startupController _saveContextFromTransitionContext:v7];
}

- (void)_doRestartForTransition:(int)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  switch(a3)
  {
    case 0:
      systemService = self->_systemService;
      [(FBSystemService *)systemService exitAndRelaunch:1];
      break;
    case 1:
      [(FBSystemService *)self->_systemService prepareForExitAndRelaunch:1];
      id v6 = [MEMORY[0x1E4F963F8] identifierForCurrentProcess];
      id v7 = [MEMORY[0x1E4F96430] predicateMatchingIdentifier:v6];
      id v8 = [MEMORY[0x1E4F96430] predicateForClearTheBoard];
      double v9 = (void *)MEMORY[0x1E4F96430];
      v27[0] = v7;
      v27[1] = v8;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
      dispatch_time_t v11 = [v9 predicateMatchingAnyPredicate:v10];

      id v12 = (void *)[objc_alloc(MEMORY[0x1E4F96488]) initWithExplanation:@"SBRestartManager"];
      [v12 setReportType:0];
      [v12 setExceptionDomain:10];
      [v12 setExceptionCode:1539435076];
      [v12 setMaximumTerminationResistance:40];
      id v13 = (void *)[objc_alloc(MEMORY[0x1E4F96490]) initWithPredicate:v11 context:v12];
      id v24 = 0;
      char v14 = [v13 execute:&v24];
      id v15 = v24;
      if ((v14 & 1) == 0)
      {
        id v16 = SBLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v15;
          _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "restart manager failed to clear the board: %@", buf, 0xCu);
        }
      }
      uint64_t v17 = dispatch_get_global_queue(33, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__SBRestartManager__doRestartForTransition___block_invoke;
      block[3] = &unk_1E6AF4AC0;
      block[4] = self;
      dispatch_async(v17, block);

      goto LABEL_11;
    case 2:
      [(FBSystemService *)self->_systemService prepareForExitAndRelaunch:1];
      id v6 = [MEMORY[0x1E4F4F398] actionWithOptions:1];
      dispatch_time_t v18 = [MEMORY[0x1E4F624D0] sharedInstance];
      v19 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
      [v18 sendActionsToBackBoard:v19];

      id v7 = dispatch_get_global_queue(33, 0);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __44__SBRestartManager__doRestartForTransition___block_invoke_2;
      v22[3] = &unk_1E6AF4AC0;
      v22[4] = self;
      dispatch_async(v7, v22);
LABEL_11:

      break;
    case 3:
      id v20 = self->_systemService;
      [(FBSystemService *)v20 prepareForExitAndRelaunch:1];
      break;
    case 4:
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __44__SBRestartManager__doRestartForTransition___block_invoke_3;
      v21[3] = &unk_1E6AF5350;
      void v21[4] = self;
      [(SBRestartManager *)self _killAllAppsForPendingExitWithReason:5 description:@"Obliteration" expiration:v21 completion:4.0];
      break;
    default:
      return;
  }
}

uint64_t __44__SBRestartManager__doRestartForTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "___waitForeverForRunningBoardKill");
}

uint64_t __44__SBRestartManager__doRestartForTransition___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "___waitForeverForRunningBoardKill");
}

uint64_t __44__SBRestartManager__doRestartForTransition___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) prepareForExitAndRelaunch:1];
}

- (void)___waitForeverForRunningBoardKill
{
  uint64_t v2 = dispatch_semaphore_create(0);
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
}

- (SBRestartManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBRestartManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBRestartTransitionRequest)pendingRestartTransitionRequest
{
  return self->_pendingRestartTransitionRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemService, 0);
  objc_storeStrong((id *)&self->_pendingExternallyControlledRestartReasons, 0);
  objc_storeStrong((id *)&self->_workspaceDataSource, 0);
  objc_storeStrong((id *)&self->_pendingRestartTransitionRequest, 0);
  objc_storeStrong((id *)&self->_startupController, 0);
  objc_storeStrong((id *)&self->_initialRestartState, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end