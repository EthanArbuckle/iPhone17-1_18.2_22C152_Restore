@interface SBAppSwitcherPageShadowView
- (SBAppSwitcherPageShadowView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (UIBezierPath)shadowPath;
- (UIView)_diffuseShadowView;
- (UIView)_rimShadowView;
- (double)shadowOffset;
- (double)switcherCardScale;
- (int64_t)style;
- (unint64_t)highlightType;
- (void)_applyPrototypeSettingsToConstants;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_updateShadowParameters;
- (void)_updateShadowViews;
- (void)setHighlightType:(unint64_t)a3;
- (void)setShadowOffset:(double)a3;
- (void)setShadowPath:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSwitcherCardScale:(double)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SBAppSwitcherPageShadowView

- (void)setSwitcherCardScale:(double)a3
{
  if (self->_switcherCardScale != a3)
  {
    self->_switcherCardScale = a3;
    [(SBAppSwitcherPageShadowView *)self _applyPrototypeSettingsToConstants];
    [(SBAppSwitcherPageShadowView *)self _updateShadowParameters];
  }
}

- (void)setStyle:(int64_t)a3
{
  if (!a3)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [v6 handleFailureInMethod:a2, self, @"SBAppSwitcherPageShadowView.m", 93, @"%@ shouldn't be created for SBAppSwitcherPageShadowStyleNone", v8 object file lineNumber description];
  }
  if (self->_style != a3)
  {
    self->_style = a3;
    [(SBAppSwitcherPageShadowView *)self _updateShadowViews];
    [(SBAppSwitcherPageShadowView *)self _applyPrototypeSettingsToConstants];
    [(SBAppSwitcherPageShadowView *)self _updateShadowParameters];
  }
}

- (void)setShadowPath:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_shadowPath, a3);
    [(SBAppSwitcherPageShadowView *)self _updateShadowViews];
  }
}

- (void)setShadowOffset:(double)a3
{
  if (self->_shadowOffset != a3)
  {
    self->_shadowOffset = a3;
    [(SBAppSwitcherPageShadowView *)self _updateShadowParameters];
  }
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBAppSwitcherPageShadowView;
  -[SBAppSwitcherPageShadowView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  [(SBFView *)self->_diffuseShadowView _setContinuousCornerRadius:a3];
  [(SBFView *)self->_rimShadowView _setContinuousCornerRadius:a3];
}

- (SBAppSwitcherPageShadowView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)SBAppSwitcherPageShadowView;
  objc_super v5 = -[SBAppSwitcherPageShadowView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    v5->_switcherCardScale = 1.0;
    uint64_t v7 = +[SBAppSwitcherDomain rootSettings];
    switcherSettings = v6->_switcherSettings;
    v6->_switcherSettings = (SBAppSwitcherSettings *)v7;

    [(PTSettings *)v6->_switcherSettings addKeyObserver:v6];
    uint64_t v9 = +[SBMedusaDomain rootSettings];
    medusaSettings = v6->_medusaSettings;
    v6->_medusaSettings = (SBMedusaSettings *)v9;

    [(PTSettings *)v6->_medusaSettings addKeyObserver:v6];
    [(SBFView *)v6 setAnimatedLayerProperties:&unk_1F33475C8];
    v11 = [(SBAppSwitcherPageShadowView *)v6 layer];
    [v11 setShadowPathIsBounds:1];

    [(SBAppSwitcherPageShadowView *)v6 _updateShadowViews];
    [(SBAppSwitcherPageShadowView *)v6 _applyPrototypeSettingsToConstants];
    [(SBAppSwitcherPageShadowView *)v6 _updateShadowParameters];
  }
  return v6;
}

- (void)setHighlightType:(unint64_t)a3
{
  if (self->_highlightType != a3)
  {
    self->_highlightType = a3;
    [(SBAppSwitcherPageShadowView *)self _updateShadowParameters];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v4 = [a3 userInterfaceStyle];
  objc_super v5 = [(SBAppSwitcherPageShadowView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  if (v4 != v6)
  {
    [(SBAppSwitcherPageShadowView *)self _applyPrototypeSettingsToConstants];
    [(SBAppSwitcherPageShadowView *)self _updateShadowParameters];
  }
}

- (UIView)_diffuseShadowView
{
  return (UIView *)self->_diffuseShadowView;
}

- (UIView)_rimShadowView
{
  return (UIView *)self->_rimShadowView;
}

- (void)_updateShadowViews
{
  [(SBAppSwitcherPageShadowView *)self _continuousCornerRadius];
  double v4 = v3;
  rimShadowView = self->_rimShadowView;
  if (self->_style == 2)
  {
    if (!rimShadowView)
    {
      id v6 = objc_alloc(MEMORY[0x1E4FA6058]);
      [(SBAppSwitcherPageShadowView *)self bounds];
      uint64_t v7 = (SBFView *)objc_msgSend(v6, "initWithFrame:");
      v8 = self->_rimShadowView;
      self->_rimShadowView = v7;

      [(SBFView *)self->_rimShadowView setAutoresizingMask:18];
      [(SBFView *)self->_rimShadowView setAnimatedLayerProperties:&unk_1F33475E0];
      [(SBFView *)self->_rimShadowView _setContinuousCornerRadius:v4];
      [(SBAppSwitcherPageShadowView *)self addSubview:self->_rimShadowView];
    }
  }
  else if (rimShadowView)
  {
    [(SBFView *)rimShadowView removeFromSuperview];
    uint64_t v9 = self->_rimShadowView;
    self->_rimShadowView = 0;
  }
  if (!self->_diffuseShadowView)
  {
    id v10 = objc_alloc(MEMORY[0x1E4FA6058]);
    [(SBAppSwitcherPageShadowView *)self bounds];
    v11 = (SBFView *)objc_msgSend(v10, "initWithFrame:");
    diffuseShadowView = self->_diffuseShadowView;
    self->_diffuseShadowView = v11;

    [(SBFView *)self->_diffuseShadowView setAutoresizingMask:18];
    [(SBFView *)self->_diffuseShadowView setAnimatedLayerProperties:&unk_1F33475F8];
    [(SBFView *)self->_diffuseShadowView _setContinuousCornerRadius:v4];
    [(SBAppSwitcherPageShadowView *)self addSubview:self->_diffuseShadowView];
  }
  objc_super v13 = self->_rimShadowView;
  if (v13)
  {
    v14 = [(SBFView *)v13 layer];
    [v14 setShadowPathIsBounds:self->_shadowPath == 0];

    if (self->_shadowPath)
    {
      v15 = [(SBFView *)self->_rimShadowView layer];
      objc_msgSend(v15, "setShadowPath:", -[UIBezierPath CGPath](self->_shadowPath, "CGPath"));
    }
  }
  v16 = [(SBFView *)self->_diffuseShadowView layer];
  [v16 setShadowPathIsBounds:self->_shadowPath == 0];

  if (self->_shadowPath)
  {
    id v17 = [(SBFView *)self->_diffuseShadowView layer];
    objc_msgSend(v17, "setShadowPath:", -[UIBezierPath CGPath](self->_shadowPath, "CGPath"));
  }
}

- (void)_applyPrototypeSettingsToConstants
{
  double v3 = [(SBAppSwitcherPageShadowView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  [(SBMedusaSettings *)self->_medusaSettings rimShadowRadius];
  self->_rimShadowRadius = v5;
  medusaSettings = self->_medusaSettings;
  if (v4 == 2) {
    [(SBMedusaSettings *)medusaSettings coronaRimShadowOpacity];
  }
  else {
    [(SBMedusaSettings *)medusaSettings rimShadowOpacity];
  }
  self->_rimShadowOpacity = v7;
  switch(self->_style)
  {
    case 2:
      [(SBMedusaSettings *)self->_medusaSettings diffuseShadowRadius];
      self->_diffuseShadowRadius = v8;
      uint64_t v9 = self->_medusaSettings;
      if (v4 == 2) {
        [(SBMedusaSettings *)v9 coronaDiffuseShadowOpacity];
      }
      else {
        [(SBMedusaSettings *)v9 diffuseShadowOpacity];
      }
      self->_diffuseShadowOpacity = v10;
      [(SBMedusaSettings *)self->_medusaSettings diffuseShadowOffsetHorizontal];
      CGFloat v39 = v38;
      [(SBMedusaSettings *)self->_medusaSettings diffuseShadowOffsetVertical];
      self->_diffuseShadowOffset.width = v39;
      self->_diffuseShadowOffset.height = v40;
      [(SBMedusaSettings *)self->_medusaSettings diffuseShadowRadiusWhileTouched];
      self->_diffuseShadowRadiusWhileTouched = v41;
      v42 = self->_medusaSettings;
      if (v4 == 2) {
        [(SBMedusaSettings *)v42 coronaDiffuseShadowOpacityWhileTouched];
      }
      else {
        [(SBMedusaSettings *)v42 diffuseShadowOpacityWhileTouched];
      }
      self->_diffuseShadowOpacityWhileTouched = v43;
      [(SBMedusaSettings *)self->_medusaSettings diffuseShadowOffsetHorizontalWhileTouched];
      CGFloat v45 = v44;
      [(SBMedusaSettings *)self->_medusaSettings diffuseShadowOffsetVerticalWhileTouched];
      self->_diffuseShadowOffsetWhileTouched.width = v45;
      self->_diffuseShadowOffsetWhileTouched.height = v46;
      break;
    case 3:
      [(SBMedusaSettings *)self->_medusaSettings switcherShelfCardShadowRadius];
      double v33 = v32;
      [(SBMedusaSettings *)self->_medusaSettings switcherShelfCardScale];
      self->_diffuseShadowRadius = v33 / v34;
      p_diffuseShadowOffset = &self->_diffuseShadowOffset;
      [(SBMedusaSettings *)self->_medusaSettings switcherShelfCardShadowOffsetY];
      double v36 = v35;
      [(SBMedusaSettings *)self->_medusaSettings switcherShelfCardScale];
      self->_diffuseShadowOffset.width = 0.0;
      self->_diffuseShadowOffset.height = v36 / v37;
      [(SBMedusaSettings *)self->_medusaSettings switcherShelfCardShadowOpacity];
      goto LABEL_11;
    case 4:
      [(SBMedusaSettings *)self->_medusaSettings switcherPeekingWindowShadowRadius];
      self->_diffuseShadowRadius = v11;
      p_diffuseShadowOffset = &self->_diffuseShadowOffset;
      [(SBMedusaSettings *)self->_medusaSettings switcherPeekingWindowShadowOffsetY];
      self->_diffuseShadowOffset.width = 0.0;
      self->_diffuseShadowOffset.height = v13;
      [(SBMedusaSettings *)self->_medusaSettings switcherPeekingWindowShadowOpacity];
LABEL_11:
      self->_diffuseShadowOpacity = v14;
      self->_diffuseShadowRadiusWhileTouched = self->_diffuseShadowRadius;
      self->_diffuseShadowOffsetWhileTouched = *p_diffuseShadowOffset;
      self->_diffuseShadowOpacityWhileTouched = self->_diffuseShadowOpacity;
      break;
    case 5:
      v15 = [(SBAppSwitcherSettings *)self->_switcherSettings chamoisSettings];
      [v15 rimShadowOpacity];
      self->_rimShadowOpacity = v16;
      [v15 rimShadowRadius];
      self->_rimShadowRadius = v17;
      [v15 diffuseShadowOpacity];
      self->_diffuseShadowOpacity = v18;
      [v15 diffuseShadowRadius];
      self->_diffuseShadowRadius = v19;
      [v15 diffuseShadowOffset];
      self->_diffuseShadowOffset.width = v20;
      self->_diffuseShadowOffset.height = v21;
      self->_diffuseShadowRadiusWhileTouched = self->_diffuseShadowRadius;
      self->_diffuseShadowOffsetWhileTouched = self->_diffuseShadowOffset;
      self->_diffuseShadowOpacityWhileTouched = self->_diffuseShadowOpacity;

      break;
    default:
      [(SBAppSwitcherSettings *)self->_switcherSettings switcherCardShadowRadius];
      self->_diffuseShadowRadius = v22;
      [(SBAppSwitcherSettings *)self->_switcherSettings switcherCardShadowOpacity];
      self->_diffuseShadowOpacity = v23;
      [(SBAppSwitcherSettings *)self->_switcherSettings switcherCardShadowOffsetHorizontal];
      CGFloat v25 = v24;
      [(SBAppSwitcherSettings *)self->_switcherSettings switcherCardShadowOffsetVertical];
      self->_diffuseShadowOffset.width = v25;
      self->_diffuseShadowOffset.height = v26;
      [(SBAppSwitcherSettings *)self->_switcherSettings switcherCardShadowRadiusWhileTouched];
      self->_diffuseShadowRadiusWhileTouched = v27;
      [(SBAppSwitcherSettings *)self->_switcherSettings switcherCardShadowOpacityWhileTouched];
      self->_diffuseShadowOpacityWhileTouched = v28;
      [(SBAppSwitcherSettings *)self->_switcherSettings switcherCardShadowOffsetHorizontalWhileTouched];
      CGFloat v30 = v29;
      [(SBAppSwitcherSettings *)self->_switcherSettings switcherCardShadowOffsetVerticalWhileTouched];
      self->_diffuseShadowOffsetWhileTouched.width = v30;
      self->_diffuseShadowOffsetWhileTouched.height = v31;
      break;
  }
  [(SBAppSwitcherSettings *)self->_switcherSettings cursorHoverShadowRadiusInterpolationAmount];
  self->_diffuseShadowRadiusWhileCursorHovered = v47 * self->_diffuseShadowRadiusWhileTouched
                                               + (1.0 - v47) * self->_diffuseShadowRadius;
  [(SBAppSwitcherSettings *)self->_switcherSettings cursorHoverShadowOpacityInterpolationAmount];
  self->_diffuseShadowOpacityWhileCursorHovered = v48 * self->_diffuseShadowOpacityWhileTouched
                                                + (1.0 - v48) * self->_diffuseShadowOpacity;
  [(SBAppSwitcherSettings *)self->_switcherSettings cursorHoverShadowOffsetInterpolationAmount];
  self->_diffuseShadowOffsetWhileCursorHovered = (CGSize)vmlaq_n_f64(vmulq_n_f64((float64x2_t)self->_diffuseShadowOffsetWhileTouched, v49), (float64x2_t)self->_diffuseShadowOffset, 1.0 - v49);
}

- (void)_updateShadowParameters
{
  v38[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(SBAppSwitcherPageShadowView *)self _diffuseShadowView];
  uint64_t v4 = [(SBAppSwitcherPageShadowView *)self _rimShadowView];
  unint64_t highlightType = self->_highlightType;
  id v6 = (double *)MEMORY[0x1E4F1DB30];
  switch(highlightType)
  {
    case 2uLL:
      double diffuseShadowRadiusWhileTouched = self->_diffuseShadowRadiusWhileTouched;
      double diffuseShadowOpacityWhileTouched = self->_diffuseShadowOpacityWhileTouched;
      uint64_t v9 = 536;
      goto LABEL_7;
    case 1uLL:
      double diffuseShadowRadiusWhileTouched = self->_diffuseShadowRadiusWhileCursorHovered;
      double diffuseShadowOpacityWhileTouched = self->_diffuseShadowOpacityWhileCursorHovered;
      uint64_t v9 = 568;
      goto LABEL_7;
    case 0uLL:
      double diffuseShadowRadiusWhileTouched = self->_diffuseShadowRadius;
      double diffuseShadowOpacityWhileTouched = self->_diffuseShadowOpacity;
      uint64_t v9 = 504;
LABEL_7:
      double v10 = (double *)((char *)self + v9);
      goto LABEL_9;
  }
  double diffuseShadowOpacityWhileTouched = 0.0;
  double v10 = (double *)MEMORY[0x1E4F1DB30];
  double diffuseShadowRadiusWhileTouched = 0.0;
LABEL_9:
  double v12 = *v10;
  double v11 = v10[1];
  CGFloat v13 = [v3 layer];
  [v13 setShadowRadius:diffuseShadowRadiusWhileTouched];

  double v14 = [v3 layer];
  *(float *)&double v15 = diffuseShadowOpacityWhileTouched;
  [v14 setShadowOpacity:v15];

  uint64_t v16 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  double shadowOffset = self->_shadowOffset;
  if (v16 == 1) {
    double shadowOffset = -shadowOffset;
  }
  double v18 = v12 * shadowOffset;
  double v19 = [v3 layer];
  objc_msgSend(v19, "setShadowOffset:", v18, v11);

  CGFloat v20 = [v4 layer];
  [v20 setShadowRadius:self->_rimShadowRadius];

  CGFloat v21 = [v4 layer];
  double rimShadowOpacity = self->_rimShadowOpacity;
  *(float *)&double rimShadowOpacity = rimShadowOpacity;
  [v21 setShadowOpacity:rimShadowOpacity];

  double v23 = [v4 layer];
  objc_msgSend(v23, "setShadowOffset:", *v6, v6[1]);

  if (self->_style == 2
    && ([(SBAppSwitcherPageShadowView *)self traitCollection],
        double v24 = objc_claimAutoreleasedReturnValue(),
        uint64_t v25 = [v24 userInterfaceStyle],
        v24,
        v25 == 2))
  {
    CGFloat v26 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A350]];
    double v27 = (void *)MEMORY[0x1E4F29238];
    medusaSettings = self->_medusaSettings;
    if (medusaSettings) {
      [(SBMedusaSettings *)medusaSettings coronaVibrantColorMatrixInput];
    }
    else {
      memset(v36, 0, sizeof(v36));
    }
    CGFloat v31 = [v27 valueWithCAColorMatrix:v36];
    [v26 setValue:v31 forKey:@"inputColorMatrix"];

    double v32 = [v3 layer];
    v38[0] = v26;
    double v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    [v32 setFilters:v33];

    double v34 = [v4 layer];
    double v37 = v26;
    double v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    [v34 setFilters:v35];
  }
  else
  {
    double v29 = [v3 layer];
    [v29 setFilters:0];

    CGFloat v30 = [v4 layer];
    [v30 setFilters:0];
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_switcherSettings == a3 || self->_medusaSettings == a3)
  {
    [(SBAppSwitcherPageShadowView *)self _applyPrototypeSettingsToConstants];
    [(SBAppSwitcherPageShadowView *)self _updateShadowParameters];
  }
}

- (double)switcherCardScale
{
  return self->_switcherCardScale;
}

- (int64_t)style
{
  return self->_style;
}

- (unint64_t)highlightType
{
  return self->_highlightType;
}

- (UIBezierPath)shadowPath
{
  return self->_shadowPath;
}

- (double)shadowOffset
{
  return self->_shadowOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowPath, 0);
  objc_storeStrong((id *)&self->_rimShadowView, 0);
  objc_storeStrong((id *)&self->_diffuseShadowView, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_switcherSettings, 0);
}

@end