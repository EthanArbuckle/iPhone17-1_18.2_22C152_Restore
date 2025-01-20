@interface UISceneHostingController
@end

@implementation UISceneHostingController

uint64_t __39___UISceneHostingController_initialize__block_invoke()
{
  objc_opt_class();
  return _class_setCustomDeallocInitiation();
}

void __58___UISceneHostingController_createSceneWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 sceneIdentifier];
  [v4 setIdentifier:v5];

  v6 = [*(id *)(a1 + 32) sceneSpecification];
  [v4 setSpecification:v6];

  v7 = FBSSceneClientIdentity;
  v8 = [*(id *)(a1 + 32) processIdentity];
  v9 = [v7 identityForProcessIdentity:v8];
  [v4 setClientIdentity:v9];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58___UISceneHostingController_createSceneWithConfiguration___block_invoke_2;
  v10[3] = &unk_1E52FE0B8;
  id v11 = *(id *)(a1 + 32);
  [v4 configureParameters:v10];
}

void __58___UISceneHostingController_createSceneWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = [*(id *)(a1 + 32) initialSettingsUpdater];

  if (v3)
  {
    id v4 = objc_opt_new();
    v5 = [*(id *)(a1 + 32) initialSettingsUpdater];
    ((void (**)(void, void *))v5)[2](v5, v4);

    [v9 applySettings:v4];
  }
  v6 = [*(id *)(a1 + 32) initialClientSettingsUpdater];

  if (v6)
  {
    v7 = objc_opt_new();
    v8 = [*(id *)(a1 + 32) initialClientSettingsUpdater];
    ((void (**)(void, void *))v8)[2](v8, v7);

    [v9 applyClientSettings:v7];
  }
}

void __58___UISceneHostingController_createSceneWithConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addPropagatedProperty:sel_isForeground];
  [v2 addPropagatedProperty:sel_deactivationReasons];
  [v2 addPropagatedProperty:sel_displayConfiguration];
  [v2 addPropagatedProperty:sel_enhancedWindowingEnabled];
  [v2 addPropagatedProperty:sel_hostReferenceAngleMode];
  [v2 addPropagatedProperty:sel_angleFromHostReferenceUprightDirection];
  [v2 addPropagatedProperty:sel_screenReferenceDisplayModeStatus];
  [v2 addPropagatedProperty:sel_userInterfaceStyle];
}

void __70___UISceneHostingController_performBlock_withClientTransitionContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) animationFence];

  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    id v4 = [*(id *)(a1 + 32) animationFence];
    [WeakRetained _synchronizeDrawingWithFence:v4];
  }
  v5 = (void *)MEMORY[0x1E4F4F680];
  v6 = [*(id *)(a1 + 32) animationSettings];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70___UISceneHostingController_performBlock_withClientTransitionContext___block_invoke_2;
  v7[3] = &unk_1E52D9FE8;
  id v8 = *(id *)(a1 + 48);
  [v5 tryAnimatingWithSettings:v6 actions:v7 completion:0];
}

uint64_t __70___UISceneHostingController_performBlock_withClientTransitionContext___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80___UISceneHostingController__updateSceneSettingsFromSettingsProvidersWithFence___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "_applyOverridesToHostedSceneSettings:", v5, (void)v14);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  if (*(unsigned char *)(a1 + 40))
  {
    if (+[UIView areAnimationsEnabled])
    {
      v12 = +[UIView _currentAnimationSettings];
      [v6 setAnimationSettings:v12];
    }
    else
    {
      [v6 setAnimationSettings:0];
    }
    v13 = +[UIScene _synchronizedDrawingFence];
    [v6 setAnimationFence:v13];
  }
}

void __38___UISceneHostingController_activate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISceneHosting", _UIInternalPreference_AllowCarPlayScenesToCallMakeKeyWindow_block_invoke___s_category_1)+ 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v7;
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = v9;
      v12 = [v6 localizedDescription];
      *(_DWORD *)buf = 138412802;
      uint64_t v19 = v9;
      __int16 v20 = 2048;
      uint64_t v21 = v10;
      __int16 v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "<%@: %p> Encountered an error while building user activity for scene: %@", buf, 0x20u);
    }
  }
  if (v5)
  {
    v13 = *(void **)(a1 + 40);
    long long v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
    [v13 setActions:v14];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __38___UISceneHostingController_activate___block_invoke_64;
  v16[3] = &unk_1E52D9F98;
  long long v15 = *(void **)(a1 + 40);
  v16[4] = *(void *)(a1 + 32);
  id v17 = v15;
  dispatch_async(MEMORY[0x1E4F14428], v16);
}

uint64_t __38___UISceneHostingController_activate___block_invoke_64(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) activateWithTransitionContext:*(void *)(a1 + 40)];
}

uint64_t __54___UISceneHostingController_sceneWillEnterBackground___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

@end