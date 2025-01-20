@interface CompassBearingView
- (CompassBearingView)initWithFrame:(CGRect)a3;
- (double)bearing;
- (double)innerRadius;
- (double)outerRadius;
- (void)layoutSubviews;
- (void)setBearing:(double)a3;
- (void)setCompassHeading:(double)a3;
- (void)setInnerRadius:(double)a3;
- (void)setOuterRadius:(double)a3;
- (void)updateLayer;
@end

@implementation CompassBearingView

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)CompassBearingView;
  [(CompassBearingView *)&v22 layoutSubviews];
  [(CompassBearingView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[CAShapeLayer setFrame:](self->_bearingDeviationLayer, "setFrame:");
  if (self->_bearing == 1.79769313e308
    || (double startAngle = self->_startAngle, endAngle = self->_endAngle, startAngle == endAngle))
  {
    [(CAShapeLayer *)self->_bearingDeviationLayer setPath:0];
  }
  else
  {
    BOOL v13 = startAngle >= endAngle;
    BOOL v14 = startAngle < endAngle;
    v23.origin.x = v4;
    v23.origin.y = v6;
    v23.size.width = v8;
    v23.size.height = v10;
    double MidX = CGRectGetMidX(v23);
    v24.origin.x = v4;
    v24.origin.y = v6;
    v24.size.width = v8;
    v24.size.height = v10;
    double MidY = CGRectGetMidY(v24);
    v17 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", v14, MidX, MidY, self->_innerRadius, self->_startAngle, self->_endAngle);
    double outerRadius = self->_outerRadius;
    __double2 v19 = __sincos_stret(self->_endAngle);
    [v17 addLineToPoint:MidX + outerRadius * v19.__cosval, MidY + outerRadius * v19.__sinval];
    [v17 addArcWithCenter:v13, MidX, MidY, self->_outerRadius, self->_endAngle, self->_startAngle];
    bearingDeviationLayer = self->_bearingDeviationLayer;
    id v21 = v17;
    -[CAShapeLayer setPath:](bearingDeviationLayer, "setPath:", [v21 CGPath]);
  }
}

- (CompassBearingView)initWithFrame:(CGRect)a3
{
  double width = a3.size.width;
  v13.receiver = self;
  v13.super_class = (Class)CompassBearingView;
  CGFloat v4 = -[CompassBearingView initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    uint64_t v5 = +[CAShapeLayer layer];
    bearingDeviationLayer = v4->_bearingDeviationLayer;
    v4->_bearingDeviationLayer = (CAShapeLayer *)v5;

    v4->_innerRadius = sub_1000068D8(width);
    v4->_double outerRadius = sub_100006898(width);
    v4->_bearing = 1.79769313e308;
    double v7 = v4->_bearingDeviationLayer;
    id v8 = +[UIColor clearColor];
    -[CAShapeLayer setStrokeColor:](v7, "setStrokeColor:", [v8 CGColor]);

    double v9 = v4->_bearingDeviationLayer;
    id v10 = +[UIColor redColor];
    -[CAShapeLayer setFillColor:](v9, "setFillColor:", [v10 CGColor]);

    v11 = [(CompassBearingView *)v4 layer];
    [v11 addSublayer:v4->_bearingDeviationLayer];
  }
  return v4;
}

- (void)setCompassHeading:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CompassBearingView;
  [(CompassBearingView *)&v4 setCompassHeading:a3];
  [(CompassBearingView *)self updateLayer];
}

- (void)updateLayer
{
  [(CompassBearingView *)self angle];
  long double v4 = fmod(v3, 6.28318531);
  double v5 = 270.0 * 3.14159265 / 180.0;
  self->_double startAngle = v5;
  double v6 = sub_100004F34(v5, v4 + v5 + self->_bearing * 3.14159265 / 180.0);
  if (vabdd_f64(v6, self->_endAngle) > 0.00100000005)
  {
    self->_double endAngle = v6;
    [(CompassBearingView *)self setNeedsLayout];
  }
}

- (void)setBearing:(double)a3
{
  self->_bearing = a3;
  [(CompassBearingView *)self updateLayer];
}

- (double)bearing
{
  return self->_bearing;
}

- (double)innerRadius
{
  return self->_innerRadius;
}

- (void)setInnerRadius:(double)a3
{
  self->_innerRadius = a3;
}

- (double)outerRadius
{
  return self->_outerRadius;
}

- (void)setOuterRadius:(double)a3
{
  self->_double outerRadius = a3;
}

- (void).cxx_destruct
{
}

@end