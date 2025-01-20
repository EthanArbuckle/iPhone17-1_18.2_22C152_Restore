@interface SCKDatabasePollingCondition
- (SCKDatabasePollingCondition)initWithMinIntervalSinceLastSync:(double)a3;
- (double)minIntervalSinceLastSync;
@end

@implementation SCKDatabasePollingCondition

- (SCKDatabasePollingCondition)initWithMinIntervalSinceLastSync:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCKDatabasePollingCondition;
  result = [(SCKDatabasePollingCondition *)&v5 init];
  if (result) {
    result->_minIntervalSinceLastSync = a3;
  }
  return result;
}

- (double)minIntervalSinceLastSync
{
  return self->_minIntervalSinceLastSync;
}

@end