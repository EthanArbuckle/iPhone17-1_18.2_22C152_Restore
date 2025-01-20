@interface SBActivateAppUnderLockScreenWorkspaceTransaction
- (BOOL)shouldPerformToAppStateCleanupOnCompletion;
- (BOOL)shouldPlaceOutgoingScenesUnderLockOnCompletion;
- (SBActivateAppUnderLockScreenWorkspaceTransaction)initWithTransitionRequest:(id)a3 lockScreenEnvironment:(id)a4;
- (void)_activateLockScreen;
- (void)_begin;
- (void)_didComplete;
- (void)_setupAndActivate;
- (void)dealloc;
@end

@implementation SBActivateAppUnderLockScreenWorkspaceTransaction

- (SBActivateAppUnderLockScreenWorkspaceTransaction)initWithTransitionRequest:(id)a3 lockScreenEnvironment:(id)a4
{
  id v8 = a4;
  id v9 = a3;
  v10 = [v9 applicationContext];
  [v10 setAnimationDisabled:1];
  v14.receiver = self;
  v14.super_class = (Class)SBActivateAppUnderLockScreenWorkspaceTransaction;
  v11 = [(SBToAppsWorkspaceTransaction *)&v14 initWithTransitionRequest:v9];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_lockScreenEnvironment, a4);
    if (!v11->_lockScreenEnvironment)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:v11 file:@"SBActivateAppUnderLockScreenWorkspaceTransaction.m" lineNumber:34 description:@"Must have a lock screen controller provided."];
    }
  }

  return v11;
}

- (void)dealloc
{
  [(SBDisableActiveInterfaceOrientationChangeAssertion *)self->_disableActiveOrientationChangeAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBActivateAppUnderLockScreenWorkspaceTransaction;
  [(SBToAppsWorkspaceTransaction *)&v3 dealloc];
}

- (BOOL)shouldPerformToAppStateCleanupOnCompletion
{
  return 0;
}

- (BOOL)shouldPlaceOutgoingScenesUnderLockOnCompletion
{
  return 1;
}

- (void)_begin
{
  [(SBActivateAppUnderLockScreenWorkspaceTransaction *)self _activateLockScreen];
  v3.receiver = self;
  v3.super_class = (Class)SBActivateAppUnderLockScreenWorkspaceTransaction;
  [(SBActivateAppUnderLockScreenWorkspaceTransaction *)&v3 _begin];
}

- (void)_activateLockScreen
{
  objc_super v3 = +[SBLockScreenManager sharedInstance];
  if ([v3 isUILocked])
  {
    [(SBActivateAppUnderLockScreenWorkspaceTransaction *)self _lockScreenDidActivate];
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __71__SBActivateAppUnderLockScreenWorkspaceTransaction__activateLockScreen__block_invoke;
    v4[3] = &unk_1E6AF5350;
    v4[4] = self;
    [v3 lockUIFromSource:0 withOptions:0 completion:v4];
  }
}

uint64_t __71__SBActivateAppUnderLockScreenWorkspaceTransaction__activateLockScreen__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _lockScreenDidActivate];
}

- (void)_setupAndActivate
{
  objc_super v3 = [[SBDisableActiveInterfaceOrientationChangeAssertion alloc] initWithReason:@"LaunchUnderLock" nudgeOrientationOnInvalidate:1];
  disableActiveOrientationChangeAssertion = self->_disableActiveOrientationChangeAssertion;
  self->_disableActiveOrientationChangeAssertion = v3;

  [(SBToAppsWorkspaceTransaction *)self activateApplications];
}

- (void)_didComplete
{
  v4.receiver = self;
  v4.super_class = (Class)SBActivateAppUnderLockScreenWorkspaceTransaction;
  [(SBToAppsWorkspaceTransaction *)&v4 _didComplete];
  [(SBDisableActiveInterfaceOrientationChangeAssertion *)self->_disableActiveOrientationChangeAssertion invalidate];
  disableActiveOrientationChangeAssertion = self->_disableActiveOrientationChangeAssertion;
  self->_disableActiveOrientationChangeAssertion = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableActiveOrientationChangeAssertion, 0);
  objc_storeStrong((id *)&self->_lockScreenEnvironment, 0);
}

@end