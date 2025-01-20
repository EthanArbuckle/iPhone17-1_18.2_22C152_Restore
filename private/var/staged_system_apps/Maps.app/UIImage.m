@interface UIImage
+ (CGRect)maps_collectionGlyphFractionalRectWithRTL:(BOOL)a3;
+ (double)_maps_minSideLengthForShieldSize:(int64_t)a3;
+ (id)_compositeImageFromImage:(id)a3 paddedToWidth:(double)a4 badge:(id)a5 badgeOffset:(CGPoint)a6;
+ (id)_imageProcessingQueue;
+ (id)_mapsCar_privateSystemImageNamed:(id)a3 textStyle:(id)a4 scale:(int64_t)a5;
+ (id)_mapsCar_systemImageNamed:(id)a3;
+ (id)_mapsCar_systemImageNamed:(id)a3 pointSize:(double)a4;
+ (id)_mapsCar_systemImageNamed:(id)a3 pointSize:(double)a4 weight:(int64_t)a5;
+ (id)_mapsCar_systemImageNamed:(id)a3 textStyle:(id)a4;
+ (id)_mapsCar_systemImageNamed:(id)a3 textStyle:(id)a4 weight:(int64_t)a5;
+ (id)_maps_applicationIconWithBundleIdentifier:(id)a3;
+ (id)_maps_circleImageWithDiameter:(double)a3 color:(id)a4;
+ (id)_maps_imageWithColor:(id)a3;
+ (id)_maps_maneuverImageForTransitArrivalInfo:(id)a3 shieldSize:(int64_t)a4 forDarkBackground:(BOOL)a5;
+ (id)_maps_radar_symbolCircleFilled;
+ (id)_maps_radar_symbolCircleUnfilled;
+ (id)_maps_radar_symbolFilled;
+ (id)_maps_radar_symbolUnfilled;
+ (id)chargeImageOfSize:(double)a3 batteryLevel:(unint64_t)a4;
+ (id)imageNamed:(id)a3 ofSize:(double)a4 color:(id)a5;
+ (id)interSystemTransferFromHexColor:(id)a3 toHexColor:(id)a4 imageWithSize:(int64_t)a5 scale:(double)a6 darkMode:(BOOL)a7;
+ (id)maps_emptyImageScale:(double)a3;
+ (id)warningImageOfSize:(double)a3;
- (CGContext)_contextWithDiameter:(double)a3;
- (CGImage)_cgImageFromContext:(CGContext *)a3 toFit:(CGSize)a4;
- (id)_finaliseCircleImage:(id)a3 withContext:(CGContext *)a4;
- (id)_maps_blurredImage:(id)a3 scale:(double)a4;
- (id)_maps_colorMonochromeImageWithColor:(id)a3;
- (id)_maps_colorizedImageWithColor:(id)a3;
- (id)_maps_composedImageScale:(double)a3 isRTL:(BOOL)a4;
- (id)_maps_horizontallyFlippedImage;
- (id)_maps_imageIconWithBackgroundConfiguration:(id)a3;
- (id)_maps_imageInOrientation:(int64_t)a3;
- (id)_maps_imageWithAspectFitScalingForMaximumDimension:(double)a3;
- (id)_maps_imageWithAspectFitScalingForMaximumSize:(CGSize)a3;
- (id)_maps_invertedImage;
- (id)_maps_mostCommonColor;
- (id)_maps_scaleToFill:(id)a3 size:(double)a4 scale:(double)a5;
- (id)_maps_scaleToFillRoundedImage:(id)a3 size:(double)a4 scale:(double)a5;
- (id)drawnInCircleWithDiameter:(double)a3 backgroundColor:(id)a4;
- (id)imageScaledToSize:(CGSize)a3;
- (void)_enumeratePixelsWithBlock:(id)a3;
- (void)maps_blurredImageScale:(double)a3 isRTL:(BOOL)a4 completion:(id)a5;
@end

@implementation UIImage

- (id)_maps_invertedImage
{
  v3 = +[UIColor systemBlueColor];
  v4 = [(UIImage *)self imageWithTintColor:v3];
  [v4 size];
  double v6 = v5;
  [v4 size];
  double v8 = v7;
  [v4 size];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 scale];
  CGFloat v14 = v13;
  v18.width = v10;
  v18.height = v12;
  UIGraphicsBeginImageContextWithOptions(v18, 0, v14);
  [v4 drawInRect:CGRectMake(0.0, 0.0, v6, v8)];
  v15 = UIGraphicsGetImageFromCurrentImageContext();

  UIGraphicsEndImageContext();

  return v15;
}

+ (id)maps_emptyImageScale:(double)a3
{
  v8.width = 72.0;
  v8.height = 72.0;
  UIGraphicsBeginImageContextWithOptions(v8, 1, a3);
  CurrentContext = UIGraphicsGetCurrentContext();
  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = 72.0;
  v9.size.height = 72.0;
  CGContextStrokeRect(CurrentContext, v9);
  double v5 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v5;
}

+ (id)_maps_imageWithColor:(id)a3
{
  id v3 = a3;
  v10.width = 1.0;
  v10.height = 1.0;
  UIGraphicsBeginImageContext(v10);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v5 = v3;
  double v6 = (CGColor *)[v5 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v6);
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 1.0;
  v11.size.height = 1.0;
  CGContextFillRect(CurrentContext, v11);
  double v7 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v7;
}

+ (id)_maps_circleImageWithDiameter:(double)a3 color:(id)a4
{
  id v5 = a4;
  v12.width = a3;
  v12.height = a3;
  UIGraphicsBeginImageContext(v12);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v7 = v5;
  CGSize v8 = (CGColor *)[v7 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v8);
  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.width = a3;
  v13.size.height = a3;
  CGContextFillEllipseInRect(CurrentContext, v13);
  CGRect v9 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v9;
}

- (id)_maps_imageIconWithBackgroundConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)UIView);
  [v4 iconSize];
  double v7 = v6;
  [v4 iconSize];
  id v9 = [v5 initWithFrame:0.0, 0.0, v7, v8];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  CGSize v10 = [v4 backgroundColor];
  [v9 setBackgroundColor:v10];

  [v4 cornerRadius];
  double v12 = v11;
  CGRect v13 = [v9 layer];
  [v13 setCornerRadius:v12];

  id v14 = [objc_alloc((Class)UIImageView) initWithImage:self];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v14 frame];
  [v14 alignmentRectForFrame:];
  CGFloat x = v39.origin.x;
  CGFloat y = v39.origin.y;
  CGFloat width = v39.size.width;
  CGFloat height = v39.size.height;
  double MidX = CGRectGetMidX(v39);
  [v14 frame];
  double v20 = MidX - CGRectGetMidX(v40);
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v41);
  [v14 frame];
  double v22 = MidY - CGRectGetMidY(v42);
  [v9 center];
  double v24 = v23 - v20;
  [v9 center];
  [v14 setCenter:v24, v25 - v22];
  v26 = [v4 tintColor];

  [v14 setTintColor:v26];
  [v9 addSubview:v14];
  [v9 frame];
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  v31 = +[UIScreen mainScreen];
  [v31 scale];
  CGFloat v33 = v32;
  v38.CGFloat width = v28;
  v38.CGFloat height = v30;
  UIGraphicsBeginImageContextWithOptions(v38, 0, v33);

  v34 = [v9 layer];
  [v34 renderInContext:UIGraphicsGetCurrentContext()];

  v35 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v35;
}

- (id)_maps_colorizedImageWithColor:(id)a3
{
  id v4 = a3;
  [(UIImage *)self size];
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat y = CGPointZero.y;
  [(UIImage *)self scale];
  CGFloat v12 = v11;
  v19.CGFloat width = v7;
  v19.CGFloat height = v9;
  UIGraphicsBeginImageContextWithOptions(v19, 0, v12);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextTranslateCTM(CurrentContext, 0.0, -v9);
  id v14 = v4;
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v14 CGColor]);
  v20.origin.CGFloat x = CGPointZero.x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = v7;
  v20.size.CGFloat height = v9;
  CGContextFillRect(CurrentContext, v20);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationAtop);
  v15 = [(UIImage *)self CGImage];
  v21.origin.CGFloat x = CGPointZero.x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = v7;
  v21.size.CGFloat height = v9;
  CGContextDrawImage(CurrentContext, v21, v15);
  v16 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v16;
}

- (id)_maps_horizontallyFlippedImage
{
  [(UIImage *)self size];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  [(UIImage *)self scale];
  CGFloat v8 = v7;
  v15.CGFloat width = v4;
  v15.CGFloat height = v6;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v8);
  CurrentContext = UIGraphicsGetCurrentContext();
  [(UIImage *)self size];
  v13.a = -1.0;
  v13.b = 0.0;
  v13.c = 0.0;
  v13.d = 1.0;
  v13.tCGFloat x = v10;
  v13.tCGFloat y = 0.0;
  CGContextConcatCTM(CurrentContext, &v13);
  -[UIImage drawAtPoint:](self, "drawAtPoint:", CGPointZero.x, CGPointZero.y);
  double v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v11;
}

- (id)_maps_imageInOrientation:(int64_t)a3
{
  [(UIImage *)self size];
  double v6 = v5;
  CGFloat v8 = v7;
  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v22.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v22.c = v9;
  *(_OWORD *)&v22.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  switch(a3)
  {
    case 0:
      CGFloat v10 = self;
      goto LABEL_17;
    case 1:
      CGAffineTransformMakeTranslation(&v22, v5, v8);
      CGAffineTransform v20 = v22;
      CGAffineTransformRotate(&transform, &v20, 3.14159265);
      goto LABEL_9;
    case 2:
      CGAffineTransformMakeTranslation(&v22, 0.0, v5);
      *(_OWORD *)&v20.a = *(_OWORD *)&v22.a;
      *(_OWORD *)&v20.c = *(_OWORD *)&v22.c;
      long long v11 = *(_OWORD *)&v22.tx;
      goto LABEL_12;
    case 3:
      CGAffineTransformMakeTranslation(&v22, v8, 0.0);
      goto LABEL_14;
    case 4:
      CGAffineTransformMakeTranslation(&v22, v5, 0.0);
      CGAffineTransform v20 = v22;
      CGFloat v12 = -1.0;
      CGFloat v13 = 1.0;
      goto LABEL_8;
    case 5:
      CGAffineTransformMakeTranslation(&v22, 0.0, v8);
      CGAffineTransform v20 = v22;
      CGFloat v12 = 1.0;
      CGFloat v13 = -1.0;
LABEL_8:
      CGAffineTransformScale(&transform, &v20, v12, v13);
LABEL_9:
      CGAffineTransform v22 = transform;
      goto LABEL_10;
    case 6:
      CGAffineTransformMakeTranslation(&v22, v8, v5);
      CGAffineTransform v20 = v22;
      CGAffineTransformScale(&transform, &v20, -1.0, 1.0);
      long long v11 = *(_OWORD *)&transform.tx;
      CGAffineTransform v22 = transform;
      *(_OWORD *)&v20.a = *(_OWORD *)&transform.a;
      *(_OWORD *)&v20.c = *(_OWORD *)&transform.c;
LABEL_12:
      *(_OWORD *)&v20.tCGFloat x = v11;
      CGFloat v15 = 4.71238898;
      goto LABEL_15;
    case 7:
      CGAffineTransformMakeScale(&v22, -1.0, 1.0);
LABEL_14:
      CGAffineTransform v20 = v22;
      CGFloat v15 = 1.57079633;
LABEL_15:
      CGAffineTransformRotate(&transform, &v20, v15);
      CGAffineTransform v22 = transform;
      CGFloat v14 = v8;
      CGFloat v8 = v6;
      break;
    default:
LABEL_10:
      CGFloat v14 = v6;
      break;
  }
  [(UIImage *)self scale];
  CGFloat v17 = v16;
  v24.CGFloat width = v14;
  v24.CGFloat height = v8;
  UIGraphicsBeginImageContextWithOptions(v24, 0, v17);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGAffineTransform transform = v22;
  CGContextConcatCTM(CurrentContext, &transform);
  -[UIImage drawAtPoint:](self, "drawAtPoint:", CGPointZero.x, CGPointZero.y);
  UIGraphicsGetImageFromCurrentImageContext();
  CGFloat v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
LABEL_17:

  return v10;
}

- (id)_maps_colorMonochromeImageWithColor:(id)a3
{
  id v4 = a3;
  CGFloat v5 = self;
  uint64_t v6 = +[CIImage imageWithCGImage:[(UIImage *)v5 CGImage]];
  double v7 = (void *)v6;
  if (v6)
  {
    v18[0] = v6;
    v17[0] = kCIInputImageKey;
    v17[1] = kCIInputColorKey;
    id v8 = [objc_alloc((Class)CIColor) initWithColor:v4];
    v17[2] = kCIInputIntensityKey;
    v18[1] = v8;
    v18[2] = &off_1013AF088;
    long long v9 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
    CGFloat v10 = +[CIFilter filterWithName:@"CIColorMonochrome" withInputParameters:v9];

    long long v11 = [v10 outputImage];
    if (v11)
    {
      CGFloat v12 = +[CIContext contextWithOptions:0];
      [v11 extent];
      CGFloat v13 = [v12 createCGImage:v11];
      [(UIImage *)v5 scale];
      CGFloat v15 = +[UIImage imageWithCGImage:v13 scale:[(UIImage *)v5 imageOrientation] orientation:v14];
      CGImageRelease(v13);
    }
    else
    {
      CGFloat v15 = v5;
    }
  }
  else
  {
    CGFloat v15 = v5;
  }

  return v15;
}

+ (id)_compositeImageFromImage:(id)a3 paddedToWidth:(double)a4 badge:(id)a5 badgeOffset:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  id v10 = a3;
  id v11 = a5;
  [v10 size];
  double v13 = a4;
  if (x + v12 > a4)
  {
    [v10 size];
    double v13 = x + v14;
  }
  [v10 size];
  double v16 = v15 + y * 2.0;
  [v10 scale];
  CGFloat v18 = v17;
  v30.CGFloat width = v13;
  v30.CGFloat height = v16;
  UIGraphicsBeginImageContextWithOptions(v30, 0, v18);
  char IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
  double v20 = x;
  if ((IsRightToLeft & 1) == 0)
  {
    [v10 size:x];
    double v22 = a4 - v21 - x;
    double v20 = 0.0;
    if (v22 >= 0.0)
    {
      [v10 size:0.0];
      double v20 = a4 - v23 - x;
    }
  }
  [v10 drawAtPoint:v20, y];
  if (v11)
  {
    double v24 = 0.0;
    if ((MKApplicationLayoutDirectionIsRightToLeft() & 1) == 0)
    {
      [v11 size];
      double v24 = v13 - v25;
    }
    [v11 size];
    [v11 drawAtPoint:v24, v16 - v26];
  }
  double v27 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v27;
}

+ (id)_mapsCar_systemImageNamed:(id)a3
{
  id v3 = a3;
  id v4 = +[CarDisplayController sharedInstance];
  CGFloat v5 = [v4 screenTraitCollection];
  uint64_t v6 = +[UIImage systemImageNamed:v3 compatibleWithTraitCollection:v5];

  return v6;
}

+ (id)_mapsCar_systemImageNamed:(id)a3 pointSize:(double)a4
{
  id v5 = a3;
  uint64_t v6 = +[CarDisplayController sharedInstance];
  double v7 = [v6 screenTraitCollection];
  id v8 = +[UIImage systemImageNamed:v5 compatibleWithTraitCollection:v7];

  long long v9 = +[UIImageSymbolConfiguration configurationWithPointSize:a4];
  id v10 = [v8 imageByApplyingSymbolConfiguration:v9];

  return v10;
}

+ (id)_mapsCar_systemImageNamed:(id)a3 pointSize:(double)a4 weight:(int64_t)a5
{
  id v7 = a3;
  id v8 = +[CarDisplayController sharedInstance];
  long long v9 = [v8 screenTraitCollection];
  id v10 = +[UIImage systemImageNamed:v7 compatibleWithTraitCollection:v9];

  id v11 = +[UIImageSymbolConfiguration configurationWithPointSize:a5 weight:a4];
  double v12 = [v10 imageByApplyingSymbolConfiguration:v11];

  return v12;
}

+ (id)_mapsCar_systemImageNamed:(id)a3 textStyle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[CarDisplayController sharedInstance];
  id v8 = [v7 screenTraitCollection];
  long long v9 = +[UIImage systemImageNamed:v6 compatibleWithTraitCollection:v8];

  id v10 = +[UIImageSymbolConfiguration configurationWithTextStyle:v5];

  id v11 = [v9 imageByApplyingSymbolConfiguration:v10];

  return v11;
}

+ (id)_mapsCar_systemImageNamed:(id)a3 textStyle:(id)a4 weight:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  long long v9 = +[UIFont _mapsCar_fontForTextStyle:v7 weight:UIFontWeightForImageSymbolWeight((UIImageSymbolWeight)a5)];

  id v10 = +[CarDisplayController sharedInstance];
  id v11 = [v10 screenTraitCollection];
  double v12 = +[UIImage systemImageNamed:v8 compatibleWithTraitCollection:v11];

  double v13 = +[UIImageSymbolConfiguration configurationWithFont:v9];
  double v14 = [v12 imageByApplyingSymbolConfiguration:v13];

  return v14;
}

+ (id)_mapsCar_privateSystemImageNamed:(id)a3 textStyle:(id)a4 scale:(int64_t)a5
{
  id v6 = a3;
  id v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle3];
  id v8 = +[UIImageSymbolConfiguration configurationWithFont:v7 scale:a5];
  long long v9 = +[UIImage _systemImageNamed:v6 withConfiguration:v8];

  return v9;
}

- (id)drawnInCircleWithDiameter:(double)a3 backgroundColor:(id)a4
{
  id v6 = a4;
  id v7 = [(UIImage *)self _contextWithDiameter:a3];
  id v8 = v6;
  long long v9 = (CGColor *)[v8 CGColor];

  CGContextSetFillColorWithColor(v7, v9);
  v26.origin.double x = 0.0;
  v26.origin.double y = 0.0;
  v26.size.CGFloat width = a3;
  v26.size.CGFloat height = a3;
  CGContextFillEllipseInRect(v7, v26);
  id v10 = +[UIColor whiteColor];
  [v10 setFill];

  [(UIImage *)self size];
  double v12 = v11;
  [(UIImage *)self size];
  double v14 = v13;
  [(UIImage *)self size];
  double v15 = a3;
  if (v16 <= a3)
  {
    [(UIImage *)self size];
    double v15 = v17;
  }
  [(UIImage *)self size];
  double v18 = a3;
  if (v19 <= a3)
  {
    [(UIImage *)self size];
    double v18 = v20;
  }
  CGFloat v21 = (a3 - v14) * 0.5;
  CGFloat v22 = (a3 - v12) * -0.5;
  double v23 = -[UIImage _cgImageFromContext:toFit:](self, "_cgImageFromContext:toFit:", v7, v15, v18);
  v27.origin.double x = v21;
  v27.origin.double y = v22;
  v27.size.CGFloat width = v15;
  v27.size.CGFloat height = v18;
  CGContextClipToMask(v7, v27, v23);
  v28.origin.double x = v21;
  v28.origin.double y = v22;
  v28.size.CGFloat width = v15;
  v28.size.CGFloat height = v18;
  CGContextFillRect(v7, v28);

  return [(UIImage *)self _finaliseCircleImage:0 withContext:v7];
}

- (CGContext)_contextWithDiameter:(double)a3
{
  UIGraphicsBeginImageContextWithOptions(*(CGSize *)&a3, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  return CurrentContext;
}

- (CGImage)_cgImageFromContext:(CGContext *)a3 toFit:(CGSize)a4
{
  CGContextTranslateCTM(a3, 0.0, a4.height);
  CGContextScaleCTM(a3, 1.0, -1.0);
  id v6 = self;

  return [(UIImage *)v6 CGImage];
}

- (id)_finaliseCircleImage:(id)a3 withContext:(CGContext *)a4
{
  CGContextRestoreGState(a4);
  id v4 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v4;
}

- (id)imageScaledToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  UIGraphicsBeginImageContextWithOptions(a3, 0, 0.0);
  -[UIImage drawInRect:](self, "drawInRect:", 0.0, 0.0, width, height);
  id v6 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v6;
}

+ (id)_imageProcessingQueue
{
  if (qword_10160F750 != -1) {
    dispatch_once(&qword_10160F750, &stru_1012F7488);
  }
  v2 = (void *)qword_10160F748;

  return v2;
}

- (void)maps_blurredImageScale:(double)a3 isRTL:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  long long v9 = [(id)objc_opt_class() _imageProcessingQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10074A778;
  v11[3] = &unk_1012F74B0;
  double v13 = a3;
  BOOL v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 addOperationWithBlock:v11];
}

- (id)_maps_composedImageScale:(double)a3 isRTL:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(UIImage *)self _maps_scaleToFillRoundedImage:self size:64.0 scale:a3];
  id v8 = [(UIImage *)self _maps_scaleToFill:self size:61.0 scale:a3];
  long long v9 = [(UIImage *)self _maps_blurredImage:v8 scale:a3];
  id v10 = [(UIImage *)self _maps_scaleToFillRoundedImage:v9 size:61.0 scale:a3];

  if (v10)
  {
    v20.double width = 72.0;
    v20.double height = 72.0;
    UIGraphicsBeginImageContextWithOptions(v20, 0, a3);
    CurrentContext = UIGraphicsGetCurrentContext();
    if (v4) {
      double v12 = 11.0;
    }
    else {
      double v12 = 0.0;
    }
    double v13 = 5.0;
    if (v4)
    {
      double v13 = 0.0;
      double v14 = 0.0;
    }
    else
    {
      double v14 = 8.0;
    }
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v13, 5.0, 67.0, 67.0, 9.60000038);
    id v15 = objc_claimAutoreleasedReturnValue();
    double v16 = (const CGPath *)[v15 CGPath];

    CGContextSaveGState(CurrentContext);
    CGContextBeginPath(CurrentContext);
    v21.origin.double y = 0.0;
    v21.origin.double x = v12;
    v21.size.double width = 61.0;
    v21.size.double height = 61.0;
    CGContextAddRect(CurrentContext, v21);
    CGContextAddPath(CurrentContext, v16);
    CGContextEOClip(CurrentContext);
    [v10 drawInRect:0 blendMode:v12 alpha:0.0];
    CGContextRestoreGState(CurrentContext);
    [v7 drawInRect:v14];
    double v17 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    double v17 = 0;
  }

  return v17;
}

- (id)_maps_scaleToFill:(id)a3 size:(double)a4 scale:(double)a5
{
  id v7 = a3;
  [v7 size];
  double v9 = v8;
  [v7 size];
  if (v9 >= v10) {
    double v11 = v10;
  }
  else {
    double v11 = v9;
  }
  double v12 = a4 / v11;
  double v13 = v10 * v12;
  double v14 = v9 * v12;
  double v15 = (a4 - v10 * v12) * 0.5;
  v19.double width = a4;
  v19.double height = a4;
  UIGraphicsBeginImageContextWithOptions(v19, 0, a5);
  [v7 drawInRect:(a4 - v14) * 0.5, v15, v14, v13];

  double v16 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v16;
}

- (id)_maps_scaleToFillRoundedImage:(id)a3 size:(double)a4 scale:(double)a5
{
  id v7 = a3;
  [v7 size];
  double v9 = v8;
  [v7 size];
  if (v9 >= v10) {
    double v11 = v10;
  }
  else {
    double v11 = v9;
  }
  double v12 = a4 / v11;
  double v13 = v10 * v12;
  double v14 = v9 * v12;
  double v15 = (a4 - v10 * v12) * 0.5;
  v22.double width = a4;
  v22.double height = a4;
  UIGraphicsBeginImageContextWithOptions(v22, 0, a5);
  CurrentContext = UIGraphicsGetCurrentContext();
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, a4, a4, 7.19999981);
  id v17 = objc_claimAutoreleasedReturnValue();
  double v18 = (const CGPath *)[v17 CGPath];

  CGContextSaveGState(CurrentContext);
  CGContextAddPath(CurrentContext, v18);
  CGContextClip(CurrentContext);
  CGContextClosePath(CurrentContext);
  [v7 drawInRect:(a4 - v14) * 0.5, v15, v14, v13];

  CGContextRestoreGState(CurrentContext);
  CGSize v19 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v19;
}

- (id)_maps_blurredImage:(id)a3 scale:(double)a4
{
  memset(&buf, 0, sizeof(buf));
  id v5 = (CGImage *)[a3 CGImage];
  ColorSpace = CGImageGetColorSpace(v5);
  id v7 = CGColorSpaceRetain(ColorSpace);
  *(void *)&format.renderingIntent = 0;
  format.bitsPerComponent = CGImageGetBitsPerComponent(v5);
  int BitsPerComponent = CGImageGetBitsPerComponent(v5);
  int NumberOfComponents = CGColorSpaceGetNumberOfComponents(v7);
  if (CGImageGetAlphaInfo(v5)) {
    int v10 = NumberOfComponents + 1;
  }
  else {
    int v10 = NumberOfComponents;
  }
  format.bitsPerPixel = v10 * BitsPerComponent;
  format.colorSpace = v7;
  format.bitmapInfo = CGImageGetBitmapInfo(v5);
  *(_OWORD *)&format.version = 0uLL;
  if (vImageBuffer_InitWithCGImage(&buf, &format, 0, v5, 0))
  {
    free(buf.data);
    double v11 = 0;
  }
  else
  {
    size_t BytesPerRow = CGImageGetBytesPerRow(v5);
    size_t Height = CGImageGetHeight(v5);
    double v14 = malloc_type_malloc(Height * BytesPerRow, 0x1544049FuLL);
    dest.data = v14;
    dest.double height = CGImageGetHeight(v5);
    dest.double width = CGImageGetWidth(v5);
    dest.rowBytes = CGImageGetBytesPerRow(v5);
    *(void *)&v20.renderingIntent = 0;
    vImage_Error error = vImageBoxConvolve_ARGB8888(&buf, &dest, 0, 0, 0, (a4 * 12.0) + 1, (a4 * 12.0) + 1, 0, 8u);
    v20.bitsPerComponent = CGImageGetBitsPerComponent(v5);
    int v15 = CGImageGetBitsPerComponent(v5);
    int v16 = CGColorSpaceGetNumberOfComponents(v7);
    if (CGImageGetAlphaInfo(v5)) {
      int v17 = v16 + 1;
    }
    else {
      int v17 = v16;
    }
    v20.bitsPerPixel = v17 * v15;
    v20.colorSpace = v7;
    v20.bitmapInfo = CGImageGetBitmapInfo(v5);
    *(_OWORD *)&v20.version = 0uLL;
    double v18 = vImageCreateCGImageFromBuffer(&dest, &v20, 0, 0, 0, &error);
    CGColorSpaceRelease(v7);
    double v11 = +[UIImage imageWithCGImage:v18];
    CGImageRelease(v18);
    free(buf.data);
    free(v14);
  }

  return v11;
}

+ (CGRect)maps_collectionGlyphFractionalRectWithRTL:(BOOL)a3
{
  double v3 = 0.111111112;
  double v4 = 0.0;
  if (!a3) {
    double v4 = 0.111111112;
  }
  double v5 = 0.888888896;
  double v6 = 0.888888896;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v3;
  result.origin.double x = v4;
  return result;
}

+ (id)interSystemTransferFromHexColor:(id)a3 toHexColor:(id)a4 imageWithSize:(int64_t)a5 scale:(double)a6 darkMode:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a4;
  double v12 = +[MKTransitArtwork stationNodeArtworkWithHexColor:a3];
  double v13 = +[MKTransitArtwork stationNodeOutlinedArtworkWithHexColor:v11];

  double v14 = +[UIImage _mapkit_transitArtworkImageWithDataSource:v12 size:a5 scale:v7 nightMode:a6];
  int v15 = +[UIImage _mapkit_transitArtworkImageWithDataSource:v13 size:a5 scale:v7 nightMode:a6];
  id v16 = v14;
  int v17 = (CGImage *)[v16 CGImage];
  id v18 = v15;
  CGSize v19 = (CGImage *)[v18 CGImage];
  double Width = (double)CGImageGetWidth(v17);
  size_t v21 = CGImageGetWidth(v19);
  double v22 = (double)v21;
  if (Width <= (double)v21) {
    double v23 = (double)v21;
  }
  else {
    double v23 = Width;
  }
  double Height = (double)CGImageGetHeight(v17);
  [v16 scale];
  CGFloat v26 = Height + v25 * 4.0 + (double)CGImageGetWidth(v19);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  Alignedsize_t BytesPerRow = CGBitmapGetAlignedBytesPerRow();
  double v29 = CGBitmapContextCreate(0, (unint64_t)v23, (unint64_t)v26, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
  v37.b = 0.0;
  v37.c = 0.0;
  v37.a = 1.0;
  *(_OWORD *)&v37.d = xmmword_100F72DC0;
  v37.tdouble y = v26;
  CGContextConcatCTM(v29, &v37);
  v39.origin.double x = 0.0;
  v39.origin.double y = 0.0;
  v39.size.double width = v23;
  v39.size.double height = v26;
  CGContextClearRect(v29, v39);
  v40.size.double height = (double)CGImageGetHeight(v17);
  v40.origin.double y = 0.0;
  v40.origin.double x = (v23 - Width) * 0.5;
  v40.size.double width = Width;
  CGContextDrawImage(v29, v40, v17);
  CGFloat v30 = (v23 - v22) * 0.5;
  double v31 = (double)CGImageGetHeight(v17);
  [v16 scale];
  CGFloat v33 = v31 + v32 * 4.0;
  v41.size.double height = (double)CGImageGetHeight(v19);
  v41.origin.double x = v30;
  v41.origin.double y = v33;
  v41.size.double width = v22;
  CGContextDrawImage(v29, v41, v19);
  Image = CGBitmapContextCreateImage(v29);
  [v16 scale];
  v35 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", Image, 0);
  CGImageRelease(Image);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v29);

  return v35;
}

+ (id)_maps_maneuverImageForTransitArrivalInfo:(id)a3 shieldSize:(int64_t)a4 forDarkBackground:(BOOL)a5
{
  id v8 = a3;
  double v9 = -[GuidanceManeuverView initWithFrame:]([GuidanceManeuverView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  +[SignStyle arrowMetricsForStyle:0];
  memcpy(__dst, __src, sizeof(__dst));
  [(GuidanceManeuverView *)v9 setArrowMetrics:__dst];
  +[SignStyle junctionArrowMetricsForStyle:0];
  memcpy(v20, v21, sizeof(v20));
  [(GuidanceManeuverView *)v9 setJunctionArrowMetrics:v20];
  [(GuidanceManeuverView *)v9 setFraming:1];
  if (a5) {
    +[UIColor whiteColor];
  }
  else {
  int v10 = +[UIColor blackColor];
  }
  [(GuidanceManeuverView *)v9 setArrowColor:v10];

  uint64_t v11 = 18;
  if (v8)
  {
    unsigned int v12 = [v8 destinationLocation];
    if (v12 == 2) {
      unsigned int v13 = 34;
    }
    else {
      unsigned int v13 = 18;
    }
    if (v12 == 1) {
      uint64_t v11 = 33;
    }
    else {
      uint64_t v11 = v13;
    }
  }
  double v14 = +[GuidanceManeuverArtwork artworkWithManeuver:v11];
  [(GuidanceManeuverView *)v9 setManeuverArtwork:v14];

  [(GuidanceManeuverView *)v9 intrinsicContentSize];
  [a1 _maps_minSideLengthForShieldSize:a4];
  UIRoundToViewScale();
  double v16 = v15;
  UIRoundToViewScale();
  -[GuidanceManeuverView setBounds:](v9, "setBounds:", 0.0, 0.0, v16, v17);
  id v18 = [(GuidanceManeuverView *)v9 imageRepresentation];

  return v18;
}

+ (double)_maps_minSideLengthForShieldSize:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)a3 <= 7) {
    return dbl_100F72DD0[a3];
  }
  return result;
}

+ (id)_maps_radar_symbolFilled
{
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (+[NSBundle tapToRadarKit],
        (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v3 = (void *)v2;
    double v4 = +[UIImage imageNamed:TapToRadarSymbolFilled inBundle:v2];
  }
  else
  {
    double v4 = +[UIImage systemImageNamed:@"ant.fill"];
  }

  return v4;
}

+ (id)_maps_radar_symbolUnfilled
{
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (+[NSBundle tapToRadarKit],
        (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v3 = (void *)v2;
    double v4 = +[UIImage imageNamed:TapToRadarSymbolUnfilled inBundle:v2];
  }
  else
  {
    double v4 = +[UIImage systemImageNamed:@"ant"];
  }

  return v4;
}

+ (id)_maps_radar_symbolCircleFilled
{
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (+[NSBundle tapToRadarKit],
        (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v3 = (void *)v2;
    double v4 = +[UIImage imageNamed:TapToRadarSymbolCircleFilled inBundle:v2];
  }
  else
  {
    double v4 = +[UIImage systemImageNamed:@"ant.circle.fill"];
  }

  return v4;
}

+ (id)_maps_radar_symbolCircleUnfilled
{
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (+[NSBundle tapToRadarKit],
        (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v3 = (void *)v2;
    double v4 = +[UIImage imageNamed:TapToRadarSymbolCircleUnfilled inBundle:v2];
  }
  else
  {
    double v4 = +[UIImage systemImageNamed:@"ant.circle"];
  }

  return v4;
}

+ (id)_maps_applicationIconWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    double v4 = +[UIScreen mainScreen];
    [v4 scale];
    double v5 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v3, 2);
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)_maps_imageWithAspectFitScalingForMaximumDimension:(double)a3
{
  return -[UIImage _maps_imageWithAspectFitScalingForMaximumSize:](self, "_maps_imageWithAspectFitScalingForMaximumSize:", a3, a3);
}

- (id)_maps_imageWithAspectFitScalingForMaximumSize:(CGSize)a3
{
  double width = a3.width;
  BOOL v4 = a3.width > 0.00000011920929 && a3.height > 0.00000011920929;
  if (v4)
  {
    double height = a3.height;
    [(UIImage *)self size];
    if (v8 > width || v9 > height)
    {
      BOOL v4 = v8 <= v9;
      double v11 = height * (v8 / v9);
      double v12 = width * (v9 / v8);
      if (v4) {
        double width = v11;
      }
      else {
        double height = v12;
      }
      [(UIImage *)self scale];
      CGFloat v14 = v13;
      v17.double width = width;
      v17.double height = height;
      UIGraphicsBeginImageContextWithOptions(v17, 0, v14);
      -[UIImage drawInRect:](self, "drawInRect:", CGPointZero.x, CGPointZero.y, width, height);
      UIGraphicsGetImageFromCurrentImageContext();
      double v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
    }
    else
    {
      double v5 = self;
    }
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

+ (id)warningImageOfSize:(double)a3
{
  double v5 = +[UIColor systemYellowColor];
  double v6 = [a1 imageNamed:@"exclamationmark.circle.fill" ofSize:v5 color:a3];

  return v6;
}

+ (id)chargeImageOfSize:(double)a3 batteryLevel:(unint64_t)a4
{
  double v6 = +[VehicleBatteryView colorForBatteryLevel:a4];
  BOOL v7 = [a1 imageNamed:@"bolt.circle.fill" ofSize:v6 color:a3];

  return v7;
}

+ (id)imageNamed:(id)a3 ofSize:(double)a4 color:(id)a5
{
  id v7 = a5;
  double v8 = +[UIImage systemImageNamed:a3];
  double v9 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:0 scale:a4];
  int v10 = [v8 imageWithConfiguration:v9];

  double v11 = [v10 imageWithRenderingMode:2];
  double v12 = [v11 _flatImageWithColor:v7];

  double v13 = [v12 imageWithRenderingMode:1];

  return v13;
}

- (id)_maps_mostCommonColor
{
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100A53C90;
  v22[3] = &unk_101315468;
  double v24 = &stru_101315440;
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v23 = v3;
  [(UIImage *)self _enumeratePixelsWithBlock:v22];
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100104264;
  CGSize v19 = sub_1001049B0;
  id v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100A53D64;
  v14[3] = &unk_101315490;
  v14[4] = v21;
  v14[5] = &v15;
  [v3 enumerateKeysAndObjectsUsingBlock:v14];
  BOOL v4 = [(id)v16[5] componentsSeparatedByString:@","];
  double v5 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  double v6 = [v4 objectAtIndexedSubscript:0];
  *double v5 = [v6 integerValue];

  id v7 = [v4 objectAtIndexedSubscript:1];
  v5[1] = [v7 integerValue];

  double v8 = [v4 objectAtIndexedSubscript:2];
  v5[2] = [v8 integerValue];

  v5[3] = 0;
  LOBYTE(v9) = *v5;
  LOBYTE(v10) = v5[1];
  LOBYTE(v11) = v5[2];
  double v12 = +[UIColor colorWithRed:(double)v9 * 0.00392156863 green:(double)v10 * 0.00392156863 blue:(double)v11 * 0.00392156863 alpha:1.0];
  free(v5);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v21, 8);

  return v12;
}

- (void)_enumeratePixelsWithBlock:(id)a3
{
  BOOL v4 = (void (**)(id, char *, unsigned char *))a3;
  double v5 = [(UIImage *)self CGImage];
  unint64_t Width = CGImageGetWidth(v5);
  unint64_t Height = CGImageGetHeight(v5);
  char v8 = 1;
  unint64_t v9 = (char *)malloc_type_calloc(4 * Width * Height, 1uLL, 0x100004077774924uLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  unint64_t v11 = CGBitmapContextCreate(v9, Width, Height, 8uLL, 4 * Width, DeviceRGB, 0x4001u);
  CGColorSpaceRelease(DeviceRGB);
  v20.size.double width = (double)Width;
  v20.size.double height = (double)Height;
  v20.origin.double x = 0.0;
  v20.origin.double y = 0.0;
  CGContextDrawImage(v11, v20, v5);
  CGContextRelease(v11);
  uint64_t v12 = 0;
  char v19 = 0;
  while (1)
  {
    char v18 = v8;
    unint64_t v13 = qword_100F730C0[v12];
    if (v13 < Height) {
      break;
    }
LABEL_8:
    char v8 = 0;
    uint64_t v12 = 1;
    if ((v18 & 1) == 0) {
      goto LABEL_9;
    }
  }
  CGFloat v14 = &v9[(4 * Width + 4) * v13];
  unint64_t v15 = qword_100F730C0[v12];
  while (1)
  {
    double v16 = v14;
    unint64_t v17 = v13;
    if (v13 < Width) {
      break;
    }
LABEL_7:
    v15 += v13;
    v14 += 4 * Width * v13;
    if (v15 >= Height) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    v4[2](v4, v16, &v19);
    if (v19) {
      break;
    }
    v17 += v13;
    v16 += 4 * v13;
    if (v17 >= Width) {
      goto LABEL_7;
    }
  }
LABEL_9:
  free(v9);
}

@end