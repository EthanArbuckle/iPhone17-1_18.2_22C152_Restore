@interface _UITextLightLoupeView
- (BOOL)needsHideLoupe:(CGRect)a3;
- (BOOL)visible;
- (CGPoint)constrainedModelPositionForPosition:(CGPoint)a3;
- (CGPoint)modelPosition;
- (CGSize)preferredSize;
- (UICoordinateSpace)containerCoordinateSpace;
- (_UITextLightLoupeView)initWithSourceView:(id)a3;
- (_UITextSelectionWidgetAnimating)animatableSelectionWidget;
- (double)_visualOffset;
- (double)dismissalProgress;
- (id)_backgroundColorIfNecessary;
- (void)_displayLinkFired:(id)a3;
- (void)_stopDisplayLink;
- (void)_updateColorsForCurrentTraitCollection;
- (void)layoutSubviews;
- (void)removeFromSuperview;
- (void)setDismissalProgress:(double)a3;
- (void)setModelPosition:(CGPoint)a3;
- (void)setVisible:(BOOL)a3;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation _UITextLightLoupeView

- (_UITextLightLoupeView)initWithSourceView:(id)a3
{
  v87[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v86.receiver = self;
  v86.super_class = (Class)_UITextLightLoupeView;
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9 = -[UIView initWithFrame:](&v86, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_sourceView, v4);
    id v11 = +[UIColor blackColor];
    v74 = v4;
    uint64_t v12 = [v11 CGColor];
    v13 = [(UIView *)v10 layer];
    [v13 setShadowColor:v12];

    v14 = [(UIView *)v10 layer];
    objc_msgSend(v14, "setShadowOffset:", 0.0, 2.0);

    v15 = [(UIView *)v10 layer];
    [v15 setShadowRadius:22.0];

    v16 = [(UIView *)v10 layer];
    LODWORD(v17) = 1036831949;
    [v16 setShadowOpacity:v17];

    v18 = [UIView alloc];
    [(UIView *)v10 bounds];
    uint64_t v19 = -[UIView initWithFrame:](v18, "initWithFrame:");
    maskView = v10->_maskView;
    v10->_maskView = (UIView *)v19;

    uint64_t v21 = *MEMORY[0x1E4F39EA8];
    v22 = [(UIView *)v10->_maskView layer];
    [v22 setCornerCurve:v21];

    v23 = [(UIView *)v10->_maskView layer];
    [v23 setMasksToBounds:1];

    v24 = [(UIView *)v10->_maskView layer];
    [v24 setCornerRadius:22.0];

    v25 = [(UIView *)v10->_maskView layer];
    [v25 setBorderWidth:0.66];

    [(UIView *)v10 addSubview:v10->_maskView];
    v26 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v5, v6, v7, v8);
    portalContainerView = v10->_portalContainerView;
    v10->_portalContainerView = v26;

    double v28 = *MEMORY[0x1E4F1DAD8];
    double v29 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    v30 = [(UIView *)v10->_portalContainerView layer];
    objc_msgSend(v30, "setAnchorPoint:", v28, v29);

    [(UIView *)v10->_maskView addSubview:v10->_portalContainerView];
    v31 = [v74 window];
    v32 = [UIView alloc];
    [v31 frame];
    uint64_t v33 = -[UIView initWithFrame:](v32, "initWithFrame:");
    backgroundView = v10->_backgroundView;
    v10->_backgroundView = (UIView *)v33;

    v35 = [(_UITextLightLoupeView *)v10 _backgroundColorIfNecessary];
    [(UIView *)v10->_backgroundView setBackgroundColor:v35];

    [(UIView *)v10->_portalContainerView addSubview:v10->_backgroundView];
    v75[0] = 0;
    v75[1] = 0;
    int v76 = 1065353216;
    uint64_t v78 = 0;
    uint64_t v77 = 0;
    int v79 = 1065353216;
    uint64_t v80 = 0;
    uint64_t v81 = 0;
    int v82 = 1065353216;
    uint64_t v83 = 0;
    int v84 = 0;
    uint64_t v85 = 0x3E6B851FBE6B851FLL;
    uint64_t v36 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v75];
    v37 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A038]];
    v73 = (void *)v36;
    [v37 setValue:v36 forKey:*MEMORY[0x1E4F3A168]];
    v38 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v38 setValue:&unk_1ED3F2388 forKey:*MEMORY[0x1E4F3A1D8]];
    v39 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v5, v6, v7, v8);
    glowView = v10->_glowView;
    v10->_glowView = v39;

    v41 = +[UIColor blackColor];
    [(UIView *)v10->_glowView setBackgroundColor:v41];

    uint64_t v42 = *MEMORY[0x1E4F3A228];
    v43 = [(UIView *)v10->_glowView layer];
    [v43 setCompositingFilter:v42];

    v87[0] = v38;
    v87[1] = v37;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
    v45 = [(UIView *)v10->_glowView layer];
    [v45 setFilters:v44];

    v46 = [(UIView *)v10->_glowView layer];
    [v46 setMasksToBounds:1];

    v47 = [(UIView *)v10->_glowView layer];
    [v47 setCornerCurve:v21];

    v48 = [(UIView *)v10->_glowView layer];
    [v48 setCornerRadius:22.0];

    v49 = +[UIScreen mainScreen];
    [v49 scale];
    double v51 = v50;
    v52 = [(UIView *)v10->_glowView layer];
    [v52 setRasterizationScale:v51];

    v53 = [(UIView *)v10->_glowView layer];
    [v53 setShouldRasterize:1];

    id v4 = v74;
    [(UIView *)v10->_maskView addSubview:v10->_glowView];
    v54 = [v74 window];
    v55 = [v54 screen];

    if (v55) {
      v56 = v55;
    }
    else {
      v56 = (void *)MEMORY[0x1E4F39B68];
    }
    uint64_t v57 = [v56 displayLinkWithTarget:v10 selector:sel__displayLinkFired_];
    displayLink = v10->_displayLink;
    v10->_displayLink = (CADisplayLink *)v57;

    [(CADisplayLink *)v10->_displayLink setPreferredFramesPerSecond:60];
    v59 = v10->_displayLink;
    v60 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v59 addToRunLoop:v60 forMode:*MEMORY[0x1E4F1C3A0]];

    v61 = [[_UIPortalView alloc] initWithSourceView:v31];
    portalView = v10->_portalView;
    v10->_portalView = v61;

    [(_UIPortalView *)v10->_portalView setMatchesAlpha:1];
    [(_UIPortalView *)v10->_portalView setMatchesTransform:1];
    v63 = [v31 layer];
    [v63 anchorPoint];
    double v65 = v64;
    double v67 = v66;
    v68 = [(UIView *)v10->_portalView layer];
    objc_msgSend(v68, "setAnchorPoint:", v65, v67);

    v69 = [v31 layer];
    [v69 frame];
    -[_UIPortalView setFrame:](v10->_portalView, "setFrame:");

    [(UIView *)v10->_portalContainerView addSubview:v10->_portalView];
    [(_UITextLightLoupeView *)v10 _updateColorsForCurrentTraitCollection];
    v70 = +[UITraitCollection systemTraitsAffectingColorAppearance];
    id v71 = [(UIView *)v10 registerForTraitChanges:v70 withAction:sel__updateColorsForCurrentTraitCollection];
  }
  return v10;
}

- (void)_updateColorsForCurrentTraitCollection
{
  v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4 == 2)
  {
    double v5 = 0.2;
    double v6 = 1.0;
  }
  else
  {
    double v5 = 0.1;
    double v6 = 0.0;
  }
  id v9 = +[UIColor colorWithWhite:v6 alpha:v5];
  uint64_t v7 = [v9 CGColor];
  double v8 = [(UIView *)self->_maskView layer];
  [v8 setBorderColor:v7];
}

- (void)_stopDisplayLink
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (void)removeFromSuperview
{
  [(_UITextLightLoupeView *)self _stopDisplayLink];
  v3.receiver = self;
  v3.super_class = (Class)_UITextLightLoupeView;
  [(UIView *)&v3 removeFromSuperview];
}

- (CGSize)preferredSize
{
  double v2 = 78.0;
  double v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UICoordinateSpace)containerCoordinateSpace
{
  double v2 = [(UIView *)self window];
  double v3 = [v2 coordinateSpace];

  return (UICoordinateSpace *)v3;
}

- (id)_backgroundColorIfNecessary
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (![(id)UIApp _isSpringBoard]) {
    goto LABEL_7;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  uint64_t v4 = [WeakRetained window];

  double v5 = [v4 screen];
  double v6 = +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 forScreen:v5];

  Class v7 = NSClassFromString(&cfstr_Sbhomescreenwi.isa);
  Class v8 = NSClassFromString(&cfstr_Sbisolationtan.isa);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __52___UITextLightLoupeView__backgroundColorIfNecessary__block_invoke;
  v30[3] = &unk_1E5305598;
  p_long long buf = &buf;
  id v9 = v4;
  id v31 = v9;
  uint64_t v33 = &v36;
  Class v34 = v8;
  Class v35 = v7;
  [v6 enumerateObjectsUsingBlock:v30];
  if (*(void *)(*((void *)&buf + 1) + 24) == 0x7FFFFFFFFFFFFFFFLL || v37[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v10 = 1;
  }
  else
  {
    uint64_t v4 = +[UIColor blackColor];
    int v10 = 0;
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&buf, 8);

  if (v10)
  {
LABEL_7:
    id v11 = [(UIView *)self _window];
    if ([v11 _isHostedInAnotherProcess])
    {
LABEL_8:
      uint64_t v12 = +[UIColor darkGrayColor];
LABEL_9:
      uint64_t v4 = (void *)v12;
    }
    else
    {
      p_sourceView = &self->_sourceView;
      id v15 = objc_loadWeakRetained((id *)p_sourceView);
      v16 = [v15 window];
      double v17 = [v16 windowScene];
      uint64_t v18 = [v17 _backgroundStyle];

      switch(v18)
      {
        case 0:
          uint64_t v12 = +[UIColor systemBackgroundColor];
          goto LABEL_9;
        case 1:
        case 6:
          uint64_t v12 = +[UIColor grayColor];
          goto LABEL_9;
        case 2:
        case 3:
          uint64_t v12 = +[UIColor lightGrayColor];
          goto LABEL_9;
        case 4:
        case 5:
          goto LABEL_8;
        default:
          if (os_variant_has_internal_diagnostics())
          {
            v25 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            {
              id v26 = objc_loadWeakRetained((id *)p_sourceView);
              v27 = [v26 window];
              double v28 = [v27 windowScene];
              uint64_t v29 = [v28 _backgroundStyle];
              LODWORD(buf) = 134217984;
              *(void *)((char *)&buf + 4) = v29;
              _os_log_fault_impl(&dword_1853B0000, v25, OS_LOG_TYPE_FAULT, "Modern Loupe: Unexpected background style: %ld", (uint8_t *)&buf, 0xCu);
            }
          }
          else
          {
            uint64_t v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_backgroundColorIfNecessary___s_category) + 8);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v20 = v19;
              id v21 = objc_loadWeakRetained((id *)p_sourceView);
              v22 = [v21 window];
              v23 = [v22 windowScene];
              uint64_t v24 = [v23 _backgroundStyle];
              LODWORD(buf) = 134217984;
              *(void *)((char *)&buf + 4) = v24;
              _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "Modern Loupe: Unexpected background style: %ld", (uint8_t *)&buf, 0xCu);
            }
          }
          uint64_t v4 = 0;
          break;
      }
    }
  }
  return v4;
}

- (void)setModelPosition:(CGPoint)a3
{
  if (self->_modelPosition.x != a3.x || self->_modelPosition.y != a3.y)
  {
    self->_modelPosition = a3;
    if (self->_visible) {
      [(CADisplayLink *)self->_displayLink setPaused:0];
    }
  }
}

- (void)setVisible:(BOOL)a3
{
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56___UITextLightLoupeView_setVisible_animated_completion___block_invoke;
  aBlock[3] = &unk_1E53055C0;
  aBlock[4] = self;
  BOOL v20 = v5;
  id v9 = v8;
  id v19 = v9;
  int v10 = _Block_copy(aBlock);
  id v11 = (void (**)(void, void, void))v10;
  if (self->_visible == v6)
  {
    (*((void (**)(void *, uint64_t, void))v10 + 2))(v10, 1, 0);
  }
  else
  {
    self->_visible = v6;
    uint64_t v12 = *MEMORY[0x1E4F1DAD8];
    if (v6)
    {
      [(CADisplayLink *)self->_displayLink setPaused:0];
      double v13 = 1.0;
      unint64_t v14 = 0xC049000000000000;
    }
    else
    {
      unint64_t v14 = *(void *)(MEMORY[0x1E4F1DAD8] + 8);
      double v13 = 0.0;
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56___UITextLightLoupeView_setVisible_animated_completion___block_invoke_2;
    v17[3] = &unk_1E52DA260;
    v17[4] = self;
    *(double *)&v17[5] = v13;
    v17[6] = v12;
    v17[7] = v14;
    id v15 = _Block_copy(v17);
    v16 = v15;
    if (v5)
    {
      +[UIView _animateUsingSpringWithTension:0 friction:v15 interactive:v11 animations:400.0 completion:35.0];
    }
    else
    {
      (*((void (**)(void *))v15 + 2))(v15);
      v11[2](v11, 1, 0);
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UITextLightLoupeView;
  [(UIView *)&v3 layoutSubviews];
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_maskView, "setFrame:");
  [(UIView *)self->_maskView bounds];
  -[UIView setFrame:](self->_glowView, "setFrame:");
  [(UIView *)self->_maskView bounds];
  -[UIView setFrame:](self->_portalContainerView, "setFrame:");
}

- (double)_visualOffset
{
  [(_UITextLightLoupeView *)self dismissalProgress];
  return v2 * 50.0 * 0.09;
}

- (CGPoint)constrainedModelPositionForPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(_UITextLightLoupeView *)self _visualOffset];
  double v7 = y + v6;
  id v8 = [(_UITextLightLoupeView *)self containerCoordinateSpace];
  [v8 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [(UIView *)self bounds];
  double v19 = LoupeConstrainPointHorizontally(x, v7, v10, v12, v14, v16, v17, v18, 8.0);
  double v21 = v20;

  double v22 = v19;
  double v23 = v21;
  result.double y = v23;
  result.double x = v22;
  return result;
}

- (void)_displayLinkFired:(id)a3
{
  p_modelPosition = &self->_modelPosition;
  -[_UITextLightLoupeView constrainedModelPositionForPosition:](self, "constrainedModelPositionForPosition:", a3, self->_modelPosition.x, self->_modelPosition.y);
  double v6 = v5;
  double v8 = v7;
  [(UIView *)self center];
  if (sqrt((p_modelPosition->x - v9) * (p_modelPosition->x - v9) + (p_modelPosition->y - v10)
                                                                  * (p_modelPosition->y - v10)) < 0.00000011920929)
    [(CADisplayLink *)self->_displayLink setPaused:1];
  [(UIView *)self center];
  double v12 = v6 * 0.3 + v11 * 0.7;
  double v14 = v8 * 0.3 + v13 * 0.7;
  if (self->_visible)
  {
    [(UIView *)self bounds];
    double v19 = v14 - (v18 + v17 * 0.5);
    CGFloat v20 = -(v12 - (v16 + v15 * 0.5));
    [(_UITextLightLoupeView *)self _visualOffset];
    CATransform3DMakeTranslation(&v24, v20, v21 - v19, 0.0);
    double v22 = [(UIView *)self->_portalContainerView layer];
    CATransform3D v23 = v24;
    [v22 setSublayerTransform:&v23];
  }
  -[UIView setCenter:](self, "setCenter:", v12, v14);
}

- (_UITextSelectionWidgetAnimating)animatableSelectionWidget
{
  return 0;
}

- (BOOL)needsHideLoupe:(CGRect)a3
{
  return 0;
}

- (BOOL)visible
{
  return self->_visible;
}

- (CGPoint)modelPosition
{
  double x = self->_modelPosition.x;
  double y = self->_modelPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)dismissalProgress
{
  return self->_dismissalProgress;
}

- (void)setDismissalProgress:(double)a3
{
  self->_dismissalProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_portalContainerView, 0);
  objc_storeStrong((id *)&self->_glowView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_destroyWeak((id *)&self->_sourceView);
}

@end