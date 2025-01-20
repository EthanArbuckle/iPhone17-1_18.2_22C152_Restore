@interface SBNonInteractiveDisplayModeResolver
- (BOOL)isWindowingModeAvailable;
- (FBSDisplayIdentity)rootDisplayIdentity;
- (SBDisplayWindowingModeResolverDelegate)delegate;
- (SBNonInteractiveDisplayModeResolver)initWithRootDisplay:(id)a3 applicationController:(id)a4 userAuthenticationProvider:(id)a5 monitoredWindowScene:(id)a6;
- (int64_t)displayWindowingMode;
- (void)_appProcessStateDidChange:(id)a3;
- (void)_authenicationStateDidChange:(id)a3;
- (void)_evaluateAndNotifyOfStateChanges;
- (void)setDelegate:(id)a3;
@end

@implementation SBNonInteractiveDisplayModeResolver

- (SBNonInteractiveDisplayModeResolver)initWithRootDisplay:(id)a3 applicationController:(id)a4 userAuthenticationProvider:(id)a5 monitoredWindowScene:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if ([v12 isRootIdentity])
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SBNonInteractiveDisplayModeResolver.m", 46, @"Invalid parameter not satisfying: %@", @"[rootDisplayIdentity isRootIdentity]" object file lineNumber description];

    if (v13)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
LABEL_14:
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"SBNonInteractiveDisplayModeResolver.m", 48, @"Invalid parameter not satisfying: %@", @"userAuthenticationProvider" object file lineNumber description];

      if (v15) {
        goto LABEL_5;
      }
      goto LABEL_15;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"SBNonInteractiveDisplayModeResolver.m", 47, @"Invalid parameter not satisfying: %@", @"applicationController" object file lineNumber description];

  if (!v14) {
    goto LABEL_14;
  }
LABEL_4:
  if (v15) {
    goto LABEL_5;
  }
LABEL_15:
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"SBNonInteractiveDisplayModeResolver.m", 49, @"Invalid parameter not satisfying: %@", @"monitoredWindowScene" object file lineNumber description];

LABEL_5:
  v24.receiver = self;
  v24.super_class = (Class)SBNonInteractiveDisplayModeResolver;
  v16 = [(SBNonInteractiveDisplayModeResolver *)&v24 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_rootDisplayIdentity, a3);
    objc_storeStrong((id *)&v17->_applicationController, a4);
    objc_storeStrong((id *)&v17->_userAuthenticationProvider, a5);
    objc_storeStrong((id *)&v17->_monitoredWindowScene, a6);
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    if ([(FBSDisplayIdentity *)v17->_rootDisplayIdentity _sb_requiresUserAuthenticationFirst])
    {
      [v18 addObserver:v17 selector:sel__authenicationStateDidChange_ name:*MEMORY[0x1E4FA6140] object:0];
    }
    if ([(FBSDisplayIdentity *)v17->_rootDisplayIdentity _sb_requiresAppRunningFirst]) {
      [v18 addObserver:v17 selector:sel__appProcessStateDidChange_ name:@"SBApplicationProcessStateDidChange" object:0];
    }
    [(SBNonInteractiveDisplayModeResolver *)v17 _evaluateAndNotifyOfStateChanges];
  }
  return v17;
}

- (FBSDisplayIdentity)rootDisplayIdentity
{
  return self->_rootDisplayIdentity;
}

- (int64_t)displayWindowingMode
{
  return 2;
}

- (BOOL)isWindowingModeAvailable
{
  return self->_nonInteractiveModeAvailableOnPhysicalDisplay;
}

- (void)_authenicationStateDidChange:(id)a3
{
  if ([(SBFAuthenticationStatusProvider *)self->_userAuthenticationProvider isAuthenticated])
  {
    [(SBNonInteractiveDisplayModeResolver *)self _evaluateAndNotifyOfStateChanges];
  }
}

- (void)_appProcessStateDidChange:(id)a3
{
  id v4 = a3;
  id v8 = [v4 object];
  v5 = [v8 processState];
  v6 = [v4 userInfo];

  v7 = [v6 objectForKey:@"previousProcessState"];

  LODWORD(v6) = [v5 isRunning];
  if (v6 != [v7 isRunning]) {
    [(SBNonInteractiveDisplayModeResolver *)self _evaluateAndNotifyOfStateChanges];
  }
}

- (void)_evaluateAndNotifyOfStateChanges
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_haveAuthenticatedOnce) {
    self->_haveAuthenticatedOnce = [(SBFAuthenticationStatusProvider *)self->_userAuthenticationProvider isAuthenticated];
  }
  rootDisplayIdentity = self->_rootDisplayIdentity;
  id v4 = [(SBWindowScene *)self->_monitoredWindowScene switcherController];
  BOOL v5 = [(FBSDisplayIdentity *)rootDisplayIdentity _sb_nonInteractiveAvailableWithSwitcher:v4 applicationController:self->_applicationController authenticationState:self->_haveAuthenticatedOnce];

  if (self->_nonInteractiveModeAvailableOnPhysicalDisplay != v5)
  {
    self->_nonInteractiveModeAvailableOnPhysicalDisplay = v5;
    v6 = SBLogDisplayControlling();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = _SBFLoggingMethodProem();
      id v8 = self->_rootDisplayIdentity;
      int v10 = 138543874;
      v11 = v7;
      __int16 v12 = 2114;
      id v13 = v8;
      __int16 v14 = 1024;
      BOOL v15 = v5;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ change in availability for root display: %{public}@; available: %{BOOL}u",
        (uint8_t *)&v10,
        0x1Cu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "resolver:rootDisplay:didUpdateAvailability:", self);
  }
}

- (SBDisplayWindowingModeResolverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBDisplayWindowingModeResolverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_monitoredWindowScene, 0);
  objc_storeStrong((id *)&self->_userAuthenticationProvider, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_rootDisplayIdentity, 0);
}

@end