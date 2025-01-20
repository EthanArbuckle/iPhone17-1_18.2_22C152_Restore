@interface _UIPopoverShapeLayerChromeView
+ (double)arrowBase;
+ (double)arrowHeight;
+ (double)cornerRadius;
+ (id)visualEffectGroupName;
- (BOOL)usesImagesForShapeMasking;
- (CGSize)_shadowOffset;
- (UIEdgeInsets)_shadowInsets;
- (_UIPopoverShapeLayerChromeView)initWithFrame:(CGRect)a3;
- (_UIPopoverShapePathParameters)_pathParameters;
- (double)_shadowOpacity;
- (double)_shadowRadius;
- (double)maxNonPinnedOffset;
- (double)minNonPinnedOffset;
- (id)_shadowPath;
- (id)backgroundEffect;
- (id)createShapeLayerPath;
- (int64_t)_pinnedArrowSide;
- (int64_t)_resolvedBackgroundStyle;
- (int64_t)backgroundStyle;
- (void)_configureEffectView;
- (void)_createStrokeView;
- (void)_loadNecessaryViews;
- (void)_removeEffectView;
- (void)_updateBackgroundStyle;
- (void)_updateShapeLayerPath;
- (void)_updateStrokeViewColor;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setArrowDirection:(unint64_t)a3;
- (void)setArrowOffset:(double)a3;
- (void)setBackgroundStyle:(int64_t)a3;
@end

@implementation _UIPopoverShapeLayerChromeView

- (void)setArrowOffset:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPopoverShapeLayerChromeView;
  [(_UIPopoverStandardChromeView *)&v4 setArrowOffset:a3];
  [(UIView *)self setNeedsLayout];
}

- (BOOL)usesImagesForShapeMasking
{
  return 0;
}

- (void)_loadNecessaryViews
{
  [(_UIPopoverShapeLayerChromeView *)self _configureEffectView];
  [(_UIPopoverShapeLayerChromeView *)self _updateBackgroundStyle];
  v3 = [(_UIPopoverStandardChromeView *)self viewToMaskWhenContentExtendsOverArrow];

  shapeLayerMaskView = self->_shapeLayerMaskView;
  if (v3)
  {
    v5 = [(_UIPopoverStandardChromeView *)self viewToMaskWhenContentExtendsOverArrow];
    [v5 setMaskView:shapeLayerMaskView];
  }
  else
  {
    [(UIView *)self setMaskView:self->_shapeLayerMaskView];
  }
  [(_UIPopoverShapeLayerChromeView *)self _updateShapeLayerPath];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIPopoverShapeLayerChromeView;
  [(UIPopoverBackgroundView *)&v3 layoutSubviews];
  [(_UIPopoverShapeLayerChromeView *)self _updateShapeLayerPath];
}

- (void)_updateShapeLayerPath
{
  id v4 = [(UIView *)self->_shapeLayerMaskView layer];
  id v3 = [(_UIPopoverShapeLayerChromeView *)self createShapeLayerPath];
  objc_msgSend(v4, "setPath:", objc_msgSend(v3, "CGPath"));
}

- (id)createShapeLayerPath
{
  id v3 = [(UIView *)self traitCollection];
  id v4 = +[_UIPopoverShapePathProvider defaultProviderForIdiom:](_UIPopoverShapePathProvider, "defaultProviderForIdiom:", [v3 userInterfaceIdiom]);

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  [(_UIPopoverShapeLayerChromeView *)self _pathParameters];
  v7[2] = v10;
  v7[3] = v11;
  v7[4] = v12;
  v7[5] = v13;
  v7[0] = v8;
  v7[1] = v9;
  v5 = [v4 generatePopoverPathForParameters:v7];

  return v5;
}

- (id)_shadowPath
{
  return 0;
}

- (_UIPopoverShapePathParameters)_pathParameters
{
  retstr->var0 = [(_UIPopoverStandardChromeView *)self arrowDirection];
  retstr->var1 = [(_UIPopoverShapeLayerChromeView *)self _pinnedArrowSide];
  [(UIView *)self bounds];
  retstr->var2.origin.x = v5;
  retstr->var2.origin.y = v6;
  retstr->var2.size.width = v7;
  retstr->var2.size.height = v8;
  [(_UIPopoverStandardChromeView *)self arrowOffset];
  retstr->var3 = v9;
  [(UIPopoverBackgroundView *)self _customCornerRadius];
  retstr->var4 = v10;
  [(id)objc_opt_class() arrowHeight];
  retstr->var5 = v11;
  [(id)objc_opt_class() arrowBase];
  retstr->var6 = v12;
  retstr->var7 = 30.0;
  result = (_UIPopoverShapePathParameters *)[(UIView *)self _currentScreenScale];
  retstr->var8 = v14;
  return result;
}

+ (double)arrowHeight
{
  return 13.0;
}

- (int64_t)_pinnedArrowSide
{
  [(_UIPopoverStandardChromeView *)self arrowOffset];
  if (!-[_UIPopoverStandardChromeView wouldPinForOffset:](self, "wouldPinForOffset:")) {
    return 0;
  }
  unint64_t v3 = [(_UIPopoverStandardChromeView *)self arrowDirection];
  if (v3 - 1 >= 2)
  {
    if (v3 == 4 || v3 == 8)
    {
      [(_UIPopoverStandardChromeView *)self arrowOffset];
      int64_t v5 = v4 < 0.0;
      [(_UIPopoverStandardChromeView *)self arrowOffset];
      if (v6 > 0.0) {
        return 3;
      }
      return v5;
    }
    return 0;
  }
  [(_UIPopoverStandardChromeView *)self arrowOffset];
  int64_t v5 = 4 * (v7 < 0.0);
  [(_UIPopoverStandardChromeView *)self arrowOffset];
  if (v8 > 0.0) {
    return 2;
  }
  return v5;
}

- (double)maxNonPinnedOffset
{
  unint64_t v3 = [(_UIPopoverStandardChromeView *)self arrowDirection];
  if (v3 - 1 < 2)
  {
    [(UIView *)self bounds];
    goto LABEL_6;
  }
  if (v3 == 4 || (double result = 0.0, v3 == 8))
  {
    [(UIView *)self bounds];
    double v6 = v5;
LABEL_6:
    double v7 = floor(v6 * 0.5);
    [(UIPopoverBackgroundView *)self _customCornerRadius];
    return v7 - v8 + -15.0;
  }
  return result;
}

- (int64_t)_resolvedBackgroundStyle
{
  int64_t result = self->_requestedBackgroundStyle;
  if ((unint64_t)(result - 8) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    if (dyld_program_sdk_at_least())
    {
      return 100;
    }
    else
    {
      double v4 = [(UIView *)self traitCollection];
      uint64_t v5 = [v4 userInterfaceStyle];

      if (v5 == 2) {
        return 7;
      }
      else {
        return 6;
      }
    }
  }
  return result;
}

+ (double)arrowBase
{
  return 26.0;
}

+ (double)cornerRadius
{
  return 13.0;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_requestedBackgroundStyle = a3;
  [(_UIPopoverShapeLayerChromeView *)self _updateBackgroundStyle];
}

- (void)setArrowDirection:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPopoverShapeLayerChromeView;
  [(_UIPopoverStandardChromeView *)&v4 setArrowDirection:a3];
  [(UIView *)self setNeedsLayout];
}

- (_UIPopoverShapeLayerChromeView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIPopoverShapeLayerChromeView;
  unint64_t v3 = -[_UIPopoverStandardChromeView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_super v4 = objc_alloc_init(_UIPopoverShapeLayerView);
    shapeLayerMaskView = v3->_shapeLayerMaskView;
    v3->_shapeLayerMaskView = v4;
  }
  return v3;
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)_UIPopoverShapeLayerChromeView;
  [(UIView *)&v5 didMoveToWindow];
  unint64_t v3 = [(UIView *)self window];

  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __49___UIPopoverShapeLayerChromeView_didMoveToWindow__block_invoke;
    v4[3] = &unk_1E52D9F70;
    v4[4] = self;
    +[UIView performWithoutAnimation:v4];
  }
}

- (id)backgroundEffect
{
  if ([(UIPopoverBackgroundView *)self _backgroundBlurEffectStyle] != 1000)
  {
    int64_t v6 = [(UIPopoverBackgroundView *)self _backgroundBlurEffectStyle];
    objc_super v4 = [(_UIPopoverStandardChromeView *)self popoverBackgroundColor];
    uint64_t v5 = v6;
    goto LABEL_9;
  }
  int64_t backgroundStyle = self->_backgroundStyle;
  switch(backgroundStyle)
  {
    case 100:
      objc_super v4 = [(_UIPopoverStandardChromeView *)self popoverBackgroundColor];
      uint64_t v5 = 1200;
      goto LABEL_9;
    case 7:
      objc_super v4 = [(_UIPopoverStandardChromeView *)self popoverBackgroundColor];
      uint64_t v5 = 99;
      goto LABEL_9;
    case 6:
      objc_super v4 = [(_UIPopoverStandardChromeView *)self popoverBackgroundColor];
      uint64_t v5 = 0;
LABEL_9:
      objc_super v7 = +[_UIPopoverBackgroundVisualEffect effectWithStyle:v5 tint:v4];

      goto LABEL_10;
  }
  objc_super v7 = 0;
LABEL_10:
  return v7;
}

- (void)_updateBackgroundStyle
{
  int64_t v3 = [(_UIPopoverShapeLayerChromeView *)self _resolvedBackgroundStyle];
  if (v3 != self->_backgroundStyle)
  {
    int64_t v4 = v3;
    self->_int64_t backgroundStyle = v3;
    uint64_t v5 = [(UIView *)self window];

    if (v5)
    {
      if ((unint64_t)(v4 - 6) < 2 || v4 == 100)
      {
        [(_UIPopoverShapeLayerChromeView *)self _configureEffectView];
      }
      else
      {
        [(_UIPopoverShapeLayerChromeView *)self _removeEffectView];
      }
    }
  }
}

- (void)_configureEffectView
{
  if (self->_blurView)
  {
    [(UIPopoverBackgroundView *)self _updateChrome];
  }
  else
  {
    int64_t v3 = [UIVisualEffectView alloc];
    int64_t v4 = [(_UIPopoverShapeLayerChromeView *)self backgroundEffect];
    uint64_t v5 = [(UIVisualEffectView *)v3 initWithEffect:v4];
    blurView = self->_blurView;
    self->_blurView = v5;

    BOOL v7 = [(UIPopoverBackgroundView *)self _chromeHidden];
    double v8 = 1.0;
    if (v7) {
      double v8 = 0.0;
    }
    [(UIView *)self->_blurView setAlpha:v8];
    [(UIVisualEffectView *)self->_blurView _setUseLiveMasking:1];
    double v9 = [(_UIPopoverStandardChromeView *)self popoverBackgroundColor];
    double v10 = [(UIVisualEffectView *)self->_blurView contentView];
    [v10 setBackgroundColor:v9];

    [(UIView *)self->_blurView setAutoresizingMask:18];
    [(UIView *)self bounds];
    -[UIView setFrame:](self->_blurView, "setFrame:");
    double v11 = [(id)objc_opt_class() visualEffectGroupName];

    if (v11)
    {
      double v12 = [(id)objc_opt_class() visualEffectGroupName];
      [(UIVisualEffectView *)self->_blurView _setGroupName:v12];
    }
  }
  long long v13 = self->_blurView;
  [(UIView *)self insertSubview:v13 atIndex:0];
}

+ (id)visualEffectGroupName
{
  return 0;
}

- (void)_createStrokeView
{
  int64_t v3 = [_UIPopoverShapeLayerView alloc];
  [(UIView *)self bounds];
  int64_t v4 = -[UIView initWithFrame:](v3, "initWithFrame:");
  shapeLayerStrokeView = self->_shapeLayerStrokeView;
  self->_shapeLayerStrokeView = v4;

  [(UIView *)self->_shapeLayerStrokeView setAutoresizingMask:18];
  [(UIView *)self->_shapeLayerStrokeView setUserInteractionEnabled:0];
  id v9 = [(UIView *)self->_shapeLayerStrokeView layer];
  [v9 setLineWidth:2.0];
  id v6 = +[UIColor clearColor];
  objc_msgSend(v9, "setFillColor:", objc_msgSend(v6, "CGColor"));

  BOOL v7 = +[UITraitCollection systemTraitsAffectingColorAppearance];
  id v8 = [(UIView *)self registerForTraitChanges:v7 withAction:sel__updateStrokeViewColor];

  [(_UIPopoverShapeLayerChromeView *)self _updateStrokeViewColor];
  [(UIView *)self addSubview:self->_shapeLayerStrokeView];
}

- (void)_updateStrokeViewColor
{
  if (self->_shapeLayerStrokeView)
  {
    int64_t v3 = [(UIView *)self traitCollection];
    uint64_t v4 = [v3 userInterfaceStyle];

    BOOL v5 = v4 == 1000 || v4 == 2;
    double v6 = 0.1;
    if (!v5) {
      double v6 = 0.16;
    }
    BOOL v7 = +[UIColor colorWithWhite:1.0 alpha:v6];
    id v8 = [(UIView *)self->_shapeLayerStrokeView layer];
    id v9 = v7;
    objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v9, "CGColor"));
  }
}

- (double)minNonPinnedOffset
{
  unint64_t v3 = [(_UIPopoverStandardChromeView *)self arrowDirection];
  if (v3 - 1 < 2)
  {
    [(UIView *)self bounds];
    goto LABEL_6;
  }
  if (v3 == 4 || (double result = 0.0, v3 == 8))
  {
    [(UIView *)self bounds];
    double v6 = v5;
LABEL_6:
    double v7 = floor(v6 * 0.5);
    [(UIPopoverBackgroundView *)self _customCornerRadius];
    return -(v7 - v8 + -15.0);
  }
  return result;
}

- (UIEdgeInsets)_shadowInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)_shadowOpacity
{
  return 0.0;
}

- (double)_shadowRadius
{
  return 0.0;
}

- (CGSize)_shadowOffset
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_removeEffectView
{
  [(UIView *)self->_blurView removeFromSuperview];
  blurView = self->_blurView;
  self->_blurView = 0;
}

- (int64_t)backgroundStyle
{
  return self->_requestedBackgroundStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeLayerStrokeView, 0);
  objc_storeStrong((id *)&self->_shapeLayerMaskView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end