@interface _TVImageView
- (BOOL)_enableEdgeAntialiasingOnSelected;
- (BOOL)imageContainsCornerRadius;
- (BOOL)isImageLoaded;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TVImageProxy)imageProxy;
- (UIColor)_darkTintColor;
- (UIColor)_focusedColor;
- (UIColor)_tintColor;
- (UIImage)image;
- (UIImage)placeholderImage;
- (UIImageSymbolConfiguration)preferredSymbolConfiguration;
- (_TVImageView)initWithFrame:(CGRect)a3;
- (double)_continuousCornerRadius;
- (double)cornerRadius;
- (id)_imageProxyWithSize:(CGSize)a3;
- (id)_imageView;
- (id)backgroundColor;
- (id)completion;
- (id)dynamicProxyProvider;
- (int64_t)contentMode;
- (void)_loadImage;
- (void)_reloadImageForLayoutDirectionChange;
- (void)_resetContentRect;
- (void)_setContentRectInPixels:(CGRect)a3 forContentSize:(CGSize)a4;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setDarkTintColor:(id)a3;
- (void)_setEnableEdgeAntialiasingOnSelected:(BOOL)a3;
- (void)_setFocusedColor:(id)a3;
- (void)_setImage:(id)a3;
- (void)_setPreferredSymbolConfiguration:(id)a3;
- (void)_setTintColor:(id)a3;
- (void)_updateCornerRadius;
- (void)_updateFlatImageWithImage:(id)a3;
- (void)_updateImageView;
- (void)_updateTintColor;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDynamicProxyProvider:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageContainsCornerRadius:(BOOL)a3;
- (void)setImageLoaded:(BOOL)a3;
- (void)setImageProxy:(id)a3;
- (void)setImageProxy:(id)a3 completion:(id)a4;
- (void)setPlaceholderImage:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _TVImageView

- (_TVImageView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_TVImageView;
  v3 = -[_TVImageView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_imageContentMode = 1;
    id v5 = objc_alloc(MEMORY[0x263F1C6D0]);
    [(_TVImageView *)v4 bounds];
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:");
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v6;

    [(UIImageView *)v4->_imageView setClipsToBounds:1];
    [(UIImageView *)v4->_imageView setContentMode:v4->_imageContentMode];
    [(_TVImageView *)v4 addSubview:v4->_imageView];
  }
  return v4;
}

- (void)dealloc
{
  [(TVImageProxy *)self->_imageProxy setCompletionHandler:0];
  [(TVImageProxy *)self->_imageProxy cancel];
  v3.receiver = self;
  v3.super_class = (Class)_TVImageView;
  [(_TVImageView *)&v3 dealloc];
}

- (CGSize)intrinsicContentSize
{
  [(UIImageView *)self->_imageView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)contentMode
{
  return [(UIImageView *)self->_imageView contentMode];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_TVImageView;
  [(_TVImageView *)&v4 layoutSubviews];
  imageView = self->_imageView;
  [(_TVImageView *)self bounds];
  -[UIImageView setFrame:](imageView, "setFrame:");
}

- (void)setContentMode:(int64_t)a3
{
  self->_imageContentMode = a3;
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:");
  [(_TVImageView *)self _updateCornerRadius];
}

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_TVImageView;
  -[_TVImageView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  imageView = self->_imageView;
  [(_TVImageView *)self bounds];
  -[UIImageView setFrame:](imageView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = *MEMORY[0x263F001B0];
  double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (a3.width == *MEMORY[0x263F001B0] && a3.height == v7)
  {
    objc_super v9 = self->_imageProxy;
  }
  else
  {
    -[_TVImageView _imageProxyWithSize:](self, "_imageProxyWithSize:", a3.width, a3.height);
    objc_super v9 = (TVImageProxy *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  [(TVImageProxy *)v9 expectedSize];
  BOOL v13 = v11 == v6 && v12 == v7;
  if (v13
    && ((-[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", width, height), v11 == v6)
      ? (BOOL v14 = v12 == v7)
      : (BOOL v14 = 0),
        v14))
  {
    [(_TVImageView *)self bounds];
    double v15 = v17;
    double v16 = v18;
  }
  else
  {
    double v15 = v11;
    double v16 = v12;
  }

  double v19 = v15;
  double v20 = v16;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVImageView;
  -[_TVImageView willMoveToWindow:](&v6, sel_willMoveToWindow_);
  BOOL v5 = [(_TVImageView *)self isImageLoaded];
  if (a3)
  {
    if (!v5) {
      [(_TVImageView *)self _loadImage];
    }
  }
  else if (!v5)
  {
    [(TVImageProxy *)self->_imageProxy cancel];
  }
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  [(_TVImageView *)self setImageProxy:0];
  [(_TVImageView *)self _setImage:v4];
}

- (void)setImageProxy:(id)a3
{
}

- (void)setImageProxy:(id)a3 completion:(id)a4
{
  v21 = (TVImageProxy *)a3;
  id v7 = a4;
  p_imageProxy = &self->_imageProxy;
  if (self->_imageProxy != v21 || self->_completion != v7)
  {
    uint64_t v9 = [(_TVImageView *)self window];
    if (v9)
    {
      v10 = (void *)v9;
      BOOL v11 = [(_TVImageView *)self effectiveUserInterfaceLayoutDirection] == 1;
    }
    else
    {
      BOOL v11 = 0;
    }
    [(TVImageProxy *)*p_imageProxy setImageDirection:v11];
    BOOL v12 = [(TVImageProxy *)v21 isEqual:*p_imageProxy];
    BOOL v13 = [(_TVImageView *)self isImageLoaded];
    if (v12)
    {
      if (!v13)
      {
        BOOL v14 = [(_TVImageView *)self completion];

        if (v14)
        {
          double v15 = [(_TVImageView *)self completion];
          double v16 = [(_TVImageView *)self image];
          ((void (**)(void, void *, void, void))v15)[2](v15, v16, 0, 0);
        }
      }
      [(_TVImageView *)self setCompletion:v7];
      if ([(_TVImageView *)self isImageLoaded])
      {
        double v17 = [(_TVImageView *)self completion];

        if (v17)
        {
          double v18 = [(_TVImageView *)self completion];
          double v19 = [(_TVImageView *)self image];
          ((void (**)(void, void *, void, uint64_t))v18)[2](v18, v19, 0, 1);

          [(_TVImageView *)self setCompletion:0];
        }
      }
    }
    else
    {
      if (!v13) {
        [(TVImageProxy *)*p_imageProxy cancel];
      }
      [(_TVImageView *)self setImageLoaded:0];
      if (![(TVImageProxy *)*p_imageProxy isOfSameOriginAs:v21]) {
        [(_TVImageView *)self _setImage:0];
      }
      [(_TVImageView *)self setCompletion:v7];
      objc_storeStrong((id *)&self->_imageProxy, a3);
      double v20 = [(_TVImageView *)self window];

      if (v20) {
        [(_TVImageView *)self _loadImage];
      }
    }
  }
}

- (void)setPlaceholderImage:(id)a3
{
  BOOL v5 = (UIImage *)a3;
  p_placeholderImage = &self->_placeholderImage;
  if (self->_placeholderImage != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_placeholderImage, a3);
    p_placeholderImage = (UIImage **)[(_TVImageView *)self _updateImageView];
    BOOL v5 = v7;
  }
  MEMORY[0x270F9A758](p_placeholderImage, v5);
}

- (void)setBackgroundColor:(id)a3
{
}

- (id)backgroundColor
{
  return (id)[(UIImageView *)self->_imageView backgroundColor];
}

- (void)_setContinuousCornerRadius:(double)a3
{
  -[UIImageView _setContinuousCornerRadius:](self->_imageView, "_setContinuousCornerRadius:");
  BOOL v5 = [(UIImageView *)self->_imageView layer];
  [v5 setMasksToBounds:a3 > 0.0];

  self->_continuousCorners = a3 > 0.0;
}

- (double)_continuousCornerRadius
{
  [(UIImageView *)self->_imageView _continuousCornerRadius];
  return result;
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(_TVImageView *)self _updateCornerRadius];
  }
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setImageContainsCornerRadius:(BOOL)a3
{
  if (self->_imageContainsCornerRadius != a3)
  {
    self->_imageContainsCornerRadius = a3;
    [(_TVImageView *)self _updateCornerRadius];
  }
}

- (void)_setContentRectInPixels:(CGRect)a3 forContentSize:(CGSize)a4
{
}

- (void)_resetContentRect
{
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_TVImageView;
  -[UIView setHighlighted:](&v22, sel_setHighlighted_);
  [(UIImageView *)self->_imageView setHighlighted:v3];
  highlightFilter = self->_highlightFilter;
  if (self->__focusedColor) {
    BOOL v6 = !v3;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (!highlightFilter) {
      return;
    }
    id v7 = [(UIImageView *)self->_imageView layer];
    v8 = [v7 filters];
    uint64_t v9 = (void *)[v8 mutableCopy];

    [v9 removeObjectIdenticalTo:self->_highlightFilter];
    goto LABEL_15;
  }
  if (!highlightFilter)
  {
    v10 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D20]];
    BOOL v11 = self->_highlightFilter;
    self->_highlightFilter = v10;

    [(CAFilter *)self->_highlightFilter setValue:[(UIColor *)self->__focusedColor CGColor] forKey:@"inputColor"];
  }
  BOOL v12 = [(UIImageView *)self->_imageView layer];
  BOOL v13 = [v12 filters];
  char v14 = [v13 containsObject:self->_highlightFilter];

  if ((v14 & 1) == 0)
  {
    double v15 = [(UIImageView *)self->_imageView layer];
    double v16 = [v15 filters];
    double v17 = (void *)[v16 mutableCopy];
    double v18 = v17;
    if (v17) {
      id v19 = v17;
    }
    else {
      id v19 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    }
    uint64_t v9 = v19;

    [v9 addObject:self->_highlightFilter];
LABEL_15:
    double v20 = [(UIImageView *)self->_imageView layer];
    v21 = (void *)[v9 copy];
    [v20 setFilters:v21];
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  self->_selected = a3;
  [(_TVImageView *)self _updateImageView];
  if ([(_TVImageView *)self _enableEdgeAntialiasingOnSelected])
  {
    BOOL v6 = [(UIImageView *)self->_imageView layer];
    [v6 setAllowsEdgeAntialiasing:v4];

    id v7 = [(UIImageView *)self->_imageView layer];
    [v7 setEdgeAntialiasingMask:3];
  }
}

- (id)_imageProxyWithSize:(CGSize)a3
{
  dynamicProxyProvider = (void (**)(id, SEL, __n128, __n128))self->_dynamicProxyProvider;
  if (dynamicProxyProvider)
  {
    dynamicProxyProvider[2](dynamicProxyProvider, a2, (__n128)a3, *(__n128 *)&a3.height);
    BOOL v5 = (TVImageProxy *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v5 = self->_imageProxy;
  }
  return v5;
}

- (void)_reloadImageForLayoutDirectionChange
{
  BOOL v3 = [(_TVImageView *)self window];

  if (v3)
  {
    uint64_t v4 = [(_TVImageView *)self effectiveUserInterfaceLayoutDirection] == 1;
    BOOL v5 = [(_TVImageView *)self imageProxy];
    uint64_t v6 = [v5 imageDirection];

    if (v6 != v4)
    {
      [(_TVImageView *)self _loadImage];
    }
  }
  else
  {
    [(_TVImageView *)self setImageLoaded:0];
  }
}

- (void)_loadImage
{
  [(_TVImageView *)self bounds];
  BOOL v5 = -[_TVImageView _imageProxyWithSize:](self, "_imageProxyWithSize:", v3, v4);
  uint64_t v6 = v5;
  if (v5 && ([v5 isEqual:self->_imageProxy] & 1) == 0) {
    objc_storeStrong((id *)&self->_imageProxy, v6);
  }
  imageProxy = self->_imageProxy;
  id v8 = objc_initWeak(&location, imageProxy);

  if (imageProxy)
  {
    [(TVImageProxy *)self->_imageProxy setCacheOnLoad:+[TVMLUtilities canHandleDecodingOnRenderThread] ^ 1];
    objc_initWeak(&from, self);
    uint64_t v9 = self->_imageProxy;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __26___TVImageView__loadImage__block_invoke;
    v16[3] = &unk_264BA7680;
    objc_copyWeak(&v17, &location);
    objc_copyWeak(&v18, &from);
    [(TVImageProxy *)v9 setCompletionHandler:v16];
    [(TVImageProxy *)self->_imageProxy setImageDirection:[(_TVImageView *)self effectiveUserInterfaceLayoutDirection] == 1];
    [(TVImageProxy *)self->_imageProxy load];
    objc_destroyWeak(&v18);
    v10 = &v17;
  }
  else
  {
    BOOL v11 = [(_TVImageView *)self completion];

    if (!v11) {
      goto LABEL_7;
    }
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      BOOL v12 = [(_TVImageView *)self completion];
      v12[2](v12, 0, 0, 1);

      [(_TVImageView *)self setCompletion:0];
      [(_TVImageView *)self setImageLoaded:0];
      goto LABEL_7;
    }
    objc_initWeak(&from, self);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __26___TVImageView__loadImage__block_invoke_2;
    v13[3] = &unk_264BA76A8;
    objc_copyWeak(&v14, &from);
    objc_copyWeak(&v15, &location);
    dispatch_async(MEMORY[0x263EF83A0], v13);
    objc_destroyWeak(&v15);
    v10 = &v14;
  }
  objc_destroyWeak(v10);
  objc_destroyWeak(&from);
LABEL_7:
  objc_destroyWeak(&location);
}

- (id)_imageView
{
  return self->_imageView;
}

- (void)_updateTintColor
{
  if (self->_selected)
  {
    focusedColor = self->__focusedColor;
    if (focusedColor) {
      goto LABEL_8;
    }
  }
  double v4 = [(_TVImageView *)self traitCollection];
  if ([v4 userInterfaceStyle] == 2)
  {
    darkTintColor = self->__darkTintColor;

    if (darkTintColor)
    {
      focusedColor = self->__darkTintColor;
LABEL_8:
      uint64_t v6 = focusedColor;
      goto LABEL_9;
    }
  }
  else
  {
  }
  focusedColor = self->__tintColor;
  if (focusedColor) {
    goto LABEL_8;
  }
  uint64_t v6 = 0;
LABEL_9:
  id v7 = v6;
  [(_TVImageView *)self setTintColor:v6];
  self->_rendersImageAsTemplates = v7 != 0;
  if (self->_image) {
    -[_TVImageView _updateFlatImageWithImage:](self, "_updateFlatImageWithImage:");
  }
}

- (void)_setDarkTintColor:(id)a3
{
  objc_storeStrong((id *)&self->__darkTintColor, a3);
  [(_TVImageView *)self _updateTintColor];
}

- (void)_setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->__tintColor, a3);
  [(_TVImageView *)self _updateTintColor];
}

- (void)_setFocusedColor:(id)a3
{
  objc_storeStrong((id *)&self->__focusedColor, a3);
  [(_TVImageView *)self _updateImageView];
}

- (void)_updateFlatImageWithImage:(id)a3
{
  id v4 = a3;
  BOOL rendersImageAsTemplates = self->_rendersImageAsTemplates;
  id v7 = v4;
  if (self->_rendersImageAsTemplates)
  {
    id v4 = [v4 imageWithRenderingMode:2];
  }
  uint64_t v6 = v4;
  objc_storeStrong((id *)&self->_flatImage, v4);
  if (rendersImageAsTemplates) {

  }
  [(_TVImageView *)self _updateImageView];
}

- (void)_setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  id v5 = a3;
  [(UIImageView *)self->_imageView setContentMode:self->_imageContentMode];
  [(_TVImageView *)self _updateFlatImageWithImage:v5];
}

- (void)_setPreferredSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, a3);
  id v5 = a3;
  [(UIImageView *)self->_imageView setPreferredSymbolConfiguration:v5];
}

- (void)_updateImageView
{
  if (self->_image)
  {
    if (!self->_selected || (tintColor = self->__focusedColor) == 0)
    {
      id v4 = [(_TVImageView *)self traitCollection];
      if ([v4 userInterfaceStyle] == 2)
      {
        darkTintColor = self->__darkTintColor;

        if (darkTintColor)
        {
          uint64_t v6 = self->__darkTintColor;
          if (!v6) {
            goto LABEL_25;
          }
          goto LABEL_24;
        }
      }
      else
      {
      }
      tintColor = self->__tintColor;
      if (!tintColor)
      {
        uint64_t v6 = 0;
        goto LABEL_25;
      }
    }
    uint64_t v6 = tintColor;
LABEL_24:
    [(_TVImageView *)self setTintColor:v6];
LABEL_25:
    [(UIImageView *)self->_imageView setImage:self->_flatImage];
LABEL_26:

    goto LABEL_27;
  }
  placeholderImage = self->_placeholderImage;
  if (placeholderImage)
  {
    uint64_t v6 = placeholderImage;
    id v8 = [(UIColor *)v6 imageAsset];
    if (v8 && [(UIColor *)v6 imageOrientation] == 4)
    {
      uint64_t v9 = [(_TVImageView *)self effectiveUserInterfaceLayoutDirection];

      if (v9 != 1)
      {
LABEL_14:
        [(UIImageView *)self->_imageView setImage:v6];
        int64_t imageContentMode = self->_imageContentMode;
        [(UIImage *)self->_placeholderImage size];
        if (v14 == 1.0 && v13 == 1.0) {
          uint64_t v16 = 2;
        }
        else {
          uint64_t v16 = imageContentMode;
        }
        [(UIImageView *)self->_imageView setContentMode:v16];
        goto LABEL_26;
      }
      id v8 = [(UIColor *)v6 imageAsset];
      v10 = [MEMORY[0x263F1CB00] traitCollectionWithLayoutDirection:1];
      uint64_t v11 = [v8 imageWithTraitCollection:v10];

      uint64_t v6 = (UIColor *)v11;
    }

    goto LABEL_14;
  }
  [(UIImageView *)self->_imageView setImage:0];
LABEL_27:
  [(_TVImageView *)self _updateCornerRadius];
}

- (void)_updateCornerRadius
{
  if (!self->_continuousCorners)
  {
    if (!self->_imageContainsCornerRadius || (double v3 = 0.0, !self->_image))
    {
      [(_TVImageView *)self cornerRadius];
      double v3 = v4;
    }
    id v5 = [(UIImageView *)self->_imageView layer];
    [v5 setCornerRadius:v3];

    uint64_t v6 = [(UIImageView *)self->_imageView contentMode];
    id v7 = [(UIImageView *)self->_imageView layer];
    id v10 = v7;
    BOOL v9 = v3 > 0.0 || v6 != 1;
    [v7 setMasksToBounds:v9];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_TVImageView;
  [(_TVImageView *)&v7 traitCollectionDidChange:v4];
  id v5 = [(_TVImageView *)self traitCollection];
  if ([v5 userInterfaceStyle])
  {
    uint64_t v6 = [v4 userInterfaceStyle];
    if (v6 != [v5 userInterfaceStyle]) {
      [(_TVImageView *)self _updateTintColor];
    }
  }
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (BOOL)imageContainsCornerRadius
{
  return self->_imageContainsCornerRadius;
}

- (TVImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (id)dynamicProxyProvider
{
  return self->_dynamicProxyProvider;
}

- (void)setDynamicProxyProvider:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (BOOL)isImageLoaded
{
  return self->_imageLoaded;
}

- (void)setImageLoaded:(BOOL)a3
{
  self->_imageLoaded = a3;
}

- (UIColor)_tintColor
{
  return self->__tintColor;
}

- (UIColor)_darkTintColor
{
  return self->__darkTintColor;
}

- (UIColor)_focusedColor
{
  return self->__focusedColor;
}

- (BOOL)_enableEdgeAntialiasingOnSelected
{
  return self->__enableEdgeAntialiasingOnSelected;
}

- (void)_setEnableEdgeAntialiasingOnSelected:(BOOL)a3
{
  self->__enableEdgeAntialiasingOnSelected = a3;
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return self->_preferredSymbolConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->__darkTintColor, 0);
  objc_storeStrong((id *)&self->__tintColor, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_dynamicProxyProvider, 0);
  objc_storeStrong((id *)&self->_imageProxy, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_highlightFilter, 0);
  objc_storeStrong((id *)&self->_flatHighlightImage, 0);
  objc_storeStrong((id *)&self->_flatImage, 0);
  objc_storeStrong((id *)&self->__focusedColor, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end