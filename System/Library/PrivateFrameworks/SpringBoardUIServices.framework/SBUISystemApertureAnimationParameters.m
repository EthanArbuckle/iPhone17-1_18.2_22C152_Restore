@interface SBUISystemApertureAnimationParameters
+ (BOOL)areParams:(id)a3 equivalentTo:(id)a4;
- (BOOL)_hasSpringParameters;
- (BOOL)isAnimated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRetargeted;
- (BOOL)tracking;
- (BSSettings)BSSettingsRepresentation;
- (SBFFluidBehaviorSettings)fluidBehaviorSettings;
- (SBUISystemApertureAnimationParameters)initWithBSSettingsRepresentation:(id)a3;
- (SBUISystemApertureAnimationParameters)initWithFluidBehaviorSettings:(id)a3 tracking:(BOOL)a4 retargeted:(BOOL)a5;
- (int64_t)_animationBehavior;
@end

@implementation SBUISystemApertureAnimationParameters

- (SBUISystemApertureAnimationParameters)initWithFluidBehaviorSettings:(id)a3 tracking:(BOOL)a4 retargeted:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBUISystemApertureAnimationParameters;
  v10 = [(SBUISystemApertureAnimationParameters *)&v20 init];
  if (v10)
  {
    uint64_t v11 = [NSNumber numberWithBool:v6];
    tracking = v10->_tracking;
    v10->_tracking = (NSNumber *)v11;

    uint64_t v13 = [NSNumber numberWithBool:v5];
    retargeted = v10->_retargeted;
    v10->_retargeted = (NSNumber *)v13;

    objc_storeStrong((id *)&v10->_fluidBehaviorSettings, a3);
    id v15 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
    [v15 setObject:v10->_tracking forSetting:19873];
    [v15 setObject:v10->_retargeted forSetting:19874];
    v16 = [v9 archiveDictionary];
    [v15 setObject:v16 forSetting:19875];

    uint64_t v17 = [v15 copy];
    BSSettingsRepresentation = v10->_BSSettingsRepresentation;
    v10->_BSSettingsRepresentation = (BSSettings *)v17;
  }
  return v10;
}

- (SBUISystemApertureAnimationParameters)initWithBSSettingsRepresentation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBUISystemApertureAnimationParameters;
  BOOL v5 = [(SBUISystemApertureAnimationParameters *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    BSSettingsRepresentation = v5->_BSSettingsRepresentation;
    v5->_BSSettingsRepresentation = (BSSettings *)v6;
  }
  return v5;
}

- (BOOL)isAnimated
{
  return [(SBUISystemApertureAnimationParameters *)self _animationBehavior] != 0;
}

- (BOOL)_hasSpringParameters
{
  v2 = [(SBUISystemApertureAnimationParameters *)self fluidBehaviorSettings];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)tracking
{
  tracking = self->_tracking;
  if (!tracking)
  {
    id v4 = [self->_BSSettingsRepresentation objectForSetting:19873];
    BOOL v5 = self->_tracking;
    self->_tracking = v4;

    tracking = self->_tracking;
  }
  return [(NSNumber *)tracking BOOLValue];
}

- (BOOL)isRetargeted
{
  retargeted = self->_retargeted;
  if (!retargeted)
  {
    id v4 = [self->_BSSettingsRepresentation objectForSetting:19874];
    BOOL v5 = self->_retargeted;
    self->_retargeted = v4;

    retargeted = self->_retargeted;
  }
  return [(NSNumber *)retargeted BOOLValue];
}

- (SBFFluidBehaviorSettings)fluidBehaviorSettings
{
  fluidBehaviorSettings = self->_fluidBehaviorSettings;
  if (!fluidBehaviorSettings)
  {
    id v4 = [self->_BSSettingsRepresentation objectForSetting:19875];
    uint64_t v5 = objc_opt_class();
    id v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        v7 = v6;
      }
      else {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      objc_super v9 = [MEMORY[0x1E4FA5F08] settingsFromArchiveDictionary:v8];
      v10 = self->_fluidBehaviorSettings;
      self->_fluidBehaviorSettings = v9;
    }
    fluidBehaviorSettings = self->_fluidBehaviorSettings;
  }
  return fluidBehaviorSettings;
}

- (int64_t)_animationBehavior
{
  if ([(SBUISystemApertureAnimationParameters *)self _hasSpringParameters]) {
    return 2;
  }
  else {
    return [(SBUISystemApertureAnimationParameters *)self isRetargeted];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  if (v8) {
    objc_super v9 = (void *)v8[3];
  }
  else {
    objc_super v9 = 0;
  }
  char v10 = [v9 isEqual:self->_BSSettingsRepresentation];

  return v10;
}

+ (BOOL)areParams:(id)a3 equivalentTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isAnimated] & 1) != 0 || objc_msgSend(v6, "isAnimated")) {
    char v7 = [v5 isEqual:v6];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (BSSettings)BSSettingsRepresentation
{
  return self->_BSSettingsRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fluidBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_BSSettingsRepresentation, 0);
  objc_storeStrong((id *)&self->_retargeted, 0);
  objc_storeStrong((id *)&self->_tracking, 0);
}

@end