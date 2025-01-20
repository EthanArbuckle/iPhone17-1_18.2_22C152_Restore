@interface _UIPlatterTransformView
- (BOOL)allowsUserInteraction;
- (BOOL)appliesMinificationFilter;
- (BOOL)forwardsHitTestingToSourceView;
- (BOOL)hidesSourceView;
- (BOOL)matchesAlpha;
- (BOOL)shouldTakeOwnershipOfSourceView;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UITargetedPreview)sourcePreview;
- (UIView)sourceView;
- (_UIMorphingPlatterBackgroundCaptureView)backgroundCaptureView;
- (_UIPlatterTransformView)initWithFrame:(CGRect)a3;
- (_UIPortalView)backgroundPortalView;
- (_UIPortalView)portalView;
- (void)_updateMinificationFilter;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)didTearOffForDrag;
- (void)layoutSubviews;
- (void)setAllowsUserInteraction:(BOOL)a3;
- (void)setAppliesMinificationFilter:(BOOL)a3;
- (void)setBackgroundCaptureView:(id)a3;
- (void)setBackgroundPortalView:(id)a3;
- (void)setForwardsHitTestingToSourceView:(BOOL)a3;
- (void)setHidesSourceView:(BOOL)a3;
- (void)setMatchesAlpha:(BOOL)a3;
- (void)setPortalView:(id)a3;
- (void)setShouldTakeOwnershipOfSourceView:(BOOL)a3;
- (void)setSourcePreview:(id)a3;
@end

@implementation _UIPlatterTransformView

- (_UIPlatterTransformView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIPlatterTransformView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 layer];
    objc_msgSend(v5, "setAnchorPoint:", 0.5, 0.0);

    [(UIView *)v4 setAutoresizesSubviews:0];
    [(UIView *)v4 _setShouldAdaptToMaterials:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(_UIPlatterTransformView *)self backgroundCaptureView];
  [v3 removeFromSuperview];

  v4.receiver = self;
  v4.super_class = (Class)_UIPlatterTransformView;
  [(UIView *)&v4 dealloc];
}

- (UIView)sourceView
{
  v2 = [(_UIPlatterTransformView *)self sourcePreview];
  v3 = [v2 view];

  return (UIView *)v3;
}

- (void)setSourcePreview:(id)a3
{
  v5 = (UITargetedPreview *)a3;
  p_sourcePreview = &self->_sourcePreview;
  if (self->_sourcePreview != v5)
  {
    v58 = v5;
    if ([(_UIPlatterTransformView *)self shouldTakeOwnershipOfSourceView])
    {
      objc_super v7 = [(UITargetedPreview *)*p_sourcePreview view];
      [v7 removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_sourcePreview, a3);
    if ([(_UIPlatterTransformView *)self allowsUserInteraction]) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = [(UITargetedPreview *)*p_sourcePreview _sourceViewIsInViewHierarchy] ^ 1;
    }
    [(_UIPlatterTransformView *)self setShouldTakeOwnershipOfSourceView:v8];
    [(UIView *)self bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    BOOL v17 = [(_UIPlatterTransformView *)self shouldTakeOwnershipOfSourceView];
    v18 = [(_UIPlatterTransformView *)self portalView];
    v19 = v18;
    if (v17)
    {
      [(UIView *)v18 removeFromSuperview];

      v19 = [(_UIPlatterTransformView *)self sourceView];
    }
    else
    {
      if (!v18)
      {
        v19 = -[_UIPortalView initWithFrame:]([_UIPortalView alloc], "initWithFrame:", v10, v12, v14, v16);
        [(_UIPortalView *)v19 setAllowsBackdropGroups:1];
        [(_UIPortalView *)v19 setHidesSourceView:[(_UIPlatterTransformView *)self hidesSourceView]];
        [(_UIPortalView *)v19 setMatchesAlpha:[(_UIPlatterTransformView *)self matchesAlpha]];
        [(_UIPortalView *)v19 setForwardsClientHitTestingToSourceView:[(_UIPlatterTransformView *)self forwardsHitTestingToSourceView]];
        v20 = [(_UIPlatterTransformView *)self sourceView];
        v21 = [v20 layer];
        uint64_t v22 = [v21 flipsHorizontalAxis];
        v23 = [(UIView *)v19 layer];
        [v23 setFlipsHorizontalAxis:v22];

        [(_UIPortalView *)v19 setName:@"_UIPlatterTransformView.content"];
        [(_UIPlatterTransformView *)self setPortalView:v19];
      }
      v24 = [(_UIPlatterTransformView *)self sourceView];
      [(_UIPortalView *)v19 setSourceView:v24];
    }
    [(UIView *)self addSubview:v19];

    [(UIView *)self sizeToFit];
    if ([(UITargetedPreview *)v58 _captureHierarchyBelowSourceView]
      && [(UITargetedPreview *)v58 _sourceViewIsInViewHierarchy])
    {
      v25 = [(_UIPlatterTransformView *)self backgroundCaptureView];

      if (!v25)
      {
        v26 = objc_opt_new();
        [(_UIPlatterTransformView *)self setBackgroundCaptureView:v26];

        v27 = [(_UIPlatterTransformView *)self backgroundCaptureView];
        [v27 setAlpha:0.002];
      }
      v28 = [(_UIPlatterTransformView *)self backgroundPortalView];

      if (!v28)
      {
        v29 = [_UIPortalView alloc];
        v30 = [(_UIPlatterTransformView *)self backgroundCaptureView];
        v31 = [(_UIPortalView *)v29 initWithSourceView:v30];
        [(_UIPlatterTransformView *)self setBackgroundPortalView:v31];

        v32 = [(_UIPlatterTransformView *)self backgroundPortalView];
        [v32 setName:@"_UIPlatterTransformView.backgroundCapture"];

        v33 = [(_UIPlatterTransformView *)self backgroundPortalView];
        [v33 setAllowsBackdropGroups:1];
      }
      v34 = [(UITargetedPreview *)v58 target];
      v35 = [v34 container];
      v36 = [(_UIPlatterTransformView *)self backgroundCaptureView];
      v37 = [(UITargetedPreview *)v58 view];
      [v35 insertSubview:v36 belowSubview:v37];

      v38 = [(_UIPlatterTransformView *)self backgroundPortalView];
      [(UIView *)self insertSubview:v38 atIndex:0];

      v39 = [(UITargetedPreview *)v58 view];
      [v39 frame];
      CGRect v61 = CGRectInset(v60, -50.0, 0.0);
      double x = v61.origin.x;
      double y = v61.origin.y;
      double width = v61.size.width;
      double height = v61.size.height;
      v44 = [(_UIPlatterTransformView *)self backgroundCaptureView];
      objc_msgSend(v44, "setFrame:", x, y, width, height);

      v45 = [(_UIPlatterTransformView *)self backgroundCaptureView];
      [v45 bounds];
      double v47 = v46;
      double v49 = v48;
      [(UIView *)self bounds];
      double v54 = round(v53 + v52 * 0.5 - v49 * 0.5);
      double v55 = round(v51 + v50 * 0.5 - v47 * 0.5);
      v56 = [(_UIPlatterTransformView *)self backgroundPortalView];
      objc_msgSend(v56, "setFrame:", v55, v54, v47, v49);
    }
    else
    {
      v57 = [(_UIPlatterTransformView *)self backgroundCaptureView];
      [v57 removeFromSuperview];

      v45 = [(_UIPlatterTransformView *)self backgroundPortalView];
      [v45 removeFromSuperview];
    }

    v5 = v58;
  }
}

- (void)didTearOffForDrag
{
  id v4 = [(_UIPlatterTransformView *)self sourceView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setHidesSourceView:0];
  }
  [(_UIPlatterTransformView *)self setHidesSourceView:0];
  v3 = [(_UIPlatterTransformView *)self backgroundCaptureView];
  [v3 removeFromSuperview];
}

- (void)layoutSubviews
{
  v48.receiver = self;
  v48.super_class = (Class)_UIPlatterTransformView;
  [(UIView *)&v48 layoutSubviews];
  if ([(_UIPlatterTransformView *)self shouldTakeOwnershipOfSourceView]) {
    [(_UIPlatterTransformView *)self sourceView];
  }
  else {
  v3 = [(_UIPlatterTransformView *)self portalView];
  }
  id v4 = [(_UIPlatterTransformView *)self sourcePreview];
  v5 = [v4 parameters];
  v6 = [v5 visiblePath];

  objc_super v7 = [(_UIPlatterTransformView *)self sourceView];
  id v8 = v6;
  id v9 = v7;
  double v10 = v9;
  if (v8)
  {
    if (([v8 _isRoundedRect] & 1) == 0)
    {

LABEL_11:
      v34 = [(_UIPlatterTransformView *)self sourceView];
      [v34 bounds];
      double v36 = v35;
      double v47 = v35;
      double v38 = v37;
      double v40 = v39;
      double v42 = v41;

      [v8 bounds];
      CGFloat x = v50.origin.x;
      CGFloat y = v50.origin.y;
      CGFloat width = v50.size.width;
      CGFloat height = v50.size.height;
      double v32 = v36 + v40 * 0.5 - CGRectGetMinX(v50);
      v51.origin.CGFloat x = x;
      v51.origin.CGFloat y = y;
      v51.size.CGFloat width = width;
      v51.size.CGFloat height = height;
      double v33 = v38 + v42 * 0.5 - CGRectGetMinY(v51);
      objc_msgSend(v3, "setBounds:", v47, v38, v40, v42);
      goto LABEL_12;
    }
    [v8 bounds];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    [v10 bounds];
    v52.origin.CGFloat x = v19;
    v52.origin.CGFloat y = v20;
    v52.size.CGFloat width = v21;
    v52.size.CGFloat height = v22;
    v49.origin.CGFloat x = v12;
    v49.origin.CGFloat y = v14;
    v49.size.CGFloat width = v16;
    v49.size.CGFloat height = v18;
    BOOL v23 = CGRectEqualToRect(v49, v52);

    if (!v23) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  [(UIView *)self bounds];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  objc_msgSend(v3, "setBounds:");
  double v32 = v25 + v29 * 0.5;
  double v33 = v27 + v31 * 0.5;
LABEL_12:
  objc_msgSend(v3, "setCenter:", v32, v33);
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPlatterTransformView;
  [(UIView *)&v6 didMoveToWindow];
  [(_UIPlatterTransformView *)self _updateMinificationFilter];
  v3 = [(UIView *)self window];

  if (!v3)
  {
    id v4 = [(_UIPlatterTransformView *)self backgroundCaptureView];
    [v4 removeFromSuperview];

    v5 = [(_UIPlatterTransformView *)self backgroundPortalView];
    [v5 removeFromSuperview];
  }
}

- (void)setHidesSourceView:(BOOL)a3
{
  if (self->_hidesSourceView != a3)
  {
    BOOL v3 = a3;
    self->_hidesSourceView = a3;
    id v4 = [(_UIPlatterTransformView *)self portalView];
    [v4 setHidesSourceView:v3];
  }
}

- (void)setForwardsHitTestingToSourceView:(BOOL)a3
{
  if (self->_forwardsHitTestingToSourceView != a3)
  {
    BOOL v3 = a3;
    self->_forwardsHitTestingToSourceView = a3;
    id v4 = [(_UIPlatterTransformView *)self portalView];
    [v4 setForwardsClientHitTestingToSourceView:v3];
  }
}

- (void)setMatchesAlpha:(BOOL)a3
{
  if (self->_matchesAlpha != a3)
  {
    BOOL v3 = a3;
    self->_matchesAlpha = a3;
    id v4 = [(_UIPlatterTransformView *)self portalView];
    [v4 setMatchesAlpha:v3];
  }
}

- (void)setAppliesMinificationFilter:(BOOL)a3
{
  if (self->_appliesMinificationFilter != a3)
  {
    self->_appliesMinificationFilter = a3;
    [(_UIPlatterTransformView *)self _updateMinificationFilter];
  }
}

- (void)_updateMinificationFilter
{
  BOOL v3 = [(UIView *)self window];

  if (v3)
  {
    BOOL v4 = [(_UIPlatterTransformView *)self appliesMinificationFilter];
    v5 = [(UIView *)self layer];
    objc_super v6 = v5;
    if (v4)
    {
      [v5 setShouldRasterize:1];

      objc_super v7 = [(UIView *)self window];
      id v8 = [v7 screen];
      [v8 scale];
      double v10 = v9;
      double v11 = [(UIView *)self layer];
      [v11 setRasterizationScale:v10];

      CGFloat v12 = (uint64_t *)MEMORY[0x1E4F39FE0];
    }
    else
    {
      [v5 setShouldRasterize:0];

      CGFloat v12 = (uint64_t *)MEMORY[0x1E4F3A238];
    }
    uint64_t v13 = *v12;
    id v14 = [(UIView *)self layer];
    [v14 setMinificationFilter:v13];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_super v6 = [(_UIPlatterTransformView *)self sourceView];

  if (v6)
  {
    objc_super v7 = [(_UIPlatterTransformView *)self sourcePreview];
    id v8 = [v7 parameters];
    double v9 = [v8 visiblePath];

    double v10 = [(_UIPlatterTransformView *)self sourceView];
    id v11 = v9;
    id v12 = v10;
    uint64_t v13 = v12;
    if (v11)
    {
      if (([v11 _isRoundedRect] & 1) == 0)
      {

LABEL_10:
        [v11 bounds];
        double v28 = v34;
        double v30 = v35;
        goto LABEL_11;
      }
      [v11 bounds];
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      [v13 bounds];
      v41.origin.CGFloat x = v22;
      v41.origin.CGFloat y = v23;
      v41.size.double width = v24;
      v41.size.double height = v25;
      v40.origin.CGFloat x = v15;
      v40.origin.CGFloat y = v17;
      v40.size.double width = v19;
      v40.size.double height = v21;
      BOOL v26 = CGRectEqualToRect(v40, v41);

      if (!v26) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    double v31 = [(_UIPlatterTransformView *)self sourceView];
    [v31 bounds];
    double v28 = v32;
    double v30 = v33;

LABEL_11:
    goto LABEL_12;
  }
  v38.receiver = self;
  v38.super_class = (Class)_UIPlatterTransformView;
  -[UIView sizeThatFits:](&v38, sel_sizeThatFits_, width, height);
  double v28 = v27;
  double v30 = v29;
LABEL_12:
  double v36 = v28;
  double v37 = v30;
  result.double height = v37;
  result.double width = v36;
  return result;
}

- (BOOL)hidesSourceView
{
  return self->_hidesSourceView;
}

- (BOOL)forwardsHitTestingToSourceView
{
  return self->_forwardsHitTestingToSourceView;
}

- (BOOL)matchesAlpha
{
  return self->_matchesAlpha;
}

- (BOOL)appliesMinificationFilter
{
  return self->_appliesMinificationFilter;
}

- (BOOL)allowsUserInteraction
{
  return self->_allowsUserInteraction;
}

- (void)setAllowsUserInteraction:(BOOL)a3
{
  self->_allowsUserInteraction = a3;
}

- (UITargetedPreview)sourcePreview
{
  return self->_sourcePreview;
}

- (_UIPortalView)portalView
{
  return self->_portalView;
}

- (void)setPortalView:(id)a3
{
}

- (BOOL)shouldTakeOwnershipOfSourceView
{
  return self->_shouldTakeOwnershipOfSourceView;
}

- (void)setShouldTakeOwnershipOfSourceView:(BOOL)a3
{
  self->_shouldTakeOwnershipOfSourceView = a3;
}

- (_UIPortalView)backgroundPortalView
{
  return self->_backgroundPortalView;
}

- (void)setBackgroundPortalView:(id)a3
{
}

- (_UIMorphingPlatterBackgroundCaptureView)backgroundCaptureView
{
  return self->_backgroundCaptureView;
}

- (void)setBackgroundCaptureView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundCaptureView, 0);
  objc_storeStrong((id *)&self->_backgroundPortalView, 0);
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_sourcePreview, 0);
}

@end