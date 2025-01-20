@interface UniqueAnimationKeyCounter
- (BOOL)isFinishedUsingAllKeys;
- (unint64_t)nextAnimationKey;
- (void)didFinishUsingAnimationKey;
@end

@implementation UniqueAnimationKeyCounter

- (unint64_t)nextAnimationKey
{
  unint64_t nextAnimationKey = self->_nextAnimationKey;
  self->_unint64_t nextAnimationKey = nextAnimationKey + 1;
  return nextAnimationKey;
}

- (void)didFinishUsingAnimationKey
{
}

- (BOOL)isFinishedUsingAllKeys
{
  return self->_finishedUsingKeys == self->_nextAnimationKey;
}

@end