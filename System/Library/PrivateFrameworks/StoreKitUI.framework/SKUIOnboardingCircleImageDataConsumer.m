@interface SKUIOnboardingCircleImageDataConsumer
- (BOOL)usesSaturationFilter;
- (CGSize)outputSize;
- (UIColor)tintColor;
- (id)_saturationBackgroundImageWithSize:(CGSize)a3;
- (id)imageForImage:(id)a3;
- (void)setOutputSize:(CGSize)a3;
- (void)setTintColor:(id)a3;
- (void)setUsesSaturationFilter:(BOOL)a3;
@end

@implementation SKUIOnboardingCircleImageDataConsumer

- (id)imageForImage:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIOnboardingCircleImageDataConsumer imageForImage:]();
  }
  if ([(SKUIOnboardingCircleImageDataConsumer *)self usesSaturationFilter])
  {
    v5 = (void *)SKUICoreImageFramework();
    id v6 = SKUIWeakLinkedClassForString(&cfstr_Cicontext.isa, (uint64_t)v5);
    id v7 = SKUIWeakLinkedClassForString(&cfstr_Ciimage.isa, (uint64_t)v5);
    id v8 = SKUIWeakLinkedClassForString(&cfstr_Cifilter.isa, (uint64_t)v5);
    id v9 = *(id *)SKUIWeakLinkedSymbolForString("kCIInputBackgroundImageKey", v5);
    id v10 = *(id *)SKUIWeakLinkedSymbolForString("kCIInputImageKey", v5);
    id v11 = *(id *)SKUIWeakLinkedSymbolForString("kCIOutputImageKey", v5);
    v12 = objc_msgSend(v8, "filterWithName:keysAndValues:", @"CIColorControls", @"inputSaturation", &unk_1F1D62138, 0);
    id v13 = v4;
    v14 = objc_msgSend(v7, "imageWithCGImage:", objc_msgSend(v13, "CGImage"));
    [v12 setValue:v14 forKey:v10];

    v15 = [v8 filterWithName:@"CIMultiplyBlendMode"];
    v16 = [v12 valueForKey:v11];
    [v15 setValue:v16 forKey:v10];

    [v13 size];
    -[SKUIOnboardingCircleImageDataConsumer _saturationBackgroundImageWithSize:](self, "_saturationBackgroundImageWithSize:");
    id v17 = objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v7, "imageWithCGImage:", objc_msgSend(v17, "CGImage"));
    [v15 setValue:v18 forKey:v9];

    v19 = [v6 contextWithOptions:0];
    v20 = [v15 valueForKey:v11];

    [v20 extent];
    v21 = (const void *)objc_msgSend(v19, "createCGImage:fromRect:", v20);
    id v4 = [MEMORY[0x1E4FB1818] imageWithCGImage:v21];

    CFRelease(v21);
  }
  p_outputSize = &self->_outputSize;
  v23 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v23 scale];
  UIGraphicsBeginImageContextWithOptions(*p_outputSize, 0, v24);

  CurrentContext = UIGraphicsGetCurrentContext();
  double width = p_outputSize->width;
  double height = p_outputSize->height;
  CGContextBeginPath(CurrentContext);
  v31.origin.x = 0.0;
  v31.origin.y = 0.0;
  v31.size.double width = width;
  v31.size.double height = height;
  CGContextAddEllipseInRect(CurrentContext, v31);
  CGContextClosePath(CurrentContext);
  CGContextClip(CurrentContext);
  objc_msgSend(v4, "drawInRect:", 0.0, 0.0, width, height);
  v28 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v28;
}

- (id)_saturationBackgroundImageWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v6 scale];
  CGFloat v8 = v7;
  v13.CGFloat width = width;
  v13.CGFloat height = height;
  UIGraphicsBeginImageContextWithOptions(v13, 0, v8);

  id v9 = [(SKUIOnboardingCircleImageDataConsumer *)self tintColor];
  [v9 set];

  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  UIRectFill(v14);
  id v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v10;
}

- (CGSize)outputSize
{
  double width = self->_outputSize.width;
  double height = self->_outputSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setOutputSize:(CGSize)a3
{
  self->_outputSize = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (BOOL)usesSaturationFilter
{
  return self->_usesSaturationFilter;
}

- (void)setUsesSaturationFilter:(BOOL)a3
{
  self->_usesSaturationFilter = a3;
}

- (void).cxx_destruct
{
}

- (void)imageForImage:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIOnboardingCircleImageDataConsumer imageForImage:]";
}

@end