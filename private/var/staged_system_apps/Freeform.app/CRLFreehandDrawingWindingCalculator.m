@interface CRLFreehandDrawingWindingCalculator
- (BOOL)isWindingClockwise;
- (void)addPoint:(CGPoint)a3;
@end

@implementation CRLFreehandDrawingWindingCalculator

- (void)addPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  lastInputPoints = self->_lastInputPoints;
  v7 = &self->_lastInputPoints[1];
  if (self->_hasPoints)
  {
    double v8 = self->_lastInputPoints[0].x;
    double v9 = sub_100064680(self->_lastInputPoints[1].x, self->_lastInputPoints[1].y, v8);
    double v11 = v10;
    double v12 = sub_100064680(x, y, v8);
    double v14 = sub_100064F08(v9, v11, v12, v13) + self->_totalCrossProduct;
    CGPoint *lastInputPoints = *v7;
    self->_lastInputPoints[1].double x = x;
    self->_lastInputPoints[1].double y = y;
    self->_totalCrossProduct = v14;
  }
  else
  {
    self->_lastInputPoints[1] = a3;
    CGPoint *lastInputPoints = *v7;
    self->_hasPoints = 1;
  }
}

- (BOOL)isWindingClockwise
{
  if (!self->_hasPoints)
  {
    id v3 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Can't compute path winding if the calculator doesn't have any points" userInfo:0];
    objc_exception_throw(v3);
  }
  return self->_totalCrossProduct < 0.0;
}

@end