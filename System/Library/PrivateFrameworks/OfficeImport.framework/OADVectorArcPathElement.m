@interface OADVectorArcPathElement
- (BOOL)clockwise;
- (BOOL)connectedToPrevious;
- (OADAdjustCoord)bottom;
- (OADAdjustCoord)left;
- (OADAdjustCoord)right;
- (OADAdjustCoord)top;
- (OADAdjustPoint)endVector;
- (OADAdjustPoint)startVector;
- (OADVectorArcPathElement)initWithLeft:(OADAdjustCoord)a3 top:(OADAdjustCoord)a4 right:(OADAdjustCoord)a5 bottom:(OADAdjustCoord)a6 startVector:(OADAdjustPoint)a7 endVector:(OADAdjustPoint)a8 clockwise:(BOOL)a9 connectedToPrevious:(BOOL)a10;
@end

@implementation OADVectorArcPathElement

- (OADVectorArcPathElement)initWithLeft:(OADAdjustCoord)a3 top:(OADAdjustCoord)a4 right:(OADAdjustCoord)a5 bottom:(OADAdjustCoord)a6 startVector:(OADAdjustPoint)a7 endVector:(OADAdjustPoint)a8 clockwise:(BOOL)a9 connectedToPrevious:(BOOL)a10
{
  OADAdjustCoord y = a7.y;
  OADAdjustCoord x = a7.x;
  v17.receiver = self;
  v17.super_class = (Class)OADVectorArcPathElement;
  result = [(OADVectorArcPathElement *)&v17 init];
  if (result)
  {
    result->mLeft = a3;
    result->mTop = a4;
    result->mRight = a5;
    result->mBottom = a6;
    result->mStartVector.OADAdjustCoord x = x;
    result->mStartVector.OADAdjustCoord y = y;
    result->mEndVector = a8;
    result->mClockwise = a9;
    result->mConnectedToPrevious = a10;
  }
  return result;
}

- (OADAdjustCoord)left
{
  return self->mLeft;
}

- (OADAdjustCoord)top
{
  return self->mTop;
}

- (OADAdjustCoord)right
{
  return self->mRight;
}

- (OADAdjustCoord)bottom
{
  return self->mBottom;
}

- (OADAdjustPoint)startVector
{
  p_mStartVector = &self->mStartVector;
  OADAdjustCoord x = self->mStartVector.x;
  OADAdjustCoord y = p_mStartVector->y;
  result.OADAdjustCoord y = y;
  result.OADAdjustCoord x = x;
  return result;
}

- (OADAdjustPoint)endVector
{
  p_mEndVector = &self->mEndVector;
  OADAdjustCoord x = self->mEndVector.x;
  OADAdjustCoord y = p_mEndVector->y;
  result.OADAdjustCoord y = y;
  result.OADAdjustCoord x = x;
  return result;
}

- (BOOL)clockwise
{
  return self->mClockwise;
}

- (BOOL)connectedToPrevious
{
  return self->mConnectedToPrevious;
}

@end