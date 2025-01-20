@interface CLStepCountSubscriptionAdapter
- (BOOL)valid;
- (CLStepCountSubscriptionAdapter)initWithStepCountSubscription:(void *)a3;
- (void)setStepCountSubscription:(void *)a3;
- (void)setValid:(BOOL)a3;
- (void)stepCountSubscription;
@end

@implementation CLStepCountSubscriptionAdapter

- (CLStepCountSubscriptionAdapter)initWithStepCountSubscription:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLStepCountSubscriptionAdapter;
  result = [(CLStepCountSubscriptionAdapter *)&v5 init];
  if (result) {
    result->_stepCountSubscription = a3;
  }
  return result;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)stepCountSubscription
{
  return self->_stepCountSubscription;
}

- (void)setStepCountSubscription:(void *)a3
{
  self->_stepCountSubscription = a3;
}

@end