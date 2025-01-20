@interface PKNavigationDashboardAnimatedTransitioningHandler
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isPresenting;
- (BOOL)wantsInteractiveStart;
- (BOOL)wasDragged;
- (PKPGSVTransitionInterstitialController)interstitialController;
- (double)duration;
- (double)transitionDuration:(id)a3;
- (void)_cancelPresentation;
- (void)_completeCancelledPresentation;
- (void)_completePresentation;
- (void)_dismiss;
- (void)_moveGroupView:(id)a3;
- (void)_startPresentation;
- (void)_updateWithTransitionContext:(id)a3;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)cancel;
- (void)presentedVCDidScroll;
- (void)setDragged:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setInterstitialController:(id)a3;
- (void)setPresenting:(BOOL)a3;
- (void)startInteractiveTransition:(id)a3;
@end

@implementation PKNavigationDashboardAnimatedTransitioningHandler

- (void)_updateWithTransitionContext:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_transitionContext, a3);
  uint64_t v6 = *MEMORY[0x1E4FB30B8];
  uint64_t v7 = *MEMORY[0x1E4FB30C8];
  if (self->_presenting) {
    uint64_t v8 = *MEMORY[0x1E4FB30B8];
  }
  else {
    uint64_t v8 = *MEMORY[0x1E4FB30C8];
  }
  v9 = [v5 viewControllerForKey:v8];
  uint64_t v10 = *MEMORY[0x1E4FB30C0];
  uint64_t v11 = *MEMORY[0x1E4FB30D0];
  if (self->_presenting) {
    uint64_t v12 = *MEMORY[0x1E4FB30C0];
  }
  else {
    uint64_t v12 = *MEMORY[0x1E4FB30D0];
  }
  v13 = [v5 viewForKey:v12];
  v65 = v9;
  objc_storeWeak((id *)&self->_presentingVC, v9);
  objc_storeWeak((id *)&self->_presentingView, v13);
  if (self->_presenting) {
    uint64_t v14 = v7;
  }
  else {
    uint64_t v14 = v6;
  }
  v15 = [v5 viewControllerForKey:v14];
  if (self->_presenting) {
    uint64_t v16 = v11;
  }
  else {
    uint64_t v16 = v10;
  }
  v17 = [v5 viewForKey:v16];
  objc_storeWeak((id *)&self->_presentedVC, v15);
  objc_storeWeak((id *)&self->_presentedView, v17);
  v18 = [PKPassthroughView alloc];
  double v19 = *MEMORY[0x1E4F1DB28];
  double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v23 = -[PKPassthroughView initWithFrame:](v18, "initWithFrame:", *MEMORY[0x1E4F1DB28], v20, v21, v22);
  groupViewContainer = self->_groupViewContainer;
  self->_groupViewContainer = v23;

  [(PKPassthroughView *)self->_groupViewContainer setHitTestEnabled:0];
  v25 = [MEMORY[0x1E4F39C40] layer];
  navigationBar = self->_navigationBar;
  self->_navigationBar = v25;

  [(CAPortalLayer *)self->_navigationBar setMatchesPosition:1];
  [(CAPortalLayer *)self->_navigationBar setMatchesTransform:1];
  [(CAPortalLayer *)self->_navigationBar setHidesSourceLayer:1];
  v27 = [v15 navigationBar];
  v28 = self->_navigationBar;
  v29 = [v27 layer];
  [(CAPortalLayer *)v28 setSourceLayer:v29];

  v30 = self->_navigationBar;
  [v27 alpha];
  *(float *)&double v31 = v31;
  [(CAPortalLayer *)v30 setOpacity:v31];

  v32 = -[PKPassthroughView initWithFrame:]([PKPassthroughView alloc], "initWithFrame:", v19, v20, v21, v22);
  navigationItemsContainer = self->_navigationItemsContainer;
  self->_navigationItemsContainer = v32;

  [(PKPassthroughView *)self->_navigationItemsContainer setHitTestEnabled:0];
  v34 = [(UIViewControllerContextTransitioning *)self->_transitionContext containerView];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v35 = [v34 subviews];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v68 objects:v72 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v69 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = *(PKPassthroughView **)(*((void *)&v68 + 1) + 8 * i);
        BOOL v41 = v40 == v13 || v40 == v17;
        if (!v41 && v40 != self->_navigationItemsContainer) {
          [(PKPassthroughView *)v40 removeFromSuperview];
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v68 objects:v72 count:16];
    }
    while (v37);
  }

  [v34 addSubview:v13];
  [v34 addSubview:v17];
  [v34 addSubview:self->_groupViewContainer];
  v42 = [v34 layer];
  [v42 addSublayer:self->_navigationBar];

  [v34 addSubview:self->_navigationItemsContainer];
  v43 = [v15 passGroupView];
  v44 = (void *)[v43 createExternalTapGestureRecognizer];
  [v44 setDelegate:self];
  [v34 addGestureRecognizer:v44];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKNavigationDashboardAnimatedTransitioningHandler__updateWithTransitionContext___block_invoke;
  aBlock[3] = &unk_1E59D0F68;
  id v67 = v5;
  id v64 = v5;
  v45 = (double (**)(void *, void *, void *))_Block_copy(aBlock);
  double v46 = v45[2](v45, v65, v13);
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  double v53 = v45[2](v45, v15, v17);
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  -[PKPassthroughView setFrame:](v13, "setFrame:", v46, v48, v50, v52);
  -[PKPassthroughView setFrame:](v17, "setFrame:", v53, v55, v57, v59);
  v74.origin.double x = v46;
  v74.origin.double y = v48;
  v74.size.double width = v50;
  v74.size.double height = v52;
  v76.origin.double x = v53;
  v76.origin.double y = v55;
  v76.size.double width = v57;
  v76.size.double height = v59;
  CGRect v75 = CGRectUnion(v74, v76);
  double x = v75.origin.x;
  double y = v75.origin.y;
  double width = v75.size.width;
  double height = v75.size.height;
  -[PKPassthroughView setFrame:](self->_groupViewContainer, "setFrame:");
  -[PKPassthroughView setFrame:](self->_navigationItemsContainer, "setFrame:", x, y, width, height);
  [(PKPassthroughView *)v17 layoutIfNeeded];
}

double __82__PKNavigationDashboardAnimatedTransitioningHandler__updateWithTransitionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) finalFrameForViewController:v5];
  double x = v14.origin.x;
  CGFloat v8 = *MEMORY[0x1E4F1DB28];
  CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v16.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v16.origin.double y = v9;
  v16.size.double width = v10;
  v16.size.double height = v11;
  if (CGRectEqualToRect(v14, v16))
  {
    [*(id *)(a1 + 32) initialFrameForViewController:v5];
    double x = v15.origin.x;
    v17.origin.double x = v8;
    v17.origin.double y = v9;
    v17.size.double width = v10;
    v17.size.double height = v11;
    if (CGRectEqualToRect(v15, v17))
    {
      [v6 frame];
      double x = v12;
    }
  }

  return x;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedVC);
  id v6 = [WeakRetained passGroupView];

  if (v6)
  {
    [v4 locationInView:v6];
    uint64_t v7 = objc_msgSend(v6, "hitTest:withEvent:", 0);
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  if (!self->_started && !self->_completed)
  {
    self->_started = 1;
    id v5 = v4;
    [(PKNavigationDashboardAnimatedTransitioningHandler *)self _updateWithTransitionContext:v4];
    id v4 = v5;
    if (!self->_presenting)
    {
      [(PKNavigationDashboardAnimatedTransitioningHandler *)self _dismiss];
      id v4 = v5;
    }
  }
}

- (double)transitionDuration:(id)a3
{
  return self->_duration;
}

- (void)animationEnded:(BOOL)a3
{
  if (!self->_completed)
  {
    self->_completed = 1;
    p_presentedVC = &self->_presentedVC;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedVC);
    [WeakRetained noteTransitionCompleted];

    [(CAPortalLayer *)self->_navigationBar removeFromSuperlayer];
    [(CAPortalLayer *)self->_navigationBar setSourceLayer:0];
    [(CAPortalLayer *)self->_navigationBar setHidesSourceLayer:0];
    navigationBar = self->_navigationBar;
    self->_navigationBar = 0;

    objc_storeWeak((id *)&self->_presentingView, 0);
    objc_storeWeak((id *)&self->_presentingVC, 0);
    objc_storeWeak((id *)p_presentedVC, 0);
    objc_storeWeak((id *)&self->_presentedView, 0);
    transitionContext = self->_transitionContext;
    self->_transitionContext = 0;

    interstitialController = self->_interstitialController;
    if (interstitialController)
    {
      if (![(PKPGSVTransitionInterstitialController *)interstitialController isActive])
      {
        [(PKPGSVTransitionInterstitialController *)self->_interstitialController invalidate];
        CGFloat v9 = self->_interstitialController;
        self->_interstitialController = 0;
      }
    }
  }
}

- (void)startInteractiveTransition:(id)a3
{
  id v4 = a3;
  if (!self->_started && !self->_completed)
  {
    self->_started = 1;
    id v5 = v4;
    [(PKNavigationDashboardAnimatedTransitioningHandler *)self _updateWithTransitionContext:v4];
    id v4 = v5;
    if (self->_presenting)
    {
      [(PKNavigationDashboardAnimatedTransitioningHandler *)self _startPresentation];
      id v4 = v5;
    }
  }
}

- (BOOL)wantsInteractiveStart
{
  return 0;
}

- (void)cancel
{
  if (!self->_cancelled && self->_presenting)
  {
    self->_cancelled = 1;
    [(PKNavigationDashboardAnimatedTransitioningHandler *)self _cancelPresentation];
  }
}

- (void)presentedVCDidScroll
{
  if (self->_started && !self->_completed && self->_presenting && !self->_cancelled)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedVC);
    if (WeakRetained)
    {
      id v18 = WeakRetained;
      v3 = [WeakRetained passGroupView];
      id v4 = v3;
      if (v3)
      {
        id v5 = [v3 superview];
        if (v5)
        {
          id v6 = [v18 dashboardVC];
          uint64_t v7 = v6;
          if (v6)
          {
            BOOL v8 = [v6 passFlowLayout];
            CGFloat v9 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
            CGFloat v10 = [v8 layoutAttributesForItemAtIndexPath:v9];

            [v4 center];
            double v12 = v11;
            [v10 frame];
            double v14 = v13;
            double v16 = v15;
            CGRect v17 = [v7 collectionView];
            objc_msgSend(v5, "convertPoint:fromView:", v17, v14, v16);
            [v4 setCenter:v12];

            [v4 updatePageControlFrameAnimated:0];
          }
        }
      }

      id WeakRetained = v18;
    }
  }
}

- (void)_startPresentation
{
  if (!self->_completed && !self->_cancelled)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedVC);
    id v4 = objc_loadWeakRetained((id *)&self->_presentedView);
    id v5 = [WeakRetained dashboardVC];
    id v6 = [WeakRetained passGroupView];
    self->_animationStartTime = CACurrentMediaTime();
    [v4 setOpaque:0];
    [v4 setAlpha:0.0];
    [WeakRetained groupViewIsAvailable:v6];
    interstitialController = self->_interstitialController;
    if (interstitialController)
    {
      if ([(PKPGSVTransitionInterstitialController *)interstitialController isInvalidated])
      {
        BOOL v8 = self->_interstitialController;
        self->_interstitialController = 0;
      }
      if (self->_interstitialController)
      {
        objc_initWeak(&location, self);
        CGFloat v9 = self->_interstitialController;
        navigationItemsContainer = self->_navigationItemsContainer;
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke;
        v23[3] = &unk_1E59D0F90;
        objc_copyWeak(&v24, &location);
        [(PKPGSVTransitionInterstitialController *)v9 transferToView:navigationItemsContainer withDeactivationHandler:v23];
        double v11 = [(PKPGSVTransitionInterstitialController *)self->_interstitialController context];
        double v12 = self->_interstitialController;
        if (v11 == self)
        {
          double v13 = [WeakRetained interstitialProvider];
          [(PKPGSVTransitionInterstitialController *)v12 updateCurrentProvider:v13 withContainerAlpha:1.0];
        }
        else
        {
          double v13 = [WeakRetained interstitialProvider];
          [(PKPGSVTransitionInterstitialController *)v12 pushProvider:v13 withContainerAlpha:self context:1.0];
        }

        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
      }
    }
    id v14 = objc_loadWeakRetained((id *)&self->_presentedVC);
    int v15 = [v14 isInvalidated];

    if (v15)
    {
      [(PKNavigationDashboardAnimatedTransitioningHandler *)self _cancelPresentation];
    }
    else
    {
      objc_initWeak(&location, self);
      dispatch_time_t v16 = dispatch_time(0, 130000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke_2;
      block[3] = &unk_1E59CB838;
      objc_copyWeak(&v22, &location);
      id v18 = v6;
      id v19 = WeakRetained;
      id v20 = v5;
      id v21 = v4;
      dispatch_after(v16, MEMORY[0x1E4F14428], block);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }
}

void __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (id)WeakRetained[14] == v5)
  {
    if (*((unsigned char *)WeakRetained + 82))
    {
      [v5 invalidate];
      id v4 = (void *)WeakRetained[14];
      WeakRetained[14] = 0;
    }
  }
  else
  {
    [v5 invalidate];
  }
}

void __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 64);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((unsigned char *)WeakRetained + 82))
    {
      id v5 = WeakRetained[8];
      if (v5)
      {
        if (([v5 transitionWasCancelled] & 1) == 0)
        {
          [v4 _moveGroupView:*(void *)(a1 + 32)];
          id v6 = [*(id *)(a1 + 40) receiver];
          if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v6 groupViewDidMoveToReceiver:*(void *)(a1 + 32)];
          }
          uint64_t v7 = *(void **)(a1 + 48);
          BOOL v8 = [v7 frontmostPass];
          CGFloat v9 = [v8 nfcPayload];
          uint64_t v10 = [v9 requiresAuthentication] ^ 1;

          [v7 shouldPresentAllContent:v10 animated:0];
          id v11 = objc_alloc(MEMORY[0x1E4FB1ED8]);
          double v12 = *((double *)v4 + 13) + -0.13;
          double v13 = objc_alloc_init(PKDashboardPresentationTimingCurveProvider);
          uint64_t v14 = [v11 initWithDuration:v13 timingParameters:v12];
          id v15 = v4[11];
          v4[11] = (id)v14;

          [v4[11] setInterruptible:1];
          id v16 = v4[11];
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke_3;
          v23[3] = &unk_1E59CA7D0;
          id v24 = *(id *)(a1 + 56);
          [v16 addAnimations:v23];
          id v17 = v4[11];
          uint64_t v18 = MEMORY[0x1E4F143A8];
          uint64_t v19 = 3221225472;
          id v20 = __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke_4;
          id v21 = &unk_1E59D0FB8;
          objc_copyWeak(&v22, v2);
          [v17 addCompletion:&v18];
          objc_msgSend(v4[11], "startAnimation", v18, v19, v20, v21);
          objc_destroyWeak(&v22);
        }
      }
    }
  }
}

uint64_t __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke_4(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke_5;
    v5[3] = &unk_1E59CF720;
    objc_copyWeak(v6, v3);
    v6[1] = a2;
    dispatch_async(MEMORY[0x1E4F14428], v5);
    objc_destroyWeak(v6);
  }
}

void __71__PKNavigationDashboardAnimatedTransitioningHandler__startPresentation__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3 == 1)
    {
      id v4 = WeakRetained;
      [WeakRetained _completeCancelledPresentation];
    }
    else
    {
      if (v3) {
        goto LABEL_7;
      }
      id v4 = WeakRetained;
      [WeakRetained _completePresentation];
    }
    id WeakRetained = v4;
  }
LABEL_7:
}

- (void)_cancelPresentation
{
  if (!self->_completed)
  {
    [(UIViewControllerContextTransitioning *)self->_transitionContext pauseInteractiveTransition];
    [(UIViewControllerContextTransitioning *)self->_transitionContext cancelInteractiveTransition];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedVC);
    id v4 = objc_loadWeakRetained((id *)&self->_presentedView);
    id v5 = [WeakRetained dashboardVC];
    id v6 = [WeakRetained passGroupView];
    [WeakRetained noteWillDismiss];
    uint64_t v7 = [v4 layer];
    [v7 setAllowsHitTesting:0];

    [v4 setUserInteractionEnabled:0];
    if (self->_dragged) {
      [v5 shouldPresentAllContent:0 animated:1];
    }
    BOOL v8 = [WeakRetained receiver];
    if (v8)
    {
      interstitialController = self->_interstitialController;
      if (interstitialController
        && [(PKPGSVTransitionInterstitialController *)interstitialController isInvalidated])
      {
        uint64_t v10 = self->_interstitialController;
        self->_interstitialController = 0;
      }
      uint64_t v11 = [WeakRetained interstitialProvider];
      double v12 = (void *)v11;
      double v13 = self->_interstitialController;
      if (!v13 && v11)
      {
        objc_initWeak(&location, self);
        navigationItemsContainer = self->_navigationItemsContainer;
        uint64_t v22 = MEMORY[0x1E4F143A8];
        uint64_t v23 = 3221225472;
        id v24 = __72__PKNavigationDashboardAnimatedTransitioningHandler__cancelPresentation__block_invoke;
        v25 = &unk_1E59D0F90;
        objc_copyWeak(&v26, &location);
        id v15 = +[PKPGSVTransitionInterstitialController createInView:navigationItemsContainer withProvider:v12 containerAlpha:&v22 deactivationHandler:1.0];
        id v16 = self->_interstitialController;
        self->_interstitialController = v15;

        if (self->_interstitialController) {
          objc_msgSend(WeakRetained, "interstitialControllerAvailable:", v22, v23, v24, v25);
        }
        objc_destroyWeak(&v26);
        objc_destroyWeak(&location);
        double v13 = self->_interstitialController;
      }
      if (v13) {
        objc_msgSend(v8, "interstitialControllerAvailable:");
      }
      if (objc_opt_respondsToSelector()) {
        [v8 groupViewWillBeAvailable:v6];
      }
    }
    alphaPropertyAnimator = self->_alphaPropertyAnimator;
    if (alphaPropertyAnimator)
    {
      [(UIViewPropertyAnimator *)alphaPropertyAnimator fractionComplete];
      double v19 = v18;
      [(UIViewPropertyAnimator *)self->_alphaPropertyAnimator pauseAnimation];
      [(UIViewPropertyAnimator *)self->_alphaPropertyAnimator setReversed:1];
      double v20 = fmin(v19 * (self->_duration + -0.13), 0.3) / (self->_duration + -0.13);
      id v21 = objc_alloc_init(PKDashboardPresentationTimingCurveProvider);
      [(PKDashboardPresentationTimingCurveProvider *)v21 setType:1];
      [(UIViewPropertyAnimator *)self->_alphaPropertyAnimator continueAnimationWithTimingParameters:v21 durationFactor:v20];
    }
    else
    {
      [(PKNavigationDashboardAnimatedTransitioningHandler *)self _completeCancelledPresentation];
    }
  }
}

void __72__PKNavigationDashboardAnimatedTransitioningHandler__cancelPresentation__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 14) == v5)
  {
    *((void *)WeakRetained + 14) = 0;
  }
}

- (void)_completePresentation
{
  if (!self->_completed)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingView);
    id v3 = objc_loadWeakRetained((id *)&self->_presentedVC);
    id v4 = objc_loadWeakRetained((id *)&self->_presentedView);
    id v5 = [v3 passGroupView];
    [v3 insertGroupView];
    [v5 setNeedsLayout];
    [v4 setOpaque:1];
    [WeakRetained removeFromSuperview];
    [(UIViewControllerContextTransitioning *)self->_transitionContext completeTransition:1];
  }
}

- (void)_completeCancelledPresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingView);
  id v3 = objc_loadWeakRetained((id *)&self->_presentedVC);
  id v4 = objc_loadWeakRetained((id *)&self->_presentedView);
  [WeakRetained removeFromSuperview];
  [v4 setOpaque:1];
  [v4 removeFromSuperview];
  [v3 relinquishGroupView];
  [(UIViewControllerContextTransitioning *)self->_transitionContext completeTransition:0];
}

- (void)_dismiss
{
  if (!self->_completed)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedVC);
    id v4 = objc_loadWeakRetained((id *)&self->_presentedView);
    id v5 = [WeakRetained dashboardVC];
    id v6 = [WeakRetained passGroupView];
    uint64_t v7 = [v4 layer];
    [v7 setAllowsHitTesting:0];

    [v4 setUserInteractionEnabled:0];
    [WeakRetained noteWillDismiss];
    [v5 setFreezeChromelessNavigationItem:1];
    [(PKNavigationDashboardAnimatedTransitioningHandler *)self _moveGroupView:v6];
    [(PKPassthroughView *)self->_groupViewContainer bounds];
    double v9 = v8;
    double v11 = v10;
    [v6 anchorPoint];
    double v13 = v12;
    [v6 center];
    double v15 = v14;
    double v17 = v16;
    [v6 bounds];
    if (v17 != fmin(fmax(v17, v9 - v11 + v13 * v18), v9 + v11 * 2.0 - (1.0 - v13) * v18))
    {
      [v6 setCenter:v15];
      [v6 updatePageControlFrameAnimated:0];
    }
    interstitialController = self->_interstitialController;
    if (interstitialController
      && [(PKPGSVTransitionInterstitialController *)interstitialController isInvalidated])
    {
      double v20 = self->_interstitialController;
      self->_interstitialController = 0;
    }
    objc_initWeak(location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__PKNavigationDashboardAnimatedTransitioningHandler__dismiss__block_invoke;
    aBlock[3] = &unk_1E59D0F90;
    objc_copyWeak(&v41, location);
    id v21 = _Block_copy(aBlock);
    uint64_t v22 = [WeakRetained interstitialProvider];
    uint64_t v23 = self->_interstitialController;
    if (v23)
    {
      [(PKPGSVTransitionInterstitialController *)v23 transferToView:self->_navigationItemsContainer withDeactivationHandler:v21];
    }
    else if (v22)
    {
      double v31 = +[PKPGSVTransitionInterstitialController createInView:self->_navigationItemsContainer withProvider:v22 containerAlpha:v21 deactivationHandler:1.0];
      v32 = self->_interstitialController;
      self->_interstitialController = v31;

      if (self->_interstitialController) {
        objc_msgSend(WeakRetained, "interstitialControllerAvailable:");
      }
    }
    id v24 = [WeakRetained receiver];
    v25 = v24;
    if (v24)
    {
      if (self->_interstitialController) {
        objc_msgSend(v24, "interstitialControllerAvailable:");
      }
      if (objc_opt_respondsToSelector()) {
        [v25 groupViewWillBeAvailable:v6];
      }
    }
    if (self->_dragged) {
      [v5 shouldPresentAllContent:0 animated:1];
    }
    [v4 setOpaque:0];
    id v26 = (void *)MEMORY[0x1E4FB1EB0];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __61__PKNavigationDashboardAnimatedTransitioningHandler__dismiss__block_invoke_2;
    v37[3] = &unk_1E59CA870;
    id v27 = v4;
    id v38 = v27;
    id v28 = v5;
    id v39 = v28;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __61__PKNavigationDashboardAnimatedTransitioningHandler__dismiss__block_invoke_3;
    v33[3] = &unk_1E59CCC78;
    objc_copyWeak(&v36, location);
    id v29 = v27;
    id v34 = v29;
    id v30 = WeakRetained;
    id v35 = v30;
    [v26 animateWithDuration:131076 delay:v37 options:v33 animations:0.3 completion:0.0];

    objc_destroyWeak(&v36);
    objc_destroyWeak(&v41);
    objc_destroyWeak(location);
  }
}

void __61__PKNavigationDashboardAnimatedTransitioningHandler__dismiss__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (id)WeakRetained[14] == v5)
  {
    if (*((unsigned char *)WeakRetained + 82))
    {
      [v5 invalidate];
      id v4 = (void *)WeakRetained[14];
      WeakRetained[14] = 0;
    }
  }
  else
  {
    [v5 invalidate];
  }
}

void __61__PKNavigationDashboardAnimatedTransitioningHandler__dismiss__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = [*(id *)(a1 + 40) navigationItem];
  [v2 _setManualScrollEdgeAppearanceProgress:0.0];
}

void __61__PKNavigationDashboardAnimatedTransitioningHandler__dismiss__block_invoke_3(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    [a1[4] removeFromSuperview];
    [a1[4] setOpaque:1];
    [a1[5] relinquishGroupView];
    [WeakRetained[8] completeTransition:*((unsigned char *)WeakRetained + 96) == 0];
  }
}

- (void)_moveGroupView:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 superview];
  id v5 = (void *)v4;
  groupViewContainer = self->_groupViewContainer;
  if ((PKPassthroughView *)v4 != groupViewContainer)
  {
    id v7 = v8;
    if (v4)
    {
      [v8 center];
      -[PKPassthroughView convertPoint:fromView:](groupViewContainer, "convertPoint:fromView:", v5);
      objc_msgSend(v8, "setCenter:");
      id v7 = v8;
      groupViewContainer = self->_groupViewContainer;
    }
    [(PKPassthroughView *)groupViewContainer addSubview:v7];
  }
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (PKPGSVTransitionInterstitialController)interstitialController
{
  return self->_interstitialController;
}

- (void)setInterstitialController:(id)a3
{
}

- (BOOL)wasDragged
{
  return self->_dragged;
}

- (void)setDragged:(BOOL)a3
{
  self->_dragged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interstitialController, 0);
  objc_storeStrong((id *)&self->_alphaPropertyAnimator, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_navigationItemsContainer, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_groupViewContainer, 0);
  objc_destroyWeak((id *)&self->_presentedView);
  objc_destroyWeak((id *)&self->_presentedVC);
  objc_destroyWeak((id *)&self->_presentingView);

  objc_destroyWeak((id *)&self->_presentingVC);
}

@end