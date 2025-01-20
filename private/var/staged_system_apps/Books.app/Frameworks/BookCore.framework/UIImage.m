@interface UIImage
+ (UIImage)imageWithColor:(id)a3;
+ (UIImage)imageWithSolidColor:(id)a3 atSize:(CGSize)a4;
+ (id)im_imageWithCGImage:(CGImage *)a3;
+ (id)im_imageWithCGImages:(id)a3 size:(CGSize)a4;
+ (id)im_imageWithCenteredIconImage:(id)a3 iconColor:(id)a4 size:(CGSize)a5;
+ (id)invisibleImage;
- (BOOL)im_isLikelyBlank;
- (CGImage)im_CGImage;
- (UIImage)imageWithTint:(id)a3;
- (id)bc_imageWithConfiguration:(id)a3 limitedToContentSizeCategory:(id)a4;
- (id)im_CGImages;
- (id)im_imageWithAlpha:(double)a3;
- (id)im_imageWithPixelSize:(CGSize)a3;
- (id)im_imageWithSize:(CGSize)a3;
- (id)im_imageWithSize:(CGSize)a3 options:(int)a4;
- (id)imageMaskWithColor:(id)a3;
- (id)imageMaskWithColor:(id)a3 forTraitCollection:(id)a4;
- (unint64_t)colorAtPixelX:(unint64_t)a3 y:(unint64_t)a4;
- (unint64_t)im_averageColor;
- (void)dumpAsPNGToCachesNamed:(id)a3;
@end

@implementation UIImage

+ (id)im_imageWithCGImage:(CGImage *)a3
{
  id v3 = [objc_alloc((Class)UIImage) initWithCGImage:a3];

  return v3;
}

- (CGImage)im_CGImage
{
  v2 = self;

  return [(UIImage *)v2 CGImage];
}

- (id)im_imageWithSize:(CGSize)a3
{
  return -[UIImage im_imageWithSize:options:](self, "im_imageWithSize:options:", 1, a3.width, a3.height);
}

- (id)im_imageWithSize:(CGSize)a3 options:(int)a4
{
  double height = a3.height;
  double width = a3.width;
  [(UIImage *)self size];
  if (width == v9 && height == v8) {
    goto LABEL_20;
  }
  if (a4)
  {
    [(UIImage *)self size];
    double v12 = width / v11;
    [(UIImage *)self size];
    double v14 = height / v13;
    if (a4 == 1)
    {
      if (v12 >= v14) {
        double v15 = height / v13;
      }
      else {
        double v15 = v12;
      }
    }
    else
    {
      double v15 = 1.0;
      if (a4 == 2)
      {
        if (v12 >= v14) {
          double v15 = v12;
        }
        else {
          double v15 = v14;
        }
      }
    }
    [(UIImage *)self size];
    double width = v15 * v16;
    [(UIImage *)self size];
    double height = v15 * v17;
  }
  v26.origin.x = 0.0;
  v26.origin.y = 0.0;
  v26.size.double width = width;
  v26.size.double height = height;
  CGRect v27 = CGRectIntegral(v26);
  double v18 = v27.size.width;
  double v19 = v27.size.height;
  [(UIImage *)self size];
  if (v18 == v21 && v19 == v20)
  {
LABEL_20:
    v23 = self;
  }
  else
  {
    -[UIImage im_imageWithPixelSize:](self, "im_imageWithPixelSize:", v18, v19);
    v23 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (id)im_imageWithPixelSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6 = [(UIImage *)self im_CGImage];
  if (v6)
  {
    v7 = v6;
    v17.CGFloat width = width;
    v17.CGFloat height = height;
    UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(CurrentContext, 0.0, height);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    if (CurrentContext)
    {
      CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
      v19.origin.x = CGPointZero.x;
      v19.origin.y = CGPointZero.y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      CGContextDrawImage(CurrentContext, v19, v7);
    }
    else
    {
      v18.CGFloat width = width;
      v18.CGFloat height = height;
      v10 = NSStringFromCGSize(v18);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        double v15 = v10;
        _os_log_impl(&def_7D91C, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "-[IMImage im_imageWithPixelSize:] could not create bitmap context with size %@", (uint8_t *)&v14, 0xCu);
      }
    }
    Image = CGBitmapContextCreateImage(CurrentContext);
    [(UIImage *)self scale];
    double v9 = +[UIImage imageWithCGImage:Image scale:[(UIImage *)self imageOrientation] orientation:v12];
    UIGraphicsEndImageContext();
    CGImageRelease(Image);
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (id)im_CGImages
{
  v2 = [(UIImage *)self CGImage];
  if (v2)
  {
    v2 = +[NSArray arrayWithObject:v2];
  }

  return v2;
}

+ (id)im_imageWithCGImages:(id)a3 size:(CGSize)a4
{
  id v4 = a3;
  if ((unint64_t)[v4 count] >= 2) {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/BCImageCompatibility.m", 125, (uint64_t)"+[UIImage(IMCompatibility) im_imageWithCGImages:size:]", (uint64_t)"imageRefs.count <= 1", @"Multiple imageRefs not supported on iOS.", v5, v6, v7, v10);
  }
  id v8 = [v4 lastObject];
  if (v8) {
    id v8 = [objc_alloc((Class)UIImage) initWithCGImage:v8];
  }

  return v8;
}

- (UIImage)imageWithTint:(id)a3
{
  id v4 = a3;
  [(UIImage *)self size];
  uint64_t v6 = v5;
  [(UIImage *)self size];
  uint64_t v8 = v7;
  double v9 = +[UIGraphicsImageRendererFormat preferredFormat];
  id v10 = [v9 copy];

  [(UIImage *)self scale];
  [v10 setScale:];
  id v11 = objc_alloc((Class)UIGraphicsImageRenderer);
  [(UIImage *)self size];
  id v12 = [v11 initWithSize:v10];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_BAF70;
  v16[3] = &unk_2C84D0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = v6;
  uint64_t v22 = v8;
  id v17 = v4;
  CGSize v18 = self;
  id v13 = v4;
  int v14 = [v12 imageWithActions:v16];

  return (UIImage *)v14;
}

- (id)imageMaskWithColor:(id)a3 forTraitCollection:(id)a4
{
  uint64_t v5 = [a3 resolvedColorWithTraitCollection:a4];
  uint64_t v6 = [(UIImage *)self imageMaskWithColor:v5];

  return v6;
}

- (id)imageMaskWithColor:(id)a3
{
  id v4 = a3;
  [(UIImage *)self size];
  CGFloat v6 = v5;
  [(UIImage *)self size];
  CGFloat v8 = v7;
  [(UIImage *)self size];
  UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  [(UIImage *)self size];
  CGContextTranslateCTM(CurrentContext, 0.0, -v10);
  CGContextSaveGState(CurrentContext);
  id v11 = [(UIImage *)self CGImage];
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.CGFloat width = v6;
  v18.size.CGFloat height = v8;
  CGContextClipToMask(CurrentContext, v18, v11);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeMultiply);
  id v12 = v4;
  id v13 = (CGColor *)[v12 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v13);
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.CGFloat width = v6;
  v19.size.CGFloat height = v8;
  CGContextFillRect(CurrentContext, v19);
  CGContextRestoreGState(CurrentContext);
  int v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v14;
}

+ (UIImage)imageWithSolidColor:(id)a3 atSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v6 = a3;
  v13.CGFloat width = width;
  v13.CGFloat height = height;
  UIGraphicsBeginImageContext(v13);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v8 = v6;
  double v9 = (CGColor *)[v8 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v9);
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGContextFillRect(CurrentContext, v14);
  double v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return (UIImage *)v10;
}

+ (id)im_imageWithCenteredIconImage:(id)a3 iconColor:(id)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v8 = a3;
  id v9 = a4;
  double v10 = v9;
  id v11 = 0;
  if (v8 && v9)
  {
    id v12 = +[UIGraphicsImageRendererFormat preferredFormat];
    id v13 = [v12 copy];

    [v8 scale];
    [v13 setScale:];
    CGRectMakeWithSize();
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    [v8 size];
    CGRectMakeWithSize();
    CGRectCenterRectInRect();
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    uint64_t v30 = v27;
    uint64_t v31 = v26;
    id v28 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v13 format:width, height];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_BB3EC;
    v32[3] = &unk_2C84F8;
    uint64_t v35 = v15;
    uint64_t v36 = v17;
    uint64_t v37 = v19;
    uint64_t v38 = v21;
    uint64_t v39 = v23;
    uint64_t v40 = v25;
    uint64_t v41 = v31;
    uint64_t v42 = v30;
    id v33 = v8;
    id v34 = v10;
    id v11 = [v28 imageWithActions:v32];
  }

  return v11;
}

- (id)im_imageWithAlpha:(double)a3
{
  double v5 = +[UIGraphicsImageRendererFormat preferredFormat];
  id v6 = [v5 copy];

  [(UIImage *)self scale];
  [v6 setScale:];
  [(UIImage *)self size];
  double v8 = v7;
  double v10 = v9;
  id v11 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v6 format:v7];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_BB5BC;
  v14[3] = &unk_2C8520;
  v14[5] = 0;
  v14[6] = 0;
  v14[4] = self;
  *(double *)&v14[7] = v8;
  *(double *)&v14[8] = v10;
  *(double *)&v14[9] = a3;
  id v12 = [v11 imageWithActions:v14];

  return v12;
}

- (unint64_t)colorAtPixelX:(unint64_t)a3 y:(unint64_t)a4
{
  [(UIImage *)self scale];
  double v8 = v7;
  double v9 = [(UIImage *)self CGImage];
  v16.origin.x = v8 * (double)a3;
  v16.origin.y = v8 * (double)a4;
  v16.size.double width = 1.0;
  v16.size.double height = 1.0;
  CGImageRef v10 = CGImageCreateWithImageInRect(v9, v16);
  if (!v10) {
    return -1;
  }
  id v11 = v10;
  unsigned int data = 0;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  id v13 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 4uLL, DeviceRGB, 0x4002u);
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.double width = 1.0;
  v17.size.double height = 1.0;
  CGContextDrawImage(v13, v17, v11);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v13);
  CGImageRelease(v11);
  return bswap32(data);
}

- (void)dumpAsPNGToCachesNamed:(id)a3
{
  id v10 = a3;
  id v4 = [v10 lowercaseString];
  unsigned __int8 v5 = [v4 hasSuffix:@"png"];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [v10 stringByAppendingPathExtension:@"png"];

    id v10 = (id)v6;
  }
  double v7 = +[UIApplication applicationCacheDirectory];
  double v8 = [v7 stringByAppendingPathComponent:v10];

  double v9 = UIImagePNGRepresentation(self);
  [v9 writeToFile:v8 atomically:0];
}

+ (UIImage)imageWithColor:(id)a3
{
  id v3 = a3;
  v10.double width = 1.0;
  v10.double height = 1.0;
  UIGraphicsBeginImageContext(v10);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v5 = v3;
  uint64_t v6 = (CGColor *)[v5 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v6);
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.double width = 1.0;
  v11.size.double height = 1.0;
  CGContextFillRect(CurrentContext, v11);
  double v7 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return (UIImage *)v7;
}

+ (id)invisibleImage
{
  if (qword_345C30 != -1) {
    dispatch_once(&qword_345C30, &stru_2C8540);
  }
  v2 = (void *)qword_345C28;

  return v2;
}

- (unint64_t)im_averageColor
{
  v7.double width = 1.0;
  v7.double height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v7, 1, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationMedium);
  -[UIImage drawInRect:](self, "drawInRect:", 0.0, 0.0, 1.0, 1.0);
  id v4 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  id v5 = [v4 colorAtPixelX:0 y:0];

  return (unint64_t)v5;
}

- (BOOL)im_isLikelyBlank
{
  v2 = [(UIImage *)self CGImage];
  id v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x9C40uLL, 0xBEECF5AAuLL);
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  uint64_t v6 = CGBitmapContextCreate(v4, 0x64uLL, 0x64uLL, 8uLL, 0x190uLL, DeviceRGB, 5u);
  CGColorSpaceRelease(DeviceRGB);
  if (!v6)
  {
    BOOL v9 = 0;
    goto LABEL_34;
  }
  BOOL v7 = 1;
  CGContextSetInterpolationQuality(v6, kCGInterpolationNone);
  v19.size.double width = 100.0;
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.double height = 100.0;
  CGContextDrawImage(v6, v19, v2);
  unint64_t v8 = 0;
  BOOL v9 = 1;
  while (!v7)
  {
    if (!v9 || v8 >> 6 >= 0x271) {
      goto LABEL_33;
    }
    BOOL v7 = 0;
    unsigned int v10 = v4[v8];
    unsigned int v11 = v4[v8 + 1];
    unsigned int v12 = v4[v8 + 2];
LABEL_17:
    BOOL v17 = v10 < 2 && v11 < 2 && v12 < 2;
    BOOL v9 = v9 && v17;
    v8 += 4;
  }
  if (v8 >> 6 < 0x271)
  {
    unsigned int v10 = v4[v8];
    unsigned int v11 = v4[v8 + 1];
    unsigned int v12 = v4[v8 + 2];
    BOOL v7 = v10 > 0xFD && v11 > 0xFD && v12 > 0xFD;
    goto LABEL_17;
  }
  BOOL v9 = 1;
LABEL_33:
  CGContextRelease(v6);
LABEL_34:
  free(v4);
  return v9;
}

- (id)bc_imageWithConfiguration:(id)a3 limitedToContentSizeCategory:(id)a4
{
  id v6 = a3;
  BOOL v7 = (NSString *)a4;
  unint64_t v8 = +[UITraitCollection currentTraitCollection];
  BOOL v9 = [v8 preferredContentSizeCategory];
  NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v9, v7);

  if (v10 == NSOrderedDescending)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_BBC18;
    v14[3] = &unk_2C8568;
    uint64_t v15 = v7;
    unsigned int v11 = [v8 traitCollectionByModifyingTraits:v14];
    +[UITraitCollection setCurrentTraitCollection:v11];
  }
  unsigned int v12 = [(UIImage *)self imageWithConfiguration:v6];
  +[UITraitCollection setCurrentTraitCollection:v8];

  return v12;
}

@end