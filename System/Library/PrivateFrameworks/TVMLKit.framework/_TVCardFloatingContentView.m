@interface _TVCardFloatingContentView
- (CGSize)focusedShadowCardSize;
- (CGSize)unfocusedShadowCardSize;
- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3;
- (UIImage)focusedShadowImage;
- (UIImage)unfocusedShadowImage;
- (_TVCardFloatingContentView)initWithFrame:(CGRect)a3;
- (double)focusedShadowAlpha;
- (double)unfocusedShadowAlpha;
- (id)pressCompletionBlock;
- (void)_updateForAccessibilityChange;
- (void)dealloc;
- (void)floatingContentView:(id)a3 didFinishTransitioningToState:(unint64_t)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBgColor:(id)a3 highlightBgColor:(id)a4 cornerRadius:(double)a5;
- (void)setFocusedShadowAlpha:(double)a3;
- (void)setFocusedShadowCardSize:(CGSize)a3;
- (void)setFocusedShadowImage:(id)a3;
- (void)setPressCompletionBlock:(id)a3;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)setUnfocusedShadowAlpha:(double)a3;
- (void)setUnfocusedShadowCardSize:(CGSize)a3;
- (void)setUnfocusedShadowImage:(id)a3;
@end

@implementation _TVCardFloatingContentView

- (_TVCardFloatingContentView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_TVCardFloatingContentView;
  v3 = -[_UIFloatingContentView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_UIFloatingContentView *)v3 setContentOpaque:1];
    -[_UIFloatingContentView setContentMotionRotation:translation:](v4, "setContentMotionRotation:translation:", 0.08, 0.08, 12.0, 12.0);
    if (objc_opt_respondsToSelector()) {
      [(_UIFloatingContentView *)v4 setHighlightStyle:1];
    }
    [(_UIFloatingContentView *)v4 setFloatingContentDelegate:v4];
    -[_TVCardFloatingContentView setFocusedShadowCardSize:](v4, "setFocusedShadowCardSize:", 200.0, 200.0);
    -[_TVCardFloatingContentView setUnfocusedShadowCardSize:](v4, "setUnfocusedShadowCardSize:", 26.0, 26.0);
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v4 selector:sel__updateForAccessibilityChange name:*MEMORY[0x263F8B200] object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_TVCardFloatingContentView;
  [(_UIFloatingContentView *)&v4 dealloc];
}

- (void)_updateForAccessibilityChange
{
  BOOL v3 = _AXSHighContrastFocusIndicatorsEnabled() != 0;
  [(_UIFloatingContentView *)self setShowsHighContrastFocusIndicator:v3];
}

- (void)setBgColor:(id)a3 highlightBgColor:(id)a4 cornerRadius:(double)a5
{
  unint64_t v9 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  self->_unfocusedAlpha = 1.0;
  [(_UIFloatingContentView *)self setCornerRadius:0.0];
  [(_UIFloatingContentView *)self setBackgroundColor:0 forState:0];
  [(_UIFloatingContentView *)self setBackgroundColor:0 forState:8];
  [(_UIFloatingContentView *)self setBackgroundColor:0 forState:1];
  [(_UIFloatingContentView *)self setBackgroundColor:0 forState:4];
  if (v9 | v8)
  {
    [(_TVCardFloatingContentView *)self setAlpha:1.0];
    [(_UIFloatingContentView *)self setCornerRadius:a5];
    [(_UIFloatingContentView *)self setBackgroundColor:v9 forState:0];
    if (v8)
    {
      [(_UIFloatingContentView *)self setBackgroundColor:v8 forState:8];
      [(_UIFloatingContentView *)self setBackgroundColor:v8 forState:1];
      [(_UIFloatingContentView *)self setBackgroundColor:v8 forState:4];
    }
  }
}

- (void)prepareForReuse
{
  BOOL v3 = [(_UIFloatingContentView *)self contentView];
  objc_super v4 = [v3 subviews];
  [v4 makeObjectsPerformSelector:sel_removeFromSuperview];

  unfocusedShadowView = self->_unfocusedShadowView;
  self->_unfocusedShadowView = 0;

  focusedShadowView = self->_focusedShadowView;
  self->_focusedShadowView = 0;
}

- (void)setUnfocusedShadowImage:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_unfocusedShadowImage, a3);
  [v5 size];
  double v7 = v6;
  double v9 = v8;
  [(_TVCardFloatingContentView *)self bounds];
  double Width = CGRectGetWidth(v26);
  double v11 = self->_unfocusedShadowCardSize.width;
  [(_TVCardFloatingContentView *)self bounds];
  double Height = CGRectGetHeight(v27);
  double v13 = self->_unfocusedShadowCardSize.height;
  [(_TVCardFloatingContentView *)self bounds];
  double v14 = CGRectGetWidth(v28);
  [(_TVCardFloatingContentView *)self bounds];
  double v15 = CGRectGetHeight(v29);
  unfocusedShadowView = self->_unfocusedShadowView;
  if (!unfocusedShadowView)
  {
    v17 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", floor((v14 - (v7 + Width - v11)) * 0.5), floor((v15 - (v9 + Height - v13)) * 0.5), v7 + Width - v11, v9 + Height - v13);
    v18 = self->_unfocusedShadowView;
    self->_unfocusedShadowView = v17;

    v19 = [(_UIFloatingContentView *)self contentView];
    [v19 insertSubview:self->_unfocusedShadowView atIndex:0];

    unfocusedShadowView = self->_unfocusedShadowView;
  }
  v20 = [(UIView *)unfocusedShadowView layer];
  id v24 = v5;
  objc_msgSend(v20, "setContents:", objc_msgSend(v24, "CGImage"));

  v21 = [(UIView *)self->_unfocusedShadowView layer];
  [v24 scale];
  objc_msgSend(v21, "setContentsScale:");

  v22 = [(UIView *)self->_unfocusedShadowView layer];
  objc_msgSend(v22, "setContentsCenter:", 0.5, 0.5, 0.1, 0.1);

  double unfocusedShadowAlpha = 0.0;
  if (!self->_isSelected) {
    double unfocusedShadowAlpha = self->_unfocusedShadowAlpha;
  }
  [(UIView *)self->_unfocusedShadowView setAlpha:unfocusedShadowAlpha];
}

- (void)setFocusedShadowImage:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_focusedShadowImage, a3);
  [v5 size];
  double v7 = v6;
  double v9 = v8;
  [(_TVCardFloatingContentView *)self bounds];
  double Width = CGRectGetWidth(v26);
  double v11 = self->_focusedShadowCardSize.width;
  [(_TVCardFloatingContentView *)self bounds];
  double Height = CGRectGetHeight(v27);
  double v13 = self->_focusedShadowCardSize.height;
  [(_TVCardFloatingContentView *)self bounds];
  double v14 = CGRectGetWidth(v28);
  [(_TVCardFloatingContentView *)self bounds];
  double v15 = CGRectGetHeight(v29);
  focusedShadowView = self->_focusedShadowView;
  if (!focusedShadowView)
  {
    v17 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", floor((v14 - (v7 + Width - v11)) * 0.5), floor((v15 - (v9 + Height - v13)) * 0.5), v7 + Width - v11, v9 + Height - v13);
    v18 = self->_focusedShadowView;
    self->_focusedShadowView = v17;

    v19 = [(_UIFloatingContentView *)self contentView];
    [v19 insertSubview:self->_focusedShadowView atIndex:0];

    focusedShadowView = self->_focusedShadowView;
  }
  v20 = [(UIView *)focusedShadowView layer];
  id v24 = v5;
  objc_msgSend(v20, "setContents:", objc_msgSend(v24, "CGImage"));

  v21 = [(UIView *)self->_focusedShadowView layer];
  [v24 scale];
  objc_msgSend(v21, "setContentsScale:");

  v22 = [(UIView *)self->_focusedShadowView layer];
  objc_msgSend(v22, "setContentsCenter:", 0.5, 0.5, 0.1, 0.1);

  if (self->_isSelected) {
    double focusedShadowAlpha = self->_focusedShadowAlpha;
  }
  else {
    double focusedShadowAlpha = 0.0;
  }
  [(UIView *)self->_focusedShadowView setAlpha:focusedShadowAlpha];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  self->_isSelected = v6;
  if (v6) {
    uint64_t v9 = 8;
  }
  else {
    uint64_t v9 = 0;
  }
  [(_UIFloatingContentView *)self setControlState:v9 withAnimationCoordinator:v8];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __76___TVCardFloatingContentView_setSelected_animated_withAnimationCoordinator___block_invoke;
  v21[3] = &unk_264BA6878;
  v21[4] = self;
  BOOL v22 = v6;
  v10 = (void (**)(void))MEMORY[0x230FC9DC0](v21);
  double v11 = v10;
  if (v5)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __76___TVCardFloatingContentView_setSelected_animated_withAnimationCoordinator___block_invoke_3;
    v19[3] = &unk_264BA68A0;
    v20 = v10;
    [v8 addCoordinatedAnimationsForAnimation:!v6 animations:v19 completion:0];
  }
  else
  {
    v10[2](v10);
  }
  v12 = [(_UIFloatingContentView *)self contentView];
  double v13 = [v12 subviews];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __76___TVCardFloatingContentView_setSelected_animated_withAnimationCoordinator___block_invoke_4;
  v15[3] = &unk_264BA68C8;
  BOOL v17 = v6;
  BOOL v18 = v5;
  id v16 = v8;
  id v14 = v8;
  [v13 enumerateObjectsUsingBlock:v15];
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v7 = a3 | (8 * self->_isSelected);
  id v8 = a5;
  [(_UIFloatingContentView *)self setControlState:v7 animated:v5];
  [(_TVCardFloatingContentView *)self setPressCompletionBlock:v8];
}

- (void)floatingContentView:(id)a3 didFinishTransitioningToState:(unint64_t)a4
{
  BOOL v5 = [(_TVCardFloatingContentView *)self pressCompletionBlock];

  if (v5)
  {
    BOOL v6 = [(_TVCardFloatingContentView *)self pressCompletionBlock];
    v6[2]();

    [(_TVCardFloatingContentView *)self setPressCompletionBlock:0];
  }
}

- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3
{
  if (a3.width == 0.0 || (double height = a3.height, a3.height == 0.0))
  {
    [(_TVCardFloatingContentView *)self bounds];
    double width = v6;
    double height = v7;
  }
  else
  {
    double width = a3.width;
  }
  id v8 = [(_TVCardFloatingContentView *)self layer];
  [v8 anchorPoint];
  double v10 = v9;
  double v12 = v11;

  if (width <= height) {
    double v13 = height;
  }
  else {
    double v13 = width;
  }
  [(_UIFloatingContentView *)self focusedSizeIncrease];
  double v15 = (v13 + v14) / v13;
  double v16 = width * v15 - width;
  double v17 = height * v15 - height;
  double v18 = floor(v12 * v17);
  double v19 = floor(v10 * v16);
  double v20 = floor((1.0 - v12) * v17);
  double v21 = floor((1.0 - v10) * v16);
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)_TVCardFloatingContentView;
  [(_UIFloatingContentView *)&v27 layoutSubviews];
  BOOL v3 = [(_TVCardFloatingContentView *)self unfocusedShadowImage];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  [(_TVCardFloatingContentView *)self bounds];
  double v8 = v5 + CGRectGetWidth(v28);
  [(_TVCardFloatingContentView *)self unfocusedShadowCardSize];
  double v10 = v8 - v9;
  [(_TVCardFloatingContentView *)self bounds];
  double v11 = v7 + CGRectGetHeight(v29);
  [(_TVCardFloatingContentView *)self unfocusedShadowCardSize];
  double v13 = v11 - v12;
  [(_TVCardFloatingContentView *)self bounds];
  double v14 = floor((CGRectGetWidth(v30) - v10) * 0.5);
  [(_TVCardFloatingContentView *)self bounds];
  -[UIView setFrame:](self->_unfocusedShadowView, "setFrame:", v14, floor((CGRectGetHeight(v31) - v13) * 0.5), v10, v13);
  double v15 = [(_TVCardFloatingContentView *)self focusedShadowImage];
  [v15 size];
  double v17 = v16;
  double v19 = v18;

  [(_TVCardFloatingContentView *)self bounds];
  double v20 = v17 + CGRectGetWidth(v32);
  [(_TVCardFloatingContentView *)self focusedShadowCardSize];
  double v22 = v20 - v21;
  [(_TVCardFloatingContentView *)self bounds];
  double v23 = v19 + CGRectGetHeight(v33);
  [(_TVCardFloatingContentView *)self focusedShadowCardSize];
  double v25 = v23 - v24;
  [(_TVCardFloatingContentView *)self bounds];
  double v26 = floor((CGRectGetWidth(v34) - v22) * 0.5);
  [(_TVCardFloatingContentView *)self bounds];
  -[UIView setFrame:](self->_focusedShadowView, "setFrame:", v26, floor((CGRectGetHeight(v35) - v25) * 0.5), v22, v25);
}

- (double)unfocusedShadowAlpha
{
  return self->_unfocusedShadowAlpha;
}

- (void)setUnfocusedShadowAlpha:(double)a3
{
  self->_double unfocusedShadowAlpha = a3;
}

- (double)focusedShadowAlpha
{
  return self->_focusedShadowAlpha;
}

- (void)setFocusedShadowAlpha:(double)a3
{
  self->_double focusedShadowAlpha = a3;
}

- (UIImage)unfocusedShadowImage
{
  return self->_unfocusedShadowImage;
}

- (UIImage)focusedShadowImage
{
  return self->_focusedShadowImage;
}

- (CGSize)focusedShadowCardSize
{
  double width = self->_focusedShadowCardSize.width;
  double height = self->_focusedShadowCardSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFocusedShadowCardSize:(CGSize)a3
{
  self->_focusedShadowCardSize = a3;
}

- (CGSize)unfocusedShadowCardSize
{
  double width = self->_unfocusedShadowCardSize.width;
  double height = self->_unfocusedShadowCardSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setUnfocusedShadowCardSize:(CGSize)a3
{
  self->_unfocusedShadowCardSize = a3;
}

- (id)pressCompletionBlock
{
  return self->_pressCompletionBlock;
}

- (void)setPressCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pressCompletionBlock, 0);
  objc_storeStrong((id *)&self->_focusedShadowImage, 0);
  objc_storeStrong((id *)&self->_unfocusedShadowImage, 0);
  objc_storeStrong((id *)&self->_focusedShadowView, 0);
  objc_storeStrong((id *)&self->_unfocusedShadowView, 0);
}

@end