@interface PRPosterContentStyleVibrantContentRenderer
- (BSUIVibrancyConfiguration)activeVibrancyConfiguration;
- (BSUIVibrancyEffectView)vibrancyView;
- (CGRect)contentBoundingRect;
- (CGRect)styleBoundingRect;
- (NSURL)extensionBundleURL;
- (PRPosterAppearance)currentAppearance;
- (PRPosterContentStyleVibrantContentRenderer)initWithVibrancyView:(id)a3 contentView:(id)a4 contentBoundingRect:(CGRect)a5 styleBoundingRect:(CGRect)a6 initialAppearance:(id)a7;
- (UIView)contentView;
- (_PRContentStyleGradientView)gradientView;
- (id)privateStyleForStyle:(id)a3;
- (void)removeGradientIfNeeded;
- (void)renderDiscreteColorStyle:(id)a3;
- (void)renderGradientStyle:(id)a3;
- (void)renderLUTStyle:(id)a3;
- (void)renderVibrantMaterialStyle:(id)a3;
- (void)renderVibrantMonochromeStyle:(id)a3;
- (void)setActiveVibrancyConfiguration:(id)a3;
- (void)setContentBoundingRect:(CGRect)a3;
- (void)setCurrentAppearance:(id)a3;
- (void)setExtensionBundleURL:(id)a3;
- (void)setGradientView:(id)a3;
- (void)setStyleBoundingRect:(CGRect)a3;
- (void)updateForVibrantStyle:(id)a3;
@end

@implementation PRPosterContentStyleVibrantContentRenderer

- (PRPosterContentStyleVibrantContentRenderer)initWithVibrancyView:(id)a3 contentView:(id)a4 contentBoundingRect:(CGRect)a5 styleBoundingRect:(CGRect)a6 initialAppearance:(id)a7
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  CGFloat v12 = a5.size.height;
  CGFloat v13 = a5.size.width;
  CGFloat v14 = a5.origin.y;
  CGFloat v15 = a5.origin.x;
  id v19 = a3;
  id v20 = a4;
  id v21 = a7;
  v33.receiver = self;
  v33.super_class = (Class)PRPosterContentStyleVibrantContentRenderer;
  v22 = [(PRPosterContentStyleVibrantContentRenderer *)&v33 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_vibrancyView, a3);
    objc_storeStrong((id *)&v23->_contentView, a4);
    v34.origin.CGFloat x = v15;
    v34.origin.CGFloat y = v14;
    v34.size.CGFloat width = v13;
    v34.size.CGFloat height = v12;
    if (CGRectIsEmpty(v34))
    {
      [v20 bounds];
      CGFloat v15 = v24;
      CGFloat v14 = v25;
      CGFloat v13 = v26;
      CGFloat v12 = v27;
    }
    v23->_contentBoundingRect.origin.CGFloat x = v15;
    v23->_contentBoundingRect.origin.CGFloat y = v14;
    v23->_contentBoundingRect.size.CGFloat width = v13;
    v23->_contentBoundingRect.size.CGFloat height = v12;
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    if (CGRectIsEmpty(v35))
    {
      [v20 bounds];
      CGFloat x = v28;
      CGFloat y = v29;
      CGFloat width = v30;
      CGFloat height = v31;
    }
    v23->_styleBoundingRect.origin.CGFloat x = x;
    v23->_styleBoundingRect.origin.CGFloat y = y;
    v23->_styleBoundingRect.size.CGFloat width = width;
    v23->_styleBoundingRect.size.CGFloat height = height;
    objc_storeStrong((id *)&v23->_currentAppearance, a7);
  }

  return v23;
}

- (void)setContentBoundingRect:(CGRect)a3
{
  CGRect v10 = CGRectUnion(a3, self->_styleBoundingRect);
  double x = v10.origin.x;
  double width = v10.size.width;
  double v6 = v10.origin.y + -20.0;
  double v7 = v10.size.height + 40.0;
  v10.origin.CGFloat y = v10.origin.y + -20.0;
  v10.size.CGFloat height = v10.size.height + 40.0;
  if (!CGRectEqualToRect(v10, self->_contentBoundingRect))
  {
    self->_contentBoundingRect.origin.double x = x;
    self->_contentBoundingRect.origin.CGFloat y = v6;
    self->_contentBoundingRect.size.double width = width;
    self->_contentBoundingRect.size.CGFloat height = v7;
    gradientView = self->_gradientView;
    -[_PRContentStyleGradientView setFrame:](gradientView, "setFrame:", x, v6, width, v7);
  }
}

- (void)setStyleBoundingRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_styleBoundingRect))
  {
    self->_styleBoundingRect.origin.CGFloat x = x;
    self->_styleBoundingRect.origin.CGFloat y = y;
    self->_styleBoundingRect.size.CGFloat width = width;
    self->_styleBoundingRect.size.CGFloat height = height;
    double v8 = self->_contentBoundingRect.origin.x;
    double v9 = self->_contentBoundingRect.origin.y;
    double v10 = self->_contentBoundingRect.size.width;
    double v11 = self->_contentBoundingRect.size.height;
    -[PRPosterContentStyleVibrantContentRenderer setContentBoundingRect:](self, "setContentBoundingRect:", v8, v9, v10, v11);
  }
}

- (id)privateStyleForStyle:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_1EDA0F8A0]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)removeGradientIfNeeded
{
  [(_PRContentStyleGradientView *)self->_gradientView removeFromSuperview];
  gradientView = self->_gradientView;
  self->_gradientView = 0;
}

- (void)updateForVibrantStyle:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F4F8E8];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [v5 vibrancyEffectType];
  double v8 = [v5 vibrancyEffectColor];

  id v16 = (id)[v6 initWithEffectType:v7 backgroundType:0 color:v8];
  [(BSUIVibrancyEffectView *)self->_vibrancyView setIsEnabled:1];
  [(BSUIVibrancyEffectView *)self->_vibrancyView setConfiguration:v16];
  double v9 = [PRPosterColor alloc];
  double v10 = [MEMORY[0x1E4FB1618] whiteColor];
  double v11 = [(PRPosterColor *)v9 initWithColor:v10];

  if (self->_currentAppearance)
  {
    CGFloat v12 = [PRPosterAppearance alloc];
    CGFloat v13 = [(PRPosterAppearance *)self->_currentAppearance font];
    CGFloat v14 = [(PRPosterAppearance *)v12 initWithFont:v13 labelColor:v11 preferredTitleAlignment:[(PRPosterAppearance *)self->_currentAppearance preferredTitleAlignment] preferredTitleLayout:[(PRPosterAppearance *)self->_currentAppearance preferredTitleLayout]];

    currentAppearance = self->_currentAppearance;
    self->_currentAppearance = v14;
  }
}

- (void)renderDiscreteColorStyle:(id)a3
{
  id v14 = a3;
  [(PRPosterContentStyleVibrantContentRenderer *)self removeGradientIfNeeded];
  id v4 = [(PRPosterContentStyleVibrantContentRenderer *)self privateStyleForStyle:v14];
  id v5 = v4;
  if (v4 && [v4 desiresVibrancyEffectView])
  {
    [(PRPosterContentStyleVibrantContentRenderer *)self updateForVibrantStyle:v5];
  }
  else
  {
    if ([v14 allowsVariation]) {
      [v14 variationAppliedColors];
    }
    else {
    id v6 = [v14 colors];
    }
    [(BSUIVibrancyEffectView *)self->_vibrancyView setIsEnabled:0];
    uint64_t v7 = [PRPosterColor alloc];
    double v8 = [v6 firstObject];
    double v9 = [(PRPosterColor *)v7 initWithColor:v8];

    if (self->_currentAppearance)
    {
      double v10 = [PRPosterAppearance alloc];
      double v11 = [(PRPosterAppearance *)self->_currentAppearance font];
      CGFloat v12 = [(PRPosterAppearance *)v10 initWithFont:v11 labelColor:v9 preferredTitleAlignment:[(PRPosterAppearance *)self->_currentAppearance preferredTitleAlignment] preferredTitleLayout:[(PRPosterAppearance *)self->_currentAppearance preferredTitleLayout]];

      currentAppearance = self->_currentAppearance;
      self->_currentAppearance = v12;
    }
  }
}

- (void)renderVibrantMaterialStyle:(id)a3
{
  id v4 = a3;
  [(PRPosterContentStyleVibrantContentRenderer *)self removeGradientIfNeeded];
  id v5 = [(PRPosterContentStyleVibrantContentRenderer *)self privateStyleForStyle:v4];

  [(PRPosterContentStyleVibrantContentRenderer *)self updateForVibrantStyle:v5];
}

- (void)renderVibrantMonochromeStyle:(id)a3
{
  id v4 = a3;
  [(PRPosterContentStyleVibrantContentRenderer *)self removeGradientIfNeeded];
  id v5 = [(PRPosterContentStyleVibrantContentRenderer *)self privateStyleForStyle:v4];

  [(PRPosterContentStyleVibrantContentRenderer *)self updateForVibrantStyle:v5];
}

- (void)renderGradientStyle:(id)a3
{
  id v4 = a3;
  [(BSUIVibrancyEffectView *)self->_vibrancyView setIsEnabled:0];
  id v5 = [PRPosterColor alloc];
  id v6 = [MEMORY[0x1E4FB1618] whiteColor];
  uint64_t v7 = [(PRPosterColor *)v5 initWithColor:v6];

  if (self->_currentAppearance)
  {
    double v8 = [PRPosterAppearance alloc];
    double v9 = [(PRPosterAppearance *)self->_currentAppearance font];
    double v10 = [(PRPosterAppearance *)v8 initWithFont:v9 labelColor:v7 preferredTitleAlignment:[(PRPosterAppearance *)self->_currentAppearance preferredTitleAlignment] preferredTitleLayout:[(PRPosterAppearance *)self->_currentAppearance preferredTitleLayout]];

    currentAppearance = self->_currentAppearance;
    self->_currentAppearance = v10;
  }
  CGFloat v12 = [v4 colors];
  CGFloat v13 = objc_msgSend(v12, "bs_map:", &__block_literal_global_170);

  BOOL IsVertical = PRPosterTitleLayoutIsVertical([(PRPosterAppearance *)self->_currentAppearance preferredTitleLayout]);
  CGFloat x = self->_contentBoundingRect.origin.x;
  CGFloat y = self->_contentBoundingRect.origin.y;
  CGFloat width = self->_contentBoundingRect.size.width;
  CGFloat height = self->_contentBoundingRect.size.height;
  if (IsVertical)
  {
    double v19 = CGRectGetHeight(*(CGRect *)&x);
    double MinY = CGRectGetMinY(self->_contentBoundingRect);
    double v21 = CGRectGetHeight(self->_styleBoundingRect);
    double MinX = CGRectGetMinY(self->_styleBoundingRect);
  }
  else
  {
    double v19 = CGRectGetWidth(*(CGRect *)&x);
    double MinY = CGRectGetMinX(self->_contentBoundingRect);
    double v21 = CGRectGetWidth(self->_styleBoundingRect);
    double MinX = CGRectGetMinX(self->_styleBoundingRect);
  }
  if (v21 >= v19) {
    double v21 = v19;
  }
  if (MinX >= MinY) {
    double v23 = MinX;
  }
  else {
    double v23 = MinY;
  }
  double v24 = [v4 locations];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __66__PRPosterContentStyleVibrantContentRenderer_renderGradientStyle___block_invoke_2;
  v48[3] = &__block_descriptor_64_e18__16__0__NSNumber_8l;
  *(double *)&v48[4] = v21;
  *(double *)&v48[5] = v23;
  *(double *)&v48[6] = MinY;
  *(double *)&v48[7] = v19;
  double v25 = objc_msgSend(v24, "bs_map:", v48);

  gradientView = self->_gradientView;
  if (gradientView)
  {
    -[_PRContentStyleGradientView setFrame:](gradientView, "setFrame:", self->_contentBoundingRect.origin.x, self->_contentBoundingRect.origin.y, self->_contentBoundingRect.size.width, self->_contentBoundingRect.size.height);
  }
  else
  {
    double v27 = -[_PRContentStyleGradientView initWithFrame:]([_PRContentStyleGradientView alloc], "initWithFrame:", self->_contentBoundingRect.origin.x, self->_contentBoundingRect.origin.y, self->_contentBoundingRect.size.width, self->_contentBoundingRect.size.height);
    double v28 = self->_gradientView;
    self->_gradientView = v27;

    double v29 = [(_PRContentStyleGradientView *)self->_gradientView layer];
    [v29 setCompositingFilter:*MEMORY[0x1E4F3A308]];

    [(UIView *)self->_contentView addSubview:self->_gradientView];
  }
  double v30 = self->_gradientView;
  uint64_t v31 = [v4 gradientType];
  v32 = (void *)MEMORY[0x1E4F3A398];
  objc_super v33 = (void *)MEMORY[0x1E4F3A3A0];
  if (v31 != 1) {
    objc_super v33 = (void *)MEMORY[0x1E4F3A390];
  }
  if (v31 != 2) {
    v32 = v33;
  }
  [(_PRContentStyleGradientView *)v30 setColors:v13 locations:v25 type:*v32];
  BOOL v34 = PRPosterTitleLayoutIsVertical([(PRPosterAppearance *)self->_currentAppearance preferredTitleLayout]);
  CGRect v35 = self->_gradientView;
  [v4 startPoint];
  double v38 = v37;
  if (v34)
  {
    [v4 startPoint];
    double v40 = v39;
    [v4 endPoint];
    double v42 = v41;
    [v4 endPoint];
    double v44 = v43;
  }
  else
  {
    double v45 = v36;
    double v40 = v37;
    [v4 endPoint];
    double v42 = v46;
    double v44 = v47;
    double v38 = v45;
  }
  -[_PRContentStyleGradientView setStartPoint:endPoint:](v35, "setStartPoint:endPoint:", v38, v40, v42, v44);
}

uint64_t __66__PRPosterContentStyleVibrantContentRenderer_renderGradientStyle___block_invoke(int a1, id a2)
{
  id v2 = a2;
  return [v2 CGColor];
}

id __66__PRPosterContentStyleVibrantContentRenderer_renderGradientStyle___block_invoke_2(double *a1, void *a2)
{
  id v3 = a2;
  [v3 floatValue];
  if (v4 == 0.0 || v4 == 1.0)
  {
    id v6 = v3;
  }
  else
  {
    id v6 = [NSNumber numberWithDouble:(a1[5] - a1[6] + a1[4] * v4) / a1[7]];
  }
  uint64_t v7 = v6;

  return v7;
}

- (void)renderLUTStyle:(id)a3
{
  id v8 = a3;
  [(PRPosterContentStyleVibrantContentRenderer *)self removeGradientIfNeeded];
  if (self->_extensionBundleURL)
  {
    [(BSUIVibrancyEffectView *)self->_vibrancyView setIsEnabled:1];
    id v4 = objc_alloc(MEMORY[0x1E4F4F8F8]);
    id v5 = [v8 lutIdentifier];
    id v6 = (void *)[v4 initWithIdentifier:v5 bundleURL:self->_extensionBundleURL];

    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F4F8E8]) initWithEffectType:3 backgroundType:0 color:0 groupName:0 blendConfiguration:0 blendAmount:v6 alternativeVibrancyEffectLUT:0.0];
    [(BSUIVibrancyEffectView *)self->_vibrancyView setConfiguration:v7];
  }
}

- (NSURL)extensionBundleURL
{
  return self->_extensionBundleURL;
}

- (void)setExtensionBundleURL:(id)a3
{
}

- (BSUIVibrancyEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CGRect)contentBoundingRect
{
  double x = self->_contentBoundingRect.origin.x;
  double y = self->_contentBoundingRect.origin.y;
  double width = self->_contentBoundingRect.size.width;
  double height = self->_contentBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)styleBoundingRect
{
  double x = self->_styleBoundingRect.origin.x;
  double y = self->_styleBoundingRect.origin.y;
  double width = self->_styleBoundingRect.size.width;
  double height = self->_styleBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PRPosterAppearance)currentAppearance
{
  return self->_currentAppearance;
}

- (void)setCurrentAppearance:(id)a3
{
}

- (BSUIVibrancyConfiguration)activeVibrancyConfiguration
{
  return self->_activeVibrancyConfiguration;
}

- (void)setActiveVibrancyConfiguration:(id)a3
{
}

- (_PRContentStyleGradientView)gradientView
{
  return self->_gradientView;
}

- (void)setGradientView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_activeVibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_currentAppearance, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_extensionBundleURL, 0);
}

@end