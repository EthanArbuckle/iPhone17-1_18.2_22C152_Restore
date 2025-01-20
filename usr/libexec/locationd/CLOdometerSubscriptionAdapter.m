@interface CLOdometerSubscriptionAdapter
- (BOOL)valid;
- (CLOdometerSubscriptionAdapter)initWithOdometerSubscription:(void *)a3;
- (void)onCyclingDistanceUpdate:(id)a3;
- (void)setSubscription:(void *)a3;
- (void)setValid:(BOOL)a3;
- (void)subscription;
@end

@implementation CLOdometerSubscriptionAdapter

- (CLOdometerSubscriptionAdapter)initWithOdometerSubscription:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLOdometerSubscriptionAdapter;
  result = [(CLOdometerSubscriptionAdapter *)&v5 init];
  if (result) {
    result->_subscription = a3;
  }
  return result;
}

- (void)onCyclingDistanceUpdate:(id)a3
{
  v4 = [(CLOdometerSubscriptionAdapter *)self subscription];
  (*((void (**)(void **__return_ptr, id))a3 + 2))(__p, a3);
  sub_101146680((uint64_t)v4, (double **)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(void *)a3
{
  self->_subscription = a3;
}

@end