@interface PXPlacesMapPipelineExecutionContext
- (NSArray)dataSources;
- (NSArray)updatePlanResults;
- (NSMapTable)changesForDataSources;
- (PXPlacesMapPipelineExecutionContext)initWithViewPort:(id)a3 completionHandler:(id)a4;
- (PXPlacesMapViewPort)viewPort;
- (double)duration;
- (id)durationForDataSources;
- (id)durationForPipelines;
- (void)addDataSources:(id)a3 changesForDataSources:(id)a4;
- (void)setUpdatePlanResults:(id)a3;
- (void)setViewPort:(id)a3;
- (void)start;
- (void)startTimerForDataSource:(id)a3;
- (void)startTimerForPipeline:(id)a3;
- (void)stop;
- (void)stopTimerForDataSource:(id)a3;
- (void)stopTimerForPipeline:(id)a3;
@end

@implementation PXPlacesMapPipelineExecutionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewPort, 0);
  objc_storeStrong((id *)&self->_updatePlanResults, 0);
  objc_storeStrong((id *)&self->_changesForDataSources, 0);
  objc_storeStrong((id *)&self->_callstack, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_timerStopPlanResultsExecution, 0);
  objc_storeStrong((id *)&self->_timerStartPlanResultsExecution, 0);
  objc_storeStrong((id *)&self->_timerStopPipeline, 0);
  objc_storeStrong((id *)&self->_timerStartPipeline, 0);
  objc_storeStrong((id *)&self->_timerStopDataSource, 0);
  objc_storeStrong((id *)&self->_timerStartDataSource, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

- (void)setViewPort:(id)a3
{
}

- (PXPlacesMapViewPort)viewPort
{
  return (PXPlacesMapViewPort *)objc_getProperty(self, a2, 120, 1);
}

- (void)setUpdatePlanResults:(id)a3
{
}

- (NSArray)updatePlanResults
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (NSMapTable)changesForDataSources
{
  return (NSMapTable *)objc_getProperty(self, a2, 104, 1);
}

- (double)duration
{
  return self->_duration;
}

- (id)durationForPipelines
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_timerStartDataSource, "count"));
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [(NSMutableDictionary *)self->_timerStartPipeline allKeys];
  uint64_t v21 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v32;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v3;
        uint64_t v4 = *(void *)(*((void *)&v31 + 1) + 8 * v3);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v5 = [(NSMutableDictionary *)self->_timerStartPipeline objectForKeyedSubscript:v4];
        v6 = [v5 allKeys];

        id v23 = v6;
        uint64_t v25 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v25)
        {
          uint64_t v24 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v28 != v24) {
                objc_enumerationMutation(v23);
              }
              uint64_t v8 = *(void *)(*((void *)&v27 + 1) + 8 * i);
              v9 = [v26 objectForKeyedSubscript:v4];
              if (!v9)
              {
                v10 = (void *)MEMORY[0x1E4F1CA60];
                v11 = [(NSMutableDictionary *)self->_timerStartPipeline objectForKeyedSubscript:v4];
                v9 = objc_msgSend(v10, "dictionaryWithCapacity:", objc_msgSend(v11, "count"));

                [v26 setObject:v9 forKeyedSubscript:v4];
              }
              v12 = NSNumber;
              v13 = [(NSMutableDictionary *)self->_timerStopPipeline objectForKeyedSubscript:v4];
              v14 = [v13 objectForKeyedSubscript:v8];
              v15 = [(NSMutableDictionary *)self->_timerStartPipeline objectForKeyedSubscript:v4];
              v16 = [v15 objectForKeyedSubscript:v8];
              [v14 timeIntervalSinceDate:v16];
              v17 = objc_msgSend(v12, "numberWithDouble:");
              [v9 setObject:v17 forKeyedSubscript:v8];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v25);
        }

        uint64_t v3 = v22 + 1;
      }
      while (v22 + 1 != v21);
      uint64_t v21 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v21);
  }

  return v26;
}

- (void)stopTimerForPipeline:(id)a3
{
  id v4 = a3;
  if (stopTimerForPipeline__onceToken != -1) {
    dispatch_once(&stopTimerForPipeline__onceToken, &__block_literal_global_20_77483);
  }
  v5 = stopTimerForPipeline__stopPipelineQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__PXPlacesMapPipelineExecutionContext_stopTimerForPipeline___block_invoke_2;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __60__PXPlacesMapPipelineExecutionContext_stopTimerForPipeline___block_invoke_2(uint64_t a1)
{
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = NSString;
  id v4 = [*(id *)(a1 + 40) dataSource];
  uint64_t v5 = objc_opt_class();
  id v6 = [*(id *)(a1 + 40) dataSource];
  v7 = [v3 stringWithFormat:@"%@%p", v5, v6];
  id v8 = [v2 objectForKeyedSubscript:v7];
  v9 = [NSString stringWithFormat:@"%@%p", objc_opt_class(), *(void *)(a1 + 40)];
  [v8 setObject:v10 forKeyedSubscript:v9];
}

void __60__PXPlacesMapPipelineExecutionContext_stopTimerForPipeline___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -1);
  dispatch_queue_t v0 = dispatch_queue_create("startDataSourceQueue", v2);
  v1 = (void *)stopTimerForPipeline__stopPipelineQueue;
  stopTimerForPipeline__stopPipelineQueue = (uint64_t)v0;
}

- (void)startTimerForPipeline:(id)a3
{
  id v4 = a3;
  if (startTimerForPipeline__onceToken != -1) {
    dispatch_once(&startTimerForPipeline__onceToken, &__block_literal_global_18);
  }
  uint64_t v5 = startTimerForPipeline__startPipelineQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__PXPlacesMapPipelineExecutionContext_startTimerForPipeline___block_invoke_2;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __61__PXPlacesMapPipelineExecutionContext_startTimerForPipeline___block_invoke_2(uint64_t a1)
{
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = NSString;
  id v4 = [*(id *)(a1 + 40) dataSource];
  uint64_t v5 = objc_opt_class();
  id v6 = [*(id *)(a1 + 40) dataSource];
  v7 = [v3 stringWithFormat:@"%@%p", v5, v6];
  id v8 = [v2 objectForKeyedSubscript:v7];
  v9 = [NSString stringWithFormat:@"%@%p", objc_opt_class(), *(void *)(a1 + 40)];
  [v8 setObject:v10 forKeyedSubscript:v9];
}

void __61__PXPlacesMapPipelineExecutionContext_startTimerForPipeline___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -1);
  dispatch_queue_t v0 = dispatch_queue_create("startDataSourceQueue", v2);
  v1 = (void *)startTimerForPipeline__startPipelineQueue;
  startTimerForPipeline__startPipelineQueue = (uint64_t)v0;
}

- (id)durationForDataSources
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_timerStartDataSource, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [(NSMutableDictionary *)self->_timerStartDataSource allKeys];
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v9 = NSNumber;
        id v10 = [(NSMutableDictionary *)self->_timerStopDataSource objectForKeyedSubscript:v8];
        v11 = [(NSMutableDictionary *)self->_timerStartDataSource objectForKeyedSubscript:v8];
        [v10 timeIntervalSinceDate:v11];
        v12 = objc_msgSend(v9, "numberWithDouble:");
        [v3 setObject:v12 forKeyedSubscript:v8];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void)stopTimerForDataSource:(id)a3
{
  id v4 = a3;
  if (stopTimerForDataSource__onceToken != -1) {
    dispatch_once(&stopTimerForDataSource__onceToken, &__block_literal_global_14);
  }
  uint64_t v5 = stopTimerForDataSource__stopDataSourceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PXPlacesMapPipelineExecutionContext_stopTimerForDataSource___block_invoke_2;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __62__PXPlacesMapPipelineExecutionContext_stopTimerForDataSource___block_invoke_2(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [NSString stringWithFormat:@"%@%p", objc_opt_class(), *(void *)(a1 + 40)];
  [v2 setObject:v4 forKeyedSubscript:v3];
}

void __62__PXPlacesMapPipelineExecutionContext_stopTimerForDataSource___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -1);
  dispatch_queue_t v0 = dispatch_queue_create("startDataSourceQueue", v2);
  v1 = (void *)stopTimerForDataSource__stopDataSourceQueue;
  stopTimerForDataSource__stopDataSourceQueue = (uint64_t)v0;
}

- (void)startTimerForDataSource:(id)a3
{
  id v4 = a3;
  if (startTimerForDataSource__onceToken != -1) {
    dispatch_once(&startTimerForDataSource__onceToken, &__block_literal_global_77491);
  }
  uint64_t v5 = startTimerForDataSource__startDataSourceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PXPlacesMapPipelineExecutionContext_startTimerForDataSource___block_invoke_2;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __63__PXPlacesMapPipelineExecutionContext_startTimerForDataSource___block_invoke_2(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [NSString stringWithFormat:@"%@%p", objc_opt_class(), *(void *)(a1 + 40)];
  [v2 setObject:v4 forKeyedSubscript:v3];
}

void __63__PXPlacesMapPipelineExecutionContext_startTimerForDataSource___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -1);
  dispatch_queue_t v0 = dispatch_queue_create("startDataSourceQueue", v2);
  v1 = (void *)startTimerForDataSource__startDataSourceQueue;
  startTimerForDataSource__startDataSourceQueue = (uint64_t)v0;
}

- (void)addDataSources:(id)a3 changesForDataSources:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(NSMutableSet *)self->_dataSources addObjectsFromArray:a3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v13 = -[NSMapTable objectForKey:](self->_changesForDataSources, "objectForKey:", v12, (void)v15);
        if (!v13)
        {
          v13 = objc_opt_new();
          [(NSMapTable *)self->_changesForDataSources setObject:v13 forKey:v12];
        }
        v14 = [v7 objectForKey:v12];
        [v13 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)stop
{
  if (self->_duration == 0.0)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceDate:self->_start];
    self->_duration = v4;
  }
  uint64_t v5 = (void (*)(void))*((void *)self->_completionHandler + 2);
  v5();
}

- (void)start
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  start = self->_start;
  self->_start = v3;
}

- (NSArray)dataSources
{
  return (NSArray *)[(NSMutableSet *)self->_dataSources allObjects];
}

- (PXPlacesMapPipelineExecutionContext)initWithViewPort:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(PXPlacesMapPipelineExecutionContext *)self init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewPort, a3);
    v11 = _Block_copy(v8);
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = v11;

    uint64_t v13 = objc_opt_new();
    dataSources = v10->_dataSources;
    v10->_dataSources = (NSMutableSet *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
    changesForDataSources = v10->_changesForDataSources;
    v10->_changesForDataSources = (NSMapTable *)v15;
  }
  return v10;
}

@end