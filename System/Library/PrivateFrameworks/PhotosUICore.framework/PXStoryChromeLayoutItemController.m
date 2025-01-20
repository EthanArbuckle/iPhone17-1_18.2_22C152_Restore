@interface PXStoryChromeLayoutItemController
- (PXNumberAnimator)alphaAnimator;
- (PXNumberAnimator)playbackEndDarkeningAnimator;
- (PXStoryChromeLayoutItemController)init;
- (PXStoryChromeLayoutItemController)initWithViewModel:(id)a3 chromeItem:(unint64_t)a4;
- (PXStoryViewModel)viewModel;
- (PXUpdater)updater;
- (double)alpha;
- (double)targetAlpha;
- (double)targetAlphaForVisibleState;
- (double)targetPlaybackEndDarkening;
- (unint64_t)chromeItem;
- (void)_invalidateAlpha;
- (void)_invalidatePlaybackEndDarkening;
- (void)_invalidateTargetAlpha;
- (void)_invalidateTargetPlaybackEndDarkening;
- (void)_setNeedsUpdate;
- (void)_updateAlpha;
- (void)_updatePlaybackEndDarkening;
- (void)_updateTargetAlpha;
- (void)_updateTargetPlaybackEndDarkening;
- (void)animateChangeToTargetAlpha:(double)a3;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setAlpha:(double)a3;
- (void)setTargetAlpha:(double)a3;
- (void)setTargetPlaybackEndDarkening:(double)a3;
@end

@implementation PXStoryChromeLayoutItemController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaAnimator, 0);
  objc_storeStrong((id *)&self->_playbackEndDarkeningAnimator, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (PXNumberAnimator)alphaAnimator
{
  return self->_alphaAnimator;
}

- (PXNumberAnimator)playbackEndDarkeningAnimator
{
  return self->_playbackEndDarkeningAnimator;
}

- (double)targetPlaybackEndDarkening
{
  return self->_targetPlaybackEndDarkening;
}

- (double)targetAlpha
{
  return self->_targetAlpha;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (double)alpha
{
  return self->_alpha;
}

- (unint64_t)chromeItem
{
  return self->_chromeItem;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)ViewModelObservationContext_287511 == a5)
  {
    if ((a4 & 0x400000) != 0)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __66__PXStoryChromeLayoutItemController_observable_didChange_context___block_invoke;
      v17[3] = &unk_1E5DD0FA8;
      v17[4] = self;
      [(PXStoryChromeLayoutItemController *)self performChanges:v17];
    }
    if ((a4 & 0x1800000000000) != 0)
    {
      v10 = v16;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v11 = __66__PXStoryChromeLayoutItemController_observable_didChange_context___block_invoke_2;
      goto LABEL_12;
    }
  }
  else if ((void *)AlphaAnimatorObservationContext == a5)
  {
    if ((a4 & 2) != 0)
    {
      v10 = v15;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v11 = __66__PXStoryChromeLayoutItemController_observable_didChange_context___block_invoke_3;
      goto LABEL_12;
    }
  }
  else
  {
    if ((void *)PlaybackEndDarkeningAnimatorObservationContext != a5)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXStoryChromeLayoutItemController.m" lineNumber:183 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((a4 & 2) != 0)
    {
      v10 = &v13;
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v11 = __66__PXStoryChromeLayoutItemController_observable_didChange_context___block_invoke_4;
LABEL_12:
      v10[2] = (uint64_t)v11;
      v10[3] = (uint64_t)&unk_1E5DD0FA8;
      v10[4] = (uint64_t)self;
      -[PXStoryChromeLayoutItemController performChanges:](self, "performChanges:", v13, v14);
    }
  }
}

uint64_t __66__PXStoryChromeLayoutItemController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateTargetAlpha];
}

uint64_t __66__PXStoryChromeLayoutItemController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateTargetPlaybackEndDarkening];
}

uint64_t __66__PXStoryChromeLayoutItemController_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateAlpha];
}

uint64_t __66__PXStoryChromeLayoutItemController_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidatePlaybackEndDarkening];
}

- (void)_updatePlaybackEndDarkening
{
  v3 = [(PXStoryChromeLayoutItemController *)self viewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__PXStoryChromeLayoutItemController__updatePlaybackEndDarkening__block_invoke;
  v4[3] = &unk_1E5DD1EF0;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __64__PXStoryChromeLayoutItemController__updatePlaybackEndDarkening__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 playbackEndDarkeningAnimator];
  [v4 presentationValue];
  objc_msgSend(v3, "setPlaybackEndDarkening:");
}

- (void)_invalidatePlaybackEndDarkening
{
  id v2 = [(PXStoryChromeLayoutItemController *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePlaybackEndDarkening];
}

- (void)_updateTargetPlaybackEndDarkening
{
  id v7 = [(PXStoryChromeLayoutItemController *)self viewModel];
  if ([v7 wantsPlaybackEndDarkening])
  {
    [v7 outroFractionCompleted];
    double v4 = v3;
    v5 = +[PXStorySettings sharedInstance];
    [v5 legibilityPlaybackEndDimming];
    [(PXStoryChromeLayoutItemController *)self setTargetPlaybackEndDarkening:v4 * v6];
  }
  else
  {
    [(PXStoryChromeLayoutItemController *)self setTargetPlaybackEndDarkening:0.0];
  }
}

- (void)_invalidateTargetPlaybackEndDarkening
{
  id v2 = [(PXStoryChromeLayoutItemController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateTargetPlaybackEndDarkening];
}

- (void)_updateAlpha
{
  id v3 = [(PXStoryChromeLayoutItemController *)self alphaAnimator];
  [v3 presentationValue];
  -[PXStoryChromeLayoutItemController setAlpha:](self, "setAlpha:");
}

- (void)_invalidateAlpha
{
  id v2 = [(PXStoryChromeLayoutItemController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAlpha];
}

- (void)_updateTargetAlpha
{
  [(PXStoryChromeLayoutItemController *)self targetAlphaForVisibleState];
  double v4 = v3;
  id v8 = [(PXStoryChromeLayoutItemController *)self viewModel];
  uint64_t v5 = [v8 chromeItems];
  unint64_t v6 = [(PXStoryChromeLayoutItemController *)self chromeItem];
  double v7 = 0.0;
  if ((v6 & ~v5) == 0) {
    double v7 = v4;
  }
  [(PXStoryChromeLayoutItemController *)self setTargetAlpha:v7];
}

- (void)_invalidateTargetAlpha
{
  id v2 = [(PXStoryChromeLayoutItemController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateTargetAlpha];
}

- (void)_setNeedsUpdate
{
}

- (double)targetAlphaForVisibleState
{
  return 1.0;
}

- (void)animateChangeToTargetAlpha:(double)a3
{
  double v4 = [(PXStoryChromeLayoutItemController *)self alphaAnimator];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PXStoryChromeLayoutItemController_animateChangeToTargetAlpha___block_invoke;
  v5[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
  *(double *)&v5[4] = a3;
  [v4 performChangesUsingDefaultOpacityAnimation:v5];
}

uint64_t __64__PXStoryChromeLayoutItemController_animateChangeToTargetAlpha___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryChromeLayoutItemController;
  [(PXStoryChromeLayoutItemController *)&v4 didPerformChanges];
  double v3 = [(PXStoryChromeLayoutItemController *)self updater];
  [v3 updateIfNeeded];
}

- (void)setTargetPlaybackEndDarkening:(double)a3
{
  if (self->_targetPlaybackEndDarkening != a3)
  {
    self->_double targetPlaybackEndDarkening = a3;
    objc_super v4 = +[PXStorySettings sharedInstance];
    uint64_t v5 = [(PXStoryChromeLayoutItemController *)self viewModel];
    int v6 = [v5 shouldAutoReplayPreference];

    double targetPlaybackEndDarkening = self->_targetPlaybackEndDarkening;
    if (v6)
    {
      if (targetPlaybackEndDarkening <= 0.0) {
        [v4 legibilityPlaybackEndUndimmingDurationAutoReplay];
      }
      else {
        [v4 legibilityPlaybackEndDimmingDurationAutoReplay];
      }
    }
    else if (targetPlaybackEndDarkening <= 0.0)
    {
      [v4 legibilityPlaybackEndUndimmingDuration];
    }
    else
    {
      [v4 legibilityPlaybackEndDimmingDuration];
    }
    double v9 = v8;
    v10 = [(PXStoryChromeLayoutItemController *)self playbackEndDarkeningAnimator];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__PXStoryChromeLayoutItemController_setTargetPlaybackEndDarkening___block_invoke;
    v11[3] = &unk_1E5DD0FD0;
    v11[4] = self;
    [v10 performChangesWithDuration:1 curve:v11 changes:v9];
  }
}

uint64_t __67__PXStoryChromeLayoutItemController_setTargetPlaybackEndDarkening___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(*(void *)(a1 + 32) + 136)];
}

- (void)setAlpha:(double)a3
{
  if (self->_alpha != a3)
  {
    self->_alpha = a3;
    [(PXStoryChromeLayoutItemController *)self signalChange:1];
  }
}

- (void)setTargetAlpha:(double)a3
{
  if (self->_targetAlpha != a3)
  {
    self->_targetAlpha = a3;
    -[PXStoryChromeLayoutItemController animateChangeToTargetAlpha:](self, "animateChangeToTargetAlpha:");
  }
}

- (PXStoryChromeLayoutItemController)initWithViewModel:(id)a3 chromeItem:(unint64_t)a4
{
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXStoryChromeLayoutItemController;
  double v8 = [(PXStoryChromeLayoutItemController *)&v19 init];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_viewModel, a3);
    [(PXStoryViewModel *)v9->_viewModel registerChangeObserver:v9 context:ViewModelObservationContext_287511];
    v9->_chromeItem = a4;
    uint64_t v10 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    alphaAnimator = v9->_alphaAnimator;
    v9->_alphaAnimator = (PXNumberAnimator *)v10;

    [(PXNumberAnimator *)v9->_alphaAnimator registerChangeObserver:v9 context:AlphaAnimatorObservationContext];
    uint64_t v12 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    playbackEndDarkeningAnimator = v9->_playbackEndDarkeningAnimator;
    v9->_playbackEndDarkeningAnimator = (PXNumberAnimator *)v12;

    [(PXNumberAnimator *)v9->_playbackEndDarkeningAnimator registerChangeObserver:v9 context:PlaybackEndDarkeningAnimatorObservationContext];
    uint64_t v14 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v9 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v9->_updater;
    v9->_updater = (PXUpdater *)v14;

    [(PXUpdater *)v9->_updater addUpdateSelector:sel__updateTargetAlpha];
    [(PXUpdater *)v9->_updater addUpdateSelector:sel__updateAlpha];
    [(PXUpdater *)v9->_updater addUpdateSelector:sel__updateTargetPlaybackEndDarkening];
    [(PXUpdater *)v9->_updater addUpdateSelector:sel__updatePlaybackEndDarkening];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__PXStoryChromeLayoutItemController_initWithViewModel_chromeItem___block_invoke;
    v17[3] = &unk_1E5DD0FA8;
    v18 = v9;
    [(PXStoryChromeLayoutItemController *)v18 performChanges:v17];
  }
  return v9;
}

uint64_t __66__PXStoryChromeLayoutItemController_initWithViewModel_chromeItem___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateTargetAlpha];
  [*(id *)(a1 + 32) _invalidateAlpha];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidateTargetPlaybackEndDarkening];
}

- (PXStoryChromeLayoutItemController)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryChromeLayoutItemController.m", 33, @"%s is not available as initializer", "-[PXStoryChromeLayoutItemController init]");

  abort();
}

@end