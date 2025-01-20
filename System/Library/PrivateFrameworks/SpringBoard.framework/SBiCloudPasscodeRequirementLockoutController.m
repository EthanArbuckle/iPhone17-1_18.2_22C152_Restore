@interface SBiCloudPasscodeRequirementLockoutController
- (BOOL)_deviceHasComplexPasscode;
- (BOOL)desiresPasscode;
- (BOOL)requiresLockout;
- (SBiCloudPasscodeRequirementLockoutController)initWithLockScreenManager:(id)a3 mobileKeyBag:(id)a4;
- (void)dealloc;
- (void)noteAuthenticationSucceededWithPasscode:(id)a3;
@end

@implementation SBiCloudPasscodeRequirementLockoutController

- (SBiCloudPasscodeRequirementLockoutController)initWithLockScreenManager:(id)a3 mobileKeyBag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBiCloudPasscodeRequirementLockoutController;
  v8 = [(SBiCloudPasscodeRequirementLockoutController *)&v12 init];
  if (v8)
  {
    v9 = [[SBSoftLockoutController alloc] initWithBiometricLockoutState:7 lockScreenManager:v6];
    lockOutController = v8->_lockOutController;
    v8->_lockOutController = v9;

    [(SBSoftLockoutController *)v8->_lockOutController setDelegate:v8];
    objc_storeStrong((id *)&v8->_mobileKeybag, a4);
  }

  return v8;
}

- (void)dealloc
{
  [(SBSoftLockoutController *)self->_lockOutController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SBiCloudPasscodeRequirementLockoutController;
  [(SBiCloudPasscodeRequirementLockoutController *)&v3 dealloc];
}

- (BOOL)desiresPasscode
{
  return ([MEMORY[0x1E4F59AF0] needPasscodeForHSA2EscrowRecordUpdate:0] & 0xFFFFFFFE) == 2;
}

- (void)noteAuthenticationSucceededWithPasscode:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F59AF0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setPassphrase:v5];

  self->_providedPasscode = 1;
  BOOL v7 = [(SBiCloudPasscodeRequirementLockoutController *)self _deviceHasComplexPasscode];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__SBiCloudPasscodeRequirementLockoutController_noteAuthenticationSucceededWithPasscode___block_invoke;
  v8[3] = &unk_1E6AFC6D0;
  v8[4] = self;
  [v6 prepareHSA2EscrowRecordContents:v7 reply:v8];
}

void __88__SBiCloudPasscodeRequirementLockoutController_noteAuthenticationSucceededWithPasscode___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__SBiCloudPasscodeRequirementLockoutController_noteAuthenticationSucceededWithPasscode___block_invoke_2;
  block[3] = &unk_1E6AF4AC0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __88__SBiCloudPasscodeRequirementLockoutController_noteAuthenticationSucceededWithPasscode___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) reload];
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  return result;
}

- (BOOL)requiresLockout
{
  if (!self->_providedPasscode
    && [MEMORY[0x1E4F59AF0] needPasscodeForHSA2EscrowRecordUpdate:0] == 3
    && [(SBFMobileKeyBag *)self->_mobileKeybag hasPasscodeSet])
  {
    objc_super v3 = +[SBCoverSheetPresentationManager sharedInstance];
    int v4 = [v3 hasBeenDismissedSinceKeybagLock] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_deviceHasComplexPasscode
{
  return (SBUICurrentPasscodeStyleForUser() & 0xFFFFFFFE) == 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileKeybag, 0);
  objc_storeStrong((id *)&self->_lockOutController, 0);
}

@end