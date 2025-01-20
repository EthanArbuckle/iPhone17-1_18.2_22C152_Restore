@interface _UIWindowHostingSceneSystemReferenceAngleDiffAction
- (UIApplicationSceneSettingsDiffInspector)diffInspector;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)setDiffInspector:(id)a3;
@end

@implementation _UIWindowHostingSceneSystemReferenceAngleDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  id v14 = a5;
  if (([v12 _hostsWindows] & 1) == 0)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"_UIWindowHostingSceneSystemReferenceAngleDiffAction.m", 49, @"Invalid parameter not satisfying: %@", @"[uiScene _hostsWindows]" object file lineNumber description];
  }
  id v15 = v12;
  char v53 = 0;
  v16 = [(_UIWindowHostingSceneSystemReferenceAngleDiffAction *)self diffInspector];
  [v16 inspectDiff:v14 withContext:&v53];

  if ((v53 & 3) != 0)
  {
    v17 = [v15 _effectiveUISettings];
    [v17 angleFromHostReferenceUprightDirection];
    v19 = v18;

    v20 = [v15 _effectiveUISettings];
    uint64_t v21 = [v20 hostReferenceAngleMode];

    v22 = [v15 _allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
    if ((v53 & 2) != 0)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("SystemReferenceAngle", &_MergedGlobals_1186);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v27 = *(id *)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          id v28 = v15;
          if (v28)
          {
            v29 = NSString;
            id v30 = v28;
            v31 = (objc_class *)objc_opt_class();
            v32 = NSStringFromClass(v31);
            v33 = v30;
            v34 = [v29 stringWithFormat:@"<%@: %p>", v32, v30];
          }
          else
          {
            v33 = 0;
            v34 = @"(nil)";
          }

          v43 = v34;
          v44 = [v33 _persistenceIdentifier];
          v45 = _UISStringForSystemReferenceAngleMode();
          *(_DWORD *)buf = 138543874;
          v55 = v34;
          __int16 v56 = 2114;
          v57 = v44;
          __int16 v58 = 2114;
          v59 = v45;
          _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@ (%{public}@) Scene hostReferenceAngleMode did change: %{public}@", buf, 0x20u);
        }
      }
    }
    if (v53)
    {
      unint64_t v24 = __UILogGetCategoryCachedImpl("SystemReferenceAngle", &qword_1EB2622B0);
      if (*(unsigned char *)v24)
      {
        v35 = *(id *)(v24 + 8);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          id v36 = v15;
          if (v36)
          {
            v37 = NSString;
            id v38 = v36;
            v39 = (objc_class *)objc_opt_class();
            v40 = NSStringFromClass(v39);
            v41 = v38;
            v42 = [v37 stringWithFormat:@"<%@: %p>", v40, v38];
          }
          else
          {
            v41 = 0;
            v42 = @"(nil)";
          }

          v46 = v42;
          v47 = [v41 _persistenceIdentifier];
          *(_DWORD *)buf = 138543874;
          v55 = v42;
          __int16 v56 = 2114;
          v57 = v47;
          __int16 v58 = 2048;
          v59 = v19;
          _os_log_impl(&dword_1853B0000, v35, OS_LOG_TYPE_ERROR, "%{public}@ (%{public}@) Scene angleFromHostReferenceUprightDirection did change: %.0f", buf, 0x20u);
        }
      }
    }
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __165___UIWindowHostingSceneSystemReferenceAngleDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke;
    v48[3] = &unk_1E52E05A8;
    v51 = v19;
    uint64_t v52 = v21;
    id v49 = v13;
    id v50 = v22;
    id v25 = v22;
    [v15 _enqueuePostSettingsUpdateResponseBlock:v48 inPhase:0x1ED0EB320];
  }
}

- (UIApplicationSceneSettingsDiffInspector)diffInspector
{
  diffInspector = self->_diffInspector;
  if (!diffInspector)
  {
    v4 = objc_alloc_init(UIApplicationSceneSettingsDiffInspector);
    v5 = self->_diffInspector;
    self->_diffInspector = v4;

    [(UIApplicationSceneSettingsDiffInspector *)self->_diffInspector observeAngleFromHostReferenceUprightDirectionWithBlock:&__block_literal_global_426];
    [(UIApplicationSceneSettingsDiffInspector *)self->_diffInspector observeHostReferenceAngleModeWithBlock:&__block_literal_global_2_15];
    diffInspector = self->_diffInspector;
  }
  return diffInspector;
}

- (void)setDiffInspector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end