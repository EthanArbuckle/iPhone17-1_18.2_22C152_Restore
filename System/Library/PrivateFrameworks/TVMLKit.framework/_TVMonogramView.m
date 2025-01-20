@interface _TVMonogramView
- (BOOL)isFocusedStateEnabled;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (TVImageProxy)imageProxy;
- (TVMonogramViewConfiguration)configuration;
- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3;
- (UIImage)image;
- (UIImage)placeholderImage;
- (UIView)overlayView;
- (_TVImageView)imageView;
- (_TVMonogramDescription)monogramDescription;
- (_TVMonogramView)initWithFrame:(CGRect)a3 configuration:(id)a4;
- (double)unfocusedImageAlpha;
- (id)pressCompletionBlock;
- (void)_loadWithMonogramDescription:(id)a3 imageProxy:(id)a4;
- (void)_updateFocusedShadowFrameAndLayerWithFrame:(CGRect)a3;
- (void)_updatePlaceholerView;
- (void)_updateUnfocusedShadowFrameAndLayerWithFrame:(CGRect)a3;
- (void)floatingContentView:(id)a3 didFinishTransitioningToState:(unint64_t)a4;
- (void)layoutSubviews;
- (void)setFocusedStateEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageProxy:(id)a3;
- (void)setImageView:(id)a3;
- (void)setMonogramDescription:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPressCompletionBlock:(id)a3;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)setUnfocusedImageAlpha:(double)a3;
@end

@implementation _TVMonogramView

- (_TVMonogramView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v31.receiver = self;
  v31.super_class = (Class)_TVMonogramView;
  v11 = -[_UIFloatingContentView initWithFrame:](&v31, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a4);
    [(_UIFloatingContentView *)v12 setContentOpaque:1];
    [(_UIFloatingContentView *)v12 setBackgroundColor:0 forState:0];
    [(_UIFloatingContentView *)v12 setBackgroundColor:0 forState:8];
    [(_UIFloatingContentView *)v12 setBackgroundColor:0 forState:1];
    [(_UIFloatingContentView *)v12 setBackgroundColor:0 forState:4];
    [(_UIFloatingContentView *)v12 setCornerRadius:0.0];
    -[_UIFloatingContentView setContentMotionRotation:translation:](v12, "setContentMotionRotation:translation:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 8.0, 8.0);
    [(_UIFloatingContentView *)v12 setFloatingContentDelegate:v12];
    [(_TVMonogramView *)v12 setFocusedStateEnabled:1];
    id v13 = objc_alloc(MEMORY[0x263F1CB60]);
    [(_TVMonogramView *)v12 bounds];
    uint64_t v14 = objc_msgSend(v13, "initWithFrame:");
    placeholderView = v12->_placeholderView;
    v12->_placeholderView = (UIView *)v14;

    [(UIView *)v12->_placeholderView setHidden:1];
    v16 = [(UIView *)v12->_placeholderView layer];
    [(_TVMonogramView *)v12 bounds];
    [v16 setCornerRadius:CGRectGetWidth(v32) * 0.5];

    v17 = [(_UIFloatingContentView *)v12 contentView];
    [v17 addSubview:v12->_placeholderView];

    v18 = [_TVImageView alloc];
    [(_TVMonogramView *)v12 bounds];
    uint64_t v19 = -[_TVImageView initWithFrame:](v18, "initWithFrame:");
    imageView = v12->_imageView;
    v12->_imageView = (_TVImageView *)v19;

    v21 = v12->_imageView;
    v22 = [v10 focusedBgColor];
    [(_TVImageView *)v21 _setFocusedColor:v22];

    [(_TVImageView *)v12->_imageView setClipsToBounds:1];
    [(_TVImageView *)v12->_imageView setContentMode:1];
    v23 = [(_UIFloatingContentView *)v12 contentView];
    [v23 addSubview:v12->_imageView];

    v24 = [v10 unfocusedShadowImage];

    if (v24)
    {
      [(_UIFloatingContentView *)v12 setShadowEnabled:0];
      [(_UIFloatingContentView *)v12 setClipsContentToBounds:0];
      id v25 = objc_alloc(MEMORY[0x263F1CB60]);
      uint64_t v26 = objc_msgSend(v25, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      unfocusedShadowView = v12->_unfocusedShadowView;
      v12->_unfocusedShadowView = (UIView *)v26;

      v28 = [(_UIFloatingContentView *)v12 contentView];
      [v28 insertSubview:v12->_unfocusedShadowView atIndex:0];

      v29 = v12->_unfocusedShadowView;
      [v10 unfocusedShadowAlpha];
      -[UIView setAlpha:](v29, "setAlpha:");
    }
  }

  return v12;
}

- (void)setImage:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    objc_storeStrong((id *)&self->_image, a3);
    [(_TVImageView *)self->_imageView setImage:v5];
    [(_TVImageView *)self->_imageView setAlpha:1.0];
  }
}

- (void)setPlaceholderImage:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    [(_TVImageView *)self->_imageView setPlaceholderImage:v5];
    [(_TVMonogramView *)self _updatePlaceholerView];
  }
}

- (void)setMonogramDescription:(id)a3
{
  v7 = (_TVMonogramDescription *)a3;
  if (self->_monogramDescription != v7)
  {
    objc_storeStrong((id *)&self->_monogramDescription, a3);
    if ([(_TVMonogramDescription *)v7 scaleMode] == 2) {
      [(_TVMonogramDescription *)v7 backgroundColor];
    }
    else {
    v5 = [(_TVMonogramDescription *)v7 fillColor];
    }
    [(UIView *)self->_placeholderView setBackgroundColor:v5];
    [(_TVMonogramView *)self _updatePlaceholerView];
    v6 = [(_TVMonogramView *)self imageProxy];
    [(_TVMonogramView *)self _loadWithMonogramDescription:v7 imageProxy:v6];
  }
}

- (void)_updatePlaceholerView
{
  v3 = [(_TVMonogramView *)self placeholderImage];
  BOOL v4 = v3 == 0;
  BOOL v5 = v3 != 0;

  [(UIView *)self->_placeholderView setHidden:v5];
  imageView = self->_imageView;
  [(_TVImageView *)imageView setHidden:v4];
}

- (void)_updateUnfocusedShadowFrameAndLayerWithFrame:(CGRect)a3
{
  CGFloat v4 = a3.size.width / 130.0;
  BOOL v5 = [(TVMonogramViewConfiguration *)self->_configuration unfocusedShadowImage];
  [v5 size];
  double v7 = v6;
  double v9 = v8;

  double v10 = floor(v4 * v7);
  double v11 = floor(v4 * v9);
  [(_TVMonogramView *)self bounds];
  double v12 = floor((CGRectGetWidth(v18) - v10) * 0.5);
  [(_TVMonogramView *)self bounds];
  -[UIView setFrame:](self->_unfocusedShadowView, "setFrame:", v12, floor((CGRectGetHeight(v19) - v11) * 0.5), v10, v11);
  id v13 = [(UIView *)self->_unfocusedShadowView layer];
  id v14 = [(TVMonogramViewConfiguration *)self->_configuration unfocusedShadowImage];
  objc_msgSend(v13, "setContents:", objc_msgSend(v14, "CGImage"));

  id v16 = [(UIView *)self->_unfocusedShadowView layer];
  v15 = [(TVMonogramViewConfiguration *)self->_configuration unfocusedShadowImage];
  [v15 scale];
  objc_msgSend(v16, "setContentsScale:");
}

- (void)_updateFocusedShadowFrameAndLayerWithFrame:(CGRect)a3
{
  CGFloat v4 = a3.size.width / 130.0;
  BOOL v5 = [(TVMonogramViewConfiguration *)self->_configuration focusedShadowImage];
  [v5 size];
  double v7 = v6;
  double v9 = v8;

  double v10 = floor(v4 * v7 * 0.78);
  double v11 = floor(v4 * v9 * 0.78);
  [(_TVMonogramView *)self bounds];
  double v12 = floor((CGRectGetWidth(v18) - v10) * 0.5);
  [(_TVMonogramView *)self bounds];
  -[UIView setFrame:](self->_focusedShadowView, "setFrame:", v12, floor((CGRectGetHeight(v19) - v11) * 0.5), v10, v11);
  id v13 = [(UIView *)self->_focusedShadowView layer];
  id v14 = [(TVMonogramViewConfiguration *)self->_configuration focusedShadowImage];
  objc_msgSend(v13, "setContents:", objc_msgSend(v14, "CGImage"));

  id v16 = [(UIView *)self->_focusedShadowView layer];
  v15 = [(TVMonogramViewConfiguration *)self->_configuration focusedShadowImage];
  [v15 scale];
  objc_msgSend(v16, "setContentsScale:");
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)_TVMonogramView;
  [(_UIFloatingContentView *)&v11 layoutSubviews];
  [(_TVMonogramView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[_TVImageView setFrame:](self->_imageView, "setFrame:");
  -[UIView setFrame:](self->_placeholderView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_overlayView, "setFrame:", v4, v6, v8, v10);
  -[_TVMonogramView _updateUnfocusedShadowFrameAndLayerWithFrame:](self, "_updateUnfocusedShadowFrameAndLayerWithFrame:", v4, v6, v8, v10);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)setFocusedStateEnabled:(BOOL)a3
{
  self->_focusedStateEnabled = a3;
  [(_TVMonogramView *)self _updateAppearanceForSelectionStateWithCoordinator:0];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  self->_isSelected = a3;
  -[_TVMonogramView _updateAppearanceForSelectionStateWithCoordinator:](self, "_updateAppearanceForSelectionStateWithCoordinator:", 0, a4);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  self->_isSelected = a3;
  -[_TVMonogramView _updateAppearanceForSelectionStateWithCoordinator:](self, "_updateAppearanceForSelectionStateWithCoordinator:", a5, a4);
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v7 = a3 | (8 * self->_isSelected);
  id v8 = a5;
  [(_UIFloatingContentView *)self setControlState:v7 animated:v5];
  [(_TVMonogramView *)self setPressCompletionBlock:v8];
}

- (void)setOverlayView:(id)a3
{
  BOOL v5 = (UIView *)a3;
  p_overlayView = &self->_overlayView;
  overlayView = self->_overlayView;
  double v9 = v5;
  if (overlayView != v5)
  {
    [(UIView *)overlayView removeFromSuperview];
    objc_storeStrong((id *)&self->_overlayView, a3);
    if (*p_overlayView)
    {
      id v8 = [(_UIFloatingContentView *)self contentView];
      [v8 addSubview:*p_overlayView];
    }
  }
  [(_TVMonogramView *)self setNeedsLayout];
}

- (void)floatingContentView:(id)a3 didFinishTransitioningToState:(unint64_t)a4
{
  BOOL v5 = [(_TVMonogramView *)self pressCompletionBlock];

  if (v5)
  {
    double v6 = [(_TVMonogramView *)self pressCompletionBlock];
    v6[2]();

    [(_TVMonogramView *)self setPressCompletionBlock:0];
  }
}

- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3
{
  if (a3.width == 0.0 || (double height = a3.height, a3.height == 0.0))
  {
    [(_TVMonogramView *)self bounds];
    double width = v6;
    double height = v7;
  }
  else
  {
    double width = a3.width;
  }
  [(_UIFloatingContentView *)self focusedSizeIncrease];
  double v9 = width / height;
  if (width <= height)
  {
    double v11 = height + v8;
    double v10 = ceil(v9 * v11);
  }
  else
  {
    double v10 = width + v8;
    double v11 = ceil((width + v8) / v9);
  }
  double v12 = floor((v10 - width) * 0.5);
  double v13 = floor((v11 - height) * 0.5);
  double v14 = v13;
  double v15 = v12;
  result.right = v15;
  result.bottom = v14;
  result.left = v12;
  result.top = v13;
  return result;
}

- (void)_loadWithMonogramDescription:(id)a3 imageProxy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 preferedMonogramType] || v7 || !self->_placeholderImage)
  {
    [v6 size];
    double v10 = -[TVImageScaleDecorator initWithScaleToSize:scaleMode:]([_TVMonogramDecorator alloc], "initWithScaleToSize:scaleMode:", [v6 scaleMode], v8, v9);
    uint64_t v11 = [v6 imageURL];
    if (v11)
    {
      double v12 = (void *)v11;
      double v13 = [v6 imageURL];
      char v14 = objc_msgSend(v13, "tv_isResourceURL");

      if ((v14 & 1) == 0)
      {
        [v6 padding];
        -[TVImageScaleDecorator setPadding:](v10, "setPadding:");
        [v6 upscaleAdjustment];
        -[TVImageScaleDecorator setFocusedSizeIncrease:](v10, "setFocusedSizeIncrease:");
        double v15 = [v6 backgroundColor];
        [(TVImageScaleDecorator *)v10 setBgColor:v15];

        id v16 = [v6 borderColor];
        [(_TVMonogramDecorator *)v10 setBorderColor:v16];

        [v6 borderWidth];
        -[_TVMonogramDecorator setBorderWidth:](v10, "setBorderWidth:");
      }
    }
    if (v7)
    {
      v17 = (TVImageProxy *)v7;
    }
    else
    {
      CGRect v18 = [TVImageProxy alloc];
      CGRect v19 = +[_TVMonogramImageLoader sharedInstance];
      v17 = [(TVImageProxy *)v18 initWithObject:v6 imageLoader:v19 groupType:0];
    }
    [(TVImageProxy *)v17 setCacheOnLoad:+[TVMLUtilities canHandleDecodingOnRenderThread] ^ 1];
    [(TVImageProxy *)v17 setDecorator:v10];
    uint64_t v20 = [v6 imageURL];
    if (v20
      && (v21 = (void *)v20,
          [v6 imageURL],
          v22 = objc_claimAutoreleasedReturnValue(),
          char v23 = objc_msgSend(v22, "tv_isResourceURL"),
          v22,
          v21,
          (v23 & 1) == 0))
    {
      double v25 = 1.0;
      [(_TVImageView *)self->_imageView setAlpha:1.0];
    }
    else
    {
      [(TVMonogramViewConfiguration *)self->_configuration unfocusedImageAlpha];
      double v25 = v24;
    }
    self->_unfocusedImageAlpha = v25;
    objc_initWeak(&location, self);
    imageView = self->_imageView;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __59___TVMonogramView__loadWithMonogramDescription_imageProxy___block_invoke;
    v27[3] = &unk_264BA7F30;
    objc_copyWeak(&v29, &location);
    id v28 = v6;
    [(_TVImageView *)imageView setImageProxy:v17 completion:v27];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else
  {
    [(UIView *)self->_placeholderView setHidden:1];
    [(_TVImageView *)self->_imageView setHidden:0];
    [(_TVImageView *)self->_imageView setImage:0];
    [(_TVMonogramView *)self _updateAppearanceForSelectionStateWithCoordinator:0];
    double v10 = [MEMORY[0x263F08A00] defaultCenter];
    [(_TVMonogramDecorator *)v10 postNotificationName:@"TVMonogramViewImageDidUpdateNotification" object:self];
  }
}

- (TVMonogramViewConfiguration)configuration
{
  return self->_configuration;
}

- (_TVMonogramDescription)monogramDescription
{
  return self->_monogramDescription;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (double)unfocusedImageAlpha
{
  return self->_unfocusedImageAlpha;
}

- (void)setUnfocusedImageAlpha:(double)a3
{
  self->_unfocusedImageAlpha = a3;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (BOOL)isFocusedStateEnabled
{
  return self->_focusedStateEnabled;
}

- (id)pressCompletionBlock
{
  return self->_pressCompletionBlock;
}

- (void)setPressCompletionBlock:(id)a3
{
}

- (_TVImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (TVImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (void)setImageProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProxy, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong(&self->_pressCompletionBlock, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_monogramDescription, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_focusedShadowView, 0);
  objc_storeStrong((id *)&self->_unfocusedShadowView, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
}

@end