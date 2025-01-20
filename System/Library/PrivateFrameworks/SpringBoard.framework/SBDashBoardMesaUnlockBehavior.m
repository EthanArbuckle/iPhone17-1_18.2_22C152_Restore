@interface SBDashBoardMesaUnlockBehavior
- (CSLockScreenMesaSettings)_mesaSettings;
- (NSString)description;
- (SBBiometricUnlockBehaviorDelegate)biometricUnlockBehaviorDelegate;
- (SBDashBoardMesaUnlockBehavior)initWithMesaSettings:(id)a3 andUnlockTrigger:(id)a4;
- (SBHomeHardwareButton)_getHomeHardwareButton;
- (SBMesaUnlockTrigger)_trigger;
- (id)_failureSettingsForFailAttempt:(int64_t)a3;
- (id)_feedbackForBioUnlockEventThatWasSpontaneous:(BOOL)a3;
- (id)_feedbackForFailureSettings:(id)a3;
- (id)_feedbackForPasscodeEvent;
- (id)_homeHardwareButton;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_handleMesaFailure;
- (void)_setHomeHardwareButton:(id)a3;
- (void)_setTrigger:(id)a3;
- (void)handleBiometricEvent:(unint64_t)a3;
- (void)lockButtonDown;
- (void)menuButtonDown;
- (void)menuButtonUp;
- (void)mesaUnlockTriggerFired:(id)a3;
- (void)screenOff;
- (void)screenOn;
- (void)setAuthenticated:(BOOL)a3;
- (void)setBiometricUnlockBehaviorDelegate:(id)a3;
- (void)significantUserInteractionDidOccur;
@end

@implementation SBDashBoardMesaUnlockBehavior

- (SBDashBoardMesaUnlockBehavior)initWithMesaSettings:(id)a3 andUnlockTrigger:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBDashBoardMesaUnlockBehavior;
  v9 = [(SBDashBoardMesaUnlockBehavior *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mesaSettings, a3);
    objc_storeStrong((id *)&v10->_trigger, a4);
    [(SBMesaUnlockTrigger *)v10->_trigger setDelegate:v10];
  }

  return v10;
}

- (void)menuButtonDown
{
  id v2 = [(SBDashBoardMesaUnlockBehavior *)self _trigger];
  [v2 menuButtonDown];
}

- (void)menuButtonUp
{
  id v2 = [(SBDashBoardMesaUnlockBehavior *)self _trigger];
  [v2 menuButtonUp];
}

- (void)screenOn
{
  id v2 = [(SBDashBoardMesaUnlockBehavior *)self _trigger];
  [v2 screenOn];
}

- (void)screenOff
{
  v3 = [(SBDashBoardMesaUnlockBehavior *)self _trigger];
  [v3 screenOff];

  self->_failedMesaUnlockAttempts = 0;
}

- (void)significantUserInteractionDidOccur
{
  id v2 = [(SBDashBoardMesaUnlockBehavior *)self _trigger];
  [v2 significantUserInteractionOccurred];
}

- (void)lockButtonDown
{
  id v2 = [(SBDashBoardMesaUnlockBehavior *)self _trigger];
  [v2 lockButtonDown];
}

- (void)_setTrigger:(id)a3
{
  v5 = (SBMesaUnlockTrigger *)a3;
  trigger = self->_trigger;
  if (trigger != v5)
  {
    id v7 = v5;
    [(SBMesaUnlockTrigger *)trigger setDelegate:0];
    objc_storeStrong((id *)&self->_trigger, a3);
    [(SBMesaUnlockTrigger *)self->_trigger setDelegate:self];
    v5 = v7;
  }
}

- (id)_homeHardwareButton
{
  homeHardwareButton = self->_homeHardwareButton;
  if (homeHardwareButton)
  {
    v3 = homeHardwareButton;
  }
  else
  {
    v3 = [(id)SBApp homeHardwareButton];
  }
  return v3;
}

- (id)_feedbackForFailureSettings:(id)a3
{
  id v3 = a3;
  id v4 = [[SBAuthenticationFeedback alloc] initForFailureWithFailureSettings:v3];

  return v4;
}

- (id)_feedbackForPasscodeEvent
{
  id v2 = [[SBAuthenticationFeedback alloc] initForFailureShowingPasscode:1];
  return v2;
}

- (id)_feedbackForBioUnlockEventThatWasSpontaneous:(BOOL)a3
{
  if (a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [[SBAuthenticationFeedback alloc] initForSuccess];
  }
  return v5;
}

- (NSString)description
{
  return (NSString *)[(SBDashBoardMesaUnlockBehavior *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(SBDashBoardMesaUnlockBehavior *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBDashBoardMesaUnlockBehavior *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [(SBDashBoardMesaUnlockBehavior *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendInteger:self->_failedMesaUnlockAttempts withName:@"failedMesaUnlockAttempts"];
  id v6 = (id)[v4 appendObject:self->_trigger withName:@"trigger"];
  return v4;
}

- (void)handleBiometricEvent:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4FA7C68] sharedInstance];
  char v6 = [v5 hasEnrolledIdentities];

  WeakRetained = SBLogLockScreenMesaUnlockBehaviors();
  BOOL v8 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      v9 = NSStringFromSBUIBiometricEvent();
      *(_DWORD *)buf = 138543362;
      v25 = v9;
      _os_log_impl(&dword_1D85BA000, WeakRetained, OS_LOG_TYPE_INFO, "Base unlock behavior received biometric event: %{public}@", buf, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_biometricUnlockBehaviorDelegate);
    if (a3 <= 0x21 && ((1 << a3) & 0x2070009E0) != 0)
    {
      if ([(CSLockScreenMesaSettings *)self->_mesaSettings passcodeRequiredEventsCountAsFailures])
      {
        [(SBDashBoardMesaUnlockBehavior *)self _handleMesaFailure];
      }
      else
      {
        v11 = [(SBDashBoardMesaUnlockBehavior *)self _feedbackForPasscodeEvent];
        objc_super v12 = SBLogLockScreenMesaUnlockBehaviors();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v11;
          _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, "requesting feedback: %@", buf, 0xCu);
        }

        [WeakRetained biometricUnlockBehavior:self requestsFeedback:v11];
      }
      if ([(CSLockScreenMesaSettings *)self->_mesaSettings flashRedOnPasscodeRequiredEvents])
      {
        v10 = +[SBScreenFlash mainScreenFlasher];
        v13 = [MEMORY[0x1E4F428B8] redColor];
        [v10 flashColor:v13 withCompletion:0];

        goto LABEL_15;
      }
    }
    else
    {
      if (a3 - 9 <= 1)
      {
        [(SBDashBoardMesaUnlockBehavior *)self _handleMesaFailure];
        goto LABEL_16;
      }
      switch(a3)
      {
        case 0uLL:
          v10 = [(SBDashBoardMesaUnlockBehavior *)self _trigger];
          [v10 fingerOff];
          goto LABEL_15;
        case 1uLL:
          v10 = [(SBDashBoardMesaUnlockBehavior *)self _trigger];
          [v10 fingerOn];
          goto LABEL_15;
        case 4uLL:
          self->_failedMesaUnlockAttempts = 0;
          v14 = [(SBDashBoardMesaUnlockBehavior *)self _trigger];
          uint64_t v15 = [v14 bioUnlock];

          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __54__SBDashBoardMesaUnlockBehavior_handleBiometricEvent___block_invoke;
          v21[3] = &unk_1E6AFD0F0;
          v21[4] = self;
          char v23 = v15;
          WeakRetained = WeakRetained;
          v22 = WeakRetained;
          v16 = (void (**)(void, void))MEMORY[0x1D948C7A0](v21);
          if ([(CSLockScreenMesaSettings *)self->_mesaSettings successFeedbackWaitsUntilButtonUp])
          {
            v17 = [(SBDashBoardMesaUnlockBehavior *)self _homeHardwareButton];
            v18[0] = MEMORY[0x1E4F143A8];
            v18[1] = 3221225472;
            v18[2] = __54__SBDashBoardMesaUnlockBehavior_handleBiometricEvent___block_invoke_10;
            v18[3] = &unk_1E6AF7218;
            v19 = v16;
            char v20 = v15;
            [v17 performWhenMenuButtonIsUpUsingBlock:v18];
          }
          else
          {
            v16[2](v16, v15);
          }

          break;
      }
    }
  }
  else if (v8)
  {
    v10 = NSStringFromSBUIBiometricEvent();
    *(_DWORD *)buf = 138543362;
    v25 = v10;
    _os_log_impl(&dword_1D85BA000, WeakRetained, OS_LOG_TYPE_INFO, "Unlock behavior received biometric event but has no enrolled identities. Bailing. Event: %{public}@", buf, 0xCu);
LABEL_15:
  }
LABEL_16:
}

void __54__SBDashBoardMesaUnlockBehavior_handleBiometricEvent___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(SBLockScreenUnlockRequest);
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  [(SBLockScreenUnlockRequest *)v2 setName:v4];

  [(SBLockScreenUnlockRequest *)v2 setSource:23];
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  [(SBLockScreenUnlockRequest *)v2 setIntent:v5];
  char v6 = [*(id *)(a1 + 32) _feedbackForBioUnlockEventThatWasSpontaneous:0];
  id v7 = SBLogLockScreenMesaUnlockBehaviors();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109378;
    v8[1] = [(SBLockScreenUnlockRequest *)v2 intent];
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "requesting unlock with intent: %d and feedback: %@", (uint8_t *)v8, 0x12u);
  }

  [*(id *)(a1 + 40) biometricUnlockBehavior:*(void *)(a1 + 32) requestsUnlock:v2 withFeedback:v6];
}

uint64_t __54__SBDashBoardMesaUnlockBehavior_handleBiometricEvent___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)setAuthenticated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBDashBoardMesaUnlockBehavior *)self _trigger];
  [v4 setAuthenticated:v3];
}

- (void)mesaUnlockTriggerFired:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(SBLockScreenUnlockRequest);
  uint64_t v5 = (objc_class *)objc_opt_class();
  char v6 = NSStringFromClass(v5);
  [(SBLockScreenUnlockRequest *)v4 setName:v6];

  [(SBLockScreenUnlockRequest *)v4 setSource:23];
  [(SBLockScreenUnlockRequest *)v4 setIntent:3];
  id v7 = [(SBDashBoardMesaUnlockBehavior *)self _feedbackForBioUnlockEventThatWasSpontaneous:1];
  BOOL v8 = SBLogLockScreenMesaUnlockBehaviors();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109378;
    v10[1] = [(SBLockScreenUnlockRequest *)v4 intent];
    __int16 v11 = 2112;
    objc_super v12 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "trigger fired - requesting unlock with intent: %d and feedback: %@", (uint8_t *)v10, 0x12u);
  }

  __int16 v9 = [(SBDashBoardMesaUnlockBehavior *)self biometricUnlockBehaviorDelegate];
  [v9 biometricUnlockBehavior:self requestsUnlock:v4 withFeedback:v7];
}

- (void)_handleMesaFailure
{
  ++self->_failedMesaUnlockAttempts;
  BOOL v3 = -[SBDashBoardMesaUnlockBehavior _failureSettingsForFailAttempt:](self, "_failureSettingsForFailAttempt:");
  id v4 = [(SBDashBoardMesaUnlockBehavior *)self _feedbackForFailureSettings:v3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _DWORD v10[2] = __51__SBDashBoardMesaUnlockBehavior__handleMesaFailure__block_invoke;
  v10[3] = &unk_1E6AF5290;
  id v5 = v4;
  id v11 = v5;
  objc_super v12 = self;
  char v6 = (void (**)(void))MEMORY[0x1D948C7A0](v10);
  if ([v3 waitUntilButtonUp])
  {
    id v7 = [(SBDashBoardMesaUnlockBehavior *)self _homeHardwareButton];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    _DWORD v8[2] = __51__SBDashBoardMesaUnlockBehavior__handleMesaFailure__block_invoke_12;
    v8[3] = &unk_1E6AF5300;
    __int16 v9 = v6;
    [v7 performWhenMenuButtonIsUpUsingBlock:v8];
  }
  else
  {
    v6[2](v6);
  }
}

void __51__SBDashBoardMesaUnlockBehavior__handleMesaFailure__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogLockScreenMesaUnlockBehaviors();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "requesting feedback: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) biometricUnlockBehaviorDelegate];
  [v4 biometricUnlockBehavior:*(void *)(a1 + 40) requestsFeedback:*(void *)(a1 + 32)];
}

uint64_t __51__SBDashBoardMesaUnlockBehavior__handleMesaFailure__block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_failureSettingsForFailAttempt:(int64_t)a3
{
  switch(self->_failedMesaUnlockAttempts)
  {
    case 1:
      uint64_t v3 = [(CSLockScreenMesaSettings *)self->_mesaSettings firstFailureSettings];
      break;
    case 2:
      uint64_t v3 = [(CSLockScreenMesaSettings *)self->_mesaSettings secondFailureSettings];
      break;
    case 3:
      uint64_t v3 = [(CSLockScreenMesaSettings *)self->_mesaSettings thirdFailureSettings];
      break;
    case 4:
      uint64_t v3 = [(CSLockScreenMesaSettings *)self->_mesaSettings fourthFailureSettings];
      break;
    default:
      uint64_t v3 = [(CSLockScreenMesaSettings *)self->_mesaSettings fifthFailureSettings];
      break;
  }
  return v3;
}

- (SBMesaUnlockTrigger)_trigger
{
  return self->_trigger;
}

- (CSLockScreenMesaSettings)_mesaSettings
{
  return self->_mesaSettings;
}

- (SBHomeHardwareButton)_getHomeHardwareButton
{
  return self->_homeHardwareButton;
}

- (void)_setHomeHardwareButton:(id)a3
{
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
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_destroyWeak((id *)&self->_biometricUnlockBehaviorDelegate);
  objc_storeStrong((id *)&self->_homeHardwareButton, 0);
  objc_storeStrong((id *)&self->_mesaSettings, 0);
}

@end