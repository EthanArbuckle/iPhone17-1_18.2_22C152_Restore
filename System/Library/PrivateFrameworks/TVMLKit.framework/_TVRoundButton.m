@interface _TVRoundButton
+ (id)_buttonContentWithFrame:(CGRect)a3 blurEffectStyle:(int64_t)a4 blurEnabled:(BOOL)a5;
- (BOOL)shouldPunchThroughImage;
- (_TVRoundButton)initWithFrame:(CGRect)a3 blurEffectStyle:(int64_t)a4 blurEnabled:(BOOL)a5;
- (void)_imageViewDidLoadImage:(id)a3;
- (void)_updateBackgroundColorForState:(unint64_t)a3;
- (void)_updateFloaingViewFocusState:(BOOL)a3 coordinator:(id)a4;
- (void)_updateFloatingViewFocusStateIfNeeded;
- (void)_updateFocusStateWithCoordinator:(id)a3;
- (void)_updateImageMask;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setImageView:(id)a3;
- (void)setShouldPunchThroughImage:(BOOL)a3;
@end

@implementation _TVRoundButton

+ (id)_buttonContentWithFrame:(CGRect)a3 blurEffectStyle:(int64_t)a4 blurEnabled:(BOOL)a5
{
  v5 = -[TVButtonContent initWithFrame:blurEffectStyle:blurEnabled:]([_TVRoundButtonContent alloc], "initWithFrame:blurEffectStyle:blurEnabled:", a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return v5;
}

- (_TVRoundButton)initWithFrame:(CGRect)a3 blurEffectStyle:(int64_t)a4 blurEnabled:(BOOL)a5
{
  v12.receiver = self;
  v12.super_class = (Class)_TVRoundButton;
  v5 = -[TVButton initWithFrame:blurEffectStyle:blurEnabled:](&v12, sel_initWithFrame_blurEffectStyle_blurEnabled_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_shouldPunchThroughImage = 0;
    v7 = [(TVButton *)v5 floatingView];
    [v7 setUseShadowImage:0];

    v8 = [(TVButton *)v6 floatingView];
    [v8 setShadowVerticalOffset:12.0];

    v9 = [(TVButton *)v6 floatingView];
    [v9 setShadowRadius:5.0];

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v6 selector:sel__imageViewDidLoadImage_ name:@"TVMLImageViewImageDidLoadNotification" object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_TVRoundButton;
  [(_TVRoundButton *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)_TVRoundButton;
  [(TVButton *)&v18 layoutSubviews];
  [(_TVRoundButton *)self bounds];
  double v5 = v4;
  BOOL v6 = v3 > 0.0 && v3 == v4;
  double v7 = v3 * 0.5;
  if (!v6) {
    double v7 = 0.0;
  }
  v17.receiver = self;
  v17.super_class = (Class)_TVRoundButton;
  [(TVButton *)&v17 setCornerRadius:v7];
  if (fabs(-(floor(v5 * 0.5) - v5 * 0.5)) <= 2.22044605e-16)
  {
    v8 = [(TVButton *)self floatingView];
    [v8 center];
    double v10 = v9;
    double v12 = v11;

    v13 = [(TVButton *)self floatingView];
    objc_msgSend(v13, "setCenter:", v10, v12 + -0.5);
  }
  imageMask = self->_imageMask;
  v15 = [(TVButton *)self buttonContent];
  v16 = [(TVButton *)self imageView];
  [v15 _frameForImageView:v16];
  -[CALayer setFrame:](imageMask, "setFrame:");

  [(_TVRoundButton *)self _updateFloatingViewFocusStateIfNeeded];
}

- (void)setShouldPunchThroughImage:(BOOL)a3
{
  if (self->_shouldPunchThroughImage != a3)
  {
    self->_shouldPunchThroughImage = a3;
    double v4 = [(TVButton *)self imageView];
    double v5 = [v4 image];

    if (v5)
    {
      [(_TVRoundButton *)self _updateImageMask];
    }
  }
}

- (void)setImageView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVRoundButton;
  [(TVButton *)&v6 setImageView:a3];
  double v4 = [(TVButton *)self imageView];
  double v5 = [v4 image];

  if (v5) {
    [(_TVRoundButton *)self _updateImageMask];
  }
}

- (void)_imageViewDidLoadImage:(id)a3
{
  double v4 = [a3 object];
  double v5 = [(TVButton *)self imageView];

  if (v4 == v5)
  {
    [(_TVRoundButton *)self _updateImageMask];
  }
}

- (void)_updateImageMask
{
  [(CALayer *)self->_imageMask removeFromSuperlayer];
  double v3 = [(TVButton *)self overlayView];
  [v3 setHidden:1];

  if ([(_TVRoundButton *)self shouldPunchThroughImage])
  {
    double v4 = [(TVButton *)self imageView];
    double v5 = [v4 image];

    if (v5)
    {
      objc_super v6 = [(TVButton *)self imageView];
      double v7 = [v6 image];
      v8 = [MEMORY[0x263F1C550] blackColor];
      double v9 = [v7 _flatImageWithColor:v8];

      double v10 = [MEMORY[0x263F157E8] layer];
      imageMask = self->_imageMask;
      self->_imageMask = v10;

      [(CALayer *)self->_imageMask setCompositingFilter:*MEMORY[0x263F15B90]];
      double v12 = [(TVButton *)self overlayView];
      v13 = [v12 layer];
      [v13 addSublayer:self->_imageMask];

      v14 = self->_imageMask;
      id v15 = v9;
      -[CALayer setContents:](v14, "setContents:", [v15 CGImage]);
      v16 = [(TVButton *)self imageView];
      [v16 frame];
      -[CALayer setFrame:](self->_imageMask, "setFrame:");
    }
  }
  uint64_t v17 = [(_TVRoundButton *)self state];
  [(_TVRoundButton *)self _updateBackgroundColorForState:v17];
}

- (void)_updateBackgroundColorForState:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_TVRoundButton;
  [(TVButton *)&v11 _updateBackgroundColorForState:a3];
  if ([(_TVRoundButton *)self shouldPunchThroughImage])
  {
    double v4 = [(TVButton *)self imageView];
    double v5 = [v4 image];

    if (v5)
    {
      objc_super v6 = [(TVButton *)self floatingView];
      [v6 setBackgroundColor:0 forState:8];

      double v7 = [(TVButton *)self floatingView];
      [v7 setBackgroundColor:0 forState:1];

      v8 = [(TVButton *)self overlayView];
      double v9 = [(TVButton *)self highlightColor];
      [v8 setBackgroundColor:v9];

      double v10 = [(TVButton *)self overlayView];
      [v10 setHidden:0];
    }
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)_TVRoundButton;
  [(_TVRoundButton *)&v3 didMoveToWindow];
  [(_TVRoundButton *)self _updateFloatingViewFocusStateIfNeeded];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVRoundButton;
  -[_TVRoundButton setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_TVRoundButton *)self _updateFloatingViewFocusStateIfNeeded];
}

- (void)_updateFloatingViewFocusStateIfNeeded
{
  uint64_t v3 = [(_TVRoundButton *)self window];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    [(_TVRoundButton *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v9 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);

    if (v6 != v9 || v8 != v10)
    {
      dispatch_block_t block = (dispatch_block_t)MEMORY[0x230FC9DC0](self->_updateFloatingViewFocusStateBlock);
      id updateFloatingViewFocusStateBlock = self->_updateFloatingViewFocusStateBlock;
      self->_id updateFloatingViewFocusStateBlock = 0;

      v13 = block;
      if (block)
      {
        dispatch_async(MEMORY[0x263EF83A0], block);
        v13 = block;
      }
    }
  }
}

- (void)_updateFloaingViewFocusState:(BOOL)a3 coordinator:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(_TVRoundButton *)self window];
  if (!v7) {
    goto LABEL_10;
  }
  double v8 = (void *)v7;
  [(_TVRoundButton *)self bounds];
  double v10 = v9;
  double v12 = v11;
  double v13 = *MEMORY[0x263F001B0];
  double v14 = *(double *)(MEMORY[0x263F001B0] + 8);

  if (v10 == v13 && v12 == v14)
  {
LABEL_10:
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __59___TVRoundButton__updateFloaingViewFocusState_coordinator___block_invoke;
    v21[3] = &unk_264BA7D88;
    objc_copyWeak(&v23, &location);
    BOOL v24 = v4;
    id v22 = v6;
    v19 = (void *)[v21 copy];
    id updateFloatingViewFocusStateBlock = self->_updateFloatingViewFocusStateBlock;
    self->_id updateFloatingViewFocusStateBlock = v19;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    v16 = [(TVButton *)self floatingView];
    uint64_t v17 = v16;
    if (v4) {
      uint64_t v18 = 8;
    }
    else {
      uint64_t v18 = 0;
    }
    [v16 setControlState:v18 withAnimationCoordinator:v6];
  }
}

- (void)_updateFocusStateWithCoordinator:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_TVRoundButton;
  [(TVButton *)&v8 _updateFocusStateWithCoordinator:a3];
  int v4 = [(_TVRoundButton *)self isFocused];
  double v5 = [(TVButton *)self imageView];
  BOOL v6 = [(_TVRoundButton *)self shouldPunchThroughImage];
  double v7 = 1.0;
  if ((v6 & v4) != 0) {
    double v7 = 0.0;
  }
  [v5 setAlpha:v7];
}

- (BOOL)shouldPunchThroughImage
{
  return self->_shouldPunchThroughImage;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateFloatingViewFocusStateBlock, 0);
  objc_storeStrong((id *)&self->_imageMask, 0);
}

@end