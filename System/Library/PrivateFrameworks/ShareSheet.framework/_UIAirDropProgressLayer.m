@interface _UIAirDropProgressLayer
+ (BOOL)needsDisplayForKey:(id)a3;
- (BOOL)showProgressTray;
- (UIColor)progressBackgroundColor;
- (UIColor)progressColor;
- (_UIAirDropProgressLayer)init;
- (_UIAirDropProgressLayer)initWithLayer:(id)a3;
- (double)progressLineWidth;
- (void)drawInContext:(CGContext *)a3;
- (void)setProgressBackgroundColor:(id)a3;
- (void)setProgressColor:(id)a3;
- (void)setProgressLineWidth:(double)a3;
- (void)setShowProgressTray:(BOOL)a3;
@end

@implementation _UIAirDropProgressLayer

- (_UIAirDropProgressLayer)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UIAirDropProgressLayer;
  v2 = [(_UIAirDropProgressLayer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_oneFullRotation = 6.28318531;
    [(_UIAirDropProgressLayer *)v2 setNeedsDisplayOnBoundsChange:1];
    [(_UIAirDropProgressLayer *)v3 setAllowsEdgeAntialiasing:1];
    v4 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(_UIAirDropProgressLayer *)v3 setProgressColor:v4];

    v5 = [MEMORY[0x1E4FB1618] systemFillColor];
    [(_UIAirDropProgressLayer *)v3 setProgressBackgroundColor:v5];

    [(_UIAirDropProgressLayer *)v3 setProgressLineWidth:2.0];
    [(_UIAirDropProgressLayer *)v3 setShowProgressTray:0];
  }
  return v3;
}

- (_UIAirDropProgressLayer)initWithLayer:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIAirDropProgressLayer;
  v5 = [(_UIAirDropProgressLayer *)&v12 initWithLayer:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5->_oneFullRotation = 6.28318531;
      id v6 = v4;
      -[_UIAirDropProgressLayer setNeedsDisplayOnBoundsChange:](v5, "setNeedsDisplayOnBoundsChange:", [v6 needsDisplayOnBoundsChange]);
      -[_UIAirDropProgressLayer setAllowsEdgeAntialiasing:](v5, "setAllowsEdgeAntialiasing:", [v6 allowsEdgeAntialiasing]);
      objc_super v7 = [v6 progressColor];
      [(_UIAirDropProgressLayer *)v5 setProgressColor:v7];

      v8 = [v6 progressBackgroundColor];
      [(_UIAirDropProgressLayer *)v5 setProgressBackgroundColor:v8];

      [v6 progressLineWidth];
      -[_UIAirDropProgressLayer setProgressLineWidth:](v5, "setProgressLineWidth:");
      -[_UIAirDropProgressLayer setShowProgressTray:](v5, "setShowProgressTray:", [v6 showProgressTray]);
      [v6 progress];
      double v10 = v9;

      [(_UIAirDropProgressLayer *)v5 setProgress:v10];
    }
  }

  return v5;
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"progress"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS____UIAirDropProgressLayer;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_needsDisplayForKey_, v4);
  }

  return v5;
}

- (void)drawInContext:(CGContext *)a3
{
  [(_UIAirDropProgressLayer *)self bounds];
  CGRect v19 = CGRectInset(v18, self->_progressLineWidth, self->_progressLineWidth);
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  if (v19.size.width >= v19.size.height) {
    double v9 = v19.size.height;
  }
  else {
    double v9 = v19.size.width;
  }
  double v10 = (v9 - self->_progressLineWidth * 0.5 + 1.0) * 0.5;
  CGFloat v11 = x;
  CGFloat MidX = CGRectGetMidX(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v20);
  double oneFullRotation = self->_oneFullRotation;
  CGContextSetLineCap(a3, kCGLineCapButt);
  CGContextSetLineJoin(a3, kCGLineJoinMiter);
  CGContextSetLineWidth(a3, self->_progressLineWidth);
  if (self->_showProgressTray)
  {
    CGContextBeginPath(a3);
    CGContextAddArc(a3, MidX, MidY, v10, -1.57079633, oneFullRotation + -1.57079633, 0);
    CGContextSetStrokeColorWithColor(a3, [(UIColor *)self->_progressBackgroundColor CGColor]);
    CGContextStrokePath(a3);
  }
  CGContextBeginPath(a3);
  double v15 = self->_oneFullRotation;
  [(_UIAirDropProgressLayer *)self progress];
  CGContextAddArc(a3, MidX, MidY, v10, -1.57079633, v15 * v16 + -1.57079633, 0);
  CGContextSetStrokeColorWithColor(a3, [(UIColor *)self->_progressColor CGColor]);
  CGContextStrokePath(a3);
}

- (UIColor)progressColor
{
  return self->_progressColor;
}

- (void)setProgressColor:(id)a3
{
}

- (UIColor)progressBackgroundColor
{
  return self->_progressBackgroundColor;
}

- (void)setProgressBackgroundColor:(id)a3
{
}

- (double)progressLineWidth
{
  return self->_progressLineWidth;
}

- (void)setProgressLineWidth:(double)a3
{
  self->_progressLineWidth = a3;
}

- (BOOL)showProgressTray
{
  return self->_showProgressTray;
}

- (void)setShowProgressTray:(BOOL)a3
{
  self->_showProgressTraCGFloat y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBackgroundColor, 0);
  objc_storeStrong((id *)&self->_progressColor, 0);
}

@end