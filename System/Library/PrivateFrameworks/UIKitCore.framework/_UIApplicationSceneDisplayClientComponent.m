@interface _UIApplicationSceneDisplayClientComponent
- (UIEdgeInsets)displayBasedSafeAreaInsets;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
@end

@implementation _UIApplicationSceneDisplayClientComponent

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = +[UIScene _sceneForFBSScene:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v5 settingsDiff];
    if ([v7 containsProperty:sel_displayBasedSafeAreaInsetsValue])
    {

LABEL_7:
      id v11 = v6;
      v12 = [v5 transitionContext];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __69___UIApplicationSceneDisplayClientComponent_scene_didUpdateSettings___block_invoke;
      v14[3] = &unk_1E52DC3A0;
      id v15 = v11;
      id v13 = v11;
      _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v12, v14, 0);

      goto LABEL_8;
    }
    v9 = [v5 settingsDiff];
    int v10 = [v9 containsProperty:sel_interfaceOrientation];

    if (v10) {
      goto LABEL_7;
    }
  }
  else
  {
    v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Accessibility", &scene_didUpdateSettings____s_category) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Unexpected scene for display client component: %@", buf, 0xCu);
    }
  }
LABEL_8:
}

- (UIEdgeInsets)displayBasedSafeAreaInsets
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(FBSSceneComponent *)self clientScene];
  v4 = [v3 settings];
  id v5 = [v4 displayBasedSafeAreaInsetsValue];

  if (v5)
  {
    [v5 UIEdgeInsetsValue];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    v14 = [(FBSSceneComponent *)self clientScene];
    id v15 = [v14 settings];

    if ([v15 isUISubclass])
    {
      [v15 safeAreaInsetsPortrait];
      double v7 = v16;
      double v9 = v17;
      double v11 = v18;
      double v13 = v19;
    }
    else
    {
      v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Accessibility", &displayBasedSafeAreaInsets___s_category) + 8);
      double v13 = 0.0;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        int v25 = 138412290;
        v26 = v15;
        _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_FAULT, "Unexpected settings for display client component: %@", (uint8_t *)&v25, 0xCu);
      }
      double v11 = 0.0;
      double v9 = 0.0;
      double v7 = 0.0;
    }
  }
  double v21 = v7;
  double v22 = v9;
  double v23 = v11;
  double v24 = v13;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

@end