@interface SBFLegacyWallpaperWakeAnimator
- (BOOL)_shouldHideWakeEffectViewAfterUpdate;
- (UIVisualEffectView)wakeEffectView;
- (id)_wakeEffectsForAnimatingWakeState:(int64_t)a3;
- (id)_wakeEffectsForPersistentWakeState:(int64_t)a3;
- (int64_t)_targetWakeStateForFadeIn:(BOOL)a3;
- (int64_t)wakeState;
- (void)removeAllWakeEffects;
- (void)setWakeEffectView:(id)a3;
- (void)setWakeState:(int64_t)a3;
- (void)updateWakeEffectsForWake:(BOOL)a3;
- (void)updateWakeEffectsForWake:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation SBFLegacyWallpaperWakeAnimator

- (void)setWakeEffectView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wakeEffectView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_wakeEffectView, obj);
    v5 = obj;
    int64_t wakeState = self->_wakeState;
    if (wakeState)
    {
      self->_int64_t wakeState = 0;
      [(SBFLegacyWallpaperWakeAnimator *)self updateWakeEffectsForWake:wakeState == 2 animated:0 completion:0];
      v5 = obj;
    }
  }
}

- (void)updateWakeEffectsForWake:(BOOL)a3
{
}

- (void)updateWakeEffectsForWake:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v8 = (void (**)(id, uint64_t))a5;
  int64_t v9 = [(SBFLegacyWallpaperWakeAnimator *)self _targetWakeStateForFadeIn:v6];
  int64_t v10 = [(SBFLegacyWallpaperWakeAnimator *)self wakeState];
  v11 = SBLogScreenWake();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v27 = @"unknown";
    if (v10 == 1) {
      v27 = @"sleep";
    }
    if (v10 == 2) {
      v27 = @"awake";
    }
    v28 = v27;
    v29 = @"unknown";
    if (v9 == 1) {
      v29 = @"sleep";
    }
    if (v9 == 2) {
      v29 = @"awake";
    }
    v30 = v29;
    *(_DWORD *)buf = 67109890;
    BOOL v42 = v6;
    __int16 v43 = 1024;
    BOOL v44 = v5;
    __int16 v45 = 2112;
    v46 = v28;
    __int16 v47 = 2112;
    v48 = v30;
    _os_log_debug_impl(&dword_18B52E000, v11, OS_LOG_TYPE_DEBUG, "updateWakeEffectsForWake:%{BOOL}d animated:%{BOOL}d (%@ -> %@)", buf, 0x22u);
  }
  if (v9 != v10)
  {
    [(SBFLegacyWallpaperWakeAnimator *)self setWakeState:v9];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_wakeEffectView);
    if (!v5)
    {
      v13 = [(SBFLegacyWallpaperWakeAnimator *)self _wakeEffectsForAnimatingWakeState:v9];
      [WeakRetained setBackgroundEffects:v13];
      v17 = [(SBFLegacyWallpaperWakeAnimator *)self _wakeEffectsForPersistentWakeState:v9];
      [WeakRetained setBackgroundEffects:v17];
      if (v8) {
        v8[2](v8, 1);
      }
      goto LABEL_15;
    }
    v13 = [(SBFLegacyWallpaperWakeAnimator *)self _wakeEffectsForAnimatingWakeState:v10];
    uint64_t v14 = [(SBFLegacyWallpaperWakeAnimator *)self _wakeEffectsForAnimatingWakeState:v9];
    v15 = [(SBFLegacyWallpaperWakeAnimator *)self _wakeEffectsForPersistentWakeState:v9];
    v16 = +[SBFWakeAnimationDomain rootSettings];
    v17 = v16;
    v32 = (void *)v14;
    if (v9 == 2)
    {
      uint64_t v18 = [v16 awakeWallpaperFilterSettings];
    }
    else
    {
      if (v9 != 1)
      {
        v19 = 0;
        goto LABEL_14;
      }
      uint64_t v18 = [v16 sleepWallpaperFilterSettings];
    }
    v19 = (void *)v18;
LABEL_14:
    [WeakRetained setHidden:0];
    [WeakRetained setBackgroundEffects:v13];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __79__SBFLegacyWallpaperWakeAnimator_updateWakeEffectsForWake_animated_completion___block_invoke;
    v36[3] = &unk_1E548DD88;
    int64_t v40 = v9;
    v36[4] = self;
    id v37 = v15;
    id v20 = WeakRetained;
    id v38 = v20;
    v39 = v8;
    id v31 = v15;
    v21 = (void *)MEMORY[0x18C133210](v36);
    v22 = (void *)MEMORY[0x1E4F4F898];
    v23 = [v19 BSAnimationSettings];
    v24 = [v22 factoryWithSettings:v23];

    v25 = (void *)MEMORY[0x1E4F4F898];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __79__SBFLegacyWallpaperWakeAnimator_updateWakeEffectsForWake_animated_completion___block_invoke_2;
    v33[3] = &unk_1E548CBA0;
    id v34 = v20;
    id v35 = v32;
    id v26 = v32;
    [v25 animateWithFactory:v24 options:4 actions:v33 completion:v21];

LABEL_15:
    goto LABEL_16;
  }
  if (v8) {
    v8[2](v8, 1);
  }
LABEL_16:
}

uint64_t __79__SBFLegacyWallpaperWakeAnimator_updateWakeEffectsForWake_animated_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) wakeState] == *(void *)(a1 + 64))
  {
    if ([*(id *)(a1 + 40) count]) {
      [*(id *)(a1 + 48) setBackgroundEffects:*(void *)(a1 + 40)];
    }
    else {
      objc_msgSend(*(id *)(a1 + 48), "setHidden:", objc_msgSend(*(id *)(a1 + 32), "_shouldHideWakeEffectViewAfterUpdate"));
    }
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __79__SBFLegacyWallpaperWakeAnimator_updateWakeEffectsForWake_animated_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundEffects:*(void *)(a1 + 40)];
}

- (void)removeAllWakeEffects
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wakeEffectView);
  [WeakRetained setBackgroundEffects:MEMORY[0x1E4F1CBF0]];
}

- (int64_t)_targetWakeStateForFadeIn:(BOOL)a3
{
  if (a3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)_wakeEffectsForAnimatingWakeState:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v4 = +[SBFWakeAnimationDomain rootSettings];
  BOOL v5 = v4;
  switch(a3)
  {
    case 0:
      v7 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_10;
    case 2:
      BOOL v6 = (void *)MEMORY[0x1E4F428C0];
      [v4 awakeColorBrightness];
      break;
    case 1:
      BOOL v6 = (void *)MEMORY[0x1E4F428C0];
      [v4 sleepColorBrightness];
      break;
    default:
      v8 = 0;
      goto LABEL_9;
  }
  v8 = objc_msgSend(v6, "colorEffectBrightness:");
LABEL_9:
  v10[0] = v8;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

LABEL_10:
  return v7;
}

- (id)_wakeEffectsForPersistentWakeState:(int64_t)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v4 = +[SBFWakeAnimationDomain rootSettings];
  BOOL v5 = v4;
  if (a3 == 1
    && (BOOL v6 = (void *)MEMORY[0x1E4F428C0],
        [v4 sleepColorBrightness],
        objc_msgSend(v6, "colorEffectBrightness:"),
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    v11[0] = v7;
    int64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  else
  {
    int64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (BOOL)_shouldHideWakeEffectViewAfterUpdate
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (int64_t)wakeState
{
  return self->_wakeState;
}

- (void)setWakeState:(int64_t)a3
{
  self->_int64_t wakeState = a3;
}

- (UIVisualEffectView)wakeEffectView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wakeEffectView);
  return (UIVisualEffectView *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end