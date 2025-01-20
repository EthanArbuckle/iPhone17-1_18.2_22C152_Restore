@interface CRLTransformGradientFill
- (BOOL)isAdvancedGradientIgnoringFlag;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualIgnoringTransform:(id)a3;
- (CGAffineTransform)transformForSize:(SEL)a3;
- (CGPoint)endPoint;
- (CGPoint)endPointForPath:(id)a3 andBounds:(CGRect)a4;
- (CGPoint)normalizedPointForSize:(CGSize)a3 endPoint:(BOOL)a4;
- (CGPoint)p_scalePoint:(CGPoint)a3 fromShapeWithNaturalSize:(CGSize)a4;
- (CGPoint)p_scalePoint:(CGPoint)a3 toShapeWithNaturalSize:(CGSize)a4;
- (CGPoint)startPoint;
- (CGPoint)startPointForPath:(id)a3 andBounds:(CGRect)a4;
- (CGSize)baseNaturalSize;
- (CGSize)baseNaturalSizeForBounds:(CGRect)a3;
- (CRLTransformGradientFill)initWithGradient:(id)a3 inPath:(id)a4 andBounds:(CGRect)a5;
- (CRLTransformGradientFill)initWithGradientStops:(id)a3 type:(unint64_t)a4;
- (CRLTransformGradientFill)initWithGradientStops:(id)a3 type:(unint64_t)a4 opacity:(double)a5 startPoint:(CGPoint)a6 endPoint:(CGPoint)a7 baseNaturalSize:(CGSize)a8 isAdvancedGradient:(BOOL)a9;
- (CRLTransformGradientFill)initWithStartColor:(id)a3 endColor:(id)a4 type:(unint64_t)a5;
- (double)gradientAngleInDegrees;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)p_drawQuartzShadingInContext:(CGContext *)a3 withGradientNaturalSize:(CGSize)a4 baseNaturalSize:(CGSize)a5 start:(CGPoint)a6 end:(CGPoint)a7;
- (void)p_setBaseNaturalSize:(CGSize)a3;
- (void)p_setDefaultValues;
- (void)p_setEndPoint:(CGPoint)a3;
- (void)p_setStartPoint:(CGPoint)a3;
- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)paintPath:(CGPath *)a3 naturalBounds:(CGRect)a4 inContext:(CGContext *)a5 isPDF:(BOOL)a6;
- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4;
@end

@implementation CRLTransformGradientFill

- (CRLTransformGradientFill)initWithStartColor:(id)a3 endColor:(id)a4 type:(unint64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CRLTransformGradientFill;
  v5 = [(CRLGradientFill *)&v8 initWithStartColor:a3 endColor:a4 type:a5];
  v6 = v5;
  if (v5) {
    [(CRLTransformGradientFill *)v5 p_setDefaultValues];
  }
  return v6;
}

- (CRLTransformGradientFill)initWithGradientStops:(id)a3 type:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CRLTransformGradientFill;
  v4 = [(CRLGradientFill *)&v7 initWithGradientStops:a3 type:a4];
  v5 = v4;
  if (v4) {
    [(CRLTransformGradientFill *)v4 p_setDefaultValues];
  }
  return v5;
}

- (CRLTransformGradientFill)initWithGradient:(id)a3 inPath:(id)a4 andBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)CRLTransformGradientFill;
  v11 = -[CRLGradientFill initWithGradientStops:type:](&v21, "initWithGradientStops:type:", [a3 gradientStops], [a3 gradientType]);
  if (v11)
  {
    uint64_t v12 = objc_opt_class();
    id v13 = sub_1002469D0(v12, a3);
    if (v13)
    {
      [v13 baseNaturalSizeForBounds:x, y, width, height];
      double width = v14;
      double height = v15;
    }
    v11->mBaseNaturalSize.double width = width;
    v11->mBaseNaturalSize.double height = height;
    [a3 startPointForPath:a4 andBounds:sub_100064070()];
    v11->mStart.double x = v16;
    v11->mStart.double y = v17;
    [a3 endPointForPath:a4 andBounds:sub_100064070()];
    v11->mEnd.double x = v18;
    v11->mEnd.double y = v19;
  }
  return v11;
}

- (CRLTransformGradientFill)initWithGradientStops:(id)a3 type:(unint64_t)a4 opacity:(double)a5 startPoint:(CGPoint)a6 endPoint:(CGPoint)a7 baseNaturalSize:(CGSize)a8 isAdvancedGradient:(BOOL)a9
{
  BOOL v9 = a9;
  CGFloat height = a8.height;
  CGFloat width = a8.width;
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  CGFloat v14 = a6.y;
  CGFloat v15 = a6.x;
  v19.receiver = self;
  v19.super_class = (Class)CRLTransformGradientFill;
  CGFloat v16 = [(CRLGradientFill *)&v19 initWithGradientStops:a3 type:a4 opacity:a5];
  CGFloat v17 = v16;
  if (v16)
  {
    v16->mBaseNaturalSize.CGFloat width = width;
    v16->mBaseNaturalSize.CGFloat height = height;
    v16->mStart.CGFloat x = v15;
    v16->mStart.CGFloat y = v14;
    v16->mEnd.CGFloat x = x;
    v16->mEnd.CGFloat y = y;
    [(CRLGradientFill *)v16 p_setIsAdvancedGradient:v9];
  }
  return v17;
}

- (unint64_t)hash
{
  p_mStart = (char *)&self->mStart;
  v8.receiver = self;
  v8.super_class = (Class)CRLTransformGradientFill;
  id v4 = [(CRLGradientFill *)&v8 hash];
  uint64_t v5 = sub_1000C8080(p_mStart, 16, (uint64_t)v4);
  uint64_t v6 = sub_1000C8080((char *)&self->mEnd, 16, v5);
  return sub_1000C8080((char *)&self->mBaseNaturalSize, 16, v6);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CRLTransformGradientFill;
  [(CRLGradientFill *)&v2 dealloc];
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  unint64_t v5 = [(CRLGradientFill *)self gradientType];
  [(CRLGradientFill *)self opacity];
  uint64_t v7 = v6;
  objc_super v8 = NSStringFromCGPoint(self->mStart);
  BOOL v9 = NSStringFromCGPoint(self->mEnd);
  return +[NSString stringWithFormat:@"%@<%p>: type=%tu opacity=%f start=%@ end=%@ \n\tstops=%@ \n\tbase size=%@", v4, self, v5, v7, v8, v9, [(CRLGradientFill *)self gradientStops], NSStringFromCGSize(self->mBaseNaturalSize)];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    uint64_t v21 = v3;
    uint64_t v22 = v4;
    uint64_t v7 = objc_opt_class();
    id v8 = sub_1002469D0(v7, a3);
    if (v8)
    {
      BOOL v9 = v8;
      v20.receiver = self;
      v20.super_class = (Class)CRLTransformGradientFill;
      LODWORD(v8) = [(CRLGradientFill *)&v20 isEqual:a3];
      if (v8)
      {
        [v9 startPoint];
        BOOL v12 = self->mStart.x == v11 && self->mStart.y == v10;
        if (v12 && (([v9 endPoint], self->mEnd.x == v14) ? (BOOL v15 = self->mEnd.y == v13) : (BOOL v15 = 0), v15))
        {
          p_mBaseNaturalSize = &self->mBaseNaturalSize;
          [v9 baseNaturalSize];
          LOBYTE(v8) = p_mBaseNaturalSize->height == v18 && p_mBaseNaturalSize->width == v17;
        }
        else
        {
          LOBYTE(v8) = 0;
        }
      }
    }
  }
  return (char)v8;
}

- (BOOL)isEqualIgnoringTransform:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    uint64_t v15 = v3;
    uint64_t v16 = v4;
    uint64_t v7 = objc_opt_class();
    id v8 = sub_1002469D0(v7, a3);
    if (v8)
    {
      BOOL v9 = v8;
      v14.receiver = self;
      v14.super_class = (Class)CRLTransformGradientFill;
      LODWORD(v8) = [(CRLGradientFill *)&v14 isEqual:a3];
      if (v8)
      {
        p_mBaseNaturalSize = &self->mBaseNaturalSize;
        [v9 baseNaturalSize];
        LOBYTE(v8) = p_mBaseNaturalSize->height == v12 && p_mBaseNaturalSize->width == v11;
      }
    }
  }
  return (char)v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[CRLMutableTransformGradientFill allocWithZone:a3];
  unint64_t v5 = [(CRLGradientFill *)self gradientStops];
  unint64_t v6 = [(CRLGradientFill *)self gradientType];
  [(CRLGradientFill *)self opacity];
  uint64_t v7 = -[CRLGradientFill initWithGradientStops:type:opacity:](v4, "initWithGradientStops:type:opacity:", v5, v6);
  [(CRLGradientFill *)v7 i_setAdvancedGradientFlag:[(CRLGradientFill *)self i_advancedGradientFlag]];
  [(CRLTransformGradientFill *)self startPoint];
  -[CRLMutableTransformGradientFill setStartPoint:](v7, "setStartPoint:");
  [(CRLTransformGradientFill *)self endPoint];
  -[CRLMutableTransformGradientFill setEndPoint:](v7, "setEndPoint:");
  [(CRLTransformGradientFill *)self baseNaturalSize];
  -[CRLMutableTransformGradientFill setBaseNaturalSize:](v7, "setBaseNaturalSize:");
  return v7;
}

- (BOOL)isAdvancedGradientIgnoringFlag
{
  return 1;
}

- (CGPoint)normalizedPointForSize:(CGSize)a3 endPoint:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  [(CRLTransformGradientFill *)self startPoint];
  double v46 = v9;
  double v47 = v8;
  [(CRLTransformGradientFill *)self endPoint];
  double v50 = v11;
  double v51 = v10;
  if ([(CRLGradientFill *)self gradientType])
  {
    if (self)
    {
      -[CRLTransformGradientFill transformForSize:](self, "transformForSize:", width, height);
      float64x2_t v12 = v55;
      float64x2_t v13 = v56;
      float64x2_t v14 = v57;
    }
    else
    {
      float64x2_t v14 = 0uLL;
      float64x2_t v12 = 0uLL;
      float64x2_t v13 = 0uLL;
    }
    float64x2_t v42 = vaddq_f64(v14, vmlaq_n_f64(vmulq_n_f64(v13, v46), v12, v47));
    if (self)
    {
      float64x2_t v49 = v42;
      -[CRLTransformGradientFill transformForSize:](self, "transformForSize:", width, height);
      float64x2_t v42 = v49;
      float64x2_t v43 = v52;
      float64x2_t v44 = v53;
      float64x2_t v45 = v54;
    }
    else
    {
      float64x2_t v45 = 0uLL;
      float64x2_t v43 = 0uLL;
      float64x2_t v44 = 0uLL;
    }
    double v38 = v42.f64[1];
    float64x2_t v40 = vaddq_f64(v45, vmlaq_n_f64(vmulq_n_f64(v44, v50), v43, v51));
    double v41 = v40.f64[1];
  }
  else
  {
    long long v15 = 0uLL;
    memset(&v60, 0, sizeof(v60));
    if (self)
    {
      -[CRLTransformGradientFill transformForSize:](self, "transformForSize:", width, height);
      long long v15 = 0uLL;
    }
    *(_OWORD *)&v59.c = v15;
    *(_OWORD *)&v59.tCGFloat x = v15;
    *(_OWORD *)&v59.a = v15;
    CGAffineTransform v58 = v60;
    CGAffineTransformInvert(&v59, &v58);
    double v16 = sub_100064680(v51, v50, v47);
    CGAffineTransform v58 = v59;
    double v18 = sub_1000664E0((float64x2_t *)&v58, v16, v17);
    double v19 = v60.tx + v46 * v60.c + v60.a * v47;
    double v20 = v60.ty + v46 * v60.d + v60.b * v47;
    double v21 = v60.tx + v50 * v60.c + v60.a * v51;
    double v22 = v60.ty + v50 * v60.d + v60.b * v51;
    double v24 = sub_100064660(v18, v23);
    double v26 = v25;
    double v27 = sub_100064680(v21, v22, v19);
    double v29 = sub_10006468C(v24, v26, v27, v28);
    double v30 = sub_1000646A4(v24, v26, v29);
    double v32 = v31;
    double v33 = sub_100065E00(v19, v20, v21, v22, 0.5);
    double v35 = v34;
    double v36 = sub_1000646A4(v30, v32, -0.5);
    double v48 = sub_100064698(v33, v35, v36);
    double v38 = v37;
    double v39 = sub_1000646A4(v30, v32, 0.5);
    v40.f64[0] = sub_100064698(v33, v35, v39);
    v42.f64[0] = v48;
  }
  if (!v4)
  {
    v40.f64[0] = v42.f64[0];
    double v41 = v38;
  }
  result.CGFloat x = v40.f64[0];
  result.CGFloat y = v41;
  return result;
}

- (void)p_setStartPoint:(CGPoint)a3
{
  self->mStart = a3;
}

- (void)p_setEndPoint:(CGPoint)a3
{
  self->mEnd = a3;
}

- (void)p_setBaseNaturalSize:(CGSize)a3
{
  if (a3.height <= 0.0) {
    a3.double height = 1.0;
  }
  if (a3.width <= 0.0) {
    a3.double width = 1.0;
  }
  self->mBaseNaturalSize = a3;
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = [(CRLGradientFill *)self shadingRef];
  CGContextSaveGState(a4);
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  CGContextClipToRect(a4, v16);
  if ([(CRLGradientFill *)self gradientType])
  {
    if (self) {
      -[CRLGradientFill centeredRadialTransformInRect:](self, "centeredRadialTransformInRect:", x, y, width, height);
    }
    else {
      memset(&v15, 0, sizeof(v15));
    }
    CGContextConcatCTM(a4, &v15);
  }
  else
  {
    v17.origin.double x = x;
    v17.origin.double y = y;
    v17.size.double width = width;
    v17.size.double height = height;
    CGFloat MidX = CGRectGetMidX(v17);
    v18.origin.double x = x;
    v18.origin.double y = y;
    v18.size.double width = width;
    v18.size.double height = height;
    CGFloat MinY = CGRectGetMinY(v18);
    CGContextTranslateCTM(a4, MidX, MinY);
    v19.origin.double x = x;
    v19.origin.double y = y;
    v19.size.double width = width;
    v19.size.double height = height;
    CGFloat v13 = CGRectGetWidth(v19) / 200.0;
    v20.origin.double x = x;
    v20.origin.double y = y;
    v20.size.double width = width;
    v20.size.double height = height;
    CGFloat v14 = CGRectGetHeight(v20);
    CGContextScaleCTM(a4, v13, v14 / 100.0);
  }
  -[CRLGradientFill p_setAlpha:](self, "p_setAlpha:", a4, *(_OWORD *)&v15.a, *(_OWORD *)&v15.c, *(_OWORD *)&v15.tx);
  CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
  CGContextDrawShading(a4, v10);
  CGContextRestoreGState(a4);
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  BoundingBodouble x = CGPathGetBoundingBox(a3);

  -[CRLTransformGradientFill paintPath:naturalBounds:inContext:isPDF:](self, "paintPath:naturalBounds:inContext:isPDF:", a3, a4, 0, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height);
}

- (void)paintPath:(CGPath *)a3 naturalBounds:(CGRect)a4 inContext:(CGContext *)a5 isPDF:(BOOL)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGContextSaveGState(a5);
  CGContextAddPath(a5, a3);
  CGContextClip(a5);
  CGContextTranslateCTM(a5, x, y);
  if ((a6 || sub_1004583EC((uint64_t)a5)) && [(CRLGradientFill *)self hasAlpha]
    || sub_100458174((uint64_t)a5))
  {
    CGSize size = CGRectZero.size;
    CGPoint origin = CGRectZero.origin;
    CGSize v17 = size;
    CGAffineTransform v15 = [(CRLGradientFill *)self p_beginBitmapWrapperContextInContext:a5 returningIntegralBounds:&origin];
    if (v15) {
      -[CRLTransformGradientFill p_drawQuartzShadingInContext:withGradientNaturalSize:baseNaturalSize:start:end:](self, "p_drawQuartzShadingInContext:withGradientNaturalSize:baseNaturalSize:start:end:", v15, width, height, self->mBaseNaturalSize.width, self->mBaseNaturalSize.height, self->mStart.x, self->mStart.y, self->mEnd.x, self->mEnd.y);
    }
    -[CRLGradientFill p_endBitmapWrapperContext:inContext:withIntegralBounds:](self, "p_endBitmapWrapperContext:inContext:withIntegralBounds:", v15, a5, origin, v17);
  }
  else
  {
    -[CRLTransformGradientFill p_drawQuartzShadingInContext:withGradientNaturalSize:baseNaturalSize:start:end:](self, "p_drawQuartzShadingInContext:withGradientNaturalSize:baseNaturalSize:start:end:", a5, width, height, self->mBaseNaturalSize.width, self->mBaseNaturalSize.height, self->mStart.x, self->mStart.y, self->mEnd.x, self->mEnd.y);
  }
  CGContextRestoreGState(a5);
}

- (CGAffineTransform)transformForSize:(SEL)a3
{
  return CGAffineTransformMakeScale(retstr, a4.width / self->mBaseNaturalSize.width, a4.height / self->mBaseNaturalSize.height);
}

- (CGPoint)startPointForPath:(id)a3 andBounds:(CGRect)a4
{
  -[CRLTransformGradientFill normalizedPointForSize:endPoint:](self, "normalizedPointForSize:endPoint:", 0, a4.size.width, a4.size.height);
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (CGPoint)endPointForPath:(id)a3 andBounds:(CGRect)a4
{
  -[CRLTransformGradientFill normalizedPointForSize:endPoint:](self, "normalizedPointForSize:endPoint:", 1, a4.size.width, a4.size.height);
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (CGSize)baseNaturalSizeForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  if ([(CRLGradientFill *)self gradientType])
  {
    [(CRLTransformGradientFill *)self baseNaturalSize];
    CGFloat width = v6;
    CGFloat height = v7;
  }
  double v8 = width;
  double v9 = height;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (double)gradientAngleInDegrees
{
  double v2 = sub_100065C1C(self->mEnd.x - self->mStart.x, self->mStart.y - self->mEnd.y) * 57.2957795;

  sub_100065C2C(v2);
  return result;
}

- (void)p_setDefaultValues
{
  p_mStart = &self->mStart;
  double v4 = sub_1000674F0(50.0, 50.0);
  p_mStart->CGFloat x = v4;
  p_mStart->CGFloat y = v5;
  double v6 = sub_100064698(v4, v5, 0.0);
  self->mEnd.CGFloat x = sub_1000674F0(v6, v7);
  self->mEnd.CGFloat y = v8;
  self->mBaseNaturalSize = (CGSize)vdupq_n_s64(0x4059000000000000uLL);
}

- (CGPoint)p_scalePoint:(CGPoint)a3 toShapeWithNaturalSize:(CGSize)a4
{
  double v4 = a3.x * a4.width / self->mBaseNaturalSize.width;
  double v5 = a3.y * a4.height / self->mBaseNaturalSize.height;
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (CGPoint)p_scalePoint:(CGPoint)a3 fromShapeWithNaturalSize:(CGSize)a4
{
  double v4 = a3.x * self->mBaseNaturalSize.width / a4.width;
  double v5 = a3.y * self->mBaseNaturalSize.height / a4.height;
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (void)p_drawQuartzShadingInContext:(CGContext *)a3 withGradientNaturalSize:(CGSize)a4 baseNaturalSize:(CGSize)a5 start:(CGPoint)a6 end:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  CGFloat v9 = a6.y;
  CGFloat v10 = a6.x;
  if (self) {
    -[CRLTransformGradientFill transformForSize:](self, "transformForSize:", a4.width, a4.height, a5.width, a5.height);
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  CGContextConcatCTM(a3, &v17);
  CGContextTranslateCTM(a3, v10, v9);
  double v13 = sub_100064680(x, y, v10);
  double v15 = sub_100065C1C(v13, v14);
  CGContextRotateCTM(a3, v15);
  double v16 = sub_1000653B4(v10, v9, x, y);
  CGContextScaleCTM(a3, v16 / 100.0, v16 / 100.0);
  [(CRLGradientFill *)self p_setAlpha:a3];
  CGContextSetInterpolationQuality(a3, kCGInterpolationHigh);
  CGContextDrawShading(a3, [(CRLGradientFill *)self shadingRef]);
}

- (CGPoint)startPoint
{
  double x = self->mStart.x;
  double y = self->mStart.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)endPoint
{
  double x = self->mEnd.x;
  double y = self->mEnd.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)baseNaturalSize
{
  double width = self->mBaseNaturalSize.width;
  double height = self->mBaseNaturalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end