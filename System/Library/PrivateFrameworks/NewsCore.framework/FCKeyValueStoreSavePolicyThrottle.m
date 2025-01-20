@interface FCKeyValueStoreSavePolicyThrottle
- (FCKeyValueStoreSavePolicyThrottle)initWithDelay:(double)a3;
- (void)scheduleSaveOnQueue:(id)a3 handler:(id)a4;
@end

@implementation FCKeyValueStoreSavePolicyThrottle

- (void)scheduleSaveOnQueue:(id)a3 handler:(id)a4
{
  int64_t v5 = (uint64_t)(self->_delay * 1000000000.0);
  id v6 = a4;
  queue = a3;
  dispatch_time_t v7 = dispatch_time(0, v5);
  dispatch_after(v7, queue, v6);
}

- (FCKeyValueStoreSavePolicyThrottle)initWithDelay:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FCKeyValueStoreSavePolicyThrottle;
  result = [(FCKeyValueStoreSavePolicyThrottle *)&v5 init];
  if (result) {
    result->_delay = a3;
  }
  return result;
}

@end