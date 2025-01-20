@interface SAUIElementView
- (BOOL)_configureLeadingTransformViewIfNecessary;
- (BOOL)_configureMinimalTransformViewIfNecessary;
- (BOOL)_configureTrailingTransformViewIfNecessary;
- (BOOL)_configureTransformView:(id *)a3 ifNecessaryWithProvidedView:(id)a4 assertIfConfigurationRequired:(id)a5;
- (NSDirectionalEdgeInsets)suggestedOutsetsForLayoutMode:(int64_t)a3 maximumOutsets:(NSDirectionalEdgeInsets)a4;
- (SAUIElementView)initWithElementViewProvider:(id)a3;
- (SAUIElementViewDelegate)delegate;
- (SAUIElementViewProviding)elementViewProvider;
- (UIView)contentView;
- (_SAUIProvidedViewContainerView)leadingTransformView;
- (_SAUIProvidedViewContainerView)minimalTransformView;
- (_SAUIProvidedViewContainerView)trailingTransformView;
- (double)_paddingForView:(id)a3 fromProvider:(id)a4 inLayoutMode:(int64_t)a5;
- (id)_effectiveMinimalView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)layoutAxis;
- (void)_didLayoutResizedTransformView:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setLayoutAxis:(unint64_t)a3;
- (void)setLeadingTransformView:(id)a3;
- (void)setMinimalTransformView:(id)a3;
- (void)setTrailingTransformView:(id)a3;
@end

@implementation SAUIElementView

- (SAUIElementView)initWithElementViewProvider:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SAUIElementView;
  v6 = -[SAUIElementView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_elementViewProvider, a3);
    v8 = [_SAUIElementViewContentView alloc];
    [(SAUIElementView *)v7 bounds];
    uint64_t v9 = -[_SAUIElementViewContentView initWithFrame:](v8, "initWithFrame:");
    contentView = v7->_contentView;
    v7->_contentView = (UIView *)v9;

    [(SAUIElementView *)v7 addSubview:v7->_contentView];
    [(UIView *)v7->_contentView setAutoresizingMask:18];
  }

  return v7;
}

- (_SAUIProvidedViewContainerView)minimalTransformView
{
  if ([(SAUIElementView *)self _configureMinimalTransformViewIfNecessary]) {
    [(SAUIElementView *)self setNeedsLayout];
  }
  minimalTransformView = self->_minimalTransformView;
  return minimalTransformView;
}

- (NSDirectionalEdgeInsets)suggestedOutsetsForLayoutMode:(int64_t)a3 maximumOutsets:(NSDirectionalEdgeInsets)a4
{
  double v5 = *MEMORY[0x263F1C228];
  double v4 = *(double *)(MEMORY[0x263F1C228] + 8);
  double v7 = *(double *)(MEMORY[0x263F1C228] + 16);
  double v6 = *(double *)(MEMORY[0x263F1C228] + 24);
  if (a3 >= 1)
  {
    if (a3 == 1)
    {
      unint64_t layoutAxis = self->_layoutAxis;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector())
      {
        [WeakRetained maximumSizeOfMinimalViewForElementView:self];
        double v12 = *MEMORY[0x263F001B0];
        double v13 = *(double *)(MEMORY[0x263F001B0] + 8);
        BOOL v14 = v10 == *MEMORY[0x263F001B0];
        if (v11 != v13) {
          BOOL v14 = 0;
        }
        if (layoutAxis != 2) {
          BOOL v14 = 1;
        }
        if (v14) {
          double v15 = v11;
        }
        else {
          double v15 = v10;
        }
        if (v14) {
          double v16 = v10;
        }
        else {
          double v16 = v11;
        }
      }
      else
      {
        double v12 = *MEMORY[0x263F001B0];
        double v13 = *(double *)(MEMORY[0x263F001B0] + 8);
        double v15 = 1.79769313e308;
        double v16 = 1.79769313e308;
      }
      v23 = [(SAUIElementView *)self _effectiveMinimalView];
      if (objc_opt_respondsToSelector())
      {
        -[SAUIElementViewProviding sizeThatFitsSize:forProvidedView:inLayoutMode:](self->_elementViewProvider, "sizeThatFitsSize:forProvidedView:inLayoutMode:", v23, 1, v16, v15);
        double v12 = v24;
        double v13 = v25;
      }
      if (v12 == 0.0 && v13 == 0.0)
      {
        objc_msgSend(v23, "sizeThatFits:", v16, v15);
        double v12 = v26;
        double v13 = v27;
      }
      if (layoutAxis == 2) {
        double v28 = v13;
      }
      else {
        double v28 = v12;
      }
      double v29 = -v28;
      [(SAUIElementView *)self _paddingForView:v23 fromProvider:self->_elementViewProvider inLayoutMode:1];
      double v31 = v30;
      double v4 = v29 - v30;
      double v6 = 0.0;
      if (objc_opt_respondsToSelector())
      {
        if ([WeakRetained elementViewShouldCenterProvidedContent:self]) {
          double v32 = v31;
        }
        else {
          double v32 = 0.0;
        }
        double v4 = v4 - v32;
      }
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v19 = objc_opt_respondsToSelector();
      if (v19)
      {
        [WeakRetained maximumSizeOfLeadingViewForElementView:self];
        double v21 = v20;
        double v58 = v22;
      }
      else
      {
        double v21 = 1.79769313e308;
        double v58 = 1.79769313e308;
      }
      if (objc_opt_respondsToSelector())
      {
        [WeakRetained maximumSizeOfTrailingViewForElementView:self];
        double v34 = v33;
        [(SAUIElementViewProviding *)self->_elementViewProvider leadingView];
      }
      else
      {
        double v34 = 1.79769313e308;
        [(SAUIElementViewProviding *)self->_elementViewProvider leadingView];
      v23 = };
      v36 = [(SAUIElementViewProviding *)self->_elementViewProvider trailingView];
      double v37 = 0.0;
      double v38 = 0.0;
      if (objc_opt_respondsToSelector())
      {
        -[SAUIElementViewProviding sizeThatFitsSize:forProvidedView:inLayoutMode:](self->_elementViewProvider, "sizeThatFitsSize:forProvidedView:inLayoutMode:", v23, a3, v21, v58);
        double v38 = v39;
        -[SAUIElementViewProviding sizeThatFitsSize:forProvidedView:inLayoutMode:](self->_elementViewProvider, "sizeThatFitsSize:forProvidedView:inLayoutMode:", v36, a3, v34, v57);
        double v37 = v40;
      }
      if (fabs(v38) < 2.22044605e-16)
      {
        objc_msgSend(v23, "sizeThatFits:", v21, v58);
        double v38 = v41;
      }
      if (fabs(v37) < 2.22044605e-16)
      {
        objc_msgSend(v36, "sizeThatFits:", v34, v57);
        double v37 = v42;
      }
      double v43 = -v38;
      if (v38 >= v37) {
        double v44 = v38;
      }
      else {
        double v44 = v37;
      }
      double v45 = -v44;
      if (a3 == 3) {
        double v46 = v45;
      }
      else {
        double v46 = -v38;
      }
      if (a3 == 3) {
        double v47 = v45;
      }
      else {
        double v47 = -v37;
      }
      if (v46 != v4 || v5 != 0.0 || v47 != v6 || v7 != 0.0)
      {
        v48 = [(SAUIElementViewProviding *)self->_elementViewProvider leadingView];
        [(SAUIElementView *)self _paddingForView:v48 fromProvider:self->_elementViewProvider inLayoutMode:a3];
        double v50 = v49;

        double v46 = v46 - v50;
        v51 = [(SAUIElementViewProviding *)self->_elementViewProvider trailingView];
        [(SAUIElementView *)self _paddingForView:v51 fromProvider:self->_elementViewProvider inLayoutMode:a3];
        double v47 = v47 - v52;
      }
      double v6 = v47;
      double v4 = v46;
    }

    double v7 = 0.0;
    double v5 = 0.0;
  }
  double v53 = v5;
  double v54 = v4;
  double v55 = v7;
  double v56 = v6;
  result.trailing = v56;
  result.bottom = v55;
  result.leading = v54;
  result.top = v53;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SAUIElementView;
  -[SAUIElementView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (SAUIElementView *)objc_claimAutoreleasedReturnValue();
  double v6 = v5;
  if (v5 == self) {
    double v5 = 0;
  }
  double v7 = v5;

  return v7;
}

- (void)layoutSubviews
{
  v89.receiver = self;
  v89.super_class = (Class)SAUIElementView;
  [(SAUIElementView *)&v89 layoutSubviews];
  BOOL v3 = [(SAUIElementView *)self _configureMinimalTransformViewIfNecessary];
  BOOL v60 = [(SAUIElementView *)self _configureLeadingTransformViewIfNecessary];
  BOOL v61 = [(SAUIElementView *)self _configureTrailingTransformViewIfNecessary];
  [(SAUIElementView *)self bounds];
  rect.origin.x = v4;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v63 = [(SAUIElementView *)self traitCollection];
  [v63 displayScale];
  uint64_t v64 = v11;
  double v12 = [(SAUIElementView *)self traitCollection];
  uint64_t v13 = [v12 layoutDirection];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v15 = [WeakRetained layoutModeForElementView:self];

  uint64_t v16 = [(SAUIElementViewProviding *)self->_elementViewProvider leadingView];
  v17 = [(SAUIElementView *)self _effectiveMinimalView];
  v18 = [(SAUIElementViewProviding *)self->_elementViewProvider trailingView];
  v62 = (void *)v16;
  if (v15 == 1) {
    char v19 = v17;
  }
  else {
    char v19 = (void *)v16;
  }
  id v20 = v19;
  objc_msgSend(v20, "sizeThatFits:", v8, v10);
  BSRectWithSize();
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  id v29 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v15 == 1
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v29 elementViewShouldCenterProvidedContent:self])
  {
    uint64_t v59 = v64;
    UIRectCenteredIntegralRectScale();
  }
  else
  {
    [(SAUIElementView *)self _paddingForView:v20 fromProvider:self->_elementViewProvider inLayoutMode:v15];
    if (self->_layoutAxis == 2)
    {
      uint64_t v59 = v64;
      UIRectCenteredXInRectScale();
    }
    else
    {
      if (v13 == 1)
      {
        v90.origin.x = rect.origin.x;
        v90.origin.y = v6;
        v90.size.width = v8;
        v90.size.height = v10;
        CGRectGetWidth(v90);
        v91.origin.x = v22;
        v91.origin.y = v24;
        v91.size.width = v26;
        v91.size.height = v28;
        CGRectGetWidth(v91);
      }
      uint64_t v59 = v64;
      UIRectCenteredYInRectScale();
    }
  }
  double v34 = v30;
  double v35 = v31;
  double v36 = v32;
  double v37 = v33;
  v88[0] = MEMORY[0x263EF8330];
  v88[1] = 3221225472;
  v88[2] = __33__SAUIElementView_layoutSubviews__block_invoke;
  v88[3] = &__block_descriptor_40_e85_v56__0___SAUIProvidedViewContainerView_8__UIView_16_CGRect__CGPoint_dd__CGSize_dd__24l;
  v88[4] = v15;
  double v38 = (void (**)(void, void, void, double, double, double, double))MEMORY[0x2611E1790](v88);
  double v39 = v38;
  if (v3)
  {
    double v40 = (void *)MEMORY[0x263F1CB60];
    v81[0] = MEMORY[0x263EF8330];
    v81[1] = 3221225472;
    v81[2] = __33__SAUIElementView_layoutSubviews__block_invoke_2;
    v81[3] = &unk_26552BDF8;
    v83 = v38;
    v81[4] = self;
    id v82 = v20;
    double v84 = v34;
    double v85 = v35;
    double v86 = v36;
    double v87 = v37;
    objc_msgSend(v40, "performWithoutAnimation:", v81, v59);
  }
  else
  {
    ((void (**)(void, _SAUIProvidedViewContainerView *, id, double, double, double, double))v38)[2](v38, self->_minimalTransformView, v20, v34, v35, v36, v37);
  }
  if (v60)
  {
    double v41 = (void *)MEMORY[0x263F1CB60];
    v74[0] = MEMORY[0x263EF8330];
    v74[1] = 3221225472;
    v74[2] = __33__SAUIElementView_layoutSubviews__block_invoke_3;
    v74[3] = &unk_26552BDF8;
    v76 = v39;
    v74[4] = self;
    id v75 = v20;
    double v77 = v34;
    double v78 = v35;
    double v79 = v36;
    double v80 = v37;
    [v41 performWithoutAnimation:v74];
  }
  else
  {
    ((void (**)(void, _SAUIProvidedViewContainerView *, id, double, double, double, double))v39)[2](v39, self->_leadingTransformView, v20, v34, v35, v36, v37);
  }
  objc_msgSend(v18, "sizeThatFits:", v8, v10, v59);
  BSRectWithSize();
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  CGFloat v47 = v46;
  CGFloat v49 = v48;
  [(SAUIElementView *)self _paddingForView:v18 fromProvider:self->_elementViewProvider inLayoutMode:v15];
  if (v13 != 1)
  {
    v92.origin.x = rect.origin.x;
    v92.origin.y = v6;
    v92.size.width = v8;
    v92.size.height = v10;
    CGRectGetWidth(v92);
    v93.origin.x = v43;
    v93.origin.y = v45;
    v93.size.width = v47;
    v93.size.height = v49;
    CGRectGetWidth(v93);
  }
  UIRectCenteredYInRectScale();
  unint64_t v54 = v50.n128_u64[0];
  unint64_t v55 = v51.n128_u64[0];
  unint64_t v56 = v52.n128_u64[0];
  unint64_t v57 = v53.n128_u64[0];
  if (v61)
  {
    double v58 = (void *)MEMORY[0x263F1CB60];
    *(void *)&rect.origin.y = MEMORY[0x263EF8330];
    *(void *)&rect.size.width = 3221225472;
    *(void *)&rect.size.height = __33__SAUIElementView_layoutSubviews__block_invoke_4;
    v66 = &unk_26552BDF8;
    v69 = v39;
    v67 = self;
    id v68 = v18;
    unint64_t v70 = v54;
    unint64_t v71 = v55;
    unint64_t v72 = v56;
    unint64_t v73 = v57;
    objc_msgSend(v58, "performWithoutAnimation:", &rect.origin.y, v64);
  }
  else
  {
    ((void (*)(void (**)(void, void, void, double, double, double, double), _SAUIProvidedViewContainerView *, void *, __n128, __n128, __n128, __n128))v39[2])(v39, self->_trailingTransformView, v18, v50, v51, v52, v53);
  }
}

void __33__SAUIElementView_layoutSubviews__block_invoke(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v14 = a2;
  id v13 = a3;
  SAUISetViewFrameMaintainingTransform(v14, a4, a5, a6, a7);
  if (*(void *)(a1 + 32) != 3 && [v14 portalsProvidedView])
  {
    objc_msgSend(v13, "setFrame:", a4, a5, a6, a7);
    [v13 layoutIfNeeded];
  }
}

uint64_t __33__SAUIElementView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, double, double, double, double))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(*(void *)(a1 + 32) + 432), *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

uint64_t __33__SAUIElementView_layoutSubviews__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, double, double, double, double))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(*(void *)(a1 + 32) + 440), *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

uint64_t __33__SAUIElementView_layoutSubviews__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, double, double, double, double))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(*(void *)(a1 + 32) + 448), *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (void)setLayoutAxis:(unint64_t)a3
{
  if (a3 - 1 <= 1 && self->_layoutAxis != a3)
  {
    self->_unint64_t layoutAxis = a3;
    if (objc_opt_respondsToSelector()) {
      [(SAUIElementViewProviding *)self->_elementViewProvider setLayoutAxis:self->_layoutAxis];
    }
    [(SAUIElementView *)self setNeedsLayout];
  }
}

- (double)_paddingForView:(id)a3 fromProvider:(id)a4 inLayoutMode:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = 12.0;
  if (v8
    && ((objc_opt_respondsToSelector() & 1) == 0
     || [v9 isProvidedViewConcentric:v8 inLayoutMode:a5]))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      [WeakRetained concentricPaddingForProvidedView:v8 fromViewProvider:v9];
      double v10 = v12;
    }
  }
  return v10;
}

- (BOOL)_configureTransformView:(id *)a3 ifNecessaryWithProvidedView:(id)a4 assertIfConfigurationRequired:(id)a5
{
  id v9 = a4;
  double v10 = (void (**)(void))a5;
  if (!a3)
  {
    id v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SAUIElementView.m", 255, @"Invalid parameter not satisfying: %@", @"transformViewPtr != nil" object file lineNumber description];
  }
  uint64_t v11 = (_SAUIProvidedViewContainerView *)*a3;
  double v12 = v11;
  if (v9
    && ([(_SAUIProvidedViewContainerView *)v11 providedView],
        id v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = BSEqualObjects(),
        v13,
        (v14 & 1) == 0))
  {
    [(_SAUIProvidedViewContainerView *)v12 setProvidedView:0];
    [(_SAUIProvidedViewContainerView *)v12 removeFromSuperview];
    uint64_t v16 = objc_alloc_init(_SAUIProvidedViewContainerView);

    [(_SAUIProvidedViewContainerView *)v16 setProvidedView:v9];
    [(_SAUIProvidedViewContainerView *)v16 setElementView:self];
    int v15 = 1;
    double v12 = v16;
  }
  else
  {
    int v15 = 0;
  }
  objc_storeStrong(a3, v12);
  if (v10 && v15) {
    v10[2](v10);
  }
  if (!*a3
    || ([*a3 superview],
        v17 = (SAUIElementView *)objc_claimAutoreleasedReturnValue(),
        v17,
        v17 == self))
  {
    BOOL v18 = 0;
  }
  else
  {
    if ([*a3 portalsProvidedView]) {
      [(UIView *)self->_contentView addSubview:v9];
    }
    [(SAUIElementView *)self addSubview:*a3];
    BOOL v18 = 1;
  }

  return v18;
}

- (id)_effectiveMinimalView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [WeakRetained isMinimalViewIsolatedForElementView:self]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v4 = [(SAUIElementViewProviding *)self->_elementViewProvider detachedMinimalView];
  }
  else
  {
    uint64_t v4 = [(SAUIElementViewProviding *)self->_elementViewProvider minimalView];
  }
  double v5 = (void *)v4;
  if (!v4)
  {
    CGFloat v6 = [(SAUIElementViewProviding *)self->_elementViewProvider minimalView];
    double v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(SAUIElementViewProviding *)self->_elementViewProvider leadingView];
    }
    double v5 = v8;
  }
  return v5;
}

- (BOOL)_configureMinimalTransformViewIfNecessary
{
  uint64_t v4 = [(SAUIElementView *)self _effectiveMinimalView];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__SAUIElementView__configureMinimalTransformViewIfNecessary__block_invoke;
  v9[3] = &unk_26552BE20;
  v9[4] = self;
  id v5 = v4;
  id v10 = v5;
  SEL v11 = a2;
  BOOL v6 = [(SAUIElementView *)self _configureTransformView:&self->_minimalTransformView ifNecessaryWithProvidedView:v5 assertIfConfigurationRequired:v9];
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained elementView:self didConfigureMinimalTransformView:self->_minimalTransformView];
    }
  }
  return v6;
}

void __60__SAUIElementView__configureMinimalTransformViewIfNecessary__block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 416) leadingView];
  if (v2 == (void *)a1[5])
  {
    id v4 = v2;
    char v3 = [*(id *)(a1[4] + 432) portalsProvidedView];

    if (v3) {
      return;
    }
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a1[6], a1[4], @"SAUIElementView.m", 293, @"If the provided minimal and leading views are the same, only portalling is supported." object file lineNumber description];
    v2 = v5;
  }
}

- (BOOL)_configureLeadingTransformViewIfNecessary
{
  p_leadingTransformView = &self->_leadingTransformView;
  id v4 = [(SAUIElementViewProviding *)self->_elementViewProvider leadingView];
  BOOL v5 = [(SAUIElementView *)self _configureTransformView:p_leadingTransformView ifNecessaryWithProvidedView:v4 assertIfConfigurationRequired:0];

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained elementView:self didConfigureLeadingTransformView:*p_leadingTransformView];
    }
  }
  return v5;
}

- (BOOL)_configureTrailingTransformViewIfNecessary
{
  p_trailingTransformView = &self->_trailingTransformView;
  id v4 = [(SAUIElementViewProviding *)self->_elementViewProvider trailingView];
  BOOL v5 = [(SAUIElementView *)self _configureTransformView:p_trailingTransformView ifNecessaryWithProvidedView:v4 assertIfConfigurationRequired:0];

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained elementView:self didConfigureTrailingTransformView:*p_trailingTransformView];
    }
  }
  return v5;
}

- (void)_didLayoutResizedTransformView:(id)a3
{
  BOOL v6 = (_SAUIProvidedViewContainerView *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v5 = WeakRetained;
  if (self->_minimalTransformView == v6)
  {
    objc_msgSend(WeakRetained, "elementView:didLayoutResizedMinimalTransformView:", self);
  }
  else if (self->_leadingTransformView == v6)
  {
    objc_msgSend(WeakRetained, "elementView:didLayoutResizedLeadingTransformView:", self);
  }
  else if (self->_trailingTransformView == v6)
  {
    [WeakRetained elementView:self didLayoutResizedTrailingTransformView:v6];
  }
}

- (unint64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (SAUIElementViewProviding)elementViewProvider
{
  return self->_elementViewProvider;
}

- (SAUIElementViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SAUIElementViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setMinimalTransformView:(id)a3
{
}

- (_SAUIProvidedViewContainerView)leadingTransformView
{
  return self->_leadingTransformView;
}

- (void)setLeadingTransformView:(id)a3
{
}

- (_SAUIProvidedViewContainerView)trailingTransformView
{
  return self->_trailingTransformView;
}

- (void)setTrailingTransformView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_trailingTransformView, 0);
  objc_storeStrong((id *)&self->_leadingTransformView, 0);
  objc_storeStrong((id *)&self->_minimalTransformView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_elementViewProvider, 0);
}

@end