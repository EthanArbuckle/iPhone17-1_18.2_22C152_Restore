@interface _TVProductBannerBlurImageDecorator
- (BOOL)lightStyle;
- (_UIBackdropViewSettings)backdropSettings;
- (id)blurImageWithImage:(id)a3 targetSize:(CGSize)a4 scaleSize:(CGSize)a5;
- (id)decorate:(id)a3 scaledWithSize:(CGSize)a4 croppedToFit:(BOOL)a5;
- (id)resizeImage:(CGImage *)a3 targetSize:(CGSize)a4 shouldDither:(BOOL)a5;
- (void)setBackdropSettings:(id)a3;
- (void)setLightStyle:(BOOL)a3;
@end

@implementation _TVProductBannerBlurImageDecorator

- (id)decorate:(id)a3 scaledWithSize:(CGSize)a4 croppedToFit:(BOOL)a5
{
  v6 = (void *)MEMORY[0x263F1C920];
  id v7 = a3;
  v8 = [v6 mainScreen];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  id v13 = v7;
  v14 = (CGImage *)[v13 CGImage];
  double Width = (double)CGImageGetWidth(v14);
  v16 = -[_TVProductBannerBlurImageDecorator blurImageWithImage:targetSize:scaleSize:](self, "blurImageWithImage:targetSize:scaleSize:", v13, v10, v12, 2800.0, dbl_230C38020[Width / (double)CGImageGetHeight(v14) > 0.99]);

  return v16;
}

- (id)blurImageWithImage:(id)a3 targetSize:(CGSize)a4 scaleSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.height;
  double v8 = a4.width;
  double v10 = (CGImage *)[a3 CGImage];
  double v11 = (double)CGImageGetWidth(v10);
  size_t v12 = CGImageGetHeight(v10);
  v26.size.double width = v8 / width * v11;
  v26.size.double height = v7 / height * (double)v12;
  v26.origin.x = (v11 - v26.size.width) * 0.5;
  v26.origin.y = ((double)v12 - v26.size.height) * 0.5;
  CGImageRef v13 = CGImageCreateWithImageInRect(v10, v26);
  v14 = -[_TVProductBannerBlurImageDecorator resizeImage:targetSize:shouldDither:](self, "resizeImage:targetSize:shouldDither:", v13, 0, v8, v7);
  if (v13) {
    CFRelease(v13);
  }
  v15 = self->_backdropSettings;
  if (!v15)
  {
    if (self->_lightStyle) {
      uint64_t v16 = 2010;
    }
    else {
      uint64_t v16 = 2030;
    }
    v15 = [MEMORY[0x263F1CBF0] settingsForPrivateStyle:v16];
  }
  [(_UIBackdropViewSettings *)v15 setBlurRadius:150.0];
  id v17 = [v14 _applyBackdropViewSettings:v15 includeTints:1 includeBlur:1 allowImageResizing:0];
  if (![v17 CGImage] || (id v18 = v17) == 0)
  {
    if ([v17 ioSurface]
      && ([v17 ioSurface], (uint64_t v19 = _UICreateCGImageFromIOSurfaceWithOptions()) != 0))
    {
      v20 = (const void *)v19;
      id v18 = [MEMORY[0x263F1C6B0] imageWithCGImage:v19];
      CFRelease(v20);
    }
    else
    {
      id v18 = 0;
    }
  }
  id v21 = v18;
  -[_TVProductBannerBlurImageDecorator resizeImage:targetSize:shouldDither:](self, "resizeImage:targetSize:shouldDither:", [v21 CGImage], 1, v8, v7);
  id v22 = objc_claimAutoreleasedReturnValue();
  if ([v22 CGImage])
  {
    id v23 = v22;

    id v21 = v23;
  }
  id v24 = v21;

  return v24;
}

- (id)resizeImage:(CGImage *)a3 targetSize:(CGSize)a4 shouldDither:(BOOL)a5
{
  if (a3
    && (BOOL v5 = a5,
        size_t v7 = (unint64_t)a4.width,
        size_t v8 = (unint64_t)a4.height,
        DeviceRGB = CGColorSpaceCreateDeviceRGB(),
        double v10 = CGBitmapContextCreate(0, v7, v8, 8uLL, 0, DeviceRGB, 0x2006u),
        CFRelease(DeviceRGB),
        v10))
  {
    CGContextSetBlendMode(v10, kCGBlendModeCopy);
    ClipBoundingBoCGFloat x = CGContextGetClipBoundingBox(v10);
    CGFloat x = ClipBoundingBox.origin.x;
    CGFloat y = ClipBoundingBox.origin.y;
    double width = ClipBoundingBox.size.width;
    double height = ClipBoundingBox.size.height;
    CGContextDrawImage(v10, ClipBoundingBox, a3);
    if (v5)
    {
      _TVNoiseImageOfSize(1, width, height);
      id v15 = objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v15 CGImage];
      if (v16)
      {
        id v17 = (CGImage *)v16;
        CGContextSetBlendMode(v10, kCGBlendModeNormal);
        CGContextSetAlpha(v10, 0.03);
        v24.origin.CGFloat x = x;
        v24.origin.CGFloat y = y;
        v24.size.double width = width;
        v24.size.double height = height;
        CGContextDrawImage(v10, v24, v17);
      }
    }
    CGImageRef Image = CGBitmapContextCreateImage(v10);
    if (Image)
    {
      CGImageRef v19 = Image;
      v20 = [MEMORY[0x263F1C6B0] imageWithCGImage:Image scale:0 orientation:1.0];
      CFRelease(v19);
    }
    else
    {
      v20 = 0;
    }
    CFRelease(v10);
  }
  else
  {
    v20 = 0;
  }
  return v20;
}

- (BOOL)lightStyle
{
  return self->_lightStyle;
}

- (void)setLightStyle:(BOOL)a3
{
  self->_lightStyle = a3;
}

- (_UIBackdropViewSettings)backdropSettings
{
  return self->_backdropSettings;
}

- (void)setBackdropSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end