@interface CRLShadow
+ (BOOL)automaticallyNotifiesObserversOfCRLColor;
+ (CRLShadow)shadowWithAngle:(double)a3 offset:(double)a4 radius:(double)a5 opacity:(double)a6 color:(id)a7 enabled:(BOOL)a8;
+ (CRLShadow)shadowWithNSShadow:(id)a3;
+ (id)defaultDisabledShadow;
+ (id)defaultShadow;
+ (id)defaultShadowPresets;
+ (id)keyPathsForValuesAffectingCRLColor;
+ (id)p_defaultShadowEnabled:(BOOL)a3;
- (BOOL)isContactShadow;
- (BOOL)isCurvedShadow;
- (BOOL)isDropShadow;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)showForEditingText;
- (CGImage)i_newEmptyImage;
- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6;
- (CGPoint)offsetDelta;
- (CGRect)boundsForRep:(id)a3;
- (CGRect)boundsInNaturalSpaceForRep:(id)a3;
- (CGRect)shadowBoundsForRect:(CGRect)a3;
- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalAngle:(double)a4;
- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4;
- (CRLColor)color;
- (NSShadow)NSShadow;
- (NSString)typeDescription;
- (double)angle;
- (double)clampOffset:(double)a3;
- (double)clampOpacity:(double)a3;
- (double)clampRadius:(double)a3;
- (double)offset;
- (double)opacity;
- (double)radius;
- (id)description;
- (id)i_initWithOpacity:(double)a3 color:(id)a4 angle:(double)a5 offset:(double)a6 radius:(double)a7 enabled:(BOOL)a8;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)shadowType;
- (void)applyToContext:(CGContext *)a3 viewScale:(double)a4;
- (void)applyToContext:(CGContext *)a3 viewScale:(double)a4 flipped:(BOOL)a5;
- (void)applyToContext:(CGContext *)a3 viewScale:(double)a4 flipped:(BOOL)a5 extraOffset:(CGSize)a6;
- (void)i_setAngle:(double)a3;
- (void)i_setColor:(id)a3;
- (void)i_setEnabled:(BOOL)a3;
- (void)i_setOffset:(double)a3;
- (void)i_setOpacity:(double)a3;
- (void)i_setRadius:(double)a3;
@end

@implementation CRLShadow

- (id)i_initWithOpacity:(double)a3 color:(id)a4 angle:(double)a5 offset:(double)a6 radius:(double)a7 enabled:(BOOL)a8
{
  id v14 = a4;
  if (!v14)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D9680);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107DCCC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D96A0);
    }
    v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v15);
    }
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShadow i_initWithOpacity:color:angle:offset:radius:enabled:]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShadow.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 44, 0, "invalid nil value for '%{public}s'", "color");
  }
  v27.receiver = self;
  v27.super_class = (Class)CRLShadow;
  v18 = [(CRLShadow *)&v27 init];
  v19 = v18;
  if (v18)
  {
    [(CRLShadow *)v18 clampOpacity:a3];
    v19->mOpacity = v20;
    v21 = (CRLColor *)[v14 copy];
    mColor = v19->mColor;
    v19->mColor = v21;

    sub_100065C2C(a5);
    v19->mAngle = v23;
    [(CRLShadow *)v19 clampOffset:a6];
    v19->mOffset = v24;
    v19->mEnabled = a8;
    [(CRLShadow *)v19 clampRadius:a7];
    v19->mRadius = v25;
  }

  return v19;
}

+ (id)p_defaultShadowEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [CRLDropShadow alloc];
  v5 = +[CRLColor blackColor];
  v6 = [(CRLDropShadow *)v4 initWithAngle:v5 offset:v3 radius:90.0 opacity:2.0 color:3.0 enabled:0.25];

  return v6;
}

+ (id)defaultShadow
{
  return [a1 p_defaultShadowEnabled:1];
}

+ (id)defaultDisabledShadow
{
  return [a1 p_defaultShadowEnabled:0];
}

+ (CRLShadow)shadowWithAngle:(double)a3 offset:(double)a4 radius:(double)a5 opacity:(double)a6 color:(id)a7 enabled:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a7;
  id v14 = [[CRLDropShadow alloc] initWithAngle:v13 offset:v8 radius:a3 opacity:a4 color:a5 enabled:a6];

  return (CRLShadow *)v14;
}

+ (CRLShadow)shadowWithNSShadow:(id)a3
{
  id v3 = a3;
  [v3 shadowOffset];
  long double v5 = v4;
  long double v7 = v6;
  id v8 = [v3 shadowColor];
  v9 = (CGColor *)[v8 CGColor];

  double v10 = sub_100065C1C(v5, v7) * 57.2957795;
  double v11 = sub_100065398(v5, v7);
  [v3 shadowBlurRadius];
  double v13 = v12;

  id v14 = +[CRLColor colorWithCGColor:v9];
  [v14 alphaComponent];
  double v16 = v15;
  CopyWithAlpha = CGColorCreateCopyWithAlpha(v9, 1.0);
  v18 = +[CRLColor colorWithCGColor:CopyWithAlpha];
  v19 = +[CRLShadow shadowWithAngle:v18 offset:1 radius:v10 opacity:v11 color:v13 enabled:v16];

  CGColorRelease(CopyWithAlpha);

  return (CRLShadow *)v19;
}

- (double)clampOffset:(double)a3
{
  return sub_100407E48(a3, -50.0, 50.0);
}

- (double)clampRadius:(double)a3
{
  return sub_100407E48((double)(int)a3, 0.0, 100.0);
}

- (double)clampOpacity:(double)a3
{
  return sub_100407E48(a3, 0.0, 1.0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (BOOL)isContactShadow
{
  return (id)[(CRLShadow *)self shadowType] == (id)2;
}

- (BOOL)isDropShadow
{
  return (id)[(CRLShadow *)self shadowType] == (id)1;
}

- (BOOL)isCurvedShadow
{
  return (id)[(CRLShadow *)self shadowType] == (id)3;
}

- (BOOL)showForEditingText
{
  return 0;
}

- (unint64_t)shadowType
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    id v4 = a3;
    uint64_t v5 = objc_opt_class();
    double v6 = sub_1002469D0(v5, v4);

    if (v6)
    {
      [(CRLShadow *)self angle];
      double v8 = v7;
      [v6 angle];
      if (v8 == v9 || vabdd_f64(v8, v9) < fabs(v9 * 0.000000999999997))
      {
        [(CRLShadow *)self offset];
        double v11 = v10;
        [v6 offset];
        if (v11 == v12 || vabdd_f64(v11, v12) < fabs(v12 * 0.000000999999997))
        {
          [(CRLShadow *)self radius];
          double v14 = v13;
          [v6 radius];
          if (v14 == v15 || vabdd_f64(v14, v15) < fabs(v15 * 0.000000999999997))
          {
            [(CRLShadow *)self opacity];
            double v17 = v16;
            [v6 opacity];
            if (v17 == v18 || vabdd_f64(v17, v18) < fabs(v18 * 0.000000999999997))
            {
              unsigned int v19 = [(CRLShadow *)self isEnabled];
              if (v19 == [v6 isEnabled])
              {
                double v20 = [(CRLShadow *)self color];
                v21 = [v6 color];
                if ([v20 isEqual:v21])
                {
                  unint64_t v22 = [(CRLShadow *)self shadowType];
                  id v23 = [v6 shadowType];

                  if ((id)v22 == v23)
                  {
                    BOOL v24 = 1;
LABEL_18:

                    return v24;
                  }
                }
                else
                {
                }
              }
            }
          }
        }
      }
    }
    BOOL v24 = 0;
    goto LABEL_18;
  }
  return 1;
}

- (unint64_t)hash
{
  return [(CRLColor *)self->mColor hash];
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  long long v12 = *(_OWORD *)&self->mAngle;
  double mRadius = self->mRadius;
  double mOpacity = self->mOpacity;
  mColor = self->mColor;
  if (self->mEnabled) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  double v9 = [(CRLShadow *)self typeDescription];
  double v10 = +[NSString stringWithFormat:@"<%@ %p: angle=%g offset=%g radius=%g opacity=%g color=%p enabled=%@ type=%@>", v4, self, v12, *(void *)&mRadius, *(void *)&mOpacity, mColor, v8, v9];

  return v10;
}

- (NSString)typeDescription
{
  unint64_t v2 = [(CRLShadow *)self shadowType];
  if (v2 > 3) {
    return 0;
  }
  else {
    return (NSString *)*(&off_1014D9780 + v2);
  }
}

- (void)i_setColor:(id)a3
{
  id v4 = (CRLColor *)[a3 copy];
  mColor = self->mColor;
  self->mColor = v4;
}

- (void)i_setAngle:(double)a3
{
  self->mAngle = a3;
}

- (void)i_setOffset:(double)a3
{
  self->mOffset = a3;
}

- (void)i_setRadius:(double)a3
{
  self->double mRadius = a3;
}

- (void)i_setOpacity:(double)a3
{
  self->double mOpacity = a3;
}

- (void)i_setEnabled:(BOOL)a3
{
  self->mEnabled = a3;
}

- (CGPoint)offsetDelta
{
  double v8 = 0.0;
  double v9 = 0.0;
  [(CRLShadow *)self offset];
  double v4 = v3;
  [(CRLShadow *)self angle];
  sub_100066270(&v8, v4, v5 * 0.0174532925);
  double v6 = v8;
  double v7 = v9;
  result.y = v7;
  result.x = v6;
  return result;
}

+ (id)keyPathsForValuesAffectingCRLColor
{
  return +[NSSet setWithObject:@"color"];
}

+ (BOOL)automaticallyNotifiesObserversOfCRLColor
{
  return 0;
}

- (void)applyToContext:(CGContext *)a3 viewScale:(double)a4
{
}

- (void)applyToContext:(CGContext *)a3 viewScale:(double)a4 flipped:(BOOL)a5
{
}

- (void)applyToContext:(CGContext *)a3 viewScale:(double)a4 flipped:(BOOL)a5 extraOffset:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  BOOL v8 = a5;
  if ([(CRLShadow *)self isEnabled])
  {
    double v31 = 0.0;
    double v32 = 0.0;
    [(CRLShadow *)self angle];
    if (v8) {
      double v13 = v12;
    }
    else {
      double v13 = -v12;
    }
    int v14 = sub_100458528((uint64_t)a3);
    double v15 = sub_100458664((uint64_t)a3);
    double v16 = v15;
    if (v14)
    {
      double width = sub_1000646A4(width, height, 1.0 / v15);
      double height = v17;
      double v16 = 1.0;
    }
    [(CRLShadow *)self radius];
    CGFloat v19 = v16 * (v18 * a4);
    [(CRLShadow *)self offset];
    sub_100066270(&v31, v16 * (v20 * a4), v13 * 0.0174532925);
    v33.double width = width;
    v33.double height = height;
    CGSize v21 = CGContextConvertSizeToDeviceSpace(a3, v33);
    CGFloat v22 = v31 + v21.width;
    CGFloat v23 = v21.height + v32;
    BOOL v24 = [(CRLShadow *)self color];
    double v25 = (CGColor *)[v24 CGColor];
    [(CRLShadow *)self opacity];
    double v27 = v26;
    v28 = [(CRLShadow *)self color];
    CGFloat Alpha = CGColorGetAlpha((CGColorRef)[v28 CGColor]);
    CopyWithCGFloat Alpha = CGColorCreateCopyWithAlpha(v25, v27 * Alpha);

    v34.double width = v22;
    v34.double height = v23;
    CGContextSetShadowWithColor(a3, v34, v19, CopyWithAlpha);
    CGColorRelease(CopyWithAlpha);
  }
}

- (CGRect)boundsInNaturalSpaceForRep:(id)a3
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)boundsForRep:(id)a3
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  return 0;
}

- (CGImage)i_newEmptyImage
{
  unint64_t v2 = sub_100455AA8(3, 1.0, 1.0);
  Image = CGBitmapContextCreateImage(v2);
  CGContextRelease(v2);
  return Image;
}

- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(CRLShadow *)self isEnabled])
  {
    [(CRLShadow *)self radius];
    CGFloat v11 = -v10;
    [(CRLShadow *)self radius];
    CGFloat v13 = -v12;
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    CGRect v30 = CGRectInset(v29, v11, v13);
    CGFloat v14 = v30.origin.x;
    CGFloat v15 = v30.origin.y;
    CGFloat v16 = v30.size.width;
    CGFloat v17 = v30.size.height;
    [(CRLShadow *)self offsetDelta];
    float64x2_t v18 = *(float64x2_t *)&a4->c;
    v28[0] = *(float64x2_t *)&a4->a;
    v28[1] = v18;
    v28[2] = *(float64x2_t *)&a4->tx;
    double v21 = sub_1000664E0(v28, v19, v20);
    CGFloat v23 = v22;
    v31.origin.CGFloat x = v14;
    v31.origin.CGFloat y = v15;
    v31.size.CGFloat width = v16;
    v31.size.CGFloat height = v17;
    CGRect v35 = CGRectOffset(v31, v21, v23);
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    CGRect v33 = CGRectUnion(v32, v35);
    CGFloat x = v33.origin.x;
    CGFloat y = v33.origin.y;
    CGFloat width = v33.size.width;
    CGFloat height = v33.size.height;
  }
  double v24 = x;
  double v25 = y;
  double v26 = width;
  double v27 = height;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (CGRect)shadowBoundsForRect:(CGRect)a3
{
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v8[1] = v3;
  v8[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[CRLShadow shadowBoundsForRect:additionalTransform:](self, "shadowBoundsForRect:additionalTransform:", v8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalAngle:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGAffineTransformMakeRotation(&v13, a4 * 0.0174532925);
  -[CRLShadow shadowBoundsForRect:additionalTransform:](self, "shadowBoundsForRect:additionalTransform:", &v13, x, y, width, height);
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

+ (id)defaultShadowPresets
{
  unint64_t v2 = +[NSMutableArray array];
  uint64_t v3 = 0;
  char v4 = 1;
  do
  {
    char v5 = v4;
    double v6 = &qword_101175770[8 * v3];
    double v7 = *(double *)v6;
    double v8 = *((double *)v6 + 1);
    int v9 = *((_DWORD *)v6 + 4);
    double v10 = +[CRLColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    double v11 = [[CRLDropShadow alloc] initWithAngle:v10 offset:1 radius:v7 opacity:v8 color:(double)v9 enabled:0.5];
    [v2 addObject:v11];

    char v4 = 0;
    uint64_t v3 = 1;
  }
  while ((v5 & 1) != 0);

  return v2;
}

- (NSShadow)NSShadow
{
  if ([(CRLShadow *)self isEnabled])
  {
    id v3 = objc_alloc_init((Class)NSShadow);
    [(CRLShadow *)self angle];
    double v5 = v4 * 0.0174532925;
    [(CRLShadow *)self offset];
    double v7 = v6;
    double v8 = sub_1000662E0(v5);
    double v10 = v9;
    double v11 = [(CRLShadow *)self color];
    double v12 = (CGColor *)[v11 CGColor];

    [(CRLShadow *)self opacity];
    double v14 = v13;
    CGFloat Alpha = CGColorGetAlpha(v12);
    CopyWithCGFloat Alpha = CGColorCreateCopyWithAlpha(v12, v14 * Alpha);
    if (!CopyWithAlpha)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D96C0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10107DD68();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D96E0);
      }
      CGFloat v17 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v17);
      }
      float64x2_t v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShadow NSShadow]");
      double v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShadow.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 423, 0, "invalid nil value for '%{public}s'", "color");
    }
    double v20 = +[UIColor colorWithCGColor:CopyWithAlpha];
    if (v20) {
      [v3 setShadowColor:v20];
    }
    [v3 setShadowOffset:sub_1000646A4(v8, v10, v7)];
    [(CRLShadow *)self radius];
    [v3 setShadowBlurRadius:];
    CGColorRelease(CopyWithAlpha);
  }
  else
  {
    id v3 = 0;
  }

  return (NSShadow *)v3;
}

- (double)angle
{
  return self->mAngle;
}

- (double)offset
{
  return self->mOffset;
}

- (double)radius
{
  return self->mRadius;
}

- (double)opacity
{
  return self->mOpacity;
}

- (CRLColor)color
{
  return self->mColor;
}

- (BOOL)isEnabled
{
  return self->mEnabled;
}

- (void).cxx_destruct
{
}

@end