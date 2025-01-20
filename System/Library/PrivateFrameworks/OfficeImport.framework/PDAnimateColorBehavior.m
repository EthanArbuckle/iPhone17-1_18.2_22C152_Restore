@interface PDAnimateColorBehavior
- (BOOL)hasBy;
- (BOOL)hasColorDirection;
- (BOOL)hasColorSpace;
- (BOOL)hasFrom;
- (BOOL)hasTo;
- (double)by;
- (id)from;
- (id)to;
- (int)colorSpace;
- (int)direction;
- (void)setBy:(double)a3[3];
- (void)setColorSpace:(int)a3;
- (void)setDirection:(int)a3;
- (void)setFrom:(id)a3;
- (void)setTo:(id)a3;
@end

@implementation PDAnimateColorBehavior

- (BOOL)hasBy
{
  return self->mHasBy;
}

- (double)by
{
  return (double (*)[3])self->mBy;
}

- (void)setBy:(double)a3[3]
{
  self->mHasBy = 1;
  self->mBy[0] = *a3;
  self->mBy[1] = a3[1];
  self->mBy[2] = a3[2];
}

- (BOOL)hasFrom
{
  return self->mHasFrom;
}

- (id)from
{
  return self->mFrom;
}

- (void)setFrom:(id)a3
{
  self->mHasFrom = 1;
  objc_storeStrong((id *)&self->mFrom, a3);
}

- (BOOL)hasTo
{
  return self->mHasTo;
}

- (id)to
{
  return self->mTo;
}

- (void)setTo:(id)a3
{
  self->mHasTo = 1;
  objc_storeStrong((id *)&self->mTo, a3);
}

- (BOOL)hasColorSpace
{
  return self->mHasColorSpace;
}

- (int)colorSpace
{
  return self->mColorSpace;
}

- (void)setColorSpace:(int)a3
{
  self->mHasColorSpace = 1;
  self->mColorSpace = a3;
}

- (BOOL)hasColorDirection
{
  return self->mHasColorDirection;
}

- (int)direction
{
  return self->mDirection;
}

- (void)setDirection:(int)a3
{
  self->mHasColorDirection = 1;
  self->mDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTo, 0);
  objc_storeStrong((id *)&self->mFrom, 0);
}

@end