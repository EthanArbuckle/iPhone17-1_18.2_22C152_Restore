@interface VUIDebugMetricsEventControllerGenerator
- (UIViewController)viewController;
- (VUIDebugMetricsEventControllerGenerator)initWithMetrics:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation VUIDebugMetricsEventControllerGenerator

- (VUIDebugMetricsEventControllerGenerator)initWithMetrics:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)VUIDebugMetricsEventControllerGenerator;
  v5 = [(VUIDebugMetricsEventControllerGenerator *)&v24 init];
  if (v5)
  {
    v6 = objc_alloc_init(VUIDebugMetricsTermCollector);
    v7 = (void *)[v4 mutableCopy];
    [v7 sortUsingComparator:&__block_literal_global_156];
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
          v15 = [VUIDebugMetricsEvent alloc];
          v16 = -[VUIDebugMetricsEvent initWithEventDictionary:termCollater:](v15, "initWithEventDictionary:termCollater:", v14, v6, (void)v20);
          [v8 addObject:v16];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v11);
    }

    v17 = [[VUIDebugMetricsEventListViewController alloc] initWithEvents:v8];
    viewController = v5->_viewController;
    v5->_viewController = &v17->super.super;
  }
  return v5;
}

uint64_t __59__VUIDebugMetricsEventControllerGenerator_initWithMetrics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 valueForKey:@"eventTime"];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28ED0] numberWithInt:0];
  }
  v8 = v7;

  id v9 = [v4 valueForKey:@"eventTime"];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28ED0] numberWithInt:0];
  }
  uint64_t v11 = v10;

  uint64_t v12 = [v11 compare:v8];
  return v12;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end