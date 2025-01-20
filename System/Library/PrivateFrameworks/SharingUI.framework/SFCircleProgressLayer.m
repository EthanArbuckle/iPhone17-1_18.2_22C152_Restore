@interface SFCircleProgressLayer
+ (BOOL)needsDisplayForKey:(id)a3;
- (BOOL)showProgressTray;
- (BOOL)usesRoundedLineCap;
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
- (void)setUsesRoundedLineCap:(BOOL)a3;
@end

@implementation SFCircleProgressLayer

- (SFCircleProgressLayer)init
{
  v9.receiver = self;
  v9.super_class = (Class)SFCircleProgressLayer;
  v2 = [(SFCircleProgressLayer *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_oneFullRotation = 6.28318531;
    [(SFCircleProgressLayer *)v2 setNeedsDisplayOnBoundsChange:1];
    [(SFCircleProgressLayer *)v3 setAllowsEdgeAntialiasing:1];
    [(SFCircleProgressLayer *)v3 setProgressStartPoint:0];
    v4 = [MEMORY[0x263F825C8] systemBlueColor];
    [(SFCircleProgressLayer *)v3 setProgressColor:v4];

    v5 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (v6 == 6) {
      [MEMORY[0x263F825C8] secondarySystemFillColor];
    }
    else {
    v7 = [MEMORY[0x263F825C8] systemFillColor];
    }
    [(SFCircleProgressLayer *)v3 setProgressBackgroundColor:v7];

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
      v7 = [v6 progressColor];
      [(SFCircleProgressLayer *)v5 setProgressColor:v7];

      v8 = [v6 progressBackgroundColor];
      [(SFCircleProgressLayer *)v5 setProgressBackgroundColor:v8];

      [v6 progressLineWidth];
      -[SFCircleProgressLayer setProgressLineWidth:](v5, "setProgressLineWidth:");
      -[SFCircleProgressLayer setUsesRoundedLineCap:](v5, "setUsesRoundedLineCap:", [v6 usesRoundedLineCap]);
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
  if (([v4 isEqualToString:@"progress"] & 1) != 0
    || ([v4 isEqualToString:@"progressLineWidth"] & 1) != 0
    || ([v4 isEqualToString:@"showProgressTray"] & 1) != 0
    || ([v4 isEqualToString:@"usesRoundedLineCap"] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SFCircleProgressLayer;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_needsDisplayForKey_, v4);
  }

  return v5;
}

- (void)drawInContext:(CGContext *)a3
{
  [(SFCircleProgressLayer *)self bounds];
  CGRect v22 = CGRectInset(v21, self->_progressLineWidth, self->_progressLineWidth);
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  if (v22.size.width >= v22.size.height) {
    double v9 = v22.size.height;
  }
  else {
    double v9 = v22.size.width;
  }
  double v10 = v9 - self->_progressLineWidth * 0.5 + 1.0;
  CGFloat v11 = y;
  CGFloat MidX = CGRectGetMidX(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v23);
  unint64_t v14 = self->_progressStartPoint - 1;
  if (v14 > 2) {
    double v15 = -1.57079633;
  }
  else {
    double v15 = dbl_21DBB2140[v14];
  }
  double oneFullRotation = self->_oneFullRotation;
  CGLineJoin usesRoundedLineCap = self->_usesRoundedLineCap;
  CGContextSetLineCap(a3, (CGLineCap)usesRoundedLineCap);
  CGContextSetLineJoin(a3, usesRoundedLineCap);
  CGContextSetLineWidth(a3, self->_progressLineWidth);
  if (self->_showProgressTray)
  {
    CGContextBeginPath(a3);
    CGContextAddArc(a3, MidX, MidY, v10 * 0.5, v15, v15 + oneFullRotation, 0);
    CGContextSetStrokeColorWithColor(a3, [(UIColor *)self->_progressBackgroundColor CGColor]);
    CGContextStrokePath(a3);
  }
  CGContextBeginPath(a3);
  double v18 = self->_oneFullRotation;
  [(SFCircleProgressLayer *)self progress];
  CGContextAddArc(a3, MidX, MidY, v10 * 0.5, v15, v15 + v18 * v19, 0);
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

- (BOOL)usesRoundedLineCap
{
  return self->_usesRoundedLineCap;
}

- (void)setUsesRoundedLineCap:(BOOL)a3
{
  self->_CGLineJoin usesRoundedLineCap = a3;
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