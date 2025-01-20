@interface SBStartupTransitionToSetup
- (SBStartupTransitionToSetup)initWithDestination:(unint64_t)a3 context:(id)a4;
- (SBStartupTransitionToSetup)initWithDestination:(unint64_t)a3 context:(id)a4 initialRestartState:(id)a5;
- (void)_activateSetupWithCompletion:(id)a3 underLock:(BOOL)a4 fromSnapshot:(BOOL)a5;
- (void)performTransitionWithCompletionBlock:(id)a3;
@end

@implementation SBStartupTransitionToSetup

- (SBStartupTransitionToSetup)initWithDestination:(unint64_t)a3 context:(id)a4 initialRestartState:(id)a5
{
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SBStartupTransitionToSetup;
  v10 = [(SBBaseStartupTransition *)&v22 initWithDestination:a3 context:a4];
  if (v10)
  {
    uint64_t v11 = [(id)SBApp bannerManager];
    bannerManager = v10->_bannerManager;
    v10->_bannerManager = (SBBannerManager *)v11;

    uint64_t v13 = +[SBLockScreenManager sharedInstance];
    lockScreenManager = v10->_lockScreenManager;
    v10->_lockScreenManager = (SBLockScreenManager *)v13;

    uint64_t v15 = [(id)SBApp authenticationController];
    authController = v10->_authController;
    v10->_authController = (SBFUserAuthenticationController *)v15;

    uint64_t v17 = +[SBApplicationController sharedInstance];
    appController = v10->_appController;
    v10->_appController = (SBApplicationController *)v17;

    uint64_t v19 = +[SBSetupManager sharedInstance];
    setupManager = v10->_setupManager;
    v10->_setupManager = (SBSetupManager *)v19;

    objc_storeStrong((id *)&v10->_initialRestartState, a5);
  }

  return v10;
}

- (SBStartupTransitionToSetup)initWithDestination:(unint64_t)a3 context:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"SBStartupTransitionToSetup.m" lineNumber:55 description:@"use initWithDestination:context:initialRestartState:"];

  return 0;
}

- (void)performTransitionWithCompletionBlock:(id)a3
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    objc_super v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SBStartupTransitionToSetup.m", 63, @"Invalid parameter not satisfying: %@", @"completionBlock" object file lineNumber description];
  }
  v6 = [(SBBaseStartupTransition *)self context];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v7 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 != 1)
  {
LABEL_7:
    [(id)SBApp updateNativeOrientationWithOrientation:1 updateMirroredDisplays:1 animated:0 logMessage:@"Setting orientation to Portrait for boot to Setup."];
    [(SBSetupManager *)self->_setupManager setDeferringDeviceOrientationUpdates:1];
  }
LABEL_8:
  id v9 = [v6 overlay];

  [(SBBannerManager *)self->_bannerManager setSuspended:1 forReason:@"com.apple.purplebuddy"];
  char v10 = [v6 isLogin];
  BOOL v11 = [(SBInitialRestartState *)self->_initialRestartState hasPasscodeSet];
  int v12 = [v6 fromUserPowerDown];
  uint64_t v13 = [MEMORY[0x1E4F78A20] sharedInstance];
  id v26 = 0;
  int v14 = [v13 needOwnershipWarning:&v26];
  id v15 = v26;

  if ((v10 & 1) != 0 || v9 || ((v11 | v12 ^ 1 | v14) & 1) == 0)
  {
    [(SBStartupTransitionToSetup *)self _activateSetupWithCompletion:v5 underLock:0 fromSnapshot:v9 != 0];
  }
  else
  {
    v16 = SBLogWorkspace();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_INFO, "Passcode locking if necessary, because we're transitioning at boot to Setup.", buf, 2u);
    }

    [(SBFUserAuthenticationController *)self->_authController revokeAuthenticationImmediatelyIfNecessaryForPublicReason:@"StartupTransitionToSetup"];
    lockScreenManager = self->_lockScreenManager;
    v27[0] = @"SBUILockOptionsLockAutomaticallyKey";
    v18 = [NSNumber numberWithBool:1];
    v28[0] = v18;
    v27[1] = @"SBUILockOptionsUseScreenOffModeKey";
    uint64_t v19 = [NSNumber numberWithBool:0];
    v28[1] = v19;
    v27[2] = @"SBUILockOptionsForceLockKey";
    v20 = [NSNumber numberWithBool:1];
    v28[2] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __67__SBStartupTransitionToSetup_performTransitionWithCompletionBlock___block_invoke;
    v23[3] = &unk_1E6AF5AA0;
    v23[4] = self;
    id v24 = v5;
    [(SBLockScreenManager *)lockScreenManager lockUIFromSource:16 withOptions:v21 completion:v23];
  }
}

uint64_t __67__SBStartupTransitionToSetup_performTransitionWithCompletionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateSetupWithCompletion:*(void *)(a1 + 40) underLock:1 fromSnapshot:0];
}

- (void)_activateSetupWithCompletion:(id)a3 underLock:(BOOL)a4 fromSnapshot:(BOOL)a5
{
  id v9 = a3;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBStartupTransitionToSetup.m", 107, @"Invalid parameter not satisfying: %@", @"completionBlock" object file lineNumber description];
  }
  char v10 = [(SBBaseStartupTransition *)self context];
  char v11 = [v10 isLogin];
  int v12 = [(SBApplicationController *)self->_appController setupApplication];
  uint64_t v13 = [(SBBaseStartupTransition *)self mainWorkspace];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82__SBStartupTransitionToSetup__activateSetupWithCompletion_underLock_fromSnapshot___block_invoke;
  v18[3] = &unk_1E6B0E8E0;
  BOOL v22 = a4;
  char v23 = v11;
  id v19 = v12;
  id v20 = v10;
  BOOL v24 = a5;
  id v21 = v9;
  id v14 = v9;
  id v15 = v10;
  id v16 = v12;
  [v13 requestTransitionWithOptions:0 builder:v18 validator:&__block_literal_global_415];
}

void __82__SBStartupTransitionToSetup__activateSetupWithCompletion_underLock_fromSnapshot___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:31];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__SBStartupTransitionToSetup__activateSetupWithCompletion_underLock_fromSnapshot___block_invoke_2;
  v9[3] = &unk_1E6AF5C08;
  id v10 = *(id *)(a1 + 32);
  char v11 = *(unsigned char *)(a1 + 56);
  [v3 modifyApplicationContext:v9];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __82__SBStartupTransitionToSetup__activateSetupWithCompletion_underLock_fromSnapshot___block_invoke_3;
  v4[3] = &unk_1E6B0E8B8;
  char v7 = *(unsigned char *)(a1 + 57);
  id v5 = *(id *)(a1 + 40);
  char v8 = *(unsigned char *)(a1 + 58);
  id v6 = *(id *)(a1 + 48);
  [v3 setTransactionConfigurator:v4];
}

void __82__SBStartupTransitionToSetup__activateSetupWithCompletion_underLock_fromSnapshot___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:*(void *)(a1 + 32)];
  if (*(unsigned char *)(a1 + 40))
  {
    [(SBWorkspaceEntity *)v5 setFlag:1 forActivationSetting:60];
    [(SBWorkspaceEntity *)v5 setFlag:1 forActivationSetting:1];
  }
  objc_msgSend(v3, "setInterfaceOrientation:", objc_msgSend((id)SBApp, "startupInterfaceOrientation"));
  [v3 setEntity:v5 forLayoutRole:1];
  v4 = +[SBWorkspaceEntity entity];
  [v3 setEntity:v4 forLayoutRole:2];
}

void __82__SBStartupTransitionToSetup__activateSetupWithCompletion_underLock_fromSnapshot___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    v4 = [SBUIStartupToUserSetupAppZoomInAnimationController alloc];
    id v5 = [v3 transitionRequest];
    id v6 = [*(id *)(a1 + 32) overlay];
    char v7 = [(SBUIStartupToUserSetupAppZoomInAnimationController *)v4 initWithTransitionContextProvider:v5 overlay:v6];
  }
  else
  {
    if (!*(unsigned char *)(a1 + 49))
    {
      char v7 = 0;
      goto LABEL_6;
    }
    char v8 = [SBUIStartupFromOverlayAnimationController alloc];
    id v9 = [v3 transitionRequest];
    id v10 = [*(id *)(a1 + 32) overlay];
    id v5 = [(SBUIStartupFromOverlayAnimationController *)v8 initWithTransitionContextProvider:v9 overlay:v10];

    [(SBUIStartupFromOverlayAnimationController *)v5 setWaitsForAppActivation:1];
    [(SBUIStartupFromOverlayAnimationController *)v5 setAnimationSettings:0];
    char v7 = 0;
  }

LABEL_6:
  [v3 setSuggestedAnimationController:v7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__SBStartupTransitionToSetup__activateSetupWithCompletion_underLock_fromSnapshot___block_invoke_4;
  v11[3] = &unk_1E6AF5A50;
  id v12 = *(id *)(a1 + 40);
  [v3 setCompletionBlock:v11];
}

uint64_t __82__SBStartupTransitionToSetup__activateSetupWithCompletion_underLock_fromSnapshot___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__SBStartupTransitionToSetup__activateSetupWithCompletion_underLock_fromSnapshot___block_invoke_5()
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialRestartState, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_setupManager, 0);
  objc_storeStrong((id *)&self->_appController, 0);
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_bannerManager, 0);
}

@end