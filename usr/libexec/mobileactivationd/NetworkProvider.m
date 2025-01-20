@interface NetworkProvider
+ (id)sharedInstance;
- (BOOL)networkReachable;
- (NWPathEvaluator)networkPathEvaluator;
- (NetworkProvider)init;
@end

@implementation NetworkProvider

- (NetworkProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)NetworkProvider;
  v2 = [(NetworkProvider *)&v6 init];
  if (v2)
  {
    if (!objc_opt_class()
      || (v3 = (NWPathEvaluator *)objc_alloc_init((Class)NWPathEvaluator),
          networkPathEvaluator = v2->_networkPathEvaluator,
          v2->_networkPathEvaluator = v3,
          networkPathEvaluator,
          !v2->_networkPathEvaluator))
    {

      return 0;
    }
  }
  return v2;
}

+ (id)sharedInstance
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!sharedInstance_networkProvider)
  {
    v3 = objc_alloc_init(NetworkProvider);
    v4 = (void *)sharedInstance_networkProvider;
    sharedInstance_networkProvider = (uint64_t)v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)sharedInstance_networkProvider;

  return v5;
}

- (BOOL)networkReachable
{
  id v2 = [(NetworkProvider *)self networkPathEvaluator];
  id v3 = [(NWPathEvaluator *)v2 path];
  id v4 = [v3 status];

  return (((unint64_t)v4 - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (NWPathEvaluator)networkPathEvaluator
{
  return self->_networkPathEvaluator;
}

- (void).cxx_destruct
{
}

@end