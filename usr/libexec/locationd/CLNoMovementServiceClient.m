@interface CLNoMovementServiceClient
- (BOOL)valid;
- (CLNoMovementServiceClient)initWithSubscription:(CLNoMovementSubscription *)a3;
- (void)invalidate;
- (void)onStateUpdate:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLNoMovementServiceClient

- (CLNoMovementServiceClient)initWithSubscription:(CLNoMovementSubscription *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLNoMovementServiceClient;
  result = [(CLNoMovementServiceClient *)&v5 init];
  if (result) {
    result->_subscription = a3;
  }
  result->_valid = 1;
  return result;
}

- (void)onStateUpdate:(id)a3
{
  subscription = self->_subscription;
  if (subscription) {
    sub_100DFCE48((uint64_t)subscription, (uint64_t)a3);
  }
}

- (void)invalidate
{
  self->_valid = 0;
  self->_subscription = 0;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end