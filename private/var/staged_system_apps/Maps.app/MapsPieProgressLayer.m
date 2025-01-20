@interface MapsPieProgressLayer
+ (BOOL)needsDisplayForKey:(id)a3;
- (MapsPieProgressLayer)init;
- (MapsPieProgressLayer)initWithLayer:(id)a3;
- (UIColor)progressColor;
- (double)borderLineWidth;
- (void)drawInContext:(CGContext *)a3;
- (void)setBorderLineWidth:(double)a3;
- (void)setProgressColor:(id)a3;
@end

@implementation MapsPieProgressLayer

- (MapsPieProgressLayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)MapsPieProgressLayer;
  v2 = [(MapsPieProgressLayer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(MapsPieProgressLayer *)v2 setNeedsDisplayOnBoundsChange:1];
    [(MapsPieProgressLayer *)v3 setAllowsEdgeAntialiasing:1];
    v4 = +[UIColor systemBlueColor];
    [(MapsPieProgressLayer *)v3 setProgressColor:v4];

    [(MapsPieProgressLayer *)v3 setBorderLineWidth:1.0];
  }
  return v3;
}

- (MapsPieProgressLayer)initWithLayer:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MapsPieProgressLayer;
  v5 = [(MapsPieProgressLayer *)&v11 initWithLayer:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      -[MapsPieProgressLayer setNeedsDisplayOnBoundsChange:](v5, "setNeedsDisplayOnBoundsChange:", [v6 needsDisplayOnBoundsChange]);
      -[MapsPieProgressLayer setAllowsEdgeAntialiasing:](v5, "setAllowsEdgeAntialiasing:", [v6 allowsEdgeAntialiasing]);
      v7 = [v6 progressColor];
      [(MapsPieProgressLayer *)v5 setProgressColor:v7];

      [v6 borderLineWidth];
      -[MapsPieProgressLayer setBorderLineWidth:](v5, "setBorderLineWidth:");
      [v6 progress];
      double v9 = v8;

      [(MapsPieProgressLayer *)v5 setProgress:v9];
    }
  }

  return v5;
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"progress"] & 1) != 0
    || ([v4 isEqualToString:@"borderLineWidth"] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___MapsPieProgressLayer;
    unsigned __int8 v5 = [super needsDisplayForKey:v4];
  }

  return v5;
}

- (void)drawInContext:(CGContext *)a3
{
  [(MapsPieProgressLayer *)self bounds];
  CGRect v17 = CGRectInset(v16, self->_borderLineWidth, self->_borderLineWidth);
  CGFloat x = v17.origin.x;
  CGFloat y = v17.origin.y;
  CGFloat width = v17.size.width;
  CGFloat height = v17.size.height;
  if (v17.size.width >= v17.size.height) {
    double v9 = v17.size.height;
  }
  else {
    double v9 = v17.size.width;
  }
  CGFloat v10 = (v9 - self->_borderLineWidth * 0.5 + 1.0) * 0.5;
  CGFloat v11 = x;
  CGFloat MidX = CGRectGetMidX(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v18);
  CGContextSetLineCap(a3, kCGLineCapButt);
  CGContextSetLineJoin(a3, kCGLineJoinMiter);
  CGContextSetLineWidth(a3, self->_borderLineWidth);
  CGContextBeginPath(a3);
  CGContextAddArc(a3, MidX, MidY, v10, -1.57079633, 4.71238898, 0);
  CGContextSetStrokeColorWithColor(a3, [(UIColor *)self->_progressColor CGColor]);
  CGContextStrokePath(a3);
  CGContextSetLineWidth(a3, v10);
  CGContextBeginPath(a3);
  [(MapsPieProgressLayer *)self progress];
  CGContextAddArc(a3, MidX, MidY, v10 * 0.5, -1.57079633, v14 * 6.28318531 + -1.57079633, 0);
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

- (double)borderLineWidth
{
  return self->_borderLineWidth;
}

- (void)setBorderLineWidth:(double)a3
{
  self->_borderLineWidth = a3;
}

- (void).cxx_destruct
{
}

@end