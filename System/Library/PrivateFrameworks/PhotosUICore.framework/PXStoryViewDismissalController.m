@interface PXStoryViewDismissalController
- (BOOL)targetCancelled;
- (CGPoint)currentGestureLocation;
- (CGPoint)currentGestureVelocity;
- (CGPoint)initialGestureLocation;
- (CGPoint)targetCenter;
- (CGSize)sourceSize;
- (CGSize)targetSize;
- (PXGItemPlacement)initialItemPlacement;
- (PXGViewControllerTransition)viewControllerTransition;
- (PXNumberAnimator)releaseAnimationDismissalProgressAnimator;
- (PXNumberAnimator)releaseAnimationProgressAnimator;
- (PXPointAnimator)centerOffsetAnimator;
- (PXStoryViewDismissalController)init;
- (PXStoryViewDismissalController)initWithViewModel:(id)a3;
- (PXStoryViewModel)viewModel;
- (PXSwipeDownTracker)swipeDownTracker;
- (PXUpdater)updater;
- (UIView)referenceView;
- (int64_t)state;
- (void)_invalidateCurrentPlacement;
- (void)_invalidateInitialItemPlacement;
- (void)_invalidateSwipeDownTracker;
- (void)_setNeedsUpdate;
- (void)_updateCurrentPlacement;
- (void)_updateInitialItemPlacement;
- (void)_updateSwipeDownTracker;
- (void)handlePanDownGestureRecognizer:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setCenterOffsetAnimator:(id)a3;
- (void)setCurrentGestureLocation:(CGPoint)a3;
- (void)setCurrentGestureVelocity:(CGPoint)a3;
- (void)setInitialGestureLocation:(CGPoint)a3;
- (void)setInitialItemPlacement:(id)a3;
- (void)setReferenceView:(id)a3;
- (void)setReleaseAnimationDismissalProgressAnimator:(id)a3;
- (void)setReleaseAnimationProgressAnimator:(id)a3;
- (void)setSourceSize:(CGSize)a3;
- (void)setState:(int64_t)a3;
- (void)setSwipeDownTracker:(id)a3;
- (void)setTargetCancelled:(BOOL)a3;
- (void)setTargetCenter:(CGPoint)a3;
- (void)setTargetSize:(CGSize)a3;
- (void)setViewControllerTransition:(id)a3;
@end

@implementation PXStoryViewDismissalController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerOffsetAnimator, 0);
  objc_storeStrong((id *)&self->_releaseAnimationDismissalProgressAnimator, 0);
  objc_storeStrong((id *)&self->_releaseAnimationProgressAnimator, 0);
  objc_storeStrong((id *)&self->_swipeDownTracker, 0);
  objc_storeStrong((id *)&self->_initialItemPlacement, 0);
  objc_storeStrong((id *)&self->_referenceView, 0);
  objc_storeStrong((id *)&self->_viewControllerTransition, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)setTargetCancelled:(BOOL)a3
{
  self->_targetCancelled = a3;
}

- (BOOL)targetCancelled
{
  return self->_targetCancelled;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSourceSize:(CGSize)a3
{
  self->_sourceSize = a3;
}

- (CGSize)sourceSize
{
  double width = self->_sourceSize.width;
  double height = self->_sourceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTargetCenter:(CGPoint)a3
{
  self->_targetCenter = a3;
}

- (CGPoint)targetCenter
{
  double x = self->_targetCenter.x;
  double y = self->_targetCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (PXPointAnimator)centerOffsetAnimator
{
  return self->_centerOffsetAnimator;
}

- (void)setReleaseAnimationDismissalProgressAnimator:(id)a3
{
}

- (PXNumberAnimator)releaseAnimationDismissalProgressAnimator
{
  return self->_releaseAnimationDismissalProgressAnimator;
}

- (void)setReleaseAnimationProgressAnimator:(id)a3
{
}

- (PXNumberAnimator)releaseAnimationProgressAnimator
{
  return self->_releaseAnimationProgressAnimator;
}

- (void)setSwipeDownTracker:(id)a3
{
}

- (PXSwipeDownTracker)swipeDownTracker
{
  return self->_swipeDownTracker;
}

- (PXGItemPlacement)initialItemPlacement
{
  return self->_initialItemPlacement;
}

- (CGPoint)currentGestureVelocity
{
  double x = self->_currentGestureVelocity.x;
  double y = self->_currentGestureVelocity.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)currentGestureLocation
{
  double x = self->_currentGestureLocation.x;
  double y = self->_currentGestureLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialGestureLocation:(CGPoint)a3
{
  self->_initialGestureLocation = a3;
}

- (CGPoint)initialGestureLocation
{
  double x = self->_initialGestureLocation.x;
  double y = self->_initialGestureLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setReferenceView:(id)a3
{
}

- (UIView)referenceView
{
  return self->_referenceView;
}

- (PXGViewControllerTransition)viewControllerTransition
{
  return self->_viewControllerTransition;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)ViewControllerTransitionObservationContext == a5)
  {
    if ((v6 & 2) == 0) {
      goto LABEL_8;
    }
    id v11 = v9;
    [(PXStoryViewDismissalController *)self _invalidateInitialItemPlacement];
    goto LABEL_7;
  }
  if ((void *)FinalAnimatorObservationContext != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXStoryViewDismissalController.m" lineNumber:392 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 6) != 0)
  {
    id v11 = v9;
    [(PXStoryViewDismissalController *)self _invalidateCurrentPlacement];
LABEL_7:
    id v9 = v11;
  }
LABEL_8:
}

- (void)_updateCurrentPlacement
{
  v3 = [(PXStoryViewDismissalController *)self viewControllerTransition];
  uint64_t v4 = *MEMORY[0x1E4F1DB20];
  uint64_t v5 = *(void *)(MEMORY[0x1E4F1DB20] + 8);
  uint64_t v6 = *(void *)(MEMORY[0x1E4F1DB20] + 16);
  uint64_t v7 = *(void *)(MEMORY[0x1E4F1DB20] + 24);
  int64_t v8 = [(PXStoryViewDismissalController *)self state];
  if (v8 == 2)
  {
    id v11 = [(PXStoryViewDismissalController *)self releaseAnimationProgressAnimator];
    [v11 presentationValue];
    uint64_t v13 = v12;
    v14 = [(PXStoryViewDismissalController *)self centerOffsetAnimator];
    v15 = [(PXStoryViewDismissalController *)self releaseAnimationDismissalProgressAnimator];
    [v15 presentationValue];
    uint64_t v17 = v16;
    if (([v11 isAnimating] & 1) != 0
      || ([v14 isAnimating] & 1) != 0
      || [v15 isAnimating])
    {
      [(PXStoryViewDismissalController *)self targetCenter];
      [v14 presentationValue];
      PXPointAdd();
    }
    [(PXStoryViewDismissalController *)self setState:0];
    char v18 = 1;
  }
  else
  {
    if (v8 == 1)
    {
      id v9 = [(PXStoryViewDismissalController *)self swipeDownTracker];
      v10 = v9;
      if (v9)
      {
        [v9 trackedCenter];
        [v10 trackedBounds];
        PXRectWithCenterAndSize();
      }
      PXAssertGetLog();
    }
    char v18 = 0;
    uint64_t v17 = 0;
    uint64_t v13 = 0x7FF8000000000000;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __57__PXStoryViewDismissalController__updateCurrentPlacement__block_invoke;
  v20[3] = &unk_1E5DB6660;
  uint64_t v22 = v4;
  uint64_t v23 = v5;
  uint64_t v24 = v6;
  uint64_t v25 = v7;
  v20[4] = self;
  id v21 = v3;
  uint64_t v26 = v17;
  uint64_t v27 = v13;
  char v28 = v18;
  id v19 = v3;
  [v19 performChanges:v20];
}

void __57__PXStoryViewDismissalController__updateCurrentPlacement__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) referenceView];
  int v5 = [*(id *)(a1 + 32) targetCancelled];
  if (!CGRectIsNull(*(CGRect *)(a1 + 48)) && v4)
  {
    double v6 = 1.0 - *(double *)(a1 + 80);
    uint64_t v7 = [*(id *)(a1 + 40) summaryItemOriginalPlacement];
    int64_t v8 = [*(id *)(a1 + 40) detailItemOriginalPlacement];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    long long v9 = *(_OWORD *)(a1 + 64);
    long long v13 = *(_OWORD *)(a1 + 48);
    long long v14 = v9;
    aBlock[2] = __57__PXStoryViewDismissalController__updateCurrentPlacement__block_invoke_2;
    aBlock[3] = &unk_1E5DB6638;
    aBlock[4] = v4;
    aBlock[5] = v7;
    aBlock[6] = v8;
    double v15 = v6;
    _Block_copy(aBlock);
    double v10 = *(double *)(a1 + 88);
    if (v5) {
      double v10 = 1.0 - v10;
    }
    [v3 setFractionCompleted:v10];
    if ((v5 & 1) == 0) {
      [*(id *)(a1 + 40) isVerticalOnly];
    }
    PXFloatByLinearlyInterpolatingFloats();
  }
  if (*(unsigned char *)(a1 + 96))
  {
    if (v5) {
      [v3 cancel];
    }
    else {
      [v3 finish];
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__PXStoryViewDismissalController__updateCurrentPlacement__block_invoke_4;
    v11[3] = &unk_1E5DD36F8;
    v11[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

id __57__PXStoryViewDismissalController__updateCurrentPlacement__block_invoke_2(uint64_t a1, void *a2, double a3, double a4)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__PXStoryViewDismissalController__updateCurrentPlacement__block_invoke_3;
  v10[3] = &unk_1E5DB6610;
  long long v14 = *(_OWORD *)(a1 + 56);
  long long v15 = *(_OWORD *)(a1 + 72);
  id v11 = *(id *)(a1 + 32);
  double v16 = a3;
  double v17 = a4;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 88);
  int64_t v8 = (void *)[a2 copyWithConfiguration:v10];

  return v8;
}

uint64_t __57__PXStoryViewDismissalController__updateCurrentPlacement__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setViewControllerTransition:0];
}

void __57__PXStoryViewDismissalController__updateCurrentPlacement__block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)_invalidateCurrentPlacement
{
  id v2 = [(PXStoryViewDismissalController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentPlacement];
}

- (void)_updateSwipeDownTracker
{
  id v3 = [(PXStoryViewDismissalController *)self initialItemPlacement];
  uint64_t v4 = [(PXStoryViewDismissalController *)self referenceView];
  int v5 = (void *)v4;
  CGFloat v6 = *MEMORY[0x1E4F1DB20];
  CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (v3 && v4)
  {
    [v3 rectInCoordinateSpace:v4 velocity:0];
    CGFloat v6 = v10;
    CGFloat v7 = v11;
    CGFloat v8 = v12;
    CGFloat v9 = v13;
  }
  [(PXStoryViewDismissalController *)self currentGestureLocation];
  long long v14 = [(PXStoryViewDismissalController *)self swipeDownTracker];
  if ([(PXStoryViewDismissalController *)self state] == 1)
  {
    v18.origin.double x = v6;
    v18.origin.double y = v7;
    v18.size.double width = v8;
    v18.size.double height = v9;
    BOOL v15 = !CGRectIsNull(v18);
  }
  else
  {
    BOOL v15 = 0;
  }
  double v16 = [(PXStoryViewDismissalController *)self viewControllerTransition];
  unsigned int v17 = [v16 isVerticalOnly];

  if (v15)
  {
    if (!v14)
    {
      [[PXSwipeDownTracker alloc] initWithOptions:v17];
      [(PXStoryViewDismissalController *)self initialGestureLocation];
      PXPointIsNull();
    }
    PXPointIsNull();
  }

  if ([(PXStoryViewDismissalController *)self state] == 1) {
    PXPointIsNull();
  }
  [(PXStoryViewDismissalController *)self setSwipeDownTracker:0];
}

void __57__PXStoryViewDismissalController__updateSwipeDownTracker__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) referenceView];
  [v3 rectInCoordinateSpace:v4 velocity:0];
  int v5 = *(void **)(*(void *)(a1 + 48) + 8);
  v5[4] = v6;
  v5[5] = v7;
  v5[6] = v8;
  v5[7] = v9;

  PXRectIsValid();
}

uint64_t __57__PXStoryViewDismissalController__updateSwipeDownTracker__block_invoke_3(uint64_t a1, void *a2)
{
  double v2 = 0.0;
  if (!*(unsigned char *)(a1 + 32)) {
    double v2 = 1.0;
  }
  return [a2 setValue:v2];
}

uint64_t __57__PXStoryViewDismissalController__updateSwipeDownTracker__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setValue:1.0];
}

uint64_t __57__PXStoryViewDismissalController__updateSwipeDownTracker__block_invoke_27(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (void)_invalidateSwipeDownTracker
{
  id v2 = [(PXStoryViewDismissalController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateSwipeDownTracker];
}

- (void)_updateInitialItemPlacement
{
  id v4 = [(PXStoryViewDismissalController *)self viewControllerTransition];
  id v3 = [v4 detailItemOriginalPlacement];
  [(PXStoryViewDismissalController *)self setInitialItemPlacement:v3];
}

- (void)_invalidateInitialItemPlacement
{
  id v2 = [(PXStoryViewDismissalController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateInitialItemPlacement];
}

- (void)_setNeedsUpdate
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__PXStoryViewDismissalController__setNeedsUpdate__block_invoke;
  v2[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __49__PXStoryViewDismissalController__setNeedsUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained updater];
  [v1 updateIfNeeded];
}

- (void)setCenterOffsetAnimator:(id)a3
{
  int v5 = (PXPointAnimator *)a3;
  centerOffsetAnimator = self->_centerOffsetAnimator;
  if (centerOffsetAnimator != v5)
  {
    uint64_t v7 = v5;
    [(PXPointAnimator *)centerOffsetAnimator unregisterChangeObserver:self context:FinalAnimatorObservationContext];
    objc_storeStrong((id *)&self->_centerOffsetAnimator, a3);
    [(PXPointAnimator *)self->_centerOffsetAnimator registerChangeObserver:self context:FinalAnimatorObservationContext];
    [(PXStoryViewDismissalController *)self _invalidateCurrentPlacement];
    int v5 = v7;
  }
}

- (void)setInitialItemPlacement:(id)a3
{
  uint64_t v7 = (PXGItemPlacement *)a3;
  int v5 = self->_initialItemPlacement;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXGItemPlacement *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_initialItemPlacement, a3);
      [(PXStoryViewDismissalController *)self _invalidateSwipeDownTracker];
    }
  }
}

- (void)setCurrentGestureVelocity:(CGPoint)a3
{
  if (a3.x != self->_currentGestureVelocity.x || a3.y != self->_currentGestureVelocity.y)
  {
    self->_currentGestureVelocitdouble y = a3;
    [(PXStoryViewDismissalController *)self _invalidateSwipeDownTracker];
  }
}

- (void)setCurrentGestureLocation:(CGPoint)a3
{
  if (a3.x != self->_currentGestureLocation.x || a3.y != self->_currentGestureLocation.y)
  {
    self->_currentGestureLocation = a3;
    [(PXStoryViewDismissalController *)self _invalidateSwipeDownTracker];
  }
}

- (void)setViewControllerTransition:(id)a3
{
  int v5 = (PXGViewControllerTransition *)a3;
  viewControllerTransition = self->_viewControllerTransition;
  uint64_t v9 = v5;
  if (viewControllerTransition != v5)
  {
    [(PXGViewControllerTransition *)viewControllerTransition unregisterChangeObserver:self context:ViewControllerTransitionObservationContext];
    objc_storeStrong((id *)&self->_viewControllerTransition, a3);
    [(PXGViewControllerTransition *)self->_viewControllerTransition registerChangeObserver:self context:ViewControllerTransitionObservationContext];
    [(PXStoryViewDismissalController *)self _invalidateInitialItemPlacement];
    uint64_t v7 = [(PXGViewControllerTransition *)v9 detailViewController];
    uint64_t v8 = [v7 view];
    [(PXStoryViewDismissalController *)self setReferenceView:v8];
  }
}

- (void)handlePanDownGestureRecognizer:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PXStoryViewDismissalController_handlePanDownGestureRecognizer___block_invoke;
  aBlock[3] = &unk_1E5DD32A8;
  aBlock[4] = self;
  id v5 = v4;
  id v17 = v5;
  char v6 = (void (**)(void))_Block_copy(aBlock);
  switch([v5 state])
  {
    case 0:
    case 3:
    case 4:
    case 5:
      if ([(PXStoryViewDismissalController *)self state] == 1) {
        -[PXStoryViewDismissalController setCurrentGestureLocation:](self, "setCurrentGestureLocation:", *(double *)off_1E5DAB000, *((double *)off_1E5DAB000 + 1));
      }
      break;
    case 1:
      if ([(PXStoryViewDismissalController *)self state]
        || ([(PXStoryViewDismissalController *)self viewControllerTransition],
            uint64_t v7 = objc_claimAutoreleasedReturnValue(),
            v7,
            v7))
      {
        uint64_t v8 = PLStoryGetLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)double v13 = 0;
          _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Pan down began before previous dismissal completed, ignoring.", v13, 2u);
        }
      }
      else
      {
        uint64_t v9 = [(PXStoryViewDismissalController *)self viewModel];
        uint64_t v10 = [v9 actionPerformer];

        double v11 = [v10 dismissStoryViewControllerInteractively];
        if (v11)
        {
          [(PXStoryViewDismissalController *)self setViewControllerTransition:v11];
          v6[2](v6);
          [(PXStoryViewDismissalController *)self currentGestureLocation];
          -[PXStoryViewDismissalController setInitialGestureLocation:](self, "setInitialGestureLocation:");
          [(PXStoryViewDismissalController *)self setState:1];
          double v12 = [(PXStoryViewDismissalController *)self viewModel];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __65__PXStoryViewDismissalController_handlePanDownGestureRecognizer___block_invoke_2;
          v14[3] = &unk_1E5DD1EF0;
          id v15 = v10;
          [v12 performChanges:v14];
        }
        else
        {
          [v10 dismissStoryViewController];
          objc_msgSend(v5, "px_cancel");
        }
      }
      break;
    case 2:
      if ([(PXStoryViewDismissalController *)self state] == 1) {
        v6[2](v6);
      }
      break;
    default:
      break;
  }
}

void __65__PXStoryViewDismissalController_handlePanDownGestureRecognizer___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) referenceView];
  [*(id *)(a1 + 40) locationInView:v2];
  objc_msgSend(*(id *)(a1 + 32), "setCurrentGestureLocation:");
  [*(id *)(a1 + 40) velocityInView:v2];
  objc_msgSend(*(id *)(a1 + 32), "setCurrentGestureVelocity:");
}

void __65__PXStoryViewDismissalController_handlePanDownGestureRecognizer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setWantsRelatedOverlayVisible:0];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [*(id *)(a1 + 32) needs79067616Workaround])
  {
    [v3 setNeedsStatusBarVisible:1];
  }
}

- (PXStoryViewDismissalController)initWithViewModel:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXStoryViewDismissalController;
  char v6 = [(PXStoryViewDismissalController *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    v7->_currentGestureLocation = *(CGPoint *)off_1E5DAB000;
    uint64_t v8 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v7 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v8;

    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateInitialItemPlacement];
    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateSwipeDownTracker];
    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateCurrentPlacement];
  }

  return v7;
}

- (PXStoryViewDismissalController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryViewDismissalController.m", 59, @"%s is not available as initializer", "-[PXStoryViewDismissalController init]");

  abort();
}

@end