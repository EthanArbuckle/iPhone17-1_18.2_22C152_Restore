@interface PDParallelTimeNodeBuildInfo
- (PDAnimationTarget)target;
- (double)delay;
- (double)duration;
- (id)value;
- (int)iterateType;
- (void)setDelay:(double)a3;
- (void)setDuration:(double)a3;
- (void)setIterateType:(int)a3;
- (void)setTarget:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation PDParallelTimeNodeBuildInfo

- (PDAnimationTarget)target
{
  return (PDAnimationTarget *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTarget:(id)a3
{
}

- (double)delay
{
  return self->mDelay;
}

- (void)setDelay:(double)a3
{
  self->mDelay = a3;
}

- (double)duration
{
  return self->mDuration;
}

- (void)setDuration:(double)a3
{
  self->mDuration = a3;
}

- (int)iterateType
{
  return self->mIterateType;
}

- (void)setIterateType:(int)a3
{
  self->mIterateType = a3;
}

- (id)value
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mValue, 0);
  objc_storeStrong((id *)&self->mTarget, 0);
}

@end