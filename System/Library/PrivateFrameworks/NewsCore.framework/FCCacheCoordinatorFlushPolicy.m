@interface FCCacheCoordinatorFlushPolicy
- (BOOL)alwaysFlushKeysWithZeroInterest;
- (FCCacheCoordinatorFlushPolicy)initWithLowWaterMark:(unint64_t)a3 highWaterMark:(unint64_t)a4 alwaysFlushKeysWithZeroInterest:(BOOL)a5;
- (unint64_t)highWaterMark;
- (unint64_t)lowWaterMark;
@end

@implementation FCCacheCoordinatorFlushPolicy

- (FCCacheCoordinatorFlushPolicy)initWithLowWaterMark:(unint64_t)a3 highWaterMark:(unint64_t)a4 alwaysFlushKeysWithZeroInterest:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)FCCacheCoordinatorFlushPolicy;
  result = [(FCCacheCoordinatorFlushPolicy *)&v9 init];
  if (result)
  {
    result->_highWaterMark = a4;
    result->_lowWaterMark = a3;
    result->_alwaysFlushKeysWithZeroInterest = a5;
  }
  return result;
}

- (unint64_t)highWaterMark
{
  return self->_highWaterMark;
}

- (BOOL)alwaysFlushKeysWithZeroInterest
{
  return self->_alwaysFlushKeysWithZeroInterest;
}

- (unint64_t)lowWaterMark
{
  return self->_lowWaterMark;
}

@end