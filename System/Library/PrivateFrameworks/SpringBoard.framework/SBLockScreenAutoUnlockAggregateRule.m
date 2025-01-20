@interface SBLockScreenAutoUnlockAggregateRule
- (BOOL)shouldAutoUnlockForSource:(int)a3;
- (SBFUserAuthenticationController)userAuthenticationController;
- (SBLockScreenAutoUnlockAggregateRule)initWithUserAuthenticationController:(id)a3;
- (SBSyncController)_syncController;
- (id)_initWithUserAuthenticationController:(id)a3 syncController:(id)a4;
- (void)_setSyncController:(id)a3;
@end

@implementation SBLockScreenAutoUnlockAggregateRule

- (SBLockScreenAutoUnlockAggregateRule)initWithUserAuthenticationController:(id)a3
{
  id v4 = a3;
  v5 = +[SBSyncController sharedInstance];
  v6 = [(SBLockScreenAutoUnlockAggregateRule *)self _initWithUserAuthenticationController:v4 syncController:v5];

  return v6;
}

- (id)_initWithUserAuthenticationController:(id)a3 syncController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBLockScreenAutoUnlockAggregateRule;
  v9 = [(SBAutoUnlockComposableRule *)&v12 init];
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userAuthenticationController, a3);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

- (BOOL)shouldAutoUnlockForSource:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [(SBFUserAuthenticationController *)self->_userAuthenticationController isAuthenticated];
  if (v5)
  {
    v6 = [(SBLockScreenAutoUnlockAggregateRule *)self _syncController];
    char v7 = [v6 isInUse];

    if (v7)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)SBLockScreenAutoUnlockAggregateRule;
      LOBYTE(v5) = [(SBAutoUnlockComposableRule *)&v9 shouldAutoUnlockForSource:v3];
    }
  }
  return v5;
}

- (SBFUserAuthenticationController)userAuthenticationController
{
  return self->_userAuthenticationController;
}

- (SBSyncController)_syncController
{
  return self->_syncController;
}

- (void)_setSyncController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_storeStrong((id *)&self->_userAuthenticationController, 0);
}

@end