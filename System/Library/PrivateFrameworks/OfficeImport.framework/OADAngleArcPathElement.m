@interface OADAngleArcPathElement
- (BOOL)connectedToPrevious;
- (OADAdjustCoord)angleLength;
- (OADAdjustCoord)startAngle;
- (OADAdjustPoint)center;
- (OADAdjustPoint)semiaxes;
- (OADAngleArcPathElement)initWithCenter:(OADAdjustPoint)a3 semiaxes:(OADAdjustPoint)a4 startAngle:(OADAdjustCoord)a5 angleLength:(OADAdjustCoord)a6 connectedToPrevious:(BOOL)a7;
@end

@implementation OADAngleArcPathElement

- (OADAngleArcPathElement)initWithCenter:(OADAdjustPoint)a3 semiaxes:(OADAdjustPoint)a4 startAngle:(OADAdjustCoord)a5 angleLength:(OADAdjustCoord)a6 connectedToPrevious:(BOOL)a7
{
  OADAdjustCoord y = a4.y;
  OADAdjustCoord x = a4.x;
  OADAdjustCoord v11 = a3.y;
  OADAdjustCoord v12 = a3.x;
  v14.receiver = self;
  v14.super_class = (Class)OADAngleArcPathElement;
  result = [(OADAngleArcPathElement *)&v14 init];
  if (result)
  {
    result->mCenter.OADAdjustCoord x = v12;
    result->mCenter.OADAdjustCoord y = v11;
    result->mSemiaxes.OADAdjustCoord x = x;
    result->mSemiaxes.OADAdjustCoord y = y;
    result->mStartAngle = a5;
    result->mAngleLength = a6;
    result->mConnectedToPrevious = a7;
  }
  return result;
}

- (OADAdjustPoint)center
{
  p_mCenter = &self->mCenter;
  OADAdjustCoord x = self->mCenter.x;
  OADAdjustCoord y = p_mCenter->y;
  result.OADAdjustCoord y = y;
  result.OADAdjustCoord x = x;
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

- (BOOL)connectedToPrevious
{
  return self->mConnectedToPrevious;
}

@end