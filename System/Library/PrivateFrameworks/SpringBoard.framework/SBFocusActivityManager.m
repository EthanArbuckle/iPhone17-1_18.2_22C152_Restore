@interface SBFocusActivityManager
- (BOOL)setFocusWithModeIdentifier:(uint64_t)a1 active:(void *)a2 withReason:(int)a3;
- (BOOL)shouldPreviewSystemAction:(id)a3;
- (id)createPersistentFocusElementForActivityDescription:(id)a3 enabled:(BOOL)a4;
- (id)createPersistentFocusPickerElementForActivityDescription:(id)a3 enabled:(BOOL)a4;
- (id)initWithBannerPoster:(void *)a3 systemApertureElementRegistrar:;
- (id)previewFocusWithModeIdentifier:(void *)a3 withReason:;
- (uint64_t)toggleActivityPickerPresentation;
- (uint64_t)toggleFocusWithModeIdentifier:(void *)a3 withReason:;
- (void)_availableModesFetchQueue_fetchAvailableModes;
- (void)_handleFocusElementEvent:(uint64_t)a1;
- (void)_updateFocusElementWithReason:(uint64_t)a1;
- (void)bannerManager:(id)a3 willDismissPresentable:(id)a4 withTransitionCoordinator:(id)a5;
- (void)bannerManager:(id)a3 willPresentPresentable:(id)a4 withTransitionCoordinator:(id)a5;
- (void)focusActivityPickerTransientOverlayViewController:(id)a3 didDismiss:(BOOL)a4;
- (void)modeSelectionService:(id)a3 didReceiveAvailableModesUpdate:(id)a4;
- (void)modeSelectionService:(id)a3 didReceiveUpdatedActiveModeAssertion:(id)a4 stateUpdate:(id)a5;
@end

@implementation SBFocusActivityManager

- (id)initWithBannerPoster:(void *)a3 systemApertureElementRegistrar:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v23.receiver = a1;
    v23.super_class = (Class)SBFocusActivityManager;
    a1 = objc_msgSendSuper2(&v23, sel_init);
    if (a1)
    {
      uint64_t v7 = [MEMORY[0x1E4F62288] managerWithBannerPoster:v5 systemApertureElementRegistrar:v6];
      v8 = (void *)*((void *)a1 + 6);
      *((void *)a1 + 6) = v7;

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = objc_alloc_init(SBFocusActivityBannerAuthority);
        v10 = (void *)*((void *)a1 + 13);
        *((void *)a1 + 13) = v9;

        uint64_t v11 = *((void *)a1 + 13);
        id v12 = v5;
        v13 = +[SBFocusActivityBannerAuthority requesterIdentifier];
        [v12 registerAuthority:v11 forRequesterIdentifier:v13];

        [v12 addTransitionObserver:a1];
      }
      *((_DWORD *)a1 + 6) = 0;
      v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v15 = dispatch_queue_create("com.apple.springboard.focus-activity-manager.fetch", v14);
      v16 = (void *)*((void *)a1 + 4);
      *((void *)a1 + 4) = v15;

      uint64_t v17 = [MEMORY[0x1E4F5F6B8] serviceForClientIdentifier:@"com.apple.private.SpringBoard.focus.intents"];
      v18 = (void *)*((void *)a1 + 1);
      *((void *)a1 + 1) = v17;

      [*((id *)a1 + 1) addListener:a1 withCompletionHandler:0];
      v19 = *((void *)a1 + 4);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__SBFocusActivityManager_initWithBannerPoster_systemApertureElementRegistrar___block_invoke;
      block[3] = &unk_1E6AF4AC0;
      a1 = a1;
      id v22 = a1;
      dispatch_async(v19, block);
    }
  }

  return a1;
}

void __78__SBFocusActivityManager_initWithBannerPoster_systemApertureElementRegistrar___block_invoke(uint64_t a1)
{
}

- (void)_availableModesFetchQueue_fetchAvailableModes
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    uint64_t v2 = [*(id *)(a1 + 8) availableModesWithError:0];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    v3 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v2;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }
}

- (BOOL)setFocusWithModeIdentifier:(uint64_t)a1 active:(void *)a2 withReason:(int)a3
{
  id v5 = a2;
  if (a1)
  {
    id v6 = [*(id *)(a1 + 8) activeModeAssertionWithError:0];
    uint64_t v7 = v6;
    if (v6)
    {
      v8 = [v6 details];
      v9 = [v8 modeIdentifier];
      int v10 = [v9 isEqualToString:v5];
    }
    else
    {
      int v10 = 0;
    }
    id v11 = 0;
    if ((v10 & 1) == 0 && ((a3 ^ 1) & 1) == 0)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F5F700]);
      [v11 setIdentifier:@"com.apple.private.SpringBoard.focus.intents"];
      [v11 setModeIdentifier:v5];
      [v11 setReason:1];
      id v12 = [MEMORY[0x1E4F5F638] lifetimeUntilEndOfScheduleWithIdentifier:*MEMORY[0x1E4F5F520]];
      if (v12) {
        [v11 setLifetime:v12];
      }
    }
    if (v11) {
      char v13 = a3 ^ 1;
    }
    else {
      char v13 = 1;
    }
    if (v10 ^ 1 | a3) == 1 && (v13)
    {
      id v14 = 0;
    }
    else
    {
      dispatch_queue_t v15 = *(void **)(a1 + 8);
      id v20 = 0;
      char v16 = [v15 activateModeWithDetails:v11 error:&v20];
      id v14 = v20;
      if ((v16 & 1) == 0)
      {
        uint64_t v17 = SBLogFocusModes();
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
        if (a3)
        {
          if (v18) {
            -[SBFocusActivityManager setFocusWithModeIdentifier:active:withReason:]();
          }
        }
        else if (v18)
        {
          -[SBFocusActivityManager setFocusWithModeIdentifier:active:withReason:]();
        }
      }
    }
  }
  return a1 != 0;
}

- (uint64_t)toggleFocusWithModeIdentifier:(void *)a3 withReason:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = [*(id *)(a1 + 8) activeModeAssertionWithError:0];
    v8 = v7;
    int v12 = 1;
    if (v7)
    {
      v9 = [v7 details];
      int v10 = [v9 modeIdentifier];
      char v11 = [v10 isEqualToString:v5];

      if (v11) {
        int v12 = 0;
      }
    }
    a1 = -[SBFocusActivityManager setFocusWithModeIdentifier:active:withReason:](a1, v5, v12);
  }
  return a1;
}

- (uint64_t)toggleActivityPickerPresentation
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v2 = +[SBWorkspace mainWorkspace];
      uint64_t v3 = *(void *)(v1 + 40);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __58__SBFocusActivityManager_toggleActivityPickerPresentation__block_invoke;
      v8[3] = &unk_1E6AF4AC0;
      v8[4] = v1;
      uint64_t v4 = [v2 dismissTransientOverlayViewController:v3 animated:1 completion:v8];
    }
    else
    {
      id v5 = objc_alloc_init(SBFocusActivityPickerTransientOverlayViewController);
      id v6 = *(void **)(v1 + 40);
      *(void *)(v1 + 40) = v5;

      [*(id *)(v1 + 40) setDelegate:v1];
      uint64_t v2 = +[SBWorkspace mainWorkspace];
      uint64_t v4 = [v2 presentTransientOverlayViewController:*(void *)(v1 + 40) animated:1 completion:0];
    }
    uint64_t v1 = v4;
  }
  return v1;
}

void __58__SBFocusActivityManager_toggleActivityPickerPresentation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)focusActivityPickerTransientOverlayViewController:(id)a3 didDismiss:(BOOL)a4
{
  transientOverlay = self->_transientOverlay;
  self->_transientOverlay = 0;
}

- (id)previewFocusWithModeIdentifier:(void *)a3 withReason:
{
  id v6 = a2;
  id v7 = a3;
  v8 = v7;
  if (a1)
  {
    if (!v7)
    {
      v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"reason != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBFocusActivityManager previewFocusWithModeIdentifier:withReason:](sel_previewFocusWithModeIdentifier_withReason_, a1, (uint64_t)v25);
      }
      [v25 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8CDC220);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    id v9 = v6;
    id v10 = v6;
    uint64_t v11 = *MEMORY[0x1E4FA6960];
    id v12 = v10;
    if ([v10 isEqualToString:*MEMORY[0x1E4FA6960]])
    {
      id v12 = v10;
      if ([v10 isEqualToString:*(void *)(a1 + 88)])
      {
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
        id v13 = *(id *)(a1 + 96);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
        if (v13)
        {
          id v12 = v13;
          id v14 = v10;
        }
        else if ([WeakRetained isActivityEnabled])
        {
          id v14 = [WeakRetained activityDescription];
          id v12 = [v14 activityIdentifier];
        }
        else
        {
          id v14 = [MEMORY[0x1E4F62278] sharedActivityManager];
          v26 = [v14 defaultActivity];
          id v12 = [v26 activityIdentifier];
        }
      }
    }
    int v15 = [*(id *)(a1 + 88) isEqualToString:v11];
    if (v15 != [v10 isEqualToString:v11]
      || WeakRetained
      && ([WeakRetained activityDescription],
          char v16 = objc_claimAutoreleasedReturnValue(),
          [v16 activityIdentifier],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          char v18 = [v17 isEqualToString:v12],
          v17,
          v16,
          (v18 & 1) == 0))
    {
      [*(id *)(a1 + 64) invalidateWithReason:@"Previewing activity changed"];
      objc_storeWeak((id *)(a1 + 72), 0);
    }
    objc_storeStrong((id *)(a1 + 88), a2);
    objc_initWeak(&location, (id)a1);
    uint64_t v19 = *(void *)(a1 + 56);
    id v6 = v9;
    if (!v19)
    {
      id v20 = [SBSystemActionCompoundPreviewAssertion alloc];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __68__SBFocusActivityManager_previewFocusWithModeIdentifier_withReason___block_invoke;
      v30[3] = &unk_1E6AFFF40;
      objc_copyWeak(&v31, &location);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __68__SBFocusActivityManager_previewFocusWithModeIdentifier_withReason___block_invoke_2;
      v28[3] = &unk_1E6AFB5B8;
      objc_copyWeak(&v29, &location);
      v21 = -[SBSystemActionCompoundPreviewAssertion initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:](v20, @"FocusActivity", v30, v28);
      id v22 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v21;

      objc_destroyWeak(&v29);
      objc_destroyWeak(&v31);
      uint64_t v19 = *(void *)(a1 + 56);
    }
    objc_super v23 = -[SBSystemActionCompoundPreviewAssertion acquireForReason:](v19, v8);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_super v23 = 0;
  }

  return v23;
}

void __68__SBFocusActivityManager_previewFocusWithModeIdentifier_withReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBFocusActivityManager _updateFocusElementWithReason:]((uint64_t)WeakRetained, @"Preview state changed");
}

- (void)_updateFocusElementWithReason:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = SBLogFocusModes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = a1;
      __int16 v21 = 2114;
      id v22 = v3;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) Updating focus element for reason: '%{public}@'", buf, 0x16u);
    }

    unsigned int v5 = -[SBSystemActionCompoundPreviewAssertion state](*(void *)(a1 + 56));
    id v6 = *(id *)(a1 + 64);
    int v7 = [v6 isValid];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    id v9 = [WeakRetained view];
    objc_msgSend(v9, "sb_setInflated:", (v5 >> 8) & 1);

    if (!(v5 & 1) | v7 & 1)
    {
      if ((v5 & 1) == 0 && ((v7 ^ 1) & 1) == 0) {
        [v6 invalidateWithReason:v3];
      }
    }
    else
    {
      int v10 = [*(id *)(a1 + 88) isEqualToString:*MEMORY[0x1E4FA6960]];
      uint64_t v11 = *(void **)(a1 + 48);
      if (v10) {
        [v11 postPersistentActivityPickerWithSystemApertureElementProvider:a1];
      }
      else {
      uint64_t v12 = [v11 postPersistentActivityWithModeIdentifier:*(void *)(a1 + 88) systemApertureElementProvider:a1];
      }
      id v13 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v12;

      objc_initWeak((id *)buf, (id)a1);
      id v14 = *(void **)(a1 + 64);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __56__SBFocusActivityManager__updateFocusElementWithReason___block_invoke;
      v17[3] = &unk_1E6AFFF18;
      objc_copyWeak(&v18, (id *)buf);
      [v14 addInvalidationBlock:v17];
      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
    id v15 = objc_loadWeakRetained((id *)(a1 + 72));
    char v16 = v15;
    if (v15)
    {
      [v15 setPreviewing:v5 & 1];
      [v16 setUrgent:HIBYTE(v5) & 1];
      [v16 setExpanding:(v5 >> 8) & 1];
      [v16 setProminent:HIWORD(v5) & 1];
    }
  }
}

void __68__SBFocusActivityManager_previewFocusWithModeIdentifier_withReason___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBFocusActivityManager _handleFocusElementEvent:]((uint64_t)WeakRetained, a3);
}

- (void)_handleFocusElementEvent:(uint64_t)a1
{
  if (a1 && !a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained pop];
  }
}

- (BOOL)shouldPreviewSystemAction:(id)a3
{
  uint64_t v4 = [a3 configuredAction];
  unsigned int v5 = [v4 identifier];
  int v6 = [v5 hasSuffix:*MEMORY[0x1E4FA6948]];

  if (v6)
  {
    int v7 = objc_msgSend(v4, "sb_configuredIntentAction");
    v8 = -[WFConfiguredStaccatoIntentAction sb_focusModeIdentifier](v7);

    if ([v8 isEqualToString:*MEMORY[0x1E4FA6960]])
    {
      BOOL v9 = 1;
    }
    else
    {
      p_modesLock = &self->_modesLock;
      os_unfair_lock_lock(&self->_modesLock);
      uint64_t v11 = self->_availableModes;
      os_unfair_lock_unlock(p_modesLock);
      if (v11)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __52__SBFocusActivityManager_shouldPreviewSystemAction___block_invoke;
        v14[3] = &unk_1E6B09F10;
        id v15 = v8;
        uint64_t v12 = [(NSSet *)v11 bs_firstObjectPassingTest:v14];
        BOOL v9 = v12 != 0;
      }
      else
      {
        BOOL v9 = 1;
      }
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

uint64_t __52__SBFocusActivityManager_shouldPreviewSystemAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 modeIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)createPersistentFocusElementForActivityDescription:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [[SBFocusEnablementIndicatorSystemApertureActivityElement alloc] initWithActivityDescription:v6 enabled:v4];

  objc_storeWeak((id *)&self->_focusElement, v7);
  return v7;
}

- (id)createPersistentFocusPickerElementForActivityDescription:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(FCUIFocusEnablementIndicatorSystemApertureElement *)[SBFocusEnablementIndicatorSystemApertureActivityElement alloc] initForPickerWithActivityDescription:v6 enabled:v4];

  objc_storeWeak((id *)&self->_focusElement, v7);
  return v7;
}

- (void)modeSelectionService:(id)a3 didReceiveAvailableModesUpdate:(id)a4
{
  p_modesLock = &self->_modesLock;
  id v6 = a4;
  os_unfair_lock_lock(p_modesLock);
  id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];

  availableModes = self->_availableModes;
  self->_availableModes = v7;

  os_unfair_lock_unlock(p_modesLock);
}

- (void)modeSelectionService:(id)a3 didReceiveUpdatedActiveModeAssertion:(id)a4 stateUpdate:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  os_unfair_lock_lock(&self->_modesLock);
  v8 = [v7 state];

  if ([v8 isActive])
  {
    BOOL v9 = [v12 details];
    int v10 = [v9 modeIdentifier];
    activeModeIdentifier = self->_activeModeIdentifier;
    self->_activeModeIdentifier = v10;
  }
  else
  {
    BOOL v9 = self->_activeModeIdentifier;
    self->_activeModeIdentifier = 0;
  }

  os_unfair_lock_unlock(&self->_modesLock);
}

void __56__SBFocusActivityManager__updateFocusElementWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 8) == v5)
  {
    *((void *)WeakRetained + 8) = 0;
  }
}

- (void)bannerManager:(id)a3 willPresentPresentable:(id)a4 withTransitionCoordinator:(id)a5
{
  id v10 = a4;
  id v6 = [v10 requesterIdentifier];
  id v7 = +[SBFocusActivityBannerAuthority requesterIdentifier];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    BOOL v9 = UIViewControllerFromPresentable();
    objc_storeWeak((id *)&self->_focusPresentable, v9);
  }
}

- (void)bannerManager:(id)a3 willDismissPresentable:(id)a4 withTransitionCoordinator:(id)a5
{
  id v11 = a4;
  id v6 = [v11 requesterIdentifier];
  id v7 = +[SBFocusActivityBannerAuthority requesterIdentifier];
  if ([v6 isEqualToString:v7])
  {
    p_focusPresentable = &self->_focusPresentable;
    id WeakRetained = objc_loadWeakRetained((id *)p_focusPresentable);
    int v10 = [WeakRetained isEqual:v11];

    if (v10) {
      objc_storeWeak((id *)p_focusPresentable, 0);
    }
  }
  else
  {
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusBannerAuthority, 0);
  objc_storeStrong((id *)&self->_activeModeIdentifier, 0);
  objc_storeStrong((id *)&self->_previewingModeIdentifier, 0);
  objc_destroyWeak((id *)&self->_focusPresentable);
  objc_destroyWeak((id *)&self->_focusElement);
  objc_storeStrong((id *)&self->_focusElementAssertion, 0);
  objc_storeStrong((id *)&self->_compoundPreviewAssertion, 0);
  objc_storeStrong((id *)&self->_focusEnablementIndicatorManager, 0);
  objc_storeStrong((id *)&self->_transientOverlay, 0);
  objc_storeStrong((id *)&self->_availableModesFetchQueue, 0);
  objc_storeStrong((id *)&self->_availableModes, 0);
  objc_storeStrong((id *)&self->_modeSelectionService, 0);
}

- (void)setFocusWithModeIdentifier:active:withReason:.cold.1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v0, v1, "Failed to activate Focus: %{public}@; error: %{public}@");
}

- (void)setFocusWithModeIdentifier:active:withReason:.cold.2()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v0, v1, "Failed to deactivate Focus: %{public}@; error: %{public}@");
}

- (void)previewFocusWithModeIdentifier:(uint64_t)a3 withReason:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  BOOL v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  id v15 = @"SBFocusActivityManager.m";
  __int16 v16 = 1024;
  int v17 = 427;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end