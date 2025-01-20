@interface PDAnimateTimeBehavior
- (BOOL)hasCalcMode;
- (BOOL)hasValueType;
- (PDAnimateTimeBehavior)init;
- (id)by;
- (id)from;
- (id)to;
- (int)calcMode;
- (int)valueType;
- (void)setBy:(id)a3;
- (void)setCalcMode:(int)a3;
- (void)setFrom:(id)a3;
- (void)setTo:(id)a3;
- (void)setValueType:(int)a3;
@end

@implementation PDAnimateTimeBehavior

- (PDAnimateTimeBehavior)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDAnimateTimeBehavior;
  return [(PDAnimateBehavior *)&v3 init];
}

- (id)to
{
  return self->mTo;
}

- (void)setTo:(id)a3
{
}

- (id)from
{
  return self->mFrom;
}

- (void)setFrom:(id)a3
{
}

- (id)by
{
  return self->mBy;
}

- (void)setBy:(id)a3
{
}

- (BOOL)hasCalcMode
{
  return self->mHasCalcMode;
}

- (int)calcMode
{
  return self->mCalcMode;
}

- (void)setCalcMode:(int)a3
{
  self->mHasCalcMode = 1;
  self->mCalcMode = a3;
}

- (BOOL)hasValueType
{
  return self->mHasValueType;
}

- (int)valueType
{
  return self->mValueType;
}

- (void)setValueType:(int)a3
{
  self->mHasValueType = 1;
  self->mValueType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBy, 0);
  objc_storeStrong((id *)&self->mFrom, 0);
  objc_storeStrong((id *)&self->mTo, 0);
}

@end