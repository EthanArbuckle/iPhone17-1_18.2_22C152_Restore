@interface SBDashBoardPearlUnlockBehavior
- (NSString)description;
- (SBBiometricUnlockBehaviorDelegate)biometricUnlockBehaviorDelegate;
- (SBDashBoardPearlUnlockBehavior)initWithPearlSettings:(id)a3 andUnlockTrigger:(id)a4;
- (SBMesaUnlockTrigger)_trigger;
- (id)_feedbackForBioUnlockEventThatWasSpontaneous:(BOOL)a3;
- (id)_feedbackForFailureSettings:(id)a3;
- (id)_feedbackForPasscodeEvent;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_handlePearlFailure;
- (void)_setTrigger:(id)a3;
- (void)handleBiometricEvent:(unint64_t)a3;
- (void)mesaUnlockTriggerFired:(id)a3;
- (void)setBiometricUnlockBehaviorDelegate:(id)a3;
@end

@implementation SBDashBoardPearlUnlockBehavior

- (SBDashBoardPearlUnlockBehavior)initWithPearlSettings:(id)a3 andUnlockTrigger:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBDashBoardPearlUnlockBehavior;
  v9 = [(SBDashBoardPearlUnlockBehavior *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pearlSettings, a3);
    objc_storeStrong((id *)&v10->_trigger, a4);
    [(SBMesaUnlockTrigger *)v10->_trigger setDelegate:v10];
  }

  return v10;
}

- (NSString)description
{
  return (NSString *)[(SBDashBoardPearlUnlockBehavior *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBDashBoardPearlUnlockBehavior *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBDashBoardPearlUnlockBehavior *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBDashBoardPearlUnlockBehavior *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_trigger withName:@"trigger"];
  return v4;
}

- (void)handleBiometricEvent:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
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
      v18 = v9;
      _os_log_impl(&dword_1D85BA000, WeakRetained, OS_LOG_TYPE_INFO, "Base unlock behavior received biometric event: %{public}@", buf, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_biometricUnlockBehaviorDelegate);
    if (a3 <= 0x21 && ((1 << a3) & 0x2070009E0) != 0 || a3 - 9 <= 1)
    {
      [(SBDashBoardPearlUnlockBehavior *)self _handlePearlFailure];
    }
    else if (a3 == 4)
    {
      v11 = [(SBDashBoardPearlUnlockBehavior *)self _trigger];
      uint64_t v12 = [v11 bioUnlock];

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __55__SBDashBoardPearlUnlockBehavior_handleBiometricEvent___block_invoke;
      v14[3] = &unk_1E6AFD0F0;
      v14[4] = self;
      char v16 = v12;
      WeakRetained = WeakRetained;
      v15 = WeakRetained;
      v13 = (void (**)(void, void))MEMORY[0x1D948C7A0](v14);
      v13[2](v13, v12);
    }
  }
  else if (v8)
  {
    v10 = NSStringFromSBUIBiometricEvent();
    *(_DWORD *)buf = 138543362;
    v18 = v10;
    _os_log_impl(&dword_1D85BA000, WeakRetained, OS_LOG_TYPE_INFO, "Unlock behavior received biometric event but has no enrolled identities. Bailing. Event: %{public}@", buf, 0xCu);
  }
}

void __55__SBDashBoardPearlUnlockBehavior_handleBiometricEvent___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(SBLockScreenUnlockRequest);
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
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

- (void)mesaUnlockTriggerFired:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = objc_alloc_init(SBLockScreenUnlockRequest);
  uint64_t v5 = (objc_class *)objc_opt_class();
  char v6 = NSStringFromClass(v5);
  [(SBLockScreenUnlockRequest *)v4 setName:v6];

  [(SBLockScreenUnlockRequest *)v4 setSource:23];
  [(SBLockScreenUnlockRequest *)v4 setIntent:3];
  id v7 = [(SBDashBoardPearlUnlockBehavior *)self _feedbackForBioUnlockEventThatWasSpontaneous:1];
  BOOL v8 = SBLogLockScreenMesaUnlockBehaviors();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109378;
    v10[1] = [(SBLockScreenUnlockRequest *)v4 intent];
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "trigger fired - requesting unlock with intent: %d and feedback: %@", (uint8_t *)v10, 0x12u);
  }

  __int16 v9 = [(SBDashBoardPearlUnlockBehavior *)self biometricUnlockBehaviorDelegate];
  [v9 biometricUnlockBehavior:self requestsUnlock:v4 withFeedback:v7];
}

- (id)_feedbackForFailureSettings:(id)a3
{
  id v3 = a3;
  id v4 = [[SBAuthenticationFeedback alloc] initForFailureWithFailureSettings:v3];

  return v4;
}

- (id)_feedbackForPasscodeEvent
{
  return 0;
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

- (void)_handlePearlFailure
{
  uint64_t v3 = [(CSLockScreenPearlSettings *)self->_pearlSettings failureSettings];
  uint64_t v4 = [(SBDashBoardPearlUnlockBehavior *)self _feedbackForFailureSettings:v3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _DWORD v10[2] = __53__SBDashBoardPearlUnlockBehavior__handlePearlFailure__block_invoke;
  v10[3] = &unk_1E6AF5290;
  id v11 = v4;
  uint64_t v12 = self;
  id v5 = v4;
  char v6 = (void (**)(void, void, void, void))MEMORY[0x1D948C7A0](v10);
  v6[2](v6, v7, v8, v9);
}

void __53__SBDashBoardPearlUnlockBehavior__handlePearlFailure__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = SBLogLockScreenMesaUnlockBehaviors();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "requesting feedback: %@", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) biometricUnlockBehaviorDelegate];
  [v4 biometricUnlockBehavior:*(void *)(a1 + 40) requestsFeedback:*(void *)(a1 + 32)];
}

- (SBBiometricUnlockBehaviorDelegate)biometricUnlockBehaviorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_biometricUnlockBehaviorDelegate);
  return (SBBiometricUnlockBehaviorDelegate *)WeakRetained;
}

- (void)setBiometricUnlockBehaviorDelegate:(id)a3
{
}

- (SBMesaUnlockTrigger)_trigger
{
  return self->_trigger;
}

- (void)_setTrigger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_destroyWeak((id *)&self->_biometricUnlockBehaviorDelegate);
  objc_storeStrong((id *)&self->_pearlSettings, 0);
}

@end