@interface SPCCurvePoint
+ (id)pointWithX:(double)a3 y:(double)a4;
- (CGPoint)CGPoint;
- (CGPoint)leftTangentPoint;
- (CGPoint)rightTangentPoint;
- (SPCCurvePoint)initWithX:(double)a3 y:(double)a4;
- (double)roundness;
- (double)smoothness;
- (double)x;
- (double)y;
- (void)setCGPoint:(CGPoint)a3;
- (void)setLeftTangentPoint:(CGPoint)a3;
- (void)setRightTangentPoint:(CGPoint)a3;
- (void)setRoundness:(double)a3;
- (void)setSmoothness:(double)a3;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
@end

@implementation SPCCurvePoint

- (void)setSmoothness:(double)a3
{
  self->_smoothness = a3;
}

- (double)smoothness
{
  return self->_smoothness;
}

- (void)setRoundness:(double)a3
{
  self->_roundness = a3;
}

- (double)roundness
{
  return self->_roundness;
}

- (void)setRightTangentPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_rightTangentPoint, &v3, 16, 1, 0);
}

- (CGPoint)rightTangentPoint
{
  objc_copyStruct(v4, &self->_rightTangentPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setLeftTangentPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_leftTangentPoint, &v3, 16, 1, 0);
}

- (CGPoint)leftTangentPoint
{
  objc_copyStruct(v4, &self->_leftTangentPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setY:(double)a3
{
  self->_y = a3;
}

- (double)y
{
  return self->_y;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (double)x
{
  return self->_x;
}

- (CGPoint)CGPoint
{
  double x = self->_x;
  double y = self->_y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCGPoint:(CGPoint)a3
{
  *(CGPoint *)&self->_double x = a3;
}

- (SPCCurvePoint)initWithX:(double)a3 y:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SPCCurvePoint;
  CGPoint result = [(SPCCurvePoint *)&v7 init];
  if (result)
  {
    result->_double x = a3;
    result->_double y = a4;
  }
  return result;
}

+ (id)pointWithX:(double)a3 y:(double)a4
{
  v4 = [[SPCCurvePoint alloc] initWithX:a3 y:a4];
  return v4;
}

@end