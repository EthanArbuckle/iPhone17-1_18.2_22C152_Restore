@interface OADCubicBezierToPathElement
- (BOOL)relative;
- (OADAdjustPoint)controlPoint1;
- (OADAdjustPoint)controlPoint2;
- (OADAdjustPoint)toPoint;
- (OADCubicBezierToPathElement)initWithControlPoint1:(OADAdjustPoint)a3 controlPoint2:(OADAdjustPoint)a4 toPoint:(OADAdjustPoint)a5;
- (void)setRelative:(BOOL)a3;
@end

@implementation OADCubicBezierToPathElement

- (OADCubicBezierToPathElement)initWithControlPoint1:(OADAdjustPoint)a3 controlPoint2:(OADAdjustPoint)a4 toPoint:(OADAdjustPoint)a5
{
  OADAdjustCoord y = a5.y;
  OADAdjustCoord x = a5.x;
  OADAdjustCoord v7 = a4.y;
  OADAdjustCoord v8 = a4.x;
  OADAdjustCoord v9 = a3.y;
  OADAdjustCoord v10 = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)OADCubicBezierToPathElement;
  result = [(OADCubicBezierToPathElement *)&v12 init];
  if (result)
  {
    result->mControlPoint1.OADAdjustCoord x = v10;
    result->mControlPoint1.OADAdjustCoord y = v9;
    result->mControlPoint2.OADAdjustCoord x = v8;
    result->mControlPoint2.OADAdjustCoord y = v7;
    result->mToPoint.OADAdjustCoord x = x;
    result->mToPoint.OADAdjustCoord y = y;
  }
  return result;
}

- (void)setRelative:(BOOL)a3
{
  self->mRelative = a3;
}

- (OADAdjustPoint)toPoint
{
  p_mToPoint = &self->mToPoint;
  OADAdjustCoord x = self->mToPoint.x;
  OADAdjustCoord y = p_mToPoint->y;
  result.OADAdjustCoord y = y;
  result.OADAdjustCoord x = x;
  return result;
}

- (OADAdjustPoint)controlPoint1
{
  p_mControlPoint1 = &self->mControlPoint1;
  OADAdjustCoord x = self->mControlPoint1.x;
  OADAdjustCoord y = p_mControlPoint1->y;
  result.OADAdjustCoord y = y;
  result.OADAdjustCoord x = x;
  return result;
}

- (OADAdjustPoint)controlPoint2
{
  p_mControlPoint2 = &self->mControlPoint2;
  OADAdjustCoord x = self->mControlPoint2.x;
  OADAdjustCoord y = p_mControlPoint2->y;
  result.OADAdjustCoord y = y;
  result.OADAdjustCoord x = x;
  return result;
}

- (BOOL)relative
{
  return self->mRelative;
}

@end