@interface VUIProductUberBackgroundView
- (BOOL)isChannelBanner;
- (CAGradientLayer)gradientLayer;
- (CGSize)imageSize;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (UIView)imageView;
- (UIVisualEffectView)blurEffectView;
- (VUIProductUberBackgroundView)initWithFrame:(CGRect)a3;
- (double)_gradientHeightForSizeClass:(int64_t)a3 mainRect:(CGRect)a4;
- (double)contentOffset;
- (double)highestSubviewY;
- (unint64_t)configuredBlurInterfaceStyle;
- (void)_configureGradientLayer:(id)a3 currentSizeClass:(int64_t)a4 mainRect:(CGRect)a5;
- (void)configureBlurEffectAndGradientWithInterfaceStyle:(unint64_t)a3 mainRect:(CGRect)a4;
- (void)configureBlurWithInterfaceStyle:(unint64_t)a3;
- (void)configureBlurWithInterfaceStyle:(unint64_t)a3 mainRect:(CGRect)a4;
- (void)resetBlurEffectAndGradient;
- (void)setBlurEffectView:(id)a3;
- (void)setConfiguredBlurInterfaceStyle:(unint64_t)a3;
- (void)setContentOffset:(double)a3;
- (void)setGradientLayer:(id)a3;
- (void)setHighestSubviewY:(double)a3;
- (void)setImageOffset:(double)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setImageView:(id)a3;
- (void)setIsChannelBanner:(BOOL)a3;
- (void)setMasksBlur:(BOOL)a3;
@end

@implementation VUIProductUberBackgroundView

- (VUIProductUberBackgroundView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VUIProductUberBackgroundView;
  v3 = -[VUIProductUberBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(VUIProductUberBackgroundView *)v3 setAutoresizingMask:1];
    v4->_configuredBlurInterfaceStyle = 0;
  }
  return v4;
}

- (void)setImageView:(id)a3
{
  v5 = (UIView *)a3;
  if (self->_imageView != v5)
  {
    v7 = v5;
    -[VUIProductUberBackgroundView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_super v6 = v7;
    if (self->_imageView != v7)
    {
      objc_storeStrong((id *)&self->_imageView, a3);
      objc_super v6 = v7;
    }
    [(UIView *)v6 setVuiContentMode:2];
    [(VUIProductUberBackgroundView *)self vui_setNeedsLayout];
    v5 = v7;
  }
}

- (void)configureBlurWithInterfaceStyle:(unint64_t)a3
{
  [(VUIProductUberBackgroundView *)self bounds];
  -[VUIProductUberBackgroundView configureBlurWithInterfaceStyle:mainRect:](self, "configureBlurWithInterfaceStyle:mainRect:", a3);
}

- (void)configureBlurWithInterfaceStyle:(unint64_t)a3 mainRect:(CGRect)a4
{
  if (a3)
  {
    if (!self->_blurEffectView || self->_configuredBlurInterfaceStyle != a3)
    {
      -[VUIProductUberBackgroundView configureBlurEffectAndGradientWithInterfaceStyle:mainRect:](self, "configureBlurEffectAndGradientWithInterfaceStyle:mainRect:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
      self->_configuredBlurInterfaceStyle = a3;
    }
  }
  else
  {
    [(VUIProductUberBackgroundView *)self resetBlurEffectAndGradient];
  }
}

- (void)setMasksBlur:(BOOL)a3
{
}

- (void)setImageOffset:(double)a3
{
  VUIRoundValue();
  self->_contentOffset = v5;
  [(VUIProductUberBackgroundView *)self bounds];
  if (a3 > 0.0) {
    -[UIView _setContentRectInPixels:forContentSize:](self->_imageView, "_setContentRectInPixels:forContentSize:", 0.0, fmin(self->_contentOffset * -0.28, 0.0), v6, v7, v6, v7);
  }
  imageView = self->_imageView;
  [(UIView *)imageView setFrame:0.0];
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  if (!a4)
  {
    imageView = self->_imageView;
    if (imageView)
    {
      double contentOffset = self->_contentOffset;
      double v9 = height - contentOffset;
      double v10 = a3.width;
    }
    else
    {
      double contentOffset = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    -[UIView setFrame:](imageView, "setFrame:", *MEMORY[0x1E4F1DB28], contentOffset, v10, v9);
    [(VUIProductUberBackgroundView *)self vui_bringSubviewToFront:self->_blurEffectView];
    v18.origin.x = 0.0;
    v18.origin.y = 0.0;
    v18.size.double width = width;
    v18.size.double height = height;
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v18));
    v12 = (void *)MEMORY[0x1E4FB1F48];
    [(CAGradientLayer *)self->_gradientLayer frame];
    if (v11 != objc_msgSend(v12, "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v19)) && self->_isChannelBanner) {
      -[VUIProductUberBackgroundView _configureGradientLayer:currentSizeClass:mainRect:](self, "_configureGradientLayer:currentSizeClass:mainRect:", self->_gradientLayer, v11, 0.0, 0.0, width, height);
    }
    -[VUIProductUberBackgroundView _gradientHeightForSizeClass:mainRect:](self, "_gradientHeightForSizeClass:mainRect:", v11, 0.0, 0.0, width, height);
    double v14 = v13;
    -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:", 0.0, 0.0, width, v13);
    [(CAGradientLayer *)self->_gradientLayer removeAllAnimations];
    -[UIVisualEffectView setFrame:](self->_blurEffectView, "setFrame:", 0.0, height - v14, width, v14);
  }
  double v15 = width;
  double v16 = height;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)configureBlurEffectAndGradientWithInterfaceStyle:(unint64_t)a3 mainRect:(CGRect)a4
{
  if (!self->_gradientLayer)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    double v10 = [MEMORY[0x1E4F39BD0] layer];
    [(CAGradientLayer *)v10 setShouldRasterize:0];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4FB1BA8], "vui_main");
    objc_msgSend(v11, "vui_scale");
    -[CAGradientLayer setRasterizationScale:](v10, "setRasterizationScale:");

    v23.origin.double x = x;
    v23.origin.double y = y;
    v23.size.double width = width;
    v23.size.double height = height;
    -[VUIProductUberBackgroundView _configureGradientLayer:currentSizeClass:mainRect:](self, "_configureGradientLayer:currentSizeClass:mainRect:", v10, objc_msgSend(MEMORY[0x1E4FB1F48], "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v23)), x, y, width, height);
    gradientLayer = self->_gradientLayer;
    self->_gradientLayer = v10;
  }
  if (a3 == 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2;
  }
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4FB14C8], "effectWithStyle:", v13, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  blurEffectView = self->_blurEffectView;
  id v21 = (id)v14;
  if (blurEffectView)
  {
    [(UIVisualEffectView *)blurEffectView setEffect:v14];
  }
  else
  {
    double v16 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v14];
    v17 = self->_blurEffectView;
    self->_blurEffectView = v16;
    CGRect v18 = v16;

    [(VUIProductUberBackgroundView *)self addSubview:self->_blurEffectView];
  }
  CGRect v19 = [(UIVisualEffectView *)self->_blurEffectView layer];
  [v19 addSublayer:self->_gradientLayer];

  v20 = [(UIVisualEffectView *)self->_blurEffectView layer];
  [v20 setAllowsGroupBlending:1];
}

- (void)resetBlurEffectAndGradient
{
  [(UIVisualEffectView *)self->_blurEffectView removeFromSuperview];
  blurEffectView = self->_blurEffectView;
  self->_blurEffectView = 0;

  [(CAGradientLayer *)self->_gradientLayer removeFromSuperlayer];
  gradientLayer = self->_gradientLayer;
  self->_gradientLayer = 0;
}

- (double)_gradientHeightForSizeClass:(int64_t)a3 mainRect:(CGRect)a4
{
  if (self->_isChannelBanner) {
    return dbl_1E38FE520[(unint64_t)(a3 - 3) < 3];
  }
  VUIRoundValue();
  double v4 = v6;
  if (!UIAccessibilityIsReduceTransparencyEnabled() || self->_highestSubviewY <= 0.0) {
    return v4;
  }
  VUIRoundValue();
  return result;
}

- (void)_configureGradientLayer:(id)a3 currentSizeClass:(int64_t)a4 mainRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v31[5] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v12 = v11;
  if (self->_isChannelBanner)
  {
    -[VUIProductUberBackgroundView _gradientHeightForSizeClass:mainRect:](self, "_gradientHeightForSizeClass:mainRect:", a4, x, y, width, height);
    double v14 = v13;
    unint64_t v15 = a4 - 3;
    id v16 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v17 = [v16 CGColor];
    if (v15 >= 3)
    {
      uint64_t v30 = v17;
      CGRect v18 = &unk_1F3F3E4B0;
      CGRect v19 = &v30;
    }
    else
    {
      v31[0] = v17;
      CGRect v18 = &unk_1F3F3E498;
      CGRect v19 = v31;
    }
    id v23 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.74];
    v19[1] = [v23 CGColor];
    id v24 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.1];
    v19[2] = [v24 CGColor];
    id v25 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
    v19[3] = [v25 CGColor];
    id v26 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
    v19[4] = [v26 CGColor];
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:5];
    [v12 setColors:v27];

    v28 = +[VUIUtilities gradientLayerLocationsFromSpacings:v18 height:v14];
    [v12 setLocations:v28];

    objc_msgSend(v12, "setStartPoint:", 0.5, 0.0);
    objc_msgSend(v12, "setEndPoint:", 0.5, 1.0);
  }
  else
  {
    objc_msgSend(v11, "setStartPoint:", 0.5, 0.0);
    objc_msgSend(v12, "setEndPoint:", 0.5, 1.0);
    [v12 setLocations:&unk_1F3F3E4C8];
    id v20 = [MEMORY[0x1E4FB1618] whiteColor];
    v29[0] = [v20 CGColor];
    id v21 = [MEMORY[0x1E4FB1618] clearColor];
    v29[1] = [v21 CGColor];
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    [v12 setColors:v22];
  }
  [v12 setCompositingFilter:*MEMORY[0x1E4F3A098]];
}

- (BOOL)isChannelBanner
{
  return self->_isChannelBanner;
}

- (void)setIsChannelBanner:(BOOL)a3
{
  self->_isChannelBanner = a3;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (UIView)imageView
{
  return self->_imageView;
}

- (double)highestSubviewY
{
  return self->_highestSubviewY;
}

- (void)setHighestSubviewY:(double)a3
{
  self->_highestSubviewY = a3;
}

- (unint64_t)configuredBlurInterfaceStyle
{
  return self->_configuredBlurInterfaceStyle;
}

- (void)setConfiguredBlurInterfaceStyle:(unint64_t)a3
{
  self->_configuredBlurInterfaceStyle = a3;
}

- (UIVisualEffectView)blurEffectView
{
  return self->_blurEffectView;
}

- (void)setBlurEffectView:(id)a3
{
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
}

- (double)contentOffset
{
  return self->_contentOffset;
}

- (void)setContentOffset:(double)a3
{
  self->_double contentOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_blurEffectView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end