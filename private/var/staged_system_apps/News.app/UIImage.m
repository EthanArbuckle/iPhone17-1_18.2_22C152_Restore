@interface UIImage
+ (id)fr_gradientImageForTextSize:(CGSize)a3 withStartColor:(id)a4 endColor:(id)a5;
+ (id)fr_imageWithColor:(id)a3 size:(CGSize)a4 cornerRadius:(double)a5;
+ (id)fr_immediatelyLoadedImageWithData:(id)a3;
+ (id)fr_immediatelyLoadedImageWithData:(id)a3 scale:(double)a4;
+ (id)imageFromFileURL:(id)a3;
+ (int64_t)fr_estimatedImageTypeWithData:(id)a3;
- (CGRect)filledRectForRect:(CGRect)a3;
- (CGSize)fr_sizeThatFills:(CGSize)a3;
- (UIImage)imageWithCornerRadius:(double)a3;
- (UIImage)imageWithCornerRadius:(double)a3 scale:(double)a4 targetSize:(CGSize)a5;
- (id)applyBlurWithRadius:(double)a3 tintColor:(id)a4 saturationDeltaFactor:(double)a5 maskImage:(id)a6 targetSize:(CGSize)a7 screenScale:(double)a8 opaque:(BOOL)a9 logoRect:(CGRect)a10 logoImage:(id)a11 logoText:(id)a12 cornerRadius:(double)a13 punchThroughBanner:(BOOL)a14 allowAldenTint:(BOOL)a15;
- (id)fr_applyDarkEffect;
- (id)fr_bannerImageWithLogo:(id)a3;
- (id)fr_colorMonochromeImageWithColor:(id)a3;
- (id)fr_croppedImageWithAspectRatio:(double)a3;
- (id)fr_darkAndBlurredImageWithContext:(id)a3;
- (id)fr_darkAndBlurredImageWithContext:(id)a3 withBlurRadius:(double)a4 vibrancyAmount:(double)a5;
- (id)fr_darkAndBlurredImageWithContext:(id)a3 withBlurRadius:(double)a4 vibrancyAmount:(double)a5 alpha:(double)a6;
- (id)fr_imageAspectFitToSize:(CGSize)a3 targetScale:(double)a4 croppedToCornerRadius:(double)a5 withMargin:(double)a6 withBackgroundColor:(id)a7 borderColor:(id)a8;
- (id)fr_imageByApplyingAlpha:(double)a3;
- (id)fr_imageByCroppingSubRect:(CGRect)a3;
- (id)fr_imageByScalingAndCroppingForSize:(CGSize)a3 scale:(double)a4;
- (id)fr_imageCroppedToCircleWithBackgroundColor:(id)a3;
- (id)fr_imageCroppedToCornerRadius:(double)a3 withBackgroundColor:(id)a4;
- (id)fr_opaqueImageWithFillColor:(id)a3;
- (id)fr_scaledImageWithMaximumSize:(CGSize)a3;
- (id)fr_scaledImageWithMaximumSize:(CGSize)a3 targetScale:(double)a4;
- (id)fr_tintedImageWithColor:(id)a3;
- (id)imageMaskWithColor:(id)a3;
- (id)imageMaskWithColor:(id)a3 size:(CGSize)a4;
@end

@implementation UIImage

- (id)imageMaskWithColor:(id)a3
{
  id v4 = a3;
  [(UIImage *)self size];
  uint64_t v6 = v5;
  [(UIImage *)self size];
  uint64_t v8 = v7;
  [(UIImage *)self size];
  double v10 = v9;
  double v12 = v11;
  [(UIImage *)self scale];
  double v14 = v13;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100028988;
  v18[3] = &unk_1000C6060;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = v6;
  uint64_t v23 = v8;
  v18[4] = self;
  id v19 = v4;
  id v15 = v4;
  v16 = +[FRMacros imageFromNewGraphicsContextWithSize:opaque:forceSRGB:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:forceSRGB:scale:contextBlock:", 0, 1, v18, v10, v12, v14);

  return v16;
}

- (id)imageMaskWithColor:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  [(UIImage *)self scale];
  double v9 = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100028B4C;
  v13[3] = &unk_1000C6088;
  double v15 = width;
  double v16 = height;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  double v19 = width;
  double v20 = height;
  v13[4] = self;
  id v14 = v7;
  id v10 = v7;
  double v11 = +[FRMacros imageFromNewGraphicsContextWithSize:opaque:forceSRGB:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:forceSRGB:scale:contextBlock:", 0, 1, v13, width, height, v9);

  return v11;
}

+ (id)imageFromFileURL:(id)a3
{
  CFURLRef v3 = (const __CFURL *)a3;
  CFURLRef v4 = v3;
  if (v3 && (uint64_t v5 = CGImageSourceCreateWithURL(v3, 0)) != 0)
  {
    uint64_t v6 = v5;
    CFStringRef v10 = kCGImageSourceShouldCacheImmediately;
    CFBooleanRef v11 = kCFBooleanTrue;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, 0, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1]);
    double v8 = +[UIImage imageWithCGImage:ImageAtIndex];
    CGImageRelease(ImageAtIndex);
    CFRelease(v6);
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (id)fr_opaqueImageWithFillColor:(id)a3
{
  id v4 = a3;
  [(UIImage *)self size];
  double v6 = v5;
  double v8 = v7;
  [(UIImage *)self scale];
  double v10 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100028E10;
  v14[3] = &unk_1000C56D0;
  v14[4] = self;
  id v15 = v4;
  id v11 = v4;
  double v12 = +[FRMacros imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:", 1, v14, v6, v8, v10);

  return v12;
}

- (id)fr_imageByApplyingAlpha:(double)a3
{
  [(UIImage *)self size];
  UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  [(UIImage *)self size];
  CGFloat v7 = v6;
  [(UIImage *)self size];
  double v9 = v8;
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextTranslateCTM(CurrentContext, 0.0, -v9);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeMultiply);
  CGContextSetAlpha(CurrentContext, a3);
  double v10 = [(UIImage *)self CGImage];
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.double width = v7;
  v15.size.double height = v9;
  CGContextDrawImage(CurrentContext, v15, v10);
  id v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v11;
}

- (id)fr_tintedImageWithColor:(id)a3
{
  id v4 = a3;
  [(UIImage *)self size];
  double v6 = v5;
  double v8 = v7;
  [(UIImage *)self scale];
  double v10 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100029078;
  v14[3] = &unk_1000C56D0;
  id v15 = v4;
  double v16 = self;
  id v11 = v4;
  double v12 = +[FRMacros imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:", 0, v14, v6, v8, v10);

  return v12;
}

- (id)fr_imageCroppedToCircleWithBackgroundColor:(id)a3
{
  id v4 = a3;
  [(UIImage *)self size];
  double v6 = v5;
  [(UIImage *)self size];
  if (v6 >= v7) {
    double v8 = v7;
  }
  else {
    double v8 = v6;
  }
  double v9 = [(UIImage *)self fr_imageCroppedToCornerRadius:v4 withBackgroundColor:v8 * 0.5];

  return v9;
}

- (id)fr_imageCroppedToCornerRadius:(double)a3 withBackgroundColor:(id)a4
{
  id v6 = a4;
  double v7 = +[UIColor clearColor];
  unsigned int v8 = [v6 isEqual:v7];

  if (v8)
  {

    id v6 = 0;
  }
  [(UIImage *)self size];
  double v10 = v9;
  [(UIImage *)self size];
  v15[1] = 3221225472;
  v15[0] = _NSConcreteStackBlock;
  v15[2] = sub_1000292C4;
  v15[3] = &unk_1000C6088;
  if (v10 >= v11) {
    double v10 = v11;
  }
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  double v20 = v10;
  double v21 = v10;
  id v16 = v6;
  uint64_t v17 = self;
  double v22 = a3;
  double v23 = v10;
  id v12 = v6;
  double v13 = +[FRMacros imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:", v6 != 0, v15, v10, v10, 0.0);

  return v13;
}

- (id)fr_imageAspectFitToSize:(CGSize)a3 targetScale:(double)a4 croppedToCornerRadius:(double)a5 withMargin:(double)a6 withBackgroundColor:(id)a7 borderColor:(id)a8
{
  double height = a3.height;
  double width = a3.width;
  id v15 = a7;
  id v16 = a8;
  uint64_t v17 = +[UIColor clearColor];
  unsigned int v18 = [v15 isEqual:v17];

  if (v18)
  {

    id v15 = 0;
  }
  uint64_t v19 = +[UIColor clearColor];
  unsigned int v20 = [v16 isEqual:v19];

  if (v20)
  {

    id v16 = 0;
  }
  [(UIImage *)self size];
  double v22 = v21;
  double v24 = v23;
  [(UIImage *)self scale];
  double v26 = v25;
  UIImageOrientation v27 = [(UIImage *)self imageOrientation];
  double v28 = width / v22;
  if (width / v22 >= height / v24) {
    double v28 = height / v24;
  }
  double v29 = a4 / v26 * v28;
  double v30 = v22 * v26 * v29;
  double v31 = v24 * v26 * v29;
  double v32 = -(a6 * a4);
  BOOL v33 = v30 <= v31;
  double v34 = v31 + v32 * 2.0;
  double v35 = v30 * (v34 / v31);
  double v36 = v30 + v32 * 2.0;
  double v37 = v31 * (v36 / v30);
  if (v33) {
    double v38 = v35;
  }
  else {
    double v38 = v36;
  }
  double v39 = width * a4;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = sub_100018A60;
  v68 = sub_1000189B8;
  id v69 = 0;
  v49 = _NSConcreteStackBlock;
  uint64_t v50 = 3221225472;
  v51 = sub_100029684;
  v52 = &unk_1000C60B0;
  double v40 = height * a4;
  double v57 = v39;
  double v58 = v40;
  if (v33) {
    double v41 = v34;
  }
  else {
    double v41 = v37;
  }
  double v59 = a5;
  double v60 = a4;
  id v42 = v15;
  double v61 = v38;
  double v62 = v41;
  id v53 = v42;
  v54 = self;
  id v43 = v16;
  id v55 = v43;
  v56 = &v64;
  UIImageOrientation v63 = v27;
  +[FRMacros useManagedContextWithSize:opaque:scale:contextBlock:](FRMacros, "useManagedContextWithSize:opaque:scale:contextBlock:", 0, &v49, v39, v40, 1.0);
  v44 = (void *)v65[5];
  if (!v44)
  {
    id v45 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v46 = objc_alloc((Class)NSString);
      [v46 initWithFormat:@"invalid nil value for '%s'", "scaledImage", v49, v50, v51, v52, v53, v54];
      sub_1000723E0();
    }

    v44 = (void *)v65[5];
  }
  id v47 = v44;

  _Block_object_dispose(&v64, 8);

  return v47;
}

- (id)fr_colorMonochromeImageWithColor:(id)a3
{
  id v4 = self;
  id v5 = a3;
  id v6 = +[CIImage imageWithCGImage:[(UIImage *)v4 CGImage]];
  id v7 = [objc_alloc((Class)CIColor) initWithColor:v5];

  unsigned int v8 = +[CIFilter filterWithName:@"CIColorMonochrome", @"inputImage", v6, @"inputColor", v7, @"inputIntensity", &off_1000CFB68, 0 keysAndValues];
  double v9 = [v8 outputImage];
  double v10 = +[CIContext contextWithOptions:0];
  [v9 extent];
  double v11 = [v10 createCGImage:v9];
  id v12 = +[UIImage imageWithCGImage:v11];
  CGImageRelease(v11);

  return v12;
}

- (id)fr_scaledImageWithMaximumSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIImage *)self scale];

  return -[UIImage fr_scaledImageWithMaximumSize:targetScale:](self, "fr_scaledImageWithMaximumSize:targetScale:", width, height, v6);
}

- (id)fr_scaledImageWithMaximumSize:(CGSize)a3 targetScale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  [(UIImage *)self size];
  double v9 = v8;
  double v11 = v10;
  [(UIImage *)self scale];
  double v13 = v12;
  UIImageOrientation v14 = [(UIImage *)self imageOrientation];
  if (v9 < width && v11 < height)
  {
    double v22 = self;
  }
  else
  {
    UIImageOrientation v16 = v14;
    double v17 = width / v9;
    if (width / v9 >= height / v11) {
      double v17 = height / v11;
    }
    double v18 = a4 / v13 * v17;
    uint64_t v19 = self;
    double v20 = v18 * (double)CGImageGetWidth([(UIImage *)v19 CGImage]);
    double v21 = v19;
    uint64_t v25 = 0;
    double v26 = &v25;
    uint64_t v27 = 0x3032000000;
    double v28 = sub_100018A60;
    double v29 = sub_1000189B8;
    id v30 = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100029C08;
    v24[3] = &unk_1000C60D8;
    *(double *)&v24[6] = v18 * (double)CGImageGetHeight([(UIImage *)v21 CGImage]);
    *(double *)&v24[7] = v9 * v13 * v18;
    v24[4] = v21;
    v24[5] = &v25;
    *(double *)&v24[8] = v11 * v13 * v18;
    *(double *)&v24[9] = a4;
    v24[10] = v16;
    +[FRMacros useManagedContextWithSize:opaque:forceSRGB:scale:contextBlock:](FRMacros, "useManagedContextWithSize:opaque:forceSRGB:scale:contextBlock:", 0, 0, v24, v20);
    double v22 = (UIImage *)(id)v26[5];
    _Block_object_dispose(&v25, 8);
  }

  return v22;
}

- (id)fr_croppedImageWithAspectRatio:(double)a3
{
  [(UIImage *)self scale];
  double v6 = v5;
  [(UIImage *)self size];
  double v8 = v6 * v7;
  [(UIImage *)self size];
  double v10 = v6 * v9;
  if (a3 <= 1.0)
  {
    double v11 = v10 * a3;
    double v12 = v10;
  }
  else
  {
    double v11 = v8;
    double v12 = v8 / a3;
  }
  CGFloat v13 = (v10 - v12) * 0.5;
  UIImageOrientation v14 = [(UIImage *)self CGImage];
  v19.origin.x = (v8 - v11) * 0.5;
  v19.origin.y = v13;
  v19.size.double width = v11;
  v19.size.double height = v12;
  id v15 = CGImageCreateWithImageInRect(v14, v19);
  UIImageOrientation v16 = +[UIImage imageWithCGImage:v15];
  CGImageRelease(v15);

  return v16;
}

- (id)fr_imageByScalingAndCroppingForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  double v7 = self;
  [(UIImage *)v7 size];
  double v10 = 0.0;
  if (v8 == width && v9 == height)
  {
    double v14 = width;
    double v15 = height;
    double v16 = 0.0;
  }
  else
  {
    double v12 = width / v8;
    BOOL v13 = width / v8 < height / v9;
    if (width / v8 <= height / v9) {
      double v12 = height / v9;
    }
    double v14 = v8 * v12;
    double v15 = v9 * v12;
    if (v13)
    {
      double v16 = (width - v14) * 0.5;
    }
    else
    {
      double v16 = 0.0;
      double v10 = fmin(-(v15 / 3.0 + height * -0.5), 0.0);
    }
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100029F1C;
  v20[3] = &unk_1000C6100;
  double v22 = v16;
  double v23 = v10;
  double v24 = v14;
  double v25 = v15;
  double v21 = v7;
  double v17 = v7;
  double v18 = +[FRMacros imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:", 0, v20, width, height, a4);

  return v18;
}

- (id)fr_imageByCroppingSubRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = self;
  [(UIImage *)v7 size];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.double width = width;
  v23.size.double height = height;
  if (CGRectIsEmpty(v23)) {
    goto LABEL_4;
  }
  v24.origin.CGFloat x = 0.0;
  v24.origin.CGFloat y = 0.0;
  v24.size.double width = v9;
  v24.size.double height = v11;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  if (!CGRectContainsRect(v24, v25))
  {
LABEL_4:
    double v14 = 0;
  }
  else
  {
    [(UIImage *)v7 scale];
    double v13 = v12;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002A080;
    v16[3] = &unk_1000C6100;
    double v17 = v7;
    CGFloat v18 = x;
    CGFloat v19 = y;
    double v20 = width;
    double v21 = height;
    double v14 = +[FRMacros imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:", 0, v16, width, height, v13);
  }

  return v14;
}

- (id)fr_bannerImageWithLogo:(id)a3
{
  id v4 = a3;
  [(UIImage *)self scale];
  double v6 = v5;
  [(UIImage *)self size];
  double v8 = v6 * v7;
  [(UIImage *)self size];
  uint64_t v30 = 0;
  double v31 = &v30;
  uint64_t v32 = 0x3032000000;
  BOOL v33 = sub_100018A60;
  double v34 = sub_1000189B8;
  id v35 = 0;
  double v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  CGFloat v19 = sub_10002A2F0;
  double v20 = &unk_1000C6128;
  double v10 = (double)(unint64_t)(v6 * 17.0 * 0.5 + v6 * v9);
  double v24 = v6 * 17.0 * 0.5;
  double v25 = v8;
  double v26 = v6 * v9;
  double v21 = self;
  unint64_t v27 = (unint64_t)v8;
  double v28 = v6 * 17.0;
  id v11 = v4;
  id v22 = v11;
  CGRect v23 = &v30;
  double v29 = v6;
  +[FRMacros useManagedContextWithSize:opaque:scale:contextBlock:](FRMacros, "useManagedContextWithSize:opaque:scale:contextBlock:", 0, &v17, (double)(unint64_t)v8, v10, 1.0);
  double v12 = (void *)v31[5];
  if (!v12)
  {
    id v13 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v14 = objc_alloc((Class)NSString);
      [v14 initWithFormat:@"invalid nil value for '%s'", "bannerImage", v17, v18, v19, v20, v21];
      sub_10007244C();
    }

    double v12 = (void *)v31[5];
  }
  id v15 = v12;

  _Block_object_dispose(&v30, 8);

  return v15;
}

+ (id)fr_immediatelyLoadedImageWithData:(id)a3 scale:(double)a4
{
  CFDataRef v5 = (const __CFData *)a3;
  CFDataRef v6 = v5;
  if (v5 && (double v7 = CGImageSourceCreateWithData(v5, 0)) != 0)
  {
    double v8 = v7;
    CFStringRef v12 = kCGImageSourceShouldCacheImmediately;
    CFBooleanRef v13 = kCFBooleanTrue;
    ImageAtIndeCGFloat x = CGImageSourceCreateImageAtIndex(v7, 0, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1]);
    if (a4 <= 1.0) {
      +[UIImage imageWithCGImage:ImageAtIndex];
    }
    else {
    double v10 = +[UIImage imageWithCGImage:ImageAtIndex scale:0 orientation:a4];
    }
    CGImageRelease(ImageAtIndex);
    CFRelease(v8);
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

+ (id)fr_immediatelyLoadedImageWithData:(id)a3
{
  return [a1 fr_immediatelyLoadedImageWithData:a3 scale:1.0];
}

+ (id)fr_imageWithColor:(id)a3 size:(CGSize)a4 cornerRadius:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002A678;
  v11[3] = &unk_1000C6150;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  id v12 = a3;
  double v15 = width;
  double v16 = height;
  double v17 = a5;
  id v8 = v12;
  double v9 = +[FRMacros imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:", 0, v11, width, height, 0.0);

  return v9;
}

- (id)fr_darkAndBlurredImageWithContext:(id)a3
{
  return [(UIImage *)self fr_darkAndBlurredImageWithContext:a3 withBlurRadius:5.0 vibrancyAmount:10.0];
}

- (id)fr_darkAndBlurredImageWithContext:(id)a3 withBlurRadius:(double)a4 vibrancyAmount:(double)a5
{
  return [(UIImage *)self fr_darkAndBlurredImageWithContext:a3 withBlurRadius:a4 vibrancyAmount:a5 alpha:0.7];
}

- (id)fr_darkAndBlurredImageWithContext:(id)a3 withBlurRadius:(double)a4 vibrancyAmount:(double)a5 alpha:(double)a6
{
  id v28 = a3;
  id v27 = [objc_alloc((Class)CIImage) initWithImage:self];
  double v10 = +[CIFilter filterWithName:@"CIGaussianBlur"];
  [v10 setValue:v27 forKey:kCIInputImageKey];
  id v11 = +[NSNumber numberWithDouble:a4];
  [v10 setValue:v11 forKey:@"inputRadius"];

  id v12 = +[CIFilter filterWithName:@"CIVibrance"];
  uint64_t v13 = [v10 outputImage];
  [v12 setValue:v13 forKey:kCIInputImageKey];

  uint64_t v14 = +[NSNumber numberWithDouble:a5];
  [v12 setValue:v14 forKey:@"inputAmount"];

  double v15 = +[CIFilter filterWithName:@"CIConstantColorGenerator"];
  double v26 = +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:a6];
  [v15 setValue:v26 forKey:@"inputColor"];
  double v16 = [v15 valueForKey:@"outputImage"];
  double v17 = +[CIFilter filterWithName:@"CIMultiplyBlendMode"];
  [v17 setValue:v16 forKey:@"inputImage"];
  uint64_t v18 = [v12 outputImage];
  [v17 setValue:v18 forKey:@"inputBackgroundImage"];

  CGFloat v19 = [v17 outputImage];
  [v27 extent];
  double v20 = [v28 createCGImage:v19];

  [(UIImage *)self scale];
  id v22 = +[UIImage imageWithCGImage:v20 scale:[(UIImage *)self imageOrientation] orientation:v21];
  CGImageRelease(v20);
  CGRect v23 = +[UIColor blackColor];
  double v24 = [v22 fr_opaqueImageWithFillColor:v23];

  return v24;
}

- (id)fr_applyDarkEffect
{
  CFURLRef v3 = +[UIColor colorWithRed:0.196078431 green:0.196078431 blue:0.196078431 alpha:0.45];
  LOBYTE(v6) = 0;
  -[UIImage applyBlurWithRadius:tintColor:saturationDeltaFactor:maskImage:targetSize:screenScale:opaque:logoRect:logoImage:logoText:cornerRadius:punchThroughBanner:allowAldenTint:](self, "applyBlurWithRadius:tintColor:saturationDeltaFactor:maskImage:targetSize:screenScale:opaque:logoRect:logoImage:logoText:cornerRadius:punchThroughBanner:allowAldenTint:", v3, 0, 0, 0, 0, 0, 44.0, 1.3, CGSizeZero.width, CGSizeZero.height, 0.0, *(void *)&CGRectZero.origin.x, *(void *)&CGRectZero.origin.y, *(void *)&CGRectZero.size.width, *(void *)&CGRectZero.size.height, 0,
  id v4 = v6);

  return v4;
}

- (CGRect)filledRectForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = CGRectGetWidth(a3);
  v29.origin.double x = x;
  v29.origin.double y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double v9 = v8 / CGRectGetHeight(v29);
  [(UIImage *)self size];
  double v11 = v10;
  [(UIImage *)self size];
  double v13 = v11 / v12;
  double v14 = v11 / v12 - v9;
  if (v14 < 0.0) {
    double v14 = -v14;
  }
  if (v14 > 0.00000011920929)
  {
    double v15 = x;
    double v16 = y;
    CGFloat v17 = width;
    CGFloat v18 = height;
    if (v9 <= v13)
    {
      double v22 = CGRectGetHeight(*(CGRect *)&v15);
      CGFloat v23 = v13 * v22;
      v32.origin.double x = x;
      v32.origin.double y = y;
      v32.size.CGFloat width = width;
      v32.size.CGFloat height = height;
      double v24 = CGRectGetWidth(v32);
      double y = 0.0;
      v33.origin.double x = 0.0;
      v33.origin.double y = 0.0;
      v33.size.CGFloat width = v23;
      v33.size.CGFloat height = v22;
      double x = (v24 - CGRectGetWidth(v33)) * 0.5;
      CGFloat height = v22;
      CGFloat width = v23;
    }
    else
    {
      double v19 = CGRectGetWidth(*(CGRect *)&v15);
      CGFloat v20 = v19 / v13;
      v30.origin.double x = x;
      v30.origin.double y = y;
      v30.size.CGFloat width = width;
      v30.size.CGFloat height = height;
      double v21 = CGRectGetHeight(v30);
      double x = 0.0;
      v31.origin.double x = 0.0;
      v31.origin.double y = 0.0;
      v31.size.CGFloat width = v19;
      v31.size.CGFloat height = v20;
      double y = (v21 - CGRectGetHeight(v31)) * 0.5;
      CGFloat height = v20;
      CGFloat width = v19;
    }
  }
  double v25 = x;
  double v26 = y;
  double v27 = width;
  double v28 = height;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (UIImage)imageWithCornerRadius:(double)a3
{
  +[FRMacros deviceScreenScaleFromPotentialBackgroundThread];
  double v6 = v5;
  [(UIImage *)self size];

  return -[UIImage imageWithCornerRadius:scale:targetSize:](self, "imageWithCornerRadius:scale:targetSize:", a3, v6, v7, v8);
}

- (UIImage)imageWithCornerRadius:(double)a3 scale:(double)a4 targetSize:(CGSize)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002AD64;
  v7[3] = &unk_1000C6178;
  CGSize v8 = a5;
  double v9 = a3;
  v7[4] = self;
  double v5 = +[FRMacros imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:", 0, v7, a5.width, a5.height, a4);

  return (UIImage *)v5;
}

- (id)applyBlurWithRadius:(double)a3 tintColor:(id)a4 saturationDeltaFactor:(double)a5 maskImage:(id)a6 targetSize:(CGSize)a7 screenScale:(double)a8 opaque:(BOOL)a9 logoRect:(CGRect)a10 logoImage:(id)a11 logoText:(id)a12 cornerRadius:(double)a13 punchThroughBanner:(BOOL)a14 allowAldenTint:(BOOL)a15
{
  double height = a7.height;
  double width = a7.width;
  id v24 = a4;
  id v65 = a6;
  id v63 = a11;
  id v64 = a12;
  if (width <= 0.0 || height <= 0.0)
  {
    [(UIImage *)self size];
    double width = v25;
    double height = v26;
  }
  if (fabs(a8) < 0.00999999978)
  {
    +[FRMacros deviceScreenScaleFromPotentialBackgroundThread];
    a8 = v27;
  }
  double v28 = [v24 colorWithAlphaComponent:1.0];
  CGRect v29 = +[UIColor whiteColor];
  unsigned int v30 = [v28 _isSimilarToColor:v29 withinPercentage:0.1];

  CGRect v31 = [v24 colorWithAlphaComponent:1.0];
  CGRect v32 = +[UIColor colorWithWhite:0.392156863 alpha:1.0];
  unsigned int v33 = [v31 _isSimilarToColor:v32 withinPercentage:0.1];

  char v34 = v30 | v33;
  if (((v30 | v33) & 1) == 0 && a15)
  {
    uint64_t v35 = [v24 colorWithAlphaComponent:0.5];

    id v24 = (id)v35;
  }
  if (width < 1.0 || height < 1.0)
  {
    id v47 = (void *)FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
      sub_1000724B8(v47, self);
    }
    goto LABEL_36;
  }
  double v36 = self;
  if (![(UIImage *)v36 CGImage])
  {
    v48 = FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
      sub_100072584((uint64_t)v36, v48);
    }
    goto LABEL_36;
  }
  if (v65)
  {
    id v37 = v65;
    if (![v37 CGImage])
    {
      double v57 = FCDefaultLog;
      if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
        sub_1000726D4((uint64_t)v37, v57);
      }
LABEL_36:
      id v56 = 0;
      goto LABEL_37;
    }
  }
  -[UIImage filledRectForRect:](v36, "filledRectForRect:", CGPointZero.x, CGPointZero.y, width, height);
  uint64_t v60 = v39;
  uint64_t v61 = v38;
  uint64_t v41 = v40;
  uint64_t v59 = v42;
  id v43 = v36;
  v44 = v43;
  double v45 = fabs(a5 + -1.0);
  if (a3 > 0.00000011920929 || v45 > 0.00000011920929)
  {
    uint64_t v104 = 0;
    v105 = &v104;
    uint64_t v106 = 0x3032000000;
    v107 = sub_100018A60;
    v108 = sub_1000189B8;
    id v109 = 0;
    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472;
    v101[2] = sub_10002B664;
    v101[3] = &unk_1000C61C8;
    *(double *)&v101[6] = width;
    *(double *)&v101[7] = height;
    v101[8] = v61;
    v101[9] = v60;
    v101[10] = v41;
    v101[11] = v59;
    BOOL v102 = a3 > 0.00000011920929;
    *(double *)&v101[12] = a8;
    *(double *)&v101[13] = a3;
    BOOL v103 = v45 > 0.00000011920929;
    *(double *)&v101[14] = a5;
    v101[4] = v43;
    v101[5] = &v104;
    +[FRMacros useManagedContextWithSize:opaque:forceSRGB:scale:contextBlock:](FRMacros, "useManagedContextWithSize:opaque:forceSRGB:scale:contextBlock:", 0, 1, v101, width, height, a8);
    v49 = (void *)v105[5];
    if (!v49)
    {
      id v50 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'", "resultImage"];
        sub_100072668();
      }

      v49 = (void *)v105[5];
    }
    id v46 = v49;

    _Block_object_dispose(&v104, 8);
  }
  else
  {
    id v46 = v43;
  }
  id v51 = [(UIImage *)v44 imageOrientation];
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x3032000000;
  v107 = sub_100018A60;
  v108 = sub_1000189B8;
  id v109 = 0;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_10002BA34;
  v80[3] = &unk_1000C61F0;
  id v81 = v24;
  CGRect v88 = a10;
  double v89 = width;
  double v90 = height;
  uint64_t v91 = v61;
  uint64_t v92 = v60;
  uint64_t v93 = v41;
  uint64_t v94 = v59;
  id v82 = v64;
  v83 = v44;
  BOOL v97 = a3 > 0.00000011920929;
  id v84 = v65;
  v52 = v46;
  v85 = v52;
  BOOL v98 = a14;
  char v99 = v34 ^ 1;
  BOOL v100 = a15;
  id v86 = v63;
  v87 = &v104;
  double v95 = a8;
  id v96 = v51;
  +[FRMacros useManagedContextWithSize:opaque:forceSRGB:scale:contextBlock:](FRMacros, "useManagedContextWithSize:opaque:forceSRGB:scale:contextBlock:", 0, 1, v80, width, height, a8);
  if (!v105[5])
  {
    id v53 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'", "outputImage"];
      sub_1000725FC();
    }
  }
  if (a13 <= 0.00000011920929)
  {
    id v56 = (id)v105[5];
  }
  else
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 1.0 / (a8 + a8), 1.0 / (a8 + a8), width - 1.0 / a8, height - 1.0 / a8, a13);
    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x3032000000;
    v77 = sub_100018A60;
    v78 = sub_1000189B8;
    id v79 = 0;
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_10002BFC8;
    v66[3] = &unk_1000C6240;
    v70 = DeviceRGB;
    double v71 = a8;
    id v55 = (id)objc_claimAutoreleasedReturnValue();
    id v67 = v55;
    v68 = &v104;
    double v72 = width;
    double v73 = height;
    id v69 = &v74;
    +[FRMacros useManagedContextWithSize:opaque:scale:contextBlock:](FRMacros, "useManagedContextWithSize:opaque:scale:contextBlock:", 0, v66, width, height, a8);
    CGColorSpaceRelease(DeviceRGB);
    id v56 = (id)v75[5];

    _Block_object_dispose(&v74, 8);
  }

  _Block_object_dispose(&v104, 8);
LABEL_37:

  return v56;
}

- (CGSize)fr_sizeThatFills:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIImage *)self size];
  double v7 = v5 * (height / v6);
  if (v7 < width)
  {
    double height = v6 * (width / v5);
    double v7 = width;
  }
  double v8 = v7;
  double v9 = height;
  result.double height = v9;
  result.double width = v8;
  return result;
}

+ (id)fr_gradientImageForTextSize:(CGSize)a3 withStartColor:(id)a4 endColor:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v8 = a5;
  id v9 = a4;
  v24.double width = width;
  v24.double height = height;
  UIGraphicsBeginImageContext(v24);
  CurrentContext = UIGraphicsGetCurrentContext();
  UIGraphicsPushContext(CurrentContext);
  id v11 = v9;
  id v12 = [v11 CGColor];

  id v13 = v8;
  id v14 = [v13 CGColor];

  double v15 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v12, v14, 0, 0, 0x3FF0000000000000);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGFloat v17 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)v15, locations);
  v25.double x = 0.0;
  v25.double y = 0.0;
  v27.double x = width;
  v27.double y = height;
  CGContextDrawLinearGradient(CurrentContext, v17, v25, v27, 0);
  float v18 = width + height * 0.5;
  CGFloat v19 = ceilf(v18);
  v26.double x = 0.0;
  v26.double y = 0.0;
  v28.double x = width;
  v28.double y = height;
  CGContextDrawRadialGradient(CurrentContext, v17, v26, 0.0, v28, v19, 0);
  CGGradientRelease(v17);
  CGColorSpaceRelease(DeviceRGB);
  UIGraphicsPopContext();
  CGFloat v20 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v20;
}

+ (int64_t)fr_estimatedImageTypeWithData:(id)a3
{
  id v3 = a3;
  if (![v3 length]) {
    goto LABEL_6;
  }
  unsigned __int8 v6 = 0;
  int64_t v4 = 1;
  [v3 getBytes:&v6 length:1];
  if (v6 < 0x4Eu) {
    goto LABEL_6;
  }
  if (v6 != 255)
  {
    if (v6 == 137)
    {
      int64_t v4 = 2;
      goto LABEL_7;
    }
LABEL_6:
    int64_t v4 = 0;
  }
LABEL_7:

  return v4;
}

@end