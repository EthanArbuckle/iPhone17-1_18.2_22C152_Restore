@interface MTEventHandler
+ (id)cachableWithKey:(id)a3 onBackgroundThread:(BOOL)a4 block:(id)a5;
+ (id)currentEventContextCache;
+ (void)clearEventContextCache;
+ (void)createEventContextCache;
- (BOOL)mtIncludeBaseFields;
- (NSArray)postProcessingBlocks;
- (NSArray)registeredEventData;
- (NSString)registeredName;
- (id)eventType;
- (id)eventVersion:(id)a3;
- (id)knownFields;
- (id)metricsDataWithCallerSuppliedFields:(id)a3;
- (id)metricsDataWithEventData:(id)a3;
- (id)metricsDataWithFields:(id)a3;
- (void)addPostProcessingBlock:(id)a3;
- (void)setPostProcessingBlocks:(id)a3;
- (void)setRegisteredEventData:(id)a3;
- (void)setRegisteredName:(id)a3;
@end

@implementation MTEventHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postProcessingBlocks, 0);
  objc_storeStrong((id *)&self->_registeredEventData, 0);

  objc_storeStrong((id *)&self->_registeredName, 0);
}

- (id)metricsDataWithFields:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  v13 = (id *)&v15;
  id v6 = v4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v5 addObjectsFromArray:v8];
      }
      else {
        [v5 addObject:v8];
      }
      v9 = v13++;
      id v10 = *v9;

      v8 = v10;
    }
    while (v10);
  }
  v11 = [(MTEventHandler *)self metricsDataWithEventData:v5];

  return v11;
}

- (id)metricsDataWithEventData:(id)a3
{
  id v4 = a3;
  v5 = [[MTCallerSuppliedFields alloc] initWithEventData:v4];

  id v6 = [(MTEventHandler *)self metricsDataWithCallerSuppliedFields:v5];

  return v6;
}

- (id)metricsDataWithCallerSuppliedFields:(id)a3
{
  id v4 = a3;
  +[MTEventHandler createEventContextCache];
  v5 = [MTMetricsData alloc];
  id v6 = [(MTObject *)self metricsKit];
  v7 = [(MTObject *)v5 initWithMetricsKit:v6];

  v8 = [(MTObject *)self metricsKit];
  v9 = [v8 system];
  id v10 = [v9 environment];
  -[MTMetricsData setAnonymous:](v7, "setAnonymous:", [v10 isAnonymous]);

  v11 = [(MTEventHandler *)self registeredEventData];
  [(MTMetricsData *)v7 setRegisteredEventData:v11];

  [(MTMetricsData *)v7 setCallerSuppliedFields:v4];
  v12 = [(MTObject *)self metricsKit];
  v13 = [v12 config];
  v14 = [v13 sources];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __54__MTEventHandler_metricsDataWithCallerSuppliedFields___block_invoke;
  v30[3] = &unk_26430F708;
  v30[4] = self;
  uint64_t v15 = [v14 thenWithBlock:v30];
  [(MTMetricsData *)v7 setConfigBaseFields:v15];

  if ([(MTEventHandler *)self mtIncludeBaseFields])
  {
    v16 = [(MTObject *)self metricsKit];
    v17 = [v16 eventHandlers];
    v18 = [v17 base];
    v19 = [(MTMetricsData *)v7 performanceData];
    v20 = [v18 processMetricsData:v4 performanceData:v19];
    [(MTMetricsData *)v7 setBaseFields:v20];

    v21 = [(MTObject *)self metricsKit];
    v22 = [v21 eventHandlers];
    v23 = [v22 base];
    v24 = [v23 flattenAdditionalData];
    [(MTMetricsData *)v7 setAdditionalBaseData:v24];
  }
  v25 = [(MTMetricsData *)v7 performanceData];
  v26 = [(MTEventDataProvider *)self processMetricsData:v4 performanceData:v25];
  [(MTMetricsData *)v7 setEventSpecificFields:v26];

  v27 = [(MTEventDataProvider *)self flattenAdditionalData];
  [(MTMetricsData *)v7 setAdditionalEventData:v27];

  v28 = [(MTEventHandler *)self postProcessingBlocks];
  if ([v28 count]) {
    [(MTMetricsData *)v7 addPostProcessingBlocks:v28];
  }
  +[MTEventHandler clearEventContextCache];
  [(MTEventHandler *)self didCreateMetricsData:v7];

  return v7;
}

id __54__MTEventHandler_metricsDataWithCallerSuppliedFields___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metricsKit];
  v5 = [v4 config];
  id v6 = [v5 configValueForKeyPath:@"metricsBase" sources:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = (void *)MEMORY[0x263EFFA78];
  }
  v8 = +[MTPromise promiseWithResult:v7];

  return v8;
}

- (void)addPostProcessingBlock:(id)a3
{
  id v9 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [(MTEventHandler *)v4 postProcessingBlocks];
  id v6 = (void *)[v5 mutableCopy];

  if (!v6)
  {
    id v6 = [MEMORY[0x263EFF980] array];
  }
  v7 = (void *)MEMORY[0x21D465290](v9);
  [v6 addObject:v7];

  v8 = (void *)[v6 copy];
  [(MTEventHandler *)v4 setPostProcessingBlocks:v8];

  objc_sync_exit(v4);
}

- (id)knownFields
{
  v8[3] = *MEMORY[0x263EF8340];
  id v3 = [(MTEventDataProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(MTEventDataProvider *)self delegate];
    id v6 = [v5 knownFields];
  }
  else
  {
    v8[0] = @"eventType";
    v8[1] = @"eventVersion";
    v8[2] = @"clientEventId";
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];
  }

  return v6;
}

- (BOOL)mtIncludeBaseFields
{
  id v3 = [(MTEventDataProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = [v5 mtIncludeBaseFields];

  return v6;
}

- (id)eventType
{
  id v3 = [(MTEventDataProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(MTEventDataProvider *)self delegate];
    char v6 = [v5 eventType];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)eventVersion:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    v8 = [v7 eventVersion:v4];
  }
  else
  {
    v8 = [v4 objectForKeyedSubscript:@"eventVersion"];
  }

  return v8;
}

+ (id)currentEventContextCache
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  id v3 = [v2 threadDictionary];
  id v4 = [v3 objectForKeyedSubscript:@"MTMetricsKitEventContextCache"];

  return v4;
}

+ (void)createEventContextCache
{
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  v2 = [MEMORY[0x263F08B88] currentThread];
  id v3 = [v2 threadDictionary];
  [v3 setObject:v4 forKeyedSubscript:@"MTMetricsKitEventContextCache"];
}

+ (void)clearEventContextCache
{
  id v3 = [MEMORY[0x263F08B88] currentThread];
  v2 = [v3 threadDictionary];
  [v2 setObject:0 forKeyedSubscript:@"MTMetricsKitEventContextCache"];
}

+ (id)cachableWithKey:(id)a3 onBackgroundThread:(BOOL)a4 block:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [a1 currentEventContextCache];
  id v11 = [v10 objectForKeyedSubscript:v8];
  if (!v11)
  {
    v12 = objc_opt_new();
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __59__MTEventHandler_cachableWithKey_onBackgroundThread_block___block_invoke;
    v18[3] = &unk_26430FD18;
    id v21 = v9;
    id v11 = v12;
    id v19 = v11;
    id v13 = v8;
    id v20 = v13;
    uint64_t v14 = MEMORY[0x21D465290](v18);
    uint64_t v15 = (void *)v14;
    if (v6)
    {
      v16 = dispatch_get_global_queue(0, 0);
      dispatch_async(v16, v15);
    }
    else
    {
      (*(void (**)(uint64_t))(v14 + 16))(v14);
    }
    [v10 setObject:v11 forKeyedSubscript:v13];
  }

  return v11;
}

void __59__MTEventHandler_cachableWithKey_onBackgroundThread_block___block_invoke(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v3 = 0;
  id v10 = v3;
  if (v2)
  {
    [*(id *)(a1 + 32) finishWithResult:v2];
  }
  else
  {
    if (!v3)
    {
      id v10 = MTError(108, @"Failed to retrieve cachable value for %@", v4, v5, v6, v7, v8, v9, *(void *)(a1 + 40));
    }
    [*(id *)(a1 + 32) finishWithError:v10];
  }
}

- (NSString)registeredName
{
  return self->_registeredName;
}

- (void)setRegisteredName:(id)a3
{
}

- (NSArray)registeredEventData
{
  return self->_registeredEventData;
}

- (void)setRegisteredEventData:(id)a3
{
}

- (NSArray)postProcessingBlocks
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPostProcessingBlocks:(id)a3
{
}

@end