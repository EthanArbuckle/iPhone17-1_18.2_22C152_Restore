@interface SBStartupTransitionToApp
- (void)performTransitionWithCompletionBlock:(id)a3;
@end

@implementation SBStartupTransitionToApp

- (void)performTransitionWithCompletionBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBStartupTransitionToApp.m", 29, @"Invalid parameter not satisfying: %@", @"completionBlock" object file lineNumber description];
  }
  v6 = [(SBBaseStartupTransition *)self context];
  v7 = [v6 applicationLaunchURL];
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBStartupTransitionToApp.m", 33, @"Invalid parameter not satisfying: %@", @"applicationLaunchURL" object file lineNumber description];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__SBStartupTransitionToApp_performTransitionWithCompletionBlock___block_invoke;
  v12[3] = &unk_1E6AF7128;
  id v13 = v6;
  id v14 = v5;
  id v8 = v5;
  id v9 = v6;
  SBWorkspaceActivateApplicationFromURL(v7, 0, v12);
}

void __65__SBStartupTransitionToApp_performTransitionWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:31];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__SBStartupTransitionToApp_performTransitionWithCompletionBlock___block_invoke_2;
  v7[3] = &unk_1E6AF57C0;
  id v8 = *(id *)(a1 + 32);
  [v3 modifyApplicationContext:v7];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__SBStartupTransitionToApp_performTransitionWithCompletionBlock___block_invoke_12;
  v4[3] = &unk_1E6B03B48;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 setTransactionConfigurator:v4];
}

void __65__SBStartupTransitionToApp_performTransitionWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 activatingEntity];
  id v5 = [v4 deviceApplicationSceneEntity];

  if (v5)
  {
    id v6 = [v5 sceneHandle];
    uint64_t v7 = [v6 activationInterfaceOrientationForOrientation:0];

    [v3 setInterfaceOrientation:v7];
  }
  id v8 = [v3 applicationSceneEntityForLayoutRole:1];
  id v9 = [v8 application];

  v10 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:v9];
  v11 = [*(id *)(a1 + 32) overlay];
  v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 interfaceOrientation];
    id v14 = [(SBApplicationSceneEntity *)v10 sceneHandle];
    uint64_t v15 = [v14 activationInterfaceOrientationForOrientation:v13];

    if (v13)
    {
      if (v15 == v13 && v13 == [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation])
      {
        [v3 setInterfaceOrientation:v13];
        v16 = SBLogWorkspace();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17[0] = 67109378;
          v17[1] = v13;
          __int16 v18 = 2112;
          v19 = v10;
          _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_INFO, "Setting interface orientation for app at launch to %d for %@", (uint8_t *)v17, 0x12u);
        }
      }
    }
  }
  [(SBWorkspaceEntity *)v10 setFlag:1 forActivationSetting:7];
  [v3 setEntity:v10 forLayoutRole:1];
}

void __65__SBStartupTransitionToApp_performTransitionWithCompletionBlock___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.5];
  id v5 = [*(id *)(a1 + 32) overlay];

  if (v5)
  {
    id v6 = [SBUIStartupFromOverlayAnimationController alloc];
    uint64_t v7 = [v3 transitionRequest];
    id v8 = [*(id *)(a1 + 32) overlay];
    id v9 = [(SBUIStartupFromOverlayAnimationController *)v6 initWithTransitionContextProvider:v7 overlay:v8];
  }
  else
  {
    v10 = [SBUIStartupFromBlackAnimationController alloc];
    uint64_t v7 = [v3 transitionRequest];
    id v9 = [(SBUIStartupFromBlackAnimationController *)v10 initWithTransitionContextProvider:v7];
  }

  [(SBUIStartupFromOverlayAnimationController *)v9 setWaitsForAppActivation:1];
  [(SBUIStartupFromOverlayAnimationController *)v9 setAnimationSettings:v4];
  [v3 setSuggestedAnimationController:v9];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__SBStartupTransitionToApp_performTransitionWithCompletionBlock___block_invoke_2_16;
  v11[3] = &unk_1E6AF5A50;
  id v12 = *(id *)(a1 + 40);
  [v3 setCompletionBlock:v11];
}

uint64_t __65__SBStartupTransitionToApp_performTransitionWithCompletionBlock___block_invoke_2_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end