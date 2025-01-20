@interface SBTodayWidgetXCodeDebuggingUtility
- (SBTodayWidgetXCodeDebuggingUtility)init;
- (void)_reallyLaunchTodayViewFromCurrentContextWithCompletion:(id)a3;
- (void)launchTodayViewFromCurrentContextWithCompletion:(id)a3;
@end

@implementation SBTodayWidgetXCodeDebuggingUtility

- (SBTodayWidgetXCodeDebuggingUtility)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBTodayWidgetXCodeDebuggingUtility;
  v2 = [(SBTodayWidgetXCodeDebuggingUtility *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[SBLockScreenManager sharedInstance];
    lockScreenManager = v2->_lockScreenManager;
    v2->_lockScreenManager = (SBLockScreenManager *)v3;

    v5 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
    uint64_t v6 = [v5 policyAggregator];
    policyAggregator = v2->_policyAggregator;
    v2->_policyAggregator = (SBMainDisplayPolicyAggregator *)v6;
  }
  return v2;
}

- (void)launchTodayViewFromCurrentContextWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[SBDismissOverlaysAnimationController alloc] initWithTransitionContextProvider:0 options:-1];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __86__SBTodayWidgetXCodeDebuggingUtility_launchTodayViewFromCurrentContextWithCompletion___block_invoke;
  v12 = &unk_1E6AF5AA0;
  v13 = self;
  id v14 = v4;
  id v6 = v4;
  [(SBDismissOverlaysAnimationController *)v5 setCompletionBlock:&v9];
  [(SBDismissOverlaysAnimationController *)v5 begin];
  v7 = SBLogDashBoard();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = [(SBDismissOverlaysAnimationController *)v5 debugDescription];
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "dismissOverlaysAnimationController: %@", buf, 0xCu);
  }
}

uint64_t __86__SBTodayWidgetXCodeDebuggingUtility_launchTodayViewFromCurrentContextWithCompletion___block_invoke(uint64_t a1)
{
  v2 = SBLogDashBoard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "dismiss overlays animation controller finished.", v4, 2u);
  }

  return [*(id *)(a1 + 32) _reallyLaunchTodayViewFromCurrentContextWithCompletion:*(void *)(a1 + 40)];
}

- (void)_reallyLaunchTodayViewFromCurrentContextWithCompletion:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *))a3;
  BOOL v5 = [(SBLockScreenManager *)self->_lockScreenManager isUILocked];
  policyAggregator = self->_policyAggregator;
  if (v5)
  {
    if ([(SBMainDisplayPolicyAggregator *)policyAggregator allowsCapability:22])
    {
      v7 = [(SBLockScreenManager *)self->_lockScreenManager lockScreenEnvironment];
      v8 = [v7 rootViewController];

      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (v4 && (isKindOfClass & 1) == 0)
      {
        uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v28 = *MEMORY[0x1E4F28568];
        v29 = @"DashBoard is required to work in the lock-screen.";
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        v12 = [v10 errorWithDomain:@"SBTodayWidgetLaunchErrorDomain" code:2 userInfo:v11];
        v4[2](v4, 0, v12);
      }
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __93__SBTodayWidgetXCodeDebuggingUtility__reallyLaunchTodayViewFromCurrentContextWithCompletion___block_invoke;
      v23[3] = &unk_1E6AF6828;
      id v13 = v8;
      id v24 = v13;
      v25 = v4;
      id v14 = (void (**)(void))MEMORY[0x1D948C7A0](v23);
      v15 = +[SBCoverSheetPresentationManager sharedInstance];
      if ([v15 isCoverSheetHostingAnApp]) {
        [v15 setCoverSheetPresented:1 animated:1 withCompletion:v14];
      }
      else {
        v14[2](v14);
      }

      goto LABEL_17;
    }
    if (v4)
    {
      v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      v31[0] = @"Today view is restricted.";
      uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
      v18 = (__CFString **)v31;
      v19 = &v30;
LABEL_14:
      id v13 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:1];
      v20 = [v16 errorWithDomain:@"SBTodayWidgetLaunchErrorDomain" code:1 userInfo:v13];
      v4[2](v4, 0, v20);

      goto LABEL_17;
    }
  }
  else
  {
    if ([(SBMainDisplayPolicyAggregator *)policyAggregator allowsCapability:23])
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __93__SBTodayWidgetXCodeDebuggingUtility__reallyLaunchTodayViewFromCurrentContextWithCompletion___block_invoke_3;
      v21[3] = &unk_1E6AF5A50;
      v22 = v4;
      SBWorkspaceForceToSpringBoard(v21);
      id v13 = v22;
LABEL_17:

      goto LABEL_18;
    }
    if (v4)
    {
      v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v27 = @"Today view is restricted.";
      uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
      v18 = &v27;
      v19 = &v26;
      goto LABEL_14;
    }
  }
LABEL_18:
}

void __93__SBTodayWidgetXCodeDebuggingUtility__reallyLaunchTodayViewFromCurrentContextWithCompletion___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __93__SBTodayWidgetXCodeDebuggingUtility__reallyLaunchTodayViewFromCurrentContextWithCompletion___block_invoke_2;
  v3[3] = &unk_1E6AF5300;
  v1 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v2 = v1;
  [v2 activateTodayViewWithCompletion:v3];
}

uint64_t __93__SBTodayWidgetXCodeDebuggingUtility__reallyLaunchTodayViewFromCurrentContextWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

void __93__SBTodayWidgetXCodeDebuggingUtility__reallyLaunchTodayViewFromCurrentContextWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = +[SBIconController sharedInstance];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __93__SBTodayWidgetXCodeDebuggingUtility__reallyLaunchTodayViewFromCurrentContextWithCompletion___block_invoke_4;
  v3[3] = &unk_1E6AF5300;
  id v4 = *(id *)(a1 + 32);
  [v2 activateTodayViewWithCompletion:v3];
}

uint64_t __93__SBTodayWidgetXCodeDebuggingUtility__reallyLaunchTodayViewFromCurrentContextWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyAggregator, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
}

@end