@interface CLLocationSubscriptionAdapter
- (BOOL)valid;
- (CLLocationSubscriptionAdapter)init;
- (void)dealloc;
- (void)setValid:(BOOL)a3;
@end

@implementation CLLocationSubscriptionAdapter

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (CLLocationSubscriptionAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLLocationSubscriptionAdapter;
  result = [(CLLocationSubscriptionAdapter *)&v3 init];
  if (result) {
    result->_valid = 1;
  }
  return result;
}

- (void)dealloc
{
  self->_valid = 0;
  v2.receiver = self;
  v2.super_class = (Class)CLLocationSubscriptionAdapter;
  [(CLLocationSubscriptionAdapter *)&v2 dealloc];
}

@end