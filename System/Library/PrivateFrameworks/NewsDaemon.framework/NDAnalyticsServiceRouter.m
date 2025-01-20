@interface NDAnalyticsServiceRouter
- (NDAnalyticsServiceRouter)initWithServices:(id)a3;
- (NSArray)services;
- (void)submitEnvelopes:(id)a3 withCompletion:(id)a4;
@end

@implementation NDAnalyticsServiceRouter

- (NDAnalyticsServiceRouter)initWithServices:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NDAnalyticsServiceRouter;
  v5 = [(NDAnalyticsServiceRouter *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    services = v5->_services;
    v5->_services = v6;
  }
  return v5;
}

- (void)submitEnvelopes:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = [(NDAnalyticsServiceRouter *)self services];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector()) {
          [v13 submitEnvelopes:v6 withCompletion:v7];
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (NSArray)services
{
  return self->_services;
}

- (void).cxx_destruct
{
}

@end