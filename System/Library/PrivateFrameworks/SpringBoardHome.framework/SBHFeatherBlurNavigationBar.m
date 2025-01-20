@interface SBHFeatherBlurNavigationBar
- (BOOL)allowsAnimatedUpdating;
- (BOOL)hidesFeatherBlur;
- (CGRect)_calculateCompactNavBarFrame;
- (CGRect)_calculateFeatherBlurBackgroundViewFrame;
- (CGRect)gradientMaskFrame;
- (SBFFeatherBlurView)featherBlurBackgroundView;
- (SBHFeatherBlurNavigationBar)initWithFrame:(CGRect)a3;
- (double)_defaultHeightForMetrics;
- (double)_topMargin;
- (double)sb_maximumNavbarHeight;
- (double)sb_minimumNavbarHeight;
- (id)_capturedLargeTextLabelContainerView;
- (id)_capturedTinyTextLabelContainerView;
- (int64_t)barPosition;
- (void)_updateAppearance;
- (void)_updateAppearanceAfterTraitChange;
- (void)_updateHeights;
- (void)_updateLabel;
- (void)_updateLabelAlphas;
- (void)layoutSubviews;
- (void)setAllowsAnimatedUpdating:(BOOL)a3;
- (void)setFeatherBlurBackgroundView:(id)a3;
- (void)setHidesFeatherBlur:(BOOL)a3;
@end

@implementation SBHFeatherBlurNavigationBar

- (SBHFeatherBlurNavigationBar)initWithFrame:(CGRect)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)SBHFeatherBlurNavigationBar;
  v3 = -[SBHFeatherBlurNavigationBar initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FA5F00]) initWithRecipe:2];
    featherBlurBackgroundView = v3->_featherBlurBackgroundView;
    v3->_featherBlurBackgroundView = (SBFFeatherBlurView *)v4;

    [(SBHFeatherBlurNavigationBar *)v3 _setBackgroundView:v3->_featherBlurBackgroundView];
    uint64_t v6 = objc_opt_new();
    featherBlurTitleLabel = v3->_featherBlurTitleLabel;
    v3->_featherBlurTitleLabel = (UILabel *)v6;

    [(UILabel *)v3->_featherBlurTitleLabel setAlpha:0.0];
    [(SBHFeatherBlurNavigationBar *)v3 addSubview:v3->_featherBlurTitleLabel];
    [(SBHFeatherBlurNavigationBar *)v3 setOverrideUserInterfaceStyle:2];
    [(SBHFeatherBlurNavigationBar *)v3 setPrefersLargeTitles:1];
    [(SBHFeatherBlurNavigationBar *)v3 _updateAppearance];
    [(SBHFeatherBlurNavigationBar *)v3 _updateLabel];
    [(SBHFeatherBlurNavigationBar *)v3 _updateHeights];
    v8 = self;
    v13[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v10 = (id)[(SBHFeatherBlurNavigationBar *)v3 registerForTraitChanges:v9 withAction:sel__updateAppearanceAfterTraitChange];
  }
  return v3;
}

- (int64_t)barPosition
{
  return 2;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)SBHFeatherBlurNavigationBar;
  [(SBHFeatherBlurNavigationBar *)&v18 layoutSubviews];
  [(SBHFeatherBlurNavigationBar *)self _updateHeights];
  [(SBHFeatherBlurNavigationBar *)self _updateLabel];
  [(SBHFeatherBlurNavigationBar *)self _calculateCompactNavBarFrame];
  [(SBHFeatherBlurNavigationBar *)self _calculateFeatherBlurBackgroundViewFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[SBFFeatherBlurView setFrame:](self->_featherBlurBackgroundView, "setFrame:");
  v11 = [(SBFFeatherBlurView *)self->_featherBlurBackgroundView window];
  featherBlurBackgroundView = self->_featherBlurBackgroundView;
  if (v11)
  {
    [(SBFFeatherBlurView *)self->_featherBlurBackgroundView bounds];
    -[SBFFeatherBlurView convertRect:toCoordinateSpace:](featherBlurBackgroundView, "convertRect:toCoordinateSpace:", v11);
    v13 = objc_msgSend(MEMORY[0x1E4FA5F00], "matchMoveAnimationForFrame:relativeToView:", v11);
    v14 = [(SBFFeatherBlurView *)self->_featherBlurBackgroundView layer];
    [v14 addAnimation:v13 forKey:@"SBHFeatherBlurNavigationBarMatchMoveAnimation"];
  }
  else
  {
    v13 = [(SBFFeatherBlurView *)self->_featherBlurBackgroundView layer];
    [v13 removeAnimationForKey:@"SBHFeatherBlurNavigationBarMatchMoveAnimation"];
  }

  featherBlurTitleLabel = self->_featherBlurTitleLabel;
  [(UILabel *)featherBlurTitleLabel frame];
  UIRectCenteredRect();
  -[UILabel setFrame:](featherBlurTitleLabel, "setFrame:");
  [(SBHFeatherBlurNavigationBar *)self bringSubviewToFront:self->_featherBlurBackgroundView];
  [(SBHFeatherBlurNavigationBar *)self bringSubviewToFront:self->_featherBlurTitleLabel];
  self->_gradientMaskFrame.origin.x = v4;
  self->_gradientMaskFrame.origin.y = v6;
  self->_gradientMaskFrame.size.width = v8;
  self->_gradientMaskFrame.size.height = v10;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_capturedTinyTextLabelContainerView);
  [WeakRetained setHidden:1];
  id v17 = objc_loadWeakRetained((id *)&self->_capturedLargeTextLabelContainerView);
  [v17 setClipsToBounds:0];
  [(SBHFeatherBlurNavigationBar *)self _updateLabelAlphas];
}

- (void)setHidesFeatherBlur:(BOOL)a3
{
  if (self->_hidesFeatherBlur != a3)
  {
    self->_hidesFeatherBlur = a3;
    uint64_t v4 = [(SBHFeatherBlurNavigationBar *)self superview];
    if (v4)
    {
      double v5 = (void *)v4;
      CGFloat v6 = [(SBHFeatherBlurNavigationBar *)self window];

      if (v6)
      {
        [(SBHFeatherBlurNavigationBar *)self _updateAppearanceAfterTraitChange];
      }
    }
  }
}

- (id)_capturedTinyTextLabelContainerView
{
  if (_capturedTinyTextLabelContainerView_onceToken != -1) {
    dispatch_once(&_capturedTinyTextLabelContainerView_onceToken, &__block_literal_global_45);
  }
  double v3 = [(SBHFeatherBlurNavigationBar *)self subviews];
  uint64_t v4 = objc_msgSend(v3, "bs_firstObjectOfClass:", _capturedTinyTextLabelContainerView_tinyTextClass);

  return v4;
}

Class __66__SBHFeatherBlurNavigationBar__capturedTinyTextLabelContainerView__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Uinavigationba.isa);
  _capturedTinyTextLabelContainerView_tinyTextClass = (uint64_t)result;
  return result;
}

- (id)_capturedLargeTextLabelContainerView
{
  if (_capturedLargeTextLabelContainerView_onceToken != -1) {
    dispatch_once(&_capturedLargeTextLabelContainerView_onceToken, &__block_literal_global_13_0);
  }
  double v3 = [(SBHFeatherBlurNavigationBar *)self subviews];
  uint64_t v4 = objc_msgSend(v3, "bs_firstObjectOfClass:", _capturedLargeTextLabelContainerView_largeTextClass);

  return v4;
}

Class __67__SBHFeatherBlurNavigationBar__capturedLargeTextLabelContainerView__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Uinavigationba_0.isa);
  _capturedLargeTextLabelContainerView_largeTextClass = (uint64_t)result;
  return result;
}

- (CGRect)_calculateFeatherBlurBackgroundViewFrame
{
  [(SBHFeatherBlurNavigationBar *)self _topMargin];
  double v4 = v3;
  [(SBHFeatherBlurNavigationBar *)self bounds];
  double v6 = -v4;
  double v7 = v4 + self->_sb_minimumNavbarHeight + 10.0;
  double v8 = 0.0;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v6;
  result.origin.x = v8;
  return result;
}

- (CGRect)_calculateCompactNavBarFrame
{
  [(SBHFeatherBlurNavigationBar *)self bounds];
  double v4 = v3;
  [(SBHFeatherBlurNavigationBar *)self _defaultHeightForMetrics];
  double v6 = v5;
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = v4;
  result.size.height = v6;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)_updateHeights
{
  [(SBHFeatherBlurNavigationBar *)self _defaultHeightForMetrics];
  self->_sb_minimumNavbarHeight = v3;
  if (!self->_configuredForItem)
  {
    double v4 = [(SBHFeatherBlurNavigationBar *)self items];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      [(SBHFeatherBlurNavigationBar *)self _updateAppearance];
      [(SBHFeatherBlurNavigationBar *)self _updateLabel];
    }
  }
  self->_sb_maximumNavbarHeight = self->_sb_minimumNavbarHeight + self->_largeTextHeight;
  [(SBHFeatherBlurNavigationBar *)self _topMargin];
  self->_sb_maximumNavbarHeight = v6 + self->_sb_maximumNavbarHeight;
  self->_sb_minimumNavbarHeight = v6 + self->_sb_minimumNavbarHeight;
}

- (double)_topMargin
{
  double v3 = 20.0;
  if (!SBHIsHomeButtonDevice())
  {
    double v4 = [(SBHFeatherBlurNavigationBar *)self window];
    [v4 safeAreaInsets];
    double v3 = v5;
  }
  return v3;
}

- (void)_updateAppearance
{
  double v3 = (UINavigationBarAppearance *)objc_alloc_init(MEMORY[0x1E4FB19D8]);
  barAppearance = self->_barAppearance;
  self->_barAppearance = v3;

  [(UINavigationBarAppearance *)self->_barAppearance configureWithTransparentBackground];
  id v19 = [(UINavigationBarAppearance *)self->_barAppearance largeTitleTextAttributes];
  double v5 = [(UINavigationBarAppearance *)self->_barAppearance titleTextAttributes];
  uint64_t v6 = *MEMORY[0x1E4FB06F8];
  double v7 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  double v8 = [v5 objectForKeyedSubscript:v6];
  double v9 = [(SBHFeatherBlurNavigationBar *)self traitCollection];
  CGFloat v10 = [v9 preferredContentSizeCategory];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4FB2778]];

  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB2780]];

    uint64_t v13 = [v7 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v12];

    uint64_t v14 = [v8 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v12];

    v15 = (void *)[v19 mutableCopy];
    [v15 setObject:v13 forKeyedSubscript:v6];
    v16 = (void *)[v19 mutableCopy];
    [v16 setObject:v14 forKeyedSubscript:v6];
    id v17 = v15;

    id v18 = v16;
    [(UINavigationBarAppearance *)self->_barAppearance setTitleTextAttributes:v18];

    [(UINavigationBarAppearance *)self->_barAppearance setLargeTitleTextAttributes:v17];
    double v7 = (void *)v13;
    double v8 = (void *)v14;
    double v9 = (void *)v12;
    double v5 = v18;
    id v19 = v17;
  }
  [(SBHFeatherBlurNavigationBar *)self setScrollEdgeAppearance:self->_barAppearance];
  [(SBHFeatherBlurNavigationBar *)self setStandardAppearance:self->_barAppearance];
  [(SBHFeatherBlurNavigationBar *)self setCompactAppearance:self->_barAppearance];
  [(SBFFeatherBlurView *)self->_featherBlurBackgroundView setHidden:self->_hidesFeatherBlur];
}

- (void)_updateLabel
{
  [(SBHFeatherBlurNavigationBar *)self bounds];
  double width = v27.size.width;
  if (!CGRectIsEmpty(v27))
  {
    double v4 = [(SBHFeatherBlurNavigationBar *)self items];
    obj = [v4 lastObject];

    if (obj && self->_configuredForItem != obj)
    {
      featherBlurTitleLabel = self->_featherBlurTitleLabel;
      id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
      double v7 = [(UINavigationItem *)obj title];
      double v8 = [(UINavigationBarAppearance *)self->_barAppearance titleTextAttributes];
      double v9 = (void *)[v6 initWithString:v7 attributes:v8];
      [(UILabel *)featherBlurTitleLabel setAttributedText:v9];

      [(UILabel *)self->_featherBlurTitleLabel sizeToFit];
      objc_storeStrong((id *)&self->_configuredForItem, obj);
      CGFloat v10 = [(UINavigationBarAppearance *)self->_barAppearance largeTitleTextAttributes];
      int v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
      [v11 descender];
      double v13 = v12;
      [v11 lineHeight];
      double v15 = v13 + v14;
      v16 = [(UINavigationItem *)obj title];
      objc_msgSend(v16, "boundingRectWithSize:options:attributes:context:", 1, v10, 0, width, 1.79769313e308);
      double v18 = v17;

      float v19 = v18 / v15;
      self->_largeTextHeight = v15 * (double)vcvtps_u32_f32(v19);
      objc_storeWeak((id *)&self->_capturedTinyTextLabelContainerView, 0);
      objc_storeWeak((id *)&self->_capturedLargeTextLabelContainerView, 0);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_capturedTinyTextLabelContainerView);
    if (!WeakRetained)
    {
      v21 = [(SBHFeatherBlurNavigationBar *)self _capturedTinyTextLabelContainerView];
      objc_storeWeak((id *)&self->_capturedTinyTextLabelContainerView, v21);
    }
    p_capturedLargeTextLabelContainerView = &self->_capturedLargeTextLabelContainerView;
    id v23 = objc_loadWeakRetained((id *)&self->_capturedLargeTextLabelContainerView);
    if (!v23)
    {
      v24 = [(SBHFeatherBlurNavigationBar *)self _capturedLargeTextLabelContainerView];
      objc_storeWeak((id *)p_capturedLargeTextLabelContainerView, v24);
    }
  }
}

- (void)_updateAppearanceAfterTraitChange
{
  [(SBHFeatherBlurNavigationBar *)self _updateAppearance];
  [(SBHFeatherBlurNavigationBar *)self _updateLabel];
  [(SBHFeatherBlurNavigationBar *)self _updateHeights];
  [(SBHFeatherBlurNavigationBar *)self setNeedsLayout];
  [(SBHFeatherBlurNavigationBar *)self layoutIfNeeded];
}

- (double)_defaultHeightForMetrics
{
  v3.receiver = self;
  v3.super_class = (Class)SBHFeatherBlurNavigationBar;
  [(SBHFeatherBlurNavigationBar *)&v3 defaultHeightForMetrics:0];
  return result;
}

- (void)_updateLabelAlphas
{
  p_capturedLargeTextLabelContainerView = &self->_capturedLargeTextLabelContainerView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_capturedLargeTextLabelContainerView);
  if (WeakRetained
    || ([(SBHFeatherBlurNavigationBar *)self _updateLabel],
        (id WeakRetained = objc_loadWeakRetained((id *)p_capturedLargeTextLabelContainerView)) != 0))
  {
    [WeakRetained frame];
    double v6 = v5;
    double sb_minimumNavbarHeight = self->_sb_minimumNavbarHeight;
    [(SBHFeatherBlurNavigationBar *)self _topMargin];
    double v9 = v8;
    CGFloat v10 = [(SBHFeatherBlurNavigationBar *)self superview];
    if (v10)
    {
      int v11 = [(SBHFeatherBlurNavigationBar *)self window];
      BOOL v13 = v6 <= sb_minimumNavbarHeight - v9 && v11 != 0;
    }
    else
    {
      BOOL v13 = 0;
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__SBHFeatherBlurNavigationBar__updateLabelAlphas__block_invoke;
    aBlock[3] = &unk_1E6AB1058;
    aBlock[4] = self;
    BOOL v18 = v13;
    id v14 = WeakRetained;
    id v17 = v14;
    double v15 = (void (**)(void))_Block_copy(aBlock);
    if ([MEMORY[0x1E4FB1EB0] areAnimationsEnabled] && self->_allowsAnimatedUpdating) {
      [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v15 options:0 animations:0.2 completion:0.0];
    }
    else {
      v15[2](v15);
    }
  }
}

uint64_t __49__SBHFeatherBlurNavigationBar__updateLabelAlphas__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 640);
  if (*(unsigned char *)(a1 + 48)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  [v2 setAlpha:v3];
  double v4 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 48)) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  return [v4 setAlpha:v5];
}

- (SBFFeatherBlurView)featherBlurBackgroundView
{
  return self->_featherBlurBackgroundView;
}

- (void)setFeatherBlurBackgroundView:(id)a3
{
}

- (CGRect)gradientMaskFrame
{
  double x = self->_gradientMaskFrame.origin.x;
  double y = self->_gradientMaskFrame.origin.y;
  double width = self->_gradientMaskFrame.size.width;
  double height = self->_gradientMaskFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)sb_minimumNavbarHeight
{
  return self->_sb_minimumNavbarHeight;
}

- (double)sb_maximumNavbarHeight
{
  return self->_sb_maximumNavbarHeight;
}

- (BOOL)allowsAnimatedUpdating
{
  return self->_allowsAnimatedUpdating;
}

- (void)setAllowsAnimatedUpdating:(BOOL)a3
{
  self->_allowsAnimatedUpdating = a3;
}

- (BOOL)hidesFeatherBlur
{
  return self->_hidesFeatherBlur;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featherBlurBackgroundView, 0);
  objc_destroyWeak((id *)&self->_capturedTinyTextLabelContainerView);
  objc_destroyWeak((id *)&self->_capturedLargeTextLabelContainerView);
  objc_storeStrong((id *)&self->_maskLayers, 0);
  objc_storeStrong((id *)&self->_configuredForItem, 0);
  objc_storeStrong((id *)&self->_featherBlurTitleLabel, 0);
  objc_storeStrong((id *)&self->_barAppearance, 0);
}

@end