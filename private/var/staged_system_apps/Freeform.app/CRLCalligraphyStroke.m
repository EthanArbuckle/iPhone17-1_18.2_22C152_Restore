@interface CRLCalligraphyStroke
+ (Class)mutableClass;
- (BOOL)canApplyToShapeRenderable;
- (BOOL)chisel;
- (BOOL)drawsInOneStep;
- (BOOL)drawsOutsideStrokeBounds;
- (BOOL)prefersToApplyToShapeRenderableDuringManipulation;
- (CGAffineTransform)transformInContext:(SEL)a3;
- (CGRect)boundsForLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 transform:(CGAffineTransform *)a7;
- (CRLCalligraphyStroke)initWithColor:(id)a3 width:(double)a4 cap:(unint64_t)a5 join:(unint64_t)a6 pattern:(id)a7 miterLimit:(double)a8;
- (double)angle;
- (double)horizontalMarginForSwatch;
- (double)scale;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)applyToContext:(CGContext *)a3 insideStroke:(BOOL)a4;
- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7 useFastDrawing:(BOOL)a8;
- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8;
@end

@implementation CRLCalligraphyStroke

- (CRLCalligraphyStroke)initWithColor:(id)a3 width:(double)a4 cap:(unint64_t)a5 join:(unint64_t)a6 pattern:(id)a7 miterLimit:(double)a8
{
  v9.receiver = self;
  v9.super_class = (Class)CRLCalligraphyStroke;
  return [(CRLSmartStroke *)&v9 initWithName:@"Calligraphy" color:a3 width:a5 cap:a6 join:a7 pattern:a4 miterLimit:a8];
}

+ (Class)mutableClass
{
  return (Class)objc_opt_class();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CRLMutableCalligraphyStroke alloc];
  v5 = [(CRLStroke *)self color];
  [(CRLStroke *)self width];
  double v7 = v6;
  unint64_t v8 = [(CRLStroke *)self cap];
  unint64_t v9 = [(CRLStroke *)self join];
  v10 = [(CRLStroke *)self pattern];
  [(CRLStroke *)self miterLimit];
  v12 = [(CRLCalligraphyStroke *)v4 initWithColor:v5 width:v8 cap:v9 join:v10 pattern:v7 miterLimit:v11];

  return v12;
}

- (double)angle
{
  return 45.0;
}

- (double)scale
{
  return 0.15;
}

- (BOOL)chisel
{
  return 0;
}

- (BOOL)canApplyToShapeRenderable
{
  return 1;
}

- (BOOL)prefersToApplyToShapeRenderableDuringManipulation
{
  return 0;
}

- (BOOL)drawsInOneStep
{
  return 0;
}

- (BOOL)drawsOutsideStrokeBounds
{
  return 0;
}

- (CGAffineTransform)transformInContext:(SEL)a3
{
  long long v19 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v20 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v19;
  long long v18 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tx = v18;
  CGContextGetCTM(&v23, a4);
  double v7 = sub_10007F788(&v23);
  if (sub_1004579A8((uint64_t)a4)) {
    double v8 = -v7;
  }
  else {
    double v8 = v7;
  }
  double v9 = sub_10045802C((uint64_t)a4);
  double v10 = v8 - (v9 + sub_100457860((uint64_t)a4));
  [(CRLCalligraphyStroke *)self angle];
  double v12 = v11 - v10;
  if ([(CRLCalligraphyStroke *)self chisel])
  {
    long long v13 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v22.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v22.c = v13;
    *(_OWORD *)&v22.tx = *(_OWORD *)&retstr->tx;
    return CGAffineTransformRotate(retstr, &v22, v12 * -3.14159265 / 180.0);
  }
  else
  {
    [(CRLCalligraphyStroke *)self scale];
    *(_OWORD *)&v22.a = v20;
    *(_OWORD *)&v22.c = v19;
    *(_OWORD *)&v22.tx = v18;
    CGAffineTransformScale(retstr, &v22, 1.0, 1.0 / v15);
    long long v16 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v21.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v21.c = v16;
    *(_OWORD *)&v21.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformRotate(&v22, &v21, v12 * 3.14159265 / 180.0);
    long long v17 = *(_OWORD *)&v22.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v22.a;
    *(_OWORD *)&retstr->c = v17;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v22.tx;
  }
  return result;
}

- (void)applyToContext:(CGContext *)a3 insideStroke:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CRLCalligraphyStroke;
  [(CRLStroke *)&v5 applyToContext:a3 insideStroke:a4];
  CGContextSetLineCap(a3, kCGLineCapRound);
  CGContextSetLineJoin(a3, kCGLineJoinRound);
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8
{
  BOOL v9 = a4;
  if ([(CRLStroke *)self shouldRender])
  {
    memset(&v19, 0, sizeof(v19));
    [(CRLCalligraphyStroke *)self transformInContext:a5];
    CGAffineTransform v18 = v19;
    double v12 = sub_1000D5540(a3, &v18);
    CGContextSaveGState(a5);
    [(CRLCalligraphyStroke *)self applyToContext:a5 insideStroke:v9];
    CGAffineTransform v18 = v19;
    CGAffineTransformInvert(&v17, &v18);
    CGContextConcatCTM(a5, &v17);
    if ([(CRLCalligraphyStroke *)self chisel])
    {
      long long v13 = +[CRLBezierPath bezierPathWithCGPath:v12];
      [(CRLStroke *)self width];
      [v13 setLineWidth:];
      id v14 = [v13 chisel];
      double v15 = (const CGPath *)[v14 CGPath];

      CGContextAddPath(a5, v15);
      long long v16 = [(CRLStroke *)self color];
      CGContextSetFillColorWithColor(a5, (CGColorRef)[v16 CGColor]);

      CGContextFillPath(a5);
    }
    else
    {
      CGContextAddPath(a5, v12);
      CGContextStrokePath(a5);
    }
    CGPathRelease(v12);
    CGContextRestoreGState(a5);
  }
}

- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7 useFastDrawing:(BOOL)a8
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v14 = a3;
  CGContextSaveGState(a7);
  [(CRLCalligraphyStroke *)self applyToContext:a7 insideStroke:0];
  memset(&v27, 0, sizeof(v27));
  [(CRLCalligraphyStroke *)self transformInContext:a7];
  CGAffineTransform v25 = v27;
  CGAffineTransformInvert(&transform, &v25);
  CGContextConcatCTM(a7, &transform);
  memset(&v25, 0, sizeof(v25));
  CGAffineTransformMakeTranslation(&v25, x, y);
  CGAffineTransform t2 = v25;
  CGAffineTransformScale(&t1, &t2, a6, a6);
  CGAffineTransform v25 = t1;
  CGAffineTransform t2 = t1;
  CGAffineTransformRotate(&t1, &t2, a5);
  CGAffineTransform v25 = t1;
  [v14 endPoint];
  CGFloat v16 = -v15;
  [v14 endPoint];
  CGAffineTransform t2 = v25;
  CGAffineTransformTranslate(&t1, &t2, v16, -v17);
  CGAffineTransform v25 = t1;
  id v18 = [v14 path];
  CGAffineTransform v19 = (const CGPath *)[v18 CGPath];
  CGAffineTransform t1 = v25;
  CGAffineTransform t2 = v27;
  CGAffineTransformConcat(&v22, &t1, &t2);
  long long v20 = sub_1000D5540(v19, &v22);

  CGContextAddPath(a7, v20);
  CGPathRelease(v20);
  if ([v14 isFilled])
  {
    CGContextFillPath(a7);
  }
  else
  {
    [(CRLStroke *)self width];
    CGContextSetLineWidth(a7, v21);
    CGContextSetLineJoin(a7, (CGLineJoin)[v14 lineJoin]);
    CGContextStrokePath(a7);
  }
  CGContextRestoreGState(a7);
}

- (CGRect)boundsForLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 transform:(CGAffineTransform *)a7
{
  double y = a4.y;
  double x = a4.x;
  v34.receiver = self;
  v34.super_class = (Class)CRLCalligraphyStroke;
  long long v12 = *(_OWORD *)&a7->c;
  long long v31 = *(_OWORD *)&a7->a;
  long long v32 = v12;
  long long v33 = *(_OWORD *)&a7->tx;
  id v13 = a3;
  -[CRLStroke boundsForLineEnd:atPoint:atAngle:withScale:transform:](&v34, "boundsForLineEnd:atPoint:atAngle:withScale:transform:", v13, &v31, x, y, a5, a6);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat width = v18;
  CGFloat height = v20;
  unsigned __int8 v22 = [v13 isFilled:v31, v32, v33, [v34 receiver], [v34 super_class]];

  if ((v22 & 1) == 0)
  {
    [(CRLStroke *)self width];
    CGFloat v24 = v23 * -0.5;
    [(CRLStroke *)self width];
    CGFloat v26 = v25 * -0.5;
    v35.origin.double x = v15;
    v35.origin.double y = v17;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    CGRect v36 = CGRectInset(v35, v24, v26);
    CGFloat v15 = v36.origin.x;
    CGFloat v17 = v36.origin.y;
    CGFloat width = v36.size.width;
    CGFloat height = v36.size.height;
  }
  double v27 = v15;
  double v28 = v17;
  double v29 = width;
  double v30 = height;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (double)horizontalMarginForSwatch
{
  v4.receiver = self;
  v4.super_class = (Class)CRLCalligraphyStroke;
  [(CRLStroke *)&v4 horizontalMarginForSwatch];
  return v2 + 3.0;
}

@end