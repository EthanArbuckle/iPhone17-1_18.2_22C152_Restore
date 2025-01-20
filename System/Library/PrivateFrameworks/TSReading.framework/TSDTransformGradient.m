@interface TSDTransformGradient
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
- (TSDTransformGradient)initWithGradient:(id)a3 inPath:(id)a4 andBounds:(CGRect)a5;
- (TSDTransformGradient)initWithGradientStops:(id)a3 type:(unint64_t)a4;
- (TSDTransformGradient)initWithStartColor:(id)a3 endColor:(id)a4 type:(unint64_t)a5;
- (double)gradientAngleInDegrees;
- (id)description;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)p_drawQuartzShadingInContext:(CGContext *)a3 withGradientNaturalSize:(CGSize)a4 baseNaturalSize:(CGSize)a5 start:(CGPoint)a6 end:(CGPoint)a7;
- (void)p_setDefaultValues;
- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)paintPath:(CGPath *)a3 naturalBounds:(CGRect)a4 inContext:(CGContext *)a5 isPDF:(BOOL)a6;
- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)setBaseNaturalSize:(CGSize)a3;
- (void)setEndPoint:(CGPoint)a3;
- (void)setStartPoint:(CGPoint)a3;
@end

@implementation TSDTransformGradient

- (TSDTransformGradient)initWithStartColor:(id)a3 endColor:(id)a4 type:(unint64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)TSDTransformGradient;
  v5 = [(TSDGradient *)&v8 initWithStartColor:a3 endColor:a4 type:a5];
  v6 = v5;
  if (v5) {
    [(TSDTransformGradient *)v5 p_setDefaultValues];
  }
  return v6;
}

- (TSDTransformGradient)initWithGradientStops:(id)a3 type:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSDTransformGradient;
  v4 = [(TSDGradient *)&v7 initWithGradientStops:a3 type:a4];
  v5 = v4;
  if (v4) {
    [(TSDTransformGradient *)v4 p_setDefaultValues];
  }
  return v5;
}

- (TSDTransformGradient)initWithGradient:(id)a3 inPath:(id)a4 andBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)TSDTransformGradient;
  v11 = -[TSDGradient initWithGradientStops:type:](&v20, sel_initWithGradientStops_type_, [a3 gradientStops], objc_msgSend(a3, "gradientType"));
  if (v11)
  {
    objc_opt_class();
    v12 = (void *)TSUDynamicCast();
    if (v12)
    {
      objc_msgSend(v12, "baseNaturalSizeForBounds:", x, y, width, height);
      double width = v13;
      double height = v14;
    }
    v11->mBaseNaturalSize.double width = width;
    v11->mBaseNaturalSize.double height = height;
    [a3 startPointForPath:a4 andBounds:TSDRectWithSize()];
    v11->mStart.double x = v15;
    v11->mStart.double y = v16;
    [a3 endPointForPath:a4 andBounds:TSDRectWithSize()];
    v11->mEnd.double x = v17;
    v11->mEnd.double y = v18;
  }
  return v11;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)TSDTransformGradient;
  [(TSDGradient *)&v3 hash];
  TSUHashWithSeed();
  TSUHashWithSeed();
  return TSUHashWithSeed();
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TSDTransformGradient;
  [(TSDGradient *)&v2 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  unint64_t v4 = [(TSDGradient *)self gradientType];
  [(TSDGradient *)self opacity];
  uint64_t v6 = v5;
  objc_super v7 = NSStringFromCGPoint(self->mStart);
  objc_super v8 = NSStringFromCGPoint(self->mEnd);
  return (id)[v3 stringWithFormat:@"TSDTransformGradient<%p>: type=%lu opacity=%f start=%@ end=%@ \n\tstops=%@ \n\tbase size=%@", self, v4, v6, v7, v8, -[TSDGradient gradientStops](self, "gradientStops"), NSStringFromCGSize(self->mBaseNaturalSize)];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    uint64_t v20 = v3;
    uint64_t v21 = v4;
    objc_opt_class();
    uint64_t v7 = TSUDynamicCast();
    if (v7)
    {
      objc_super v8 = (void *)v7;
      v19.receiver = self;
      v19.super_class = (Class)TSDTransformGradient;
      LODWORD(v7) = [(TSDGradient *)&v19 isEqual:a3];
      if (v7)
      {
        [v8 startPoint];
        BOOL v11 = self->mStart.x == v10 && self->mStart.y == v9;
        if (v11 && (([v8 endPoint], self->mEnd.x == v13) ? (BOOL v14 = self->mEnd.y == v12) : (BOOL v14 = 0), v14))
        {
          p_mBaseNaturalSize = &self->mBaseNaturalSize;
          [v8 baseNaturalSize];
          LOBYTE(v7) = p_mBaseNaturalSize->height == v17 && p_mBaseNaturalSize->width == v16;
        }
        else
        {
          LOBYTE(v7) = 0;
        }
      }
    }
  }
  return v7;
}

- (BOOL)isEqualIgnoringTransform:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    uint64_t v14 = v3;
    uint64_t v15 = v4;
    objc_opt_class();
    uint64_t v7 = TSUDynamicCast();
    if (v7)
    {
      objc_super v8 = (void *)v7;
      v13.receiver = self;
      v13.super_class = (Class)TSDTransformGradient;
      LODWORD(v7) = [(TSDGradient *)&v13 isEqual:a3];
      if (v7)
      {
        p_mBaseNaturalSize = &self->mBaseNaturalSize;
        [v8 baseNaturalSize];
        LOBYTE(v7) = p_mBaseNaturalSize->height == v11 && p_mBaseNaturalSize->width == v10;
      }
    }
  }
  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[TSDMutableTransformGradient allocWithZone:a3];
  uint64_t v5 = [(TSDGradient *)self gradientStops];
  unint64_t v6 = [(TSDGradient *)self gradientType];
  [(TSDGradient *)self opacity];
  uint64_t v7 = -[TSDGradient initWithGradientStops:type:opacity:](v4, "initWithGradientStops:type:opacity:", v5, v6);
  [(TSDGradient *)v7 setIsAdvancedGradient:self->super.mIsAdvancedGradient];
  [(TSDTransformGradient *)self startPoint];
  -[TSDTransformGradient setStartPoint:](v7, "setStartPoint:");
  [(TSDTransformGradient *)self endPoint];
  -[TSDTransformGradient setEndPoint:](v7, "setEndPoint:");
  [(TSDTransformGradient *)self baseNaturalSize];
  -[TSDTransformGradient setBaseNaturalSize:](v7, "setBaseNaturalSize:");
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
  [(TSDTransformGradient *)self startPoint];
  double v46 = v9;
  double v47 = v8;
  [(TSDTransformGradient *)self endPoint];
  double v50 = v11;
  double v51 = v10;
  if ([(TSDGradient *)self gradientType])
  {
    if (self)
    {
      -[TSDTransformGradient transformForSize:](self, "transformForSize:", width, height);
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
      -[TSDTransformGradient transformForSize:](self, "transformForSize:", width, height);
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
      -[TSDTransformGradient transformForSize:](self, "transformForSize:", width, height);
      long long v15 = 0uLL;
    }
    *(_OWORD *)&v59.c = v15;
    *(_OWORD *)&v59.tdouble x = v15;
    *(_OWORD *)&v59.a = v15;
    CGAffineTransform v58 = v60;
    CGAffineTransformInvert(&v59, &v58);
    double v16 = TSDSubtractPoints(v51, v50, v47);
    CGAffineTransform v58 = v59;
    double v18 = TSDDeltaApplyAffineTransform((float64x2_t *)&v58, v16, v17);
    double v19 = v60.tx + v46 * v60.c + v60.a * v47;
    double v20 = v60.ty + v46 * v60.d + v60.b * v47;
    double v21 = v60.tx + v50 * v60.c + v60.a * v51;
    double v22 = v60.ty + v50 * v60.d + v60.b * v51;
    double v24 = TSDNormalizePoint(v18, v23);
    double v26 = v25;
    double v27 = TSDSubtractPoints(v21, v22, v19);
    double v29 = TSDDotPoints(v24, v26, v27, v28);
    double v30 = TSDMultiplyPointScalar(v24, v26, v29);
    double v32 = v31;
    double v33 = TSDMixPoints(v19, v20, v21, v22, 0.5);
    double v35 = v34;
    double v36 = TSDMultiplyPointScalar(v30, v32, -0.5);
    double v48 = TSDAddPoints(v33, v35, v36);
    double v38 = v37;
    double v39 = TSDMultiplyPointScalar(v30, v32, 0.5);
    v40.f64[0] = TSDAddPoints(v33, v35, v39);
    v42.f64[0] = v48;
  }
  if (!v4)
  {
    v40.f64[0] = v42.f64[0];
    double v41 = v38;
  }
  result.double x = v40.f64[0];
  result.double y = v41;
  return result;
}

- (void)setBaseNaturalSize:(CGSize)a3
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
  double v10 = [(TSDGradient *)self shadingRef];
  CGContextSaveGState(a4);
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  CGContextClipToRect(a4, v16);
  if ([(TSDGradient *)self gradientType])
  {
    if (self) {
      -[TSDGradient centeredRadialTransformInRect:](self, "centeredRadialTransformInRect:", x, y, width, height);
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
  -[TSDGradient p_setAlpha:](self, "p_setAlpha:", a4, *(_OWORD *)&v15.a, *(_OWORD *)&v15.c, *(_OWORD *)&v15.tx);
  CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
  CGContextDrawShading(a4, v10);
  CGContextRestoreGState(a4);
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  BoundingBodouble x = CGPathGetBoundingBox(a3);

  -[TSDTransformGradient paintPath:naturalBounds:inContext:isPDF:](self, "paintPath:naturalBounds:inContext:isPDF:", a3, a4, 0, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height);
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
  if ((a6 || TSDCGContextIsPDFContext((uint64_t)a5)) && [(TSDGradient *)self hasAlpha]
    || TSDCGContextIsPrintContext((uint64_t)a5))
  {
    long long v14 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    long long v16 = *MEMORY[0x263F001A8];
    long long v17 = v14;
    CGAffineTransform v15 = [(TSDGradient *)self p_beginBitmapWrapperContextInContext:a5 returningIntegralBounds:&v16];
    if (v15) {
      -[TSDTransformGradient p_drawQuartzShadingInContext:withGradientNaturalSize:baseNaturalSize:start:end:](self, "p_drawQuartzShadingInContext:withGradientNaturalSize:baseNaturalSize:start:end:", v15, width, height, self->mBaseNaturalSize.width, self->mBaseNaturalSize.height, self->mStart.x, self->mStart.y, self->mEnd.x, self->mEnd.y);
    }
    -[TSDGradient p_endBitmapWrapperContext:inContext:withIntegralBounds:](self, "p_endBitmapWrapperContext:inContext:withIntegralBounds:", v15, a5, v16, v17);
  }
  else
  {
    -[TSDTransformGradient p_drawQuartzShadingInContext:withGradientNaturalSize:baseNaturalSize:start:end:](self, "p_drawQuartzShadingInContext:withGradientNaturalSize:baseNaturalSize:start:end:", a5, width, height, self->mBaseNaturalSize.width, self->mBaseNaturalSize.height, self->mStart.x, self->mStart.y, self->mEnd.x, self->mEnd.y);
  }
  CGContextRestoreGState(a5);
}

- (CGAffineTransform)transformForSize:(SEL)a3
{
  return CGAffineTransformMakeScale(retstr, a4.width / self->mBaseNaturalSize.width, a4.height / self->mBaseNaturalSize.height);
}

- (CGPoint)startPointForPath:(id)a3 andBounds:(CGRect)a4
{
  -[TSDTransformGradient normalizedPointForSize:endPoint:](self, "normalizedPointForSize:endPoint:", 0, a4.size.width, a4.size.height);
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (CGPoint)endPointForPath:(id)a3 andBounds:(CGRect)a4
{
  -[TSDTransformGradient normalizedPointForSize:endPoint:](self, "normalizedPointForSize:endPoint:", 1, a4.size.width, a4.size.height);
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (CGSize)baseNaturalSizeForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  if ([(TSDGradient *)self gradientType])
  {
    [(TSDTransformGradient *)self baseNaturalSize];
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
  double v2 = TSDAngleFromDelta(self->mEnd.x - self->mStart.x, self->mStart.y - self->mEnd.y) * 57.2957795;

  TSDNormalizeAngleInDegrees(v2);
  return result;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__TSDTransformGradient_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __45__TSDTransformGradient_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  double v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDTransformGradient mixingTypeWithObject:]_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGradient.m"), 1588, @"nil object after cast");
  }
  uint64_t v5 = [*(id *)(a1 + 40) gradientType];
  if (v5 != [v2 gradientType]) {
    return 1;
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count");
  if (v6 != objc_msgSend((id)objc_msgSend(v2, "gradientStops"), "count")) {
    return 2;
  }
  [*(id *)(a1 + 40) startPoint];
  double v8 = v7;
  double v10 = v9;
  [v2 startPoint];
  if (v8 != v12 || v10 != v11) {
    return 3;
  }
  [*(id *)(a1 + 40) endPoint];
  double v15 = v14;
  double v17 = v16;
  [v2 endPoint];
  BOOL v20 = v15 == v19 && v17 == v18;
  if (v20
    && ([*(id *)(a1 + 40) baseNaturalSize],
        double v22 = v21,
        double v24 = v23,
        [v2 baseNaturalSize],
        v22 == v26)
    && v24 == v25)
  {
    return 4;
  }
  else
  {
    return 3;
  }
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__TSDTransformGradient_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDMutableTransformGradient *__57__TSDTransformGradient_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  double v2 = (void *)TSUDynamicCast();
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count"));
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count"))
  {
    unint64_t v4 = 0;
    do
    {
      objc_msgSend(v3, "addObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "objectAtIndex:", v4), "mixedObjectWithFraction:ofObject:", objc_msgSend((id)objc_msgSend(v2, "gradientStops"), "objectAtIndex:", v4), *(double *)(a1 + 48)));
      ++v4;
    }
    while (v4 < objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count"));
  }
  uint64_t v5 = -[TSDTransformGradient initWithGradientStops:type:]([TSDMutableTransformGradient alloc], "initWithGradientStops:type:", v3, [*(id *)(a1 + 40) gradientType]);
  [*(id *)(a1 + 40) opacity];
  double v7 = v6;
  [v2 opacity];
  [(TSDGradient *)v5 setOpacity:TSDMixFloats(v7, v8, *(double *)(a1 + 48))];
  [*(id *)(a1 + 40) startPoint];
  double v10 = v9;
  double v12 = v11;
  [v2 startPoint];
  [(TSDTransformGradient *)v5 setStartPoint:TSDMixPoints(v10, v12, v13, v14, *(double *)(a1 + 48))];
  [*(id *)(a1 + 40) endPoint];
  double v16 = v15;
  double v18 = v17;
  [v2 endPoint];
  [(TSDTransformGradient *)v5 setEndPoint:TSDMixPoints(v16, v18, v19, v20, *(double *)(a1 + 48))];
  [*(id *)(a1 + 40) baseNaturalSize];
  double v22 = v21;
  double v24 = v23;
  [v2 baseNaturalSize];
  [(TSDTransformGradient *)v5 setBaseNaturalSize:TSDMixSizes(v22, v24, v25, v26, *(double *)(a1 + 48))];
  return v5;
}

- (void)p_setDefaultValues
{
  p_mStart = &self->mStart;
  double v4 = TSDRoundedPoint();
  p_mStart->CGFloat x = v4;
  p_mStart->CGFloat y = v5;
  TSDAddPoints(v4, v5, 0.0);
  self->mEnd.CGFloat x = TSDRoundedPoint();
  self->mEnd.CGFloat y = v6;
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
    -[TSDTransformGradient transformForSize:](self, "transformForSize:", a4.width, a4.height, a5.width, a5.height);
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  CGContextConcatCTM(a3, &v17);
  CGContextTranslateCTM(a3, v10, v9);
  double v13 = TSDSubtractPoints(x, y, v10);
  double v15 = TSDAngleFromDelta(v13, v14);
  CGContextRotateCTM(a3, v15);
  double v16 = TSDDistance(v10, v9, x, y);
  CGContextScaleCTM(a3, v16 / 100.0, v16 / 100.0);
  [(TSDGradient *)self p_setAlpha:a3];
  CGContextSetInterpolationQuality(a3, kCGInterpolationHigh);
  CGContextDrawShading(a3, [(TSDGradient *)self shadingRef]);
}

- (CGPoint)startPoint
{
  double x = self->mStart.x;
  double y = self->mStart.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartPoint:(CGPoint)a3
{
  self->mStart = a3;
}

- (CGPoint)endPoint
{
  double x = self->mEnd.x;
  double y = self->mEnd.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setEndPoint:(CGPoint)a3
{
  self->mEnd = a3;
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