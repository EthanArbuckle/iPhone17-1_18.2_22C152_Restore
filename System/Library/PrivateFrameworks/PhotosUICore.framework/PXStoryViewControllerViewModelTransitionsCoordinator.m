@interface PXStoryViewControllerViewModelTransitionsCoordinator
- (BOOL)isDismisallTriggered;
- (BOOL)isDismissalPreviewFractionInitialized;
- (BOOL)isFinishingDismissal;
- (BOOL)isPreparedForDismissal;
- (BOOL)shouldFinish;
- (PXGViewControllerTransition)dismissalTransition;
- (PXNumberAnimator)dismissalPreviewFraction;
- (PXRegionOfInterest)fullsizeContentBoundingBox;
- (PXStoryViewControllerViewModelTransitionsCoordinator)initWithObservableModel:(id)a3;
- (PXStoryViewControllerViewModelTransitionsCoordinator)initWithViewModel:(id)a3 viewController:(id)a4;
- (PXStoryViewModeTransition)viewModeTransition;
- (PXStoryViewModel)viewModel;
- (UIImpactFeedbackGenerator)dismissalFeedbackGenerator;
- (UIViewController)viewController;
- (double)viewModeTransitionStartTime;
- (void)_dismissalTransition:(id)a3 didEnd:(BOOL)a4;
- (void)_endDismissal:(BOOL)a3;
- (void)_forceDismissViewController;
- (void)_handleViewModeTransitionStartDelay;
- (void)_invalidateDesiredDismissalState;
- (void)_invalidateFractionCompleted;
- (void)_invalidateFullsizeContentBoundingBox;
- (void)_invalidateShouldFinish;
- (void)_invalidateSummaryItemPlacementOverride;
- (void)_invalidateSwipeDownDismissalPreview;
- (void)_invalidateSwipeDownTriggeringDismissal;
- (void)_invalidateViewControllerDismissalTargetPlacement;
- (void)_invalidateViewModeTransition;
- (void)_tryDismissingViewController;
- (void)_updateDesiredDismissalState;
- (void)_updateFractionCompleted;
- (void)_updateFullsizeContentBoundingBox;
- (void)_updateShouldFinish;
- (void)_updateSummaryItemPlacementOverride;
- (void)_updateSwipeDownDismissalPreview;
- (void)_updateSwipeDownTriggeringDismissal;
- (void)_updateViewControllerDismissalTargetPlacement;
- (void)_updateViewModeTransition;
- (void)configureUpdater:(id)a3;
- (void)handleModelChange:(unint64_t)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDismissalFeedbackGenerator:(id)a3;
- (void)setDismissalTransition:(id)a3;
- (void)setFullsizeContentBoundingBox:(id)a3;
- (void)setIsDismisallTriggered:(BOOL)a3;
- (void)setIsDismissalPreviewFractionInitialized:(BOOL)a3;
- (void)setIsFinishingDismissal:(BOOL)a3;
- (void)setIsPreparedForDismissal:(BOOL)a3;
- (void)setShouldFinish:(BOOL)a3;
- (void)setViewModeTransition:(id)a3;
- (void)setViewModeTransitionStartTime:(double)a3;
@end

@implementation PXStoryViewControllerViewModelTransitionsCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_fullsizeContentBoundingBox, 0);
  objc_storeStrong((id *)&self->_viewModeTransition, 0);
  objc_storeStrong((id *)&self->_dismissalTransition, 0);
  objc_storeStrong((id *)&self->_dismissalPreviewFraction, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak((id *)&self->_viewModel);
}

- (void)setDismissalFeedbackGenerator:(id)a3
{
}

- (UIImpactFeedbackGenerator)dismissalFeedbackGenerator
{
  return self->_dismissalFeedbackGenerator;
}

- (void)setShouldFinish:(BOOL)a3
{
  self->_shouldFinish = a3;
}

- (BOOL)shouldFinish
{
  return self->_shouldFinish;
}

- (BOOL)isFinishingDismissal
{
  return self->_isFinishingDismissal;
}

- (BOOL)isPreparedForDismissal
{
  return self->_isPreparedForDismissal;
}

- (BOOL)isDismisallTriggered
{
  return self->_isDismisallTriggered;
}

- (PXRegionOfInterest)fullsizeContentBoundingBox
{
  return self->_fullsizeContentBoundingBox;
}

- (void)setViewModeTransitionStartTime:(double)a3
{
  self->_viewModeTransitionStartTime = a3;
}

- (double)viewModeTransitionStartTime
{
  return self->_viewModeTransitionStartTime;
}

- (PXStoryViewModeTransition)viewModeTransition
{
  return self->_viewModeTransition;
}

- (PXGViewControllerTransition)dismissalTransition
{
  return self->_dismissalTransition;
}

- (void)setIsDismissalPreviewFractionInitialized:(BOOL)a3
{
  self->_isDismissalPreviewFractionInitialized = a3;
}

- (BOOL)isDismissalPreviewFractionInitialized
{
  return self->_isDismissalPreviewFractionInitialized;
}

- (PXNumberAnimator)dismissalPreviewFraction
{
  return self->_dismissalPreviewFraction;
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

- (PXStoryViewModel)viewModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  return (PXStoryViewModel *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)DismissalTransitionObservationContext == a5)
  {
    if ((a4 & 1) == 0) {
      goto LABEL_12;
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __85__PXStoryViewControllerViewModelTransitionsCoordinator_observable_didChange_context___block_invoke;
    v13[3] = &unk_1E5DD1E50;
    v13[4] = self;
    v9 = v13;
LABEL_11:
    [(PXStoryController *)self performChanges:v9];
    goto LABEL_12;
  }
  if ((void *)ViewModeTransitionObservationContext_294215 == a5)
  {
    if ((a4 & 1) == 0) {
      goto LABEL_12;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__PXStoryViewControllerViewModelTransitionsCoordinator_observable_didChange_context___block_invoke_2;
    v12[3] = &unk_1E5DD1E50;
    v12[4] = self;
    v9 = v12;
    goto LABEL_11;
  }
  if ((void *)DismissalPreviewFractionObservationContext == a5)
  {
    if ((a4 & 2) == 0) {
      goto LABEL_12;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __85__PXStoryViewControllerViewModelTransitionsCoordinator_observable_didChange_context___block_invoke_3;
    v11[3] = &unk_1E5DD1E50;
    v11[4] = self;
    v9 = v11;
    goto LABEL_11;
  }
  v10.receiver = self;
  v10.super_class = (Class)PXStoryViewControllerViewModelTransitionsCoordinator;
  [(PXStoryController *)&v10 observable:v8 didChange:a4 context:a5];
LABEL_12:
}

uint64_t __85__PXStoryViewControllerViewModelTransitionsCoordinator_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateViewControllerDismissalTargetPlacement];
}

uint64_t __85__PXStoryViewControllerViewModelTransitionsCoordinator_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateFractionCompleted];
  [*(id *)(a1 + 32) _invalidateFullsizeContentBoundingBox];
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateShouldFinish];
}

uint64_t __85__PXStoryViewControllerViewModelTransitionsCoordinator_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateSwipeDownDismissalPreview];
}

- (void)handleModelChange:(unint64_t)a3
{
  if ((a3 & 0x400000000) == 0)
  {
    if ((a3 & 0x800000000) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __74__PXStoryViewControllerViewModelTransitionsCoordinator_handleModelChange___block_invoke_2;
    v7[3] = &unk_1E5DD1E50;
    v7[4] = self;
    [(PXStoryController *)self performChanges:v7];
    if ((a3 & 0x10000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__PXStoryViewControllerViewModelTransitionsCoordinator_handleModelChange___block_invoke;
  v8[3] = &unk_1E5DD1E50;
  v8[4] = self;
  [(PXStoryController *)self performChanges:v8];
  if ((a3 & 0x800000000) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((a3 & 0x10000000000) != 0)
  {
LABEL_4:
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __74__PXStoryViewControllerViewModelTransitionsCoordinator_handleModelChange___block_invoke_3;
    v6[3] = &unk_1E5DD1E50;
    v6[4] = self;
    [(PXStoryController *)self performChanges:v6];
  }
LABEL_5:
  v5.receiver = self;
  v5.super_class = (Class)PXStoryViewControllerViewModelTransitionsCoordinator;
  [(PXStoryController *)&v5 handleModelChange:a3];
}

uint64_t __74__PXStoryViewControllerViewModelTransitionsCoordinator_handleModelChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateViewModeTransition];
}

uint64_t __74__PXStoryViewControllerViewModelTransitionsCoordinator_handleModelChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateDesiredDismissalState];
}

uint64_t __74__PXStoryViewControllerViewModelTransitionsCoordinator_handleModelChange___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateFractionCompleted];
}

- (void)_updateSwipeDownDismissalPreview
{
  v3 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self viewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __88__PXStoryViewControllerViewModelTransitionsCoordinator__updateSwipeDownDismissalPreview__block_invoke;
  v4[3] = &unk_1E5DD1EF0;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __88__PXStoryViewControllerViewModelTransitionsCoordinator__updateSwipeDownDismissalPreview__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  if ([v3 isPreparedForDismissal]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [*(id *)(a1 + 32) isFinishingDismissal];
  }
  [v4 setSwipeDownDismissalPreviewEnabled:v5];
  id v6 = [*(id *)(a1 + 32) dismissalPreviewFraction];
  [v6 presentationValue];
  objc_msgSend(v4, "setSwipeDownDismissalPreviewFraction:");
}

- (void)_invalidateSwipeDownDismissalPreview
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateSwipeDownDismissalPreview];
}

- (void)_updateSwipeDownTriggeringDismissal
{
  v3 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self dismissalTransition];

  BOOL v4 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self isDismisallTriggered];
  uint64_t v5 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self viewModel];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__PXStoryViewControllerViewModelTransitionsCoordinator__updateSwipeDownTriggeringDismissal__block_invoke;
  v12[3] = &__block_descriptor_34_e35_v16__0___PXStoryMutableViewModel__8l;
  BOOL v13 = v4;
  BOOL v14 = v3 != 0;
  [v5 performChanges:v12];

  if (v3)
  {
    id v6 = +[PXStorySettings sharedInstance];
    [v6 swipeDownThresholdFadeDuration];
    double v8 = v7;

    if (![(PXStoryViewControllerViewModelTransitionsCoordinator *)self isDismissalPreviewFractionInitialized])
    {
      [(PXStoryViewControllerViewModelTransitionsCoordinator *)self setIsDismissalPreviewFractionInitialized:1];
      double v8 = 0.0;
    }
    v9 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self dismissalPreviewFraction];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __91__PXStoryViewControllerViewModelTransitionsCoordinator__updateSwipeDownTriggeringDismissal__block_invoke_2;
    v10[3] = &__block_descriptor_33_e35_v16__0___PXMutableNumberAnimator__8l;
    BOOL v11 = v4;
    [v9 performChangesWithDuration:1 curve:v10 changes:v8];
  }
}

void __91__PXStoryViewControllerViewModelTransitionsCoordinator__updateSwipeDownTriggeringDismissal__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSwipeDownTriggeringDismissal:*(unsigned __int8 *)(a1 + 32)];
  if (*(unsigned char *)(a1 + 33)) {
    [v3 setWantsChromeVisible:*(unsigned char *)(a1 + 32) == 0];
  }
}

uint64_t __91__PXStoryViewControllerViewModelTransitionsCoordinator__updateSwipeDownTriggeringDismissal__block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = 1.0;
  if (!*(unsigned char *)(a1 + 32)) {
    double v2 = 0.0;
  }
  return [a2 setValue:v2];
}

- (void)_invalidateSwipeDownTriggeringDismissal
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateSwipeDownTriggeringDismissal];
}

- (void)_updateDesiredDismissalState
{
  id v3 = +[PXStorySettings sharedInstance];
  uint64_t v28 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v4 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self viewModel];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 swipeDownInteractionState];
  }
  else
  {
    uint64_t v28 = 0;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
  }

  v22[2] = v26;
  v22[3] = v27;
  uint64_t v23 = v28;
  v22[0] = v24;
  v22[1] = v25;
  int v6 = PXStorySwipeDownInteractionStateEqualsState((uint64_t)v22, (uint64_t)&PXStorySwipeDownInteractionStateNull);
  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self viewModeTransition];
    if (v7)
    {
      double v8 = (void *)v7;
      uint64_t v9 = [v3 swipeDownBehavior];

      if (v9 == 1)
      {
        double v10 = *((double *)&v25 + 1) - *((double *)&v24 + 1);
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v12 = v11;
        [(PXStoryViewControllerViewModelTransitionsCoordinator *)self viewModeTransitionStartTime];
        double v14 = v13;
        [v3 swipeDownDismissalDistanceThreshold];
        if (v10 >= v15)
        {
          [v3 swipeDownDismissalDelay];
          BOOL v16 = v12 - v14 < v17;
        }
        else
        {
          BOOL v16 = 1;
        }
        [(PXStoryViewControllerViewModelTransitionsCoordinator *)self setIsDismisallTriggered:v16];
      }
    }
  }
  if ([(PXStoryViewControllerViewModelTransitionsCoordinator *)self isPreparedForDismissal])
  {
    if ((v6 & [(PXStoryViewControllerViewModelTransitionsCoordinator *)self isDismisallTriggered]) == 1)
    {
      v18 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self dismissalTransition];

      if (!v18) {
        [(PXStoryViewControllerViewModelTransitionsCoordinator *)self _forceDismissViewController];
      }
    }
  }
  if ([(PXStoryViewControllerViewModelTransitionsCoordinator *)self isPreparedForDismissal])
  {
    v19 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self viewModeTransition];

    if (!v19)
    {
      [(PXStoryViewControllerViewModelTransitionsCoordinator *)self setIsPreparedForDismissal:0];
      BOOL v20 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self isDismisallTriggered];
      BOOL v21 = 0;
      if (v20) {
        BOOL v21 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self shouldFinish];
      }
      [(PXStoryViewControllerViewModelTransitionsCoordinator *)self _endDismissal:v21];
    }
  }
  else if ((v6 & 1) == 0 {
         && [(PXStoryViewControllerViewModelTransitionsCoordinator *)self isDismisallTriggered])
  }
  {
    [(PXStoryViewControllerViewModelTransitionsCoordinator *)self setIsPreparedForDismissal:1];
    [(PXStoryViewControllerViewModelTransitionsCoordinator *)self _tryDismissingViewController];
  }
}

- (void)_invalidateDesiredDismissalState
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDesiredDismissalState];
}

- (void)_updateShouldFinish
{
  id v3 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self viewModeTransition];
  if (v3)
  {
    id v4 = v3;
    -[PXStoryViewControllerViewModelTransitionsCoordinator setShouldFinish:](self, "setShouldFinish:", [v3 shouldFinish]);
    id v3 = v4;
  }
}

- (void)_invalidateShouldFinish
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateShouldFinish];
}

- (void)_updateFractionCompleted
{
  id v3 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self dismissalTransition];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__PXStoryViewControllerViewModelTransitionsCoordinator__updateFractionCompleted__block_invoke;
  v4[3] = &unk_1E5DD1EC8;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __80__PXStoryViewControllerViewModelTransitionsCoordinator__updateFractionCompleted__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v9 = [v3 viewModeTransition];
  [v9 fractionCompleted];
  double v6 = v5;
  uint64_t v7 = [*(id *)(a1 + 32) viewModel];
  [v7 swipeDownDismissalPreviewFraction];
  [v4 setFractionCompleted:v8 * v6];
}

- (void)_invalidateFractionCompleted
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateFractionCompleted];
}

- (void)_updateViewControllerDismissalTargetPlacement
{
  id v3 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self viewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __101__PXStoryViewControllerViewModelTransitionsCoordinator__updateViewControllerDismissalTargetPlacement__block_invoke;
  v4[3] = &unk_1E5DD1EF0;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __101__PXStoryViewControllerViewModelTransitionsCoordinator__updateViewControllerDismissalTargetPlacement__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 dismissalTransition];
  id v4 = [v5 summaryItemOriginalPlacement];
  [v3 setViewControllerDismissalTargetPlacement:v4];
}

- (void)_invalidateViewControllerDismissalTargetPlacement
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateViewControllerDismissalTargetPlacement];
}

- (void)_updateSummaryItemPlacementOverride
{
  id v3 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self dismissalTransition];
  if (v3)
  {
    id v4 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self fullsizeContentBoundingBox];
    if (v4)
    {
      id v5 = [v3 summaryItemOriginalPlacement];
      double v6 = (void *)[v5 copyWithRegionOfInterest:v4];
    }
    else
    {
      double v6 = 0;
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __91__PXStoryViewControllerViewModelTransitionsCoordinator__updateSummaryItemPlacementOverride__block_invoke;
    v8[3] = &unk_1E5DD1EC8;
    id v9 = v6;
    id v7 = v6;
    [v3 performChanges:v8];
  }
}

uint64_t __91__PXStoryViewControllerViewModelTransitionsCoordinator__updateSummaryItemPlacementOverride__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSummaryItemPlacementOverride:*(void *)(a1 + 32)];
}

- (void)_invalidateSummaryItemPlacementOverride
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateSummaryItemPlacementOverride];
}

- (void)_updateFullsizeContentBoundingBox
{
  id v4 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self viewModeTransition];
  id v5 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self viewModel];
  double v6 = [v5 viewModeTransition];

  if (v4 != v6)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXStoryViewControllerViewModelTransitionsCoordinator.m", 225, @"Invalid parameter not satisfying: %@", @"viewModeTransition == self.viewModel.viewModeTransition" object file lineNumber description];
  }
  if ([v4 hasSourceOrDestinationViewMode:1])
  {
    uint64_t v7 = [v4 presentedBoundingBoxForViewMode:1];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v9 = (id)v7;
  [(PXStoryViewControllerViewModelTransitionsCoordinator *)self setFullsizeContentBoundingBox:v7];
}

- (void)_invalidateFullsizeContentBoundingBox
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateFullsizeContentBoundingBox];
}

- (void)_updateViewModeTransition
{
  id v4 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self viewModel];
  id v3 = [v4 viewModeTransition];
  [(PXStoryViewControllerViewModelTransitionsCoordinator *)self setViewModeTransition:v3];
}

- (void)_invalidateViewModeTransition
{
  id v2 = [(PXStoryController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateViewModeTransition];
}

- (void)_dismissalTransition:(id)a3 didEnd:(BOOL)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self dismissalTransition];

  if (v6 != v5) {
    PXAssertGetLog();
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__PXStoryViewControllerViewModelTransitionsCoordinator__dismissalTransition_didEnd___block_invoke;
  v7[3] = &unk_1E5DD1E50;
  v7[4] = self;
  [(PXStoryController *)self performChanges:v7];
}

uint64_t __84__PXStoryViewControllerViewModelTransitionsCoordinator__dismissalTransition_didEnd___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDismissalTransition:0];
  [*(id *)(a1 + 32) setIsDismisallTriggered:0];
  [*(id *)(a1 + 32) setIsDismissalPreviewFractionInitialized:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 setIsFinishingDismissal:0];
}

- (void)_endDismissal:(BOOL)a3
{
  id v5 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self dismissalTransition];
  if (v5)
  {
    [(PXStoryViewControllerViewModelTransitionsCoordinator *)self setIsFinishingDismissal:1];
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__PXStoryViewControllerViewModelTransitionsCoordinator__endDismissal___block_invoke;
    v6[3] = &unk_1E5DD1EA0;
    objc_copyWeak(&v8, &location);
    id v7 = v5;
    BOOL v9 = a3;
    [v7 performChanges:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __70__PXStoryViewControllerViewModelTransitionsCoordinator__endDismissal___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __70__PXStoryViewControllerViewModelTransitionsCoordinator__endDismissal___block_invoke_2;
  id v7 = &unk_1E5DD21B0;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v8 = *(id *)(a1 + 32);
  [v3 installCompletionHandler:&v4];
  if (*(unsigned char *)(a1 + 48)) {
    objc_msgSend(v3, "finish", v4, v5, v6, v7);
  }
  else {
    objc_msgSend(v3, "cancel", v4, v5, v6, v7);
  }

  objc_destroyWeak(&v9);
}

void __70__PXStoryViewControllerViewModelTransitionsCoordinator__endDismissal___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _dismissalTransition:*(void *)(a1 + 32) didEnd:a2];
}

- (void)_forceDismissViewController
{
  id v2 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self viewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)_tryDismissingViewController
{
  id v3 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self dismissalTransition];
  uint64_t v4 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self viewController];
  uint64_t v5 = (void *)v4;
  if (!v3 && v4)
  {
    id v3 = +[PXGViewControllerTransition interactiveDismissalOfDetailViewController:v4];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__PXStoryViewControllerViewModelTransitionsCoordinator__tryDismissingViewController__block_invoke;
  v7[3] = &unk_1E5DD1E78;
  v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  [(PXStoryController *)self performChanges:v7];
}

uint64_t __84__PXStoryViewControllerViewModelTransitionsCoordinator__tryDismissingViewController__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDismissalTransition:*(void *)(a1 + 40)];
}

- (void)setIsFinishingDismissal:(BOOL)a3
{
  if (self->_isFinishingDismissal != a3)
  {
    self->_isFinishingDismissal = a3;
    [(PXStoryViewControllerViewModelTransitionsCoordinator *)self _invalidateSwipeDownDismissalPreview];
  }
}

- (void)setIsPreparedForDismissal:(BOOL)a3
{
  if (self->_isPreparedForDismissal != a3)
  {
    self->_isPreparedForDismissal = a3;
    [(PXStoryViewControllerViewModelTransitionsCoordinator *)self _invalidateSwipeDownDismissalPreview];
    if (self->_isPreparedForDismissal)
    {
      uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1840]) initWithStyle:0];
      [(PXStoryViewControllerViewModelTransitionsCoordinator *)self setDismissalFeedbackGenerator:v4];

      id v5 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self dismissalFeedbackGenerator];
      [v5 prepare];
    }
    else
    {
      [(PXStoryViewControllerViewModelTransitionsCoordinator *)self setDismissalFeedbackGenerator:0];
    }
  }
}

- (void)setIsDismisallTriggered:(BOOL)a3
{
  if (self->_isDismisallTriggered != a3)
  {
    self->_isDismisallTriggered = a3;
    [(PXStoryViewControllerViewModelTransitionsCoordinator *)self _invalidateSwipeDownTriggeringDismissal];
    id v4 = [(PXStoryViewControllerViewModelTransitionsCoordinator *)self dismissalFeedbackGenerator];
    [v4 impactOccurred];
    [v4 prepare];
  }
}

- (void)setFullsizeContentBoundingBox:(id)a3
{
  id v7 = (PXRegionOfInterest *)a3;
  id v5 = self->_fullsizeContentBoundingBox;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXRegionOfInterest *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_fullsizeContentBoundingBox, a3);
      [(PXStoryViewControllerViewModelTransitionsCoordinator *)self _invalidateSummaryItemPlacementOverride];
    }
  }
}

- (void)_handleViewModeTransitionStartDelay
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __91__PXStoryViewControllerViewModelTransitionsCoordinator__handleViewModeTransitionStartDelay__block_invoke;
  v2[3] = &unk_1E5DD1E50;
  v2[4] = self;
  [(PXStoryController *)self performChanges:v2];
}

uint64_t __91__PXStoryViewControllerViewModelTransitionsCoordinator__handleViewModeTransitionStartDelay__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateDesiredDismissalState];
}

- (void)setViewModeTransition:(id)a3
{
  id v5 = (PXStoryViewModeTransition *)a3;
  p_viewModeTransition = &self->_viewModeTransition;
  viewModeTransition = self->_viewModeTransition;
  if (viewModeTransition != v5)
  {
    [(PXStoryViewModeTransition *)viewModeTransition unregisterChangeObserver:self context:ViewModeTransitionObservationContext_294215];
    objc_storeStrong((id *)&self->_viewModeTransition, a3);
    [(PXStoryViewModeTransition *)*p_viewModeTransition registerChangeObserver:self context:ViewModeTransitionObservationContext_294215];
    [(PXStoryViewControllerViewModelTransitionsCoordinator *)self _invalidateFullsizeContentBoundingBox];
    [(PXStoryViewControllerViewModelTransitionsCoordinator *)self _updateDesiredDismissalState];
    if (*p_viewModeTransition)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      -[PXStoryViewControllerViewModelTransitionsCoordinator setViewModeTransitionStartTime:](self, "setViewModeTransitionStartTime:");
      id v8 = +[PXStorySettings sharedInstance];
      [v8 swipeDownDismissalDelay];
      double v10 = v9;

      objc_initWeak(&location, self);
      dispatch_time_t v11 = dispatch_time(0, (uint64_t)((v10 + 0.1) * 1000000000.0));
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __78__PXStoryViewControllerViewModelTransitionsCoordinator_setViewModeTransition___block_invoke;
      v12[3] = &unk_1E5DD32D0;
      objc_copyWeak(&v13, &location);
      dispatch_after(v11, MEMORY[0x1E4F14428], v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __78__PXStoryViewControllerViewModelTransitionsCoordinator_setViewModeTransition___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleViewModeTransitionStartDelay];
}

- (void)setDismissalTransition:(id)a3
{
  id v5 = (PXGViewControllerTransition *)a3;
  dismissalTransition = self->_dismissalTransition;
  if (dismissalTransition != v5)
  {
    id v7 = v5;
    [(PXGViewControllerTransition *)dismissalTransition unregisterChangeObserver:self context:DismissalTransitionObservationContext];
    objc_storeStrong((id *)&self->_dismissalTransition, a3);
    [(PXGViewControllerTransition *)self->_dismissalTransition registerChangeObserver:self context:DismissalTransitionObservationContext];
    id v5 = v7;
  }
}

- (void)configureUpdater:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryViewControllerViewModelTransitionsCoordinator;
  id v3 = a3;
  [(PXStoryController *)&v4 configureUpdater:v3];
  objc_msgSend(v3, "addUpdateSelector:", sel__updateViewModeTransition, v4.receiver, v4.super_class);
  [v3 addUpdateSelector:sel__updateDesiredDismissalState];
  [v3 addUpdateSelector:sel__updateViewControllerDismissalTargetPlacement];
  [v3 addUpdateSelector:sel__updateFullsizeContentBoundingBox];
  [v3 addUpdateSelector:sel__updateSummaryItemPlacementOverride];
  [v3 addUpdateSelector:sel__updateSwipeDownTriggeringDismissal];
  [v3 addUpdateSelector:sel__updateSwipeDownDismissalPreview];
  [v3 addUpdateSelector:sel__updateFractionCompleted];
  [v3 addUpdateSelector:sel__updateShouldFinish];
}

- (PXStoryViewControllerViewModelTransitionsCoordinator)initWithViewModel:(id)a3 viewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXStoryViewControllerViewModelTransitionsCoordinator;
  id v8 = [(PXStoryController *)&v13 initWithObservableModel:v6];
  double v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_viewModel, v6);
    objc_storeWeak((id *)&v9->_viewController, v7);
    uint64_t v10 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    dismissalPreviewFraction = v9->_dismissalPreviewFraction;
    v9->_dismissalPreviewFraction = (PXNumberAnimator *)v10;

    [(PXNumberAnimator *)v9->_dismissalPreviewFraction registerChangeObserver:v9 context:DismissalPreviewFractionObservationContext];
  }

  return v9;
}

- (PXStoryViewControllerViewModelTransitionsCoordinator)initWithObservableModel:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryViewControllerViewModelTransitionsCoordinator.m", 47, @"%s is not available as initializer", "-[PXStoryViewControllerViewModelTransitionsCoordinator initWithObservableModel:]");

  abort();
}

@end