@interface SBSABasePreferencesProvider
+ (SBSystemApertureSettings)settings;
+ (id)newAnimatedTransitionDescriptionWithBehaviorSettings:(id)a3;
+ (id)newUnanimatedTransitionDescription;
- (SBSABasePreferencesProvider)init;
- (SBSABasePreferencesProvider)initWithParentProvider:(id)a3;
- (SBSAStackablePreferencesProviding)childProvider;
- (SBSAStackablePreferencesProviding)parentProvider;
- (SBSystemApertureTransitionSettings)defaultTransitionSettings;
- (id)behaviorSettingsForProperty:(id)a3;
- (id)firstChildPreferenceProviderOfClass:(Class)a3;
- (id)firstChildPreferenceProviderRespondingToSelector:(SEL)a3;
- (id)newAnimatedTransitionDescriptionForProperty:(id)a3;
- (id)newAnimatedTransitionDescriptionForProperty:(id)a3 animated:(BOOL)a4;
- (id)preferencesFromContext:(id)a3;
- (id)stackDepiction;
- (void)removeFromParentProvider;
- (void)setChildProvider:(id)a3;
@end

@implementation SBSABasePreferencesProvider

- (id)preferencesFromContext:(id)a3
{
  id v4 = a3;
  childProvider = self->_childProvider;
  if (childProvider)
  {
    v6 = [(SBSAStackablePreferencesProviding *)childProvider preferencesFromContext:v4];
  }
  else
  {
    uint64_t v7 = objc_opt_class();
    id v8 = v4;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        v9 = v8;
      }
      else {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
    id v10 = v9;

    v6 = [v10 preferences];
  }
  return v6;
}

- (id)firstChildPreferenceProviderRespondingToSelector:(SEL)a3
{
  v3 = self;
  if (v3)
  {
    id v4 = v3;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v5 = [v4 childProvider];

      id v4 = (void *)v5;
      if (!v5) {
        goto LABEL_5;
      }
    }
    id v6 = v4;
  }
  else
  {
LABEL_5:
    id v6 = 0;
  }

  return v6;
}

void __84__SBSABasePreferencesProvider_newAnimatedTransitionDescriptionWithBehaviorSettings___block_invoke(void *a1, void *a2)
{
  id v15 = a2;
  if (v15)
  {
    v3 = self;
    id v4 = v15;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v5 = v4;
      }
      else {
        uint64_t v5 = 0;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = a1[5];
    uint64_t v9 = a1[6];
    Class v10 = NSClassFromString(&cfstr_Sbsaanimatedtr.isa);
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSABasePreferencesProvider.m", 78, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  v13 = [MEMORY[0x1E4F29128] UUID];
  [v6 setAnimatedTransitionIdentifier:v13];

  [v6 setBehaviorSettings:a1[4]];
  v14 = [(id)a1[6] description];
  [v6 setResponsibleProviderDebugString:v14];
}

- (id)behaviorSettingsForProperty:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBSABasePreferencesProvider *)self defaultTransitionSettings];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    if (BSEqualStrings())
    {
      uint64_t v10 = [v9 centerBehaviorSettings];
      goto LABEL_28;
    }
    if (BSEqualStrings())
    {
      uint64_t v10 = [v9 cornerRadiusBehaviorSettings];
      goto LABEL_28;
    }
    if (BSEqualStrings())
    {
      uint64_t v10 = [v9 alphaBehaviorSettings];
      goto LABEL_28;
    }
    if (BSEqualStrings())
    {
      uint64_t v10 = [v9 backgroundColorBehaviorSettings];
LABEL_28:
      v16 = (void *)v10;
      if (v10) {
        goto LABEL_30;
      }
    }
LABEL_29:
    v16 = [v7 defaultBehaviorSettings];
    goto LABEL_30;
  }
  uint64_t v11 = objc_opt_class();
  id v12 = v7;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    if (BSEqualStrings())
    {
      uint64_t v15 = [v14 sensorObscuringShadowBehaviorSettings];
LABEL_25:
      v16 = (void *)v15;
      goto LABEL_38;
    }
    if (([v4 hasPrefix:@"leadingView"] & 1) != 0
      || ([v4 hasPrefix:@"trailingView"] & 1) != 0
      || [v4 hasPrefix:@"minimalView"])
    {
      uint64_t v15 = [v14 subcomponentBehaviorSettings];
      goto LABEL_25;
    }
    if ([v4 hasPrefix:@"customContent"])
    {
      uint64_t v15 = [v14 customContentBehaviorSettings];
      goto LABEL_25;
    }
    if ([v4 hasPrefix:@"snapshotView"])
    {
      uint64_t v15 = [v14 snapshotBehaviorSettings];
      goto LABEL_25;
    }
  }
  v16 = 0;
LABEL_38:

  if (!v16) {
    goto LABEL_29;
  }
LABEL_30:

  return v16;
}

+ (SBSystemApertureSettings)settings
{
  if (settings_onceToken_0 != -1) {
    dispatch_once(&settings_onceToken_0, &__block_literal_global_30);
  }
  v2 = (void *)settings___settings;
  return (SBSystemApertureSettings *)v2;
}

- (id)stackDepiction
{
  v2 = self;
  v3 = [(SBSABasePreferencesProvider *)v2 parentProvider];

  id v4 = v2;
  if (v3)
  {
    uint64_t v5 = v2;
    do
    {
      id v4 = [(SBSABasePreferencesProvider *)v5 parentProvider];

      uint64_t v6 = [(SBSABasePreferencesProvider *)v4 parentProvider];

      uint64_t v5 = v4;
    }
    while (v6);
  }
  id v7 = v4;
  uint64_t v8 = v2;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v10 = v7;
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = @"@ ";
    v13 = v10;
    while (1)
    {
      id v14 = [v13 descriptionForStackDepiction];
      uint64_t v15 = (void *)[v14 mutableCopy];

      v16 = BSEqualObjects() ? @"* " : v12;
      [v15 insertString:v16 atIndex:0];
      uint64_t v17 = [v13 childProvider];

      if (!v17) {
        break;
      }
      [v15 appendString:@"\n"];
      [v9 appendString:v15];

      v13 = (void *)v17;
      id v12 = @"| ";
    }
    [v9 appendString:v15];
  }
  return v9;
}

- (SBSAStackablePreferencesProviding)childProvider
{
  return self->_childProvider;
}

- (SBSAStackablePreferencesProviding)parentProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentProvider);
  return (SBSAStackablePreferencesProviding *)WeakRetained;
}

- (id)newAnimatedTransitionDescriptionForProperty:(id)a3
{
  return [(SBSABasePreferencesProvider *)self newAnimatedTransitionDescriptionForProperty:a3 animated:1];
}

- (id)newAnimatedTransitionDescriptionForProperty:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  id v7 = objc_opt_class();
  if (a4) {
    [(SBSABasePreferencesProvider *)self behaviorSettingsForProperty:v6];
  }
  else {
  uint64_t v8 = [MEMORY[0x1E4FA5F08] unanimatedBehaviorSettings];
  }
  id v9 = (void *)[v7 newAnimatedTransitionDescriptionWithBehaviorSettings:v8];

  return v9;
}

+ (id)newAnimatedTransitionDescriptionWithBehaviorSettings:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__SBSABasePreferencesProvider_newAnimatedTransitionDescriptionWithBehaviorSettings___block_invoke;
    v9[3] = &unk_1E6AF8AB0;
    SEL v11 = a2;
    id v12 = a1;
    id v10 = v5;
    id v7 = +[SBSAAnimatedTransitionDescription instanceWithBlock:v9];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (SBSystemApertureTransitionSettings)defaultTransitionSettings
{
  v2 = [(id)objc_opt_class() settings];
  v3 = [v2 defaultInterfaceElementTransitionSettings];

  return (SBSystemApertureTransitionSettings *)v3;
}

- (id)firstChildPreferenceProviderOfClass:(Class)a3
{
  v3 = self;
  if (v3)
  {
    id v4 = v3;
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = [v4 childProvider];

      id v4 = (void *)v5;
      if (!v5) {
        goto LABEL_5;
      }
    }
    id v6 = v4;
  }
  else
  {
LABEL_5:
    id v6 = 0;
  }

  return v6;
}

void __39__SBSABasePreferencesProvider_settings__block_invoke()
{
  uint64_t v0 = +[SBSystemApertureDomain rootSettings];
  v1 = (void *)settings___settings;
  settings___settings = v0;
}

+ (id)newUnanimatedTransitionDescription
{
  v3 = [MEMORY[0x1E4FA5F08] unanimatedBehaviorSettings];
  id v4 = (void *)[a1 newAnimatedTransitionDescriptionWithBehaviorSettings:v3];

  return v4;
}

- (SBSABasePreferencesProvider)initWithParentProvider:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBSABasePreferencesProvider;
  uint64_t v5 = [(SBSABasePreferencesProvider *)&v7 init];
  if (v5) {
    [v4 setChildProvider:v5];
  }

  return v5;
}

- (SBSABasePreferencesProvider)init
{
  return [(SBSABasePreferencesProvider *)self initWithParentProvider:0];
}

- (void)setChildProvider:(id)a3
{
  id v6 = (SBSAStackablePreferencesProviding *)a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
    }
    objc_super v7 = SBLogSystemAperturePreferencesStackMutation();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      [(SBSABasePreferencesProvider *)(uint64_t)v6 setChildProvider:v7];
    }

    uint64_t v8 = self;
    objc_sync_enter(v8);
    childProvider = v8->_childProvider;
    if (childProvider != v6)
    {
      uint64_t v10 = objc_opt_class();
      SEL v11 = childProvider;
      if (v10)
      {
        if (objc_opt_isKindOfClass()) {
          id v12 = v11;
        }
        else {
          id v12 = 0;
        }
      }
      else
      {
        id v12 = 0;
      }
      v13 = v12;

      objc_storeStrong((id *)&v8->_childProvider, a3);
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = v6;
      if (v14)
      {
        if (objc_opt_isKindOfClass()) {
          v16 = v15;
        }
        else {
          v16 = 0;
        }
      }
      else
      {
        v16 = 0;
      }
      uint64_t v17 = v16;

      objc_storeWeak(v17 + 2, v8);
      objc_storeStrong(v17 + 3, v12);
      if (v13) {
        objc_storeWeak(v13 + 2, v17);
      }
    }
    objc_sync_exit(v8);
  }
}

- (void)removeFromParentProvider
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Removing Provider: %@", (uint8_t *)&v2, 0xCu);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childProvider, 0);
  objc_destroyWeak((id *)&self->_parentProvider);
  objc_storeStrong((id *)&self->_childProviders, 0);
}

- (void)setChildProvider:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "Inserting Provider: %@ as child of %@", (uint8_t *)&v3, 0x16u);
}

@end