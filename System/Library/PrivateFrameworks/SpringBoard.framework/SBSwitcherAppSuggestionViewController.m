@interface SBSwitcherAppSuggestionViewController
- (BOOL)_hasSuggestionBannerView;
- (BOOL)_isSuggestionQueueSuspended;
- (BOOL)showSuggestions;
- (CGRect)_idleOnscreenRectForBottomBanner;
- (CGRect)_offscreenRectForBottomBanner;
- (SBBestAppSuggestion)bestAppSuggestion;
- (SBSwitcherAppSuggestionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBSwitcherAppSuggestionViewControllerDelegate)delegate;
- (unint64_t)_bannerStyle;
- (void)_activateBestAppSuggestion;
- (void)_activateCurrentSuggestion;
- (void)_animateOutAndRemoveCurrentBottomBannerWithCompletion:(id)a3;
- (void)_evaluateSuggestionQueueSuspension;
- (void)_handleBannerTap:(id)a3;
- (void)_handleLongPress:(id)a3;
- (void)_insertAndAnimateInBottomBannerForSuggestion:(id)a3 completion:(id)a4;
- (void)_setBestAppSuggestion:(id)a3 animationCompletion:(id)a4;
- (void)_setSuggestionQueueSuspended:(BOOL)a3;
- (void)_updateBottomBannerWithCompletion:(id)a3;
- (void)beginPausingSuggestionUpdatesForReason:(id)a3;
- (void)dealloc;
- (void)endPausingSuggestionUpdatesForReason:(id)a3;
- (void)loadView;
- (void)setBestAppSuggestion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setShowSuggestions:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation SBSwitcherAppSuggestionViewController

- (void)setShowSuggestions:(BOOL)a3
{
  if (self->_showSuggestions != a3)
  {
    self->_showSuggestions = a3;
    [(SBSwitcherAppSuggestionViewController *)self _updateBottomBannerWithCompletion:0];
  }
}

- (SBBestAppSuggestion)bestAppSuggestion
{
  return self->_bestAppSuggestion;
}

- (void)setBestAppSuggestion:(id)a3
{
}

- (void)_setBestAppSuggestion:(id)a3 animationCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_initWeak(&location, self);
    setSuggestionQueue = self->_setSuggestionQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__SBSwitcherAppSuggestionViewController__setBestAppSuggestion_animationCompletion___block_invoke;
    v9[3] = &unk_1E6AF6A20;
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    id v11 = v7;
    dispatch_async(setSuggestionQueue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)endPausingSuggestionUpdatesForReason:(id)a3
{
  [(NSMutableSet *)self->_pauseSuggestionUpdateReasons removeObject:a3];
  [(SBSwitcherAppSuggestionViewController *)self _evaluateSuggestionQueueSuspension];
}

- (void)_setSuggestionQueueSuspended:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_suggestionQueueSuspended != a3)
  {
    self->_suggestionQueueSuspended = a3;
    setSuggestionQueue = self->_setSuggestionQueue;
    if (a3)
    {
      dispatch_suspend(setSuggestionQueue);
      v5 = SBLogCommon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        pauseSuggestionUpdateReasons = self->_pauseSuggestionUpdateReasons;
        int v10 = 138412290;
        id v11 = pauseSuggestionUpdateReasons;
        id v7 = "App suggestion queue is now suspended for reasons: %@";
        v8 = v5;
        uint32_t v9 = 12;
LABEL_7:
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
      }
    }
    else
    {
      dispatch_resume(setSuggestionQueue);
      v5 = SBLogCommon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        id v7 = "App suggestion queue is no longer suspended";
        v8 = v5;
        uint32_t v9 = 2;
        goto LABEL_7;
      }
    }
  }
}

- (void)_evaluateSuggestionQueueSuspension
{
  BOOL v3 = [(NSMutableSet *)self->_pauseSuggestionUpdateReasons count] != 0;
  [(SBSwitcherAppSuggestionViewController *)self _setSuggestionQueueSuspended:v3];
}

- (void)dealloc
{
  [(NSMutableSet *)self->_pauseSuggestionUpdateReasons removeAllObjects];
  [(SBSwitcherAppSuggestionViewController *)self _evaluateSuggestionQueueSuspension];
  v3.receiver = self;
  v3.super_class = (Class)SBSwitcherAppSuggestionViewController;
  [(SBSwitcherAppSuggestionViewController *)&v3 dealloc];
}

- (void)beginPausingSuggestionUpdatesForReason:(id)a3
{
  [(NSMutableSet *)self->_pauseSuggestionUpdateReasons addObject:a3];
  [(SBSwitcherAppSuggestionViewController *)self _evaluateSuggestionQueueSuspension];
}

void __83__SBSwitcherAppSuggestionViewController__setBestAppSuggestion_animationCompletion___block_invoke(id *a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__SBSwitcherAppSuggestionViewController__setBestAppSuggestion_animationCompletion___block_invoke_2;
  block[3] = &unk_1E6AF6A20;
  objc_copyWeak(&v5, a1 + 6);
  id v3 = a1[4];
  id v4 = a1[5];
  dispatch_sync(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v5);
}

void __83__SBSwitcherAppSuggestionViewController__setBestAppSuggestion_animationCompletion___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 122, *(id *)(a1 + 32));
    [v3 _updateBottomBannerWithCompletion:*(void *)(a1 + 40)];
    WeakRetained = v3;
  }
}

- (SBSwitcherAppSuggestionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SBSwitcherAppSuggestionViewController;
  id v4 = [(SBSwitcherAppSuggestionViewController *)&v10 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    setSuggestionQueue = v4->_setSuggestionQueue;
    v4->_setSuggestionQueue = (OS_dispatch_queue *)Serial;

    id v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pauseSuggestionUpdateReasons = v4->_pauseSuggestionUpdateReasons;
    v4->_pauseSuggestionUpdateReasons = v7;
  }
  return v4;
}

- (void)loadView
{
  id v3 = [SBSwitcherAppSuggestionContentView alloc];
  id v4 = -[SBSwitcherAppSuggestionContentView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(SBSwitcherAppSuggestionViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)SBSwitcherAppSuggestionViewController;
  [(SBSwitcherAppSuggestionViewController *)&v7 viewDidLoad];
  id v3 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleBannerTap_];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v3;

  id v5 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:self action:sel__handleLongPress_];
  longPressGestureRecognizer = self->_longPressGestureRecognizer;
  self->_longPressGestureRecognizer = v5;

  [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer setMinimumPressDuration:0.12];
}

- (void)viewWillLayoutSubviews
{
  if (!self->_presentingOrDismissingBanner)
  {
    if (self->_showSuggestions && self->_bestAppSuggestion)
    {
      bannerView = self->_bannerView;
      [(SBSwitcherAppSuggestionViewController *)self _idleOnscreenRectForBottomBanner];
    }
    else
    {
      bannerView = self->_bannerView;
      [(SBSwitcherAppSuggestionViewController *)self _offscreenRectForBottomBanner];
    }
    -[SBSwitcherAppSuggestionBannerView setFrame:](bannerView, "setFrame:");
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBSwitcherAppSuggestionViewController;
  -[SBSwitcherAppSuggestionViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_);
  if (!a3) {
    self->_presentingOrDismissingBanner = 0;
  }
}

- (CGRect)_offscreenRectForBottomBanner
{
  [(SBSwitcherAppSuggestionViewController *)self _idleOnscreenRectForBottomBanner];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  uint32_t v9 = [(SBSwitcherAppSuggestionViewController *)self view];
  [v9 bounds];
  CGFloat MaxY = CGRectGetMaxY(v15);

  double v11 = v4;
  double v12 = MaxY;
  double v13 = v6;
  double v14 = v8;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_idleOnscreenRectForBottomBanner
{
  if ([(SBSwitcherAppSuggestionViewController *)self _bannerStyle])
  {
    if (__sb__runningInSpringBoard())
    {
      if (!SBFEffectiveDeviceClass() || (double v3 = 14.0, SBFEffectiveDeviceClass() == 1))
      {
        if (SBFEffectiveHomeButtonType() == 2) {
          double v3 = 21.0;
        }
        else {
          double v3 = 14.0;
        }
      }
    }
    else
    {
      double v4 = [MEMORY[0x1E4F42948] currentDevice];
      double v3 = 14.0;
      if (![v4 userInterfaceIdiom])
      {
        if (SBFEffectiveHomeButtonType() == 2) {
          double v3 = 21.0;
        }
        else {
          double v3 = 14.0;
        }
      }
    }
  }
  else
  {
    double v3 = 7.0;
  }
  unint64_t v5 = [(SBSwitcherAppSuggestionViewController *)self _bannerStyle];
  int v6 = __sb__runningInSpringBoard();
  if (v5)
  {
    if (v6)
    {
      if (!SBFEffectiveDeviceClass() || (double v7 = 14.0, SBFEffectiveDeviceClass() == 1))
      {
        if (SBFEffectiveHomeButtonType() == 2) {
          double v7 = 21.0;
        }
        else {
          double v7 = 14.0;
        }
      }
      goto LABEL_36;
    }
    double v8 = [MEMORY[0x1E4F42948] currentDevice];
    double v7 = 14.0;
    if (![v8 userInterfaceIdiom])
    {
      if (SBFEffectiveHomeButtonType() == 2) {
        double v7 = 21.0;
      }
      else {
        double v7 = 14.0;
      }
    }
LABEL_35:

    goto LABEL_36;
  }
  if (!v6)
  {
    double v8 = [MEMORY[0x1E4F42948] currentDevice];
    double v7 = 14.0;
    if (![v8 userInterfaceIdiom])
    {
      if (SBFEffectiveHomeButtonType() == 2) {
        double v7 = 58.0;
      }
      else {
        double v7 = 14.0;
      }
    }
    goto LABEL_35;
  }
  if (!SBFEffectiveDeviceClass() || (double v7 = 14.0, SBFEffectiveDeviceClass() == 1))
  {
    if (SBFEffectiveHomeButtonType() == 2) {
      double v7 = 58.0;
    }
    else {
      double v7 = 14.0;
    }
  }
LABEL_36:
  uint32_t v9 = [(SBSwitcherAppSuggestionViewController *)self view];
  [v9 bounds];
  CGFloat v10 = CGRectGetMaxY(v17) + -40.0 - v3;
  double v11 = [(SBSwitcherAppSuggestionViewController *)self view];
  [v11 bounds];
  CGFloat v12 = CGRectGetWidth(v18) + v7 * -2.0;

  double v13 = 40.0;
  double v14 = v7;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_updateBottomBannerWithCompletion:(id)a3
{
  double v4 = (void (**)(id, void))a3;
  bannerView = self->_bannerView;
  double v11 = v4;
  if (!self->_showSuggestions)
  {
    if (bannerView)
    {
      -[SBSwitcherAppSuggestionViewController _animateOutAndRemoveCurrentBottomBannerWithCompletion:](self, "_animateOutAndRemoveCurrentBottomBannerWithCompletion:");
      goto LABEL_17;
    }
    goto LABEL_7;
  }
  if (!bannerView)
  {
    bestAppSuggestion = self->_bestAppSuggestion;
    if (bestAppSuggestion)
    {
LABEL_16:
      [(SBSwitcherAppSuggestionViewController *)self _insertAndAnimateInBottomBannerForSuggestion:bestAppSuggestion completion:v11];
      goto LABEL_17;
    }
  }
  int v6 = [(SBSwitcherAppSuggestionBannerView *)bannerView representedAppSuggestion];
  char v7 = [v6 isEqual:self->_bestAppSuggestion];

  if ((v7 & 1) == 0)
  {
    uint32_t v9 = self->_bestAppSuggestion;
    if (v9) {
      CGFloat v10 = 0;
    }
    else {
      CGFloat v10 = v11;
    }
    [(SBSwitcherAppSuggestionViewController *)self _animateOutAndRemoveCurrentBottomBannerWithCompletion:v10];
    if (!v9) {
      goto LABEL_17;
    }
    bestAppSuggestion = self->_bestAppSuggestion;
    goto LABEL_16;
  }
  double v4 = v11;
LABEL_7:
  if (v4) {
    v4[2](v4, 0);
  }
LABEL_17:
  MEMORY[0x1F4181820]();
}

- (unint64_t)_bannerStyle
{
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2) {
      return 1;
    }
  }
  else
  {
    double v3 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 == 1) {
      return 1;
    }
  }
  unint64_t v5 = [(SBSwitcherAppSuggestionViewController *)self delegate];
  uint64_t v6 = [v5 orientationForSuggestionViewController:self];

  return (unint64_t)(v6 - 5) <= 0xFFFFFFFFFFFFFFFDLL;
}

- (void)_insertAndAnimateInBottomBannerForSuggestion:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self->_bannerView)
  {
    CGRect v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SBSwitcherAppSuggestionViewController.m" lineNumber:211 description:@"Can't insert app suggestion banner if we already have one"];
  }
  self->_presentingOrDismissingBanner = 1;
  if (SBReduceMotion()) {
    [(SBSwitcherAppSuggestionViewController *)self _idleOnscreenRectForBottomBanner];
  }
  else {
    [(SBSwitcherAppSuggestionViewController *)self _offscreenRectForBottomBanner];
  }
  double v13 = -[SBSwitcherAppSuggestionBannerView initWithFrame:appSuggestion:style:]([SBSwitcherAppSuggestionBannerView alloc], "initWithFrame:appSuggestion:style:", v7, [(SBSwitcherAppSuggestionViewController *)self _bannerStyle], v9, v10, v11, v12);
  bannerView = self->_bannerView;
  self->_bannerView = v13;

  [(SBSwitcherAppSuggestionBannerView *)self->_bannerView addGestureRecognizer:self->_tapGestureRecognizer];
  [(SBSwitcherAppSuggestionBannerView *)self->_bannerView addGestureRecognizer:self->_longPressGestureRecognizer];
  double v15 = [(SBSwitcherAppSuggestionViewController *)self view];
  [v15 addSubview:self->_bannerView];

  [(SBSwitcherAppSuggestionBannerView *)self->_bannerView layoutIfNeeded];
  if (SBReduceMotion()) {
    [(SBSwitcherAppSuggestionBannerView *)self->_bannerView setAlpha:0.0];
  }
  double v16 = (void *)MEMORY[0x1E4F42FF0];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __97__SBSwitcherAppSuggestionViewController__insertAndAnimateInBottomBannerForSuggestion_completion___block_invoke;
  v21[3] = &unk_1E6AF4AC0;
  v21[4] = self;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __97__SBSwitcherAppSuggestionViewController__insertAndAnimateInBottomBannerForSuggestion_completion___block_invoke_3;
  v19[3] = &unk_1E6AF5AA0;
  v19[4] = self;
  id v20 = v8;
  id v17 = v8;
  [v16 _animateUsingDefaultTimingWithOptions:0 animations:v21 completion:v19];
}

uint64_t __97__SBSwitcherAppSuggestionViewController__insertAndAnimateInBottomBannerForSuggestion_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __97__SBSwitcherAppSuggestionViewController__insertAndAnimateInBottomBannerForSuggestion_completion___block_invoke_2;
  v4[3] = &unk_1E6AF4AC0;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114118, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __97__SBSwitcherAppSuggestionViewController__insertAndAnimateInBottomBannerForSuggestion_completion___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  double v3 = (void *)v2[124];
  [v2 _idleOnscreenRectForBottomBanner];
  objc_msgSend(v3, "setFrame:");
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 992);
  return [v4 setAlpha:1.0];
}

uint64_t __97__SBSwitcherAppSuggestionViewController__insertAndAnimateInBottomBannerForSuggestion_completion___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1016) = 0;
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_animateOutAndRemoveCurrentBottomBannerWithCompletion:(id)a3
{
  id v4 = a3;
  CAFrameRateRange v5 = self->_bannerView;
  [(SBSwitcherAppSuggestionBannerView *)v5 removeGestureRecognizer:self->_tapGestureRecognizer];
  [(SBSwitcherAppSuggestionBannerView *)v5 removeGestureRecognizer:self->_longPressGestureRecognizer];
  self->_presentingOrDismissingBanner = 1;
  uint64_t v6 = (void *)MEMORY[0x1E4F42FF0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__SBSwitcherAppSuggestionViewController__animateOutAndRemoveCurrentBottomBannerWithCompletion___block_invoke;
  v14[3] = &unk_1E6AF5290;
  v14[4] = self;
  double v15 = v5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__SBSwitcherAppSuggestionViewController__animateOutAndRemoveCurrentBottomBannerWithCompletion___block_invoke_3;
  v10[3] = &unk_1E6AFA2A0;
  double v11 = v15;
  double v12 = self;
  id v13 = v4;
  id v7 = v4;
  id v8 = v15;
  [v6 _animateUsingDefaultTimingWithOptions:4 animations:v14 completion:v10];
  bannerView = self->_bannerView;
  self->_bannerView = 0;
}

void __95__SBSwitcherAppSuggestionViewController__animateOutAndRemoveCurrentBottomBannerWithCompletion___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v12.minimum;
  float maximum = v12.maximum;
  float preferred = v12.preferred;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__SBSwitcherAppSuggestionViewController__animateOutAndRemoveCurrentBottomBannerWithCompletion___block_invoke_2;
  v10[3] = &unk_1E6AF5290;
  uint64_t v6 = *(void **)(a1 + 40);
  void v10[4] = *(void *)(a1 + 32);
  id v11 = v6;
  *(float *)&double v7 = minimum;
  *(float *)&double v8 = maximum;
  *(float *)&double v9 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114118, v10, v7, v8, v9);
}

uint64_t __95__SBSwitcherAppSuggestionViewController__animateOutAndRemoveCurrentBottomBannerWithCompletion___block_invoke_2(uint64_t a1)
{
  BOOL v2 = SBReduceMotion();
  double v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 _idleOnscreenRectForBottomBanner];
  }
  else {
    [v3 _offscreenRectForBottomBanner];
  }
  objc_msgSend(*(id *)(a1 + 40), "setFrame:");
  uint64_t result = SBReduceMotion();
  if (result)
  {
    CAFrameRateRange v5 = *(void **)(a1 + 40);
    return [v5 setAlpha:0.0];
  }
  return result;
}

uint64_t __95__SBSwitcherAppSuggestionViewController__animateOutAndRemoveCurrentBottomBannerWithCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  *(unsigned char *)(*(void *)(a1 + 40) + 1016) = 0;
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_handleBannerTap:(id)a3
{
  if ([a3 state] == 3)
  {
    [(SBSwitcherAppSuggestionViewController *)self _activateBestAppSuggestion];
  }
}

- (void)_handleLongPress:(id)a3
{
  id v15 = a3;
  [(SBSwitcherAppSuggestionBannerView *)self->_bannerView bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v15 locationInView:self->_bannerView];
  v17.x = v12;
  v17.y = v13;
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  BOOL v14 = CGRectContainsPoint(v18, v17);
  if ([v15 state] == 1)
  {
    [(UITapGestureRecognizer *)self->_tapGestureRecognizer setEnabled:0];
    BOOL v14 = 1;
    [(UITapGestureRecognizer *)self->_tapGestureRecognizer setEnabled:1];
    goto LABEL_10;
  }
  if ([v15 state] == 3)
  {
    if (!v14) {
      goto LABEL_10;
    }
    [(SBSwitcherAppSuggestionViewController *)self _activateBestAppSuggestion];
  }
  else if ([v15 state] != 4)
  {
    if ([v15 state] == 2) {
      goto LABEL_10;
    }
    [v15 state];
  }
  BOOL v14 = 0;
LABEL_10:
  [(SBSwitcherAppSuggestionBannerView *)self->_bannerView setHighlighted:v14];
}

- (void)_activateBestAppSuggestion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained suggestionViewController:self activatedSuggestion:self->_bestAppSuggestion];
}

- (BOOL)_hasSuggestionBannerView
{
  return self->_bannerView != 0;
}

- (void)_activateCurrentSuggestion
{
  if (self->_bannerView) {
    [(SBSwitcherAppSuggestionViewController *)self _activateBestAppSuggestion];
  }
}

- (BOOL)showSuggestions
{
  return self->_showSuggestions;
}

- (BOOL)_isSuggestionQueueSuspended
{
  return self->_suggestionQueueSuspended;
}

- (SBSwitcherAppSuggestionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSwitcherAppSuggestionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pauseSuggestionUpdateReasons, 0);
  objc_storeStrong((id *)&self->_setSuggestionQueue, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_bestAppSuggestion, 0);
}

@end