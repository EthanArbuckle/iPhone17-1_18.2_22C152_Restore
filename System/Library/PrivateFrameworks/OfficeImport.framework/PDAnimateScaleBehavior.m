@interface PDAnimateScaleBehavior
- (BOOL)hasBy;
- (BOOL)hasFrom;
- (BOOL)hasTo;
- (BOOL)isEqual:(id)a3;
- (CGPoint)by;
- (CGPoint)from;
- (CGPoint)to;
- (PDAnimateScaleBehavior)init;
- (unint64_t)hash;
- (void)setBy:(CGPoint)a3;
- (void)setFrom:(CGPoint)a3;
- (void)setTo:(CGPoint)a3;
@end

@implementation PDAnimateScaleBehavior

- (PDAnimateScaleBehavior)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDAnimateScaleBehavior;
  return [(PDAnimateBehavior *)&v3 init];
}

- (void)setFrom:(CGPoint)a3
{
  self->mHasFrom = 1;
  self->mFrom = a3;
}

- (void)setTo:(CGPoint)a3
{
  self->mHasTo = 1;
  self->mTo = a3;
}

- (void)setBy:(CGPoint)a3
{
  self->mHasBy = 1;
  self->mBy = a3;
}

- (BOOL)hasTo
{
  return self->mHasTo;
}

- (CGPoint)to
{
  double x = self->mTo.x;
  double y = self->mTo.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)hasFrom
{
  return self->mHasFrom;
}

- (CGPoint)from
{
  double x = self->mFrom.x;
  double y = self->mFrom.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)hasBy
{
  return self->mHasBy;
}

- (CGPoint)by
{
  double x = self->mBy.x;
  double y = self->mBy.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TSUDynamicCast(v5, (uint64_t)v4);
  v7 = v6;
  if (!v6) {
    goto LABEL_11;
  }
  double x = self->mTo.x;
  double y = self->mTo.y;
  [v6 to];
  BOOL v12 = x == v11 && y == v10;
  if (v12
    && ((double v13 = self->mFrom.x, v14 = self->mFrom.y, [v7 from], v13 == v16)
      ? (BOOL v17 = v14 == v15)
      : (BOOL v17 = 0),
        v17))
  {
    double v20 = self->mBy.x;
    double v21 = self->mBy.y;
    [v7 by];
    double v23 = v22;
    double v25 = v24;

    if (v20 == v23 && v21 == v25)
    {
      v27.receiver = self;
      v27.super_class = (Class)PDAnimateScaleBehavior;
      BOOL v18 = [(PDAnimateBehavior *)&v27 isEqual:v4];
      goto LABEL_13;
    }
  }
  else
  {
LABEL_11:
  }
  BOOL v18 = 0;
LABEL_13:

  return v18;
}

- (unint64_t)hash
{
  if (self->mHasTo) {
    unint64_t v2 = (unint64_t)self->mTo.y ^ (unint64_t)self->mTo.x;
  }
  else {
    unint64_t v2 = 0;
  }
  if (self->mHasFrom) {
    v2 ^= (unint64_t)self->mFrom.x ^ (unint64_t)self->mFrom.y;
  }
  if (self->mHasBy) {
    v2 ^= (unint64_t)self->mBy.x ^ (unint64_t)self->mBy.y;
  }
  return v2;
}

@end