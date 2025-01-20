@interface _UIPointerEffectPlatterView
- (BOOL)_isEligibleForFocusOcclusion;
- (BOOL)geometryFrozen;
- (BOOL)isPressed;
- (BOOL)isTintDisabled;
- (BOOL)useSoftShadow;
- (NSMutableArray)accessoryPortals;
- (UIPointerShape)tintViewShape;
- (UITargetedPreview)targetedPreview;
- (UIView)contentSourceView;
- (UIView)shadowView;
- (UIView)specularHighlight;
- (UIView)specularOverlayView;
- (_UILumaTrackingBackdropView)lumaTrackingView;
- (_UIPointerEffectPlatterView)initWithTargetedPreview:(id)a3;
- (_UIPointerEffectTintView)tintView;
- (_UIPortalView)contentPortalView;
- (double)shadowAlpha;
- (double)tintViewScale;
- (id)_newLumaTrackingViewForTintView:(id)a3;
- (id)_newShadowView;
- (id)_newTintView;
- (id)_specularOverlayView:(id)a3 withOptions:(unint64_t)a4;
- (id)tintColorMatrixProvider;
- (int64_t)tintMode;
- (unint64_t)specularOptions;
- (void)_installAccessoryView:(id)a3;
- (void)_layoutTintView;
- (void)_updateContentMask;
- (void)layoutSubviews;
- (void)setAccessoryPortals:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setContentPortalView:(id)a3;
- (void)setContentSourceView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGeometryFrozen:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setLumaTrackingView:(id)a3;
- (void)setPressed:(BOOL)a3;
- (void)setShadowAlpha:(double)a3;
- (void)setShadowView:(id)a3;
- (void)setSpecularHighlight:(id)a3;
- (void)setSpecularOptions:(unint64_t)a3;
- (void)setSpecularOverlayView:(id)a3;
- (void)setTargetedPreview:(id)a3;
- (void)setTintColorMatrixProvider:(id)a3;
- (void)setTintDisabled:(BOOL)a3;
- (void)setTintMode:(int64_t)a3;
- (void)setTintView:(id)a3;
- (void)setTintViewScale:(double)a3;
- (void)setTintViewShape:(id)a3;
- (void)setUseSoftShadow:(BOOL)a3;
@end

@implementation _UIPointerEffectPlatterView

- (_UIPointerEffectPlatterView)initWithTargetedPreview:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v4 size];
  v54.receiver = self;
  v54.super_class = (Class)_UIPointerEffectPlatterView;
  v9 = -[UIView initWithFrame:](&v54, sel_initWithFrame_, v5, v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    [(UIView *)v9 setUserInteractionEnabled:0];
    v11 = [(UIView *)v10 layer];
    [v11 setAllowsGroupBlending:0];

    [(_UIPointerEffectPlatterView *)v10 setTargetedPreview:v4];
    v10->_tintDisabled = 1;
    v12 = [v4 view];
    [v12 bounds];
    if ([v4 _sourceViewIsInViewHierarchy])
    {
      v13 = [[_UIPortalView alloc] initWithSourceView:v12];
      [(_UIPortalView *)v13 setName:@"_UIPointerEffectPlatterView.originalContent"];
      [(_UIPortalView *)v13 setHidesSourceView:1];
      [(_UIPortalView *)v13 setMatchesAlpha:1];
      [(_UIPortalView *)v13 setAllowsBackdropGroups:1];
      [(_UIPortalView *)v13 setAllowsHitTesting:1];
      v14 = [(UIView *)v13 layer];
      [v14 setAllowsGroupBlending:0];
    }
    else
    {
      v13 = v12;
    }
    [(_UIPointerEffectPlatterView *)v10 setContentSourceView:v13];
    v15 = [(_UIPointerEffectPlatterView *)v10 contentSourceView];
    [v15 frame];
    double v17 = v16;
    double v19 = v18;
    v20 = [(_UIPointerEffectPlatterView *)v10 contentSourceView];
    objc_msgSend(v20, "setFrame:", 0.0, 0.0, v17, v19);

    [(UIView *)v10 addSubview:v13];
    [(_UIPointerEffectPlatterView *)v10 _updateContentMask];
    v21 = [_UIPortalView alloc];
    v22 = [(_UIPointerEffectPlatterView *)v10 contentSourceView];
    v23 = [(_UIPortalView *)v21 initWithSourceView:v22];

    [(_UIPortalView *)v23 setName:@"_UIPointerEffectPlatterView.content"];
    [(_UIPortalView *)v23 setHidesSourceView:1];
    [(_UIPortalView *)v23 setMatchesPosition:1];
    [(_UIPortalView *)v23 setMatchesTransform:1];
    [(_UIPortalView *)v23 setMatchesAlpha:1];
    [(_UIPortalView *)v23 setAllowsBackdropGroups:1];
    [(_UIPortalView *)v23 setAllowsHitTesting:1];
    v24 = [(UIView *)v23 layer];
    [v24 setAllowsGroupBlending:0];

    [(_UIPointerEffectPlatterView *)v10 setContentPortalView:v23];
    v25 = [(_UIPointerEffectPlatterView *)v10 contentPortalView];
    [(UIView *)v10 addSubview:v25];

    v26 = [v4 _accessoryViews];
    uint64_t v27 = [v26 count];

    if (v27)
    {
      v47 = v13;
      v48 = v12;
      v28 = [MEMORY[0x1E4F1CA48] array];
      [(_UIPointerEffectPlatterView *)v10 setAccessoryPortals:v28];

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v29 = [v4 _accessoryViews];
      uint64_t v30 = [v29 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v51;
        do
        {
          uint64_t v33 = 0;
          do
          {
            if (*(void *)v51 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = *(void **)(*((void *)&v50 + 1) + 8 * v33);
            v35 = [v34 window];

            if (v35)
            {
              [(_UIPointerEffectPlatterView *)v10 _installAccessoryView:v34];
            }
            else if (os_variant_has_internal_diagnostics())
            {
              v37 = __UIFaultDebugAssertLog();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_1853B0000, v37, OS_LOG_TYPE_FAULT, "All of UITargetedPreview's _accessoryViews must be in a window.", buf, 2u);
              }
            }
            else
            {
              v36 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &initWithTargetedPreview____s_category) + 8);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1853B0000, v36, OS_LOG_TYPE_ERROR, "All of UITargetedPreview's _accessoryViews must be in a window.", buf, 2u);
              }
            }
            ++v33;
          }
          while (v31 != v33);
          uint64_t v38 = [v29 countByEnumeratingWithState:&v50 objects:v55 count:16];
          uint64_t v31 = v38;
        }
        while (v38);
      }

      v12 = v48;
      v13 = v47;
    }
    v39 = +[_UIPointerSettingsDomain rootSettings];
    int v40 = [v39 showEffectPlatter];

    if (v40)
    {
      v41 = +[UIColor greenColor];
      id v42 = [v41 colorWithAlphaComponent:0.75];
      uint64_t v43 = [v42 CGColor];
      v44 = [(UIView *)v10 layer];
      [v44 setBorderColor:v43];

      v45 = [(UIView *)v10 layer];
      [v45 setBorderWidth:1.0];
    }
  }

  return v10;
}

- (void)_installAccessoryView:(id)a3
{
  id v4 = a3;
  v13 = [[_UIPortalView alloc] initWithSourceView:v4];
  [(_UIPortalView *)v13 setName:@"_UIPointerEffectPlatterView.accessory"];
  [(_UIPortalView *)v13 setHidesSourceView:1];
  [(_UIPortalView *)v13 setMatchesAlpha:1];
  [(_UIPortalView *)v13 setAllowsBackdropGroups:1];
  double v5 = [v4 superview];
  [v4 center];
  double v7 = v6;
  double v9 = v8;

  v10 = [(_UIPointerEffectPlatterView *)self targetedPreview];
  v11 = [v10 view];
  objc_msgSend(v5, "convertPoint:toView:", v11, v7, v9);
  -[_UIPortalView setCenter:](v13, "setCenter:");

  v12 = [(_UIPointerEffectPlatterView *)self accessoryPortals];
  [v12 addObject:v13];

  [(UIView *)self addSubview:v13];
}

- (void)setTargetedPreview:(id)a3
{
  id v9 = a3;
  if (([v9 isEqual:self->_targetedPreview] & 1) == 0)
  {
    targetedPreview = self->_targetedPreview;
    if (!targetedPreview
      || ([(UITargetedPreview *)targetedPreview view],
          double v5 = objc_claimAutoreleasedReturnValue(),
          [v9 view],
          double v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          v5,
          v5 == v6))
    {
      double v7 = (UITargetedPreview *)[v9 copy];
      double v8 = self->_targetedPreview;
      self->_targetedPreview = v7;

      [(_UIPointerEffectPlatterView *)self _updateContentMask];
    }
  }
}

- (void)_updateContentMask
{
  id v13 = [(_UIPointerEffectPlatterView *)self targetedPreview];
  v3 = [(_UIPointerEffectPlatterView *)self contentSourceView];
  id v4 = [v13 parameters];
  double v5 = [v4 visiblePath];

  if (!v5 || [v13 _previewMode] == 4 || objc_msgSend(v13, "_previewMode") == 5)
  {
    [v3 setMaskView:0];
  }
  else
  {
    [v5 bounds];
    CGFloat v6 = -CGRectGetMinX(v15);
    [v5 bounds];
    CGFloat v7 = -CGRectGetMinY(v16);
    [v3 bounds];
    CGRect v18 = CGRectOffset(v17, v6, v7);
    objc_msgSend(v3, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
    double v8 = [_UIShapeView alloc];
    id v9 = [v13 view];
    [v9 bounds];
    v10 = -[UIView initWithFrame:](v8, "initWithFrame:");

    uint64_t v11 = [v5 CGPath];
    v12 = [(_UIShapeView *)v10 shapeLayer];
    [v12 setPath:v11];

    [v3 setMaskView:v10];
  }
}

- (void)setShadowAlpha:(double)a3
{
  if (self->_shadowAlpha != a3)
  {
    self->_double shadowAlpha = a3;
    if (a3 > 0.0)
    {
      id v4 = [(_UIPointerEffectPlatterView *)self shadowView];

      if (!v4)
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __46___UIPointerEffectPlatterView_setShadowAlpha___block_invoke;
        v7[3] = &unk_1E52D9F70;
        v7[4] = self;
        +[UIView performWithoutAnimation:v7];
      }
    }
    double shadowAlpha = self->_shadowAlpha;
    CGFloat v6 = [(_UIPointerEffectPlatterView *)self shadowView];
    [v6 setAlpha:shadowAlpha];
  }
}

- (void)setTintDisabled:(BOOL)a3
{
  if (self->_tintDisabled != a3)
  {
    BOOL v3 = a3;
    self->_tintDisabled = a3;
    id v4 = [(_UIPointerEffectPlatterView *)self tintView];
    [v4 setDisabled:v3];
  }
}

- (void)setTintMode:(int64_t)a3
{
  if (self->_tintMode != a3)
  {
    self->_tintMode = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __43___UIPointerEffectPlatterView_setTintMode___block_invoke;
    v3[3] = &unk_1E52D9F70;
    v3[4] = self;
    +[UIView performWithoutAnimation:v3];
  }
}

- (void)setTintViewScale:(double)a3
{
  if (vabdd_f64(a3, self->_tintViewScale) >= 2.22044605e-16)
  {
    self->_tintViewScale = a3;
    CGAffineTransformMakeScale(&v6, a3, a3);
    id v4 = [(_UIPointerEffectPlatterView *)self tintView];
    CGAffineTransform v5 = v6;
    [v4 setTransform:&v5];
  }
}

- (void)setTintViewShape:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_tintViewShape] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tintViewShape, a3);
    [(_UIPointerEffectPlatterView *)self _layoutTintView];
  }
}

- (void)setSpecularHighlight:(id)a3
{
  id v5 = (UIView *)a3;
  if (self->_specularHighlight != v5) {
    objc_storeStrong((id *)&self->_specularHighlight, a3);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52___UIPointerEffectPlatterView_setSpecularHighlight___block_invoke;
  v6[3] = &unk_1E52D9F70;
  v6[4] = self;
  +[UIView performWithoutAnimation:v6];
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    BOOL v3 = a3;
    self->_pressed = a3;
    id v4 = [(_UIPointerEffectPlatterView *)self tintView];
    [v4 setPressed:v3];
  }
}

- (void)layoutSubviews
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  v67.receiver = self;
  v67.super_class = (Class)_UIPointerEffectPlatterView;
  [(UIView *)&v67 layoutSubviews];
  int64_t v3 = [(_UIPointerEffectPlatterView *)self tintMode];
  if (v3 == 2)
  {
    CGFloat v7 = [(_UIPointerEffectPlatterView *)self tintView];
    double v8 = [(_UIPointerEffectPlatterView *)self contentPortalView];
    [(UIView *)self insertSubview:v7 belowSubview:v8];

    id v5 = [(_UIPointerEffectPlatterView *)self lumaTrackingView];
    [(UIView *)self sendSubviewToBack:v5];
  }
  else
  {
    if (v3 != 1) {
      goto LABEL_6;
    }
    id v4 = [(_UIPointerEffectPlatterView *)self tintView];
    [(UIView *)self bringSubviewToFront:v4];

    id v5 = [(_UIPointerEffectPlatterView *)self lumaTrackingView];
    CGAffineTransform v6 = [(_UIPointerEffectPlatterView *)self tintView];
    [(UIView *)self insertSubview:v5 belowSubview:v6];
  }
LABEL_6:
  id v9 = [(_UIPointerEffectPlatterView *)self lumaTrackingView];

  if (v9)
  {
    v10 = [(_UIPointerEffectPlatterView *)self lumaTrackingView];
    [v10 setPaused:0];
  }
  uint64_t v11 = [(_UIPointerEffectPlatterView *)self specularHighlight];

  if (v11)
  {
    v12 = [(_UIPointerEffectPlatterView *)self specularOverlayView];
    [(UIView *)self bringSubviewToFront:v12];
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v13 = [(_UIPointerEffectPlatterView *)self accessoryPortals];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v64;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v64 != v16) {
          objc_enumerationMutation(v13);
        }
        [(UIView *)self bringSubviewToFront:*(void *)(*((void *)&v63 + 1) + 8 * v17++)];
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v63 objects:v68 count:16];
    }
    while (v15);
  }

  [(UIView *)self bounds];
  double v20 = v19 + v18 * 0.5;
  double v23 = v22 + v21 * 0.5;
  v24 = [(_UIPointerEffectPlatterView *)self targetedPreview];
  v25 = [v24 parameters];

  v26 = [v25 effectiveShadowPath];
  uint64_t v27 = [v25 visiblePath];

  double v28 = v23;
  double v29 = v20;
  if (v26 != v27)
  {
    uint64_t v30 = [v25 effectiveShadowPath];
    [v30 bounds];
    double v29 = v32 + v31 * 0.5;
    double v28 = v34 + v33 * 0.5;
  }
  v35 = [v25 visiblePath];

  if (v35)
  {
    v36 = [v25 visiblePath];
    [v36 bounds];
    CGFloat v37 = -CGRectGetMinX(v70);

    uint64_t v38 = [v25 visiblePath];
    [v38 bounds];
    CGFloat v39 = -CGRectGetMinY(v71);

    int v40 = [(_UIPointerEffectPlatterView *)self contentSourceView];
    [v40 bounds];
    CGRect v73 = CGRectOffset(v72, v37, v39);
    double x = v73.origin.x;
    double y = v73.origin.y;
    double width = v73.size.width;
    double height = v73.size.height;
    v45 = [(_UIPointerEffectPlatterView *)self contentSourceView];
    objc_msgSend(v45, "setFrame:", x, y, width, height);
  }
  else
  {
    int v40 = [(_UIPointerEffectPlatterView *)self contentSourceView];
    objc_msgSend(v40, "setCenter:", v20, v23);
  }

  v46 = [(_UIPointerEffectPlatterView *)self shadowView];
  objc_msgSend(v46, "setCenter:", v29, v28);

  [(UIView *)self bounds];
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  v55 = [(_UIPointerEffectPlatterView *)self contentPortalView];
  objc_msgSend(v55, "setFrame:", v48, v50, v52, v54);

  uint64_t v56 = [(_UIPointerEffectPlatterView *)self specularOverlayView];
  if (([(_UIPointerEffectPlatterView *)self specularOptions] & 2) != 0)
  {
    v57 = [(_UIPointerEffectPlatterView *)self tintViewShape];
    [v57 rect];
    objc_msgSend(v56, "setFrame:");
    [v57 effectiveCornerRadius];
    double v59 = v58;
    v60 = [v56 layer];
    [v60 setCornerRadius:v59];

    v61 = [v57 cornerCurve];
    v62 = [v56 layer];
    [v62 setCornerCurve:v61];

    [v56 setClipsToBounds:1];
  }
  else
  {
    [(UIView *)self bounds];
    objc_msgSend(v56, "setFrame:");
  }
  [(_UIPointerEffectPlatterView *)self _layoutTintView];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(_UIPointerEffectPlatterView *)self geometryFrozen])
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIPointerEffectPlatterView;
    [(UIView *)&v5 setHidden:v3];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (![(_UIPointerEffectPlatterView *)self geometryFrozen])
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIPointerEffectPlatterView;
    -[UIView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (![(_UIPointerEffectPlatterView *)self geometryFrozen])
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIPointerEffectPlatterView;
    -[UIView setBounds:](&v8, sel_setBounds_, x, y, width, height);
  }
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(_UIPointerEffectPlatterView *)self geometryFrozen])
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIPointerEffectPlatterView;
    -[UIView setCenter:](&v6, sel_setCenter_, x, y);
  }
}

- (id)_newShadowView
{
  BOOL v3 = [(_UIPointerEffectPlatterView *)self targetedPreview];
  id v4 = [v3 parameters];

  objc_super v5 = [v4 effectiveShadowPath];
  objc_super v6 = (void *)[v5 copy];

  if (v6)
  {
    [v6 bounds];
    CGFloat v7 = -CGRectGetMinX(v21);
    [v6 bounds];
    CGFloat MinY = CGRectGetMinY(v22);
    CGAffineTransformMakeTranslation(&v20, v7, -MinY);
    [v6 applyTransform:&v20];
    id v9 = v6;
  }
  else
  {
    v10 = [(_UIPointerEffectPlatterView *)self targetedPreview];
    uint64_t v11 = [v10 view];
    [v11 _cornerRadius];

    [(UIView *)self bounds];
    id v9 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
  }
  v12 = [_UIRadiosityShadowView alloc];
  id v13 = [(_UIPointerEffectPlatterView *)self contentSourceView];
  uint64_t v14 = [(_UIRadiosityShadowView *)v12 initWithSourceView:v13 shadowPath:v9 isSoft:[(_UIPointerEffectPlatterView *)self useSoftShadow]];

  if (v6)
  {
    uint64_t v15 = 1;
  }
  else
  {
    uint64_t v16 = [v4 backgroundColor];
    [v16 alphaComponent];
    if (fabs(v17) < 2.22044605e-16)
    {
      uint64_t v15 = 0;
    }
    else
    {
      double v18 = [v4 backgroundColor];
      uint64_t v15 = [v18 _isOpaque] ^ 1;
    }
  }
  [(_UIRadiosityShadowView *)v14 setNeedsPunchout:v15];
  [(UIView *)v14 setAlpha:0.0];

  return v14;
}

- (id)_newTintView
{
  BOOL v3 = [_UIPointerEffectTintView alloc];
  id v4 = [(_UIPointerEffectPlatterView *)self tintColorMatrixProvider];
  objc_super v5 = [(_UIPointerEffectTintView *)v3 initWithTintColorMatrixProvider:v4];

  [(UIView *)v5 setClipsToBounds:1];
  [(_UIPointerEffectTintView *)v5 setDisabled:[(_UIPointerEffectPlatterView *)self isTintDisabled]];
  return v5;
}

- (void)_layoutTintView
{
  BOOL v3 = [(_UIPointerEffectPlatterView *)self tintView];
  if (v3)
  {
    id v4 = [(_UIPointerEffectPlatterView *)self targetedPreview];
    objc_super v5 = [v4 view];
    objc_super v6 = [v4 target];
    CGFloat v7 = [(_UIPointerEffectPlatterView *)self tintViewShape];
    objc_super v8 = v7;
    if (v7)
    {
      id v9 = [v7 path];
      v10 = (void *)[v9 copy];

      if (v10) {
        [v10 bounds];
      }
      else {
        [v8 rect];
      }
      double v29 = v11;
      double v28 = v12;
      double v18 = v13;
      double v20 = v14;
      [v8 effectiveCornerRadius];
      double v22 = v30;
      v26 = [v8 cornerCurve];
      BOOL v25 = v26 == (void *)*MEMORY[0x1E4F39EA8];
      uint64_t v27 = 15;
    }
    else
    {
      uint64_t v15 = [v4 parameters];
      uint64_t v16 = [v15 visiblePath];
      v10 = (void *)[v16 copy];

      [v4 size];
      double v18 = v17;
      double v20 = v19;
      [v5 _cornerRadius];
      double v22 = v21;
      double v23 = [v5 layer];
      v24 = [v23 cornerCurve];
      BOOL v25 = v24 == (void *)*MEMORY[0x1E4F39EA8];

      v26 = [v5 layer];
      uint64_t v27 = [v26 maskedCorners];
      double v28 = 0.0;
      double v29 = 0.0;
    }

    objc_msgSend(v3, "setCenter:", v29 + v18 * 0.5, v28 + v20 * 0.5);
    objc_msgSend(v3, "setBounds:", 0.0, 0.0, v18, v20);
    if (v10)
    {
      [v10 bounds];
      CGFloat v31 = -CGRectGetMinX(v38);
      [v10 bounds];
      CGFloat MinY = CGRectGetMinY(v39);
      CGAffineTransformMakeTranslation(&v37, v31, -MinY);
      [v10 applyTransform:&v37];
      double v33 = [_UIShapeView alloc];
      [v10 bounds];
      double v34 = -[UIView initWithFrame:](v33, "initWithFrame:");
      uint64_t v35 = [v10 CGPath];
      v36 = [(_UIShapeView *)v34 shapeLayer];
      [v36 setPath:v35];

      [v3 setMaskView:v34];
    }
    else
    {
      [v3 _setCornerRadius:v25 continuous:v27 maskedCorners:v22];
    }
  }
}

- (id)_newLumaTrackingViewForTintView:(id)a3
{
  id v3 = a3;
  id v4 = [_UILumaTrackingBackdropView alloc];
  [v3 frame];
  id v9 = -[_UILumaTrackingBackdropView initWithTransitionBoundaries:delegate:frame:](v4, "initWithTransitionBoundaries:delegate:frame:", v3, 0.4, 0.6, v5, v6, v7, v8);

  return v9;
}

- (id)_specularOverlayView:(id)a3 withOptions:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  double v7 = v6;
  if ((v4 & 2) != 0)
  {
    v10 = (UIView *)v6;
  }
  else
  {
    double v8 = [(_UIPointerEffectPlatterView *)self contentSourceView];
    id v9 = [UIView alloc];
    [v8 bounds];
    v10 = -[UIView initWithFrame:](v9, "initWithFrame:");
    double v11 = [(UIView *)v10 layer];
    [v11 setAllowsGroupBlending:0];

    double v12 = [UIView alloc];
    [(UIView *)v10 bounds];
    double v13 = -[UIView initWithFrame:](v12, "initWithFrame:");
    if (v4)
    {
      double v14 = [_UIPortalView alloc];
      [(UIView *)v13 bounds];
      uint64_t v15 = -[_UIPortalView initWithFrame:](v14, "initWithFrame:");
      [(_UIPortalView *)v15 setName:@"_UIPointerEffectPlatterView.specularOverlayMask"];
      [(_UIPortalView *)v15 setSourceView:v8];
      [(_UIPortalView *)v15 setMatchesAlpha:1];
      [(_UIPortalView *)v15 setMatchesPosition:1];
      [(_UIPortalView *)v15 setMatchesTransform:1];
      [(UIView *)v15 setUserInteractionEnabled:0];
      [(UIView *)v13 setMaskView:v15];
    }
    if ((v4 & 4) == 0)
    {
      uint64_t v16 = *MEMORY[0x1E4F3A2E8];
      double v17 = [(UIView *)v13 layer];
      [v17 setCompositingFilter:v16];
    }
    [(UIView *)v13 addSubview:v7];
    [(UIView *)v10 addSubview:v13];
  }
  return v10;
}

- (BOOL)_isEligibleForFocusOcclusion
{
  return 0;
}

- (UITargetedPreview)targetedPreview
{
  return self->_targetedPreview;
}

- (double)shadowAlpha
{
  return self->_shadowAlpha;
}

- (BOOL)isTintDisabled
{
  return self->_tintDisabled;
}

- (int64_t)tintMode
{
  return self->_tintMode;
}

- (double)tintViewScale
{
  return self->_tintViewScale;
}

- (UIPointerShape)tintViewShape
{
  return self->_tintViewShape;
}

- (UIView)specularHighlight
{
  return self->_specularHighlight;
}

- (unint64_t)specularOptions
{
  return self->_specularOptions;
}

- (void)setSpecularOptions:(unint64_t)a3
{
  self->_specularOptions = a3;
}

- (BOOL)useSoftShadow
{
  return self->_useSoftShadow;
}

- (void)setUseSoftShadow:(BOOL)a3
{
  self->_useSoftShadow = a3;
}

- (BOOL)geometryFrozen
{
  return self->_geometryFrozen;
}

- (void)setGeometryFrozen:(BOOL)a3
{
  self->_geometryFrozen = a3;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (id)tintColorMatrixProvider
{
  return self->_tintColorMatrixProvider;
}

- (void)setTintColorMatrixProvider:(id)a3
{
}

- (UIView)contentSourceView
{
  return self->_contentSourceView;
}

- (void)setContentSourceView:(id)a3
{
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (_UIPortalView)contentPortalView
{
  return self->_contentPortalView;
}

- (void)setContentPortalView:(id)a3
{
}

- (_UIPointerEffectTintView)tintView
{
  return self->_tintView;
}

- (void)setTintView:(id)a3
{
}

- (_UILumaTrackingBackdropView)lumaTrackingView
{
  return self->_lumaTrackingView;
}

- (void)setLumaTrackingView:(id)a3
{
}

- (UIView)specularOverlayView
{
  return self->_specularOverlayView;
}

- (void)setSpecularOverlayView:(id)a3
{
}

- (NSMutableArray)accessoryPortals
{
  return self->_accessoryPortals;
}

- (void)setAccessoryPortals:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryPortals, 0);
  objc_storeStrong((id *)&self->_specularOverlayView, 0);
  objc_storeStrong((id *)&self->_lumaTrackingView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_contentPortalView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_contentSourceView, 0);
  objc_storeStrong(&self->_tintColorMatrixProvider, 0);
  objc_storeStrong((id *)&self->_specularHighlight, 0);
  objc_storeStrong((id *)&self->_tintViewShape, 0);
  objc_storeStrong((id *)&self->_targetedPreview, 0);
}

@end