@interface UIPreviewPresentationController
+ (BOOL)_shouldApplyVisualEffectsToPresentingView;
+ (BOOL)_shouldInterdictServiceViewTouches;
+ (id)_backgroundEffectForTraitCollection:(id)a3 interactive:(BOOL)a4;
- (BOOL)_allowsAutorotation;
- (BOOL)_keyboardShouldAnimateAlongsideForInteractiveTransitions;
- (BOOL)_presentationPotentiallyUnderlapsStatusBar;
- (BOOL)_shouldDisableInteractionDuringTransitions;
- (BOOL)_shouldKeepCurrentFirstResponder;
- (BOOL)_shouldSavePresentedViewControllerForStateRestoration;
- (BOOL)appliesVisualEffectsToPresentingView;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3;
- (NSArray)keyboardSnapshotters;
- (NSHashTable)keyboardWindows;
- (UIPreviewPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (UIPreviewPresentationControllerDelegate)previewPresentationDelegate;
- (UIResponder)currentPinnedResponder;
- (UITapGestureRecognizer)dismissGestureRecognizer;
- (UIView)localStatusBar;
- (UIVisualEffectView)presentationContainerEffectView;
- (UIWindow)presentationWindow;
- (id)_presentationContainerView;
- (id)containerViewConfigurationBlock;
- (id)dismissalTransitionDidEndBlock;
- (int64_t)presentationStyle;
- (void)_animatePreviewTransitionIfNeeded:(id)a3;
- (void)_applyVisualEffectsForPresentationPhase:(unint64_t)a3;
- (void)_finalizeAfterDismissalTransition;
- (void)_handleDismissGestureRecognizer:(id)a3;
- (void)_layoutForCancel;
- (void)_layoutForInteractiveHighlight;
- (void)_layoutForPreview;
- (void)_prepareContainerViewForPresentationTransition;
- (void)_prepareDismissAnimationsForTransitionCoordinator:(id)a3;
- (void)_prepareDismissGestureRecognizersIfNeeded;
- (void)_prepareKeyboardForPresentationTransition;
- (void)_preparePresentationAnimationsForTransitionCoordinator:(id)a3;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setAppliesVisualEffectsToPresentingView:(BOOL)a3;
- (void)setContainerViewConfigurationBlock:(id)a3;
- (void)setCurrentPinnedResponder:(id)a3;
- (void)setDismissGestureRecognizer:(id)a3;
- (void)setDismissalTransitionDidEndBlock:(id)a3;
- (void)setKeyboardSnapshotters:(id)a3;
- (void)setKeyboardWindows:(id)a3;
- (void)setLocalStatusBar:(id)a3;
- (void)setPresentationContainerEffectView:(id)a3;
- (void)setPresentationWindow:(id)a3;
- (void)setPreviewPresentationDelegate:(id)a3;
@end

@implementation UIPreviewPresentationController

uint64_t __69___UIPreviewPresentationController__animatorForContainmentTransition__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutForDismissTransition];
}

uint64_t __65___UIPreviewPresentationController_interactionProgressDidUpdate___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) percentComplete];
  return objc_msgSend(v1, "_updateBreathingTransformWithProgress:animated:", 1);
}

void __89___UIPreviewPresentationController__preparePresentationContainerViewForPreviewTransition__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) containerView];
  [v1 layoutIfNeeded];
}

uint64_t __63___UIPreviewPresentationController__layoutForPreviewTransition__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _preparePresentationContainerViewForPreviewTransition];
}

void __80___UIPreviewPresentationController__unhighlightPreviewCellSnapshotViewsIfNeeded__block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _layoutForRevealUnhighlightTransition:a2];
  if (a2 >= 1.0) {
    [WeakRetained _stopUnhighlightPreviewCellSnapshotViewAnimationIfNeeded];
  }
}

void __88___UIPreviewPresentationController__updateVisibiltyOfPreviewActionChromeForCurrentState__block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) actionSheetAvailableImageView];
  [v2 setAlpha:v1];
}

void __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) platterView];
  objc_msgSend(v3, "setCenter:", v1, v2);
}

uint64_t __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setPreviewActionSheet:*(void *)(a1 + 32)];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_10;
  v3[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 40);
  id v5 = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_10(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) _configureDynamicsController];
  double v2 = [*(id *)(a1 + 40) platterMenuController];
  [v2 _beginInYLockedStatePresented];

  id v4 = [*(id *)(a1 + 40) containerView];
  id v3 = [v4 window];
  [v3 setUserInteractionEnabled:1];
}

void __93___UIPreviewPresentationController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = (id *)(a1 + 40);
  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5
    && ([v5 _actions],
        v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        v10))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __93___UIPreviewPresentationController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke_4;
    v12[3] = &unk_1E52D9F98;
    v12[4] = v8;
    v11 = &v13;
    id v13 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93___UIPreviewPresentationController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke_2;
    block[3] = &unk_1E5300558;
    block[4] = v8;
    v11 = &v15;
    id v15 = v3;
    id v16 = WeakRetained;
    objc_copyWeak(&v17, v7);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v17);
  }
}

void __93___UIPreviewPresentationController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __93___UIPreviewPresentationController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke_3;
  v5[3] = &unk_1E5300558;
  double v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  objc_copyWeak(&v9, (id *)(a1 + 56));
  [v2 _dismissForHandledActionWithCompletion:v5];
  objc_destroyWeak(&v9);
}

void __93___UIPreviewPresentationController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke_3(id *a1)
{
  double v2 = [a1[4] handler];

  if (v2)
  {
    id v3 = [a1[4] handler];
    ((void (**)(void, id, id))v3)[2](v3, a1[4], a1[5]);
  }
  id v9 = [a1[6] forcePresentationControllerDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = objc_alloc_init(UIPreviewMenuItem);
    id v5 = [a1[4] identifier];
    [(UIPreviewMenuItem *)v4 setIdentifier:v5];

    id v6 = [a1[4] title];
    [(UIPreviewMenuItem *)v4 setTitle:v6];

    [v9 forcePresentationController:a1[6] didSelectMenuItem:v4];
  }
  [a1[5] dismissViewControllerAnimated:1 completion:0];
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  uint64_t v8 = [WeakRetained previewInteractionController];
  [v8 _previewPresentationControllerDidScheduleDismiss];
}

uint64_t __93___UIPreviewPresentationController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke_4(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 40) _actions];
  [*(id *)(a1 + 32) setPreviewActionItems:v2];

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 _presentSubActionSheetForPreviewActionGroup:v4];
}

void __71___UIPreviewPresentationController__dismissPresentationWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasAskedForDismissalInternally:1];
  double v2 = [*(id *)(a1 + 32) previewActionSheet];
  [v2 setHidden:1];

  id v3 = [*(id *)(a1 + 32) presentedViewController];
  [v3 dismissViewControllerAnimated:1 completion:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) previewInteractionController];
  [v4 _previewPresentationControllerDidScheduleDismiss];
}

uint64_t __71___UIPreviewPresentationController__dismissPresentationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71___UIPreviewPresentationController__dismissPresentationWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96___UIPreviewPresentationController__restorePlatterToInitialStatePositionAnimatedWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) centerForPlatterWithMenuViewDismissed];
  double v3 = v2;
  double v5 = v4;
  id v6 = [*(id *)(a1 + 32) platterView];
  objc_msgSend(v6, "setCenter:", v3, v5);

  [*(id *)(a1 + 32) centerForMenuDismissed];
  double v8 = v7;
  double v10 = v9;
  id v11 = [*(id *)(a1 + 32) previewActionSheet];
  objc_msgSend(v11, "setCenter:", v8, v10);
}

uint64_t __96___UIPreviewPresentationController__restorePlatterToInitialStatePositionAnimatedWithCompletion___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) containerView];
  double v3 = [v2 window];
  [v3 setUserInteractionEnabled:1];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __75___UIPreviewPresentationController__dismissForSelectionQuickActionAnimated__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) containerView];
  int v3 = v2[28];

  int v4 = [*(id *)(a1 + 32) leadingQuickActionViewSelected];
  double v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    if (![v5 trailingQuickActionViewSelected]) {
      return;
    }
    v31 = [*(id *)(a1 + 32) leadingQuickActionView];
    [v31 center];
    double v33 = v32;

    v34 = [*(id *)(a1 + 32) containerView];
    [v34 bounds];
    double v10 = 0.5;
    CGFloat v35 = CGRectGetWidth(v54) * 0.5;

    v36 = *(void **)(a1 + 32);
    v37 = [v36 trailingQuickActionView];
    objc_msgSend(v36, "_trailingQuickActionOffsetForCenterPosition:swipeView:", v37, v35, v33);
    double v39 = v38;
    v40 = [*(id *)(a1 + 32) trailingQuickActionViewEdgeConstraint];
    [v40 setConstant:v39];

    v41 = [*(id *)(a1 + 32) trailingQuickActionView];
    v42 = [v41 superview];
    [v42 setNeedsLayout];

    v43 = [*(id *)(a1 + 32) trailingQuickActionView];
    v44 = [v43 superview];
    [v44 layoutIfNeeded];

    v45 = [*(id *)(a1 + 32) presentationContainerView];
    v46 = [v45 platterView];
    [v46 center];
    double v24 = v47;

    v25 = *(void **)(a1 + 32);
    if ((v3 & 0x80000) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    v26 = [v25 presentationContainerView];
    v28 = [v26 platterView];
    [v28 bounds];
    double v30 = CGRectGetWidth(v55) * -0.5;
    goto LABEL_7;
  }
  id v6 = [v5 leadingQuickActionView];
  [v6 center];
  double v8 = v7;

  double v9 = [*(id *)(a1 + 32) containerView];
  [v9 bounds];
  double v10 = 0.5;
  CGFloat v11 = CGRectGetWidth(v51) * 0.5;

  v12 = *(void **)(a1 + 32);
  id v13 = [v12 leadingQuickActionView];
  objc_msgSend(v12, "_leadingQuickActionOffsetForCenterPosition:swipeView:", v13, v11, v8);
  double v15 = v14;
  id v16 = [*(id *)(a1 + 32) leadingQuickActionViewEdgeConstraint];
  [v16 setConstant:v15];

  id v17 = [*(id *)(a1 + 32) leadingQuickActionView];
  v18 = [v17 superview];
  [v18 setNeedsLayout];

  v19 = [*(id *)(a1 + 32) leadingQuickActionView];
  v20 = [v19 superview];
  [v20 layoutIfNeeded];

  v21 = [*(id *)(a1 + 32) presentationContainerView];
  v22 = [v21 platterView];
  [v22 center];
  double v24 = v23;

  v25 = *(void **)(a1 + 32);
  if ((v3 & 0x80000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  v26 = [v25 containerView];
  [v26 bounds];
  double Width = CGRectGetWidth(v52);
  v28 = [*(id *)(a1 + 32) presentationContainerView];
  v29 = [v28 platterView];
  [v29 bounds];
  double v30 = Width + CGRectGetWidth(v53) * v10;

LABEL_7:
  id v49 = [*(id *)(a1 + 32) presentationContainerView];
  v48 = [v49 platterView];
  objc_msgSend(v48, "setCenter:", v30, v24);
}

void __75___UIPreviewPresentationController__dismissForSelectionQuickActionAnimated__block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) presentationContainerView];
  int v3 = [v2 platterView];
  [v3 setHidden:1];

  int v4 = [*(id *)(a1 + 32) previewActionSheet];
  [v4 setHidden:1];

  [*(id *)(a1 + 32) setHasAskedForDismissalInternally:1];
  double v5 = [*(id *)(a1 + 32) presentedViewController];
  [v5 dismissViewControllerAnimated:1 completion:0];

  id v6 = [*(id *)(a1 + 32) previewInteractionController];
  [v6 _previewPresentationControllerDidScheduleDismiss];
}

void __75___UIPreviewPresentationController__dismissForSelectionQuickActionAnimated__block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 150000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75___UIPreviewPresentationController__dismissForSelectionQuickActionAnimated__block_invoke_4;
  block[3] = &unk_1E52DA040;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __75___UIPreviewPresentationController__dismissForSelectionQuickActionAnimated__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75___UIPreviewPresentationController__dismissForHandledActionWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) platterContainerBounds];
  double MidX = CGRectGetMidX(v12);
  [*(id *)(a1 + 32) platterBounds];
  CGFloat v3 = CGRectGetHeight(v13) * -0.5;
  id v4 = [*(id *)(a1 + 32) presentationContainerView];
  double v5 = [v4 platterView];
  objc_msgSend(v5, "setCenter:", MidX, v3);

  [*(id *)(a1 + 32) centerForMenuDismissed];
  double v7 = v6;
  double v9 = v8;
  id v10 = [*(id *)(a1 + 32) previewActionSheet];
  objc_msgSend(v10, "setCenter:", v7, v9);
}

void __75___UIPreviewPresentationController__dismissForHandledActionWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) presentationContainerView];
  CGFloat v3 = [v2 platterView];
  [v3 setHidden:1];

  id v4 = [*(id *)(a1 + 32) previewActionSheet];
  [v4 setHidden:1];

  [*(id *)(a1 + 40) dismissViewControllerAnimated:1 completion:*(void *)(a1 + 48)];
  id v5 = [*(id *)(a1 + 32) previewInteractionController];
  [v5 _previewPresentationControllerDidScheduleDismiss];
}

- (UIPreviewPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIPreviewPresentationController;
  id v4 = [(UIPresentationController *)&v8 initWithPresentedViewController:a3 presentingViewController:a4];
  id v5 = v4;
  if (v4)
  {
    v4->_appliesVisualEffectsToPresentingView = 1;
    double v6 = v4;
  }

  return v5;
}

- (int64_t)presentationStyle
{
  return 20;
}

- (void)presentationTransitionWillBegin
{
  v9.receiver = self;
  v9.super_class = (Class)UIPreviewPresentationController;
  [(UIPresentationController *)&v9 presentationTransitionWillBegin];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__UIPreviewPresentationController_presentationTransitionWillBegin__block_invoke;
  v8[3] = &unk_1E52D9F70;
  v8[4] = self;
  +[UIView performWithoutAnimation:v8];
  CGFloat v3 = [(UIPresentationController *)self presentedViewController];
  id v4 = [v3 transitionCoordinator];

  [(UIPreviewPresentationController *)self _preparePresentationAnimationsForTransitionCoordinator:v4];
  [(UIPreviewPresentationController *)self _prepareDismissGestureRecognizersIfNeeded];
  id v5 = [(UIPreviewPresentationController *)self containerViewConfigurationBlock];

  if (v5)
  {
    double v6 = [(UIPreviewPresentationController *)self containerViewConfigurationBlock];
    double v7 = [(UIPresentationController *)self containerView];
    ((void (**)(void, void *))v6)[2](v6, v7);
  }
}

uint64_t __66__UIPreviewPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareContainerViewForPresentationTransition];
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIPreviewPresentationController;
  -[UIPresentationController presentationTransitionDidEnd:](&v5, sel_presentationTransitionDidEnd_);
  if (!a3) {
    [(UIPreviewPresentationController *)self _finalizeAfterDismissalTransition];
  }
}

- (void)dismissalTransitionWillBegin
{
  v5.receiver = self;
  v5.super_class = (Class)UIPreviewPresentationController;
  [(UIPresentationController *)&v5 dismissalTransitionWillBegin];
  CGFloat v3 = [(UIPresentationController *)self presentedViewController];
  id v4 = [v3 transitionCoordinator];

  [(UIPreviewPresentationController *)self _prepareDismissAnimationsForTransitionCoordinator:v4];
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIPreviewPresentationController;
  -[UIPresentationController dismissalTransitionDidEnd:](&v6, sel_dismissalTransitionDidEnd_);
  if (v3)
  {
    [(UIPreviewPresentationController *)self _finalizeAfterDismissalTransition];
    dismissalTransitionDidEndBlock = (void (**)(void))self->_dismissalTransitionDidEndBlock;
    if (dismissalTransitionDidEndBlock) {
      dismissalTransitionDidEndBlock[2]();
    }
  }
}

- (BOOL)_shouldKeepCurrentFirstResponder
{
  return 0;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return 0;
}

- (BOOL)_presentationPotentiallyUnderlapsStatusBar
{
  return 0;
}

- (BOOL)_keyboardShouldAnimateAlongsideForInteractiveTransitions
{
  return 0;
}

- (BOOL)_shouldSavePresentedViewControllerForStateRestoration
{
  return 0;
}

- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3
{
  [a3 bounds];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (id)_backgroundEffectForTraitCollection:(id)a3 interactive:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  return +[UIForcePresentationHelper visualEffectForPresentationPhase:v5 traitCollection:a3 variant:0];
}

+ (BOOL)_shouldInterdictServiceViewTouches
{
  return 1;
}

- (BOOL)_allowsAutorotation
{
  return 0;
}

- (void)_prepareContainerViewForPresentationTransition
{
  id v8 = [(UIPresentationController *)self containerView];
  double v3 = [v8 window];
  [(UIPreviewPresentationController *)self setPresentationWindow:v3];

  if (![(UIPreviewPresentationController *)self _allowsAutorotation])
  {
    double v4 = [(UIPreviewPresentationController *)self presentationWindow];
    [v4 beginDisablingInterfaceAutorotation];
  }
  uint64_t v5 = [[UIVisualEffectView alloc] initWithEffect:0];
  [v8 bounds];
  -[UIView setFrame:](v5, "setFrame:");
  [(UIView *)v5 setAutoresizingMask:18];
  objc_storeStrong((id *)&self->_presentationContainerEffectView, v5);
  [v8 addSubview:v5];
  if ([(UIPreviewPresentationController *)self appliesVisualEffectsToPresentingView])
  {
    [(UIPreviewPresentationController *)self _prepareStatusBarForPresentationTransition];
    [(UIPreviewPresentationController *)self _prepareKeyboardForPresentationTransition];
  }
  double v6 = [(UIPresentationController *)self presentedView];
  double v7 = [(UIPreviewPresentationController *)self _presentationContainerView];
  [(UIPresentationController *)self frameOfPresentedViewInContainerView];
  objc_msgSend(v8, "convertRect:toView:", v7);
  objc_msgSend(v6, "setFrame:");
  [v7 addSubview:v6];
  [(UIPreviewPresentationController *)self _presentationTransitionWillBeginForContainerEffectView:v5];
  if ([(UIPreviewPresentationController *)self appliesVisualEffectsToPresentingView])
  {
    +[UIWindow _synchronizeDrawingWithPreCommitHandler:0];
  }
}

- (void)_prepareKeyboardForPresentationTransition
{
  double v3 = [(UIPresentationController *)self presentingViewController];
  double v4 = -[UIViewController _keyboardSceneDelegate](v3);

  uint64_t v5 = [v4 responder];
  if (v5)
  {
    double v6 = +[UIKeyboardImpl activeInstance];
    double v7 = [v6 _rootInputWindowController];
    char v8 = [v7 isChangingPlacement];

    if ((v8 & 1) == 0)
    {
      [(UIPreviewPresentationController *)self setCurrentPinnedResponder:v5];
      [v4 _beginPinningInputViewsOnBehalfOfResponder:v5];
      objc_super v9 = +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__158;
      double v32 = __Block_byref_object_dispose__158;
      id v33 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v22 = 0;
      double v23 = &v22;
      uint64_t v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__158;
      v26 = __Block_byref_object_dispose__158;
      id v27 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v10 = [(UIPresentationController *)self containerView];
      CGFloat v11 = [(UIPreviewPresentationController *)self presentationContainerEffectView];
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      id v16 = __76__UIPreviewPresentationController__prepareKeyboardForPresentationTransition__block_invoke;
      id v17 = &unk_1E53007C8;
      id v12 = v10;
      id v18 = v12;
      id v13 = v11;
      id v19 = v13;
      v20 = &v28;
      v21 = &v22;
      [v9 enumerateObjectsUsingBlock:&v14];
      -[UIPreviewPresentationController setKeyboardSnapshotters:](self, "setKeyboardSnapshotters:", v29[5], v14, v15, v16, v17);
      [(UIPreviewPresentationController *)self setKeyboardWindows:v23[5]];

      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(&v28, 8);
    }
  }
}

void __76__UIPreviewPresentationController__prepareKeyboardForPresentationTransition__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v3 = +[UIKBViewTreeSnapshotter snapshotterForKeyboardView:v7 afterScreenUpdates:0];
    double v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 snapshotView];
      double v6 = *(void **)(a1 + 32);
      [v7 bounds];
      objc_msgSend(v6, "convertRect:fromCoordinateSpace:", v7);
      objc_msgSend(v5, "setFrame:");
      [*(id *)(a1 + 32) insertSubview:v5 belowSubview:*(void *)(a1 + 40)];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v4];
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v7];
      [v7 setAlpha:0.0];
    }
  }
}

- (void)_finalizeAfterDismissalTransition
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v3 = [(UIPreviewPresentationController *)self localStatusBar];
  [v3 removeFromSuperview];

  [(UIPreviewPresentationController *)self setLocalStatusBar:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v4 = [(UIPreviewPresentationController *)self keyboardWindows];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v8++) setAlpha:1.0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  [(UIPreviewPresentationController *)self setKeyboardWindows:0];
  objc_super v9 = [(UIPreviewPresentationController *)self keyboardSnapshotters];
  [v9 enumerateObjectsUsingBlock:&__block_literal_global_433];

  [(UIPreviewPresentationController *)self setKeyboardSnapshotters:0];
  id v10 = [(UIPresentationController *)self presentingViewController];
  CGFloat v11 = -[UIViewController _keyboardSceneDelegate](v10);

  id v12 = [(UIPreviewPresentationController *)self currentPinnedResponder];
  if (v12 && [v11 _isPinningInputViewsOnBehalfOfResponder:v12])
  {
    [v11 _stopPinningInputViewsOnBehalfOfResponder:v12];
    [v12 becomeFirstResponder];
  }
  id v13 = [(UIPreviewPresentationController *)self presentationWindow];
  [v13 endDisablingInterfaceAutorotationAnimated:1];

  [(UIPreviewPresentationController *)self setPresentationWindow:0];
}

void __68__UIPreviewPresentationController__finalizeAfterDismissalTransition__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 snapshotView];
  [v2 removeFromSuperview];
}

- (id)_presentationContainerView
{
  id v2 = [(UIPreviewPresentationController *)self presentationContainerEffectView];
  double v3 = [v2 contentView];

  return v3;
}

- (void)_preparePresentationAnimationsForTransitionCoordinator:(id)a3
{
  id v4 = a3;
  if ([(UIPreviewPresentationController *)self appliesVisualEffectsToPresentingView])
  {
    if (v4)
    {
      void v5[4] = self;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __90__UIPreviewPresentationController__preparePresentationAnimationsForTransitionCoordinator___block_invoke;
      v6[3] = &unk_1E52DA598;
      v6[4] = self;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __90__UIPreviewPresentationController__preparePresentationAnimationsForTransitionCoordinator___block_invoke_2;
      v5[3] = &unk_1E52DA598;
      [v4 animateAlongsideTransition:v6 completion:v5];
    }
    else
    {
      [(UIPreviewPresentationController *)self _layoutForPreview];
    }
  }
}

uint64_t __90__UIPreviewPresentationController__preparePresentationAnimationsForTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 initiallyInteractive];
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    return [v4 _layoutForInteractiveHighlight];
  }
  else
  {
    return [v4 _layoutForPreview];
  }
}

void __90__UIPreviewPresentationController__preparePresentationAnimationsForTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isCancelled] & 1) == 0) {
    [*(id *)(a1 + 32) _animatePreviewTransitionIfNeeded:v3];
  }
}

- (void)_prepareDismissAnimationsForTransitionCoordinator:(id)a3
{
  id v4 = a3;
  if ([(UIPreviewPresentationController *)self appliesVisualEffectsToPresentingView])
  {
    if (v4)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __85__UIPreviewPresentationController__prepareDismissAnimationsForTransitionCoordinator___block_invoke;
      v5[3] = &unk_1E52DA598;
      void v5[4] = self;
      [v4 animateAlongsideTransition:v5 completion:0];
    }
    else
    {
      [(UIPreviewPresentationController *)self _layoutForCancel];
    }
  }
}

uint64_t __85__UIPreviewPresentationController__prepareDismissAnimationsForTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutForCancel];
}

- (void)_prepareDismissGestureRecognizersIfNeeded
{
  id v3 = [(UIPreviewPresentationController *)self previewPresentationDelegate];

  if (v3)
  {
    uint64_t v5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__handleDismissGestureRecognizer_];
    [(UIGestureRecognizer *)v5 setDelegate:self];
    id v4 = [(UIPresentationController *)self containerView];
    [v4 addGestureRecognizer:v5];

    [(UIPreviewPresentationController *)self setDismissGestureRecognizer:v5];
  }
}

- (void)_handleDismissGestureRecognizer:(id)a3
{
  id v5 = [(UIPreviewPresentationController *)self previewPresentationDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(UIPresentationController *)self presentedViewController];
    [v5 previewPresentationController:self shouldDismissViewController:v4];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIPresentationController *)self presenting]
    || [(UIPresentationController *)self dismissing])
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    id v10 = [(UIPreviewPresentationController *)self dismissGestureRecognizer];

    if (v10 == v6)
    {
      CGFloat v11 = [(UIPresentationController *)self presentedView];
      [v7 locationInView:v11];
      int v8 = objc_msgSend(v11, "pointInside:withEvent:", 0) ^ 1;
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }

  return v8;
}

- (void)_layoutForInteractiveHighlight
{
}

- (void)_layoutForPreview
{
}

- (void)_layoutForCancel
{
}

+ (BOOL)_shouldApplyVisualEffectsToPresentingView
{
  return 1;
}

- (void)_applyVisualEffectsForPresentationPhase:(unint64_t)a3
{
  if (a3)
  {
    BOOL v4 = a3 == 1;
    id v5 = objc_opt_class();
    id v6 = [(UIPresentationController *)self traitCollection];
    id v8 = [v5 _backgroundEffectForTraitCollection:v6 interactive:v4];
  }
  else
  {
    id v8 = 0;
  }
  id v7 = [(UIPreviewPresentationController *)self presentationContainerEffectView];
  [v7 setEffect:v8];
}

- (void)_animatePreviewTransitionIfNeeded:(id)a3
{
  id v4 = a3;
  if (([v4 isCancelled] & 1) == 0 && objc_msgSend(v4, "initiallyInteractive"))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__UIPreviewPresentationController__animatePreviewTransitionIfNeeded___block_invoke;
    aBlock[3] = &unk_1E52D9F70;
    aBlock[4] = self;
    id v5 = _Block_copy(aBlock);
    if (_AXSReduceMotionEnabled())
    {
      +[UIView animateKeyframesWithDuration:0 delay:v5 options:0 animations:0.2 completion:0.0];
    }
    else
    {
      self;
      _durationOfSpringAnimation(2.0, 1500.0, 93.0, 0.0);
      +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v5, 0);
    }
  }
}

uint64_t __69__UIPreviewPresentationController__animatePreviewTransitionIfNeeded___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutForPreview];
}

- (UIPreviewPresentationControllerDelegate)previewPresentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewPresentationDelegate);
  return (UIPreviewPresentationControllerDelegate *)WeakRetained;
}

- (void)setPreviewPresentationDelegate:(id)a3
{
}

- (UITapGestureRecognizer)dismissGestureRecognizer
{
  return self->_dismissGestureRecognizer;
}

- (void)setDismissGestureRecognizer:(id)a3
{
}

- (BOOL)appliesVisualEffectsToPresentingView
{
  return self->_appliesVisualEffectsToPresentingView;
}

- (void)setAppliesVisualEffectsToPresentingView:(BOOL)a3
{
  self->_appliesVisualEffectsToPresentingView = a3;
}

- (UIVisualEffectView)presentationContainerEffectView
{
  return self->_presentationContainerEffectView;
}

- (void)setPresentationContainerEffectView:(id)a3
{
}

- (UIView)localStatusBar
{
  return self->_localStatusBar;
}

- (void)setLocalStatusBar:(id)a3
{
}

- (NSArray)keyboardSnapshotters
{
  return self->_keyboardSnapshotters;
}

- (void)setKeyboardSnapshotters:(id)a3
{
}

- (NSHashTable)keyboardWindows
{
  return self->_keyboardWindows;
}

- (void)setKeyboardWindows:(id)a3
{
}

- (UIResponder)currentPinnedResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentPinnedResponder);
  return (UIResponder *)WeakRetained;
}

- (void)setCurrentPinnedResponder:(id)a3
{
}

- (UIWindow)presentationWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationWindow);
  return (UIWindow *)WeakRetained;
}

- (void)setPresentationWindow:(id)a3
{
}

- (id)containerViewConfigurationBlock
{
  return self->_containerViewConfigurationBlock;
}

- (void)setContainerViewConfigurationBlock:(id)a3
{
}

- (id)dismissalTransitionDidEndBlock
{
  return self->_dismissalTransitionDidEndBlock;
}

- (void)setDismissalTransitionDidEndBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissalTransitionDidEndBlock, 0);
  objc_storeStrong(&self->_containerViewConfigurationBlock, 0);
  objc_destroyWeak((id *)&self->_presentationWindow);
  objc_destroyWeak((id *)&self->_currentPinnedResponder);
  objc_storeStrong((id *)&self->_keyboardWindows, 0);
  objc_storeStrong((id *)&self->_keyboardSnapshotters, 0);
  objc_storeStrong((id *)&self->_localStatusBar, 0);
  objc_storeStrong((id *)&self->_presentationContainerEffectView, 0);
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_previewPresentationDelegate);
}

@end