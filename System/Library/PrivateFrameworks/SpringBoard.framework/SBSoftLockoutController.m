@interface SBSoftLockoutController
- (BOOL)isLocked;
- (BOOL)showPasscode;
- (BOOL)unlockFromSource:(int)a3;
- (NSString)coverSheetIdentifier;
- (SBSoftLockoutController)initWithBiometricLockoutState:(unint64_t)a3;
- (SBSoftLockoutController)initWithBiometricLockoutState:(unint64_t)a3 lockScreenManager:(id)a4;
- (SBSoftLockoutControllerDelegate)delegate;
- (int64_t)participantState;
- (void)_clearPasscodeRequiredAssertion;
- (void)_createPasscodeRequiredAssertion;
- (void)dealloc;
- (void)reload;
- (void)setDelegate:(id)a3;
@end

@implementation SBSoftLockoutController

- (SBSoftLockoutController)initWithBiometricLockoutState:(unint64_t)a3
{
  v5 = +[SBLockScreenManager sharedInstance];
  v6 = [(SBSoftLockoutController *)self initWithBiometricLockoutState:a3 lockScreenManager:v5];

  return v6;
}

- (SBSoftLockoutController)initWithBiometricLockoutState:(unint64_t)a3 lockScreenManager:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBSoftLockoutController;
  v8 = [(SBSoftLockoutController *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lockScreenManager, a4);
    v9->_desiredBiometricLockoutState = a3;
    v10 = [(SBLockScreenManager *)v9->_lockScreenManager coverSheetViewController];
    [v10 registerExternalLockProvider:v9];
    [v10 addCoverSheetObserver:v9];
  }
  return v9;
}

- (void)dealloc
{
  v3 = [(SBLockScreenManager *)self->_lockScreenManager coverSheetViewController];
  [v3 removeCoverSheetObserver:self];
  [v3 unregisterExternalLockProvider:self];
  [(SBSoftLockoutController *)self _clearPasscodeRequiredAssertion];

  v4.receiver = self;
  v4.super_class = (Class)SBSoftLockoutController;
  [(SBSoftLockoutController *)&v4 dealloc];
}

- (void)reload
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = [WeakRetained requiresLockout];

  if ((v4 & 1) == 0)
  {
    [(SBSoftLockoutController *)self _clearPasscodeRequiredAssertion];
  }
}

- (BOOL)isLocked
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v3 = [WeakRetained requiresLockout];

  return v3;
}

- (BOOL)showPasscode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v3 = [WeakRetained requiresLockout];

  return v3;
}

- (BOOL)unlockFromSource:(int)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([WeakRetained consumePendingUnlock] & 1) != 0
    || ![WeakRetained requiresLockout])
  {
    BOOL v5 = 1;
  }
  else
  {
    [(SBSoftLockoutController *)self _createPasscodeRequiredAssertion];
    [(SBLockScreenManager *)self->_lockScreenManager setPasscodeVisible:1 animated:1];
    BOOL v5 = 0;
  }

  return v5;
}

- (NSString)coverSheetIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (void)_createPasscodeRequiredAssertion
{
  if (!self->_passcodeRequiredAssertion)
  {
    id v8 = [MEMORY[0x1E4FA7C68] sharedInstance];
    unint64_t desiredBiometricLockoutState = self->_desiredBiometricLockoutState;
    char v4 = (objc_class *)objc_opt_class();
    BOOL v5 = NSStringFromClass(v4);
    v6 = [v8 acquireSimulatedLockoutAssertionWithLockoutState:desiredBiometricLockoutState forReason:v5];
    passcodeRequiredAssertion = self->_passcodeRequiredAssertion;
    self->_passcodeRequiredAssertion = v6;
  }
}

- (void)_clearPasscodeRequiredAssertion
{
  passcodeRequiredAssertion = self->_passcodeRequiredAssertion;
  if (passcodeRequiredAssertion)
  {
    [(BSInvalidatable *)passcodeRequiredAssertion invalidate];
    char v4 = self->_passcodeRequiredAssertion;
    self->_passcodeRequiredAssertion = 0;
  }
}

- (SBSoftLockoutControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSoftLockoutControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passcodeRequiredAssertion, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
}

@end