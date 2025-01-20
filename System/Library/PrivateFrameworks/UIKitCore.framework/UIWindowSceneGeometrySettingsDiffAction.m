@interface UIWindowSceneGeometrySettingsDiffAction
@end

@implementation UIWindowSceneGeometrySettingsDiffAction

void __86___UIWindowSceneGeometrySettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke(uint64_t a1, unsigned char *a2)
{
  *a2 |= 1u;
}

void __86___UIWindowSceneGeometrySettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke_2(uint64_t a1, unsigned char *a2)
{
  *a2 |= 2u;
}

void __86___UIWindowSceneGeometrySettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke_3(uint64_t a1, unsigned char *a2)
{
  *a2 |= 4u;
}

void __86___UIWindowSceneGeometrySettingsDiffAction_sceneSettingsGeometryMutationDiffInspector__block_invoke_4(uint64_t a1, unsigned char *a2)
{
  *a2 |= 8u;
}

uint64_t __121___UIWindowSceneGeometrySettingsDiffAction__updateSceneGeometryWithSettingObserverContext_windowScene_transitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 48))
  {
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      if ((![*(id *)(a1 + 32) activationState] || objc_msgSend(v4, "activationState") == 1)
        && ([*(id *)(a1 + 32) _isPerformingSystemSnapshot] & 1) == 0)
      {
        a2 = +[UIView areAnimationsEnabled] | a2;
      }
    }
  }
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  return [v5 _computeMetricsAndCrossFadeInLiveResize:a2 withTransitionContext:v6];
}

void __121___UIWindowSceneGeometrySettingsDiffAction__updateSceneGeometryWithSettingObserverContext_windowScene_transitionContext___block_invoke_23(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Orientation", &_UIInternalPreference_AllowCarPlayScenesToCallMakeKeyWindow_block_invoke___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v3 = *(id *)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(void **)(a1 + 32);
      if (v4)
      {
        v5 = NSString;
        id v6 = v4;
        v7 = (objc_class *)objc_opt_class();
        v8 = NSStringFromClass(v7);
        v9 = [v5 stringWithFormat:@"<%@: %p>", v8, v6];

        v10 = *(void **)(a1 + 32);
      }
      else
      {
        v10 = 0;
        v9 = @"(nil)";
      }
      v11 = v9;
      v12 = v9;
      v13 = [v10 _persistenceIdentifier];
      [*(id *)(a1 + 32) interfaceOrientation];
      v14 = BSInterfaceOrientationDescription();
      v15 = NSStringFromBOOL();
      *(_DWORD *)buf = 138544130;
      v17 = v11;
      __int16 v18 = 2114;
      v19 = v13;
      __int16 v20 = 2114;
      v21 = v14;
      __int16 v22 = 2114;
      v23 = v15;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "%{public}@ (%{public}@) Scene did change interface orientation: %{public}@; success=%{public}@",
        buf,
        0x2Au);
    }
  }
}

@end