@interface PUAccessoryVisibilityInteractionController
- (BOOL)_needsUpdate;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGPoint)_initialContentOffset;
- (PHPhotoLibrary)pausedPhotoLibrary;
- (PUAccessoryVisibilityInteractionController)init;
- (PUAccessoryVisibilityInteractionControllerDelegate)delegate;
- (PUAssetViewModel)_assetViewModel;
- (PUBrowsingSession)browsingSession;
- (PUChangeDirectionValueFilter)_swipeDirectionValueFilter;
- (PUChangeDirectionValueFilter)_verticalDirectionValueFilter;
- (PXNumberAnimator)_contentOffsetOverrideFactor;
- (PXNumberAnimator)_overridingContentOffsetY;
- (PXVerticalSwipeGestureRecognizerHelper)verticalSwipeGestureRecognizerHelper;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (id)_currentAssetViewModel;
- (id)changesPauseToken;
- (void)_handlePanGestureRecognizer:(id)a3;
- (void)_handleScheduledUpdate;
- (void)_invalidateContentOffset;
- (void)_pauseLibraryChangesDelivery;
- (void)_performChanges:(id)a3;
- (void)_resumeLibraryChangesDelivery;
- (void)_setAccessoryVisible:(BOOL)a3;
- (void)_setAssetViewModel:(id)a3;
- (void)_setContentOffsetOverrideFactor:(id)a3;
- (void)_setInitialContentOffset:(CGPoint)a3;
- (void)_setNeedsUpdate;
- (void)_setOverridingContentOffsetY:(id)a3;
- (void)_setSwipeDirectionValueFilter:(id)a3;
- (void)_setVerticalDirectionValueFilter:(id)a3;
- (void)_updateContentOffsetIfNeeded;
- (void)_updateGestureRecognizers;
- (void)_updateIfNeeded;
- (void)dealloc;
- (void)invalidateViewHostingGestureRecognizers;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setBrowsingSession:(id)a3;
- (void)setChangesPauseToken:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPausedPhotoLibrary:(id)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUAccessoryVisibilityInteractionController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pausedPhotoLibrary);
  objc_storeStrong(&self->_changesPauseToken, 0);
  objc_storeStrong((id *)&self->_verticalSwipeGestureRecognizerHelper, 0);
  objc_storeStrong((id *)&self->__swipeDirectionValueFilter, 0);
  objc_storeStrong((id *)&self->__verticalDirectionValueFilter, 0);
  objc_storeStrong((id *)&self->__contentOffsetOverrideFactor, 0);
  objc_storeStrong((id *)&self->__overridingContentOffsetY, 0);
  objc_storeStrong((id *)&self->__assetViewModel, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_browsingSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setPausedPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)pausedPhotoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pausedPhotoLibrary);
  return (PHPhotoLibrary *)WeakRetained;
}

- (void)setChangesPauseToken:(id)a3
{
}

- (id)changesPauseToken
{
  return self->_changesPauseToken;
}

- (PXVerticalSwipeGestureRecognizerHelper)verticalSwipeGestureRecognizerHelper
{
  return self->_verticalSwipeGestureRecognizerHelper;
}

- (void)_setSwipeDirectionValueFilter:(id)a3
{
}

- (PUChangeDirectionValueFilter)_swipeDirectionValueFilter
{
  return self->__swipeDirectionValueFilter;
}

- (void)_setVerticalDirectionValueFilter:(id)a3
{
}

- (PUChangeDirectionValueFilter)_verticalDirectionValueFilter
{
  return self->__verticalDirectionValueFilter;
}

- (PXNumberAnimator)_contentOffsetOverrideFactor
{
  return self->__contentOffsetOverrideFactor;
}

- (PXNumberAnimator)_overridingContentOffsetY
{
  return self->__overridingContentOffsetY;
}

- (void)_setInitialContentOffset:(CGPoint)a3
{
  self->__initialContentOffset = a3;
}

- (CGPoint)_initialContentOffset
{
  double x = self->__initialContentOffset.x;
  double y = self->__initialContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (PUAssetViewModel)_assetViewModel
{
  return self->__assetViewModel;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (PUBrowsingSession)browsingSession
{
  return self->_browsingSession;
}

- (PUAccessoryVisibilityInteractionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUAccessoryVisibilityInteractionControllerDelegate *)WeakRetained;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "currentAssetDidChange", a3))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __66__PUAccessoryVisibilityInteractionController_viewModel_didChange___block_invoke;
    v5[3] = &unk_1E5F2ED10;
    v5[4] = self;
    [(PUAccessoryVisibilityInteractionController *)self _performChanges:v5];
  }
}

uint64_t __66__PUAccessoryVisibilityInteractionController_viewModel_didChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAssetViewModel:0];
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUAccessoryVisibilityInteractionController *)self panGestureRecognizer];

  if (v8 == v6)
  {
    v10 = [(PUAccessoryVisibilityInteractionController *)self verticalSwipeGestureRecognizerHelper];
    char v9 = [v10 verticalSwipeGestureRecognizer:v6 shouldBeRequiredToFailByGestureRecognizer:v7];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(PUAccessoryVisibilityInteractionController *)self panGestureRecognizer];
  if (v5 == v4)
  {
    id v7 = [(PUAccessoryVisibilityInteractionController *)self verticalSwipeGestureRecognizerHelper];
    int v8 = [v7 verticalSwipeGestureRecognizerShouldBegin:v4];

    char v9 = [v4 view];
    [v4 velocityInView:v9];
    double v11 = v10;

    if (v8 && v11 >= 0.0)
    {
      v12 = [(PUAccessoryVisibilityInteractionController *)self _currentAssetViewModel];
      if (![v12 isAccessoryViewVisible]) {
        int v8 = 0;
      }
    }
    if (self->_delegateFlags.respondsToCanBeginAtLocationFromProvider && v8)
    {
      v13 = [(PUAccessoryVisibilityInteractionController *)self delegate];
      int v8 = [v13 accessoryVisibilityInteractionController:self canBeginAtLocationFromProvider:v4];
    }
    BOOL v6 = v8 != 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v14 = a3;
  char v9 = (void *)PUOverridingContentOffsetYObservationContext;
  if ((void *)PUOverridingContentOffsetYObservationContext != a5
    && PUContentOffsetOverrideFactorObservationContext != (void)a5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PUAccessoryVisibilityInteractionController.m" lineNumber:381 description:@"unknown observation context"];

    abort();
  }
  if ((v6 & 2) != 0)
  {
    [(PUAccessoryVisibilityInteractionController *)self _invalidateContentOffset];
    [(PUAccessoryVisibilityInteractionController *)self _updateIfNeeded];
    char v9 = (void *)PUOverridingContentOffsetYObservationContext;
  }
  if ((v6 & 4) != 0 && v9 == a5)
  {
    double v11 = [(PUAccessoryVisibilityInteractionController *)self _overridingContentOffsetY];
    char v12 = [v11 isAnimating];

    if ((v12 & 1) == 0) {
      [(PUAccessoryVisibilityInteractionController *)self _resumeLibraryChangesDelivery];
    }
  }
}

- (void)_updateContentOffsetIfNeeded
{
  if (self->_needsUpdateFlags.contentOffset)
  {
    self->_needsUpdateFlags.contentOffset = 0;
    v3 = [(PUAccessoryVisibilityInteractionController *)self _overridingContentOffsetY];
    [v3 presentationValue];
    uint64_t v5 = v4;

    char v6 = [(PUAccessoryVisibilityInteractionController *)self _contentOffsetOverrideFactor];
    [v6 presentationValue];
    uint64_t v8 = v7;

    char v9 = [(PUAccessoryVisibilityInteractionController *)self _assetViewModel];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__PUAccessoryVisibilityInteractionController__updateContentOffsetIfNeeded__block_invoke;
    v11[3] = &unk_1E5F2A1D0;
    id v12 = v9;
    uint64_t v13 = v5;
    uint64_t v14 = v8;
    id v10 = v9;
    [v10 performChanges:v11];
  }
}

uint64_t __74__PUAccessoryVisibilityInteractionController__updateContentOffsetIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) overridingContentOffset];
  objc_msgSend(*(id *)(a1 + 32), "setOverridingContentOffset:");
  v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 48);
  return [v2 setContentOffsetOverrideFactor:v3];
}

- (void)_invalidateContentOffset
{
  self->_needsUpdateFlags.contentOffset = 1;
  [(PUAccessoryVisibilityInteractionController *)self _setNeedsUpdate];
}

- (void)_handleScheduledUpdate
{
  self->_isUpdateScheduled = 0;
  [(PUAccessoryVisibilityInteractionController *)self _performChanges:0];
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingChanges && !self->_isPerformingUpdates && !self->_isUpdateScheduled)
  {
    self->_isUpdateScheduled = 1;
    objc_initWeak(&location, self);
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __61__PUAccessoryVisibilityInteractionController__setNeedsUpdate__block_invoke;
    v2[3] = &unk_1E5F2E530;
    objc_copyWeak(&v3, &location);
    dispatch_async(MEMORY[0x1E4F14428], v2);
    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

void __61__PUAccessoryVisibilityInteractionController__setNeedsUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleScheduledUpdate];
}

- (void)_updateIfNeeded
{
  if ([(PUAccessoryVisibilityInteractionController *)self _needsUpdate])
  {
    BOOL isPerformingUpdates = self->_isPerformingUpdates;
    self->_BOOL isPerformingUpdates = 1;
    [(PUAccessoryVisibilityInteractionController *)self _updateContentOffsetIfNeeded];
    self->_BOOL isPerformingUpdates = isPerformingUpdates;
    if ([(PUAccessoryVisibilityInteractionController *)self _needsUpdate])
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"PUAccessoryVisibilityInteractionController.m" lineNumber:325 description:@"update still needed after update pass"];
    }
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.contentOffset;
}

- (void)_performChanges:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  BOOL isPerformingChanges = self->_isPerformingChanges;
  self->_BOOL isPerformingChanges = 1;
  char v6 = v4;
  if (v4)
  {
    v4[2](v4);
    uint64_t v4 = v6;
  }
  self->_BOOL isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    [(PUAccessoryVisibilityInteractionController *)self _updateIfNeeded];
    uint64_t v4 = v6;
  }
}

- (void)_setAssetViewModel:(id)a3
{
  id v5 = (PUAssetViewModel *)a3;
  if (self->__assetViewModel != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->__assetViewModel, a3);
    [(PUAccessoryVisibilityInteractionController *)self _invalidateContentOffset];
    id v5 = v6;
  }
}

- (void)_setContentOffsetOverrideFactor:(id)a3
{
  id v5 = (PXNumberAnimator *)a3;
  contentOffsetOverrideFactor = self->__contentOffsetOverrideFactor;
  if (contentOffsetOverrideFactor != v5)
  {
    uint64_t v7 = v5;
    [(PXNumberAnimator *)contentOffsetOverrideFactor unregisterChangeObserver:self context:PUContentOffsetOverrideFactorObservationContext];
    objc_storeStrong((id *)&self->__contentOffsetOverrideFactor, a3);
    [(PXNumberAnimator *)self->__contentOffsetOverrideFactor registerChangeObserver:self context:PUContentOffsetOverrideFactorObservationContext];
    [(PUAccessoryVisibilityInteractionController *)self _invalidateContentOffset];
    id v5 = v7;
  }
}

- (void)_setOverridingContentOffsetY:(id)a3
{
  id v5 = (PXNumberAnimator *)a3;
  overridingContentOffsetY = self->__overridingContentOffsetY;
  if (overridingContentOffsetY != v5)
  {
    uint64_t v7 = v5;
    [(PXNumberAnimator *)overridingContentOffsetY unregisterChangeObserver:self context:PUOverridingContentOffsetYObservationContext];
    objc_storeStrong((id *)&self->__overridingContentOffsetY, a3);
    [(PXNumberAnimator *)self->__overridingContentOffsetY registerChangeObserver:self context:PUOverridingContentOffsetYObservationContext];
    [(PUAccessoryVisibilityInteractionController *)self _invalidateContentOffset];
    id v5 = v7;
  }
}

- (id)_currentAssetViewModel
{
  v2 = [(PUAccessoryVisibilityInteractionController *)self browsingSession];
  id v3 = [v2 viewModel];

  uint64_t v4 = [v3 currentAssetReference];
  id v5 = [v3 assetViewModelForAssetReference:v4];

  return v5;
}

- (void)_setAccessoryVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_delegateFlags.respondsToSetAccessoryVisibleChangeReason)
  {
    id v7 = [(PUAccessoryVisibilityInteractionController *)self delegate];
    [v7 accessoryVisibilityInteractionController:self setAccessoryVisible:v3 changeReason:2];
  }
  else
  {
    id v5 = [(PUAccessoryVisibilityInteractionController *)self _assetViewModel];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__PUAccessoryVisibilityInteractionController__setAccessoryVisible___block_invoke;
    v8[3] = &unk_1E5F2D968;
    BOOL v11 = v3;
    id v9 = v5;
    uint64_t v10 = 2;
    id v6 = v5;
    [v6 performChanges:v8];
  }
}

uint64_t __67__PUAccessoryVisibilityInteractionController__setAccessoryVisible___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAccessoryViewVisible:*(unsigned __int8 *)(a1 + 48) changeReason:*(void *)(a1 + 40)];
}

- (void)_resumeLibraryChangesDelivery
{
  BOOL v3 = [(PUAccessoryVisibilityInteractionController *)self changesPauseToken];
  if (v3)
  {
  }
  else
  {
    uint64_t v4 = [(PUAccessoryVisibilityInteractionController *)self pausedPhotoLibrary];

    if (!v4) {
      return;
    }
  }
  id v5 = [(PUAccessoryVisibilityInteractionController *)self pausedPhotoLibrary];
  id v6 = [(PUAccessoryVisibilityInteractionController *)self changesPauseToken];
  objc_msgSend(v5, "px_endPausingChanges:", v6);

  [(PUAccessoryVisibilityInteractionController *)self setChangesPauseToken:0];
  [(PUAccessoryVisibilityInteractionController *)self setPausedPhotoLibrary:0];
}

- (void)_pauseLibraryChangesDelivery
{
  id v9 = [(PUAccessoryVisibilityInteractionController *)self pausedPhotoLibrary];
  BOOL v3 = [(PUAccessoryVisibilityInteractionController *)self changesPauseToken];
  uint64_t v4 = [(PUAccessoryVisibilityInteractionController *)self _assetViewModel];
  id v5 = [v4 asset];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  id v7 = [v6 photoLibrary];

  uint64_t v8 = objc_msgSend(v7, "px_beginPausingChangesWithTimeout:identifier:", @"pause_for_swipe_info_panel_vertical", 30.0);
  [(PUAccessoryVisibilityInteractionController *)self setChangesPauseToken:v8];

  [(PUAccessoryVisibilityInteractionController *)self setPausedPhotoLibrary:v7];
  if (v9 && v3) {
    objc_msgSend(v9, "px_endPausingChanges:", v3);
  }
}

- (void)_handlePanGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  uint64_t v6 = v5;
  if ((unint64_t)(v5 - 3) < 3)
  {
    id v7 = [(PUAccessoryVisibilityInteractionController *)self _assetViewModel];
    [(PUChangeDirectionValueFilter *)v7 preferredContentOffset];
    double v9 = v8;
    uint64_t v10 = [(PUAccessoryVisibilityInteractionController *)self _verticalDirectionValueFilter];
    [v10 outputValue];
    if (v6 == 3 && v11 != 0.0)
    {
      if (v11 > 0.0) {
        double v9 = 0.0;
      }
      [(PUAccessoryVisibilityInteractionController *)self _setAccessoryVisible:v11 <= 0.0];
    }
    id v12 = [v4 view];
    uint64_t v13 = [v12 window];
    [v4 velocityInView:v13];
    double v15 = v14;

    v16 = [(PUAccessoryVisibilityInteractionController *)self _overridingContentOffsetY];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __74__PUAccessoryVisibilityInteractionController__handlePanGestureRecognizer___block_invoke_4;
    v28[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&v28[4] = v9;
    [v16 performChangesUsingDefaultSpringAnimationWithInitialVelocity:v28 changes:v15];

    v17 = [(PUAccessoryVisibilityInteractionController *)self _contentOffsetOverrideFactor];
    [v17 performChangesUsingDefaultSpringAnimationWithInitialVelocity:&__block_literal_global_2526 changes:0.0];

    [(PUAccessoryVisibilityInteractionController *)self _setVerticalDirectionValueFilter:0];
    [(PUAccessoryVisibilityInteractionController *)self _setSwipeDirectionValueFilter:0];
    if (v6 == 3 && self->_delegateFlags.respondsToDidEnd)
    {
      v18 = [(PUAccessoryVisibilityInteractionController *)self delegate];
      [v18 accessoryVisibilityInteractionControllerDidEnd:self];
    }
    goto LABEL_15;
  }
  if (v5 == 2)
  {
    [(PUAccessoryVisibilityInteractionController *)self _initialContentOffset];
    double v21 = v20;
    v22 = [v4 view];
    v23 = [v22 window];
    [v4 translationInView:v23];
    double v25 = v24;

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __74__PUAccessoryVisibilityInteractionController__handlePanGestureRecognizer___block_invoke_2;
    v29[3] = &unk_1E5F2E0A8;
    double v26 = v21 + v25;
    v29[4] = self;
    *(double *)&v29[5] = v26;
    [(PUAccessoryVisibilityInteractionController *)self _performChanges:v29];
    v27 = [(PUAccessoryVisibilityInteractionController *)self _verticalDirectionValueFilter];
    [v27 setInputValue:v25];

    id v7 = [(PUAccessoryVisibilityInteractionController *)self _swipeDirectionValueFilter];
    [(PUValueFilter *)v7 setInputValue:v25];
    [(PUAccessoryVisibilityInteractionController *)self _setAccessoryVisible:v26 < 0.0];
    goto LABEL_15;
  }
  if (v5 == 1)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __74__PUAccessoryVisibilityInteractionController__handlePanGestureRecognizer___block_invoke;
    v30[3] = &unk_1E5F2ED10;
    v30[4] = self;
    [(PUAccessoryVisibilityInteractionController *)self _performChanges:v30];
    [(PUAccessoryVisibilityInteractionController *)self _pauseLibraryChangesDelivery];
    id v7 = objc_alloc_init(PUChangeDirectionValueFilter);
    [(PUChangeDirectionValueFilter *)v7 setMinimumChangeValue:5.0];
    [(PUAccessoryVisibilityInteractionController *)self _setVerticalDirectionValueFilter:v7];
    v19 = objc_alloc_init(PUChangeDirectionValueFilter);
    [(PUChangeDirectionValueFilter *)v19 setMinimumChangeValue:80.0];
    [(PUAccessoryVisibilityInteractionController *)self _setSwipeDirectionValueFilter:v19];

LABEL_15:
  }
}

void __74__PUAccessoryVisibilityInteractionController__handlePanGestureRecognizer___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _currentAssetViewModel];
  [*(id *)(a1 + 32) _setAssetViewModel:v6];
  [v6 contentOffset];
  double v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "_setInitialContentOffset:");
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F912A8]) initWithValue:v3];
  [*(id *)(a1 + 32) _setOverridingContentOffsetY:v4];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F912A8]) initWithValue:1.0];
  [*(id *)(a1 + 32) _setContentOffsetOverrideFactor:v5];
  [v4 setHighFrameRateReason:2228225];
  [v5 setHighFrameRateReason:2228225];
}

void __74__PUAccessoryVisibilityInteractionController__handlePanGestureRecognizer___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) _overridingContentOffsetY];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__PUAccessoryVisibilityInteractionController__handlePanGestureRecognizer___block_invoke_3;
  v3[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
  v3[4] = *(void *)(a1 + 40);
  [v2 performChangesWithoutAnimation:v3];
}

uint64_t __74__PUAccessoryVisibilityInteractionController__handlePanGestureRecognizer___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setValue:1 skipFirstNumberWhenAnimationStart:*(double *)(a1 + 32)];
}

uint64_t __74__PUAccessoryVisibilityInteractionController__handlePanGestureRecognizer___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setValue:0.0];
}

uint64_t __74__PUAccessoryVisibilityInteractionController__handlePanGestureRecognizer___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

- (void)_updateGestureRecognizers
{
  double v3 = [(PUAccessoryVisibilityInteractionController *)self delegate];
  id v4 = [v3 accessoryVisibilityInteractionControllerViewHostingGestureRecognizers:self];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PUAccessoryVisibilityInteractionController__updateGestureRecognizers__block_invoke;
  aBlock[3] = &unk_1E5F22520;
  id v9 = v4;
  id v5 = v4;
  id v6 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v7 = [(PUAccessoryVisibilityInteractionController *)self panGestureRecognizer];
  v6[2](v6, v7);
}

void __71__PUAccessoryVisibilityInteractionController__updateGestureRecognizers__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  double v3 = [v6 view];
  id v4 = *(void **)(a1 + 32);

  if (v3 != v4)
  {
    id v5 = [v6 view];
    [v5 removeGestureRecognizer:v6];

    [*(id *)(a1 + 32) addGestureRecognizer:v6];
  }
}

- (void)invalidateViewHostingGestureRecognizers
{
  [(PUAccessoryVisibilityInteractionController *)self _resumeLibraryChangesDelivery];
  [(PUAccessoryVisibilityInteractionController *)self _updateGestureRecognizers];
}

- (void)setBrowsingSession:(id)a3
{
  id v5 = (PUBrowsingSession *)a3;
  browsingSession = self->_browsingSession;
  if (browsingSession != v5)
  {
    id v9 = v5;
    id v7 = [(PUBrowsingSession *)browsingSession viewModel];
    [v7 unregisterChangeObserver:self];

    objc_storeStrong((id *)&self->_browsingSession, a3);
    double v8 = [(PUBrowsingSession *)self->_browsingSession viewModel];
    [v8 registerChangeObserver:self];

    id v5 = v9;
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToCanBeginAtLocationFromProvider = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidEnd = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToIsLocationFromProviderInAccessoryContent = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToSetAccessoryVisibleChangeReason = objc_opt_respondsToSelector() & 1;
    [(PUAccessoryVisibilityInteractionController *)self _updateGestureRecognizers];
  }
}

- (void)dealloc
{
  [(PUAccessoryVisibilityInteractionController *)self _resumeLibraryChangesDelivery];
  v3.receiver = self;
  v3.super_class = (Class)PUAccessoryVisibilityInteractionController;
  [(PUAccessoryVisibilityInteractionController *)&v3 dealloc];
}

- (PUAccessoryVisibilityInteractionController)init
{
  v8.receiver = self;
  v8.super_class = (Class)PUAccessoryVisibilityInteractionController;
  double v2 = [(PUAccessoryVisibilityInteractionController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v2 action:sel__handlePanGestureRecognizer_];
    panGestureRecognizer = v2->_panGestureRecognizer;
    v2->_panGestureRecognizer = (UIPanGestureRecognizer *)v3;

    [(UIPanGestureRecognizer *)v2->_panGestureRecognizer setAllowedScrollTypesMask:3];
    [(UIPanGestureRecognizer *)v2->_panGestureRecognizer setDelegate:v2];
    id v5 = (PXVerticalSwipeGestureRecognizerHelper *)objc_alloc_init(MEMORY[0x1E4F90898]);
    verticalSwipeGestureRecognizerHelper = v2->_verticalSwipeGestureRecognizerHelper;
    v2->_verticalSwipeGestureRecognizerHelper = v5;
  }
  return v2;
}

@end