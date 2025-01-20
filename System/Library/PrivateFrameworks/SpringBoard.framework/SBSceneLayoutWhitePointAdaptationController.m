@interface SBSceneLayoutWhitePointAdaptationController
+ (BOOL)_isInteractiveUpdateEnabled;
+ (double)_defaultAnimationDuration;
+ (id)_defaultAnimationSettings;
+ (id)_harmonySettings;
+ (id)sharedInstance;
- (SBSceneLayoutWhitePointAdaptationController)init;
- (SBWindowScene)windowScene;
- (id)_applicationSceneHandleForLayoutElement:(id)a3;
- (id)_deviceSceneHandlesFromEntities:(id)a3;
- (id)_whitePointAdaptivityStylesForLayoutState;
- (int64_t)_whitePointAdaptivityStyleForLayoutElement:(id)a3;
- (void)_updateWhitePointAdaptationStrengthWithAnimationSettings:(id)a3;
- (void)_updateWhitePointAdaptationStrengthWithFromApplicationScenes:(id)a3 toApplicationScenes:(id)a4 fromPercentage:(double)a5 toPercentage:(double)a6 animationSettings:(id)a7 interactive:(BOOL)a8;
- (void)_updateWhitePointAdaptationStrengthWithWorkspaceTransitionRequest:(id)a3 fromPercentage:(double)a4 toPercentage:(double)a5 animationSettings:(id)a6 cancelled:(BOOL)a7 interactive:(BOOL)a8;
- (void)setWindowScene:(id)a3;
- (void)updateWhitePointAdaptationStrength;
- (void)updateWhitePointAdaptationStrengthWithAnimationSettings:(id)a3;
- (void)updateWhitePointAdaptationStrengthWithFromApplicationSceneEntities:(id)a3 toApplicationSceneEntities:(id)a4 fromPercentage:(double)a5 toPercentage:(double)a6 animationSettings:(id)a7 interactive:(BOOL)a8;
- (void)updateWhitePointAdaptationStrengthWithWorkspaceTransitionRequest:(id)a3 animationTransitionContext:(id)a4;
@end

@implementation SBSceneLayoutWhitePointAdaptationController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_15 != -1) {
    dispatch_once(&sharedInstance_onceToken_15, &__block_literal_global_135);
  }
  v2 = (void *)sharedInstance___sharedInstance_10;
  return v2;
}

- (void)updateWhitePointAdaptationStrengthWithWorkspaceTransitionRequest:(id)a3 animationTransitionContext:(id)a4
{
  id v15 = a4;
  id v6 = a3;
  uint64_t v7 = [v15 isInteractive];
  uint64_t v8 = [v15 isCancelled];
  uint64_t v9 = v8;
  if (v7)
  {
    [v15 percentComplete];
    double v11 = v10;
    double v12 = v10;
  }
  else
  {
    if (v8) {
      double v11 = 1.0;
    }
    else {
      double v11 = 0.0;
    }
    if (v8) {
      double v12 = 0.0;
    }
    else {
      double v12 = 1.0;
    }
  }
  v13 = [v15 transitionAnimationFactory];
  v14 = [v13 settings];
  [(SBSceneLayoutWhitePointAdaptationController *)self _updateWhitePointAdaptationStrengthWithWorkspaceTransitionRequest:v6 fromPercentage:v14 toPercentage:v9 animationSettings:v7 cancelled:v11 interactive:v12];
}

- (void)_updateWhitePointAdaptationStrengthWithWorkspaceTransitionRequest:(id)a3 fromPercentage:(double)a4 toPercentage:(double)a5 animationSettings:(id)a6 cancelled:(BOOL)a7 interactive:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a6;
  if (a3)
  {
    id v32 = v14;
    id v15 = [a3 applicationContext];
    v16 = v15;
    if (v15)
    {
      v17 = [v15 previousLayoutState];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v18 = [v17 unlockedEnvironmentMode];
      }
      else {
        uint64_t v18 = 0;
      }
      v21 = [v16 layoutState];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v22 = [v21 unlockedEnvironmentMode];
      }
      else {
        uint64_t v22 = 0;
      }
      if (v18 == 2)
      {
        v20 = 0;
      }
      else
      {
        v23 = [v16 previousApplicationSceneEntities];
        v20 = [(SBSceneLayoutWhitePointAdaptationController *)self _deviceSceneHandlesFromEntities:v23];
      }
      if (v22 == 2)
      {
        v19 = 0;
      }
      else
      {
        v24 = [v16 applicationSceneEntities];
        v19 = [(SBSceneLayoutWhitePointAdaptationController *)self _deviceSceneHandlesFromEntities:v24];
      }
      if (!v9) {
        goto LABEL_20;
      }
    }
    else
    {
      v19 = 0;
      v20 = 0;
      if (!v9) {
        goto LABEL_20;
      }
    }
    if (!v8)
    {
      v25 = self;
      v26 = v19;
      v27 = v20;
      double v28 = a4;
      double v29 = a5;
      id v30 = v32;
      BOOL v31 = 0;
LABEL_21:
      [(SBSceneLayoutWhitePointAdaptationController *)v25 _updateWhitePointAdaptationStrengthWithFromApplicationScenes:v26 toApplicationScenes:v27 fromPercentage:v30 toPercentage:v31 animationSettings:v28 interactive:v29];

      id v14 = v32;
      goto LABEL_22;
    }
LABEL_20:
    v25 = self;
    v26 = v20;
    v27 = v19;
    double v28 = a4;
    double v29 = a5;
    id v30 = v32;
    BOOL v31 = v8;
    goto LABEL_21;
  }
LABEL_22:
}

- (id)_deviceSceneHandlesFromEntities:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA80] set];
  if ([v3 count])
  {
    v16 = v4;
    v5 = [MEMORY[0x1E4F1CA80] set];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v12 = objc_opt_class();
          v13 = [v11 sceneHandle];
          id v14 = SBSafeCast(v12, v13);

          if (v14) {
            [v5 addObject:v14];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    v4 = [MEMORY[0x1E4F1CAD0] setWithSet:v5];
  }
  return v4;
}

- (void)_updateWhitePointAdaptationStrengthWithFromApplicationScenes:(id)a3 toApplicationScenes:(id)a4 fromPercentage:(double)a5 toPercentage:(double)a6 animationSettings:(id)a7 interactive:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  if (!v8
    || +[SBSceneLayoutWhitePointAdaptationController _isInteractiveUpdateEnabled])
  {
    v16 = SBLogCommon();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

    if (v17)
    {
      long long v18 = SBLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[SBSceneLayoutWhitePointAdaptationController updateWhitePointAdaptationStrength]();
      }

      long long v19 = SBLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[SBSceneLayoutWhitePointAdaptationController _updateWhitePointAdaptationStrengthWithFromApplicationScenes:toApplicationScenes:fromPercentage:toPercentage:animationSettings:interactive:]();
      }

      v21 = __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke(v20, v13);
      uint64_t v22 = [v21 componentsJoinedByString:@", "];
      v23 = (void *)v22;
      if (v22) {
        v24 = (__CFString *)v22;
      }
      else {
        v24 = @"NONE";
      }
      SBKeyValueLog(@"FROM APPLICATIONS", v24, 0);

      v26 = __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke_2(v25, v13);
      uint64_t v27 = [v26 componentsJoinedByString:@", "];
      double v28 = (void *)v27;
      if (v27) {
        double v29 = (__CFString *)v27;
      }
      else {
        double v29 = @"NONE";
      }
      SBKeyValueLog(@"WHITE POINT ADAPTIVITY STYLE", v29, 1);

      BOOL v31 = __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke(v30, v14);
      uint64_t v32 = [v31 componentsJoinedByString:@", "];
      v33 = (void *)v32;
      if (v32) {
        v34 = (__CFString *)v32;
      }
      else {
        v34 = @"NONE";
      }
      SBKeyValueLog(@"TO APPLICATIONS", v34, 0);

      v36 = __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke_2(v35, v14);
      uint64_t v37 = [v36 componentsJoinedByString:@", "];
      v38 = (void *)v37;
      if (v37) {
        v39 = (__CFString *)v37;
      }
      else {
        v39 = @"NONE";
      }
      SBKeyValueLog(@"WHITE POINT ADAPTIVITY STYLE", v39, 1);
    }
    uint64_t v40 = [v13 count];
    if (v40)
    {
      v41 = __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke_3(v40, v13);
    }
    else
    {
      v41 = &unk_1F3347D30;
    }
    uint64_t v42 = [v14 count];
    if (v42)
    {
      v43 = __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke_3(v42, v14);
    }
    else
    {
      v43 = &unk_1F3347D48;
    }
    v44 = SBLogCommon();
    BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG);

    if (v45)
    {
      v46 = SBLogCommon();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
        -[SBSceneLayoutWhitePointAdaptationController _updateWhitePointAdaptationStrengthWithFromApplicationScenes:toApplicationScenes:fromPercentage:toPercentage:animationSettings:interactive:]();
      }

      if (v8) {
        v47 = @"INTERACTIVE";
      }
      else {
        v47 = @"STANDARD";
      }
      SBKeyValueLog(@"TYPE", v47, 1);
      v49 = __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke_4(v48, v41);
      uint64_t v50 = [v49 componentsJoinedByString:@", "];
      v51 = (void *)v50;
      if (v50) {
        v52 = (__CFString *)v50;
      }
      else {
        v52 = @"NONE";
      }
      SBKeyValueLog(@"FROM", v52, 1);

      SBKeyDoubleValueLog(@"PERCENTAGE", 2, a5);
      v54 = __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke_4(v53, v43);
      uint64_t v55 = [v54 componentsJoinedByString:@", "];
      v56 = (void *)v55;
      if (v55) {
        v57 = (__CFString *)v55;
      }
      else {
        v57 = @"NONE";
      }
      SBKeyValueLog(@"TO", v57, 1);

      SBKeyDoubleValueLog(@"PERCENTAGE", 2, a6);
      [v15 duration];
      SBKeyDoubleValueLog(@"ANIMATION DURATION", 1, v58);
      [v15 delay];
      SBKeyDoubleValueLog(@"ANIMATION DELAY", 1, v59);
      v60 = SBLogCommon();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
        -[SBSceneLayoutWhitePointAdaptationController _updateWhitePointAdaptationStrengthWithAnimationSettings:]();
      }
    }
    v61 = +[SBHarmonyController sharedInstance];
    [v61 transitionFromWhitePointAdaptivityStyleWithStyles:v41 toWhitePointAdaptivityStyleWithStyles:v43 fromPercentage:v15 toPercentage:a5 animationSettings:a6];
  }
}

- (void)updateWhitePointAdaptationStrength
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "SBWPA =BEGIN============================================", v2, v3, v4, v5, v6);
}

- (void)_updateWhitePointAdaptationStrengthWithAnimationSettings:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  uint8_t v6 = [WeakRetained transientOverlayPresenter];
  uint64_t v7 = [v6 preferredWhitePointAdaptivityStyleValue];

  if (v7)
  {
    unint64_t v8 = [v7 integerValue];
    if (v8 > 4)
    {
      id v10 = &unk_1F3347D18;
    }
    else
    {
      uint64_t v9 = [NSNumber numberWithInteger:v8];
      v35[0] = v9;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    }
    uint64_t v12 = _UIStringFromWhitePointAdaptivityStyle();
    double v11 = (void *)v12;
    if (v12) {
      id v13 = (__CFString *)v12;
    }
    else {
      id v13 = @"NONE";
    }
    SBKeyValueLog(@"TRANSIENT OVERLAY WHITE POINT ADAPTIVITY STYLE", v13, 1);
  }
  else
  {
    double v11 = [(SBSceneLayoutWhitePointAdaptationController *)self _whitePointAdaptivityStylesForLayoutState];
    if ([v11 count]) {
      id v10 = v11;
    }
    else {
      id v10 = &unk_1F3347D18;
    }
  }

  id v14 = SBLogCommon();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);

  if (v15)
  {
    v16 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v17 = v10;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "integerValue", (void)v30);
          uint64_t v22 = _UIStringFromWhitePointAdaptivityStyle();
          v23 = (void *)v22;
          if (v22) {
            v24 = (__CFString *)v22;
          }
          else {
            v24 = @"NONE";
          }
          [v16 addObject:v24];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v19);
    }

    uint64_t v25 = [v16 componentsJoinedByString:@", "];
    SBKeyValueLog(@"SET WHITE POINT ADAPTIVITY STYLE", v25, 0);

    [v4 duration];
    SBKeyDoubleValueLog(@"ANIMATION DURATION", 1, v26);
    [v4 delay];
    SBKeyDoubleValueLog(@"ANIMATION DELAY", 1, v27);
    double v28 = SBLogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[SBSceneLayoutWhitePointAdaptationController _updateWhitePointAdaptationStrengthWithAnimationSettings:]();
    }
  }
  double v29 = +[SBHarmonyController sharedInstance];
  [v29 setWhitePointAdaptivityStyleWithStyles:v10 animationSettings:v4];
}

- (id)_whitePointAdaptivityStylesForLayoutState
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v4 = [WeakRetained switcherController];

  if ([v4 unlockedEnvironmentMode] != 2)
  {
    uint8_t v6 = [v4 layoutStatePrimaryElement];
    uint64_t v7 = [v4 layoutStateSideElement];
    unint64_t v8 = [(SBSceneLayoutWhitePointAdaptationController *)self _whitePointAdaptivityStyleForLayoutElement:v6];
    unint64_t v9 = [(SBSceneLayoutWhitePointAdaptationController *)self _whitePointAdaptivityStyleForLayoutElement:v7];
    unint64_t v10 = v9;
    if (v8 > 4)
    {
      if (v9 > 4)
      {
        uint64_t v5 = 0;
        goto LABEL_12;
      }
      uint64_t v12 = [NSNumber numberWithInteger:v9];
      double v29 = v12;
      id v14 = (void *)MEMORY[0x1E4F1C978];
      BOOL v15 = (uint64_t *)&v29;
    }
    else
    {
      uint64_t v11 = [NSNumber numberWithInteger:v8];
      uint64_t v12 = (void *)v11;
      if (v10 <= 4)
      {
        v31[0] = v11;
        id v13 = [NSNumber numberWithInteger:v10];
        v31[1] = v13;
        uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];

LABEL_10:
LABEL_12:
        uint64_t v16 = [v6 uniqueIdentifier];
        id v17 = (void *)v16;
        if (v16) {
          uint64_t v18 = (__CFString *)v16;
        }
        else {
          uint64_t v18 = @"NONE";
        }
        SBKeyValueLog(@"PRIMARY LAYOUT ELEMENT", v18, 0);

        uint64_t v19 = _UIStringFromWhitePointAdaptivityStyle();
        uint64_t v20 = (void *)v19;
        if (v19) {
          v21 = (__CFString *)v19;
        }
        else {
          v21 = @"NONE";
        }
        SBKeyValueLog(@"WHITE POINT ADAPTIVITY STYLE", v21, 1);

        uint64_t v22 = [v7 uniqueIdentifier];
        v23 = (void *)v22;
        if (v22) {
          v24 = (__CFString *)v22;
        }
        else {
          v24 = @"NONE";
        }
        SBKeyValueLog(@"SIDE LAYOUT ELEMENT", v24, 0);

        uint64_t v25 = _UIStringFromWhitePointAdaptivityStyle();
        double v26 = (void *)v25;
        if (v25) {
          double v27 = (__CFString *)v25;
        }
        else {
          double v27 = @"NONE";
        }
        SBKeyValueLog(@"WHITE POINT ADAPTIVITY STYLE", v27, 1);

        goto LABEL_25;
      }
      uint64_t v30 = v11;
      id v14 = (void *)MEMORY[0x1E4F1C978];
      BOOL v15 = &v30;
    }
    uint64_t v5 = [v14 arrayWithObjects:v15 count:1];
    goto LABEL_10;
  }
  uint64_t v5 = 0;
LABEL_25:

  return v5;
}

- (int64_t)_whitePointAdaptivityStyleForLayoutElement:(id)a3
{
  int64_t v3 = -1;
  if (a3)
  {
    id v4 = [(SBSceneLayoutWhitePointAdaptationController *)self _applicationSceneHandleForLayoutElement:"_applicationSceneHandleForLayoutElement:"];
    uint64_t v5 = v4;
    if (v4) {
      int64_t v3 = [v4 whitePointAdaptivityStyle];
    }
  }
  return v3;
}

+ (id)_harmonySettings
{
  uint64_t v2 = +[SBHarmonyController sharedInstance];
  int64_t v3 = [v2 harmonySettings];

  return v3;
}

+ (id)_defaultAnimationSettings
{
  uint64_t v2 = (void *)MEMORY[0x1E4F4F680];
  [a1 _defaultAnimationDuration];
  return (id)objc_msgSend(v2, "settingsWithDuration:");
}

+ (double)_defaultAnimationDuration
{
  uint64_t v2 = [a1 _harmonySettings];
  [v2 whitePointAdaptationUpdateDefaultDuration];
  double v4 = v3;

  return v4;
}

id __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  float v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "whitePointAdaptivityStyle", (void)v12));
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  return v10;
}

- (id)_applicationSceneHandleForLayoutElement:(id)a3
{
  if (a3)
  {
    float v3 = [a3 workspaceEntity];
    id v4 = [v3 deviceApplicationSceneEntity];
    uint64_t v5 = [v4 sceneHandle];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

void __61__SBSceneLayoutWhitePointAdaptationController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBSceneLayoutWhitePointAdaptationController);
  uint64_t v1 = (void *)sharedInstance___sharedInstance_10;
  sharedInstance___sharedInstance_10 = (uint64_t)v0;
}

- (SBSceneLayoutWhitePointAdaptationController)init
{
  float v3 = +[SBHarmonyController sharedInstance];
  int v4 = [v3 supportsWhitePointAdaptation];

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBSceneLayoutWhitePointAdaptationController;
    self = [(SBSceneLayoutWhitePointAdaptationController *)&v7 init];
    uint64_t v5 = self;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)updateWhitePointAdaptationStrengthWithAnimationSettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SBLogCommon();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    objc_super v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[SBSceneLayoutWhitePointAdaptationController updateWhitePointAdaptationStrength]();
    }

    unint64_t v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[SBSceneLayoutWhitePointAdaptationController updateWhitePointAdaptationStrengthWithAnimationSettings:]();
    }
  }
  if (v4)
  {
    [(SBSceneLayoutWhitePointAdaptationController *)self _updateWhitePointAdaptationStrengthWithAnimationSettings:v4];
  }
  else
  {
    unint64_t v9 = +[SBSceneLayoutWhitePointAdaptationController _defaultAnimationSettings];
    [(SBSceneLayoutWhitePointAdaptationController *)self _updateWhitePointAdaptationStrengthWithAnimationSettings:v9];
  }
}

- (void)updateWhitePointAdaptationStrengthWithFromApplicationSceneEntities:(id)a3 toApplicationSceneEntities:(id)a4 fromPercentage:(double)a5 toPercentage:(double)a6 animationSettings:(id)a7 interactive:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a7;
  id v15 = a4;
  id v17 = [(SBSceneLayoutWhitePointAdaptationController *)self _deviceSceneHandlesFromEntities:a3];
  uint64_t v16 = [(SBSceneLayoutWhitePointAdaptationController *)self _deviceSceneHandlesFromEntities:v15];

  [(SBSceneLayoutWhitePointAdaptationController *)self _updateWhitePointAdaptationStrengthWithFromApplicationScenes:v17 toApplicationScenes:v16 fromPercentage:v14 toPercentage:v8 animationSettings:a5 interactive:a6];
}

id __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 count])
  {
    float v3 = [MEMORY[0x1E4F1CA48] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          unint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "sceneIdentifier", (void)v12);
          [v3 addObject:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

id __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 count])
  {
    float v3 = [MEMORY[0x1E4F1CA48] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "whitePointAdaptivityStyle", (void)v12);
          unint64_t v9 = _UIStringFromWhitePointAdaptivityStyle();
          [v3 addObject:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

id __186__SBSceneLayoutWhitePointAdaptationController__updateWhitePointAdaptationStrengthWithFromApplicationScenes_toApplicationScenes_fromPercentage_toPercentage_animationSettings_interactive___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 count])
  {
    float v3 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "integerValue", (void)v14);
          uint64_t v9 = _UIStringFromWhitePointAdaptivityStyle();
          unint64_t v10 = (void *)v9;
          if (v9) {
            uint64_t v11 = (__CFString *)v9;
          }
          else {
            uint64_t v11 = @"NONE";
          }
          [v3 addObject:v11];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    long long v12 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

+ (BOOL)_isInteractiveUpdateEnabled
{
  id v2 = [a1 _harmonySettings];
  char v3 = [v2 whitePointAdaptationInteractiveUpdateEnabled];

  return v3;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)updateWhitePointAdaptationStrengthWithAnimationSettings:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "SBWPA UPDATE WHITE POINT ADAPTATION STRENGTH WITH ANIMATION SETTINGS", v2, v3, v4, v5, v6);
}

- (void)_updateWhitePointAdaptationStrengthWithAnimationSettings:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "SBWPA =END==============================================", v2, v3, v4, v5, v6);
}

- (void)_updateWhitePointAdaptationStrengthWithFromApplicationScenes:toApplicationScenes:fromPercentage:toPercentage:animationSettings:interactive:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "SBWPA TRANSITION WHITE POINT ADAPTIVITY STYLE", v2, v3, v4, v5, v6);
}

- (void)_updateWhitePointAdaptationStrengthWithFromApplicationScenes:toApplicationScenes:fromPercentage:toPercentage:animationSettings:interactive:.cold.3()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "SBWPA UPDATE WHITE POINT ADAPTATION STRENGTH FOR APPLICATION TRANSITION", v2, v3, v4, v5, v6);
}

@end