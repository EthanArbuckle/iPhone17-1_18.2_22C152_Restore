@interface SBStartupTransitionToLockOut
- (SBLockScreenManager)lockScreenManager;
- (SBStartupTransitionToLockOut)initWithDestination:(unint64_t)a3 context:(id)a4;
- (id)suggestedLockAnimationForTransitionRequest:(id)a3;
- (void)performTransitionWithCompletionBlock:(id)a3;
@end

@implementation SBStartupTransitionToLockOut

- (SBStartupTransitionToLockOut)initWithDestination:(unint64_t)a3 context:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SBStartupTransitionToLockOut;
  v4 = [(SBBaseStartupTransition *)&v10 initWithDestination:a3 context:a4];
  if (v4)
  {
    uint64_t v5 = +[SBLockScreenManager sharedInstance];
    lockScreenManager = v4->_lockScreenManager;
    v4->_lockScreenManager = (SBLockScreenManager *)v5;

    uint64_t v7 = [(id)SBApp authenticationController];
    authController = v4->_authController;
    v4->_authController = (SBFUserAuthenticationController *)v7;
  }
  return v4;
}

- (id)suggestedLockAnimationForTransitionRequest:(id)a3
{
  return 0;
}

- (void)performTransitionWithCompletionBlock:(id)a3
{
  v24[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBStartupTransitionToLockOut.m", 48, @"Invalid parameter not satisfying: %@", @"completionBlock" object file lineNumber description];
  }
  v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Passcode locking if necessary, because we're transitioning at boot to the lockscreen .", buf, 2u);
  }

  [(SBFUserAuthenticationController *)self->_authController revokeAuthenticationImmediatelyIfNecessaryForPublicReason:@"StartupTransitionToLockOut"];
  uint64_t v7 = self;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __69__SBStartupTransitionToLockOut_performTransitionWithCompletionBlock___block_invoke;
  v20[3] = &unk_1E6B05468;
  v21 = v7;
  v8 = v7;
  v9 = (void *)MEMORY[0x1D948C7A0](v20);
  lockScreenManager = v8->_lockScreenManager;
  v23[0] = @"SBUILockOptionsLockAutomaticallyKey";
  v11 = [NSNumber numberWithBool:1];
  v24[0] = v11;
  v23[1] = @"SBUILockOptionsUseScreenOffModeKey";
  v12 = [NSNumber numberWithBool:0];
  v24[1] = v12;
  v23[2] = @"SBUILockOptionsForceLockKey";
  v13 = [NSNumber numberWithBool:1];
  v24[2] = v13;
  v23[3] = @"SBUILockOptionsAnimationTransactionProviderKey";
  v14 = (void *)MEMORY[0x1D948C7A0](v9);
  v24[3] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__SBStartupTransitionToLockOut_performTransitionWithCompletionBlock___block_invoke_2;
  v18[3] = &unk_1E6AF5A50;
  id v19 = v5;
  id v16 = v5;
  [(SBLockScreenManager *)lockScreenManager lockUIFromSource:16 withOptions:v15 completion:v18];
}

uint64_t __69__SBStartupTransitionToLockOut_performTransitionWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) suggestedLockAnimationForTransitionRequest:a2];
}

uint64_t __69__SBStartupTransitionToLockOut_performTransitionWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (SBLockScreenManager)lockScreenManager
{
  return self->_lockScreenManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
}

@end