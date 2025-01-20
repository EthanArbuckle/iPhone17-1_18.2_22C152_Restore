@interface MTMetricsKitTemplate
+ (id)kitWithTopic:(id)a3 amsBag:(id)a4;
+ (id)kitWithTopic:(id)a3 bagProfile:(id)a4 profileVersion:(id)a5;
- (MTConfig)config;
- (MTDelegatePackage)delegatePackage;
- (MTEventHandlers)eventHandlers;
- (MTMetricsKitTemplate)initWithTopic:(id)a3;
- (MTMetricsKitTemplate)initWithTopic:(id)a3 bagProfile:(id)a4 profileVersion:(id)a5;
- (MTMetricsKitTemplate)initWithTopic:(id)a3 delegatePackage:(id)a4;
- (MTSystem)system;
- (MTUtils)utils;
- (NSString)topic;
- (id)metricsDataWithEventHandlerName:(id)a3 eventData:(id)a4;
- (id)metricsDataWithEventHandlerName:(id)a3 fields:(id)a4;
- (id)metricsDataWithEventHandlerName:(id)a3 pageData:(id)a4 eventData:(id)a5;
- (id)metricsDataWithEventHandlerName:(id)a3 pageData:(id)a4 fields:(id)a5;
- (id)metricsDataWithEventHandlerName:(id)a3 pageId:(id)a4 pageType:(id)a5 pageContext:(id)a6 eventData:(id)a7;
- (id)metricsDataWithEventHandlerName:(id)a3 pageId:(id)a4 pageType:(id)a5 pageContext:(id)a6 fields:(id)a7;
- (id)sampling;
- (void)setConfig:(id)a3;
- (void)setDelegatePackage:(id)a3;
- (void)setEventHandlers:(id)a3;
- (void)setSystem:(id)a3;
- (void)setTopic:(id)a3;
- (void)setUtils:(id)a3;
@end

@implementation MTMetricsKitTemplate

- (MTSystem)system
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_system)
  {
    v3 = [[MTSystem alloc] initWithMetricsKit:v2];
    system = v2->_system;
    v2->_system = v3;

    v5 = [(MTMetricsKitTemplate *)v2 delegatePackage];
    v6 = [v5 environmentDelegate];
    v7 = [(MTSystem *)v2->_system environment];
    [v7 setDelegate:v6];

    v8 = [(MTMetricsKitTemplate *)v2 delegatePackage];
    v9 = [v8 eventRecorderDelegate];
    v10 = [(MTSystem *)v2->_system eventRecorder];
    [v10 setDelegate:v9];
  }
  objc_sync_exit(v2);

  v11 = v2->_system;

  return v11;
}

- (MTDelegatePackage)delegatePackage
{
  return self->_delegatePackage;
}

- (void)setUtils:(id)a3
{
}

- (void)setEventHandlers:(id)a3
{
}

- (MTMetricsKitTemplate)initWithTopic:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTMetricsKitTemplate;
  v6 = [(MTMetricsKitTemplate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_topic, a3);
  }

  return v7;
}

- (MTEventHandlers)eventHandlers
{
  return self->_eventHandlers;
}

+ (id)kitWithTopic:(id)a3 amsBag:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[MTStoreAMSBagDelegatePackage alloc] initWithAMSBag:v6];

  objc_super v9 = (void *)[objc_alloc((Class)a1) initWithTopic:v7 delegatePackage:v8];

  return v9;
}

- (MTMetricsKitTemplate)initWithTopic:(id)a3 delegatePackage:(id)a4
{
  id v7 = a4;
  v8 = [(MTMetricsKitTemplate *)self initWithTopic:a3];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_delegatePackage, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegatePackage, 0);
  objc_storeStrong((id *)&self->_utils, 0);
  objc_storeStrong((id *)&self->_system, 0);
  objc_storeStrong((id *)&self->_eventHandlers, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_topic, 0);
}

- (id)metricsDataWithEventHandlerName:(id)a3 pageId:(id)a4 pageType:(id)a5 pageContext:(id)a6 eventData:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a3;
  v17 = [(MTMetricsKitTemplate *)self eventHandlers];
  v18 = [v17 objectForKeyedSubscript:v16];

  if (v18)
  {
    v19 = [[MTCallerSuppliedFields alloc] initWithPageId:v12 pageType:v13 pageContext:v14 eventData:v15];
    v20 = [v18 metricsDataWithCallerSuppliedFields:v19];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)metricsDataWithEventHandlerName:(id)a3 pageId:(id)a4 pageType:(id)a5 pageContext:(id)a6 fields:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [MEMORY[0x263EFF980] array];
  v25 = (id *)&v27;
  id v18 = v16;
  v19 = v18;
  if (v18)
  {
    v20 = v18;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v17 addObjectsFromArray:v20];
      }
      else {
        [v17 addObject:v20];
      }
      v21 = v25++;
      id v22 = *v21;

      v20 = v22;
    }
    while (v22);
  }
  v23 = [(MTMetricsKitTemplate *)self metricsDataWithEventHandlerName:v12 pageId:v13 pageType:v14 pageContext:v15 eventData:v17];

  return v23;
}

- (id)metricsDataWithEventHandlerName:(id)a3 pageData:(id)a4 eventData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_opt_respondsToSelector())
  {
    v11 = [v9 pageId];
  }
  else
  {
    v11 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    id v12 = [v9 pageType];
  }
  else
  {
    id v12 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    id v13 = [v9 pageContext];
  }
  else
  {
    id v13 = 0;
  }
  id v14 = [(MTMetricsKitTemplate *)self metricsDataWithEventHandlerName:v8 pageId:v11 pageType:v12 pageContext:v13 eventData:v10];

  return v14;
}

- (id)metricsDataWithEventHandlerName:(id)a3 pageData:(id)a4 fields:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x263EFF980] array];
  v19 = (id *)&v21;
  id v12 = v10;
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v11 addObjectsFromArray:v14];
      }
      else {
        [v11 addObject:v14];
      }
      id v15 = v19++;
      id v16 = *v15;

      id v14 = v16;
    }
    while (v16);
  }
  v17 = [(MTMetricsKitTemplate *)self metricsDataWithEventHandlerName:v8 pageData:v9 eventData:v11];

  return v17;
}

- (id)metricsDataWithEventHandlerName:(id)a3 eventData:(id)a4
{
  return [(MTMetricsKitTemplate *)self metricsDataWithEventHandlerName:a3 pageId:0 pageType:0 pageContext:0 eventData:a4];
}

- (id)metricsDataWithEventHandlerName:(id)a3 fields:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
  id v16 = (id *)&v18;
  id v9 = v7;
  id v10 = v9;
  if (v9)
  {
    v11 = v9;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v8 addObjectsFromArray:v11];
      }
      else {
        [v8 addObject:v11];
      }
      id v12 = v16++;
      id v13 = *v12;

      v11 = v13;
    }
    while (v13);
  }
  id v14 = [(MTMetricsKitTemplate *)self metricsDataWithEventHandlerName:v6 eventData:v8];

  return v14;
}

- (MTConfig)config
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_config)
  {
    uint64_t v3 = objc_opt_new();
    config = v2->_config;
    v2->_config = (MTConfig *)v3;

    [(MTObject *)v2->_config setMetricsKit:v2];
    id v5 = [(MTMetricsKitTemplate *)v2 delegatePackage];
    id v6 = [v5 configDelegate];
    [(MTConfig *)v2->_config setDelegate:v6];
  }
  objc_sync_exit(v2);

  id v7 = v2->_config;

  return v7;
}

- (MTUtils)utils
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_utils)
  {
    uint64_t v3 = [(MTObject *)[MTUtils alloc] initWithMetricsKit:v2];
    utils = v2->_utils;
    v2->_utils = v3;
  }
  objc_sync_exit(v2);

  id v5 = v2->_utils;

  return v5;
}

- (id)sampling
{
  return 0;
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (void)setConfig:(id)a3
{
}

- (void)setSystem:(id)a3
{
}

- (void)setDelegatePackage:(id)a3
{
}

- (MTMetricsKitTemplate)initWithTopic:(id)a3 bagProfile:(id)a4 profileVersion:(id)a5
{
  id v8 = (void *)MEMORY[0x263F27B30];
  id v9 = a3;
  id v10 = [v8 bagForProfile:a4 profileVersion:a5];
  v11 = [[MTStoreAMSBagDelegatePackage alloc] initWithAMSBag:v10];
  id v12 = [(MTMetricsKitTemplate *)self initWithTopic:v9 delegatePackage:v11];

  return v12;
}

+ (id)kitWithTopic:(id)a3 bagProfile:(id)a4 profileVersion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithTopic:v10 bagProfile:v9 profileVersion:v8];

  return v11;
}

@end