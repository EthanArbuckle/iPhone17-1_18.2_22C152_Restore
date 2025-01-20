@interface _UISceneHostingSheetPresentationHostComponent
- (BOOL)_viewClipsToBounds;
- (UIViewController)_targetViewController;
- (_UISheetPresentationControllerConfiguration)_sheetConfiguration;
- (id)currentPresentationController;
- (id)scene:(id)a3 handleActions:(id)a4;
- (void)_setSheetConfiguration:(id)a3;
- (void)_setTargetViewController:(id)a3;
- (void)_setViewClipsToBounds:(BOOL)a3;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
@end

@implementation _UISceneHostingSheetPresentationHostComponent

- (id)currentPresentationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetViewController);
  v3 = [WeakRetained _existingPresentationControllerImmediate:0 effective:1];

  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v13 = objc_opt_class();
        id v14 = v12;
        if (v13)
        {
          if (objc_opt_isKindOfClass()) {
            v15 = v14;
          }
          else {
            v15 = 0;
          }
        }
        else
        {
          v15 = 0;
        }
        id v16 = v15;

        if (v16)
        {
          v17 = [(_UISceneHostingSheetPresentationHostComponent *)self currentPresentationController];
          [v16 executeActionForSheetPresentationController:v17];

          [v6 addObject:v16];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  v18 = (void *)[v6 copy];
  return v18;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  if ([a4 containsProperty:sel_sheetClientConfiguration])
  {
    v11 = [v9 clientSettings];
    v12 = [v11 sheetClientConfiguration];

    uint64_t v13 = [(_UISceneHostingSheetPresentationHostComponent *)self currentPresentationController];
    id v14 = v13;
    if (v13)
    {
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      long long v20 = __123___UISceneHostingSheetPresentationHostComponent_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
      long long v21 = &unk_1E52D9F98;
      id v22 = v13;
      id v23 = v12;
      v15 = (void (**)(void))_Block_copy(&v18);
      id v16 = [(FBSSceneComponent *)self hostScene];
      v17 = [v16 _uiHostingController];

      if (v17) {
        -[_UISceneHostingController performBlock:withClientTransitionContext:]((uint64_t)v17, v15, v10);
      }
      else {
        v15[2](v15);
      }
    }
  }
}

- (void)_setSheetConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSceneComponent *)self hostScene];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72___UISceneHostingSheetPresentationHostComponent__setSheetConfiguration___block_invoke;
  v7[3] = &unk_1E5306280;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 _performUpdateWithoutActivation:v7];
}

- (_UISheetPresentationControllerConfiguration)_sheetConfiguration
{
  v2 = [(FBSSceneComponent *)self hostScene];
  v3 = [v2 settings];
  id v4 = [v3 sheetConfiguration];

  return (_UISheetPresentationControllerConfiguration *)v4;
}

- (void)_setViewClipsToBounds:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetViewController);
  id v4 = [WeakRetained view];
  [v4 setClipsToBounds:v3];
}

- (BOOL)_viewClipsToBounds
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetViewController);
  BOOL v3 = [WeakRetained view];
  char v4 = [v3 clipsToBounds];

  return v4;
}

- (UIViewController)_targetViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetViewController);
  return (UIViewController *)WeakRetained;
}

- (void)_setTargetViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end