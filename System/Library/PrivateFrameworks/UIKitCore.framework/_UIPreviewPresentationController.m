@interface _UIPreviewPresentationController
+ (BOOL)_shouldApplyVisualEffectsToPresentingView;
+ (id)_backgroundEffectForTraitCollection:(id)a3 interactive:(BOOL)a4;
- (BOOL)_canCommitPresentation;
- (BOOL)_canDismissPresentation;
- (BOOL)_hasPreviewActions;
- (BOOL)_hasPreviewQuickActions;
- (BOOL)_hasSelectedQuickAction;
- (BOOL)_platterIsInInitialPosition;
- (BOOL)_platterIsInInitialPositionMostly;
- (BOOL)_platterIsSelectingPreviewActions;
- (BOOL)_shouldSavePresentedViewControllerForStateRestoration;
- (BOOL)_sourceViewSnapshotAndScaleTransformSuppressed;
- (BOOL)didSendBeginEvent;
- (BOOL)hasAskedForCommitInternally;
- (BOOL)hasAskedForDismissalInternally;
- (BOOL)isAnimatingActionSheet;
- (BOOL)isBreathing;
- (BOOL)leadingQuickActionViewSelected;
- (BOOL)panningGestureRecognizerInProgress;
- (BOOL)preDismissAnimationsInflight;
- (BOOL)previewActionSheetCanSelectItem:(id)a3;
- (BOOL)trailingQuickActionViewSelected;
- (CGPoint)_applyLayoutAdjustmentsForManagedViewWithPosition:(CGPoint)a3;
- (CGPoint)_dismissedActionSheetCenterForActionSheet:(id)a3;
- (CGPoint)_presentedActionSheetCenterForActionSheet:(id)a3;
- (CGPoint)centerForMenuDismissed;
- (CGPoint)centerForMenuDismissedForActionSheet:(id)a3;
- (CGPoint)centerForMenuPresented;
- (CGPoint)centerForMenuPresentedForActionSheet:(id)a3;
- (CGPoint)centerForPlatterWithMenuViewDismissed;
- (CGPoint)centerForPlatterWithMenuViewPresented;
- (CGPoint)centerForPlatterWithMenuViewPresentedForActionSheet:(id)a3;
- (CGPoint)initialCenterForLeadingSwipeActionView;
- (CGPoint)initialCenterForTrailingSwipeActionView;
- (CGRect)_preferredSourceViewRect;
- (CGRect)platterBounds;
- (CGRect)platterContainerBounds;
- (NSArray)previewActionItems;
- (NSLayoutConstraint)containerScrollViewXConstraint;
- (NSLayoutConstraint)leadingQuickActionViewEdgeConstraint;
- (NSLayoutConstraint)trailingQuickActionViewEdgeConstraint;
- (UIGestureRecognizer)modalPreviewActionsPanningGestureRecognizer;
- (UIGestureRecognizer)panningGestureRecognizer;
- (UIImageView)actionSheetAvailableImageView;
- (UIInteractionProgress)interactionProgressForPresentation;
- (UIPreviewAction)leadingPreviewAction;
- (UIPreviewAction)trailingPreviewAction;
- (UIPreviewForceInteractionProgress)interactionProgressForBreathing;
- (UIPreviewForceInteractionProgress)interactionProgressForCommit;
- (UIPreviewInteractionController)previewInteractionController;
- (UIScrollView)containerScrollView;
- (UITapGestureRecognizer)tapToDismissGestureRecognizer;
- (UIView)actionSheetContainerView;
- (UIView)initialSourceViewSnapshot;
- (UIViewControllerPreviewing)previewingContext;
- (UIWindow)initialSourceViewSnapshotWindow;
- (_UIForcePresentationControllerDelegate)forcePresentationControllerDelegate;
- (_UIPlatterMenuDynamicsController)platterMenuController;
- (_UIPreviewActionSheetView)previewActionSheet;
- (_UIPreviewPresentationAnimator)unhighlightPreviewCellSnapshotViewAnimator;
- (_UIPreviewPresentationContainerView)presentationContainerView;
- (_UIPreviewPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (_UIPreviewPresentationEffectView)revealContainerView;
- (_UIPreviewQuickActionView)leadingQuickActionView;
- (_UIPreviewQuickActionView)trailingQuickActionView;
- (_UIStatesFeedbackGenerator)feedbackGenerator;
- (_UIVelocityIntegrator)revealPanningVelocityIntegrator;
- (double)_leadingQuickActionOffsetForCenterPosition:(CGPoint)a3 swipeView:(id)a4;
- (double)_quickActionSelectionOffset;
- (double)_quickActionsSelectionThresholdForPreviewMenuItemStyle:(int64_t)a3;
- (double)_trailingQuickActionOffsetForCenterPosition:(CGPoint)a3 swipeView:(id)a4;
- (double)minimumSpacingBetweenPlatterAndMenu;
- (double)platterContainerCenterX;
- (double)platterContainerCenterY;
- (double)presentationViewCornerRadius;
- (id)_animatorForContainmentTransition;
- (id)_makeAndAddToViewHierarchyPreviewActionSheetForMenuItems:(id)a3;
- (id)_viewsParticipatingInNavigationControllerTransition;
- (id)platterView;
- (id)presentationPhaseCompletionBlock;
- (unint64_t)currentPresentationPhase;
- (void)_beginBreathing;
- (void)_configureActionSheetChromeViews;
- (void)_configureDynamicsController;
- (void)_configureInitialActionSheetViewIfNeeded;
- (void)_dismissForHandledActionWithCompletion:(id)a3;
- (void)_dismissForSelectionQuickActionAnimated;
- (void)_dismissPresentation;
- (void)_dismissPresentationWithCompletion:(id)a3;
- (void)_endBreathing;
- (void)_hideQuickActions;
- (void)_invokeCommitHandlerFromInteractionProgress;
- (void)_layoutForDismissTransition;
- (void)_layoutForPreviewInteractionProgress:(double)a3;
- (void)_layoutForPreviewTransition;
- (void)_layoutForRevealTransition;
- (void)_layoutForRevealUnhighlightTransition:(double)a3;
- (void)_panningGestureRecognizerDidFire:(id)a3;
- (void)_prepareInitialSourceViewSnapshot;
- (void)_preparePresentationContainerViewForPreviewInteraction;
- (void)_preparePresentationContainerViewForPreviewTransition;
- (void)_presentSubActionSheetForPreviewActionGroup:(id)a3;
- (void)_presentationTransitionWillBeginForContainerEffectView:(id)a3;
- (void)_previewTransitionDidComplete:(BOOL)a3;
- (void)_restorePlatterToInitialStatePositionAnimated;
- (void)_restorePlatterToInitialStatePositionAnimatedWithCompletion:(id)a3;
- (void)_revealTransitionDidComplete:(BOOL)a3;
- (void)_setupInteractionProgressForBreathing;
- (void)_stopUnhighlightPreviewCellSnapshotViewAnimationIfNeeded;
- (void)_triggerQuickActionHandlerIfNeeded;
- (void)_unhighlightPreviewCellSnapshotViewsIfNeeded;
- (void)_updateBreathingTransformWithProgress:(double)a3 animated:(BOOL)a4;
- (void)_updateRevealContainerViewForSourceRect:(CGRect)a3;
- (void)_updateVisibiltyOfPreviewActionChromeForCurrentState;
- (void)_willCommitPresentation;
- (void)containerViewWillLayoutSubviews;
- (void)dealloc;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4;
- (void)interactionProgressDidUpdate:(id)a3;
- (void)platterMenuDynamicsController:(id)a3 didMoveSwipeView:(id)a4 toPosition:(CGPoint)a5;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setActionSheetAvailableImageView:(id)a3;
- (void)setActionSheetContainerView:(id)a3;
- (void)setContainerScrollView:(id)a3;
- (void)setContainerScrollViewXConstraint:(id)a3;
- (void)setCurrentPresentationPhase:(unint64_t)a3;
- (void)setDidSendBeginEvent:(BOOL)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setForcePresentationControllerDelegate:(id)a3;
- (void)setHasAskedForCommitInternally:(BOOL)a3;
- (void)setHasAskedForDismissalInternally:(BOOL)a3;
- (void)setInitialSourceViewSnapshot:(id)a3;
- (void)setInitialSourceViewSnapshotWindow:(id)a3;
- (void)setInteractionProgressForBreathing:(id)a3;
- (void)setInteractionProgressForCommit:(id)a3;
- (void)setInteractionProgressForPresentation:(id)a3;
- (void)setIsAnimatingActionSheet:(BOOL)a3;
- (void)setLeadingPreviewAction:(id)a3;
- (void)setLeadingQuickActionView:(id)a3;
- (void)setLeadingQuickActionViewEdgeConstraint:(id)a3;
- (void)setLeadingQuickActionViewSelected:(BOOL)a3;
- (void)setModalPreviewActionsPanningGestureRecognizer:(id)a3;
- (void)setPanningGestureRecognizer:(id)a3;
- (void)setPanningGestureRecognizerInProgress:(BOOL)a3;
- (void)setPlatterMenuController:(id)a3;
- (void)setPreDismissAnimationsInflight:(BOOL)a3;
- (void)setPresentationContainerView:(id)a3;
- (void)setPresentationPhaseCompletionBlock:(id)a3;
- (void)setPresentationViewCornerRadius:(double)a3;
- (void)setPreviewActionItems:(id)a3;
- (void)setPreviewActionSheet:(id)a3;
- (void)setPreviewInteractionController:(id)a3;
- (void)setPreviewingContext:(id)a3;
- (void)setRevealContainerView:(id)a3;
- (void)setRevealPanningVelocityIntegrator:(id)a3;
- (void)setTapToDismissGestureRecognizer:(id)a3;
- (void)setTrailingPreviewAction:(id)a3;
- (void)setTrailingQuickActionView:(id)a3;
- (void)setTrailingQuickActionViewEdgeConstraint:(id)a3;
- (void)setTrailingQuickActionViewSelected:(BOOL)a3;
- (void)setUnhighlightPreviewCellSnapshotViewAnimator:(id)a3;
- (void)set_sourceViewSnapshotAndScaleTransformSuppressed:(BOOL)a3;
- (void)setupAdditionalModalGestureRecognizers;
- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3;
- (void)updateSwipeActionsIfApplicable;
@end

@implementation _UIPreviewPresentationController

- (_UIPreviewPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UIPreviewPresentationController;
  v4 = [(UIPreviewPresentationController *)&v9 initWithPresentedViewController:a3 presentingViewController:a4];
  v5 = v4;
  if (v4)
  {
    -[UIPresentationController setSourceRect:](v4, "setSourceRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(_UIPreviewPresentationController *)v5 setCurrentPresentationPhase:0];
    v6 = objc_alloc_init(_UIVelocityIntegrator);
    [(_UIPreviewPresentationController *)v5 setRevealPanningVelocityIntegrator:v6];

    v7 = v5;
  }

  return v5;
}

- (void)dealloc
{
  [(_UIPreviewPresentationController *)self setPanningGestureRecognizer:0];
  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewPresentationController;
  [(UIPresentationController *)&v3 dealloc];
}

- (double)presentationViewCornerRadius
{
  v2 = [(_UIPreviewPresentationController *)self presentationContainerView];
  [v2 cornerRadius];
  double v4 = v3;

  return v4;
}

- (void)setPresentationViewCornerRadius:(double)a3
{
  id v4 = [(_UIPreviewPresentationController *)self presentationContainerView];
  [v4 setCornerRadius:a3];
}

- (void)_presentationTransitionWillBeginForContainerEffectView:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)_UIPreviewPresentationController;
  [(UIPreviewPresentationController *)&v25 _presentationTransitionWillBeginForContainerEffectView:a3];
  [(_UIPreviewPresentationController *)self _preferredSourceViewRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  -[_UIPreviewPresentationController _updateRevealContainerViewForSourceRect:](self, "_updateRevealContainerViewForSourceRect:");
  v12 = [(UIPreviewPresentationController *)self presentationContainerEffectView];
  v13 = [v12 contentView];

  v14 = [(_UIPreviewPresentationController *)self revealContainerView];
  [v13 addSubview:v14];

  v15 = [(UIPresentationController *)self sourceView];
  objc_msgSend(v13, "convertRect:fromView:", v15, v5, v7, v9, v11);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [(_UIPreviewPresentationController *)self revealContainerView];
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);
}

- (void)presentationTransitionWillBegin
{
  v32.receiver = self;
  v32.super_class = (Class)_UIPreviewPresentationController;
  [(UIPreviewPresentationController *)&v32 presentationTransitionWillBegin];
  double v3 = [(UIPreviewPresentationController *)self presentationContainerEffectView];
  double v4 = [v3 contentView];

  double v5 = [UIScrollView alloc];
  [v4 bounds];
  double v6 = -[UIScrollView initWithFrame:](v5, "initWithFrame:");
  [(UIView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)v6 setScrollEnabled:0];
  [v4 bounds];
  -[UIScrollView setContentSize:](v6, "setContentSize:", v7, v8);
  [(UIScrollView *)v6 setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)v6 setShowsVerticalScrollIndicator:0];
  [v4 addSubview:v6];
  [(_UIPreviewPresentationController *)self setContainerScrollView:v6];
  double v9 = [_UIPreviewPresentationContainerView alloc];
  [v4 bounds];
  double v10 = -[_UIPreviewPresentationContainerView initWithFrame:](v9, "initWithFrame:");
  double v11 = [(UIPresentationController *)self presentedViewController];
  v12 = [v11 view];
  [(_UIPreviewPresentationContainerView *)v10 setContentView:v12];

  [(UIView *)v10 setHidden:1];
  [(_UIPreviewPresentationController *)self setPresentationContainerView:v10];
  [(UIView *)v6 addSubview:v10];
  v13 = [UIView alloc];
  [v4 bounds];
  v14 = -[UIView initWithFrame:](v13, "initWithFrame:");
  [(UIView *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 addSubview:v14];
  [(_UIPreviewPresentationController *)self setActionSheetContainerView:v14];
  v15 = _NSDictionaryOfVariableBindings(&cfstr_Containerscrol_0.isa, v6, v14, 0);
  double v16 = [(UIView *)v6 centerXAnchor];
  double v17 = [v4 centerXAnchor];
  double v18 = [v16 constraintEqualToAnchor:v17];
  [(_UIPreviewPresentationController *)self setContainerScrollViewXConstraint:v18];

  double v19 = [(UIView *)v6 widthAnchor];
  double v20 = [v4 widthAnchor];
  double v21 = [v19 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  double v22 = [(_UIPreviewPresentationController *)self containerScrollViewXConstraint];
  [v22 setActive:1];

  double v23 = (void *)MEMORY[0x1E4F5B268];
  v24 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:|[containerScrollView]|" options:0 metrics:0 views:v15];
  [v23 activateConstraints:v24];

  objc_super v25 = (void *)MEMORY[0x1E4F5B268];
  v26 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"H:|[actionSheetContainerView]|" options:0 metrics:0 views:v15];
  [v25 activateConstraints:v26];

  v27 = (void *)MEMORY[0x1E4F5B268];
  v28 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:|[actionSheetContainerView]|" options:0 metrics:0 views:v15];
  [v27 activateConstraints:v28];

  v29 = [(UIPresentationController *)self presentedViewController];
  v30 = [v29 view];
  [(_UIPreviewPresentationContainerView *)v10 setContentView:v30];

  [(UIView *)v10 setHidden:1];
  [(_UIPreviewPresentationController *)self setPresentationContainerView:v10];
  [(UIView *)v6 addSubview:v10];
  v31 = [(_UIPreviewPresentationController *)self forcePresentationControllerDelegate];
  if (objc_opt_respondsToSelector()) {
    [v31 forcePresentationTransitionWillBegin:self];
  }
  [(_UIPreviewPresentationController *)self _unhighlightPreviewCellSnapshotViewsIfNeeded];
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewPresentationController;
  [(UIPreviewPresentationController *)&v4 presentationTransitionDidEnd:a3];
  [(_UIPreviewPresentationController *)self _stopUnhighlightPreviewCellSnapshotViewAnimationIfNeeded];
}

- (void)dismissalTransitionWillBegin
{
  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewPresentationController;
  [(UIPreviewPresentationController *)&v3 dismissalTransitionWillBegin];
  [(_UIPreviewPresentationController *)self _hideQuickActions];
  [(_UIPreviewPresentationController *)self _stopUnhighlightPreviewCellSnapshotViewAnimationIfNeeded];
  [(_UIPreviewPresentationController *)self _endBreathing];
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewPresentationController;
  [(UIPreviewPresentationController *)&v4 dismissalTransitionDidEnd:a3];
  [(_UIPreviewPresentationController *)self _triggerQuickActionHandlerIfNeeded];
}

- (void)containerViewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPreviewPresentationController;
  [(UIPresentationController *)&v6 containerViewWillLayoutSubviews];
  objc_super v3 = [(_UIPreviewPresentationController *)self presentationContainerView];
  objc_super v4 = [(UIPresentationController *)self presentedViewController];
  [v4 preferredContentSize];
  objc_msgSend(v3, "setPreferredContentSize:");

  double v5 = [(UIPresentationController *)self containerView];
  [v5 bounds];
  objc_msgSend(v3, "setFrame:");
}

- (id)_viewsParticipatingInNavigationControllerTransition
{
  v7[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(UIPreviewPresentationController *)self presentationContainerEffectView];

  if (v3)
  {
    objc_super v4 = [(UIPreviewPresentationController *)self presentationContainerEffectView];
    v7[0] = v4;
    double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    double v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (id)_animatorForContainmentTransition
{
  v12[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [[_UIPreviewTransitionController alloc] initWithInteractionProgress:0 targetPresentationPhase:4];
  v11[0] = @"backgroundView";
  objc_super v4 = [(UIPreviewPresentationController *)self presentationContainerEffectView];
  v12[0] = v4;
  v11[1] = @"containerView";
  double v5 = [(UIPresentationController *)self containerView];
  v12[1] = v5;
  v11[2] = @"presentationContainerView";
  objc_super v6 = [(_UIPreviewPresentationController *)self presentationContainerView];
  v12[2] = v6;
  v11[3] = @"presentationView";
  double v7 = [(UIPresentationController *)self _presentationView];
  v12[3] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  [(_UIPreviewTransitionController *)v3 setViewsParticipatingInCommitTransition:v8];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69___UIPreviewPresentationController__animatorForContainmentTransition__block_invoke;
  v10[3] = &unk_1E52D9F70;
  v10[4] = self;
  [(_UIPreviewTransitionController *)v3 setAnimations:v10 completion:0 forPresentationPhase:4];
  return v3;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPreviewPresentationController;
  [(UIPresentationController *)&v6 preferredContentSizeDidChangeForChildContentContainer:a3];
  objc_super v4 = [(_UIPreviewPresentationController *)self presentationContainerView];
  double v5 = [(UIPresentationController *)self presentedViewController];
  [v5 preferredContentSize];
  objc_msgSend(v4, "setPreferredContentSize:");

  [v4 setNeedsLayout];
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPreviewPresentationController;
  [(UIPresentationController *)&v6 systemLayoutFittingSizeDidChangeForChildContentContainer:a3];
  objc_super v4 = [(_UIPreviewPresentationController *)self presentationContainerView];
  double v5 = [(UIPresentationController *)self presentedViewController];
  [v5 preferredContentSize];
  objc_msgSend(v4, "setPreferredContentSize:");

  [v4 setNeedsLayout];
}

- (void)interactionProgressDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIPreviewPresentationController *)self interactionProgressForCommit];

  if (v5 == v4)
  {
    if (![(_UIPreviewPresentationController *)self hasAskedForCommitInternally])
    {
      [v4 percentComplete];
      if (v7 >= 1.0)
      {
        if ([(_UIPreviewPresentationController *)self _canCommitPresentation]) {
          [(_UIPreviewPresentationController *)self _invokeCommitHandlerFromInteractionProgress];
        }
      }
    }
  }
  else
  {
    id v6 = [(_UIPreviewPresentationController *)self interactionProgressForBreathing];

    if (v6 == v4)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __65___UIPreviewPresentationController_interactionProgressDidUpdate___block_invoke;
      v8[3] = &unk_1E52D9F98;
      v8[4] = self;
      id v9 = v4;
      dispatch_async(MEMORY[0x1E4F14428], v8);
    }
    else
    {
      [v4 percentComplete];
      [(_UIPreviewPresentationController *)self _layoutForPreviewInteractionProgress:"_layoutForPreviewInteractionProgress:"];
    }
  }
}

- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(_UIPreviewPresentationController *)self interactionProgressForCommit];

  if (v7 == v6
    && ![(_UIPreviewPresentationController *)self hasAskedForCommitInternally]
    && v4
    && [(_UIPreviewPresentationController *)self _canCommitPresentation])
  {
    [(_UIPreviewPresentationController *)self _invokeCommitHandlerFromInteractionProgress];
  }
}

- (void)_beginBreathing
{
  self->_breathing = 1;
}

- (void)_endBreathing
{
  self->_breathing = 0;
  [(_UIPreviewPresentationController *)self _updateBreathingTransformWithProgress:0 animated:0.0];
}

- (void)_updateBreathingTransformWithProgress:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(_UIPreviewPresentationController *)self isBreathing])
  {
    id v7 = [(_UIPreviewPresentationController *)self presentationContainerView];
    double v8 = [v7 layer];

    if (v8) {
      [v8 sublayerTransform];
    }
    else {
      memset(&v46, 0, sizeof(v46));
    }
    CATransform3DGetAffineTransform(&v47, &v46);
    double v9 = v47.a + v47.c;
    double v10 = [(_UIPreviewPresentationController *)self platterMenuController];
    [v10 currentVelocity];
    double v12 = v11;

    double v13 = 1.0;
    double v14 = 0.0;
    if ([(_UIPreviewPresentationController *)self _canCommitPresentation])
    {
      double v15 = -v12;
      if (v12 >= 0.0) {
        double v15 = v12;
      }
      if (v15 < 50.0)
      {
        double v16 = fmin(fmax(a3, 0.0), 1.0);
        double v13 = 1.0 - v16 + v16 * 1.05;
        double v14 = v16 * 10.0 + (1.0 - v16) * 0.0;
      }
    }
    if (v13 != v9)
    {
      if (v4)
      {
        double v17 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
        double v18 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"sublayerTransform"];
        [v18 setDuration:0.1];
        [v18 setTimingFunction:v17];
        double v19 = (void *)MEMORY[0x1E4F29238];
        double v20 = [v8 presentationLayer];
        double v21 = v20;
        if (v20) {
          [v20 sublayerTransform];
        }
        else {
          memset(v45, 0, sizeof(v45));
        }
        double v22 = [v19 valueWithCATransform3D:v45];
        [v18 setFromValue:v22];

        double v23 = (void *)MEMORY[0x1E4F29238];
        CGAffineTransformMakeScale(&v43, v13, v13);
        CATransform3DMakeAffineTransform(&v44, &v43);
        v24 = [v23 valueWithCATransform3D:&v44];
        [v18 setToValue:v24];

        [v8 addAnimation:v18 forKey:@"com.apple.breathing"];
        objc_super v25 = (void *)MEMORY[0x1E4F29238];
        CGAffineTransformMakeScale(&v41, v13, v13);
        CATransform3DMakeAffineTransform(&v42, &v41);
        v26 = [v25 valueWithCATransform3D:&v42];
        [v8 setValue:v26 forKey:@"sublayerTransform"];

        v27 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];

        [v27 setDuration:0.1];
        [v27 setTimingFunction:v17];
        v28 = (void *)MEMORY[0x1E4F29238];
        CGAffineTransformMakeTranslation(&v40, 0.0, -v14);
        v29 = [v28 valueWithCGAffineTransform:&v40];
        [v27 setToValue:v29];

        v30 = [(_UIPreviewPresentationController *)self actionSheetAvailableImageView];
        v31 = [v30 layer];
        [v31 addAnimation:v27 forKey:@"com.apple.breathing.arrow"];

        CGAffineTransformMakeTranslation(&v39, 0.0, -v14);
        objc_super v32 = [(_UIPreviewPresentationController *)self actionSheetAvailableImageView];
        CGAffineTransform v38 = v39;
        [v32 setTransform:&v38];
      }
      else
      {
        CGAffineTransformMakeScale(&m, v13, v13);
        CATransform3DMakeAffineTransform(&v37, &m);
        CATransform3D v35 = v37;
        [v8 setSublayerTransform:&v35];
        CGAffineTransformMakeTranslation(&v34, 0.0, -v14);
        double v17 = [(_UIPreviewPresentationController *)self actionSheetAvailableImageView];
        CGAffineTransform v33 = v34;
        [v17 setTransform:&v33];
      }
    }
  }
}

- (NSArray)previewActionItems
{
  previewActionItems = self->_previewActionItems;
  if (!previewActionItems)
  {
    BOOL v4 = [(UIPresentationController *)self presentedViewController];
    id v5 = [v4 previewActionItems];
    id v6 = (NSArray *)[v5 copy];
    id v7 = self->_previewActionItems;
    self->_previewActionItems = v6;

    previewActionItems = self->_previewActionItems;
  }
  return previewActionItems;
}

- (UIPreviewAction)leadingPreviewAction
{
  leadingPreviewAction = self->_leadingPreviewAction;
  if (!leadingPreviewAction)
  {
    BOOL v4 = [(UIPresentationController *)self presentedViewController];
    id v5 = [v4 leadingPreviewAction];
    id v6 = (UIPreviewAction *)[v5 copy];
    id v7 = self->_leadingPreviewAction;
    self->_leadingPreviewAction = v6;

    leadingPreviewAction = self->_leadingPreviewAction;
  }
  return leadingPreviewAction;
}

- (UIPreviewAction)trailingPreviewAction
{
  trailingPreviewAction = self->_trailingPreviewAction;
  if (!trailingPreviewAction)
  {
    BOOL v4 = [(UIPresentationController *)self presentedViewController];
    id v5 = [v4 trailingPreviewAction];
    id v6 = (UIPreviewAction *)[v5 copy];
    id v7 = self->_trailingPreviewAction;
    self->_trailingPreviewAction = v6;

    trailingPreviewAction = self->_trailingPreviewAction;
  }
  return trailingPreviewAction;
}

+ (id)_backgroundEffectForTraitCollection:(id)a3 interactive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(id)objc_opt_class() _shouldApplyVisualEffectsToPresentingView])
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____UIPreviewPresentationController;
    id v7 = objc_msgSendSuper2(&v9, sel__backgroundEffectForTraitCollection_interactive_, v6, v4);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (BOOL)_shouldApplyVisualEffectsToPresentingView
{
  return 1;
}

- (void)_configureInitialActionSheetViewIfNeeded
{
  if ([(_UIPreviewPresentationController *)self _hasPreviewActions])
  {
    objc_super v3 = [(_UIPreviewPresentationController *)self previewActionSheet];

    if (!v3)
    {
      BOOL v4 = [(_UIPreviewPresentationController *)self previewActionItems];
      id v5 = [(_UIPreviewPresentationController *)self _makeAndAddToViewHierarchyPreviewActionSheetForMenuItems:v4];
      [(_UIPreviewPresentationController *)self setPreviewActionSheet:v5];

      id v11 = [(_UIPreviewPresentationController *)self previewActionSheet];
      [(_UIPreviewPresentationController *)self _dismissedActionSheetCenterForActionSheet:v11];
      double v7 = v6;
      double v9 = v8;
      double v10 = [(_UIPreviewPresentationController *)self previewActionSheet];
      objc_msgSend(v10, "setCenter:", v7, v9);
    }
  }
}

- (CGPoint)_applyLayoutAdjustmentsForManagedViewWithPosition:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  double v6 = [(_UIPreviewPresentationController *)self previewActionSheet];
  double v7 = [v6 _window];
  [v7 _managedSafeAreaInsets];
  double v9 = v8;

  if (fabs(v9) >= 2.22044605e-16)
  {
    double v10 = [(_UIPreviewPresentationController *)self previewActionSheet];
    [v10 contentInsets];
    double v12 = v11;

    double y = y - (v9 - v12);
  }
  double v13 = x;
  double v14 = y;
  result.double y = v14;
  result.CGFloat x = v13;
  return result;
}

- (void)_layoutForRevealTransition
{
  [(_UIPreviewPresentationController *)self setCurrentPresentationPhase:1];
  CGAffineTransformMakeScale(&v5, 1.0175, 1.0175);
  objc_super v3 = [(_UIPreviewPresentationController *)self revealContainerView];
  CGAffineTransform v4 = v5;
  [v3 setTransform:&v4];
}

- (void)_layoutForRevealUnhighlightTransition:(double)a3
{
  double v3 = 1.0 - a3;
  id v4 = [(_UIPreviewPresentationController *)self initialSourceViewSnapshot];
  [v4 setAlpha:v3];
}

- (void)_revealTransitionDidComplete:(BOOL)a3
{
  id v4 = [(_UIPreviewPresentationController *)self presentationPhaseCompletionBlock];

  if (v4)
  {
    CGAffineTransform v5 = [(_UIPreviewPresentationController *)self presentationPhaseCompletionBlock];
    v5[2](v5, 1);
  }
  [(_UIPreviewPresentationController *)self _stopUnhighlightPreviewCellSnapshotViewAnimationIfNeeded];
}

- (void)_preparePresentationContainerViewForPreviewTransition
{
  double v3 = [(_UIPreviewPresentationController *)self revealContainerView];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = [(_UIPreviewPresentationController *)self presentationContainerView];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __89___UIPreviewPresentationController__preparePresentationContainerViewForPreviewTransition__block_invoke;
  v50[3] = &unk_1E52D9F70;
  v50[4] = self;
  +[UIView performWithoutAnimation:v50];
  double v13 = [v12 platterView];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = [v12 platterView];
  double v23 = [v12 superview];
  objc_msgSend(v22, "convertRect:toView:", v23, v15, v17, v19, v21);
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;

  [v12 setAlpha:0.0];
  if (_AXSReduceMotionEnabled())
  {
    [v12 setBlurRadius:0.0];
    long long v32 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v45[0] = *MEMORY[0x1E4F1DAB8];
    v45[1] = v32;
    v45[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGAffineTransform v33 = (CGAffineTransform *)v45;
  }
  else
  {
    [v12 setBlurRadius:60.0];
    long long v44 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v49.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v49.c = v44;
    *(_OWORD *)&v49.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v51.origin.CGFloat x = v5;
    v51.origin.double y = v7;
    v51.size.width = v9;
    v51.size.height = v11;
    CGFloat MidX = CGRectGetMidX(v51);
    v52.size.height = v31;
    CGFloat v42 = v31;
    double v35 = MidX;
    v52.origin.CGFloat x = v25;
    v52.origin.double y = v27;
    v52.size.width = v29;
    tCGFloat x = v35 - CGRectGetMidX(v52);
    v53.origin.CGFloat x = v5;
    CGFloat v36 = v5;
    v53.origin.double y = v7;
    v53.size.width = v9;
    v53.size.height = v11;
    CGFloat v37 = v7;
    double MidY = CGRectGetMidY(v53);
    v54.origin.CGFloat x = v25;
    v54.origin.double y = v27;
    v54.size.width = v29;
    v54.size.height = v42;
    CGFloat v39 = CGRectGetMidY(v54);
    *(_OWORD *)&v48.a = *(_OWORD *)&v49.a;
    *(_OWORD *)&v48.c = v44;
    *(_OWORD *)&v48.tCGFloat x = *(_OWORD *)&v49.tx;
    CGAffineTransformTranslate(&v49, &v48, tx, MidY - v39);
    v55.origin.CGFloat x = v36;
    v55.origin.double y = v37;
    v55.size.width = v9;
    v55.size.height = v11;
    double Height = CGRectGetHeight(v55);
    v56.origin.CGFloat x = v25;
    v56.origin.double y = v27;
    v56.size.width = v29;
    v56.size.height = v42;
    CGFloat v41 = CGRectGetHeight(v56);
    CGAffineTransform v47 = v49;
    CGAffineTransformScale(&v48, &v47, Height / v41, Height / v41);
    *(_OWORD *)&v49.tCGFloat x = *(_OWORD *)&v48.tx;
    CGAffineTransform v46 = v48;
    CGAffineTransform v33 = &v46;
  }
  [v12 setTransform:v33];
  [v12 setHidden:0];
  [v12 setShouldRasterizeForTransition:1];
}

- (void)_layoutForPreviewTransition
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63___UIPreviewPresentationController__layoutForPreviewTransition__block_invoke;
  v10[3] = &unk_1E52D9F70;
  v10[4] = self;
  +[UIView performWithoutAnimation:v10];
  [(_UIPreviewPresentationController *)self setCurrentPresentationPhase:2];
  double v3 = [(_UIPreviewPresentationController *)self revealContainerView];
  [v3 setBlurRadius:60.0];

  double v4 = [(_UIPreviewPresentationController *)self revealContainerView];
  [v4 setAlpha:0.0];

  CGFloat v5 = [(_UIPreviewPresentationController *)self presentationContainerView];
  [v5 setBlurRadius:0.0];

  double v6 = [(_UIPreviewPresentationController *)self presentationContainerView];
  [v6 setAlpha:1.0];

  CGFloat v7 = [(_UIPreviewPresentationController *)self presentationContainerView];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v9[0] = *MEMORY[0x1E4F1DAB8];
  v9[1] = v8;
  v9[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v7 setTransform:v9];
}

- (void)_previewTransitionDidComplete:(BOOL)a3
{
  BOOL v3 = a3;
  CGFloat v5 = [(_UIPreviewPresentationController *)self revealContainerView];
  [v5 setAlpha:1.0];

  double v6 = [(_UIPreviewPresentationController *)self revealContainerView];
  [v6 setHidden:1];

  CGFloat v7 = [(_UIPreviewPresentationController *)self presentationContainerView];
  [v7 setShouldRasterizeForTransition:0];

  if (v3)
  {
    [(_UIPreviewPresentationController *)self _preparePresentationContainerViewForPreviewInteraction];
    long long v8 = [(_UIPreviewPresentationController *)self presentationPhaseCompletionBlock];

    if (v8)
    {
      CGFloat v9 = [(_UIPreviewPresentationController *)self presentationPhaseCompletionBlock];
      v9[2](v9, 2);
    }
    [(_UIPreviewPresentationController *)self _configureActionSheetChromeViews];
    [(_UIPreviewPresentationController *)self _updateVisibiltyOfPreviewActionChromeForCurrentState];
  }
  [(_UIPreviewPresentationController *)self _setupInteractionProgressForBreathing];
  if ([(_UIPreviewPresentationController *)self _hasPreviewActions])
  {
    [(_UIPreviewPresentationController *)self _configureDynamicsController];
  }
}

- (void)_layoutForDismissTransition
{
  BOOL v3 = [(_UIPreviewPresentationController *)self presentationContainerView];
  double v4 = [(_UIPreviewPresentationController *)self revealContainerView];
  CGFloat v5 = [v3 platterView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = [v3 platterView];
  double v15 = [v3 superview];
  objc_msgSend(v14, "convertRect:toView:", v15, v7, v9, v11, v13);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  [v4 frame];
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  int v32 = _AXSReduceMotionEnabled();
  CGAffineTransform v33 = (_OWORD *)MEMORY[0x1E4F1DAB8];
  if (v32)
  {
    long long v34 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v49[0] = *MEMORY[0x1E4F1DAB8];
    v49[1] = v34;
    v49[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v35 = 0.0;
    CGFloat v36 = (CGAffineTransform *)v49;
  }
  else
  {
    long long v47 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v53.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v53.c = v47;
    *(_OWORD *)&v53.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v54.origin.CGFloat x = v25;
    v54.origin.double y = v27;
    v54.size.width = v29;
    v54.size.height = v31;
    tCGFloat x = CGRectGetMidX(v54);
    CGFloat rect = v25;
    v55.origin.CGFloat x = v17;
    CGFloat rect_8 = v17;
    v55.origin.double y = v19;
    v55.size.width = v21;
    v55.size.height = v23;
    double txa = tx - CGRectGetMidX(v55);
    v56.origin.CGFloat x = v25;
    v56.origin.double y = v27;
    v56.size.width = v29;
    v56.size.height = v31;
    double MidY = CGRectGetMidY(v56);
    v57.origin.CGFloat x = v17;
    v57.origin.double y = v19;
    v57.size.width = v21;
    v57.size.height = v23;
    CGFloat v38 = CGRectGetMidY(v57);
    *(_OWORD *)&v52.a = *(_OWORD *)&v53.a;
    *(_OWORD *)&v52.c = v47;
    *(_OWORD *)&v52.tCGFloat x = *(_OWORD *)&v53.tx;
    CGAffineTransformTranslate(&v53, &v52, txa, MidY - v38);
    v58.origin.CGFloat x = rect;
    v58.origin.double y = v27;
    v58.size.width = v29;
    v58.size.height = v31;
    double Height = CGRectGetHeight(v58);
    v59.origin.CGFloat x = rect_8;
    v59.origin.double y = v19;
    v59.size.width = v21;
    v59.size.height = v23;
    CGFloat v40 = CGRectGetHeight(v59);
    CGAffineTransform v51 = v53;
    CGAffineTransformScale(&v52, &v51, Height / v40, Height / v40);
    *(_OWORD *)&v53.tCGFloat x = *(_OWORD *)&v52.tx;
    CGAffineTransform v50 = v52;
    CGFloat v36 = &v50;
    double v35 = 60.0;
  }
  [v3 setTransform:v36];
  [v3 setBlurRadius:v35];
  [v3 setAlpha:0.0];
  long long v41 = v33[1];
  v48[0] = *v33;
  v48[1] = v41;
  v48[2] = v33[2];
  [v4 setTransform:v48];
  [v4 setAlpha:1.0];
  [v4 setBlurRadius:0.0];
  CGFloat v42 = [(UIPresentationController *)self containerView];
  [v42 setUserInteractionEnabled:0];

  [(_UIPreviewPresentationController *)self setCurrentPresentationPhase:0];
}

- (void)_preparePresentationContainerViewForPreviewInteraction
{
  BOOL v3 = +[_UIStatistics previewInteractionTapCount];
  [v3 setSampleRate:0.0];

  double v4 = +[_UIStatistics previewInteractionPeekCount];
  [v4 incrementValueBy:1];

  CGFloat v5 = +[_UIStatistics previewInteractionPeekDuration];
  [v5 startTimingForObject:self];

  _UIPowerLogPeekBegan();
  double v6 = [(_UIPreviewPresentationController *)self interactionProgressForPresentation];
  [v6 addProgressObserver:self];

  [(_UIPreviewPresentationController *)self _configureInitialActionSheetViewIfNeeded];
}

- (void)_layoutForPreviewInteractionProgress:(double)a3
{
  CGAffineTransformMakeScale(&v6, a3, a3);
  double v4 = [(_UIPreviewPresentationController *)self presentationContainerView];
  CGAffineTransform v5 = v6;
  [v4 setTransform:&v5];
}

- (void)_willCommitPresentation
{
  [(_UIPreviewPresentationController *)self _endBreathing];
  BOOL v3 = [(_UIPreviewPresentationController *)self platterMenuController];
  [v3 resetAnimator];

  double v4 = [(_UIPreviewPresentationController *)self previewActionSheet];
  [v4 setHidden:1];

  CGAffineTransform v5 = [(_UIPreviewPresentationController *)self leadingQuickActionView];
  [v5 setHidden:1];

  CGAffineTransform v6 = [(_UIPreviewPresentationController *)self trailingQuickActionView];
  [v6 setHidden:1];

  id v7 = [(_UIPreviewPresentationController *)self actionSheetAvailableImageView];
  [v7 setHidden:1];
}

- (BOOL)_canDismissPresentation
{
  if ([(_UIPreviewPresentationController *)self currentPresentationPhase] - 4 < 0xFFFFFFFFFFFFFFFELL) {
    goto LABEL_9;
  }
  if ([(_UIPreviewPresentationController *)self _hasPreviewActions])
  {
    BOOL v3 = [(_UIPreviewPresentationController *)self revealPanningVelocityIntegrator];

    if (v3)
    {
      double v4 = [(_UIPreviewPresentationController *)self revealPanningVelocityIntegrator];
      [v4 velocity];
      double v6 = v5;

      if (v6 < 0.0 && fabs(v6) > -300.0)
      {
        id v7 = [(_UIPreviewPresentationController *)self revealPanningVelocityIntegrator];
        [v7 offset];
        double v9 = fabs(v8);

        if (v9 >= 44.0)
        {
LABEL_13:
          LOBYTE(v10) = 0;
          return v10;
        }
      }
    }
  }
  if (![(_UIPreviewPresentationController *)self hasAskedForDismissalInternally]
    && ![(_UIPreviewPresentationController *)self hasAskedForCommitInternally])
  {
    if ([(_UIPreviewPresentationController *)self _platterIsInInitialPositionMostly]&& ![(_UIPreviewPresentationController *)self preDismissAnimationsInflight])
    {
      double v12 = [(_UIPreviewPresentationController *)self platterMenuController];
      int v10 = [v12 isMenuPresenting] ^ 1;

      return v10;
    }
    goto LABEL_13;
  }
LABEL_9:
  LOBYTE(v10) = 1;
  return v10;
}

- (BOOL)_canCommitPresentation
{
  if ([(_UIPreviewPresentationController *)self _platterIsInInitialPositionMostly]) {
    return 1;
  }
  return [(_UIPreviewPresentationController *)self hasAskedForCommitInternally];
}

- (void)_triggerQuickActionHandlerIfNeeded
{
  id v15 = [(UIPresentationController *)self presentedViewController];
  if ([(_UIPreviewPresentationController *)self leadingQuickActionViewSelected])
  {
    BOOL v3 = [(_UIPreviewPresentationController *)self leadingQuickActionView];
    double v4 = [v3 quickAction];
    double v5 = [v4 handler];

    if (!v5) {
      goto LABEL_8;
    }
    double v6 = [(_UIPreviewPresentationController *)self leadingQuickActionView];
    id v7 = [v6 quickAction];
    double v8 = [v7 handler];
    double v9 = [(_UIPreviewPresentationController *)self leadingQuickActionView];
    goto LABEL_7;
  }
  if ([(_UIPreviewPresentationController *)self trailingQuickActionViewSelected])
  {
    int v10 = [(_UIPreviewPresentationController *)self trailingQuickActionView];
    double v11 = [v10 quickAction];
    double v12 = [v11 handler];

    if (v12)
    {
      double v6 = [(_UIPreviewPresentationController *)self trailingQuickActionView];
      id v7 = [v6 quickAction];
      double v8 = [v7 handler];
      double v9 = [(_UIPreviewPresentationController *)self trailingQuickActionView];
LABEL_7:
      double v13 = v9;
      double v14 = [v9 quickAction];
      ((void (**)(void, void *, id))v8)[2](v8, v14, v15);
    }
  }
LABEL_8:
}

- (void)_prepareInitialSourceViewSnapshot
{
  id v14 = [(UIPresentationController *)self sourceView];
  [(UIPresentationController *)self sourceRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(_UIPreviewPresentationController *)self previewingContext];
  double v12 = [v11 customViewForInteractiveHighlight];

  if (!v12)
  {
    double v12 = objc_msgSend(v14, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, v4, v6, v8, v10, 0.0, 0.0, 0.0, 0.0);
    [(_UIPreviewPresentationController *)self setInitialSourceViewSnapshot:v12];
  }
  double v13 = objc_alloc_init(_UIPreviewInteractionTransitionWindow);
  objc_msgSend(v14, "convertRect:toView:", 0, v4, v6, v8, v10);
  -[UIWindow setFrame:](v13, "setFrame:");
  [(UIWindow *)v13 setHidden:0];
  [(UIView *)v13 addSubview:v12];
  [(UIView *)v13 bounds];
  objc_msgSend(v12, "setFrame:");
  [(_UIPreviewPresentationController *)self setInitialSourceViewSnapshotWindow:v13];
}

- (void)_updateRevealContainerViewForSourceRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v13 = -[_UIPreviewPresentationEffectView initWithFrame:]([_UIPreviewPresentationEffectView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UIView *)v13 setUserInteractionEnabled:0];
  double v8 = [(UIPresentationController *)self sourceView];
  if (v8)
  {
    double v9 = [(_UIPreviewPresentationController *)self previewingContext];
    double v10 = [v9 customViewForInteractiveHighlight];

    if (v10)
    {
      [(UIView *)v13 addSubview:v10];
    }
    else if (![(_UIPreviewPresentationController *)self _sourceViewSnapshotAndScaleTransformSuppressed])
    {
      double v11 = objc_msgSend(v8, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, x, y, width, height, 0.0, 0.0, 0.0, 0.0);
      [v11 setAutoresizingMask:18];
      [(UIView *)v13 addSubview:v11];
      double v12 = [(_UIPreviewPresentationController *)self initialSourceViewSnapshot];
      [(UIView *)v13 insertSubview:v12 aboveSubview:v11];
    }
  }
  [(_UIPreviewPresentationController *)self setRevealContainerView:v13];
}

- (void)_unhighlightPreviewCellSnapshotViewsIfNeeded
{
  if (![(_UIPreviewPresentationController *)self _sourceViewSnapshotAndScaleTransformSuppressed])
  {
    objc_initWeak(&location, self);
    double v3 = [_UIPreviewPresentationAnimator alloc];
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    double v7 = __80___UIPreviewPresentationController__unhighlightPreviewCellSnapshotViewsIfNeeded__block_invoke;
    double v8 = &unk_1E52F21D8;
    objc_copyWeak(&v9, &location);
    double v4 = [(_UIPreviewPresentationAnimator *)v3 initWithDuration:&v5 advanceBlock:0.4];
    -[_UIPreviewPresentationController setUnhighlightPreviewCellSnapshotViewAnimator:](self, "setUnhighlightPreviewCellSnapshotViewAnimator:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_stopUnhighlightPreviewCellSnapshotViewAnimationIfNeeded
{
  double v3 = [(_UIPreviewPresentationController *)self unhighlightPreviewCellSnapshotViewAnimator];
  [v3 stopAnimation];

  [(_UIPreviewPresentationController *)self setUnhighlightPreviewCellSnapshotViewAnimator:0];
  [(_UIPreviewPresentationController *)self setInitialSourceViewSnapshotWindow:0];
}

- (CGRect)_preferredSourceViewRect
{
  double v3 = [(UIPresentationController *)self sourceView];
  [(UIPresentationController *)self sourceRect];
  +[UIForcePresentationHelper sourceRectForView:proposedSourceRect:](UIForcePresentationHelper, "sourceRectForView:proposedSourceRect:", v3);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (double)platterContainerCenterX
{
  v2 = [(_UIPreviewPresentationController *)self presentationContainerView];
  [v2 bounds];
  double MidX = CGRectGetMidX(v5);

  return MidX;
}

- (double)platterContainerCenterY
{
  v2 = [(_UIPreviewPresentationController *)self presentationContainerView];
  [v2 bounds];
  double MidY = CGRectGetMidY(v5);

  return MidY;
}

- (CGRect)platterBounds
{
  v2 = [(_UIPreviewPresentationController *)self presentationContainerView];
  double v3 = [v2 platterView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (id)platterView
{
  v2 = [(_UIPreviewPresentationController *)self presentationContainerView];
  double v3 = [v2 platterView];

  return v3;
}

- (CGRect)platterContainerBounds
{
  v2 = [(_UIPreviewPresentationController *)self presentationContainerView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGPoint)centerForPlatterWithMenuViewPresented
{
  double v3 = [(_UIPreviewPresentationController *)self previewActionSheet];
  [(_UIPreviewPresentationController *)self centerForPlatterWithMenuViewPresentedForActionSheet:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGPoint)centerForPlatterWithMenuViewDismissed
{
  [(_UIPreviewPresentationController *)self platterContainerCenterX];
  double v4 = v3;
  [(_UIPreviewPresentationController *)self platterContainerCenterY];
  double v6 = v5;
  double v7 = v4;
  result.double y = v6;
  result.double x = v7;
  return result;
}

- (CGPoint)centerForMenuPresented
{
  double v3 = [(_UIPreviewPresentationController *)self previewActionSheet];
  [(_UIPreviewPresentationController *)self centerForMenuPresentedForActionSheet:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGPoint)centerForMenuDismissed
{
  double v3 = [(_UIPreviewPresentationController *)self previewActionSheet];
  [(_UIPreviewPresentationController *)self centerForMenuDismissedForActionSheet:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (double)minimumSpacingBetweenPlatterAndMenu
{
  return 0.0;
}

- (void)platterMenuDynamicsController:(id)a3 didMoveSwipeView:(id)a4 toPosition:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v16 = a4;
  id v8 = [(_UIPreviewPresentationController *)self leadingQuickActionView];

  if (v8 == v16)
  {
    [(_UIPreviewPresentationController *)self _leadingQuickActionOffsetForCenterPosition:x swipeView:y];
    double v12 = v14;
    double v13 = [(_UIPreviewPresentationController *)self leadingQuickActionViewEdgeConstraint];
  }
  else
  {
    id v9 = [(_UIPreviewPresentationController *)self trailingQuickActionView];

    double v10 = v16;
    if (v9 != v16) {
      goto LABEL_6;
    }
    [(_UIPreviewPresentationController *)self _trailingQuickActionOffsetForCenterPosition:x swipeView:y];
    double v12 = v11;
    double v13 = [(_UIPreviewPresentationController *)self trailingQuickActionViewEdgeConstraint];
  }
  double v15 = v13;
  [v13 setConstant:v12];

  double v10 = v16;
LABEL_6:
}

- (double)_trailingQuickActionOffsetForCenterPosition:(CGPoint)a3 swipeView:(id)a4
{
  double x = a3.x;
  objc_msgSend(a4, "bounds", a3.x, a3.y);
  double v6 = x + CGRectGetWidth(v11) * 0.5;
  double v7 = [(UIPresentationController *)self containerView];
  [v7 bounds];
  double v9 = v8;

  return v6 - v9;
}

- (double)_leadingQuickActionOffsetForCenterPosition:(CGPoint)a3 swipeView:(id)a4
{
  double x = a3.x;
  objc_msgSend(a4, "bounds", a3.x, a3.y);
  return -(x + v5 * -0.5);
}

- (CGPoint)initialCenterForLeadingSwipeActionView
{
  double v3 = [(_UIPreviewPresentationController *)self leadingSwipeActionView];
  if (v3)
  {
    [(_UIPreviewPresentationController *)self centerForPlatterWithMenuViewDismissed];
    double v5 = v4;
    double v7 = v6;
    double v8 = [(_UIPreviewPresentationController *)self platterView];
    [v8 frame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v13 = round(v7 - v11 * 0.5);
    CGFloat v14 = round(v5 - v9 * 0.5);

    [v3 bounds];
    double v16 = v15;
    v23.origin.double x = v14;
    v23.origin.double y = v13;
    v23.size.double width = v10;
    v23.size.double height = v12;
    double v17 = CGRectGetMinX(v23) + v16 * 0.5 + 2.0;
    double v18 = [(UIPresentationController *)self containerView];
    [v18 bounds];
    double v19 = CGRectGetHeight(v24) * 0.5;
  }
  else
  {
    double v17 = *MEMORY[0x1E4F1DAD8];
    double v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v20 = v17;
  double v21 = v19;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (CGPoint)initialCenterForTrailingSwipeActionView
{
  double v3 = [(_UIPreviewPresentationController *)self trailingSwipeActionView];
  if (v3)
  {
    [(_UIPreviewPresentationController *)self centerForPlatterWithMenuViewDismissed];
    double v5 = v4;
    double v7 = v6;
    double v8 = [(_UIPreviewPresentationController *)self platterView];
    [v8 frame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v13 = round(v7 - v11 * 0.5);
    CGFloat v14 = round(v5 - v9 * 0.5);

    [v3 bounds];
    double v16 = v15;
    v23.origin.double x = v14;
    v23.origin.double y = v13;
    v23.size.double width = v10;
    v23.size.double height = v12;
    double v17 = CGRectGetMaxX(v23) - (v16 * 0.5 + 2.0);
    double v18 = [(UIPresentationController *)self containerView];
    [v18 bounds];
    double v19 = CGRectGetHeight(v24) * 0.5;
  }
  else
  {
    double v17 = *MEMORY[0x1E4F1DAD8];
    double v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v20 = v17;
  double v21 = v19;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (CGPoint)centerForPlatterWithMenuViewPresentedForActionSheet:(id)a3
{
  id v4 = a3;
  [(_UIPreviewPresentationController *)self platterContainerBounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(_UIPreviewPresentationController *)self platterContainerCenterY];
  double v14 = v13;
  [v4 bounds];
  double v16 = v15;

  v26.origin.double x = v6;
  v26.origin.double y = v8;
  v26.size.double width = v10;
  v26.size.double height = v12;
  double Height = CGRectGetHeight(v26);
  [(_UIPreviewPresentationController *)self minimumSpacingBetweenPlatterAndMenu];
  double v19 = Height - (v16 + v18 + v18);
  [(_UIPreviewPresentationController *)self platterBounds];
  double v20 = v19 + CGRectGetHeight(v27) * -0.5;
  [(_UIPreviewPresentationController *)self platterContainerCenterY];
  if (v14 + -40.0 < v20 && v20 > v21) {
    double v20 = v14 + -40.0;
  }
  [(_UIPreviewPresentationController *)self platterContainerCenterX];
  double v24 = v20;
  result.double y = v24;
  result.double x = v23;
  return result;
}

- (CGPoint)centerForMenuPresentedForActionSheet:(id)a3
{
  id v4 = a3;
  [(_UIPreviewPresentationController *)self platterContainerBounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 bounds];
  double v14 = v13;

  [(_UIPreviewPresentationController *)self platterContainerCenterX];
  double v16 = v15;
  v23.origin.double x = v6;
  v23.origin.double y = v8;
  v23.size.double width = v10;
  v23.size.double height = v12;
  double Height = CGRectGetHeight(v23);
  [(_UIPreviewPresentationController *)self minimumSpacingBetweenPlatterAndMenu];
  -[_UIPreviewPresentationController _applyLayoutAdjustmentsForManagedViewWithPosition:](self, "_applyLayoutAdjustmentsForManagedViewWithPosition:", v16, Height - (v14 * 0.5 + v18));
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (CGPoint)centerForMenuDismissedForActionSheet:(id)a3
{
  id v4 = a3;
  [(_UIPreviewPresentationController *)self platterContainerBounds];
  double v6 = v5;
  [v4 bounds];
  double v8 = v7;

  [(_UIPreviewPresentationController *)self platterContainerCenterX];
  double v10 = v6 + v8 * 0.5;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (void)_configureDynamicsController
{
  double v3 = [(_UIPreviewPresentationController *)self previewActionSheet];

  if (!v3) {
    return;
  }
  id v4 = [_UIPlatterMenuDynamicsController alloc];
  double v5 = [(UIPresentationController *)self containerView];
  double v6 = [(_UIPreviewPresentationController *)self presentationContainerView];
  double v7 = [v6 platterView];
  double v8 = [(_UIPreviewPresentationController *)self previewActionSheet];
  double v21 = [(_UIPlatterMenuDynamicsController *)v4 initWithContainerView:v5 platterView:v7 menuView:v8 delegate:self];

  if (![(_UIPreviewPresentationController *)self _hasPreviewQuickActions]) {
    [(_UIPlatterMenuDynamicsController *)v21 lockIntoYAxis];
  }
  double v9 = [(_UIPreviewPresentationController *)self revealPanningVelocityIntegrator];

  if (!v9)
  {
    double v14 = 0.0;
    double v12 = 0.0;
    goto LABEL_15;
  }
  double v10 = [(_UIPreviewPresentationController *)self revealPanningVelocityIntegrator];
  [v10 velocity];
  double v12 = v11;
  double v14 = v13;

  if (v14 < 0.0)
  {
    double v9 = [(_UIPreviewPresentationController *)self revealPanningVelocityIntegrator];
    [v9 velocity];
    if (fabs(v15) > -300.0)
    {
      double v16 = [(_UIPreviewPresentationController *)self revealPanningVelocityIntegrator];
      [v16 offset];
      double v18 = fabs(v17);

      LODWORD(v9) = v18 > 44.0;
      if (v18 > 44.0) {
        double v12 = 0.0;
      }
      goto LABEL_14;
    }
  }
  LODWORD(v9) = 0;
LABEL_14:
  [(_UIPreviewPresentationController *)self setRevealPanningVelocityIntegrator:0];
LABEL_15:
  [(_UIPreviewPresentationController *)self setPlatterMenuController:v21];
  BOOL v19 = [(_UIPreviewPresentationController *)self panningGestureRecognizerInProgress];
  if (v9
    && !v19
    && ([(_UIPreviewPresentationController *)self currentPresentationPhase] == 2
     || [(_UIPreviewPresentationController *)self currentPresentationPhase] == 3))
  {
    double v20 = [(_UIPreviewPresentationController *)self platterMenuController];
    objc_msgSend(v20, "_animateToPlatterPresentedWithVelocity:", v12, v14);
  }
}

- (void)_invokeCommitHandlerFromInteractionProgress
{
  [(_UIPreviewPresentationController *)self setInteractionProgressForCommit:0];
  [(_UIPreviewPresentationController *)self setHasAskedForCommitInternally:1];
  id v3 = [(_UIPreviewPresentationController *)self forcePresentationControllerDelegate];
  if (objc_opt_respondsToSelector()) {
    [v3 forcePresentationControllerWantsToCommit:self];
  }
}

- (void)_dismissPresentation
{
  id v3 = [(_UIPreviewPresentationController *)self platterMenuController];
  [v3 resetAnimator];

  [(_UIPreviewPresentationController *)self _dismissPresentationWithCompletion:0];
}

- (void)_hideQuickActions
{
  id v3 = [(_UIPreviewPresentationController *)self leadingQuickActionView];
  [v3 setHidden:1];

  id v4 = [(_UIPreviewPresentationController *)self trailingQuickActionView];
  [v4 setHidden:1];
}

- (double)_quickActionSelectionOffset
{
  id v3 = [(_UIPreviewPresentationController *)self leadingQuickActionView];
  [v3 bounds];
  double Width = CGRectGetWidth(v7);

  if (Width <= 2.22044605e-16)
  {
    double v5 = [(_UIPreviewPresentationController *)self trailingQuickActionView];
    [v5 bounds];
    double Width = CGRectGetWidth(v8);
  }
  double result = 44.0;
  if (Width <= 44.0) {
    return Width;
  }
  return result;
}

- (double)_quickActionsSelectionThresholdForPreviewMenuItemStyle:(int64_t)a3
{
  [(_UIPreviewPresentationController *)self _quickActionSelectionOffset];
  double v5 = 2.0;
  if (a3 == 2) {
    double v5 = 3.5;
  }
  return v5 * v4;
}

- (void)_updateVisibiltyOfPreviewActionChromeForCurrentState
{
  if ([(_UIPreviewPresentationController *)self currentPresentationPhase] == 2
    || [(_UIPreviewPresentationController *)self currentPresentationPhase] == 3)
  {
    if ([(_UIPreviewPresentationController *)self _hasPreviewQuickActions])
    {
      id v3 = [(_UIPreviewPresentationController *)self platterMenuController];
      [v3 currentTranslation];
      double v5 = fabs(v4);

      double v6 = [(_UIPreviewPresentationController *)self trailingQuickActionView];
      int v7 = [v6 isHidden];

      if (v5 < 2.22044605e-16 != v7)
      {
        CGRect v8 = [(_UIPreviewPresentationController *)self trailingQuickActionView];
        [v8 setHidden:v5 < 2.22044605e-16];
      }
      double v9 = [(_UIPreviewPresentationController *)self leadingQuickActionView];
      int v10 = [v9 isHidden];

      if (v5 < 2.22044605e-16 != v10)
      {
        double v11 = [(_UIPreviewPresentationController *)self leadingQuickActionView];
        [v11 setHidden:v5 < 2.22044605e-16];
      }
    }
    if ([(_UIPreviewPresentationController *)self _hasPreviewActions])
    {
      if ([(_UIPreviewPresentationController *)self _platterIsInInitialPositionMostly])
      {
        double v12 = 1.0;
      }
      else
      {
        double v12 = 0.0;
      }
      double v13 = [(_UIPreviewPresentationController *)self actionSheetAvailableImageView];
      [v13 alpha];
      double v15 = v14;

      if (v12 != v15)
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __88___UIPreviewPresentationController__updateVisibiltyOfPreviewActionChromeForCurrentState__block_invoke;
        v16[3] = &unk_1E52D9CD0;
        v16[4] = self;
        *(double *)&v16[5] = v12;
        +[UIView animateWithDuration:v16 animations:0.2];
      }
    }
  }
}

- (BOOL)_hasPreviewQuickActions
{
  id v3 = [(_UIPreviewPresentationController *)self leadingPreviewAction];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    double v5 = [(_UIPreviewPresentationController *)self trailingPreviewAction];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (BOOL)_hasSelectedQuickAction
{
  if ([(_UIPreviewPresentationController *)self leadingQuickActionViewSelected]) {
    return 1;
  }
  return [(_UIPreviewPresentationController *)self trailingQuickActionViewSelected];
}

- (BOOL)_hasPreviewActions
{
  v2 = [(_UIPreviewPresentationController *)self previewActionItems];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_presentSubActionSheetForPreviewActionGroup:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    double v6 = [v4 _actions];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      CGRect v8 = [v5 _actions];
      double v9 = [(_UIPreviewPresentationController *)self _makeAndAddToViewHierarchyPreviewActionSheetForMenuItems:v8];

      int v10 = [(_UIPreviewPresentationController *)self previewActionSheet];
      objc_initWeak(location, self);
      double v11 = [(UIPresentationController *)self containerView];
      double v12 = [v11 window];
      [v12 setUserInteractionEnabled:0];

      double v13 = [(_UIPreviewPresentationController *)self platterMenuController];
      [v13 resetAnimator];

      [(_UIPreviewPresentationController *)self centerForPlatterWithMenuViewPresentedForActionSheet:v9];
      uint64_t v15 = v14;
      uint64_t v17 = v16;
      [(_UIPreviewPresentationController *)self centerForMenuPresentedForActionSheet:v10];
      double v19 = v18;
      double v21 = v20;
      [(_UIPreviewPresentationController *)self centerForMenuDismissedForActionSheet:v10];
      uint64_t v23 = v22;
      uint64_t v25 = v24;
      [(_UIPreviewPresentationController *)self centerForMenuDismissedForActionSheet:v9];
      double v27 = v26;
      double v29 = v28;
      [(_UIPreviewPresentationController *)self centerForMenuPresentedForActionSheet:v9];
      uint64_t v42 = v31;
      uint64_t v43 = v30;
      objc_msgSend(v9, "setCenter:", v27, v29);
      objc_msgSend(v10, "setCenter:", v19, v21);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke;
      aBlock[3] = &unk_1E52DD178;
      aBlock[4] = self;
      aBlock[5] = v15;
      aBlock[6] = v17;
      int v32 = _Block_copy(aBlock);
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_2;
      v58[3] = &unk_1E52DD178;
      id v33 = v10;
      id v59 = v33;
      uint64_t v60 = v23;
      uint64_t v61 = v25;
      long long v34 = _Block_copy(v58);
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_3;
      v54[3] = &unk_1E52DD178;
      id v35 = v9;
      id v55 = v35;
      uint64_t v56 = v43;
      uint64_t v57 = v42;
      CGFloat v36 = _Block_copy(v54);
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_4;
      v52[3] = &unk_1E52DA040;
      id v37 = v32;
      id v53 = v37;
      +[UIView animateWithDuration:v52 animations:&__block_literal_global_425 completion:0.4];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_6;
      v50[3] = &unk_1E52DA040;
      id v38 = v34;
      id v51 = v38;
      +[UIView animateWithDuration:0 delay:v50 options:&__block_literal_global_79 animations:0.2 completion:0.0];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_8;
      _OWORD v48[3] = &unk_1E52DA040;
      id v39 = v36;
      id v49 = v39;
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __80___UIPreviewPresentationController__presentSubActionSheetForPreviewActionGroup___block_invoke_9;
      v44[3] = &unk_1E52DF118;
      objc_copyWeak(&v47, location);
      id v40 = v35;
      id v45 = v40;
      id v41 = v33;
      id v46 = v41;
      +[UIView animateWithDuration:0 delay:v48 options:v44 animations:0.2 completion:0.2];

      objc_destroyWeak(&v47);
      objc_destroyWeak(location);
    }
  }
}

- (id)_makeAndAddToViewHierarchyPreviewActionSheetForMenuItems:(id)a3
{
  id v4 = a3;
  double v5 = [(_UIPreviewPresentationController *)self presentationContainerView];
  [v5 _standardPreferredContentSize];
  double v7 = v6;

  CGRect v8 = [(_UIPreviewPresentationController *)self presentationContainerView];
  [v8 bounds];
  CGFloat v9 = CGRectGetHeight(v23) * 0.7;

  int v10 = -[_UIPreviewActionSheetView initWithFrame:title:items:contentInsets:]([_UIPreviewActionSheetView alloc], "initWithFrame:title:items:contentInsets:", 0, v4, 0.0, 0.0, v7, v9, 20.0, 0.0, 20.0, 0.0);
  double v11 = [(UIPresentationController *)self presentedViewController];
  objc_initWeak(&location, v11);

  objc_initWeak(&from, self);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __93___UIPreviewPresentationController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke;
  uint64_t v17 = &unk_1E5300580;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  [(_UIPreviewActionSheetView *)v10 setCompletionHandler:&v14];
  double v12 = [(_UIPreviewPresentationController *)self actionSheetContainerView];
  [v12 addSubview:v10];

  [(UIView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v10 setNeedsLayout];
  [(UIView *)v10 layoutIfNeeded];
  [(UIView *)v10 setTranslatesAutoresizingMaskIntoConstraints:1];
  [(UIView *)v10 setAutoresizingMask:0];
  [(_UIPreviewPresentationController *)self _dismissedActionSheetCenterForActionSheet:v10];
  -[UIView setCenter:](v10, "setCenter:");
  [(_UIPreviewActionSheetView *)v10 setDelegate:self];
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v10;
}

- (CGPoint)_dismissedActionSheetCenterForActionSheet:(id)a3
{
  id v3 = a3;
  id v4 = [v3 superview];
  [v4 bounds];
  CGFloat MidX = CGRectGetMidX(v20);
  double v6 = [v3 superview];
  [v6 bounds];
  double Height = CGRectGetHeight(v21);
  [v3 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v22.origin.double x = v9;
  v22.origin.double y = v11;
  v22.size.double width = v13;
  v22.size.double height = v15;
  double v16 = Height + CGRectGetHeight(v22) * 0.5;

  double v17 = MidX;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (CGPoint)_presentedActionSheetCenterForActionSheet:(id)a3
{
  id v3 = a3;
  id v4 = [v3 superview];
  [v4 bounds];
  CGFloat MidX = CGRectGetMidX(v20);
  double v6 = [v3 superview];
  [v6 bounds];
  double Height = CGRectGetHeight(v21);
  [v3 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v22.origin.double x = v9;
  v22.origin.double y = v11;
  v22.size.double width = v13;
  v22.size.double height = v15;
  double v16 = Height + CGRectGetHeight(v22) * -0.5 + -20.0;

  double v17 = MidX;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (void)_dismissPresentationWithCompletion:(id)a3
{
  id v4 = a3;
  [(_UIPreviewPresentationController *)self setPreDismissAnimationsInflight:1];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71___UIPreviewPresentationController__dismissPresentationWithCompletion___block_invoke;
  aBlock[3] = &unk_1E52DA160;
  aBlock[4] = self;
  id v5 = v4;
  id v14 = v5;
  double v6 = (void (**)(void))_Block_copy(aBlock);
  double v7 = [(_UIPreviewPresentationController *)self actionSheetAvailableImageView];
  [v7 setHidden:1];

  if (![(_UIPreviewPresentationController *)self _platterIsSelectingPreviewActions])
  {
    [(_UIPreviewPresentationController *)self _hideQuickActions];
    if ([(_UIPreviewPresentationController *)self _platterIsInInitialPosition])
    {
      v6[2](v6);
      goto LABEL_9;
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71___UIPreviewPresentationController__dismissPresentationWithCompletion___block_invoke_3;
    _OWORD v9[3] = &unk_1E52DA040;
    double v10 = v6;
    [(_UIPreviewPresentationController *)self _restorePlatterToInitialStatePositionAnimatedWithCompletion:v9];
    double v8 = v10;
LABEL_8:

    goto LABEL_9;
  }
  if (![(_UIPreviewPresentationController *)self _hasSelectedQuickAction])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71___UIPreviewPresentationController__dismissPresentationWithCompletion___block_invoke_2;
    v11[3] = &unk_1E52DA040;
    double v12 = v6;
    [(_UIPreviewPresentationController *)self _restorePlatterToInitialStatePositionAnimatedWithCompletion:v11];
    double v8 = v12;
    goto LABEL_8;
  }
  [(_UIPreviewPresentationController *)self _dismissForSelectionQuickActionAnimated];
LABEL_9:
}

- (BOOL)_platterIsSelectingPreviewActions
{
  v2 = [(_UIPreviewPresentationController *)self platterMenuController];
  [v2 currentTranslation];
  BOOL v4 = fabs(v3) > 2.0;

  return v4;
}

- (void)_configureActionSheetChromeViews
{
  double v3 = [(_UIPreviewPresentationController *)self leadingPreviewAction];

  BOOL v4 = v3 != 0;
  id v5 = (double *)MEMORY[0x1E4F1DB28];
  if (v3)
  {
    double v6 = -[_UIPreviewQuickActionView initWithFrame:]([_UIPreviewQuickActionView alloc], "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v7 = [(_UIPreviewPresentationController *)self leadingPreviewAction];
    [(_UIPreviewQuickActionView *)v6 setQuickAction:v7];

    [(UIView *)v6 layoutIfNeeded];
    double v8 = [(_UIPreviewPresentationController *)self presentationContainerView];
    [v8 addSubview:v6];

    CGFloat v9 = [(_UIPreviewPresentationController *)self containerScrollView];
    double v10 = [v9 superview];

    CGFloat v11 = v6;
    double v12 = [(_UIPreviewPresentationController *)self containerScrollView];
    [v10 insertSubview:v11 below:v12];

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v14 = [v10 leadingAnchor];
    CGFloat v15 = [(UIView *)v11 leadingAnchor];
    double v16 = [v14 constraintEqualToAnchor:v15];
    [(_UIPreviewPresentationController *)self setLeadingQuickActionViewEdgeConstraint:v16];

    [(_UIPreviewPresentationController *)self initialCenterForLeadingSwipeActionView];
    -[_UIPreviewPresentationController _leadingQuickActionOffsetForCenterPosition:swipeView:](self, "_leadingQuickActionOffsetForCenterPosition:swipeView:", v11);
    double v18 = v17;
    id v19 = [(_UIPreviewPresentationController *)self leadingQuickActionViewEdgeConstraint];
    [v19 setConstant:v18];

    CGRect v20 = [(_UIPreviewPresentationController *)self leadingQuickActionViewEdgeConstraint];
    [v13 addObject:v20];

    CGRect v21 = [v10 centerYAnchor];
    CGRect v22 = [(_UIPreviewQuickActionView *)v11 centerYAnchor];
    CGRect v23 = [v21 constraintEqualToAnchor:v22];
    [v13 addObject:v23];

    [MEMORY[0x1E4F5B268] activateConstraints:v13];
    [(_UIPreviewPresentationController *)self setLeadingQuickActionView:v11];

    uint64_t v24 = [(_UIPreviewPresentationController *)self leadingQuickActionView];
    [v24 setHidden:1];
  }
  uint64_t v25 = [(_UIPreviewPresentationController *)self trailingPreviewAction];

  if (v25)
  {
    double v26 = -[_UIPreviewQuickActionView initWithFrame:]([_UIPreviewQuickActionView alloc], "initWithFrame:", *v5, v5[1], v5[2], v5[3]);
    [(UIView *)v26 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v27 = [(_UIPreviewPresentationController *)self trailingPreviewAction];
    [(_UIPreviewQuickActionView *)v26 setQuickAction:v27];

    [(UIView *)v26 layoutIfNeeded];
    double v28 = [(_UIPreviewPresentationController *)self presentationContainerView];
    [v28 addSubview:v26];

    double v29 = [(_UIPreviewPresentationController *)self containerScrollView];
    uint64_t v30 = [v29 superview];

    uint64_t v31 = v26;
    int v32 = [(_UIPreviewPresentationController *)self containerScrollView];
    [v30 insertSubview:v31 below:v32];

    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v34 = [(UIView *)v31 trailingAnchor];
    id v35 = [v30 trailingAnchor];
    CGFloat v36 = [v34 constraintEqualToAnchor:v35];
    [(_UIPreviewPresentationController *)self setTrailingQuickActionViewEdgeConstraint:v36];

    [(_UIPreviewPresentationController *)self initialCenterForTrailingSwipeActionView];
    -[_UIPreviewPresentationController _trailingQuickActionOffsetForCenterPosition:swipeView:](self, "_trailingQuickActionOffsetForCenterPosition:swipeView:", v31);
    double v38 = v37;
    id v39 = [(_UIPreviewPresentationController *)self trailingQuickActionViewEdgeConstraint];
    [v39 setConstant:v38];

    id v40 = [(_UIPreviewPresentationController *)self trailingQuickActionViewEdgeConstraint];
    [v33 addObject:v40];

    id v41 = [(_UIPreviewQuickActionView *)v31 centerYAnchor];
    uint64_t v42 = [v30 centerYAnchor];
    uint64_t v43 = [v41 constraintEqualToAnchor:v42];
    [v33 addObject:v43];

    [MEMORY[0x1E4F5B268] activateConstraints:v33];
    [(_UIPreviewPresentationController *)self setTrailingQuickActionView:v31];

    long long v44 = [(_UIPreviewPresentationController *)self trailingQuickActionView];
    BOOL v4 = 1;
    [v44 setHidden:1];
  }
  if ([(_UIPreviewPresentationController *)self _hasPreviewActions])
  {
    id v45 = [(_UIPreviewPresentationController *)self containerScrollView];
    id v46 = [v45 superview];

    id v47 = _UIImageWithName(@"uippc-arrow-up-gray.png");
    CGAffineTransform v48 = [v47 imageWithRenderingMode:2];

    id v49 = [[UIImageView alloc] initWithImage:v48];
    CGAffineTransform v50 = +[UIColor _controlForegroundColor];
    [(UIView *)v49 setTintColor:v50];

    [(UIImageView *)v49 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v46 addSubview:v49];
    id v51 = [(_UIPreviewPresentationController *)self platterView];
    CGAffineTransform v52 = [(UIView *)v49 centerXAnchor];
    id v53 = [v51 centerXAnchor];
    CGRect v54 = [v52 constraintEqualToAnchor:v53];
    [v54 setActive:1];

    id v55 = [(UIView *)v49 bottomAnchor];
    uint64_t v56 = [v51 topAnchor];
    uint64_t v57 = [v55 constraintEqualToAnchor:v56 constant:-12.0];
    [v57 setActive:1];

    [(UIView *)v49 setAlpha:0.0];
    [(_UIPreviewPresentationController *)self setActionSheetAvailableImageView:v49];
  }
  if (v4)
  {
    CGRect v58 = [(UIPresentationController *)self containerView];
    [v58 setNeedsLayout];

    id v59 = [(UIPresentationController *)self containerView];
    [v59 layoutIfNeeded];
  }
}

- (BOOL)_platterIsInInitialPositionMostly
{
  double v3 = [(_UIPreviewPresentationController *)self presentationContainerView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v21.origin.double x = v5;
  v21.origin.double y = v7;
  v21.size.double width = v9;
  v21.size.double height = v11;
  double MidX = CGRectGetMidX(v21);
  v22.origin.double x = v5;
  v22.origin.double y = v7;
  v22.size.double width = v9;
  v22.size.double height = v11;
  CGFloat v13 = round(CGRectGetMidY(v22) + -22.0);
  id v14 = [(_UIPreviewPresentationController *)self presentationContainerView];
  CGFloat v15 = [v14 platterView];
  [v15 center];
  v20.double x = v16;
  v20.double y = v17;
  v23.size.double width = 44.0;
  v23.origin.double x = round(MidX + -22.0);
  v23.origin.double y = v13;
  v23.size.double height = 44.0;
  BOOL v18 = CGRectContainsPoint(v23, v20);

  return v18;
}

- (BOOL)_platterIsInInitialPosition
{
  double v3 = [(_UIPreviewPresentationController *)self presentationContainerView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v21.origin.double x = v5;
  v21.origin.double y = v7;
  v21.size.double width = v9;
  v21.size.double height = v11;
  double MidX = CGRectGetMidX(v21);
  v22.origin.double x = v5;
  v22.origin.double y = v7;
  v22.size.double width = v9;
  v22.size.double height = v11;
  CGFloat v13 = round(CGRectGetMidY(v22) + -1.0);
  id v14 = [(_UIPreviewPresentationController *)self presentationContainerView];
  CGFloat v15 = [v14 platterView];
  [v15 center];
  v20.double x = v16;
  v20.double y = v17;
  v23.size.double width = 2.0;
  v23.size.double height = 2.0;
  v23.origin.double x = round(MidX + -1.0);
  v23.origin.double y = v13;
  BOOL v18 = CGRectContainsPoint(v23, v20);

  return v18;
}

- (void)_restorePlatterToInitialStatePositionAnimated
{
}

- (void)_restorePlatterToInitialStatePositionAnimatedWithCompletion:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(UIPresentationController *)self containerView];
  double v6 = [v5 window];
  [v6 setUserInteractionEnabled:0];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96___UIPreviewPresentationController__restorePlatterToInitialStatePositionAnimatedWithCompletion___block_invoke;
  v10[3] = &unk_1E52D9F70;
  v10[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __96___UIPreviewPresentationController__restorePlatterToInitialStatePositionAnimatedWithCompletion___block_invoke_2;
  v8[3] = &unk_1E52E45A0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  +[UIView animateWithDuration:v10 animations:v8 completion:0.175];
}

- (void)_dismissForSelectionQuickActionAnimated
{
  [(_UIPreviewPresentationController *)self setPreDismissAnimationsInflight:1];
  if ([(_UIPreviewPresentationController *)self leadingQuickActionViewSelected])
  {
    double v3 = [(_UIPreviewPresentationController *)self trailingQuickActionView];
LABEL_5:
    id v4 = v3;
    [v3 setHidden:1];

    goto LABEL_6;
  }
  if ([(_UIPreviewPresentationController *)self trailingQuickActionViewSelected])
  {
    double v3 = [(_UIPreviewPresentationController *)self leadingQuickActionView];
    goto LABEL_5;
  }
LABEL_6:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75___UIPreviewPresentationController__dismissForSelectionQuickActionAnimated__block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  CGFloat v5 = _Block_copy(aBlock);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75___UIPreviewPresentationController__dismissForSelectionQuickActionAnimated__block_invoke_2;
  v10[3] = &unk_1E52D9F70;
  v10[4] = self;
  double v6 = _Block_copy(v10);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75___UIPreviewPresentationController__dismissForSelectionQuickActionAnimated__block_invoke_3;
  v8[3] = &unk_1E52D9FE8;
  id v9 = v6;
  id v7 = v6;
  +[UIView animateWithDuration:v5 animations:v8 completion:0.2];
}

- (void)_dismissForHandledActionWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75___UIPreviewPresentationController__dismissForHandledActionWithCompletion___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  CGFloat v5 = _Block_copy(aBlock);
  double v6 = [(UIPresentationController *)self presentedViewController];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  CGFloat v13 = __75___UIPreviewPresentationController__dismissForHandledActionWithCompletion___block_invoke_2;
  id v14 = &unk_1E52F0BC0;
  CGFloat v15 = self;
  id v16 = v6;
  id v17 = v4;
  id v7 = v4;
  id v8 = v6;
  id v9 = _Block_copy(&v11);
  double v10 = [(_UIPreviewPresentationController *)self platterMenuController];
  [v10 resetAnimator];

  [(_UIPreviewPresentationController *)self setHasAskedForDismissalInternally:1];
  +[UIView animateWithDuration:v5 animations:v9 completion:0.225];
}

- (void)setPanningGestureRecognizer:(id)a3
{
  CGFloat v5 = (UIGestureRecognizer *)a3;
  p_panningGestureRecognizer = &self->_panningGestureRecognizer;
  panningGestureRecognizer = self->_panningGestureRecognizer;
  id v8 = v5;
  if (panningGestureRecognizer != v5)
  {
    if (panningGestureRecognizer) {
      [(UIGestureRecognizer *)panningGestureRecognizer removeTarget:self action:0];
    }
    objc_storeStrong((id *)&self->_panningGestureRecognizer, a3);
    if (*p_panningGestureRecognizer) {
      [(UIGestureRecognizer *)*p_panningGestureRecognizer addTarget:self action:sel__panningGestureRecognizerDidFire_];
    }
  }
}

- (void)_panningGestureRecognizerDidFire:(id)a3
{
  id v26 = a3;
  if ([v26 state] == 1 || objc_msgSend(v26, "state") == 2)
  {
    uint64_t v4 = 1;
  }
  else
  {
    if ([v26 state] != 3 && objc_msgSend(v26, "state") != 5 && objc_msgSend(v26, "state") != 4) {
      goto LABEL_9;
    }
    uint64_t v4 = 0;
  }
  [(_UIPreviewPresentationController *)self setPanningGestureRecognizerInProgress:v4];
LABEL_9:
  CGFloat v5 = [(_UIPreviewPresentationController *)self presentationContainerView];
  if ([(_UIPreviewPresentationController *)self currentPresentationPhase] == 1
    || [(_UIPreviewPresentationController *)self currentPresentationPhase] == 2)
  {
    double v6 = [(_UIPreviewPresentationController *)self platterMenuController];

    if (!v6)
    {
      id v7 = [(_UIPreviewPresentationController *)self revealPanningVelocityIntegrator];
      [v26 locationInView:v5];
      objc_msgSend(v7, "addSample:");
    }
  }
  if ([(_UIPreviewPresentationController *)self currentPresentationPhase] == 2
    || [(_UIPreviewPresentationController *)self currentPresentationPhase] == 3)
  {
    [v26 locationInView:v5];
    double v9 = v8;
    double v11 = v10;
    if ([v26 state] == 1)
    {
      uint64_t v12 = [(_UIPreviewPresentationController *)self platterMenuController];

      if (v12)
      {
        CGFloat v13 = [(_UIPreviewPresentationController *)self platterMenuController];
        objc_msgSend(v13, "didBeginPanningWithPoint:", v9, v11);

        [(_UIPreviewPresentationController *)self setDidSendBeginEvent:1];
      }
    }
    else if ([v26 state] == 2)
    {
      id v14 = [(_UIPreviewPresentationController *)self platterMenuController];

      if (v14)
      {
        if (![(_UIPreviewPresentationController *)self didSendBeginEvent])
        {
          [(_UIPreviewPresentationController *)self setDidSendBeginEvent:1];
          CGFloat v15 = [(_UIPreviewPresentationController *)self platterMenuController];
          objc_msgSend(v15, "didBeginPanningWithPoint:", v9, v11);
        }
        id v16 = [(_UIPreviewPresentationController *)self platterMenuController];
        objc_msgSend(v16, "didPanWithPoint:", v9, v11);

        [(_UIPreviewPresentationController *)self _updateVisibiltyOfPreviewActionChromeForCurrentState];
        [(_UIPreviewPresentationController *)self updateSwipeActionsIfApplicable];
      }
    }
    else
    {
      [(_UIPreviewPresentationController *)self setupAdditionalModalGestureRecognizers];
      id v17 = [(_UIPreviewPresentationController *)self platterMenuController];

      if (v17)
      {
        [(_UIPreviewPresentationController *)self setDidSendBeginEvent:0];
        BOOL v18 = [(_UIPreviewPresentationController *)self platterMenuController];
        objc_msgSend(v18, "didEndPanningWithPoint:", v9, v11);

        id v19 = [(_UIPreviewPresentationController *)self platterMenuController];
        char v20 = 0;
        if (([v19 isMenuPresented] & 1) == 0)
        {
          CGRect v21 = [(_UIPreviewPresentationController *)self platterMenuController];
          char v22 = [v21 isMenuPresenting];

          char v20 = v22 ^ 1;
        }

        CGRect v23 = [(_UIPreviewPresentationController *)self platterMenuController];
        int v24 = [v23 isSelectingSwipeAction];

        if ((v20 & 1) != 0 || v24)
        {
          uint64_t v25 = [(_UIPreviewPresentationController *)self platterMenuController];
          [v25 resetAnimator];

          [(_UIPreviewPresentationController *)self _dismissPresentation];
        }
      }
    }
  }
}

- (void)updateSwipeActionsIfApplicable
{
  if ([(_UIPreviewPresentationController *)self _hasPreviewQuickActions])
  {
    double v3 = [(_UIPreviewPresentationController *)self platterMenuController];
    [v3 currentTranslation];
    double v5 = v4;

    double v6 = [(UIPresentationController *)self containerView];
    int v7 = v6[28];

    double v8 = [(_UIPreviewPresentationController *)self leadingQuickActionView];
    double v9 = [v8 quickAction];

    if (v9)
    {
      double v10 = [(_UIPreviewPresentationController *)self leadingQuickActionView];
      double v11 = [v10 quickAction];
      -[_UIPreviewPresentationController _quickActionsSelectionThresholdForPreviewMenuItemStyle:](self, "_quickActionsSelectionThresholdForPreviewMenuItemStyle:", [v11 style]);
      double v13 = v12;

      if (v13 > 0.0)
      {
        BOOL v14 = (*(void *)&v7 & 0x80000) != 0 ? v5 > v13 : v5 < -v13;
        [(_UIPreviewPresentationController *)self setLeadingQuickActionViewSelected:v14];
        if ([(_UIPreviewPresentationController *)self leadingQuickActionViewSelected]) {
          [(_UIPreviewPresentationController *)self setTrailingQuickActionViewSelected:0];
        }
      }
    }
    CGFloat v15 = [(_UIPreviewPresentationController *)self trailingQuickActionView];
    id v16 = [v15 quickAction];

    if (v16)
    {
      id v17 = [(_UIPreviewPresentationController *)self trailingQuickActionView];
      BOOL v18 = [v17 quickAction];
      -[_UIPreviewPresentationController _quickActionsSelectionThresholdForPreviewMenuItemStyle:](self, "_quickActionsSelectionThresholdForPreviewMenuItemStyle:", [v18 style]);
      double v20 = v19;

      if (v20 > 0.0)
      {
        BOOL v21 = (*(void *)&v7 & 0x80000) != 0 ? v5 < -v20 : v5 > v20;
        [(_UIPreviewPresentationController *)self setTrailingQuickActionViewSelected:v21];
        if ([(_UIPreviewPresentationController *)self trailingQuickActionViewSelected])
        {
          [(_UIPreviewPresentationController *)self setLeadingQuickActionViewSelected:0];
        }
      }
    }
    if ([(_UIPreviewPresentationController *)self trailingQuickActionViewSelected])
    {
      char v22 = [(_UIPreviewPresentationController *)self trailingQuickActionView];
      [v22 setHidden:0];

      CGRect v23 = [(_UIPreviewPresentationController *)self leadingQuickActionView];
      [v23 setHidden:1];
    }
    if ([(_UIPreviewPresentationController *)self leadingQuickActionViewSelected])
    {
      int v24 = [(_UIPreviewPresentationController *)self leadingQuickActionView];
      [v24 setHidden:0];

      uint64_t v25 = [(_UIPreviewPresentationController *)self trailingQuickActionView];
      [v25 setHidden:1];
    }
    BOOL v26 = [(_UIPreviewPresentationController *)self trailingQuickActionViewSelected];
    double v27 = [(_UIPreviewPresentationController *)self trailingQuickActionView];
    [v27 setSelected:v26];

    BOOL v28 = [(_UIPreviewPresentationController *)self leadingQuickActionViewSelected];
    double v29 = [(_UIPreviewPresentationController *)self leadingQuickActionView];
    [v29 setSelected:v28];

    BOOL v30 = [(_UIPreviewPresentationController *)self leadingQuickActionViewSelected];
    uint64_t v31 = [(_UIPreviewPresentationController *)self platterMenuController];
    [v31 setLeadingSwipeActionViewSelected:v30];

    BOOL v32 = [(_UIPreviewPresentationController *)self trailingQuickActionViewSelected];
    id v33 = [(_UIPreviewPresentationController *)self platterMenuController];
    [v33 setTrailingSwipeActionViewSelected:v32];
  }
}

- (void)_setupInteractionProgressForBreathing
{
  double v3 = [(_UIPreviewPresentationController *)self interactionProgressForBreathing];

  if (!v3)
  {
    double v4 = [UIPreviewForceInteractionProgress alloc];
    double v5 = [(_UIPreviewPresentationController *)self actionSheetContainerView];
    double v6 = [v5 window];
    int v7 = [(UIPreviewForceInteractionProgress *)v4 initWithView:v6 targetState:3];
    [(_UIPreviewPresentationController *)self setInteractionProgressForBreathing:v7];

    double v8 = [(_UIPreviewPresentationController *)self interactionProgressForBreathing];
    [v8 setCompletesAtTargetState:0];

    double v9 = [(_UIPreviewPresentationController *)self interactionProgressForBreathing];
    [v9 addProgressObserver:self];
  }
  [(_UIPreviewPresentationController *)self _beginBreathing];
}

- (void)setupAdditionalModalGestureRecognizers
{
  double v3 = [(_UIPreviewPresentationController *)self interactionProgressForCommit];

  if (!v3)
  {
    double v4 = [UIPreviewForceInteractionProgress alloc];
    double v5 = [(_UIPreviewPresentationController *)self actionSheetContainerView];
    double v6 = [v5 window];
    int v7 = [(UIPreviewForceInteractionProgress *)v4 initWithView:v6 targetState:3];
    [(_UIPreviewPresentationController *)self setInteractionProgressForCommit:v7];

    double v8 = [(_UIPreviewPresentationController *)self interactionProgressForCommit];
    [v8 setCompletesAtTargetState:0];

    double v9 = [(_UIPreviewPresentationController *)self interactionProgressForCommit];
    [v9 addProgressObserver:self];
  }
  [(_UIPreviewPresentationController *)self setPanningGestureRecognizer:0];
  double v10 = [(_UIPreviewPresentationController *)self modalPreviewActionsPanningGestureRecognizer];

  if (!v10)
  {
    double v11 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:sel__panningGestureRecognizerDidFire_];
    [(UIPanGestureRecognizer *)v11 setMinimumNumberOfTouches:1];
    [(UIPanGestureRecognizer *)v11 setMaximumNumberOfTouches:1];
    double v12 = [(UIPresentationController *)self containerView];
    [v12 addGestureRecognizer:v11];

    [(_UIPreviewPresentationController *)self setModalPreviewActionsPanningGestureRecognizer:v11];
  }
  double v13 = [(_UIPreviewPresentationController *)self tapToDismissGestureRecognizer];

  if (!v13)
  {
    BOOL v14 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__tapToDismissPreviewWithActionsDidFire_];
    [(_UIPreviewPresentationController *)self setTapToDismissGestureRecognizer:v14];

    CGFloat v15 = [(_UIPreviewPresentationController *)self tapToDismissGestureRecognizer];
    [v15 setNumberOfTapsRequired:1];

    id v16 = [(_UIPreviewPresentationController *)self tapToDismissGestureRecognizer];
    [v16 setNumberOfTouchesRequired:1];

    id v18 = [(UIPresentationController *)self containerView];
    id v17 = [(_UIPreviewPresentationController *)self tapToDismissGestureRecognizer];
    [v18 addGestureRecognizer:v17];
  }
}

- (BOOL)previewActionSheetCanSelectItem:(id)a3
{
  return 1;
}

- (BOOL)_shouldSavePresentedViewControllerForStateRestoration
{
  return 0;
}

- (UIGestureRecognizer)panningGestureRecognizer
{
  return self->_panningGestureRecognizer;
}

- (id)presentationPhaseCompletionBlock
{
  return self->_presentationPhaseCompletionBlock;
}

- (void)setPresentationPhaseCompletionBlock:(id)a3
{
}

- (BOOL)_sourceViewSnapshotAndScaleTransformSuppressed
{
  return self->_sourceViewSnapshotAndScaleTransformSuppressed;
}

- (void)set_sourceViewSnapshotAndScaleTransformSuppressed:(BOOL)a3
{
  self->_sourceViewSnapshotAndScaleTransformSuppressed = a3;
}

- (_UIForcePresentationControllerDelegate)forcePresentationControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_forcePresentationControllerDelegate);
  return (_UIForcePresentationControllerDelegate *)WeakRetained;
}

- (void)setForcePresentationControllerDelegate:(id)a3
{
}

- (BOOL)didSendBeginEvent
{
  return self->_didSendBeginEvent;
}

- (void)setDidSendBeginEvent:(BOOL)a3
{
  self->_didSendBeginEvent = a3;
}

- (_UIStatesFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (UIView)actionSheetContainerView
{
  return self->_actionSheetContainerView;
}

- (void)setActionSheetContainerView:(id)a3
{
}

- (UIScrollView)containerScrollView
{
  return self->_containerScrollView;
}

- (void)setContainerScrollView:(id)a3
{
}

- (_UIPreviewActionSheetView)previewActionSheet
{
  return self->_previewActionSheet;
}

- (void)setPreviewActionSheet:(id)a3
{
}

- (UIPreviewForceInteractionProgress)interactionProgressForCommit
{
  return self->_interactionProgressForCommit;
}

- (void)setInteractionProgressForCommit:(id)a3
{
}

- (UIPreviewForceInteractionProgress)interactionProgressForBreathing
{
  return self->_interactionProgressForBreathing;
}

- (void)setInteractionProgressForBreathing:(id)a3
{
}

- (_UIPreviewPresentationContainerView)presentationContainerView
{
  return self->_presentationContainerView;
}

- (void)setPresentationContainerView:(id)a3
{
}

- (_UIPreviewPresentationEffectView)revealContainerView
{
  return self->_revealContainerView;
}

- (void)setRevealContainerView:(id)a3
{
}

- (UIWindow)initialSourceViewSnapshotWindow
{
  return self->_initialSourceViewSnapshotWindow;
}

- (void)setInitialSourceViewSnapshotWindow:(id)a3
{
}

- (UIView)initialSourceViewSnapshot
{
  return self->_initialSourceViewSnapshot;
}

- (void)setInitialSourceViewSnapshot:(id)a3
{
}

- (_UIPreviewPresentationAnimator)unhighlightPreviewCellSnapshotViewAnimator
{
  return self->_unhighlightPreviewCellSnapshotViewAnimator;
}

- (void)setUnhighlightPreviewCellSnapshotViewAnimator:(id)a3
{
}

- (void)setPreviewActionItems:(id)a3
{
}

- (void)setLeadingPreviewAction:(id)a3
{
}

- (void)setTrailingPreviewAction:(id)a3
{
}

- (_UIPreviewQuickActionView)leadingQuickActionView
{
  return self->_leadingQuickActionView;
}

- (void)setLeadingQuickActionView:(id)a3
{
}

- (_UIPreviewQuickActionView)trailingQuickActionView
{
  return self->_trailingQuickActionView;
}

- (void)setTrailingQuickActionView:(id)a3
{
}

- (NSLayoutConstraint)leadingQuickActionViewEdgeConstraint
{
  return self->_leadingQuickActionViewEdgeConstraint;
}

- (void)setLeadingQuickActionViewEdgeConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingQuickActionViewEdgeConstraint
{
  return self->_trailingQuickActionViewEdgeConstraint;
}

- (void)setTrailingQuickActionViewEdgeConstraint:(id)a3
{
}

- (UIImageView)actionSheetAvailableImageView
{
  return self->_actionSheetAvailableImageView;
}

- (void)setActionSheetAvailableImageView:(id)a3
{
}

- (BOOL)leadingQuickActionViewSelected
{
  return self->_leadingQuickActionViewSelected;
}

- (void)setLeadingQuickActionViewSelected:(BOOL)a3
{
  self->_leadingQuickActionViewSelected = a3;
}

- (BOOL)trailingQuickActionViewSelected
{
  return self->_trailingQuickActionViewSelected;
}

- (void)setTrailingQuickActionViewSelected:(BOOL)a3
{
  self->_trailingQuickActionViewSelected = a3;
}

- (NSLayoutConstraint)containerScrollViewXConstraint
{
  return self->_containerScrollViewXConstraint;
}

- (void)setContainerScrollViewXConstraint:(id)a3
{
}

- (UITapGestureRecognizer)tapToDismissGestureRecognizer
{
  return self->_tapToDismissGestureRecognizer;
}

- (void)setTapToDismissGestureRecognizer:(id)a3
{
}

- (UIGestureRecognizer)modalPreviewActionsPanningGestureRecognizer
{
  return self->_modalPreviewActionsPanningGestureRecognizer;
}

- (void)setModalPreviewActionsPanningGestureRecognizer:(id)a3
{
}

- (BOOL)isAnimatingActionSheet
{
  return self->_isAnimatingActionSheet;
}

- (void)setIsAnimatingActionSheet:(BOOL)a3
{
  self->_isAnimatingActionSheet = a3;
}

- (_UIPlatterMenuDynamicsController)platterMenuController
{
  return self->_platterMenuController;
}

- (void)setPlatterMenuController:(id)a3
{
}

- (_UIVelocityIntegrator)revealPanningVelocityIntegrator
{
  return self->_revealPanningVelocityIntegrator;
}

- (void)setRevealPanningVelocityIntegrator:(id)a3
{
}

- (BOOL)hasAskedForDismissalInternally
{
  return self->_hasAskedForDismissalInternally;
}

- (void)setHasAskedForDismissalInternally:(BOOL)a3
{
  self->_hasAskedForDismissalInternalldouble y = a3;
}

- (BOOL)hasAskedForCommitInternally
{
  return self->_hasAskedForCommitInternally;
}

- (void)setHasAskedForCommitInternally:(BOOL)a3
{
  self->_hasAskedForCommitInternalldouble y = a3;
}

- (BOOL)preDismissAnimationsInflight
{
  return self->_preDismissAnimationsInflight;
}

- (void)setPreDismissAnimationsInflight:(BOOL)a3
{
  self->_preDismissAnimationsInflight = a3;
}

- (BOOL)panningGestureRecognizerInProgress
{
  return self->_panningGestureRecognizerInProgress;
}

- (void)setPanningGestureRecognizerInProgress:(BOOL)a3
{
  self->_panningGestureRecognizerInProgress = a3;
}

- (BOOL)isBreathing
{
  return self->_breathing;
}

- (unint64_t)currentPresentationPhase
{
  return self->_currentPresentationPhase;
}

- (void)setCurrentPresentationPhase:(unint64_t)a3
{
  self->_currentPresentationPhase = a3;
}

- (UIPreviewInteractionController)previewInteractionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewInteractionController);
  return (UIPreviewInteractionController *)WeakRetained;
}

- (void)setPreviewInteractionController:(id)a3
{
}

- (UIViewControllerPreviewing)previewingContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewingContext);
  return (UIViewControllerPreviewing *)WeakRetained;
}

- (void)setPreviewingContext:(id)a3
{
}

- (UIInteractionProgress)interactionProgressForPresentation
{
  return self->_interactionProgressForPresentation;
}

- (void)setInteractionProgressForPresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionProgressForPresentation, 0);
  objc_destroyWeak((id *)&self->_previewingContext);
  objc_destroyWeak((id *)&self->_previewInteractionController);
  objc_storeStrong((id *)&self->_revealPanningVelocityIntegrator, 0);
  objc_storeStrong((id *)&self->_platterMenuController, 0);
  objc_storeStrong((id *)&self->_modalPreviewActionsPanningGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapToDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_containerScrollViewXConstraint, 0);
  objc_storeStrong((id *)&self->_actionSheetAvailableImageView, 0);
  objc_storeStrong((id *)&self->_trailingQuickActionViewEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_leadingQuickActionViewEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_trailingQuickActionView, 0);
  objc_storeStrong((id *)&self->_leadingQuickActionView, 0);
  objc_storeStrong((id *)&self->_trailingPreviewAction, 0);
  objc_storeStrong((id *)&self->_leadingPreviewAction, 0);
  objc_storeStrong((id *)&self->_previewActionItems, 0);
  objc_storeStrong((id *)&self->_unhighlightPreviewCellSnapshotViewAnimator, 0);
  objc_storeStrong((id *)&self->_initialSourceViewSnapshot, 0);
  objc_storeStrong((id *)&self->_initialSourceViewSnapshotWindow, 0);
  objc_storeStrong((id *)&self->_revealContainerView, 0);
  objc_storeStrong((id *)&self->_presentationContainerView, 0);
  objc_storeStrong((id *)&self->_interactionProgressForBreathing, 0);
  objc_storeStrong((id *)&self->_interactionProgressForCommit, 0);
  objc_storeStrong((id *)&self->_previewActionSheet, 0);
  objc_storeStrong((id *)&self->_containerScrollView, 0);
  objc_storeStrong((id *)&self->_actionSheetContainerView, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_forcePresentationControllerDelegate);
  objc_storeStrong(&self->_presentationPhaseCompletionBlock, 0);
  objc_storeStrong((id *)&self->_panningGestureRecognizer, 0);
}

@end