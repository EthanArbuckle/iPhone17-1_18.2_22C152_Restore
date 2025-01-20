@interface SFCircleProgressLayer
+ (BOOL)needsDisplayForKey:(id)a3;
- (BOOL)showProgressTray;
- (SFCircleProgressLayer)init;
- (SFCircleProgressLayer)initWithLayer:(id)a3;
- (UIColor)progressBackgroundColor;
- (UIColor)progressColor;
- (double)progressLineWidth;
- (int64_t)progressStartPoint;
- (void)drawInContext:(CGContext *)a3;
- (void)setProgressBackgroundColor:(id)a3;
- (void)setProgressColor:(id)a3;
- (void)setProgressLineWidth:(double)a3;
- (void)setProgressStartPoint:(int64_t)a3;
- (void)setShowProgressTray:(BOOL)a3;
@end

@implementation SFCircleProgressLayer

- (SFCircleProgressLayer)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFCircleProgressLayer;
  v2 = [(SFCircleProgressLayer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_oneFullRotation = 6.28318531;
    [(SFCircleProgressLayer *)v2 setNeedsDisplayOnBoundsChange:1];
    [(SFCircleProgressLayer *)v3 setAllowsEdgeAntialiasing:1];
    [(SFCircleProgressLayer *)v3 setProgressStartPoint:0];
    v4 = +[UIColor systemBlueColor];
    [(SFCircleProgressLayer *)v3 setProgressColor:v4];

    v5 = +[UIColor colorWithWhite:0.78 alpha:1.0];
    [(SFCircleProgressLayer *)v3 setProgressBackgroundColor:v5];

    [(SFCircleProgressLayer *)v3 setProgressLineWidth:2.0];
    [(SFCircleProgressLayer *)v3 setShowProgressTray:0];
  }
  return v3;
}

- (SFCircleProgressLayer)initWithLayer:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFCircleProgressLayer;
  v5 = [(SFCircleProgressLayer *)&v12 initWithLayer:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5->_oneFullRotation = 6.28318531;
      id v6 = v4;
      -[SFCircleProgressLayer setNeedsDisplayOnBoundsChange:](v5, "setNeedsDisplayOnBoundsChange:", [v6 needsDisplayOnBoundsChange]);
      -[SFCircleProgressLayer setAllowsEdgeAntialiasing:](v5, "setAllowsEdgeAntialiasing:", [v6 allowsEdgeAntialiasing]);
      -[SFCircleProgressLayer setProgressStartPoint:](v5, "setProgressStartPoint:", [v6 progressStartPoint]);
      objc_super v7 = [v6 progressColor];
      [(SFCircleProgressLayer *)v5 setProgressColor:v7];

      v8 = [v6 progressBackgroundColor];
      [(SFCircleProgressLayer *)v5 setProgressBackgroundColor:v8];

      [v6 progressLineWidth];
      -[SFCircleProgressLayer setProgressLineWidth:](v5, "setProgressLineWidth:");
      -[SFCircleProgressLayer setShowProgressTray:](v5, "setShowProgressTray:", [v6 showProgressTray]);
      [v6 progress];
      double v10 = v9;

      [(SFCircleProgressLayer *)v5 setProgress:v10];
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
    v7.super_class = (Class)&OBJC_METACLASS___SFCircleProgressLayer;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, "needsDisplayForKey:", v4);
  }

  return v5;
}

- (void)drawInContext:(CGContext *)a3
{
  [(SFCircleProgressLayer *)self bounds];
  CGRect v21 = CGRectInset(v20, self->_progressLineWidth, self->_progressLineWidth);
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  if (v21.size.width >= v21.size.height) {
    double v9 = v21.size.height;
  }
  else {
    double v9 = v21.size.width;
  }
  double v10 = v9 - self->_progressLineWidth * 0.5 + 1.0;
  CGFloat v11 = y;
  CGFloat MidX = CGRectGetMidX(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v22);
  unint64_t v14 = self->_progressStartPoint - 1;
  if (v14 > 2) {
    double v15 = -1.57079633;
  }
  else {
    double v15 = dbl_100007EC8[v14];
  }
  double oneFullRotation = self->_oneFullRotation;
  CGContextSetLineCap(a3, kCGLineCapButt);
  CGContextSetLineJoin(a3, kCGLineJoinMiter);
  CGContextSetLineWidth(a3, self->_progressLineWidth);
  if (self->_showProgressTray)
  {
    CGContextBeginPath(a3);
    CGContextAddArc(a3, MidX, MidY, v10 * 0.5, v15, v15 + oneFullRotation, 0);
    CGContextSetStrokeColorWithColor(a3, [(UIColor *)self->_progressBackgroundColor CGColor]);
    CGContextStrokePath(a3);
  }
  CGContextBeginPath(a3);
  double v17 = self->_oneFullRotation;
  [(SFCircleProgressLayer *)self progress];
  CGContextAddArc(a3, MidX, MidY, v10 * 0.5, v15, v15 + v17 * v18, 0);
  CGContextSetStrokeColorWithColor(a3, [(UIColor *)self->_progressColor CGColor]);

  CGContextStrokePath(a3);
}

- (int64_t)progressStartPoint
{
  return self->_progressStartPoint;
}

- (void)setProgressStartPoint:(int64_t)a3
{
  self->_progressStartPoint = a3;
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