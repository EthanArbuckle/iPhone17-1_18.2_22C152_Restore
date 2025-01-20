@interface SBFocusActivityPickerTransientOverlayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldUseCondensedFrame:(CGRect)a3;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAutorotate;
- (BOOL)shouldDisableControlCenter;
- (CGRect)_contractedFrame;
- (CGRect)_contractedFrameNotTargetingSystemAperture;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (SBFocusActivityPickerTransientOverlayViewControllerDelegate)delegate;
- (id)newTransientOverlayDismissalTransitionCoordinator;
- (id)newTransientOverlayPresentationTransitionCoordinator;
- (int64_t)preferredLockedGestureDismissalStyle;
- (int64_t)preferredUnlockedGestureDismissalStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismiss:(BOOL)a3;
- (void)_handleTap:(id)a3;
- (void)_performTransitionForPresentation:(BOOL)a3 contextProvider:(id)a4 actions:(id)a5 usingAnimationWorkaround:(BOOL)a6;
- (void)handleGestureDismissal;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBFocusActivityPickerTransientOverlayViewController

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)SBFocusActivityPickerTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v14 viewDidLoad];
  v3 = [(SBFocusActivityPickerTransientOverlayViewController *)self view];
  v4 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:20 options:2 initialWeighting:0.0];
  backgroundMaterialView = self->_backgroundMaterialView;
  self->_backgroundMaterialView = v4;

  v6 = self->_backgroundMaterialView;
  [v3 bounds];
  -[MTMaterialView setFrame:](v6, "setFrame:");
  [(MTMaterialView *)self->_backgroundMaterialView setAutoresizingMask:18];
  [(SBTransientOverlayViewController *)self addPresentationBackgroundView:self->_backgroundMaterialView];
  v7 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleTap_];
  tapGesture = self->_tapGesture;
  self->_tapGesture = v7;

  [v3 addGestureRecognizer:self->_tapGesture];
  v9 = (FCUIActivityPickerViewController *)objc_alloc_init(MEMORY[0x1E4F62280]);
  activityPickerViewController = self->_activityPickerViewController;
  self->_activityPickerViewController = v9;

  v11 = self->_activityPickerViewController;
  v12 = [(SBFocusActivityPickerTransientOverlayViewController *)self traitCollection];
  -[FCUIActivityPickerViewController setFooterPinnedToBottom:](v11, "setFooterPinnedToBottom:", [v12 userInterfaceIdiom] == 0);

  v13 = [(FCUIActivityPickerViewController *)self->_activityPickerViewController view];
  [v3 bounds];
  objc_msgSend(v13, "setFrame:");
  [v3 addSubview:v13];
  [v13 setAlpha:0.0];
  [(SBFocusActivityPickerTransientOverlayViewController *)self bs_addChildViewController:self->_activityPickerViewController withSuperview:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBFocusActivityPickerTransientOverlayViewController;
  -[SBFocusActivityPickerTransientOverlayViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  [(SBFocusActivityPickerTransientOverlayViewController *)self _dismiss:v3];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)handleGestureDismissal
{
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 0;
}

- (BOOL)shouldDisableControlCenter
{
  return 1;
}

- (int64_t)preferredLockedGestureDismissalStyle
{
  return 5;
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  return 5;
}

- (CGRect)_contractedFrame
{
  BOOL v3 = [(id)SBApp systemApertureControllerForMainDisplay];
  if (!v3) {
    goto LABEL_3;
  }
  v4 = [(SBFocusActivityPickerTransientOverlayViewController *)self view];
  [v3 defaultIslandFrameInCoordinateSpace:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  if (!-[SBFocusActivityPickerTransientOverlayViewController _shouldUseCondensedFrame:](self, "_shouldUseCondensedFrame:", v6, v8, v10, v12))
  {
LABEL_3:
    [(SBFocusActivityPickerTransientOverlayViewController *)self _contractedFrameNotTargetingSystemAperture];
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
    double v12 = v16;
  }

  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  double v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)_shouldUseCondensedFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectIsNull(a3)) {
    return 0;
  }
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  if (CGRectIsEmpty(v12)) {
    return 0;
  }
  double v9 = [(SBFocusActivityPickerTransientOverlayViewController *)self view];
  [v9 bounds];
  double MidY = CGRectGetMidY(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  BOOL v8 = MidY > CGRectGetMaxY(v14);

  return v8;
}

- (CGRect)_contractedFrameNotTargetingSystemAperture
{
  BOOL v3 = [(SBFocusActivityPickerTransientOverlayViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  -[SBFocusActivityPickerTransientOverlayViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", self->_activityPickerViewController, v5, v7);
  double v17 = v8;
  BSRectWithSize();
  double v9 = [(SBFocusActivityPickerTransientOverlayViewController *)self view];
  [v9 bounds];
  double v10 = [(SBFocusActivityPickerTransientOverlayViewController *)self traitCollection];
  [v10 displayScale];
  UIRectCenteredXInRectScale();
  double v12 = v11;

  double v13 = -74.0;
  double v14 = 74.0;
  double v15 = v12;
  double v16 = v17;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v15;
  return result;
}

- (void)_performTransitionForPresentation:(BOOL)a3 contextProvider:(id)a4 actions:(id)a5 usingAnimationWorkaround:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  if ([v10 isAnimated])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __138__SBFocusActivityPickerTransientOverlayViewController__performTransitionForPresentation_contextProvider_actions_usingAnimationWorkaround___block_invoke;
    v14[3] = &unk_1E6AFF7F0;
    BOOL v17 = a3;
    v14[4] = self;
    id v16 = v11;
    id v15 = v10;
    double v12 = (void (**)(void))MEMORY[0x1D948C7A0](v14);
    double v13 = v12;
    if (v6) {
      dispatch_async(MEMORY[0x1E4F14428], v12);
    }
    else {
      v12[2](v12);
    }
  }
  else
  {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
    [v10 completeTransition:1];
  }
}

void __138__SBFocusActivityPickerTransientOverlayViewController__performTransitionForPresentation_contextProvider_actions_usingAnimationWorkaround___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F4F680];
  if (*(unsigned char *)(a1 + 56))
  {
    BOOL v3 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
    double v4 = 0.4;
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
    double v4 = 0.23;
  }
  double v5 = [v2 settingsWithDuration:v3 timingFunction:v4];

  BOOL v6 = (void *)[v5 mutableCopy];
  CAFrameRateRange v18 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v6, "setPreferredFrameRateRange:", *(double *)&v18.minimum, *(double *)&v18.maximum, *(double *)&v18.preferred);
  [v6 setHighFrameRateReason:1703937];
  id v7 = objc_alloc_init(MEMORY[0x1E4F433A0]);
  [v6 duration];
  objc_msgSend(v7, "_setDuration:");
  double v8 = [*(id *)(a1 + 32) view];
  [v7 _setContainerView:v8];
  double v9 = objc_alloc_init(_SBFocusAnimator);
  [v7 _setAnimator:v9];
  id v10 = (void *)MEMORY[0x1E4F42FF0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __138__SBFocusActivityPickerTransientOverlayViewController__performTransitionForPresentation_contextProvider_actions_usingAnimationWorkaround___block_invoke_2;
  v15[3] = &unk_1E6AF5A78;
  id v11 = *(id *)(a1 + 48);
  id v16 = v7;
  id v17 = v11;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __138__SBFocusActivityPickerTransientOverlayViewController__performTransitionForPresentation_contextProvider_actions_usingAnimationWorkaround___block_invoke_3;
  v13[3] = &unk_1E6AF5350;
  id v14 = *(id *)(a1 + 40);
  id v12 = v7;
  [v10 _animateWithAnimationSettings:v6 animations:v15 completion:v13];
}

void __138__SBFocusActivityPickerTransientOverlayViewController__performTransitionForPresentation_contextProvider_actions_usingAnimationWorkaround___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _transitionCoordinator];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __138__SBFocusActivityPickerTransientOverlayViewController__performTransitionForPresentation_contextProvider_actions_usingAnimationWorkaround___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2];
}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  BOOL v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __107__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E6AF5378;
  v5[4] = self;
  [(SBTransientOverlayBlockTransitionCoordinator *)v3 setStartTransitionHandler:v5];
  return v3;
}

void __107__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  double v8 = __107__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
  double v9 = &unk_1E6B09EE8;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v3;
  id v4 = v3;
  double v5 = (void *)MEMORY[0x1D948C7A0](&v6);
  objc_msgSend(*(id *)(a1 + 32), "_performTransitionForPresentation:contextProvider:actions:usingAnimationWorkaround:", 1, v4, v5, 1, v6, v7, v8, v9, v10);
}

void __107__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "sizeForChildContentContainer:withParentContainerSize:", *(void *)(*(void *)(a1 + 32) + 1400), v7, v9);
  BSRectWithSize();
  uint64_t v10 = [*(id *)(a1 + 32) traitCollection];
  [v10 displayScale];
  uint64_t v46 = v11;
  UIRectCenteredIntegralRectScale();
  double v47 = v12;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = objc_msgSend(*(id *)(a1 + 32), "view", v46);
  [v19 safeAreaInsets];
  double v21 = v20;

  v22 = [*(id *)(a1 + 32) view];
  [*(id *)(a1 + 32) _contractedFrame];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  v31 = [*(id *)(*(void *)(a1 + 32) + 1400) view];
  v32 = [v31 superview];
  objc_msgSend(v22, "convertRect:toView:", v32, v24, v26, v28, v30);
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;

  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __107__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
  v48[3] = &unk_1E6AF4AC0;
  v48[4] = *(void *)(a1 + 32);
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v48];
  v41 = [MEMORY[0x1E4F62278] sharedActivityManager];
  v42 = [v41 activeActivity];
  v43 = v42;
  if (v42)
  {
    id v44 = v42;
  }
  else
  {
    v45 = [MEMORY[0x1E4F62278] sharedActivityManager];
    id v44 = [v45 defaultActivity];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1400), "setExpandedFrame:initialFrame:representedActivity:presentationStyle:transitionCoordinator:", v44, 1, v4, v47, v14, v16, v18 - v21, v34, v36, v38, v40);

  [*(id *)(*(void *)(a1 + 32) + 1408) setWeighting:1.0];
  [*(id *)(a1 + 40) performAlongsideTransitions];
}

void __107__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1400) view];
  [v2 setHidden:0];

  [*(id *)(*(void *)(a1 + 32) + 1408) setWeighting:0.0];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 1400) view];
  [v3 setAlpha:1.0];
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  id v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __104__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E6AF5378;
  v5[4] = self;
  [(SBTransientOverlayBlockTransitionCoordinator *)v3 setStartTransitionHandler:v5];
  return v3;
}

void __104__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  double v8 = __104__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
  double v9 = &unk_1E6B09EE8;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v3;
  id v4 = v3;
  double v5 = (void *)MEMORY[0x1D948C7A0](&v6);
  objc_msgSend(*(id *)(a1 + 32), "_performTransitionForPresentation:contextProvider:actions:usingAnimationWorkaround:", 0, v4, v5, 0, v6, v7, v8, v9, v10);
}

void __104__SBFocusActivityPickerTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 view];
  [*(id *)(a1 + 32) _contractedFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [*(id *)(*(void *)(a1 + 32) + 1400) view];
  double v15 = [v14 superview];
  objc_msgSend(v5, "convertRect:toView:", v15, v7, v9, v11, v13);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = [MEMORY[0x1E4F62278] sharedActivityManager];
  double v25 = [v24 activeActivity];
  double v26 = v25;
  if (v25)
  {
    id v29 = v25;
  }
  else
  {
    double v27 = [MEMORY[0x1E4F62278] sharedActivityManager];
    id v29 = [v27 defaultActivity];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1400), "setContractedFrame:representedActivity:presentationStyle:transitionCoordinator:", v29, 1, v4, v17, v19, v21, v23);

  double v28 = [*(id *)(*(void *)(a1 + 32) + 1400) view];
  [v28 setAlpha:0.0];

  [*(id *)(*(void *)(a1 + 32) + 1408) setWeighting:0.0];
  [*(id *)(a1 + 40) performAlongsideTransitions];
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  if (self->_activityPickerViewController == a3)
  {
    CCUIDefaultExpandedContentModuleWidth();
    UISizeRoundToScale();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBFocusActivityPickerTransientOverlayViewController;
    [(SBFocusActivityPickerTransientOverlayViewController *)&v6 sizeForChildContentContainer:a4.width withParentContainerSize:a4.height];
  }
  result.CGFloat height = v5;
  result.CGFloat width = v4;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBFocusActivityPickerTransientOverlayViewController;
  -[SBTransientOverlayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (v7) {
    [v7 targetTransform];
  }
  else {
    memset(&v9, 0, sizeof(v9));
  }
  if (!CGAffineTransformIsIdentity(&v9))
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __106__SBFocusActivityPickerTransientOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v8[3] = &unk_1E6B003A8;
    v8[4] = self;
    *(double *)&v8[5] = width;
    *(double *)&v8[6] = height;
    [v7 animateAlongsideTransition:v8 completion:0];
  }
}

void __106__SBFocusActivityPickerTransientOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sizeForChildContentContainer:withParentContainerSize:", *(void *)(*(void *)(a1 + 32) + 1400), *(double *)(a1 + 40), *(double *)(a1 + 48));
  BSRectWithSize();
  BSRectWithSize();
  id v2 = [*(id *)(a1 + 32) traitCollection];
  [v2 displayScale];
  uint64_t v12 = v3;
  UIRectCenteredXInRectScale();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1400), "view", v12);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
  [v13 setNeedsLayout];
  [v13 layoutIfNeeded];
}

- (void)_dismiss:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[SBWorkspace mainWorkspace];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__SBFocusActivityPickerTransientOverlayViewController__dismiss___block_invoke;
  v6[3] = &unk_1E6AF5D38;
  v6[4] = self;
  BOOL v7 = v3;
  [v5 dismissTransientOverlayViewController:self animated:v3 completion:v6];
}

void __64__SBFocusActivityPickerTransientOverlayViewController__dismiss___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1424));
  [WeakRetained focusActivityPickerTransientOverlayViewController:*(void *)(a1 + 32) didDismiss:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_handleTap:(id)a3
{
  if (self->_tapGesture == a3) {
    [(SBFocusActivityPickerTransientOverlayViewController *)self _dismiss:1];
  }
}

- (SBFocusActivityPickerTransientOverlayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFocusActivityPickerTransientOverlayViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_storeStrong((id *)&self->_activityPickerViewController, 0);
}

@end