@interface SPUIDynamicKeyboardVisualEffectView
- (BOOL)hideFeatheredBlur;
- (BOOL)hideVisualEffectView;
- (MTMaterialView)featheredBlur;
- (SPUIDynamicKeyboardVisualEffectView)init;
- (UIView)colorView;
- (UIView)gaussianBlurView;
- (UIView)gradientView;
- (UIView)keyboardVisualEffectView;
- (double)searchFieldHeight;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setColorView:(id)a3;
- (void)setFeatheredBlur:(id)a3;
- (void)setGaussianBlurView:(id)a3;
- (void)setGradientView:(id)a3;
- (void)setHideFeatheredBlur:(BOOL)a3;
- (void)setHideVisualEffectView:(BOOL)a3;
- (void)setKeyboardVisualEffectView:(id)a3;
- (void)setSearchFieldHeight:(double)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SPUIDynamicKeyboardVisualEffectView

- (void)layoutSubviews
{
  v3 = [(SPUIDynamicKeyboardVisualEffectView *)self tlks_screen];
  [v3 _referenceBounds];
  double v5 = v4;

  v32.receiver = self;
  v32.super_class = (Class)SPUIDynamicKeyboardVisualEffectView;
  [(SPUIDynamicKeyboardVisualEffectView *)&v32 layoutSubviews];
  [(SPUIDynamicKeyboardVisualEffectView *)self bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v11 = v6;
  double v13 = v12;
  BOOL v14 = v12 < 363.0 || v6 < v5;
  if (v14 && ![(SPUIDynamicKeyboardVisualEffectView *)self hideVisualEffectView])
  {
    double v13 = 363.0;
    CGFloat v11 = v5;
  }
  double v15 = *(double *)&SPUIExtendedEdgesDimensionConstant;
  v33.origin.double x = v8;
  v33.origin.double y = v10;
  v33.size.double width = v11;
  v33.size.double height = v13;
  CGRect v34 = CGRectInset(v33, -*(double *)&SPUIExtendedEdgesDimensionConstant, 0.0);
  double x = v34.origin.x;
  double y = v34.origin.y;
  double width = v34.size.width;
  double height = v34.size.height;
  CGFloat v20 = v34.origin.y + 8.0;
  CGFloat v21 = v34.size.height + v15 * 2.0;
  v22 = [(SPUIDynamicKeyboardVisualEffectView *)self colorView];
  objc_msgSend(v22, "setFrame:", x, v20, width, v21);

  [(SPUIDynamicKeyboardVisualEffectView *)self searchFieldHeight];
  double v24 = v23;
  if ([(SPUIDynamicKeyboardVisualEffectView *)self hideVisualEffectView]) {
    double v25 = v24 + 60.0;
  }
  else {
    double v25 = 104.0;
  }
  v26 = [(SPUIDynamicKeyboardVisualEffectView *)self featheredBlur];
  objc_msgSend(v26, "setFrame:", x, y + 12.0, width, v25);

  BOOL v27 = [(SPUIDynamicKeyboardVisualEffectView *)self hideVisualEffectView];
  double v28 = 30.0;
  if (!v27) {
    double v28 = 0.0;
  }
  double v29 = y + v24 + v28;
  v30 = [(SPUIDynamicKeyboardVisualEffectView *)self gaussianBlurView];
  objc_msgSend(v30, "setFrame:", x, v29, width, height - (v24 + -30.0));

  v31 = [(SPUIDynamicKeyboardVisualEffectView *)self keyboardVisualEffectView];
  objc_msgSend(v31, "setFrame:", x, y, width, height);
}

- (BOOL)hideVisualEffectView
{
  v2 = [(SPUIDynamicKeyboardVisualEffectView *)self colorView];
  [v2 alpha];
  BOOL v4 = v3 == 0.0;

  return v4;
}

- (UIView)colorView
{
  return (UIView *)objc_getProperty(self, a2, 424, 1);
}

- (MTMaterialView)featheredBlur
{
  return (MTMaterialView *)objc_getProperty(self, a2, 432, 1);
}

- (UIView)gaussianBlurView
{
  return (UIView *)objc_getProperty(self, a2, 440, 1);
}

- (UIView)keyboardVisualEffectView
{
  return (UIView *)objc_getProperty(self, a2, 416, 1);
}

- (double)searchFieldHeight
{
  return self->_searchFieldHeight;
}

double __43__SPUIDynamicKeyboardVisualEffectView_init__block_invoke()
{
  return 0.4;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SPUIDynamicKeyboardVisualEffectView;
  [(SPUIDynamicKeyboardVisualEffectView *)&v3 didMoveToWindow];
  [(SPUIDynamicKeyboardVisualEffectView *)self tlk_updateWithCurrentAppearance];
}

- (void)setSearchFieldHeight:(double)a3
{
  self->_searchFieldHeight = a3;
}

- (void)tlk_updateForAppearance:(id)a3
{
  v40[4] = *MEMORY[0x263EF8340];
  v38.receiver = self;
  v38.super_class = (Class)SPUIDynamicKeyboardVisualEffectView;
  id v4 = a3;
  [(SPUIDynamicKeyboardVisualEffectView *)&v38 tlk_updateForAppearance:v4];
  char v5 = objc_msgSend(v4, "isDark", v38.receiver, v38.super_class);

  if (v5)
  {
    double v6 = 0.17254902;
    double v7 = 1.0;
  }
  else
  {
    double v6 = 0.752941176;
    double v7 = 0.95;
  }
  CGFloat v8 = [MEMORY[0x263F825C8] colorWithRed:v6 green:v6 blue:v6 alpha:v7];
  double v9 = [(SPUIDynamicKeyboardVisualEffectView *)self colorView];

  if (!v9)
  {
    CGFloat v10 = objc_opt_new();
    [(SPUIDynamicKeyboardVisualEffectView *)self setColorView:v10];

    CGFloat v11 = objc_opt_new();
    id v12 = [v8 colorWithAlphaComponent:0.0];
    v40[0] = [v12 CGColor];
    id v13 = [v8 colorWithAlphaComponent:0.4];
    v40[1] = [v13 CGColor];
    id v14 = [v8 colorWithAlphaComponent:0.39];
    v40[2] = [v14 CGColor];
    id v15 = [v8 colorWithAlphaComponent:0.27];
    v40[3] = [v15 CGColor];
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:4];
    v17 = [v11 layer];
    [v17 setColors:v16];

    v18 = [v11 layer];
    [v18 setLocations:&unk_26F10BD00];

    v19 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    v39 = v19;
    CGFloat v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
    CGFloat v21 = [v11 layer];
    [v21 setInterpolations:v20];

    [(SPUIDynamicKeyboardVisualEffectView *)self setGradientView:v11];
    v22 = [(SPUIDynamicKeyboardVisualEffectView *)self colorView];
    double v23 = [(SPUIDynamicKeyboardVisualEffectView *)self gradientView];
    [v22 addSubview:v23];

    double v24 = (void *)MEMORY[0x263F67C10];
    double v25 = [(SPUIDynamicKeyboardVisualEffectView *)self gradientView];
    [v24 fillContainerWithView:v25];
  }
  v26 = [(SPUIDynamicKeyboardVisualEffectView *)self gaussianBlurView];

  if (!v26)
  {
    BOOL v27 = objc_opt_new();
    [(SPUIDynamicKeyboardVisualEffectView *)self setGaussianBlurView:v27];
  }
  double v28 = [(SPUIDynamicKeyboardVisualEffectView *)self colorView];
  double v29 = [(SPUIDynamicKeyboardVisualEffectView *)self featheredBlur];
  [(SPUIDynamicKeyboardVisualEffectView *)self insertSubview:v28 belowSubview:v29];

  v30 = [(SPUIDynamicKeyboardVisualEffectView *)self gaussianBlurView];
  v31 = [(SPUIDynamicKeyboardVisualEffectView *)self featheredBlur];
  [(SPUIDynamicKeyboardVisualEffectView *)self insertSubview:v30 belowSubview:v31];

  LODWORD(v31) = UIAccessibilityIsReduceTransparencyEnabled();
  objc_super v32 = [(SPUIDynamicKeyboardVisualEffectView *)self keyboardVisualEffectView];
  CGRect v33 = v32;
  if (v31)
  {

    if (!v33)
    {
      id v34 = objc_alloc(MEMORY[0x263F82878]);
      v35 = [MEMORY[0x263F82868] darkConfig];
      uint64_t v36 = [v35 backdropStyle];
      v37 = objc_msgSend(v34, "initWithFrame:style:", v36, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      [(SPUIDynamicKeyboardVisualEffectView *)self setKeyboardVisualEffectView:v37];
    }
    CGRect v33 = [(SPUIDynamicKeyboardVisualEffectView *)self keyboardVisualEffectView];
    [(SPUIDynamicKeyboardVisualEffectView *)self insertSubview:v33 atIndex:0];
  }
  else
  {
    [v32 removeFromSuperview];
  }

  [(SPUIDynamicKeyboardVisualEffectView *)self setNeedsLayout];
  [(SPUIDynamicKeyboardVisualEffectView *)self layoutIfNeeded];
}

- (UIView)gradientView
{
  return (UIView *)objc_getProperty(self, a2, 448, 1);
}

- (void)setHideVisualEffectView:(BOOL)a3
{
  double v4 = 0.0;
  if (!a3)
  {
    if (UIAccessibilityIsReduceTransparencyEnabled()) {
      double v4 = 0.0;
    }
    else {
      double v4 = 1.0;
    }
  }
  char v5 = [(SPUIDynamicKeyboardVisualEffectView *)self colorView];
  [v5 setAlpha:v4];

  [(SPUIDynamicKeyboardVisualEffectView *)self setNeedsLayout];
  [(SPUIDynamicKeyboardVisualEffectView *)self layoutIfNeeded];
}

- (void)setHideFeatheredBlur:(BOOL)a3
{
  double v4 = 0.0;
  if (!a3) {
    double v4 = (double)!UIAccessibilityIsReduceTransparencyEnabled();
  }
  char v5 = [(SPUIDynamicKeyboardVisualEffectView *)self featheredBlur];
  [v5 setAlpha:v4];

  [(SPUIDynamicKeyboardVisualEffectView *)self setNeedsLayout];
  [(SPUIDynamicKeyboardVisualEffectView *)self layoutIfNeeded];
}

- (void)setGradientView:(id)a3
{
}

- (void)setGaussianBlurView:(id)a3
{
}

- (void)setColorView:(id)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPUIDynamicKeyboardVisualEffectView;
  [(SPUIDynamicKeyboardVisualEffectView *)&v9 traitCollectionDidChange:v4];
  char v5 = [(SPUIDynamicKeyboardVisualEffectView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(SPUIDynamicKeyboardVisualEffectView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  double v6 = [(SPUIDynamicKeyboardVisualEffectView *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (SPUIDynamicKeyboardVisualEffectView)init
{
  v10.receiver = self;
  v10.super_class = (Class)SPUIDynamicKeyboardVisualEffectView;
  v2 = [(SPUIDynamicKeyboardVisualEffectView *)&v10 init];
  objc_super v3 = v2;
  if (v2)
  {
    [(SPUIDynamicKeyboardVisualEffectView *)v2 setSearchFieldHeight:60.0];
    id v4 = (void *)MEMORY[0x263F53FE8];
    char v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v6 = [v4 materialViewWithRecipeNamed:@"darkModeKeyboardBackground" inBundle:v5 options:0 initialWeighting:&__block_literal_global_6 scaleAdjustment:1.0];
    [(SPUIDynamicKeyboardVisualEffectView *)v3 setFeatheredBlur:v6];

    uint64_t v7 = [(SPUIDynamicKeyboardVisualEffectView *)v3 featheredBlur];
    [(SPUIDynamicKeyboardVisualEffectView *)v3 addSubview:v7];

    [(SPUIDynamicKeyboardVisualEffectView *)v3 setNeedsLayout];
    [(SPUIDynamicKeyboardVisualEffectView *)v3 layoutIfNeeded];
    [(SPUIDynamicKeyboardVisualEffectView *)v3 setHideVisualEffectView:0];
    uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v3 selector:sel_tlk_updateWithCurrentAppearance name:*MEMORY[0x263F831F8] object:0];
  }
  return v3;
}

- (void)setFeatheredBlur:(id)a3
{
}

- (BOOL)hideFeatheredBlur
{
  v2 = [(SPUIDynamicKeyboardVisualEffectView *)self featheredBlur];
  [v2 alpha];
  BOOL v4 = v3 == 0.0;

  return v4;
}

- (void)setKeyboardVisualEffectView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_gaussianBlurView, 0);
  objc_storeStrong((id *)&self->_featheredBlur, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_storeStrong((id *)&self->_keyboardVisualEffectView, 0);
}

@end