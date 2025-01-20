@interface UIWindowScene(PRScene)
- (void)pr_updatePreferences:()PRScene withTransition:;
@end

@implementation UIWindowScene(PRScene)

- (void)pr_updatePreferences:()PRScene withTransition:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _FBSScene];
  if (v8)
  {
    v9 = (void *)v8;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__UIWindowScene_PRScene__pr_updatePreferences_withTransition___block_invoke;
    v13[3] = &unk_1E54DC7A8;
    id v14 = v6;
    id v15 = v7;
    v16 = a1;
    id v10 = v7;
    id v11 = v6;
    objc_msgSend(v9, "pr_performUpdate:", v13);
  }
  else
  {
    v12 = [NSString stringWithFormat:@"no FBSScene"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[UIWindowScene(PRScene) pr_updatePreferences:withTransition:]();
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)pr_updatePreferences:()PRScene withTransition:.cold.1()
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