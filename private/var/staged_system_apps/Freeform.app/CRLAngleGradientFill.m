@interface CRLAngleGradientFill
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)p_shadingTransformForBounds:(SEL)a3;
- (CGPoint)endPointForPath:(id)a3 andBounds:(CGRect)a4;
- (CGPoint)startPointForPath:(id)a3 andBounds:(CGRect)a4;
- (CRLAngleGradientFill)initWithGradientStops:(id)a3 type:(unint64_t)a4 opacity:(double)a5 angle:(double)a6;
- (CRLAngleGradientFill)initWithGradientStops:(id)a3 type:(unint64_t)a4 opacity:(double)a5 angle:(double)a6 isAdvancedGradient:(BOOL)a7;
- (CRLAngleGradientFill)initWithStartColor:(id)a3 endColor:(id)a4 type:(unint64_t)a5 angle:(double)a6;
- (double)gradientAngle;
- (double)gradientAngleInDegrees;
- (double)p_bestGradientLengthForRect:(CGRect)a3 atAngle:(double)a4;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)p_paintPath:(CGPath *)a3 inContext:(CGContext *)a4 naturalBounds:(CGRect)a5;
- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)paintPath:(CGPath *)a3 naturalBounds:(CGRect)a4 inContext:(CGContext *)a5 isPDF:(BOOL)a6;
- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4 atAngle:(double)a5;
- (void)setGradientAngle:(double)a3;
@end

@implementation CRLAngleGradientFill

- (CRLAngleGradientFill)initWithGradientStops:(id)a3 type:(unint64_t)a4 opacity:(double)a5 angle:(double)a6 isAdvancedGradient:(BOOL)a7
{
  BOOL v7 = a7;
  v12.receiver = self;
  v12.super_class = (Class)CRLAngleGradientFill;
  v9 = [(CRLGradientFill *)&v12 initWithGradientStops:a3 type:a4 opacity:a5];
  v10 = v9;
  if (v9)
  {
    v9->mAngle = a6;
    [(CRLGradientFill *)v9 p_setIsAdvancedGradient:v7];
  }
  return v10;
}

- (CRLAngleGradientFill)initWithGradientStops:(id)a3 type:(unint64_t)a4 opacity:(double)a5 angle:(double)a6
{
  return [(CRLAngleGradientFill *)self initWithGradientStops:a3 type:a4 opacity:0 angle:a5 isAdvancedGradient:a6];
}

- (CRLAngleGradientFill)initWithStartColor:(id)a3 endColor:(id)a4 type:(unint64_t)a5 angle:(double)a6
{
  v8.receiver = self;
  v8.super_class = (Class)CRLAngleGradientFill;
  result = [(CRLGradientFill *)&v8 initWithStartColor:a3 endColor:a4 type:a5];
  if (result) {
    result->mAngle = a6;
  }
  return result;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  unint64_t v5 = [(CRLGradientFill *)self gradientType];
  [(CRLGradientFill *)self opacity];
  return +[NSString stringWithFormat:@"%@<%p>: type=%tu opacity=%f angle=%f \n\tstops=%@", v4, self, v5, v6, *(void *)&self->mAngle, [(CRLGradientFill *)self gradientStops]];
}

- (unint64_t)hash
{
  p_mAngle = &self->mAngle;
  v5.receiver = self;
  v5.super_class = (Class)CRLAngleGradientFill;
  id v3 = [(CRLGradientFill *)&v5 hash];
  return sub_1000C8080((char *)p_mAngle, 8, (uint64_t)v3);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    uint64_t v14 = v3;
    uint64_t v15 = v4;
    uint64_t v7 = objc_opt_class();
    id v8 = sub_1002469D0(v7, a3);
    if (v8)
    {
      v9 = v8;
      v13.receiver = self;
      v13.super_class = (Class)CRLAngleGradientFill;
      LODWORD(v8) = [(CRLGradientFill *)&v13 isEqual:a3];
      if (v8)
      {
        [v9 gradientAngle];
        double mAngle = self->mAngle;
        LOBYTE(v8) = v10 == mAngle || vabdd_f64(v10, mAngle) < fabs(mAngle * 0.000000999999997);
      }
    }
  }
  return (char)v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[CRLMutableAngleGradientFill allocWithZone:a3];
  objc_super v5 = [(CRLGradientFill *)self gradientStops];
  unint64_t v6 = [(CRLGradientFill *)self gradientType];
  [(CRLGradientFill *)self opacity];
  double v8 = v7;
  [(CRLAngleGradientFill *)self gradientAngle];
  double v10 = [(CRLAngleGradientFill *)v4 initWithGradientStops:v5 type:v6 opacity:v8 angle:v9];
  [(CRLGradientFill *)v10 i_setAdvancedGradientFlag:[(CRLGradientFill *)self i_advancedGradientFlag]];
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
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double v9 = CGRectGetHeight(v22) * 0.5;
  double v18 = CGPointZero.y;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double v10 = CGRectGetWidth(v23);
  memset(&v21, 0, sizeof(v21));
  long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v20.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v20.c = v11;
  *(_OWORD *)&v20.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGAffineTransformTranslate(&v21, &v20, v8, v9);
  CGAffineTransform v19 = v21;
  CGAffineTransformRotate(&v20, &v19, -a4);
  CGAffineTransform v21 = v20;
  CGAffineTransform v19 = v20;
  CGAffineTransformTranslate(&v20, &v19, -v8, -v9);
  CGAffineTransform v21 = v20;
  double v12 = v20.tx + v18 * v20.c + v20.a * CGPointZero.x;
  double v13 = v20.ty + v18 * v20.d + v20.b * CGPointZero.x;
  if (v13 != v9)
  {
    double v14 = v20.ty + v20.d * 0.0 + v20.b * v10;
    if (v14 == v9)
    {
      double v12 = v20.tx + v20.c * 0.0 + v20.a * v10;
      double v13 = v20.ty + v20.d * 0.0 + v20.b * v10;
    }
    else
    {
      if (vabdd_f64(v13, v9) >= vabdd_f64(v14, v9)) {
        double v15 = v20.tx + v20.c * 0.0 + v20.a * v10;
      }
      else {
        double v15 = v20.tx + v18 * v20.c + v20.a * CGPointZero.x;
      }
      double v12 = v8;
      double v13 = v9;
      double v8 = v15;
    }
  }
  return sub_1000653B4(v12, v13, v8, v9);
}

- (CGPoint)startPointForPath:(id)a3 andBounds:(CGRect)a4
{
  [a3 bounds:a4.origin.x, a4.origin.y, a4.size.width, a4.size.height];
  if (self)
  {
    -[CRLAngleGradientFill p_shadingTransformForBounds:](self, "p_shadingTransformForBounds:");
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
  float64x2_t v8 = vaddq_f64(v7, vmlaq_n_f64(vmulq_n_f64(v6, CGPointZero.y), v5, CGPointZero.x));
  double v9 = v8.f64[1];
  result.CGFloat x = v8.f64[0];
  result.CGFloat y = v9;
  return result;
}

- (CGPoint)endPointForPath:(id)a3 andBounds:(CGRect)a4
{
  [a3 bounds:a4.origin.x, a4.origin.y, a4.size.width, a4.size.height];
  if (self)
  {
    -[CRLAngleGradientFill p_shadingTransformForBounds:](self, "p_shadingTransformForBounds:");
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
  double v12 = [(CRLGradientFill *)self shadingRef];
  CGContextSaveGState(a4);
  v30.origin.double x = x;
  v30.origin.double y = y;
  v30.size.double width = width;
  v30.size.double height = height;
  CGContextClipToRect(a4, v30);
  if ([(CRLGradientFill *)self gradientType])
  {
    if (self) {
      -[CRLGradientFill centeredRadialTransformInRect:](self, "centeredRadialTransformInRect:", x, y, width, height);
    }
    else {
      memset(&v25, 0, sizeof(v25));
    }
    CGContextConcatCTM(a4, &v25);
  }
  else
  {
    -[CRLAngleGradientFill p_bestGradientLengthForRect:atAngle:](self, "p_bestGradientLengthForRect:atAngle:", x, y, width, height, -a5);
    double v14 = v13;
    double v28 = 0.0;
    double v29 = 0.0;
    double v26 = 0.0;
    double v27 = 0.0;
    sub_100066270(&v26, v13, -a5);
    sub_100066270(&v28, v14, 3.14159265 - a5);
    double v15 = sub_100065738(x, y, width, height);
    double v17 = v16;
    double v18 = sub_100064698(v15, v16, v26);
    double v20 = v19;
    double v26 = v18;
    double v27 = v19;
    double v21 = sub_100064698(v15, v17, v28);
    CGFloat v23 = v22;
    double v28 = v21;
    double v29 = v22;
    double v24 = sub_1000653B4(v21, v22, v18, v20);
    CGContextTranslateCTM(a4, v21, v23);
    CGContextRotateCTM(a4, -a5);
    CGContextScaleCTM(a4, v24 / 100.0, v24 / 100.0);
  }
  -[CRLGradientFill p_setAlpha:](self, "p_setAlpha:", a4, *(_OWORD *)&v25.a, *(_OWORD *)&v25.c, *(_OWORD *)&v25.tx);
  CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
  CGContextDrawShading(a4, v12);
  CGContextRestoreGState(a4);
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
}

- (void)paintPath:(CGPath *)a3 naturalBounds:(CGRect)a4 inContext:(CGContext *)a5 isPDF:(BOOL)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGContextSaveGState(a5);
  CGContextAddPath(a5, a3);
  CGContextClip(a5);
  ClipBoundingBodouble x = CGContextGetClipBoundingBox(a5);
  double v14 = ClipBoundingBox.size.width;
  double v15 = ClipBoundingBox.size.height;
  if (sub_100065AF4(ClipBoundingBox.origin.x, ClipBoundingBox.origin.y, ClipBoundingBox.size.width, ClipBoundingBox.size.height)&& v15 > 0.0&& v14 > 0.0)
  {
    if ((a6 || sub_1004583EC((uint64_t)a5)) && [(CRLGradientFill *)self hasAlpha]
      || sub_100458174((uint64_t)a5))
    {
      CGSize size = CGRectZero.size;
      CGPoint origin = CGRectZero.origin;
      CGSize v19 = size;
      double v17 = [(CRLGradientFill *)self p_beginBitmapWrapperContextInContext:a5 returningIntegralBounds:&origin];
      if (v17) {
        -[CRLAngleGradientFill p_paintPath:inContext:naturalBounds:](self, "p_paintPath:inContext:naturalBounds:", a3, v17, x, y, width, height);
      }
      -[CRLGradientFill p_endBitmapWrapperContext:inContext:withIntegralBounds:](self, "p_endBitmapWrapperContext:inContext:withIntegralBounds:", v17, a5, origin, v19);
    }
    else
    {
      -[CRLAngleGradientFill p_paintPath:inContext:naturalBounds:](self, "p_paintPath:inContext:naturalBounds:", a3, a5, x, y, width, height);
    }
  }
  CGContextRestoreGState(a5);
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  PathBoundingBodouble x = CGPathGetPathBoundingBox(a3);

  -[CRLAngleGradientFill paintPath:naturalBounds:inContext:isPDF:](self, "paintPath:naturalBounds:inContext:isPDF:", a3, a4, 0, PathBoundingBox.origin.x, PathBoundingBox.origin.y, PathBoundingBox.size.width, PathBoundingBox.size.height);
}

- (CGAffineTransform)p_shadingTransformForBounds:(SEL)a3
{
  CGRect v66 = CGRectInset(a4, -1.0, -1.0);
  CGFloat x = v66.origin.x;
  CGFloat y = v66.origin.y;
  CGFloat width = v66.size.width;
  CGFloat height = v66.size.height;
  long long v60 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v61 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v60;
  long long v59 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tCGFloat x = v59;
  unint64_t v10 = [(CRLGradientFill *)self gradientType];
  v67.origin.CGFloat x = x;
  v67.origin.CGFloat y = y;
  v67.size.CGFloat width = width;
  v67.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v67);
  v68.origin.CGFloat x = x;
  v68.origin.CGFloat y = y;
  v68.size.CGFloat width = width;
  v68.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v68);
  if (v10)
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
    sub_10007FD8C(0, (uint64_t)&v65, CGPointZero.x, CGPointZero.y, 100.0, 0.0, MidX, MidY, MaxX, MaxY);
    long long v15 = *(_OWORD *)&v65.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v65.a;
    *(_OWORD *)&retstr->c = v15;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v65.tx;
    double v16 = sub_100065E00(MidX, MidY, MaxX, MaxY, 0.5);
    double v18 = v17;
    memset(&v65, 0, sizeof(v65));
    CGAffineTransformMakeRotation(&v65, 5.49778714 - self->mAngle);
    double v19 = sub_1000646A4(v16, v18, -1.0);
    CGAffineTransform t2 = v65;
    sub_10007FCC0(&t2, &t1, v19, v20);
    long long v21 = *(_OWORD *)&t1.c;
    CGAffineTransform v65 = t1;
    long long v22 = *(_OWORD *)&t1.a;
    long long v23 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v23;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
    *(_OWORD *)&t2.a = v22;
    *(_OWORD *)&t2.c = v21;
    *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&v65.tx;
    return CGAffineTransformConcat(retstr, &t1, &t2);
  }
  else
  {
    *(_OWORD *)&v65.a = v61;
    *(_OWORD *)&v65.c = v60;
    *(_OWORD *)&v65.tCGFloat x = v59;
    CGAffineTransformTranslate(retstr, &v65, MidX, MidY);
    double mAngle = self->mAngle;
    long long v26 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v26;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
    CGAffineTransformRotate(&v65, &t1, mAngle);
    long long v27 = *(_OWORD *)&v65.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v65.a;
    *(_OWORD *)&retstr->c = v27;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v65.tx;
    CGFloat v28 = x;
    *(CGFloat *)&long long v27 = y;
    CGFloat v29 = width;
    CGFloat v30 = height;
    CGFloat v31 = -CGRectGetMidX(*(CGRect *)((char *)&v27 - 8));
    v71.origin.CGFloat x = x;
    v71.origin.CGFloat y = y;
    v71.size.CGFloat width = width;
    v71.size.CGFloat height = height;
    CGFloat v32 = CGRectGetMidY(v71);
    long long v33 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v33;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v65, &t1, v31, -v32);
    long long v34 = *(_OWORD *)&v65.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v65.a;
    *(_OWORD *)&retstr->c = v34;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v65.tx;
    long long v35 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v65.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v65.c = v35;
    *(_OWORD *)&v65.tCGFloat x = *(_OWORD *)&retstr->tx;
    CGFloat v36 = x;
    *(CGFloat *)&long long v35 = y;
    CGFloat v37 = width;
    CGFloat v38 = height;
    CGRect v72 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v35 - 8), &v65);
    CGFloat v39 = v72.origin.x;
    CGFloat v40 = v72.origin.y;
    CGFloat v41 = v72.size.width;
    CGFloat v42 = v72.size.height;
    *(_OWORD *)&retstr->a = v61;
    *(_OWORD *)&retstr->c = v60;
    *(_OWORD *)&retstr->tCGFloat x = v59;
    CGFloat v43 = CGRectGetMidX(v72);
    v73.origin.CGFloat x = v39;
    v73.origin.CGFloat y = v40;
    v73.size.CGFloat width = v41;
    v73.size.CGFloat height = v42;
    CGFloat v44 = CGRectGetMidY(v73);
    long long v45 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v45;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v65, &t1, v43, v44);
    long long v46 = *(_OWORD *)&v65.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v65.a;
    *(_OWORD *)&retstr->c = v46;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v65.tx;
    CGFloat v47 = -self->mAngle;
    long long v48 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v48;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
    CGAffineTransformRotate(&v65, &t1, v47);
    long long v49 = *(_OWORD *)&v65.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v65.a;
    *(_OWORD *)&retstr->c = v49;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v65.tx;
    CGFloat v50 = v39;
    *(CGFloat *)&long long v49 = v40;
    CGFloat v51 = v41;
    CGFloat v52 = v42;
    CGFloat v53 = CGRectGetWidth(*(CGRect *)((char *)&v49 - 8)) / 100.0;
    v74.origin.CGFloat x = v39;
    v74.origin.CGFloat y = v40;
    v74.size.CGFloat width = v41;
    v74.size.CGFloat height = v42;
    CGFloat v54 = CGRectGetHeight(v74);
    long long v55 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v55;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v65, &t1, v53, v54 / 100.0);
    long long v56 = *(_OWORD *)&v65.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v65.a;
    *(_OWORD *)&retstr->c = v56;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v65.tx;
    CGAffineTransformMakeTranslation(&v63, -50.0, 0.0);
    long long v57 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v57;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
    CGPoint result = CGAffineTransformConcat(&v65, &v63, &t1);
    long long v58 = *(_OWORD *)&v65.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v65.a;
    *(_OWORD *)&retstr->c = v58;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v65.tx;
  }
  return result;
}

- (void)p_paintPath:(CGPath *)a3 inContext:(CGContext *)a4 naturalBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  CGContextSaveGState(a4);
  CGContextAddPath(a4, a3);
  CGContextClip(a4);
  ClipBoundingBodouble x = CGContextGetClipBoundingBox(a4);
  if (sub_100065AF4(ClipBoundingBox.origin.x, ClipBoundingBox.origin.y, ClipBoundingBox.size.width, ClipBoundingBox.size.height))
  {
    memset(&v13[1], 0, sizeof(CGAffineTransform));
    if (self) {
      -[CRLAngleGradientFill p_shadingTransformForBounds:](self, "p_shadingTransformForBounds:", x, y, width, height);
    }
    v13[0] = v13[1];
    CGContextConcatCTM(a4, v13);
    CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
    double v12 = [(CRLGradientFill *)self shadingRef];
    CGShadingRetain(v12);
    [(CRLGradientFill *)self p_setAlpha:a4];
    CGContextDrawShading(a4, v12);
    CGShadingRelease(v12);
  }
  CGContextRestoreGState(a4);
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