@interface PXMessagesStackDismissalAnimationController
- (PXMessagesStackDismissalAnimationController)initWithStackView:(id)a3 dismissingViewController:(id)a4;
- (PXMessagesStackView)stackView;
- (UIViewController)dismissingViewController;
- (UIViewControllerInteractiveTransitioning)interactionController;
- (double)transitionDuration:(id)a3;
- (id)interruptibleAnimatorForTransition:(id)a3;
- (void)_animateCrossfadeFallback:(uint64_t)a1;
- (void)runTransitionAnimation:(id)a3;
@end

@implementation PXMessagesStackDismissalAnimationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissingViewController, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_propertyAnimator, 0);
  objc_storeStrong((id *)&self->_transitionHelper, 0);
}

- (UIViewController)dismissingViewController
{
  return self->_dismissingViewController;
}

- (PXMessagesStackView)stackView
{
  return self->_stackView;
}

- (void)runTransitionAnimation:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  v6 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  v7 = [v4 containerView];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
LABEL_7:
  }
    PXAssertGetLog();
  v8 = [v6 topViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_7;
  }
  if (!v8) {
    goto LABEL_7;
  }
  v9 = [(PXMessagesStackDismissalAnimationController *)self stackView];
  id v10 = v8;
  id v11 = v9;
  v12 = v11;
  if (self)
  {
    [v11 currentAssetReference];
    v13 = [v10 regionOfInterestForAssetReference:objc_claimAutoreleasedReturnValue()];
    v14 = [v10 view];
    [v13 rectInCoordinateSpace:v14];
    [v14 bounds];
    [v14 safeAreaInsets];
    PXEdgeInsetsInsetRect();
  }

  -[PXMessagesStackDismissalAnimationController _animateCrossfadeFallback:](0, v4);
}

- (void)_animateCrossfadeFallback:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = [v3 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
    v6 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
    v7 = [v4 containerView];
    [v4 finalFrameForViewController:v5];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = [v5 view];
    v17 = [v6 view];
    [v7 insertSubview:v16 belowSubview:v17];

    v18 = [v5 view];
    objc_msgSend(v18, "setFrame:", v9, v11, v13, v15);

    v19 = *(void **)(a1 + 24);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __73__PXMessagesStackDismissalAnimationController__animateCrossfadeFallback___block_invoke;
    v28[3] = &unk_1E5DD36F8;
    id v20 = v6;
    id v29 = v20;
    [v19 addAnimations:v28];
    v21 = *(void **)(a1 + 24);
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __73__PXMessagesStackDismissalAnimationController__animateCrossfadeFallback___block_invoke_2;
    v26 = &unk_1E5DCF720;
    id v22 = v4;
    id v27 = v22;
    [v21 addCompletion:&v23];
    if ((objc_msgSend(v22, "isInteractive", v23, v24, v25, v26) & 1) == 0) {
      [*(id *)(a1 + 24) startAnimation];
    }
  }
}

void __70__PXMessagesStackDismissalAnimationController_runTransitionAnimation___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

uint64_t __70__PXMessagesStackDismissalAnimationController_runTransitionAnimation___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setHiddenAssetReferences:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setHiddenAssetReferences:*(void *)(a1 + 56) animationType:2];
  v2 = *(void **)(a1 + 64);
  uint64_t v3 = [v2 transitionWasCancelled] ^ 1;
  return [v2 completeTransition:v3];
}

void __73__PXMessagesStackDismissalAnimationController__animateCrossfadeFallback___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

uint64_t __73__PXMessagesStackDismissalAnimationController__animateCrossfadeFallback___block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 transitionWasCancelled] ^ 1;
  return [v1 completeTransition:v2];
}

- (UIViewControllerInteractiveTransitioning)interactionController
{
  uint64_t v3 = [(PXMessagesStackDismissalAnimationController *)self dismissingViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 topViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  v6 = [v5 edgeSwipeDismissalInteraction];
  [v6 setDelegate:self];

  return (UIViewControllerInteractiveTransitioning *)v6;
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  return self->_propertyAnimator;
}

- (double)transitionDuration:(id)a3
{
  return self->_transitionDuration;
}

- (PXMessagesStackDismissalAnimationController)initWithStackView:(id)a3 dismissingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PXMessagesStackDismissalAnimationController;
  double v9 = [(PXMessagesStackDismissalAnimationController *)&v22 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stackView, a3);
    objc_storeStrong((id *)&v10->_dismissingViewController, a4);
    double v11 = +[PXMessagesUISettings sharedInstance];
    [v11 transitionDuration];
    v10->_transitionDuration = v12;
    [v11 transitionSpringDamping];
    double v14 = v13;
    [v11 transitionSpringVelocity];
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C58]), "initWithDampingRatio:initialVelocity:", v14, v15, v15);
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4FB1ED8]) initWithDuration:v16 timingParameters:v10->_transitionDuration];
    propertyAnimator = v10->_propertyAnimator;
    v10->_propertyAnimator = (UIViewPropertyAnimator *)v17;

    v19 = (PXPhotosGridStackTransitionHelper *)-[PXPhotosGridStackTransitionHelper initWithStackItemsCount:]([PXPhotosGridStackTransitionHelper alloc], [v11 transitionItemsCount]);
    transitionHelper = v10->_transitionHelper;
    v10->_transitionHelper = v19;
  }
  return v10;
}

@end