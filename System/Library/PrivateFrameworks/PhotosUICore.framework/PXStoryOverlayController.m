@interface PXStoryOverlayController
- (BOOL)preventAnimatingNextRelatedOverlayVisibilityFractionChange;
- (PXNumberAnimator)chromeVisibilityFractionAnimator;
- (PXNumberAnimator)fadeOutOverlayVisibilityFractionAnimator;
- (PXNumberAnimator)infoPanelVisibilityFractionAnimator;
- (PXNumberAnimator)relatedOverlayVisibilityFractionAnimator;
- (PXNumberAnimator)scrubberVisibilityFractionAnimator;
- (PXNumberAnimator)styleSwitcherVisibilityFractionAnimator;
- (PXStoryModel)mainModel;
- (PXStoryOverlayController)initWithObservableModel:(id)a3;
- (PXStoryOverlayController)initWithViewModel:(id)a3;
- (PXStoryViewModel)viewModel;
- (void)_invalidateChromeItems;
- (void)_invalidateChromeVisibilityFraction;
- (void)_invalidateChromeVisibilityFractionAnimator;
- (void)_invalidateFadeOutOverlayVisibilityFraction;
- (void)_invalidateFadeOutOverlayVisibilityFractionAnimator;
- (void)_invalidateInfoPanelVisibilityFraction;
- (void)_invalidateInfoPanelVisibilityFractionAnimator;
- (void)_invalidateMainModel;
- (void)_invalidateRelatedOverlayVisibilityFraction;
- (void)_invalidateRelatedOverlayVisibilityFractionAnimator;
- (void)_invalidateRelatedOverlayVisible;
- (void)_invalidateScrubberVisibilityFraction;
- (void)_invalidateScrubberVisibilityFractionAnimator;
- (void)_invalidateStyleSwitcherVisibilityFraction;
- (void)_invalidateStyleSwitcherVisibilityFractionAnimator;
- (void)_updateAnimator:(id)a3 endValue:(double)a4 animated:(BOOL)a5;
- (void)_updateChromeItems;
- (void)_updateChromeVisibilityFraction;
- (void)_updateChromeVisibilityFractionAnimator;
- (void)_updateFadeOutOverlayVisibilityFraction;
- (void)_updateFadeOutOverlayVisibilityFractionAnimator;
- (void)_updateInfoPanelVisibilityFraction;
- (void)_updateInfoPanelVisibilityFractionAnimator;
- (void)_updateMainModel;
- (void)_updateRelatedOverlayVisibilityFraction;
- (void)_updateRelatedOverlayVisibilityFractionAnimator;
- (void)_updateRelatedOverlayVisible;
- (void)_updateScrubberVisibilityFraction;
- (void)_updateScrubberVisibilityFractionAnimator;
- (void)_updateStyleSwitcherVisibilityFraction;
- (void)_updateStyleSwitcherVisibilityFractionAnimator;
- (void)configureUpdater:(id)a3;
- (void)handleModelChange:(unint64_t)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setMainModel:(id)a3;
- (void)setPreventAnimatingNextRelatedOverlayVisibilityFractionChange:(BOOL)a3;
@end

@implementation PXStoryOverlayController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoPanelVisibilityFractionAnimator, 0);
  objc_storeStrong((id *)&self->_fadeOutOverlayVisibilityFractionAnimator, 0);
  objc_storeStrong((id *)&self->_relatedOverlayVisibilityFractionAnimator, 0);
  objc_storeStrong((id *)&self->_styleSwitcherVisibilityFractionAnimator, 0);
  objc_storeStrong((id *)&self->_scrubberVisibilityFractionAnimator, 0);
  objc_storeStrong((id *)&self->_chromeVisibilityFractionAnimator, 0);
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_destroyWeak((id *)&self->_viewModel);
}

- (void)setPreventAnimatingNextRelatedOverlayVisibilityFractionChange:(BOOL)a3
{
  self->_preventAnimatingNextRelatedOverlayVisibilityFractionChange = a3;
}

- (BOOL)preventAnimatingNextRelatedOverlayVisibilityFractionChange
{
  return self->_preventAnimatingNextRelatedOverlayVisibilityFractionChange;
}

- (PXNumberAnimator)infoPanelVisibilityFractionAnimator
{
  return self->_infoPanelVisibilityFractionAnimator;
}

- (PXNumberAnimator)fadeOutOverlayVisibilityFractionAnimator
{
  return self->_fadeOutOverlayVisibilityFractionAnimator;
}

- (PXNumberAnimator)relatedOverlayVisibilityFractionAnimator
{
  return self->_relatedOverlayVisibilityFractionAnimator;
}

- (PXNumberAnimator)styleSwitcherVisibilityFractionAnimator
{
  return self->_styleSwitcherVisibilityFractionAnimator;
}

- (PXNumberAnimator)scrubberVisibilityFractionAnimator
{
  return self->_scrubberVisibilityFractionAnimator;
}

- (PXNumberAnimator)chromeVisibilityFractionAnimator
{
  return self->_chromeVisibilityFractionAnimator;
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (PXStoryViewModel)viewModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  return (PXStoryViewModel *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)ChromeVisibilityFractionAnimatorObservationContext == a5)
  {
    if ((a4 & 2) == 0) {
      goto LABEL_33;
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke;
    v22[3] = &unk_1E5DD1E50;
    v22[4] = self;
    v9 = v22;
    goto LABEL_32;
  }
  if ((void *)RelatedOverlayVisibilityFractionAnimatorObservationContext == a5)
  {
    if ((a4 & 2) == 0) {
      goto LABEL_33;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_2;
    v21[3] = &unk_1E5DD1E50;
    v21[4] = self;
    v9 = v21;
    goto LABEL_32;
  }
  if ((void *)ScrubberVisibilityFractionAnimatorObservationContext == a5)
  {
    if ((a4 & 2) == 0) {
      goto LABEL_33;
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_3;
    v20[3] = &unk_1E5DD1E50;
    v20[4] = self;
    v9 = v20;
    goto LABEL_32;
  }
  if ((void *)StyleSwitcherVisibilityFractionAnimatorObservationContext == a5)
  {
    if ((a4 & 2) == 0) {
      goto LABEL_33;
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_4;
    v19[3] = &unk_1E5DD1E50;
    v19[4] = self;
    v9 = v19;
    goto LABEL_32;
  }
  if ((void *)FadeOutOverlayVisibilityFractionAnimatorObservationContext == a5)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_5;
    v18[3] = &unk_1E5DD1E50;
    v18[4] = self;
    v9 = v18;
    goto LABEL_32;
  }
  if ((void *)InfoPanelVisibilityFractionAnimatorObservationContext == a5)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_6;
    v17[3] = &unk_1E5DD1E50;
    v17[4] = self;
    v9 = v17;
    goto LABEL_32;
  }
  if ((void *)MainModelObservationContext_209254 != a5)
  {
    if ((void *)ViewModelObservationContext_209255 != a5)
    {
      v10.receiver = self;
      v10.super_class = (Class)PXStoryOverlayController;
      [(PXStoryController *)&v10 observable:v8 didChange:a4 context:a5];
      goto LABEL_33;
    }
    if ((a4 & 0x800000000000008) == 0) {
      goto LABEL_33;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_12;
    v11[3] = &unk_1E5DD1E50;
    v11[4] = self;
    v9 = v11;
LABEL_32:
    [(PXStoryController *)self performChanges:v9];
    goto LABEL_33;
  }
  if ((a4 & 0x200000210004) != 0)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_7;
    v16[3] = &unk_1E5DD1E50;
    v16[4] = self;
    [(PXStoryController *)self performChanges:v16];
  }
  if ((a4 & 0x98200000000) != 0)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_8;
    v15[3] = &unk_1E5DD1E50;
    v15[4] = self;
    [(PXStoryController *)self performChanges:v15];
  }
  if ((a4 & 0x400004000000) != 0)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_9;
    v14[3] = &unk_1E5DD1E50;
    v14[4] = self;
    [(PXStoryController *)self performChanges:v14];
  }
  if ((a4 & 0x400000000000000) != 0)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_10;
    v13[3] = &unk_1E5DD1E50;
    v13[4] = self;
    [(PXStoryController *)self performChanges:v13];
  }
  if ((a4 & 8) != 0)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_11;
    v12[3] = &unk_1E5DD1E50;
    v12[4] = self;
    v9 = v12;
    goto LABEL_32;
  }
LABEL_33:
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateChromeVisibilityFraction];
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateRelatedOverlayVisibilityFraction];
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateScrubberVisibilityFraction];
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateStyleSwitcherVisibilityFraction];
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateFadeOutOverlayVisibilityFraction];
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateInfoPanelVisibilityFraction];
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateChromeItems];
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateRelatedOverlayVisible];
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateFadeOutOverlayVisibilityFractionAnimator];
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateInfoPanelVisibilityFractionAnimator];
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateChromeItems];
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateChromeItems];
}

- (void)handleModelChange:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryOverlayController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PXStoryOverlayController_handleModelChange___block_invoke;
  v5[3] = &unk_1E5DC5400;
  v5[4] = self;
  v5[5] = a3;
  [(PXStoryController *)self performChanges:v5];
}

void __46__PXStoryOverlayController_handleModelChange___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 40);
  if ((v3 & 8) != 0)
  {
    [*(id *)(a1 + 32) _invalidateChromeVisibilityFraction];
    [*(id *)(a1 + 32) _invalidateChromeVisibilityFractionAnimator];
    uint64_t v3 = *(void *)(a1 + 40);
    if ((v3 & 0x2000000) == 0)
    {
LABEL_3:
      if ((v3 & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((v3 & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  [*(id *)(a1 + 32) _invalidateScrubberVisibilityFractionAnimator];
  uint64_t v3 = *(void *)(a1 + 40);
  if ((v3 & 0x2000) == 0)
  {
LABEL_4:
    if ((v3 & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
LABEL_8:
  [*(id *)(a1 + 32) _invalidateStyleSwitcherVisibilityFractionAnimator];
  uint64_t v3 = *(void *)(a1 + 40);
  if ((v3 & 0x8000) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  [*(id *)(a1 + 32) _invalidateRelatedOverlayVisibilityFractionAnimator];
  uint64_t v3 = *(void *)(a1 + 40);
  if ((v3 & 0x40) != 0)
  {
    [*(id *)(a1 + 32) setPreventAnimatingNextRelatedOverlayVisibilityFractionChange:1];
    uint64_t v3 = *(void *)(a1 + 40);
  }
LABEL_11:
  if ((v3 & 0x4001000202000) != 0)
  {
    [*(id *)(a1 + 32) _invalidateRelatedOverlayVisible];
    uint64_t v3 = *(void *)(a1 + 40);
  }
  if ((v3 & 0x40) != 0)
  {
    [*(id *)(a1 + 32) _invalidateMainModel];
    uint64_t v3 = *(void *)(a1 + 40);
  }
  if ((v3 & 0x4028AA8A022) != 0) {
    [*(id *)(a1 + 32) _invalidateChromeItems];
  }
}

- (void)_updateRelatedOverlayVisibilityFraction
{
  uint64_t v3 = [(PXStoryOverlayController *)self viewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__PXStoryOverlayController__updateRelatedOverlayVisibilityFraction__block_invoke;
  v4[3] = &unk_1E5DD1EF0;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __67__PXStoryOverlayController__updateRelatedOverlayVisibilityFraction__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 relatedOverlayVisibilityFractionAnimator];
  [v4 presentationValue];
  objc_msgSend(v3, "setRelatedOverlayVisibilityFraction:");
}

- (void)_invalidateRelatedOverlayVisibilityFraction
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateRelatedOverlayVisibilityFraction];
}

- (void)_updateRelatedOverlayVisibilityFractionAnimator
{
  BOOL v3 = [(PXStoryOverlayController *)self preventAnimatingNextRelatedOverlayVisibilityFractionChange];
  [(PXStoryOverlayController *)self setPreventAnimatingNextRelatedOverlayVisibilityFractionChange:0];
  id v4 = [(PXStoryOverlayController *)self relatedOverlayVisibilityFractionAnimator];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PXStoryOverlayController__updateRelatedOverlayVisibilityFractionAnimator__block_invoke;
  aBlock[3] = &unk_1E5DD0FD0;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  if (v3) {
    [v4 performChangesWithoutAnimation:v5];
  }
  else {
    [v4 performChangesUsingDefaultSpringAnimationWithInitialVelocity:v5 changes:0.0];
  }
}

void __75__PXStoryOverlayController__updateRelatedOverlayVisibilityFractionAnimator__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v2 viewModel];
  int v4 = [v6 wantsRelatedOverlayVisible];
  double v5 = 0.0;
  if (v4) {
    double v5 = 1.0;
  }
  [v3 setValue:v5];
}

- (void)_invalidateRelatedOverlayVisibilityFractionAnimator
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateRelatedOverlayVisibilityFractionAnimator];
}

- (void)_updateStyleSwitcherVisibilityFraction
{
  id v3 = [(PXStoryOverlayController *)self viewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__PXStoryOverlayController__updateStyleSwitcherVisibilityFraction__block_invoke;
  v4[3] = &unk_1E5DD1EF0;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __66__PXStoryOverlayController__updateStyleSwitcherVisibilityFraction__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 styleSwitcherVisibilityFractionAnimator];
  [v4 presentationValue];
  objc_msgSend(v3, "setStyleSwitcherVisibilityFraction:");
}

- (void)_invalidateStyleSwitcherVisibilityFraction
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateStyleSwitcherVisibilityFraction];
}

- (void)_updateScrubberVisibilityFraction
{
  id v3 = [(PXStoryOverlayController *)self viewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__PXStoryOverlayController__updateScrubberVisibilityFraction__block_invoke;
  v4[3] = &unk_1E5DD1EF0;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __61__PXStoryOverlayController__updateScrubberVisibilityFraction__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 scrubberVisibilityFractionAnimator];
  [v4 presentationValue];
  objc_msgSend(v3, "setScrubberVisibilityFraction:");
}

- (void)_invalidateScrubberVisibilityFraction
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateScrubberVisibilityFraction];
}

- (void)_updateAnimator:(id)a3 endValue:(double)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PXStoryOverlayController__updateAnimator_endValue_animated___block_invoke;
  aBlock[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
  *(double *)&aBlock[4] = a4;
  id v6 = a3;
  v7 = _Block_copy(aBlock);
  if (v5) {
    [v6 performChangesUsingDefaultSpringAnimationWithInitialVelocity:v7 changes:0.0];
  }
  else {
    [v6 performChangesWithoutAnimation:v7];
  }
}

uint64_t __62__PXStoryOverlayController__updateAnimator_endValue_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

- (void)_updateInfoPanelVisibilityFraction
{
  id v3 = [(PXStoryOverlayController *)self mainModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__PXStoryOverlayController__updateInfoPanelVisibilityFraction__block_invoke;
  v4[3] = &unk_1E5DCEE38;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __62__PXStoryOverlayController__updateInfoPanelVisibilityFraction__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 infoPanelVisibilityFractionAnimator];
  [v4 presentationValue];
  objc_msgSend(v3, "setInfoPanelVisibilityFraction:");
}

- (void)_invalidateInfoPanelVisibilityFraction
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateInfoPanelVisibilityFraction];
}

- (void)_updateInfoPanelVisibilityFractionAnimator
{
  id v6 = [(PXStoryOverlayController *)self infoPanelVisibilityFractionAnimator];
  id v3 = [(PXStoryOverlayController *)self mainModel];
  [v3 desiredInfoPanelVisibilityFraction];
  double v5 = v4;

  [(PXStoryOverlayController *)self _updateAnimator:v6 endValue:1 animated:v5];
}

- (void)_invalidateInfoPanelVisibilityFractionAnimator
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateInfoPanelVisibilityFractionAnimator];
}

- (void)_updateFadeOutOverlayVisibilityFraction
{
  id v3 = [(PXStoryOverlayController *)self viewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__PXStoryOverlayController__updateFadeOutOverlayVisibilityFraction__block_invoke;
  v4[3] = &unk_1E5DD1EF0;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __67__PXStoryOverlayController__updateFadeOutOverlayVisibilityFraction__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 fadeOutOverlayVisibilityFractionAnimator];
  [v4 presentationValue];
  objc_msgSend(v3, "setFadeOutOverlayVisibilityFraction:");
}

- (void)_invalidateFadeOutOverlayVisibilityFraction
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateFadeOutOverlayVisibilityFraction];
}

- (void)_updateFadeOutOverlayVisibilityFractionAnimator
{
  id v6 = [(PXStoryOverlayController *)self fadeOutOverlayVisibilityFractionAnimator];
  id v3 = [(PXStoryOverlayController *)self mainModel];
  [v3 outroFractionCompleted];
  double v5 = v4;

  [(PXStoryOverlayController *)self _updateAnimator:v6 endValue:1 animated:v5];
}

- (void)_invalidateFadeOutOverlayVisibilityFractionAnimator
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateFadeOutOverlayVisibilityFractionAnimator];
}

- (void)_updateStyleSwitcherVisibilityFractionAnimator
{
  id v10 = [(PXStoryOverlayController *)self styleSwitcherVisibilityFractionAnimator];
  id v3 = [(PXStoryOverlayController *)self viewModel];
  uint64_t v4 = [v3 viewMode];

  if (v4 == 4)
  {
    double v5 = 1.0;
    uint64_t v6 = 1;
  }
  else
  {
    v7 = [(PXStoryOverlayController *)self viewModel];
    id v8 = [v7 mainConfiguration];
    int v9 = [v8 isAppleMusicPreview];

    uint64_t v6 = v9 ^ 1u;
    double v5 = 0.0;
    if (v9) {
      double v5 = 1.0;
    }
  }
  [(PXStoryOverlayController *)self _updateAnimator:v10 endValue:v6 animated:v5];
}

- (void)_invalidateStyleSwitcherVisibilityFractionAnimator
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateStyleSwitcherVisibilityFractionAnimator];
}

- (void)_updateScrubberVisibilityFractionAnimator
{
  id v5 = [(PXStoryOverlayController *)self scrubberVisibilityFractionAnimator];
  id v3 = [(PXStoryOverlayController *)self viewModel];
  if ([v3 wantsScrubberVisible]) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }

  [(PXStoryOverlayController *)self _updateAnimator:v5 endValue:1 animated:v4];
}

- (void)_invalidateScrubberVisibilityFractionAnimator
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateScrubberVisibilityFractionAnimator];
}

- (void)_updateChromeVisibilityFraction
{
  id v3 = [(PXStoryOverlayController *)self viewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__PXStoryOverlayController__updateChromeVisibilityFraction__block_invoke;
  v4[3] = &unk_1E5DD1EF0;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __59__PXStoryOverlayController__updateChromeVisibilityFraction__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = a2;
  id v3 = [v2 chromeVisibilityFractionAnimator];
  [v3 presentationValue];
  double v5 = v4;

  [v6 setChromeVisibilityFraction:v5];
}

- (void)_invalidateChromeVisibilityFraction
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateChromeVisibilityFraction];
}

- (void)_updateChromeVisibilityFractionAnimator
{
  id v5 = [(PXStoryOverlayController *)self chromeVisibilityFractionAnimator];
  id v3 = [(PXStoryOverlayController *)self viewModel];
  if ([v3 wantsChromeVisible]) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }

  [(PXStoryOverlayController *)self _updateAnimator:v5 endValue:1 animated:v4];
}

- (void)_invalidateChromeVisibilityFractionAnimator
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateChromeVisibilityFractionAnimator];
}

- (void)_updateRelatedOverlayVisible
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXStoryOverlayController *)self viewModel];
  if (([v3 isPerformingViewControllerTransition] & 1) == 0)
  {
    if (![v3 isAtPlaybackEnd] || objc_msgSend(v3, "viewMode") != 1) {
      goto LABEL_9;
    }
    double v4 = [v3 mainConfiguration];
    if ([v4 isAppleMusicPreview]) {
      goto LABEL_8;
    }
    id v5 = [v3 mainConfiguration];
    if (([v5 shouldDismissAtEnd] & 1) != 0
      || [v3 isPerformingViewControllerTransition])
    {

LABEL_8:
LABEL_9:
      char v6 = 0;
LABEL_10:
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __56__PXStoryOverlayController__updateRelatedOverlayVisible__block_invoke;
      v15[3] = &__block_descriptor_33_e35_v16__0___PXStoryMutableViewModel__8l;
      char v16 = v6;
      [v3 performChanges:v15];
      goto LABEL_11;
    }
    char v7 = [v3 shouldAutoReplayPreference];

    if (v7) {
      goto LABEL_9;
    }
    if ([v3 wantsRelatedOverlayVisible])
    {
      char v6 = 1;
      goto LABEL_10;
    }
    id v18 = 0;
    char v8 = [v3 checkIfShouldPreventAdvancingAndReturnReason:&v18];
    id v9 = v18;
    id v10 = v9;
    if (v8)
    {
      id v11 = v9;
    }
    else
    {
      v12 = [(PXStoryOverlayController *)self mainModel];
      id v17 = 0;
      int v13 = [v12 checkIfShouldPreventAdvancingAndReturnReason:&v17];
      id v11 = v17;

      if (!v13)
      {
        char v6 = 1;
LABEL_22:

        goto LABEL_10;
      }
    }
    v14 = PLStoryGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v11;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEBUG, "preventing overlay from becoming visible for reason: %@", buf, 0xCu);
    }

    char v6 = 0;
    goto LABEL_22;
  }
LABEL_11:
}

uint64_t __56__PXStoryOverlayController__updateRelatedOverlayVisible__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setWantsRelatedOverlayVisible:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_invalidateRelatedOverlayVisible
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateRelatedOverlayVisible];
}

- (void)_updateChromeItems
{
  double v4 = [(PXStoryOverlayController *)self viewModel];
  id v5 = [(PXStoryOverlayController *)self mainModel];
  char v6 = [v4 wantsChromeVisible];
  char v7 = [v4 viewLayoutSpec];
  char v8 = +[PXStorySettings sharedInstance];
  if (![v4 wantsRelatedOverlayVisible])
  {
    if ([v5 viewMode] == 1
      && [v5 readinessStatus] == 1
      && [v8 playerShowsBufferingStatus]
      && (![v4 wantsScrubberVisible]
       || [v8 wantsBufferingIndicatorOverScrubber]
       && ([v5 isScrolling] & 1) == 0
       && ([v4 isScrubbing] & 1) == 0))
    {
      uint64_t v11 = 0x8000;
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v10 = v11 | [v7 canShowCloseButton];
    uint64_t v12 = [v4 viewMode];
    switch(v12)
    {
      case 0:
        goto LABEL_32;
      case 1:
        uint64_t v13 = [v7 fullsizePlayerDefaultChromeItems] | v10;
        if ([v8 allowAspectModeToggle])
        {
          uint64_t v14 = v13 | 0x4000;
        }
        else
        {
          v23 = [(PXStoryOverlayController *)self mainModel];
          v24 = [v23 extendedTraitCollection];
          uint64_t v25 = [v24 userInterfaceIdiom];

          if ([v8 showStyleSwitcher])
          {
            uint64_t v26 = 512;
            if (v25 == 5) {
              uint64_t v26 = 1073742336;
            }
            uint64_t v14 = v26 | v13;
          }
          else
          {
            int v27 = [v8 showMusicAndColorGradeEditor];
            uint64_t v28 = v13 | 0x18;
            if (!v27) {
              uint64_t v28 = v13;
            }
            uint64_t v14 = v28 | 0x20;
          }
        }
        v29 = [v5 timeline];
        uint64_t v30 = [v29 firstSegmentIdentifier];
        uint64_t v39 = 0;
        double v40 = 0.0;
        uint64_t v41 = 0;
        if (v5)
        {
          [v5 currentScrollPosition];
          double v31 = v40;
          v32 = &v41;
          if (v40 <= 0.5) {
            v32 = &v39;
          }
          uint64_t v33 = *v32;
        }
        else
        {
          uint64_t v33 = 0;
        }
        int v34 = objc_msgSend(v8, "preferTopChromeItemsInAppNavigationBar", v31);
        if (v30 == v33) {
          int v35 = 1;
        }
        else {
          int v35 = v34;
        }
        if (v35) {
          uint64_t v36 = v14;
        }
        else {
          uint64_t v36 = v14 | 0xC00;
        }
        if ([v4 edgeToHighlight] == 2) {
          v36 |= 0x1000uLL;
        }
        if ([v4 edgeToHighlight] == 8) {
          v36 |= 0x2000uLL;
        }
        if ([v4 shouldShowErrorIndicator]) {
          uint64_t v10 = v36 | 0x10000;
        }
        else {
          uint64_t v10 = v36;
        }
        if ([v7 canShowMuteToggleButton]
          && (([v4 wantsChromeVisible] & 1) != 0
           || [v4 canShowMuteToggleButtonWhenChromeIsHidden]))
        {
          v10 |= 0x1000000uLL;
        }

        goto LABEL_28;
      case 2:
        if ([v4 isInSelectMode]) {
          goto LABEL_26;
        }
        if (([v8 preferTopChromeItemsInAppNavigationBar] & 1) == 0)
        {
          int v21 = [v7 insideCollectionDetailsView];
          uint64_t v22 = 536874050;
          if (v21) {
            uint64_t v22 = -1610609598;
          }
          uint64_t v10 = v11 | v22 | 0x20000;
        }
        goto LABEL_27;
      case 3:
        goto LABEL_28;
      case 4:
        uint64_t v10 = v11;
        goto LABEL_28;
      case 5:
        uint64_t v10 = v11 | 4;
        goto LABEL_28;
      default:
        if (v12 == 100)
        {
LABEL_32:
          id v20 = [MEMORY[0x1E4F28B00] currentHandler];
          [v20 handleFailureInMethod:a2 object:self file:@"PXStoryOverlayController.m" lineNumber:259 description:@"Code which should be unreachable has been reached"];

          abort();
        }
        goto LABEL_28;
    }
  }
  if ([v4 isRelatedOverlayScrolledIntoView]
    && ([v7 shouldHideChromeItemsWhenRelatedOverlayIsScrolledIntoView] & 1) != 0)
  {
LABEL_26:
    uint64_t v10 = 0;
  }
  else
  {
    if ([v7 canShowCloseButton]) {
      uint64_t v9 = 3073;
    }
    else {
      uint64_t v9 = 3072;
    }
    if ([v7 onlyShowReplayEndButtonAtTopOfTitle])
    {
      uint64_t v10 = v9 | 0x40000;
    }
    else
    {
      int v15 = [v5 currentAssetCollectionIsFavorite];
      uint64_t v16 = 1835008;
      if (v15) {
        uint64_t v16 = 2883584;
      }
      uint64_t v17 = v16 | v9;
      if ([v4 wantsFeedbackAction]) {
        uint64_t v10 = v17 | 0x2000000;
      }
      else {
        uint64_t v10 = v17;
      }
    }
  }
LABEL_27:
  char v6 = 1;
LABEL_28:
  uint64_t v18 = v10 & ~[v4 allowedChromeItems] & 0x1010004;
  uint64_t v19 = [v4 allowedChromeItems];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __46__PXStoryOverlayController__updateChromeItems__block_invoke;
  v37[3] = &__block_descriptor_49_e35_v16__0___PXStoryMutableViewModel__8l;
  char v38 = v6;
  v37[4] = v19 & v10;
  v37[5] = v18;
  [v4 performChanges:v37];
}

void __46__PXStoryOverlayController__updateChromeItems__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setChromeItems:v3];
  [v4 setWantsChromeVisible:*(unsigned __int8 *)(a1 + 48)];
  [v4 setChromeItemsToBeDisplayedExternally:*(void *)(a1 + 40)];
}

- (void)_invalidateChromeItems
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateChromeItems];
}

- (void)_updateMainModel
{
  id v4 = [(PXStoryOverlayController *)self viewModel];
  uint64_t v3 = [v4 mainModel];
  [(PXStoryOverlayController *)self setMainModel:v3];
}

- (void)_invalidateMainModel
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateMainModel];
}

- (void)setMainModel:(id)a3
{
  id v5 = (PXStoryModel *)a3;
  mainModel = self->_mainModel;
  if (mainModel != v5)
  {
    char v7 = v5;
    [(PXStoryModel *)mainModel unregisterChangeObserver:self context:MainModelObservationContext_209254];
    objc_storeStrong((id *)&self->_mainModel, a3);
    [(PXStoryModel *)self->_mainModel registerChangeObserver:self context:MainModelObservationContext_209254];
    [(PXStoryOverlayController *)self _invalidateChromeItems];
    [(PXStoryOverlayController *)self _invalidateFadeOutOverlayVisibilityFractionAnimator];
    [(PXStoryOverlayController *)self _invalidateStyleSwitcherVisibilityFractionAnimator];
    id v5 = v7;
  }
}

- (void)configureUpdater:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryOverlayController;
  id v3 = a3;
  [(PXStoryController *)&v4 configureUpdater:v3];
  objc_msgSend(v3, "addUpdateSelector:", sel__updateMainModel, v4.receiver, v4.super_class);
  [v3 addUpdateSelector:sel__updateRelatedOverlayVisible];
  [v3 addUpdateSelector:sel__updateChromeItems];
  [v3 addUpdateSelector:sel__updateChromeVisibilityFractionAnimator];
  [v3 addUpdateSelector:sel__updateChromeVisibilityFraction];
  [v3 addUpdateSelector:sel__updateScrubberVisibilityFractionAnimator];
  [v3 addUpdateSelector:sel__updateScrubberVisibilityFraction];
  [v3 addUpdateSelector:sel__updateStyleSwitcherVisibilityFractionAnimator];
  [v3 addUpdateSelector:sel__updateStyleSwitcherVisibilityFraction];
  [v3 addUpdateSelector:sel__updateRelatedOverlayVisibilityFractionAnimator];
  [v3 addUpdateSelector:sel__updateRelatedOverlayVisibilityFraction];
  [v3 addUpdateSelector:sel__updateFadeOutOverlayVisibilityFractionAnimator];
  [v3 addUpdateSelector:sel__updateFadeOutOverlayVisibilityFraction];
  [v3 addUpdateSelector:sel__updateInfoPanelVisibilityFractionAnimator];
  [v3 addUpdateSelector:sel__updateInfoPanelVisibilityFraction];
}

- (PXStoryOverlayController)initWithViewModel:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PXStoryOverlayController;
  id v5 = [(PXStoryController *)&v23 initWithObservableModel:v4];
  char v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewModel, v4);
    [v4 registerChangeObserver:v6 context:ViewModelObservationContext_209255];
    uint64_t v7 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    chromeVisibilityFractionAnimator = v6->_chromeVisibilityFractionAnimator;
    v6->_chromeVisibilityFractionAnimator = (PXNumberAnimator *)v7;

    [(PXNumberAnimator *)v6->_chromeVisibilityFractionAnimator registerChangeObserver:v6 context:ChromeVisibilityFractionAnimatorObservationContext];
    uint64_t v9 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    scrubberVisibilityFractionAnimator = v6->_scrubberVisibilityFractionAnimator;
    v6->_scrubberVisibilityFractionAnimator = (PXNumberAnimator *)v9;

    [(PXNumberAnimator *)v6->_scrubberVisibilityFractionAnimator registerChangeObserver:v6 context:ScrubberVisibilityFractionAnimatorObservationContext];
    uint64_t v11 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    styleSwitcherVisibilityFractionAnimator = v6->_styleSwitcherVisibilityFractionAnimator;
    v6->_styleSwitcherVisibilityFractionAnimator = (PXNumberAnimator *)v11;

    [(PXNumberAnimator *)v6->_styleSwitcherVisibilityFractionAnimator registerChangeObserver:v6 context:StyleSwitcherVisibilityFractionAnimatorObservationContext];
    uint64_t v13 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    relatedOverlayVisibilityFractionAnimator = v6->_relatedOverlayVisibilityFractionAnimator;
    v6->_relatedOverlayVisibilityFractionAnimator = (PXNumberAnimator *)v13;

    [(PXNumberAnimator *)v6->_relatedOverlayVisibilityFractionAnimator registerChangeObserver:v6 context:RelatedOverlayVisibilityFractionAnimatorObservationContext];
    uint64_t v15 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    fadeOutOverlayVisibilityFractionAnimator = v6->_fadeOutOverlayVisibilityFractionAnimator;
    v6->_fadeOutOverlayVisibilityFractionAnimator = (PXNumberAnimator *)v15;

    [(PXNumberAnimator *)v6->_fadeOutOverlayVisibilityFractionAnimator registerChangeObserver:v6 context:FadeOutOverlayVisibilityFractionAnimatorObservationContext];
    uint64_t v17 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    infoPanelVisibilityFractionAnimator = v6->_infoPanelVisibilityFractionAnimator;
    v6->_infoPanelVisibilityFractionAnimator = (PXNumberAnimator *)v17;

    [(PXNumberAnimator *)v6->_infoPanelVisibilityFractionAnimator registerChangeObserver:v6 context:InfoPanelVisibilityFractionAnimatorObservationContext];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __46__PXStoryOverlayController_initWithViewModel___block_invoke;
    v20[3] = &unk_1E5DD1E78;
    int v21 = v6;
    id v22 = v4;
    [(PXStoryController *)v21 performChanges:v20];
  }
  return v6;
}

uint64_t __46__PXStoryOverlayController_initWithViewModel___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) mainModel];
  [*(id *)(a1 + 32) setMainModel:v2];

  [*(id *)(a1 + 32) _invalidateRelatedOverlayVisible];
  id v3 = *(void **)(a1 + 32);
  return [v3 _invalidateChromeItems];
}

- (PXStoryOverlayController)initWithObservableModel:(id)a3
{
  id v5 = a3;
  char v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryOverlayController.m", 47, @"%s is not available as initializer", "-[PXStoryOverlayController initWithObservableModel:]");

  abort();
}

@end