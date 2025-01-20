@interface SBAssistantRootViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)dimsContentBelow;
- (BOOL)ownsHomeGesture;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldAutomaticallyForwardRotationMethods;
- (BOOL)shouldAutorotate;
- (BOOL)showsHomeAffordance;
- (BOOL)wantsFullScreenLayout;
- (SBAssistantRootViewController)initWithScreen:(id)a3;
- (SBFluidDismissalState)fluidDismissalState;
- (SBHomeGrabberPointerClickDelegate)homeGrabberPointerClickDelegate;
- (SiriPresentationSpringBoardMainScreenViewController)siriPresentationViewController;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIView)clippingView;
- (UIView)contentView;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)childViewControllerForScreenEdgesDeferringSystemGestures;
- (unint64_t)supportedInterfaceOrientations;
- (void)_keyboardWillHideNotification:(id)a3;
- (void)_keyboardWillShowNotification:(id)a3;
- (void)_setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateHomeAffordance;
- (void)_updateKeyboardForHomeGesture;
- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4;
- (void)loadView;
- (void)screen;
- (void)setDimsContentBelow:(BOOL)a3;
- (void)setFluidDismissalState:(id)a3;
- (void)setHomeGrabberPointerClickDelegate:(id)a3;
- (void)setNeedsUpdateOfHomeIndicatorAutoHidden;
- (void)setNeedsUpdateOfScreenEdgesDeferringSystemGestures;
- (void)setOwnsHomeGesture:(BOOL)a3;
- (void)setScreen:(uint64_t)a1;
- (void)setShowsHomeAffordance:(BOOL)a3;
- (void)setSiriPresentationViewController:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SBAssistantRootViewController

- (SBAssistantRootViewController)initWithScreen:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBAssistantRootViewController;
  v6 = [(SBAssistantRootViewController *)&v11 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_screen, a3);
  }
  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:v7 selector:sel__keyboardWillHideNotification_ name:*MEMORY[0x1E4F43B80] object:0];

  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:v7 selector:sel__keyboardWillShowNotification_ name:*MEMORY[0x1E4F43B88] object:0];

  return v7;
}

- (void)setScreen:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 1016), a2);
  }
}

- (UIView)clippingView
{
  return (UIView *)self->_clippingView;
}

- (void)screen
{
  if (a1)
  {
    v2 = (void *)a1[127];
    if (v2)
    {
      a1 = v2;
    }
    else
    {
      a1 = [MEMORY[0x1E4F42D90] mainScreen];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)loadView
{
  v21.receiver = self;
  v21.super_class = (Class)SBAssistantRootViewController;
  [(SBFTouchPassThroughViewController *)&v21 loadView];
  id v3 = objc_alloc(MEMORY[0x1E4FA6028]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = (SBFTouchPassThroughView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  clippingView = self->_clippingView;
  self->_clippingView = v8;

  v10 = self->_clippingView;
  objc_super v11 = [MEMORY[0x1E4F428B8] clearColor];
  [(SBFTouchPassThroughView *)v10 setBackgroundColor:v11];

  [(SBFTouchPassThroughView *)self->_clippingView setClipsToBounds:1];
  v12 = [(SBAssistantRootViewController *)self view];
  [v12 addSubview:self->_clippingView];

  v13 = (SBFTouchPassThroughView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FA6028]), "initWithFrame:", v4, v5, v6, v7);
  contentView = self->_contentView;
  self->_contentView = v13;

  v15 = self->_contentView;
  v16 = [MEMORY[0x1E4F428B8] clearColor];
  [(SBFTouchPassThroughView *)v15 setBackgroundColor:v16];

  [(SBFTouchPassThroughView *)self->_clippingView addSubview:self->_contentView];
  v17 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v4, v5, v6, v7);
  dimmingView = self->_dimmingView;
  self->_dimmingView = v17;

  [(UIView *)self->_dimmingView setAlpha:0.0];
  v19 = self->_dimmingView;
  v20 = [MEMORY[0x1E4F428B8] blackColor];
  [(UIView *)v19 setBackgroundColor:v20];

  [(UIView *)self->_dimmingView bs_setHitTestingDisabled:1];
  [(SBFTouchPassThroughView *)self->_clippingView addSubview:self->_dimmingView];
  [(SBAssistantRootViewController *)self _updateHomeAffordance];
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)SBAssistantRootViewController;
  [(SBAssistantRootViewController *)&v15 viewWillLayoutSubviews];
  id v3 = [(SBAssistantRootViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[SBFTouchPassThroughView setFrame:](self->_clippingView, "setFrame:", v5, v7, v9, v11);
  [(SBFTouchPassThroughView *)self->_clippingView bringSubviewToFront:self->_dimmingView];
  [(SBFTouchPassThroughView *)self->_clippingView bringSubviewToFront:self->_contentView];
  if (self->_homeAffordanceView) {
    -[SBFTouchPassThroughView bringSubviewToFront:](self->_clippingView, "bringSubviewToFront:");
  }
  -[SBFTouchPassThroughView setFrame:](self->_contentView, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_dimmingView, "setFrame:", v5, v7, v9, v11);
  siriPresentationViewController = self->_siriPresentationViewController;
  if (siriPresentationViewController)
  {
    v13 = [(SiriPresentationSpringBoardMainScreenViewController *)siriPresentationViewController view];
    objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
  }
  v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 postNotificationName:@"SBAssistantCanRepositionOrbIfNecessary" object:self];
}

- (BOOL)wantsFullScreenLayout
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  siriPresentationViewController = self->_siriPresentationViewController;
  if (siriPresentationViewController) {
    return [(SiriPresentationSpringBoardMainScreenViewController *)siriPresentationViewController supportedInterfaceOrientations];
  }
  else {
    return 30;
  }
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  siriPresentationViewController = [(SiriPresentationSpringBoardMainScreenViewController *)self->_siriPresentationViewController childViewControllerForHomeIndicatorAutoHidden];
  double v4 = siriPresentationViewController;
  if (!siriPresentationViewController) {
    siriPresentationViewController = self->_siriPresentationViewController;
  }
  id v5 = siriPresentationViewController;

  return v5;
}

- (void)setNeedsUpdateOfHomeIndicatorAutoHidden
{
  v3.receiver = self;
  v3.super_class = (Class)SBAssistantRootViewController;
  [(SBAssistantRootViewController *)&v3 setNeedsUpdateOfHomeIndicatorAutoHidden];
  [(SBAssistantRootViewController *)self _updateHomeAffordance];
}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  siriPresentationViewController = [(SiriPresentationSpringBoardMainScreenViewController *)self->_siriPresentationViewController childViewControllerForScreenEdgesDeferringSystemGestures];
  double v4 = siriPresentationViewController;
  if (!siriPresentationViewController) {
    siriPresentationViewController = self->_siriPresentationViewController;
  }
  id v5 = siriPresentationViewController;

  return v5;
}

- (void)setNeedsUpdateOfScreenEdgesDeferringSystemGestures
{
  v3.receiver = self;
  v3.super_class = (Class)SBAssistantRootViewController;
  [(SBAssistantRootViewController *)&v3 setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
  [(SBAssistantRootViewController *)self _updateHomeAffordance];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  double v6 = [a3 _sbWindowScene];
  double v7 = [v6 statusBarManager];

  double v8 = [v7 statusBar];
  [v8 defaultHeight];
  double v10 = v9;

  double v11 = objc_msgSend(MEMORY[0x1E4FB33B0], "sb_thisDeviceDisplayEdgeInfo");
  v12 = objc_msgSend(v11, "sb_displayEdgeInfoWithSafeAreaInsetsForStatusBarHeight:", v10);

  uint64_t v13 = [(SBAssistantRootViewController *)self interfaceOrientation];
  v14 = [(SBAssistantRootViewController *)self traitCollection];
  objc_msgSend(v12, "sb_orientedEdgeInsetsForInterfaceOrientation:traitCollection:", v13, v14);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  if (a4) {
    *a4 = 1;
  }

  double v23 = v16;
  double v24 = v18;
  double v25 = v20;
  double v26 = v22;
  result.right = v26;
  result.bottom = v25;
  result.left = v24;
  result.top = v23;
  return result;
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  if (a3) {
    a3->var6 = 0;
  }
}

- (void)setOwnsHomeGesture:(BOOL)a3
{
  if (self->_ownsHomeGesture != a3)
  {
    self->_ownsHomeGesture = a3;
    [(SBAssistantRootViewController *)self _updateHomeAffordance];
  }
}

- (void)setShowsHomeAffordance:(BOOL)a3
{
  if (self->_showsHomeAffordance != a3)
  {
    self->_showsHomeAffordance = a3;
    [(SBAssistantRootViewController *)self _updateHomeAffordance];
  }
}

- (void)_updateHomeAffordance
{
  objc_super v3 = [(SBAssistantRootViewController *)self viewIfLoaded];

  if (v3)
  {
    if (self->_showsHomeAffordance)
    {
      if (self->_ownsHomeGesture)
      {
        if (!self->_homeAffordanceView && SBFEffectiveHomeButtonType() == 2)
        {
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __54__SBAssistantRootViewController__updateHomeAffordance__block_invoke;
          v25[3] = &unk_1E6AF4AC0;
          v25[4] = self;
          [MEMORY[0x1E4F42FF0] performWithoutAnimation:v25];
        }
        uint64_t v4 = 1;
      }
      else
      {
        uint64_t v4 = 0;
      }
    }
    else
    {
      uint64_t v4 = 0;
    }
    homeAffordanceView = self->_homeAffordanceView;
    if (homeAffordanceView)
    {
      double v6 = [(SBAssistantRootViewController *)self childViewControllerForHomeIndicatorAutoHidden];
      -[SBHomeGrabberView setAutoHides:](homeAffordanceView, "setAutoHides:", [v6 prefersHomeIndicatorAutoHidden]);

      double v7 = [(SBAssistantRootViewController *)self childViewControllerForScreenEdgesDeferringSystemGestures];
      unint64_t v8 = ((unint64_t)[v7 preferredScreenEdgesDeferringSystemGestures] >> 2) & 1;

      [(SBHomeGrabberView *)self->_homeAffordanceView setEdgeProtectEnabled:v8];
      double v9 = [(SBAssistantRootViewController *)self fluidDismissalState];
      double v10 = v9;
      if (v9)
      {
        [v9 contentRect];
        double v12 = v11;
        [(SBFTouchPassThroughView *)self->_clippingView bounds];
        uint64_t v13 = self->_homeAffordanceView;
        CGAffineTransformMakeScale(&v24, v12 / v14, v12 / v14);
        [(SBHomeGrabberView *)v13 setTransform:&v24];
        double v15 = self->_homeAffordanceView;
        UIRectGetCenter();
        -[SBHomeGrabberView setCenter:](v15, "setCenter:");
      }
      else
      {
        double v16 = self->_homeAffordanceView;
        long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        v23[0] = *MEMORY[0x1E4F1DAB8];
        v23[1] = v17;
        v23[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        [(SBHomeGrabberView *)v16 setTransform:v23];
        double v18 = self->_homeAffordanceView;
        [(SBFTouchPassThroughView *)self->_clippingView bounds];
        -[SBHomeGrabberView setFrame:](v18, "setFrame:");
      }
      grabberSettings = self->_grabberSettings;
      if (v4) {
        [(SBFHomeGrabberSettings *)grabberSettings unhideForHomeGestureOwnershipAnimationSettings];
      }
      else {
      double v20 = [(SBFHomeGrabberSettings *)grabberSettings hideForHomeGestureOwnershipAnimationSettings];
      }
      double v21 = self->_homeAffordanceView;
      double v22 = [v20 BSAnimationSettings];
      [(SBHomeGrabberView *)v21 setHidden:v4 ^ 1 forReason:@"hide assistant affordance when unowned" withAnimationSettings:v22];

      [(SBHomeGrabberView *)self->_homeAffordanceView setHomeAffordanceInteractionEnabled:v4];
    }
    [(SBAssistantRootViewController *)self _updateKeyboardForHomeGesture];
  }
}

uint64_t __54__SBAssistantRootViewController__updateHomeAffordance__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__SBAssistantRootViewController__updateHomeAffordance__block_invoke_2;
  v2[3] = &unk_1E6AF4AC0;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v2];
}

void __54__SBAssistantRootViewController__updateHomeAffordance__block_invoke_2(uint64_t a1)
{
  v2 = [SBHomeGrabberView alloc];
  [*(id *)(*(void *)(a1 + 32) + 992) bounds];
  uint64_t v3 = -[SBHomeGrabberView initWithFrame:](v2, "initWithFrame:");
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 1024);
  *(void *)(v4 + 1024) = v3;

  [*(id *)(*(void *)(a1 + 32) + 1024) setAutoresizingMask:18];
  [*(id *)(*(void *)(a1 + 32) + 1024) setColorBias:2];
  [*(id *)(*(void *)(a1 + 32) + 1024) setHidden:1 forReason:@"hide assistant affordance when unowned" withAnimationSettings:0];
  [*(id *)(*(void *)(a1 + 32) + 992) addSubview:*(void *)(*(void *)(a1 + 32) + 1024)];
  uint64_t v6 = [MEMORY[0x1E4FA5F28] rootSettings];
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v8 = *(void **)(v7 + 1040);
  *(void *)(v7 + 1040) = v6;
}

- (void)_updateKeyboardForHomeGesture
{
  uint64_t v3 = [(SBAssistantRootViewController *)self fluidDismissalState];

  if ([(SBAssistantRootViewController *)self ownsHomeGesture])
  {
    if (self->_keyboardPresented && v3 == 0)
    {
      BOOL keyboardStashed = 0;
    }
    else
    {
      if (self->_keyboardPresented && v3 != 0)
      {
        BOOL keyboardStashed = 1;
        goto LABEL_27;
      }
      if (!self->_keyboardPresented && v3 != 0)
      {
        BOOL keyboardStashed = self->_keyboardStashed;
        goto LABEL_27;
      }
      BOOL keyboardStashed = 0;
      if (!self->_keyboardStashed) {
        goto LABEL_27;
      }
    }
  }
  else
  {
    if (!v3)
    {
      BOOL keyboardStashed = 0;
      goto LABEL_27;
    }
    BOOL keyboardStashed = self->_keyboardStashed;
    if (!self->_keyboardHomeAffordanceAssertion)
    {
LABEL_27:
      keyboardHomeAffordanceAssertion = self->_keyboardHomeAffordanceAssertion;
      if (keyboardHomeAffordanceAssertion)
      {
        [(SBKeyboardHomeAffordanceAssertion *)keyboardHomeAffordanceAssertion invalidate];
        uint64_t v13 = self->_keyboardHomeAffordanceAssertion;
        self->_keyboardHomeAffordanceAssertion = 0;

        if (keyboardStashed) {
          goto LABEL_29;
        }
        goto LABEL_32;
      }
LABEL_31:
      if (keyboardStashed) {
        goto LABEL_29;
      }
      goto LABEL_32;
    }
  }
  if (SBFEffectiveHomeButtonType() != 2) {
    goto LABEL_27;
  }
  if (self->_keyboardHomeAffordanceAssertion) {
    goto LABEL_31;
  }
  uint64_t v7 = [(SBAssistantRootViewController *)self view];
  unint64_t v8 = [v7 window];
  double v9 = +[SBKeyboardHomeAffordanceAssertion assertionForGestureWindow:v8];
  double v10 = self->_keyboardHomeAffordanceAssertion;
  self->_keyboardHomeAffordanceAssertion = v9;

  if (keyboardStashed)
  {
LABEL_29:
    if (self->_keyboardStashed) {
      return;
    }
    self->_BOOL keyboardStashed = 1;
    id v15 = [MEMORY[0x1E4F42C68] sharedInstance];
    double v14 = [MEMORY[0x1E4F29238] valueWithPointer:self];
    [v15 _preserveInputViewsWithId:v14 animated:1];
    goto LABEL_34;
  }
LABEL_32:
  if (!self->_keyboardStashed) {
    return;
  }
  self->_BOOL keyboardStashed = 0;
  id v15 = [MEMORY[0x1E4F42C68] sharedInstance];
  double v14 = [MEMORY[0x1E4F29238] valueWithPointer:self];
  [v15 _restoreInputViewsWithId:v14 animated:1];
LABEL_34:
}

- (SBHomeGrabberPointerClickDelegate)homeGrabberPointerClickDelegate
{
  return [(SBHomeGrabberView *)self->_homeAffordanceView pointerClickDelegate];
}

- (void)setHomeGrabberPointerClickDelegate:(id)a3
{
}

- (BOOL)dimsContentBelow
{
  [(UIView *)self->_dimmingView alpha];
  return BSFloatGreaterThanFloat();
}

- (void)setDimsContentBelow:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4FA5FE0] rootSettings];
  uint64_t v6 = [v5 systemAssistantExperienceSettings];

  uint64_t v7 = 0;
  if (v3)
  {
    unint64_t v8 = [(SBAssistantRootViewController *)self traitCollection];
    uint64_t v9 = [v8 userInterfaceStyle];

    if (v9 == 2) {
      [v6 typeToSiriDarkInterfaceDimmingAlpha];
    }
    else {
      [v6 typeToSiriLightInterfaceDimmingAlpha];
    }
    uint64_t v7 = v10;
  }
  double v11 = (void *)MEMORY[0x1E4F42FF0];
  double v12 = [v6 typeToSiriDimmingAnimationSettings];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__SBAssistantRootViewController_setDimsContentBelow___block_invoke;
  v13[3] = &unk_1E6AF4A70;
  v13[4] = self;
  v13[5] = v7;
  objc_msgSend(v11, "sb_animateWithSettings:mode:animations:completion:", v12, 3, v13, 0);
}

uint64_t __53__SBAssistantRootViewController_setDimsContentBelow___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1000) setAlpha:*(double *)(a1 + 40)];
}

- (void)_keyboardWillShowNotification:(id)a3
{
  self->_keyboardPresented = 1;
  [(SBAssistantRootViewController *)self _updateKeyboardForHomeGesture];
}

- (void)_keyboardWillHideNotification:(id)a3
{
  self->_keyboardPresented = 0;
  [(SBAssistantRootViewController *)self _updateKeyboardForHomeGesture];
}

- (void)_setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (a4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__SBAssistantRootViewController__setStatusBarHidden_animated___block_invoke;
    v6[3] = &unk_1E6AF5D38;
    v6[4] = self;
    BOOL v7 = a3;
    [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v6 options:0 animations:0.35 completion:0.0];
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __62__SBAssistantRootViewController__setStatusBarHidden_animated___block_invoke_2;
    v4[3] = &unk_1E6AF5D38;
    v4[4] = self;
    BOOL v5 = a3;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v4];
  }
}

uint64_t __62__SBAssistantRootViewController__setStatusBarHidden_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 976) requestStatusBarVisible:*(unsigned char *)(a1 + 40) == 0 animated:0 completion:0];
}

uint64_t __62__SBAssistantRootViewController__setStatusBarHidden_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 976) requestStatusBarVisible:*(unsigned char *)(a1 + 40) == 0 animated:0 completion:0];
}

- (UIView)contentView
{
  return &self->_contentView->super;
}

- (SiriPresentationSpringBoardMainScreenViewController)siriPresentationViewController
{
  return self->_siriPresentationViewController;
}

- (void)setSiriPresentationViewController:(id)a3
{
}

- (BOOL)ownsHomeGesture
{
  return self->_ownsHomeGesture;
}

- (BOOL)showsHomeAffordance
{
  return self->_showsHomeAffordance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grabberSettings, 0);
  objc_storeStrong((id *)&self->_keyboardHomeAffordanceAssertion, 0);
  objc_storeStrong((id *)&self->_homeAffordanceView, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_fluidDismissalState, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_siriPresentationViewController, 0);
}

- (SBFluidDismissalState)fluidDismissalState
{
  return self->_fluidDismissalState;
}

- (void)setFluidDismissalState:(id)a3
{
  id v15 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fluidDismissalState, a3);
    [(SiriPresentationSpringBoardMainScreenViewController *)self->_siriPresentationViewController setFluidDismissalState:v15];
    [(SBAssistantRootViewController *)self _updateHomeAffordance];
    [(SBAssistantRootViewController *)self _updateKeyboardForHomeGesture];
    if (v15)
    {
      if ([v15 transitionPhase])
      {
        uint64_t v5 = [v15 transitionPhase] == 1;
      }
      else
      {
        uint64_t v6 = [(SBAssistantRootViewController *)self view];
        [v6 bounds];
        CGFloat v8 = v7;
        CGFloat v10 = v9;
        CGFloat v12 = v11;
        CGFloat v14 = v13;

        [v15 contentRect];
        v17.origin.x = v8;
        v17.origin.y = v10;
        v17.size.width = v12;
        v17.size.height = v14;
        CGRectGetWidth(v17);
        uint64_t v5 = BSFloatLessThanFloat();
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
    [(SBAssistantRootViewController *)self _setStatusBarHidden:v5 animated:1];
  }
}

@end