@interface SBAccessibilityMesaUnlockTrigger
- (BOOL)bioUnlock;
- (SBAccessibilityMesaUnlockTrigger)initWithUnlockBehaviorConfigurationDelegate:(id)a3 baseTrigger:(id)a4;
- (void)fingerOff;
- (void)fingerOn;
- (void)menuButtonDown;
- (void)menuButtonUp;
- (void)mesaUnlockTriggerFired:(id)a3;
- (void)screenOff;
- (void)significantUserInteractionOccurred;
@end

@implementation SBAccessibilityMesaUnlockTrigger

- (SBAccessibilityMesaUnlockTrigger)initWithUnlockBehaviorConfigurationDelegate:(id)a3 baseTrigger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBAccessibilityMesaUnlockTrigger;
  v8 = [(SBAccessibilityMesaUnlockTrigger *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_behaviorConfigurationDelegate, v6);
    objc_storeStrong((id *)&v9->_baseTrigger, a4);
    [(SBMesaUnlockTrigger *)v9->_baseTrigger setDelegate:v9];
  }

  return v9;
}

- (BOOL)bioUnlock
{
  if ([(SBMesaUnlockTrigger *)self->_baseTrigger bioUnlock])
  {
    WeakRetained = SBLogLockScreenMesaUnlockBehaviors();
    BOOL v4 = 1;
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, WeakRetained, OS_LOG_TYPE_INFO, "[SBAccessibilityMesaUnlockTrigger] unlocking base unlock trigger says we should", buf, 2u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorConfigurationDelegate);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ![WeakRetained isLockScreenShowingDefaultContent])
    {
      v5 = SBLogLockScreenMesaUnlockBehaviors();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "[SBAccessibilityMesaUnlockTrigger] NOT unlocking because main page is not visible or content is above dashboard", v7, 2u);
      }
      BOOL v4 = 0;
    }
    else
    {
      v5 = SBLogLockScreenMesaUnlockBehaviors();
      BOOL v4 = 1;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "[SBAccessibilityMesaUnlockTrigger] unlocking because main page visible & no content above dashboard", v8, 2u);
      }
    }
  }
  return v4;
}

- (void)screenOff
{
}

- (void)significantUserInteractionOccurred
{
}

- (void)menuButtonDown
{
}

- (void)menuButtonUp
{
}

- (void)fingerOn
{
  [(SBMesaUnlockTrigger *)self->_baseTrigger fingerOn];
  if ([(SBMesaUnlockTrigger *)self authenticated]
    && [(SBAccessibilityMesaUnlockTrigger *)self bioUnlock])
  {
    id v3 = [(SBMesaUnlockTrigger *)self delegate];
    [v3 mesaUnlockTriggerFired:self];
  }
}

- (void)fingerOff
{
}

- (void)mesaUnlockTriggerFired:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogLockScreenMesaUnlockBehaviors();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "[SBAccessibilityMesaUnlockTrigger] triggering because base unlock trigger fired: %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(SBMesaUnlockTrigger *)self delegate];
  [v6 mesaUnlockTriggerFired:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseTrigger, 0);
  objc_destroyWeak((id *)&self->_behaviorConfigurationDelegate);
}

@end