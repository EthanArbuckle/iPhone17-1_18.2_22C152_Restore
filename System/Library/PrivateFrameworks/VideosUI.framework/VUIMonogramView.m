@interface VUIMonogramView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3;
- (UIImage)image;
- (UIImage)placeholderImage;
- (UIView)overlayView;
- (VUIBaseView)focusedShadowView;
- (VUIBaseView)unfocusedShadowView;
- (VUIImageProxy)imageProxy;
- (VUIImageView)imageView;
- (VUIMonogramDescription)monogramDescription;
- (VUIMonogramView)initWithFrame:(CGRect)a3 configuration:(id)a4;
- (VUIMonogramViewConfiguration)configuration;
- (double)unfocusedImageAlpha;
- (id)pressCompletionBlock;
- (void)_loadWithMonogramDescription:(id)a3 imageProxy:(id)a4;
- (void)_updateAppearanceForSelectionStateWithCoordinator:(id)a3;
- (void)_updateFocusedShadowFrameAndLayerWithFrame:(CGRect)a3;
- (void)_updatePlaceholerView;
- (void)_updateUnfocusedShadowFrameAndLayerWithFrame:(CGRect)a3;
- (void)floatingContentView:(id)a3 didFinishTransitioningToState:(unint64_t)a4;
- (void)layoutSubviews;
- (void)setConfiguration:(id)a3;
- (void)setFocusedShadowView:(id)a3;
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
- (void)setUnFocusedShadowView:(id)a3;
- (void)setUnfocusedImageAlpha:(double)a3;
- (void)setUnfocusedShadowView:(id)a3;
- (void)updateShadowImage;
@end

@implementation VUIMonogramView

- (VUIMonogramView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v24.receiver = self;
  v24.super_class = (Class)VUIMonogramView;
  v11 = -[_UIFloatingContentView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
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
    -[_UIFloatingContentView setContentMotionRotation:translation:](v12, "setContentMotionRotation:translation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 8.0, 8.0);
    [(_UIFloatingContentView *)v12 setFloatingContentDelegate:v12];
    v13 = [VUIBaseView alloc];
    [(VUIMonogramView *)v12 bounds];
    uint64_t v14 = -[VUIBaseView initWithFrame:](v13, "initWithFrame:");
    placeholderView = v12->_placeholderView;
    v12->_placeholderView = (VUIBaseView *)v14;

    [(VUIBaseView *)v12->_placeholderView setHidden:1];
    v16 = [(_UIFloatingContentView *)v12 contentView];
    [v16 addSubview:v12->_placeholderView];

    id v17 = objc_alloc(MEMORY[0x1E4FB3CE0]);
    [(VUIMonogramView *)v12 bounds];
    uint64_t v18 = objc_msgSend(v17, "initWithFrame:");
    imageView = v12->_imageView;
    v12->_imageView = (VUIImageView *)v18;

    v20 = v12->_imageView;
    v21 = [v10 focusedBgColor];
    [(VUIImageView *)v20 _setFocusedColor:v21];

    [(VUIImageView *)v12->_imageView setClipsToBounds:1];
    [(VUIImageView *)v12->_imageView setContentMode:1];
    v22 = [(_UIFloatingContentView *)v12 contentView];
    [v22 addSubview:v12->_imageView];

    [(VUIMonogramView *)v12 updateShadowImage];
  }

  return v12;
}

- (void)updateShadowImage
{
  v3 = [(VUIMonogramViewConfiguration *)self->_configuration unfocusedShadowImage];

  if (v3)
  {
    [(_UIFloatingContentView *)self setShadowEnabled:0];
    [(_UIFloatingContentView *)self setClipsContentToBounds:0];
    v4 = [VUIBaseView alloc];
    v5 = -[VUIBaseView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(VUIMonogramView *)self setUnFocusedShadowView:v5];

    unfocusedShadowView = self->_unfocusedShadowView;
    [(VUIMonogramViewConfiguration *)self->_configuration unfocusedShadowAlpha];
    -[VUIBaseView setAlpha:](unfocusedShadowView, "setAlpha:");
  }
  else
  {
    [(VUIMonogramView *)self setUnFocusedShadowView:0];
  }
}

- (void)setConfiguration:(id)a3
{
  v5 = (VUIMonogramViewConfiguration *)a3;
  if (self->_configuration != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_configuration, a3);
    [(VUIMonogramView *)self updateShadowImage];
    v5 = v6;
  }
}

- (void)setFocusedShadowView:(id)a3
{
  v5 = (VUIBaseView *)a3;
  p_focusedShadowView = &self->_focusedShadowView;
  focusedShadowView = self->_focusedShadowView;
  v9 = v5;
  if (focusedShadowView != v5)
  {
    [(VUIBaseView *)focusedShadowView removeFromSuperview];
    objc_storeStrong((id *)&self->_focusedShadowView, a3);
    if (*p_focusedShadowView)
    {
      v8 = [(_UIFloatingContentView *)self contentView];
      [v8 insertSubview:*p_focusedShadowView atIndex:0];
    }
  }
}

- (void)setUnFocusedShadowView:(id)a3
{
  v5 = (VUIBaseView *)a3;
  p_unfocusedShadowView = &self->_unfocusedShadowView;
  unfocusedShadowView = self->_unfocusedShadowView;
  v9 = v5;
  if (unfocusedShadowView != v5)
  {
    [(VUIBaseView *)unfocusedShadowView removeFromSuperview];
    objc_storeStrong((id *)&self->_unfocusedShadowView, a3);
    if (*p_unfocusedShadowView)
    {
      v8 = [(_UIFloatingContentView *)self contentView];
      [v8 insertSubview:*p_unfocusedShadowView atIndex:0];
    }
  }
}

- (void)setImage:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    objc_storeStrong((id *)&self->_image, a3);
    [(VUIImageView *)self->_imageView setImage:v5];
    [(VUIImageView *)self->_imageView setVuiAlpha:1.0];
  }
}

- (void)setPlaceholderImage:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    [(VUIImageView *)self->_imageView setPlaceholderImage:v5];
    [(VUIMonogramView *)self _updatePlaceholerView];
  }
}

- (void)setMonogramDescription:(id)a3
{
  v7 = (VUIMonogramDescription *)a3;
  if (self->_monogramDescription != v7)
  {
    objc_storeStrong((id *)&self->_monogramDescription, a3);
    if ([(VUIMonogramDescription *)v7 scaleMode] == 2) {
      [(VUIMonogramDescription *)v7 backgroundColor];
    }
    else {
    v5 = [(VUIMonogramDescription *)v7 fillColor];
    }
    [(VUIBaseView *)self->_placeholderView setVuiBackgroundColor:v5];
    [(VUIMonogramView *)self _updatePlaceholerView];
    v6 = [(VUIMonogramView *)self imageProxy];
    [(VUIMonogramView *)self _loadWithMonogramDescription:v7 imageProxy:v6];
  }
}

- (void)_updatePlaceholerView
{
  v3 = [(VUIMonogramView *)self placeholderImage];
  BOOL v4 = v3 == 0;
  BOOL v5 = v3 != 0;

  [(VUIBaseView *)self->_placeholderView setHidden:v5];
  imageView = self->_imageView;
  [(VUIImageView *)imageView setHidden:v4];
}

- (void)_updateUnfocusedShadowFrameAndLayerWithFrame:(CGRect)a3
{
  CGFloat v4 = a3.size.width / 130.0;
  BOOL v5 = [(VUIMonogramViewConfiguration *)self->_configuration unfocusedShadowImage];
  [v5 size];
  double v7 = v6;
  double v9 = v8;

  double v10 = floor(v4 * v7);
  double v11 = floor(v4 * v9);
  [(VUIMonogramView *)self bounds];
  double v12 = floor((CGRectGetWidth(v18) - v10) * 0.5);
  [(VUIMonogramView *)self bounds];
  -[VUIBaseView setFrame:](self->_unfocusedShadowView, "setFrame:", v12, floor((CGRectGetHeight(v19) - v11) * 0.5), v10, v11);
  v13 = [(VUIBaseView *)self->_unfocusedShadowView layer];
  uint64_t v14 = [(VUIMonogramViewConfiguration *)self->_configuration unfocusedShadowImage];
  objc_msgSend(v13, "setContents:", objc_msgSend(v14, "vuiCGImage"));

  id v16 = [(VUIBaseView *)self->_unfocusedShadowView layer];
  v15 = [(VUIMonogramViewConfiguration *)self->_configuration unfocusedShadowImage];
  [v15 scale];
  objc_msgSend(v16, "setContentsScale:");
}

- (void)_updateFocusedShadowFrameAndLayerWithFrame:(CGRect)a3
{
  CGFloat v4 = a3.size.width / 130.0;
  BOOL v5 = [(VUIMonogramViewConfiguration *)self->_configuration focusedShadowImage];
  [v5 size];
  double v7 = v6;
  double v9 = v8;

  double v10 = floor(v4 * v7 * 0.78);
  double v11 = floor(v4 * v9 * 0.78);
  [(VUIMonogramView *)self bounds];
  double v12 = floor((CGRectGetWidth(v18) - v10) * 0.5);
  [(VUIMonogramView *)self bounds];
  -[VUIBaseView setFrame:](self->_focusedShadowView, "setFrame:", v12, floor((CGRectGetHeight(v19) - v11) * 0.5), v10, v11);
  v13 = [(VUIBaseView *)self->_focusedShadowView layer];
  uint64_t v14 = [(VUIMonogramViewConfiguration *)self->_configuration focusedShadowImage];
  objc_msgSend(v13, "setContents:", objc_msgSend(v14, "vuiCGImage"));

  id v16 = [(VUIBaseView *)self->_focusedShadowView layer];
  v15 = [(VUIMonogramViewConfiguration *)self->_configuration focusedShadowImage];
  [v15 scale];
  objc_msgSend(v16, "setContentsScale:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[VUIImageView vui_sizeThatFits:](self->_imageView, "vui_sizeThatFits:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  [(VUIMonogramView *)self bounds];
  v21.receiver = self;
  v21.super_class = (Class)VUIMonogramView;
  -[VUIMonogramView vui_layoutSubviews:computationOnly:](&v21, sel_vui_layoutSubviews_computationOnly_, 0, v7, v8);
  [(VUIMonogramView *)self bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  -[VUIImageView setFrame:](self->_imageView, "setFrame:");
  -[VUIBaseView setFrame:](self->_placeholderView, "setFrame:", v10, v12, v14, v16);
  -[UIView setFrame:](self->_overlayView, "setFrame:", v10, v12, v14, v16);
  id v17 = [(VUIBaseView *)self->_placeholderView layer];
  [(VUIMonogramView *)self bounds];
  [v17 setCornerRadius:CGRectGetWidth(v23) * 0.5];

  imageView = self->_imageView;
  [(VUIMonogramView *)self bounds];
  [(VUIImageView *)imageView setCornerRadius:CGRectGetWidth(v24) * 0.5];
  -[VUIMonogramView _updateUnfocusedShadowFrameAndLayerWithFrame:](self, "_updateUnfocusedShadowFrameAndLayerWithFrame:", v10, v12, v14, v16);
  double v19 = width;
  double v20 = height;
  result.CGFloat height = v20;
  result.CGFloat width = v19;
  return result;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)VUIMonogramView;
  [(_UIFloatingContentView *)&v14 layoutSubviews];
  [(VUIMonogramView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[VUIImageView setFrame:](self->_imageView, "setFrame:");
  -[VUIBaseView setFrame:](self->_placeholderView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_overlayView, "setFrame:", v4, v6, v8, v10);
  [(VUIMonogramView *)self bounds];
  double v11 = CGRectGetWidth(v15) * 0.5;
  double v12 = [(VUIBaseView *)self->_placeholderView layer];
  [v12 setCornerRadius:v11];

  [(VUIImageView *)self->_imageView setCornerRadius:v11];
  if (_os_feature_enabled_impl())
  {
    double v13 = [(VUIMonogramView *)self layer];
    [v13 setCornerRadius:v11];
  }
  -[VUIMonogramView _updateUnfocusedShadowFrameAndLayerWithFrame:](self, "_updateUnfocusedShadowFrameAndLayerWithFrame:", v4, v6, v8, v10);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)setOverlayView:(id)a3
{
  double v4 = (UIView *)a3;
  double v5 = [(_UIFloatingContentView *)self contentView];
  objc_msgSend(v5, "vui_addSubview:oldView:", v4, self->_overlayView);

  overlayView = self->_overlayView;
  self->_overlayView = v4;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  self->_isSelected = a3;
  if (a3) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = 0;
  }
  [(_UIFloatingContentView *)self setControlState:v5 withAnimationCoordinator:0];
  [(VUIMonogramView *)self _updateAppearanceForSelectionStateWithCoordinator:0];
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v7 = a3 | (8 * self->_isSelected);
  id v8 = a5;
  [(_UIFloatingContentView *)self setControlState:v7 animated:v5];
  [(VUIMonogramView *)self setPressCompletionBlock:v8];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  self->_isSelected = a3;
  if (a3) {
    uint64_t v6 = 8;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = a5;
  [(_UIFloatingContentView *)self setControlState:v6 withAnimationCoordinator:v7];
  [(VUIMonogramView *)self _updateAppearanceForSelectionStateWithCoordinator:v7];
}

- (void)floatingContentView:(id)a3 didFinishTransitioningToState:(unint64_t)a4
{
  BOOL v5 = [(VUIMonogramView *)self pressCompletionBlock];

  if (v5)
  {
    uint64_t v6 = [(VUIMonogramView *)self pressCompletionBlock];
    v6[2]();

    [(VUIMonogramView *)self setPressCompletionBlock:0];
  }
}

- (void)_updateAppearanceForSelectionStateWithCoordinator:(id)a3
{
  id v4 = a3;
  BOOL isSelected = self->_isSelected;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__VUIMonogramView__updateAppearanceForSelectionStateWithCoordinator___block_invoke;
  v8[3] = &unk_1E6DF51F0;
  v8[4] = self;
  BOOL v9 = isSelected;
  uint64_t v6 = _Block_copy(v8);
  id v7 = v6;
  if (v4) {
    [v4 addCoordinatedAnimationsForAnimation:!isSelected animations:v6 completion:0];
  }
  else {
    (*((void (**)(void *))v6 + 2))(v6);
  }
}

uint64_t __69__VUIMonogramView__updateAppearanceForSelectionStateWithCoordinator___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  double v3 = *(double *)(v2 + 880);
  if (v3 != 0.0 && v3 != 1.0)
  {
    [MEMORY[0x1E4FB1EB0] inheritedAnimationDuration];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__VUIMonogramView__updateAppearanceForSelectionStateWithCoordinator___block_invoke_2;
    v12[3] = &unk_1E6DF51F0;
    v12[4] = *(void *)(v1 + 32);
    char v13 = *(unsigned char *)(v1 + 40);
    CGSize result = [MEMORY[0x1E4FB1EB0] animateWithDuration:32 delay:v12 options:0 animations:v5 * 0.3 completion:0.0];
    uint64_t v2 = *(void *)(v1 + 32);
  }
  uint64_t v6 = *(void **)(v2 + 904);
  if (v6 && *(void *)(v2 + 912))
  {
    double v7 = 0.0;
    double v8 = 0.0;
    if (*(unsigned char *)(v1 + 40)) {
      objc_msgSend(*(id *)(v2 + 848), "focusedShadowAlpha", 0.0);
    }
    [v6 setAlpha:v8];
    uint64_t v9 = *(void *)(v1 + 32);
    double v10 = *(void **)(v9 + 912);
    if (!*(unsigned char *)(v1 + 40))
    {
      [*(id *)(v9 + 848) unfocusedShadowAlpha];
      double v7 = v11;
    }
    return [v10 setAlpha:v7];
  }
  return result;
}

uint64_t __69__VUIMonogramView__updateAppearanceForSelectionStateWithCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = 1.0;
  double v4 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v4 = *(double *)(v2 + 880);
  }
  [*(id *)(v2 + 920) setAlpha:v4];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 832);
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = *(double *)(v5 + 880);
  }
  return [v6 setAlpha:v3];
}

- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3
{
  if (a3.width == 0.0 || (double height = a3.height, a3.height == 0.0))
  {
    [(VUIMonogramView *)self bounds];
    double width = v6;
    double height = v7;
  }
  else
  {
    double width = a3.width;
  }
  [(_UIFloatingContentView *)self focusedSizeIncrease];
  double v9 = 1.0;
  if (height > 0.0) {
    double v9 = width / height;
  }
  if (width <= height)
  {
    double v11 = height + v8;
    double v10 = ceil(v11 * v9);
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
  if (![v6 preferedMonogramType] && !v7 && self->_placeholderImage)
  {
    [(VUIBaseView *)self->_placeholderView setHidden:1];
    [(VUIImageView *)self->_imageView setHidden:0];
    [(VUIImageView *)self->_imageView setImage:0];
    [(VUIMonogramView *)self _updateAppearanceForSelectionStateWithCoordinator:0];
    double v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [(_VUIMonogramDecorator *)v10 postNotificationName:@"VUIMonogramViewImageDidUpdateNotification" object:self];
    goto LABEL_20;
  }
  [v6 size];
  double v10 = -[VUIImageScaleDecorator initWithScaleToSize:scaleMode:]([_VUIMonogramDecorator alloc], "initWithScaleToSize:scaleMode:", [v6 scaleMode], v8, v9);
  uint64_t v11 = [v6 imageURL];
  if (v11)
  {
    double v12 = (void *)v11;
    double v13 = [v6 imageURL];
    char v14 = objc_msgSend(v13, "vuicore_isResourceOrSymbolURL");

    if ((v14 & 1) == 0)
    {
      [v6 padding];
      -[VUIImageScaleDecorator setPadding:](v10, "setPadding:");
      [v6 upscaleAdjustment];
      -[VUIImageScaleDecorator setFocusedSizeIncrease:](v10, "setFocusedSizeIncrease:");
      if (![v6 optimizedImageRendering])
      {
        objc_super v21 = [v6 backgroundColor];
        [(VUIImageScaleDecorator *)v10 setBgColor:v21];

        v22 = [v6 borderColor];
        [(_VUIMonogramDecorator *)v10 setBorderColor:v22];

        [v6 borderWidth];
        -[_VUIMonogramDecorator setBorderWidth:](v10, "setBorderWidth:");
        if (v7) {
          goto LABEL_7;
        }
        goto LABEL_12;
      }
      double v15 = [(VUIMonogramView *)self imageView];
      [v6 borderWidth];
      objc_msgSend(v15, "setBorderWidth:");

      double v16 = [(VUIMonogramView *)self imageView];
      id v17 = [v6 borderColor];
      [v16 setBorderColor:v17];

      CGRect v18 = [(VUIMonogramView *)self imageView];
      double v19 = [v6 backgroundColor];
      [v18 setPlaceholderColor:v19];
    }
  }
  if (v7)
  {
LABEL_7:
    id v20 = v7;
    goto LABEL_13;
  }
LABEL_12:
  id v23 = objc_alloc(MEMORY[0x1E4FB3CD0]);
  CGRect v24 = +[_VUIMonogramImageLoader sharedInstance];
  id v20 = (id)[v23 initWithObject:v6 imageLoader:v24 groupType:0];

LABEL_13:
  objc_msgSend(v20, "setCacheOnLoad:", objc_msgSend(MEMORY[0x1E4FB3C70], "canHandleDecodingOnRenderThread") ^ 1);
  [v20 setDecorator:v10];
  objc_msgSend(v20, "setOptimizedImageRendering:", objc_msgSend(v6, "optimizedImageRendering"));
  uint64_t v25 = [v6 imageURL];
  if (v25
    && (v26 = (void *)v25,
        [v6 imageURL],
        v27 = objc_claimAutoreleasedReturnValue(),
        char v28 = objc_msgSend(v27, "vuicore_isResourceOrSymbolURL"),
        v27,
        v26,
        (v28 & 1) == 0))
  {
    double v30 = 1.0;
    [(VUIImageView *)self->_imageView setVuiAlpha:1.0];
  }
  else
  {
    [(VUIMonogramViewConfiguration *)self->_configuration unfocusedImageAlpha];
    double v30 = v29;
  }
  self->_unfocusedImageAlpha = v30;
  v31 = [v6 placeholderImage];

  if (v31)
  {
    v32 = [v6 placeholderImage];
    placeholderImage = self->_placeholderImage;
    self->_placeholderImage = v32;
  }
  objc_initWeak(&location, self);
  imageView = self->_imageView;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __59__VUIMonogramView__loadWithMonogramDescription_imageProxy___block_invoke;
  v35[3] = &unk_1E6DFABB8;
  objc_copyWeak(&v37, &location);
  id v36 = v6;
  [(VUIImageView *)imageView setImageProxy:v20 completion:v35];

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

LABEL_20:
}

void __59__VUIMonogramView__loadWithMonogramDescription_imageProxy___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  id v7 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && a4)
  {
    uint64_t v9 = [*(id *)(a1 + 32) preferedMonogramType];
    if (a2 || !v9)
    {
      [WeakRetained[104] setHidden:1];
      [WeakRetained[115] setHidden:0];
      [WeakRetained _updateAppearanceForSelectionStateWithCoordinator:0];
      if (a2)
      {
        double v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v13 postNotificationName:@"VUIMonogramViewImageDidUpdateNotification" object:WeakRetained];
      }
    }
    else
    {
      if ((unint64_t)(v9 - 3) >= 3) {
        uint64_t v10 = v9 - 1;
      }
      else {
        uint64_t v10 = 2;
      }
      uint64_t v11 = (void *)[*(id *)(a1 + 32) copyWithType:v10];
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      double v16 = __59__VUIMonogramView__loadWithMonogramDescription_imageProxy___block_invoke_2;
      id v17 = &unk_1E6DF5490;
      objc_copyWeak(&v19, v7);
      id v18 = v11;
      id v12 = v11;
      dispatch_async(MEMORY[0x1E4F14428], &v14);

      objc_destroyWeak(&v19);
      objc_msgSend(WeakRetained, "_updateAppearanceForSelectionStateWithCoordinator:", 0, v14, v15, v16, v17);
    }
  }
}

void __59__VUIMonogramView__loadWithMonogramDescription_imageProxy___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _loadWithMonogramDescription:*(void *)(a1 + 32) imageProxy:0];
    id WeakRetained = v3;
  }
}

- (VUIMonogramViewConfiguration)configuration
{
  return self->_configuration;
}

- (VUIMonogramDescription)monogramDescription
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

- (id)pressCompletionBlock
{
  return self->_pressCompletionBlock;
}

- (void)setPressCompletionBlock:(id)a3
{
}

- (VUIBaseView)focusedShadowView
{
  return self->_focusedShadowView;
}

- (VUIBaseView)unfocusedShadowView
{
  return self->_unfocusedShadowView;
}

- (void)setUnfocusedShadowView:(id)a3
{
}

- (VUIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (VUIImageProxy)imageProxy
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
  objc_storeStrong((id *)&self->_unfocusedShadowView, 0);
  objc_storeStrong((id *)&self->_focusedShadowView, 0);
  objc_storeStrong(&self->_pressCompletionBlock, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_monogramDescription, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
}

@end