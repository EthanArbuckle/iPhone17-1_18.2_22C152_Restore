@interface _UITextMagnifiedLoupeView
- ($1B3FB7A12BCE93AE4CB0A35ACEA563C0)_defaultOriginShape;
- ($6269591C569AE6F7CC7995ADEDD8665A)_defaultOriginShadow;
- ($96EE1C12479E9B303E9C2794B92A11A2)animationState;
- (BOOL)_isVertical;
- (BOOL)needsHideLoupe:(CGRect)a3;
- (BOOL)visible;
- (CADisplayLink)displayLink;
- (CGPoint)constrainedModelPositionForPosition:(CGPoint)a3;
- (CGPoint)modelPosition;
- (CGSize)preferredSize;
- (UICoordinateSpace)containerCoordinateSpace;
- (UIView)containerView;
- (UIView)coverView;
- (UIView)glowView;
- (UIView)portalContainerView;
- (_UIPortalView)portalView;
- (_UITextMagnifiedLoupeView)initWithSourceView:(id)a3;
- (_UITextSelectionWidgetAnimating)animatableSelectionWidget;
- (double)dismissalProgress;
- (id)_animatableSelectionWidget;
- (id)_configuredGroupCompletion:(id)a3;
- (unint64_t)orientation;
- (void)_displayLinkFired:(id)a3;
- (void)_resetAnimationState;
- (void)_stopDisplayLink;
- (void)_updateCloseLoupeAnimation:(id)a3;
- (void)_updateOpenLoupeAnimation:(id)a3;
- (void)_updatePortalViewTransformForPosition:(CGPoint)a3 zoomScale:(double)a4;
- (void)layoutSubviews;
- (void)removeFromSuperview;
- (void)setAnimatableSelectionWidget:(id)a3;
- (void)setAnimationState:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setCoverView:(id)a3;
- (void)setDismissalProgress:(double)a3;
- (void)setDisplayLink:(id)a3;
- (void)setGlowView:(id)a3;
- (void)setModelPosition:(CGPoint)a3;
- (void)setOrientation:(unint64_t)a3;
- (void)setPortalContainerView:(id)a3;
- (void)setPortalView:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation _UITextMagnifiedLoupeView

- (_UITextMagnifiedLoupeView)initWithSourceView:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)_UITextMagnifiedLoupeView;
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9 = -[UIView initWithFrame:](&v55, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    [(UIView *)v9 setUserInteractionEnabled:0];
    v10->_orientation = 1;
    v11 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v5, v6, v7, v8);
    containerView = v10->_containerView;
    v10->_containerView = v11;

    v13 = +[UIColor whiteColor];
    [(UIView *)v10->_containerView setBackgroundColor:v13];

    [(UIView *)v10->_containerView setClipsToBounds:1];
    v14 = [(UIView *)v10->_containerView layer];
    [v14 setAllowsEdgeAntialiasing:1];

    uint64_t v15 = *MEMORY[0x1E4F39EA8];
    v16 = [(UIView *)v10->_containerView layer];
    [v16 setCornerCurve:v15];

    [(UIView *)v10 addSubview:v10->_containerView];
    v17 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v5, v6, v7, v8);
    portalContainerView = v10->_portalContainerView;
    v10->_portalContainerView = v17;

    [(UIView *)v10->_containerView addSubview:v10->_portalContainerView];
    v19 = [v4 window];
    v20 = [[_UIPortalView alloc] initWithSourceView:v19];
    portalView = v10->_portalView;
    v10->_portalView = v20;

    [(_UIPortalView *)v10->_portalView setMatchesAlpha:1];
    [(_UIPortalView *)v10->_portalView setMatchesTransform:1];
    v22 = [v19 layer];
    [v22 anchorPoint];
    double v24 = v23;
    double v26 = v25;
    v27 = [(UIView *)v10->_portalView layer];
    objc_msgSend(v27, "setAnchorPoint:", v24, v26);

    v28 = [v19 layer];
    [v28 frame];
    -[_UIPortalView setFrame:](v10->_portalView, "setFrame:");

    [(UIView *)v10->_portalContainerView addSubview:v10->_portalView];
    v29 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v5, v6, v7, v8);
    glowView = v10->_glowView;
    v10->_glowView = v29;

    id v31 = +[UIColor blackColor];
    uint64_t v32 = [v31 CGColor];
    v33 = [(UIView *)v10->_glowView layer];
    [v33 setShadowColor:v32];

    v34 = [(UIView *)v10->_glowView layer];
    LODWORD(v35) = 1041865114;
    [v34 setShadowOpacity:v35];

    double v36 = *MEMORY[0x1E4F1DB30];
    double v37 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    v38 = [(UIView *)v10->_glowView layer];
    objc_msgSend(v38, "setShadowOffset:", v36, v37);

    v39 = [(UIView *)v10->_glowView layer];
    [v39 setShadowRadius:8.0];

    v40 = [(UIView *)v10->_glowView layer];
    [v40 setCornerCurve:v15];

    [v4 contentScaleFactor];
    double v42 = v41;
    v43 = [(UIView *)v10->_glowView layer];
    [v43 setRasterizationScale:v42];

    v44 = [(UIView *)v10->_glowView layer];
    [v44 setShouldRasterize:1];

    [(UIView *)v10->_containerView addSubview:v10->_glowView];
    v45 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v5, v6, v7, v8);
    coverView = v10->_coverView;
    v10->_coverView = v45;

    [(UIView *)v10->_containerView addSubview:v10->_coverView];
    v47 = [v4 window];
    v48 = [v47 screen];

    if (v48) {
      v49 = v48;
    }
    else {
      v49 = (void *)MEMORY[0x1E4F39B68];
    }
    uint64_t v50 = [v49 displayLinkWithTarget:v10 selector:sel__displayLinkFired_];
    displayLink = v10->_displayLink;
    v10->_displayLink = (CADisplayLink *)v50;

    [(CADisplayLink *)v10->_displayLink setPreferredFramesPerSecond:60];
    v52 = v10->_displayLink;
    v53 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v52 addToRunLoop:v53 forMode:*MEMORY[0x1E4F1C3A0]];
  }
  return v10;
}

- (CGSize)preferredSize
{
  double v2 = 85.0;
  if (self->_orientation == 1) {
    double v3 = 115.0;
  }
  else {
    double v3 = 85.0;
  }
  if (self->_orientation != 1) {
    double v2 = 115.0;
  }
  result.height = v2;
  result.width = v3;
  return result;
}

- (UICoordinateSpace)containerCoordinateSpace
{
  double v2 = [(UIView *)self window];
  double v3 = [v2 coordinateSpace];

  return (UICoordinateSpace *)v3;
}

- (CGPoint)constrainedModelPositionForPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(_UITextMagnifiedLoupeView *)self containerCoordinateSpace];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(UIView *)self bounds];
  double v17 = LoupeConstrainPointHorizontally(x, y, v8, v10, v12, v14, v15, v16, 8.0);
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (void)setModelPosition:(CGPoint)a3
{
  if (self->_modelPosition.x != a3.x || self->_modelPosition.y != a3.y)
  {
    self->_modelPosition = a3;
    [(CADisplayLink *)self->_displayLink setPaused:0];
  }
  if (self->_closeLoupeAnimationRunning)
  {
    if (!self->_transitionGroupCompletion && setModelPosition__once != -1) {
      dispatch_once(&setModelPosition__once, &__block_literal_global_430);
    }
    [(_UITextMagnifiedLoupeView *)self _updateCloseLoupeAnimation:0];
  }
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (self->_visible == v6)
  {
    if (!v8) {
      goto LABEL_14;
    }
    id v10 = v8;
    (*((void (**)(id, void))v8 + 2))(v8, 0);
    goto LABEL_13;
  }
  id v10 = v8;
  self->_visible = v6;
  [(UIView *)self bounds];
  if (v6)
  {
    double v9 = [(_UITextMagnifiedLoupeView *)self containerView];
    [v9 setHidden:0];

    if (v5)
    {
      [(_UITextMagnifiedLoupeView *)self _updateOpenLoupeAnimation:v10];
      goto LABEL_13;
    }
    self->_animationState = ($E1C7B4BC4E099C56C581B69AFE4278FB)1;
  }
  else
  {
    if (v5)
    {
      -[_UITextMagnifiedLoupeView constrainedModelPositionForPosition:](self, "constrainedModelPositionForPosition:", self->_modelPosition.x, self->_modelPosition.y);
      -[UIView setCenter:](self, "setCenter:");
      [(_UITextMagnifiedLoupeView *)self _updateCloseLoupeAnimation:v10];
      goto LABEL_13;
    }
    [(_UITextMagnifiedLoupeView *)self _resetAnimationState];
  }
  [(UIView *)self setNeedsLayout];
  id v8 = v10;
  if (!v10) {
    goto LABEL_14;
  }
  (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
LABEL_13:
  id v8 = v10;
LABEL_14:
}

- (void)_updateOpenLoupeAnimation:(id)a3
{
  id v4 = a3;
  [(_UITextMagnifiedLoupeView *)self _resetAnimationState];
  -[_UITextMagnifiedLoupeView _updatePortalViewTransformForPosition:zoomScale:](self, "_updatePortalViewTransformForPosition:zoomScale:", self->_modelPosition.x, self->_modelPosition.y, 0.125);
  [(UIView *)self layoutIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animatableSelectionWidget);
  [WeakRetained setHiddenForLoupeAnimation:1];

  objc_initWeak(&location, self);
  BOOL v6 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.13];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55___UITextMagnifiedLoupeView__updateOpenLoupeAnimation___block_invoke;
  v13[3] = &unk_1E52DC308;
  objc_copyWeak(&v14, &location);
  +[UIView _animateUsingSpringBehavior:v6 tracking:0 animations:v13 completion:0];
  double v7 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55___UITextMagnifiedLoupeView__updateOpenLoupeAnimation___block_invoke_2;
  v11[3] = &unk_1E52DC308;
  objc_copyWeak(&v12, &location);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55___UITextMagnifiedLoupeView__updateOpenLoupeAnimation___block_invoke_3;
  v9[3] = &unk_1E52E8F50;
  id v8 = v4;
  id v10 = v8;
  +[UIView _animateUsingSpringBehavior:v7 tracking:0 animations:v11 completion:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

- (void)_updateCloseLoupeAnimation:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.23];
  BOOL v6 = [(_UITextMagnifiedLoupeView *)self _configuredGroupCompletion:v4];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56___UITextMagnifiedLoupeView__updateCloseLoupeAnimation___block_invoke;
  aBlock[3] = &unk_1E52DF708;
  objc_copyWeak(&v17, &location);
  aBlock[4] = self;
  id v7 = v6;
  id v16 = v7;
  id v8 = _Block_copy(aBlock);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56___UITextMagnifiedLoupeView__updateCloseLoupeAnimation___block_invoke_2;
  v13[3] = &unk_1E52DA040;
  id v9 = v8;
  id v14 = v9;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56___UITextMagnifiedLoupeView__updateCloseLoupeAnimation___block_invoke_3;
  v11[3] = &unk_1E52DA9D0;
  id v10 = v7;
  id v12 = v10;
  +[UIView _animateUsingSpringBehavior:v5 tracking:1 animations:v13 completion:v11];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (id)_configuredGroupCompletion:(id)a3
{
  id v4 = a3;
  transitionGroupCompletion = self->_transitionGroupCompletion;
  if (!transitionGroupCompletion)
  {
    BOOL v6 = objc_alloc_init(_UIGroupCompletion);
    id v7 = self->_transitionGroupCompletion;
    self->_transitionGroupCompletion = v6;

    objc_initWeak(&location, self);
    objc_initWeak(&from, self->_containerView);
    objc_copyWeak(&to, (id *)&self->_animatableSelectionWidget);
    id v8 = self->_transitionGroupCompletion;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56___UITextMagnifiedLoupeView__configuredGroupCompletion___block_invoke;
    v11[3] = &unk_1E5300758;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, &from);
    objc_copyWeak(&v15, &to);
    id v12 = v4;
    [(_UIGroupCompletion *)v8 addNonIncrementingCompletion:v11];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&to);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    transitionGroupCompletion = self->_transitionGroupCompletion;
  }
  id v9 = transitionGroupCompletion;

  return v9;
}

- (void)_resetAnimationState
{
  self->_animationState = 0;
}

- (void)_stopDisplayLink
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (void)removeFromSuperview
{
  [(_UITextMagnifiedLoupeView *)self _stopDisplayLink];
  v3.receiver = self;
  v3.super_class = (Class)_UITextMagnifiedLoupeView;
  [(UIView *)&v3 removeFromSuperview];
}

- ($1B3FB7A12BCE93AE4CB0A35ACEA563C0)_defaultOriginShape
{
  [(UIView *)self bounds];
  double v6 = v5;
  [(UIView *)self bounds];
  if (v6 >= v7) {
    double v8 = v7;
  }
  else {
    double v8 = v6;
  }
  double v9 = v8 * 0.5;
  [(UIView *)self bounds];
  retstr->var0.double x = v11 + v10 * 0.5;
  retstr->var0.double y = v13 + v12 * 0.5;
  [(UIView *)self bounds];
  retstr->var1.origin.double x = v14;
  retstr->var1.origin.double y = v15;
  retstr->var1.size.width = v16;
  retstr->var1.size.height = v17;
  retstr->var2 = v9;
  CGPoint result = [(UIView *)self tintColor];
  retstr->var3 = result;
  return result;
}

- ($6269591C569AE6F7CC7995ADEDD8665A)_defaultOriginShadow
{
  retstr->var3.height = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  return self;
}

- (id)_animatableSelectionWidget
{
  p_animatableSelectionWidget = &self->_animatableSelectionWidget;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animatableSelectionWidget);
  int v4 = -[UIView _isInVisibleHierarchy]((uint64_t)WeakRetained);

  if (v4) {
    id v5 = objc_loadWeakRetained((id *)p_animatableSelectionWidget);
  }
  else {
    id v5 = 0;
  }
  return v5;
}

- (BOOL)_isVertical
{
  return self->_orientation == 2;
}

- (void)layoutSubviews
{
  v86.receiver = self;
  v86.super_class = (Class)_UITextMagnifiedLoupeView;
  [(UIView *)&v86 layoutSubviews];
  objc_super v3 = [(_UITextMagnifiedLoupeView *)self _animatableSelectionWidget];
  int v4 = v3;
  BOOL apertureOpen = self->_animationState.apertureOpen;
  BOOL floatingAbove = self->_animationState.floatingAbove;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  if (v3)
  {
    [v3 originShape];
    double v81 = 0.0;
    long long v79 = 0u;
    long long v80 = 0u;
    [v4 originShadow];
  }
  else
  {
    [(_UITextMagnifiedLoupeView *)self _defaultOriginShape];
    double v81 = 0.0;
    long long v79 = 0u;
    long long v80 = 0u;
    [(_UITextMagnifiedLoupeView *)self _defaultOriginShadow];
  }
  BOOL v7 = [(_UITextMagnifiedLoupeView *)self _isVertical];
  memset(&v78, 0, sizeof(v78));
  if (!floatingAbove)
  {
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v78.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v78.c = v8;
    *(_OWORD *)&v78.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    if (v4) {
      goto LABEL_6;
    }
LABEL_11:
    double v13 = *((double *)&v82 + 1);
    double v11 = *(double *)&v82;
    if (!floatingAbove) {
      goto LABEL_7;
    }
    goto LABEL_12;
  }
  double v18 = 65.0;
  double v19 = 0.0;
  if (!v7)
  {
    double v18 = 0.0;
    double v19 = -65.0;
  }
  CGAffineTransformMakeTranslation(&v78, v18, v19);
  if (!v4) {
    goto LABEL_11;
  }
LABEL_6:
  double v9 = [v4 originView];
  [(UIView *)self convertPoint:v9 fromView:v82];
  double v11 = v10;
  double v13 = v12;

  if (!floatingAbove)
  {
LABEL_7:
    double v15 = *((double *)&v84 + 1);
    double v14 = *(double *)&v84;
    id v16 = *((id *)&v85 + 1);
    double v17 = 1.0;
    goto LABEL_13;
  }
LABEL_12:
  [(UIView *)self bounds];
  double v14 = v20;
  double v15 = v21;
  [(UIView *)self bounds];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  id v16 = [(UIView *)self tintColor];
  double v13 = v25 + v29 * 0.5;
  double v11 = v23 + v27 * 0.5;
  double v17 = 0.0;
LABEL_13:
  if (v14 >= v15) {
    double v30 = v15;
  }
  else {
    double v30 = v14;
  }
  double v31 = v30 * 0.5;
  int v32 = !apertureOpen;
  if (apertureOpen) {
    double v33 = 2.0;
  }
  else {
    double v33 = 42.5;
  }
  if (apertureOpen) {
    double v34 = v31;
  }
  else {
    double v34 = *(double *)&v85;
  }
  if (v4 && !apertureOpen) {
    int v32 = [v4 crossfadeOnDismissal];
  }
  if (v32) {
    double v35 = 0.0;
  }
  else {
    double v35 = 1.0;
  }
  double v36 = [(_UITextMagnifiedLoupeView *)self containerView];
  objc_msgSend(v36, "setBounds:", 0.0, 0.0, v14, v15);
  objc_msgSend(v36, "setCenter:", v11, v13);
  double v37 = [v36 layer];
  [v37 setCornerRadius:v34];

  v38 = [v36 layer];
  [v38 setBorderWidth:v33];

  CGAffineTransform v77 = v78;
  [v36 setTransform:&v77];
  [v36 setAlpha:v35];
  if (floatingAbove)
  {
    id v39 = +[UIColor blackColor];
    double v40 = 0.0;
    double v41 = 4.0;
  }
  else
  {
    id v39 = (id)v79;
    double v40 = *((double *)&v80 + 1);
    double v41 = v81;
  }
  double v42 = *((double *)&v79 + 1);
  if (floatingAbove) {
    double v43 = 18.0;
  }
  else {
    double v43 = *(double *)&v80;
  }
  id v44 = v39;
  uint64_t v45 = [v44 CGColor];
  v46 = [(UIView *)self layer];
  [v46 setShadowColor:v45];

  v47 = [(UIView *)self layer];
  objc_msgSend(v47, "setShadowOffset:", v40, v41);

  v48 = [(UIView *)self layer];
  [v48 setShadowRadius:v43];

  v49 = [(UIView *)self layer];
  uint64_t v50 = v49;
  *(float *)&double v51 = v42;
  if (floatingAbove) {
    *(float *)&double v51 = 0.18;
  }
  [v49 setShadowOpacity:v51];

  id v52 = v16;
  uint64_t v53 = [v52 CGColor];
  v54 = [(UIView *)self->_containerView layer];
  [v54 setBorderColor:v53];

  [(UIView *)self->_coverView setBackgroundColor:v52];
  [v36 bounds];
  -[UIView setFrame:](self->_coverView, "setFrame:");
  [(UIView *)self->_coverView setAlpha:v17];
  [(UIView *)self->_containerView bounds];
  -[UIView setFrame:](self->_portalContainerView, "setFrame:");
  [(UIView *)self->_containerView bounds];
  CGFloat x = v87.origin.x;
  CGFloat y = v87.origin.y;
  CGFloat width = v87.size.width;
  CGFloat height = v87.size.height;
  CGRect v88 = CGRectInset(v87, -5.0, -5.0);
  double v59 = v88.origin.x;
  double v60 = v88.origin.y;
  double v61 = v88.size.width;
  double v62 = v88.size.height;
  CGFloat v75 = y;
  CGFloat v76 = x;
  v88.origin.CGFloat x = x;
  v88.origin.CGFloat y = y;
  CGFloat v73 = height;
  CGFloat v74 = width;
  v88.size.CGFloat width = width;
  v88.size.CGFloat height = height;
  CGRect v89 = CGRectInset(v88, 5.0, 5.0);
  double v63 = v89.origin.x;
  double v64 = v89.origin.y;
  double v65 = v89.size.width;
  double v66 = v89.size.height;
  v89.origin.CGFloat x = v59;
  v89.origin.CGFloat y = v60;
  v89.size.CGFloat width = v61;
  v89.size.CGFloat height = v62;
  v67 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v59, v60, v61, v62, CGRectGetHeight(v89) * 0.5);
  v90.origin.CGFloat x = v63;
  v90.origin.CGFloat y = v64;
  v90.size.CGFloat width = v65;
  v90.size.CGFloat height = v66;
  v68 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v63, v64, v65, v66, CGRectGetHeight(v90) * 0.5);
  v69 = [v68 bezierPathByReversingPath];
  [v67 appendPath:v69];

  v91.origin.CGFloat y = v75;
  v91.origin.CGFloat x = v76;
  v91.size.CGFloat height = v73;
  v91.size.CGFloat width = v74;
  CGRect v92 = CGRectOffset(v91, 0.0, 5.0);
  -[UIView setFrame:](self->_glowView, "setFrame:", v92.origin.x, v92.origin.y, v92.size.width, v92.size.height);
  id v70 = v67;
  uint64_t v71 = [v70 CGPath];
  v72 = [(UIView *)self->_glowView layer];
  [v72 setShadowPath:v71];
}

- (void)_updatePortalViewTransformForPosition:(CGPoint)a3 zoomScale:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  [(UIView *)self->_containerView bounds];
  memset(&v18, 0, sizeof(v18));
  CATransform3DMakeTranslation(&v18, v9 + v8 * 0.5 - x, v11 + v10 * 0.5 - y, 0.0);
  memset(&v17, 0, sizeof(v17));
  CATransform3DMakeScale(&v17, a4, a4, 1.0);
  CATransform3D a = v18;
  CATransform3D b = v17;
  CATransform3DConcat(&v16, &a, &b);
  double v12 = [(UIView *)self->_portalContainerView layer];
  CATransform3D v13 = v16;
  [v12 setSublayerTransform:&v13];
}

- (void)_displayLinkFired:(id)a3
{
  p_modelPosition = &self->_modelPosition;
  -[_UITextMagnifiedLoupeView constrainedModelPositionForPosition:](self, "constrainedModelPositionForPosition:", a3, self->_modelPosition.x, self->_modelPosition.y);
  double v6 = v5;
  double v8 = v7;
  [(UIView *)self center];
  if (sqrt((p_modelPosition->x - v9) * (p_modelPosition->x - v9) + (p_modelPosition->y - v10)
                                                                  * (p_modelPosition->y - v10)) < 0.00000011920929)
    [(CADisplayLink *)self->_displayLink setPaused:1];
  [(UIView *)self center];
  double v12 = v6 * 0.3 + v11 * 0.7;
  double v14 = v8 * 0.3 + v13 * 0.7;
  if (self->_visible) {
    -[_UITextMagnifiedLoupeView _updatePortalViewTransformForPosition:zoomScale:](self, "_updatePortalViewTransformForPosition:zoomScale:", v12, v14, 1.25);
  }
  -[UIView setCenter:](self, "setCenter:", v12, v14);
}

- (void)setAnimatableSelectionWidget:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animatableSelectionWidget);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_animatableSelectionWidget);
    [v5 setHiddenForLoupeAnimation:0];

    objc_storeWeak((id *)&self->_animatableSelectionWidget, obj);
    transitionGroupCompletion = self->_transitionGroupCompletion;
    self->_transitionGroupCompletion = 0;
  }
}

- (BOOL)needsHideLoupe:(CGRect)a3
{
  return a3.origin.y < 107.5;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
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

- (_UITextSelectionWidgetAnimating)animatableSelectionWidget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animatableSelectionWidget);
  return (_UITextSelectionWidgetAnimating *)WeakRetained;
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unint64_t)a3
{
  self->_orientation = a3;
}

- ($96EE1C12479E9B303E9C2794B92A11A2)animationState
{
  return ($96EE1C12479E9B303E9C2794B92A11A2)self->_animationState;
}

- (void)setAnimationState:(id)a3
{
  self->_animationState = ($E1C7B4BC4E099C56C581B69AFE4278FB)a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (UIView)portalContainerView
{
  return self->_portalContainerView;
}

- (void)setPortalContainerView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)glowView
{
  return self->_glowView;
}

- (void)setGlowView:(id)a3
{
}

- (UIView)coverView
{
  return self->_coverView;
}

- (void)setCoverView:(id)a3
{
}

- (_UIPortalView)portalView
{
  return self->_portalView;
}

- (void)setPortalView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_coverView, 0);
  objc_storeStrong((id *)&self->_glowView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_portalContainerView, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_destroyWeak((id *)&self->_animatableSelectionWidget);
  objc_storeStrong((id *)&self->_transitionGroupCompletion, 0);
}

@end