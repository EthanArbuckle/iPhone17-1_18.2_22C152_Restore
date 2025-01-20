@interface ODDAlgorithm
- (id)description;
- (int)type;
- (void)setType:(int)a3;
@end

@implementation ODDAlgorithm

- (int)type
{
  return self->mType;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)ODDAlgorithm;
  v2 = [(ODDLayoutObject *)&v4 description];
  return v2;
}

@end