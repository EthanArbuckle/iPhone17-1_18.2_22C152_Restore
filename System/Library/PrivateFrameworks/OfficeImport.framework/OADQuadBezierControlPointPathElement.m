@interface OADQuadBezierControlPointPathElement
- (OADAdjustPoint)controlPoint;
- (OADQuadBezierControlPointPathElement)initWithControlPoint:(OADAdjustPoint)a3;
@end

@implementation OADQuadBezierControlPointPathElement

- (OADQuadBezierControlPointPathElement)initWithControlPoint:(OADAdjustPoint)a3
{
  OADAdjustCoord y = a3.y;
  OADAdjustCoord x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)OADQuadBezierControlPointPathElement;
  result = [(OADQuadBezierControlPointPathElement *)&v6 init];
  if (result)
  {
    result->mControlPoint.OADAdjustCoord x = x;
    result->mControlPoint.OADAdjustCoord y = y;
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

@end