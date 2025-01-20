@interface SBThermalAlwaysOnPolicy
- (BOOL)_isThermallyBlocked;
- (BOOL)isAlwaysOnPolicyActive;
- (NSString)analyticsPolicyName;
- (id)analyticsPolicyValue;
- (void)_setThermallyBlocked:(BOOL)a3;
- (void)_updateThermalState;
- (void)activateAlwaysOnPolicy;
@end

@implementation SBThermalAlwaysOnPolicy

- (void)activateAlwaysOnPolicy
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (!self->_alwaysOnPolicyActive)
  {
    self->_alwaysOnPolicyActive = 1;
    id v3 = objc_alloc(MEMORY[0x1E4F4F4C0]);
    v4 = [MEMORY[0x1E4F4A450] allowAmbientIdleTimer];
    v11[0] = v4;
    v5 = [MEMORY[0x1E4F4F508] disableAlwaysOn];
    v11[1] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    v7 = (BLSAssertion *)[v3 initWithExplanation:@"Thermal Trap" attributes:v6];
    alwaysOnDisabledAssertion = self->_alwaysOnDisabledAssertion;
    self->_alwaysOnDisabledAssertion = v7;

    self->_thermallyBlocked = 0;
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:self selector:sel__noteDeviceBlockStateDidChange_ name:*MEMORY[0x1E4FA60F0] object:0];

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:self selector:sel__noteBootCompleted_ name:@"SBBootCompleteNotification" object:0];

    [(SBThermalAlwaysOnPolicy *)self _updateThermalState];
  }
}

- (NSString)analyticsPolicyName
{
  return (NSString *)@"thermalTrap";
}

- (id)analyticsPolicyValue
{
  v2 = NSNumber;
  uint64_t v3 = [(BLSAssertion *)self->_alwaysOnDisabledAssertion isAcquired];
  return (id)[v2 numberWithBool:v3];
}

- (void)_updateThermalState
{
  id v3 = [(id)SBApp lockOutController];
  -[SBThermalAlwaysOnPolicy _setThermallyBlocked:](self, "_setThermallyBlocked:", [v3 isThermallyBlocked]);
}

- (void)_setThermallyBlocked:(BOOL)a3
{
  if (self->_thermallyBlocked != a3)
  {
    BOOL v3 = a3;
    self->_thermallyBlocked = a3;
    v5 = SBLogBacklight();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Acquiring thermal-trap always-on-disable assertion", buf, 2u);
      }

      [(BLSAssertion *)self->_alwaysOnDisabledAssertion acquireWithObserver:0];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Releasing thermal-trap always-on-disable assertion", v7, 2u);
      }

      [(BLSAssertion *)self->_alwaysOnDisabledAssertion cancel];
    }
  }
}

- (BOOL)isAlwaysOnPolicyActive
{
  return self->_alwaysOnPolicyActive;
}

- (BOOL)_isThermallyBlocked
{
  return self->_thermallyBlocked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockOutStatusProvider, 0);
  objc_storeStrong((id *)&self->_alwaysOnDisabledAssertion, 0);
}

@end