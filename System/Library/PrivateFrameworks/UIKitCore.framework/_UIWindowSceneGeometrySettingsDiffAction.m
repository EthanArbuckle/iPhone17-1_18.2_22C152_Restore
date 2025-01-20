@interface _UIWindowSceneGeometrySettingsDiffAction
- (UIApplicationSceneSettingsDiffInspector)sceneSettingsGeometryMutationDiffInspector;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)_updateSceneGeometryWithSettingObserverContext:(id)a3 windowScene:(id)a4 transitionContext:(id)a5;
- (void)setSceneSettingsGeometryMutationDiffInspector:(id)a3;
@end

@implementation _UIWindowSceneGeometrySettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  id v16 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v50 = [MEMORY[0x1E4F28B00] currentHandler];
    [v50 handleFailureInMethod:a2, self, @"_UIWindowSceneGeometrySettingsDiffAction.m", 75, @"Invalid parameter not satisfying: %@", @"[uiScene isKindOfClass:[UIWindowScene class]]" object file lineNumber description];
  }
  id v17 = v13;
  unsigned __int8 v52 = 0;
  v18 = [(_UIWindowSceneGeometrySettingsDiffAction *)self sceneSettingsGeometryMutationDiffInspector];
  [v18 inspectDiff:v16 withContext:&v52];

  unsigned __int8 v19 = v52;
  if ((v52 & 4) != 0)
  {
    v20 = [v14 otherSettings];
    v21 = [v20 objectForSetting:35];
    uint64_t v22 = [v21 unsignedIntegerValue];

    v23 = [v17 _effectiveUISettings];
    uint64_t v24 = [v23 interfaceOrientationMode];

    if (v22 && v22 != v24 && (v22 == 100 || v24 == 100 || !v24))
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      v26 = objc_msgSend(NSString, "stringWithUTF8String:", "void _UIAssertIsValidOrientationModeChange(UIApplicationSceneInterfaceOrientationMode, UIApplicationSceneInterfaceOrientationMode)");
      UIApplicationSceneStringForInterfaceOrientationMode(v22);
      v28 = id v27 = v14;
      v29 = UIApplicationSceneStringForInterfaceOrientationMode(v24);
      [v25 handleFailureInFunction:v26, @"_UIWindowSceneGeometrySettingsDiffAction.m", 40, @"Unsupported change of scene orientation mode %@ -> %@", v28, v29 file lineNumber description];

      id v14 = v27;
    }
    v30 = *(id *)(__UILogGetCategoryCachedImpl("Orientation", &_MergedGlobals_981) + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v51 = v14;
      id v31 = v17;
      if (v31)
      {
        v32 = NSString;
        v33 = (objc_class *)objc_opt_class();
        v34 = NSStringFromClass(v33);
        v35 = [v32 stringWithFormat:@"<%@: %p>", v34, v31];
      }
      else
      {
        v35 = @"(nil)";
      }

      v36 = v35;
      v37 = [v31 _persistenceIdentifier];
      v38 = UIApplicationSceneStringForInterfaceOrientationMode(v22);
      v39 = UIApplicationSceneStringForInterfaceOrientationMode(v24);
      *(_DWORD *)buf = 138544130;
      v54 = v35;
      __int16 v55 = 2114;
      v56 = v37;
      __int16 v57 = 2114;
      v58 = v38;
      __int16 v59 = 2114;
      v60 = v39;
      _os_log_impl(&dword_1853B0000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ (%{public}@) Scene did update orientation mode: %{public}@ -> %{public}@", buf, 0x2Au);

      id v14 = v51;
    }

    unsigned __int8 v19 = v52;
  }
  if ((v19 & 2) != 0)
  {
    if (-[UIScene _systemShellOwnsInterfaceOrientation](v17))
    {
      v40 = [v17 _effectiveUISettings];
      uint64_t v41 = [v40 interfaceOrientation];

      if (!v41)
      {
        v42 = *(id *)(__UILogGetCategoryCachedImpl("Orientation", &qword_1EB25F440) + 8);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        {
          id v43 = v17;
          if (v43)
          {
            v44 = NSString;
            v45 = (objc_class *)objc_opt_class();
            v46 = NSStringFromClass(v45);
            v47 = [v44 stringWithFormat:@"<%@: %p>", v46, v43];
          }
          else
          {
            v47 = @"(nil)";
          }

          v48 = v47;
          v49 = [v43 _persistenceIdentifier];
          *(_DWORD *)buf = 138543618;
          v54 = v47;
          __int16 v55 = 2114;
          v56 = v49;
          _os_log_impl(&dword_1853B0000, v42, OS_LOG_TYPE_FAULT, "%{public}@ (%{public}@) The scene is being updated with an unknown interface orientation!", buf, 0x16u);
        }
      }
    }
  }
  [(_UIWindowSceneGeometrySettingsDiffAction *)self _updateSceneGeometryWithSettingObserverContext:v52 windowScene:v17 transitionContext:v15];
  [v17 _completeGeometryUpdatesWithTransitionContext:v15];
}

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsGeometryMutationDiffInspector
{
  sceneSettingsGeometryMutationDiffInspector = self->_sceneSettingsGeometryMutationDiffInspector;
  if (!sceneSettingsGeometryMutationDiffInspector)
  {
    v4 = (UIApplicationSceneSettingsDiffInspector *)objc_opt_new();
    v5 = self->_sceneSettingsGeometryMutationDiffInspector;
    self->_sceneSettingsGeometryMutationDiffInspector = v4;

    [(FBSSceneSettingsDiffInspector *)self->_sceneSettingsGeometryMutationDiffInspector observeFrameWithBlock:&__block_literal_global_88];
    [(FBSSceneSettingsDiffInspector *)self->_sceneSettingsGeometryMutationDiffInspector observeInterfaceOrientationWithBlock:&__block_literal_global_2_3];
    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsGeometryMutationDiffInspector observeInterfaceOrientationModeWithBlock:&__block_literal_global_4_1];
    [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsGeometryMutationDiffInspector observeInterfaceOrientationMapResolverWithBlock:&__block_literal_global_6_2];
    sceneSettingsGeometryMutationDiffInspector = self->_sceneSettingsGeometryMutationDiffInspector;
  }
  return sceneSettingsGeometryMutationDiffInspector;
}

- (void)_updateSceneGeometryWithSettingObserverContext:(id)a3 windowScene:(id)a4 transitionContext:(id)a5
{
  char v6 = (char)a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  char v7 = (char)a3;
  id v8 = a4;
  id v9 = a5;
  if (_os_feature_enabled_impl())
  {
    v10 = [v8 _effectiveUISettings];
    if ([v10 inLiveResize])
    {
      v11 = [v9 animationSettings];

      if (v11) {
        goto LABEL_4;
      }
      v10 = [MEMORY[0x1E4F4F840] settingsWithMass:3.0 stiffness:1000.0 damping:500.0];
      [v9 setAnimationSettings:v10];
    }

    if ((v7 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_8;
  }
LABEL_4:
  if ((v7 & 8) == 0)
  {
LABEL_5:
    LOBYTE(v12) = 0;
    BOOL v13 = (v6 & 1) == 0;
    BOOL v14 = (v7 & 2) == 0;
    goto LABEL_12;
  }
LABEL_8:
  int v12 = [v8 _canDynamicallySpecifySupportedInterfaceOrientations];
  BOOL v13 = (v6 & 1) == 0;
  BOOL v14 = (v7 & 2) == 0;
  if (!v12 || (v6 & 1) != 0 || (v7 & 2) != 0)
  {
LABEL_12:
    BOOL v15 = 0;
    if ((v12 & 1) == 0 && v13 && v14 && (v7 & 4) == 0) {
      goto LABEL_25;
    }
    goto LABEL_16;
  }
  BOOL v15 = (v7 & 4) == 0;
  LOBYTE(v14) = 1;
LABEL_16:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __121___UIWindowSceneGeometrySettingsDiffAction__updateSceneGeometryWithSettingObserverContext_windowScene_transitionContext___block_invoke;
  aBlock[3] = &unk_1E52DF270;
  BOOL v33 = v15;
  id v16 = v8;
  id v31 = v16;
  id v17 = v9;
  id v32 = v17;
  v18 = _Block_copy(aBlock);
  if (v14)
  {
    _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v17, v18, 0);
  }
  else
  {
    unsigned __int8 v19 = *(id *)(__UILogGetCategoryCachedImpl("Orientation", _updateSceneGeometryWithSettingObserverContext_windowScene_transitionContext____s_category)+ 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v16;
      if (v20)
      {
        v21 = NSString;
        uint64_t v22 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v22);
        uint64_t v24 = [v21 stringWithFormat:@"<%@: %p>", v23, v20];
      }
      else
      {
        uint64_t v24 = @"(nil)";
      }

      v25 = v24;
      v26 = [v20 _persistenceIdentifier];
      [v20 interfaceOrientation];
      id v27 = BSInterfaceOrientationDescription();
      *(_DWORD *)buf = 138543874;
      v35 = v24;
      __int16 v36 = 2114;
      v37 = v26;
      __int16 v38 = 2114;
      v39 = v27;
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ (%{public}@) Scene will change interface orientation: %{public}@", buf, 0x20u);
    }
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __121___UIWindowSceneGeometrySettingsDiffAction__updateSceneGeometryWithSettingObserverContext_windowScene_transitionContext___block_invoke_23;
    v28[3] = &unk_1E52DC3A0;
    id v29 = v16;
    _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v17, v18, v28);
  }
LABEL_25:
}

- (void)setSceneSettingsGeometryMutationDiffInspector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end