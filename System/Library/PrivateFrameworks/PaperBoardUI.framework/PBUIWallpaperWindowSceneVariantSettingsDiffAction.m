@interface PBUIWallpaperWindowSceneVariantSettingsDiffAction
- (id)_wallpaperVariantSceneSettingsDiffInspector;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
@end

@implementation PBUIWallpaperWindowSceneVariantSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13 = a3;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  uint64_t v17 = objc_opt_class();
  id v18 = v13;
  if (v17)
  {
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }
  id v20 = v19;

  v21 = [v16 settings];

  uint64_t v22 = objc_opt_class();
  id v23 = v21;
  if (v22)
  {
    if (objc_opt_isKindOfClass()) {
      v24 = v23;
    }
    else {
      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
  }
  id v25 = v24;

  if (v20)
  {
    if (v25) {
      goto LABEL_13;
    }
  }
  else
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"PBUIWallpaperWindowSceneVariantSettingsDiffAction.m", 36, @"Invalid parameter not satisfying: %@", @"windowScene" object file lineNumber description];

    if (v25) {
      goto LABEL_13;
    }
  }
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"PBUIWallpaperWindowSceneVariantSettingsDiffAction.m", 37, @"Invalid parameter not satisfying: %@", @"windowSceneSettings" object file lineNumber description];

LABEL_13:
  char v36 = 0;
  v26 = [(PBUIWallpaperWindowSceneVariantSettingsDiffAction *)self _wallpaperVariantSceneSettingsDiffInspector];
  [v26 inspectDiff:v15 withContext:&v36];

  if (v36)
  {
    v27 = [v14 animationFence];
    [v20 _synchronizeDrawingWithFence:v27];

    uint64_t v28 = objc_opt_class();
    id v29 = v14;
    if (v28)
    {
      if (objc_opt_isKindOfClass()) {
        v30 = v29;
      }
      else {
        v30 = 0;
      }
    }
    else
    {
      v30 = 0;
    }
    id v31 = v30;

    if (v31)
    {
      v32 = [v31 inAnimationSettings];
      [v31 outAnimationSettings];
    }
    else
    {
      v32 = [v29 animationSettings];
      [v29 animationSettings];
    v33 = };

    objc_msgSend(v20, "_updateWallpaperVariant:inAnimationSettings:outAnimationSettings:", objc_msgSend(v25, "wallpaperVariant"), v32, v33);
  }
}

- (id)_wallpaperVariantSceneSettingsDiffInspector
{
  wallpaperVariantSceneSettingsDiffInspector = self->_wallpaperVariantSceneSettingsDiffInspector;
  if (!wallpaperVariantSceneSettingsDiffInspector)
  {
    v4 = objc_alloc_init(PBUIWallpaperWindowSceneSettingsDiffInspector);
    v5 = self->_wallpaperVariantSceneSettingsDiffInspector;
    self->_wallpaperVariantSceneSettingsDiffInspector = v4;

    [(PBUIWallpaperWindowSceneSettingsDiffInspector *)self->_wallpaperVariantSceneSettingsDiffInspector observeWallpaperVariantWithBlock:&__block_literal_global_8];
    wallpaperVariantSceneSettingsDiffInspector = self->_wallpaperVariantSceneSettingsDiffInspector;
  }
  return wallpaperVariantSceneSettingsDiffInspector;
}

void __96__PBUIWallpaperWindowSceneVariantSettingsDiffAction__wallpaperVariantSceneSettingsDiffInspector__block_invoke(uint64_t a1, unsigned char *a2)
{
  *a2 |= 1u;
}

- (void).cxx_destruct
{
}

@end