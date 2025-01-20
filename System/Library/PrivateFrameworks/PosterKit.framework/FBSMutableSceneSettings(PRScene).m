@interface FBSMutableSceneSettings(PRScene)
- (void)pr_setAlternateDateEnabled:()PRScene;
- (void)pr_setCaseColor:()PRScene;
- (void)pr_setDepthEffectDisallowed:()PRScene;
- (void)pr_setHorizontalTitleBoundingRect:()PRScene;
- (void)pr_setParallaxDisallowed:()PRScene;
- (void)pr_setParallaxEnabled:()PRScene;
- (void)pr_setPosterAmbientConfiguration:()PRScene;
- (void)pr_setPosterConfigurableOptions:()PRScene;
- (void)pr_setPosterConfiguredProperties:()PRScene;
- (void)pr_setPosterTitleStyleConfiguration:()PRScene;
- (void)pr_setVerticalTitleBoundingRect:()PRScene;
@end

@implementation FBSMutableSceneSettings(PRScene)

- (void)pr_setDepthEffectDisallowed:()PRScene
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:20567];
}

- (void)pr_setCaseColor:()PRScene
{
  id v6 = a3;
  if (v6 && (NSClassFromString(&cfstr_Bscolor.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSColorClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneSettings(PRScene) pr_setCaseColor:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    v4 = [a1 otherSettings];
    [v4 setObject:v6 forSetting:20562];
  }
}

- (void)pr_setPosterConfigurableOptions:()PRScene
{
  id v6 = a3;
  if (v6 && (NSClassFromString(&cfstr_Prposterconfig_3.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfigurableOptionsClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneSettings(PRScene) pr_setPosterConfigurableOptions:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    v4 = [a1 otherSettings];
    [v4 setObject:v6 forSetting:20563];
  }
}

- (void)pr_setPosterConfiguredProperties:()PRScene
{
  id v19 = a3;
  if (!v19)
  {
    v4 = 0;
    goto LABEL_5;
  }
  NSClassFromString(&cfstr_Prposterconfig_0.isa);
  if (objc_opt_isKindOfClass())
  {

    v4 = +[PRPosterConfiguredProperties configuredPropertiesSanitizedForPassingToExtension:v19];
LABEL_5:
    v5 = [a1 otherSettings];
    [v5 setObject:v4 forSetting:20564];

    id v6 = [a1 transientLocalSettings];
    [v6 setObject:v19 forSetting:20564];

    v7 = [v19 complicationLayout];
    v8 = [v19 renderingConfiguration];
    v9 = [v7 complications];
    uint64_t v10 = [v9 count];

    v11 = [v7 sidebarComplications];
    uint64_t v12 = [v11 count];

    v13 = [v7 inlineComplication];

    if (v8)
    {
      v14 = [v19 titleStyleConfiguration];
      int v15 = [v14 prefersVerticalTitleLayout];

      objc_msgSend(a1, "pr_setDepthEffectDisallowed:", objc_msgSend(v8, "isDepthEffectDisabled") | v15);
      objc_msgSend(a1, "pr_setParallaxEnabled:", objc_msgSend(v8, "isParallaxEnabled"));
    }
    v16 = [v19 titleStyleConfiguration];
    uint64_t v17 = [v16 isAlternateDateEnabled];

    objc_msgSend(a1, "pr_setAlternateDateEnabled:", v17);
    objc_msgSend(a1, "pui_setInlineComplicationConfigured:", v13 != 0);
    objc_msgSend(a1, "pui_setComplicationRowConfigured:", v10 != 0);
    objc_msgSend(a1, "pui_setComplicationSidebarConfigured:", v12 != 0);
    objc_msgSend(a1, "pr_setParallaxDisallowed:", 1);

    return;
  }
  v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfiguredPropertiesClass]"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[FBSMutableSceneSettings(PRScene) pr_setPosterConfiguredProperties:]();
  }
  [v18 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)pr_setPosterTitleStyleConfiguration:()PRScene
{
  id v4 = a3;
  id v5 = [a1 otherSettings];
  [v5 setObject:v4 forSetting:20565];
}

- (void)pr_setPosterAmbientConfiguration:()PRScene
{
  id v4 = a3;
  id v5 = [a1 otherSettings];
  [v5 setObject:v4 forSetting:20566];
}

- (void)pr_setParallaxEnabled:()PRScene
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagIfYes() forSetting:20568];
}

- (void)pr_setParallaxDisallowed:()PRScene
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagIfYes() forSetting:20569];
}

- (void)pr_setAlternateDateEnabled:()PRScene
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:20763];
}

- (void)pr_setHorizontalTitleBoundingRect:()PRScene
{
  v9 = [a1 otherSettings];
  *(double *)v11 = a2;
  *(double *)&v11[1] = a3;
  *(double *)&v11[2] = a4;
  *(double *)&v11[3] = a5;
  uint64_t v10 = [MEMORY[0x1E4F29238] valueWithBytes:v11 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [v9 setObject:v10 forSetting:20572];
}

- (void)pr_setVerticalTitleBoundingRect:()PRScene
{
  v9 = [a1 otherSettings];
  *(double *)v11 = a2;
  *(double *)&v11[1] = a3;
  *(double *)&v11[2] = a4;
  *(double *)&v11[3] = a5;
  uint64_t v10 = [MEMORY[0x1E4F29238] valueWithBytes:v11 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [v9 setObject:v10 forSetting:20573];
}

- (void)pr_setCaseColor:()PRScene .cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)pr_setPosterConfigurableOptions:()PRScene .cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)pr_setPosterConfiguredProperties:()PRScene .cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end