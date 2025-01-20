@interface _UIPreviewInteractionCommitTransition
- (BOOL)_shouldReduceMotion;
- (UIViewController)viewController;
- (UIWindow)currentCommitEffectWindow;
- (_UIPreviewInteractionCommitTransition)initWithPresentedViewController:(id)a3;
- (id)_preferredTransitionAnimator;
- (id)_preferredTransitionAnimatorForReducedMotion;
- (void)_applyCommitEffectTransformToView:(id)a3;
- (void)performTransitionWithPresentationBlock:(id)a3 completion:(id)a4;
- (void)setCurrentCommitEffectWindow:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation _UIPreviewInteractionCommitTransition

- (_UIPreviewInteractionCommitTransition)initWithPresentedViewController:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIPreviewInteractionCommitTransition.m", 38, @"Invalid parameter not satisfying: %@", @"viewController" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIPreviewInteractionCommitTransition;
  v6 = [(_UIPreviewInteractionCommitTransition *)&v11 init];
  v7 = v6;
  if (v6)
  {
    [(_UIPreviewInteractionCommitTransition *)v6 setViewController:v5];
    v8 = v7;
  }

  return v7;
}

- (void)performTransitionWithPresentationBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_UIPreviewInteractionCommitTransition *)self viewController];
  v30 = [v8 _existingPresentationControllerImmediate:0 effective:1];
  v29 = [v30 containerView];
  v9 = [v29 window];
  v10 = objc_alloc_init(_UIPreviewInteractionTransitionWindow);
  [(UIWindow *)v10 setHidden:0];
  [(UIView *)v10 bounds];
  v15 = _UISnapshotScreenAtViewRectAfterCommit(v10, 0, v11, v12, v13, v14);
  v16 = [_UIPreviewPresentationEffectView alloc];
  [v15 frame];
  v17 = -[_UIPreviewPresentationEffectView initWithFrame:](v16, "initWithFrame:");
  [(UIView *)v17 addSubview:v15];
  [(UIView *)v10 addSubview:v17];
  [(_UIPreviewInteractionCommitTransition *)self setCurrentCommitEffectWindow:v10];
  BOOL v18 = [(_UIPreviewInteractionCommitTransition *)self _shouldReduceMotion];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke;
  aBlock[3] = &unk_1E52E32E8;
  BOOL v40 = v18;
  aBlock[4] = self;
  v36 = v17;
  id v37 = v9;
  v38 = v10;
  id v39 = v7;
  id v19 = v7;
  v20 = v10;
  id v21 = v9;
  v22 = v17;
  v23 = _Block_copy(aBlock);
  v24 = [v21 windowScene];
  v25 = [v24 keyboardSceneDelegate];

  [v25 _beginDisablingAnimations];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __91___UIPreviewInteractionCommitTransition_performTransitionWithPresentationBlock_completion___block_invoke_5;
  v31[3] = &unk_1E52E4420;
  id v32 = v25;
  id v33 = v6;
  id v34 = v23;
  id v26 = v23;
  id v27 = v25;
  id v28 = v6;
  [v8 dismissViewControllerAnimated:0 completion:v31];
  +[UIWindow _synchronizeDrawingWithPreCommitHandler:0];
}

- (id)_preferredTransitionAnimator
{
  v2 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 4.2, 620.0, 840.0, 0.0, 0.0);
  v3 = [[UIViewPropertyAnimator alloc] initWithDuration:v2 timingParameters:0.0];

  return v3;
}

- (id)_preferredTransitionAnimatorForReducedMotion
{
  v2 = [[UICubicTimingParameters alloc] initWithAnimationCurve:0];
  v3 = [[UIViewPropertyAnimator alloc] initWithDuration:v2 timingParameters:0.2];

  return v3;
}

- (void)_applyCommitEffectTransformToView:(id)a3
{
  if (a3)
  {
    memset(&v8, 0, sizeof(v8));
    id v3 = a3;
    [v3 transform];
    CGAffineTransform v6 = v8;
    CGAffineTransformScale(&v7, &v6, 1.75, 1.75);
    CGAffineTransform v5 = v7;
    [v3 setTransform:&v5];
    CGAffineTransform v4 = v8;
    [v3 setTransform:&v4];
  }
}

- (BOOL)_shouldReduceMotion
{
  return _AXSReduceMotionEnabled() != 0;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (UIWindow)currentCommitEffectWindow
{
  return self->_currentCommitEffectWindow;
}

- (void)setCurrentCommitEffectWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCommitEffectWindow, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end