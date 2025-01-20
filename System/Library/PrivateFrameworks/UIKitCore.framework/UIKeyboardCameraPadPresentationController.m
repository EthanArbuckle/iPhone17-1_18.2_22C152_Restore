@interface UIKeyboardCameraPadPresentationController
- (BOOL)updatesGuideDuringRotation;
- (CGRect)frameOfPresentedViewInContainerView;
- (UIDimmingViewDelegate)dimmingViewDelegate;
- (double)transitionDuration:(id)a3;
- (int)overrideTextEffectsVisibilityLevelForTransitionView:(id)a3;
- (void)_animateDismissTransition:(id)a3;
- (void)_animatePresentTransition:(id)a3;
- (void)animateTransition:(id)a3;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setDimmingViewDelegate:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UIKeyboardCameraPadPresentationController

- (BOOL)updatesGuideDuringRotation
{
  return 1;
}

- (void)presentationTransitionWillBegin
{
  v3 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  v4 = [v3 vendKeyboardSuppressionAssertionForReason:@"Keyboard Camera"];
  keyboardSuppressionAssertion = self->_keyboardSuppressionAssertion;
  self->_keyboardSuppressionAssertion = v4;

  [(UIKeyboardCameraBasePresentationController *)self modifyKeyboardTrackingUsingNotificationType:2 forStart:1];
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
}

- (void)dismissalTransitionWillBegin
{
  [(UIKeyboardCameraBasePresentationController *)self modifyKeyboardTrackingUsingNotificationType:3 forStart:1];
  keyboardSuppressionAssertion = self->_keyboardSuppressionAssertion;
  self->_keyboardSuppressionAssertion = 0;
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v3 = [(UIPresentationController *)self presentingViewController];
  +[UIKeyboard sizeForInterfaceOrientation:](UIKeyboard, "sizeForInterfaceOrientation:", [v3 interfaceOrientation]);
  double v5 = v4;

  if (v5 > 400.0) {
    double v6 = v5;
  }
  else {
    double v6 = 400.0;
  }
  v7 = [(UIPresentationController *)self containerView];
  [v7 bounds];
  double v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  CGFloat v15 = v14;

  v20.origin.x = v9;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  double v16 = CGRectGetHeight(v20) - v6;
  double v17 = v6 + -30.0;
  double v18 = v9 + 30.0;
  double v19 = v13 + -60.0;
  result.size.height = v17;
  result.size.width = v19;
  result.origin.y = v16;
  result.origin.x = v18;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UIKeyboardCameraPadPresentationController;
  -[UIPresentationController viewWillTransitionToSize:withTransitionCoordinator:](&v16, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x4010000000;
  v13[3] = &unk_186D7DBA7;
  long long v14 = 0u;
  long long v15 = 0u;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x4010000000;
  v10[3] = &unk_186D7DBA7;
  long long v11 = 0u;
  long long v12 = 0u;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__UIKeyboardCameraPadPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E52DC350;
  v9[4] = self;
  v9[5] = v13;
  v9[6] = v10;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __96__UIKeyboardCameraPadPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1E52DC378;
  v8[4] = self;
  v8[5] = v13;
  v8[6] = v10;
  [v7 animateAlongsideTransition:v9 completion:v8];
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v13, 8);
}

uint64_t __96__UIKeyboardCameraPadPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 368) frame];
  v2 = *(void **)(*(void *)(a1 + 40) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  [*(id *)(a1 + 32) frameOfPresentedViewInContainerView];
  id v7 = *(void **)(*(void *)(a1 + 48) + 8);
  v7[4] = v8;
  v7[5] = v9;
  v7[6] = v10;
  v7[7] = v11;
  long long v12 = *(double **)(*(void *)(a1 + 40) + 8);
  double v13 = *(double **)(*(void *)(a1 + 48) + 8);
  objc_msgSend(*(id *)(a1 + 32), "modifyKeyboardTrackingUsingNotificationType:from:to:forStart:", 2, 1, v12[4], v12[5], v12[6], v12[7], v13[4], v13[5], v13[6], v13[7]);
  long long v14 = [*(id *)(a1 + 32) containerView];
  [v14 bounds];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 376), "setFrame:");

  long long v15 = *(double **)(*(void *)(a1 + 48) + 8);
  double v16 = v15[4];
  double v17 = v15[5];
  double v18 = *(void **)(*(void *)(a1 + 32) + 368);
  double v19 = v15[6];
  double v20 = v15[7];
  return objc_msgSend(v18, "setFrame:", v16, v17, v19, v20);
}

uint64_t __96__UIKeyboardCameraPadPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  v1 = *(double **)(*(void *)(a1 + 40) + 8);
  v2 = *(double **)(*(void *)(a1 + 48) + 8);
  return objc_msgSend(*(id *)(a1 + 32), "modifyKeyboardTrackingUsingNotificationType:from:to:forStart:", 2, 0, v1[4], v1[5], v1[6], v1[7], v2[4], v2[5], v2[6], v2[7]);
}

- (int)overrideTextEffectsVisibilityLevelForTransitionView:(id)a3
{
  return 9;
}

- (double)transitionDuration:(id)a3
{
  return 0.8;
}

- (void)animateTransition:(id)a3
{
  if (self->_shadowView) {
    [(UIKeyboardCameraPadPresentationController *)self _animateDismissTransition:a3];
  }
  else {
    [(UIKeyboardCameraPadPresentationController *)self _animatePresentTransition:a3];
  }
}

- (void)_animateDismissTransition:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__UIKeyboardCameraPadPresentationController__animateDismissTransition___block_invoke;
  v8[3] = &unk_1E52D9F70;
  v8[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__UIKeyboardCameraPadPresentationController__animateDismissTransition___block_invoke_2;
  v6[3] = &unk_1E52DA660;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  +[UIView _animateUsingSpringWithDuration:0 delay:v8 options:v6 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
}

uint64_t __71__UIKeyboardCameraPadPresentationController__animateDismissTransition___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 368) setAlpha:0.0];
  CGAffineTransformMakeScale(&v5, 0.6, 0.6);
  v2 = *(void **)(*(void *)(a1 + 32) + 368);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

uint64_t __71__UIKeyboardCameraPadPresentationController__animateDismissTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 368) removeFromSuperview];
  [*(id *)(*(void *)(a1 + 32) + 376) removeFromSuperview];
  CGAffineTransform v4 = *(void **)(a1 + 40);
  return [v4 completeTransition:a2];
}

- (void)_animatePresentTransition:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 viewControllerForKey:@"UITransitionContextToViewController"];
  id v7 = [v6 view];
  uint64_t v8 = [v5 containerView];
  [v8 setIgnoresInteractionEvents:0];
  [v8 setIgnoreDirectTouchEvents:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"UIKeyboardCameraPadPresentationController.m" lineNumber:150 description:@"Keyboard Camera is being presented in something other than a UITransitionView."];
  }
  uint64_t v9 = [v8 delegate];

  if (v9 != self)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"UIKeyboardCameraPadPresentationController.m" lineNumber:151 description:@"Expecting to be the delegate of the UITransitionView for UITextEffectsWindow."];
  }
  uint64_t v10 = objc_alloc_init(UIDimmingView);
  dimmingView = self->_dimmingView;
  self->_dimmingView = v10;

  long long v12 = [(UIKeyboardCameraPadPresentationController *)self dimmingViewDelegate];
  [(UIDimmingView *)self->_dimmingView setDelegate:v12];

  [v8 bounds];
  -[UIView setFrame:](self->_dimmingView, "setFrame:");
  [v5 finalFrameForViewController:v6];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = objc_alloc_init(UIView);
  shadowView = self->_shadowView;
  self->_shadowView = v21;

  -[UIView setFrame:](self->_shadowView, "setFrame:", v14, v16, v18, v20);
  [(UIView *)self->_shadowView bounds];
  objc_msgSend(v7, "setFrame:");
  [v7 setClipsToBounds:1];
  [v7 _setContinuousCornerRadius:15.0];
  [(UIView *)self->_shadowView addSubview:v7];
  [v8 addSubview:self->_dimmingView];
  [v8 addSubview:self->_shadowView];
  [(UIView *)self->_shadowView setAlpha:0.0];
  CGAffineTransformMakeScale(&v38, 0.6, 0.6);
  v23 = self->_shadowView;
  CGAffineTransform v37 = v38;
  [(UIView *)v23 setTransform:&v37];
  v24 = [(UIView *)self->_shadowView layer];
  LODWORD(v25) = 0.25;
  [v24 setShadowOpacity:v25];

  v26 = [(UIView *)self->_shadowView layer];
  [v26 setShadowRadius:30.0];

  v27 = [(UIView *)self->_shadowView layer];
  objc_msgSend(v27, "setShadowOffset:", 0.0, -10.0);

  id v28 = +[UIColor blackColor];
  uint64_t v29 = [v28 CGColor];
  v30 = [(UIView *)self->_shadowView layer];
  [v30 setShadowColor:v29];

  id v35 = v5;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __71__UIKeyboardCameraPadPresentationController__animatePresentTransition___block_invoke;
  v36[3] = &unk_1E52D9F70;
  v36[4] = self;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __71__UIKeyboardCameraPadPresentationController__animatePresentTransition___block_invoke_2;
  v34[3] = &unk_1E52DC3A0;
  id v31 = v5;
  +[UIView _animateUsingSpringWithDuration:0 delay:v36 options:v34 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
}

uint64_t __71__UIKeyboardCameraPadPresentationController__animatePresentTransition___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 368) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 368);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v2 setTransform:v5];
}

uint64_t __71__UIKeyboardCameraPadPresentationController__animatePresentTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2];
}

- (UIDimmingViewDelegate)dimmingViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dimmingViewDelegate);
  return (UIDimmingViewDelegate *)WeakRetained;
}

- (void)setDimmingViewDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dimmingViewDelegate);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_keyboardSuppressionAssertion, 0);
}

@end