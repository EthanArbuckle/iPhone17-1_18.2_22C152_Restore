@interface CompassTriangleView
- (CompassTriangleView)initWithFrame:(CGRect)a3;
- (double)triangleRadius;
- (id)triangleView;
- (void)layoutSubviews;
- (void)setCompassHeading:(double)a3;
- (void)setTriangleRadius:(double)a3;
@end

@implementation CompassTriangleView

- (id)triangleView
{
  triangleView = self->_triangleView;
  if (!triangleView)
  {
    v4 = +[UIImage imageNamed:@"northMarker"];
    v5 = (UIView *)[objc_alloc((Class)UIImageView) initWithImage:v4];
    v6 = self->_triangleView;
    self->_triangleView = v5;

    [(CompassTriangleView *)self addSubview:self->_triangleView];
    triangleView = self->_triangleView;
  }

  return triangleView;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)CompassTriangleView;
  [(CompassTriangleView *)&v8 layoutSubviews];
  [(CompassTriangleView *)self bounds];
  double MidX = CGRectGetMidX(v9);
  [(CompassTriangleView *)self bounds];
  double MidY = CGRectGetMidY(v10);
  v5 = [(CompassTriangleView *)self triangleView];
  double triangleRadius = self->_triangleRadius;
  __double2 v7 = __sincos_stret((double)((int)(270.0 + 0.0) % 360) * 3.14159265 / 180.0);
  [v5 setCenter:MidX + triangleRadius * v7.__cosval, MidY + triangleRadius * v7.__sinval];
}

- (void)setCompassHeading:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CompassTriangleView;
  [(CompassTriangleView *)&v6 setCompassHeading:a3];
  v4 = [(CompassTriangleView *)self layer];
  [(CompassTriangleView *)self angle];
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setValue:v5 forKeyPath:@"transform.rotation.z"];
}

- (void)setTriangleRadius:(double)a3
{
  self->_double triangleRadius = a3;
  [(CompassTriangleView *)self setNeedsLayout];
}

- (CompassTriangleView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CompassTriangleView;
  return -[CompassTriangleView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (double)triangleRadius
{
  return self->_triangleRadius;
}

- (void).cxx_destruct
{
}

@end