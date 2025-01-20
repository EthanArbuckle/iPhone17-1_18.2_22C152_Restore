@interface _UIPreviewTransitionController
+ (id)performCommitTransitionWithDelegate:(id)a3 forViewController:(id)a4 previewViewController:(id)a5 previewInteractionController:(id)a6 completion:(id)a7;
- (NSDictionary)viewsParticipatingInCommitTransition;
- (NSMutableDictionary)animationsByPresentationPhase;
- (UIInteractionProgress)interactionProgress;
- (UIViewControllerContextTransitioning)transitionContext;
- (_UIPreviewTransitionController)initWithInteractionProgress:(id)a3 targetPresentationPhase:(unint64_t)a4;
- (_UIStatesFeedbackGenerator)feedbackGenerator;
- (double)transitionDuration:(id)a3;
- (unint64_t)targetPresentationPhase;
- (void)_animateCommitTransition:(id)a3;
- (void)_animateDismissTransition:(id)a3;
- (void)_animatePreviewTransition:(id)a3;
- (void)_animateRevealTransition:(id)a3;
- (void)_completeAnimationWithPresentationPhase:(unint64_t)a3 finished:(BOOL)a4;
- (void)_layoutForPresentationPhase:(unint64_t)a3;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)cancelInteractiveTransition;
- (void)finishInteractiveTransition;
- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4;
- (void)interactionProgressDidUpdate:(id)a3;
- (void)setAnimations:(id)a3 completion:(id)a4 forPresentationPhase:(unint64_t)a5;
- (void)setAnimationsByPresentationPhase:(id)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setInteractionProgress:(id)a3;
- (void)setTargetPresentationPhase:(unint64_t)a3;
- (void)setTransitionContext:(id)a3;
- (void)setViewsParticipatingInCommitTransition:(id)a3;
- (void)startInteractiveTransition:(id)a3;
- (void)updateInteractiveTransition:(double)a3;
@end

@implementation _UIPreviewTransitionController

- (_UIPreviewTransitionController)initWithInteractionProgress:(id)a3 targetPresentationPhase:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIPreviewTransitionController;
  v8 = [(UIPercentDrivenInteractiveTransition *)&v13 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
    [(_UIPreviewTransitionController *)v8 setAnimationsByPresentationPhase:v9];

    [v7 addProgressObserver:v8];
    [(_UIPreviewTransitionController *)v8 setInteractionProgress:v7];
    [(_UIPreviewTransitionController *)v8 setTargetPresentationPhase:a4];
    if (a4 > 5 || ((1 << a4) & 0x34) == 0)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, v8, @"_UIPreviewTransitionController.m", 58, @"The targetPresentationPhase needs to be Preview, Commit or Cancelled." object file lineNumber description];
    }
    v11 = v8;
  }

  return v8;
}

- (void)setAnimations:(id)a3 completion:(id)a4 forPresentationPhase:(unint64_t)a5
{
  id aBlock = a4;
  v8 = (void *)MEMORY[0x1E4F1CA60];
  id v9 = a3;
  v10 = [v8 dictionaryWithCapacity:2];
  v11 = _Block_copy(v9);

  [v10 setObject:v11 forKeyedSubscript:@"animations"];
  if (aBlock)
  {
    v12 = _Block_copy(aBlock);
    [v10 setObject:v12 forKeyedSubscript:@"completion"];
  }
  objc_super v13 = [(_UIPreviewTransitionController *)self animationsByPresentationPhase];
  v14 = [NSNumber numberWithUnsignedInteger:a5];
  [v13 setObject:v10 forKeyedSubscript:v14];
}

- (double)transitionDuration:(id)a3
{
  return 0.25;
}

- (void)animateTransition:(id)a3
{
  id v5 = a3;
  -[_UIPreviewTransitionController setTransitionContext:](self, "setTransitionContext:");
  if ([(_UIPreviewTransitionController *)self targetPresentationPhase] == 2)
  {
    v4 = [(_UIPreviewTransitionController *)self interactionProgress];

    if (v4)
    {
      [(_UIPreviewTransitionController *)self _animateRevealTransition:v5];
    }
    else
    {
      [(_UIPreviewTransitionController *)self _layoutForPresentationPhase:1];
      [v5 completeTransition:1];
      [(_UIPreviewTransitionController *)self _completeAnimationWithPresentationPhase:1 finished:1];
    }
  }
  else if ([(_UIPreviewTransitionController *)self targetPresentationPhase] == 4)
  {
    [(_UIPreviewTransitionController *)self _animateCommitTransition:v5];
  }
  else
  {
    [(_UIPreviewTransitionController *)self _animateDismissTransition:v5];
  }
}

- (void)startInteractiveTransition:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIPreviewTransitionController;
  id v4 = a3;
  [(UIPercentDrivenInteractiveTransition *)&v5 startInteractiveTransition:v4];
  -[_UIPreviewTransitionController setTransitionContext:](self, "setTransitionContext:", v4, v5.receiver, v5.super_class);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(UIInteractionProgress *)self->_interactionProgress didEnd]) {
      [(_UIPreviewTransitionController *)self finishInteractiveTransition];
    }
  }
}

- (void)updateInteractiveTransition:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewTransitionController;
  [(UIPercentDrivenInteractiveTransition *)&v3 updateInteractiveTransition:a3];
}

- (void)cancelInteractiveTransition
{
  v2.receiver = self;
  v2.super_class = (Class)_UIPreviewTransitionController;
  [(UIPercentDrivenInteractiveTransition *)&v2 cancelInteractiveTransition];
}

- (void)finishInteractiveTransition
{
  [(UIPercentDrivenInteractiveTransition *)self setCompletionSpeed:10.0];
  [(UIPercentDrivenInteractiveTransition *)self setCompletionCurve:3];
  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewTransitionController;
  [(UIPercentDrivenInteractiveTransition *)&v3 finishInteractiveTransition];
}

- (void)animationEnded:(BOOL)a3
{
  if (a3 && [(_UIPreviewTransitionController *)self targetPresentationPhase] == 2)
  {
    id v4 = [(_UIPreviewTransitionController *)self transitionContext];
    [(_UIPreviewTransitionController *)self _animatePreviewTransition:v4];
  }
}

- (void)interactionProgressDidUpdate:(id)a3
{
  [a3 percentComplete];
  if (v4 > 1.0) {
    double v4 = 1.0;
  }
  double v5 = fmax(v4, 0.0);
  [(_UIPreviewTransitionController *)self updateInteractiveTransition:v5];
  id v6 = [(_UIPreviewTransitionController *)self feedbackGenerator];
  [v6 transitionToState:@"preview" updated:v5];
}

- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = [(_UIPreviewTransitionController *)self transitionContext];
  if ([v8 isInteractive])
  {
    id v6 = [(_UIPreviewTransitionController *)self transitionContext];
    char v7 = [v6 transitionWasCancelled];

    if ((v7 & 1) == 0)
    {
      if (v4)
      {
        [(_UIPreviewTransitionController *)self finishInteractiveTransition];
      }
      else
      {
        [(_UIPreviewTransitionController *)self cancelInteractiveTransition];
      }
    }
  }
  else
  {
  }
}

- (void)_animateRevealTransition:(id)a3
{
  id v4 = a3;
  [(_UIPreviewTransitionController *)self transitionDuration:v4];
  double v6 = v5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59___UIPreviewTransitionController__animateRevealTransition___block_invoke;
  v10[3] = &unk_1E52D9F70;
  v10[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59___UIPreviewTransitionController__animateRevealTransition___block_invoke_2;
  v8[3] = &unk_1E52DA660;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  +[UIView animateWithDuration:0 delay:v10 options:v8 animations:v6 completion:0.0];
}

- (void)_animatePreviewTransition:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60___UIPreviewTransitionController__animatePreviewTransition___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60___UIPreviewTransitionController__animatePreviewTransition___block_invoke_2;
  v7[3] = &unk_1E52DC3A0;
  v7[4] = self;
  double v5 = _Block_copy(v7);
  if (_AXSReduceMotionEnabled())
  {
    +[UIView animateKeyframesWithDuration:0 delay:v4 options:v5 animations:0.2 completion:0.0];
  }
  else
  {
    self;
    _durationOfSpringAnimation(2.0, 1500.0, 93.0, 0.0);
    +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v4, v5);
  }
  double v6 = [(_UIPreviewTransitionController *)self feedbackGenerator];
  [v6 transitionToState:@"preview" ended:1];
}

- (void)_animateDismissTransition:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60___UIPreviewTransitionController__animateDismissTransition___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  double v5 = _Block_copy(aBlock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60___UIPreviewTransitionController__animateDismissTransition___block_invoke_2;
  v8[3] = &unk_1E52DA660;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  id v7 = _Block_copy(v8);
  +[UIView animateWithDuration:v5 animations:v7 completion:0.25];
}

- (void)_animateCommitTransition:(id)a3
{
  id v4 = a3;
  v68 = [v4 viewForKey:@"UITransitionContextToView"];
  double v5 = [v4 viewControllerForKey:@"UITransitionContextToViewController"];
  v72 = [v4 viewControllerForKey:@"UITransitionContextFromViewController"];
  id v6 = [v72 navigationController];
  v75 = self;
  id v7 = [(_UIPreviewTransitionController *)self viewsParticipatingInCommitTransition];
  id v8 = [v7 objectForKeyedSubscript:@"backgroundView"];
  id v9 = [v7 objectForKeyedSubscript:@"presentationContainerView"];
  v10 = [v7 objectForKeyedSubscript:@"presentationContainerView"];
  v61 = [v10 platterView];

  v71 = v7;
  v77 = [v7 objectForKeyedSubscript:@"presentationView"];
  v70 = [v6 delegate];
  char v11 = objc_opt_respondsToSelector();
  if ([v5 _isNestedNavigationController]) {
    v12 = v5;
  }
  else {
    v12 = v6;
  }
  id v13 = v12;
  v14 = [v6 navigationBar];
  v76 = v13;
  v15 = [v13 toolbar];
  v66 = [v15 superview];
  v59 = [v14 superview];
  [v4 finalFrameForViewController:v5];
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  v63 = v4;
  v24 = [v4 containerView];
  [v24 addSubview:v9];
  v73 = v15;
  [v24 addSubview:v15];
  [v24 addSubview:v14];
  v25 = [[_UIBackdropView alloc] initWithPrivateStyle:-4];
  [(_UIBackdropView *)v25 setGroupName:@"commitAnimation"];
  [v24 bounds];
  -[UIView setFrame:](v25, "setFrame:");
  [v24 addSubview:v25];
  [v24 addSubview:v8];
  v26 = [v24 window];
  v27 = __UIStatusBarManagerForWindow(v26);
  [v27 statusBarHeight];
  double v29 = v28;

  double v30 = 0.0;
  double v31 = 0.0;
  if (([v6 isNavigationBarHidden] & 1) == 0)
  {
    [v14 bounds];
    double v31 = v32;
  }
  if (([v76 isToolbarHidden] & 1) == 0)
  {
    [v73 bounds];
    double v30 = v33;
  }
  if (v11) {
    double v34 = 30.0;
  }
  else {
    double v34 = 60.0;
  }
  double v35 = v29 + v31;
  v36 = objc_alloc_init(UIView);
  [v24 bounds];
  double v38 = v37;
  [v24 bounds];
  -[UIView setBounds:](v36, "setBounds:", 0.0, v35, v38);
  [v24 bounds];
  double v40 = v39;
  [v24 bounds];
  -[UIView setFrame:](v36, "setFrame:", 0.0, v35, v40, v41 - v35 - v30);
  [(UIView *)v36 setClipsToBounds:1];
  v42 = [[_UIBackdropView alloc] initWithPrivateStyle:-4];
  [(_UIBackdropView *)v42 setGroupName:@"commitAnimation"];
  [(UIView *)v36 addSubview:v42];
  [v24 addSubview:v36];
  [v61 addSubview:v77];
  [v77 addSubview:v68];
  [v9 setNeedsLayout];
  [v9 layoutIfNeeded];
  [v68 frame];
  -[UIView convertRect:fromView:](v36, "convertRect:fromView:", v77);
  -[UIView setFrame:](v42, "setFrame:");
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59___UIPreviewTransitionController__animateCommitTransition___block_invoke;
  aBlock[3] = &unk_1E52DAF18;
  id v97 = v6;
  id v98 = v5;
  id v43 = v9;
  id v99 = v43;
  id v44 = v8;
  id v100 = v44;
  id v45 = v68;
  id v101 = v45;
  id v102 = v61;
  v46 = v42;
  v103 = v46;
  id v58 = v61;
  id v69 = v5;
  id v62 = v6;
  v56 = v25;
  v57 = _Block_copy(aBlock);
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __59___UIPreviewTransitionController__animateCommitTransition___block_invoke_2;
  v78[3] = &unk_1E53005A8;
  v79 = v25;
  v80 = v46;
  v81 = v36;
  id v82 = v44;
  id v83 = v43;
  id v84 = v24;
  uint64_t v92 = v17;
  uint64_t v93 = v19;
  uint64_t v94 = v21;
  uint64_t v95 = v23;
  id v85 = v45;
  id v86 = v66;
  id v87 = v73;
  id v88 = v59;
  id v89 = v14;
  v90 = v75;
  id v91 = v63;
  id v64 = v63;
  id v65 = v14;
  id v60 = v59;
  id v47 = v73;
  id v74 = v66;
  id v67 = v45;
  id v48 = v24;
  id v49 = v43;
  id v50 = v44;
  v51 = v36;
  v52 = v46;
  v53 = v56;
  v54 = _Block_copy(v78);
  +[UIView _animateUsingDefaultDampedSpringWithDelay:0 initialSpringVelocity:v57 options:v54 animations:0.0 completion:v34];
  v55 = [(_UIPreviewTransitionController *)v75 feedbackGenerator];
  [v55 transitionToState:@"commit" ended:1];
}

- (void)_layoutForPresentationPhase:(unint64_t)a3
{
  id v4 = [(_UIPreviewTransitionController *)self animationsByPresentationPhase];
  double v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v8 = [v4 objectForKeyedSubscript:v5];

  uint64_t v6 = [v8 objectForKeyedSubscript:@"animations"];
  id v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
}

- (void)_completeAnimationWithPresentationPhase:(unint64_t)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(_UIPreviewTransitionController *)self animationsByPresentationPhase];
  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  id v12 = [v7 objectForKeyedSubscript:v8];

  id v9 = [v12 objectForKeyedSubscript:@"completion"];
  if (a3 == 1 && !v4)
  {
    v10 = _UIStatesFeedbackGeneratorForcePresentationStatePreview;
LABEL_7:
    char v11 = [(_UIPreviewTransitionController *)self feedbackGenerator];
    [v11 transitionToState:*v10 ended:0];

    goto LABEL_8;
  }
  if (a3 == 5 && v4)
  {
    v10 = _UIStatesFeedbackGeneratorForcePresentationStateCommit;
    goto LABEL_7;
  }
LABEL_8:
  if (v9) {
    v9[2](v9, v4);
  }
}

+ (id)performCommitTransitionWithDelegate:(id)a3 forViewController:(id)a4 previewViewController:(id)a5 previewInteractionController:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![v11 previewInteractionControllerShouldPerformCompatibilityCommitTransition:v14])
  {
    v26 = [[_UIPreviewInteractionCommitTransition alloc] initWithPresentedViewController:v13];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_4;
    v28[3] = &unk_1E52DCB30;
    id v29 = v11;
    id v30 = v14;
    id v31 = v13;
    [(_UIPreviewInteractionCommitTransition *)v26 performTransitionWithPresentationBlock:v28 completion:v15];

    id v18 = v29;
    id v17 = v15;
  }
  else
  {
    if (v15) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = &__block_literal_global_427;
    }
    id v17 = _Block_copy(v16);

    id v18 = v11;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v18 performsCustomCommitTransitionForPreviewInteractionController:v14])
    {
      [v18 previewInteractionController:v14 performCustomCommitForPreviewViewController:v13 completion:v17];
    }
    else if ([v18 performsViewControllerCommitTransitionForPreviewInteractionController:v14])
    {
      id v19 = v13;
      uint64_t v20 = v19;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v20 = [v18 previewInteractionController:v14 committedViewControllerForPreviewViewController:v19];
      }
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_2;
      v45[3] = &unk_1E52DD450;
      id v46 = v19;
      id v18 = v18;
      id v47 = v18;
      id v48 = v14;
      id v49 = v20;
      id v21 = v20;
      [v46 _transitionToViewController:v21 whilePerforming:v45 completion:v17];
    }
    else
    {
      uint64_t v22 = objc_opt_class();
      uint64_t v39 = 0;
      double v40 = &v39;
      uint64_t v41 = 0x3032000000;
      v42 = __Block_byref_object_copy__155;
      id v43 = __Block_byref_object_dispose__155;
      if (objc_opt_isKindOfClass()) {
        uint64_t v23 = v12;
      }
      else {
        uint64_t v23 = 0;
      }
      id v44 = v23;
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_48;
      v38[3] = &unk_1E53005D0;
      v38[4] = &v39;
      v38[5] = v22;
      [v12 _traverseViewControllerHierarchyFromLevel:0 withBlock:v38];
      uint64_t v24 = v40[5];
      if (!v24)
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Could not find a UINavigationController instance to perform a default commit transition. Please perform a custom view controller hierarchy transition in -commitPreviewViewController:committedViewController: on UIViewControllerPreviewingDelegate."];
        uint64_t v24 = v40[5];
      }
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_2_54;
      v34[3] = &unk_1E53005F8;
      id v35 = v13;
      id v18 = v18;
      id v36 = v18;
      id v37 = v14;
      [v35 _transitionToNavigationViewController:v24 withWrapper:v34];
      v25 = [(id)v40[5] transitionCoordinator];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __150___UIPreviewTransitionController_performCommitTransitionWithDelegate_forViewController_previewViewController_previewInteractionController_completion___block_invoke_3_56;
      v32[3] = &unk_1E52DA110;
      id v17 = v17;
      id v33 = v17;
      [v25 animateAlongsideTransitionInView:0 animation:0 completion:v32];

      _Block_object_dispose(&v39, 8);
    }
    v26 = 0;
  }

  return v26;
}

- (UIInteractionProgress)interactionProgress
{
  return self->_interactionProgress;
}

- (void)setInteractionProgress:(id)a3
{
}

- (unint64_t)targetPresentationPhase
{
  return self->_targetPresentationPhase;
}

- (void)setTargetPresentationPhase:(unint64_t)a3
{
  self->_targetPresentationPhase = a3;
}

- (NSDictionary)viewsParticipatingInCommitTransition
{
  return self->_viewsParticipatingInCommitTransition;
}

- (void)setViewsParticipatingInCommitTransition:(id)a3
{
}

- (_UIStatesFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (NSMutableDictionary)animationsByPresentationPhase
{
  return self->_animationsByPresentationPhase;
}

- (void)setAnimationsByPresentationPhase:(id)a3
{
}

- (UIViewControllerContextTransitioning)transitionContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  return (UIViewControllerContextTransitioning *)WeakRetained;
}

- (void)setTransitionContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transitionContext);
  objc_storeStrong((id *)&self->_animationsByPresentationPhase, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_viewsParticipatingInCommitTransition, 0);
  objc_storeStrong((id *)&self->_interactionProgress, 0);
}

@end