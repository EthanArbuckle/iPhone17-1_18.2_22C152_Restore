@interface OADToPointPathElement
- (BOOL)relative;
- (OADAdjustPoint)toPoint;
- (OADToPointPathElement)initWithToPoint:(OADAdjustPoint)a3;
- (void)setRelative:(BOOL)a3;
@end

@implementation OADToPointPathElement

- (OADToPointPathElement)initWithToPoint:(OADAdjustPoint)a3
{
  OADAdjustCoord y = a3.y;
  OADAdjustCoord x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)OADToPointPathElement;
  result = [(OADToPointPathElement *)&v6 init];
  if (result)
  {
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

- (BOOL)relative
{
  return self->mRelative;
}

@end