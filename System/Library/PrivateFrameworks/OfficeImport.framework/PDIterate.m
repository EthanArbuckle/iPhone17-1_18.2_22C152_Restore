@interface PDIterate
- (BOOL)isBackwards;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValuePercentage;
- (double)value;
- (int)type;
- (unint64_t)hash;
- (void)setIsBackwards:(BOOL)a3;
- (void)setIsValuePercentage:(BOOL)a3;
- (void)setType:(int)a3;
- (void)setValue:(double)a3;
@end

@implementation PDIterate

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (int)type
{
  return self->mType;
}

- (BOOL)isBackwards
{
  return self->mIsBackwards;
}

- (void)setIsBackwards:(BOOL)a3
{
  self->mIsBackwards = a3;
}

- (BOOL)isValuePercentage
{
  return self->mIsPercentage;
}

- (void)setIsValuePercentage:(BOOL)a3
{
  self->mIsPercentage = a3;
}

- (double)value
{
  return self->mValue;
}

- (void)setValue:(double)a3
{
  self->mValue = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TSUDynamicCast(v5, (uint64_t)v4);
  v7 = v6;
  if (v6
    && (int mType = self->mType, mType == [v6 type])
    && (int mIsBackwards = self->mIsBackwards, mIsBackwards == [v7 isBackwards])
    && (int mIsPercentage = self->mIsPercentage, mIsPercentage == [v7 isValuePercentage]))
  {
    double mValue = self->mValue;
    [v7 value];
    BOOL v13 = mValue == v12;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v2 = ((unint64_t)self->mValue << 8) + (self->mType << 16);
  v4.receiver = self;
  v4.super_class = (Class)PDIterate;
  return [(PDIterate *)&v4 hash] + v2;
}

@end