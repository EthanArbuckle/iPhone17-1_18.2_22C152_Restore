@interface SBFocusModeAlwaysOnPolicy
- (BOOL)_shouldDisableAlwaysOnForDNDState:(id)a3;
- (BOOL)isAlwaysOnPolicyActive;
- (NSString)analyticsPolicyName;
- (id)analyticsPolicyValue;
- (void)_setDisableAlwaysOn:(BOOL)a3 dndState:(id)a4;
- (void)_updateFromDNDState:(id)a3;
- (void)activateAlwaysOnPolicy;
- (void)doNotDisturbStateMonitor:(id)a3 didUpdateToState:(id)a4;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation SBFocusModeAlwaysOnPolicy

- (void)activateAlwaysOnPolicy
{
  v16[3] = *MEMORY[0x1E4F143B8];
  if (!self->_alwaysOnPolicyActive)
  {
    self->_alwaysOnPolicyActive = 1;
    v3 = +[SBAlwaysOnDomain rootSettings];
    v4 = [v3 policySettings];
    policySettings = self->_policySettings;
    self->_policySettings = v4;

    [(PTSettings *)self->_policySettings addKeyObserver:self];
    id v6 = objc_alloc(MEMORY[0x1E4F4F4C0]);
    v7 = [MEMORY[0x1E4F4A450] allowAmbientIdleTimerForSleepFocus];
    v8 = objc_msgSend(MEMORY[0x1E4F4A468], "enableMotionDetectionWake", v7);
    v16[1] = v8;
    v9 = [MEMORY[0x1E4F4F508] disableAlwaysOn];
    v16[2] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
    v11 = (BLSAssertion *)[v6 initWithExplanation:@"Focus Mode" attributes:v10];
    alwaysOnDisabledAssertion = self->_alwaysOnDisabledAssertion;
    self->_alwaysOnDisabledAssertion = v11;

    self->_disableAlwaysOn = 0;
    v13 = +[SBDoNotDisturbStateMonitor sharedInstance];
    dndStateMonitor = self->_dndStateMonitor;
    self->_dndStateMonitor = v13;

    [(SBDoNotDisturbStateMonitor *)self->_dndStateMonitor addObserver:self];
    v15 = [(SBDoNotDisturbStateMonitor *)self->_dndStateMonitor state];
    if (v15) {
      [(SBFocusModeAlwaysOnPolicy *)self _updateFromDNDState:v15];
    }
  }
}

- (NSString)analyticsPolicyName
{
  return (NSString *)@"focusMode";
}

- (id)analyticsPolicyValue
{
  if ([(BLSAssertion *)self->_alwaysOnDisabledAssertion isAcquired])
  {
    v3 = [(SBDoNotDisturbStateMonitor *)self->_dndStateMonitor state];
    v4 = [v3 activeModeConfiguration];
    v5 = [v4 mode];

    if (v5)
    {
      [v5 semanticType];
      DNDModeSemanticTypeToString();
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = @"unkown";
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)doNotDisturbStateMonitor:(id)a3 didUpdateToState:(id)a4
{
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_policySettings == a3)
  {
    v5 = [(SBDoNotDisturbStateMonitor *)self->_dndStateMonitor state];
    if (v5)
    {
      id v6 = v5;
      [(SBFocusModeAlwaysOnPolicy *)self _updateFromDNDState:v5];
      v5 = v6;
    }
  }
}

- (void)_updateFromDNDState:(id)a3
{
  id v4 = a3;
  [(SBFocusModeAlwaysOnPolicy *)self _setDisableAlwaysOn:[(SBFocusModeAlwaysOnPolicy *)self _shouldDisableAlwaysOnForDNDState:v4] dndState:v4];
}

- (void)_setDisableAlwaysOn:(BOOL)a3 dndState:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_disableAlwaysOn != v4)
  {
    self->_disableAlwaysOn = v4;
    v7 = SBLogBacklight();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v8)
      {
        int v9 = 138412290;
        id v10 = v6;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Acquiring focus-mode always-on-disable assertion for state %@", (uint8_t *)&v9, 0xCu);
      }

      [(BLSAssertion *)self->_alwaysOnDisabledAssertion acquireWithObserver:0];
    }
    else
    {
      if (v8)
      {
        int v9 = 138412290;
        id v10 = v6;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Releasing focus-mode always-on-disable assertion for state %@", (uint8_t *)&v9, 0xCu);
      }

      [(BLSAssertion *)self->_alwaysOnDisabledAssertion cancel];
    }
  }
}

- (BOOL)_shouldDisableAlwaysOnForDNDState:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SBAlwaysOnPolicySettings *)self->_policySettings focusStrategy];
  if (v5 == 1)
  {
    v12 = [v4 activeModeConfiguration];
    uint64_t v13 = [v12 dimsLockScreen];

    char v11 = v13 != 0;
  }
  else if (v5)
  {
    char v11 = 0;
  }
  else
  {
    id v6 = [v4 activeModeConfiguration];
    v7 = [v6 mode];
    uint64_t v8 = [v7 semanticType];

    int v9 = [(SBAlwaysOnPolicySettings *)self->_policySettings alwaysOnDisablingFocusSemanticTypes];
    id v10 = [NSNumber numberWithInteger:v8];
    char v11 = [v9 containsObject:v10];
  }
  return v11;
}

- (BOOL)isAlwaysOnPolicyActive
{
  return self->_alwaysOnPolicyActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policySettings, 0);
  objc_storeStrong((id *)&self->_dndStateMonitor, 0);
  objc_storeStrong((id *)&self->_alwaysOnDisabledAssertion, 0);
}

@end