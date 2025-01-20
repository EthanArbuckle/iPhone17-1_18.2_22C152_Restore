@interface _UIAlertControllerPresentationController
- (BOOL)_canCommitPresentation;
- (BOOL)_canDismissPresentation;
- (BOOL)_isChromeHidden;
- (BOOL)_isCurrentContext;
- (BOOL)_keyboardShouldAnimateAlongsideForInteractiveTransitions;
- (BOOL)_preserveResponderAcrossWindows;
- (BOOL)_shouldOccludeDuringPresentation;
- (BOOL)_shouldRespectNearestCurrentContextPresenter;
- (BOOL)_sourceViewSnapshotAndScaleTransformSuppressed;
- (BOOL)shouldPresentInFullscreen;
- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3;
- (UIGestureRecognizer)panningGestureRecognizer;
- (UIView)_dimmingView;
- (UIView)_revealContainerView;
- (_UIAlertControllerPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (_UIForcePresentationControllerDelegate)forcePresentationControllerDelegate;
- (_UIStatesFeedbackGenerator)feedbackGenerator;
- (id)_createVisualStyleForProvider:(id)a3;
- (id)_presentedAlertController;
- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4;
- (id)presentationPhaseCompletionBlock;
- (int64_t)adaptivePresentationStyle;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (void)_prepareConstraintsIfNecessary;
- (void)_prepareDimmingViewIfNecessary;
- (void)_presentedAlertControllerDidAdapt;
- (void)_setChromeHidden:(BOOL)a3;
- (void)_setIsCurrentContext:(BOOL)a3;
- (void)_setShouldRespectNearestCurrentContextPresenter:(BOOL)a3;
- (void)_updateConstraintsIfNecessary;
- (void)_willRunTransitionForCurrentStateDeferred:(BOOL)a3;
- (void)containerViewDidLayoutSubviews;
- (void)containerViewWillLayoutSubviews;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentationTransitionWillBegin;
- (void)setDelegate:(id)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setForcePresentationControllerDelegate:(id)a3;
- (void)setPanningGestureRecognizer:(id)a3;
- (void)setPresentationPhaseCompletionBlock:(id)a3;
- (void)set_sourceViewSnapshotAndScaleTransformSuppressed:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _UIAlertControllerPresentationController

- (BOOL)_canDismissPresentation
{
  v2 = [(_UIAlertControllerPresentationController *)self _presentedAlertController];
  v3 = [v2 transitionCoordinator];
  if (v3)
  {
    v4 = [v2 transitionCoordinator];
    char v5 = [v4 isInteractive];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_canCommitPresentation
{
  return 0;
}

- (_UIAlertControllerPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)_UIAlertControllerPresentationController;
  v7 = [(UIPresentationController *)&v24 initWithPresentedViewController:a3 presentingViewController:v6];
  v8 = v7;
  if (v7)
  {
    [(_UIAlertControllerPresentationController *)v7 setDelegate:v7];
    v9 = [_UIKeyboardLayoutAlignmentView alloc];
    double v10 = *MEMORY[0x1E4F1DB28];
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v14 = -[_UIKeyboardLayoutAlignmentView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], v11, v12, v13);
    keyboardLayoutAlignmentView = v8->keyboardLayoutAlignmentView;
    v8->keyboardLayoutAlignmentView = (_UIKeyboardLayoutAlignmentView *)v14;

    v16 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v10, v11, v12, v13);
    keyboardLayoutAlignmentAvailableSpaceView = v8->keyboardLayoutAlignmentAvailableSpaceView;
    v8->keyboardLayoutAlignmentAvailableSpaceView = v16;

    [(UIView *)v8->keyboardLayoutAlignmentAvailableSpaceView setUserInteractionEnabled:0];
    [(UIView *)v8->keyboardLayoutAlignmentAvailableSpaceView setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = +[_UIStatesFeedbackGeneratorPreviewConfiguration defaultConfiguration];
    v19 = [v18 tweakedConfigurationForClass:objc_opt_class() usage:@"previewInteractionPresentation"];

    v20 = [_UIStatesFeedbackGenerator alloc];
    v21 = [v6 view];
    v22 = [(_UIStatesFeedbackGenerator *)v20 initWithConfiguration:v19 view:v21];
    [(_UIAlertControllerPresentationController *)v8 setFeedbackGenerator:v22];
  }
  return v8;
}

- (int64_t)adaptivePresentationStyle
{
  return 4;
}

- (void)containerViewWillLayoutSubviews
{
  [(_UIAlertControllerPresentationController *)self _prepareDimmingViewIfNecessary];
  [(_UIAlertControllerPresentationController *)self _prepareConstraintsIfNecessary];
  [(_UIAlertControllerPresentationController *)self _updateConstraintsIfNecessary];
}

- (void)containerViewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_UIAlertControllerPresentationController;
  [(UIPresentationController *)&v5 containerViewDidLayoutSubviews];
  dimmingView = self->_dimmingView;
  if (dimmingView)
  {
    v4 = [(UIPresentationController *)self containerView];
    [v4 bounds];
    -[UIView setFrame:](dimmingView, "setFrame:");
  }
}

- (BOOL)shouldPresentInFullscreen
{
  return ![(_UIAlertControllerPresentationController *)self _isCurrentContext];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)_UIAlertControllerPresentationController;
  [(UIPresentationController *)&v24 preferredContentSizeDidChangeForChildContentContainer:a3];
  v4 = [(_UIAlertControllerPresentationController *)self _presentedAlertController];
  [v4 preferredContentSize];
  double v7 = v6;
  double v8 = v5;
  if (v6 != *MEMORY[0x1E4F1DB30] || v5 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v10 = [v4 _visualStyle];
    double v11 = [(UIPresentationController *)self containerView];
    [v10 contentInsetsForContainerView:v11];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    double v20 = v7 + v15 + v19;
    double v21 = v8 + v13 + v17;
    [(UIPresentationController *)self preferredContentSize];
    if (v20 >= v22) {
      double v22 = v20;
    }
    if (v21 >= v23) {
      double v23 = v21;
    }
    -[UIPresentationController _setPreferredContentSize:](self, "_setPreferredContentSize:", v22, v23);
  }
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

- (void)_prepareDimmingViewIfNecessary
{
  id v12 = [(_UIAlertControllerPresentationController *)self _presentedAlertController];
  double v3 = [v12 _visualStyle];
  double v4 = [(_UIAlertControllerPresentationController *)self _dimmingView];
  if (v12 && !v4 && v3)
  {
    if (![v12 _allowsShowingDimmingView]) {
      goto LABEL_10;
    }
    double v4 = [(_UIAlertControllerPresentationController *)self _presentedAlertController];
    double v5 = [(UIPresentationController *)self containerView];
    double v6 = [(_UIAlertControllerPresentationController *)self _dimmingView];
    [v6 removeFromSuperview];

    double v7 = [v4 _visualStyle];
    double v8 = [v7 dimmingViewForAlertController:v4];
    dimmingView = self->_dimmingView;
    self->_dimmingView = v8;

    [(UIView *)self->_dimmingView setTranslatesAutoresizingMaskIntoConstraints:0];
    double v10 = self->_dimmingView;
    if (v10)
    {
      [v5 insertSubview:v10 atIndex:0];
      [v5 sendSubviewToBack:v10];
      if ([v4 _canDismissWithGestureRecognizer])
      {
        double v11 = [v4 _dismissGestureRecognizer];
        [(UIView *)v10 addGestureRecognizer:v11];
      }
    }
  }
LABEL_10:
}

- (void)_willRunTransitionForCurrentStateDeferred:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIAlertControllerPresentationController;
  [(UIPresentationController *)&v4 _willRunTransitionForCurrentStateDeferred:a3];
  if (![(UIPresentationController *)self presenting]) {
    [(_UIKeyboardLayoutAlignmentView *)self->keyboardLayoutAlignmentView setAutomaticKeyboardFrameTrackingDisabled:1];
  }
}

- (void)presentationTransitionWillBegin
{
  id v12 = [(UIPresentationController *)self containerView];
  double v3 = [(UIPresentationController *)self presentingViewController];
  id v4 = (id)[v3 _transitionCoordinator];

  [v12 insertSubview:self->keyboardLayoutAlignmentView atIndex:0];
  [v12 insertSubview:self->keyboardLayoutAlignmentAvailableSpaceView atIndex:0];
  double v5 = [(UIPresentationController *)self presentedView];
  [v12 addSubview:v5];

  double v6 = [(_UIAlertControllerPresentationController *)self _presentedAlertController];
  double v7 = [(UIPresentationController *)self presentedViewController];
  double v8 = [v7 traitCollection];
  [v6 _updateProvidedStyleWithTraitCollection:v8];

  [(_UIAlertControllerPresentationController *)self _prepareDimmingViewIfNecessary];
  [(_UIAlertControllerPresentationController *)self _prepareConstraintsIfNecessary];
  [v12 layoutIfNeeded];
  v9 = [(_UIAlertControllerPresentationController *)self forcePresentationControllerDelegate];
  if (objc_opt_respondsToSelector())
  {
    [v9 forcePresentationTransitionWillBegin:self];
    double v10 = +[_UIStatistics previewInteractionTapCount];
    [v10 setSampleRate:0.0];

    double v11 = +[_UIStatistics previewInteractionAlertPresentationCount];
    [v11 incrementValueBy:1];
  }
}

- (BOOL)_preserveResponderAcrossWindows
{
  v2 = [(_UIAlertControllerPresentationController *)self _presentedAlertController];
  double v3 = [v2 _visualStyle];
  char v4 = [v3 shouldPreserveRespondersAcrossWindows];

  return v4;
}

- (BOOL)_keyboardShouldAnimateAlongsideForInteractiveTransitions
{
  return ![(_UIAlertControllerPresentationController *)self _preserveResponderAcrossWindows];
}

- (BOOL)_shouldOccludeDuringPresentation
{
  v2 = [(_UIAlertControllerPresentationController *)self _presentedAlertController];
  double v3 = [v2 _visualStyle];
  char v4 = [v3 shouldOccludeDuringPresentation];

  return v4;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)_UIAlertControllerPresentationController;
  id v7 = a4;
  -[UIPresentationController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __95___UIAlertControllerPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E52DA598;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)_prepareConstraintsIfNecessary
{
  if (!self->constraintsPrepared)
  {
    double v3 = [(_UIAlertControllerPresentationController *)self _presentedAlertController];
    char v4 = [v3 view];
    double v5 = [(UIPresentationController *)self containerView];
    double v6 = [v3 _visualStyle];
    if ([v4 isDescendantOfView:v5])
    {
      if ([(UIView *)self->keyboardLayoutAlignmentAvailableSpaceView isDescendantOfView:v5]
        && v6 != 0)
      {
        self->constraintsPrepared = 1;
        double v8 = (UIAlertVisualStyleUpdatableConstraints *)objc_opt_new();
        visualStyleUpdatableConstraints = self->_visualStyleUpdatableConstraints;
        self->_visualStyleUpdatableConstraints = v8;

        double v10 = [MEMORY[0x1E4F1CA48] array];
        double v11 = [MEMORY[0x1E4F5B268] constraintWithItem:self->keyboardLayoutAlignmentAvailableSpaceView attribute:3 relatedBy:0 toItem:v5 attribute:3 multiplier:1.0 constant:0.0];
        [v10 addObject:v11];

        id v12 = [MEMORY[0x1E4F5B268] constraintWithItem:self->keyboardLayoutAlignmentAvailableSpaceView attribute:4 relatedBy:0 toItem:self->keyboardLayoutAlignmentView attribute:3 multiplier:1.0 constant:0.0];
        [v10 addObject:v12];

        double v13 = [MEMORY[0x1E4F5B268] constraintWithItem:self->keyboardLayoutAlignmentAvailableSpaceView attribute:7 relatedBy:0 toItem:v5 attribute:7 multiplier:1.0 constant:0.0];
        [v10 addObject:v13];

        double v14 = [MEMORY[0x1E4F5B268] constraintWithItem:self->keyboardLayoutAlignmentAvailableSpaceView attribute:1 relatedBy:0 toItem:v5 attribute:1 multiplier:1.0 constant:0.0];
        [v10 addObject:v14];

        int v15 = [v3 _alignsToKeyboard];
        keyboardLayoutAlignmentAvailableSpaceView = v5;
        if (v15) {
          keyboardLayoutAlignmentAvailableSpaceView = self->keyboardLayoutAlignmentAvailableSpaceView;
        }
        double v17 = keyboardLayoutAlignmentAvailableSpaceView;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __74___UIAlertControllerPresentationController__prepareConstraintsIfNecessary__block_invoke;
        v20[3] = &unk_1E52DAF18;
        id v21 = v6;
        id v22 = v3;
        id v23 = v4;
        objc_super v24 = v17;
        v25 = self;
        id v26 = v10;
        v27 = v5;
        id v18 = v10;
        double v19 = v17;
        +[UIView performWithoutAnimation:v20];
      }
    }
  }
}

- (void)_updateConstraintsIfNecessary
{
  double v3 = [(UIPresentationController *)self containerView];
  if (self->constraintsPrepared)
  {
    double v17 = v3;
    BOOL v4 = ![(UIAlertVisualStyleUpdatableConstraints *)self->_visualStyleUpdatableConstraints hasUpdatableConstraints];
    double v3 = v17;
    BOOL v4 = v4 || v17 == 0;
    if (!v4)
    {
      double v5 = [(_UIAlertControllerPresentationController *)self _presentedAlertController];
      double v6 = [v5 view];
      id v7 = [v6 window];

      if (v7)
      {
        int v8 = [v5 _alignsToKeyboard];
        keyboardLayoutAlignmentAvailableSpaceView = v17;
        if (v8) {
          keyboardLayoutAlignmentAvailableSpaceView = self->keyboardLayoutAlignmentAvailableSpaceView;
        }
        double v10 = keyboardLayoutAlignmentAvailableSpaceView;
        double v11 = [v5 _visualStyle];
        [(id)objc_opt_class() positionContentsOfAlertController:v5 alertContentView:v6 availableSpaceView:v10 visualStyle:v11 updatableConstraints:self->_visualStyleUpdatableConstraints];
        id v12 = [(UIPresentationController *)self containerView];
        [v11 contentInsetsForContainerView:v12];
        double v14 = v13;
        double v16 = v15;

        [(NSLayoutConstraint *)self->_topAvailableSpaceConstraint setConstant:v14];
        [(NSLayoutConstraint *)self->_bottomAvailableSpaceConstraint setConstant:-v16];
      }
      double v3 = v17;
    }
  }
}

- (void)_presentedAlertControllerDidAdapt
{
  self->constraintsPrepared = 0;
  visualStyleUpdatableConstraints = self->_visualStyleUpdatableConstraints;
  self->_visualStyleUpdatableConstraints = 0;

  topAvailableSpaceConstraint = self->_topAvailableSpaceConstraint;
  self->_topAvailableSpaceConstraint = 0;

  bottomAvailableSpaceConstraint = self->_bottomAvailableSpaceConstraint;
  self->_bottomAvailableSpaceConstraint = 0;
}

- (id)_createVisualStyleForProvider:(id)a3
{
  id v4 = a3;
  double v5 = [v4 styleForAlertPresentationController:self];
  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIAlertControllerPresentationController;
    double v5 = [(UIPresentationController *)&v7 _createVisualStyleForProvider:v4];
  }

  return v5;
}

- (void)setDelegate:(id)a3
{
  double v5 = (_UIAlertControllerPresentationController *)a3;
  if (v5 != self)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UIAlertControllerPresentationController.m" lineNumber:346 description:@"The presentation controller of an alert controller presenting as an alert must not have its delegate modified"];
  }
  v7.receiver = self;
  v7.super_class = (Class)_UIAlertControllerPresentationController;
  [(UIPresentationController *)&v7 setDelegate:v5];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  return 0;
}

- (id)_presentedAlertController
{
  id v4 = [(UIPresentationController *)self presentedViewController];
  if (([v4 conformsToProtocol:&unk_1ED466988] & 1) == 0)
  {
    objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"_UIAlertControllerPresentationController.m" lineNumber:369 description:@"presentedViewController of _UIAlertControllerPresentationController does not contain an alert controller"];
  }
  double v5 = [v4 _containedAlertController];

  return v5;
}

- (void)setPanningGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIAlertControllerPresentationController *)self _presentedAlertController];
  [v5 _setSystemProvidedGestureRecognizer:v4];
}

- (void)_setChromeHidden:(BOOL)a3
{
  if (self->_chromeHidden != a3)
  {
    self->_chromeHidden = a3;
    -[UIView setHidden:](self->_dimmingView, "setHidden:");
  }
}

- (UIView)_dimmingView
{
  return (UIView *)objc_getProperty(self, a2, 352, 1);
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

- (_UIForcePresentationControllerDelegate)forcePresentationControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_forcePresentationControllerDelegate);
  return (_UIForcePresentationControllerDelegate *)WeakRetained;
}

- (void)setForcePresentationControllerDelegate:(id)a3
{
}

- (UIView)_revealContainerView
{
  return self->_revealContainerView;
}

- (BOOL)_sourceViewSnapshotAndScaleTransformSuppressed
{
  return self->_sourceViewSnapshotAndScaleTransformSuppressed;
}

- (void)set_sourceViewSnapshotAndScaleTransformSuppressed:(BOOL)a3
{
  self->_sourceViewSnapshotAndScaleTransformSuppressed = a3;
}

- (_UIStatesFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (BOOL)_isChromeHidden
{
  return self->_chromeHidden;
}

- (BOOL)_isCurrentContext
{
  return self->__isCurrentContext;
}

- (void)_setIsCurrentContext:(BOOL)a3
{
  self->__isCurrentContext = a3;
}

- (BOOL)_shouldRespectNearestCurrentContextPresenter
{
  return self->__shouldRespectNearestCurrentContextPresenter;
}

- (void)_setShouldRespectNearestCurrentContextPresenter:(BOOL)a3
{
  self->__shouldRespectNearestCurrentContextPresenter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_revealContainerView, 0);
  objc_destroyWeak((id *)&self->_forcePresentationControllerDelegate);
  objc_storeStrong(&self->_presentationPhaseCompletionBlock, 0);
  objc_storeStrong((id *)&self->_panningGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_bottomAvailableSpaceConstraint, 0);
  objc_storeStrong((id *)&self->_topAvailableSpaceConstraint, 0);
  objc_storeStrong((id *)&self->_visualStyleUpdatableConstraints, 0);
  objc_storeStrong((id *)&self->keyboardLayoutAlignmentAvailableSpaceView, 0);
  objc_storeStrong((id *)&self->keyboardLayoutAlignmentView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
}

@end