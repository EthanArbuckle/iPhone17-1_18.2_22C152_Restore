@interface SBSystemApertureTransitionSettings
+ (id)_childSettingsKeyPathsToTitles;
+ (id)_moduleWithSectionTitle:(id)a3;
+ (id)_rowForKeyPath:(id)a3 title:(id)a4;
+ (id)settingsControllerModule;
- (SBFFluidBehaviorSettings)defaultBehaviorSettings;
- (id)_childSettings;
- (void)_setDefaultValuesForBehaviorSettings:(id)a3;
- (void)setChildBehaviorSettingsNamePrefix:(id)a3;
- (void)setDefaultBehaviorSettings:(id)a3;
- (void)setDefaultValues;
@end

@implementation SBSystemApertureTransitionSettings

- (SBFFluidBehaviorSettings)defaultBehaviorSettings
{
  return self->_defaultBehaviorSettings;
}

+ (id)settingsControllerModule
{
  return (id)[a1 _moduleWithSectionTitle:@"Transition Behavior"];
}

+ (id)_moduleWithSectionTitle:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = (void *)MEMORY[0x1E4F94100];
  v7 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v8 = [v6 rowWithTitle:@"Restore Defaults" action:v7];

  v9 = (void *)MEMORY[0x1E4F94168];
  v27[0] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v11 = [v9 sectionWithRows:v10];
  [v5 addObject:v11];

  v12 = [a1 _childSettingsKeyPathsToTitles];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v18 = [v12 objectForKey:v17];
        v19 = [a1 _rowForKeyPath:v17 title:v18];

        if (v19) {
          [v5 addObject:v19];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }
  v20 = [MEMORY[0x1E4F94168] moduleWithTitle:v4 contents:v5];

  return v20;
}

- (id)_childSettings
{
  v3 = [(id)objc_opt_class() _childSettingsKeyPathsToTitles];
  id v4 = [v3 allKeys];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SBSystemApertureTransitionSettings__childSettings__block_invoke;
  v7[3] = &unk_1E6B07790;
  v7[4] = self;
  id v5 = objc_msgSend(v4, "bs_mapNoNulls:", v7);

  return v5;
}

uint64_t __52__SBSystemApertureTransitionSettings__childSettings__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) valueForKey:a2];
}

- (void)setDefaultValues
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)SBSystemApertureTransitionSettings;
  [(PTSettings *)&v17 setDefaultValues];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(SBSystemApertureTransitionSettings *)self _childSettings];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        uint64_t v9 = objc_opt_class();
        id v10 = v8;
        if (v9)
        {
          if (objc_opt_isKindOfClass()) {
            v11 = v10;
          }
          else {
            v11 = 0;
          }
        }
        else
        {
          v11 = 0;
        }
        id v12 = v11;

        if (v12) {
          [(SBSystemApertureTransitionSettings *)self _setDefaultValuesForBehaviorSettings:v12];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)setChildBehaviorSettingsNamePrefix:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  uint64_t v4 = [(id)objc_opt_class() _childSettingsKeyPathsToTitles];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [v4 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v10 = [(SBSystemApertureTransitionSettings *)self valueForKey:v9];
        v11 = self;
        id v12 = v10;
        if (v11)
        {
          if (objc_opt_isKindOfClass()) {
            long long v13 = v12;
          }
          else {
            long long v13 = 0;
          }
        }
        else
        {
          long long v13 = 0;
        }
        id v14 = v13;

        if (v14)
        {
          long long v15 = [v4 objectForKey:v9];
          long long v16 = [NSString stringWithFormat:@"%@ - (%@)", v18, v15];
          [v14 setName:v16];

          [(SBSystemApertureTransitionSettings *)self _setDefaultValuesForBehaviorSettings:v14];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
}

- (void)setDefaultBehaviorSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)_childSettingsKeyPathsToTitles
{
  return &unk_1F334BA10;
}

+ (id)_rowForKeyPath:(id)a3 title:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasSuffix:@"BehaviorSettings"])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F94168];
    v8 = [MEMORY[0x1E4FA5F08] _moduleWithSectionTitle:v6];
    uint64_t v9 = [v7 submoduleWithModule:v8 childSettingsKeyPath:v5];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_setDefaultValuesForBehaviorSettings:(id)a3
{
  id v3 = a3;
  [v3 setDefaultValues];
  [v3 setBehaviorType:2];
  [v3 setDampingRatio:0.816];
  [v3 setResponse:0.512];
  [v3 setRetargetImpulse:0.008];
  [v3 setTrackingDampingRatio:0.456];
  [v3 setTrackingResponse:0.35];
  [v3 setTrackingRetargetImpulse:0.016];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v3, "setFrameRateRange:highFrameRateReason:", 1114137, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

@end