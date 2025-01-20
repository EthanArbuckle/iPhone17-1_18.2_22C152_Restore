@interface MTAAnalogStopwatchHandView
- (BOOL)hasTail;
- (MTAAnalogStopwatchHandView)initWithFrame:(CGRect)a3;
- (UIColor)color;
- (double)angle;
- (double)width;
- (unint64_t)anchorStyle;
- (void)drawRect:(CGRect)a3;
- (void)setAnchorStyle:(unint64_t)a3;
- (void)setAngle:(double)a3;
- (void)setColor:(id)a3;
- (void)setHasTail:(BOOL)a3;
- (void)setWidth:(double)a3;
@end

@implementation MTAAnalogStopwatchHandView

- (MTAAnalogStopwatchHandView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTAAnalogStopwatchHandView;
  v3 = -[MTAAnalogStopwatchHandView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(MTAAnalogStopwatchHandView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

- (void)setAngle:(double)a3
{
  if (self->_angle != a3)
  {
    self->_angle = a3;
    [(MTAAnalogStopwatchHandView *)self setNeedsDisplay];
  }
}

- (void)setWidth:(double)a3
{
  if (self->_width != a3)
  {
    self->_width = a3;
    [(MTAAnalogStopwatchHandView *)self setNeedsDisplay];
  }
}

- (void)setColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_color, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_color, a3);
    [(MTAAnalogStopwatchHandView *)self setNeedsDisplay];
  }
}

- (void)setHasTail:(BOOL)a3
{
  if (self->_hasTail != a3)
  {
    self->_hasTail = a3;
    [(MTAAnalogStopwatchHandView *)self setNeedsDisplay];
  }
}

- (void)setAnchorStyle:(unint64_t)a3
{
  if (self->_anchorStyle != a3)
  {
    self->_anchorStyle = a3;
    [(MTAAnalogStopwatchHandView *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  [(MTAAnalogStopwatchHandView *)self width];
  double v5 = v4;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  [(MTAAnalogStopwatchHandView *)self bounds];
  CGFloat MidX = CGRectGetMidX(v26);
  [(MTAAnalogStopwatchHandView *)self bounds];
  CGFloat MidY = CGRectGetMidY(v27);
  CGContextTranslateCTM(CurrentContext, MidX, MidY);
  [(MTAAnalogStopwatchHandView *)self bounds];
  double v10 = v9;
  double v11 = v9 * 0.5;
  v12 = objc_opt_new();
  unsigned int v13 = [(MTAAnalogStopwatchHandView *)self hasTail];
  double v14 = 0.0;
  if (v13) {
    double v14 = v11 / 5.0;
  }
  [v12 moveToPoint:0.0, v14];
  [v12 addLineToPoint:0.0, -v10 * 0.5];
  [(MTAAnalogStopwatchHandView *)self angle];
  CGAffineTransformMakeRotation(&v25, v15);
  [v12 applyTransform:&v25];
  [v12 setLineWidth:v5];
  v16 = [(MTAAnalogStopwatchHandView *)self color];
  [v16 setStroke];

  [v12 stroke];
  if ((id)[(MTAAnalogStopwatchHandView *)self anchorStyle] == (id)1)
  {
    UIRoundToViewScale();
    v18 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, CGPointZero.x, CGPointZero.y, v17, 0.0, 6.28318531);
    v19 = [(MTAAnalogStopwatchHandView *)self color];
LABEL_7:
    v24 = v19;
    [v19 setFill];

    [v18 fill];
    goto LABEL_8;
  }
  if ((id)[(MTAAnalogStopwatchHandView *)self anchorStyle] == (id)2)
  {
    UIRoundToViewScale();
    double y = CGPointZero.y;
    v22 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, CGPointZero.x, y, v21, 0.0, 6.28318531);
    v23 = [(MTAAnalogStopwatchHandView *)self color];
    [v23 setFill];

    [v22 fill];
    v18 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, CGPointZero.x, y, v5, 0.0, 6.28318531);

    v19 = +[UIColor mtui_backgroundColor];
    goto LABEL_7;
  }
LABEL_8:

  CGContextRestoreGState(CurrentContext);
}

- (double)angle
{
  return self->_angle;
}

- (double)width
{
  return self->_width;
}

- (UIColor)color
{
  return self->_color;
}

- (BOOL)hasTail
{
  return self->_hasTail;
}

- (unint64_t)anchorStyle
{
  return self->_anchorStyle;
}

- (void).cxx_destruct
{
}

@end