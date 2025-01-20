@interface _UIAnimatedTextSpacerAnimationInfo
- (double)endHeight;
- (double)startHeight;
- (void)setEndHeight:(double)a3;
- (void)setStartHeight:(double)a3;
@end

@implementation _UIAnimatedTextSpacerAnimationInfo

- (double)startHeight
{
  return self->_startHeight;
}

- (void)setStartHeight:(double)a3
{
  self->_startHeight = a3;
}

- (double)endHeight
{
  return self->_endHeight;
}

- (void)setEndHeight:(double)a3
{
  self->_endHeight = a3;
}

@end