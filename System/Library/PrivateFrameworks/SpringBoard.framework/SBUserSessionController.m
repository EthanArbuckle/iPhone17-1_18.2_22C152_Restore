@interface SBUserSessionController
- (BOOL)canLogout;
- (BOOL)isLoggingOut;
- (BOOL)isLoginSession;
- (BOOL)isMultiUserSupported;
- (CGPoint)_portraitOrientedProgressLocationForOrientation:(int64_t)a3;
- (NSString)description;
- (SBMainDisplayPolicyAggregator)_policyAggregator;
- (SBMainDisplayPolicyAggregator)policyAggregator;
- (SBUserSessionController)init;
- (UMUser)user;
- (id)_initWithUserManager:(id)a3;
- (id)_massageApplicationListForDisplay:(id)a3;
- (id)debugBlockingTasksForLogoutProgressTransientOverlayViewController:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)pendingApplicationsForLogoutProgressTransientOverlayViewController:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)sessionType;
- (void)_displayProgressTransientOverlayIfNeeded;
- (void)_evaluateRunningApplications;
- (void)_noteApplicationDidExit:(id)a3;
- (void)_noteApplicationDidExitFromNotification:(id)a3;
- (void)_readyToSwitchToUser:(id)a3;
- (void)_setPolicyAggregator:(id)a3;
- (void)dealloc;
- (void)disableCurrentUser;
- (void)logout;
- (void)logoutProgressTransientOverlayPresentationTransitionCoordinatorDidComplete:(id)a3;
- (void)logoutProgressTransientOverlayViewControllerDidDisappear:(id)a3;
- (void)logoutWithLogoutSupport:(id)a3;
- (void)readyToSwitchToLoginSession:(id)a3;
- (void)readyToSwitchToUser:(id)a3;
- (void)setLoggingOut:(BOOL)a3;
- (void)userSwitchBlockingTasksDidUpdate:(id)a3;
- (void)willSwitchToUser:(id)a3;
@end

@implementation SBUserSessionController

- (BOOL)isLoginSession
{
  return [(UMUserManager *)self->_userManager isLoginSession];
}

- (SBUserSessionController)init
{
  v3 = [MEMORY[0x1E4FB36F8] sharedManager];
  v4 = [(SBUserSessionController *)self _initWithUserManager:v3];

  return v4;
}

- (id)_initWithUserManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBUserSessionController;
  v6 = [(SBUserSessionController *)&v10 init];
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userManager, a3);
    [p_isa[1] registerCriticalUserSwitchStakeHolder:p_isa];
    v8 = SBLogUserSession();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[SBUserSessionController _initWithUserManager:](p_isa + 1, p_isa);
    }
  }
  return p_isa;
}

- (void)dealloc
{
  [(UMUserManager *)self->_userManager unregisterStakeHolder:self status:0 reason:0];
  v3.receiver = self;
  v3.super_class = (Class)SBUserSessionController;
  [(SBUserSessionController *)&v3 dealloc];
}

- (void)setLoggingOut:(BOOL)a3
{
  if (self->_loggingOut != a3)
  {
    BOOL v3 = a3;
    self->_loggingOut = a3;
    v4 = [(id)SBApp restartManager];
    id v5 = v4;
    if (v3) {
      [v4 _addPendingExternallyControlledRestartReason:@"user-switch"];
    }
    else {
      [v4 _removePendingExternallyControlledRestartReason:@"user-switch"];
    }
  }
}

- (UMUser)user
{
  lazy_user = self->_lazy_user;
  if (!lazy_user)
  {
    v4 = [(UMUserManager *)self->_userManager currentUser];
    id v5 = self->_lazy_user;
    self->_lazy_user = v4;

    lazy_user = self->_lazy_user;
  }
  return lazy_user;
}

- (BOOL)isMultiUserSupported
{
  return [(UMUserManager *)self->_userManager isMultiUser];
}

- (BOOL)canLogout
{
  BOOL v3 = [(SBUserSessionController *)self policyAggregator];
  int v4 = [v3 allowsCapability:15];

  if (v4 && ![(SBUserSessionController *)self isLoggingOut])
  {
    BOOL v5 = [(SBUserSessionController *)self isMultiUserSupported];
    if (v5) {
      LOBYTE(v5) = ![(SBUserSessionController *)self isLoginSession];
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (int64_t)sessionType
{
  if (![(SBUserSessionController *)self isMultiUserSupported]) {
    return 0;
  }
  BOOL v3 = [(SBUserSessionController *)self user];
  uint64_t v4 = [v3 userType];

  if (v4) {
    return 2 * (v4 == 1);
  }
  else {
    return 1;
  }
}

- (void)logout
{
  logoutSupport = self->_logoutSupport;
  if (!logoutSupport)
  {
    uint64_t v4 = (LKLogoutSupport *)objc_opt_new();
    BOOL v5 = self->_logoutSupport;
    self->_logoutSupport = v4;

    logoutSupport = self->_logoutSupport;
  }
  [(SBUserSessionController *)self logoutWithLogoutSupport:logoutSupport];
}

- (void)logoutWithLogoutSupport:(id)a3
{
  if ([(SBUserSessionController *)self canLogout])
  {
    uint64_t v4 = +[SBLockScreenManager sharedInstance];
    int v5 = [v4 isInLostMode];

    v6 = SBLogUserSession();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7) {
        -[SBUserSessionController logoutWithLogoutSupport:]();
      }
    }
    else if (v7)
    {
      -[SBUserSessionController logoutWithLogoutSupport:]();
    }

    [(SBUserSessionController *)self _displayProgressTransientOverlayIfNeeded];
  }
  else
  {
    v8 = SBLogUserSession();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[SBUserSessionController logoutWithLogoutSupport:]();
    }
  }
}

- (void)disableCurrentUser
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "LOGOUT: Forcing logout and disable of current user", v2, v3, v4, v5, v6);
}

void __45__SBUserSessionController_disableCurrentUser__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = SBLogUserSession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __45__SBUserSessionController_disableCurrentUser__block_invoke_cold_1((uint64_t)v2, v3, v4);
  }
}

- (NSString)description
{
  return (NSString *)[(SBUserSessionController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(SBUserSessionController *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBUserSessionController *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [(SBUserSessionController *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__SBUserSessionController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v5 = v4;
  id v10 = v5;
  v11 = self;
  id v6 = (id)[v5 modifyBody:v9];
  id v7 = v5;

  return v7;
}

id __65__SBUserSessionController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) user];
  id v4 = (id)[v2 appendObject:v3 withName:@"userAccount"];

  id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isMultiUserSupported"), @"multiUserSupported");
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "canLogout"), @"canLogout");
}

- (id)pendingApplicationsForLogoutProgressTransientOverlayViewController:(id)a3
{
  return self->_displayApplications;
}

- (id)debugBlockingTasksForLogoutProgressTransientOverlayViewController:(id)a3
{
  return self->_debugBlockingTasks;
}

- (void)logoutProgressTransientOverlayViewControllerDidDisappear:(id)a3
{
  progressTransientOverlayViewController = self->_progressTransientOverlayViewController;
  self->_progressTransientOverlayViewController = 0;

  self->_loggingOut = 0;
}

- (void)logoutProgressTransientOverlayPresentationTransitionCoordinatorDidComplete:(id)a3
{
  logoutSupport = self->_logoutSupport;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __102__SBUserSessionController_logoutProgressTransientOverlayPresentationTransitionCoordinatorDidComplete___block_invoke;
  v4[3] = &unk_1E6AFC6D0;
  v4[4] = self;
  [(LKLogoutSupport *)logoutSupport logoutToLoginWindowWithCompletionHandler:v4];
}

void __102__SBUserSessionController_logoutProgressTransientOverlayPresentationTransitionCoordinatorDidComplete___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __102__SBUserSessionController_logoutProgressTransientOverlayPresentationTransitionCoordinatorDidComplete___block_invoke_2;
  v6[3] = &unk_1E6AF5290;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __102__SBUserSessionController_logoutProgressTransientOverlayPresentationTransitionCoordinatorDidComplete___block_invoke_2(uint64_t a1)
{
  id v2 = SBLogUserSession();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __102__SBUserSessionController_logoutProgressTransientOverlayPresentationTransitionCoordinatorDidComplete___block_invoke_2_cold_1(a1, v2, v3);
  }

  if (*(void *)(a1 + 32))
  {
    uint64_t v4 = +[SBWorkspace mainWorkspace];
    [v4 dismissTransientOverlayViewController:*(void *)(*(void *)(a1 + 40) + 32) animated:1 completion:0];

    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = 0;

    [*(id *)(a1 + 40) setLoggingOut:0];
  }
}

- (void)willSwitchToUser:(id)a3
{
  id v5 = a3;
  kdebug_trace();
  id v6 = SBLogUserSession();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SBUserSessionController willSwitchToUser:]((uint64_t)self);
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SBUserSessionController.m" lineNumber:259 description:@"This is not expected to land on the main thread."];
  }
  if ([(SBUserSessionController *)self isLoginSession])
  {
    id v7 = SBLogUserSession();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[SBUserSessionController] willSwitchToUser: Exiting early for login session. User switch pending... ", buf, 2u);
    }

    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_43_1);
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4FB3720] taskWithName:@"terminate running tasks" reason:@"terminate running tasks"];
    terminateApplicationsTask = self->_terminateApplicationsTask;
    self->_terminateApplicationsTask = v8;

    [(UMUserSwitchBlockingTask *)self->_terminateApplicationsTask begin];
    id v10 = (NSDate *)objc_opt_new();
    terminateApplicationsStartDate = self->_terminateApplicationsStartDate;
    self->_terminateApplicationsStartDate = v10;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__SBUserSessionController_willSwitchToUser___block_invoke_2;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    kdebug_trace();
  }
}

void __44__SBUserSessionController_willSwitchToUser___block_invoke()
{
  id v0 = [(id)SBApp restartManager];
  [v0 _addPendingExternallyControlledRestartReason:@"user-switch"];
}

void __44__SBUserSessionController_willSwitchToUser___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setLoggingOut:1];
  [*(id *)(a1 + 32) _displayProgressTransientOverlayIfNeeded];
  id v2 = SBLogUserSession();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "LOGOUT: Terminating running applications.", buf, 2u);
  }

  kdebug_trace();
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:sel__noteApplicationDidExitFromNotification_ name:@"SBApplicationDidExitNotification" object:0];

  uint64_t v4 = +[SBApplicationController sharedInstance];
  id v5 = [v4 runningApplications];

  uint64_t v6 = [MEMORY[0x1E4F1CA80] setWithArray:v5];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 48);
  *(void *)(v7 + 48) = v6;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __44__SBUserSessionController_willSwitchToUser___block_invoke_57;
        v15[3] = &unk_1E6AF4A98;
        v15[4] = *(void *)(a1 + 32);
        v15[5] = v14;
        SBWorkspaceTerminateApplication(v14, 9, 0, @"Logout", v15);
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v11);
  }

  [*(id *)(a1 + 32) _evaluateRunningApplications];
}

uint64_t __44__SBUserSessionController_willSwitchToUser___block_invoke_57(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteApplicationDidExit:*(void *)(a1 + 40)];
}

- (void)readyToSwitchToUser:(id)a3
{
  id v5 = a3;
  kdebug_trace();
  kdebug_trace();
  uint64_t v6 = SBLogUserSession();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SBUserSessionController readyToSwitchToUser:]((uint64_t)self);
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBUserSessionController.m" lineNumber:306 description:@"This cannot be invoked on the main thread."];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__SBUserSessionController_readyToSwitchToUser___block_invoke;
  v9[3] = &unk_1E6AF5290;
  void v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(MEMORY[0x1E4F14428], v9);
}

void __47__SBUserSessionController_readyToSwitchToUser___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _readyToSwitchToUser:*(void *)(a1 + 40)];
  uint64_t v1 = SBLogUserSession();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    __47__SBUserSessionController_readyToSwitchToUser___block_invoke_cold_1();
  }

  kdebug_trace();
  id v2 = [[SBRestartTransitionRequest alloc] initWithRequester:@"SBUserSessionController" reason:@"switchToUser"];
  [(SBRestartTransitionRequest *)v2 setRestartType:3];
  uint64_t v3 = [(id)SBApp restartManager];
  [v3 restartWithTransitionRequest:v2];
}

- (void)readyToSwitchToLoginSession:(id)a3
{
  id v5 = a3;
  uint64_t v6 = SBLogUserSession();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SBUserSessionController readyToSwitchToLoginSession:]((uint64_t)self, v6);
  }

  kdebug_trace();
  kdebug_trace();
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBUserSessionController.m" lineNumber:326 description:@"This cannot be invoked on the main thread."];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__SBUserSessionController_readyToSwitchToLoginSession___block_invoke;
  v9[3] = &unk_1E6AF5290;
  void v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(MEMORY[0x1E4F14428], v9);
}

void __55__SBUserSessionController_readyToSwitchToLoginSession___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _readyToSwitchToUser:*(void *)(a1 + 40)];
  uint64_t v1 = SBLogUserSession();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    __55__SBUserSessionController_readyToSwitchToLoginSession___block_invoke_cold_1();
  }

  kdebug_trace();
  id v2 = [[SBRestartTransitionRequest alloc] initWithRequester:@"SBUserSessionController" reason:@"switchToLoginSession"];
  [(SBRestartTransitionRequest *)v2 setRestartType:2];
  uint64_t v3 = [(id)SBApp restartManager];
  [v3 restartWithTransitionRequest:v2];

  kdebug_trace();
}

- (void)_readyToSwitchToUser:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  debugBlockingTasks = self->_debugBlockingTasks;
  self->_debugBlockingTasks = 0;

  if ([(SBUserSessionController *)self isLoginSession]) {
    int v6 = [v4 isLoginUser] ^ 1;
  }
  else {
    int v6 = 0;
  }
  if ([(SBUserSessionController *)self isLoginSession])
  {
    int v7 = [v4 isLoginUser];
    uint64_t v8 = @"login";
    if (!v7)
    {
      int v9 = 0;
      id v10 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v8 = @"login";
  }
  id v10 = @"logout";
  int v9 = 1;
LABEL_9:
  if (!v6) {
    uint64_t v8 = v10;
  }
  uint64_t v11 = v8;
  uint64_t v12 = SBLogUserSession();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = [(UMUserManager *)self->_userManager currentUser];
    v23[0] = 67109890;
    v23[1] = v6;
    __int16 v24 = 1024;
    int v25 = v9;
    __int16 v26 = 2112;
    v27 = v22;
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_debug_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEBUG, "[SBUserSessionController] _readyToSwitchToUser: (isLogin: %d, isLogout: %d, currentUser? %@) switching to user: %@", (uint8_t *)v23, 0x22u);
  }
  if (v11)
  {
    [(SBLogoutProgressTransientOverlayViewController *)self->_progressTransientOverlayViewController prepareForRestart];
    kdebug_trace();
    uint64_t v13 = [(id)SBApp activeInterfaceOrientation];
    v14 = (void *)MEMORY[0x1E4F4F250];
    [(SBUserSessionController *)self _portraitOrientedProgressLocationForOrientation:v13];
    v15 = objc_msgSend(v14, "progressIndicatorWithStyle:position:", 1);
    long long v16 = (void *)MEMORY[0x1E4F4F260];
    long long v17 = [MEMORY[0x1E4F39B60] mainDisplay];
    long long v18 = [v16 descriptorWithName:v11 display:v17];

    [v18 setProgressIndicatorProperties:v15];
    [v18 setInterfaceOrientation:v13];
    long long v19 = +[SBBacklightController sharedInstance];
    if ([v19 shouldTurnOnScreenForBacklightSource:21])
    {
      v20 = +[SBBacklightController sharedInstance];
      [v20 setBacklightState:1 source:21];
    }
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F4F258]) initWithDescriptor:v18];
    [v21 present];
    [v21 freeze];
    kdebug_trace();
    kdebug_trace();
  }
}

- (void)userSwitchBlockingTasksDidUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__SBUserSessionController_userSwitchBlockingTasksDidUpdate___block_invoke;
  v6[3] = &unk_1E6AF5290;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __60__SBUserSessionController_userSwitchBlockingTasksDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t v1 = (uint64_t *)(a1 + 40);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
  [*(id *)(*(v1 - 1) + 32) refreshData];
  id v2 = SBLogUserSession();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __60__SBUserSessionController_userSwitchBlockingTasksDidUpdate___block_invoke_cold_1(v1, v2, v3);
  }
}

- (SBMainDisplayPolicyAggregator)policyAggregator
{
  lazy_policyAggregator = self->_lazy_policyAggregator;
  if (!lazy_policyAggregator)
  {
    id v4 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
    id v5 = [v4 policyAggregator];
    int v6 = self->_lazy_policyAggregator;
    self->_lazy_policyAggregator = v5;

    lazy_policyAggregator = self->_lazy_policyAggregator;
  }
  return lazy_policyAggregator;
}

- (void)_noteApplicationDidExitFromNotification:(id)a3
{
  id v4 = [a3 object];
  [(SBUserSessionController *)self _noteApplicationDidExit:v4];
}

- (void)_noteApplicationDidExit:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBUserSessionController.m", 404, @"Invalid parameter not satisfying: %@", @"application" object file lineNumber description];
  }
  int v6 = SBLogUserSession();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(SBUserSessionController *)(uint64_t)v5 _noteApplicationDidExit:v7];
  }

  [(NSMutableSet *)self->_terminatingApplications removeObject:v5];
  [(NSMutableArray *)self->_displayApplications removeObject:v5];
  [(SBLogoutProgressTransientOverlayViewController *)self->_progressTransientOverlayViewController refreshData];
  [(SBUserSessionController *)self _evaluateRunningApplications];
}

- (void)_evaluateRunningApplications
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_2_6(&dword_1D85BA000, a2, a3, "LOGOUT: still not switching; _terminatingApplications = %@",
    (uint8_t *)&v4);
}

- (void)_displayProgressTransientOverlayIfNeeded
{
  v18[3] = *MEMORY[0x1E4F143B8];
  if (!self->_progressTransientOverlayViewController)
  {
    uint64_t v3 = SBLogUserSession();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v16 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "LOGOUT: displaying logout transient overlay.", v16, 2u);
    }

    kdebug_trace();
    int v4 = +[SBApplicationController sharedInstance];
    uint64_t v5 = [v4 runningApplications];
    uint64_t v6 = [(SBUserSessionController *)self _massageApplicationListForDisplay:v5];
    uint64_t v7 = (NSMutableArray *)[v6 mutableCopy];
    displayApplications = self->_displayApplications;
    self->_displayApplications = v7;

    int v9 = [SBLogoutProgressTransientOverlayViewController alloc];
    id v10 = [(SBUserSessionController *)self user];
    uint64_t v11 = [(SBLogoutProgressTransientOverlayViewController *)v9 initWithUserAccount:v10];
    progressTransientOverlayViewController = self->_progressTransientOverlayViewController;
    self->_progressTransientOverlayViewController = v11;

    [(SBLogoutProgressTransientOverlayViewController *)self->_progressTransientOverlayViewController setDataSource:self];
    [(SBLogoutProgressTransientOverlayViewController *)self->_progressTransientOverlayViewController setDelegate:self];
    uint64_t v13 = +[SBLockScreenManager sharedInstanceIfExists];
    v17[0] = @"SBUILockOptionsForceLockKey";
    v17[1] = @"SBUILockOptionsAnimateLockScreenActivationKey";
    v18[0] = MEMORY[0x1E4F1CC38];
    v18[1] = MEMORY[0x1E4F1CC28];
    v17[2] = @"SBUILockOptionsUseScreenOffModeKey";
    v18[2] = MEMORY[0x1E4F1CC28];
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
    [v13 lockUIFromSource:17 withOptions:v14];

    v15 = +[SBWorkspace mainWorkspace];
    [v15 presentTransientOverlayViewController:self->_progressTransientOverlayViewController animated:1 completion:0];

    kdebug_trace();
  }
}

- (id)_massageApplicationListForDisplay:(id)a3
{
  id v3 = a3;
  int v4 = (void *)[v3 mutableCopy];
  uint64_t v5 = +[SBIconController sharedInstance];
  uint64_t v6 = [v5 visibleIconStateDisplayIdentifiers];

  uint64_t v7 = (void *)MEMORY[0x1E4F28F60];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __61__SBUserSessionController__massageApplicationListForDisplay___block_invoke;
  v26[3] = &unk_1E6AFD140;
  id v8 = v6;
  id v27 = v8;
  int v9 = [v7 predicateWithBlock:v26];
  [v4 filterUsingPredicate:v9];

  id v10 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  uint64_t v11 = [v10 recentAppLayouts];

  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __61__SBUserSessionController__massageApplicationListForDisplay___block_invoke_2;
  v22[3] = &unk_1E6AFD190;
  id v13 = v12;
  id v23 = v13;
  __int16 v24 = v25;
  [v11 enumerateObjectsUsingBlock:v22];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  long long v19 = __61__SBUserSessionController__massageApplicationListForDisplay___block_invoke_4;
  v20 = &unk_1E6AFD1B8;
  id v14 = v13;
  id v21 = v14;
  [v4 sortUsingComparator:&v17];
  v15 = objc_msgSend(v4, "copy", v17, v18, v19, v20);

  _Block_object_dispose(v25, 8);
  return v15;
}

uint64_t __61__SBUserSessionController__massageApplicationListForDisplay___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

void __61__SBUserSessionController__massageApplicationListForDisplay___block_invoke_2(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SBUserSessionController__massageApplicationListForDisplay___block_invoke_3;
  v6[3] = &unk_1E6AFD168;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [a2 enumerate:v6];
}

void __61__SBUserSessionController__massageApplicationListForDisplay___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  if (![v8 type])
  {
    id v4 = NSNumber;
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v5 = objc_msgSend(v4, "numberWithInteger:");
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = [v8 bundleIdentifier];
    [v6 setObject:v5 forKeyedSubscript:v7];
  }
}

uint64_t __61__SBUserSessionController__massageApplicationListForDisplay___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = [v5 bundleIdentifier];
  uint64_t v9 = [v7 objectForKey:v8];
  id v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = (void *)v9;
  }
  else {
    uint64_t v11 = &unk_1F3349D70;
  }
  id v12 = v11;

  id v13 = *(void **)(a1 + 32);
  id v14 = [v6 bundleIdentifier];
  uint64_t v15 = [v13 objectForKey:v14];
  long long v16 = (void *)v15;
  if (v15) {
    uint64_t v17 = (void *)v15;
  }
  else {
    uint64_t v17 = &unk_1F3349D70;
  }
  id v18 = v17;

  uint64_t v19 = [v12 compare:v18];
  if (!v19)
  {
    v20 = [v5 displayName];
    id v21 = [v6 displayName];
    uint64_t v19 = [v20 localizedCompare:v21];
  }
  return v19;
}

- (CGPoint)_portraitOrientedProgressLocationForOrientation:(int64_t)a3
{
  id v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 _referenceBounds];

  _UIWindowConvertPointFromOrientationToOrientation();
  result.y = v5;
  result.x = v4;
  return result;
}

- (BOOL)isLoggingOut
{
  return self->_loggingOut;
}

- (SBMainDisplayPolicyAggregator)_policyAggregator
{
  return self->_lazy_policyAggregator;
}

- (void)_setPolicyAggregator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoutSupport, 0);
  objc_storeStrong((id *)&self->_debugBlockingTasks, 0);
  objc_storeStrong((id *)&self->_terminateApplicationsStartDate, 0);
  objc_storeStrong((id *)&self->_terminateApplicationsTask, 0);
  objc_storeStrong((id *)&self->_terminatingApplications, 0);
  objc_storeStrong((id *)&self->_displayApplications, 0);
  objc_storeStrong((id *)&self->_progressTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_lazy_policyAggregator, 0);
  objc_storeStrong((id *)&self->_lazy_user, 0);
  objc_storeStrong((id *)&self->_userManager, 0);
}

- (void)_initWithUserManager:(id *)a1 .cold.1(id *a1, void *a2)
{
  id v3 = [*a1 currentUser];
  [a2 isMultiUserSupported];
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v4, v5, "INITIALIZE: session started as user: %@ (multi-user session: %@)", v6, v7, v8, v9, 2u);
}

- (void)logoutWithLogoutSupport:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "LOGOUT: Logout initiated automatically due to lost mode activation.", v2, v3, v4, v5, v6);
}

- (void)logoutWithLogoutSupport:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "LOGOUT: Logout initiated by user.", v2, v3, v4, v5, v6);
}

- (void)logoutWithLogoutSupport:.cold.3()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "LOGOUT: Logout attempted, but logout is not supported.", v2, v3, v4, v5, v6);
}

void __45__SBUserSessionController_disableCurrentUser__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v5 = [NSString stringWithFormat:@"with error: %@", a1];
  }
  else
  {
    uint64_t v5 = @"successfully";
  }
  int v6 = 138412290;
  uint64_t v7 = v5;
  OUTLINED_FUNCTION_2_6(&dword_1D85BA000, a2, a3, "LOGOUT: disable current user call completed %@", (uint8_t *)&v6);
  if (a1) {
}
  }

void __102__SBUserSessionController_logoutProgressTransientOverlayPresentationTransitionCoordinatorDidComplete___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"with error: %@", v4];
  }
  else
  {
    uint64_t v5 = @"successfully";
  }
  int v6 = 138412290;
  uint64_t v7 = v5;
  OUTLINED_FUNCTION_2_6(&dword_1D85BA000, a2, a3, "LOGOUT completed: %@", (uint8_t *)&v6);
  if (v4) {
}
  }

- (void)willSwitchToUser:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 8) currentUser];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v2, v3, "[SBUserSessionController] willSwitchToUser: (currentUser? %@) will switch to user: %@", v4, v5, v6, v7, v8);
}

- (void)readyToSwitchToUser:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 8) currentUser];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v2, v3, "[SBUserSessionController] readyToSwitchToUser: (currentUser? %@) ready to switch to user: %@", v4, v5, v6, v7, v8);
}

void __47__SBUserSessionController_readyToSwitchToUser___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "[SBUserSessionController] readyToSwitchToUser: we're now ready for the user switch.", v2, v3, v4, v5, v6);
}

- (void)readyToSwitchToLoginSession:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 8) currentUser];
  int v5 = 138412290;
  uint8_t v6 = v3;
  OUTLINED_FUNCTION_2_6(&dword_1D85BA000, a2, v4, "[SBUserSessionController] readyToSwitchToLoginSession: (currentUser? %@) ready to switch to login session.", (uint8_t *)&v5);
}

void __55__SBUserSessionController_readyToSwitchToLoginSession___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "[SBUserSessionController] readyToSwitchToLoginSession: Ready for the user switch. Restarting backboardd.", v2, v3, v4, v5, v6);
}

void __60__SBUserSessionController_userSwitchBlockingTasksDidUpdate___block_invoke_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_2_6(&dword_1D85BA000, a2, a3, "[SBUserSessionController] userSwitchBlockingTasksDidUpdate: bundleIDsToTasks = %@", (uint8_t *)&v4);
}

- (void)_noteApplicationDidExit:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_2_6(&dword_1D85BA000, a2, a3, "LOGOUT: application exited: %@", (uint8_t *)&v3);
}

@end