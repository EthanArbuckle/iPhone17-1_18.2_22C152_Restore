@interface SBElasticSliderView
- (CGPoint)_elasticGlyphCenterForDefaultGlyphCenter:(CGPoint)a3;
- (CGPoint)glyphCenter;
- (SBElasticSliderView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)shadowOutsets;
- (UIView)leadingAccessoryView;
- (UIView)trailingAccessoryView;
- (double)_fractionToRegularMetrics;
- (double)_minorAxisElasticLength;
- (double)accessoryViewPadding;
- (double)additiveGlyphScaleFactor;
- (double)compactMinorAxisDimension;
- (double)cornerRadiusMinorAxisFraction;
- (double)regularMinorAxisDimension;
- (id)_createElasticBackgroundView;
- (unint64_t)accessoryLayoutEdge;
- (unint64_t)shadowMode;
- (void)_layoutAccessoryViews;
- (void)_updateCornerRadius;
- (void)_updateGlyphScaleForAdditiveScaleOrAxisUpdate;
- (void)_updateShadowMode;
- (void)layoutElasticContentViews;
- (void)setAccessoryLayoutEdge:(unint64_t)a3;
- (void)setAccessoryViewPadding:(double)a3;
- (void)setAdditiveGlyphScaleFactor:(double)a3;
- (void)setAxis:(unint64_t)a3;
- (void)setCompactMinorAxisDimension:(double)a3;
- (void)setContinuousSliderCornerRadius:(double)a3;
- (void)setCornerRadiusMinorAxisFraction:(double)a3;
- (void)setLeadingAccessoryView:(id)a3;
- (void)setRegularMinorAxisDimension:(double)a3;
- (void)setShadowMode:(unint64_t)a3;
- (void)setTrailingAccessoryView:(id)a3;
@end

@implementation SBElasticSliderView

- (SBElasticSliderView)initWithFrame:(CGRect)a3
{
  v38.receiver = self;
  v38.super_class = (Class)SBElasticSliderView;
  v3 = -[CCUIContinuousSliderView initWithFrame:](&v38, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_accessoryLayoutEdge = 0;
    [(SBElasticSliderView *)v3 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v5, v7, v9, v11);
    maskView = v4->_maskView;
    v4->_maskView = (UIView *)v13;

    [(UIView *)v4->_maskView setUserInteractionEnabled:0];
    v15 = [(UIView *)v4->_maskView layer];
    [v15 setCompositingFilter:*MEMORY[0x1E4F3A098]];

    v16 = [(CCUIBaseSliderView *)v4 elasticContentBoundaryView];
    [v16 insertSubview:v4->_maskView atIndex:0];

    v17 = (void *)MEMORY[0x1E4F743C8];
    v18 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v19 = [v18 userInterfaceIdiom];

    if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      v20 = @"elasticHUDBackgroundSheer";
    }
    else {
      v20 = @"elasticHUDBackground";
    }
    v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v22 = [v17 materialViewWithRecipeNamed:v20 inBundle:v21 options:2 initialWeighting:0 scaleAdjustment:1.0];
    baseMaterialView = v4->_baseMaterialView;
    v4->_baseMaterialView = (MTMaterialView *)v22;

    v24 = v4->_baseMaterialView;
    v25 = [NSString stringWithFormat:@"%@.%p", @"SBElasticSliderMaterialView", v4];
    [(MTMaterialView *)v24 setGroupNameBase:v25];

    v26 = [(CCUIBaseSliderView *)v4 elasticContentView];
    [v26 insertSubview:v4->_baseMaterialView atIndex:0];

    v27 = [(CCUIBaseSliderView *)v4 elasticContentView];
    [v27 setClipsToBounds:1];

    uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v6, v8, v10, v12);
    shadowView = v4->_shadowView;
    v4->_shadowView = (UIView *)v28;

    v30 = [(UIView *)v4->_shadowView layer];
    [v30 setShadowPathIsBounds:1];

    v31 = [(CCUIBaseSliderView *)v4 elasticBackgroundContentView];
    [v31 insertSubview:v4->_shadowView atIndex:0];

    [(SBElasticSliderView *)v4 _updateShadowMode];
    uint64_t v32 = [(MTMaterialView *)v4->_baseMaterialView copy];
    captureOnlyMaterialView = v4->_captureOnlyMaterialView;
    v4->_captureOnlyMaterialView = (MTMaterialView *)v32;

    [(MTMaterialView *)v4->_captureOnlyMaterialView setCaptureOnly:1];
    v34 = v4->_captureOnlyMaterialView;
    v35 = [(MTMaterialView *)v4->_baseMaterialView groupNameBase];
    [(MTMaterialView *)v34 setGroupNameBase:v35];

    v36 = [(CCUIBaseSliderView *)v4 elasticBackgroundContentView];
    [v36 insertSubview:v4->_captureOnlyMaterialView atIndex:0];
  }
  return v4;
}

- (void)setContinuousSliderCornerRadius:(double)a3
{
  double v5 = [(CCUIBaseSliderView *)self elasticContentView];
  [v5 _setContinuousCornerRadius:a3];

  [(UIView *)self->_shadowView _setContinuousCornerRadius:a3];
  id v6 = [(UIView *)self->_shadowView layer];
  objc_msgSend(v6, "setShadowOffset:", 0.0, a3 * 0.25);
}

- (void)layoutElasticContentViews
{
  v12.receiver = self;
  v12.super_class = (Class)SBElasticSliderView;
  [(CCUIContinuousSliderView *)&v12 layoutElasticContentViews];
  v3 = [(CCUIBaseSliderView *)self elasticContentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[MTMaterialView setFrame:](self->_captureOnlyMaterialView, "setFrame:", v5, v7, v9, v11);
  -[MTMaterialView setFrame:](self->_baseMaterialView, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_shadowView, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_maskView, "setFrame:", v5, v7, v9, v11);
  [(SBElasticSliderView *)self _updateCornerRadius];
  [(SBElasticSliderView *)self _layoutAccessoryViews];
  [(SBElasticSliderView *)self _updateShadowMode];
}

- (CGPoint)glyphCenter
{
  v5.receiver = self;
  v5.super_class = (Class)SBElasticSliderView;
  [(CCUIContinuousSliderView *)&v5 glyphCenter];
  -[SBElasticSliderView _elasticGlyphCenterForDefaultGlyphCenter:](self, "_elasticGlyphCenterForDefaultGlyphCenter:");
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setAxis:(unint64_t)a3
{
  if ([(CCUIContinuousSliderView *)self axis] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBElasticSliderView;
    [(CCUIContinuousSliderView *)&v5 setAxis:a3];
    [(SBElasticSliderView *)self _updateGlyphScaleForAdditiveScaleOrAxisUpdate];
  }
}

- (void)setCornerRadiusMinorAxisFraction:(double)a3
{
  if (self->_cornerRadiusMinorAxisFraction != a3)
  {
    self->_cornerRadiusMinorAxisFraction = a3;
    [(SBElasticSliderView *)self setNeedsLayout];
  }
}

- (void)setRegularMinorAxisDimension:(double)a3
{
  if (self->_regularMinorAxisDimension != a3)
  {
    self->_regularMinorAxisDimension = a3;
    [(SBElasticSliderView *)self setNeedsLayout];
  }
}

- (void)setCompactMinorAxisDimension:(double)a3
{
  if (self->_compactMinorAxisDimension != a3)
  {
    self->_compactMinorAxisDimension = a3;
    [(SBElasticSliderView *)self setNeedsLayout];
  }
}

- (void)setAdditiveGlyphScaleFactor:(double)a3
{
  if (self->_additiveGlyphScaleFactor != a3)
  {
    self->_additiveGlyphScaleFactor = a3;
    [(SBElasticSliderView *)self _updateGlyphScaleForAdditiveScaleOrAxisUpdate];
  }
}

- (void)setShadowMode:(unint64_t)a3
{
  if (self->_shadowMode != a3)
  {
    self->_shadowMode = a3;
    [(SBElasticSliderView *)self _updateShadowMode];
  }
}

- (UIEdgeInsets)shadowOutsets
{
  v2 = [(UIView *)self->_shadowView layer];
  [v2 shadowOffset];
  [v2 shadowRadius];
  UIEdgeInsetsMakeWithEdges();
  UIEdgeInsetsMin();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setLeadingAccessoryView:(id)a3
{
  double v5 = (UIView *)a3;
  leadingAccessoryView = self->_leadingAccessoryView;
  double v8 = v5;
  if (leadingAccessoryView != v5)
  {
    [(UIView *)leadingAccessoryView removeFromSuperview];
    objc_storeStrong((id *)&self->_leadingAccessoryView, a3);
    double v7 = [(CCUIBaseSliderView *)self elasticBackgroundContentView];
    [v7 addSubview:v8];

    [(SBElasticSliderView *)self setNeedsLayout];
  }
}

- (void)setTrailingAccessoryView:(id)a3
{
  double v5 = (UIView *)a3;
  trailingAccessoryView = self->_trailingAccessoryView;
  double v8 = v5;
  if (trailingAccessoryView != v5)
  {
    [(UIView *)trailingAccessoryView removeFromSuperview];
    objc_storeStrong((id *)&self->_trailingAccessoryView, a3);
    double v7 = [(CCUIBaseSliderView *)self elasticBackgroundContentView];
    [v7 addSubview:v8];

    [(SBElasticSliderView *)self setNeedsLayout];
  }
}

- (void)setAccessoryLayoutEdge:(unint64_t)a3
{
  if (self->_accessoryLayoutEdge != a3)
  {
    self->_accessoryLayoutEdge = a3;
    [(SBElasticSliderView *)self setNeedsLayout];
  }
}

- (void)setAccessoryViewPadding:(double)a3
{
  if (self->_accessoryViewPadding != a3)
  {
    self->_accessoryViewPadding = a3;
    [(SBElasticSliderView *)self setNeedsLayout];
  }
}

- (double)_minorAxisElasticLength
{
  double v3 = [(CCUIBaseSliderView *)self elasticContentView];
  [v3 bounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  unint64_t v12 = [(CCUIContinuousSliderView *)self axis];
  uint64_t v13 = v5;
  uint64_t v14 = v7;
  uint64_t v15 = v9;
  uint64_t v16 = v11;
  if (v12 == 1)
  {
    return CGRectGetHeight(*(CGRect *)&v13);
  }
  else
  {
    return CGRectGetWidth(*(CGRect *)&v13);
  }
}

- (double)_fractionToRegularMetrics
{
  [(SBElasticSliderView *)self regularMinorAxisDimension];
  double v4 = v3;
  [(SBElasticSliderView *)self compactMinorAxisDimension];
  double v6 = v5;
  [(SBElasticSliderView *)self _minorAxisElasticLength];
  if (v4 <= 0.0 || v6 <= 0.0 || v7 <= 0.0) {
    return 0.0;
  }
  else {
    return fmax(fmin((v7 - v6) / (v4 - v6) * 4.0, 1.0), 0.0);
  }
}

- (void)_updateCornerRadius
{
  [(SBElasticSliderView *)self _fractionToRegularMetrics];
  double v4 = v3;
  [(SBElasticSliderView *)self _minorAxisElasticLength];
  double v6 = v5;
  [(SBElasticSliderView *)self cornerRadiusMinorAxisFraction];
  double v8 = v6 * (v4 * v7 + (1.0 - v4) * 0.5);
  [(SBElasticSliderView *)self setContinuousSliderCornerRadius:v8];
}

- (void)_layoutAccessoryViews
{
  id v80 = [(SBElasticSliderView *)self leadingAccessoryView];
  double v3 = [(SBElasticSliderView *)self trailingAccessoryView];
  [v80 frame];
  CGFloat v67 = v4;
  CGFloat v70 = v5;
  CGFloat v76 = v7;
  double v78 = v6;
  [v3 frame];
  CGFloat v9 = v8;
  CGFloat rect = v10;
  double v12 = v11;
  CGFloat v14 = v13;
  uint64_t v15 = [(CCUIBaseSliderView *)self elasticBackgroundContentView];
  [v15 bounds];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  [(SBElasticSliderView *)self accessoryViewPadding];
  double v25 = v24;
  unint64_t v26 = [(SBElasticSliderView *)self accessoryLayoutEdge];
  if (v26 == 4)
  {
    v86.origin.x = v17;
    v86.origin.y = v19;
    v86.size.width = v21;
    v86.size.height = v23;
    CGFloat MidX = CGRectGetMidX(v86);
    v87.origin.x = v17;
    v87.origin.y = v19;
    v87.size.width = v21;
    v87.size.height = v23;
    CGRectGetMaxY(v87);
    v88.origin.x = v67;
    v88.origin.y = v70;
    v88.size.height = v76;
    v88.size.width = v78;
    CGFloat Height = CGRectGetHeight(v88);
    v89.size.height = v14;
    CGFloat v31 = Height * 0.5;
    v89.origin.x = v9;
    v89.origin.y = rect;
    v89.size.width = v12;
    char v29 = 0;
    int v28 = 0;
    double MaxY = v25 * 0.5 + v31 + CGRectGetHeight(v89) * 0.5;
  }
  else
  {
    if (!v26)
    {
      if ([(CCUIContinuousSliderView *)self axis] == 1) {
        LOBYTE(v26) = 2;
      }
      else {
        LOBYTE(v26) = 1;
      }
    }
    if ((v26 & 2) != 0)
    {
      CGFloat v68 = v14;
      uint64_t v32 = [(SBElasticSliderView *)self effectiveUserInterfaceLayoutDirection];
      CGFloat v66 = v12;
      CGFloat v33 = v17;
      CGFloat v34 = v19;
      CGFloat v35 = v21;
      CGFloat v36 = v23;
      if (v32 == 1)
      {
        double v37 = v25 + CGRectGetMaxX(*(CGRect *)&v33);
        v90.origin.x = v17;
        v90.origin.y = v19;
        v90.size.width = v21;
        v90.size.height = v23;
        double v38 = CGRectGetMinX(v90) - v12 - v25;
        CGFloat v39 = v78;
      }
      else
      {
        CGFloat v39 = v78;
        double v37 = CGRectGetMinX(*(CGRect *)&v33) - v78 - v25;
        v91.origin.x = v17;
        v91.origin.y = v19;
        v91.size.width = v21;
        v91.size.height = v23;
        double v38 = v25 + CGRectGetMaxX(v91);
      }
      v92.origin.x = v17;
      v92.origin.y = v19;
      v92.size.width = v21;
      v92.size.height = v23;
      double MidY = CGRectGetMidY(v92);
      v93.origin.x = v37;
      v93.origin.y = v70;
      v93.size.width = v39;
      v93.size.height = v76;
      CGFloat v71 = MidY - CGRectGetHeight(v93) * 0.5;
      v94.origin.x = v17;
      v94.origin.y = v19;
      v94.size.width = v21;
      v94.size.height = v23;
      double v41 = CGRectGetMidY(v94);
      v95.origin.x = v38;
      v95.origin.y = rect;
      v95.size.width = v66;
      v95.size.height = v68;
      CGFloat rectb = v41 - CGRectGetHeight(v95) * 0.5;
      v96.origin.x = v37;
      v96.origin.y = v71;
      v96.size.width = v78;
      v96.size.height = v76;
      CGRectGetMidX(v96);
      v97.origin.x = v37;
      v97.origin.y = v71;
      v97.size.width = v78;
      v97.size.height = v76;
      CGRectGetMidY(v97);
      v98.origin.x = v38;
      v98.origin.y = rectb;
      v98.size.width = v66;
      v98.size.height = v68;
      CGRectGetMidX(v98);
      v99.origin.x = v38;
      v99.origin.y = rectb;
      v99.size.width = v66;
      v99.size.height = v68;
      double MaxY = CGRectGetMidY(v99);
      char v29 = 0;
      int v28 = 1;
    }
    else
    {
      v82.origin.x = v17;
      v82.origin.y = v19;
      v82.size.width = v21;
      v82.size.height = v23;
      CGRectGetMidX(v82);
      v83.origin.x = v17;
      v83.origin.y = v19;
      v83.size.width = v21;
      v83.size.height = v23;
      CGRectGetMinY(v83);
      v84.origin.x = v17;
      v84.origin.y = v19;
      v84.size.width = v21;
      v84.size.height = v23;
      CGRectGetMidX(v84);
      v85.origin.x = v17;
      v85.origin.y = v19;
      v85.size.width = v21;
      v85.size.height = v23;
      double MaxY = CGRectGetMaxY(v85);
      int v28 = 0;
      char v29 = 1;
    }
  }
  objc_msgSend(v80, "frame", MaxY, *(void *)&MidX);
  SBUnintegralizedRectCenteredAboutPoint();
  double v69 = v42;
  double v44 = v43;
  double v77 = v46;
  double v79 = v45;
  [v3 frame];
  SBUnintegralizedRectCenteredAboutPoint();
  double v48 = v47;
  double v50 = v49;
  double v72 = v52;
  double recta = v51;
  v53 = [(SBElasticSliderView *)self traitCollection];
  [v53 displayScale];

  [v80 frame];
  UIRectCenteredAboutPointScale();
  double v55 = v54;
  double v57 = v56;
  [v3 frame];
  UIRectCenteredAboutPointScale();
  if (v28)
  {
    double v60 = v55;
  }
  else
  {
    double v58 = v48;
    double v60 = v69;
  }
  if (v28) {
    double v61 = v44;
  }
  else {
    double v61 = v57;
  }
  if (v28) {
    double v62 = v50;
  }
  else {
    double v62 = v59;
  }
  if ((v29 & (v58 < 2.0)) != 0) {
    double v63 = 2.0;
  }
  else {
    double v63 = v58;
  }
  if ((v29 & (v60 < 2.0)) != 0) {
    double v64 = 2.0;
  }
  else {
    double v64 = v60;
  }
  objc_msgSend(v80, "setFrame:", v64, v61, v79, v77);
  objc_msgSend(v3, "setFrame:", v63, v62, recta, v72);
}

- (void)_updateShadowMode
{
  unint64_t shadowMode = self->_shadowMode;
  if (shadowMode == 1)
  {
    double v3 = 5.0;
    int v4 = 1050253722;
  }
  else if (shadowMode)
  {
    int v4 = 0;
    double v3 = 0.0;
  }
  else
  {
    double v3 = 20.0;
    int v4 = 1043878380;
  }
  id v6 = [(UIView *)self->_shadowView layer];
  LODWORD(v5) = v4;
  [v6 setShadowOpacity:v5];
  [v6 setShadowRadius:v3];
}

- (CGPoint)_elasticGlyphCenterForDefaultGlyphCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(CCUIBaseSliderView *)self glyphContainerView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  if ([(CCUIContinuousSliderView *)self axis] == 2)
  {
    double v11 = v8 * 0.5;
    double v12 = v10 - v8;
  }
  else
  {
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
      double v11 = v8 - v10;
    }
    else {
      double v11 = v10;
    }
    double v12 = v10 * 0.5;
  }
  if ([(CCUIBaseSliderView *)self shouldIntegralizeContentLayout])
  {
    double v13 = [(SBElasticSliderView *)self traitCollection];
    [v13 displayScale];
    UIPointRoundToScale();
    double v11 = v14;
    double v12 = v15;
  }
  [(SBElasticSliderView *)self _fractionToRegularMetrics];
  double v17 = y * v16 + (1.0 - v16) * v12;
  double v18 = x * v16 + (1.0 - v16) * v11;
  result.double y = v17;
  result.double x = v18;
  return result;
}

- (void)_updateGlyphScaleForAdditiveScaleOrAxisUpdate
{
  [(SBElasticSliderView *)self additiveGlyphScaleFactor];
  if (v3 == 0.0) {
    double v4 = 1.0;
  }
  else {
    double v4 = v3;
  }
  double v5 = v4 * dbl_1D8FD28B0[[(CCUIContinuousSliderView *)self axis] == 2];
  [(CCUIBaseSliderView *)self setGlyphScale:v5];
}

- (id)_createElasticBackgroundView
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  double v4 = (void *)MEMORY[0x1E4F743C8];
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = [v4 materialViewWithRecipeNamed:@"elasticHUDModuleSheer" inBundle:v5 options:0 initialWeighting:0 scaleAdjustment:1.0];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:4];
  }
  return v6;
}

- (double)cornerRadiusMinorAxisFraction
{
  return self->_cornerRadiusMinorAxisFraction;
}

- (double)regularMinorAxisDimension
{
  return self->_regularMinorAxisDimension;
}

- (double)compactMinorAxisDimension
{
  return self->_compactMinorAxisDimension;
}

- (double)additiveGlyphScaleFactor
{
  return self->_additiveGlyphScaleFactor;
}

- (unint64_t)shadowMode
{
  return self->_shadowMode;
}

- (UIView)leadingAccessoryView
{
  return self->_leadingAccessoryView;
}

- (UIView)trailingAccessoryView
{
  return self->_trailingAccessoryView;
}

- (unint64_t)accessoryLayoutEdge
{
  return self->_accessoryLayoutEdge;
}

- (double)accessoryViewPadding
{
  return self->_accessoryViewPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingAccessoryView, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_baseMaterialView, 0);
  objc_storeStrong((id *)&self->_captureOnlyMaterialView, 0);
}

@end