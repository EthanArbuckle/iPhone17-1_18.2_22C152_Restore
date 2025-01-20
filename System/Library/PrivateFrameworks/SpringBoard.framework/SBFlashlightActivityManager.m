@interface SBFlashlightActivityManager
- (BOOL)isFlashlightOn;
- (BOOL)shouldShowDynamicFlashlightUI;
- (BOOL)shouldShowUIForFlashlightLevel;
- (id)_dynamicFlashlightState;
- (id)previewFlashlightActivityForReason:(uint64_t)a1;
- (uint64_t)_canTurnFlashlightOn;
- (uint64_t)initWithWindowScene:(void *)a3 flashlightController:;
- (uint64_t)toggleFlashlightForReason:(uint64_t)a1;
- (void)_dismissBanner;
- (void)_handleFlashlightElementsEvent:(id *)a1;
- (void)_presentBanner;
- (void)_showFlashlightUnavailableAlertForReason:(uint64_t)a1;
- (void)_updateFlashlightElementsForReason:(uint64_t)a1;
- (void)_updateFlashlightPreviewForReason:(uint64_t)a1;
- (void)dynamicFlashlightActivityElementDidChangeIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5;
- (void)dynamicFlashlightActivityElementDidCollapse;
- (void)dynamicFlashlightActivityElementDidUpdatePersistedIntensity:(double)a3 width:(double)a4;
- (void)dynamicFlashlightActivityElementRequestsTogglingFlashlight;
- (void)flashlightActivityElementRequestsTogglingFlashlight:(id)a3;
- (void)flashlightAvailabilityDidChange:(BOOL)a3;
- (void)flashlightLevelDidChange:(unint64_t)a3;
- (void)flashlightOverheatedDidChange:(BOOL)a3;
@end

@implementation SBFlashlightActivityManager

- (void)flashlightAvailabilityDidChange:(BOOL)a3
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFlashlightActivityManager _updateFlashlightElementsForReason:]((uint64_t)self, v4);
}

- (void)_updateFlashlightElementsForReason:(uint64_t)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1 || !*(unsigned char *)(a1 + 80)) {
    goto LABEL_39;
  }
  id v4 = SBLogFlashlightHUD();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v37 = a1;
    __int16 v38 = 2114;
    id v39 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) Updating flashlight elements for reason: '%{public}@'", buf, 0x16u);
  }

  int canTurnFlashlight = -[SBFlashlightActivityManager _canTurnFlashlightOn](a1);
  uint64_t v6 = [*(id *)(a1 + 96) level];
  BOOL v7 = v6 != 0;
  unsigned int v8 = -[SBSystemActionCompoundPreviewAssertion state](*(void *)(a1 + 32));
  unsigned int v9 = v8;
  int v10 = v7 | canTurnFlashlight ^ 1;
  int v11 = v7 | v10 ^ 1;
  if ((v10 & 1) == 0 && (v8 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    int v11 = [WeakRetained shouldRemainActiveWhileFlashlightIsOff];
  }
  int v13 = [*(id *)(a1 + 40) isValid];
  if (((v11 ^ 1 | v13) & 1) == 0)
  {
    v15 = SBLogFlashlightHUD();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = a1;
      __int16 v38 = 2114;
      id v39 = v3;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "(%{public}@) Creating flashlight activity for reason: '%{public}@'", buf, 0x16u);
    }

    if (*(unsigned char *)(a1 + 81))
    {
      v16 = (SBFlashlightActivityElement *)objc_loadWeakRetained((id *)(a1 + 24));
      if (v16)
      {
        v17 = SBLogFlashlightHUD();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          [(SBFlashlightActivityManager *)a1 _updateFlashlightElementsForReason:v17];
        }
      }
      else
      {
        v33 = [SBDynamicFlashlightActivityElement alloc];
        v18 = -[SBFlashlightActivityManager _dynamicFlashlightState](a1);
        id v19 = *(id *)(a1 + 88);
        v20 = [v19 coverSheetViewController];
        int v21 = [*(id *)(a1 + 96) isBeamWidthSupported];

        v16 = [(SBDynamicFlashlightActivityElement *)v33 initWithState:v18 coverSheetViewController:v20 fixedWidth:v21 ^ 1u];
        [(SBFlashlightActivityElement *)v16 setDelegate:a1];
        objc_storeWeak((id *)(a1 + 24), v16);
      }
    }
    else
    {
      v16 = [[SBFlashlightActivityElement alloc] initWithFlashlightOn:v6 != 0];
      [(SBFlashlightActivityElement *)v16 setDelegate:a1];
      objc_storeWeak((id *)(a1 + 8), v16);
    }
    v22 = objc_msgSend(*(id *)(a1 + 88), "systemApertureController", v33);
    uint64_t v23 = [v22 registerElement:v16];
    v24 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v23;

    objc_initWeak((id *)buf, (id)a1);
    v25 = *(void **)(a1 + 40);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __66__SBFlashlightActivityManager__updateFlashlightElementsForReason___block_invoke;
    v34[3] = &unk_1E6AFFF18;
    objc_copyWeak(&v35, (id *)buf);
    [v25 addInvalidationBlock:v34];
    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);

LABEL_24:
    if (!canTurnFlashlight) {
      goto LABEL_29;
    }
LABEL_25:
    if ([*(id *)(a1 + 48) isValid])
    {
      v26 = SBLogFlashlightHUD();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v37 = a1;
        __int16 v38 = 2114;
        id v39 = v3;
        _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@) Invalidating flashlight-unavailable alert for reason: '%{public}@'", buf, 0x16u);
      }

      [*(id *)(a1 + 48) invalidateWithReason:v3];
    }
    goto LABEL_29;
  }
  if ((v11 | v13 ^ 1)) {
    goto LABEL_24;
  }
  v14 = SBLogFlashlightHUD();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v37 = a1;
    __int16 v38 = 2114;
    id v39 = v3;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) Invalidating flashlight activity for reason: '%{public}@'", buf, 0x16u);
  }

  [*(id *)(a1 + 40) invalidateWithReason:v3];
  if (canTurnFlashlight) {
    goto LABEL_25;
  }
  -[SBFlashlightActivityManager _showFlashlightUnavailableAlertForReason:](a1, v3);
LABEL_29:
  id v27 = objc_loadWeakRetained((id *)(a1 + 8));
  v28 = v27;
  if (v27)
  {
    [v27 setFlashlightOn:v6 != 0];
    [v28 setPreviewing:v9 & 1];
    [v28 setUrgent:HIBYTE(v9) & 1];
    [v28 setExpanding:(v9 >> 8) & 1];
    [v28 setProminent:HIWORD(v9) & 1];
  }
  id v29 = objc_loadWeakRetained((id *)(a1 + 16));
  v30 = v29;
  if (v29) {
    [v29 setProminent:HIWORD(v9) & 1];
  }
  id v31 = objc_loadWeakRetained((id *)(a1 + 24));
  if (v31)
  {
    v32 = -[SBFlashlightActivityManager _dynamicFlashlightState](a1);
    [v31 setFlashlightState:v32];
    [v31 setPreviewing:v9 & 1];
    [v31 setUrgent:HIBYTE(v9) & 1];
    [v31 setExpanding:(v9 >> 8) & 1];
    [v31 setProminent:HIWORD(v9) & 1];
    if ([v32 isOn] && !*(unsigned char *)(a1 + 64)) {
      [v31 takeAlertingAssertionWithReason:@"SBFlashlightActivityManager: state -> on"];
    }
    *(unsigned char *)(a1 + 64) = [v32 isOn];
  }
LABEL_39:
}

- (uint64_t)_canTurnFlashlightOn
{
  if (!a1) {
    return 0;
  }
  id v1 = *(id *)(a1 + 96);
  v2 = v1;
  if (v1 && [v1 isAvailable]) {
    uint64_t v3 = [v2 isOverheated] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)initWithWindowScene:(void *)a3 flashlightController:
{
  id v6 = a2;
  id v7 = a3;
  if (!a1) {
    goto LABEL_15;
  }
  if (v6)
  {
    v13.receiver = (id)a1;
    v13.super_class = (Class)SBFlashlightActivityManager;
    unsigned int v8 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = (uint64_t)v8;
    if (v8)
    {
      objc_storeStrong(v8 + 11, a2);
      objc_storeStrong((id *)(a1 + 96), a3);
      char v9 = 1;
      uint64_t v10 = SBFEffectiveArtworkSubtype();
      if (v10 > 2795)
      {
        if (v10 == 2796 || v10 == 2868) {
          goto LABEL_11;
        }
      }
      else if (v10 == 2556 || v10 == 2622)
      {
        goto LABEL_11;
      }
      char v9 = 0;
LABEL_11:
      *(unsigned char *)(a1 + 80) = v9;
      *(unsigned char *)(a1 + 81) = [v7 deviceSupportsDynamicFlashlightInterface];
      if (v7)
      {
        if (*(unsigned char *)(a1 + 80)) {
          [v7 addObserver:a1];
        }
      }
      -[SBFlashlightActivityManager _updateFlashlightElementsForReason:](a1, @"Initialization");
    }
LABEL_15:

    return a1;
  }
  v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"windowScene != ((void *)0)"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SBFlashlightActivityManager initWithWindowScene:flashlightController:](sel_initWithWindowScene_flashlightController_);
  }
  [v12 UTF8String];
  uint64_t result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BOOL)shouldShowUIForFlashlightLevel
{
  if (result) {
    return *(unsigned char *)(result + 80) != 0;
  }
  return result;
}

- (BOOL)isFlashlightOn
{
  if (result) {
    return [*(id *)(result + 96) level] != 0;
  }
  return result;
}

- (id)previewFlashlightActivityForReason:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (!a1)
  {
LABEL_8:

    return (id)a1;
  }
  if (v3)
  {
    if (*(unsigned char *)(a1 + 80))
    {
      objc_initWeak(&location, (id)a1);
      uint64_t v5 = *(void *)(a1 + 32);
      if (!v5)
      {
        id v6 = [SBSystemActionCompoundPreviewAssertion alloc];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __66__SBFlashlightActivityManager_previewFlashlightActivityForReason___block_invoke;
        v13[3] = &unk_1E6AFFF40;
        objc_copyWeak(&v14, &location);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __66__SBFlashlightActivityManager_previewFlashlightActivityForReason___block_invoke_2;
        v11[3] = &unk_1E6AFB5B8;
        objc_copyWeak(&v12, &location);
        id v7 = -[SBSystemActionCompoundPreviewAssertion initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:](v6, @"FlashlightActivity", v13, v11);
        unsigned int v8 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v7;

        objc_destroyWeak(&v12);
        objc_destroyWeak(&v14);
        uint64_t v5 = *(void *)(a1 + 32);
      }
      a1 = -[SBSystemActionCompoundPreviewAssertion acquireForReason:](v5, v4);
      objc_destroyWeak(&location);
    }
    else
    {
      a1 = 0;
    }
    goto LABEL_8;
  }
  uint64_t v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"reason != ((void *)0)"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SBFlashlightActivityManager previewFlashlightActivityForReason:](sel_previewFlashlightActivityForReason_);
  }
  [v10 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __66__SBFlashlightActivityManager_previewFlashlightActivityForReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBFlashlightActivityManager _updateFlashlightPreviewForReason:]((uint64_t)WeakRetained, @"Preview state changed");
}

- (void)_updateFlashlightPreviewForReason:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v8 = v3;
    uint64_t v4 = SBFEffectiveArtworkSubtype();
    if (v4 > 2795)
    {
      if (v4 != 2796 && v4 != 2868) {
        goto LABEL_13;
      }
    }
    else if (v4 != 2556 && v4 != 2622)
    {
LABEL_13:
      unsigned int v5 = -[SBSystemActionCompoundPreviewAssertion state](*(void *)(a1 + 32));
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      id v7 = [WeakRetained view];
      objc_msgSend(v7, "sb_setInflated:", (v5 >> 8) & 1);

      if (v5) {
        -[SBFlashlightActivityManager _presentBanner](a1);
      }
      else {
        -[SBFlashlightActivityManager _dismissBanner](a1);
      }
      goto LABEL_9;
    }
    -[SBFlashlightActivityManager _updateFlashlightElementsForReason:](a1, v8);
LABEL_9:
    id v3 = v8;
  }
}

void __66__SBFlashlightActivityManager_previewFlashlightActivityForReason___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[SBFlashlightActivityManager _handleFlashlightElementsEvent:](WeakRetained, a3);
}

- (void)_handleFlashlightElementsEvent:(id *)a1
{
  if (a1 && !a2)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 1);
    [WeakRetained pop];

    id v4 = objc_loadWeakRetained(a1 + 2);
    [v4 pop];

    id v5 = objc_loadWeakRetained(a1 + 3);
    [v5 pop];
  }
}

- (uint64_t)toggleFlashlightForReason:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!a1) {
    goto LABEL_9;
  }
  if (!v3)
  {
    int v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"reason != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBFlashlightActivityManager toggleFlashlightForReason:](sel_toggleFlashlightForReason_);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8C720A4);
  }
  if ((-[SBFlashlightActivityManager _canTurnFlashlightOn](a1) & 1) == 0)
  {
    -[SBFlashlightActivityManager _showFlashlightUnavailableAlertForReason:](a1, v4);
LABEL_9:
    uint64_t v9 = 0;
    goto LABEL_14;
  }
  id v5 = *(id *)(a1 + 96);
  uint64_t v6 = [*(id *)(a1 + 96) level];
  id v7 = SBLogFlashlightHUD();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = a1;
      __int16 v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) Toggling flashlight OFF for reason: '%{public}@'", buf, 0x16u);
    }

    [v5 turnFlashlightOffForReason:v4 withCoolDown:1];
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = a1;
      __int16 v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) Toggling flashlight ON for reason: '%{public}@'", buf, 0x16u);
    }

    [v5 turnFlashlightOnForReason:v4];
  }

  uint64_t v9 = 1;
LABEL_14:

  return v9;
}

- (void)_showFlashlightUnavailableAlertForReason:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1 && *(unsigned char *)(a1 + 80))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    id v5 = [WeakRetained alertHost];
    uint64_t v6 = [v5 alertAssertion];

    LODWORD(v5) = [v6 isValid];
    id v7 = SBLogFlashlightHUD();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v17 = a1;
        __int16 v18 = 2114;
        id v19 = v3;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) Resetting invalidation timer for flashlight-unavailable alert for reason: '%{public}@'", buf, 0x16u);
      }

      [v6 resetAutomaticInvalidationTimer];
    }
    else
    {
      if (v8)
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v17 = a1;
        __int16 v18 = 2114;
        id v19 = v3;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) Showing flashlight-unavailable alert for reason: '%{public}@'", buf, 0x16u);
      }

      uint64_t v9 = +[SBFlashlightAlertElement flashlightUnavailableAlert];
      objc_storeWeak((id *)(a1 + 16), v9);
      uint64_t v10 = [*(id *)(a1 + 88) systemApertureController];
      uint64_t v11 = [v10 registerElement:v9];
      id v12 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v11;

      objc_initWeak((id *)buf, (id)a1);
      uint64_t v13 = *(void **)(a1 + 48);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __72__SBFlashlightActivityManager__showFlashlightUnavailableAlertForReason___block_invoke;
      v14[3] = &unk_1E6AFFF18;
      objc_copyWeak(&v15, (id *)buf);
      [v13 addInvalidationBlock:v14];
      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)flashlightLevelDidChange:(unint64_t)a3
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFlashlightActivityManager _updateFlashlightElementsForReason:]((uint64_t)self, v4);
}

- (void)flashlightOverheatedDidChange:(BOOL)a3
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFlashlightActivityManager _updateFlashlightElementsForReason:]((uint64_t)self, v4);
}

- (void)flashlightActivityElementRequestsTogglingFlashlight:(id)a3
{
}

- (void)dynamicFlashlightActivityElementDidChangeIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5
{
  if (self) {
    self = (SBFlashlightActivityManager *)self->_flashlightController;
  }
  [(SBFlashlightActivityManager *)self setIntensity:a5 width:a3 animated:a4];
}

- (void)dynamicFlashlightActivityElementRequestsTogglingFlashlight
{
}

- (void)dynamicFlashlightActivityElementDidCollapse
{
}

- (void)dynamicFlashlightActivityElementDidUpdatePersistedIntensity:(double)a3 width:(double)a4
{
  if (self) {
    self = (SBFlashlightActivityManager *)self->_flashlightController;
  }
  *(float *)&a3 = a3;
  *(float *)&a4 = a4;
  [(SBFlashlightActivityManager *)self storeFlashlightIntensity:a3 width:a4];
}

- (id)_dynamicFlashlightState
{
  if (a1)
  {
    id v1 = *(id *)(a1 + 96);
    [v1 intensity];
    double v3 = v2;
    if (BSFloatIsZero())
    {
      +[SBDynamicFlashlightState offState];
    }
    else
    {
      [v1 width];
      +[SBDynamicFlashlightState onStateWithInitialIntensity:v3 width:v4];
    id v5 = };
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)_presentBanner
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    float v2 = [(id)SBApp bannerManager];
    if (!*(void *)(a1 + 72))
    {
      uint64_t v3 = objc_opt_new();
      float v4 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v3;

      uint64_t v5 = *(void *)(a1 + 72);
      uint64_t v6 = +[SBFlashlightPreviewPresentableViewController requesterIdentifier];
      [v2 registerAuthority:v5 forRequesterIdentifier:v6];
    }
    id v7 = (id *)(a1 + 56);
    id WeakRetained = (SBFlashlightPreviewPresentableViewController *)objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v9 = WeakRetained;
    if (!WeakRetained
      || (BOOL v10 = [(SBFlashlightPreviewPresentableViewController *)WeakRetained isFlashlightOn],
          v10 != ([*(id *)(a1 + 96) level] != 0)))
    {
      uint64_t v11 = -[SBFlashlightPreviewPresentableViewController initWithFlashlightOn:]([SBFlashlightPreviewPresentableViewController alloc], "initWithFlashlightOn:", [*(id *)(a1 + 96) level] != 0);

      objc_storeWeak(v7, v11);
      uint64_t v13 = *MEMORY[0x1E4FA7F98];
      v14[0] = &unk_1F334ABB0;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      [v2 postPresentable:v11 withOptions:1 userInfo:v12 error:0];

      uint64_t v9 = v11;
    }
  }
}

- (void)_dismissBanner
{
  if (a1)
  {
    id v1 = (id *)(a1 + 56);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      id v8 = WeakRetained;
      uint64_t v3 = [(id)SBApp bannerManager];
      float v4 = (void *)MEMORY[0x1E4F4F5E8];
      uint64_t v5 = [v8 requesterIdentifier];
      uint64_t v6 = [v4 identificationWithRequesterIdentifier:v5];
      id v7 = (id)[v3 revokePresentablesWithIdentification:v6 reason:@"action preview banner dismissed" options:0 userInfo:0 error:0];

      objc_storeWeak(v1, 0);
      id WeakRetained = v8;
    }
  }
}

void __66__SBFlashlightActivityManager__updateFlashlightElementsForReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained && WeakRetained[5] == v8)
  {
    WeakRetained[5] = 0;

    [v7[12] turnFlashlightOffForReason:v5 withCoolDown:1];
  }
}

void __72__SBFlashlightActivityManager__showFlashlightUnavailableAlertForReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    float v2 = (void *)WeakRetained[6];
    WeakRetained[6] = 0;
    uint64_t v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

- (BOOL)shouldShowDynamicFlashlightUI
{
  if (result) {
    return *(unsigned char *)(result + 81) != 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flashlightController, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_bannerAuthority, 0);
  objc_destroyWeak((id *)&self->_flashlightPreviewPresentableViewController);
  objc_storeStrong((id *)&self->_flashlightUnavailableAlertAssertion, 0);
  objc_storeStrong((id *)&self->_flashlightActivityAssertion, 0);
  objc_storeStrong((id *)&self->_compoundPreviewAssertion, 0);
  objc_destroyWeak((id *)&self->_dynamicFlashlightActivityElement);
  objc_destroyWeak((id *)&self->_flashlightUnavailableAlertElement);
  objc_destroyWeak((id *)&self->_flashlightActivityElement);
}

- (void)initWithWindowScene:(const char *)a1 flashlightController:.cold.1(const char *a1)
{
  id v1 = NSStringFromSelector(a1);
  float v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_updateFlashlightElementsForReason:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "(%{public}@) Recycling existing flashlight activity %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)previewFlashlightActivityForReason:(const char *)a1 .cold.1(const char *a1)
{
  id v1 = NSStringFromSelector(a1);
  float v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

- (void)toggleFlashlightForReason:(const char *)a1 .cold.1(const char *a1)
{
  id v1 = NSStringFromSelector(a1);
  float v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end