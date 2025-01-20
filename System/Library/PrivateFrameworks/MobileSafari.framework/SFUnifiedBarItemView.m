@interface SFUnifiedBarItemView
- (BOOL)_shouldEnableCopyCutoutBorder;
- (BOOL)_shouldEnablePlatterCutoutBorder;
- (BOOL)_shouldHidePlatterView;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isHovering;
- (BOOL)isOccluded;
- (BOOL)isVisible;
- (BOOL)itemsNeedEraserBasedCutoutBorder;
- (NSString)cutoutBorderCopyGroupName;
- (NSString)reuseIdentifier;
- (SFUnifiedBarItem)item;
- (SFUnifiedBarItemView)initWithFrame:(CGRect)a3;
- (SFUnifiedBarMetrics)barMetrics;
- (SFUnifiedBarTheme)barTheme;
- (UIDragPreviewParameters)previewParameters;
- (UIView)contentView;
- (double)barBackgroundAlpha;
- (double)preferredWidth;
- (double)squishTransformFactor;
- (double)squishedInset;
- (double)themeColorVisibility;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)platterStyle;
- (void)_applyPlatterColor:(id)a3;
- (void)_applyThemeToPlatterView:(id)a3;
- (void)_buttonShapesEnabledDidChange;
- (void)_disableVibrancyIfNeededForTheme:(id)a3;
- (void)_layOutCutoutBorder;
- (void)_setShowsCutoutBorderEffects:(BOOL)a3;
- (void)_setShowsCutoutBorderEraser:(BOOL)a3;
- (void)_setShowsPlatter:(BOOL)a3;
- (void)_updateBackgroundAlpha;
- (void)_updateContentAlpha;
- (void)_updateOverrideUserInterfaceStyle;
- (void)_updatePlatterEffect;
- (void)_updateShowsCutoutBorder;
- (void)layoutSubviews;
- (void)setBarBackgroundAlpha:(double)a3;
- (void)setBarMetrics:(id)a3;
- (void)setBarTheme:(id)a3;
- (void)setCutoutBorderCopyGroupName:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHovering:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setItemsNeedEraserBasedCutoutBorder:(BOOL)a3;
- (void)setOccluded:(BOOL)a3;
- (void)setPlatterStyle:(int64_t)a3;
- (void)setReuseIdentifier:(id)a3;
- (void)setSquishTransformFactor:(double)a3;
- (void)setSquishedInset:(double)a3;
- (void)setThemeColorVisibility:(double)a3;
- (void)setVisible:(BOOL)a3;
- (void)updateCornerRadius;
@end

@implementation SFUnifiedBarItemView

- (SFUnifiedBarItemView)initWithFrame:(CGRect)a3
{
  v26[4] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)SFUnifiedBarItemView;
  v3 = -[SFUnifiedBarItemView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_squishTransformFactor = 1.0;
    v3->_barBackgroundAlpha = 1.0;
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    contentView = v4->_contentView;
    v4->_contentView = v5;

    [(UIView *)v4->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFUnifiedBarItemView *)v4 addSubview:v4->_contentView];
    v20 = (void *)MEMORY[0x1E4F28DC8];
    v24 = [(UIView *)v4->_contentView leadingAnchor];
    v23 = [(SFUnifiedBarItemView *)v4 leadingAnchor];
    v22 = [v24 constraintEqualToAnchor:v23];
    v26[0] = v22;
    v21 = [(UIView *)v4->_contentView topAnchor];
    v7 = [(SFUnifiedBarItemView *)v4 topAnchor];
    v8 = [v21 constraintEqualToAnchor:v7];
    v26[1] = v8;
    v9 = [(SFUnifiedBarItemView *)v4 trailingAnchor];
    v10 = [(UIView *)v4->_contentView trailingAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    v26[2] = v11;
    v12 = [(SFUnifiedBarItemView *)v4 bottomAnchor];
    v13 = [(UIView *)v4->_contentView bottomAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v26[3] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
    [v20 activateConstraints:v15];

    v16 = +[SFUnifiedBarTheme defaultTheme];
    [(SFUnifiedBarItemView *)v4 setBarTheme:v16];

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v4 selector:sel__buttonShapesEnabledDidChange name:*MEMORY[0x1E4FB2428] object:0];

    v18 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFUnifiedBarItemView;
  [(SFUnifiedBarItemView *)&v3 layoutSubviews];
  [(SFUnifiedBarItemView *)self updateCornerRadius];
  [(SFUnifiedBarItemView *)self _layOutCutoutBorder];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v4 = self;
  v9.receiver = self;
  v9.super_class = (Class)SFUnifiedBarItemView;
  uint64_t v5 = -[SFUnifiedBarItemView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v6 = (void *)v5;
  if ((!v5 || !v4->_occluded) && (UIView *)v5 != v4->_contentView) {
    v4 = (SFUnifiedBarItemView *)v5;
  }
  v7 = v4;

  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SFUnifiedBarItemView;
    BOOL v5 = [(SFUnifiedBarItemView *)&v7 gestureRecognizerShouldBegin:v4];
  }

  return v5;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SFUnifiedBarItemView *)self isHighlighted] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SFUnifiedBarItemView;
    [(SFUnifiedBarItemView *)&v7 setHighlighted:v3];
    double v5 = 0.2;
    if (!v3) {
      double v5 = 0.5;
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__SFUnifiedBarItemView_setHighlighted___block_invoke;
    v6[3] = &unk_1E54E9858;
    v6[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:50659332 delay:v6 options:0 animations:v5 completion:0.0];
  }
}

uint64_t __39__SFUnifiedBarItemView_setHighlighted___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateContentAlpha];
  v2 = *(void **)(a1 + 32);

  return [v2 _updatePlatterEffect];
}

- (void)_setShowsPlatter:(BOOL)a3
{
  v42[4] = *MEMORY[0x1E4F143B8];
  if ((((self->_platterView == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    -[UIView setClipsToBounds:](self->_contentView, "setClipsToBounds:");
    double v5 = [(SFUnifiedBarItemView *)self layer];
    [v5 setAllowsGroupOpacity:!v3];

    if (v3)
    {
      v6 = objc_alloc_init(SFUnifiedBarItemPlatterView);
      platterView = self->_platterView;
      self->_platterView = v6;

      [(SFUnifiedBarItemPlatterView *)self->_platterView setUserInteractionEnabled:0];
      [(SFUnifiedBarItemPlatterView *)self->_platterView setTranslatesAutoresizingMaskIntoConstraints:0];
      v8 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
      platterFillView = self->_platterFillView;
      self->_platterFillView = v8;

      [(UIVisualEffectView *)self->_platterFillView setUserInteractionEnabled:0];
      [(UIVisualEffectView *)self->_platterFillView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(SFUnifiedBarItemView *)self insertSubview:self->_platterView belowSubview:self->_contentView];
      [(SFUnifiedBarItemView *)self insertSubview:self->_platterFillView belowSubview:self->_contentView];
      v39 = [(SFUnifiedBarItemPlatterView *)self->_platterView leadingAnchor];
      v37 = [(SFUnifiedBarItemView *)self leadingAnchor];
      v35 = [v39 constraintEqualToAnchor:v37];
      v42[0] = v35;
      v33 = [(SFUnifiedBarItemPlatterView *)self->_platterView topAnchor];
      v31 = [(SFUnifiedBarItemView *)self topAnchor];
      v10 = [v33 constraintEqualToAnchor:v31];
      v42[1] = v10;
      v11 = [(SFUnifiedBarItemView *)self trailingAnchor];
      v12 = [(SFUnifiedBarItemPlatterView *)self->_platterView trailingAnchor];
      v13 = [v11 constraintEqualToAnchor:v12];
      v42[2] = v13;
      v14 = [(SFUnifiedBarItemView *)self bottomAnchor];
      v15 = [(SFUnifiedBarItemPlatterView *)self->_platterView bottomAnchor];
      v16 = [v14 constraintEqualToAnchor:v15];
      v42[3] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
      platterViewConstraints = self->_platterViewConstraints;
      self->_platterViewConstraints = v17;

      [MEMORY[0x1E4F28DC8] activateConstraints:self->_platterViewConstraints];
      v32 = (void *)MEMORY[0x1E4F28DC8];
      v40 = [(UIVisualEffectView *)self->_platterFillView leadingAnchor];
      v38 = [(SFUnifiedBarItemView *)self leadingAnchor];
      v36 = [v40 constraintEqualToAnchor:v38];
      v41[0] = v36;
      v34 = [(UIVisualEffectView *)self->_platterFillView topAnchor];
      v19 = [(SFUnifiedBarItemView *)self topAnchor];
      v20 = [v34 constraintEqualToAnchor:v19];
      v41[1] = v20;
      v21 = [(SFUnifiedBarItemView *)self trailingAnchor];
      v22 = [(UIVisualEffectView *)self->_platterFillView trailingAnchor];
      v23 = [v21 constraintEqualToAnchor:v22];
      v41[2] = v23;
      v24 = [(SFUnifiedBarItemView *)self bottomAnchor];
      objc_super v25 = [(UIVisualEffectView *)self->_platterFillView bottomAnchor];
      v26 = [v24 constraintEqualToAnchor:v25];
      v41[3] = v26;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
      [v32 activateConstraints:v27];
    }
    else
    {
      [(SFUnifiedBarItemPlatterView *)self->_platterView removeFromSuperview];
      v28 = self->_platterView;
      self->_platterView = 0;

      [(UIVisualEffectView *)self->_platterFillView removeFromSuperview];
      v29 = self->_platterFillView;
      self->_platterFillView = 0;

      v30 = self->_platterViewConstraints;
      self->_platterViewConstraints = 0;

      [(SFUnifiedBarItemView *)self setOverrideUserInterfaceStyle:0];
    }
  }
}

- (void)_setShowsCutoutBorderEffects:(BOOL)a3
{
  cutoutBorderCopyView = self->_cutoutBorderCopyView;
  if (a3)
  {
    if (cutoutBorderCopyView) {
      return;
    }
    double v5 = (_UIVisualEffectBackdropView *)objc_alloc_init(MEMORY[0x1E4FB23F0]);
    v6 = self->_cutoutBorderCopyView;
    self->_cutoutBorderCopyView = v5;

    cutoutBorderCopyGroupName = self->_cutoutBorderCopyGroupName;
    v8 = [(_UIVisualEffectBackdropView *)self->_cutoutBorderCopyView captureGroup];
    [v8 setGroupName:cutoutBorderCopyGroupName];

    [(_UIVisualEffectBackdropView *)self->_cutoutBorderCopyView setUserInteractionEnabled:0];
    objc_super v9 = objc_alloc_init(SFUnifiedBarItemPlatterView);
    cutoutBorderPlatterView = self->_cutoutBorderPlatterView;
    self->_cutoutBorderPlatterView = v9;

    [(SFUnifiedBarItemPlatterView *)self->_cutoutBorderPlatterView setUserInteractionEnabled:0];
    platterView = self->_platterView;
    if (!platterView) {
      platterView = (SFUnifiedBarItemPlatterView *)self->_contentView;
    }
    v12 = self->_cutoutBorderCopyView;
    v15 = platterView;
    [(SFUnifiedBarItemView *)self insertSubview:v12 belowSubview:v15];
    [(SFUnifiedBarItemView *)self insertSubview:self->_cutoutBorderPlatterView belowSubview:v15];
    v13 = v15;
  }
  else
  {
    if (!cutoutBorderCopyView) {
      return;
    }
    [(_UIVisualEffectBackdropView *)cutoutBorderCopyView removeFromSuperview];
    v14 = self->_cutoutBorderCopyView;
    self->_cutoutBorderCopyView = 0;

    [(SFUnifiedBarItemPlatterView *)self->_cutoutBorderPlatterView removeFromSuperview];
    v13 = self->_cutoutBorderPlatterView;
    self->_cutoutBorderPlatterView = 0;
  }
}

- (void)_setShowsCutoutBorderEraser:(BOOL)a3
{
  BOOL v4 = !a3;
  double v5 = [(SFUnifiedBarItemView *)self layer];
  [v5 setAllowsGroupBlending:v4];

  cutoutBorderEraserView = self->_cutoutBorderEraserView;
  if (v4)
  {
    if (cutoutBorderEraserView)
    {
      [(UIView *)cutoutBorderEraserView removeFromSuperview];
      v14 = self->_cutoutBorderEraserView;
      self->_cutoutBorderEraserView = 0;
    }
  }
  else if (!cutoutBorderEraserView)
  {
    objc_super v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v8 = self->_cutoutBorderEraserView;
    self->_cutoutBorderEraserView = v7;

    objc_super v9 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)self->_cutoutBorderEraserView setBackgroundColor:v9];

    uint64_t v10 = *MEMORY[0x1E4F3A098];
    v11 = [(UIView *)self->_cutoutBorderEraserView layer];
    [v11 setCompositingFilter:v10];

    [(UIView *)self->_cutoutBorderEraserView setUserInteractionEnabled:0];
    platterView = self->_platterView;
    if (!platterView) {
      platterView = (SFUnifiedBarItemPlatterView *)self->_contentView;
    }
    v13 = self->_cutoutBorderEraserView;
    [(SFUnifiedBarItemView *)self insertSubview:v13 belowSubview:platterView];
  }
}

- (void)setBarMetrics:(id)a3
{
  double v5 = (SFUnifiedBarMetrics *)a3;
  if (self->_barMetrics != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_barMetrics, a3);
    [(SFUnifiedBarItemView *)self setNeedsLayout];
    double v5 = v6;
  }
}

- (void)setBarTheme:(id)a3
{
  id v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    [(SFUnifiedBarItemView *)self _disableVibrancyIfNeededForTheme:v5];
    objc_storeStrong((id *)&self->_barTheme, a3);
    [(SFUnifiedBarItemView *)self _updatePlatterEffect];
    [(SFUnifiedBarItemView *)self applyTheme];
  }
}

- (void)setPlatterStyle:(int64_t)a3
{
  if (self->_platterStyle != a3)
  {
    BOOL v5 = a3 == 0;
    v6 = [(SFUnifiedBarItemView *)self layer];
    [v6 setAllowsGroupOpacity:v5];

    self->_platterStyle = a3;
    [(SFUnifiedBarItemView *)self _setShowsPlatter:(unint64_t)(a3 - 1) < 5];
    [(SFUnifiedBarItemView *)self _updateShowsCutoutBorder];
    [(SFUnifiedBarItemView *)self _updatePlatterEffect];
    [(SFUnifiedBarItemView *)self setNeedsUpdateConstraints];
    [(SFUnifiedBarItemView *)self setNeedsLayout];
  }
}

- (void)setItemsNeedEraserBasedCutoutBorder:(BOOL)a3
{
  if (self->_itemsNeedEraserBasedCutoutBorder != a3)
  {
    self->_itemsNeedEraserBasedCutoutBorder = a3;
    [(SFUnifiedBarItemView *)self _updateShowsCutoutBorder];
  }
}

- (void)_updateShowsCutoutBorder
{
  int64_t platterStyle = self->_platterStyle;
  if (platterStyle && (platterStyle != 5 || UIAccessibilityButtonShapesEnabled()))
  {
    [(SFUnifiedBarItemView *)self _setShowsCutoutBorderEffects:!self->_itemsNeedEraserBasedCutoutBorder];
    BOOL itemsNeedEraserBasedCutoutBorder = self->_itemsNeedEraserBasedCutoutBorder;
  }
  else
  {
    [(SFUnifiedBarItemView *)self _setShowsCutoutBorderEffects:0];
    BOOL itemsNeedEraserBasedCutoutBorder = 0;
  }

  [(SFUnifiedBarItemView *)self _setShowsCutoutBorderEraser:itemsNeedEraserBasedCutoutBorder];
}

- (void)_layOutCutoutBorder
{
  [(SFUnifiedBarMetrics *)self->_barMetrics cutoutBorderWidth];
  double v4 = v3;
  [(SFUnifiedBarItemView *)self bounds];
  CGRect v12 = CGRectInset(v11, -v4, -v4);
  double x = v12.origin.x;
  double y = v12.origin.y;
  double width = v12.size.width;
  double height = v12.size.height;
  -[_UIVisualEffectBackdropView setFrame:](self->_cutoutBorderCopyView, "setFrame:");
  -[SFUnifiedBarItemPlatterView setFrame:](self->_cutoutBorderPlatterView, "setFrame:", x, y, width, height);
  cutoutBorderEraserView = self->_cutoutBorderEraserView;

  -[UIView setFrame:](cutoutBorderEraserView, "setFrame:", x, y, width, height);
}

- (void)_disableVibrancyIfNeededForTheme:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SFThemeColorBarTheme *)self->_barTheme themeColor];
  if (v5)
  {
  }
  else
  {
    v6 = [v4 themeColor];

    if (v6)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __57__SFUnifiedBarItemView__disableVibrancyIfNeededForTheme___block_invoke;
      v7[3] = &unk_1E54E9858;
      v7[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
    }
  }
}

uint64_t __57__SFUnifiedBarItemView__disableVibrancyIfNeededForTheme___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHighlighted:0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 840);
  id v4 = *(void **)(v2 + 832);
  if (*(unsigned char *)(v2 + 802)) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = [(id)v2 isHighlighted];
  }
  v6 = backgroundColorForPlatterStyle(v3, v4, v5);
  objc_super v7 = [*(id *)(*(void *)(a1 + 32) + 776) contentView];
  [v7 setBackgroundColor:v6];

  v8 = *(void **)(*(void *)(a1 + 32) + 776);

  return [v8 setEffect:0];
}

- (void)_updatePlatterEffect
{
  if (self->_platterStyle)
  {
    uint64_t v3 = [(SFThemeColorBarTheme *)self->_barTheme themeColor];
    if (v3 || [(SFUnifiedBarTheme *)self->_barTheme isPrivate])
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      unint64_t platterStyle = self->_platterStyle;
      if (platterStyle > 8) {
        LOBYTE(v4) = 1;
      }
      else {
        unsigned int v4 = (0x16u >> platterStyle) & 1;
      }
    }

    if (self->_hovering) {
      char v5 = 1;
    }
    else {
      char v5 = [(SFUnifiedBarItemView *)self isHighlighted];
    }
    if ([(SFUnifiedBarItemView *)self _shouldEnableCopyCutoutBorder]) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 0;
    }
    [(_UIVisualEffectBackdropView *)self->_cutoutBorderCopyView setRenderMode:v6];
    [(SFUnifiedBarItemPlatterView *)self->_cutoutBorderPlatterView setHidden:[(SFUnifiedBarItemView *)self _shouldEnablePlatterCutoutBorder] ^ 1];
    [(SFUnifiedBarItemPlatterView *)self->_platterView setHidden:[(SFUnifiedBarItemView *)self _shouldHidePlatterView]];
    [(SFUnifiedBarItemView *)self _updateOverrideUserInterfaceStyle];
    [(SFUnifiedBarItemView *)self _updateBackgroundAlpha];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__SFUnifiedBarItemView__updatePlatterEffect__block_invoke;
    aBlock[3] = &unk_1E54E9880;
    char v20 = v4;
    aBlock[4] = self;
    char v21 = v5;
    objc_super v7 = _Block_copy(aBlock);
    v8 = v7;
    int64_t lastAppliedPlatterStyle = self->_lastAppliedPlatterStyle;
    int64_t v10 = self->_platterStyle;
    BOOL v11 = lastAppliedPlatterStyle == v10;
    if (lastAppliedPlatterStyle == v10) {
      (*((void (**)(void *))v7 + 2))(v7);
    }
    CGRect v12 = (void *)MEMORY[0x1E4FB1EB0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__SFUnifiedBarItemView__updatePlatterEffect__block_invoke_2;
    v15[3] = &unk_1E54E98A8;
    char v17 = v4;
    BOOL v18 = v11;
    v15[4] = self;
    id v16 = v8;
    id v13 = v8;
    [v12 performWithoutAnimation:v15];
    self->_int64_t lastAppliedPlatterStyle = self->_platterStyle;
  }
}

void __44__SFUnifiedBarItemView__updatePlatterEffect__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 840);
  if (*(unsigned char *)(a1 + 40))
  {
    int v4 = *(unsigned __int8 *)(a1 + 41);
    int v5 = _SFIsDarkTintStyle([*(id *)(v2 + 832) tintStyle]);
    uint64_t v6 = *(void *)(a1 + 32);
    double v7 = *(double *)(v6 + 848);
    uint64_t v8 = [*(id *)(v6 + 832) overrideBackdropEffect];
    objc_super v9 = (void *)v8;
    double v10 = 0.0;
    switch(v3)
    {
      case 0:
      case 3:
      case 5:
      case 6:
      case 7:
      case 8:
        goto LABEL_17;
      case 1:
        if (v8) {
          goto LABEL_13;
        }
        double v11 = 0.35;
        double v12 = 0.25;
        goto LABEL_14;
      case 2:
        if (v5)
        {
          if (v8)
          {
            double v12 = 0.6;
            double v11 = 0.45;
          }
          else
          {
            double v12 = 0.4;
            double v11 = 0.7;
          }
        }
        else if (v8)
        {
LABEL_13:
          double v11 = 0.35;
          double v12 = 0.5;
        }
        else
        {
          double v12 = 0.45;
          double v11 = 0.5;
        }
LABEL_14:
        double v10 = _SFInterpolate(v12, v11, v7);
        goto LABEL_15;
      case 4:
        if (v5) {
          double v10 = 0.4;
        }
        else {
          double v10 = 0.2;
        }
        goto LABEL_15;
      default:
LABEL_15:
        if (v4) {
          double v10 = v10 + 0.2;
        }
LABEL_17:

        v15 = *(void **)(a1 + 32);
        uint64_t v13 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:v10];
        id v16 = (id)v13;
        v14 = v15;
        break;
    }
  }
  else
  {
    uint64_t v13 = backgroundColorForPlatterStyle(*(void *)(v2 + 840), *(void **)(v2 + 832), *(unsigned __int8 *)(a1 + 41));
    id v16 = (id)v13;
    v14 = (void *)v2;
  }
  [v14 _applyPlatterColor:v13];
}

void __44__SFUnifiedBarItemView__updatePlatterEffect__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _applyThemeToPlatterView:*(void *)(*(void *)(a1 + 32) + 752)];
  [*(id *)(a1 + 32) _applyThemeToPlatterView:*(void *)(*(void *)(a1 + 32) + 768)];
  if ([*(id *)(*(void *)(a1 + 32) + 832) tintStyle] != 5)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v3 = (void *)MEMORY[0x1E4FB1EA0];
      uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 832) backdropEffect];
      unint64_t v4 = *(void *)(*(void *)(a1 + 32) + 840);
      if (v4 > 8) {
        uint64_t v5 = 5;
      }
      else {
        uint64_t v5 = qword_18C70E750[v4];
      }
      uint64_t v6 = [v3 effectForBlurEffect:v2 style:v5];
      [*(id *)(*(void *)(a1 + 32) + 776) setEffect:v6];

      goto LABEL_10;
    }
LABEL_7:
    [*(id *)(*(void *)(a1 + 32) + 776) setEffect:0];
    goto LABEL_11;
  }
  if (!*(unsigned char *)(a1 + 48)) {
    goto LABEL_7;
  }
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4FB1EA0], "_sf_effectWithStyle:forBarTintStyle:", 0, 5);
  [*(id *)(*(void *)(a1 + 32) + 776) setEffect:v2];
LABEL_10:

LABEL_11:
  if (!*(unsigned char *)(a1 + 49))
  {
    double v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v7();
  }
}

- (void)_applyThemeToPlatterView:(id)a3
{
  id v4 = a3;
  barTheme = self->_barTheme;
  id v10 = v4;
  uint64_t v6 = [v4 effectView];
  [(SFThemeColorBarTheme *)barTheme applyBackdropEffectsToView:v6];

  double v7 = [(SFThemeColorBarTheme *)self->_barTheme themeColor];

  if (v7)
  {
    uint64_t v8 = [v10 effectView];
    objc_super v9 = [v8 contentView];
    [v9 setBackgroundColor:0];
  }
}

- (void)_applyPlatterColor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIVisualEffectView *)self->_platterFillView contentView];
  uint64_t v6 = v5;
  if (self->_platterStyle == 3)
  {
    double v7 = [(SFUnifiedBarItemView *)self traitCollection];
    uint64_t v8 = [v4 resolvedColorWithTraitCollection:v7];

    double v16 = 0.0;
    [v8 getRed:0 green:0 blue:0 alpha:&v16];
    double barBackgroundAlpha = 0.0;
    if (![(SFUnifiedBarTheme *)self->_barTheme isPrivate]) {
      double barBackgroundAlpha = self->_barBackgroundAlpha;
    }
    if (self->_hovering || [(SFUnifiedBarItemView *)self isHighlighted])
    {
      [v6 setBackgroundColor:v4];
    }
    else
    {
      double v11 = [v8 colorWithAlphaComponent:(1.0 - barBackgroundAlpha) * v16];
      [v6 setBackgroundColor:v11];
    }
    id v12 = [v8 colorWithAlphaComponent:barBackgroundAlpha * v16];
    uint64_t v13 = [v12 CGColor];
    v14 = [v6 layer];
    [v14 setBorderColor:v13];

    v15 = [v6 layer];
    [v15 setBorderWidth:1.0];
  }
  else
  {
    [v5 setBackgroundColor:v4];
    id v10 = [v6 layer];
    [v10 setBorderColor:0];

    uint64_t v8 = [v6 layer];
    [v8 setBorderWidth:0.0];
  }
}

- (void)_updateOverrideUserInterfaceStyle
{
  if ((unint64_t)(self->_platterStyle - 1) <= 4)
  {
    if ([(SFUnifiedBarTheme *)self->_barTheme isPrivate]) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 0;
    }
    [(SFUnifiedBarItemView *)self setOverrideUserInterfaceStyle:v3];
  }
}

- (void)setCutoutBorderCopyGroupName:(id)a3
{
  id v7 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    id v4 = (NSString *)[v7 copy];
    cutoutBorderCopyGroupName = self->_cutoutBorderCopyGroupName;
    self->_cutoutBorderCopyGroupName = v4;

    uint64_t v6 = [(_UIVisualEffectBackdropView *)self->_cutoutBorderCopyView captureGroup];
    [v6 setGroupName:v7];
  }
}

- (void)setBarBackgroundAlpha:(double)a3
{
  if (self->_barBackgroundAlpha != a3)
  {
    self->_double barBackgroundAlpha = a3;
    [(SFUnifiedBarItemView *)self _updatePlatterEffect];
  }
}

- (void)setThemeColorVisibility:(double)a3
{
  if (self->_themeColorVisibility != a3)
  {
    self->_themeColorVisibilitdouble y = a3;
    [(SFUnifiedBarItemView *)self _updateBackgroundAlpha];
  }
}

- (void)_updateBackgroundAlpha
{
  id v14 = [(SFThemeColorBarTheme *)self->_barTheme themeColor];
  double v3 = SFBarBackgroundAlphaForSquishTransformFactor(self->_squishTransformFactor);
  if (v14) {
    double v4 = _SFInterpolate(1.0 - 0.85, 0.0, self->_themeColorVisibility);
  }
  else {
    double v4 = 1.0;
  }
  [(UIVisualEffectView *)self->_platterFillView setAlpha:v3];
  uint64_t v5 = [(SFUnifiedBarTheme *)self->_barTheme overridePlatterColor];
  uint64_t v6 = (void *)v5;
  if (!v5 || (id v7 = (void *)v5, (unint64_t)(self->_platterStyle - 1) >= 4)) {
    id v7 = v14;
  }
  id v8 = v7;
  objc_super v9 = [v8 colorWithAlphaComponent:v3];
  [(SFUnifiedBarItemPlatterView *)self->_platterView setBackgroundColor:v9];

  id v10 = [(SFUnifiedBarItemPlatterView *)self->_platterView effectView];
  [v10 setAlpha:v3 * v4];

  double v11 = ceil(v3);
  id v12 = [v14 colorWithAlphaComponent:v11];

  [(SFUnifiedBarItemPlatterView *)self->_cutoutBorderPlatterView setBackgroundColor:v12];
  uint64_t v13 = [(SFUnifiedBarItemPlatterView *)self->_cutoutBorderPlatterView effectView];
  [v13 setAlpha:v11 * v4];
}

- (BOOL)_shouldEnableCopyCutoutBorder
{
  return self->_barBackgroundAlpha < 1.0;
}

- (BOOL)_shouldEnablePlatterCutoutBorder
{
  return ![(SFUnifiedBarItemView *)self _shouldEnableCopyCutoutBorder];
}

- (BOOL)_shouldHidePlatterView
{
  if (!self->_cutoutBorderPlatterView
    || ![(SFUnifiedBarItemView *)self _shouldEnablePlatterCutoutBorder])
  {
    return 0;
  }
  double v3 = [(SFUnifiedBarTheme *)self->_barTheme overridePlatterColor];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)setSquishTransformFactor:(double)a3
{
  if (self->_squishTransformFactor != a3)
  {
    self->_squishTransformFactor = a3;
    [(SFUnifiedBarItemView *)self _updateContentAlpha];
    [(SFUnifiedBarItemView *)self _updateBackgroundAlpha];
  }
}

- (double)preferredWidth
{
  return 0.0;
}

- (UIDragPreviewParameters)previewParameters
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1720]);
  BOOL v4 = (void *)MEMORY[0x1E4FB14C0];
  [(SFUnifiedBarItemView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(SFUnifiedBarMetrics *)self->_barMetrics itemCornerRadius];
  id v14 = objc_msgSend(v4, "bezierPathWithRoundedRect:cornerRadius:", v6, v8, v10, v12, v13);
  [v3 setVisiblePath:v14];

  v15 = [(SFThemeColorBarTheme *)self->_barTheme themeColor];
  double v16 = [v15 colorWithAlphaComponent:1.0];
  if (v16)
  {
    [v3 setBackgroundColor:v16];
  }
  else
  {
    char v17 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    BOOL v18 = [(SFUnifiedBarItemView *)self traitCollection];
    v19 = [v17 resolvedColorWithTraitCollection:v18];
    [v3 setBackgroundColor:v19];
  }

  return (UIDragPreviewParameters *)v3;
}

- (void)updateCornerRadius
{
  [(SFUnifiedBarMetrics *)self->_barMetrics itemCornerRadius];
  double v4 = v3;
  -[SFUnifiedBarItemView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  [(UIView *)self->_contentView _setContinuousCornerRadius:v4];
  if (self->_platterStyle != 5 || (double v5 = 0.0, UIAccessibilityButtonShapesEnabled())) {
    double v5 = v4;
  }
  [(SFUnifiedBarItemPlatterView *)self->_platterView _setContinuousCornerRadius:v5];
  [(UIVisualEffectView *)self->_platterFillView _setContinuousCornerRadius:v4];
  [(SFUnifiedBarMetrics *)self->_barMetrics cutoutBorderWidth];
  double v7 = v4 + v6;
  [(_UIVisualEffectBackdropView *)self->_cutoutBorderCopyView _setContinuousCornerRadius:v7];
  [(SFUnifiedBarItemPlatterView *)self->_cutoutBorderPlatterView _setContinuousCornerRadius:v7];
  cutoutBorderEraserView = self->_cutoutBorderEraserView;

  [(UIView *)cutoutBorderEraserView _setContinuousCornerRadius:v7];
}

- (void)_updateContentAlpha
{
  double v3 = SFBarContentAlphaForSquishTransformFactor(self->_squishTransformFactor);
  if (!self->_platterStyle && [(SFUnifiedBarItemView *)self isHighlighted]) {
    double v3 = v3 * dbl_18C70E740[[(SFThemeColorBarTheme *)self->_barTheme userInterfaceStyle] == 2];
  }
  [(UIView *)self->_contentView setAlpha:v3];
  id v4 = [(SFUnifiedBarItemView *)self _titleView];
  [v4 setAlpha:v3];
}

- (void)_buttonShapesEnabledDidChange
{
  [(SFUnifiedBarItemView *)self _updateShowsCutoutBorder];
  [(SFUnifiedBarItemView *)self _updatePlatterEffect];
  [(SFUnifiedBarItemView *)self setNeedsUpdateConstraints];

  [(SFUnifiedBarItemView *)self setNeedsLayout];
}

- (SFUnifiedBarItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);

  return (SFUnifiedBarItem *)WeakRetained;
}

- (void)setItem:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (SFUnifiedBarMetrics)barMetrics
{
  return self->_barMetrics;
}

- (SFUnifiedBarTheme)barTheme
{
  return self->_barTheme;
}

- (int64_t)platterStyle
{
  return self->_platterStyle;
}

- (double)barBackgroundAlpha
{
  return self->_barBackgroundAlpha;
}

- (double)themeColorVisibility
{
  return self->_themeColorVisibility;
}

- (double)squishTransformFactor
{
  return self->_squishTransformFactor;
}

- (BOOL)isOccluded
{
  return self->_occluded;
}

- (void)setOccluded:(BOOL)a3
{
  self->_occluded = a3;
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (void)setReuseIdentifier:(id)a3
{
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)isHovering
{
  return self->_hovering;
}

- (void)setHovering:(BOOL)a3
{
  self->_hovering = a3;
}

- (double)squishedInset
{
  return self->_squishedInset;
}

- (void)setSquishedInset:(double)a3
{
  self->_squishedInset = a3;
}

- (NSString)cutoutBorderCopyGroupName
{
  return self->_cutoutBorderCopyGroupName;
}

- (BOOL)itemsNeedEraserBasedCutoutBorder
{
  return self->_itemsNeedEraserBasedCutoutBorder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cutoutBorderCopyGroupName, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_barTheme, 0);
  objc_storeStrong((id *)&self->_barMetrics, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_platterViewConstraints, 0);
  objc_storeStrong((id *)&self->_platterFillView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_cutoutBorderEraserView, 0);
  objc_storeStrong((id *)&self->_cutoutBorderPlatterView, 0);

  objc_storeStrong((id *)&self->_cutoutBorderCopyView, 0);
}

@end