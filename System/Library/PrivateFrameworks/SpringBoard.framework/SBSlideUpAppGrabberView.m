@interface SBSlideUpAppGrabberView
- (BOOL)_shouldUseVibrancy;
- (BOOL)isVibrancyAllowed;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SBSlideUpAppGrabberView)initWithAdditionalTopPadding:(BOOL)a3 invertVerticalInsets:(BOOL)a4;
- (UIEdgeInsets)hitTestEdgeInsets;
- (_SBFVibrantSettings)vibrantSettings;
- (_UILegibilitySettings)legibilitySettings;
- (double)strength;
- (id)_lazyLegibilityView;
- (void)layoutSubviews;
- (void)setAppStyleGrabberImage:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setGrabberImageFromAppWithBundleIdentifier:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setStrength:(double)a3;
- (void)setVibrancyAllowed:(BOOL)a3;
- (void)setVibrantSettings:(id)a3;
@end

@implementation SBSlideUpAppGrabberView

- (SBSlideUpAppGrabberView)initWithAdditionalTopPadding:(BOOL)a3 invertVerticalInsets:(BOOL)a4
{
  BOOL v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SBSlideUpAppGrabberView;
  v6 = -[SBSlideUpAppGrabberView initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v6)
  {
    [MEMORY[0x1E4FA5F68] slideUpGrabberInset];
    double v8 = v7;
    int v9 = __sb__runningInSpringBoard();
    if (v5)
    {
      if (v9)
      {
        int v10 = SBFEffectiveDeviceClass();
        double v11 = 40.0;
        if (v10 == 2) {
          double v11 = 80.0;
        }
        double v12 = -v11;
        if (a4) {
          goto LABEL_24;
        }
LABEL_13:
        if (__sb__runningInSpringBoard())
        {
          int v13 = SBFEffectiveDeviceClass();
          double v14 = 40.0;
          if (v13 == 2) {
            double v14 = 100.0;
          }
          double v15 = -v14;
        }
        else
        {
          v23 = [MEMORY[0x1E4F42948] currentDevice];
          uint64_t v24 = [v23 userInterfaceIdiom];
          double v25 = 40.0;
          if (v24 == 1) {
            double v25 = 100.0;
          }
          double v15 = -v25;
        }
        double v19 = -v8;
        double v22 = v19;
        goto LABEL_36;
      }
      v16 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v17 = [v16 userInterfaceIdiom];
      double v18 = 40.0;
      if (v17 == 1) {
        double v18 = 80.0;
      }
      double v12 = -v18;
    }
    else
    {
      if (v9)
      {
        if (SBFEffectiveDeviceClass() == 2) {
          double v12 = -50.0;
        }
        else {
          double v12 = -20.0;
        }
        if (!a4) {
          goto LABEL_13;
        }
        goto LABEL_24;
      }
      v16 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v16 userInterfaceIdiom] == 1) {
        double v12 = -50.0;
      }
      else {
        double v12 = -20.0;
      }
    }

    if (!a4) {
      goto LABEL_13;
    }
LABEL_24:
    double v19 = -v8;
    if (__sb__runningInSpringBoard())
    {
      int v20 = SBFEffectiveDeviceClass();
      double v21 = 40.0;
      if (v20 == 2) {
        double v21 = 100.0;
      }
      double v22 = -v21;
    }
    else
    {
      v26 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v27 = [v26 userInterfaceIdiom];
      double v28 = 40.0;
      if (v27 == 1) {
        double v28 = 100.0;
      }
      double v22 = -v28;
    }
    double v15 = v19;
LABEL_36:
    v6->_hitTestEdgeInsets.top = v12;
    v6->_hitTestEdgeInsets.left = v15;
    v6->_hitTestEdgeInsets.bottom = v19;
    v6->_hitTestEdgeInsets.right = v22;
    v6->_vibrancyAllowed = 1;
    id v29 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(SBSlideUpAppGrabberView *)v6 bounds];
    uint64_t v30 = objc_msgSend(v29, "initWithFrame:");
    tintView = v6->_tintView;
    v6->_tintView = (UIView *)v30;

    [(SBSlideUpAppGrabberView *)v6 addSubview:v6->_tintView];
    v32 = [[SBSaturatedIconView alloc] initWithImage:0];
    saturatedIconView = v6->_saturatedIconView;
    v6->_saturatedIconView = v32;

    [(SBSlideUpAppGrabberView *)v6 addSubview:v6->_saturatedIconView];
    [(SBSlideUpAppGrabberView *)v6 setExclusiveTouch:1];
    v34 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBSlideUpAppGrabberView *)v6 setBackgroundColor:v34];

    v35 = [(SBSlideUpAppGrabberView *)v6 layer];
    [v35 setAllowsGroupBlending:0];

    v36 = [(SBSlideUpAppGrabberView *)v6 layer];
    [v36 setMasksToBounds:1];
  }
  return v6;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  p_hitTestEdgeInsets = &self->_hitTestEdgeInsets;
  if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_hitTestEdgeInsets.top, *MEMORY[0x1E4F437F8]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_hitTestEdgeInsets.bottom, *(float64x2_t *)(MEMORY[0x1E4F437F8] + 16)))), 0xFuLL))))
  {
    v19.receiver = self;
    v19.super_class = (Class)SBSlideUpAppGrabberView;
    return -[SBSlideUpAppGrabberView pointInside:withEvent:](&v19, sel_pointInside_withEvent_, a4, a3.x, a3.y);
  }
  else
  {
    [(SBSlideUpAppGrabberView *)self bounds];
    double left = p_hitTestEdgeInsets->left;
    double v9 = v8 + left;
    double v11 = p_hitTestEdgeInsets->top + v10;
    double v13 = v12 - (left + p_hitTestEdgeInsets->right);
    double v15 = v14 - (p_hitTestEdgeInsets->top + p_hitTestEdgeInsets->bottom);
    CGFloat v16 = x;
    CGFloat v17 = y;
    return CGRectContainsPoint(*(CGRect *)&v9, *(CGPoint *)&v16);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (self->_grabberImage) {
    [(UIImage *)self->_grabberImage size];
  }
  else {
    -[SBSaturatedIconView sizeThatFits:](self->_saturatedIconView, "sizeThatFits:", a3.width, a3.height);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)SBSlideUpAppGrabberView;
  [(SBSlideUpAppGrabberView *)&v8 layoutSubviews];
  saturatedIconView = self->_saturatedIconView;
  [(SBSlideUpAppGrabberView *)self bounds];
  -[SBSaturatedIconView setFrame:](saturatedIconView, "setFrame:");
  tintView = self->_tintView;
  [(SBSlideUpAppGrabberView *)self bounds];
  -[UIView setFrame:](tintView, "setFrame:");
  backgroundView = self->_backgroundView;
  [(SBSlideUpAppGrabberView *)self bounds];
  -[UIView setFrame:](backgroundView, "setFrame:");
  v6 = [(SBSlideUpAppGrabberView *)self layer];
  double v7 = [v6 mask];
  [(SBSlideUpAppGrabberView *)self bounds];
  objc_msgSend(v7, "setFrame:");
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if (self->_saturatedIconView)
  {
    uint64_t v5 = [MEMORY[0x1E4F428B8] clearColor];

    id v4 = (id)v5;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBSlideUpAppGrabberView;
  [(SBSlideUpAppGrabberView *)&v6 setBackgroundColor:v4];
}

- (void)setGrabberImageFromAppWithBundleIdentifier:(id)a3
{
  id v11 = a3;
  id v4 = +[SBIconController sharedInstance];
  uint64_t v5 = [v4 tableUIIconImageCache];
  if ([v11 isEqualToString:@"com.apple.Siri"])
  {
    objc_super v6 = [MEMORY[0x1E4F42A80] imageNamed:@"siri-suggestion"];
    double v7 = [MEMORY[0x1E4F428B8] whiteColor];
    [v6 _flatImageWithColor:v7];
  }
  else
  {
    objc_super v8 = [v4 model];
    double v7 = [v8 applicationIconForBundleIdentifier:v11];

    objc_super v6 = [(SBSlideUpAppGrabberView *)self traitCollection];
    [v5 imageForIcon:v7 compatibleWithTraitCollection:v6 options:2];
  double v9 = };

  [(SBSlideUpAppGrabberView *)self setAppStyleGrabberImage:v9];
  [v5 iconImageInfo];
  [(SBSlideUpAppGrabberView *)self _setContinuousCornerRadius:v10];
}

- (void)setAppStyleGrabberImage:(id)a3
{
  objc_storeStrong((id *)&self->_grabberImage, a3);
  id v5 = a3;
  [(SBSaturatedIconView *)self->_saturatedIconView setImage:v5];

  [(SBSlideUpAppGrabberView *)self sizeToFit];
  [(SBSlideUpAppGrabberView *)self setNeedsLayout];
}

- (BOOL)_shouldUseVibrancy
{
  if (SBGraphicsQuality() != 100) {
    return 0;
  }
  return [(SBSlideUpAppGrabberView *)self isVibrancyAllowed];
}

- (void)setVibrancyAllowed:(BOOL)a3
{
  if (self->_vibrancyAllowed != a3)
  {
    self->_vibrancyAllowed = a3;
    if (a3)
    {
      legibilityView = self->_legibilityView;
      if (legibilityView)
      {
        [(SBUILegibilityView *)legibilityView removeFromSuperview];
        id v5 = self->_legibilityView;
        self->_legibilityView = 0;
      }
    }
  }
}

- (void)setVibrantSettings:(id)a3
{
  id v5 = a3;
  if ([(SBSlideUpAppGrabberView *)self _shouldUseVibrancy])
  {
    p_vibrantSettings = &self->_vibrantSettings;
    if (([(_SBFVibrantSettings *)self->_vibrantSettings isEqual:v5] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_vibrantSettings, a3);
      double v7 = [(_SBFVibrantSettings *)*p_vibrantSettings tintColor];
      if ([(_SBFVibrantSettings *)*p_vibrantSettings style] == 2)
      {
        double v14 = 0.0;
        double v15 = 0.0;
        double v12 = 0.0;
        double v13 = 0.0;
        [v7 getRed:&v15 green:&v14 blue:&v13 alpha:&v12];
        objc_super v8 = (void *)MEMORY[0x1E4F428B8];
        double v9 = (v15 + v14 + v13) * 1.20000005 / 3.0;
        double v10 = v12;
      }
      else
      {
        objc_super v8 = (void *)MEMORY[0x1E4F428B8];
        double v10 = 0.100000001;
        double v9 = 0.0;
      }
      id v11 = [v8 colorWithWhite:v9 alpha:v10];

      [(UIView *)self->_tintView setBackgroundColor:v11];
    }
  }
}

- (void)setBackgroundView:(id)a3
{
  double v10 = (UIView *)a3;
  BOOL v5 = [(SBSlideUpAppGrabberView *)self _shouldUseVibrancy];
  objc_super v6 = v10;
  if (v5)
  {
    p_backgroundView = &self->_backgroundView;
    backgroundView = self->_backgroundView;
    if (backgroundView != v10)
    {
      [(UIView *)backgroundView removeFromSuperview];
      objc_storeStrong((id *)&self->_backgroundView, a3);
      double v9 = *p_backgroundView;
      [(SBSlideUpAppGrabberView *)self bounds];
      -[UIView setFrame:](v9, "setFrame:");
      [(SBSlideUpAppGrabberView *)self addSubview:*p_backgroundView];
      [(SBSlideUpAppGrabberView *)self sendSubviewToBack:*p_backgroundView];
      objc_super v6 = v10;
    }
  }
}

- (id)_lazyLegibilityView
{
  if (![(SBSlideUpAppGrabberView *)self _shouldUseVibrancy] && !self->_legibilityView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FA7CA8]);
    [(UIImage *)self->_grabberImage size];
    objc_super v6 = (SBUILegibilityView *)objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, v4, v5);
    legibilityView = self->_legibilityView;
    self->_legibilityView = v6;

    objc_super v8 = self->_legibilityView;
    double v9 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:1];
    [(SBUILegibilityView *)v8 updateForChangedSettings:v9 options:3 image:self->_grabberImage strength:*MEMORY[0x1E4F440E8]];

    [(SBUILegibilityView *)self->_legibilityView bounds];
    -[SBSlideUpAppGrabberView setBounds:](self, "setBounds:");
    [(SBSlideUpAppGrabberView *)self addSubview:self->_legibilityView];
    [(SBUILegibilityView *)self->_legibilityView setAutoresizingMask:18];
    [(SBSlideUpAppGrabberView *)self setAutoresizesSubviews:1];
    if (self->_saturatedIconView) {
      [(SBSlideUpAppGrabberView *)self sendSubviewToBack:self->_legibilityView];
    }
  }
  double v10 = self->_legibilityView;
  return v10;
}

- (void)setStrength:(double)a3
{
  self->_strength = a3;
  id v4 = [(SBSlideUpAppGrabberView *)self _lazyLegibilityView];
  [v4 setStrength:a3];
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
  id v5 = a3;
  id v6 = [(SBSlideUpAppGrabberView *)self _lazyLegibilityView];
  [v6 setLegibilitySettings:v5];
}

- (UIEdgeInsets)hitTestEdgeInsets
{
  double top = self->_hitTestEdgeInsets.top;
  double left = self->_hitTestEdgeInsets.left;
  double bottom = self->_hitTestEdgeInsets.bottom;
  double right = self->_hitTestEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (_SBFVibrantSettings)vibrantSettings
{
  return self->_vibrantSettings;
}

- (double)strength
{
  return self->_strength;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)isVibrancyAllowed
{
  return self->_vibrancyAllowed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrantSettings, 0);
  objc_storeStrong((id *)&self->_grabberImage, 0);
  objc_storeStrong((id *)&self->_saturatedIconView, 0);
  objc_storeStrong((id *)&self->_legibilityView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end