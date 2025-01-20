@interface SBPIPStashableWrapperViewController
- (BOOL)isInteractivelyResizing;
- (BOOL)isStashTabHidden;
- (BOOL)stashed;
- (CGSize)minimumStashTabSize;
- (CGSize)preferredContentSize;
- (SBPIPStashableWrapperViewController)initWithContentViewController:(id)a3 cornerRadius:(double)a4 stashVisualSettings:(id)a5 shadowSettings:(id)a6;
- (SBPIPStashableWrapperViewControllerDelegate)delegate;
- (UIView)contentContainerView;
- (double)_continuousCornerRadius;
- (id)_newShadowViewWithSettings:(id)a3;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (void)_addMaskViewSubviewIfNeeded;
- (void)_applyDropShadowSettings:(id)a3 toView:(id)a4;
- (void)_handleTapWhileStashedGestureRecognizer:(id)a3;
- (void)_layoutStashTabViewsIfNeeded;
- (void)_resetStashTabViewsIfPossible;
- (void)_setPortalActive:(BOOL)a3 left:(BOOL)a4;
- (void)_setStashMaskActive:(BOOL)a3;
- (void)_setStashProgress:(double)a3 animated:(BOOL)a4;
- (void)_setStashedTabHidden:(BOOL)a3 left:(BOOL)a4;
- (void)_updateContentCornerRadiusForMaskActive:(BOOL)a3;
- (void)dealloc;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setInteractivelyResizing:(BOOL)a3;
- (void)setMinimumStashTabSize:(CGSize)a3;
- (void)setStashProgress:(double)a3;
- (void)setStashTabHidden:(BOOL)a3 left:(BOOL)a4 withSpringBehavior:(id)a5 completion:(id)a6;
- (void)setStashed:(BOOL)a3;
- (void)setStashed:(BOOL)a3 animated:(BOOL)a4;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SBPIPStashableWrapperViewController

- (SBPIPStashableWrapperViewController)initWithContentViewController:(id)a3 cornerRadius:(double)a4 stashVisualSettings:(id)a5 shadowSettings:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = SBLogPIP();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[SBPIPBackdropView initWithFrame:]();
  }

  v18.receiver = self;
  v18.super_class = (Class)SBPIPStashableWrapperViewController;
  v15 = [(SBPIPStashableWrapperViewController *)&v18 initWithNibName:0 bundle:0];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_settings, a5);
    objc_storeStrong((id *)&v16->_shadowSettings, a6);
    v16->_cornerRadiusMetric = a4;
    objc_storeStrong((id *)&v16->_contentViewController, a3);
    v16->_stashTabHidden = 1;
    [(SBPIPStashableWrapperViewController *)v16 setAccessibilityIdentifier:@"SBPIP-StashingContainerViewController"];
    [(PTSettings *)v16->_shadowSettings addKeyPathObserver:v16];
  }

  return v16;
}

- (void)dealloc
{
  v3 = SBLogPIP();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[SBPIPBackdropView initWithFrame:]();
  }

  [(PTSettings *)self->_shadowSettings removeKeyPathObserver:self];
  if ([(SBPIPStashableWrapperViewController *)self isViewLoaded])
  {
    [(UIViewController *)self->_contentViewController willMoveToParentViewController:0];
    v4 = [(UIViewController *)self->_contentViewController view];
    [v4 removeFromSuperview];

    [(UIViewController *)self->_contentViewController removeFromParentViewController];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBPIPStashableWrapperViewController;
  [(SBPIPStashableWrapperViewController *)&v5 dealloc];
}

- (void)setStashed:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_stashed != a3)
  {
    BOOL v4 = a3;
    self->_stashed = a3;
    double v6 = 0.0;
    if (a3) {
      double v6 = 1.0;
    }
    [(SBPIPStashableWrapperViewController *)self _setStashProgress:a4 animated:v6];
    if ([(SBPIPStashableWrapperViewController *)self isViewLoaded])
    {
      if (v4)
      {
        v7 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleTapWhileStashedGestureRecognizer_];
        stashedTapGestureRecognizer = self->_stashedTapGestureRecognizer;
        self->_stashedTapGestureRecognizer = v7;

        v9 = [(SBPIPStashableWrapperViewController *)self view];
        [v9 addGestureRecognizer:self->_stashedTapGestureRecognizer];
      }
      else
      {
        v9 = [(SBPIPStashableWrapperViewController *)self view];
        [v9 removeGestureRecognizer:self->_stashedTapGestureRecognizer];
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained stashableWrapper:self didTransitionToStashed:v4];
    }
  }
}

- (void)setStashed:(BOOL)a3
{
}

- (void)setInteractivelyResizing:(BOOL)a3
{
  if (self->_interactivelyResizing != a3)
  {
    self->_interactivelyResizing = a3;
    [(SBPIPStashableWrapperViewController *)self _resetStashTabViewsIfPossible];
    BOOL v4 = [(SBPIPStashableWrapperViewController *)self view];
    [v4 setNeedsLayout];

    id v5 = [(SBPIPStashableWrapperViewController *)self view];
    [v5 layoutIfNeeded];
  }
}

- (void)setMinimumStashTabSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self->_minimumStashTabSize.width != a3.width || self->_minimumStashTabSize.height != a3.height)
  {
    self->_minimumStashTabSize = a3;
    if ([(SBPIPStashableWrapperViewController *)self isViewLoaded])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);
      objc_msgSend(WeakRetained, "setMinimumStashTabSize:", width, height);

      stashView = self->_stashView;
      [(SBPIPStashView *)stashView setStashedTabWidth:width];
    }
  }
}

- (void)_setStashProgress:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  [(SBPIPStashView *)self->_stashView blurProgress];
  double v9 = v8;
  char IsZero = BSFloatIsZero();
  if (a3 < 0.2) {
    char v11 = IsZero;
  }
  else {
    char v11 = 0;
  }
  if (v9 != a3
    && (v11 & 1) == 0
    && [(SBPIPStashableWrapperViewController *)self isViewLoaded])
  {
    char v12 = BSFloatIsZero();
    if ((v12 & 1) == 0 && [(SBPIPStashView *)self->_stashView isHidden])
    {
      id v13 = SBLogPIP();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543874;
        v38 = v14;
        __int16 v39 = 1024;
        int v40 = 145;
        __int16 v41 = 2114;
        v42 = @"not hidden";
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[Layout] %{public}@:%d Stash view set %{public}@", buf, 0x1Cu);
      }
      [(SBPIPStashView *)self->_stashView setHidden:0];
    }
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke;
    v35[3] = &unk_1E6AFB0E8;
    v35[4] = self;
    char v36 = v12;
    *(double *)&v35[5] = a3;
    v15 = (void (**)(void))MEMORY[0x1D948C7A0](v35);
    unint64_t v16 = self->_inFlightStashProgressAnimationIdentifier + 1;
    self->_inFlightStashProgressAnimationIdentifier = v16;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_2;
    v33[3] = &unk_1E6AFA400;
    char v34 = v12;
    v33[4] = self;
    v33[5] = v16;
    v33[6] = a2;
    v17 = (void (**)(void))MEMORY[0x1D948C7A0](v33);
    int IsOne = BSFloatIsOne();
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_14;
    v32[3] = &unk_1E6AF4A70;
    if (IsOne) {
      double v19 = 0.0;
    }
    else {
      double v19 = 1.0;
    }
    v32[4] = self;
    *(double *)&v32[5] = v19;
    v20 = (void (**)(void))MEMORY[0x1D948C7A0](v32);
    if (v4)
    {
      v21 = (void *)MEMORY[0x1E4F42FF0];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_2_16;
      v30[3] = &unk_1E6AF5300;
      v31 = v15;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_3;
      v28[3] = &unk_1E6AF5A50;
      v29 = v17;
      objc_msgSend(v21, "SBPIP_animateUsingDefaultTimingWithOptions:animations:completion:", 4, v30, v28);
      [(UIView *)self->_shadowView alpha];
      if (v22 != v19)
      {
        v23 = (void *)MEMORY[0x1E4F42FF0];
        if (IsOne) {
          double v24 = 0.5;
        }
        else {
          double v24 = 0.2;
        }
        if (IsOne) {
          double v25 = 0.5;
        }
        else {
          double v25 = 0.0;
        }
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_4;
        v26[3] = &unk_1E6AF5300;
        v27 = v20;
        [v23 animateWithDuration:0 delay:v26 options:0 animations:v24 completion:v25];
      }
    }
    else
    {
      v15[2](v15);
      v17[2](v17);
      v20[2](v20);
    }
  }
}

uint64_t __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1008);
  double v3 = 0.0;
  if (!*(unsigned char *)(a1 + 48)) {
    double v3 = 1.0;
  }
  [v2 setAlpha:v3];
  BOOL v4 = *(void **)(*(void *)(a1 + 32) + 1008);
  double v5 = *(double *)(a1 + 40);
  return [v4 setBlurProgress:v5];
}

uint64_t __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_2(uint64_t result)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(result + 56))
  {
    uint64_t v1 = result;
    if (*(void *)(result + 40) == *(void *)(*(void *)(result + 32) + 1064))
    {
      v2 = SBLogPIP();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        double v3 = NSStringFromSelector(*(SEL *)(v1 + 48));
        int v4 = 138543874;
        double v5 = v3;
        __int16 v6 = 1024;
        int v7 = 157;
        __int16 v8 = 2114;
        double v9 = @"hidden";
        _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "[Layout] %{public}@:%d Stash view set %{public}@", (uint8_t *)&v4, 0x1Cu);
      }
      [*(id *)(*(void *)(v1 + 32) + 1008) setHidden:1];
      return [*(id *)(v1 + 32) _resetStashTabViewsIfPossible];
    }
  }
  return result;
}

uint64_t __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_14(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1000) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_2_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__SBPIPStashableWrapperViewController__setStashProgress_animated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setStashProgress:(double)a3
{
}

- (BOOL)isStashTabHidden
{
  return self->_stashTabHidden;
}

- (void)setStashTabHidden:(BOOL)a3 left:(BOOL)a4 withSpringBehavior:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a5;
  char v11 = (void (**)(void))a6;
  char v12 = v11;
  if (__PAIR64__(self->_stashTabShownLeft, self->_stashTabHidden) == __PAIR64__(v7, v8))
  {
    if (v11) {
      v11[2](v11);
    }
  }
  else
  {
    self->_stashTabHidden = v8;
    self->_stashTabShownLeft = v7 & ~v8;
    unint64_t v13 = self->_inFlightStashTabAnimationIdentifier + 1;
    self->_inFlightStashTabAnimationIdentifier = v13;
    v14 = (void *)MEMORY[0x1E4F42FF0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __92__SBPIPStashableWrapperViewController_setStashTabHidden_left_withSpringBehavior_completion___block_invoke;
    v18[3] = &unk_1E6AF7EB8;
    v18[4] = self;
    BOOL v19 = v8;
    BOOL v20 = v7;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __92__SBPIPStashableWrapperViewController_setStashTabHidden_left_withSpringBehavior_completion___block_invoke_2;
    v15[3] = &unk_1E6AF5268;
    unint64_t v17 = v13;
    v15[4] = self;
    unint64_t v16 = v11;
    [v14 _animateUsingSpringBehavior:v10 tracking:0 animations:v18 completion:v15];
  }
}

uint64_t __92__SBPIPStashableWrapperViewController_setStashTabHidden_left_withSpringBehavior_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setStashedTabHidden:*(unsigned __int8 *)(a1 + 40) left:*(unsigned __int8 *)(a1 + 41)];
}

uint64_t __92__SBPIPStashableWrapperViewController_setStashTabHidden_left_withSpringBehavior_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[6];
  double v3 = (void *)a1[4];
  if (v2 == v3[132]) {
    [v3 _resetStashTabViewsIfPossible];
  }
  uint64_t result = a1[5];
  if (result)
  {
    double v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)loadView
{
  double v3 = [SBPIPHitTestExtendableView alloc];
  int v4 = -[SBPIPHitTestExtendableView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(SBPIPStashableWrapperViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v35.receiver = self;
  v35.super_class = (Class)SBPIPStashableWrapperViewController;
  [(SBPIPStashableWrapperViewController *)&v35 viewDidLoad];
  double v3 = [(SBPIPStashableWrapperViewController *)self view];
  id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v9 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
  containerView = self->_containerView;
  self->_containerView = v9;

  [v3 addSubview:self->_containerView];
  [(SBPIPStashableWrapperViewController *)self addChildViewController:self->_contentViewController];
  char v11 = [(UIViewController *)self->_contentViewController view];
  contentView = self->_contentView;
  self->_contentView = v11;

  [(UIView *)self->_containerView addSubview:self->_contentView];
  [(UIViewController *)self->_contentViewController didMoveToParentViewController:self];
  unint64_t v13 = -[SBPortalView initWithFrame:]([SBPortalView alloc], "initWithFrame:", v5, v6, v7, v8);
  leftSideContentPortalView = self->_leftSideContentPortalView;
  self->_leftSideContentPortalView = v13;

  v15 = self->_leftSideContentPortalView;
  long long v31 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v33.a = *MEMORY[0x1E4F1DAB8];
  long long v30 = *(_OWORD *)&v33.a;
  *(_OWORD *)&v33.c = v31;
  *(_OWORD *)&v33.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v29 = *(_OWORD *)&v33.tx;
  CGAffineTransformScale(&v34, &v33, -1.0, 1.0);
  [(SBPortalView *)v15 setTransform:&v34];
  [(SBPortalView *)self->_leftSideContentPortalView setUserInteractionEnabled:0];
  [(SBPortalView *)self->_leftSideContentPortalView setHidden:1];
  [(UIView *)self->_containerView addSubview:self->_leftSideContentPortalView];
  unint64_t v16 = -[SBPortalView initWithFrame:]([SBPortalView alloc], "initWithFrame:", v5, v6, v7, v8);
  rightSideContentPortalView = self->_rightSideContentPortalView;
  self->_rightSideContentPortalView = v16;

  objc_super v18 = self->_rightSideContentPortalView;
  *(_OWORD *)&v33.a = v30;
  *(_OWORD *)&v33.c = v31;
  *(_OWORD *)&v33.tx = v29;
  CGAffineTransformScale(&v32, &v33, -1.0, 1.0);
  [(SBPortalView *)v18 setTransform:&v32];
  [(SBPortalView *)self->_rightSideContentPortalView setUserInteractionEnabled:0];
  [(SBPortalView *)self->_rightSideContentPortalView setHidden:1];
  [(UIView *)self->_containerView addSubview:self->_rightSideContentPortalView];
  BOOL v19 = [SBPIPStashView alloc];
  [(UIView *)self->_containerView bounds];
  BOOL v20 = -[SBPIPStashView initWithFrame:settings:](v19, "initWithFrame:settings:", self->_settings);
  stashView = self->_stashView;
  self->_stashView = v20;

  double v22 = self->_stashView;
  [(SBPIPStashableWrapperViewController *)self _continuousCornerRadius];
  -[SBPIPStashView _setContinuousCornerRadius:](v22, "_setContinuousCornerRadius:");
  [(SBPIPStashView *)self->_stashView setHidden:1];
  [(SBPIPStashView *)self->_stashView setUserInteractionEnabled:0];
  [(UIView *)self->_containerView addSubview:self->_stashView];
  v23 = [(SBPIPShadowSettings *)self->_shadowSettings bodyShadowSettings];
  double v24 = [(SBPIPStashableWrapperViewController *)self _newShadowViewWithSettings:v23];
  shadowView = self->_shadowView;
  self->_shadowView = v24;

  [v3 insertSubview:self->_shadowView atIndex:0];
  v26 = [(SBPIPShadowSettings *)self->_shadowSettings tabShadowSettings];
  v27 = [(SBPIPStashableWrapperViewController *)self _newShadowViewWithSettings:v26];
  tabShadowView = self->_tabShadowView;
  self->_tabShadowView = v27;

  [(UIView *)self->_tabShadowView setHidden:1];
  [v3 insertSubview:self->_tabShadowView atIndex:0];
  [(SBPIPStashableWrapperViewController *)self _addMaskViewSubviewIfNeeded];
}

- (void)viewWillLayoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)SBPIPStashableWrapperViewController;
  [(SBPIPStashableWrapperViewController *)&v30 viewWillLayoutSubviews];
  double v3 = [(SBPIPStashableWrapperViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIView setFrame:](self->_containerView, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_shadowView, "setFrame:", v5, v7, v9, v11);
  [(UIView *)self->_containerView bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  contentView = self->_contentView;
  if (self->_interactivelyResizing)
  {
    [(UIView *)contentView bounds];
    CGFloat v22 = v17 / v21;
    memset(&v29, 0, sizeof(v29));
    long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v28.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v28.c = v23;
    *(_OWORD *)&v28.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGAffineTransformScale(&v29, &v28, v22, v22);
    double v24 = self->_contentView;
    CGAffineTransform v28 = v29;
    [(UIView *)v24 setTransform:&v28];
    double v25 = self->_contentView;
    v31.origin.x = v13;
    v31.origin.y = v15;
    v31.size.double width = v17;
    v31.size.double height = v19;
    double MidX = CGRectGetMidX(v31);
    v32.origin.x = v13;
    v32.origin.y = v15;
    v32.size.double width = v17;
    v32.size.double height = v19;
    -[UIView setCenter:](v25, "setCenter:", MidX, CGRectGetMidY(v32));
  }
  else
  {
    long long v27 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v29.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v29.c = v27;
    *(_OWORD *)&v29.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(UIView *)contentView setTransform:&v29];
    -[UIView setFrame:](self->_contentView, "setFrame:", v13, v15, v17, v19);
  }
  [(UIView *)self->_contentView SBPIP_setAllowsEdgeAntialiasing:self->_interactivelyResizing];
  [(UIView *)self->_contentView setNeedsLayout];
  [(UIView *)self->_contentView layoutIfNeeded];
  [(SBPIPStashableWrapperViewController *)self _layoutStashTabViewsIfNeeded];
}

- (CGSize)preferredContentSize
{
  [(UIViewController *)self->_contentViewController preferredContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)_layoutStashTabViewsIfNeeded
{
  [(UIView *)self->_containerView bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);
  double v12 = WeakRetained;
  if (WeakRetained)
  {
    double v18 = WeakRetained;
    [WeakRetained bounds];
    v25.origin.x = v4;
    v25.origin.y = v6;
    v25.size.double width = v8;
    v25.size.double height = v10;
    BOOL v13 = CGRectEqualToRect(v20, v25);
    double v12 = v18;
    if (!v13)
    {
      objc_msgSend(v18, "setFrame:", v4, v6, v8, v10);
      [v18 layoutIfNeeded];
      tabShadowView = self->_tabShadowView;
      [v18 tabViewBounds];
      -[UIView setBounds:](tabShadowView, "setBounds:");
      double v15 = self->_tabShadowView;
      [v18 center];
      -[UIView setCenter:](v15, "setCenter:");
      [(UIView *)self->_tabShadowView layoutIfNeeded];
      leftSideContentPortalView = self->_leftSideContentPortalView;
      v21.origin.x = v4;
      v21.origin.y = v6;
      v21.size.double width = v8;
      v21.size.double height = v10;
      CGRect v22 = CGRectOffset(v21, -(v8 + -1.0), 0.0);
      -[SBPortalView setFrame:](leftSideContentPortalView, "setFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
      rightSideContentPortalView = self->_rightSideContentPortalView;
      v23.origin.x = v4;
      v23.origin.y = v6;
      v23.size.double width = v8;
      v23.size.double height = v10;
      CGRect v24 = CGRectOffset(v23, v8 + -1.0, 0.0);
      -[SBPortalView setFrame:](rightSideContentPortalView, "setFrame:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
      [(SBPortalView *)self->_leftSideContentPortalView layoutIfNeeded];
      [(SBPortalView *)self->_rightSideContentPortalView layoutIfNeeded];
      -[SBPIPStashView setFrame:](self->_stashView, "setFrame:", v4, v6, v8, v10);
      [(SBPIPStashView *)self->_stashView layoutIfNeeded];
      double v12 = v18;
    }
  }
}

- (void)_setStashedTabHidden:(BOOL)a3 left:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (!a3)
  {
    [(UIView *)self->_tabShadowView setAlpha:0.0];
    [(UIView *)self->_tabShadowView setHidden:0];
    [(SBPIPStashableWrapperViewController *)self _setPortalActive:1 left:v4];
    [(SBPIPStashableWrapperViewController *)self _setStashMaskActive:1];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);
  [WeakRetained setTabHidden:v5 left:v4];

  stashView = self->_stashView;
  [(SBPIPStashView *)stashView setChevronHidden:v5 left:v4];
}

- (void)_setPortalActive:(BOOL)a3 left:(BOOL)a4
{
  BOOL v4 = a4;
  leftSideContentPortalView = self->_leftSideContentPortalView;
  BOOL v7 = !a3;
  BOOL v8 = a3 && a4;
  if (a3 && a4) {
    contentView = self->_contentView;
  }
  else {
    contentView = 0;
  }
  [(SBPortalView *)leftSideContentPortalView setSourceView:contentView];
  [(SBPortalView *)self->_leftSideContentPortalView setMatchesTransform:1];
  uint64_t v10 = v7 | v4;
  if (v10) {
    double v11 = 0;
  }
  else {
    double v11 = self->_contentView;
  }
  [(SBPortalView *)self->_rightSideContentPortalView setSourceView:v11];
  [(SBPortalView *)self->_rightSideContentPortalView setMatchesTransform:1];
  [(SBPortalView *)self->_leftSideContentPortalView setHidden:!v8];
  rightSideContentPortalView = self->_rightSideContentPortalView;
  [(SBPortalView *)rightSideContentPortalView setHidden:v10];
}

- (void)_setStashMaskActive:(BOOL)a3
{
  BOOL v3 = a3;
  p_stashMaskView = &self->_stashMaskView;
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)p_stashMaskView);
    if (WeakRetained)
    {
      BOOL v7 = [(UIView *)self->_containerView maskView];

      if (!v7)
      {
        [WeakRetained setHidden:0];
        [(UIView *)self->_containerView setMaskView:WeakRetained];
        BOOL v8 = [(SBPIPStashableWrapperViewController *)self view];
        [v8 setHitTestExtenderView:WeakRetained];
      }
    }
  }
  else
  {
    objc_storeWeak((id *)p_stashMaskView, 0);
    [(UIView *)self->_containerView setMaskView:0];
    [(SBPIPStashableWrapperViewController *)self _addMaskViewSubviewIfNeeded];
    id WeakRetained = [(SBPIPStashableWrapperViewController *)self view];
    [WeakRetained setHitTestExtenderView:0];
  }

  [(SBPIPStashableWrapperViewController *)self _updateContentCornerRadiusForMaskActive:v3];
}

- (void)_updateContentCornerRadiusForMaskActive:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__SBPIPStashableWrapperViewController__updateContentCornerRadiusForMaskActive___block_invoke;
  v3[3] = &unk_1E6AF4AC0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E4F42FF0], "SBPIP_performWithoutRetargetingAnimation:", v3);
}

void __79__SBPIPStashableWrapperViewController__updateContentCornerRadiusForMaskActive___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) view];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];
}

- (void)_addMaskViewSubviewIfNeeded
{
  p_stashMaskView = &self->_stashMaskView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stashMaskView);

  if (!WeakRetained)
  {
    BOOL v5 = [SBPIPStashedMaskView alloc];
    [(UIView *)self->_containerView bounds];
    obj = -[SBPIPStashedMaskView initWithFrame:minimumStashTabSize:](v5, "initWithFrame:minimumStashTabSize:");
    [(SBPIPStashedMaskView *)obj setTabShadowView:self->_tabShadowView];
    [(SBPIPStashedMaskView *)obj setHidden:1];
    [(SBPIPStashableWrapperViewController *)self _continuousCornerRadius];
    -[SBPIPStashedMaskView _setContinuousCornerRadius:](obj, "_setContinuousCornerRadius:");
    [(UIView *)self->_containerView addSubview:obj];
    objc_storeWeak((id *)p_stashMaskView, obj);
  }
}

- (void)_resetStashTabViewsIfPossible
{
  if (self->_stashTabHidden)
  {
    id v3 = [(UIView *)self->_containerView maskView];

    if (v3)
    {
      if (self->_interactivelyResizing
        || ([(SBPIPStashView *)self->_stashView blurProgress], !BSFloatIsZero()))
      {
        [(SBPIPStashableWrapperViewController *)self _updateContentCornerRadiusForMaskActive:0];
      }
      else
      {
        BOOL v4 = SBLogPIP();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[Layout] Removing Stash Tab Views", buf, 2u);
        }

        v5[0] = MEMORY[0x1E4F143A8];
        v5[1] = 3221225472;
        v5[2] = __68__SBPIPStashableWrapperViewController__resetStashTabViewsIfPossible__block_invoke;
        v5[3] = &unk_1E6AF4AC0;
        v5[4] = self;
        objc_msgSend(MEMORY[0x1E4F42FF0], "SBPIP_performWithoutRetargetingAnimation:", v5);
      }
    }
  }
}

uint64_t __68__SBPIPStashableWrapperViewController__resetStashTabViewsIfPossible__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1016) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 1016) setHidden:1];
  [*(id *)(a1 + 32) _setPortalActive:0 left:0];
  [*(id *)(a1 + 32) _setStashMaskActive:0];
  [*(id *)(*(void *)(a1 + 32) + 1008) resetChevronState];
  [*(id *)(*(void *)(a1 + 32) + 1016) layoutIfNeeded];
  double v2 = *(void **)(*(void *)(a1 + 32) + 1008);
  return [v2 layoutIfNeeded];
}

- (UIView)contentContainerView
{
  return self->_containerView;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  if (![(SBPIPStashableWrapperViewController *)self shouldAutorotate]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBPIPStashableWrapperViewController;
  return (int64_t)[(SBPIPStashableWrapperViewController *)&v4 interfaceOrientation];
}

- (void)_handleTapWhileStashedGestureRecognizer:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained stashableWrapper:self didReceivedTapGesture:v5];
  }
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  id v7 = a4;
  if ([v7 hasPrefix:@"bodyShadowSettings"])
  {
    id v5 = [(SBPIPShadowSettings *)self->_shadowSettings bodyShadowSettings];
    double v6 = &OBJC_IVAR___SBPIPStashableWrapperViewController__shadowView;
  }
  else
  {
    if (![v7 hasPrefix:@"tabShadowSettings"]) {
      goto LABEL_6;
    }
    id v5 = [(SBPIPShadowSettings *)self->_shadowSettings tabShadowSettings];
    double v6 = &OBJC_IVAR___SBPIPStashableWrapperViewController__tabShadowView;
  }
  [(SBPIPStashableWrapperViewController *)self _applyDropShadowSettings:v5 toView:*(Class *)((char *)&self->super.super.super.isa + *v6)];

LABEL_6:
}

- (id)_newShadowViewWithSettings:(id)a3
{
  objc_super v4 = (objc_class *)MEMORY[0x1E4F42FF0];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v7 setUserInteractionEnabled:0];
  BOOL v8 = [v7 layer];
  [v8 setAllowsEdgeAntialiasing:1];

  double v9 = [v7 layer];
  [v9 setShadowPathIsBounds:1];

  [(SBPIPStashableWrapperViewController *)self _applyDropShadowSettings:v5 toView:v7];
  return v7;
}

- (void)_applyDropShadowSettings:(id)a3 toView:(id)a4
{
  id v20 = a4;
  id v5 = a3;
  [v5 opacity];
  double v7 = v6;
  [v5 offsetX];
  double v9 = v8;
  [v5 offsetY];
  double v11 = v10;
  [v5 radius];
  double v13 = v12;
  [v5 continuousCornerRadius];
  double v15 = v14;

  double v16 = [v20 layer];
  objc_msgSend(v16, "setShadowOffset:", v9, v11);

  double v17 = [v20 layer];
  *(float *)&double v18 = v7;
  [v17 setShadowOpacity:v18];

  double v19 = [v20 layer];
  [v19 setShadowRadius:v13];

  [v20 _setContinuousCornerRadius:v15];
}

- (double)_continuousCornerRadius
{
  return self->_cornerRadiusMetric;
}

- (SBPIPStashableWrapperViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBPIPStashableWrapperViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isInteractivelyResizing
{
  return self->_interactivelyResizing;
}

- (CGSize)minimumStashTabSize
{
  double width = self->_minimumStashTabSize.width;
  double height = self->_minimumStashTabSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)stashed
{
  return self->_stashed;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_stashedTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rightSideContentPortalView, 0);
  objc_storeStrong((id *)&self->_leftSideContentPortalView, 0);
  objc_destroyWeak((id *)&self->_stashMaskView);
  objc_storeStrong((id *)&self->_tabShadowView, 0);
  objc_storeStrong((id *)&self->_stashView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_shadowSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end