@interface SCWDatabasePollingCondition
- (SCWDatabasePollingCondition)initWithMinIntervalSinceLastSync:(double)a3;
- (double)minIntervalSinceLastSync;
@end

@implementation SCWDatabasePollingCondition

- (SCWDatabasePollingCondition)initWithMinIntervalSinceLastSync:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCWDatabasePollingCondition;
  result = [(SCWDatabasePollingCondition *)&v5 init];
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