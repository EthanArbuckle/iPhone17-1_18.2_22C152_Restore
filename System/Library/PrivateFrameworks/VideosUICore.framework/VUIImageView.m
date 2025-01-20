@interface VUIImageView
- (BOOL)_enableEdgeAntialiasingOnSelected;
- (BOOL)animatesShadowChanges;
- (BOOL)imageContainsCornerRadius;
- (BOOL)imageContainsShadow;
- (BOOL)isImageLoaded;
- (BOOL)isResourceImage;
- (BOOL)isSymbolImage;
- (BOOL)shouldScaleToSize;
- (CGSize)intrinsicContentSize;
- (CGSize)resourceOrSymbolSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (NSURL)latestImageURL;
- (UIColor)_focusedColor;
- (UIColor)_tintColor;
- (UIColor)borderColor;
- (UIColor)placeholderColor;
- (UIImage)image;
- (UIImage)placeholderImage;
- (UIImageSymbolConfiguration)preferredSymbolConfiguration;
- (VUIImageProxy)imageProxy;
- (VUIImageView)initWithFrame:(CGRect)a3;
- (_VUICornerRadii)shadowRadii;
- (double)_continuousCornerRadius;
- (double)borderWidth;
- (double)cornerRadius;
- (id)_imageProxyWithSize:(CGSize)a3 sizeComputationOnly:(BOOL)a4;
- (id)_imageView;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)backgroundColor;
- (id)completion;
- (id)dynamicProxyProvider;
- (id)shadowPathUpdater;
- (id)vuiBackgroundColor;
- (int64_t)_imageShape;
- (int64_t)preferredVibrancy;
- (unint64_t)vuiContentMode;
- (void)_loadImage;
- (void)_reloadImageForLayoutDirectionChange;
- (void)_resetContentRect;
- (void)_setContentRectInPixels:(CGRect)a3 forContentSize:(CGSize)a4;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setEnableEdgeAntialiasingOnSelected:(BOOL)a3;
- (void)_setFocusedColor:(id)a3;
- (void)_setImage:(id)a3;
- (void)_setImageShape:(int64_t)a3;
- (void)_setPreferredSymbolConfiguration:(id)a3;
- (void)_setTintColor:(id)a3;
- (void)_updateCornerRadius;
- (void)_updateFlatImageWithImage:(id)a3;
- (void)_updateImageView;
- (void)_updateTintColor;
- (void)addSymbolEffect:(id)a3 options:(id)a4 animated:(BOOL)a5;
- (void)computeCornerRadii;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAnimatesShadowChanges:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setCompletion:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDynamicProxyProvider:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageContainsCornerRadius:(BOOL)a3;
- (void)setImageContainsShadow:(BOOL)a3;
- (void)setImageLoaded:(BOOL)a3;
- (void)setImageProxy:(id)a3;
- (void)setImageProxy:(id)a3 clearingExisting:(BOOL)a4 completion:(id)a5;
- (void)setImageProxy:(id)a3 completion:(id)a4;
- (void)setPlaceholderColor:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPreferredVibrancy:(int64_t)a3;
- (void)setResourceImage:(BOOL)a3;
- (void)setResourceOrSymbolSize:(CGSize)a3;
- (void)setShadowPathUpdater:(id)a3;
- (void)setShadowRadii:(_VUICornerRadii)a3;
- (void)setShouldScaleToSize:(BOOL)a3;
- (void)setSymbolImage:(BOOL)a3;
- (void)setSymbolImage:(id)a3 withSymbolTransition:(id)a4;
- (void)setVuiBackgroundColor:(id)a3;
- (void)setVuiContentMode:(unint64_t)a3;
- (void)vui_setHighlighted:(BOOL)a3;
- (void)vui_setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)vui_willMoveToWindow:(id)a3;
@end

@implementation VUIImageView

- (VUIImageView)initWithFrame:(CGRect)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)VUIImageView;
  v3 = -[VUIImageView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_imageContentMode = 1;
    v5 = (void *)MEMORY[0x1E4F42AA0];
    [(VUIImageView *)v3 bounds];
    uint64_t v6 = objc_msgSend(v5, "vui_imageViewWithFrame:");
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v6;

    [(UIImageView *)v4->_imageView setVuiClipsToBounds:1];
    [(UIImageView *)v4->_imageView setVuiContentMode:v4->_imageContentMode];
    v4->_previousSize = (CGSize)*MEMORY[0x1E4F1DB30];
    [(UIView *)v4 vui_addSubview:v4->_imageView oldView:0];
    objc_initWeak(&location, v4);
    v14[0] = objc_opt_class();
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __30__VUIImageView_initWithFrame___block_invoke;
    v10[3] = &unk_1E6DDCC98;
    objc_copyWeak(&v11, &location);
    [(UIView *)v4 vui_registerForTraitChanges:v8 withHandler:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)setPlaceholderColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_placeholderColor = &self->_placeholderColor;
  if (self->_placeholderColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_placeholderColor, a3);
    p_placeholderColor = (UIColor **)[(VUIImageView *)self _updateImageView];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_placeholderColor, v5);
}

- (void)_updateCornerRadius
{
  if (!self->_continuousCorners)
  {
    if (!self->_imageContainsCornerRadius || (double v3 = 0.0, !self->_image))
    {
      [(VUIImageView *)self cornerRadius];
      double v3 = v4;
    }
    v5 = [(UIImageView *)self->_imageView layer];
    [v5 setCornerRadius:v3];

    uint64_t v6 = [(UIImageView *)self->_imageView vuiContentMode];
    v7 = [(UIImageView *)self->_imageView layer];
    id v10 = v7;
    BOOL v9 = v3 > 0.0 || v6 != 1;
    [v7 setMasksToBounds:v9];
  }
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)_updateFlatImageWithImage:(id)a3
{
  id v4 = a3;
  BOOL rendersImageAsTemplates = self->_rendersImageAsTemplates;
  id v7 = v4;
  if (self->_rendersImageAsTemplates)
  {
    id v4 = [v4 vuiTemplateImage];
  }
  uint64_t v6 = v4;
  objc_storeStrong((id *)&self->_flatImage, v4);
  if (rendersImageAsTemplates) {

  }
  [(VUIImageView *)self _updateImageView];
}

- (void)_updateImageView
{
  if (self->_image)
  {
    if (self->_selected && (focusedColor = self->__focusedColor) != 0 || (focusedColor = self->__tintColor) != 0)
    {
      id v4 = focusedColor;
      [(UIImageView *)self->_imageView setVuiTintColor:v4];
    }
    else
    {
      id v4 = 0;
    }
    [(VUIImageView *)self setVuiBackgroundColor:0];
    [(UIImageView *)self->_imageView setImage:self->_flatImage];
    goto LABEL_10;
  }
  [(UIImageView *)self->_imageView setImage:0];
  if (self->_placeholderColor)
  {
    -[VUIImageView setVuiBackgroundColor:](self, "setVuiBackgroundColor:");
    goto LABEL_11;
  }
  placeholderImage = self->_placeholderImage;
  if (placeholderImage)
  {
    id v4 = placeholderImage;
    uint64_t v6 = [(UIColor *)v4 imageAsset];
    if (v6 && [(UIColor *)v4 imageOrientation] == 4)
    {
      BOOL v7 = [(UIView *)self vuiIsRTL];

      if (!v7)
      {
LABEL_20:
        [(UIImageView *)self->_imageView setImage:v4];
        unint64_t imageContentMode = self->_imageContentMode;
        [(UIImage *)self->_placeholderImage size];
        if (v12 == 1.0 && v11 == 1.0) {
          uint64_t v14 = 2;
        }
        else {
          uint64_t v14 = imageContentMode;
        }
        [(UIImageView *)self->_imageView setVuiContentMode:v14];
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v6 = [(UIColor *)v4 imageAsset];
      v8 = [MEMORY[0x1E4F42F80] traitCollectionWithLayoutDirection:1];
      uint64_t v9 = [v6 imageWithTraitCollection:v8];

      id v4 = (UIColor *)v9;
    }

    goto LABEL_20;
  }
LABEL_11:
  [(VUIImageView *)self _updateCornerRadius];
}

- (void)setVuiBackgroundColor:(id)a3
{
}

- (void)_setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  id v5 = a3;
  [(VUIImageView *)self setVuiContentMode:self->_imageContentMode];
  [(VUIImageView *)self _updateFlatImageWithImage:v5];
}

- (void)setVuiContentMode:(unint64_t)a3
{
  if (self->_imageContentMode != a3)
  {
    self->_unint64_t imageContentMode = a3;
    [(UIImageView *)self->_imageView setContentMode:VUIUIViewContentModeFromVUIContentMode(a3)];
    [(VUIImageView *)self _updateCornerRadius];
  }
}

- (void)_updateTintColor
{
  if (self->_selected && (focusedColor = self->__focusedColor) != 0 || (focusedColor = self->__tintColor) != 0) {
    id v4 = focusedColor;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  [(UIImageView *)self->_imageView setVuiTintColor:v4];
  self->_BOOL rendersImageAsTemplates = v5 != 0;
  if (self->_image) {
    -[VUIImageView _updateFlatImageWithImage:](self, "_updateFlatImageWithImage:");
  }
}

- (void)_setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->__tintColor, a3);
  [(VUIImageView *)self _updateTintColor];
}

- (void)_setFocusedColor:(id)a3
{
  objc_storeStrong((id *)&self->__focusedColor, a3);
  [(VUIImageView *)self _updateImageView];
}

- (void)setShadowRadii:(_VUICornerRadii)a3
{
  self->_shadowRadii = a3;
}

- (void)setImageContainsShadow:(BOOL)a3
{
  self->_imageContainsShadow = a3;
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(VUIImageView *)self _updateCornerRadius];
  }
}

- (void)setBorderWidth:(double)a3
{
  if (self->_borderWidth != a3)
  {
    self->_borderWidth = a3;
    id v4 = [(UIImageView *)self->_imageView layer];
    [v4 setBorderWidth:a3];
  }
}

- (void)setBorderColor:(id)a3
{
  uint64_t v6 = (UIColor *)a3;
  if (self->_borderColor != v6)
  {
    objc_storeStrong((id *)&self->_borderColor, a3);
    id v5 = [(UIImageView *)self->_imageView layer];
    objc_msgSend(v5, "setBorderColor:", -[UIColor CGColor](v6, "CGColor"));
  }
}

- (void)setAnimatesShadowChanges:(BOOL)a3
{
  self->_animatesShadowChanges = a3;
}

- (void)setPlaceholderImage:(id)a3
{
  id v5 = (UIImage *)a3;
  p_placeholderImage = &self->_placeholderImage;
  if (self->_placeholderImage != v5)
  {
    BOOL v7 = v5;
    objc_storeStrong((id *)p_placeholderImage, a3);
    p_placeholderImage = (UIImage **)[(VUIImageView *)self _updateImageView];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_placeholderImage, v5);
}

- (void)layoutSubviews
{
  [(VUIImageView *)self bounds];
  -[VUIImageView vui_layoutSubviews:computationOnly:](self, "vui_layoutSubviews:computationOnly:", 0, v3, v4);
}

- (void)_loadImage
{
  [(VUIImageView *)self bounds];
  id v5 = -[VUIImageView _imageProxyWithSize:sizeComputationOnly:](self, "_imageProxyWithSize:sizeComputationOnly:", 0, v3, v4);
  uint64_t v6 = v5;
  if (v5 && ([v5 isEqual:self->_imageProxy] & 1) == 0) {
    objc_storeStrong((id *)&self->_imageProxy, v6);
  }
  imageProxy = self->_imageProxy;
  id v8 = objc_initWeak(&location, imageProxy);

  if (imageProxy)
  {
    [(VUIImageProxy *)self->_imageProxy setCacheOnLoad:+[VUICoreUtilities canHandleDecodingOnRenderThread] ^ 1];
    objc_initWeak(&from, self);
    uint64_t v9 = self->_imageProxy;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __26__VUIImageView__loadImage__block_invoke;
    v16[3] = &unk_1E6DDCCE8;
    objc_copyWeak(&v17, &location);
    objc_copyWeak(&v18, &from);
    [(VUIImageProxy *)v9 setCompletionHandler:v16];
    [(VUIImageProxy *)self->_imageProxy setImageDirection:[(UIView *)self vuiIsRTL]];
    [(VUIImageProxy *)self->_imageProxy load];
    objc_destroyWeak(&v18);
    id v10 = &v17;
  }
  else
  {
    double v11 = [(VUIImageView *)self completion];

    if (!v11) {
      goto LABEL_7;
    }
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      double v12 = [(VUIImageView *)self completion];
      v12[2](v12, 0, 0, 1);

      [(VUIImageView *)self setCompletion:0];
      [(VUIImageView *)self setImageLoaded:0];
      goto LABEL_7;
    }
    objc_initWeak(&from, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __26__VUIImageView__loadImage__block_invoke_2;
    v13[3] = &unk_1E6DDCD10;
    objc_copyWeak(&v14, &from);
    objc_copyWeak(&v15, &location);
    dispatch_async(MEMORY[0x1E4F14428], v13);
    objc_destroyWeak(&v15);
    id v10 = &v14;
  }
  objc_destroyWeak(v10);
  objc_destroyWeak(&from);
LABEL_7:
  objc_destroyWeak(&location);
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  [(VUIImageView *)self resourceOrSymbolSize];
  double v9 = v8;
  double v11 = v10;
  if (![(VUIImageView *)self isResourceImage])
  {
    [(VUIImageView *)self isSymbolImage];
LABEL_20:
    double v17 = *MEMORY[0x1E4F1DB30];
    double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (width == *MEMORY[0x1E4F1DB30] && height == v18)
    {
      v27 = self->_imageProxy;
    }
    else
    {
      -[VUIImageView _imageProxyWithSize:sizeComputationOnly:](self, "_imageProxyWithSize:sizeComputationOnly:", v4, width, height);
      v27 = (VUIImageProxy *)objc_claimAutoreleasedReturnValue();
    }
    v24 = v27;
    [(VUIImageProxy *)v27 expectedSize];
    BOOL v30 = v28 == v17 && v29 == v18;
    if (v30
      && ((-[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", width, height), v28 == v17)
        ? (BOOL v31 = v29 == v18)
        : (BOOL v31 = 0),
          v31))
    {
      [(VUIImageView *)self bounds];
      double v14 = v32;
      double v16 = v33;
    }
    else
    {
      double v14 = v28;
      double v16 = v29;
    }
    goto LABEL_37;
  }
  if (v9 <= 0.0 || v11 <= 0.0) {
    goto LABEL_20;
  }
  double v12 = [(VUIImageView *)self image];
  [v12 size];
  double v14 = v13;
  double v16 = v15;

  double v17 = *MEMORY[0x1E4F1DB30];
  double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  BOOL v21 = (v16 != v18 || v14 != v17) && v14 < v9 && v16 < v11;
  if (!v21 || ![(VUIImageView *)self isResourceImage])
  {
    double v16 = v11;
    double v14 = v9;
  }
  if ([(VUIImageView *)self shouldScaleToSize])
  {
    v22 = [(UIView *)self vuiTraitCollection];
    +[VUICoreUtilities scaleContentSizeValue:v22 forTraitCollection:v14];
    double v14 = v23;

    v24 = [(UIView *)self vuiTraitCollection];
    +[VUICoreUtilities scaleContentSizeValue:v24 forTraitCollection:v16];
    double v16 = v25;
LABEL_37:
  }
  if (!v4)
  {
    [(VUIImageView *)self bounds];
    double v35 = v34;
    double v37 = v36;
    imageView = self->_imageView;
    [(VUIImageView *)self bounds];
    -[UIImageView setFrame:](imageView, "setFrame:");
    if (self->_imageContainsShadow)
    {
      double v39 = self->_previousSize.width;
      double v40 = self->_previousSize.height;
      if ((v39 != v17 || v40 != v18) && (v35 != v39 || v37 != v40))
      {
        if (self->_shadowPathUpdater)
        {
          v43 = [(VUIImageView *)self shadowPathUpdater];
          v43[2]();
        }
        else
        {
          [(VUIImageView *)self bounds];
          v46 = +[VUICoreUtilities shadowPathWithCornerRadii:andScaledSize:](VUICoreUtilities, "shadowPathWithCornerRadii:andScaledSize:", self->_shadowRadii.topLeft, self->_shadowRadii.topRight, self->_shadowRadii.bottomLeft, self->_shadowRadii.bottomRight, v44, v45);
          v43 = [(VUIImageView *)self layer];
          [v43 setShadowPath:v46];
        }
      }
    }
    self->_previousSize.double width = v35;
    self->_previousSize.double height = v37;
    [(VUIImageView *)self computeCornerRadii];
  }
  double v47 = v14;
  double v48 = v16;
  result.double height = v48;
  result.double width = v47;
  return result;
}

- (id)_imageProxyWithSize:(CGSize)a3 sizeComputationOnly:(BOOL)a4
{
  dynamicProxyProvider = (void (**)(id, BOOL, __n128, __n128))self->_dynamicProxyProvider;
  if (dynamicProxyProvider)
  {
    dynamicProxyProvider[2](dynamicProxyProvider, a4, (__n128)a3, *(__n128 *)&a3.height);
    uint64_t v6 = (VUIImageProxy *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = self->_imageProxy;
  }
  return v6;
}

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VUIImageView;
  -[VUIImageView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  imageView = self->_imageView;
  [(VUIImageView *)self bounds];
  -[UIImageView setFrame:](imageView, "setFrame:");
  [(VUIImageView *)self computeCornerRadii];
}

- (void)computeCornerRadii
{
  if (self->__imageShape == 1)
  {
    [(VUIImageView *)self frame];
    [(VUIImageView *)self setCornerRadius:v3 * 0.22];
  }
}

- (CGSize)resourceOrSymbolSize
{
  double width = self->_resourceOrSymbolSize.width;
  double height = self->_resourceOrSymbolSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isSymbolImage
{
  return self->_symbolImage;
}

- (BOOL)isResourceImage
{
  return self->_resourceImage;
}

- (void)setImageProxy:(id)a3 clearingExisting:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  double v25 = (VUIImageProxy *)a3;
  id v9 = a5;
  p_imageProxy = &self->_imageProxy;
  if (self->_imageProxy != v25 || self->_completion != v9)
  {
    uint64_t v11 = [(VUIImageView *)self window];
    if (v11)
    {
      double v12 = (void *)v11;
      BOOL v13 = [(UIView *)self vuiIsRTL];

      BOOL v14 = v13;
    }
    else
    {
      BOOL v14 = 0;
    }
    [(VUIImageProxy *)v25 setImageDirection:v14];
    BOOL v15 = [(VUIImageProxy *)v25 isEqual:*p_imageProxy];
    BOOL v16 = [(VUIImageView *)self isImageLoaded];
    if (v15)
    {
      if (!v16)
      {
        double v17 = [(VUIImageView *)self completion];

        if (v17)
        {
          double v18 = [(VUIImageView *)self completion];
          v19 = [(VUIImageView *)self image];
          ((void (**)(void, void *, void, void))v18)[2](v18, v19, 0, 0);
        }
      }
      [(VUIImageView *)self setCompletion:v9];
      if ([(VUIImageView *)self isImageLoaded])
      {
        v20 = [(VUIImageView *)self completion];

        if (v20)
        {
          BOOL v21 = [(VUIImageView *)self completion];
          v22 = [(VUIImageView *)self image];
          ((void (**)(void, void *, void, uint64_t))v21)[2](v21, v22, 0, 1);

          [(VUIImageView *)self setCompletion:0];
        }
      }
    }
    else
    {
      if (!v16) {
        [(VUIImageProxy *)*p_imageProxy cancel];
      }
      [(VUIImageView *)self setImageLoaded:0];
      if (![(VUIImageProxy *)*p_imageProxy isOfSameOriginAs:v25] && v6) {
        [(VUIImageView *)self _setImage:0];
      }
      [(VUIImageView *)self setCompletion:v9];
      objc_storeStrong((id *)&self->_imageProxy, a3);
      double v23 = [(VUIImageView *)self window];

      if (v23) {
        [(VUIImageView *)self _loadImage];
      }
    }
  }
  v24 = [(VUIImageProxy *)v25 object];
  if (v24) {
    objc_storeStrong((id *)&self->_latestImageURL, v24);
  }
}

void __26__VUIImageView__loadImage__block_invoke_22(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    double v3 = [WeakRetained imageProxy];
    int v4 = [v3 isEqual:*(void *)(a1 + 32)];

    id WeakRetained = v8;
    if (v4)
    {
      if (*(void *)(a1 + 40) && *(unsigned char *)(a1 + 64))
      {
        objc_msgSend(v8, "_setImage:");
        objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v5 postNotificationName:@"VUIImageViewImageDidLoadNotification" object:v8];
      }
      [v8 setImageLoaded:*(unsigned __int8 *)(a1 + 64)];
      BOOL v6 = [v8 completion];

      id WeakRetained = v8;
      if (v6)
      {
        BOOL v7 = [v8 completion];
        v7[2](v7, *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));

        id WeakRetained = v8;
        if (*(unsigned char *)(a1 + 64))
        {
          [v8 setCompletion:0];
          id WeakRetained = v8;
        }
      }
    }
  }
}

- (void)setImageLoaded:(BOOL)a3
{
  self->_imageLoaded = a3;
}

- (id)completion
{
  return self->_completion;
}

- (VUIImageProxy)imageProxy
{
  return self->_imageProxy;
}

void __26__VUIImageView__loadImage__block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v7)
  {
    [v7 setEnableCache:1];
    double v10 = [v7 uiImage];
  }
  else
  {
    if (a4)
    {
      uint64_t v11 = VUICDefaultLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __26__VUIImageView__loadImage__block_invoke_cold_1((uint64_t)WeakRetained, (uint64_t)v8, v11);
      }
    }
    double v10 = 0;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __26__VUIImageView__loadImage__block_invoke_22;
  v16[3] = &unk_1E6DDCCC0;
  objc_copyWeak(&v20, (id *)(a1 + 40));
  id v12 = WeakRetained;
  id v17 = v12;
  id v13 = v10;
  id v18 = v13;
  char v21 = a4;
  id v14 = v8;
  id v19 = v14;
  BOOL v15 = (void (**)(void))MEMORY[0x1E4E604D0](v16);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v15[2](v15);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v15);
  }

  objc_destroyWeak(&v20);
}

- (void)vui_willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VUIImageView;
  -[UIView vui_willMoveToWindow:](&v6, sel_vui_willMoveToWindow_);
  BOOL v5 = [(VUIImageView *)self isImageLoaded];
  if (a3)
  {
    if (!v5) {
      [(VUIImageView *)self _loadImage];
    }
  }
  else if (!v5)
  {
    [(VUIImageProxy *)self->_imageProxy cancel];
  }
}

- (BOOL)isImageLoaded
{
  return self->_imageLoaded;
}

- (void)setCompletion:(id)a3
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[VUIImageView vui_layoutSubviews:computationOnly:](self, "vui_layoutSubviews:computationOnly:", 1, a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!self->_animatesShadowChanges || ([v7 isEqualToString:@"shadowPath"] & 1) == 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)VUIImageView;
    [(VUIImageView *)&v17 actionForLayer:v6 forKey:v8];
    id v13 = LABEL_8:;
    goto LABEL_9;
  }
  uint64_t v9 = [v6 shadowPath];
  if (!v9)
  {
    v16.receiver = self;
    v16.super_class = (Class)VUIImageView;
    [(VUIImageView *)&v16 actionForLayer:v6 forKey:v8];
    goto LABEL_8;
  }
  uint64_t v10 = v9;
  uint64_t v11 = [v6 animationForKey:@"bounds.size"];
  if (v11 && (objc_opt_class(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v12 = (void *)[v11 copy];
    [v12 setKeyPath:@"shadowPath"];
    id v13 = objc_opt_new();
    [v13 setFromPath:v10];
    [v13 setAnimationToRun:v12];
    [v13 setKey:@"shadowPath"];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)VUIImageView;
    id v13 = [(VUIImageView *)&v15 actionForLayer:v6 forKey:v8];
  }

LABEL_9:
  return v13;
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  [(VUIImageView *)self setImageProxy:0];
  [(VUIImageView *)self _setImage:v4];
}

- (void)setImageProxy:(id)a3 completion:(id)a4
{
}

- (void)setImageProxy:(id)a3
{
}

- (void)setSymbolImage:(BOOL)a3
{
  self->_symbolImage = a3;
}

- (void)setResourceOrSymbolSize:(CGSize)a3
{
  self->_resourceOrSymbolSize = a3;
}

- (void)setResourceImage:(BOOL)a3
{
  self->_resourceImage = a3;
}

void __30__VUIImageView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateTintColor];
}

- (void)dealloc
{
  [(VUIImageProxy *)self->_imageProxy setCompletionHandler:0];
  [(VUIImageProxy *)self->_imageProxy cancel];
  v3.receiver = self;
  v3.super_class = (Class)VUIImageView;
  [(VUIImageView *)&v3 dealloc];
}

- (CGSize)intrinsicContentSize
{
  [(UIImageView *)self->_imageView intrinsicContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (unint64_t)vuiContentMode
{
  return self->_imageContentMode;
}

- (id)vuiBackgroundColor
{
  return (id)[(UIImageView *)self->_imageView vuiBackgroundColor];
}

- (void)setBackgroundColor:(id)a3
{
}

- (id)backgroundColor
{
  return (id)[(UIImageView *)self->_imageView vuiBackgroundColor];
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
  double result = 0.0;
  if (self->_continuousCorners) {
    return 1.0;
  }
  return result;
}

- (void)setImageContainsCornerRadius:(BOOL)a3
{
  if (self->_imageContainsCornerRadius != a3)
  {
    self->_imageContainsCornerRadius = a3;
    [(VUIImageView *)self _updateCornerRadius];
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
  v5.receiver = self;
  v5.super_class = (Class)VUIImageView;
  -[VUIImageView setHighlighted:](&v5, sel_setHighlighted_);
  [(VUIImageView *)self vui_setHighlighted:v3];
}

- (void)vui_setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  -[UIImageView setHighlighted:](self->_imageView, "setHighlighted:");
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
    id v8 = [v7 filters];
    id v21 = (id)[v8 mutableCopy];

    [v21 removeObjectIdenticalTo:self->_highlightFilter];
    goto LABEL_16;
  }
  if (!highlightFilter)
  {
    uint64_t v9 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
    uint64_t v10 = self->_highlightFilter;
    self->_highlightFilter = v9;

    [(CAFilter *)self->_highlightFilter setValue:[(UIColor *)self->__focusedColor CGColor] forKey:@"inputColor"];
  }
  uint64_t v11 = [(UIImageView *)self->_imageView layer];
  id v12 = [v11 filters];
  char v13 = [v12 containsObject:self->_highlightFilter];

  if ((v13 & 1) == 0)
  {
    id v14 = [(UIImageView *)self->_imageView layer];
    objc_super v15 = [v14 filters];
    objc_super v16 = (void *)[v15 mutableCopy];
    objc_super v17 = v16;
    if (v16) {
      id v18 = v16;
    }
    else {
      id v18 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    }
    id v21 = v18;

    [v21 addObject:self->_highlightFilter];
LABEL_16:
    id v19 = [(UIImageView *)self->_imageView layer];
    id v20 = (void *)[v21 copy];
    [v19 setFilters:v20];
  }
}

- (void)vui_setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  BOOL v5 = a3;
  self->_selected = a3;
  [(VUIImageView *)self _updateImageView];
  if ([(VUIImageView *)self _enableEdgeAntialiasingOnSelected])
  {
    id v7 = [(UIImageView *)self->_imageView layer];
    [v7 setAllowsEdgeAntialiasing:v5];

    id v8 = [(UIImageView *)self->_imageView layer];
    [v8 setEdgeAntialiasingMask:3];
  }
}

- (void)_reloadImageForLayoutDirectionChange
{
  BOOL v3 = [(VUIImageView *)self window];

  if (v3)
  {
    int v4 = [(UIView *)self vuiIsRTL];
    BOOL v5 = [(VUIImageView *)self imageProxy];
    uint64_t v6 = [v5 imageDirection];

    if (v6 != v4)
    {
      [(VUIImageView *)self _loadImage];
    }
  }
  else
  {
    [(VUIImageView *)self setImageLoaded:0];
  }
}

void __26__VUIImageView__loadImage__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && (id)WeakRetained[78] == v2)
  {
    BOOL v3 = [WeakRetained completion];
    v3[2](v3, 0, 0, 1);

    [WeakRetained setCompletion:0];
    [WeakRetained setImageLoaded:0];
  }
}

- (id)_imageView
{
  return self->_imageView;
}

- (void)_setImageShape:(int64_t)a3
{
  self->__imageShape = a3;
  [(VUIImageView *)self computeCornerRadii];
}

- (void)setPreferredVibrancy:(int64_t)a3
{
  self->_preferredVibrancy = a3;
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return [(UIImageView *)self->_imageView vuiSymbolConfiguration];
}

- (void)_setPreferredSymbolConfiguration:(id)a3
{
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (BOOL)shouldScaleToSize
{
  return self->_shouldScaleToSize;
}

- (void)setShouldScaleToSize:(BOOL)a3
{
  self->_shouldScaleToSize = a3;
}

- (BOOL)imageContainsShadow
{
  return self->_imageContainsShadow;
}

- (BOOL)animatesShadowChanges
{
  return self->_animatesShadowChanges;
}

- (_VUICornerRadii)shadowRadii
{
  double topLeft = self->_shadowRadii.topLeft;
  double topRight = self->_shadowRadii.topRight;
  double bottomLeft = self->_shadowRadii.bottomLeft;
  double bottomRight = self->_shadowRadii.bottomRight;
  result.double bottomRight = bottomRight;
  result.double bottomLeft = bottomLeft;
  result.double topRight = topRight;
  result.double topLeft = topLeft;
  return result;
}

- (id)shadowPathUpdater
{
  return self->_shadowPathUpdater;
}

- (void)setShadowPathUpdater:(id)a3
{
}

- (BOOL)imageContainsCornerRadius
{
  return self->_imageContainsCornerRadius;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (int64_t)preferredVibrancy
{
  return self->_preferredVibrancy;
}

- (NSURL)latestImageURL
{
  return self->_latestImageURL;
}

- (id)dynamicProxyProvider
{
  return self->_dynamicProxyProvider;
}

- (void)setDynamicProxyProvider:(id)a3
{
}

- (UIColor)_tintColor
{
  return self->__tintColor;
}

- (UIColor)_focusedColor
{
  return self->__focusedColor;
}

- (int64_t)_imageShape
{
  return self->__imageShape;
}

- (BOOL)_enableEdgeAntialiasingOnSelected
{
  return self->__enableEdgeAntialiasingOnSelected;
}

- (void)_setEnableEdgeAntialiasingOnSelected:(BOOL)a3
{
  self->__enableEdgeAntialiasingOnSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->__tintColor, 0);
  objc_storeStrong(&self->_dynamicProxyProvider, 0);
  objc_storeStrong((id *)&self->_latestImageURL, 0);
  objc_storeStrong((id *)&self->_imageProxy, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong(&self->_shadowPathUpdater, 0);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_highlightFilter, 0);
  objc_storeStrong((id *)&self->_flatHighlightImage, 0);
  objc_storeStrong((id *)&self->_flatImage, 0);
  objc_storeStrong((id *)&self->__focusedColor, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (void)addSymbolEffect:(id)a3 options:(id)a4 animated:(BOOL)a5
{
}

- (void)setSymbolImage:(id)a3 withSymbolTransition:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(VUIImageView *)self setImageProxy:0];
  [(UIImageView *)self->_imageView setSymbolImage:v7 withContentTransition:v6];

  [(VUIImageView *)self _setImage:v7];
}

void __26__VUIImageView__loadImage__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1E29E1000, log, OS_LOG_TYPE_ERROR, "%@ was unable to load image: %@", (uint8_t *)&v3, 0x16u);
}

@end