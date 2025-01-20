@interface _UIParallaxDimmingView
- (UIColor)dimmingColor;
- (UIView)addingSubview;
- (_UIParallaxDimmingView)initWithFrame:(CGRect)a3;
- (_UIParallaxDimmingView)initWithFrame:(CGRect)a3 overrideDimmingColor:(id)a4;
- (double)backgroundDimmingAmount;
- (double)presentationDimmingAmount;
- (id)_basicAnimationWithKeyPath:(id)a3;
- (id)defaultBorderColor;
- (id)initViewWrappingView:(id)a3 withLeftBorder:(double)a4 shouldReverseLayoutDirection:(BOOL)a5;
- (void)_updateLeftEdgeFade:(BOOL)a3;
- (void)crossFade;
- (void)didMoveToWindow;
- (void)setAddingSubview:(id)a3;
- (void)setBackgroundDimmingAmount:(double)a3;
- (void)setDimmingColor:(id)a3;
@end

@implementation _UIParallaxDimmingView

- (_UIParallaxDimmingView)initWithFrame:(CGRect)a3
{
  return -[_UIParallaxDimmingView initWithFrame:overrideDimmingColor:](self, "initWithFrame:overrideDimmingColor:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIParallaxDimmingView)initWithFrame:(CGRect)a3 overrideDimmingColor:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UIParallaxDimmingView;
  v10 = -[UIView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    if (v9)
    {
      [(_UIParallaxDimmingView *)v10 setDimmingColor:v9];
    }
    else
    {
      v12 = +[UIColor blackColor];
      v13 = [v12 colorWithAlphaComponent:0.1];
      [(_UIParallaxDimmingView *)v11 setDimmingColor:v13];
    }
    v14 = [(_UIParallaxDimmingView *)v11 dimmingColor];
    [(UIView *)v11 setBackgroundColor:v14];

    [(UIView *)v11 setOpaque:0];
    v11->_backgroundDimmingAmount = 1.0;
  }

  return v11;
}

- (id)defaultBorderColor
{
  double v5 = 0.0;
  uint64_t v6 = 0;
  v2 = [(_UIParallaxDimmingView *)self dimmingColor];
  [v2 getWhite:&v6 alpha:&v5];
  v3 = [v2 colorWithAlphaComponent:v5 * 1.05];

  return v3;
}

- (id)initViewWrappingView:(id)a3 withLeftBorder:(double)a4 shouldReverseLayoutDirection:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  [v7 frame];
  v8 = -[_UIParallaxDimmingView initWithFrame:](self, "initWithFrame:");
  id v9 = v8;
  if (v8)
  {
    [(UIView *)v8 setBackgroundColor:0];
    [(UIView *)v9 bounds];
    objc_msgSend(v7, "setFrame:");
    [(_UIParallaxDimmingView *)v9 setAddingSubview:v7];
    v10 = [[_UIVerticalEdgeShadowView alloc] initWithWidth:2 edge:9.0];
    leftEdgeFade = v9->leftEdgeFade;
    v9->leftEdgeFade = &v10->super.super;

    [(_UIParallaxDimmingView *)v9 _updateLeftEdgeFade:v5];
    [(UIView *)v9 addSubview:v9->leftEdgeFade];
  }

  return v9;
}

- (void)_updateLeftEdgeFade:(BOOL)a3
{
  [(UIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(UIView *)self->leftEdgeFade frame];
  double v15 = v14;
  if (a3)
  {
    uint64_t v16 = 4;
    double v8 = v13;
  }
  else
  {
    [(UIView *)self->leftEdgeFade frame];
    double v10 = v6 - v17;
    uint64_t v16 = 3;
  }
  -[UIImageView setFrame:](self->leftEdgeFade, "setFrame:", v10, v8, v15, v12);
  [(UIView *)self->leftEdgeFade bounds];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = [(UIView *)self->leftEdgeFade maskView];
  objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

  [(UIView *)self setSemanticContentAttribute:v16];
  leftEdgeFade = self->leftEdgeFade;
  [(UIImageView *)leftEdgeFade setSemanticContentAttribute:v16];
}

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)_UIParallaxDimmingView;
  [(UIView *)&v7 didMoveToWindow];
  uint64_t v3 = [(UIView *)self window];
  if (v3)
  {
    v4 = (void *)v3;
    double v5 = [(_UIParallaxDimmingView *)self addingSubview];

    if (v5)
    {
      double v6 = [(_UIParallaxDimmingView *)self addingSubview];
      [(UIView *)self addSubview:v6];

      [(_UIParallaxDimmingView *)self setAddingSubview:0];
    }
  }
}

- (id)_basicAnimationWithKeyPath:(id)a3
{
  return (id)[MEMORY[0x1E4F39B48] animationWithKeyPath:a3];
}

- (void)setBackgroundDimmingAmount:(double)a3
{
  if (self->_backgroundDimmingAmount != a3)
  {
    self->_backgroundDimmingAmount = a3;
    if (self->leftEdgeFade) {
      self = (_UIParallaxDimmingView *)self->leftEdgeFade;
    }
    -[UIView setAlpha:](self, "setAlpha:");
  }
}

- (double)presentationDimmingAmount
{
  if (self->leftEdgeFade) {
    self = (_UIParallaxDimmingView *)self->leftEdgeFade;
  }
  v2 = [(UIView *)self layer];
  uint64_t v3 = [v2 presentationLayer];
  [v3 opacity];
  double v5 = v4;

  return v5;
}

- (void)crossFade
{
  [(_UIParallaxDimmingView *)self backgroundDimmingAmount];
  BOOL v4 = v3 == 1.0;
  double v5 = 0.0;
  if (!v4) {
    double v5 = 1.0;
  }
  [(_UIParallaxDimmingView *)self setBackgroundDimmingAmount:v5];
}

- (double)backgroundDimmingAmount
{
  return self->_backgroundDimmingAmount;
}

- (UIColor)dimmingColor
{
  return self->_dimmingColor;
}

- (void)setDimmingColor:(id)a3
{
}

- (UIView)addingSubview
{
  return self->_addingSubview;
}

- (void)setAddingSubview:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addingSubview, 0);
  objc_storeStrong((id *)&self->_dimmingColor, 0);
  objc_storeStrong((id *)&self->leftEdgeFade, 0);
}

@end