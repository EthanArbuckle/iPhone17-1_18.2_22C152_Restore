@interface TSDCalligraphyStroke
+ (Class)mutableClass;
- (BOOL)canApplyToShapeRenderable;
- (BOOL)chisel;
- (BOOL)drawsInOneStep;
- (BOOL)drawsOutsideStrokeBounds;
- (BOOL)prefersToApplyToShapeRenderableDuringManipulation;
- (CGAffineTransform)transformInContext:(SEL)a3;
- (CGRect)boundsForLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 transform:(CGAffineTransform *)a7;
- (CGRect)boundsForPath:(id)a3;
- (CGRect)p_superBoundsForPath:(id)a3;
- (TSDCalligraphyStroke)initWithColor:(id)a3 width:(double)a4 cap:(int)a5 join:(int)a6 pattern:(id)a7 miterLimit:(double)a8;
- (double)angle;
- (double)horizontalMarginForSwatch;
- (double)scale;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)applyToContext:(CGContext *)a3 insideStroke:(BOOL)a4;
- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7 useFastDrawing:(BOOL)a8;
- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8;
@end

@implementation TSDCalligraphyStroke

- (TSDCalligraphyStroke)initWithColor:(id)a3 width:(double)a4 cap:(int)a5 join:(int)a6 pattern:(id)a7 miterLimit:(double)a8
{
  v9.receiver = self;
  v9.super_class = (Class)TSDCalligraphyStroke;
  return [(TSDSmartStroke *)&v9 initWithName:@"Calligraphy" color:a3 width:*(void *)&a5 cap:*(void *)&a6 join:a7 pattern:a4 miterLimit:a8];
}

+ (Class)mutableClass
{
  return (Class)objc_opt_class();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [TSDMutableCalligraphyStroke alloc];
  v5 = [(TSDStroke *)self color];
  [(TSDStroke *)self width];
  double v7 = v6;
  uint64_t v8 = [(TSDStroke *)self cap];
  uint64_t v9 = [(TSDStroke *)self join];
  v10 = [(TSDStroke *)self pattern];
  [(TSDStroke *)self miterLimit];

  return [(TSDCalligraphyStroke *)v4 initWithColor:v5 width:v8 cap:v9 join:v10 pattern:v7 miterLimit:v11];
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

- (CGRect)p_superBoundsForPath:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSDCalligraphyStroke;
  [(TSDStroke *)&v7 boundsForPath:a3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)boundsForPath:(id)a3
{
  id v4 = (id)[(TSDCalligraphyStroke *)self mutableCopy];
  [v4 setCap:2];
  [v4 setJoin:1];

  objc_msgSend(v4, "p_superBoundsForPath:", a3);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGAffineTransform)transformInContext:(SEL)a3
{
  uint64_t v7 = MEMORY[0x263F000D0];
  long long v8 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v7 + 32);
  CGContextGetCTM(&v25, a4);
  double v9 = TSDTransformAngle(&v25.a);
  if (TSDCGContextGetIsReflection((uint64_t)a4)) {
    double v10 = -v9;
  }
  else {
    double v10 = v9;
  }
  double LayoutAngle = TSDCGContextGetLayoutAngle((uint64_t)a4);
  double v12 = v10 - (LayoutAngle + TSDCGContextGetShadowedLayoutAngle((uint64_t)a4));
  [(TSDCalligraphyStroke *)self angle];
  double v14 = v13 - v12;
  if ([(TSDCalligraphyStroke *)self chisel])
  {
    long long v15 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v21.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v21.c = v15;
    *(_OWORD *)&v21.tx = *(_OWORD *)&retstr->tx;
    return CGAffineTransformRotate(retstr, &v21, v14 * -3.14159265 / 180.0);
  }
  else
  {
    long long v17 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v24.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v24.c = v17;
    *(_OWORD *)&v24.tx = *(_OWORD *)&retstr->tx;
    [(TSDCalligraphyStroke *)self scale];
    CGAffineTransformScale(retstr, &v24, 1.0, 1.0 / v18);
    long long v19 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v22.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v22.c = v19;
    *(_OWORD *)&v22.tx = *(_OWORD *)&retstr->tx;
    CGRect result = CGAffineTransformRotate(&v23, &v22, v14 * 3.14159265 / 180.0);
    long long v20 = *(_OWORD *)&v23.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v23.a;
    *(_OWORD *)&retstr->c = v20;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v23.tx;
  }
  return result;
}

- (void)applyToContext:(CGContext *)a3 insideStroke:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TSDCalligraphyStroke;
  [(TSDStroke *)&v5 applyToContext:a3 insideStroke:a4];
  CGContextSetLineCap(a3, kCGLineCapRound);
  CGContextSetLineJoin(a3, kCGLineJoinRound);
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8
{
  BOOL v9 = a4;
  if ([(TSDStroke *)self shouldRender])
  {
    memset(&v16[1], 0, sizeof(CGAffineTransform));
    if (self) {
      [(TSDCalligraphyStroke *)self transformInContext:a5];
    }
    v16[0] = v16[1];
    double v12 = TSDCreateTransformedPath(a3, v16);
    CGContextSaveGState(a5);
    [(TSDCalligraphyStroke *)self applyToContext:a5 insideStroke:v9];
    CGAffineTransform v14 = v16[1];
    CGAffineTransformInvert(&transform, &v14);
    CGContextConcatCTM(a5, &transform);
    if ([(TSDCalligraphyStroke *)self chisel])
    {
      double v13 = +[TSDBezierPath bezierPathWithCGPath:v12];
      [(TSDStroke *)self width];
      -[TSDBezierPath setLineWidth:](v13, "setLineWidth:");
      CGContextAddPath(a5, (CGPathRef)objc_msgSend(-[TSDBezierPath chisel](v13, "chisel"), "CGPath"));
      CGContextSetFillColorWithColor(a5, (CGColorRef)[(TSUColor *)[(TSDStroke *)self color] CGColor]);
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
  CGContextSaveGState(a7);
  [(TSDCalligraphyStroke *)self applyToContext:a7 insideStroke:0];
  memset(&v31, 0, sizeof(v31));
  if (self) {
    [(TSDCalligraphyStroke *)self transformInContext:a7];
  }
  CGAffineTransform v29 = v31;
  CGAffineTransformInvert(&transform, &v29);
  CGContextConcatCTM(a7, &transform);
  memset(&v28, 0, sizeof(v28));
  CGAffineTransformMakeTranslation(&v28, x, y);
  CGAffineTransform v26 = v28;
  CGAffineTransformScale(&v27, &v26, a6, a6);
  CGAffineTransform v28 = v27;
  CGAffineTransform v25 = v27;
  CGAffineTransformRotate(&v27, &v25, a5);
  CGAffineTransform v28 = v27;
  CGAffineTransform v24 = v27;
  [a3 endPoint];
  CGFloat v16 = -v15;
  [a3 endPoint];
  CGAffineTransformTranslate(&v27, &v24, v16, -v17);
  CGAffineTransform v28 = v27;
  double v18 = (const CGPath *)[a3 path];
  CGAffineTransform t1 = v28;
  CGAffineTransform v21 = v31;
  CGAffineTransformConcat(&v23, &t1, &v21);
  long long v19 = TSDCreateTransformedPath(v18, &v23);
  CGContextAddPath(a7, v19);
  CGPathRelease(v19);
  if ([a3 isFilled])
  {
    CGContextFillPath(a7);
  }
  else
  {
    [(TSDStroke *)self width];
    CGContextSetLineWidth(a7, v20);
    CGContextSetLineJoin(a7, (CGLineJoin)[a3 lineJoin]);
    CGContextStrokePath(a7);
  }
  CGContextRestoreGState(a7);
}

- (CGRect)boundsForLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 transform:(CGAffineTransform *)a7
{
  long long v9 = *(_OWORD *)&a7->c;
  v27[0] = *(_OWORD *)&a7->a;
  v27[1] = v9;
  v27[2] = *(_OWORD *)&a7->tx;
  v26.receiver = self;
  v26.super_class = (Class)TSDCalligraphyStroke;
  -[TSDStroke boundsForLineEnd:atPoint:atAngle:withScale:transform:](&v26, sel_boundsForLineEnd_atPoint_atAngle_withScale_transform_, a3, v27, a4.x, a4.y, a5, a6);
  CGFloat x = v10;
  CGFloat y = v12;
  CGFloat width = v14;
  CGFloat height = v16;
  if (([a3 isFilled] & 1) == 0)
  {
    [(TSDStroke *)self width];
    CGFloat v19 = v18 * -0.5;
    [(TSDStroke *)self width];
    CGFloat v21 = v20 * -0.5;
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    CGRect v29 = CGRectInset(v28, v19, v21);
    CGFloat x = v29.origin.x;
    CGFloat y = v29.origin.y;
    CGFloat width = v29.size.width;
    CGFloat height = v29.size.height;
  }
  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (double)horizontalMarginForSwatch
{
  v4.receiver = self;
  v4.super_class = (Class)TSDCalligraphyStroke;
  [(TSDStroke *)&v4 horizontalMarginForSwatch];
  return v2 + 3.0;
}

@end