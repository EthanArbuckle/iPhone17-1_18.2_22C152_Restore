@interface SBSetupAlwaysOnPolicy
- (BOOL)_isInSetupMode;
- (BOOL)isAlwaysOnPolicyActive;
- (NSString)analyticsPolicyName;
- (id)analyticsPolicyValue;
- (void)_setInSetupMode:(BOOL)a3;
- (void)_updateSetupModeState;
- (void)activateAlwaysOnPolicy;
@end

@implementation SBSetupAlwaysOnPolicy

- (void)activateAlwaysOnPolicy
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (!self->_alwaysOnPolicyActive)
  {
    self->_alwaysOnPolicyActive = 1;
    id v3 = objc_alloc(MEMORY[0x1E4F4F4C0]);
    v4 = [MEMORY[0x1E4F4F508] disableAlwaysOn];
    v9[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    v6 = (BLSAssertion *)[v3 initWithExplanation:@"Setup" attributes:v5];
    alwaysOnDisabledAssertion = self->_alwaysOnDisabledAssertion;
    self->_alwaysOnDisabledAssertion = v6;

    self->_inSetupMode = 0;
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:self selector:sel__setupModeStateDidChange_ name:@"SBInBuddyModeDidChangeNotification" object:0];

    [(SBSetupAlwaysOnPolicy *)self _updateSetupModeState];
  }
}

- (NSString)analyticsPolicyName
{
  return (NSString *)@"setup";
}

- (id)analyticsPolicyValue
{
  v2 = NSNumber;
  uint64_t v3 = [(BLSAssertion *)self->_alwaysOnDisabledAssertion isAcquired];
  return (id)[v2 numberWithBool:v3];
}

- (void)_updateSetupModeState
{
  id v3 = +[SBSetupManager sharedInstance];
  -[SBSetupAlwaysOnPolicy _setInSetupMode:](self, "_setInSetupMode:", [v3 isInSetupMode]);
}

- (void)_setInSetupMode:(BOOL)a3
{
  if (self->_inSetupMode != a3)
  {
    BOOL v3 = a3;
    self->_inSetupMode = a3;
    v5 = SBLogBacklight();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Acquiring setup-mode always-on-disable assertion", buf, 2u);
      }

      [(BLSAssertion *)self->_alwaysOnDisabledAssertion acquireWithObserver:0];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Releasing setup-mode always-on-disable assertion", v7, 2u);
      }

      [(BLSAssertion *)self->_alwaysOnDisabledAssertion cancel];
    }
  }
}

- (BOOL)isAlwaysOnPolicyActive
{
  return self->_alwaysOnPolicyActive;
}

- (BOOL)_isInSetupMode
{
  return self->_inSetupMode;
}

- (void).cxx_destruct
{
}

@end