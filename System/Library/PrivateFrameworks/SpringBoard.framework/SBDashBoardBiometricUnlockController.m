@interface SBDashBoardBiometricUnlockController
- (BOOL)biometricUnlockBehavior:(id)a3 requestsFeedback:(id)a4;
- (BOOL)biometricUnlockBehavior:(id)a3 requestsUnlock:(id)a4 withFeedback:(id)a5;
- (BOOL)handleEvent:(id)a3;
- (BOOL)hasVisibleContentToReveal;
- (BOOL)isLockScreenShowingDefaultContent;
- (BOOL)isRestToOpenAvailable;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (NSString)coverSheetIdentifier;
- (SBBiometricUnlockBehaviorDelegate)biometricUnlockBehaviorDelegate;
- (SBDashBoardBiometricUnlockController)initWithCoverSheetViewController:(id)a3;
- (id)_mesaUnlockBehavior;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)lockScreenWakeSource;
- (int64_t)participantState;
- (void)biometricUnlockBehaviorConfigurationDidChange:(id)a3;
- (void)dealloc;
- (void)fillRestToOpenWithDuration:(double)a3;
- (void)handleBiometricEvent:(unint64_t)a3;
- (void)noteLockButtonDown;
- (void)noteMenuButtonDown;
- (void)noteMenuButtonUp;
- (void)resetRestToOpen;
- (void)setAuthenticated:(BOOL)a3;
- (void)setBiometricUnlockBehaviorDelegate:(id)a3;
- (void)startRestToOpenCoachingWithCompletion:(id)a3;
@end

@implementation SBDashBoardBiometricUnlockController

- (SBDashBoardBiometricUnlockController)initWithCoverSheetViewController:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBDashBoardBiometricUnlockController;
  v6 = [(SBDashBoardBiometricUnlockController *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coverSheetViewController, a3);
    [(CSCoverSheetViewController *)v7->_coverSheetViewController registerExternalEventHandler:v7];
    v8 = [SBDashBoardMesaUnlockBehaviorConfiguration alloc];
    v9 = +[SBLiftToWakeController sharedController];
    v10 = [MEMORY[0x1E4FA7C68] sharedInstance];
    v11 = [MEMORY[0x1E4F5E408] rootSettings];
    uint64_t v12 = [(SBDashBoardMesaUnlockBehaviorConfiguration *)v8 initWithLiftToWakeController:v9 biometricResource:v10 lockScreenPrototypeSettings:v11];
    biometricUnlockBehaviorConfiguration = v7->_biometricUnlockBehaviorConfiguration;
    v7->_biometricUnlockBehaviorConfiguration = (SBBiometricUnlockBehaviorConfiguration *)v12;

    [(SBBiometricUnlockBehaviorConfiguration *)v7->_biometricUnlockBehaviorConfiguration setDelegate:v7];
    [(SBDashBoardBiometricUnlockController *)v7 biometricUnlockBehaviorConfigurationDidChange:v7->_biometricUnlockBehaviorConfiguration];
  }

  return v7;
}

- (void)dealloc
{
  [(CSCoverSheetViewController *)self->_coverSheetViewController unregisterExternalEventHandler:self];
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardBiometricUnlockController;
  [(SBDashBoardBiometricUnlockController *)&v3 dealloc];
}

- (void)noteMenuButtonDown
{
  id v2 = [(SBDashBoardBiometricUnlockController *)self _mesaUnlockBehavior];
  [v2 menuButtonDown];
}

- (void)noteMenuButtonUp
{
  id v2 = [(SBDashBoardBiometricUnlockController *)self _mesaUnlockBehavior];
  [v2 menuButtonUp];
}

- (void)setAuthenticated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBDashBoardBiometricUnlockController *)self _mesaUnlockBehavior];
  [v4 setAuthenticated:v3];
}

- (void)noteLockButtonDown
{
  id v2 = [(SBDashBoardBiometricUnlockController *)self _mesaUnlockBehavior];
  [v2 lockButtonDown];
}

- (id)_mesaUnlockBehavior
{
  biometricUnlockBehavior = self->_biometricUnlockBehavior;
  uint64_t v3 = objc_opt_class();
  id v4 = biometricUnlockBehavior;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (id)succinctDescription
{
  id v2 = [(SBDashBoardBiometricUnlockController *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBDashBoardBiometricUnlockController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBDashBoardBiometricUnlockController *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_biometricUnlockBehavior withName:@"biometricUnlockBehavior"];
  id v6 = (id)[v4 appendObject:self->_biometricUnlockBehaviorConfiguration withName:@"biometricUnlockBehaviorConfiguration"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_biometricUnlockBehaviorDelegate);
  id v8 = (id)[v4 appendObject:WeakRetained withName:@"biometricUnlockBehaviorDelegate"];

  id v9 = (id)[v4 appendObject:self->_coverSheetViewController withName:@"coverSheetViewController"];
  return v4;
}

- (void)handleBiometricEvent:(unint64_t)a3
{
}

- (BOOL)biometricUnlockBehavior:(id)a3 requestsFeedback:(id)a4
{
  id v5 = a4;
  id v6 = [(SBDashBoardBiometricUnlockController *)self biometricUnlockBehaviorDelegate];
  int v7 = [v6 biometricUnlockBehavior:self requestsFeedback:v5];

  if (v7)
  {
    if ([v5 hintFailureText]) {
      [(CSCoverSheetViewController *)self->_coverSheetViewController updateCallToActionForMesaMatchFailure];
    }
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"SBBiometricEventTimestampNotificationTryAgain" object:0];
  }
  return v7;
}

- (BOOL)biometricUnlockBehavior:(id)a3 requestsUnlock:(id)a4 withFeedback:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SBDashBoardBiometricUnlockController *)self biometricUnlockBehaviorDelegate];
  LOBYTE(self) = [v9 biometricUnlockBehavior:self requestsUnlock:v8 withFeedback:v7];

  return (char)self;
}

- (NSString)coverSheetIdentifier
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  uint64_t v4 = [a3 type];
  switch(v4)
  {
    case 21:
      id v5 = [(SBDashBoardBiometricUnlockController *)self _mesaUnlockBehavior];
      [v5 significantUserInteractionDidOccur];
      goto LABEL_7;
    case 25:
      id v5 = [(SBDashBoardBiometricUnlockController *)self _mesaUnlockBehavior];
      [v5 screenOff];
      goto LABEL_7;
    case 24:
      id v5 = [(SBDashBoardBiometricUnlockController *)self _mesaUnlockBehavior];
      [v5 screenOn];
LABEL_7:

      break;
  }
  return 0;
}

- (void)biometricUnlockBehaviorConfigurationDidChange:(id)a3
{
  biometricUnlockBehavior = self->_biometricUnlockBehavior;
  id v5 = a3;
  [(SBBiometricUnlockBehavior *)biometricUnlockBehavior setBiometricUnlockBehaviorDelegate:0];
  id v6 = (SBBiometricUnlockBehavior *)[v5 newBehaviorForCurrentConfiguration];

  id v7 = self->_biometricUnlockBehavior;
  self->_biometricUnlockBehavior = v6;

  id v8 = self->_biometricUnlockBehavior;
  [(SBBiometricUnlockBehavior *)v8 setBiometricUnlockBehaviorDelegate:self];
}

- (BOOL)isLockScreenShowingDefaultContent
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController isLockScreenShowingDefaultContent];
}

- (void)startRestToOpenCoachingWithCompletion:(id)a3
{
  id v4 = a3;
  coverSheetViewController = self->_coverSheetViewController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__SBDashBoardBiometricUnlockController_startRestToOpenCoachingWithCompletion___block_invoke;
  v7[3] = &unk_1E6AF5A50;
  id v8 = v4;
  id v6 = v4;
  [(CSCoverSheetViewController *)coverSheetViewController startRestToOpenCoachingWithCompletion:v7];
}

uint64_t __78__SBDashBoardBiometricUnlockController_startRestToOpenCoachingWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (int)lockScreenWakeSource
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController wakeSource];
}

- (void)fillRestToOpenWithDuration:(double)a3
{
}

- (void)resetRestToOpen
{
}

- (BOOL)isRestToOpenAvailable
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController isRestToOpenAvailable];
}

- (BOOL)hasVisibleContentToReveal
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController hasVisibleContentToReveal];
}

- (SBBiometricUnlockBehaviorDelegate)biometricUnlockBehaviorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_biometricUnlockBehaviorDelegate);
  return (SBBiometricUnlockBehaviorDelegate *)WeakRetained;
}

- (void)setBiometricUnlockBehaviorDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_biometricUnlockBehaviorDelegate);
  objc_storeStrong((id *)&self->_biometricUnlockBehavior, 0);
  objc_storeStrong((id *)&self->_biometricUnlockBehaviorConfiguration, 0);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
}

@end