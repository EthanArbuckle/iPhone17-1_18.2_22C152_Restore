@interface SBHomeButtonPressMesaUnlockTrigger
- (BOOL)bioUnlock;
- (id)description;
- (id)succinctDescriptionBuilder;
- (void)menuButtonDown;
- (void)menuButtonUp;
- (void)screenOff;
- (void)significantUserInteractionOccurred;
@end

@implementation SBHomeButtonPressMesaUnlockTrigger

- (id)description
{
  return [(SBMesaUnlockTrigger *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescriptionBuilder
{
  v7.receiver = self;
  v7.super_class = (Class)SBHomeButtonPressMesaUnlockTrigger;
  v3 = [(SBMesaUnlockTrigger *)&v7 succinctDescriptionBuilder];
  id v4 = (id)[v3 appendBool:*((unsigned __int8 *)&self->super._authenticated + 2) withName:@"primed"];
  id v5 = (id)[v3 appendBool:*((unsigned __int8 *)&self->super._authenticated + 1) withName:@"menuButtonDown"];
  return v3;
}

- (BOOL)bioUnlock
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(&self->super._authenticated + 1) || *(&self->super._authenticated + 2))
  {
    v3 = SBLogLockScreenMesaUnlockBehaviors();
    BOOL v4 = 1;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = *((unsigned __int8 *)&self->super._authenticated + 1);
      int v6 = *((unsigned __int8 *)&self->super._authenticated + 2);
      v8[0] = 67109376;
      v8[1] = v5;
      __int16 v9 = 1024;
      int v10 = v6;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "[SBHomeButtonPressMesaUnlockTrigger] unlocking because menuButtonDown: %d primed: %d", (uint8_t *)v8, 0xEu);
    }
  }
  else
  {
    v3 = SBLogLockScreenMesaUnlockBehaviors();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "[SBHomeButtonPressMesaUnlockTrigger] not unlocking because not primed and menu button up", (uint8_t *)v8, 2u);
    }
    BOOL v4 = 0;
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
  *(&self->super._authenticated + 1) = 1;
}

- (void)menuButtonUp
{
}

@end