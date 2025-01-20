@interface _UIHighlightPlatterView
- (BOOL)_isEligibleForFocusOcclusion;
- (UITargetedPreview)targetedPreview;
- (UIView)backgroundView;
- (_UIHighlightPlatterView)initWithTargetedPreview:(id)a3;
- (_UIPlatterSoftShadowView)shadowView;
- (_UIPortalView)portalView;
- (double)backgroundAlpha;
- (double)shadowAlpha;
- (void)setBackgroundAlpha:(double)a3;
- (void)setBackgroundView:(id)a3;
- (void)setPortalView:(id)a3;
- (void)setShadowAlpha:(double)a3;
- (void)setShadowView:(id)a3;
- (void)setTargetedPreview:(id)a3;
@end

@implementation _UIHighlightPlatterView

- (_UIHighlightPlatterView)initWithTargetedPreview:(id)a3
{
  id v4 = a3;
  v5 = [v4 view];
  v6 = [v4 parameters];
  id v7 = [v6 visiblePath];

  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [v5 bounds];
  if (v7)
  {
    double v19 = v15;
    double v18 = v13;
    double v17 = 0.0;
    double v16 = 0.0;
  }
  v53.receiver = self;
  v53.super_class = (Class)_UIHighlightPlatterView;
  v20 = -[UIView initWithFrame:](&v53, sel_initWithFrame_, v16, v17, v18, v19, 0.0);
  v21 = v20;
  if (v20)
  {
    [(UIView *)v20 setUserInteractionEnabled:0];
    [(_UIHighlightPlatterView *)v21 setTargetedPreview:v4];
    if ([v4 _sourceViewIsInViewHierarchy])
    {
      v22 = [_UIPortalView alloc];
      [v5 bounds];
      v23 = -[_UIPortalView initWithFrame:](v22, "initWithFrame:");
      [(_UIPortalView *)v23 setName:@"_UIHighlightPlatterView.contentPortal"];
      v24 = [v4 view];
      [(_UIPortalView *)v23 setSourceView:v24];

      [(_UIPortalView *)v23 setHidesSourceView:1];
      [(_UIPortalView *)v23 setMatchesAlpha:1];
      [(UIView *)v23 setUserInteractionEnabled:0];
      [(_UIPortalView *)v23 setAllowsBackdropGroups:1];
      [(UIView *)v21 addSubview:v23];
      [(_UIHighlightPlatterView *)v21 setPortalView:v23];

      id v25 = [(_UIHighlightPlatterView *)v21 portalView];
    }
    else
    {
      [(UIView *)v21 addSubview:v5];
      id v25 = v5;
    }
    v26 = v25;
    v54.origin.x = v9;
    v54.origin.y = v11;
    v54.size.width = v13;
    v54.size.height = v15;
    double v27 = -CGRectGetMinX(v54);
    v55.origin.x = v9;
    v55.origin.y = v11;
    v55.size.width = v13;
    v55.size.height = v15;
    double v28 = -CGRectGetMinY(v55);
    if ([v4 _previewMode] != 4)
    {
      [v26 bounds];
      CGRect v57 = CGRectOffset(v56, v27, v28);
      objc_msgSend(v26, "setFrame:", v57.origin.x, v57.origin.y, v57.size.width, v57.size.height);
      if ([v4 _previewMode] != 5)
      {
        if (v7)
        {
          v29 = [_UIShapeView alloc];
          [v26 bounds];
          v30 = -[UIView initWithFrame:](v29, "initWithFrame:");
          id v7 = v7;
          uint64_t v31 = [v7 CGPath];
          v32 = [(_UIShapeView *)v30 shapeLayer];
          [v32 setPath:v31];

          -[UIView _setSafeMaskView:](v26, v30);
        }
        else
        {
          -[UIView _outlinePath](v5);
          id v7 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    v33 = [v4 parameters];
    int v34 = [v33 appliesShadow];

    if (v34)
    {
      v35 = [v4 parameters];
      uint64_t v36 = [v35 backgroundColor];

      v37 = [UIView alloc];
      v51 = (void *)v36;
      if (v7)
      {
        [(UIView *)v21 bounds];
        v38 = -[UIView initWithFrame:](v37, "initWithFrame:");
        [(UIView *)v38 setBackgroundColor:v36];
        [(UIView *)v38 setAlpha:0.0];
        v39 = [_UIShapeView alloc];
        [(UIView *)v38 bounds];
        v40 = -[UIView initWithFrame:](v39, "initWithFrame:");
        v41 = (void *)[v7 copy];
        CGAffineTransformMakeTranslation(&v52, v27, v28);
        [v41 applyTransform:&v52];
        id v42 = v41;
        uint64_t v43 = [v42 CGPath];
        v44 = [(_UIShapeView *)v40 shapeLayer];
        [v44 setPath:v43];

        [(UIView *)v38 setMaskView:v40];
      }
      else
      {
        [v26 frame];
        v38 = -[UIView initWithFrame:](v37, "initWithFrame:");
        [(UIView *)v38 setBackgroundColor:v36];
      }
      [(_UIHighlightPlatterView *)v21 setBackgroundView:v38];

      v45 = [v4 parameters];
      v46 = [v45 effectiveShadowPath];

      if (!v46)
      {
        v46 = -[UIView _outlinePath](v5);
      }
      v47 = [_UIPlatterSoftShadowView alloc];
      [v26 frame];
      v48 = -[_UIPlatterSoftShadowView initWithFrame:shadowPath:](v47, "initWithFrame:shadowPath:", v46);
      [(UIView *)v48 setAlpha:0.0];
      if ([v51 _isOpaque])
      {
        v49 = [v5 backgroundColor];
        -[_UIPlatterSoftShadowView setNeedsPunchOut:](v48, "setNeedsPunchOut:", [v49 _isOpaque] ^ 1);
      }
      else
      {
        [(_UIPlatterSoftShadowView *)v48 setNeedsPunchOut:1];
      }
      [(_UIHighlightPlatterView *)v21 setShadowView:v48];
    }
  }

  return v21;
}

- (void)setShadowAlpha:(double)a3
{
  if (self->_shadowAlpha != a3)
  {
    self->_double shadowAlpha = a3;
    id v4 = [(_UIHighlightPlatterView *)self shadowView];
    v5 = [v4 superview];

    if (!v5)
    {
      v6 = [(_UIHighlightPlatterView *)self shadowView];
      [(UIView *)self insertSubview:v6 atIndex:0];
    }
    double shadowAlpha = self->_shadowAlpha;
    id v8 = [(_UIHighlightPlatterView *)self shadowView];
    [v8 setAlpha:shadowAlpha];
  }
}

- (void)setBackgroundAlpha:(double)a3
{
  if (self->_backgroundAlpha != a3)
  {
    self->_double backgroundAlpha = a3;
    id v4 = [(_UIHighlightPlatterView *)self backgroundView];
    v5 = [v4 superview];

    if (!v5)
    {
      v6 = [(_UIHighlightPlatterView *)self shadowView];
      id v7 = [v6 superview];

      id v8 = [(_UIHighlightPlatterView *)self backgroundView];
      if (v7)
      {
        CGFloat v9 = [(_UIHighlightPlatterView *)self shadowView];
        [(UIView *)self insertSubview:v8 aboveSubview:v9];
      }
      else
      {
        [(UIView *)self insertSubview:v8 atIndex:0];
      }
    }
    double backgroundAlpha = self->_backgroundAlpha;
    id v11 = [(_UIHighlightPlatterView *)self backgroundView];
    [v11 setAlpha:backgroundAlpha];
  }
}

- (BOOL)_isEligibleForFocusOcclusion
{
  return 0;
}

- (double)shadowAlpha
{
  return self->_shadowAlpha;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (UITargetedPreview)targetedPreview
{
  return self->_targetedPreview;
}

- (void)setTargetedPreview:(id)a3
{
}

- (_UIPortalView)portalView
{
  return self->_portalView;
}

- (void)setPortalView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (_UIPlatterSoftShadowView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_targetedPreview, 0);
}

@end