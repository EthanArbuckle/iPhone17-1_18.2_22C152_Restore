@interface _UITextSelectionLollipopView
+ (id)_visualStyle;
- ($1B3FB7A12BCE93AE4CB0A35ACEA563C0)originShape;
- ($6269591C569AE6F7CC7995ADEDD8665A)originShadow;
- (BOOL)crossfadeOnDismissal;
- (BOOL)hiddenForLoupeAnimation;
- (BOOL)isEngaged;
- (BOOL)isVertical;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)portalsDotToContainerWindow;
- (CGPoint)_dotCenterForDotBounds:(CGRect)a3 stemPoint:(unint64_t)a4;
- (CGRect)dotViewFrame;
- (CGRect)preferredFrameForRect:(CGRect)a3;
- (CGSize)_dotSize;
- (UIBezierPath)customShape;
- (UIView)dotView;
- (UIView)stemView;
- (_UIContainerWindowPortalInteraction)dotPortalInteraction;
- (_UITextSelectionLollipopView)initWithFrame:(CGRect)a3;
- (double)_shapeScale;
- (id)visualStyle;
- (unint64_t)_configuredStemPoint;
- (unint64_t)direction;
- (void)_layoutDotView;
- (void)_layoutStemView;
- (void)_setShapeScale:(double)a3;
- (void)_updateFillColorsForTintColor:(id)a3;
- (void)_usePlainViewForStemView;
- (void)_useShapeViewForStemView;
- (void)layoutSubviews;
- (void)setCustomShape:(id)a3;
- (void)setDirection:(unint64_t)a3;
- (void)setDotPortalInteraction:(id)a3;
- (void)setDotView:(id)a3;
- (void)setEngaged:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHiddenForLoupeAnimation:(BOOL)a3;
- (void)setPortalsDotToContainerWindow:(BOOL)a3;
- (void)setStemView:(id)a3;
- (void)tintColorDidChange;
@end

@implementation _UITextSelectionLollipopView

+ (id)_visualStyle
{
  if (_MergedGlobals_5_1 != -1) {
    dispatch_once(&_MergedGlobals_5_1, &__block_literal_global_53);
  }
  v2 = (void *)qword_1EB25C810;
  return v2;
}

- (_UITextSelectionLollipopView)initWithFrame:(CGRect)a3
{
  v28.receiver = self;
  v28.super_class = (Class)_UITextSelectionLollipopView;
  v3 = -[UIView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_shapeScale = 1.0;
    v3->_direction = 2;
    v5 = +[UIColor selectionGrabberColor];
    [(UIView *)v4 setTintColor:v5];

    [(_UITextSelectionLollipopView *)v4 _usePlainViewForStemView];
    v6 = [UIView alloc];
    uint64_t v7 = -[UIView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    dotView = v4->_dotView;
    v4->_dotView = (UIView *)v7;

    id v9 = +[UIColor blackColor];
    uint64_t v10 = [v9 CGColor];
    v11 = [(UIView *)v4->_dotView layer];
    [v11 setShadowColor:v10];

    v12 = [(_UITextSelectionLollipopView *)v4 visualStyle];
    [v12 shadowRadius];
    double v14 = v13;
    v15 = [(UIView *)v4->_dotView layer];
    [v15 setShadowRadius:v14];

    v16 = [(_UITextSelectionLollipopView *)v4 visualStyle];
    [v16 shadowOffset];
    double v18 = v17;
    double v20 = v19;
    v21 = [(UIView *)v4->_dotView layer];
    objc_msgSend(v21, "setShadowOffset:", v18, v20);

    v22 = [(_UITextSelectionLollipopView *)v4 visualStyle];
    [v22 shadowOpacity];
    *(float *)&double v18 = v23;
    v24 = [(UIView *)v4->_dotView layer];
    LODWORD(v25) = LODWORD(v18);
    [v24 setShadowOpacity:v25];

    v26 = [(UIView *)v4->_dotView layer];
    [v26 setShadowPathIsBounds:1];

    [(UIView *)v4 addSubview:v4->_dotView];
  }
  return v4;
}

- (id)visualStyle
{
  v2 = objc_opt_class();
  return (id)[v2 _visualStyle];
}

- (void)setEngaged:(BOOL)a3
{
  self->_engaged = a3;
  [(UIView *)self setNeedsLayout];
}

- (void)setPortalsDotToContainerWindow:(BOOL)a3
{
  if (a3)
  {
    BOOL v4 = [(UIView *)self isHidden];
    p_portalsDotToContainerWindow = &self->_portalsDotToContainerWindow;
    self->_portalsDotToContainerWindow = !v4;
    if (v4)
    {
      BOOL v6 = 0;
    }
    else if (self->_dotPortalInteraction)
    {
      BOOL v6 = 1;
    }
    else
    {
      p_super = self->_dotView;
      v8 = [(_UITextSelectionLollipopView *)self visualStyle];
      [v8 minimumStemLength];
      double v10 = v9;

      if (v10 > 0.0)
      {
        v11 = self;

        p_super = &v11->super;
      }
      v12 = objc_alloc_init(_UIContainerWindowPortalInteraction);
      dotPortalInteraction = self->_dotPortalInteraction;
      self->_dotPortalInteraction = v12;

      [(_UIContainerWindowPortalInteraction *)self->_dotPortalInteraction setAttemptsToUseAncestorViewContainer:1];
      [(UIView *)p_super addInteraction:self->_dotPortalInteraction];

      BOOL v6 = *p_portalsDotToContainerWindow;
    }
  }
  else
  {
    BOOL v6 = 0;
    p_portalsDotToContainerWindow = &self->_portalsDotToContainerWindow;
    self->_portalsDotToContainerWindow = 0;
  }
  [(_UIContainerWindowPortalInteraction *)self->_dotPortalInteraction setEnabled:v6];
  if (*p_portalsDotToContainerWindow)
  {
    double v14 = self->_dotPortalInteraction;
    [(_UIContainerWindowPortalInteraction *)v14 ensureVisibilityInContainerWindow];
  }
}

- (void)setCustomShape:(id)a3
{
  v5 = (UIBezierPath *)a3;
  customShape = self->_customShape;
  if (customShape != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)&self->_customShape, a3);
    v5 = v7;
    if (v7 && !customShape)
    {
      [(_UITextSelectionLollipopView *)self _useShapeViewForStemView];
LABEL_8:
      v5 = v7;
      goto LABEL_9;
    }
    if (!v7 && customShape)
    {
      [(_UITextSelectionLollipopView *)self _usePlainViewForStemView];
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)_useShapeViewForStemView
{
  [(UIView *)self->_stemView removeFromSuperview];
  v3 = [_UIShapeView alloc];
  BOOL v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  stemView = self->_stemView;
  self->_stemView = v4;

  [(UIView *)self addSubview:self->_stemView];
  [(UIView *)self setNeedsLayout];
}

- (void)_usePlainViewForStemView
{
  [(UIView *)self->_stemView removeFromSuperview];
  v3 = [UIView alloc];
  BOOL v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  stemView = self->_stemView;
  self->_stemView = v4;

  uint64_t v6 = *MEMORY[0x1E4F39EA8];
  uint64_t v7 = [(UIView *)self->_stemView layer];
  [v7 setCornerCurve:v6];

  v8 = [(UIView *)self->_stemView layer];
  [v8 setAllowsEdgeAntialiasing:1];

  [(UIView *)self addSubview:self->_stemView];
  [(UIView *)self setNeedsLayout];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UITextSelectionLollipopView;
  -[UIView setHidden:](&v5, sel_setHidden_);
  if (v3) {
    [(_UITextSelectionLollipopView *)self setPortalsDotToContainerWindow:0];
  }
}

- (CGSize)_dotSize
{
  BOOL v3 = [(_UITextSelectionLollipopView *)self visualStyle];
  objc_msgSend(v3, "dotSizeWithEngagedEffect:", -[_UITextSelectionLollipopView isEngaged](self, "isEngaged"));
  double v5 = v4;

  double v6 = v5;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGRect)dotViewFrame
{
  [(UIView *)self->_dotView frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UITextSelectionLollipopView;
  return -[UIView pointInside:withEvent:](&v5, sel_pointInside_withEvent_, a4, a3.x, a3.y);
}

- (void)_updateFillColorsForTintColor:(id)a3
{
  dotPortalInteraction = self->_dotPortalInteraction;
  id v5 = a3;
  BOOL v6 = [(_UIContainerWindowPortalInteraction *)dotPortalInteraction isEnabled];
  double v7 = 1.0;
  if (!v6) {
    objc_msgSend(v5, "alphaComponent", 1.0);
  }
  [(UIView *)self setAlpha:v7];
  v8 = [v5 colorWithAlphaComponent:1.0];

  id v20 = v8;
  uint64_t v9 = [v20 CGColor];
  double v10 = [(UIView *)self->_dotView layer];
  [v10 setBackgroundColor:v9];

  if (self->_customShape)
  {
    v11 = self->_stemView;
    id v12 = v20;
    uint64_t v13 = [v12 CGColor];
    double v14 = [(UIView *)v11 shapeLayer];
    [v14 setFillColor:v13];

    v15 = [(_UITextSelectionLollipopView *)self customShape];
    [v15 lineWidth];
    if (v16 <= 0.0) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = [v12 CGColor];
    }
    double v19 = [(UIView *)v11 shapeLayer];
    [v19 setStrokeColor:v17];
  }
  else
  {
    uint64_t v18 = [v20 CGColor];
    v11 = [(UIView *)self->_stemView layer];
    [(UIView *)v11 setBackgroundColor:v18];
  }
}

- (void)_setShapeScale:(double)a3
{
  self->_shapeScale = a3;
  [(UIView *)self setNeedsLayout];
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)_UITextSelectionLollipopView;
  [(UIView *)&v4 tintColorDidChange];
  double v3 = [(UIView *)self tintColor];
  [(_UITextSelectionLollipopView *)self _updateFillColorsForTintColor:v3];
}

- (unint64_t)_configuredStemPoint
{
  return ((self->_direction - 4) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (CGPoint)_dotCenterForDotBounds:(CGRect)a3 stemPoint:(unint64_t)a4
{
  double width = a3.size.width;
  double v7 = [(_UITextSelectionLollipopView *)self visualStyle];
  [v7 dotOverlapOffset];
  double v9 = v8 * self->_shapeScale;

  double v10 = width * 0.5 - v9;
  double MidX = *MEMORY[0x1E4F1DAD8];
  double MidY = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  customShape = self->_customShape;
  if (customShape)
  {
    uint64_t v14 = [(UIBezierPath *)customShape CGPath];
    if (![(_UITextSelectionLollipopView *)self isVertical])
    {
      if (a4)
      {
        double v25 = -v10;
        v15 = (const CGPath *)v14;
        uint64_t v16 = 4;
LABEL_17:
        double MidX = CornerPointFromPath(v15, v16, v25);
        double MidY = v26;
        goto LABEL_21;
      }
      v15 = (const CGPath *)v14;
      uint64_t v16 = 2;
LABEL_15:
      double v25 = v10;
      goto LABEL_17;
    }
    if (a4 == 1)
    {
      double v25 = -v10;
      v15 = (const CGPath *)v14;
      uint64_t v16 = 8;
      goto LABEL_17;
    }
    if (!a4)
    {
      v15 = (const CGPath *)v14;
      uint64_t v16 = 1;
      goto LABEL_15;
    }
  }
  else
  {
    [(UIView *)self->_stemView frame];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    if ([(_UITextSelectionLollipopView *)self isVertical])
    {
      if (a4 == 1)
      {
        v31.origin.x = v18;
        v31.origin.y = v20;
        v31.size.double width = v22;
        v31.size.height = v24;
        double MidX = CGRectGetMidX(v31);
        v32.origin.x = v18;
        v32.origin.y = v20;
        v32.size.double width = v22;
        v32.size.height = v24;
        double MidY = v10 + CGRectGetHeight(v32);
      }
      else if (!a4)
      {
        v30.origin.x = v18;
        v30.origin.y = v20;
        v30.size.double width = v22;
        v30.size.height = v24;
        double MidX = CGRectGetMidX(v30);
        double MidY = -v10;
      }
    }
    else
    {
      if (a4)
      {
        double MidX = -v10;
      }
      else
      {
        v33.origin.x = v18;
        v33.origin.y = v20;
        v33.size.double width = v22;
        v33.size.height = v24;
        double MidX = v10 + CGRectGetMaxX(v33);
      }
      v34.origin.x = v18;
      v34.origin.y = v20;
      v34.size.double width = v22;
      v34.size.height = v24;
      double MidY = CGRectGetMidY(v34);
    }
  }
LABEL_21:
  double v27 = MidX;
  double v28 = MidY;
  result.y = v28;
  result.x = v27;
  return result;
}

- (void)_layoutStemView
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = [(_UITextSelectionLollipopView *)self isVertical];
  id v12 = [(_UITextSelectionLollipopView *)self visualStyle];
  [v12 stemWidth];
  double v14 = v13;

  if (v11) {
    double v8 = v14;
  }
  else {
    double v10 = v14;
  }
  v15 = self->_customShape;
  if (v15)
  {
    -[UIView setFrame:](self->_stemView, "setFrame:", v4, v6, v8, v10);
    uint64_t v16 = [(UIBezierPath *)v15 CGPath];
    double v17 = [(UIView *)self->_stemView shapeLayer];
    [v17 setPath:v16];
  }
  else
  {
    if (v8 * 0.5 >= v10 * 0.5) {
      double v18 = v10 * 0.5;
    }
    else {
      double v18 = v8 * 0.5;
    }
    unint64_t direction = self->_direction;
    BOOL v20 = [(_UITextSelectionLollipopView *)self isVertical];
    uint64_t v21 = 4;
    if (v20) {
      uint64_t v21 = 8;
    }
    uint64_t v22 = 10;
    if (v20) {
      uint64_t v22 = 3;
    }
    uint64_t v23 = 1;
    if (v20) {
      uint64_t v23 = 2;
    }
    uint64_t v24 = 5;
    if (v20) {
      uint64_t v24 = 12;
    }
    BOOL v25 = v21 == direction;
    uint64_t v26 = 15;
    if (v25) {
      uint64_t v26 = v22;
    }
    if (v23 == direction) {
      uint64_t v27 = v24;
    }
    else {
      uint64_t v27 = v26;
    }
    if (fabs(self->_shapeScale + -1.0) >= 2.22044605e-16)
    {
      BOOL v28 = [(_UITextSelectionLollipopView *)self isVertical];
      double shapeScale = self->_shapeScale;
      double v30 = v10 * shapeScale;
      double v31 = v8 / shapeScale;
      double v32 = v8 * shapeScale;
      if (v28) {
        double v4 = 0.0;
      }
      else {
        double v6 = 0.0;
      }
      if (v28) {
        double v8 = v32;
      }
      else {
        double v8 = v31;
      }
      if (!v28)
      {
        double v10 = v30;
        double v32 = v30;
      }
      double v18 = v32 * 0.5;
    }
    -[UIView setFrame:](self->_stemView, "setFrame:", v4, v6, v8, v10);
    CGRect v33 = [(UIView *)self->_stemView layer];
    [v33 setMaskedCorners:v27];

    double v17 = [(UIView *)self->_stemView layer];
    [v17 setCornerRadius:v18];
  }
}

- (void)_layoutDotView
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(_UITextSelectionLollipopView *)self _dotSize];
  double shapeScale = self->_shapeScale;
  CGFloat v7 = v6 * shapeScale;
  CGFloat v9 = v8 * shapeScale;
  -[UIView setBounds:](self->_dotView, "setBounds:", v3, v4, v6 * shapeScale, v8 * shapeScale);
  -[_UITextSelectionLollipopView _dotCenterForDotBounds:stemPoint:](self, "_dotCenterForDotBounds:stemPoint:", [(_UITextSelectionLollipopView *)self _configuredStemPoint], v3, v4, v7, v9);
  -[UIView setCenter:](self->_dotView, "setCenter:");
  v15.origin.x = v3;
  v15.origin.y = v4;
  v15.size.double width = v7;
  v15.size.height = v9;
  CGFloat v10 = CGRectGetWidth(v15) * 0.5;
  BOOL v11 = [(UIView *)self->_dotView layer];
  [v11 setCornerRadius:v10];

  if (self->_hiddenForLoupeAnimation)
  {
    dotView = self->_dotView;
    [(UIView *)dotView setAlpha:0.0];
  }
  else
  {
    id v13 = [(_UITextSelectionLollipopView *)self visualStyle];
    [v13 grabberOpacity];
    -[UIView setAlpha:](self->_dotView, "setAlpha:");
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_UITextSelectionLollipopView;
  [(UIView *)&v4 layoutSubviews];
  [(_UITextSelectionLollipopView *)self _layoutStemView];
  [(_UITextSelectionLollipopView *)self _layoutDotView];
  double v3 = [(UIView *)self tintColor];
  [(_UITextSelectionLollipopView *)self _updateFillColorsForTintColor:v3];
}

- (BOOL)isVertical
{
  unint64_t direction = self->_direction;
  return direction == 2 || direction == 8;
}

- (CGRect)preferredFrameForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v8 = [(_UITextSelectionLollipopView *)self isVertical];
  double v9 = x;
  double v10 = y;
  CGFloat v11 = width;
  CGFloat v12 = height;
  if (v8) {
    double v13 = CGRectGetHeight(*(CGRect *)&v9);
  }
  else {
    double v13 = CGRectGetWidth(*(CGRect *)&v9);
  }
  double v14 = v13;
  CGRect v15 = [(_UITextSelectionLollipopView *)self visualStyle];
  [v15 minimumStemLength];
  double v17 = v16;

  if (v14 < v17)
  {
    double v18 = [(_UITextSelectionLollipopView *)self visualStyle];
    [v18 minimumStemLength];
    double v20 = v19 - v14;

    double v14 = v14 + v20;
    if (![(_UITextSelectionLollipopView *)self _configuredStemPoint])
    {
      if ([(_UITextSelectionLollipopView *)self isVertical]) {
        double y = y - v20;
      }
      else {
        double x = x - v20;
      }
    }
  }
  [(_UITextSelectionLollipopView *)self _dotSize];
  double v22 = v21;
  BOOL v23 = [(_UITextSelectionLollipopView *)self isVertical];
  if (v23) {
    double v24 = v22;
  }
  else {
    double v24 = v14;
  }
  if (v23) {
    double v25 = v14;
  }
  else {
    double v25 = v22;
  }
  double v26 = x;
  double v27 = y;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (BOOL)crossfadeOnDismissal
{
  return 0;
}

- ($1B3FB7A12BCE93AE4CB0A35ACEA563C0)originShape
{
  [(UIView *)self layoutIfNeeded];
  [(UIView *)self->_dotView center];
  retstr->var0.double x = v5;
  retstr->var0.double y = v6;
  [(_UITextSelectionLollipopView *)self _dotSize];
  CGFloat v8 = v7;
  [(_UITextSelectionLollipopView *)self _dotSize];
  retstr->var1.origin.double x = 0.0;
  retstr->var1.origin.double y = 0.0;
  retstr->var1.size.CGFloat width = v8;
  retstr->var1.size.CGFloat height = v9;
  [(_UITextSelectionLollipopView *)self _dotSize];
  retstr->var2 = v10 * 0.5;
  CGRect result = [(UIView *)self tintColor];
  retstr->var3 = result;
  return result;
}

- ($6269591C569AE6F7CC7995ADEDD8665A)originShadow
{
  retstr->var0 = +[UIColor blackColor];
  id v12 = [(_UITextSelectionLollipopView *)self visualStyle];
  [v12 shadowOpacity];
  retstr->var1 = v5;
  CGFloat v6 = [(_UITextSelectionLollipopView *)self visualStyle];
  [v6 shadowRadius];
  retstr->var2 = v7;
  CGFloat v8 = [(_UITextSelectionLollipopView *)self visualStyle];
  [v8 shadowOffset];
  retstr->var3.CGFloat width = v9;
  retstr->var3.CGFloat height = v10;

  return result;
}

- (void)setHiddenForLoupeAnimation:(BOOL)a3
{
  self->_hiddenForLoupeAnimation = a3;
  [(_UITextSelectionLollipopView *)self _layoutDotView];
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_unint64_t direction = a3;
}

- (UIBezierPath)customShape
{
  return self->_customShape;
}

- (double)_shapeScale
{
  return self->_shapeScale;
}

- (BOOL)hiddenForLoupeAnimation
{
  return self->_hiddenForLoupeAnimation;
}

- (_UIContainerWindowPortalInteraction)dotPortalInteraction
{
  return self->_dotPortalInteraction;
}

- (void)setDotPortalInteraction:(id)a3
{
}

- (BOOL)portalsDotToContainerWindow
{
  return self->_portalsDotToContainerWindow;
}

- (BOOL)isEngaged
{
  return self->_engaged;
}

- (UIView)stemView
{
  return self->_stemView;
}

- (void)setStemView:(id)a3
{
}

- (UIView)dotView
{
  return self->_dotView;
}

- (void)setDotView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dotView, 0);
  objc_storeStrong((id *)&self->_stemView, 0);
  objc_storeStrong((id *)&self->_dotPortalInteraction, 0);
  objc_storeStrong((id *)&self->_customShape, 0);
}

@end