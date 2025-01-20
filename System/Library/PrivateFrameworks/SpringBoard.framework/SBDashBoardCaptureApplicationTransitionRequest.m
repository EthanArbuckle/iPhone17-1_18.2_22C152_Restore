@interface SBDashBoardCaptureApplicationTransitionRequest
- (LCSCaptureApplicationDescribing)captureApplication;
- (NSSet)launchActions;
- (SBDashBoardCaptureApplicationTransitionRequest)initWithCaptureApplication:(id)a3;
- (SBDashBoardCaptureApplicationTransitionRequestDelegate)delegate;
- (id)_errorWithCode:(int64_t)a3 underlyingError:(id)a4;
- (id)completion;
- (void)_unlock;
- (void)initiate;
- (void)setCaptureApplication:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLaunchActions:(id)a3;
@end

@implementation SBDashBoardCaptureApplicationTransitionRequest

- (SBDashBoardCaptureApplicationTransitionRequest)initWithCaptureApplication:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardCaptureApplicationTransitionRequest;
  v6 = [(SBDashBoardCaptureApplicationTransitionRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_captureApplication, a3);
  }

  return v7;
}

- (void)initiate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  v3 = SBLogDashBoard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(SBDashBoardCaptureApplicationTransitionRequest *)self captureApplication];
    id v5 = [v4 bundleIdentifier];
    v6 = [(NSSet *)self->_launchActions debugDescription];
    int v8 = 138412546;
    objc_super v9 = v5;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Transition initiated for capture application (%@), launch actions: %@", (uint8_t *)&v8, 0x16u);
  }
  v7 = [(SBDashBoardCaptureApplicationTransitionRequest *)self delegate];
  [v7 captureApplicationTransitionRequestWillLaunchApplication:self];

  [(SBDashBoardCaptureApplicationTransitionRequest *)self _unlock];
}

- (id)_errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  id v5 = a4;
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  v7 = v6;
  if (v5) {
    [v6 setObject:v5 forKey:*MEMORY[0x1E4F28A50]];
  }
  int v8 = [MEMORY[0x1E4F28C58] errorWithDomain:SBCaptureApplicationTransitionErrorDomain code:a3 userInfo:v7];

  return v8;
}

- (void)_unlock
{
  BSDispatchQueueAssertMain();
  v3 = [(LCSCaptureApplicationDescribing *)self->_captureApplication bundleIdentifier];
  v4 = objc_alloc_init(SBLockScreenUnlockAndLaunchCaptureApplicationRequest);
  [(SBLockScreenUnlockRequest *)v4 setSource:34];
  [(SBLockScreenUnlockRequest *)v4 setIntent:3];
  [(SBLockScreenUnlockRequest *)v4 setName:@"Capture Extension Request"];
  [(SBLockScreenUnlockRequest *)v4 setProcess:0];
  [(SBLockScreenUnlockRequest *)v4 setWantsBiometricPresentation:0];
  [(SBLockScreenUnlockRequest *)v4 setConfirmedNotInPocket:1];
  id v5 = (void *)[(NSSet *)self->_launchActions copy];
  [(SBLockScreenUnlockAndLaunchCaptureApplicationRequest *)v4 setLaunchActions:v5];

  v6 = +[SBApplicationController sharedInstanceIfExists];
  v7 = [v6 applicationWithBundleIdentifier:v3];

  [(SBLockScreenUnlockRequest *)v4 setDestinationApplication:v7];
  int v8 = +[SBLockScreenManager sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__SBDashBoardCaptureApplicationTransitionRequest__unlock__block_invoke;
  v9[3] = &unk_1E6AF5350;
  v9[4] = self;
  [v8 unlockWithRequest:v4 completion:v9];
}

void __57__SBDashBoardCaptureApplicationTransitionRequest__unlock__block_invoke(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = SBLogDashBoard();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [*(id *)(*(void *)(a1 + 32) + 8) extension];
      v7 = [v6 bundleIdentifier];
      int v8 = [*(id *)(*(void *)(a1 + 32) + 8) bundleIdentifier];
      int v15 = 138543618;
      v16 = v7;
      __int16 v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Transtioning from capture extension [%{public}@] to application [%{public}@] succeeded.", (uint8_t *)&v15, 0x16u);
    }
    objc_super v9 = 0;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __57__SBDashBoardCaptureApplicationTransitionRequest__unlock__block_invoke_cold_1(a1, v5);
    }

    objc_super v9 = FBSOpenApplicationErrorCreate();
    __int16 v10 = +[SBCaptureApplicationCenter sharedInstance];
    v11 = [*(id *)(*(void *)(a1 + 32) + 8) bundleIdentifier];
    [v10 suspendCaptureApplication:v11];

    if (v9)
    {
      uint64_t v12 = [*(id *)(a1 + 32) _errorWithCode:2 underlyingError:v9];
      goto LABEL_10;
    }
  }
  uint64_t v12 = 0;
LABEL_10:
  v13 = [*(id *)(a1 + 32) delegate];
  [v13 captureApplicationTransitionRequest:*(void *)(a1 + 32) didCompleteWithError:v12];

  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v14) {
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v9);
  }
}

- (LCSCaptureApplicationDescribing)captureApplication
{
  return self->_captureApplication;
}

- (void)setCaptureApplication:(id)a3
{
}

- (NSSet)launchActions
{
  return self->_launchActions;
}

- (void)setLaunchActions:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (SBDashBoardCaptureApplicationTransitionRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBDashBoardCaptureApplicationTransitionRequestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_launchActions, 0);
  objc_storeStrong((id *)&self->_captureApplication, 0);
}

void __57__SBDashBoardCaptureApplicationTransitionRequest__unlock__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = [*(id *)(*(void *)(a1 + 32) + 8) extension];
  id v5 = [v4 bundleIdentifier];
  v6 = [*(id *)(*(void *)(a1 + 32) + 8) bundleIdentifier];
  int v7 = 138543618;
  int v8 = v5;
  __int16 v9 = 2114;
  __int16 v10 = v6;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Transtioning from capture extension [%{public}@] to application [%{public}@] failed.", (uint8_t *)&v7, 0x16u);
}

@end