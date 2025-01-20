@interface UIKBStrokeSample
- (CGPoint)point;
- (UIKBStrokeSample)initWithPoint:(CGPoint)a3 timestamp:(double)a4;
- (double)timestamp;
- (void)setPoint:(CGPoint)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation UIKBStrokeSample

- (UIKBStrokeSample)initWithPoint:(CGPoint)a3 timestamp:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)UIKBStrokeSample;
  v7 = [(UIKBStrokeSample *)&v10 init];
  v8 = v7;
  if (v7)
  {
    -[UIKBStrokeSample setPoint:](v7, "setPoint:", x, y);
    [(UIKBStrokeSample *)v8 setTimestamp:a4];
  }
  return v8;
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->_point = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end