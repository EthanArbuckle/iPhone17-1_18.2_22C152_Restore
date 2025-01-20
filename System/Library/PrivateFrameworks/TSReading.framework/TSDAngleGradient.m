@interface TSDAngleGradient
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)p_shadingTransformForBounds:(SEL)a3;
- (CGPoint)endPointForPath:(id)a3 andBounds:(CGRect)a4;
- (CGPoint)startPointForPath:(id)a3 andBounds:(CGRect)a4;
- (TSDAngleGradient)initWithGradientStops:(id)a3 type:(unint64_t)a4 opacity:(double)a5 angle:(double)a6;
- (TSDAngleGradient)initWithStartColor:(id)a3 endColor:(id)a4 type:(unint64_t)a5 angle:(double)a6;
- (double)gradientAngle;
- (double)gradientAngleInDegrees;
- (double)p_bestGradientLengthForRect:(CGRect)a3 atAngle:(double)a4;
- (id)description;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)hash;
- (void)p_paintPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)paintPath:(CGPath *)a3 naturalBounds:(CGRect)a4 inContext:(CGContext *)a5 isPDF:(BOOL)a6;
- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4 atAngle:(double)a5;
- (void)setFirstColor:(id)a3;
- (void)setGradientAngle:(double)a3;
- (void)setLastColor:(id)a3;
@end

@implementation TSDAngleGradient

- (void)setFirstColor:(id)a3
{
}

- (void)setLastColor:(id)a3
{
  NSUInteger v5 = [(NSArray *)[(TSDGradient *)self gradientStops] count] - 1;

  [(TSDAngleGradient *)self setColorOfStopAtIndex:v5 toColor:a3];
}

- (TSDAngleGradient)initWithGradientStops:(id)a3 type:(unint64_t)a4 opacity:(double)a5 angle:(double)a6
{
  v8.receiver = self;
  v8.super_class = (Class)TSDAngleGradient;
  result = [(TSDGradient *)&v8 initWithGradientStops:a3 type:a4 opacity:a5];
  if (result) {
    result->mAngle = a6;
  }
  return result;
}

- (TSDAngleGradient)initWithStartColor:(id)a3 endColor:(id)a4 type:(unint64_t)a5 angle:(double)a6
{
  v8.receiver = self;
  v8.super_class = (Class)TSDAngleGradient;
  result = [(TSDGradient *)&v8 initWithStartColor:a3 endColor:a4 type:a5];
  if (result) {
    result->mAngle = a6;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(TSDGradient *)self gradientType];
  [(TSDGradient *)self opacity];
  return (id)[v3 stringWithFormat:@"TSDAngleGradient<%p>: type=%lu opacity=%f angle=%f \n\tstops=%@", self, v4, v5, *(void *)&self->mAngle, -[TSDGradient gradientStops](self, "gradientStops")];
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)TSDAngleGradient;
  [(TSDGradient *)&v3 hash];
  return TSUHashWithSeed();
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    uint64_t v12 = v3;
    uint64_t v13 = v4;
    objc_opt_class();
    uint64_t v7 = TSUDynamicCast();
    if (v7)
    {
      objc_super v8 = (void *)v7;
      v11.receiver = self;
      v11.super_class = (Class)TSDAngleGradient;
      LODWORD(v7) = [(TSDGradient *)&v11 isEqual:a3];
      if (v7)
      {
        [v8 gradientAngle];
        LOBYTE(v7) = v9 == self->mAngle;
      }
    }
  }
  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[TSDMutableAngleGradient allocWithZone:a3];
  uint64_t v5 = [(TSDGradient *)self gradientStops];
  unint64_t v6 = [(TSDGradient *)self gradientType];
  [(TSDGradient *)self opacity];
  double v8 = v7;
  [(TSDAngleGradient *)self gradientAngle];
  v10 = [(TSDAngleGradient *)v4 initWithGradientStops:v5 type:v6 opacity:v8 angle:v9];
  [(TSDGradient *)v10 setIsAdvancedGradient:self->super.mIsAdvancedGradient];
  return v10;
}

- (double)gradientAngleInDegrees
{
  return self->mAngle * 57.2957795;
}

- (double)p_bestGradientLengthForRect:(CGRect)a3 atAngle:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = CGRectGetWidth(a3) * 0.5;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double v9 = CGRectGetHeight(v23) * 0.5;
  double v18 = *(double *)(MEMORY[0x263F00148] + 8);
  double v19 = *MEMORY[0x263F00148];
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double v10 = CGRectGetWidth(v24);
  memset(&v22, 0, sizeof(v22));
  long long v11 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v21.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v21.c = v11;
  *(_OWORD *)&v21.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  CGAffineTransformTranslate(&v22, &v21, v8, v9);
  CGAffineTransform v20 = v22;
  CGAffineTransformRotate(&v21, &v20, -a4);
  CGAffineTransform v22 = v21;
  CGAffineTransform v20 = v21;
  CGAffineTransformTranslate(&v21, &v20, -v8, -v9);
  CGAffineTransform v22 = v21;
  double v12 = v21.tx + v18 * v21.c + v21.a * v19;
  double v13 = v21.ty + v18 * v21.d + v21.b * v19;
  if (v13 != v9)
  {
    double v14 = v21.ty + v21.d * 0.0 + v21.b * v10;
    if (v14 == v9)
    {
      double v12 = v21.tx + v21.c * 0.0 + v21.a * v10;
      double v13 = v21.ty + v21.d * 0.0 + v21.b * v10;
    }
    else
    {
      if (vabdd_f64(v13, v9) >= vabdd_f64(v14, v9)) {
        double v15 = v21.tx + v21.c * 0.0 + v21.a * v10;
      }
      else {
        double v15 = v21.tx + v18 * v21.c + v21.a * v19;
      }
      double v12 = v8;
      double v13 = v9;
      double v8 = v15;
    }
  }
  return TSDDistance(v12, v13, v8, v9);
}

- (CGPoint)startPointForPath:(id)a3 andBounds:(CGRect)a4
{
  objc_msgSend(a3, "bounds", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (self)
  {
    -[TSDAngleGradient p_shadingTransformForBounds:](self, "p_shadingTransformForBounds:");
    float64x2_t v5 = 0u;
    float64x2_t v6 = 0u;
    float64x2_t v7 = 0u;
  }
  else
  {
    float64x2_t v7 = 0uLL;
    float64x2_t v5 = 0uLL;
    float64x2_t v6 = 0uLL;
  }
  float64x2_t v8 = vaddq_f64(v7, vmlaq_n_f64(vmulq_n_f64(v6, *(double *)(MEMORY[0x263F00148] + 8)), v5, *MEMORY[0x263F00148]));
  double v9 = v8.f64[1];
  result.CGFloat x = v8.f64[0];
  result.CGFloat y = v9;
  return result;
}

- (CGPoint)endPointForPath:(id)a3 andBounds:(CGRect)a4
{
  objc_msgSend(a3, "bounds", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (self)
  {
    -[TSDAngleGradient p_shadingTransformForBounds:](self, "p_shadingTransformForBounds:");
    float64x2_t v5 = 0u;
    float64x2_t v6 = 0u;
    float64x2_t v7 = vmulq_f64((float64x2_t)0, (float64x2_t)0);
  }
  else
  {
    float64x2_t v6 = 0uLL;
    float64x2_t v5 = 0uLL;
    float64x2_t v7 = 0uLL;
  }
  float64x2_t v8 = vaddq_f64(v6, vmlaq_f64(v7, (float64x2_t)vdupq_n_s64(0x4059000000000000uLL), v5));
  double v9 = v8.f64[1];
  result.CGFloat x = v8.f64[0];
  result.CGFloat y = v9;
  return result;
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4 atAngle:(double)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v12 = [(TSDGradient *)self shadingRef];
  CGContextSaveGState(a4);
  v30.origin.double x = x;
  v30.origin.double y = y;
  v30.size.double width = width;
  v30.size.double height = height;
  CGContextClipToRect(a4, v30);
  if ([(TSDGradient *)self gradientType])
  {
    if (self) {
      -[TSDGradient centeredRadialTransformInRect:](self, "centeredRadialTransformInRect:", x, y, width, height);
    }
    else {
      memset(&v25, 0, sizeof(v25));
    }
    CGContextConcatCTM(a4, &v25);
  }
  else
  {
    -[TSDAngleGradient p_bestGradientLengthForRect:atAngle:](self, "p_bestGradientLengthForRect:atAngle:", x, y, width, height, -a5);
    double v14 = v13;
    double v28 = 0.0;
    double v29 = 0.0;
    double v26 = 0.0;
    double v27 = 0.0;
    TSDOriginRotate(&v26, v13, -a5);
    TSDOriginRotate(&v28, v14, 3.14159265 - a5);
    double v15 = TSDCenterOfRect(x, y, width, height);
    double v17 = v16;
    double v18 = TSDAddPoints(v15, v16, v26);
    double v20 = v19;
    double v26 = v18;
    double v27 = v19;
    double v21 = TSDAddPoints(v15, v17, v28);
    CGFloat v23 = v22;
    double v28 = v21;
    double v29 = v22;
    double v24 = TSDDistance(v21, v22, v18, v20);
    CGContextTranslateCTM(a4, v21, v23);
    CGContextRotateCTM(a4, -a5);
    CGContextScaleCTM(a4, v24 / 100.0, v24 / 100.0);
  }
  -[TSDGradient p_setAlpha:](self, "p_setAlpha:", a4, *(_OWORD *)&v25.a, *(_OWORD *)&v25.c, *(_OWORD *)&v25.tx);
  CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
  CGContextDrawShading(a4, v12);
  CGContextRestoreGState(a4);
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
}

- (void)paintPath:(CGPath *)a3 naturalBounds:(CGRect)a4 inContext:(CGContext *)a5 isPDF:(BOOL)a6
{
  CGContextSaveGState(a5);
  CGContextAddPath(a5, a3);
  CGContextClip(a5);
  if ((a6 || TSDCGContextIsPDFContext((uint64_t)a5)) && [(TSDGradient *)self hasAlpha]
    || TSDCGContextIsPrintContext((uint64_t)a5))
  {
    long long v10 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    long long v12 = *MEMORY[0x263F001A8];
    long long v13 = v10;
    long long v11 = [(TSDGradient *)self p_beginBitmapWrapperContextInContext:a5 returningIntegralBounds:&v12];
    if (v11) {
      [(TSDAngleGradient *)self p_paintPath:a3 inContext:v11];
    }
    -[TSDGradient p_endBitmapWrapperContext:inContext:withIntegralBounds:](self, "p_endBitmapWrapperContext:inContext:withIntegralBounds:", v11, a5, v12, v13);
  }
  else
  {
    [(TSDAngleGradient *)self p_paintPath:a3 inContext:a5];
  }
  CGContextRestoreGState(a5);
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
}

- (CGAffineTransform)p_shadingTransformForBounds:(SEL)a3
{
  CGRect v67 = CGRectInset(a4, -1.0, -1.0);
  CGFloat x = v67.origin.x;
  CGFloat y = v67.origin.y;
  CGFloat width = v67.size.width;
  CGFloat height = v67.size.height;
  uint64_t v10 = MEMORY[0x263F000D0];
  long long v61 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v62 = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v61;
  long long v60 = *(_OWORD *)(v10 + 32);
  *(_OWORD *)&retstr->tCGFloat x = v60;
  unint64_t mType = self->super.mType;
  CGFloat MidX = CGRectGetMidX(v67);
  v68.origin.CGFloat x = x;
  v68.origin.CGFloat y = y;
  v68.size.CGFloat width = width;
  v68.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v68);
  if (mType)
  {
    v69.origin.CGFloat x = x;
    v69.origin.CGFloat y = y;
    v69.size.CGFloat width = width;
    v69.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v69);
    v70.origin.CGFloat x = x;
    v70.origin.CGFloat y = y;
    v70.size.CGFloat width = width;
    v70.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v70);
    TSDTransformMakeFree(0, (uint64_t)&v66, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 100.0, 0.0, MidX, MidY, MaxX, MaxY);
    long long v16 = *(_OWORD *)&v66.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
    *(_OWORD *)&retstr->c = v16;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v66.tx;
    double v17 = TSDMixPoints(MidX, MidY, MaxX, MaxY, 0.5);
    double v19 = v18;
    memset(&v66, 0, sizeof(v66));
    CGAffineTransformMakeRotation(&v66, 5.49778714 - self->mAngle);
    double v20 = TSDMultiplyPointScalar(v17, v19, -1.0);
    CGAffineTransform t2 = v66;
    TSDTransformConvertForNewOrigin(&t2, &t1, v20, v21);
    long long v22 = *(_OWORD *)&t1.c;
    CGAffineTransform v66 = t1;
    long long v23 = *(_OWORD *)&t1.a;
    long long v24 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v24;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
    *(_OWORD *)&t2.a = v23;
    *(_OWORD *)&t2.c = v22;
    *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&v66.tx;
    return CGAffineTransformConcat(retstr, &t1, &t2);
  }
  else
  {
    *(_OWORD *)&v66.a = v62;
    *(_OWORD *)&v66.c = v61;
    *(_OWORD *)&v66.tCGFloat x = v60;
    CGAffineTransformTranslate(retstr, &v66, MidX, MidY);
    double mAngle = self->mAngle;
    long long v27 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v27;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
    CGAffineTransformRotate(&v66, &t1, mAngle);
    long long v28 = *(_OWORD *)&v66.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
    *(_OWORD *)&retstr->c = v28;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v66.tx;
    CGFloat v29 = x;
    *(CGFloat *)&long long v28 = y;
    CGFloat v30 = width;
    CGFloat v31 = height;
    CGFloat v32 = -CGRectGetMidX(*(CGRect *)((char *)&v28 - 8));
    v71.origin.CGFloat x = x;
    v71.origin.CGFloat y = y;
    v71.size.CGFloat width = width;
    v71.size.CGFloat height = height;
    CGFloat v33 = CGRectGetMidY(v71);
    long long v34 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v34;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v66, &t1, v32, -v33);
    long long v35 = *(_OWORD *)&v66.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
    *(_OWORD *)&retstr->c = v35;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v66.tx;
    long long v36 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v66.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v66.c = v36;
    *(_OWORD *)&v66.tCGFloat x = *(_OWORD *)&retstr->tx;
    CGFloat v37 = x;
    *(CGFloat *)&long long v36 = y;
    CGFloat v38 = width;
    CGFloat v39 = height;
    CGRect v72 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v36 - 8), &v66);
    CGFloat v40 = v72.origin.x;
    CGFloat v41 = v72.origin.y;
    CGFloat v42 = v72.size.width;
    CGFloat v43 = v72.size.height;
    *(_OWORD *)&retstr->a = v62;
    *(_OWORD *)&retstr->c = v61;
    *(_OWORD *)&retstr->tCGFloat x = v60;
    CGFloat v44 = CGRectGetMidX(v72);
    v73.origin.CGFloat x = v40;
    v73.origin.CGFloat y = v41;
    v73.size.CGFloat width = v42;
    v73.size.CGFloat height = v43;
    CGFloat v45 = CGRectGetMidY(v73);
    long long v46 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v46;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v66, &t1, v44, v45);
    long long v47 = *(_OWORD *)&v66.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
    *(_OWORD *)&retstr->c = v47;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v66.tx;
    CGFloat v48 = -self->mAngle;
    long long v49 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v49;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
    CGAffineTransformRotate(&v66, &t1, v48);
    long long v50 = *(_OWORD *)&v66.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
    *(_OWORD *)&retstr->c = v50;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v66.tx;
    CGFloat v51 = v40;
    *(CGFloat *)&long long v50 = v41;
    CGFloat v52 = v42;
    CGFloat v53 = v43;
    CGFloat v54 = CGRectGetWidth(*(CGRect *)((char *)&v50 - 8)) / 100.0;
    v74.origin.CGFloat x = v40;
    v74.origin.CGFloat y = v41;
    v74.size.CGFloat width = v42;
    v74.size.CGFloat height = v43;
    CGFloat v55 = CGRectGetHeight(v74);
    long long v56 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v56;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v66, &t1, v54, v55 / 100.0);
    long long v57 = *(_OWORD *)&v66.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
    *(_OWORD *)&retstr->c = v57;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v66.tx;
    CGAffineTransformMakeTranslation(&v64, -50.0, 0.0);
    long long v58 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v58;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
    CGPoint result = CGAffineTransformConcat(&v66, &v64, &t1);
    long long v59 = *(_OWORD *)&v66.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
    *(_OWORD *)&retstr->c = v59;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v66.tx;
  }
  return result;
}

- (void)p_paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  memset(&v8, 0, sizeof(v8));
  PathBoundingBoCGFloat x = CGPathGetPathBoundingBox(a3);
  if (self) {
    -[TSDAngleGradient p_shadingTransformForBounds:](self, "p_shadingTransformForBounds:", PathBoundingBox.origin.x, PathBoundingBox.origin.y, PathBoundingBox.size.width, PathBoundingBox.size.height);
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  CGAffineTransform v7 = v8;
  CGContextConcatCTM(a4, &v7);
  CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
  float64x2_t v6 = [(TSDGradient *)self shadingRef];
  CGShadingRetain(v6);
  [(TSDGradient *)self p_setAlpha:a4];
  CGContextDrawShading(a4, v6);
  CGShadingRelease(v6);
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__TSDAngleGradient_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __41__TSDAngleGradient_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDAngleGradient mixingTypeWithObject:]_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGradient.m"), 1216, @"nil object after cast");
  }
  uint64_t v5 = [*(id *)(a1 + 40) gradientType];
  if (v5 != [v2 gradientType]) {
    return 1;
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count");
  if (v6 != objc_msgSend((id)objc_msgSend(v2, "gradientStops"), "count")) {
    return 2;
  }
  [*(id *)(a1 + 40) gradientAngle];
  double v8 = v7;
  [v2 gradientAngle];
  if (v8 == v9) {
    return 4;
  }
  else {
    return 3;
  }
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__TSDAngleGradient_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDAngleGradient *__53__TSDAngleGradient_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
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
  [*(id *)(a1 + 40) opacity];
  double v6 = v5;
  [v2 opacity];
  double v8 = TSDMixFloats(v6, v7, *(double *)(a1 + 48));
  [*(id *)(a1 + 40) gradientAngle];
  double v10 = v9;
  [v2 gradientAngle];
  long long v12 = -[TSDAngleGradient initWithGradientStops:type:opacity:angle:]([TSDAngleGradient alloc], "initWithGradientStops:type:opacity:angle:", v3, [*(id *)(a1 + 40) gradientType], v8, TSDMixFloats(v10, v11, *(double *)(a1 + 48)));

  return v12;
}

- (double)gradientAngle
{
  return self->mAngle;
}

- (void)setGradientAngle:(double)a3
{
  self->double mAngle = a3;
}

@end