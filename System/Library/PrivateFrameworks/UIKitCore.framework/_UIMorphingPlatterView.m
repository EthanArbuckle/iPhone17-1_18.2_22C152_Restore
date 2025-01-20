@interface _UIMorphingPlatterView
- (BOOL)_previewPrefersApplyingMask:(id)a3;
- (BOOL)allowsElasticMorph;
- (BOOL)allowsUserInteractionInExpandedPreview;
- (BOOL)alwaysCompact;
- (BOOL)bothViewsAreLikelyOpaque;
- (BOOL)contentSizeDidChange;
- (BOOL)expanded;
- (BOOL)hideChromeWhenCollapsed;
- (BOOL)hidesCollapsedSourceView;
- (BOOL)isFrozen;
- (BOOL)preventPreviewRasterization;
- (BOOL)shouldMorphContents;
- (BOOL)wantsEdgeAntialiasing;
- (NSDictionary)separatedOptions;
- (NSMutableDictionary)shadowViews;
- (UITargetedPreview)collapsedPreview;
- (UITargetedPreview)expandedPreview;
- (_UIMorphingPlatterAnimatableFloat)expansionProgress;
- (_UIMorphingPlatterAnimatableFloat)platterHeight;
- (_UIMorphingPlatterAnimatableFloat)platterWidth;
- (_UIMorphingPlatterView)initWithFrame:(CGRect)a3;
- (_UIPlatterClippingView)collapsedClippingView;
- (_UIPlatterClippingView)expandedClippingView;
- (_UIPlatterSoftShadowView)pathShadowView;
- (_UIPlatterTransformView)collapsedTransformView;
- (_UIPlatterTransformView)expandedTransformView;
- (_UIShadowProperties)shadowSettings;
- (double)_collapsedCornerRadius:(BOOL *)a3 maskedCorners:(unint64_t *)a4;
- (double)_collapsedShadowAlphaForExpansionProgress:(double)a3;
- (double)_expandedCornerRadius:(BOOL *)a3 maskedCorners:(unint64_t *)a4 ignoreLiftScale:(BOOL)a5;
- (double)_expandedShadowAlphaForExpansionProgress:(double)a3;
- (double)collapsedShadowIntensity;
- (double)expandedShadowIntensity;
- (double)overrideCollapsedCornerRadius;
- (double)overrideExpandedCornerRadius;
- (id)shouldApplyClippingHandler;
- (int64_t)collapsedShadowStyle;
- (int64_t)expandedShadowStyle;
- (unint64_t)preferredMorphingAxis;
- (void)_installPreview:(id)a3 inClippingView:(id)a4 transformView:(id)a5;
- (void)_installShadowViewForStyleIfNecessary:(int64_t)a3;
- (void)_modelUpdates;
- (void)_prepareAnimatableProperties;
- (void)_updateClippingViews;
- (void)_updateCollapsedChrome;
- (void)_updatePathShadow;
- (void)_updatePathShadowTransform;
- (void)_updateShadowsWithExpansionProgress:(double)a3 contentBounds:(CGRect)a4 center:(CGPoint)a5 forPresentation:(BOOL)a6;
- (void)didMoveToWindow;
- (void)didTearOffForDrag;
- (void)freezeExpandedPreview;
- (void)layoutSubviews;
- (void)setAllowsElasticMorph:(BOOL)a3;
- (void)setAllowsUserInteractionInExpandedPreview:(BOOL)a3;
- (void)setAlwaysCompact:(BOOL)a3;
- (void)setCollapsedClippingView:(id)a3;
- (void)setCollapsedPreview:(id)a3;
- (void)setCollapsedShadowIntensity:(double)a3;
- (void)setCollapsedShadowStyle:(int64_t)a3;
- (void)setCollapsedTransformView:(id)a3;
- (void)setContentSizeDidChange:(BOOL)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpandedClippingView:(id)a3;
- (void)setExpandedPreview:(id)a3;
- (void)setExpandedShadowIntensity:(double)a3;
- (void)setExpandedShadowStyle:(int64_t)a3;
- (void)setExpandedTransformView:(id)a3;
- (void)setExpansionProgress:(id)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setHideChromeWhenCollapsed:(BOOL)a3;
- (void)setHidesCollapsedSourceView:(BOOL)a3;
- (void)setOverrideCollapsedCornerRadius:(double)a3;
- (void)setOverrideExpandedCornerRadius:(double)a3;
- (void)setPathShadowView:(id)a3;
- (void)setPlatterHeight:(id)a3;
- (void)setPlatterWidth:(id)a3;
- (void)setPreferredMorphingAxis:(unint64_t)a3;
- (void)setPreventPreviewRasterization:(BOOL)a3;
- (void)setSeparatedOptions:(id)a3;
- (void)setShadowSettings:(id)a3;
- (void)setShadowViews:(id)a3;
- (void)setShouldApplyClippingHandler:(id)a3;
- (void)setShouldMorphContents:(BOOL)a3;
- (void)setWantsEdgeAntialiasing:(BOOL)a3;
- (void)updateContentSize;
@end

@implementation _UIMorphingPlatterView

- (_UIMorphingPlatterView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)_UIMorphingPlatterView;
  v3 = -[UIView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setClipsToBounds:0];
    v5 = [_UIPlatterClippingView alloc];
    [(UIView *)v4 bounds];
    v6 = -[_UIPlatterClippingView initWithFrame:](v5, "initWithFrame:");
    [(_UIMorphingPlatterView *)v4 setExpandedClippingView:v6];

    v7 = [(_UIMorphingPlatterView *)v4 expandedClippingView];
    [(UIView *)v4 addSubview:v7];

    v8 = [_UIPlatterTransformView alloc];
    [(UIView *)v4 bounds];
    v9 = -[_UIPlatterTransformView initWithFrame:](v8, "initWithFrame:");
    [(_UIMorphingPlatterView *)v4 setExpandedTransformView:v9];

    v10 = [(_UIMorphingPlatterView *)v4 expandedTransformView];
    [v10 setHidesSourceView:1];

    v11 = [(_UIMorphingPlatterView *)v4 expandedClippingView];
    v12 = [(_UIMorphingPlatterView *)v4 expandedTransformView];
    [v11 addSubview:v12];

    v13 = [_UIPlatterClippingView alloc];
    [(UIView *)v4 bounds];
    v14 = -[_UIPlatterClippingView initWithFrame:](v13, "initWithFrame:");
    [(_UIMorphingPlatterView *)v4 setCollapsedClippingView:v14];

    v15 = [(_UIMorphingPlatterView *)v4 collapsedClippingView];
    [(UIView *)v4 addSubview:v15];

    v16 = [_UIPlatterTransformView alloc];
    [(UIView *)v4 bounds];
    v17 = -[_UIPlatterTransformView initWithFrame:](v16, "initWithFrame:");
    [(_UIMorphingPlatterView *)v4 setCollapsedTransformView:v17];

    v18 = [(_UIMorphingPlatterView *)v4 collapsedTransformView];
    [v18 setHidesSourceView:1];

    v19 = [(_UIMorphingPlatterView *)v4 collapsedClippingView];
    v20 = [(_UIMorphingPlatterView *)v4 collapsedTransformView];
    [v19 addSubview:v20];

    [(_UIMorphingPlatterView *)v4 setPreventPreviewRasterization:0];
    [(UIView *)v4 _setSafeAreaInsetsFrozen:1];
    [(_UIMorphingPlatterView *)v4 setShouldMorphContents:1];
    [(_UIMorphingPlatterView *)v4 setOverrideCollapsedCornerRadius:2.22507386e-308];
    [(_UIMorphingPlatterView *)v4 setOverrideExpandedCornerRadius:2.22507386e-308];
    [(_UIMorphingPlatterView *)v4 setCollapsedShadowIntensity:1.0];
    [(_UIMorphingPlatterView *)v4 setExpandedShadowIntensity:1.0];
    v21 = [MEMORY[0x1E4F1CA60] dictionary];
    [(_UIMorphingPlatterView *)v4 setShadowViews:v21];

    [(_UIMorphingPlatterView *)v4 _prepareAnimatableProperties];
  }
  return v4;
}

- (void)setAllowsUserInteractionInExpandedPreview:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIMorphingPlatterView *)self expandedTransformView];
  [v4 setAllowsUserInteraction:v3];
}

- (BOOL)allowsUserInteractionInExpandedPreview
{
  v2 = [(_UIMorphingPlatterView *)self expandedTransformView];
  char v3 = [v2 allowsUserInteraction];

  return v3;
}

- (void)setPreventPreviewRasterization:(BOOL)a3
{
  if (self->_preventPreviewRasterization != a3)
  {
    self->_preventPreviewRasterization = a3;
    BOOL v3 = !a3;
    id v4 = [(_UIMorphingPlatterView *)self expandedTransformView];
    [v4 setAppliesMinificationFilter:v3];
  }
}

- (void)setAlwaysCompact:(BOOL)a3
{
  if (self->_alwaysCompact != a3)
  {
    self->_alwaysCompact = a3;
    if (a3) {
      int64_t v4 = [(_UIMorphingPlatterView *)self collapsedShadowStyle];
    }
    else {
      int64_t v4 = 2;
    }
    [(_UIMorphingPlatterView *)self setExpandedShadowStyle:v4];
  }
}

- (void)setHidesCollapsedSourceView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIMorphingPlatterView *)self collapsedTransformView];
  [v4 setHidesSourceView:v3];
}

- (BOOL)hidesCollapsedSourceView
{
  v2 = [(_UIMorphingPlatterView *)self collapsedTransformView];
  char v3 = [v2 hidesSourceView];

  return v3;
}

- (void)setWantsEdgeAntialiasing:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(_UIMorphingPlatterView *)self collapsedClippingView];
  v6 = [v5 layer];
  [v6 setAllowsEdgeAntialiasing:v3];

  id v8 = [(_UIMorphingPlatterView *)self expandedClippingView];
  v7 = [v8 layer];
  [v7 setAllowsEdgeAntialiasing:v3];
}

- (BOOL)wantsEdgeAntialiasing
{
  v2 = [(_UIMorphingPlatterView *)self collapsedClippingView];
  BOOL v3 = [v2 layer];
  char v4 = [v3 allowsEdgeAntialiasing];

  return v4;
}

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)_UIMorphingPlatterView;
  [(UIView *)&v7 didMoveToWindow];
  if ([(_UIMorphingPlatterView *)self alwaysCompact])
  {
    BOOL v3 = [(UIView *)self window];

    if (!v3)
    {
      char v4 = [(_UIMorphingPlatterView *)self collapsedPreview];
      v5 = [v4 view];

      v6 = -[UIView _internalTraitOverrides](v5);
      [v6 _removeTraitToken:0x1ED3F5B20];
    }
  }
}

- (void)layoutSubviews
{
  v79.receiver = self;
  v79.super_class = (Class)_UIMorphingPlatterView;
  [(UIView *)&v79 layoutSubviews];
  BOOL v3 = [(_UIMorphingPlatterView *)self expanded];
  [(UIView *)self bounds];
  CGFloat rect_16 = v5;
  CGFloat rect_24 = v4;
  CGFloat v73 = v7;
  CGFloat v74 = v6;
  id v8 = [(_UIMorphingPlatterView *)self collapsedTransformView];
  v9 = [(_UIMorphingPlatterView *)self expandedTransformView];
  if ([(_UIMorphingPlatterView *)self contentSizeDidChange])
  {
    [(_UIMorphingPlatterView *)self setContentSizeDidChange:0];
    [v8 sizeToFit];
    [v9 sizeToFit];
  }
  [(_UIMorphingPlatterView *)self _updatePathShadowTransform];
  [(_UIMorphingPlatterView *)self _updateClippingViews];
  if (![(_UIMorphingPlatterView *)self preferredMorphingAxis])
  {
    [v8 bounds];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [v9 bounds];
    CGFloat rect = v80.origin.x;
    CGFloat y = v80.origin.y;
    CGFloat width = v80.size.width;
    CGFloat height = v80.size.height;
    double v21 = CGRectGetWidth(v80);
    v81.origin.x = v11;
    v81.origin.CGFloat y = v13;
    v81.size.CGFloat width = v15;
    v81.size.CGFloat height = v17;
    double v22 = vabdd_f64(v21, CGRectGetWidth(v81));
    v82.origin.x = v11;
    v82.origin.CGFloat y = v13;
    v82.size.CGFloat width = v15;
    v82.size.CGFloat height = v17;
    double rect_8 = v22 / CGRectGetWidth(v82);
    v83.origin.x = rect;
    v83.origin.CGFloat y = y;
    v83.size.CGFloat width = width;
    v83.size.CGFloat height = height;
    double v23 = CGRectGetHeight(v83);
    v84.origin.x = v11;
    v84.origin.CGFloat y = v13;
    v84.size.CGFloat width = v15;
    v84.size.CGFloat height = v17;
    double v24 = vabdd_f64(v23, CGRectGetHeight(v84));
    v85.origin.x = v11;
    v85.origin.CGFloat y = v13;
    v85.size.CGFloat width = v15;
    v85.size.CGFloat height = v17;
    if (rect_8 <= v24 / CGRectGetHeight(v85)) {
      uint64_t v25 = 1;
    }
    else {
      uint64_t v25 = 2;
    }
    [(_UIMorphingPlatterView *)self setPreferredMorphingAxis:v25];
  }
  [v8 bounds];
  CGFloat v27 = v26;
  CGFloat v63 = v28;
  CGFloat recta = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat rect_8a = v32;
  unint64_t v33 = [(_UIMorphingPlatterView *)self preferredMorphingAxis];
  v86.origin.x = rect_24;
  v86.origin.CGFloat y = rect_16;
  v86.size.CGFloat width = v74;
  v86.size.CGFloat height = v73;
  double v34 = CGRectGetWidth(v86);
  v87.origin.x = v27;
  v87.origin.CGFloat y = v29;
  v87.size.CGFloat width = v31;
  v87.size.CGFloat height = rect_8a;
  double v35 = v34 / CGRectGetWidth(v87);
  v88.origin.x = rect_24;
  v88.origin.CGFloat y = rect_16;
  v88.size.CGFloat width = v74;
  v88.size.CGFloat height = v73;
  double v36 = CGRectGetHeight(v88);
  v89.origin.CGFloat y = v63;
  v89.origin.x = recta;
  v89.size.CGFloat width = v31;
  v89.size.CGFloat height = rect_8a;
  double v37 = CGRectGetHeight(v89);
  double v38 = v36 / v37;
  if (v33 == 1) {
    double v39 = v35;
  }
  else {
    double v39 = v36 / v37;
  }
  if (v33 == 2) {
    double v40 = v36 / v37;
  }
  else {
    double v40 = v35;
  }
  if (v33 != 2) {
    double v38 = v39;
  }
  CGAffineTransformMakeScale(&v78, v40, v38);
  CGAffineTransform v77 = v78;
  [v8 setTransform:&v77];
  [v9 bounds];
  CGFloat v42 = v41;
  CGFloat v64 = v43;
  CGFloat rectb = v41;
  CGFloat v44 = v43;
  CGFloat rect_8b = v45;
  CGFloat v47 = v46;
  unint64_t v48 = [(_UIMorphingPlatterView *)self preferredMorphingAxis];
  v90.origin.x = rect_24;
  v90.origin.CGFloat y = rect_16;
  v90.size.CGFloat width = v74;
  v90.size.CGFloat height = v73;
  double v49 = CGRectGetWidth(v90);
  v91.origin.x = v42;
  v91.origin.CGFloat y = v44;
  v91.size.CGFloat width = rect_8b;
  v91.size.CGFloat height = v47;
  double v50 = v49 / CGRectGetWidth(v91);
  v92.origin.x = rect_24;
  v92.origin.CGFloat y = rect_16;
  v92.size.CGFloat width = v74;
  v92.size.CGFloat height = v73;
  double v51 = CGRectGetHeight(v92);
  v93.origin.CGFloat y = v64;
  v93.origin.x = rectb;
  v93.size.CGFloat width = rect_8b;
  v93.size.CGFloat height = v47;
  double v52 = CGRectGetHeight(v93);
  double v53 = v51 / v52;
  if (v48 == 1) {
    double v54 = v50;
  }
  else {
    double v54 = v51 / v52;
  }
  if (v48 == 2) {
    double v55 = v51 / v52;
  }
  else {
    double v55 = v50;
  }
  if (v48 != 2) {
    double v53 = v54;
  }
  CGAffineTransformMakeScale(&v76, v55, v53);
  CGAffineTransform v75 = v76;
  [v9 setTransform:&v75];
  if ([(_UIMorphingPlatterView *)self bothViewsAreLikelyOpaque])
  {
    v56 = [(_UIMorphingPlatterView *)self collapsedClippingView];
    [(UIView *)self bringSubviewToFront:v56];
  }
  if (!+[UIView _isInRetargetableAnimationBlock]) {
    [(_UIMorphingPlatterView *)self _modelUpdates];
  }
  if (v3) {
    double v57 = 1.0;
  }
  else {
    double v57 = 0.0;
  }
  v58 = [(_UIMorphingPlatterView *)self expansionProgress];
  [v58 setValue:v57];

  v94.origin.x = rect_24;
  v94.origin.CGFloat y = rect_16;
  v94.size.CGFloat width = v74;
  v94.size.CGFloat height = v73;
  double v59 = CGRectGetWidth(v94);
  v60 = [(_UIMorphingPlatterView *)self platterWidth];
  [v60 setValue:v59];

  v95.origin.x = rect_24;
  v95.origin.CGFloat y = rect_16;
  v95.size.CGFloat width = v74;
  v95.size.CGFloat height = v73;
  double v61 = CGRectGetHeight(v95);
  v62 = [(_UIMorphingPlatterView *)self platterHeight];
  [v62 setValue:v61];

  [(_UIMorphingPlatterView *)self _updateCollapsedChrome];
}

- (void)_modelUpdates
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = v3 + v7 * 0.5;
  double v12 = v5 + v9 * 0.5;
  CGFloat v13 = [(_UIMorphingPlatterView *)self collapsedClippingView];
  objc_msgSend(v13, "setBounds:", v4, v6, v8, v10);

  double v14 = [(_UIMorphingPlatterView *)self collapsedClippingView];
  objc_msgSend(v14, "setCenter:", v11, v12);

  CGFloat v15 = [(_UIMorphingPlatterView *)self expandedClippingView];
  objc_msgSend(v15, "setBounds:", v4, v6, v8, v10);

  double v16 = [(_UIMorphingPlatterView *)self expandedClippingView];
  objc_msgSend(v16, "setCenter:", v11, v12);

  CGFloat v17 = [(_UIMorphingPlatterView *)self collapsedTransformView];
  double v18 = 0.0;
  objc_msgSend(v17, "setCenter:", v11, 0.0);

  v19 = [(_UIMorphingPlatterView *)self expandedTransformView];
  objc_msgSend(v19, "setCenter:", v11, 0.0);

  if ([(_UIMorphingPlatterView *)self expanded]) {
    double v18 = 1.0;
  }
  if ([(_UIMorphingPlatterView *)self alwaysCompact])
  {
    v20 = [(_UIMorphingPlatterView *)self collapsedClippingView];
    [v20 setAlpha:1.0];

    double v21 = [(_UIMorphingPlatterView *)self expandedClippingView];
    double v22 = v21;
    double v23 = 0.0;
  }
  else
  {
    double v24 = [(_UIMorphingPlatterView *)self collapsedClippingView];
    [v24 setAlpha:1.0 - v18];

    double v21 = [(_UIMorphingPlatterView *)self expandedClippingView];
    double v22 = v21;
    double v23 = v18;
  }
  [v21 setAlpha:v23];

  -[_UIMorphingPlatterView _updateShadowsWithExpansionProgress:contentBounds:center:forPresentation:](self, "_updateShadowsWithExpansionProgress:contentBounds:center:forPresentation:", 0, v18, v4, v6, v8, v10, v11, v12);
}

- (void)_prepareAnimatableProperties
{
  v15[3] = *MEMORY[0x1E4F143B8];
  double v3 = objc_opt_new();
  [(_UIMorphingPlatterView *)self setExpansionProgress:v3];

  double v4 = objc_opt_new();
  [(_UIMorphingPlatterView *)self setPlatterWidth:v4];

  double v5 = objc_opt_new();
  [(_UIMorphingPlatterView *)self setPlatterHeight:v5];

  double v6 = [(_UIMorphingPlatterView *)self expansionProgress];
  v15[0] = v6;
  double v7 = [(_UIMorphingPlatterView *)self platterWidth];
  v15[1] = v7;
  double v8 = [(_UIMorphingPlatterView *)self platterHeight];
  v15[2] = v8;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];

  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54___UIMorphingPlatterView__prepareAnimatableProperties__block_invoke;
  v12[3] = &unk_1E52DC308;
  objc_copyWeak(&v13, &location);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54___UIMorphingPlatterView__prepareAnimatableProperties__block_invoke_2;
  v10[3] = &unk_1E52DC308;
  objc_copyWeak(&v11, &location);
  +[UIView _createTransformerWithInputAnimatableProperties:v9 modelValueSetter:v12 presentationValueSetter:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_updateClippingViews
{
  BOOL v3 = [(_UIMorphingPlatterView *)self expanded];
  [(UIView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = [(_UIMorphingPlatterView *)self collapsedClippingView];
  id v13 = [(_UIMorphingPlatterView *)self expandedClippingView];
  char v36 = 0;
  uint64_t v35 = 15;
  if (v3)
  {
    [(_UIMorphingPlatterView *)self _expandedCornerRadius:&v36 maskedCorners:&v35 ignoreLiftScale:0];
    double v15 = _UIClampedCornerRadius(15, v14, v5, v7, v9, v11);
  }
  else
  {
    [(_UIMorphingPlatterView *)self _collapsedCornerRadius:&v36 maskedCorners:&v35];
  }
  double v16 = v15;
  CGFloat v17 = (id *)MEMORY[0x1E4F39EA8];
  if (!v36) {
    CGFloat v17 = (id *)MEMORY[0x1E4F39EA0];
  }
  id v18 = *v17;
  if (fabs(v16) < 2.22044605e-16)
  {
    uint64_t v35 = 15;
    if (v3) {
      v19 = v12;
    }
    else {
      v19 = v13;
    }
    v20 = [v19 layer];
    uint64_t v21 = [v20 cornerCurve];

    id v18 = (id)v21;
  }
  double v22 = [v12 layer];
  [v22 setCornerCurve:v18];

  double v23 = [v13 layer];
  [v23 setCornerCurve:v18];

  double v24 = [(UIView *)self traitCollection];
  uint64_t v25 = [v24 userInterfaceIdiom];

  if (v25 == 6)
  {
    double v26 = [v12 layer];
    [v26 setCornerRadius:v16];

    CGFloat v27 = [v13 layer];
    [v27 setCornerRadius:v16];
  }
  else
  {
    if (v35) {
      double v28 = v16;
    }
    else {
      double v28 = 0.0;
    }
    if ((v35 & 2) != 0) {
      double v29 = v16;
    }
    else {
      double v29 = 0.0;
    }
    if ((v35 & 4) != 0) {
      double v30 = v16;
    }
    else {
      double v30 = 0.0;
    }
    if ((v35 & 8) != 0) {
      double v31 = v16;
    }
    else {
      double v31 = 0.0;
    }
    double v32 = [v12 layer];
    *(double *)double v34 = v30;
    *(double *)&v34[1] = v30;
    *(double *)&v34[2] = v31;
    *(double *)&v34[3] = v31;
    *(double *)&v34[4] = v29;
    *(double *)&v34[5] = v29;
    *(double *)&v34[6] = v28;
    *(double *)&v34[7] = v28;
    [v32 setCornerRadii:v34];

    CGFloat v27 = [v13 layer];
    *(double *)unint64_t v33 = v30;
    *(double *)&v33[1] = v30;
    *(double *)&v33[2] = v31;
    *(double *)&v33[3] = v31;
    *(double *)&v33[4] = v29;
    *(double *)&v33[5] = v29;
    *(double *)&v33[6] = v28;
    *(double *)&v33[7] = v28;
    [v27 setCornerRadii:v33];
  }

  [(UIView *)self _setContinuousCornerRadius:v16];
}

- (double)_collapsedCornerRadius:(BOOL *)a3 maskedCorners:(unint64_t *)a4
{
  *a4 = 15;
  *a3 = 1;
  [(_UIMorphingPlatterView *)self overrideCollapsedCornerRadius];
  if (v7 <= 2.22507386e-308)
  {
    CGFloat v9 = [(_UIMorphingPlatterView *)self collapsedPreview];
    double v10 = [v9 _outlineShape];

    [v10 cornerRadius];
    double v12 = v11;
    id v13 = [v10 cornerCurve];
    *a3 = v13 == (void *)*MEMORY[0x1E4F39EA8];

    *a4 = [v10 cornerMask];
    return v12;
  }
  else
  {
    [(_UIMorphingPlatterView *)self overrideCollapsedCornerRadius];
  }
  return result;
}

- (double)_expandedCornerRadius:(BOOL *)a3 maskedCorners:(unint64_t *)a4 ignoreLiftScale:(BOOL)a5
{
  *a4 = 15;
  *a3 = 1;
  [(_UIMorphingPlatterView *)self overrideExpandedCornerRadius];
  if (v9 > 2.22507386e-308)
  {
    [(_UIMorphingPlatterView *)self overrideExpandedCornerRadius];
    return result;
  }
  if ([(_UIMorphingPlatterView *)self alwaysCompact]) {
    [(_UIMorphingPlatterView *)self collapsedPreview];
  }
  else {
  double v11 = [(_UIMorphingPlatterView *)self expandedPreview];
  }
  double v12 = [v11 _outlineShape];
  [v12 cornerRadius];
  double v14 = v13;
  if ([(_UIMorphingPlatterView *)self alwaysCompact])
  {
    double v15 = [v12 cornerCurve];
    *a3 = v15 == (void *)*MEMORY[0x1E4F39EA8];

    unint64_t v16 = [v12 cornerMask];
  }
  else
  {
    *a3 = 1;
    unint64_t v16 = 15;
  }
  *a4 = v16;
  CGFloat v17 = [v11 parameters];
  id v18 = [v17 visiblePath];
  if (v18)
  {

LABEL_16:
    goto LABEL_17;
  }

  if (fabs(v14) < 2.22044605e-16)
  {
    v19 = [v11 view];
    v20 = [v19 traitCollection];
    CGFloat v17 = _UIContextMenuGetPlatformMetrics([v20 userInterfaceIdiom]);

    [v17 previewPlatterCornerRadius];
    if (v14 < v21) {
      double v14 = v21;
    }
    goto LABEL_16;
  }
LABEL_17:
  if ([(_UIMorphingPlatterView *)self alwaysCompact])
  {
    if (!a5)
    {
      [(UIView *)self bounds];
      double Width = CGRectGetWidth(v25);
      [v11 size];
      double v14 = v14 * (Width / v23);
    }
    *a4 = 15;
  }

  return v14;
}

- (void)freezeExpandedPreview
{
  if (![(_UIMorphingPlatterView *)self isFrozen]
    && ![(_UIMorphingPlatterView *)self alwaysCompact])
  {
    [(_UIMorphingPlatterView *)self setFrozen:1];
    id v13 = [(_UIMorphingPlatterView *)self expandedPreview];
    BOOL v3 = [v13 view];
    [v3 bounds];
    double v8 = _UISnapshotViewRectAfterCommit(v3, 0, v4, v5, v6, v7);
    [v3 bounds];
    objc_msgSend(v8, "setFrame:");
    if (v8)
    {
      double v9 = [UITargetedPreview alloc];
      double v10 = [v13 parameters];
      double v11 = [v13 target];
      double v12 = [(UITargetedPreview *)v9 initWithView:v8 parameters:v10 target:v11];
      [(_UIMorphingPlatterView *)self setExpandedPreview:v12];
    }
  }
}

- (void)didTearOffForDrag
{
  BOOL v3 = [(_UIMorphingPlatterView *)self collapsedTransformView];
  [v3 didTearOffForDrag];

  if ([(_UIMorphingPlatterView *)self alwaysCompact])
  {
    double v4 = [(_UIMorphingPlatterView *)self collapsedPreview];
    uint64_t v5 = [v4 _previewMode];

    if (v5 == 4)
    {
      CGAffineTransformMakeScale(&v7, 0.909090909, 0.909090909);
      CGAffineTransform v6 = v7;
      [(UIView *)self setTransform:&v6];
    }
  }
}

- (BOOL)bothViewsAreLikelyOpaque
{
  BOOL v3 = [(_UIMorphingPlatterView *)self collapsedPreview];
  if ([v3 _isLikelyOpaque])
  {
    double v4 = [(_UIMorphingPlatterView *)self expandedPreview];
    char v5 = [v4 _isLikelyOpaque];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_previewPrefersApplyingMask:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 _previewMode] != 4 && objc_msgSend(v3, "_previewMode") != 5;

  return v4;
}

- (void)setCollapsedPreview:(id)a3
{
  char v5 = (UITargetedPreview *)a3;
  p_collapsedPreview = &self->_collapsedPreview;
  collapsedPreview = self->_collapsedPreview;
  if (collapsedPreview != v5)
  {
    double v23 = v5;
    if (collapsedPreview)
    {
      if ([(_UIMorphingPlatterView *)self alwaysCompact])
      {
        double v8 = [(UITargetedPreview *)*p_collapsedPreview view];
        double v9 = [(UITargetedPreview *)v23 view];

        if (v8 != v9)
        {
          double v10 = [(UITargetedPreview *)*p_collapsedPreview view];
          double v11 = -[UIView _internalTraitOverrides](v10);
          [v11 _removeTraitToken:0x1ED3F5B20];
        }
      }
    }
    objc_storeStrong((id *)&self->_collapsedPreview, a3);
    double v12 = *p_collapsedPreview;
    id v13 = [(_UIMorphingPlatterView *)self collapsedTransformView];
    [v13 setSourcePreview:v12];

    if (_AXSReduceMotionEnabled())
    {
      double v14 = [(_UIMorphingPlatterView *)self collapsedTransformView];
      [v14 setHidesSourceView:0];
    }
    double v15 = *p_collapsedPreview;
    unint64_t v16 = [(_UIMorphingPlatterView *)self collapsedClippingView];
    CGFloat v17 = [(_UIMorphingPlatterView *)self collapsedTransformView];
    [(_UIMorphingPlatterView *)self _installPreview:v15 inClippingView:v16 transformView:v17];

    id v18 = [(UITargetedPreview *)*p_collapsedPreview parameters];
    v19 = [v18 backgroundColor];
    uint64_t v20 = [v19 _isOpaque];
    double v21 = [(_UIMorphingPlatterView *)self collapsedClippingView];
    double v22 = [v21 layer];
    [v22 setAllowsGroupOpacity:v20];

    [(_UIMorphingPlatterView *)self _updatePathShadow];
    char v5 = v23;
  }
}

- (void)_updatePathShadow
{
  if ([(_UIMorphingPlatterView *)self expanded]) {
    int64_t v3 = [(_UIMorphingPlatterView *)self expandedShadowStyle];
  }
  else {
    int64_t v3 = [(_UIMorphingPlatterView *)self collapsedShadowStyle];
  }
  int64_t v4 = v3;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  double v14 = __43___UIMorphingPlatterView__updatePathShadow__block_invoke;
  double v15 = &unk_1E52D9FC0;
  unint64_t v16 = self;
  BOOL v17 = v3 == 1;
  +[UIView performWithoutAnimation:&v12];
  char v5 = [(_UIMorphingPlatterView *)self pathShadowView];

  if (v5)
  {
    if (v4 == 1) {
      double v6 = 1.0;
    }
    else {
      double v6 = 0.0;
    }
    CGAffineTransform v7 = [(_UIMorphingPlatterView *)self pathShadowView];
    [v7 setAlpha:v6];

    double v8 = [(_UIMorphingPlatterView *)self shadowViews];
    double v9 = [v8 objectForKeyedSubscript:&unk_1ED3F5CB8];
    [v9 removeFromSuperview];

    double v10 = [(_UIMorphingPlatterView *)self pathShadowView];
    double v11 = [(_UIMorphingPlatterView *)self shadowViews];
    [v11 setObject:v10 forKeyedSubscript:&unk_1ED3F5CB8];
  }
}

- (void)setCollapsedShadowStyle:(int64_t)a3
{
  if (self->_collapsedShadowStyle != a3)
  {
    self->_int64_t collapsedShadowStyle = a3;
    if ([(_UIMorphingPlatterView *)self alwaysCompact]) {
      [(_UIMorphingPlatterView *)self setExpandedShadowStyle:self->_collapsedShadowStyle];
    }
    int64_t collapsedShadowStyle = self->_collapsedShadowStyle;
    [(_UIMorphingPlatterView *)self _installShadowViewForStyleIfNecessary:collapsedShadowStyle];
  }
}

- (void)setCollapsedShadowIntensity:(double)a3
{
  if (vabdd_f64(a3, self->_collapsedShadowIntensity) > 2.22044605e-16)
  {
    self->_collapsedShadowIntensitCGFloat y = a3;
    int64_t v4 = [(_UIMorphingPlatterView *)self expansionProgress];
    [v4 value];
    -[_UIMorphingPlatterView _collapsedShadowAlphaForExpansionProgress:](self, "_collapsedShadowAlphaForExpansionProgress:");
    double v6 = v5;

    CGAffineTransform v7 = [(_UIMorphingPlatterView *)self shadowSettings];

    if (v7)
    {
      id v14 = [(_UIMorphingPlatterView *)self shadowSettings];
      [v14 opacity];
      float v9 = v6 * v8;
      double v10 = [(UIView *)self layer];
      *(float *)&double v11 = v9;
      [v10 setShadowOpacity:v11];
    }
    else
    {
      uint64_t v12 = [(_UIMorphingPlatterView *)self shadowViews];
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[_UIMorphingPlatterView collapsedShadowStyle](self, "collapsedShadowStyle"));
      id v14 = [v12 objectForKeyedSubscript:v13];

      [v14 setAlpha:v6];
    }
  }
}

- (void)setExpandedShadowStyle:(int64_t)a3
{
  if (self->_expandedShadowStyle != a3)
  {
    self->_expandedShadowStyle = a3;
    -[_UIMorphingPlatterView _installShadowViewForStyleIfNecessary:](self, "_installShadowViewForStyleIfNecessary:");
  }
}

- (void)setExpandedShadowIntensity:(double)a3
{
  if (vabdd_f64(a3, self->_expandedShadowIntensity) > 2.22044605e-16)
  {
    self->_expandedShadowIntensitCGFloat y = a3;
    int64_t v4 = [(_UIMorphingPlatterView *)self expansionProgress];
    [v4 value];
    -[_UIMorphingPlatterView _expandedShadowAlphaForExpansionProgress:](self, "_expandedShadowAlphaForExpansionProgress:");
    double v6 = v5;

    CGAffineTransform v7 = [(_UIMorphingPlatterView *)self shadowSettings];

    if (v7)
    {
      id v14 = [(_UIMorphingPlatterView *)self shadowSettings];
      [v14 opacity];
      float v9 = v6 * v8;
      double v10 = [(UIView *)self layer];
      *(float *)&double v11 = v9;
      [v10 setShadowOpacity:v11];
    }
    else
    {
      uint64_t v12 = [(_UIMorphingPlatterView *)self shadowViews];
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[_UIMorphingPlatterView expandedShadowStyle](self, "expandedShadowStyle"));
      id v14 = [v12 objectForKeyedSubscript:v13];

      [v14 setAlpha:v6];
    }
  }
}

- (void)setHideChromeWhenCollapsed:(BOOL)a3
{
  if (self->_hideChromeWhenCollapsed != a3)
  {
    self->_hideChromeWhenCollapsed = a3;
    [(_UIMorphingPlatterView *)self _updateCollapsedChrome];
  }
}

- (void)_updateCollapsedChrome
{
  if ([(_UIMorphingPlatterView *)self hideChromeWhenCollapsed])
  {
    int64_t v3 = [(_UIMorphingPlatterView *)self collapsedPreview];
    char v4 = [v3 _isLikelyOpaque];

    if ((v4 & 1) == 0)
    {
      id v6 = +[UIColor clearColor];
      double v5 = [(_UIMorphingPlatterView *)self collapsedTransformView];
      [v5 setBackgroundColor:v6];
    }
  }
}

- (void)setExpandedPreview:(id)a3
{
  double v5 = (UITargetedPreview *)a3;
  p_expandedPreview = &self->_expandedPreview;
  if (self->_expandedPreview != v5)
  {
    uint64_t v13 = v5;
    objc_storeStrong((id *)&self->_expandedPreview, a3);
    if ([(_UIMorphingPlatterView *)self alwaysCompact])
    {
      CGAffineTransform v7 = [(_UIMorphingPlatterView *)self collapsedPreview];
      -[UITargetedPreview _setPreviewMode:](*p_expandedPreview, "_setPreviewMode:", [v7 _previewMode]);
    }
    double v8 = *p_expandedPreview;
    float v9 = [(_UIMorphingPlatterView *)self expandedTransformView];
    [v9 setSourcePreview:v8];

    double v10 = *p_expandedPreview;
    double v11 = [(_UIMorphingPlatterView *)self expandedClippingView];
    uint64_t v12 = [(_UIMorphingPlatterView *)self expandedTransformView];
    [(_UIMorphingPlatterView *)self _installPreview:v10 inClippingView:v11 transformView:v12];

    double v5 = v13;
  }
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    BOOL v3 = a3;
    self->_expanded = a3;
    double v5 = [(_UIMorphingPlatterView *)self expandedTransformView];
    [v5 setHidesSourceView:0];

    id v6 = [(_UIMorphingPlatterView *)self collapsedTransformView];
    [v6 setForwardsHitTestingToSourceView:!v3];

    if (v3)
    {
      uint64_t v7 = 1;
    }
    else
    {
      double v8 = [(_UIMorphingPlatterView *)self collapsedPreview];
      float v9 = [v8 target];
      double v10 = [v9 container];
      double v11 = [v10 traitCollection];
      uint64_t v7 = [v11 userInterfaceLevel];
    }
    if ([(_UIMorphingPlatterView *)self alwaysCompact])
    {
      uint64_t v12 = [(_UIMorphingPlatterView *)self collapsedPreview];
      uint64_t v13 = [v12 view];

      id v14 = -[UIView _internalTraitOverrides](v13);
      [v14 setUserInterfaceLevel:v7];
    }
    double v15 = -[UIView _internalTraitOverrides](self);
    [v15 setUserInterfaceLevel:v7];

    [(UIView *)self setNeedsLayout];
    unint64_t v16 = [(_UIMorphingPlatterView *)self shadowSettings];

    if (v16)
    {
      if (v3) {
        [(_UIMorphingPlatterView *)self expandedPreview];
      }
      else {
      id v25 = [(_UIMorphingPlatterView *)self collapsedPreview];
      }
      BOOL v17 = [v25 parameters];
      id v18 = [v17 effectiveShadowPath];

      v19 = [(UIView *)self layer];
      uint64_t v20 = v19;
      if (v18)
      {
        [v19 setShadowPathIsBounds:0];

        uint64_t v21 = [v18 CGPath];
        double v22 = [(UIView *)self layer];
        double v23 = v22;
        uint64_t v24 = v21;
      }
      else
      {
        [v19 setShadowPathIsBounds:1];

        double v22 = [(UIView *)self layer];
        double v23 = v22;
        uint64_t v24 = 0;
      }
      [v22 setShadowPath:v24];
    }
  }
}

- (void)updateContentSize
{
  [(_UIMorphingPlatterView *)self setContentSizeDidChange:1];
  [(UIView *)self setNeedsLayout];
  if (+[UIView _isInAnimationBlock])
  {
    [(UIView *)self layoutIfNeeded];
  }
}

- (void)_installShadowViewForStyleIfNecessary:(int64_t)a3
{
  double v5 = [(_UIMorphingPlatterView *)self shadowSettings];

  if (!v5)
  {
    id v6 = [(_UIMorphingPlatterView *)self shadowViews];
    uint64_t v7 = [NSNumber numberWithInteger:a3];
    double v8 = [v6 objectForKeyedSubscript:v7];

    if (v8) {
      goto LABEL_12;
    }
    switch(a3)
    {
      case 1:
        double v8 = [(_UIMorphingPlatterView *)self pathShadowView];
        break;
      case 3:
        id v14 = [_UIDiffuseShadowView alloc];
        double v15 = [(_UIMorphingPlatterView *)self expandedClippingView];
        [v15 bounds];
        double v8 = -[_UIDiffuseShadowView initWithFrame:](v14, "initWithFrame:");

        break;
      case 2:
        float v9 = [(_UIMorphingPlatterView *)self expandedPreview];
        [v9 _previewMode];
        double v10 = (objc_class *)objc_opt_class();

        char v25 = 0;
        uint64_t v24 = 0;
        id v11 = [v10 alloc];
        [(_UIMorphingPlatterView *)self _expandedCornerRadius:&v25 maskedCorners:&v24 ignoreLiftScale:1];
        double v8 = (_UIDiffuseShadowView *)objc_msgSend(v11, "initWithCornerRadius:");
        uint64_t v12 = +[UIDevice currentDevice];
        uint64_t v13 = [v12 userInterfaceIdiom];

        [(_UIDiffuseShadowView *)v8 setUseLowerIntensity:(v13 & 0xFFFFFFFFFFFFFFFBLL) == 1];
        break;
      default:
        double v8 = 0;
LABEL_12:
        unint64_t v16 = [(_UIMorphingPlatterView *)self shadowViews];
        BOOL v17 = [NSNumber numberWithInteger:a3];
        [v16 setObject:v8 forKeyedSubscript:v17];

        [(UIView *)self setNeedsLayout];
        return;
    }
    if (v8)
    {
      [(UIView *)v8 setUserInteractionEnabled:0];
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      uint64_t v20 = __64___UIMorphingPlatterView__installShadowViewForStyleIfNecessary___block_invoke;
      uint64_t v21 = &unk_1E52D9F98;
      double v22 = self;
      double v8 = v8;
      double v23 = v8;
      +[UIView performWithoutAnimation:&v18];
    }
    goto LABEL_12;
  }
}

- (void)_updateShadowsWithExpansionProgress:(double)a3 contentBounds:(CGRect)a4 center:(CGPoint)a5 forPresentation:(BOOL)a6
{
  BOOL v6 = a6;
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat v11 = a4.origin.y;
  CGFloat v12 = a4.origin.x;
  double v15 = a3;
  if (a6) {
    double v15 = fmax(fmin(a3 / 0.4, 1.0), 0.0);
  }
  int64_t v16 = [(_UIMorphingPlatterView *)self collapsedShadowStyle];
  CGFloat v32 = y;
  if (v16 == [(_UIMorphingPlatterView *)self expandedShadowStyle])
  {
    double v19 = 1.0;
    double v17 = 1.0;
    if (![(_UIMorphingPlatterView *)self alwaysCompact]) {
      goto LABEL_8;
    }
    [(_UIMorphingPlatterView *)self collapsedShadowIntensity];
    double v19 = v20;
  }
  else
  {
    [(_UIMorphingPlatterView *)self _expandedShadowAlphaForExpansionProgress:v15];
    double v19 = v18;
    [(_UIMorphingPlatterView *)self _collapsedShadowAlphaForExpansionProgress:v15];
  }
  double v17 = v20;
LABEL_8:
  uint64_t v21 = [(_UIMorphingPlatterView *)self shadowSettings];

  if (v21)
  {
    double v22 = 0.0;
    double v23 = 0.0;
    if ([(_UIMorphingPlatterView *)self collapsedShadowStyle])
    {
      [(_UIMorphingPlatterView *)self collapsedShadowIntensity];
      double v23 = v24;
    }
    if ([(_UIMorphingPlatterView *)self expandedShadowStyle])
    {
      [(_UIMorphingPlatterView *)self expandedShadowIntensity];
      double v22 = v25;
    }
    double v26 = [(_UIMorphingPlatterView *)self shadowSettings];
    [v26 opacity];
    double v28 = ((1.0 - a3) * v23 + v22 * a3) * v27;

    if (v6)
    {
      id v34 = [NSNumber numberWithDouble:v28];
      [(UIView *)self _setPresentationValue:v34 forKey:@"shadowOpacity"];
    }
    else
    {
      id v34 = [(UIView *)self layer];
      float v30 = v28;
      *(float *)&double v31 = v30;
      [v34 setShadowOpacity:v31];
    }
  }
  else
  {
    double v29 = [(_UIMorphingPlatterView *)self shadowViews];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __99___UIMorphingPlatterView__updateShadowsWithExpansionProgress_contentBounds_center_forPresentation___block_invoke;
    v35[3] = &unk_1E5301A80;
    *(CGFloat *)&v35[5] = v12;
    *(CGFloat *)&v35[6] = v11;
    *(CGFloat *)&v35[7] = width;
    *(CGFloat *)&v35[8] = height;
    v35[4] = self;
    *(double *)&v35[9] = v19;
    *(double *)&v35[10] = v17;
    BOOL v36 = v6;
    *(double *)&v35[11] = a3;
    *(CGFloat *)&v35[12] = x;
    v35[13] = v33;
    [v29 enumerateKeysAndObjectsUsingBlock:v35];
  }
}

- (void)_updatePathShadowTransform
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  CGFloat v11 = [(_UIMorphingPlatterView *)self pathShadowView];
  CGFloat rect = v4;
  objc_msgSend(v11, "setCenter:", v4 + v8 * 0.5, v6 + v10 * 0.5);
  CGFloat v12 = [(_UIMorphingPlatterView *)self collapsedTransformView];
  [v12 bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  v28.origin.CGFloat x = v4;
  v28.origin.CGFloat y = v6;
  v28.size.CGFloat width = v8;
  v28.size.CGFloat height = v10;
  double Width = CGRectGetWidth(v28);
  v29.origin.CGFloat x = v14;
  v29.origin.CGFloat y = v16;
  v29.size.CGFloat width = v18;
  v29.size.CGFloat height = v20;
  CGFloat v22 = Width / CGRectGetWidth(v29);
  v30.origin.CGFloat x = rect;
  v30.origin.CGFloat y = v6;
  v30.size.CGFloat width = v8;
  v30.size.CGFloat height = v10;
  double Height = CGRectGetHeight(v30);
  v31.origin.CGFloat x = v14;
  v31.origin.CGFloat y = v16;
  v31.size.CGFloat width = v18;
  v31.size.CGFloat height = v20;
  CGFloat v24 = CGRectGetHeight(v31);
  CGAffineTransformMakeScale(&v27, v22, Height / v24);
  CGAffineTransform rect_8 = v27;
  [v11 setTransform:&rect_8];
}

- (double)_expandedShadowAlphaForExpansionProgress:(double)a3
{
  [(_UIMorphingPlatterView *)self expandedShadowIntensity];
  return (1.0 - a3) * 0.0 + v4 * a3;
}

- (double)_collapsedShadowAlphaForExpansionProgress:(double)a3
{
  [(_UIMorphingPlatterView *)self collapsedShadowIntensity];
  return a3 * 0.0 + (1.0 - a3) * v4;
}

- (void)_installPreview:(id)a3 inClippingView:(id)a4 transformView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(_UIMorphingPlatterView *)self _previewPrefersApplyingMask:v8]) {
    goto LABEL_19;
  }
  CGFloat v11 = [v8 parameters];
  CGFloat v12 = [v11 backgroundColor];

  double v13 = [v8 parameters];
  CGFloat v14 = [v13 visiblePath];
  double v15 = (void *)[v14 copy];

  CGFloat v16 = [v8 view];
  id v17 = v15;
  id v18 = v16;
  double v19 = v18;
  if (v17)
  {
    if (([v17 _isRoundedRect] & 1) == 0)
    {

LABEL_10:
      [v17 bounds];
      CGFloat x = v50.origin.x;
      CGFloat y = v50.origin.y;
      CGFloat width = v50.size.width;
      CGFloat height = v50.size.height;
      CGFloat v39 = -CGRectGetMinX(v50);
      v51.origin.CGFloat x = x;
      v51.origin.CGFloat y = y;
      v51.size.CGFloat width = width;
      v51.size.CGFloat height = height;
      CGFloat MinY = CGRectGetMinY(v51);
      CGAffineTransformMakeTranslation(&v48, v39, -MinY);
      [v17 applyTransform:&v48];
      double v41 = [_UIShapeView alloc];
      [v10 bounds];
      CGFloat v42 = -[UIView initWithFrame:](v41, "initWithFrame:");
      uint64_t v43 = [v17 CGPath];
      CGFloat v44 = [(_UIShapeView *)v42 shapeLayer];
      [v44 setPath:v43];

      [v10 setMaskView:v42];
      [v10 setBackgroundColor:v12];
      double v45 = +[UIColor clearColor];
      [v9 setBackgroundColor:v45];

      [v9 setClipsToBounds:0];
LABEL_15:

      goto LABEL_16;
    }
    [v17 bounds];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    [v19 bounds];
    v52.origin.CGFloat x = v28;
    v52.origin.CGFloat y = v29;
    v52.size.CGFloat width = v30;
    v52.size.CGFloat height = v31;
    v49.origin.CGFloat x = v21;
    v49.origin.CGFloat y = v23;
    v49.size.CGFloat width = v25;
    v49.size.CGFloat height = v27;
    BOOL v32 = CGRectEqualToRect(v49, v52);

    if (!v32) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  [v10 setMaskView:0];
  [v10 setBackgroundColor:v12];
  id v33 = [(_UIMorphingPlatterView *)self shouldApplyClippingHandler];

  if (v33)
  {
    id v34 = [(_UIMorphingPlatterView *)self shouldApplyClippingHandler];
    objc_msgSend(v9, "setClipsToBounds:", ((uint64_t (**)(void, id))v34)[2](v34, v8));
  }
  else
  {
    [v9 setClipsToBounds:1];
  }
  if (![v12 _isOpaque])
  {
    CGFloat v42 = +[UIColor clearColor];
    [v9 setBackgroundColor:v42];
    goto LABEL_15;
  }
  [v9 setBackgroundColor:v12];
LABEL_16:
  if ([(_UIMorphingPlatterView *)self bothViewsAreLikelyOpaque])
  {
    double v46 = +[UIColor clearColor];
    CGFloat v47 = [(_UIMorphingPlatterView *)self collapsedClippingView];
    [v47 setBackgroundColor:v46];
  }
LABEL_19:
}

- (UITargetedPreview)collapsedPreview
{
  return self->_collapsedPreview;
}

- (UITargetedPreview)expandedPreview
{
  return self->_expandedPreview;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (BOOL)hideChromeWhenCollapsed
{
  return self->_hideChromeWhenCollapsed;
}

- (BOOL)alwaysCompact
{
  return self->_alwaysCompact;
}

- (BOOL)preventPreviewRasterization
{
  return self->_preventPreviewRasterization;
}

- (BOOL)shouldMorphContents
{
  return self->_shouldMorphContents;
}

- (void)setShouldMorphContents:(BOOL)a3
{
  self->_shouldMorphContents = a3;
}

- (BOOL)allowsElasticMorph
{
  return self->_allowsElasticMorph;
}

- (void)setAllowsElasticMorph:(BOOL)a3
{
  self->_allowsElasticMorph = a3;
}

- (unint64_t)preferredMorphingAxis
{
  return self->_preferredMorphingAxis;
}

- (void)setPreferredMorphingAxis:(unint64_t)a3
{
  self->_preferredMorphingAxis = a3;
}

- (double)collapsedShadowIntensity
{
  return self->_collapsedShadowIntensity;
}

- (int64_t)collapsedShadowStyle
{
  return self->_collapsedShadowStyle;
}

- (double)expandedShadowIntensity
{
  return self->_expandedShadowIntensity;
}

- (int64_t)expandedShadowStyle
{
  return self->_expandedShadowStyle;
}

- (_UIShadowProperties)shadowSettings
{
  return self->_shadowSettings;
}

- (void)setShadowSettings:(id)a3
{
}

- (double)overrideCollapsedCornerRadius
{
  return self->_overrideCollapsedCornerRadius;
}

- (void)setOverrideCollapsedCornerRadius:(double)a3
{
  self->_overrideCollapsedCornerRadius = a3;
}

- (double)overrideExpandedCornerRadius
{
  return self->_overrideExpandedCornerRadius;
}

- (void)setOverrideExpandedCornerRadius:(double)a3
{
  self->_overrideExpandedCornerRadius = a3;
}

- (NSDictionary)separatedOptions
{
  return self->_separatedOptions;
}

- (void)setSeparatedOptions:(id)a3
{
}

- (id)shouldApplyClippingHandler
{
  return self->_shouldApplyClippingHandler;
}

- (void)setShouldApplyClippingHandler:(id)a3
{
}

- (_UIPlatterClippingView)collapsedClippingView
{
  return self->_collapsedClippingView;
}

- (void)setCollapsedClippingView:(id)a3
{
}

- (_UIPlatterTransformView)collapsedTransformView
{
  return self->_collapsedTransformView;
}

- (void)setCollapsedTransformView:(id)a3
{
}

- (_UIPlatterClippingView)expandedClippingView
{
  return self->_expandedClippingView;
}

- (void)setExpandedClippingView:(id)a3
{
}

- (_UIPlatterTransformView)expandedTransformView
{
  return self->_expandedTransformView;
}

- (void)setExpandedTransformView:(id)a3
{
}

- (NSMutableDictionary)shadowViews
{
  return self->_shadowViews;
}

- (void)setShadowViews:(id)a3
{
}

- (_UIPlatterSoftShadowView)pathShadowView
{
  return self->_pathShadowView;
}

- (void)setPathShadowView:(id)a3
{
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (BOOL)contentSizeDidChange
{
  return self->_contentSizeDidChange;
}

- (void)setContentSizeDidChange:(BOOL)a3
{
  self->_contentSizeDidChange = a3;
}

- (_UIMorphingPlatterAnimatableFloat)expansionProgress
{
  return self->_expansionProgress;
}

- (void)setExpansionProgress:(id)a3
{
}

- (_UIMorphingPlatterAnimatableFloat)platterWidth
{
  return self->_platterWidth;
}

- (void)setPlatterWidth:(id)a3
{
}

- (_UIMorphingPlatterAnimatableFloat)platterHeight
{
  return self->_platterHeight;
}

- (void)setPlatterHeight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterHeight, 0);
  objc_storeStrong((id *)&self->_platterWidth, 0);
  objc_storeStrong((id *)&self->_expansionProgress, 0);
  objc_storeStrong((id *)&self->_pathShadowView, 0);
  objc_storeStrong((id *)&self->_shadowViews, 0);
  objc_storeStrong((id *)&self->_expandedTransformView, 0);
  objc_storeStrong((id *)&self->_expandedClippingView, 0);
  objc_storeStrong((id *)&self->_collapsedTransformView, 0);
  objc_storeStrong((id *)&self->_collapsedClippingView, 0);
  objc_storeStrong(&self->_shouldApplyClippingHandler, 0);
  objc_storeStrong((id *)&self->_separatedOptions, 0);
  objc_storeStrong((id *)&self->_shadowSettings, 0);
  objc_storeStrong((id *)&self->_expandedPreview, 0);
  objc_storeStrong((id *)&self->_collapsedPreview, 0);
}

@end