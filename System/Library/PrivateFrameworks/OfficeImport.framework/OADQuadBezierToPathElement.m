@interface OADQuadBezierToPathElement
- (OADAdjustPoint)controlPoint;
- (OADAdjustPoint)toPoint;
- (OADQuadBezierToPathElement)initWithControlPoint:(OADAdjustPoint)a3 toPoint:(OADAdjustPoint)a4;
@end

@implementation OADQuadBezierToPathElement

- (OADQuadBezierToPathElement)initWithControlPoint:(OADAdjustPoint)a3 toPoint:(OADAdjustPoint)a4
{
  OADAdjustCoord y = a4.y;
  OADAdjustCoord x = a4.x;
  OADAdjustCoord v6 = a3.y;
  OADAdjustCoord v7 = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)OADQuadBezierToPathElement;
  result = [(OADQuadBezierToPathElement *)&v9 init];
  if (result)
  {
    result->mControlPoint.OADAdjustCoord x = v7;
    result->mControlPoint.OADAdjustCoord y = v6;
    result->mToPoint.OADAdjustCoord x = x;
    result->mToPoint.OADAdjustCoord y = y;
  }
  return result;
}

- (OADAdjustPoint)controlPoint
{
  p_mControlPoint = &self->mControlPoint;
  OADAdjustCoord x = self->mControlPoint.x;
  OADAdjustCoord y = p_mControlPoint->y;
  result.OADAdjustCoord y = y;
  result.OADAdjustCoord x = x;
  return result;
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

@end