@interface CLDistributedSensingSubscriptionClient
- (BOOL)valid;
- (CLDistributedSensingSubscriptionClient)initWithSubscription:(CLDistributedSensingSubscription *)a3;
- (void)invalidate;
- (void)onVehicleStateUpdate:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLDistributedSensingSubscriptionClient

- (CLDistributedSensingSubscriptionClient)initWithSubscription:(CLDistributedSensingSubscription *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLDistributedSensingSubscriptionClient;
  result = [(CLDistributedSensingSubscriptionClient *)&v5 init];
  if (result)
  {
    result->_subscription = a3;
    result->_valid = 1;
  }
  return result;
}

- (void)invalidate
{
  self->_valid = 0;
}

- (void)onVehicleStateUpdate:(id)a3
{
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