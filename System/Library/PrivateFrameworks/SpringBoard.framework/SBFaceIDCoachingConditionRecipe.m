@interface SBFaceIDCoachingConditionRecipe
- (BOOL)_overrideCoachingConditionEnabled;
- (id)title;
- (void)_setOverrideCoachingConditionEnabled:(BOOL)a3;
- (void)_setOverrideCoachingEvent:(unint64_t)a3;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBFaceIDCoachingConditionRecipe

- (id)title
{
  return @"Face ID Coaching";
}

- (void)handleVolumeIncrease
{
  if (![(SBFaceIDCoachingConditionRecipe *)self _overrideCoachingConditionEnabled]) {
    [(SBFaceIDCoachingConditionRecipe *)self _setOverrideCoachingConditionEnabled:1];
  }
  if ((unint64_t)(handleVolumeIncrease_coachingEvent + 1) <= 0x16) {
    uint64_t v3 = handleVolumeIncrease_coachingEvent + 1;
  }
  else {
    uint64_t v3 = 16;
  }
  handleVolumeIncrease_coachingEvent = v3;
  -[SBFaceIDCoachingConditionRecipe _setOverrideCoachingEvent:](self, "_setOverrideCoachingEvent:");
}

- (void)handleVolumeDecrease
{
  uint64_t v3 = [(SBFaceIDCoachingConditionRecipe *)self _overrideCoachingConditionEnabled] ^ 1;
  [(SBFaceIDCoachingConditionRecipe *)self _setOverrideCoachingConditionEnabled:v3];
}

- (void)_setOverrideCoachingConditionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F5E408] rootSettings];
  v4 = [v5 pearlSettings];
  [v4 setOverrideCoachingConditionEnabled:v3];
}

- (BOOL)_overrideCoachingConditionEnabled
{
  v2 = [MEMORY[0x1E4F5E408] rootSettings];
  BOOL v3 = [v2 pearlSettings];
  char v4 = [v3 overrideCoachingConditionEnabled];

  return v4;
}

- (void)_setOverrideCoachingEvent:(unint64_t)a3
{
  id v5 = [MEMORY[0x1E4F5E408] rootSettings];
  char v4 = [v5 pearlSettings];
  [v4 setOverrideCoachingBiometricEvent:a3];
}

@end