@interface OADAdjustRect
- (OADAdjustCoord)bottom;
- (OADAdjustCoord)left;
- (OADAdjustCoord)right;
- (OADAdjustCoord)top;
- (OADAdjustRect)initWithLeft:(OADAdjustCoord)a3 top:(OADAdjustCoord)a4 right:(OADAdjustCoord)a5 bottom:(OADAdjustCoord)a6;
- (id)description;
@end

@implementation OADAdjustRect

- (OADAdjustRect)initWithLeft:(OADAdjustCoord)a3 top:(OADAdjustCoord)a4 right:(OADAdjustCoord)a5 bottom:(OADAdjustCoord)a6
{
  v11.receiver = self;
  v11.super_class = (Class)OADAdjustRect;
  result = [(OADAdjustRect *)&v11 init];
  if (result)
  {
    result->mLeft = a3;
    result->mTop = a4;
    result->mRight = a5;
    result->mBottom = a6;
  }
  return result;
}

- (OADAdjustCoord)left
{
  return self->mLeft;
}

- (OADAdjustCoord)right
{
  return self->mRight;
}

- (OADAdjustCoord)top
{
  return self->mTop;
}

- (OADAdjustCoord)bottom
{
  return self->mBottom;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADAdjustRect;
  v2 = [(OADAdjustRect *)&v4 description];
  return v2;
}

@end