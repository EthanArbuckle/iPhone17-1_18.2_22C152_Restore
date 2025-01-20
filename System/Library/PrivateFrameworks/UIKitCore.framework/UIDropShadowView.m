@interface UIDropShadowView
- (BOOL)_effectiveInsetsContentViewForGrabber;
- (BOOL)_hasCreatedGrabbers;
- (BOOL)_hasGrabber;
- (BOOL)_insetsContentViewForGrabber;
- (BOOL)_isGrabber:(id)a3;
- (BOOL)_isGrabberBlurEnabled;
- (BOOL)_isGrabberLumaTrackingEnabled;
- (BOOL)masksTopCornersOnly;
- (BOOL)supportsShadow;
- (CGRect)_contentViewFrame;
- (NSArray)cornerClippingDescendants;
- (UIDropShadowView)initWithFrame:(CGRect)a3 independentCorners:(int64_t)a4 supportsShadow:(BOOL)a5 stylesSheetsAsCards:(BOOL)a6;
- (UIDropShadowViewDelegate)_delegate;
- (UIEdgeInsets)contentTouchInsets;
- (UIRectCornerRadii)environmentMatchingCornerRadii;
- (UIView)contentView;
- (UIView)deepestClippingView;
- (UIView)firstCornerClippingDescendant;
- (UIView)overlayView;
- (_UIGrabber)_bottomGrabber;
- (_UIGrabber)_topGrabber;
- (_UIRoundedRectShadowView)magicShadowView;
- (double)_grabberAlpha;
- (double)_grabberSpacing;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)_grabberEdge;
- (int64_t)independentCorners;
- (void)_grabberPrimaryAction;
- (void)_layoutGrabbers;
- (void)_setGrabberAlpha:(double)a3;
- (void)_setGrabberBlurEnabled:(BOOL)a3;
- (void)_setGrabberEdge:(int64_t)a3;
- (void)_setGrabberLumaTrackingEnabled:(BOOL)a3;
- (void)_setGrabberSpacing:(double)a3;
- (void)_setHasGrabber:(BOOL)a3;
- (void)_setInsetsContentViewForGrabber:(BOOL)a3;
- (void)didFinishRotation;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setContentTouchInsets:(UIEdgeInsets)a3;
- (void)setContentView:(id)a3;
- (void)setEnvironmentMatchingCornerRadii:(UIRectCornerRadii)a3;
- (void)setMagicShadowAlpha:(double)a3;
- (void)setMasksTopCornersOnly:(BOOL)a3;
- (void)setOverlayView:(id)a3;
- (void)set_delegate:(id)a3;
- (void)updateCornerClippingViews;
- (void)willBeginRotationWithOriginalBounds:(CGRect)a3 newBounds:(CGRect)a4;
@end

@implementation UIDropShadowView

uint64_t __35__UIDropShadowView__setHasGrabber___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutGrabbers];
}

- (void)setMagicShadowAlpha:(double)a3
{
  id v4 = [(UIDropShadowView *)self magicShadowView];
  [v4 setAlpha:a3];
}

- (void)setEnvironmentMatchingCornerRadii:(UIRectCornerRadii)a3
{
  if (self->_environmentMatchingCornerRadii.topLeft != a3.topLeft
    || self->_environmentMatchingCornerRadii.bottomLeft != a3.bottomLeft
    || self->_environmentMatchingCornerRadii.bottomRight != a3.bottomRight
    || self->_environmentMatchingCornerRadii.topRight != a3.topRight)
  {
    self->_environmentMatchingCornerRadii = a3;
    [(UIDropShadowView *)self updateCornerClippingViews];
  }
}

- (void)setContentTouchInsets:(UIEdgeInsets)a3
{
  self->_contentTouchInsets = a3;
}

- (_UIRoundedRectShadowView)magicShadowView
{
  return self->_magicShadowView;
}

- (void)_setInsetsContentViewForGrabber:(BOOL)a3
{
  if (self->__insetsContentViewForGrabber != a3)
  {
    self->__insetsContentViewForGrabber = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_setHasGrabber:(BOOL)a3
{
  if (self->__hasGrabber != a3)
  {
    self->__hasGrabber = a3;
    [(UIView *)self setNeedsLayout];
    if (self->__hasGrabber && ![(UIDropShadowView *)self _hasCreatedGrabbers])
    {
      id v4 = objc_alloc_init(_UIGrabber);
      topGrabber = self->__topGrabber;
      self->__topGrabber = v4;

      [(UIControl *)self->__topGrabber addTarget:self action:sel__grabberPrimaryAction forControlEvents:0x2000];
      [(UIView *)self addSubview:self->__topGrabber];
      v6 = objc_alloc_init(_UIGrabber);
      bottomGrabber = self->__bottomGrabber;
      self->__bottomGrabber = v6;

      [(UIControl *)self->__bottomGrabber addTarget:self action:sel__grabberPrimaryAction forControlEvents:0x2000];
      [(UIView *)self addSubview:self->__bottomGrabber];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __35__UIDropShadowView__setHasGrabber___block_invoke;
      v8[3] = &unk_1E52D9F70;
      v8[4] = self;
      +[UIView performWithoutAnimation:v8];
    }
  }
}

- (void)_setGrabberSpacing:(double)a3
{
  if (self->__grabberSpacing != a3)
  {
    self->__grabberSpacing = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_setGrabberEdge:(int64_t)a3
{
  if (self->__grabberEdge != a3)
  {
    self->__grabberEdge = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_setGrabberBlurEnabled:(BOOL)a3
{
  if (self->__grabberBlurEnabled != a3)
  {
    self->__grabberBlurEnabled = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_setGrabberAlpha:(double)a3
{
  if (self->__grabberAlpha != a3)
  {
    self->__grabberAlpha = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)UIDropShadowView;
  [(UIView *)&v3 didMoveToWindow];
  [(UIDropShadowView *)self updateCornerClippingViews];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)UIDropShadowView;
  [(UIView *)&v15 layoutSubviews];
  [(UIDropShadowView *)self _layoutGrabbers];
  if ([(UIDropShadowView *)self _insetsContentViewForGrabber])
  {
    [(UIDropShadowView *)self _contentViewFrame];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    v11 = [(UIDropShadowView *)self contentView];
    objc_msgSend(v11, "_setFrameIgnoringLayerTransform:", v4, v6, v8, v10);
  }
  BOOL v12 = [(UIDropShadowView *)self _effectiveInsetsContentViewForGrabber];
  if (v12)
  {
    v13 = +[UIColor systemBackgroundColor];
  }
  else
  {
    v13 = 0;
  }
  v14 = [(UIDropShadowView *)self deepestClippingView];
  [v14 setBackgroundColor:v13];

  if (v12) {
}
  }

- (void)setContentView:(id)a3
{
  v25[4] = *MEMORY[0x1E4F143B8];
  double v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    double v8 = [(UIView *)contentView superview];
    double v9 = [(UIDropShadowView *)self deepestClippingView];

    if (v8 == v9) {
      [(UIView *)*p_contentView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_contentView, a3);
    if (*p_contentView)
    {
      double v10 = [(UIDropShadowView *)self deepestClippingView];
      [v10 insertSubview:*p_contentView atIndex:0];

      if ([(UIView *)*p_contentView translatesAutoresizingMaskIntoConstraints])
      {
        [(UIView *)self bounds];
        -[UIView setFrame:](*p_contentView, "setFrame:");
        [(UIView *)*p_contentView setAutoresizingMask:18];
      }
      else
      {
        v20 = (void *)MEMORY[0x1E4F5B268];
        v24 = [(UIView *)*p_contentView leftAnchor];
        v23 = [(UIView *)self leftAnchor];
        v22 = [v24 constraintEqualToAnchor:v23];
        v25[0] = v22;
        v21 = [(UIView *)*p_contentView rightAnchor];
        v11 = [(UIView *)self rightAnchor];
        BOOL v12 = [v21 constraintEqualToAnchor:v11];
        v25[1] = v12;
        v13 = [(UIView *)*p_contentView topAnchor];
        v14 = [(UIView *)self topAnchor];
        objc_super v15 = [v13 constraintEqualToAnchor:v14];
        v25[2] = v15;
        v16 = [(UIView *)*p_contentView bottomAnchor];
        v17 = [(UIView *)self bottomAnchor];
        v18 = [v16 constraintEqualToAnchor:v17];
        v25[3] = v18;
        v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
        [v20 activateConstraints:v19];
      }
    }
  }
}

- (void)updateCornerClippingViews
{
  double v3 = [(UIView *)self window];
  double v4 = [v3 windowScene];
  double v5 = [v4 _effectiveUISettings];
  id v32 = [v5 cornerRadiusConfiguration];

  if ([(UIDropShadowView *)self supportsShadow])
  {
    double topLeft = self->_environmentMatchingCornerRadii.topLeft;
    if (topLeft == 1.79769313e308)
    {
      [v32 topLeft];
      double topLeft = v7;
    }
    double v8 = [(UIView *)self layer];
    [v8 setCornerRadius:topLeft];
  }
  switch([(UIDropShadowView *)self independentCorners])
  {
    case 0:
      BOOL v12 = [(UIDropShadowView *)self firstCornerClippingDescendant];
      double v16 = self->_environmentMatchingCornerRadii.topLeft;
      [v32 topLeft];
      setEnvironmentMatchingCornerRadius(v12, self, (uint64_t)&self->_environmentMatchingCornerRadii, v16, v17);
      goto LABEL_9;
    case 1:
    case 2:
      double v9 = [(UIDropShadowView *)self firstCornerClippingDescendant];
      double v10 = self->_environmentMatchingCornerRadii.topLeft;
      [v32 topLeft];
      setEnvironmentMatchingCornerRadius(v9, self, (uint64_t)&self->_environmentMatchingCornerRadii, v10, v11);

      BOOL v12 = [(UIDropShadowView *)self cornerClippingDescendants];
      v13 = [v12 objectAtIndexedSubscript:0];
      double bottomRight = self->_environmentMatchingCornerRadii.bottomRight;
      [v32 bottomRight];
      setEnvironmentMatchingCornerRadius(v13, self, (uint64_t)&self->_environmentMatchingCornerRadii.bottomRight, bottomRight, v15);

      goto LABEL_9;
    case 3:
      v18 = [(UIDropShadowView *)self firstCornerClippingDescendant];
      double v19 = self->_environmentMatchingCornerRadii.topLeft;
      [v32 topLeft];
      setEnvironmentMatchingCornerRadius(v18, self, (uint64_t)&self->_environmentMatchingCornerRadii, v19, v20);

      v21 = [(UIDropShadowView *)self cornerClippingDescendants];
      v22 = [v21 objectAtIndexedSubscript:0];
      double bottomLeft = self->_environmentMatchingCornerRadii.bottomLeft;
      [v32 bottomLeft];
      setEnvironmentMatchingCornerRadius(v22, self, (uint64_t)&self->_environmentMatchingCornerRadii.bottomLeft, bottomLeft, v24);

      v25 = [(UIDropShadowView *)self cornerClippingDescendants];
      v26 = [v25 objectAtIndexedSubscript:1];
      double v27 = self->_environmentMatchingCornerRadii.bottomRight;
      [v32 bottomRight];
      setEnvironmentMatchingCornerRadius(v26, self, (uint64_t)&self->_environmentMatchingCornerRadii.bottomRight, v27, v28);

      BOOL v12 = [(UIDropShadowView *)self cornerClippingDescendants];
      v29 = [v12 objectAtIndexedSubscript:2];
      double topRight = self->_environmentMatchingCornerRadii.topRight;
      [v32 topRight];
      setEnvironmentMatchingCornerRadius(v29, self, (uint64_t)&self->_environmentMatchingCornerRadii.topRight, topRight, v31);

LABEL_9:
      break;
    default:
      break;
  }
}

- (UIView)deepestClippingView
{
  double v3 = [(UIDropShadowView *)self cornerClippingDescendants];
  double v4 = [v3 lastObject];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(UIDropShadowView *)self firstCornerClippingDescendant];
  }
  double v7 = v6;

  return (UIView *)v7;
}

- (UIView)firstCornerClippingDescendant
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firstCornerClippingDescendant);
  return (UIView *)WeakRetained;
}

- (NSArray)cornerClippingDescendants
{
  return self->_cornerClippingDescendants;
}

- (BOOL)supportsShadow
{
  return self->_supportsShadow;
}

- (int64_t)independentCorners
{
  return self->_independentCorners;
}

- (void)_layoutGrabbers
{
  if ([(UIDropShadowView *)self _hasCreatedGrabbers])
  {
    [(UIView *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    int64_t v11 = [(UIDropShadowView *)self _grabberEdge];
    [(UIDropShadowView *)self _grabberAlpha];
    double v13 = v12;
    [(UIDropShadowView *)self _grabberSpacing];
    double v15 = v14;
    v27.origin.x = v4;
    v27.origin.y = v6;
    v27.size.width = v8;
    v27.size.height = v10;
    double MidX = CGRectGetMidX(v27);
    BOOL v17 = [(UIDropShadowView *)self _isGrabberLumaTrackingEnabled];
    BOOL v18 = [(UIDropShadowView *)self _isGrabberBlurEnabled];
    double v19 = [(UIDropShadowView *)self _topGrabber];
    id v25 = v19;
    if (v11) {
      double v20 = 0.0;
    }
    else {
      double v20 = v13;
    }
    [v19 setAlpha:v20];
    [v25 sizeToFit];
    [v25 bounds];
    objc_msgSend(v25, "setCenter:", MidX, v15 + CGRectGetHeight(v28) * 0.5);
    [v25 _setLumaTrackingEnabled:v17];
    [v25 _setBlurEnabled:v18];
    v21 = [(UIDropShadowView *)self _bottomGrabber];
    v22 = v21;
    if (v11 == 1) {
      double v23 = v13;
    }
    else {
      double v23 = 0.0;
    }
    [v21 setAlpha:v23];
    [v22 sizeToFit];
    v29.origin.x = v4;
    v29.origin.y = v6;
    v29.size.width = v8;
    v29.size.height = v10;
    CGFloat v24 = CGRectGetHeight(v29) - v15;
    [v22 bounds];
    objc_msgSend(v22, "setCenter:", MidX, v24 - CGRectGetHeight(v30) * 0.5);
    [v22 _setLumaTrackingEnabled:v17];
    [v22 _setBlurEnabled:v18];
  }
}

- (BOOL)_hasCreatedGrabbers
{
  return self->__topGrabber || self->__bottomGrabber != 0;
}

- (BOOL)_effectiveInsetsContentViewForGrabber
{
  BOOL v3 = [(UIDropShadowView *)self _insetsContentViewForGrabber];
  if (v3)
  {
    LOBYTE(v3) = [(UIDropShadowView *)self _hasGrabber];
  }
  return v3;
}

- (BOOL)_insetsContentViewForGrabber
{
  return self->__insetsContentViewForGrabber;
}

- (_UIGrabber)_topGrabber
{
  return self->__topGrabber;
}

- (BOOL)_isGrabberLumaTrackingEnabled
{
  return self->__grabberLumaTrackingEnabled;
}

- (BOOL)_isGrabberBlurEnabled
{
  return self->__grabberBlurEnabled;
}

- (double)_grabberSpacing
{
  return self->__grabberSpacing;
}

- (int64_t)_grabberEdge
{
  return self->__grabberEdge;
}

- (double)_grabberAlpha
{
  return self->__grabberAlpha;
}

- (_UIGrabber)_bottomGrabber
{
  return self->__bottomGrabber;
}

- (void)set_delegate:(id)a3
{
}

- (UIDropShadowView)initWithFrame:(CGRect)a3 independentCorners:(int64_t)a4 supportsShadow:(BOOL)a5 stylesSheetsAsCards:(BOOL)a6
{
  BOOL v7 = a5;
  v62[1] = *MEMORY[0x1E4F143B8];
  v59.receiver = self;
  v59.super_class = (Class)UIDropShadowView;
  double v9 = -[UIView initWithFrame:](&v59, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGFloat v10 = v9;
  if (!v9) {
    return v10;
  }
  v9->_supportsShadow = v7;
  v9->_independentCorners = a4;
  v9->__grabberSpacing = 5.0;
  v9->__grabberBlurEnabled = 1;
  uint64_t v11 = *MEMORY[0x1E4F39EA8];
  double v12 = [(UIView *)v9 layer];
  [v12 setCornerCurve:v11];

  if (v7)
  {
    double v13 = [[_UIRoundedRectShadowView alloc] initWithCornerRadius:10.0];
    magicShadowView = v10->_magicShadowView;
    v10->_magicShadowView = v13;

    [(UIView *)v10->_magicShadowView setUserInteractionEnabled:0];
    double v15 = [(UIView *)v10->_magicShadowView layer];
    [v15 setAllowsHitTesting:0];

    [(_UIShadowView *)v10->_magicShadowView setUseLowerIntensity:1];
    double v16 = v10->_magicShadowView;
    [(UIView *)v10 bounds];
    -[_UIRoundedRectShadowView frameWithContentWithFrame:](v16, "frameWithContentWithFrame:");
    -[UIImageView setFrame:](v10->_magicShadowView, "setFrame:");
    [(UIView *)v10->_magicShadowView setAutoresizingMask:18];
    [(UIView *)v10 addSubview:v10->_magicShadowView];
    BOOL v17 = objc_alloc_init(UIView);
    [(UIView *)v17 setAutoresizingMask:18];
    BOOL v18 = [(UIView *)v17 layer];
    [v18 setCornerCurve:v11];

    [(UIView *)v10 addSubview:v17];
    objc_storeWeak((id *)&v10->_firstCornerClippingDescendant, v17);
  }
  else
  {
    objc_storeWeak((id *)&v10->_firstCornerClippingDescendant, v10);
  }
  if (a4 == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v10->_firstCornerClippingDescendant);
    CGRect v28 = [WeakRetained layer];
    [v28 setMaskedCorners:1];

    v21 = objc_alloc_init(UIView);
    [(UIView *)v21 setAutoresizingMask:18];
    CGRect v29 = [(UIView *)v21 layer];
    [v29 setCornerCurve:v11];

    CGRect v30 = [(UIView *)v21 layer];
    [v30 setMaskedCorners:4];

    id v31 = objc_loadWeakRetained((id *)&v10->_firstCornerClippingDescendant);
    [v31 addSubview:v21];

    id v32 = objc_alloc_init(UIView);
    [(UIView *)v32 setAutoresizingMask:18];
    v33 = [(UIView *)v32 layer];
    [v33 setCornerCurve:v11];

    v34 = [(UIView *)v32 layer];
    [v34 setMaskedCorners:8];

    [(UIView *)v21 addSubview:v32];
    v35 = objc_alloc_init(UIView);
    [(UIView *)v35 setAutoresizingMask:18];
    v36 = [(UIView *)v35 layer];
    [v36 setCornerCurve:v11];

    v37 = [(UIView *)v35 layer];
    [v37 setMaskedCorners:2];

    [(UIView *)v32 addSubview:v35];
    v60[0] = v21;
    v60[1] = v32;
    v60[2] = v35;
    uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:3];
    cornerClippingDescendants = v10->_cornerClippingDescendants;
    v10->_cornerClippingDescendants = (NSArray *)v38;
  }
  else
  {
    if (a4 == 2)
    {
      id v40 = objc_loadWeakRetained((id *)&v10->_firstCornerClippingDescendant);
      v41 = [v40 layer];
      [v41 setMaskedCorners:3];

      v21 = objc_alloc_init(UIView);
      [(UIView *)v21 setAutoresizingMask:18];
      v42 = [(UIView *)v21 layer];
      [v42 setCornerCurve:v11];

      v43 = [(UIView *)v21 layer];
      [v43 setMaskedCorners:12];

      id v44 = objc_loadWeakRetained((id *)&v10->_firstCornerClippingDescendant);
      [v44 addSubview:v21];

      v61 = v21;
      id v25 = (void *)MEMORY[0x1E4F1C978];
      v26 = &v61;
    }
    else
    {
      if (a4 != 1) {
        goto LABEL_13;
      }
      id v19 = objc_loadWeakRetained((id *)&v10->_firstCornerClippingDescendant);
      double v20 = [v19 layer];
      [v20 setMaskedCorners:5];

      v21 = objc_alloc_init(UIView);
      [(UIView *)v21 setAutoresizingMask:18];
      v22 = [(UIView *)v21 layer];
      [v22 setCornerCurve:v11];

      double v23 = [(UIView *)v21 layer];
      [v23 setMaskedCorners:10];

      id v24 = objc_loadWeakRetained((id *)&v10->_firstCornerClippingDescendant);
      [v24 addSubview:v21];

      v62[0] = v21;
      id v25 = (void *)MEMORY[0x1E4F1C978];
      v26 = (UIView **)v62;
    }
    uint64_t v45 = [v25 arrayWithObjects:v26 count:1];
    id v32 = (UIView *)v10->_cornerClippingDescendants;
    v10->_cornerClippingDescendants = (NSArray *)v45;
  }

LABEL_13:
  double v46 = *MEMORY[0x1E4F1DB30];
  double v47 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  v48 = [(UIView *)v10 layer];
  objc_msgSend(v48, "setShadowOffset:", v46, v47);

  v49 = [(UIView *)v10 layer];
  [v49 setShadowRadius:2.0];

  v50 = [(UIView *)v10 layer];
  [v50 setShadowPathIsBounds:1];

  id v51 = +[UIColor _dimmingViewColor];
  uint64_t v52 = [v51 CGColor];
  v53 = [(UIView *)v10 layer];
  [v53 setShadowColor:v52];

  if (!a6)
  {
    if (dyld_program_sdk_at_least())
    {
      v54 = [(UIView *)v10 layer];
      v55 = v54;
      double v56 = 13.0;
    }
    else
    {
      if (!dyld_program_sdk_at_least())
      {
LABEL_19:
        [(UIView *)v10 setClipsToBounds:dyld_program_sdk_at_least()];
        v57 = +[UIColor lightGrayColor];
        [(UIView *)v10 setBackgroundColor:v57];

        return v10;
      }
      v54 = [(UIView *)v10 layer];
      v55 = v54;
      double v56 = 6.0;
    }
    [v54 setCornerRadius:v56];

    goto LABEL_19;
  }
  return v10;
}

- (void)setOverlayView:(id)a3
{
  v31[4] = *MEMORY[0x1E4F143B8];
  double v5 = (UIView *)a3;
  p_overlayView = &self->_overlayView;
  overlayView = self->_overlayView;
  if (overlayView != v5)
  {
    CGFloat v8 = [(UIView *)overlayView superview];
    double v9 = [(UIDropShadowView *)self deepestClippingView];

    if (v8 == v9) {
      [(UIView *)*p_overlayView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_overlayView, a3);
    if (*p_overlayView)
    {
      CGFloat v10 = [(UIDropShadowView *)self deepestClippingView];
      [v10 addSubview:*p_overlayView];

      if ([(UIView *)*p_overlayView translatesAutoresizingMaskIntoConstraints])
      {
        [(UIView *)self bounds];
        CGFloat x = v32.origin.x;
        CGFloat y = v32.origin.y;
        CGFloat width = v32.size.width;
        CGFloat height = v32.size.height;
        CGFloat v15 = -CGRectGetWidth(v32);
        v33.origin.CGFloat x = x;
        v33.origin.CGFloat y = y;
        v33.size.CGFloat width = width;
        v33.size.CGFloat height = height;
        CGFloat v16 = -CGRectGetHeight(v33);
        v34.origin.CGFloat x = x;
        v34.origin.CGFloat y = y;
        v34.size.CGFloat width = width;
        v34.size.CGFloat height = height;
        CGRect v35 = CGRectInset(v34, v15, v16);
        -[UIView setFrame:](*p_overlayView, "setFrame:", v35.origin.x, v35.origin.y, v35.size.width, v35.size.height);
        [(UIView *)*p_overlayView setAutoresizingMask:18];
      }
      else
      {
        v26 = (void *)MEMORY[0x1E4F5B268];
        CGRect v30 = [(UIView *)*p_overlayView centerXAnchor];
        CGRect v29 = [(UIView *)self centerXAnchor];
        CGRect v28 = [v30 constraintEqualToAnchor:v29];
        v31[0] = v28;
        CGRect v27 = [(UIView *)*p_overlayView centerYAnchor];
        BOOL v17 = [(UIView *)self centerYAnchor];
        BOOL v18 = [v27 constraintEqualToAnchor:v17];
        v31[1] = v18;
        id v19 = [(UIView *)*p_overlayView widthAnchor];
        double v20 = [(UIView *)self widthAnchor];
        v21 = [v19 constraintEqualToAnchor:v20 multiplier:3.0];
        v31[2] = v21;
        v22 = [(UIView *)*p_overlayView heightAnchor];
        double v23 = [(UIView *)self heightAnchor];
        id v24 = [v22 constraintEqualToAnchor:v23 multiplier:3.0];
        v31[3] = v24;
        id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
        [v26 activateConstraints:v25];
      }
    }
  }
}

- (void)_setGrabberLumaTrackingEnabled:(BOOL)a3
{
  if (self->__grabberLumaTrackingEnabled != a3)
  {
    self->__grabberLumaTrackingEnabled = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magicShadowView, 0);
  objc_storeStrong((id *)&self->__bottomGrabber, 0);
  objc_storeStrong((id *)&self->__topGrabber, 0);
  objc_storeStrong((id *)&self->_cornerClippingDescendants, 0);
  objc_destroyWeak((id *)&self->_firstCornerClippingDescendant);
  objc_destroyWeak((id *)&self->__delegate);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (CGRect)_contentViewFrame
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(UIDropShadowView *)self _effectiveInsetsContentViewForGrabber])
  {
    [(UIDropShadowView *)self _grabberSpacing];
    double v12 = v11 + v11;
    [(UIView *)self safeAreaInsets];
    double v14 = v13;
    double v16 = v15;
    int64_t v17 = [(UIDropShadowView *)self _grabberEdge];
    if (v17 == 1)
    {
      double v20 = [(UIDropShadowView *)self _bottomGrabber];
      [v20 bounds];
      double v18 = v12 + v16 + CGRectGetHeight(v26);
      double v19 = 0.0;
    }
    else
    {
      double v18 = 0.0;
      double v19 = 0.0;
      if (v17)
      {
LABEL_7:
        double v4 = v4 + 0.0;
        double v6 = v6 + v19;
        double v10 = v10 - (v18 + v19);
        goto LABEL_8;
      }
      double v20 = [(UIDropShadowView *)self _topGrabber];
      [v20 bounds];
      double v19 = v12 + v14 + CGRectGetHeight(v25);
    }

    goto LABEL_7;
  }
LABEL_8:
  double v21 = v4;
  double v22 = v6;
  double v23 = v8;
  double v24 = v10;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (BOOL)_isGrabber:(id)a3
{
  id v4 = a3;
  id v5 = [(UIDropShadowView *)self _topGrabber];
  if (v5 == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v6 = [(UIDropShadowView *)self _bottomGrabber];
    BOOL v7 = v6 == v4;
  }
  return v7;
}

- (void)_grabberPrimaryAction
{
  id v3 = [(UIDropShadowView *)self _delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 _dropShadowViewGrabberDidTriggerPrimaryAction:self];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(UIDropShadowView *)self _topGrabber];
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  double v9 = objc_msgSend(v8, "hitTest:withEvent:", v7);
  double v10 = v9;
  if (v9)
  {
    double v11 = v9;
    goto LABEL_13;
  }
  double v12 = [(UIDropShadowView *)self _bottomGrabber];
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v12, x, y);
  double v13 = objc_msgSend(v12, "hitTest:withEvent:", v7);
  double v14 = v13;
  if (!v13)
  {
    v33.receiver = self;
    v33.super_class = (Class)UIDropShadowView;
    -[UIView hitTest:withEvent:](&v33, sel_hitTest_withEvent_, v7, x, y);
    double v15 = (UIDropShadowView *)objc_claimAutoreleasedReturnValue();
    if (v15 != self)
    {
      double v16 = [(UIDropShadowView *)self contentView];
      if ([(UIView *)v15 isDescendantOfView:v16])
      {
        [(UIView *)self bounds];
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        [(UIDropShadowView *)self contentTouchInsets];
        CGFloat v26 = v20 + v25;
        CGFloat v29 = v22 - (v27 + v28);
        v36.size.CGFloat height = v24 - (v25 + v30);
        v36.origin.double x = v18 + v27;
        v36.origin.double y = v26;
        v36.size.CGFloat width = v29;
        v35.double x = x;
        v35.double y = y;
        BOOL v31 = CGRectContainsPoint(v36, v35);

        if (!v31) {
          goto LABEL_8;
        }
      }
      else
      {
      }
      double v11 = v15;
      goto LABEL_11;
    }
LABEL_8:
    double v11 = 0;
LABEL_11:

    goto LABEL_12;
  }
  double v11 = v13;
LABEL_12:

LABEL_13:
  return v11;
}

- (void)setMasksTopCornersOnly:(BOOL)a3
{
  self->_masksTopCornersOnldouble y = a3;
  if (a3) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 15;
  }
  id v4 = [(UIView *)self layer];
  [v4 setMaskedCorners:v3];
}

- (void)willBeginRotationWithOriginalBounds:(CGRect)a3 newBounds:(CGRect)a4
{
  if (a3.size.width == a4.size.width && a3.size.height == a4.size.height)
  {
    id v9 = [(UIView *)self->_contentView layer];
    id v6 = +[UIDevice currentDevice];
    uint64_t v7 = [v6 _graphicsQuality];

    if (v7 != 100)
    {
      double v8 = +[UIScreen mainScreen];
      [v8 scale];
      objc_msgSend(v9, "setRasterizationScale:");

      [v9 setShouldRasterize:1];
    }
    [v9 setFrozen:1];
  }
}

- (void)didFinishRotation
{
  id v2 = [(UIView *)self->_contentView layer];
  [v2 setFrozen:0];
  [v2 setShouldRasterize:0];
}

- (UIRectCornerRadii)environmentMatchingCornerRadii
{
  double topLeft = self->_environmentMatchingCornerRadii.topLeft;
  double bottomLeft = self->_environmentMatchingCornerRadii.bottomLeft;
  double bottomRight = self->_environmentMatchingCornerRadii.bottomRight;
  double topRight = self->_environmentMatchingCornerRadii.topRight;
  result.double topRight = topRight;
  result.double bottomRight = bottomRight;
  result.double bottomLeft = bottomLeft;
  result.double topLeft = topLeft;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (BOOL)_hasGrabber
{
  return self->__hasGrabber;
}

- (UIEdgeInsets)contentTouchInsets
{
  double top = self->_contentTouchInsets.top;
  double left = self->_contentTouchInsets.left;
  double bottom = self->_contentTouchInsets.bottom;
  double right = self->_contentTouchInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIDropShadowViewDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__delegate);
  return (UIDropShadowViewDelegate *)WeakRetained;
}

- (BOOL)masksTopCornersOnly
{
  return self->_masksTopCornersOnly;
}

@end