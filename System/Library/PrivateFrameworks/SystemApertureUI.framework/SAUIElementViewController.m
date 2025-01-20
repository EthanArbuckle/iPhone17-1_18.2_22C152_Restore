@interface SAUIElementViewController
- (BOOL)elementViewShouldCenterProvidedContent:(id)a3;
- (BOOL)isMinimalViewIsolatedForElementView:(id)a3;
- (CGAffineTransform)leadingViewTransform;
- (CGAffineTransform)minimalViewTransform;
- (CGAffineTransform)trailingViewTransform;
- (CGSize)leadingViewScale;
- (CGSize)maximumSizeOfLeadingViewForElementView:(id)a3;
- (CGSize)maximumSizeOfMinimalViewForElementView:(id)a3;
- (CGSize)maximumSizeOfTrailingViewForElementView:(id)a3;
- (CGSize)minimalViewScale;
- (CGSize)trailingViewScale;
- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5 forTargetWithOverrider:(id)a6 isDefaultValue:(BOOL *)a7;
- (SAUIElementViewController)initWithElementViewProvider:(id)a3;
- (SAUIElementViewProviding)elementViewProvider;
- (double)customContentAlpha;
- (double)customContentBlurProgress;
- (double)leadingViewAlpha;
- (double)leadingViewBlurProgress;
- (double)leadingViewSquishProgress;
- (double)minimalViewAlpha;
- (double)minimalViewBlurProgress;
- (double)minimalViewSquishProgress;
- (double)snapshotViewAlpha;
- (double)snapshotViewBlurProgress;
- (double)trailingViewAlpha;
- (double)trailingViewBlurProgress;
- (double)trailingViewSquishProgress;
- (id)_contentView;
- (id)_effectiveProvidedMinimalView;
- (id)_elementView;
- (id)beginRequiringSnapshotForReason:(id)a3;
- (id)snapshotView;
- (int64_t)handleElementTap:(id)a3;
- (int64_t)maximumSupportedLayoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4;
- (unint64_t)layoutAxis;
- (void)_insertContentSnapshotView;
- (void)_setSquishProgress:(double)a3 additionalScale:(CGSize)a4 additionalTransform:(CGAffineTransform *)a5 forProvidedView:(id)a6 transformView:(id)a7 isLeading:(BOOL)a8 isMinimal:(BOOL)a9;
- (void)_synchronizeBlurProgress:(double)a3 alpha:(double)a4 squishProgress:(double)a5 additionalTransform:(CGAffineTransform *)a6 isLeading:(BOOL)a7 isMinimal:(BOOL)a8 ofTransformView:(id)a9 providedView:(id)a10;
- (void)elementView:(id)a3 didConfigureLeadingTransformView:(id)a4;
- (void)elementView:(id)a3 didConfigureMinimalTransformView:(id)a4;
- (void)elementView:(id)a3 didConfigureTrailingTransformView:(id)a4;
- (void)elementView:(id)a3 didLayoutResizedLeadingTransformView:(id)a4;
- (void)elementView:(id)a3 didLayoutResizedMinimalTransformView:(id)a4;
- (void)elementView:(id)a3 didLayoutResizedTrailingTransformView:(id)a4;
- (void)setCustomContentAlpha:(double)a3;
- (void)setCustomContentBlurProgress:(double)a3;
- (void)setLayoutAxis:(unint64_t)a3;
- (void)setLeadingViewAlpha:(double)a3;
- (void)setLeadingViewBlurProgress:(double)a3;
- (void)setLeadingViewScale:(CGSize)a3;
- (void)setLeadingViewSquishProgress:(double)a3;
- (void)setLeadingViewTransform:(CGAffineTransform *)a3;
- (void)setMinimalViewAlpha:(double)a3;
- (void)setMinimalViewBlurProgress:(double)a3;
- (void)setMinimalViewScale:(CGSize)a3;
- (void)setMinimalViewSquishProgress:(double)a3;
- (void)setMinimalViewTransform:(CGAffineTransform *)a3;
- (void)setSnapshotViewAlpha:(double)a3;
- (void)setSnapshotViewBlurProgress:(double)a3;
- (void)setTrailingViewAlpha:(double)a3;
- (void)setTrailingViewBlurProgress:(double)a3;
- (void)setTrailingViewScale:(CGSize)a3;
- (void)setTrailingViewSquishProgress:(double)a3;
- (void)setTrailingViewTransform:(CGAffineTransform *)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SAUIElementViewController

- (SAUIElementViewController)initWithElementViewProvider:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SAUIElementViewController;
  result = [(SAUILayoutSpecifyingElementViewController *)&v13 initWithElementViewProvider:a3];
  if (result)
  {
    __asm { FMOV            V0.2D, #1.0 }
    result->_leadingViewScale = _Q0;
    result->_trailingViewScale = _Q0;
    result->_minimalViewScale = _Q0;
    uint64_t v9 = MEMORY[0x263F000D0];
    long long v10 = *MEMORY[0x263F000D0];
    long long v11 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&result->_leadingViewTransform.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&result->_leadingViewTransform.c = v11;
    long long v12 = *(_OWORD *)(v9 + 32);
    *(_OWORD *)&result->_leadingViewTransform.tx = v12;
    *(_OWORD *)&result->_trailingViewTransform.a = v10;
    *(_OWORD *)&result->_trailingViewTransform.c = v11;
    *(_OWORD *)&result->_trailingViewTransform.tx = v12;
    *(_OWORD *)&result->_minimalViewTransform.c = v11;
    *(_OWORD *)&result->_minimalViewTransform.tx = v12;
    *(_OWORD *)&result->_minimalViewTransform.a = v10;
  }
  return result;
}

- (SAUIElementViewProviding)elementViewProvider
{
  v6.receiver = self;
  v6.super_class = (Class)SAUIElementViewController;
  v2 = [(SAUILayoutSpecifyingElementViewController *)&v6 elementViewProvider];
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    if (objc_opt_respondsToSelector()) {
      v3 = v2;
    }
    else {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (void)viewDidLoad
{
  v19[4] = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)SAUIElementViewController;
  [(SAUILayoutSpecifyingElementViewController *)&v18 viewDidLoad];
  v4 = [(SAUIElementViewController *)self _elementView];
  v5 = [(SAUIElementViewController *)self view];
  char v6 = [v4 isDescendantOfView:v5];

  if ((v6 & 1) == 0)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"SAUIElementViewController.m" lineNumber:87 description:@"Element view not added to self view"];
  }
  v7 = [(SAUIElementViewController *)self view];
  v8 = [v7 layer];

  id v9 = objc_alloc_init(MEMORY[0x263F15800]);
  [v9 setSourceLayer:v8];
  long long v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 0.0, 0.0);
  v19[0] = v10;
  long long v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 1.0, 0.0);
  v19[1] = v11;
  long long v12 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 1.0, 1.0);
  v19[2] = v12;
  objc_super v13 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 0.0, 1.0);
  v19[3] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:4];
  [v9 setSourcePoints:v14];

  [v9 setUsesNormalizedCoordinates:1];
  [v9 setDuration:INFINITY];
  [v9 setFillMode:*MEMORY[0x263F15AA8]];
  [v9 setRemovedOnCompletion:0];
  v15 = [(SAUIElementViewController *)self _elementView];
  v16 = [v15 layer];
  [v16 addAnimation:v9 forKey:@"SAUIElementViewMatchMoveToSuperview"];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SAUIElementViewController;
  [(SAUILayoutSpecifyingElementViewController *)&v5 viewWillLayoutSubviews];
  v3 = [(SAUIElementViewController *)self view];
  [v3 bounds];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
  UIRectGetCenter();
  objc_msgSend(WeakRetained, "setCenter:");
  BSRectWithSize();
  objc_msgSend(WeakRetained, "setBounds:");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = [(SAUILayoutSpecifyingElementViewController *)self _previousLayoutMode];
  uint64_t v9 = [(SAUILayoutSpecifyingElementViewController *)self layoutMode];
  uint64_t v10 = v9;
  int v11 = 0;
  BOOL v12 = v9 == 3 && v8 < 3;
  BOOL v13 = v9 < 3 && v8 == 3;
  if (v8 == 3 && v9 == 3)
  {
    if (objc_opt_respondsToSelector()) {
      int v11 = [v7 isPerformingSystemApertureInertTransition];
    }
    else {
      int v11 = 0;
    }
  }
  int v14 = (v12 || v13) | v11;
  BOOL v15 = [(SAUILayoutSpecifyingElementViewController *)self isTrackingTransitionWithReason:@"com.apple.SystemApertureUI.SAUIElementViewController.expansionTransition"];
  BOOL v38 = [(SAUILayoutSpecifyingElementViewController *)self isTrackingTransitionWithReason:@"com.apple.SystemApertureUI.SAUIElementViewController.contractionTransition"];
  BOOL v39 = v15;
  uint64_t v16 = v15 | v38;
  unsigned int v40 = v14;
  if (v10 == 3) {
    uint64_t v17 = v14 | v16;
  }
  else {
    uint64_t v17 = 1;
  }
  if v17 == 1 && (objc_opt_respondsToSelector()) {
    [v7 setPerformingSystemApertureCustomContentTransition:1];
  }
  objc_super v18 = (os_log_t *)MEMORY[0x263F7C298];
  v19 = (void *)*MEMORY[0x263F7C298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F7C298], OS_LOG_TYPE_DEBUG))
  {
    v31 = v19;
    v53.double width = width;
    v53.double height = height;
    v37 = NSStringFromCGSize(v53);
    v32 = SAUIStringFromElementViewLayoutMode(v8);
    v33 = SAUIStringFromElementViewLayoutMode(v10);
    *(_DWORD *)location = 138543874;
    *(void *)&location[4] = v37;
    __int16 v48 = 2114;
    v49 = v32;
    __int16 v50 = 2114;
    v51 = v33;
    _os_log_debug_impl(&dword_25E6E1000, v31, OS_LOG_TYPE_DEBUG, "View will transition to size: %{public}@, layoutMode: %{public}@ -> %{public}@", location, 0x20u);
  }
  os_log_t v20 = *v18;
  if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEBUG))
  {
    v34 = v20;
    v37 = MEMORY[0x2611E13D0](v40);
    v35 = MEMORY[0x2611E13D0](v16);
    v36 = MEMORY[0x2611E13D0](v17);
    *(_DWORD *)location = 138543874;
    *(void *)&location[4] = v37;
    __int16 v48 = 2114;
    v49 = v35;
    __int16 v50 = 2114;
    v51 = v36;
    _os_log_debug_impl(&dword_25E6E1000, v34, OS_LOG_TYPE_DEBUG, "View will transition isTransitioning:%{public}@ isInActiveTransition:%{public}@ clientShouldLayoutImmediately:%{public}@", location, 0x20u);
  }
  v21 = objc_msgSend(v7, "valueForKey:", @"__mainContext", v37);
  v22 = [v21 valueForKey:@"__animator"];
  v23 = [v22 valueForKey:@"_fluidBehaviorSettings"];

  v24 = *v18;
  if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEBUG)) {
    -[SAUIElementViewController viewWillTransitionToSize:withTransitionCoordinator:]((uint64_t)v23, v24);
  }
  v46.receiver = self;
  v46.super_class = (Class)SAUIElementViewController;
  -[SAUILayoutSpecifyingElementViewController viewWillTransitionToSize:withTransitionCoordinator:](&v46, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (v17)
  {
    if (v16)
    {
      BOOL v25 = v39;
      if (v10 >= 3) {
        BOOL v25 = 0;
      }
      if (v25)
      {
LABEL_35:
        v27 = [MEMORY[0x263F08C38] UUID];
        v28 = @"com.apple.SystemApertureUI.SAUIElementViewController.expansionTransition";
        if ((v10 < 3) | v11) {
          v28 = @"com.apple.SystemApertureUI.SAUIElementViewController.contractionTransition";
        }
        v29 = v28;
        [(SAUILayoutSpecifyingElementViewController *)self beginTrackingTransitionWithUniqueIdentifier:v27 reason:v29];
        objc_initWeak((id *)location, self);
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __80__SAUIElementViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
        v44[3] = &unk_26552BD10;
        objc_copyWeak(&v45, (id *)location);
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __80__SAUIElementViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
        v41[3] = &unk_26552BD38;
        objc_copyWeak(&v43, (id *)location);
        id v30 = v27;
        id v42 = v30;
        [v7 animateAlongsideTransition:v44 completion:v41];

        objc_destroyWeak(&v43);
        objc_destroyWeak(&v45);
        objc_destroyWeak((id *)location);

        goto LABEL_38;
      }
      BOOL v26 = v38;
      if (v10 <= 2) {
        BOOL v26 = 0;
      }
    }
    else
    {
      BOOL v26 = 0;
    }
    if ((v40 & (v16 ^ 1) & 1) == 0 && !v26) {
      goto LABEL_38;
    }
    goto LABEL_35;
  }
LABEL_38:
}

void __80__SAUIElementViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained _containerView];
    v4 = (void *)MEMORY[0x263F1CB60];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __80__SAUIElementViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v6[3] = &unk_26552BAE0;
    id v7 = v3;
    id v5 = v3;
    [v4 performWithoutAnimation:v6];
  }
}

uint64_t __80__SAUIElementViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeAllRetargetableAnimations:1];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

void __80__SAUIElementViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained endTrackingTransitionWithUniqueIdentifier:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (id)_contentView
{
  v2 = [(SAUIElementViewController *)self _elementView];
  id v3 = [v2 contentView];

  return v3;
}

- (int64_t)handleElementTap:(id)a3
{
  id v4 = a3;
  id v5 = [(SAUIElementViewController *)self elementViewProvider];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_14;
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __46__SAUIElementViewController_handleElementTap___block_invoke;
  v17[3] = &unk_26552BD60;
  v17[4] = self;
  id v18 = v4;
  char v6 = (uint64_t (**)(void, void))MEMORY[0x2611E1790](v17);
  if ([(SAUILayoutSpecifyingElementViewController *)self layoutMode] == 1
    && ([v5 minimalView],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = ((uint64_t (**)(void, void *))v6)[2](v6, v7),
        v7,
        (v8 & 1) != 0))
  {
    uint64_t v9 = 3;
  }
  else
  {
    uint64_t v10 = [v5 leadingView];
    char v11 = ((uint64_t (**)(void, void *))v6)[2](v6, v10);

    if (v11)
    {
      uint64_t v9 = 1;
    }
    else
    {
      BOOL v12 = [v5 trailingView];
      int v13 = ((uint64_t (**)(void, void *))v6)[2](v6, v12);

      if (!v13)
      {
        int64_t v14 = 0;
        goto LABEL_13;
      }
      uint64_t v9 = 2;
    }
  }
  if ([v5 handleElementViewEvent:v9]) {
    int64_t v14 = 2;
  }
  else {
    int64_t v14 = 0;
  }
LABEL_13:

  if (!v14)
  {
LABEL_14:
    v16.receiver = self;
    v16.super_class = (Class)SAUIElementViewController;
    int64_t v14 = [(SAUILayoutSpecifyingElementViewController *)&v16 handleElementTap:v4];
  }

  return v14;
}

uint64_t __46__SAUIElementViewController_handleElementTap___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 alpha];
  if (v4 <= 0.0)
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v5 = [v3 superview];
    char v6 = [*(id *)(a1 + 32) view];
    if (v5 == v6)
    {
      [*(id *)(a1 + 40) locationInView:v3];
      uint64_t v7 = objc_msgSend(v3, "pointInside:withEvent:", 0);
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  return v7;
}

- (unint64_t)layoutAxis
{
  if (![(SAUIElementViewController *)self isViewLoaded]) {
    return 1;
  }
  id v3 = [(SAUIElementViewController *)self _elementView];
  unint64_t v4 = [v3 layoutAxis];

  return v4;
}

- (void)setLayoutAxis:(unint64_t)a3
{
  [(SAUIElementViewController *)self loadViewIfNeeded];
  id v5 = [(SAUIElementViewController *)self _elementView];
  [v5 setLayoutAxis:a3];
}

- (int64_t)maximumSupportedLayoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(SAUIElementViewController *)self elementViewProvider];
  v25.receiver = self;
  v25.super_class = (Class)SAUIElementViewController;
  uint64_t v8 = [(SAUILayoutSpecifyingElementViewController *)&v25 maximumSupportedLayoutModeForTargetWithOverrider:v6 isDefaultValue:a4];

  BOOL v9 = *a4;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [v7 leadingView];
    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }
  int v12 = v11;
  if (objc_opt_respondsToSelector())
  {
    int v13 = [v7 minimalView];
    if (v13) {
      int v12 = 1;
    }
    else {
      int v12 = v11;
    }
  }
  if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    int64_t v14 = [v7 trailingView];
    if (v14) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 1;
    }
  }
  else
  {
    uint64_t v15 = 1;
  }
  if (v12) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }
  if (v9 || v8 > 2)
  {
    if (v9) {
      int64_t v18 = v16;
    }
    else {
      int64_t v18 = v8;
    }
  }
  else
  {
    uint64_t v17 = [v7 element];
    if (v8 >= v16) {
      int64_t v18 = v16;
    }
    else {
      int64_t v18 = v8;
    }
    if (v8 <= v16)
    {
      int64_t v18 = v8;
    }
    else
    {
      v19 = (void *)SAUILogElementViewControlling;
      if (os_log_type_enabled((os_log_t)SAUILogElementViewControlling, OS_LOG_TYPE_ERROR))
      {
        os_log_t v20 = v19;
        v21 = MEMORY[0x2611E1490](v17);
        v22 = SAUIStringFromElementViewLayoutMode(v8);
        v23 = SAUIStringFromElementViewLayoutMode(v16);
        *(_DWORD *)buf = 138543874;
        v27 = v21;
        __int16 v28 = 2114;
        v29 = v22;
        __int16 v30 = 2114;
        v31 = v23;
        _os_log_error_impl(&dword_25E6E1000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Client claims a max supported layout mode of '%{public}@', but doesn't implement the required properties – restricting to '%{public}@'", buf, 0x20u);
      }
    }
  }
  return v18;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5 forTargetWithOverrider:(id)a6 isDefaultValue:(BOOL *)a7
{
  double trailing = a5.trailing;
  double bottom = a5.bottom;
  double leading = a5.leading;
  double top = a5.top;
  double v12 = a4.trailing;
  double v13 = a4.bottom;
  double v14 = a4.leading;
  double v15 = a4.top;
  id v18 = a6;
  if (a3 < 1)
  {
    double v15 = *MEMORY[0x263F1C228];
    double v14 = *(double *)(MEMORY[0x263F1C228] + 8);
    double v13 = *(double *)(MEMORY[0x263F1C228] + 16);
    double v12 = *(double *)(MEMORY[0x263F1C228] + 24);
  }
  else
  {
    [(SAUIElementViewController *)self loadViewIfNeeded];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    os_log_t v20 = [(SAUIElementViewController *)self elementViewProvider];
    if (SAUIDirectionEdgeInsetsAnyComponentIsZero())
    {
      objc_msgSend(WeakRetained, "suggestedOutsetsForLayoutMode:maximumOutsets:", a3, top, leading, bottom, trailing);
      double v15 = SAUIDirectionEdgeInsetsComponentWiseMinimum(v15, v14, v13, v12, v21);
      double v14 = v22;
      double v13 = v23;
      double v12 = v24;
    }
    if (objc_opt_respondsToSelector())
    {
      v33.receiver = self;
      v33.super_class = (Class)SAUIElementViewController;
      -[SAUILayoutSpecifyingElementViewController preferredEdgeOutsetsForLayoutMode:suggestedOutsets:maximumOutsets:forTargetWithOverrider:isDefaultValue:](&v33, sel_preferredEdgeOutsetsForLayoutMode_suggestedOutsets_maximumOutsets_forTargetWithOverrider_isDefaultValue_, a3, v18, a7, v15, v14, v13, v12, top, leading, bottom, trailing);
      double v15 = v25;
      double v14 = v26;
      double v13 = v27;
      double v12 = v28;
    }
  }
  double v29 = v15;
  double v30 = v14;
  double v31 = v13;
  double v32 = v12;
  result.double trailing = v32;
  result.double bottom = v31;
  result.double leading = v30;
  result.double top = v29;
  return result;
}

- (BOOL)elementViewShouldCenterProvidedContent:(id)a3
{
  return ![(SAUILayoutSpecifyingElementViewController *)self _isObstructedBySensorRegion];
}

- (CGSize)maximumSizeOfMinimalViewForElementView:(id)a3
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  id v6 = [(SAUILayoutSpecifyingElementViewController *)self layoutHost];
  double v7 = v5;
  double v8 = v4;
  if (objc_opt_respondsToSelector())
  {
    BOOL v9 = [(SAUIElementViewController *)self elementViewProvider];
    uint64_t v10 = [v9 leadingView];
    BOOL v11 = [(SAUIElementViewController *)self elementViewProvider];
    [v6 maximumAvailableSizeForProvidedMinimalView:v10 fromViewProvider:v11];
    double v8 = v12;
    double v7 = v13;
  }
  if (v8 == v4 && v7 == v5)
  {
    [(SAUILayoutSpecifyingElementViewController *)self _obstructedRegionSize];
    double v7 = v15;
    double v8 = 1.79769313e308;
  }

  double v16 = v8;
  double v17 = v7;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (CGSize)maximumSizeOfLeadingViewForElementView:(id)a3
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  id v6 = [(SAUILayoutSpecifyingElementViewController *)self layoutHost];
  double v7 = v5;
  double v8 = v4;
  if (objc_opt_respondsToSelector())
  {
    BOOL v9 = [(SAUIElementViewController *)self elementViewProvider];
    uint64_t v10 = [v9 leadingView];
    BOOL v11 = [(SAUIElementViewController *)self elementViewProvider];
    [v6 maximumAvailableSizeForProvidedLeadingView:v10 fromViewProvider:v11];
    double v8 = v12;
    double v7 = v13;
  }
  if (v8 == v4 && v7 == v5)
  {
    [(SAUILayoutSpecifyingElementViewController *)self _obstructedRegionSize];
    double v7 = v15;
    double v8 = 1.79769313e308;
  }

  double v16 = v8;
  double v17 = v7;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (CGSize)maximumSizeOfTrailingViewForElementView:(id)a3
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  id v6 = [(SAUILayoutSpecifyingElementViewController *)self layoutHost];
  double v7 = v5;
  double v8 = v4;
  if (objc_opt_respondsToSelector())
  {
    BOOL v9 = [(SAUIElementViewController *)self elementViewProvider];
    uint64_t v10 = [v9 leadingView];
    BOOL v11 = [(SAUIElementViewController *)self elementViewProvider];
    [v6 maximumAvailableSizeForProvidedTrailingView:v10 fromViewProvider:v11];
    double v8 = v12;
    double v7 = v13;
  }
  if (v8 == v4 && v7 == v5)
  {
    [(SAUILayoutSpecifyingElementViewController *)self _obstructedRegionSize];
    double v7 = v15;
    double v8 = 1.79769313e308;
  }

  double v16 = v8;
  double v17 = v7;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (BOOL)isMinimalViewIsolatedForElementView:(id)a3
{
  return ![(SAUILayoutSpecifyingElementViewController *)self _isObstructedBySensorRegion];
}

- (void)elementView:(id)a3 didConfigureLeadingTransformView:(id)a4
{
  double leadingViewBlurProgress = self->_leadingViewBlurProgress;
  double leadingViewAlpha = self->_leadingViewAlpha;
  double leadingViewSquishProgress = self->_leadingViewSquishProgress;
  p_leadingViewTransform = &self->_leadingViewTransform;
  id v9 = a4;
  uint64_t v10 = [(SAUIElementViewController *)self elementViewProvider];
  BOOL v11 = [v10 leadingView];
  long long v12 = *(_OWORD *)&p_leadingViewTransform->c;
  v13[0] = *(_OWORD *)&p_leadingViewTransform->a;
  v13[1] = v12;
  v13[2] = *(_OWORD *)&p_leadingViewTransform->tx;
  [(SAUIElementViewController *)self _synchronizeBlurProgress:v13 alpha:1 squishProgress:0 additionalTransform:v9 isLeading:v11 isMinimal:leadingViewBlurProgress ofTransformView:leadingViewAlpha providedView:leadingViewSquishProgress];
}

- (void)elementView:(id)a3 didConfigureTrailingTransformView:(id)a4
{
  double trailingViewBlurProgress = self->_trailingViewBlurProgress;
  double trailingViewAlpha = self->_trailingViewAlpha;
  double trailingViewSquishProgress = self->_trailingViewSquishProgress;
  p_trailingViewTransform = &self->_trailingViewTransform;
  id v9 = a4;
  uint64_t v10 = [(SAUIElementViewController *)self elementViewProvider];
  BOOL v11 = [v10 trailingView];
  long long v12 = *(_OWORD *)&p_trailingViewTransform->c;
  v13[0] = *(_OWORD *)&p_trailingViewTransform->a;
  v13[1] = v12;
  v13[2] = *(_OWORD *)&p_trailingViewTransform->tx;
  [(SAUIElementViewController *)self _synchronizeBlurProgress:v13 alpha:0 squishProgress:0 additionalTransform:v9 isLeading:v11 isMinimal:trailingViewBlurProgress ofTransformView:trailingViewAlpha providedView:trailingViewSquishProgress];
}

- (void)elementView:(id)a3 didConfigureMinimalTransformView:(id)a4
{
  double minimalViewBlurProgress = self->_minimalViewBlurProgress;
  double minimalViewAlpha = self->_minimalViewAlpha;
  double minimalViewSquishProgress = self->_minimalViewSquishProgress;
  p_minimalViewTransform = &self->_minimalViewTransform;
  id v9 = a4;
  uint64_t v10 = [(SAUIElementViewController *)self _effectiveProvidedMinimalView];
  long long v11 = *(_OWORD *)&p_minimalViewTransform->c;
  v12[0] = *(_OWORD *)&p_minimalViewTransform->a;
  v12[1] = v11;
  v12[2] = *(_OWORD *)&p_minimalViewTransform->tx;
  [(SAUIElementViewController *)self _synchronizeBlurProgress:v12 alpha:1 squishProgress:1 additionalTransform:v9 isLeading:v10 isMinimal:minimalViewBlurProgress ofTransformView:minimalViewAlpha providedView:minimalViewSquishProgress];
}

- (void)elementView:(id)a3 didLayoutResizedLeadingTransformView:(id)a4
{
  double leadingViewSquishProgress = self->_leadingViewSquishProgress;
  p_leadingViewScale = &self->_leadingViewScale;
  p_leadingViewTransform = &self->_leadingViewTransform;
  id v8 = a4;
  id v9 = [(SAUIElementViewController *)self elementViewProvider];
  uint64_t v10 = [v9 leadingView];
  double width = p_leadingViewScale->width;
  double height = p_leadingViewScale->height;
  long long v13 = *(_OWORD *)&p_leadingViewTransform->c;
  v14[0] = *(_OWORD *)&p_leadingViewTransform->a;
  v14[1] = v13;
  v14[2] = *(_OWORD *)&p_leadingViewTransform->tx;
  -[SAUIElementViewController _setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:", v14, v10, v8, 1, 0, leadingViewSquishProgress, width, height);
}

- (void)elementView:(id)a3 didLayoutResizedTrailingTransformView:(id)a4
{
  double trailingViewSquishProgress = self->_trailingViewSquishProgress;
  p_trailingViewScale = &self->_trailingViewScale;
  p_trailingViewTransform = &self->_trailingViewTransform;
  id v8 = a4;
  id v9 = [(SAUIElementViewController *)self elementViewProvider];
  uint64_t v10 = [v9 trailingView];
  double width = p_trailingViewScale->width;
  double height = p_trailingViewScale->height;
  long long v13 = *(_OWORD *)&p_trailingViewTransform->c;
  v14[0] = *(_OWORD *)&p_trailingViewTransform->a;
  v14[1] = v13;
  v14[2] = *(_OWORD *)&p_trailingViewTransform->tx;
  -[SAUIElementViewController _setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:", v14, v10, v8, 0, 0, trailingViewSquishProgress, width, height);
}

- (void)elementView:(id)a3 didLayoutResizedMinimalTransformView:(id)a4
{
  double minimalViewSquishProgress = self->_minimalViewSquishProgress;
  p_minimalViewScale = &self->_minimalViewScale;
  p_minimalViewTransform = &self->_minimalViewTransform;
  id v8 = a4;
  id v9 = [(SAUIElementViewController *)self _effectiveProvidedMinimalView];
  double width = p_minimalViewScale->width;
  double height = p_minimalViewScale->height;
  long long v12 = *(_OWORD *)&p_minimalViewTransform->c;
  v13[0] = *(_OWORD *)&p_minimalViewTransform->a;
  v13[1] = v12;
  v13[2] = *(_OWORD *)&p_minimalViewTransform->tx;
  -[SAUIElementViewController _setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:", v13, v9, v8, 1, 1, minimalViewSquishProgress, width, height);
}

- (id)snapshotView
{
  return self->_snapshotView;
}

- (id)beginRequiringSnapshotForReason:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotViewAssertion);
  id v6 = [WeakRetained snapshotReason];
  char v7 = BSEqualObjects();

  if ((v7 & 1) == 0)
  {
    [WeakRetained invalidateWithReason:@"different reason requested"];
    [(SAUIElementViewController *)self _insertContentSnapshotView];
    id v8 = self->_snapshotView;
    id v9 = [_SAUIElementViewControllerSnapshotAssertion alloc];
    uint64_t v10 = [(SAUIElementViewController *)self elementViewProvider];
    long long v11 = [v10 element];
    long long v12 = [(_SAUIElementViewControllerSnapshotAssertion *)v9 initWithElement:v11 snapshotReason:v4];

    objc_storeWeak((id *)&self->_snapshotViewAssertion, v12);
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __61__SAUIElementViewController_beginRequiringSnapshotForReason___block_invoke;
    v15[3] = &unk_26552BD88;
    long long v13 = v8;
    double v16 = v13;
    objc_copyWeak(&v17, &location);
    [(SAAssertion *)v12 addInvalidationBlock:v15];
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
    id WeakRetained = v12;
  }

  return WeakRetained;
}

uint64_t __61__SAUIElementViewController_beginRequiringSnapshotForReason___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v5 = WeakRetained;
    if (BSEqualObjects())
    {
      id v3 = (void *)v5[138];
      v5[138] = 0;
    }
  }
  return MEMORY[0x270F9A758]();
}

- (void)setLeadingViewBlurProgress:(double)a3
{
  if (self->_leadingViewBlurProgress != a3)
  {
    self->_double leadingViewBlurProgress = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    double v5 = [WeakRetained leadingTransformView];
    [(SAUILayoutSpecifyingElementViewController *)self _setBlurProgress:v5 forView:a3];
  }
}

- (void)setLeadingViewAlpha:(double)a3
{
  if (self->_leadingViewAlpha != a3)
  {
    self->_double leadingViewAlpha = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    id v4 = [WeakRetained leadingTransformView];
    [v4 setAlpha:self->_leadingViewAlpha];
  }
}

- (void)setLeadingViewSquishProgress:(double)a3
{
  if (self->_leadingViewSquishProgress != a3)
  {
    self->_double leadingViewSquishProgress = a3;
    p_leadingViewScale = &self->_leadingViewScale;
    p_leadingViewTransform = &self->_leadingViewTransform;
    char v7 = [(SAUIElementViewController *)self elementViewProvider];
    id v8 = [v7 leadingView];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    uint64_t v10 = [WeakRetained leadingTransformView];
    double width = p_leadingViewScale->width;
    double height = p_leadingViewScale->height;
    long long v13 = *(_OWORD *)&p_leadingViewTransform->c;
    v14[0] = *(_OWORD *)&p_leadingViewTransform->a;
    v14[1] = v13;
    v14[2] = *(_OWORD *)&p_leadingViewTransform->tx;
    -[SAUIElementViewController _setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:", v14, v8, v10, 1, 0, a3, width, height);
  }
}

- (void)setLeadingViewScale:(CGSize)a3
{
  p_leadingViewScale = &self->_leadingViewScale;
  if (a3.width != self->_leadingViewScale.width || a3.height != self->_leadingViewScale.height)
  {
    p_leadingViewScale->double width = a3.width;
    self->_leadingViewScale.double height = a3.height;
    double leadingViewSquishProgress = self->_leadingViewSquishProgress;
    p_leadingViewTransform = &self->_leadingViewTransform;
    id v8 = [(SAUIElementViewController *)self elementViewProvider];
    id v9 = [v8 leadingView];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    long long v11 = [WeakRetained leadingTransformView];
    double width = p_leadingViewScale->width;
    double height = p_leadingViewScale->height;
    long long v14 = *(_OWORD *)&p_leadingViewTransform->c;
    v15[0] = *(_OWORD *)&p_leadingViewTransform->a;
    v15[1] = v14;
    v15[2] = *(_OWORD *)&p_leadingViewTransform->tx;
    -[SAUIElementViewController _setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:", v15, v9, v11, 1, 0, leadingViewSquishProgress, width, height);
  }
}

- (void)setLeadingViewTransform:(CGAffineTransform *)a3
{
  p_leadingViewTransform = &self->_leadingViewTransform;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  long long v7 = *(_OWORD *)&self->_leadingViewTransform.c;
  *(_OWORD *)&v18.a = *(_OWORD *)&self->_leadingViewTransform.a;
  *(_OWORD *)&v18.c = v7;
  *(_OWORD *)&v18.tx = *(_OWORD *)&self->_leadingViewTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v18))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_leadingViewTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_leadingViewTransform->tx = v9;
    *(_OWORD *)&p_leadingViewTransform->a = v8;
    double leadingViewSquishProgress = self->_leadingViewSquishProgress;
    long long v11 = [(SAUIElementViewController *)self elementViewProvider];
    long long v12 = [v11 leadingView];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    long long v14 = [WeakRetained leadingTransformView];
    double width = self->_leadingViewScale.width;
    double height = self->_leadingViewScale.height;
    long long v17 = *(_OWORD *)&p_leadingViewTransform->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&p_leadingViewTransform->a;
    *(_OWORD *)&t1.c = v17;
    *(_OWORD *)&t1.tx = *(_OWORD *)&p_leadingViewTransform->tx;
    -[SAUIElementViewController _setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:", &t1, v12, v14, 1, 0, leadingViewSquishProgress, width, height);
  }
}

- (void)setTrailingViewBlurProgress:(double)a3
{
  if (self->_trailingViewBlurProgress != a3)
  {
    self->_double trailingViewBlurProgress = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    double v5 = [WeakRetained trailingTransformView];
    [(SAUILayoutSpecifyingElementViewController *)self _setBlurProgress:v5 forView:a3];
  }
}

- (void)setTrailingViewAlpha:(double)a3
{
  if (self->_trailingViewAlpha != a3)
  {
    self->_double trailingViewAlpha = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    id v4 = [WeakRetained trailingTransformView];
    [v4 setAlpha:self->_trailingViewAlpha];
  }
}

- (void)setTrailingViewSquishProgress:(double)a3
{
  if (self->_trailingViewSquishProgress != a3)
  {
    self->_double trailingViewSquishProgress = a3;
    p_trailingViewScale = &self->_trailingViewScale;
    p_trailingViewTransform = &self->_trailingViewTransform;
    long long v7 = [(SAUIElementViewController *)self elementViewProvider];
    long long v8 = [v7 trailingView];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    uint64_t v10 = [WeakRetained trailingTransformView];
    double width = p_trailingViewScale->width;
    double height = p_trailingViewScale->height;
    long long v13 = *(_OWORD *)&p_trailingViewTransform->c;
    v14[0] = *(_OWORD *)&p_trailingViewTransform->a;
    v14[1] = v13;
    v14[2] = *(_OWORD *)&p_trailingViewTransform->tx;
    -[SAUIElementViewController _setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:", v14, v8, v10, 0, 0, a3, width, height);
  }
}

- (void)setTrailingViewScale:(CGSize)a3
{
  p_trailingViewScale = &self->_trailingViewScale;
  if (a3.width != self->_trailingViewScale.width || a3.height != self->_trailingViewScale.height)
  {
    p_trailingViewScale->double width = a3.width;
    self->_trailingViewScale.double height = a3.height;
    double trailingViewSquishProgress = self->_trailingViewSquishProgress;
    p_trailingViewTransform = &self->_trailingViewTransform;
    long long v8 = [(SAUIElementViewController *)self elementViewProvider];
    long long v9 = [v8 trailingView];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    long long v11 = [WeakRetained trailingTransformView];
    double width = p_trailingViewScale->width;
    double height = p_trailingViewScale->height;
    long long v14 = *(_OWORD *)&p_trailingViewTransform->c;
    v15[0] = *(_OWORD *)&p_trailingViewTransform->a;
    v15[1] = v14;
    v15[2] = *(_OWORD *)&p_trailingViewTransform->tx;
    -[SAUIElementViewController _setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:", v15, v9, v11, 0, 0, trailingViewSquishProgress, width, height);
  }
}

- (void)setTrailingViewTransform:(CGAffineTransform *)a3
{
  p_trailingViewTransform = &self->_trailingViewTransform;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  long long v7 = *(_OWORD *)&self->_trailingViewTransform.c;
  *(_OWORD *)&v18.a = *(_OWORD *)&self->_trailingViewTransform.a;
  *(_OWORD *)&v18.c = v7;
  *(_OWORD *)&v18.tx = *(_OWORD *)&self->_trailingViewTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v18))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_trailingViewTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_trailingViewTransform->tx = v9;
    *(_OWORD *)&p_trailingViewTransform->a = v8;
    double trailingViewSquishProgress = self->_trailingViewSquishProgress;
    long long v11 = [(SAUIElementViewController *)self elementViewProvider];
    long long v12 = [v11 trailingView];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    long long v14 = [WeakRetained trailingTransformView];
    double width = self->_trailingViewScale.width;
    double height = self->_trailingViewScale.height;
    long long v17 = *(_OWORD *)&p_trailingViewTransform->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&p_trailingViewTransform->a;
    *(_OWORD *)&t1.c = v17;
    *(_OWORD *)&t1.tx = *(_OWORD *)&p_trailingViewTransform->tx;
    -[SAUIElementViewController _setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:", &t1, v12, v14, 0, 0, trailingViewSquishProgress, width, height);
  }
}

- (void)setMinimalViewBlurProgress:(double)a3
{
  if (self->_minimalViewBlurProgress != a3)
  {
    self->_double minimalViewBlurProgress = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    double v5 = [WeakRetained minimalTransformView];
    [(SAUILayoutSpecifyingElementViewController *)self _setBlurProgress:v5 forView:a3];
  }
}

- (void)setMinimalViewAlpha:(double)a3
{
  if (self->_minimalViewAlpha != a3)
  {
    self->_double minimalViewAlpha = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    id v4 = [WeakRetained minimalTransformView];
    [v4 setAlpha:self->_minimalViewAlpha];
  }
}

- (void)setMinimalViewSquishProgress:(double)a3
{
  if (self->_minimalViewSquishProgress != a3)
  {
    self->_double minimalViewSquishProgress = a3;
    p_minimalViewScale = &self->_minimalViewScale;
    p_minimalViewTransform = &self->_minimalViewTransform;
    long long v7 = [(SAUIElementViewController *)self _effectiveProvidedMinimalView];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    long long v9 = [WeakRetained minimalTransformView];
    double width = p_minimalViewScale->width;
    double height = p_minimalViewScale->height;
    long long v12 = *(_OWORD *)&p_minimalViewTransform->c;
    v13[0] = *(_OWORD *)&p_minimalViewTransform->a;
    v13[1] = v12;
    v13[2] = *(_OWORD *)&p_minimalViewTransform->tx;
    -[SAUIElementViewController _setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:", v13, v7, v9, 1, 1, a3, width, height);
  }
}

- (void)setMinimalViewScale:(CGSize)a3
{
  p_minimalViewScale = &self->_minimalViewScale;
  if (a3.width != self->_minimalViewScale.width || a3.height != self->_minimalViewScale.height)
  {
    p_minimalViewScale->double width = a3.width;
    self->_minimalViewScale.double height = a3.height;
    double minimalViewSquishProgress = self->_minimalViewSquishProgress;
    p_minimalViewTransform = &self->_minimalViewTransform;
    long long v8 = [(SAUIElementViewController *)self _effectiveProvidedMinimalView];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    uint64_t v10 = [WeakRetained minimalTransformView];
    double width = p_minimalViewScale->width;
    double height = p_minimalViewScale->height;
    long long v13 = *(_OWORD *)&p_minimalViewTransform->c;
    v14[0] = *(_OWORD *)&p_minimalViewTransform->a;
    v14[1] = v13;
    v14[2] = *(_OWORD *)&p_minimalViewTransform->tx;
    -[SAUIElementViewController _setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:", v14, v8, v10, 1, 1, minimalViewSquishProgress, width, height);
  }
}

- (void)setMinimalViewTransform:(CGAffineTransform *)a3
{
  p_minimalViewTransform = &self->_minimalViewTransform;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  long long v7 = *(_OWORD *)&self->_minimalViewTransform.c;
  *(_OWORD *)&v17.a = *(_OWORD *)&self->_minimalViewTransform.a;
  *(_OWORD *)&v17.c = v7;
  *(_OWORD *)&v17.tx = *(_OWORD *)&self->_minimalViewTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v17))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_minimalViewTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_minimalViewTransform->tx = v9;
    *(_OWORD *)&p_minimalViewTransform->a = v8;
    double minimalViewSquishProgress = self->_minimalViewSquishProgress;
    long long v11 = [(SAUIElementViewController *)self _effectiveProvidedMinimalView];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    long long v13 = [WeakRetained minimalTransformView];
    double width = self->_minimalViewScale.width;
    double height = self->_minimalViewScale.height;
    long long v16 = *(_OWORD *)&p_minimalViewTransform->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&p_minimalViewTransform->a;
    *(_OWORD *)&t1.c = v16;
    *(_OWORD *)&t1.tx = *(_OWORD *)&p_minimalViewTransform->tx;
    -[SAUIElementViewController _setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:](self, "_setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:", &t1, v11, v13, 1, 1, minimalViewSquishProgress, width, height);
  }
}

- (void)setCustomContentBlurProgress:(double)a3
{
  if (self->_customContentBlurProgress != a3)
  {
    self->_customContentBlurProgress = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    double v5 = [WeakRetained contentView];
    [(SAUILayoutSpecifyingElementViewController *)self _setBlurProgress:v5 forView:a3];
  }
}

- (double)customContentAlpha
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
  id v3 = [WeakRetained contentView];
  [v3 alpha];
  double v5 = v4;

  return v5;
}

- (void)setCustomContentAlpha:(double)a3
{
  [(SAUIElementViewController *)self customContentAlpha];
  if (v5 != a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    long long v6 = [WeakRetained contentView];
    [v6 setAlpha:a3];
  }
}

- (void)setSnapshotViewBlurProgress:(double)a3
{
  if (self->_snapshotViewBlurProgress != a3)
  {
    self->_snapshotViewBlurProgress = a3;
    -[SAUILayoutSpecifyingElementViewController _setBlurProgress:forView:](self, "_setBlurProgress:forView:", self->_snapshotView);
  }
}

- (double)snapshotViewAlpha
{
  [(UIView *)self->_snapshotView alpha];
  return result;
}

- (void)setSnapshotViewAlpha:(double)a3
{
  [(SAUIElementViewController *)self snapshotViewAlpha];
  if (v5 != a3)
  {
    snapshotView = self->_snapshotView;
    [(UIView *)snapshotView setAlpha:a3];
  }
}

- (id)_elementView
{
  p_elementView = &self->_elementView;
  id WeakRetained = (SAUIElementView *)objc_loadWeakRetained((id *)&self->_elementView);
  if (!WeakRetained)
  {
    double v5 = [SAUIElementView alloc];
    long long v6 = [(SAUIElementViewController *)self elementViewProvider];
    id WeakRetained = [(SAUIElementView *)v5 initWithElementViewProvider:v6];

    objc_storeWeak((id *)p_elementView, WeakRetained);
    [(SAUIElementView *)WeakRetained setDelegate:self];
  }
  return WeakRetained;
}

- (void)_setSquishProgress:(double)a3 additionalScale:(CGSize)a4 additionalTransform:(CGAffineTransform *)a5 forProvidedView:(id)a6 transformView:(id)a7 isLeading:(BOOL)a8 isMinimal:(BOOL)a9
{
  if (a6 && a7)
  {
    BOOL v9 = a8;
    CGFloat height = a4.height;
    CGFloat width = a4.width;
    id v16 = a7;
    id v17 = a6;
    CGAffineTransform v18 = [(SAUIElementViewController *)self view];
    int v19 = [v18 _shouldReverseLayoutDirection];

    double v20 = -1.0;
    if (v9) {
      double v20 = 1.0;
    }
    CGFloat v21 = height;
    if (v19) {
      double v22 = v20;
    }
    else {
      double v22 = -v20;
    }
    [v17 bounds];
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;

    v39.origin.x = v24;
    v39.origin.y = v26;
    v39.size.CGFloat width = v28;
    v39.size.CGFloat height = v30;
    double v31 = CGRectGetWidth(v39);
    memset(&v38, 0, sizeof(v38));
    CGAffineTransformMakeScale(&t1, 1.0 - a3, 1.0);
    CGAffineTransformMakeTranslation(&t2, v22 * a3 * v31 * 0.5, 0.0);
    CGAffineTransformConcat(&v38, &t1, &t2);
    if (!BSFloatIsOne() || (BSFloatIsOne() & 1) == 0)
    {
      CGAffineTransform v34 = v38;
      CGAffineTransformScale(&v35, &v34, width, v21);
      CGAffineTransform v38 = v35;
    }
    CGAffineTransform v34 = v38;
    long long v32 = *(_OWORD *)&a5->c;
    *(_OWORD *)&v33.a = *(_OWORD *)&a5->a;
    *(_OWORD *)&v33.c = v32;
    *(_OWORD *)&v33.tx = *(_OWORD *)&a5->tx;
    CGAffineTransformConcat(&v35, &v34, &v33);
    CGAffineTransform v38 = v35;
    [v16 setTransform:&v35];
  }
}

- (void)_synchronizeBlurProgress:(double)a3 alpha:(double)a4 squishProgress:(double)a5 additionalTransform:(CGAffineTransform *)a6 isLeading:(BOOL)a7 isMinimal:(BOOL)a8 ofTransformView:(id)a9 providedView:(id)a10
{
  id v18 = a9;
  id v19 = a10;
  double v20 = (void *)MEMORY[0x263F1CB60];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __144__SAUIElementViewController__synchronizeBlurProgress_alpha_squishProgress_additionalTransform_isLeading_isMinimal_ofTransformView_providedView___block_invoke;
  v24[3] = &unk_26552BDB0;
  v24[4] = self;
  id v25 = v18;
  double v27 = a3;
  double v28 = a4;
  BOOL v33 = a8;
  BOOL v34 = a7;
  double v29 = a5;
  long long v21 = *(_OWORD *)&a6->c;
  long long v30 = *(_OWORD *)&a6->a;
  long long v31 = v21;
  long long v32 = *(_OWORD *)&a6->tx;
  id v26 = v19;
  id v22 = v19;
  id v23 = v18;
  [v20 performWithoutAnimation:v24];
}

uint64_t __144__SAUIElementViewController__synchronizeBlurProgress_alpha_squishProgress_additionalTransform_isLeading_isMinimal_ofTransformView_providedView___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setBlurProgress:*(void *)(a1 + 40) forView:*(double *)(a1 + 56)];
  [*(id *)(a1 + 40) setAlpha:*(double *)(a1 + 64)];
  int v2 = *(unsigned __int8 *)(a1 + 128);
  if (*(unsigned char *)(a1 + 128))
  {
    id v3 = *(double **)(a1 + 32);
    double v4 = v3 + 156;
    BOOL v5 = *(unsigned char *)(a1 + 129) != 0;
  }
  else
  {
    id v3 = *(double **)(a1 + 32);
    if (*(unsigned char *)(a1 + 129))
    {
      double v4 = v3 + 152;
      BOOL v5 = 1;
    }
    else
    {
      BOOL v5 = 0;
      double v4 = v3 + 154;
    }
  }
  double v6 = *v4;
  double v7 = v4[1];
  double v8 = *(double *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  long long v11 = *(_OWORD *)(a1 + 96);
  v13[0] = *(_OWORD *)(a1 + 80);
  v13[1] = v11;
  v13[2] = *(_OWORD *)(a1 + 112);
  return objc_msgSend(v3, "_setSquishProgress:additionalScale:additionalTransform:forProvidedView:transformView:isLeading:isMinimal:", v13, v9, v10, v5, v2 != 0, v8, v6, v7);
}

- (id)_effectiveProvidedMinimalView
{
  int v2 = [(SAUIElementViewController *)self elementViewProvider];
  id v3 = [v2 minimalView];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 leadingView];
  }
  double v6 = v5;

  return v6;
}

- (void)_insertContentSnapshotView
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __55__SAUIElementViewController__insertContentSnapshotView__block_invoke;
  v2[3] = &unk_26552BAE0;
  v2[4] = self;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v2];
}

void __55__SAUIElementViewController__insertContentSnapshotView__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) view];
  uint64_t v2 = [v6 snapshotViewAfterScreenUpdates:0];
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(v3 + 1104);
  *(void *)(v3 + 1104) = v2;

  [*(id *)(a1 + 32) _insertSnapshotView:*(void *)(*(void *)(a1 + 32) + 1104)];
  id v5 = *(void **)(*(void *)(a1 + 32) + 1104);
  [v6 bounds];
  objc_msgSend(v5, "setFrame:");
  [*(id *)(*(void *)(a1 + 32) + 1104) setContentMode:1];
  [*(id *)(*(void *)(a1 + 32) + 1104) setAutoresizingMask:18];
  [*(id *)(*(void *)(a1 + 32) + 1104) setUserInteractionEnabled:0];
}

- (double)leadingViewBlurProgress
{
  return self->_leadingViewBlurProgress;
}

- (double)leadingViewAlpha
{
  return self->_leadingViewAlpha;
}

- (double)leadingViewSquishProgress
{
  return self->_leadingViewSquishProgress;
}

- (CGSize)leadingViewScale
{
  double width = self->_leadingViewScale.width;
  double height = self->_leadingViewScale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGAffineTransform)leadingViewTransform
{
  long long v3 = *(_OWORD *)&self[26].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[26].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[27].a;
  return self;
}

- (double)trailingViewBlurProgress
{
  return self->_trailingViewBlurProgress;
}

- (double)trailingViewAlpha
{
  return self->_trailingViewAlpha;
}

- (double)trailingViewSquishProgress
{
  return self->_trailingViewSquishProgress;
}

- (CGSize)trailingViewScale
{
  double width = self->_trailingViewScale.width;
  double height = self->_trailingViewScale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGAffineTransform)trailingViewTransform
{
  long long v3 = *(_OWORD *)&self[27].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[27].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[28].a;
  return self;
}

- (double)minimalViewBlurProgress
{
  return self->_minimalViewBlurProgress;
}

- (double)minimalViewAlpha
{
  return self->_minimalViewAlpha;
}

- (double)minimalViewSquishProgress
{
  return self->_minimalViewSquishProgress;
}

- (CGSize)minimalViewScale
{
  double width = self->_minimalViewScale.width;
  double height = self->_minimalViewScale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGAffineTransform)minimalViewTransform
{
  long long v3 = *(_OWORD *)&self[28].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[28].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[29].a;
  return self;
}

- (double)customContentBlurProgress
{
  return self->_customContentBlurProgress;
}

- (double)snapshotViewBlurProgress
{
  return self->_snapshotViewBlurProgress;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_snapshotViewAssertion);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_destroyWeak((id *)&self->_elementView);
}

- (void)viewWillTransitionToSize:(uint64_t)a1 withTransitionCoordinator:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_25E6E1000, a2, OS_LOG_TYPE_DEBUG, "View will transition with settings: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end