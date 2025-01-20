@interface SBAccessibilityUIServerUISceneController
+ (id)_setupInfo;
+ (id)_setupInfoForSceneSpecification:(id)a3;
- (SBSystemUISceneDefaultPresenter)activeWindowScenePresenter;
- (void)_activeSceneControllersAfterRemoving:(id)a3;
- (void)_evaluateAvailablePresenters:(id)a3 forSceneControllers:(id)a4;
- (void)_invalidateAllSceneControllers;
- (void)_invalidateSceneControllersForWindowScene:(id)a3;
- (void)setActiveWindowScenePresenter:(id)a3;
- (void)windowSceneDidDisconnect:(id)a3;
@end

@implementation SBAccessibilityUIServerUISceneController

+ (id)_setupInfo
{
  v6[8] = *MEMORY[0x1E4F143B8];
  v5[0] = @"class";
  v6[0] = objc_opt_class();
  v5[1] = @"enabled";
  v2 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  v6[1] = v2;
  v6[2] = MEMORY[0x1E4F1CC38];
  v5[2] = @"isDaemon";
  v5[3] = @"jobLabel";
  v6[3] = @"com.apple.AccessibilityUIServer";
  v6[4] = &unk_1F3348A88;
  v5[4] = @"hostLevel";
  v5[5] = @"traitsRole";
  v6[5] = @"SBTraitsParticipantRoleAXUIServer";
  v6[6] = &unk_1F3348FD8;
  v5[6] = @"vendingStrategy";
  v5[7] = @"workspaceID";
  v6[7] = @"com.apple.SpringBoard.SceneWorkspace.AccessibilityUIServerUI";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:8];

  return v3;
}

+ (id)_setupInfoForSceneSpecification:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() _setupInfo];
  v5 = (void *)[v4 mutableCopy];

  v6 = [v3 uiSceneSessionRole];

  v7 = SBLogSystemUIScene();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[SBAccessibilityUIServerUISceneController _setupInfoForSceneSpecification:]();
  }

  if ([v6 isEqualToString:*MEMORY[0x1E4FA7E80]])
  {
    [v5 setObject:&unk_1F3348FF0 forKey:@"presentationStyle"];
    v8 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43CF8] + 30.0 + -1.0];
    [v5 setObject:v8 forKey:@"hostLevel"];
  }
  return v5;
}

- (void)_evaluateAvailablePresenters:(id)a3 forSceneControllers:(id)a4
{
  SEL v29 = a2;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v37.receiver = self;
  v37.super_class = (Class)SBAccessibilityUIServerUISceneController;
  [(SBSystemUISceneController *)&v37 _evaluateAvailablePresenters:a3 forSceneControllers:v6];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v32 = *(void *)v34;
    id v31 = v7;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v32) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "sceneOptions", v29);
        v13 = [v12 specification];
        v14 = [(id)objc_opt_class() _setupInfoForSceneSpecification:v13];
        v15 = [v14 objectForKey:@"presentationStyle"];
        uint64_t v16 = [v15 integerValue];

        if (v16 == 2)
        {
          v17 = SBLogSystemUIScene();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            v27 = [(SBAccessibilityUIServerUISceneController *)self activeWindowScenePresenter];
            *(_DWORD *)buf = 138543618;
            v39 = v27;
            __int16 v40 = 2114;
            v41 = v11;
            _os_log_debug_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEBUG, "AXUIServer activeWindowScenePresenter: %{public}@ for sceneController: %{public}@", buf, 0x16u);
          }
          v18 = [(SBAccessibilityUIServerUISceneController *)self activeWindowScenePresenter];

          if (!v18)
          {
            v19 = [(id)SBApp windowSceneManager];
            v20 = [v19 activeDisplayWindowScene];

            v21 = [[SBSystemUISceneDefaultPresenter alloc] initWithWindowHostingPresentationOnWindowScene:v20];
            [(SBAccessibilityUIServerUISceneController *)self setActiveWindowScenePresenter:v21];

            v22 = [v14 objectForKey:@"hostLevel"];
            v23 = [(SBAccessibilityUIServerUISceneController *)self activeWindowScenePresenter];
            [v23 setPreferredWindowLevel:v22];

            v24 = SBLogSystemUIScene();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              v30 = [(SBAccessibilityUIServerUISceneController *)self activeWindowScenePresenter];
              *(_DWORD *)buf = 138543618;
              v39 = v30;
              __int16 v40 = 2114;
              v41 = v11;
              _os_log_debug_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEBUG, "AXUIServer Created activeWindowScenePresenter: %{public}@ for sceneController: %{public}@", buf, 0x16u);
            }
            id v7 = v31;
          }
          v25 = [(SBAccessibilityUIServerUISceneController *)self activeWindowScenePresenter];

          if (!v25)
          {
            v28 = [MEMORY[0x1E4F28B00] currentHandler];
            [v28 handleFailureInMethod:v29, self, @"SBAccessibilityDaemonUISceneControllers.m", 156, @"AXUIServer client needs to set ActiveWindowScene for scene controller, but it's nil" object file lineNumber description];
          }
          v26 = [(SBAccessibilityUIServerUISceneController *)self activeWindowScenePresenter];
          [v11 setPresenter:v26];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v9);
  }
}

- (void)_activeSceneControllersAfterRemoving:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogSystemUIScene();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(SBAccessibilityUIServerUISceneController *)self _activeSceneControllersAfterRemoving:v5];
  }

  id v6 = [(SBAccessibilityUIServerUISceneController *)self activeWindowScenePresenter];

  if (v6)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v18 = v4;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      uint64_t v11 = *MEMORY[0x1E4FA7E80];
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          v13 = [*(id *)(*((void *)&v19 + 1) + 8 * v12) sceneOptions];
          v14 = [v13 specification];
          v15 = [v14 uiSceneSessionRole];
          if ([v15 isEqualToString:v11])
          {
            v17 = SBLogSystemUIScene();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              -[SBAccessibilityUIServerUISceneController _activeSceneControllersAfterRemoving:]();
            }

            goto LABEL_18;
          }

          ++v12;
        }
        while (v9 != v12);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t v16 = SBLogSystemUIScene();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[SBAccessibilityUIServerUISceneController _activeSceneControllersAfterRemoving:](self);
    }

    [(SBAccessibilityUIServerUISceneController *)self setActiveWindowScenePresenter:0];
LABEL_18:
    id v4 = v18;
  }
}

- (void)windowSceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBAccessibilityUIServerUISceneController;
  [(SBSystemUISceneController *)&v10 windowSceneDidDisconnect:v4];
  v5 = SBLogSystemUIScene();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBAccessibilityUIServerUISceneController windowSceneDidDisconnect:]();
  }

  id v6 = [(SBAccessibilityUIServerUISceneController *)self activeWindowScenePresenter];
  id v7 = [v6 targetWindowScene];
  int v8 = [v7 isEqual:v4];

  if (v8)
  {
    uint64_t v9 = SBLogSystemUIScene();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SBAccessibilityUIServerUISceneController _activeSceneControllersAfterRemoving:](self);
    }

    [(SBAccessibilityUIServerUISceneController *)self setActiveWindowScenePresenter:0];
  }
}

- (void)_invalidateSceneControllersForWindowScene:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBAccessibilityUIServerUISceneController;
  [(SBSystemUISceneController *)&v10 _invalidateSceneControllersForWindowScene:v4];
  v5 = SBLogSystemUIScene();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBAccessibilityUIServerUISceneController _invalidateSceneControllersForWindowScene:]();
  }

  id v6 = [(SBAccessibilityUIServerUISceneController *)self activeWindowScenePresenter];
  id v7 = [v6 targetWindowScene];
  int v8 = [v7 isEqual:v4];

  if (v8)
  {
    uint64_t v9 = SBLogSystemUIScene();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SBAccessibilityUIServerUISceneController _activeSceneControllersAfterRemoving:](self);
    }

    [(SBAccessibilityUIServerUISceneController *)self setActiveWindowScenePresenter:0];
  }
}

- (void)_invalidateAllSceneControllers
{
  v1 = [a1 activeWindowScenePresenter];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "AXUIServer _invalidateAllSceneControllers Cleanup activeWindowScenePresenter: %{public}@", v4, v5, v6, v7, v8);
}

- (SBSystemUISceneDefaultPresenter)activeWindowScenePresenter
{
  return self->_activeWindowScenePresenter;
}

- (void)setActiveWindowScenePresenter:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)_setupInfoForSceneSpecification:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "AXUIServer sessionRole: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_activeSceneControllersAfterRemoving:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 activeWindowScenePresenter];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "AXUIServer Cleanup activeWindowScenePresenter: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_activeSceneControllersAfterRemoving:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1D85BA000, v1, OS_LOG_TYPE_DEBUG, "AXUIServer sessionRole: %{public}@ Active sceneController: %{public}@", v2, 0x16u);
}

- (void)_activeSceneControllersAfterRemoving:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 activeWindowScenePresenter];
  OUTLINED_FUNCTION_1_0();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "AXUIServer activeWindowScenePresenter %{public}@ _activeSceneControllersAfterRemoving %@{public}", v6, 0x16u);
}

- (void)windowSceneDidDisconnect:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "AXUIServer windowSceneDidDisconnect: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_invalidateSceneControllersForWindowScene:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "AXUIServer _invalidateSceneControllersForWindowScene: %{public}@", v2, v3, v4, v5, v6);
}

@end