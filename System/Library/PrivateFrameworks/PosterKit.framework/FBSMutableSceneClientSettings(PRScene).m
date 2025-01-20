@interface FBSMutableSceneClientSettings(PRScene)
- (void)pr_setDepthEffectDisabled:()PRScene;
- (void)pr_setParallaxEnabled:()PRScene;
- (void)pr_setStatusBarTintColor:()PRScene;
- (void)pr_setTimeDescriptor:()PRScene;
- (void)pr_setVibrancyConfiguration:()PRScene;
@end

@implementation FBSMutableSceneClientSettings(PRScene)

- (void)pr_setTimeDescriptor:()PRScene
{
  id v6 = a3;
  if (v6 && (NSClassFromString(&cfstr_Prtimedescript.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRTimeDescriptorClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneClientSettings(PRScene) pr_setTimeDescriptor:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    v4 = [a1 otherSettings];
    [v4 setObject:v6 forSetting:20612];
  }
}

- (void)pr_setStatusBarTintColor:()PRScene
{
  id v6 = a3;
  if (v6 && (NSClassFromString(&cfstr_Bscolor.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSColorClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneClientSettings(PRScene) pr_setStatusBarTintColor:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    v4 = [a1 otherSettings];
    [v4 setObject:v6 forSetting:20613];
  }
}

- (void)pr_setDepthEffectDisabled:()PRScene
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:20614];
}

- (void)pr_setParallaxEnabled:()PRScene
{
  id v1 = [a1 otherSettings];
  [v1 setFlag:BSSettingFlagForBool() forSetting:20615];
}

- (void)pr_setVibrancyConfiguration:()PRScene
{
  id v4 = a3;
  id v5 = [a1 otherSettings];
  [v5 setObject:v4 forSetting:20616];
}

- (void)pr_setTimeDescriptor:()PRScene .cold.1()
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

- (void)pr_setStatusBarTintColor:()PRScene .cold.1()
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