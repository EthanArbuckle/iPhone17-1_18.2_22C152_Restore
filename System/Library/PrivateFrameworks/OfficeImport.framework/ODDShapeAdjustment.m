@interface ODDShapeAdjustment
- (double)value;
- (id)description;
- (unsigned)index;
- (void)setIndex:(unsigned int)a3;
- (void)setValue:(double)a3;
@end

@implementation ODDShapeAdjustment

- (unsigned)index
{
  return self->mIndex;
}

- (void)setIndex:(unsigned int)a3
{
  self->mIndex = a3;
}

- (double)value
{
  return self->mValue;
}

- (void)setValue:(double)a3
{
  self->mValue = a3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)ODDShapeAdjustment;
  v2 = [(ODDShapeAdjustment *)&v4 description];
  return v2;
}

@end