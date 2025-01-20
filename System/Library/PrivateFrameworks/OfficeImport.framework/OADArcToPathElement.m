@interface OADArcToPathElement
- (OADAdjustCoord)angleLength;
- (OADAdjustCoord)startAngle;
- (OADAdjustPoint)semiaxes;
- (OADArcToPathElement)initWithSemiaxes:(OADAdjustPoint)a3 startAngle:(OADAdjustCoord)a4 angleLength:(OADAdjustCoord)a5;
@end

@implementation OADArcToPathElement

- (OADArcToPathElement)initWithSemiaxes:(OADAdjustPoint)a3 startAngle:(OADAdjustCoord)a4 angleLength:(OADAdjustCoord)a5
{
  OADAdjustCoord y = a3.y;
  OADAdjustCoord x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)OADArcToPathElement;
  result = [(OADArcToPathElement *)&v10 init];
  if (result)
  {
    result->mSemiaxes.OADAdjustCoord x = x;
    result->mSemiaxes.OADAdjustCoord y = y;
    result->mStartAngle = a4;
    result->mAngleLength = a5;
  }
  return result;
}

- (OADAdjustPoint)semiaxes
{
  p_mSemiaxes = &self->mSemiaxes;
  OADAdjustCoord x = self->mSemiaxes.x;
  OADAdjustCoord y = p_mSemiaxes->y;
  result.OADAdjustCoord y = y;
  result.OADAdjustCoord x = x;
  return result;
}

- (OADAdjustCoord)startAngle
{
  return self->mStartAngle;
}

- (OADAdjustCoord)angleLength
{
  return self->mAngleLength;
}

@end