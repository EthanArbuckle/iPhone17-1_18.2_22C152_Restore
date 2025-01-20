@interface _UIDocumentLaunchViewController
- (BOOL)_isParentViewControllerDisappearedOrAppearing;
- (UIEdgeInsets)_minimumLayoutMarginsForView;
- (double)transitionDuration:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)interruptibleAnimatorForTransition:(id)a3;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)_dismissBrowserViewController;
- (void)_firstResponderDidChange:(id)a3;
- (void)_prepareDocumentAnimationInfoWithCompletion:(uint64_t *)a1;
- (void)_presentBrowserViewController;
- (void)_updateParentNavigationBarVisibility:(void *)a1;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)browserPresentationControllerDidInvalidateSheetDetentValues:(id)a3;
- (void)browserPresentationControllerDidInvalidateUntransformedFrame:(id)a3;
- (void)browserPresentationControllerDismissalTransitionDidEnd:(id)a3;
- (void)browserPresentationControllerDismissalTransitionWillBegin:(id)a3;
- (void)browserPresentationControllerPerformLayout:(id)a3;
- (void)browserPresentationControllerPresentationTransitionDidEnd:(id)a3;
- (void)browserPresentationControllerPresentationTransitionWillBegin:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)initWithConfiguration:(void *)a1;
- (void)loadView;
- (void)setConfiguration:(uint64_t)a1;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewLayoutMarginsDidChange;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillLayoutSubviews;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation _UIDocumentLaunchViewController

- (void)initWithConfiguration:(void *)a1
{
  v2 = a1;
  if (a1)
  {
    if (!a2)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel_initWithConfiguration_, v2, @"_UIDocumentLaunchViewController.m", 88, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
    }
    v7.receiver = v2;
    v7.super_class = (Class)_UIDocumentLaunchViewController;
    id v4 = objc_msgSendSuper2(&v7, sel_init);
    v2 = v4;
    if (v4)
    {
      -[_UIDocumentLaunchViewController setConfiguration:]((uint64_t)v4, a2);
      [v2 setDefinesPresentationContext:1];
    }
  }
  return v2;
}

- (void)setConfiguration:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = obj;
    if (!obj)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:sel_setConfiguration_, a1, @"_UIDocumentLaunchViewController.m", 98, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
    }
    objc_storeStrong((id *)(a1 + 1104), (id)v2);
    *(unsigned char *)(a1 + 1096) |= 0x10u;
    id v4 = [(id)a1 view];
    [v4 setNeedsLayout];

    if (v2)
    {
      int v5 = *(unsigned char *)(a1 + 1096) & 1;
      if (*(unsigned char *)(v2 + 8))
      {
        unint64_t v6 = *(void *)(v2 + 32);
        uint64_t v7 = (v6 >> 3) & 1;
        if ((*(unsigned char *)(a1 + 1096) & 1) == 0) {
          LODWORD(v7) = 0;
        }
        if (v6) {
          uint64_t v2 = v7;
        }
        else {
          uint64_t v2 = 1;
        }
      }
      else
      {
        uint64_t v2 = 0;
      }
    }
    else
    {
      int v5 = *(unsigned char *)(a1 + 1096) & 1;
    }
    v8 = [(id)a1 view];
    [v8 setUserInteractionEnabled:v2];

    id v19 = [(id)a1 parentViewController];
    v9 = [(id)a1 view];
    v10 = [v9 superview];
    v11 = [v19 view];

    if (v10 != v11)
    {
      v12 = [v19 view];
      v13 = [(id)a1 view];
      v14 = [v19 view];
      v15 = -[UIView _backing_clientLayer](v14);
      if (v12) {
        -[UIView _backing_addPrivateSubview:positioned:relativeTo:]((uint64_t)v12, v13, -2, (uint64_t)v15);
      }
    }
    if ((((v5 == 0) ^ v2) & 1) == 0)
    {
      *(unsigned char *)(a1 + 1096) = *(unsigned char *)(a1 + 1096) & 0xFE | v2;
      v16 = [(id)a1 _window];
      if (v16)
      {
        char v17 = *(unsigned char *)(a1 + 1096);

        if ((v17 & 8) == 0)
        {
          if (v2) {
            -[_UIDocumentLaunchViewController _presentBrowserViewController](a1);
          }
          else {
            -[_UIDocumentLaunchViewController _dismissBrowserViewController](a1);
          }
        }
      }
    }
  }
}

- (void)_presentBrowserViewController
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 1024);
    v3 = *(void **)(a1 + 1104);
    if (v3) {
      v3 = (void *)v3[6];
    }
    id v4 = v3;
    int v5 = [v4 presentationController];
    unint64_t v6 = [v5 delegate];
    [v2 setDelegate:v6];

    [v4 _setOverrideTransitioningDelegate:a1];
    [v4 _setOverrideUseCustomPresentation:1];
    id v7 = [v4 presentationController];

    if (v7 != v2)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      v10 = [v4 presentationController];
      [v9 handleFailureInMethod:sel__presentBrowserViewController, a1, @"_UIDocumentLaunchViewController.m", 515, @"Attempted to present browser view controller with an unexpected presentation controller: %@", v10 object file lineNumber description];
    }
    v8 = _UIDocumentUnavailableBrowserViewController(*(void *)(a1 + 1104));
    [v8 _prepareForPresentingInUIPDocumentLanding];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64___UIDocumentLaunchViewController__presentBrowserViewController__block_invoke;
    v11[3] = &unk_1E52D9F70;
    v11[4] = a1;
    +[UIView performWithoutAnimation:v11];
    [*(id *)(a1 + 1016) presentViewController:v4 animated:1 completion:0];
    v11[5] = MEMORY[0x1E4F143A8];
    v11[6] = 3221225472;
    v11[7] = ___uip_documentBrowser_sendAnalyticsEvent_block_invoke;
    v11[8] = &__block_descriptor_40_e19___NSDictionary_8__0l;
    v11[9] = 1;
    AnalyticsSendEventLazy();
  }
}

- (void)_dismissBrowserViewController
{
  if (a1)
  {
    id v2 = *(void **)(a1 + 1104);
    if (v2) {
      id v2 = (void *)v2[6];
    }
    v3 = v2;
    id v4 = [v3 presentingViewController];

    if (v4)
    {
      id v5 = *(id *)(a1 + 1016);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __64___UIDocumentLaunchViewController__dismissBrowserViewController__block_invoke;
      v9[3] = &unk_1E52D9F70;
      id v10 = v5;
      id v6 = v5;
      -[_UIDocumentLaunchViewController _prepareDocumentAnimationInfoWithCompletion:]((uint64_t *)a1, (uint64_t)v9);
    }
    else
    {
      [v3 _cancelDelayedPresentation:0];
      BOOL isParentViewControllerDisappearedOr = -[_UIDocumentLaunchViewController _isParentViewControllerDisappearedOrAppearing]((void *)a1);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __64___UIDocumentLaunchViewController__dismissBrowserViewController__block_invoke_3;
      v8[3] = &unk_1E52D9F70;
      v8[4] = a1;
      +[UIView conditionallyAnimate:!isParentViewControllerDisappearedOr withAnimation:&__block_literal_global_557 layout:v8 completion:0];
    }
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = ___uip_documentBrowser_sendAnalyticsEvent_block_invoke;
    v14 = &__block_descriptor_40_e19___NSDictionary_8__0l;
    uint64_t v15 = 2;
    AnalyticsSendEventLazy();
  }
}

- (void)browserPresentationControllerDidInvalidateSheetDetentValues:(id)a3
{
  id v3 = [(UIViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)browserPresentationControllerDidInvalidateUntransformedFrame:(id)a3
{
  id v3 = [(UIViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)browserPresentationControllerPerformLayout:(id)a3
{
  id v3 = [(UIViewController *)self view];
  [v3 layoutIfNeeded];
}

- (void)browserPresentationControllerPresentationTransitionWillBegin:(id)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  [(UIView *)self->_animationInteractionView setHidden:0];
}

- (void)browserPresentationControllerPresentationTransitionDidEnd:(id)a3
{
  *(unsigned char *)&self->_flags &= ~8u;
  [(UIView *)self->_animationInteractionView setHidden:1];
  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)&self->_flags &= ~4u;
  }
  else
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __93___UIDocumentLaunchViewController_browserPresentationControllerPresentationTransitionDidEnd___block_invoke;
    v4[3] = &unk_1E52DC308;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x1E4F14428], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)browserPresentationControllerDismissalTransitionWillBegin:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)&self->_flags |= 8u;
  [(UIView *)self->_animationInteractionView setHidden:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)&self->_flags |= 4u;
    id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIDocument", &browserPresentationControllerDismissalTransitionWillBegin____s_category)+ 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      configuration = self->_configuration;
      id v7 = v5;
      if (configuration) {
        browserViewController = configuration->_browserViewController;
      }
      else {
        browserViewController = 0;
      }
      v9 = browserViewController;
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "A visible UIDocumentBrowserViewController was asked to dismiss unexpectedly. Avoid calling -[UIViewController dismissViewControllerAnimated:completion:] when this browser view controller is used within a UIDocumentViewControllerLaunchOptions context. Browser view controller: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    [a3 _sendWillDismiss];
  }
}

- (void)browserPresentationControllerDismissalTransitionDidEnd:(id)a3
{
  *(unsigned char *)&self->_flags &= ~8u;
  [(UIView *)self->_animationInteractionView setHidden:1];
  if (*(unsigned char *)&self->_flags)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __90___UIDocumentLaunchViewController_browserPresentationControllerDismissalTransitionDidEnd___block_invoke;
    v5[3] = &unk_1E52DC308;
    objc_copyWeak(&v6, &location);
    dispatch_async(MEMORY[0x1E4F14428], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    *(unsigned char *)&self->_flags &= ~4u;
    [a3 _sendDidDismiss];
  }
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  configuration = self->_configuration;
  if (configuration) {
    configuration = (_UIDocumentUnavailableConfiguration *)configuration->_browserViewController;
  }
  v8 = configuration;

  if (v8 == a3) {
    v9 = self->_browserPresentationController;
  }
  else {
    v9 = 0;
  }
  return v9;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  configuration = self->_configuration;
  if (configuration) {
    configuration = (_UIDocumentUnavailableConfiguration *)configuration->_browserViewController;
  }
  v8 = configuration;

  if (v8 == a3)
  {
    *(unsigned char *)&self->_flags |= 2u;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)animationControllerForDismissedController:(id)a3
{
  configuration = self->_configuration;
  if (configuration) {
    configuration = (_UIDocumentUnavailableConfiguration *)configuration->_browserViewController;
  }
  id v6 = configuration;

  if (v6 == a3)
  {
    *(unsigned char *)&self->_flags &= ~2u;
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  id v5 = -[_UIDocumentLaunchViewController interruptibleAnimatorForTransition:](self, "interruptibleAnimatorForTransition:");
  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __53___UIDocumentLaunchViewController_animateTransition___block_invoke;
  uint64_t v12 = &unk_1E52DF708;
  objc_copyWeak(&v15, &location);
  id v13 = a3;
  id v6 = v5;
  id v14 = v6;
  id v7 = _Block_copy(&v9);
  v8 = v7;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    objc_msgSend(v6, "pauseAnimation", v9, v10, v11, v12, v13);
    -[_UIDocumentLaunchViewController _prepareDocumentAnimationInfoWithCompletion:]((uint64_t *)self, (uint64_t)v8);
  }
  else
  {
    (*((void (**)(void *))v7 + 2))(v7);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_prepareDocumentAnimationInfoWithCompletion:(uint64_t *)a1
{
  if (a1)
  {
    id v4 = _UIDocumentUnavailableBrowserViewController(a1[138]);
    id v5 = (void *)a1[138];
    if (v5) {
      id v5 = (void *)v5[3];
    }
    id v6 = v5;
    id v7 = v6;
    if (v4) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8) {
      goto LABEL_13;
    }
    uint64_t v9 = (void *)a1[138];
    if (v9) {
      uint64_t v9 = (void *)v9[10];
    }
    uint64_t v10 = v9;

    uint64_t v11 = a1[138];
    uint64_t v12 = v11 ? *(void *)(v11 + 32) & 4 : 0;
    if (_AXSReduceMotionEnabled()
      || (int v13 = _AXSReduceMotionReduceSlideTransitionsEnabled(), !v10)
      || v12
      || v13)
    {
LABEL_13:
      (*(void (**)(uint64_t))(a2 + 16))(a2);
    }
    else
    {
      objc_initWeak(&location, a1);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __79___UIDocumentLaunchViewController__prepareDocumentAnimationInfoWithCompletion___block_invoke;
      v14[3] = &unk_1E530A4B8;
      objc_copyWeak(&v15, &location);
      v14[4] = a2;
      [v4 _requestAnimationInfoForDocumentAtURL:v7 completion:v14];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  p_transitionAnimator = &self->_transitionAnimator;
  id v6 = self->_transitionAnimator;
  if (!v6)
  {
    id v7 = [[UISpringTimingParameters alloc] initWithDampingRatio:1.0 response:0.4];
    BOOL v8 = [UIViewPropertyAnimator alloc];
    [(_UIDocumentLaunchViewController *)self transitionDuration:a3];
    id v6 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v8, "initWithDuration:timingParameters:", v7);
    objc_storeStrong((id *)p_transitionAnimator, v6);
  }
  return v6;
}

- (void)animationEnded:(BOOL)a3
{
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    -[UIView setAlpha:](self->_backgroundView, "setAlpha:", a3, 0.0);
    [(UIView *)self->_contentContainerView setAlpha:0.0];
  }
  morphAnimation = self->_morphAnimation;
  self->_morphAnimation = 0;

  documentAnimationInfo = self->_documentAnimationInfo;
  self->_documentAnimationInfo = 0;

  transitionAnimator = self->_transitionAnimator;
  self->_transitionAnimator = 0;
}

- (void)_updateParentNavigationBarVisibility:(void *)a1
{
  if (!a1) {
    return;
  }
  id v7 = [a1 parentViewController];
  id v3 = [v7 navigationController];
  if (v3)
  {

LABEL_5:
    id v6 = [v7 navigationItem];
    [v6 _setPreferredNavigationBarVisibility:a2];

    goto LABEL_6;
  }
  id v4 = [v7 navigationItem];
  uint64_t v5 = [v4 _preferredNavigationBarVisibility];

  if (v5) {
    goto LABEL_5;
  }
LABEL_6:
}

- (BOOL)_isParentViewControllerDisappearedOrAppearing
{
  if (!a1) {
    return 0;
  }
  v1 = [a1 parentViewController];
  if (v1) {
    BOOL v2 = (v1[47] & 4) == 0;
  }
  else {
    BOOL v2 = 1;
  }

  return v2;
}

- (void)_firstResponderDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"UIWindowFirstResponderUserInfoKey"];

  id v6 = [(UIViewController *)self parentViewController];
  id v7 = [v6 childModalViewController];

  if (v5) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    configuration = self->_configuration;
    if (configuration)
    {
      uint64_t v10 = configuration->_browserViewController;
      uint64_t v11 = v5;
      if (v5 == v10) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v11 = v10;
    if (![(UIResponder *)v10 _containsResponder:v5])
    {
LABEL_9:

      goto LABEL_10;
    }
LABEL_8:
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60___UIDocumentLaunchViewController__firstResponderDidChange___block_invoke;
    v12[3] = &unk_1E52D9F98;
    int v13 = v5;
    id v14 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v12);

    uint64_t v10 = v11;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)loadView
{
  id v3 = objc_alloc_init(_UIDocumentLaunchView);
  [(UIViewController *)self setView:v3];

  id v4 = [(UIViewController *)self traitOverrides];
  [v4 setUserInterfaceLevel:0];

  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__firstResponderDidChange_ name:@"UIWindowFirstResponderDidChangeNotification" object:0];

  id v6 = [_UISystemBackgroundView alloc];
  id v7 = +[UIBackgroundConfiguration clearConfiguration];
  BOOL v8 = [(_UISystemBackgroundView *)v6 initWithConfiguration:v7];

  [(UIView *)v8 setAlpha:0.0];
  uint64_t v9 = [(UIViewController *)self view];
  [(_UISystemBackgroundView *)v8 frameInContainerView:v9];
  -[_UISystemBackgroundView setFrame:](v8, "setFrame:");

  [(UIView *)v8 setAutoresizingMask:18];
  uint64_t v10 = [(UIViewController *)self view];
  [v10 insertSubview:v8 atIndex:0];

  backgroundView = self->_backgroundView;
  self->_backgroundView = v8;
  v58 = v8;

  uint64_t v12 = [_UITouchPassthroughView alloc];
  int v13 = [(UIViewController *)self view];
  [v13 bounds];
  id v14 = -[UIView initWithFrame:](v12, "initWithFrame:");

  [(UIView *)v14 setAlpha:0.0];
  [(UIView *)v14 setAutoresizingMask:18];
  id v15 = [(UIViewController *)self view];
  [v15 addSubview:v14];

  contentContainerView = self->_contentContainerView;
  self->_contentContainerView = v14;
  char v17 = v14;

  v18 = [_UITouchPassthroughView alloc];
  [(UIView *)v17 bounds];
  id v19 = -[UIView initWithFrame:](v18, "initWithFrame:");
  [(UIView *)v19 setAutoresizingMask:18];
  [(UIView *)v19 _setSafeAreaInsetsFrozen:1];
  [(UIView *)v17 addSubview:v19];
  pageContainerView = self->_pageContainerView;
  self->_pageContainerView = v19;
  v21 = v19;

  v22 = [_UITouchPassthroughView alloc];
  [(UIView *)v21 bounds];
  v23 = -[UIView initWithFrame:](v22, "initWithFrame:");
  [(UIView *)v23 setAutoresizingMask:18];
  [(UIView *)v21 addSubview:v23];
  backgroundAccessoryContainerView = self->_backgroundAccessoryContainerView;
  self->_backgroundAccessoryContainerView = v23;
  v25 = v23;

  v26 = objc_alloc_init(_UIDocumentUnavailableTitlePageView);
  [(UIView *)v21 addSubview:v26];
  titleView = self->_titleView;
  self->_titleView = v26;
  v28 = v26;

  v29 = [_UITouchPassthroughView alloc];
  [(UIView *)v21 bounds];
  v30 = -[UIView initWithFrame:](v29, "initWithFrame:");
  [(UIView *)v30 setAutoresizingMask:18];
  [(UIView *)v21 addSubview:v30];
  foregroundAccessoryContainerView = self->_foregroundAccessoryContainerView;
  self->_foregroundAccessoryContainerView = v30;
  v32 = v30;

  v33 = objc_alloc_init(_UIDocumentUnavailableBrowserContainerViewController);
  [(UIView *)v17 bounds];
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  v42 = [(UIViewController *)v33 view];
  objc_msgSend(v42, "setFrame:", v35, v37, v39, v41);

  v43 = [(UIViewController *)v33 view];
  [(UIView *)v17 addSubview:v43];

  [(UIViewController *)self addChildViewController:v33];
  [(UIViewController *)v33 didMoveToParentViewController:self];
  browserContainerViewController = self->_browserContainerViewController;
  self->_browserContainerViewController = v33;
  v45 = v33;

  v46 = [UIView alloc];
  v47 = [(UIViewController *)self view];
  [v47 bounds];
  v48 = -[UIView initWithFrame:](v46, "initWithFrame:");

  [(UIView *)v48 setAutoresizingMask:18];
  v49 = [(UIView *)v48 layer];
  [v49 setHitTestsAsOpaque:1];

  [(UIView *)v48 setHidden:1];
  animationInteractionView = self->_animationInteractionView;
  self->_animationInteractionView = v48;
  v51 = v48;

  v52 = [(UIViewController *)self view];
  [v52 addSubview:v51];

  v53 = [_UIDocumentUnavailableBrowserPresentationController alloc];
  configuration = self->_configuration;
  if (configuration) {
    configuration = (_UIDocumentUnavailableConfiguration *)configuration->_browserViewController;
  }
  v55 = configuration;
  v56 = [(_UIDocumentUnavailableBrowserPresentationController *)v53 initWithPresentedViewController:v55 presentingViewController:v45];

  if (v56) {
    objc_storeWeak((id *)&v56->_browserDelegate, self);
  }
  browserPresentationController = self->_browserPresentationController;
  self->_browserPresentationController = v56;
}

- (void)viewWillLayoutSubviews
{
  v111.receiver = self;
  v111.super_class = (Class)_UIDocumentLaunchViewController;
  [(UIViewController *)&v111 viewWillLayoutSubviews];
  id v3 = &OBJC_IVAR____UICursorAccessoryView__accessoryIdentifiers;
  id v4 = &OBJC_IVAR____UICursorAccessoryView__accessoryIdentifiers;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *(unsigned char *)&self->_flags &= ~0x10u;
    uint64_t v5 = self->_configuration;
    id v6 = self->_titleView;
    if (v5) {
      unint64_t documentState = v5->_documentState;
    }
    else {
      LOBYTE(documentState) = 0;
    }
    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v113 = __64___UIDocumentLaunchViewController__updateTitleViewConfiguration__block_invoke;
    v114 = &unk_1E530A508;
    v115 = v5;
    uint64_t v116 = MEMORY[0x1E4F143A8];
    uint64_t v117 = 3221225472;
    v118 = (uint64_t (*)(uint64_t *, id))__64___UIDocumentLaunchViewController__updateTitleViewConfiguration__block_invoke_30;
    v119 = &unk_1E530A530;
    LOBYTE(v121) = (documentState & 2) != 0;
    BYTE1(v121) = (documentState & 4) != 0;
    v120 = v115;
    BOOL v8 = v115;
    uint64_t v9 = v8;
    if (v5)
    {
      id v10 = v8[8];
      uint64_t v11 = v113((uint64_t)v112, v10);
      -[_UIDocumentUnavailableTitlePageView setPrimaryAction:]((id *)&v6->super.super.super.super.isa, v11);

      id v12 = v9[9];
    }
    else
    {
      v100 = v113((uint64_t)v112, 0);
      -[_UIDocumentUnavailableTitlePageView setPrimaryAction:]((id *)&v6->super.super.super.super.isa, v100);

      id v12 = 0;
    }
    id v13 = v12;
    id v14 = v113((uint64_t)v112, v13);
    -[_UIDocumentUnavailableTitlePageView setSecondaryAction:]((id *)&v6->super.super.super.super.isa, v14);

    if (v5)
    {
      id v15 = v9[2];
      -[_UIDocumentUnavailableTitlePageView setSecondaryMenu:]((id *)&v6->super.super.super.super.isa, v15);

      id v16 = v9[7];
    }
    else
    {
      -[_UIDocumentUnavailableTitlePageView setSecondaryMenu:]((id *)&v6->super.super.super.super.isa, 0);
      id v16 = 0;
    }
    id v17 = v16;
    -[_UIDocumentUnavailableTitlePageView setTitle:]((id *)&v6->super.super.super.super.isa, v17);

    if (v5) {
      id v18 = v9[8];
    }
    else {
      id v18 = 0;
    }
    id v19 = v18;
    int v20 = v118(&v116, v19);
    if (v6 && v6->_hasPrimaryProgress != v20)
    {
      v6->_hasPrimaryProgress = v20;
      [(UIView *)v6 setNeedsLayout];
    }

    if (v5) {
      id v21 = v9[9];
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;
    int v23 = v118(&v116, v22);
    if (v6)
    {
      id v4 = &OBJC_IVAR____UICursorAccessoryView__accessoryIdentifiers;
      if (v6->_hasSecondaryProgress != v23)
      {
        v6->_hasSecondaryProgress = v23;
        [(UIView *)v6 setNeedsLayout];
      }

      BOOL v24 = (documentState & 3) == 0;
      if (v6->_actionsEnabled != v24)
      {
        v6->_actionsEnabled = v24;
        [(UIView *)v6 setNeedsLayout];
      }
    }
    else
    {

      id v4 = &OBJC_IVAR____UICursorAccessoryView__accessoryIdentifiers;
    }

    id v3 = &OBJC_IVAR____UICursorAccessoryView__accessoryIdentifiers;
    v25 = self->_configuration;
    v26 = v25;
    if (v25)
    {
      v27 = v25->_backgroundAccessoryView;
      foregroundAccessoryView = v26->_foregroundAccessoryView;
    }
    else
    {
      v27 = 0;
      foregroundAccessoryView = 0;
    }
    id v29 = foregroundAccessoryView;
    if (!((unint64_t)v27 | (unint64_t)v29))
    {
      v27 = (_UIDocumentUnavailablePageBackgroundAccessoryView *)objc_retain(*(id *)((char *)&self->super.super.super.isa
                                                                                   + v4[793]));
      if (!v27)
      {
        v27 = objc_alloc_init(_UIDocumentUnavailablePageBackgroundAccessoryView);
        objc_storeStrong((id *)((char *)&self->super.super.super.isa + v4[793]), v27);
      }
    }
    backgroundAccessoryView = self->_backgroundAccessoryView;
    if (backgroundAccessoryView != (UIView *)v27)
    {
      [(UIView *)backgroundAccessoryView removeFromSuperview];
      objc_storeStrong((id *)&self->_backgroundAccessoryView, v27);
    }
    v31 = self->_foregroundAccessoryView;
    if (v31 != v29)
    {
      [(UIView *)v31 removeFromSuperview];
      objc_storeStrong((id *)&self->_foregroundAccessoryView, foregroundAccessoryView);
    }
  }
  v32 = self->_backgroundView;
  configuration = self->_configuration;
  if (configuration) {
    configuration = (_UIDocumentUnavailableConfiguration *)configuration->_background;
  }
  double v34 = configuration;
  int v35 = [(_UIDocumentUnavailableConfiguration *)v34 _hasBackgroundFill];

  if (v35)
  {
    double v36 = *(Class *)((char *)&self->super.super.super.isa + v3[780]);
    if (v36) {
      double v36 = (void *)v36[11];
    }
    double v37 = v36;
    [(_UISystemBackgroundView *)v32 setConfiguration:v37];

    double v38 = +[UIColor clearColor];
    [(UIView *)v32 setBackgroundColor:v38];
  }
  else
  {
    double v38 = +[UIBackgroundConfiguration clearConfiguration];
    double v39 = +[UIColor quaternarySystemFillColor];
    [v38 setBackgroundColor:v39];

    [(_UISystemBackgroundView *)v32 setConfiguration:v38];
    double v40 = +[UIColor systemBackgroundColor];
    [(UIView *)v32 setBackgroundColor:v40];
  }
  double v41 = [(UIViewController *)self view];
  [(_UISystemBackgroundView *)v32 frameInContainerView:v41];
  -[_UISystemBackgroundView setFrame:](v32, "setFrame:");

  v42 = [(UIViewController *)self view];
  [v42 bounds];
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  CGFloat v50 = v49;

  v51 = [(UIViewController *)self view];
  [v51 layoutMargins];
  double v53 = v52;
  double v55 = v54;
  double v101 = v57;
  double v102 = v56;

  v58 = [(UIViewController *)self view];
  [v58 safeAreaInsets];
  uint64_t v105 = v60;
  v106 = v59;
  double v107 = v61;
  uint64_t v104 = v62;

  v63 = [(UIViewController *)self traitCollection];
  uint64_t v64 = [v63 horizontalSizeClass];

  v65 = [(UIViewController *)self traitCollection];
  uint64_t v66 = [v65 verticalSizeClass];

  v67 = _UIDocumentUnavailableBrowserViewController(*(uint64_t *)((char *)&self->super.super.super.isa + v3[780]));
  [v67 defaultDocumentAspectRatio];
  double v69 = v68;

  double v70 = v44;
  v129.origin.x = v44;
  double v109 = v48;
  double v110 = v46;
  v129.origin.y = v46;
  v129.size.width = v48;
  double rect = v50;
  v129.size.height = v50;
  double Width = CGRectGetWidth(v129);
  if (v64 == 1) {
    double v72 = 36.0;
  }
  else {
    double v72 = 72.0;
  }
  if (v64 == 1) {
    double v73 = 36.0;
  }
  else {
    double v73 = 56.0;
  }
  double v74 = Width - v55 - v101 - (v72 + v72);
  double v75 = v74;
  if (v64 != 1)
  {
    double v76 = v69 * 200.0 + 600.0;
    if (v69 <= 0.0) {
      double v76 = 733.333333;
    }
    if (v74 >= v76) {
      double v75 = v76;
    }
    else {
      double v75 = v74;
    }
  }
  v130.origin.x = v70;
  v130.size.width = v109;
  v130.origin.y = v110;
  v130.size.height = rect;
  double v77 = CGRectGetHeight(v130) - v53 - v102 - (v73 + v73);
  v78 = [(UIViewController *)self view];
  [v78 _currentScreenScale];
  double v80 = UIRectRoundToScale(v55 + v72 + (v74 - v75) * 0.5, v53 + v73, v75, v77, v79);
  CGFloat v82 = v81;
  double v84 = v83;
  double v86 = v85;

  double v87 = -[_UIDocumentUnavailableBrowserPresentationController smallestDetentValue](self->_browserPresentationController);
  double v103 = v87;
  if (v66 == 2)
  {
    double v88 = v87;
    v131.origin.x = v70;
    v131.size.width = v109;
    v131.origin.y = v110;
    v131.size.height = rect;
    CGFloat v89 = CGRectGetHeight(v131) - v88 - v107;
    v132.origin.x = v80;
    v132.origin.y = v82;
    v132.size.width = v84;
    v132.size.height = v86;
    double v90 = fmax(CGRectGetMaxY(v132) - v89, 0.0);
  }
  else
  {
    double v90 = 0.0;
  }
  v91 = self->_titleView;
  v133.origin.x = v80;
  v133.origin.y = v82;
  v133.size.width = v84;
  v133.size.height = v86;
  double MidX = CGRectGetMidX(v133);
  v134.origin.x = v80;
  v134.origin.y = v82;
  v134.size.width = v84;
  v134.size.height = v86;
  -[UIView setCenter:](v91, "setCenter:", MidX, CGRectGetMidY(v134));
  -[UIView setBounds:](v91, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v84, v86);
  if (v91 && vabdd_f64(v91->_bottomInset, v90) > 2.22044605e-16)
  {
    v91->_bottomInset = v90;
    [(UIView *)v91 setNeedsLayout];
  }
  v93 = *(double **)((char *)&self->super.super.super.isa + v4[793]);
  if (v93)
  {
    if (v93[54] != v84 || v93[55] != v86)
    {
      v93[54] = v84;
      v93[55] = v86;
      [v93 setNeedsLayout];
    }
  }
  uint64_t v116 = MEMORY[0x1E4F143A8];
  uint64_t v117 = 3221225472;
  v118 = (uint64_t (*)(uint64_t *, id))__54___UIDocumentLaunchViewController__layoutContentViews__block_invoke;
  v119 = &__block_descriptor_104_e27_v24__0__UIView_8__UIView_16l;
  v120 = v106;
  uint64_t v121 = v105;
  double v122 = v107;
  uint64_t v123 = v104;
  double v124 = v80;
  CGFloat v125 = v82;
  double v126 = v84;
  double v127 = v86;
  double v128 = v103;
  v135.origin.x = v70;
  v135.origin.y = v110;
  v135.size.width = v109;
  v135.size.height = rect;
  double Height = CGRectGetHeight(v135);
  [(UISheetPresentationController *)self->_browserPresentationController _currentPresentedViewFrame];
  double MinY = CGRectGetMinY(v136);
  if (vabdd_f64(Height, MinY) <= 2.22044605e-16) {
    double v97 = v107 + v103;
  }
  else {
    double v97 = Height - MinY;
  }
  double v98 = (v107 + v103 - v97) / 3.5;
  v137.origin.x = v70;
  v137.origin.y = v110;
  v137.size.width = v109;
  v137.size.height = rect;
  double v99 = CGRectGetMidX(v137);
  v138.origin.x = v70;
  v138.origin.y = v110;
  v138.size.width = v109;
  v138.size.height = rect;
  -[UIView setCenter:](self->_pageContainerView, "setCenter:", v99, CGRectGetMidY(v138) + v98);
  -[UIView setBounds:](self->_pageContainerView, "setBounds:", v70, v110, v109, rect);
  ((void (*)(uint64_t *, UIView *, _UITouchPassthroughView *))v118)(&v116, self->_backgroundAccessoryView, self->_backgroundAccessoryContainerView);
  ((void (*)(uint64_t *, UIView *, _UITouchPassthroughView *))v118)(&v116, self->_foregroundAccessoryView, self->_foregroundAccessoryContainerView);
}

- (void)viewLayoutMarginsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentLaunchViewController;
  [(UIViewController *)&v4 viewLayoutMarginsDidChange];
  id v3 = [(UIViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)viewSafeAreaInsetsDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDocumentLaunchViewController;
  [(UIViewController *)&v6 viewSafeAreaInsetsDidChange];
  id v3 = self->_pageContainerView;
  uint64_t v4 = [(UIView *)v3 _safeAreaInsetsFrozen];
  [(UIView *)v3 _setSafeAreaInsetsFrozen:0];
  uint64_t v5 = [(UIViewController *)self view];
  [v5 safeAreaInsets];
  -[UIView setSafeAreaInsets:](v3, "setSafeAreaInsets:");

  [(UIView *)v3 _setSafeAreaInsetsFrozen:v4];
}

- (void)willMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDocumentLaunchViewController;
  -[UIViewController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_);
  id v5 = [(UIViewController *)self parentViewController];

  if (v5 != a3) {
    -[_UIDocumentLaunchViewController _updateParentNavigationBarVisibility:](self, 0);
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentLaunchViewController;
  -[UIViewController didMoveToParentViewController:](&v9, sel_didMoveToParentViewController_);
  if (!a3)
  {
    configuration = self->_configuration;
    if (configuration) {
      configuration = (_UIDocumentUnavailableConfiguration *)configuration->_browserViewController;
    }
    objc_super v6 = configuration;
    id v7 = [(_UIDocumentUnavailableConfiguration *)v6 _overrideTransitioningDelegate];

    if (v7 == self)
    {
      [(_UIDocumentUnavailableConfiguration *)v6 _setOverrideTransitioningDelegate:0];
      [(_UIDocumentUnavailableConfiguration *)v6 _setOverrideUseCustomPresentation:0];
    }
    [(UIViewController *)self->_browserContainerViewController dismissViewControllerAnimated:0 completion:0];
    browserPresentationController = self->_browserPresentationController;
    self->_browserPresentationController = 0;
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentLaunchViewController;
  [(UIViewController *)&v9 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if ((*(unsigned char *)&self->_flags & 1) != 0 && a3 && (*(unsigned char *)&self->_flags & 8) == 0)
  {
    configuration = self->_configuration;
    if (configuration) {
      configuration = (_UIDocumentUnavailableConfiguration *)configuration->_browserViewController;
    }
    id v7 = configuration;
    BOOL v8 = [(_UIDocumentUnavailableConfiguration *)v7 presentingViewController];

    if (!v8) {
      -[_UIDocumentLaunchViewController _presentBrowserViewController]((uint64_t)self);
    }
  }
}

- (UIEdgeInsets)_minimumLayoutMarginsForView
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_animationInteractionView, 0);
  objc_storeStrong((id *)&self->_transitionAnimator, 0);
  objc_storeStrong((id *)&self->_documentAnimationInfo, 0);
  objc_storeStrong((id *)&self->_morphAnimation, 0);
  objc_storeStrong((id *)&self->_foregroundAccessoryContainerView, 0);
  objc_storeStrong((id *)&self->_backgroundAccessoryContainerView, 0);
  objc_storeStrong((id *)&self->_pageContainerView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_browserPresentationController, 0);
  objc_storeStrong((id *)&self->_browserContainerViewController, 0);
  objc_storeStrong((id *)&self->_defaultBackgroundAccessoryView, 0);
  objc_storeStrong((id *)&self->_foregroundAccessoryView, 0);
  objc_storeStrong((id *)&self->_backgroundAccessoryView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end