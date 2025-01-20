@interface TSDShapeRenderable
+ (id)renderable;
+ (id)renderableFromShapeLayer:(id)a3;
- (CAShapeLayer)shapeLayer;
- (CGColor)fillColor;
- (CGColor)strokeColor;
- (CGPath)path;
- (NSArray)lineDashPattern;
- (NSString)lineCap;
- (NSString)lineJoin;
- (TSDShapeRenderable)initWithShapeLayer:(id)a3;
- (double)lineDashPhase;
- (double)lineWidth;
- (double)miterLimit;
- (double)strokeEnd;
- (void)setCGLineCap:(int)a3;
- (void)setCGLineJoin:(int)a3;
- (void)setFillColor:(CGColor *)a3;
- (void)setLineCap:(id)a3;
- (void)setLineDashPattern:(id)a3;
- (void)setLineDashPhase:(double)a3;
- (void)setLineJoin:(id)a3;
- (void)setLineWidth:(double)a3;
- (void)setMiterLimit:(double)a3;
- (void)setPath:(CGPath *)a3;
- (void)setStrokeColor:(CGColor *)a3;
- (void)setStrokeEnd:(double)a3;
@end

@implementation TSDShapeRenderable

- (TSDShapeRenderable)initWithShapeLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSDShapeRenderable;
  return [(TSDRenderable *)&v4 initWithCALayer:a3];
}

+ (id)renderableFromShapeLayer:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithShapeLayer:v4];

  return v5;
}

+ (id)renderable
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x263F15880] layer];
  id v4 = (void *)[v2 initWithShapeLayer:v3];

  return v4;
}

- (CAShapeLayer)shapeLayer
{
  v4.receiver = self;
  v4.super_class = (Class)TSDShapeRenderable;
  id v2 = [(TSDRenderable *)&v4 layer];

  return (CAShapeLayer *)v2;
}

- (CGPath)path
{
  id v2 = [(TSDShapeRenderable *)self shapeLayer];
  v3 = (CGPath *)[v2 path];

  return v3;
}

- (void)setPath:(CGPath *)a3
{
  id v4 = [(TSDShapeRenderable *)self shapeLayer];
  [v4 setPath:a3];
}

- (CGColor)strokeColor
{
  id v2 = [(TSDShapeRenderable *)self shapeLayer];
  v3 = (CGColor *)[v2 strokeColor];

  return v3;
}

- (void)setStrokeColor:(CGColor *)a3
{
  id v4 = [(TSDShapeRenderable *)self shapeLayer];
  [v4 setStrokeColor:a3];
}

- (CGColor)fillColor
{
  id v2 = [(TSDShapeRenderable *)self shapeLayer];
  v3 = (CGColor *)[v2 fillColor];

  return v3;
}

- (void)setFillColor:(CGColor *)a3
{
  id v4 = [(TSDShapeRenderable *)self shapeLayer];
  [v4 setFillColor:a3];
}

- (double)lineWidth
{
  id v2 = [(TSDShapeRenderable *)self shapeLayer];
  [v2 lineWidth];
  double v4 = v3;

  return v4;
}

- (void)setLineWidth:(double)a3
{
  id v4 = [(TSDShapeRenderable *)self shapeLayer];
  [v4 setLineWidth:a3];
}

- (NSArray)lineDashPattern
{
  id v2 = [(TSDShapeRenderable *)self shapeLayer];
  double v3 = [v2 lineDashPattern];

  return (NSArray *)v3;
}

- (void)setLineDashPattern:(id)a3
{
  id v4 = a3;
  id v5 = [(TSDShapeRenderable *)self shapeLayer];
  [v5 setLineDashPattern:v4];
}

- (NSString)lineCap
{
  id v2 = [(TSDShapeRenderable *)self shapeLayer];
  double v3 = [v2 lineCap];

  return (NSString *)v3;
}

- (void)setLineCap:(id)a3
{
  id v4 = a3;
  id v5 = [(TSDShapeRenderable *)self shapeLayer];
  [v5 setLineCap:v4];
}

- (double)lineDashPhase
{
  id v2 = [(TSDShapeRenderable *)self shapeLayer];
  [v2 lineDashPhase];
  double v4 = v3;

  return v4;
}

- (void)setLineDashPhase:(double)a3
{
  id v4 = [(TSDShapeRenderable *)self shapeLayer];
  [v4 setLineDashPhase:a3];
}

- (NSString)lineJoin
{
  id v2 = [(TSDShapeRenderable *)self shapeLayer];
  double v3 = [v2 lineJoin];

  return (NSString *)v3;
}

- (void)setLineJoin:(id)a3
{
  id v4 = a3;
  id v5 = [(TSDShapeRenderable *)self shapeLayer];
  [v5 setLineJoin:v4];
}

- (double)miterLimit
{
  id v2 = [(TSDShapeRenderable *)self shapeLayer];
  [v2 miterLimit];
  double v4 = v3;

  return v4;
}

- (void)setMiterLimit:(double)a3
{
  id v4 = [(TSDShapeRenderable *)self shapeLayer];
  [v4 setMiterLimit:a3];
}

- (double)strokeEnd
{
  id v2 = [(TSDShapeRenderable *)self shapeLayer];
  [v2 strokeEnd];
  double v4 = v3;

  return v4;
}

- (void)setStrokeEnd:(double)a3
{
  id v4 = [(TSDShapeRenderable *)self shapeLayer];
  [v4 setStrokeEnd:a3];
}

- (void)setCGLineCap:(int)a3
{
  double v3 = @"butt";
  if (a3 == 1) {
    double v3 = @"round";
  }
  if (a3 == 2) {
    id v4 = @"square";
  }
  else {
    id v4 = v3;
  }
  [(TSDShapeRenderable *)self setLineCap:v4];
}

- (void)setCGLineJoin:(int)a3
{
  double v3 = @"miter";
  if (a3 == 1) {
    double v3 = @"round";
  }
  if (a3 == 2) {
    id v4 = @"bevel";
  }
  else {
    id v4 = v3;
  }
  [(TSDShapeRenderable *)self setLineJoin:v4];
}

@end