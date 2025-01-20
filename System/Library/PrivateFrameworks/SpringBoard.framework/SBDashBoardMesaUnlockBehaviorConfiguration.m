@interface SBDashBoardMesaUnlockBehaviorConfiguration
- (BOOL)_isAccessibilityRestingUnlockPreferenceEnabled;
- (Class)_currentUnlockTriggerClass;
- (Class)_expectedTriggerClassIncludingAccessibility:(BOOL)a3;
- (SBBiometricUnlockBehaviorConfigurationDelegate)delegate;
- (SBDashBoardMesaUnlockBehaviorConfiguration)initWithLiftToWakeController:(id)a3 biometricResource:(id)a4 lockScreenPrototypeSettings:(id)a5;
- (SBDashBoardMesaUnlockBehaviorConfiguration)initWithLiftToWakeController:(id)a3 biometricResource:(id)a4 lockScreenPrototypeSettings:(id)a5 evaluateTriggerClass:(BOOL)a6;
- (id)_liftToWakeController;
- (id)_unlockTriggerWithClass:(Class)a3;
- (id)newBehaviorForCurrentConfiguration;
- (void)_accessibilityOptionsChanged:(id)a3;
- (void)_evaluateTriggerClass;
- (void)_setLiftToWakeController:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation SBDashBoardMesaUnlockBehaviorConfiguration

- (SBDashBoardMesaUnlockBehaviorConfiguration)initWithLiftToWakeController:(id)a3 biometricResource:(id)a4 lockScreenPrototypeSettings:(id)a5
{
  return [(SBDashBoardMesaUnlockBehaviorConfiguration *)self initWithLiftToWakeController:a3 biometricResource:a4 lockScreenPrototypeSettings:a5 evaluateTriggerClass:1];
}

- (SBDashBoardMesaUnlockBehaviorConfiguration)initWithLiftToWakeController:(id)a3 biometricResource:(id)a4 lockScreenPrototypeSettings:(id)a5 evaluateTriggerClass:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBDashBoardMesaUnlockBehaviorConfiguration;
  v13 = [(SBDashBoardMesaUnlockBehaviorConfiguration *)&v17 init];
  v14 = v13;
  if (v13)
  {
    [(SBDashBoardMesaUnlockBehaviorConfiguration *)v13 _setLiftToWakeController:v10];
    objc_storeStrong((id *)&v14->_biometricResource, a4);
    objc_storeStrong((id *)&v14->_prototypeSettings, a5);
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v14 selector:sel__accessibilityOptionsChanged_ name:*MEMORY[0x1E4FB92B0] object:0];

    if (v6) {
      [(SBDashBoardMesaUnlockBehaviorConfiguration *)v14 _evaluateTriggerClass];
    }
  }

  return v14;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB92B0] object:0];

  [(SBDashBoardMesaUnlockBehaviorConfiguration *)self _setLiftToWakeController:0];
  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardMesaUnlockBehaviorConfiguration;
  [(SBDashBoardMesaUnlockBehaviorConfiguration *)&v4 dealloc];
}

- (id)newBehaviorForCurrentConfiguration
{
  objc_super v4 = [(SBDashBoardMesaUnlockBehaviorConfiguration *)self _unlockTriggerWithClass:self->_currentTriggerClass];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBDashBoardMesaUnlockBehaviorConfiguration.m" lineNumber:79 description:@"Mesa unlock trigger must be a type of SBMesaUnlockTrigger."];
  }
  int v5 = [(SBUIBiometricResource *)self->_biometricResource hasPearlSupport];
  prototypeSettings = self->_prototypeSettings;
  if (v5)
  {
    v7 = [(CSLockScreenSettings *)prototypeSettings pearlSettings];
    v8 = [[SBDashBoardPearlUnlockBehavior alloc] initWithPearlSettings:v7 andUnlockTrigger:v4];
  }
  else
  {
    v7 = [(CSLockScreenSettings *)prototypeSettings mesaSettings];
    v8 = [[SBDashBoardMesaUnlockBehavior alloc] initWithMesaSettings:v7 andUnlockTrigger:v4];
  }
  v9 = v8;

  return v9;
}

- (BOOL)_isAccessibilityRestingUnlockPreferenceEnabled
{
  return _AXSHomeButtonRestingUnlock() != 0;
}

- (Class)_currentUnlockTriggerClass
{
  return self->_currentTriggerClass;
}

- (void)_evaluateTriggerClass
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [(SBDashBoardMesaUnlockBehaviorConfiguration *)self _expectedTriggerClassIncludingAccessibility:1];
  if (self->_currentTriggerClass != v3)
  {
    self->_currentTriggerClass = v3;
    objc_super v4 = SBLogLockScreenMesaUnlockBehaviors();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = NSStringFromClass(self->_currentTriggerClass);
      int v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Unlock behavior configuration changed - new expected trigger is: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained biometricUnlockBehaviorConfigurationDidChange:self];
  }
}

- (void)_setLiftToWakeController:(id)a3
{
  int v5 = (SBLiftToWakeController *)a3;
  liftToWakeController = self->_liftToWakeController;
  if (liftToWakeController != v5)
  {
    int v7 = v5;
    [(SBLiftToWakeController *)liftToWakeController removeObserver:self];
    objc_storeStrong((id *)&self->_liftToWakeController, a3);
    [(SBLiftToWakeController *)self->_liftToWakeController addObserver:self];
    int v5 = v7;
  }
}

- (id)_liftToWakeController
{
  return self->_liftToWakeController;
}

- (void)_accessibilityOptionsChanged:(id)a3
{
}

uint64_t __75__SBDashBoardMesaUnlockBehaviorConfiguration__accessibilityOptionsChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _evaluateTriggerClass];
}

- (id)_unlockTriggerWithClass:(Class)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((Class)objc_opt_class() == a3)
  {
    v8 = [(SBDashBoardMesaUnlockBehaviorConfiguration *)self _expectedTriggerClassIncludingAccessibility:0];
    if (v8 == (objc_class *)objc_opt_class())
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"SBDashBoardMesaUnlockBehaviorConfiguration.m" lineNumber:150 description:@"Base unlock trigger cannot be accessibility or we'll loop."];
    }
    uint64_t v9 = [(SBDashBoardMesaUnlockBehaviorConfiguration *)self _unlockTriggerWithClass:v8];
    id v10 = [[SBAccessibilityMesaUnlockTrigger alloc] initWithUnlockBehaviorConfigurationDelegate:WeakRetained baseTrigger:v9];
  }
  else
  {
    if ((Class)objc_opt_class() == a3) {
      int v7 = [[SBZionUnlockTrigger alloc] initWithUnlockBehaviorConfigurationDelegate:WeakRetained];
    }
    else {
      int v7 = (SBZionUnlockTrigger *)objc_alloc_init(a3);
    }
    id v10 = (SBAccessibilityMesaUnlockTrigger *)v7;
  }

  return v10;
}

- (Class)_expectedTriggerClassIncludingAccessibility:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(SBUIBiometricResource *)self->_biometricResource hasPearlSupport] & 1) == 0)
  {
    if (v3
      && [(SBDashBoardMesaUnlockBehaviorConfiguration *)self _isAccessibilityRestingUnlockPreferenceEnabled])
    {
      [(SBUIBiometricResource *)self->_biometricResource hasPoseidonSupport];
    }
    else
    {
      [(SBLiftToWakeController *)self->_liftToWakeController isEnabled];
    }
  }
  int v5 = objc_opt_class();
  return (Class)v5;
}

- (SBBiometricUnlockBehaviorConfigurationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBBiometricUnlockBehaviorConfigurationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_prototypeSettings, 0);
  objc_storeStrong((id *)&self->_liftToWakeController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end