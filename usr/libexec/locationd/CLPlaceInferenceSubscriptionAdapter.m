@interface CLPlaceInferenceSubscriptionAdapter
- (BOOL)valid;
- (CLPlaceInferenceSubscriptionAdapter)init;
- (void)invalidate;
- (void)setValid:(BOOL)a3;
@end

@implementation CLPlaceInferenceSubscriptionAdapter

- (CLPlaceInferenceSubscriptionAdapter)init
{
  v5.receiver = self;
  v5.super_class = (Class)CLPlaceInferenceSubscriptionAdapter;
  v2 = [(CLPlaceInferenceSubscriptionAdapter *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CLPlaceInferenceSubscriptionAdapter *)v2 setValid:1];
  }
  return v3;
}

- (void)invalidate
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