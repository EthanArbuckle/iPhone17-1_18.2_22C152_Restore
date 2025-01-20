@interface CRLCanvasShapeRenderable
+ (id)renderable;
+ (id)renderableFromShapeLayer:(id)a3;
- (CAShapeLayer)shapeLayer;
- (CGColor)fillColor;
- (CGColor)strokeColor;
- (CGPath)path;
- (CRLCanvasShapeRenderable)initWithShapeLayer:(id)a3;
- (NSArray)lineDashPattern;
- (NSString)lineCap;
- (NSString)lineJoin;
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

@implementation CRLCanvasShapeRenderable

- (CRLCanvasShapeRenderable)initWithShapeLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasShapeRenderable;
  return [(CRLCanvasRenderable *)&v4 initWithCALayer:a3];
}

+ (id)renderableFromShapeLayer:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithShapeLayer:v4];

  return v5;
}

+ (id)renderable
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[CAShapeLayer layer];
  id v4 = [v2 initWithShapeLayer:v3];

  return v4;
}

- (CAShapeLayer)shapeLayer
{
  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasShapeRenderable;
  id v2 = [(CRLCanvasRenderable *)&v4 layer];

  return (CAShapeLayer *)v2;
}

- (CGPath)path
{
  id v2 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  v3 = (CGPath *)[v2 path];

  return v3;
}

- (void)setPath:(CGPath *)a3
{
  id v4 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  [v4 setPath:a3];
}

- (CGColor)strokeColor
{
  id v2 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  v3 = (CGColor *)[v2 strokeColor];

  return v3;
}

- (void)setStrokeColor:(CGColor *)a3
{
  id v4 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  [v4 setStrokeColor:a3];
}

- (CGColor)fillColor
{
  id v2 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  v3 = (CGColor *)[v2 fillColor];

  return v3;
}

- (void)setFillColor:(CGColor *)a3
{
  id v4 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  [v4 setFillColor:a3];
}

- (double)lineWidth
{
  id v2 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  [v2 lineWidth];
  double v4 = v3;

  return v4;
}

- (void)setLineWidth:(double)a3
{
  id v4 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  [v4 setLineWidth:a3];
}

- (NSArray)lineDashPattern
{
  id v2 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  double v3 = [v2 lineDashPattern];

  return (NSArray *)v3;
}

- (void)setLineDashPattern:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  [v5 setLineDashPattern:v4];
}

- (NSString)lineCap
{
  id v2 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  double v3 = [v2 lineCap];

  return (NSString *)v3;
}

- (void)setLineCap:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  [v5 setLineCap:v4];
}

- (double)lineDashPhase
{
  id v2 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  [v2 lineDashPhase];
  double v4 = v3;

  return v4;
}

- (void)setLineDashPhase:(double)a3
{
  id v4 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  [v4 setLineDashPhase:a3];
}

- (NSString)lineJoin
{
  id v2 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  double v3 = [v2 lineJoin];

  return (NSString *)v3;
}

- (void)setLineJoin:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  [v5 setLineJoin:v4];
}

- (double)miterLimit
{
  id v2 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  [v2 miterLimit];
  double v4 = v3;

  return v4;
}

- (void)setMiterLimit:(double)a3
{
  id v4 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  [v4 setMiterLimit:a3];
}

- (double)strokeEnd
{
  id v2 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  [v2 strokeEnd];
  double v4 = v3;

  return v4;
}

- (void)setStrokeEnd:(double)a3
{
  id v4 = [(CRLCanvasShapeRenderable *)self shapeLayer];
  [v4 setStrokeEnd:a3];
}

- (void)setCGLineCap:(int)a3
{
  CFStringRef v3 = @"butt";
  if (a3 == 1) {
    CFStringRef v3 = @"round";
  }
  if (a3 == 2) {
    CFStringRef v4 = @"square";
  }
  else {
    CFStringRef v4 = v3;
  }
  [(CRLCanvasShapeRenderable *)self setLineCap:v4];
}

- (void)setCGLineJoin:(int)a3
{
  CFStringRef v3 = @"miter";
  if (a3 == 1) {
    CFStringRef v3 = @"round";
  }
  if (a3 == 2) {
    CFStringRef v4 = @"bevel";
  }
  else {
    CFStringRef v4 = v3;
  }
  [(CRLCanvasShapeRenderable *)self setLineJoin:v4];
}

@end