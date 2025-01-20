@interface SBSoftwareUpdatePasscodePolicyManager
- (BOOL)consumePendingUnlock;
- (BOOL)requiresLockout;
- (SBSoftwareUpdatePasscodePolicyManager)init;
- (SBSoftwareUpdatePasscodePolicyManager)initWithLockScreenManager:(id)a3 mobileKeyBag:(id)a4;
- (int64_t)_effectiveSoftwareUpdatePasscodePolicy;
- (int64_t)softwareUpdatePasscodePolicy;
- (void)_authRequestCompleted:(id)a3;
- (void)dealloc;
- (void)noteAuthenticationSucceededWithPasscode:(id)a3;
- (void)setSoftwareUpdatePasscodePolicy:(int64_t)a3;
@end

@implementation SBSoftwareUpdatePasscodePolicyManager

- (SBSoftwareUpdatePasscodePolicyManager)init
{
  v3 = +[SBLockScreenManager sharedInstance];
  v4 = [MEMORY[0x1E4FA5F80] sharedInstance];
  v5 = [(SBSoftwareUpdatePasscodePolicyManager *)self initWithLockScreenManager:v3 mobileKeyBag:v4];

  return v5;
}

- (SBSoftwareUpdatePasscodePolicyManager)initWithLockScreenManager:(id)a3 mobileKeyBag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBSoftwareUpdatePasscodePolicyManager;
  v8 = [(SBSoftwareUpdatePasscodePolicyManager *)&v13 init];
  if (v8)
  {
    v9 = [[SBSoftLockoutController alloc] initWithBiometricLockoutState:6 lockScreenManager:v6];
    softLockoutController = v8->_softLockoutController;
    v8->_softLockoutController = v9;

    [(SBSoftLockoutController *)v8->_softLockoutController setDelegate:v8];
    objc_storeStrong((id *)&v8->_mobileKeyBag, a4);
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v8 selector:sel__authRequestCompleted_ name:*MEMORY[0x1E4FA6128] object:0];
  }
  return v8;
}

- (void)dealloc
{
  [(SBSoftLockoutController *)self->_softLockoutController setDelegate:0];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FA6128] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBSoftwareUpdatePasscodePolicyManager;
  [(SBSoftwareUpdatePasscodePolicyManager *)&v4 dealloc];
}

- (int64_t)softwareUpdatePasscodePolicy
{
  return self->_softwareUpdatePasscodePolicy;
}

- (void)setSoftwareUpdatePasscodePolicy:(int64_t)a3
{
  if (self->_softwareUpdatePasscodePolicy != a3)
  {
    self->_softwareUpdatePasscodePolicy = a3;
    [(SBSoftLockoutController *)self->_softLockoutController reload];
    self->_passcodeAuthenticationSuccessPending = 0;
  }
}

- (void)noteAuthenticationSucceededWithPasscode:(id)a3
{
  id v4 = a3;
  if ([(SBSoftwareUpdatePasscodePolicyManager *)self _effectiveSoftwareUpdatePasscodePolicy])
  {
    SUSUICreateInstallationKeybagWithSecret();
    [(SBSoftwareUpdatePasscodePolicyManager *)self setSoftwareUpdatePasscodePolicy:0];
  }
}

- (BOOL)requiresLockout
{
  if ([(SBSoftwareUpdatePasscodePolicyManager *)self _effectiveSoftwareUpdatePasscodePolicy] == 2)
  {
    v2 = +[SBCoverSheetPresentationManager sharedInstance];
    int v3 = [v2 hasBeenDismissedSinceKeybagLock] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)consumePendingUnlock
{
  BOOL passcodeAuthenticationSuccessPending = self->_passcodeAuthenticationSuccessPending;
  self->_BOOL passcodeAuthenticationSuccessPending = 0;
  return passcodeAuthenticationSuccessPending;
}

- (int64_t)_effectiveSoftwareUpdatePasscodePolicy
{
  if (self->_softwareUpdatePasscodePolicy
    && [(SBFMobileKeyBag *)self->_mobileKeyBag hasPasscodeSet])
  {
    return self->_softwareUpdatePasscodePolicy;
  }
  else
  {
    return 0;
  }
}

- (void)_authRequestCompleted:(id)a3
{
  id v8 = [a3 userInfo];
  id v4 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FA6120]];
  uint64_t v5 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FA6130]];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7
    && [v4 integerValue] == 1
    && [v6 isEqualToString:*MEMORY[0x1E4FA6138]])
  {
    self->_BOOL passcodeAuthenticationSuccessPending = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileKeyBag, 0);
  objc_storeStrong((id *)&self->_softLockoutController, 0);
}

@end