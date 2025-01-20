@interface PBUIWallpaperWindowSceneSettingsDiffAction
- (id)_wallpaperSceneSettingsDiffInspector;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
@end

@implementation PBUIWallpaperWindowSceneSettingsDiffAction

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a5;
  id v18 = a4;
  uint64_t v19 = objc_opt_class();
  id v20 = v14;
  if (v19)
  {
    if (objc_opt_isKindOfClass()) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }
  id v22 = v21;

  v23 = [v18 settings];

  uint64_t v24 = objc_opt_class();
  id v25 = v23;
  if (v24)
  {
    if (objc_opt_isKindOfClass()) {
      v26 = v25;
    }
    else {
      v26 = 0;
    }
  }
  else
  {
    v26 = 0;
  }
  id v27 = v26;

  uint64_t v28 = objc_opt_class();
  id v29 = v15;
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

  if (v22)
  {
    if (v27) {
      goto LABEL_18;
    }
  }
  else
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"PBUIWallpaperWindowSceneSettingsDiffAction.m", 54, @"Invalid parameter not satisfying: %@", @"windowScene" object file lineNumber description];

    if (v27) {
      goto LABEL_18;
    }
  }
  v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"PBUIWallpaperWindowSceneSettingsDiffAction.m", 55, @"Invalid parameter not satisfying: %@", @"windowSceneSettings" object file lineNumber description];

LABEL_18:
  __int16 v38 = 0;
  v32 = [(PBUIWallpaperWindowSceneSettingsDiffAction *)self _wallpaperSceneSettingsDiffInspector];
  [v32 inspectDiff:v17 withContext:&v38];

  if (v38)
  {
    id v35 = v22;
    id v36 = v27;
    id v37 = v31;
    _UISceneSettingsDiffActionPerformChangesWithTransitionContext();
  }
}

void __156__PBUIWallpaperWindowSceneSettingsDiffAction__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  __int16 v2 = *(_WORD *)(a1 + 56);
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) lockscreenWallpaperContentsRect];
    objc_msgSend(v3, "_updateLockscreenWallpaperContentsRect:");
    __int16 v2 = *(_WORD *)(a1 + 56);
    if ((v2 & 2) == 0)
    {
LABEL_3:
      if ((v2 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((v2 & 2) == 0)
  {
    goto LABEL_3;
  }
  v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) lockscreenWallpaperAlpha];
  objc_msgSend(v4, "_updateLockscreenWallpaperAlpha:");
  __int16 v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 4) == 0)
  {
LABEL_4:
    if ((v2 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  v5 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) homescreenWallpaperAlpha];
  objc_msgSend(v5, "_updateHomescreenWallpaperAlpha:");
  __int16 v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 8) == 0)
  {
LABEL_5:
    if ((v2 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  v6 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) lockscreenOnlyWallpaperAlpha];
  objc_msgSend(v6, "_updateLockscreenOnlyWallpaperAlpha:");
  __int16 v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 0x10) == 0)
  {
LABEL_6:
    if ((v2 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(*(id *)(a1 + 32), "_updateDisallowRasterizationForHomescreen:lockscreen:", objc_msgSend(*(id *)(a1 + 40), "disallowHomescreenRasterization"), objc_msgSend(*(id *)(a1 + 40), "disallowLockscreenRasterization"));
  __int16 v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 0x20) == 0)
  {
LABEL_7:
    if ((v2 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(*(id *)(a1 + 32), "_updateWallpaperHiddenForHomescreen:lockscreen:", objc_msgSend(*(id *)(a1 + 40), "homescreenWallpaperHidden"), objc_msgSend(*(id *)(a1 + 40), "lockscreenWallpaperHidden"));
  __int16 v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 0x40) == 0)
  {
LABEL_8:
    if ((v2 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(*(id *)(a1 + 32), "_updateWallpaperAnimationSuspended:", objc_msgSend(*(id *)(a1 + 40), "wallpaperAnimationSuspended"));
  __int16 v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 0x80) == 0)
  {
LABEL_9:
    if ((v2 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(*(id *)(a1 + 32), "_updateWallpaperRequired:", objc_msgSend(*(id *)(a1 + 40), "wallpaperRequired"));
  __int16 v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 0x100) == 0)
  {
LABEL_10:
    if ((v2 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(*(id *)(a1 + 32), "_updateHomescreenStyleChangesDelayed:", objc_msgSend(*(id *)(a1 + 40), "homescreenStyleChangesDelayed"));
  __int16 v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 0x200) == 0)
  {
LABEL_11:
    if ((v2 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  v7 = *(void **)(a1 + 32);
  v8 = [*(id *)(a1 + 40) homescreenStyleTransitionState];
  v9 = [*(id *)(a1 + 48) homescreenStyleTransitionState];
  [v7 _updateHomescreenStyleTransitionStateTo:v8 from:v9];

  __int16 v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 0x400) == 0)
  {
LABEL_12:
    if ((v2 & 0x800) == 0) {
      goto LABEL_13;
    }
LABEL_26:
    objc_msgSend(*(id *)(a1 + 32), "_updateLiveWallpaperTouchActive:", objc_msgSend(*(id *)(a1 + 40), "liveWallpaperTouchActive"));
    if ((*(_WORD *)(a1 + 56) & 0x1000) == 0) {
      return;
    }
    goto LABEL_27;
  }
LABEL_25:
  v10 = *(void **)(a1 + 32);
  v11 = [*(id *)(a1 + 40) lockscreenStyleTransitionState];
  v12 = [*(id *)(a1 + 48) lockscreenStyleTransitionState];
  [v10 _updateHomescreenStyleTransitionStateTo:v11 from:v12];

  __int16 v2 = *(_WORD *)(a1 + 56);
  if ((v2 & 0x800) != 0) {
    goto LABEL_26;
  }
LABEL_13:
  if ((v2 & 0x1000) == 0) {
    return;
  }
LABEL_27:
  v13 = *(void **)(a1 + 32);
  uint64_t v14 = [*(id *)(a1 + 40) liveWallpaperInteractive];
  [v13 _updateLiveWallpaperInteractive:v14];
}

- (id)_wallpaperSceneSettingsDiffInspector
{
  wallpaperSceneSettingsDiffInspector = self->_wallpaperSceneSettingsDiffInspector;
  if (!wallpaperSceneSettingsDiffInspector)
  {
    v4 = objc_alloc_init(PBUIWallpaperWindowSceneSettingsDiffInspector);
    v5 = self->_wallpaperSceneSettingsDiffInspector;
    self->_wallpaperSceneSettingsDiffInspector = v4;

    [(PBUIWallpaperWindowSceneSettingsDiffInspector *)self->_wallpaperSceneSettingsDiffInspector observeLockscreenWallpaperContentsRectWithBlock:&__block_literal_global_11];
    [(PBUIWallpaperWindowSceneSettingsDiffInspector *)self->_wallpaperSceneSettingsDiffInspector observeLockscreenWallpaperAlphaWithBlock:&__block_literal_global_16];
    [(PBUIWallpaperWindowSceneSettingsDiffInspector *)self->_wallpaperSceneSettingsDiffInspector observeHomescreenWallpaperAlphaWithBlock:&__block_literal_global_18];
    [(PBUIWallpaperWindowSceneSettingsDiffInspector *)self->_wallpaperSceneSettingsDiffInspector observeLockscreenOnlyWallpaperAlphaWithBlock:&__block_literal_global_20_0];
    [(PBUIWallpaperWindowSceneSettingsDiffInspector *)self->_wallpaperSceneSettingsDiffInspector observeDisallowHomescreenRasterizationWithBlock:&__block_literal_global_22];
    [(PBUIWallpaperWindowSceneSettingsDiffInspector *)self->_wallpaperSceneSettingsDiffInspector observeDisallowLockscreenRasterizationWithBlock:&__block_literal_global_24];
    [(PBUIWallpaperWindowSceneSettingsDiffInspector *)self->_wallpaperSceneSettingsDiffInspector observeHomescreenWallpaperHiddenWithBlock:&__block_literal_global_26];
    [(PBUIWallpaperWindowSceneSettingsDiffInspector *)self->_wallpaperSceneSettingsDiffInspector observeLockscreenWallpaperHiddenWithBlock:&__block_literal_global_28];
    [(PBUIWallpaperWindowSceneSettingsDiffInspector *)self->_wallpaperSceneSettingsDiffInspector observeWallpaperAnimationSuspendedWithBlock:&__block_literal_global_30];
    [(PBUIWallpaperWindowSceneSettingsDiffInspector *)self->_wallpaperSceneSettingsDiffInspector observeWallpaperRequiredWithBlock:&__block_literal_global_32];
    [(PBUIWallpaperWindowSceneSettingsDiffInspector *)self->_wallpaperSceneSettingsDiffInspector observeHomescreenStyleChangesDelayedWithBlock:&__block_literal_global_34_0];
    [(PBUIWallpaperWindowSceneSettingsDiffInspector *)self->_wallpaperSceneSettingsDiffInspector observeHomescreenStyleTransitionStateWithBlock:&__block_literal_global_36];
    [(PBUIWallpaperWindowSceneSettingsDiffInspector *)self->_wallpaperSceneSettingsDiffInspector observeLockscreenStyleTransitionStateWithBlock:&__block_literal_global_38];
    [(PBUIWallpaperWindowSceneSettingsDiffInspector *)self->_wallpaperSceneSettingsDiffInspector observeLiveWallpaperTouchActiveWithBlock:&__block_literal_global_40];
    [(PBUIWallpaperWindowSceneSettingsDiffInspector *)self->_wallpaperSceneSettingsDiffInspector observeLiveWallpaperInteractiveWithBlock:&__block_literal_global_42];
    wallpaperSceneSettingsDiffInspector = self->_wallpaperSceneSettingsDiffInspector;
  }
  return wallpaperSceneSettingsDiffInspector;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke(uint64_t a1, _WORD *a2)
{
  *a2 |= 1u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_2(uint64_t a1, _WORD *a2)
{
  *a2 |= 2u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_3(uint64_t a1, _WORD *a2)
{
  *a2 |= 4u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_4(uint64_t a1, _WORD *a2)
{
  *a2 |= 8u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_5(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x10u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_6(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x10u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_7(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x20u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_8(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x20u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_9(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x40u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_10(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x80u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_11(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x100u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_12(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x200u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_13(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x400u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_14(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x800u;
}

void __82__PBUIWallpaperWindowSceneSettingsDiffAction__wallpaperSceneSettingsDiffInspector__block_invoke_15(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x1000u;
}

- (void).cxx_destruct
{
}

@end