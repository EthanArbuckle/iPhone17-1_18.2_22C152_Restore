@interface ODDIteratorAttributes
- (BOOL)hideLastTransition;
- (int)axis;
- (int)pointType;
- (int)start;
- (int)step;
- (unsigned)count;
- (void)setAxis:(int)a3;
- (void)setCount:(unsigned int)a3;
- (void)setHideLastTransition:(BOOL)a3;
- (void)setPointType:(int)a3;
- (void)setStart:(int)a3;
- (void)setStep:(int)a3;
@end

@implementation ODDIteratorAttributes

- (int)axis
{
  return self->mAxis;
}

- (void)setAxis:(int)a3
{
  self->mAxis = a3;
}

- (int)pointType
{
  return self->mPointType;
}

- (void)setPointType:(int)a3
{
  self->mPointType = a3;
}

- (BOOL)hideLastTransition
{
  return self->mHideLastTransition;
}

- (void)setHideLastTransition:(BOOL)a3
{
  self->mHideLastTransition = a3;
}

- (int)start
{
  return self->mStart;
}

- (void)setStart:(int)a3
{
  self->mStart = a3;
}

- (unsigned)count
{
  return self->mCount;
}

- (void)setCount:(unsigned int)a3
{
  self->mCount = a3;
}

- (int)step
{
  return self->mStep;
}

- (void)setStep:(int)a3
{
  self->mStep = a3;
}

@end