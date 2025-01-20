@interface SBLowPowerModeAlwaysOnPolicy
- (BOOL)isAlwaysOnPolicyActive;
- (NSString)analyticsPolicyName;
- (id)analyticsPolicyValue;
- (void)_updateAssertion;
- (void)activateAlwaysOnPolicy;
@end

@implementation SBLowPowerModeAlwaysOnPolicy

- (void)activateAlwaysOnPolicy
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if (!self->_alwaysOnPolicyActive)
  {
    self->_alwaysOnPolicyActive = 1;
    id v3 = objc_alloc(MEMORY[0x1E4F4F4C0]);
    v4 = [MEMORY[0x1E4F4A450] allowAmbientIdleTimer];
    v10[0] = v4;
    v5 = [MEMORY[0x1E4F4F508] disableAlwaysOn];
    v10[1] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    v7 = (BLSAssertion *)[v3 initWithExplanation:@"Low Power Mode" attributes:v6];
    alwaysOnDisabledAssertion = self->_alwaysOnDisabledAssertion;
    self->_alwaysOnDisabledAssertion = v7;

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:self selector:sel__noteLowPowerModeChanged_ name:*MEMORY[0x1E4F287E8] object:0];

    [(SBLowPowerModeAlwaysOnPolicy *)self _updateAssertion];
  }
}

- (NSString)analyticsPolicyName
{
  return (NSString *)@"lowPowerMode";
}

- (id)analyticsPolicyValue
{
  v2 = NSNumber;
  uint64_t v3 = [(BLSAssertion *)self->_alwaysOnDisabledAssertion isAcquired];
  return (id)[v2 numberWithBool:v3];
}

- (void)_updateAssertion
{
  uint64_t v3 = [MEMORY[0x1E4F28F80] processInfo];
  int v4 = [v3 isLowPowerModeEnabled];

  v5 = SBLogBacklight();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Acquiring low-power-mode always-on-disable assertion", buf, 2u);
    }

    [(BLSAssertion *)self->_alwaysOnDisabledAssertion acquireWithObserver:0];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Releasing low-power-mode always-on-disable assertion", v7, 2u);
    }

    [(BLSAssertion *)self->_alwaysOnDisabledAssertion cancel];
  }
}

- (BOOL)isAlwaysOnPolicyActive
{
  return self->_alwaysOnPolicyActive;
}

- (void).cxx_destruct
{
}

@end