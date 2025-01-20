@interface SBFloatingDockPlatterView
+ (id)borderColorForUserInterfaceStyle:(int64_t)a3;
- (BOOL)hasShadow;
- (NSMutableDictionary)shadowImages;
- (NSString)backdropGroupName;
- (NSString)backdropGroupNamespace;
- (SBFloatingDockPlatterView)initWithCoder:(id)a3;
- (SBFloatingDockPlatterView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)_shadowInsetsForMetrics:(id)a3;
- (UIEdgeInsets)_shadowOutsetsForMetrics:(id)a3;
- (UIEdgeInsets)shadowOutsets;
- (UIEdgeInsets)shadowOutsetsForBounds:(CGRect)a3;
- (UIImageView)shadowView;
- (UIView)backgroundView;
- (_SBFloatingDockPlatterMetrics)metrics;
- (double)_maxShadowViewAlpha;
- (double)currentContinuousCornerRadius;
- (double)maximumContinuousCornerRadius;
- (double)referenceHeight;
- (id)_metricsForBounds:(CGRect)a3;
- (id)_shadowImageForMetrics:(id)a3 previousMetrics:(id)a4;
- (id)_shadowImageViewForMetrics:(id)a3 previousMetrics:(id)a4;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)layoutSubviews;
- (void)setBackdropGroupName:(id)a3;
- (void)setBackdropGroupNamespace:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setHasShadow:(BOOL)a3;
- (void)setMaximumContinuousCornerRadius:(double)a3;
- (void)setMetrics:(id)a3;
- (void)setReferenceHeight:(double)a3;
- (void)setShadowView:(id)a3;
- (void)updateBorderVisualStyling;
@end

@implementation SBFloatingDockPlatterView

- (SBFloatingDockPlatterView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBFloatingDockPlatterView;
  v3 = -[SBFloatingDockPlatterView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_hasShadow = 0;
    v5 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:19];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBFloatingDockPlatterView *)v4 addSubview:v5];
    [(SBFloatingDockPlatterView *)v4 setBackgroundView:v5];
    v6 = [v5 layer];
    [v6 setBorderWidth:0.3];

    [(SBFloatingDockPlatterView *)v4 updateBorderVisualStyling];
    [(SBFloatingDockPlatterView *)v4 setAccessibilityIdentifier:@"dock-platter-view"];
    v7 = [(SBFloatingDockPlatterView *)v4 layer];
    [v7 setAllowsGroupBlending:0];
  }
  return v4;
}

- (void)setReferenceHeight:(double)a3
{
  if (self->_referenceHeight != a3)
  {
    self->_referenceHeight = a3;
    [(SBFloatingDockPlatterView *)self setNeedsLayout];
  }
}

- (void)setMaximumContinuousCornerRadius:(double)a3
{
  if (self->_maximumContinuousCornerRadius != a3)
  {
    self->_maximumContinuousCornerRadius = a3;
    [(SBFloatingDockPlatterView *)self setNeedsLayout];
  }
}

- (double)currentContinuousCornerRadius
{
  v2 = [(SBFloatingDockPlatterView *)self backgroundView];
  [v2 _continuousCornerRadius];
  double v4 = v3;

  return v4;
}

- (void)setBackdropGroupName:(id)a3
{
  id v5 = a3;
  double v4 = [(SBFloatingDockPlatterView *)self backgroundView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setGroupName:v5];
  }
}

- (NSString)backdropGroupName
{
  v2 = [(SBFloatingDockPlatterView *)self backgroundView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v3 = [v2 groupName];
  }
  else
  {
    double v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setBackdropGroupNamespace:(id)a3
{
  id v6 = a3;
  double v4 = [(SBFloatingDockPlatterView *)self backgroundView];
  id v5 = [v4 layer];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setGroupNamespace:v6];
  }
}

- (NSString)backdropGroupNamespace
{
  id v3 = (id)*MEMORY[0x1E4F39DA8];
  double v4 = [(SBFloatingDockPlatterView *)self backgroundView];
  id v5 = [v4 layer];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 groupNamespace];

    id v3 = (id)v6;
  }

  return (NSString *)v3;
}

- (void)setHasShadow:(BOOL)a3
{
  if (self->_hasShadow != a3)
  {
    self->_hasShadow = a3;
    id v4 = [(SBFloatingDockPlatterView *)self shadowView];
    [(SBFloatingDockPlatterView *)self _maxShadowViewAlpha];
    objc_msgSend(v4, "setAlpha:");
  }
}

- (UIEdgeInsets)shadowOutsets
{
  id v3 = [(SBFloatingDockPlatterView *)self metrics];
  [(SBFloatingDockPlatterView *)self _shadowOutsetsForMetrics:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (UIEdgeInsets)shadowOutsetsForBounds:(CGRect)a3
{
  double v4 = -[SBFloatingDockPlatterView _metricsForBounds:](self, "_metricsForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SBFloatingDockPlatterView *)self _shadowOutsetsForMetrics:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)setBackgroundView:(id)a3
{
  double v5 = (UIView *)a3;
  p_backgroundView = &self->_backgroundView;
  backgroundView = self->_backgroundView;
  double v8 = v5;
  if (backgroundView != v5)
  {
    [(UIView *)backgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundView, a3);
    if (*p_backgroundView) {
      [(SBFloatingDockPlatterView *)self insertSubview:*p_backgroundView atIndex:0];
    }
  }
}

- (void)layoutSubviews
{
  v69.receiver = self;
  v69.super_class = (Class)SBFloatingDockPlatterView;
  [(SBFloatingDockPlatterView *)&v69 layoutSubviews];
  [(SBFloatingDockPlatterView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (BSFloatGreaterThanFloat() && BSFloatGreaterThanFloat())
  {
    double v11 = [(SBFloatingDockPlatterView *)self metrics];
    double v12 = -[SBFloatingDockPlatterView _metricsForBounds:](self, "_metricsForBounds:", v4, v6, v8, v10);
    [v12 continuousCornerRadius];
    if (!BSFloatGreaterThanFloat())
    {
LABEL_14:

      return;
    }
    [(SBFloatingDockPlatterView *)self setMetrics:v12];
    [v12 continuousCornerRadius];
    double v14 = v13;
    [(SBFloatingDockPlatterView *)self _shadowInsetsForMetrics:v12];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v49 = v21;
    double v53 = v8 - (v17 + v21);
    double v54 = v6 + v15;
    double v51 = v4 + v17;
    double v52 = v10 - (v15 + v19);
    v22 = [(SBFloatingDockPlatterView *)self backgroundView];
    v23 = [(SBFloatingDockPlatterView *)self shadowView];
    if (v11)
    {
      [v11 continuousCornerRadius];
      if (BSFloatEqualToFloat())
      {
        objc_msgSend(v23, "setFrame:", v51, v54, v53, v52);
LABEL_13:
        objc_msgSend(v22, "setFrame:", v4, v6, v8, v10);
        [v22 _setContinuousCornerRadius:v14];

        goto LABEL_14;
      }
    }
    v24 = [(SBFloatingDockPlatterView *)self _shadowImageViewForMetrics:v12 previousMetrics:v11];
    [(SBFloatingDockPlatterView *)self setShadowView:v24];
    if (v23)
    {
      if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlock])
      {
        v25 = (void *)MEMORY[0x1E4FB1EB0];
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __43__SBFloatingDockPlatterView_layoutSubviews__block_invoke;
        v62[3] = &unk_1E6AAE788;
        v62[4] = self;
        id v26 = v24;
        id v63 = v26;
        id v48 = v11;
        id v64 = v48;
        double v65 = v16;
        double v66 = v18;
        double v67 = v20;
        double v68 = v49;
        [v25 performWithoutAnimation:v62];
        v27 = (void *)MEMORY[0x1E4F4F898];
        v28 = [MEMORY[0x1E4FB1EB0] _currentAnimationSettings];
        v29 = [v27 factoryWithSettings:v28];

        LODWORD(v30) = 0.25;
        LODWORD(v31) = 0.75;
        LODWORD(v32) = 0.25;
        LODWORD(v33) = 0.75;
        v34 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v30 :v31 :v32 :v33];
        v50 = [v29 factoryWithTimingFunction:v34];

        v35 = (void *)MEMORY[0x1E4F4F898];
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __43__SBFloatingDockPlatterView_layoutSubviews__block_invoke_2;
        v59[3] = &unk_1E6AACA90;
        id v60 = v26;
        v61 = self;
        [v35 animateWithFactory:v50 actions:v59];
        LODWORD(v36) = 0.75;
        LODWORD(v37) = 0.25;
        LODWORD(v38) = 0.75;
        LODWORD(v39) = 0.25;
        v40 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v36 :v37 :v38 :v39];
        v41 = [v29 factoryWithTimingFunction:v40];

        v42 = (void *)MEMORY[0x1E4F4F898];
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __43__SBFloatingDockPlatterView_layoutSubviews__block_invoke_3;
        v57[3] = &unk_1E6AAC810;
        id v58 = v23;
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __43__SBFloatingDockPlatterView_layoutSubviews__block_invoke_4;
        v55[3] = &unk_1E6AACAB8;
        id v43 = v58;
        id v56 = v43;
        [v42 animateWithFactory:v41 actions:v57 completion:v55];
        [(SBFloatingDockPlatterView *)self _shadowInsetsForMetrics:v48];
        objc_msgSend(v43, "setFrame:", v4 + v47, v6 + v44, v8 - (v47 + v45), v10 - (v44 + v46));

LABEL_12:
        objc_msgSend(v24, "setFrame:", v51, v54, v53, v52);

        goto LABEL_13;
      }
      [v23 removeFromSuperview];
    }
    [(SBFloatingDockPlatterView *)self addSubview:v24];
    [(SBFloatingDockPlatterView *)self _maxShadowViewAlpha];
    objc_msgSend(v24, "setAlpha:");
    goto LABEL_12;
  }
}

uint64_t __43__SBFloatingDockPlatterView_layoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) setAlpha:0.0];
  [*(id *)(a1 + 48) bounds];
  double v2 = *(double *)(a1 + 56);
  double v3 = *(double *)(a1 + 64);
  double v5 = v4 + v3;
  double v7 = v2 + v6;
  double v9 = v8 - (v3 + *(double *)(a1 + 80));
  double v11 = v10 - (v2 + *(double *)(a1 + 72));
  double v12 = *(void **)(a1 + 40);
  return objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

uint64_t __43__SBFloatingDockPlatterView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) _maxShadowViewAlpha];
  return objc_msgSend(v1, "setAlpha:");
}

uint64_t __43__SBFloatingDockPlatterView_layoutSubviews__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __43__SBFloatingDockPlatterView_layoutSubviews__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SBFloatingDockPlatterView;
  [(SBFloatingDockPlatterView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(SBFloatingDockPlatterView *)self updateBorderVisualStyling];
}

- (double)_maxShadowViewAlpha
{
  BOOL v2 = [(SBFloatingDockPlatterView *)self hasShadow];
  double result = 0.0;
  if (v2) {
    return 1.0;
  }
  return result;
}

- (id)_metricsForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SBFloatingDockPlatterView *)self referenceHeight];
  double v8 = [(SBFloatingDockPlatterView *)self traitCollection];
  [v8 displayScale];

  [(SBFloatingDockPlatterView *)self maximumContinuousCornerRadius];
  UIFloorToScale();
  double v10 = v9;
  UIFloorToScale();
  double v12 = v11;
  UIRoundToScale();
  double v14 = -[_SBFloatingDockPlatterMetrics initWithBounds:continuousCornerRadius:shadowRadius:shadowYOffset:]([_SBFloatingDockPlatterMetrics alloc], "initWithBounds:continuousCornerRadius:shadowRadius:shadowYOffset:", x, y, width, height, v10, v12, v13);
  return v14;
}

- (id)_shadowImageViewForMetrics:(id)a3 previousMetrics:(id)a4
{
  double v6 = (objc_class *)MEMORY[0x1E4FB1838];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  double v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v11 = [(SBFloatingDockPlatterView *)self _shadowImageForMetrics:v8 previousMetrics:v7];

  [v10 setImage:v11];
  double v12 = [v10 layer];
  [v12 setAllowsHitTesting:0];

  return v10;
}

- (id)_shadowImageForMetrics:(id)a3 previousMetrics:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = __68__SBFloatingDockPlatterView__shadowImageForMetrics_previousMetrics___block_invoke((uint64_t)v7, v6);
  id v9 = [(SBFloatingDockPlatterView *)self shadowImages];
  double v10 = [v9 objectForKey:v8];
  double v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    [v6 continuousCornerRadius];
    uint64_t v14 = v13;
    UICeilToViewScale();
    double v16 = v15;
    [v6 shadowRadius];
    double v18 = v17;
    double v19 = v16 + v17;
    [(SBFloatingDockPlatterView *)self _shadowOutsetsForMetrics:v6];
    uint64_t v21 = v20;
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v19 * 2.0 + 1.0, v19 * 2.0 + 1.0);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __68__SBFloatingDockPlatterView__shadowImageForMetrics_previousMetrics___block_invoke_2;
    v47[3] = &unk_1E6AAE7B0;
    uint64_t v49 = v21;
    uint64_t v50 = v23;
    uint64_t v51 = v25;
    uint64_t v52 = v27;
    uint64_t v53 = v14;
    id v48 = v6;
    double v54 = v18;
    v41 = v28;
    v29 = [v28 imageWithActions:v47];
    uint64_t v40 = objc_msgSend(v29, "resizableImageWithCapInsets:", v19, v19, v19, v19);

    id v42 = v7;
    if (v7)
    {
      double v31 = __68__SBFloatingDockPlatterView__shadowImageForMetrics_previousMetrics___block_invoke(v30, v7);
    }
    else
    {
      double v31 = 0;
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    double v32 = objc_msgSend(v9, "allKeys", self);
    uint64_t v33 = [v32 countByEnumeratingWithState:&v43 objects:v55 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v44 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v37 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          if (!v31 || ([*(id *)(*((void *)&v43 + 1) + 8 * i) isEqualToString:v31] & 1) == 0) {
            [v9 removeObjectForKey:v37];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v43 objects:v55 count:16];
      }
      while (v34);
    }

    if (!v9)
    {
      id v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
      objc_storeStrong((id *)(v39 + 456), v9);
    }
    id v12 = (id)v40;
    [v9 setObject:v40 forKey:v8];

    id v7 = v42;
  }

  return v12;
}

uint64_t __68__SBFloatingDockPlatterView__shadowImageForMetrics_previousMetrics___block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = NSString;
  id v3 = a2;
  [v3 continuousCornerRadius];
  uint64_t v5 = v4;
  [v3 shadowRadius];
  uint64_t v7 = v6;
  [v3 shadowYOffset];
  uint64_t v9 = v8;

  return objc_msgSend(v2, "stringWithFormat:", @"%f.%f.%f", v5, v7, v9);
}

void __68__SBFloatingDockPlatterView__shadowImageForMetrics_previousMetrics___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (CGContext *)[v3 CGContext];
  uint64_t v5 = [v3 format];

  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v7 + *(double *)(a1 + 48), v9 + *(double *)(a1 + 40), v11 - (*(double *)(a1 + 48) + *(double *)(a1 + 64)), v13 - (*(double *)(a1 + 40) + *(double *)(a1 + 56)), *(double *)(a1 + 72));
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  CGContextSaveGState(v4);
  [*(id *)(a1 + 32) shadowYOffset];
  CGFloat v15 = v14;
  CGFloat v16 = *(double *)(a1 + 80);
  id v17 = [MEMORY[0x1E4FB1618] blackColor];
  double v18 = (CGColor *)[v17 CGColor];
  v21.double width = 0.0;
  v21.double height = v15;
  CGContextSetShadowWithColor(v4, v21, v16, v18);

  [v19 fillWithBlendMode:0 alpha:0.15];
  CGContextRestoreGState(v4);
  [v19 fillWithBlendMode:16 alpha:1.0];
}

- (UIEdgeInsets)_shadowOutsetsForMetrics:(id)a3
{
  id v3 = a3;
  [v3 shadowRadius];
  double v5 = v4;
  [v3 shadowYOffset];
  double v7 = v5 - v6;
  [v3 shadowRadius];
  double v9 = v8;
  [v3 shadowRadius];
  double v11 = v10;
  [v3 shadowYOffset];
  double v13 = v11 + v12;
  [v3 shadowRadius];
  double v15 = v14;

  double v16 = v7;
  double v17 = v9;
  double v18 = v13;
  double v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (UIEdgeInsets)_shadowInsetsForMetrics:(id)a3
{
  [(SBFloatingDockPlatterView *)self _shadowOutsetsForMetrics:a3];
  double v4 = -v3;
  double v6 = -v5;
  double v8 = -v7;
  double v10 = -v9;
  result.right = v10;
  result.bottom = v8;
  result.left = v6;
  result.top = v4;
  return result;
}

+ (id)borderColorForUserInterfaceStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
  {
    double v5 = 0;
  }
  else
  {
    double v5 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", dbl_1D81E5038[a3], 0.08, v3);
  }
  return v5;
}

- (void)updateBorderVisualStyling
{
  uint64_t v3 = [(SBFloatingDockPlatterView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  id v7 = [(SBFloatingDockPlatterView *)self backgroundView];
  double v5 = [v7 layer];
  id v6 = [(id)objc_opt_class() borderColorForUserInterfaceStyle:v4];
  objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));
}

- (SBFloatingDockPlatterView)initWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  id v6 = a3;
  id v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  [v4 raise:v5, @"%@ does not support unarchiving from a nib.", v8 format];

  v11.receiver = self;
  v11.super_class = (Class)SBFloatingDockPlatterView;
  double v9 = [(SBFloatingDockPlatterView *)&v11 initWithCoder:v6];

  return v9;
}

- (double)referenceHeight
{
  return self->_referenceHeight;
}

- (double)maximumContinuousCornerRadius
{
  return self->_maximumContinuousCornerRadius;
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIImageView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (_SBFloatingDockPlatterMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (NSMutableDictionary)shadowImages
{
  return self->_shadowImages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowImages, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end