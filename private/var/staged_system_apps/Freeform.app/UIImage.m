@interface UIImage
+ (id)crl_accessibilityBoldTextAdaptiveImageNamed:(id)a3;
+ (id)crl_bidiConsciousImageNamed:(id)a3;
+ (id)crl_imageNamed:(id)a3 withPointSize:(double)a4;
+ (id)crl_imageWithColor:(id)a3 size:(CGSize)a4;
+ (id)crl_internalSystemImageNamed:(id)a3;
+ (id)crl_internalSystemImageNamed:(id)a3 pointSize:(double)a4;
+ (id)crl_systemImageNamed:(id)a3 withFallbackCustomImageNamed:(id)a4;
+ (id)crl_systemImageNamed:(id)a3 withFont:(id)a4;
+ (id)crl_systemImageNamed:(id)a3 withPointSize:(double)a4;
+ (id)crl_systemImageNamed:(id)a3 withPointSize:(double)a4 weight:(int64_t)a5;
+ (id)crl_systemImageNamed:(id)a3 withPointSize:(double)a4 weight:(int64_t)a5 scale:(int64_t)a6;
+ (id)crl_templateImageWithCGPath:(CGPath *)a3 scale:(double)a4;
- (id)crl_imageWithAlpha:(double)a3 renderingMode:(int64_t)a4;
- (id)crl_imageWithRTLMirroringForcedOn:(BOOL)a3;
- (id)crl_resizableImage;
- (id)crl_templateImageWithAlpha:(double)a3;
- (id)crl_tintedImageWithColor:(id)a3;
@end

@implementation UIImage

+ (id)crl_templateImageWithCGPath:(CGPath *)a3 scale:(double)a4
{
  BoundingBoCGFloat x = CGPathGetBoundingBox(a3);
  CGFloat x = BoundingBox.origin.x;
  CGFloat y = BoundingBox.origin.y;
  CGFloat width = BoundingBox.size.width;
  CGFloat height = BoundingBox.size.height;
  v10 = sub_100010A74(1, BoundingBox.size.width, BoundingBox.size.height, a4);
  if (v10)
  {
    v11 = v10;
    CGContextSaveGState(v10);
    CGContextAddPath(v11, a3);
    CGContextClip(v11);
    CGContextSetRGBFillColor(v11, 1.0, 1.0, 1.0, 1.0);
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    CGContextFillRect(v11, v18);
    CGContextRestoreGState(v11);
    Image = CGBitmapContextCreateImage(v11);
    v13 = +[UIImage imageWithCGImage:Image scale:0 orientation:a4];
    v14 = [v13 imageWithRenderingMode:2];

    CGImageRelease(Image);
    CGContextRelease(v11);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)crl_imageWithAlpha:(double)a3 renderingMode:(int64_t)a4
{
  id v7 = objc_alloc((Class)UIGraphicsImageRenderer);
  [(UIImage *)self size];
  id v8 = [v7 initWithSize:];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1004236C4;
  v12[3] = &unk_1014F8E00;
  v12[4] = self;
  *(double *)&v12[5] = a3;
  v9 = [v8 imageWithActions:v12];
  v10 = [v9 imageWithRenderingMode:a4];

  return v10;
}

- (id)crl_templateImageWithAlpha:(double)a3
{
  return [(UIImage *)self crl_imageWithAlpha:2 renderingMode:a3];
}

- (id)crl_tintedImageWithColor:(id)a3
{
  id v4 = a3;
  [(UIImage *)self size];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  [(UIImage *)self scale];
  CGFloat v10 = v9;
  v18.CGFloat width = v6;
  v18.CGFloat height = v8;
  UIGraphicsBeginImageContextWithOptions(v18, 0, v10);
  [v4 setFill];

  [(UIImage *)self size];
  double v12 = v11;
  [(UIImage *)self size];
  double v14 = v13;
  v19.origin.CGFloat x = 0.0;
  v19.origin.CGFloat y = 0.0;
  v19.size.CGFloat width = v12;
  v19.size.CGFloat height = v14;
  UIRectFill(v19);
  -[UIImage drawInRect:blendMode:alpha:](self, "drawInRect:blendMode:alpha:", 22, 0.0, 0.0, v12, v14, 1.0);
  v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

- (id)crl_resizableImage
{
  [(UIImage *)self size];

  return -[UIImage resizableImageWithCapInsets:](self, "resizableImageWithCapInsets:");
}

+ (id)crl_imageWithColor:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  id v7 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:width, height];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10042395C;
  v12[3] = &unk_1014F8E28;
  id v13 = v6;
  double v14 = width;
  double v15 = height;
  id v8 = v6;
  double v9 = [v7 imageWithActions:v12];
  CGFloat v10 = [v9 imageWithRenderingMode:0];

  return v10;
}

+ (id)crl_accessibilityBoldTextAdaptiveImageNamed:(id)a3
{
  id v3 = a3;
  if (!UIAccessibilityIsBoldTextEnabled()
    || ([v3 stringByAppendingString:@"-bold"],
        id v4 = objc_claimAutoreleasedReturnValue(),
        +[UIImage imageNamed:v4],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    double v5 = +[UIImage imageNamed:v3];
  }

  return v5;
}

+ (id)crl_bidiConsciousImageNamed:(id)a3
{
  id v3 = +[UIImage imageNamed:a3];
  if (sub_1003E86EC())
  {
    uint64_t v4 = [v3 imageWithHorizontallyFlippedOrientation];

    id v3 = (void *)v4;
  }

  return v3;
}

+ (id)crl_systemImageNamed:(id)a3 withFallbackCustomImageNamed:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = +[UIImage systemImageNamed:v5];
    if (v7) {
      goto LABEL_13;
    }
    int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8E48);
    }
    double v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B1790(v8, v9);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8E68);
    }
    CGFloat v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v10, v8);
    }
    double v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIImage(CRLAdditions) crl_systemImageNamed:withFallbackCustomImageNamed:]");
    double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/UIImage_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 103, 0, "invalid nil value for '%{public}s'", "result");
  }
  id v7 = +[UIImage imageNamed:v6];
LABEL_13:

  return v7;
}

+ (id)crl_systemImageNamed:(id)a3 withPointSize:(double)a4
{
  return [a1 crl_systemImageNamed:a3 withPointSize:4 weight:a4];
}

+ (id)crl_imageNamed:(id)a3 withPointSize:(double)a4
{
  id v5 = a3;
  id v6 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:a4];
  id v7 = +[UIImage imageNamed:v5 inBundle:0 withConfiguration:v6];

  return v7;
}

+ (id)crl_systemImageNamed:(id)a3 withPointSize:(double)a4 weight:(int64_t)a5
{
  id v7 = a3;
  int v8 = +[UIImageSymbolConfiguration configurationWithPointSize:a5 weight:a4];
  double v9 = +[UIImage systemImageNamed:v7 withConfiguration:v8];

  return v9;
}

+ (id)crl_systemImageNamed:(id)a3 withPointSize:(double)a4 weight:(int64_t)a5 scale:(int64_t)a6
{
  id v9 = a3;
  CGFloat v10 = +[UIImageSymbolConfiguration configurationWithPointSize:a5 weight:a6 scale:a4];
  double v11 = +[UIImage systemImageNamed:v9 withConfiguration:v10];

  return v11;
}

+ (id)crl_systemImageNamed:(id)a3 withFont:(id)a4
{
  id v5 = a3;
  id v6 = +[UIImageSymbolConfiguration configurationWithFont:a4];
  id v7 = +[UIImage systemImageNamed:v5 withConfiguration:v6];

  return v7;
}

- (id)crl_imageWithRTLMirroringForcedOn:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  if (sub_1003E86EC())
  {
    id v5 = v4;
    if (![(UIImage *)v4 imageOrientation])
    {
      id v5 = v4;
      if (v3)
      {
        id v5 = [(UIImage *)v4 imageFlippedForRightToLeftLayoutDirection];
      }
    }
    if ((id)[(UIImage *)v4 imageOrientation] != (id)4 || v3)
    {
      uint64_t v4 = v5;
    }
    else
    {
      uint64_t v4 = [(UIImage *)v4 imageWithHorizontallyFlippedOrientation];
    }
  }

  return v4;
}

+ (id)crl_internalSystemImageNamed:(id)a3
{
  return +[UIImage _systemImageNamed:a3];
}

+ (id)crl_internalSystemImageNamed:(id)a3 pointSize:(double)a4
{
  id v5 = a3;
  id v6 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:a4];
  id v7 = +[UIImage _systemImageNamed:v5 withConfiguration:v6];

  return v7;
}

@end