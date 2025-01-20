@interface PDAnimateRotateBehavior
- (BOOL)hasBy;
- (BOOL)hasFrom;
- (BOOL)hasTo;
- (PDAnimateRotateBehavior)init;
- (double)by;
- (double)from;
- (double)to;
- (void)setBy:(double)a3;
- (void)setFrom:(double)a3;
- (void)setTo:(double)a3;
@end

@implementation PDAnimateRotateBehavior

- (PDAnimateRotateBehavior)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDAnimateRotateBehavior;
  return [(PDAnimateBehavior *)&v3 init];
}

- (void)setBy:(double)a3
{
  self->mHasBy = 1;
  self->mBy = a3;
}

- (BOOL)hasTo
{
  return self->mHasTo;
}

- (double)to
{
  return self->mTo;
}

- (void)setTo:(double)a3
{
  self->mHasTo = 1;
  self->mTo = a3;
}

- (BOOL)hasFrom
{
  return self->mHasFrom;
}

- (double)from
{
  return self->mFrom;
}

- (void)setFrom:(double)a3
{
  self->mHasFrom = 1;
  self->mFrom = a3;
}

- (BOOL)hasBy
{
  return self->mHasBy;
}

- (double)by
{
  return self->mBy;
}

@end